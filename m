Return-Path: <linux-media+bounces-18881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAF998AC5C
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 20:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27C2C1F2427A
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 18:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB8F198850;
	Mon, 30 Sep 2024 18:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItBvcviS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F3B5466B
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 18:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727722079; cv=none; b=q95BhFOqZUN0EEkewNBfqrwvLPEZ1/Po73lQs+z/otN7fHiA5cTkYgDIaJqLZHJdhaJB4sTLoX8vudiLy2zA/Uw3Mr3ROhOVieFo332Rwf2NlwhVCgDFHPqt00RCN7rKceRgptklKCB1JA/3q0fs+E/TJQN0GiAm0AKR53uCV+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727722079; c=relaxed/simple;
	bh=CW2Qs0dxJJCdPYYW+pv8ycW9SC2T4rH+RgnkFTHw5t8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SuqXsJp6V8vrwRdSHX5BUxyZDdaYfMQKzFalEgH9Xn/yyhrESaEVQ9Uou3O/rY0q1hAwEVskD21BGC4ShyhFFHkwwrLAo8BsM1A6nY2/PcRPaOd7OvHWORYCCFwrPlLUAd3uvzmLG9ppGT0uZ1/gnI1CzN+Yia8mktvdoF0hCRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItBvcviS; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-206b9455460so35838565ad.0
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 11:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727722077; x=1728326877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qQf7jBTLcAGdwf3vm3YWQoR4GjIM4Ol3UFWm/Exf2nI=;
        b=ItBvcviS1LVZ/o6Z27TOeehGzyHsILFNurNF+dUBsS/ccJ7xiGyZ9bee7YGb0megE+
         J4n6TV9XbYCTBAa4I3rl4KIsTLYi7JawesWznQBJefMrq7JNHeEXdZJnjIcvnftZJ68Z
         iTnidaEvmfsuyR35Exm1ZevLpR9AZqhKP42po8gHCe2pl4RRm5gdR3VmY4c3i7l3eWtz
         Tc7SIurEbDSEL8rZoT5x1YQuT12PN9+UuAj1F6mWn1phXrAxEgCZ4jC3tJ//TWmm1jXd
         gEd5aPu++H2kp5jTLzjcnjBLBEUKB4SNuiqevjQZW82akDV3VNkIBaLpitxRZnEJ0om2
         Hmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727722077; x=1728326877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQf7jBTLcAGdwf3vm3YWQoR4GjIM4Ol3UFWm/Exf2nI=;
        b=GrtLqd6vpHQThxxoW14kDSTwsOpQc5NtOaqEaRovRg0A37ukP+X/yaVJvaQyXKxkDS
         hOncGI0nJU9ZuBEFoCpHDaT1U3uPQuU7DJVkZ5+AxZcLt/KepI0ucJE/CzwfLmzTUlzC
         8e0pJDHuzldiRpd338YvJwd49yb/kAkPuvDXS2FkZupvbSMvuxTkvA3E/a4uaRuVGhXp
         I0QernhUygLG+lfXbstEsqP7c5p4mPXttkEMqJJG4pZ8+pgLKpj76mpbHMhOniFHzEbh
         z9kY17Q5M6QXsRmX9yJ66QuHKc0UkLDYq5xXEQXfVEV0CvlMY+dHqtmpN+o/ryZB6Ndz
         13GQ==
X-Gm-Message-State: AOJu0Yzo8bKKVYfpCU8J4LNoqS2lVHogTvSYSo4v5bcifsXZwLoK9lL1
	e/GC0FADghePHMddwB4DZ/925Pkl/ckLvAW8aHcCTcSqONl482rN
X-Google-Smtp-Source: AGHT+IHmJ5+3VKqAWxSD7XPwzmLnAaXXII/4pmlRZvSs+iv76ge1gigeU23XnTGG+oVCzn1FoXZ8wg==
X-Received: by 2002:a17:902:c411:b0:205:7998:3deb with SMTP id d9443c01a7336-20ba9f188f0mr8734345ad.19.1727722077271;
        Mon, 30 Sep 2024 11:47:57 -0700 (PDT)
Received: from aspirebook.tailbdd117.ts.net ([2409:4085:8db6:8b72:7a03:99d3:c2ad:1def])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e37168sm57158195ad.186.2024.09.30.11.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 11:47:56 -0700 (PDT)
From: Takshak Mudgal <takshakmudgal@gmail.com>
To: laurent.pinchart@ideasonboard.com
Cc: linux-media@vger.kernel.org,
	Takshak Mudgal <takshakmudgal@gmail.com>
Subject: [PATCH] uvc: Add support for Quanta ACER HD User Facing Camera (0408:4033)
Date: Tue,  1 Oct 2024 00:17:05 +0530
Message-ID: <20240930184705.59508-1-takshakmudgal@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for the Quanta ACER HD User Facing Camera
with USB ID 0408:4033, which is found in some Acer Nitro 5 and
Aspire 3 series laptops. The camera is UVC 1.1 compliant but
requires explicit enumeration to function correctly.

Signed-off-by: Takshak Mudgal <takshakmudgal@gmail.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index f0febdc08..40db8a5f4 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2430,6 +2430,24 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
  * though they are compliant.
  */
 static const struct usb_device_id uvc_ids[] = {
+	/**
+	   * Fix for the problem with cameras on Acer Nitro 5 Series & Acer Aspire 3 Series.
+	   * 
+	   * Fix required for the camera here
+	   * Thanks for @Giuliano69 for providing the fix
+	  */
+	/* Quanta ACER HD User Facing 4033 - Experimental !! */
+	{ .match_flags 		= USB_DEVICE_ID_MATCH_DEVICE 
+		       		| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor 		= 0x0408,
+	  .idProduct 		= 0x4033,
+	  .bInterfaceClass 	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass 	= 1,
+	  .bInterfaceProtocol 	= UVC_PC_PROTOCOL_15,
+	  .driver_info 		= (kernel_ulong_t)&(const struct uvc_device_info){
+		.uvc_version 	= 0x010a,
+	  } },
+	/* Fix end here */
 	/* Quanta ACER HD User Facing */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.46.2


