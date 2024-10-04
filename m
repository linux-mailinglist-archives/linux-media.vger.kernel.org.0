Return-Path: <linux-media+bounces-19115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF8C990F20
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 21:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78D72282543
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 19:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE34C230DEB;
	Fri,  4 Oct 2024 18:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pvoLdZ36"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402901E2318;
	Fri,  4 Oct 2024 18:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066730; cv=none; b=edkDMdZ4m6mQYa4K+Ya+dVvjADMniLrCxNAJN/taVEc7zCAehmxss6NnBIE+6+j4qEpClrLpHlk7+jp+4oMnNDomKfvr83WRPWa4hOyacYP7iM2ke/t83LPq+SCsc/8yJZ/ByvV89DOn11Ez9oR/GiXuEr6I/XbzFNtg+IB7ze0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066730; c=relaxed/simple;
	bh=UERdAUIIkKO+mZatMfXd1r7F1mxOceEUePgfj0ybgDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/ohvCljZPpttlGTBMDmbVhZKTZiPHkxL/G/kKZAU/hr23zaxVDKGODy1k7UehoBlIcIcLqwSuv+1WlIvwMcjAFcemF202hHUrMNbxOXp8RHbziCz8Fxg2VIDaXxqR9FGmdniDBqbqS0fuBaGh4lg8IU1sOCL4PNrXDn67RNWG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pvoLdZ36; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24323C4CEC6;
	Fri,  4 Oct 2024 18:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066730;
	bh=UERdAUIIkKO+mZatMfXd1r7F1mxOceEUePgfj0ybgDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pvoLdZ36VjJdGNIu17WVueLhBUNQrIPBxLX1FmREzNuNVhHPoyTAFRIIcNk6Hf/SO
	 kbBHRHdB4/mI94BDBHMR0bYUOW2mry8QN12HVLQ6oqeUuZQsSXo0CSAZwmpZtOYgYG
	 l/WOGPaO+hakr6lPWZV9DS3xk+XRcuzU7+aQKcGz/ecQF2ICbj7z+u6PlikgPeT0Z+
	 xZm9shEoam8ERB+hQfQfRxvfBRZZj2uvcVpT2uMalpy9dQzBSfEWbn+x5QUkn/GQt8
	 IXXZ60ogF02m9uJ7s/QX4ot113/FY6NBUZSMpLWS+rN9+KnsVgzOmxccNvGWF/7cnc
	 xwQCEmaOOkDvQ==
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
Subject: [PATCH AUTOSEL 4.19 12/16] media: videobuf2-core: clear memory related fields in __vb2_plane_dmabuf_put()
Date: Fri,  4 Oct 2024 14:31:39 -0400
Message-ID: <20241004183150.3676355-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004183150.3676355-1-sashal@kernel.org>
References: <20241004183150.3676355-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.322
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
index 50015a2ea5ce0..98719aa986bb9 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -281,6 +281,10 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
 	p->mem_priv = NULL;
 	p->dbuf = NULL;
 	p->dbuf_mapped = 0;
+	p->bytesused = 0;
+	p->length = 0;
+	p->m.fd = 0;
+	p->data_offset = 0;
 }
 
 /*
@@ -1169,10 +1173,6 @@ static int __prepare_dmabuf(struct vb2_buffer *vb, const void *pb)
 
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


