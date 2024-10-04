Return-Path: <linux-media+bounces-19114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF14990EEC
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 21:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAA992823F2
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 19:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB871E1028;
	Fri,  4 Oct 2024 18:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sipiptnv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C7D1E0DB2;
	Fri,  4 Oct 2024 18:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066693; cv=none; b=jGjau51GSdraFYRsaOd9H3p9RwvpnP77tmWaIWX+vocjpe4nYgv2prlX9JL93hchCagUKNzSJG6PKK1x+oftl9cKYbltnNuCWAhf2nsF7ct4tDVRK2xyOw8xvsHTIUoE2G27wYF/CbviCOhIp1KU/twpL9tfx2IY/pkjuRtDeW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066693; c=relaxed/simple;
	bh=4Dyl5tksr79tkyq7WLKwFhDRYsUUeLTh7NNDdanLI+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rmg/v1tr+lkxfFN8Y4TA8Kr2/o5yZnqG3q9KB7sRLXHI5sQ/8UCG3O4zYM2Dd8LDG6TXWOmtt18tEn2FU6nIC0u44CttEqseEDX5IuRVcWW6ew1GZ4AxwslSO5sgGswdQyegsIFfwXqsQ0kNZs/xk+MuVhzMZjtK1xCC/2iQZic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sipiptnv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1A7C4CECE;
	Fri,  4 Oct 2024 18:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066693;
	bh=4Dyl5tksr79tkyq7WLKwFhDRYsUUeLTh7NNDdanLI+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sipiptnvx7XIpMBywldmkBfcSbhlAuNPG33mjUXtK5UncfwzvtKxxyqdClt0u+2P0
	 58/IM4ob+BuH1siiNdQdV/21qCa88m/K/WzaKbZqgBpomCzJEn6Il1toavFFZj4DMh
	 cXs5/FZHL7Ofq9w2DPt+yhO8EyF4b4hbE40njRswpGKc/TQ3VCLXp/kBWtOuSt2QJl
	 +oLe6gkQgKULwxeF9h1QbvyrpTWiG9bh1jqJefrUH9zZk6wD54QCjaiiopq2Wl2c9c
	 pVCAWU5cAJ1tYPQDYNneMAZDvHYqaMJfKWPYOz/7eZTtpxZq0A1SYWfGfsJ2rK9I7r
	 0wiCYljpPR1uA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yunke Cao <yunkec@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 15/21] media: videobuf2-core: clear memory related fields in __vb2_plane_dmabuf_put()
Date: Fri,  4 Oct 2024 14:30:50 -0400
Message-ID: <20241004183105.3675901-15-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004183105.3675901-1-sashal@kernel.org>
References: <20241004183105.3675901-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.284
Content-Transfer-Encoding: 8bit

From: Yunke Cao <yunkec@chromium.org>

[ Upstream commit 6a9c97ab6b7e85697e0b74e86062192a5ffffd99 ]

Clear vb2_plane's memory related fields in __vb2_plane_dmabuf_put(),
including bytesused, length, fd and data_offset.

Remove the duplicated code in __prepare_dmabuf().

Signed-off-by: Yunke Cao <yunkec@chromium.org>
Acked-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 13602939906fc..98651c934d4e0 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -282,6 +282,10 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
 	p->mem_priv = NULL;
 	p->dbuf = NULL;
 	p->dbuf_mapped = 0;
+	p->bytesused = 0;
+	p->length = 0;
+	p->m.fd = 0;
+	p->data_offset = 0;
 }
 
 /*
@@ -1177,10 +1181,6 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 
 		/* Release previously acquired memory if present */
 		__vb2_plane_dmabuf_put(vb, &vb->planes[plane]);
-		vb->planes[plane].bytesused = 0;
-		vb->planes[plane].length = 0;
-		vb->planes[plane].m.fd = 0;
-		vb->planes[plane].data_offset = 0;
 
 		/* Acquire each plane's memory */
 		mem_priv = call_ptr_memop(vb, attach_dmabuf,
-- 
2.43.0


