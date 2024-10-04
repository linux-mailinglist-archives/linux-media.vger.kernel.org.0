Return-Path: <linux-media+bounces-19108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E9C990CC0
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 20:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33F02B26CCF
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 18:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46181B4F3C;
	Fri,  4 Oct 2024 18:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZDDypeK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A5B1B4F25;
	Fri,  4 Oct 2024 18:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066201; cv=none; b=ITKn6DTMXZbOKND8TMrVSA/EC1HQxPMcuUOcnlSvhy8lYMVDsjY/3M9PmA0sosv7yFcYYEmE6kUYPVkntOtvnr7rYCfKtwze3165ZAjT8Dfn2gonL+yuNCnbCHiwAzRu9gxxZuK2LNYVerDVkJ0xBPKJEtZI3PdK5U81TL/w7bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066201; c=relaxed/simple;
	bh=mS+RSes3DuCaf/ysw88kEhUwef3Jc+G6a+v0ovA49G8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hDLO8VfaCq51GhSahTkIn5bSn/25bMM/coOCRieulXd+xfLo8IJM/AcC9kczRjKLLwZYtrxJMXV+qHqmMVJSy/Fbly7vHTc+/tWDHGC1xcz76pl5FQO7TQyVt+PXlxXCiGiskHcFfF1TK72i9Fh02TLHP3W3M9BQ8oB51AaBlzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZDDypeK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10024C4CECE;
	Fri,  4 Oct 2024 18:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066201;
	bh=mS+RSes3DuCaf/ysw88kEhUwef3Jc+G6a+v0ovA49G8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JZDDypeK9+GWzOM/I+r0GSOk3zZaEv0uu06z8Oq3rzXioc5ulVDwCEdTlv1lJ/7iv
	 psVBGQVhDyh3jy5daZG8s/yUVklvnOLWeAv02RDi16x3K/QcNLSm+NMniSZRvAHUGD
	 NLtyCoURcbNfS4gc09J5wOj3eCD9hMLgVt9jGjtt0EitOYSyV0LSMXV/W+OSUL8Yyp
	 mEbmblIL2BukqIWZz4gqg14wrjuJ2igN9WJz8/ZMbrowjeDrAB3nvy3zdiFg7iWnHl
	 HMufpRA6Zgds6WB6gcQkk6+UxeRR4h3hrEX/piqy6w/FNIMgKo1VWO/ihbzdPq/t3k
	 F/S3rYUV92sbA==
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
Subject: [PATCH AUTOSEL 6.10 41/70] media: videobuf2-core: clear memory related fields in __vb2_plane_dmabuf_put()
Date: Fri,  4 Oct 2024 14:20:39 -0400
Message-ID: <20241004182200.3670903-41-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004182200.3670903-1-sashal@kernel.org>
References: <20241004182200.3670903-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.13
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
index 358f1fe429751..a26130706506e 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -312,6 +312,10 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
 	p->mem_priv = NULL;
 	p->dbuf = NULL;
 	p->dbuf_mapped = 0;
+	p->bytesused = 0;
+	p->length = 0;
+	p->m.fd = 0;
+	p->data_offset = 0;
 }
 
 /*
@@ -1421,10 +1425,6 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 
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


