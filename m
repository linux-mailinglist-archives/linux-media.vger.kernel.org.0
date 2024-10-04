Return-Path: <linux-media+bounces-19113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E1990EA2
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 21:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51BBE2815F9
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 19:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F67229106;
	Fri,  4 Oct 2024 18:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8xXGaoz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A39B1DF99A;
	Fri,  4 Oct 2024 18:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066640; cv=none; b=iAemoO5mp4GOLUrKznXj13yl4I9sKT/huulzIqqr40A5q3BvnjB5lt8JCcHlQ7aZaKNBiT9ZR7hn38nFKBvUKwGMCKwrlDMD+d5C1N/p6P63LoAxTABqqnepKi2/MMPlE2VwUqvUuMcrkdU+HT01f1FWDaC1NSyi0BYzw/lwVjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066640; c=relaxed/simple;
	bh=HFhL5BDeKrOgZOkOiyCFwrVuMYPrYx1tVgcD+hDd9p4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tRUEdxwIKZu6yEXgSnHO0K5+L2alKC5kgULtYqaPOS/luJtUHhX6tHseJBlKp8U7gDL8YGSUVOxDes1Fj2xEWkLad5dpNn5fWQVdQquLH4x83gm8xaSUZkHzDjpjtxgi0YZySoa3iF4eM1Z4eyENOOGbva30kAFQ7PWwx3AHhJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8xXGaoz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D55C4CED1;
	Fri,  4 Oct 2024 18:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066639;
	bh=HFhL5BDeKrOgZOkOiyCFwrVuMYPrYx1tVgcD+hDd9p4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z8xXGaozoTGD2M6aO2Bwb/ghcA262gGUivQkpfDlg/VKTzsUEHnvY6qvDVc307E8U
	 uqiBc6x5mtxLwm0I+A9Ouj53LjAAGex7IaMG10DrlcWdpP/X/1RiwvVyPE4bVW9DFv
	 TI41HBL4PSz3IGHm7il2K19xY6b5emV/V6qr4cje99gtuajCH2bYRCELJ1eRrBIAhr
	 E5qalJARCbiEPP4NxhMhnIIPsn5w73WScpVq9ud2x1+WFKt3wTrkgu1Cz13ydtu16f
	 Esu3AjWd8vIj+D0H1fSIEBiK9EchkUol+WkDMmWC1zS/Q37SFx+vxnBF+pQmTrGFSY
	 iwhJ/M8oF1n6g==
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
Subject: [PATCH AUTOSEL 5.10 18/26] media: videobuf2-core: clear memory related fields in __vb2_plane_dmabuf_put()
Date: Fri,  4 Oct 2024 14:29:44 -0400
Message-ID: <20241004183005.3675332-18-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004183005.3675332-1-sashal@kernel.org>
References: <20241004183005.3675332-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.226
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
index 3bafde87a1257..78ad2b278da4c 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -301,6 +301,10 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
 	p->mem_priv = NULL;
 	p->dbuf = NULL;
 	p->dbuf_mapped = 0;
+	p->bytesused = 0;
+	p->length = 0;
+	p->m.fd = 0;
+	p->data_offset = 0;
 }
 
 /*
@@ -1278,10 +1282,6 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 
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


