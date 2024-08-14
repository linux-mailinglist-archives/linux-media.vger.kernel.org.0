Return-Path: <linux-media+bounces-16265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C0B9511DA
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 04:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADEC11C21388
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 02:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749F51CD13;
	Wed, 14 Aug 2024 02:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JKd/Yk3m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA8F1C694
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 02:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723601220; cv=none; b=Jw1Q0f/AaSvDzkGaH8KvDH41a3aumbxbCisLZP6Bt8AgVNlTsqRLGOG2rPKoHDfVuNzBSP+qsas4vUKxs9Q/pHC+IXeQdbWprnBq00ghl2HwyCG9jTOW47AEOvtgxtLetXIBeTq6FK4nv4ooRKMfxHG+eZdm6I70nppcdSKfHMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723601220; c=relaxed/simple;
	bh=8kDhKi1RqGp+MT7W/FRCaDuugxh1wL7FBntj3egggRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VMNXk0TBGvUke0Hog3oTbDlS14BuZcCrJwkBdazzH88pl1ZZce1igJodVRc7XfcC4WV+sg+xe4+sMqZO7yp50IF3n+rrzh2NGIfLMFfFzKQJUR+FE2d5GkhwDc+tbgaSBujGk3AJd/8zHwhl2fJ+H6kvAY7DRwDv1OSLwRWjIKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JKd/Yk3m; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2d1daa2577bso3800483a91.2
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 19:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723601219; x=1724206019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Py3r/mWLV/egkP5BiPd7Tab/P3CsruVhWzLlB8uYSYU=;
        b=JKd/Yk3mIe7gzCHbnY2LREpXdPRXsHhwRbSdK4aX3Cesg3E0YYjnWTuKV8aYyL1UJt
         uAS1LcIoee4+7IjT93fCtZRWzT/83zk3qEnUBzgyFKKyW5ZcW6xDA7xwCYOhVPrHzICN
         HM4JNL1x7is9kwKucBK1t8lV8HWnfUc6Zmqu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723601219; x=1724206019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Py3r/mWLV/egkP5BiPd7Tab/P3CsruVhWzLlB8uYSYU=;
        b=kvggjcnAn+3S+CgnYB1o7ux92xHYVumijPD/r8BT0xPXNkAL3N5MnK9adcMCelMEXc
         FoZY+lI3SlC44E+yDkQY444DH467Ezl0A2dwycqWiRvivGAlYq34IM55SNIajauSXSq2
         mNJg/4y+OPHNykjoI2DHEUQCIS7rsnst3vzaS1dBJ06iJAQ11tqzSkCXFA+8L8v07tfJ
         LSHc7kDWvwJqk3EUgAp/90kh96ezfPPW+5u70Yp/1EY6VZsnuyhQtny3hMmHEkDId1+S
         yP7H573d6FwjM2G/kz0+88dJsdiaBpURPhKfka/pUwYZCdjdsn/x4nQF0sbE3nSQY3tL
         pAsQ==
X-Gm-Message-State: AOJu0YwVPu/iXF0pIk1OC84iQtQr3o6bNfOo082iRYBVd24GvWs4xCf7
	tdjulX6ZFEXGHBGnyzaf8+5JaYLDsMbogDmVpzcKupammm8Wy0Q4vZP1FmmczA==
X-Google-Smtp-Source: AGHT+IE8DMrWJ6UVX8hj0o/EARX1VUwjdml2R+xMPBDr7mac8mLpCY3xkKsiXGJJ0er6UONr5aA3kQ==
X-Received: by 2002:a17:90b:3b87:b0:2c9:65df:f871 with SMTP id 98e67ed59e1d1-2d3aaa99367mr1448039a91.15.1723601218799;
        Tue, 13 Aug 2024 19:06:58 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:269a:7c5:e4f2:518c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac7d65b1sm303064a91.4.2024.08.13.19.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 19:06:58 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v5 3/4] media: videobuf2-core: reverse the iteration order in __vb2_buf_dmabuf_put
Date: Wed, 14 Aug 2024 11:06:42 +0900
Message-ID: <20240814020643.2229637-4-yunkec@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240814020643.2229637-1-yunkec@chromium.org>
References: <20240814020643.2229637-1-yunkec@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch prepares for allowing multiple planes to share the same DMA
buffer attachment.

Release the planes from num_planes - 1 to 0 so that we don't leave invalid
mem_priv pointers behind.

Signed-off-by: Yunke Cao <yunkec@chromium.org>
Acked-by: Tomasz Figa <tfiga@chromium.org>
---
v5:
- Add comment to explain why.
- Update commit message to explain why.

v3:
- Change local variable to an integer to make the code cleaner.
---
 drivers/media/common/videobuf2/videobuf2-core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b53d94659e30..e6af963307e3 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -323,9 +323,15 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
  */
 static void __vb2_buf_dmabuf_put(struct vb2_buffer *vb)
 {
-	unsigned int plane;
+	int plane;
 
-	for (plane = 0; plane < vb->num_planes; ++plane)
+	/*
+	 * When multiple planes share the same DMA buffer attachment, the plane
+	 * with the lowest index owns the mem_priv.
+	 * Put planes in the reversed order so that we don't leave invalid
+	 * mem_priv behind.
+	 */
+	for (plane = vb->num_planes - 1; plane >= 0; --plane)
 		__vb2_plane_dmabuf_put(vb, &vb->planes[plane]);
 }
 
-- 
2.46.0.184.g6999bdac58-goog


