Return-Path: <linux-media+bounces-19112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CF2990E40
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 21:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6302E1F243AC
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 19:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49562204F0;
	Fri,  4 Oct 2024 18:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JN/EOVxD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185C42204DC;
	Fri,  4 Oct 2024 18:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066573; cv=none; b=iimCIBL0Yp8YCNFMKf8+fBBASu1wOn00tnhFnJ/Yec6cPsfYj39cLzhYr94eu+hJksO0j1kMZQxbRgGc23SKI315Z1VU9xkspGtEiKWv8vMF+IWMEzrSl1mlXFBFOqAwlLt9DrXXi5JKQU9BJJ/0K9u4gE7RG101UW2ik4WQeUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066573; c=relaxed/simple;
	bh=e32UDXXueTvHPmaIlcxoK6FaeApA5dmfHTLtw85Yvpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYAhPYtcCyFSUexeSgrbeYRUrCWlgUAIh99K4+nT5YxNHv/qIXTYvQkyOgrgjKQ1NO8K8ZzjZdc5c5OvJbc3BD0kUhDWWmYwzQ9Z+sThi7L6PGFwzgIYx/FyobIYfNJF2nH7jCcYBj+jAvSRZpcuBPbbYsHpaS57lvJ9mBtqPwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JN/EOVxD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B01C4CECE;
	Fri,  4 Oct 2024 18:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066572;
	bh=e32UDXXueTvHPmaIlcxoK6FaeApA5dmfHTLtw85Yvpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JN/EOVxDoL5Xi1JFCBQZNBJRVgV1mx7i7mDDHt41iaH6mBEKfQ58pI8h2sMZtO7QG
	 12ZrPkLt8OftFMwSdexfdPbCtgugD5EXcWETTDkVMmyFQ0OPugzTDzi+uRttG68dqJ
	 nVq8FhsMUnDT69oE87Et5hnz6r0RSpNdQ43IPMNwspSM46xHzAGGjl7YNsVWi4T7+K
	 KIgWIi9ipb8SIae76I3u5MyN7gOPm3Xulae5BQjoKX8P7tWyhGRJRToZoFxCNc+t1c
	 rbFVbVwUy6aUdFHH0B4XgQXxsXE12g+yzQYHSpIwGqKQcBhPrFjuJp/CjgIdDu1mz1
	 fe3PDHdmb344Q==
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
Subject: [PATCH AUTOSEL 5.15 21/31] media: videobuf2-core: clear memory related fields in __vb2_plane_dmabuf_put()
Date: Fri,  4 Oct 2024 14:28:29 -0400
Message-ID: <20241004182854.3674661-21-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004182854.3674661-1-sashal@kernel.org>
References: <20241004182854.3674661-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.167
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
index 30c8497f7c118..b66e80e6924e5 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -302,6 +302,10 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
 	p->mem_priv = NULL;
 	p->dbuf = NULL;
 	p->dbuf_mapped = 0;
+	p->bytesused = 0;
+	p->length = 0;
+	p->m.fd = 0;
+	p->data_offset = 0;
 }
 
 /*
@@ -1280,10 +1284,6 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 
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


