Return-Path: <linux-media+bounces-37820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53100B0699C
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 01:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 994254E31DF
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 23:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE9E2D46AD;
	Tue, 15 Jul 2025 23:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o/5Ienai"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7277A1F561D
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 23:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620438; cv=none; b=JAh1ALynTvTWIZEJ3f6IAL1v/UyXlDku713Zfg3t+jCIgvW8a++BpSNxE+GNpjbOpx8pSthLvn61S4djqRdn+kNspHrrAn+vqcM5KW8k7Cg7NxexNTUgxeh5QSBx/8R09blEqz0qByrKSsMVnAmO02/CITsjOfrdg3qMIaSvz2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620438; c=relaxed/simple;
	bh=Rd4EWRAxme2/2cezG0hoAVJmvXZzbOjy+A5VWaeSXKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A2o6XeTanoJ4pNlt3tDopihS9wVWg5K9izq/YSNNX//ukwGXoD9XvEtwg+wTRekmGU8LKWQxiPTRVRzfQxEL4/T95PcR+F38JN93p/U24yAae6n+qjsXRzI6yJl2ApFjYurkm7b4/0010Y69bFzQTSBWCUH8S42zOz18j/IBmGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o/5Ienai; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-73cddf31d10so2769060a34.0
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 16:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620434; x=1753225234; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iEHhLS9AKp6YfP0nzrVbW2+c1LEO3R60cxZmePqCOIU=;
        b=o/5IenaiA5OeF+X5gz/fXfbclYGCQGk6ZFrD2nW1ZzbKqUhBpSEqIn346duWuGbbDN
         WuOjqlimo9mKudMks234yt8xEcC6kg2P5NLzuLLBM6TBJ2uAPGJ9zh2mdwuVQxKXYzVE
         BBYpXBIs/495qdLElGPn/AY7CDLsOzWz0WCujZjSYuvnAkLYuiv4GhqOv/cVC2XmxVy3
         BdtCd1xR+N7LhUCsT0kOTwoU1DSj4JSFhgU97LYkskV2Pg4/BJbZwuzUiqPUfizFjv4d
         yro3bOPBb07jFF0Jrv4qN3KxKEf4MfycQfj34L97Li8IVGG5dG+XRBdfPx2g4cFqn/tJ
         WU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620434; x=1753225234;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEHhLS9AKp6YfP0nzrVbW2+c1LEO3R60cxZmePqCOIU=;
        b=AvWS5XE+TKcC4R8NnxA2YLJYv9ngmC1xpzdbQHQlc93Tq/zae46yt8U/qVbf8Eal2S
         ah7xydWuCgfmtSHC8ITG36dREvwbbNG7pAGFRiNG1hPknX9M7iIh9z34jeA9UF6yVBcc
         h9p0GW/sEcAMoRRuwCzFZI7ouMBMs1knB6l+ZmgfFjmDR7HiNCxiDKzc79wXFxllJOfQ
         6kC1wq4JNR2vgq55OULJs1+iDTOE8tcurQsLmcr6hPWFzhE3xNjNtZeJWYKnzre+RnGy
         deB0bdF/Ev3uMiZdHiE3NSV3bd6pVzhE4ZS4CVFvxPYXo52exAxv4cfleh6YCKNt0UDY
         UJhw==
X-Forwarded-Encrypted: i=1; AJvYcCVce2UROoxHXpXZyPqmhG8qihmt/9r7Ek1jOzARvQvCOt6I7XS4rkM3U5DGGcLhZvRHFRNOy0h/OUVDQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ/0K4IMlFwoyIkIkCujWjLE3UPgEMI/Rll8JiYn2JYfmUmP+p
	8eOJUN4//lFgxszBDjOkhwMCIcMCaXLHJRtwHd2crFZU41SZWRTJeBBEr2Uto9T2k+g=
X-Gm-Gg: ASbGncthjwxlNt17I6hB/cTUPk+J0w2GxHmWAI5/wyFaM7BKsiQabIp9cnfKJ6dP3RE
	J4Ji2H8uJh1Ragt5pWYCsESDR9taf45Kg3hSTH+YiZCoCNJa9OYzejBJGRMOSTmMg/ZzoCzyUtL
	h8EXpd3yAQu1PNU3CuBjINii7AXDIms03tZ61KXx/56VtCaX5tcM7+8A9OMQzXOcBv3jXm9k7fv
	4QrFAfJMytapUGvf8CGyLlwz53xAUzgsBWe1/PSJdyUgxIfZd6LzxYSm7drgV6l+CNs6uVwgxFm
	Z60ajaxwrkXUkpE+bakYSzyCHQ/M0gq3VXeoxwDo53v14zPMUn12NGb3/HzdRlbT1RU6KcAI6kb
	MTypMlmQpFOXkShN7cAqN0a/XaBo4
X-Google-Smtp-Source: AGHT+IHnn0iv6gW7AenbYfNa71UIVVvLtMsOtgKfhXxzBG8x/zCO8jdFx2PwxnbWY+hgyLCzOiwGHA==
X-Received: by 2002:a05:6830:7204:b0:739:f13a:6f41 with SMTP id 46e09a7af769-73e662c791dmr301764a34.25.1752620434508;
        Tue, 15 Jul 2025 16:00:34 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73e44f2fb4dsm1348594a34.49.2025.07.15.16.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:00:33 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:00:32 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: stk1160: Restore deleted comment in stk1160_fill_urb()
Message-ID: <fdab5e2d-47b6-4551-8aa8-3e90b2207a75@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This comment explains why we return success when usb_alloc_noncoherent()
fails and I think it's helpful.  It was deleted during a recent refactor,
but let's add it back.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/usb/stk1160/stk1160-video.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 416cb74377eb..3e6bffd49346 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -408,8 +408,13 @@ static int stk1160_fill_urb(struct stk1160 *dev, struct stk1160_urb *stk_urb,
 	stk_urb->transfer_buffer = usb_alloc_noncoherent(dev->udev, sb_size,
 							 GFP_KERNEL, &stk_urb->dma,
 							 DMA_FROM_DEVICE, &stk_urb->sgt);
-	if (!stk_urb->transfer_buffer)
+	if (!stk_urb->transfer_buffer) {
+		/*
+		 * If the buffer allocation failed, we exit but return 0 since
+		 * we allow the driver working with less buffers.
+		 */
 		goto free_urb;
+	}
 
 	stk_urb->dev = dev;
 	return 0;
-- 
2.47.2


