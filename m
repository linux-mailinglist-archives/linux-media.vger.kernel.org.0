Return-Path: <linux-media+bounces-19106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F30990B7E
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 20:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E01611F211F1
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 18:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209C61DF270;
	Fri,  4 Oct 2024 18:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="miad4oI0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEFB1DF25D;
	Fri,  4 Oct 2024 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728065992; cv=none; b=cLL8KYLO+KOyuYiNz60PdDAC3EZrzmCwrCxUw+iUgwAsyboZjsI7/xk5WCbg4y8Dm9uTWlQ/9AAls6KhmZw3ZmmKPpeMxORjw+7MS5Vx2+bAklNZpMKv1fWtBZFHWh/sJGrMvKsun6g5NOQEXCOCkCeXLXHCo63sO0PGFZ5cnJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728065992; c=relaxed/simple;
	bh=M+y0Zj8oY5Tm54sDoSfp+vc7SVPKnInfwTTVFpWLgyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RmXYbN+Vj7gjTOjR1BxkQHswtrwBk51egNrgRZH66lvy9g6MFt+uweGkL6u1DxUMLpZypVoFORsgQ27oRlXk2mVxadOUdF8wYsMbOuZ9iODH3FSNH03Iz9SCGi1xvhKWIpE02VD03397y5fAKXh+Wi+KPWZo8ZKjmm2734W164Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=miad4oI0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56825C4CED0;
	Fri,  4 Oct 2024 18:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728065992;
	bh=M+y0Zj8oY5Tm54sDoSfp+vc7SVPKnInfwTTVFpWLgyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=miad4oI0IiJ23nApxQEQGG72W8CI3BtvSlw829PZjqzBCgfhKWqCzEg8bAmngxWNv
	 NsaCsenjejzGhQ7MsJA0RzIfQ1YahcuLiATgIDXiCHmvA98hVJMTyUL+iDrt4Y9CK0
	 SEFOYaVwoYrMRMSpODR61nkEQ/C/ZDDTUkzJA27AAX5yS/wrRzZddKOK7rJeqhKD/B
	 UYL4crHli+gJnymz7xOoVbqmWww2QAKTefTEkhASgM5+qIgBVsh+p5Fcoc3rRdy7kq
	 j6nwa8Czbl9rZxp4ZmmSsOQ8VaVAORm4217d7zcA/mHUyO+YIuOKRrEV3WaRzt7zBt
	 EOVnXKic8ehug==
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
Subject: [PATCH AUTOSEL 6.11 44/76] media: videobuf2-core: clear memory related fields in __vb2_plane_dmabuf_put()
Date: Fri,  4 Oct 2024 14:17:01 -0400
Message-ID: <20241004181828.3669209-44-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004181828.3669209-1-sashal@kernel.org>
References: <20241004181828.3669209-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.2
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
index 0217392fcc0d9..4d232b08f9505 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -311,6 +311,10 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
 	p->mem_priv = NULL;
 	p->dbuf = NULL;
 	p->dbuf_mapped = 0;
+	p->bytesused = 0;
+	p->length = 0;
+	p->m.fd = 0;
+	p->data_offset = 0;
 }
 
 /*
@@ -1420,10 +1424,6 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 
 		/* Release previously acquired memory if present */
 		__vb2_plane_dmabuf_put(vb, &vb->planes[plane]);
-		vb->planes[plane].bytesused = 0;
-		vb->planes[plane].length = 0;
-		vb->planes[plane].m.fd = 0;
-		vb->planes[plane].data_offset = 0;
 
 		/* Acquire each plane's memory */
 		mem_priv = call_ptr_memop(attach_dmabuf,
-- 
2.43.0


