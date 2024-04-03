Return-Path: <linux-media+bounces-8497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD67896A34
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 11:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D2F31C214F8
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 09:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A1373165;
	Wed,  3 Apr 2024 09:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MMBse0GL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F86471B35
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 09:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712135598; cv=none; b=bStoIgn9TercjRbT+hkJkIC+ZRUoRz3njwGEAL//J+GO1WRd7qdf40+tXDH8n2IdnY8xJrZjIeYHgQXjZf8L0PXu20uBrBQIXRQXO5KprVIYQ6sYPh0jfnB/veUVXPLbXWBAkkSab5bw+kaQQyW/pHkLUv1sVEMUbCTzBX3qg2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712135598; c=relaxed/simple;
	bh=bvbr37Ihsqw95eXTgs6rpM/YrpZdNfDaihQFNgL8Sdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9/dnCUIJI6lCYq635h71uD75xnGBUR+PrYz7b/vkkFqVBEMNOeLwQNsl1R9fT3yMfP+IhsKjRKyxDHXXfc2VqtkPSuOEOxhVMb/ZmMy7Lu+ETfjyqrPwR4MO+FD0NhdJAVni6BkKMIZLP5AsPAr0GaMZj4mPSElw99CAGoNttU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MMBse0GL; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e2178b2cf2so47057435ad.0
        for <linux-media@vger.kernel.org>; Wed, 03 Apr 2024 02:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712135596; x=1712740396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hY0y02PJpZeP35KcWNQezBlqu49OMdch68dl+7fGzyo=;
        b=MMBse0GL/Lf3UXzHRK0s4mLjYVyn7njmPAZCQs/Rig8u0n5NsEEnfckvNX4l2X8xlk
         aF8br+Vnook0b6I6cF6URMYCO8npCqijpc87XcgB1Qx2eSqAICRYP8vcN/0TDNq9n1mm
         SPNj3FAuAMvFml61azZjFSEI6IyyeLw2D0i/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712135596; x=1712740396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hY0y02PJpZeP35KcWNQezBlqu49OMdch68dl+7fGzyo=;
        b=nrrY97QoB28zJyHoGWoR1OiT7vOF9h3IaG9z7BTbp+T9/y4nBdDMF2WesJD/V8fYRf
         r0y420pumupQyb9tc5IFQ0JB/mSLzTk7ag4HrL3Q3SdZzml0VD9W43W0HVgLACyJKLpK
         zA588LUBSRC6g8HdHBkbN+yBT2bsIYIaMkozieAOX8qeKH9+m/CMeqEkNkXp6Gu4CZKY
         bdHKnM1/6qCWOKCKCWXGt598PHpuKTgqdy0DHtVStusE4TEN2lBgKQOsdJ//wt1YjleY
         wRvJPpkO+E0jsTFTD5mwUm40RgUdfjwvQ3avskXU61eXyNNZjC9DhVtR42WWc364QK5a
         R7QQ==
X-Gm-Message-State: AOJu0YyjfmwnYPk9uS0xAunoTgCsVIy/yaErnDbPIgBAjhy4K/kPsoVh
	YyHHzKEJo//UszlwJDSYwg9VurJ0PGyy48ovuv0Ir2GElsUqiQRarv2XmPe6yg==
X-Google-Smtp-Source: AGHT+IGHt7KtLjqxqms1Zs04xzJZUgLr1AiqEYtq3Tkar7o+qpOs8VpLfk46IrjcgclZNOrn5+IePw==
X-Received: by 2002:a17:902:c94f:b0:1e0:a784:f965 with SMTP id i15-20020a170902c94f00b001e0a784f965mr18202297pla.65.1712135596691;
        Wed, 03 Apr 2024 02:13:16 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:d5be:b59a:f5f7:246d])
        by smtp.gmail.com with ESMTPSA id lo14-20020a170903434e00b001e0aded0ca7sm12692811plb.239.2024.04.03.02.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 02:13:16 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v2 2/3] media: videobuf2-core: reverse the iteration order in __vb2_buf_dmabuf_put
Date: Wed,  3 Apr 2024 18:13:05 +0900
Message-ID: <20240403091306.1308878-3-yunkec@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240403091306.1308878-1-yunkec@chromium.org>
References: <20240403091306.1308878-1-yunkec@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Release the planes from num_planes - 1 to 0.

Signed-off-by: Yunke Cao <yunkec@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 702f7b6f783a..a5368cef73bb 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -320,10 +320,10 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
  */
 static void __vb2_buf_dmabuf_put(struct vb2_buffer *vb)
 {
-	unsigned int plane;
+	unsigned int i;
 
-	for (plane = 0; plane < vb->num_planes; ++plane)
-		__vb2_plane_dmabuf_put(vb, &vb->planes[plane]);
+	for (i = 0; i < vb->num_planes; ++i)
+		__vb2_plane_dmabuf_put(vb, &vb->planes[vb->num_planes - 1 - i]);
 }
 
 /*
-- 
2.44.0.478.gd926399ef9-goog


