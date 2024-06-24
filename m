Return-Path: <linux-media+bounces-14033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 332389146C0
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 11:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55E8E1C22502
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 09:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE0C13665B;
	Mon, 24 Jun 2024 09:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiCSqxHW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD47212E1F6
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 09:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719222914; cv=none; b=r9gfTkyPlmI71w836aR9bY320jrzCsqHntdqJDqP1UKCGflbNAwf2Zg3MXMXddYzOkQuNobRynuU1YM9H3Bf+0zV1LL9bIM5bSuQDYvUuemcTDNauhcJn3m5keW8vRy51xhp0JYn0mS3w5R4h4Wirxr4pgYAeM+pgUpemZc6Jnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719222914; c=relaxed/simple;
	bh=VSFBbg9fQfHgCcEb0q8PTXYqQmPK8UhIVmlSWR7Jaws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F/LGYCuBCCk7LJAnuzuE6Pxk2ReLHyy4ItLLKN/45wyp80h7kMBTUgv8+ATy+Kdv1e5QfTQ5W8xRu/MsKeKh9fLvnjBmSKPHt2oejqxf3cpCdptAC0VZnVb8RtbwDp+UjSGYLk2NG9DakNfnq8WrBgTnu3krtzzhsWheoBxe3ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiCSqxHW; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-424720e73e1so33458015e9.1
        for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 02:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719222911; x=1719827711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWv9lGW8ZISyKh5uccQb58M33+vfoTS4drgAEK8mR0w=;
        b=eiCSqxHWg+w4sMKw2U4koTVwCK69ChGxgzwCWmeOSxxMggFiw5+c9vhJkz7VMSRE87
         l8agsVsoHrgRZebIyvEWLILpR7lqxY2834rC2oCD62zbaNoLdj2pQSb/7dvK0rubeMMg
         g9DnkgPcKK1d++VDUAu3IVd4bP+CHuWzFGWGeGFjSwarHPU1bpo0zvNimExnqJer1iuq
         kXROsvCQ1MInfb7f652P7T8tBYuBZcA8B3AGiuouAQsjTky21TBQibuFj67ISNOBNHxj
         htuDSkwP7mY4JoyL4fnhIaNnD2B1e+K1jp7O1iVT4QpZNViKhhTQb+DFyhH7JOR1mMgo
         yKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719222911; x=1719827711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWv9lGW8ZISyKh5uccQb58M33+vfoTS4drgAEK8mR0w=;
        b=ljxkmRhcy00WqLbcIzh1HuL1LU0IurvGZGfQ4W5n0kDr62v9B7hd6xJvrKeRfo3nzh
         IVBqY2Hao2tnkVw/yoWqPFD3awGVB1IcHMa3ZU7WY9AJyywMmQUhRRlWeebCGqpMbksx
         OgZVe+lUvqSR0lGx+IjuYMGWB9e8kmxfQo8XNvbpuQxNdGKMwLvXP6I5MG/h4+MbNlV3
         EwzmpeCGLvlNPkluXnA/kMq8Q1N7k/FRZmk84ZLYWm2GuiaUKlDk0EPphl4ldEFXpZFs
         H6FLRRt2x6cc7FA96CD8V4s0qnbOJ/WSRM39WfKMK2qvxRKrv83RM+roEB6cl2I6NBzV
         og3g==
X-Gm-Message-State: AOJu0YzQwE9vSMIDG0SpF0v05dPavFO5yoQRfB6KZLeAYphtSj31BzZu
	dQQ0svcNXfzgKS+DHyZ7IsZfmbAlH7glcN2JLGS/B4FU/BEuKcBc63cNAjQ=
X-Google-Smtp-Source: AGHT+IFhocGizDs8pem8Gyg52bywIZ6yklgfHSgtdswF/opR933pCkUxbL7RBeUU3E13v8qSo6/UVw==
X-Received: by 2002:a5d:6a42:0:b0:366:d5ea:6098 with SMTP id ffacd0b85a97d-366e94d86b8mr2615041f8f.3.1719222910591;
        Mon, 24 Jun 2024 02:55:10 -0700 (PDT)
Received: from localhost.localdomain ([105.163.2.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b5ca0sm128258475e9.24.2024.06.24.02.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:55:10 -0700 (PDT)
From: Dorcas Anono Litunya <anonolitunya@gmail.com>
To: linux-media@vger.kernel.org
Cc: anonolitunya@gmail.com,
	jaffe1@gmail.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 01/10] media: Documentation: vivid.rst: fix confusing section refs
Date: Mon, 24 Jun 2024 12:52:53 +0300
Message-Id: <20240624095300.745567-2-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624095300.745567-1-anonolitunya@gmail.com>
References: <20240624095300.745567-1-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

The documentation contained several instances of "section X"
references, which no longer map to whatever X was.

Replace these by the section titles.

Also fix a single confusing typo in the "Radio & RDS Looping" section:
"are regular frequency intervals" -> "at regular frequency intervals"

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/admin-guide/media/vivid.rst | 41 ++++++++++++-----------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/Documentation/admin-guide/media/vivid.rst b/Documentation/admin-guide/media/vivid.rst
index b6f658c0997e..04de7b69c817 100644
--- a/Documentation/admin-guide/media/vivid.rst
+++ b/Documentation/admin-guide/media/vivid.rst
@@ -313,10 +313,10 @@ Video Capture
 
 This is probably the most frequently used feature. The video capture device
 can be configured by using the module options num_inputs, input_types and
-ccs_cap_mode (see section 1 for more detailed information), but by default
-four inputs are configured: a webcam, a TV tuner, an S-Video and an HDMI
-input, one input for each input type. Those are described in more detail
-below.
+ccs_cap_mode (see "Configuring the driver" for more detailed information),
+but by default four inputs are configured: a webcam, a TV tuner, an S-Video
+and an HDMI input, one input for each input type. Those are described in more
+detail below.
 
 Special attention has been given to the rate at which new frames become
 available. The jitter will be around 1 jiffie (that depends on the HZ
@@ -434,10 +434,10 @@ Video Output
 ------------
 
 The video output device can be configured by using the module options
-num_outputs, output_types and ccs_out_mode (see section 1 for more detailed
-information), but by default two outputs are configured: an S-Video and an
-HDMI input, one output for each output type. Those are described in more detail
-below.
+num_outputs, output_types and ccs_out_mode (see "Configuring the driver"
+for more detailed information), but by default two outputs are configured:
+an S-Video and an HDMI input, one output for each output type. Those are
+described in more detail below.
 
 Like with video capture the framerate is also exact in the long term.
 
@@ -1200,15 +1200,15 @@ and WSS (50 Hz formats) VBI data is looped. Teletext VBI data is not looped.
 Radio & RDS Looping
 ~~~~~~~~~~~~~~~~~~~
 
-As mentioned in section 6 the radio receiver emulates stations are regular
-frequency intervals. Depending on the frequency of the radio receiver a
-signal strength value is calculated (this is returned by VIDIOC_G_TUNER).
-However, it will also look at the frequency set by the radio transmitter and
-if that results in a higher signal strength than the settings of the radio
-transmitter will be used as if it was a valid station. This also includes
-the RDS data (if any) that the transmitter 'transmits'. This is received
-faithfully on the receiver side. Note that when the driver is loaded the
-frequencies of the radio receiver and transmitter are not identical, so
+As mentioned in the "Radio Receiver" section, the radio receiver emulates
+stations at regular frequency intervals. Depending on the frequency of the
+radio receiver a signal strength value is calculated (this is returned by
+VIDIOC_G_TUNER). However, it will also look at the frequency set by the radio
+transmitter and if that results in a higher signal strength than the settings
+of the radio transmitter will be used as if it was a valid station. This also
+includes the RDS data (if any) that the transmitter 'transmits'. This is
+received faithfully on the receiver side. Note that when the driver is loaded
+the frequencies of the radio receiver and transmitter are not identical, so
 initially no looping takes place.
 
 
@@ -1218,8 +1218,8 @@ Cropping, Composing, Scaling
 This driver supports cropping, composing and scaling in any combination. Normally
 which features are supported can be selected through the Vivid controls,
 but it is also possible to hardcode it when the module is loaded through the
-ccs_cap_mode and ccs_out_mode module options. See section 1 on the details of
-these module options.
+ccs_cap_mode and ccs_out_mode module options. See "Configuring the driver" on
+the details of these module options.
 
 This allows you to test your application for all these variations.
 
@@ -1260,7 +1260,8 @@ is set, then the alpha component is only used for the color red and set to
 
 The driver has to be configured to support the multiplanar formats. By default
 the driver instances are single-planar. This can be changed by setting the
-multiplanar module option, see section 1 for more details on that option.
+multiplanar module option, see "Configuring the driver" for more details on that
+option.
 
 If the driver instance is using the multiplanar formats/API, then the first
 single planar format (YUYV) and the multiplanar NV16M and NV61M formats the
-- 
2.34.1


