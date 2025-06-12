Return-Path: <linux-media+bounces-34641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAC5AD78E8
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 19:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88E31164E12
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 17:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5BB29C328;
	Thu, 12 Jun 2025 17:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8mQFdzu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44722F4334;
	Thu, 12 Jun 2025 17:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749749261; cv=none; b=jZnxol4uHQrMZ1A4ORIJ+O8A1wuQ255WdN4Hn5OgLJfjn5kK4N+hmJNwJEAQPAuxzEHdANSrTANRrrT8TIWgt6QeQFq/Z4ND9inxpytMtmKHzyR5AIBnpNbP7lp6ql2rkwaLlqdXRthjWwkM3m0TDc5q8sRbmu5nq8I3PYBiIW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749749261; c=relaxed/simple;
	bh=B4JXQMtXMV8Z/V9ndDGoX3b5XeTho2XrF5eCPMN0z50=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=RWgzrYW7cKFqESc+w+cstABtE7Fc0uHwm4pNOZ2xwNBTKZiPhasoho0TDn8Xe8QAjtnoDOUayVyTcfEtVK98zVr7iKxPnTezNkDuG9T6K8ASYA9n3VN+XThJ1pQv7nUHQykR8TX8pOVXVAwKRBCRh4rQuj9jSqL1OKZpfmKW3wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8mQFdzu; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5534f3722caso1403950e87.0;
        Thu, 12 Jun 2025 10:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749749255; x=1750354055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OcXsTciQMMP9C8++dxFKWg7bS1bRXjWXpfwQIuSV/0=;
        b=g8mQFdzuw5TOk3RLFf/R5cQ1rLzAu/42ItG38OCqe7i+ZcfqxtS6bBlTi2IMbJW5F6
         j1qzQ20PoMNWvAuhm+mGGnLNLLen9nR18VkcouYrK10qJwfHTcYkSaT8hOiUFKLiKnwQ
         /D3xihy7HhzE9Ux0aTtISBs1JIc68xSWyURVvDu2B/cM53CFhMzauE2hLDXR3Vu563MZ
         UcOc1kWlyQIHrFy/wZOJhKiiUeRFNVblJFeUh4OGObSO8vcsNIxMaUEbJn0z5DSpx+hu
         V+R4VIXtAK2GFcDznMjMsOB8J42VPQZlFs8XVWOl4auHPKmkdERjbRqVlPIpFMxlOU4Q
         S0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749749255; x=1750354055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OcXsTciQMMP9C8++dxFKWg7bS1bRXjWXpfwQIuSV/0=;
        b=rvj73kZMXuXVlscsscGuSpWlj7XNWtBPi1vfoyNeodukhFjvyCGT9q8hyMqIqZcXUi
         +wlaOm8xEzUFIyR/erP9uB0Lo5/bYSBKg+Tf5NoZIMwkiq74KvY8AOdKcpMSkytn9A9R
         +nY5EOI+H0f4zuH0snOTEo6R+Kg+3ZQmZjuwizmBbnUsQNKP3dZJWKJrFhFDTkTgNSxP
         gf/5bL2YM8E7e89toQG9G2IlPjN1Y80FO097EQIeAW39DD1m/5KEOgvmAgs5uNUYfriL
         tQ+F7yonahy+vzY/3UZ38aqdp6FKOksXXCiXIS1RWTDa/ZeJSzwzonsQJK53BO21BnVb
         H5Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUYXdeUNx7l2zxw2McTOP2+Rafrt9xvrfIdU8PKye7vDzD7jcBGtDgdeOnikiCXcn/V/4GWT9FOzM59dH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX2Mao2GAXxR2uZ2T0l+bmAEOMFKMSoz7TEhG7Un6s9Z+eqTMy
	aNXHHgzgg3rJz32rrlUGXp8A4sdFPB0MgjjmMu330VJY+v8Wzj6cTDUA
X-Gm-Gg: ASbGncsp6v6eA6/QcejQy42McJfv8WOQ2CRIwvem138aX4vaVqDrddS/8vmS3E0H1Ed
	aYm9exO+QFkh9Vu/6NTEmDwwfj0gd3CjsclcLfLzZULxJpnSbxRaXgjanF9iEOVFVWXfZRKFUgt
	HpCAMjiuzPQ2Gd1SC2/Wm/N5y6UA8zKydyyMVe9QpjIgGVzjy23qLWj7aGpZoIDvldJjaWEmAAQ
	iW0lD2+LYlDnMTA6q1grUaxduEhylvMazXRL3PsuQBxCDVAdsYjiaCJpDjTQeiuAM+Xo0m87FeF
	mbie74dg5FCtFnLOOJmk/Gu1DcYWk6eDb6s4bzZMJMrYhv9T3e86Cbnl0s6Lt+T01p6tZixZAGC
	QqndBSdIMPck1V6DKcuENJABUTBPEetgsALFen6iu4Wdby1f7k5Q2rJJckg==
X-Google-Smtp-Source: AGHT+IFQnqMHJx4sSN/lvMCPBBUt7WHo/KxonTXzlUVqDysS8KUjUaHEF7/+5SvHBCRhGm3D1WNESA==
X-Received: by 2002:a05:6512:3b9d:b0:553:543d:d996 with SMTP id 2adb3069b0e04-553af953a18mr1071e87.33.1749749254390;
        Thu, 12 Jun 2025 10:27:34 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-6e-3100-4ba3-46aa-7f0f-54f.rev.dnainternet.fi. [2001:14ba:6e:3100:4ba3:46aa:7f0f:54f])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1c24fbsm170358e87.164.2025.06.12.10.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 10:27:33 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: mchehab@kernel.org,
	hljunggr@cisco.com,
	ribalda@chromium.org,
	hverkuil@xs4all.nl,
	skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH v3 1/2] docs: Improve grammar in Userspace API/DVB API
Date: Thu, 12 Jun 2025 20:27:02 +0300
Message-Id: <20250612172703.32293-1-hannelotta@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix typos and punctuation and improve grammar in documentation
for Digital TV API, also known as Linux DVB API.

Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
---

Notes:
    v1 -> v2:
    
    Left out changes based on feedback from Jonathan Corbet
    <corbet@lwn.net> and Bagas Sanjaya <bagasdotme@gmail.com>
    
    v2 -> v3:
    
    Switched word order in DTV_BANDWIDTH_HZ description based
    on feedback from Bagas Sanjaya <bagasdotme@gmail.com>.
    
    Shortened the patch series to two patches, as parts
    3/4 and 4/4 have been applied.

 .../media/dvb/fe-diseqc-send-burst.rst        |  2 +-
 .../userspace-api/media/dvb/fe-set-tone.rst   |  2 +-
 .../media/dvb/fe-set-voltage.rst              |  2 +-
 .../media/dvb/fe_property_parameters.rst      | 23 +++++++++----------
 .../frontend-property-terrestrial-systems.rst |  2 +-
 .../userspace-api/media/dvb/intro.rst         |  4 ++--
 .../media/dvb/legacy_dvb_audio.rst            |  4 ++--
 7 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst b/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst
index 8fb73ee29951..6ac1e5cd50ce 100644
--- a/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst
+++ b/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst
@@ -26,7 +26,7 @@ Arguments
     File descriptor returned by :c:func:`open()`.
 
 ``tone``
-    An integer enumered value described at :c:type:`fe_sec_mini_cmd`.
+    An integer enumerated value described at :c:type:`fe_sec_mini_cmd`.
 
 Description
 ===========
diff --git a/Documentation/userspace-api/media/dvb/fe-set-tone.rst b/Documentation/userspace-api/media/dvb/fe-set-tone.rst
index 9f44bf946183..41cd7111a243 100644
--- a/Documentation/userspace-api/media/dvb/fe-set-tone.rst
+++ b/Documentation/userspace-api/media/dvb/fe-set-tone.rst
@@ -26,7 +26,7 @@ Arguments
     File descriptor returned by :c:func:`open()`.
 
 ``tone``
-    an integer enumered value described at :c:type:`fe_sec_tone_mode`
+    An integer enumerated value described at :c:type:`fe_sec_tone_mode`
 
 Description
 ===========
diff --git a/Documentation/userspace-api/media/dvb/fe-set-voltage.rst b/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
index c66771830be1..4d09ca5876f0 100644
--- a/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
+++ b/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
@@ -26,7 +26,7 @@ Arguments
     File descriptor returned by :c:func:`open()`.
 
 ``voltage``
-    an integer enumered value described at :c:type:`fe_sec_voltage`
+    An integer enumerated value described at :c:type:`fe_sec_voltage`
 
 Description
 ===========
diff --git a/Documentation/userspace-api/media/dvb/fe_property_parameters.rst b/Documentation/userspace-api/media/dvb/fe_property_parameters.rst
index 1717a0565fe8..ce962d4a02c0 100644
--- a/Documentation/userspace-api/media/dvb/fe_property_parameters.rst
+++ b/Documentation/userspace-api/media/dvb/fe_property_parameters.rst
@@ -72,11 +72,11 @@ DTV_MODULATION
 ==============
 
 Specifies the frontend modulation type for delivery systems that
-supports more multiple modulations.
+support multiple modulations.
 
 The modulation can be one of the types defined by enum :c:type:`fe_modulation`.
 
-Most of the digital TV standards offers more than one possible
+Most of the digital TV standards offer more than one possible
 modulation type.
 
 The table below presents a summary of the types of modulation types
@@ -143,9 +143,8 @@ ISDB-T			5MHz, 6MHz, 7MHz and 8MHz, although most places
      (DTV_ISDBT_SB_SEGMENT_IDX, DTV_ISDBT_SB_SEGMENT_COUNT).
 
   #. On Satellite and Cable delivery systems, the bandwidth depends on
-     the symbol rate. So, the Kernel will silently ignore any setting
-     :ref:`DTV-BANDWIDTH-HZ`. I will however fill it back with a
-     bandwidth estimation.
+     the symbol rate. The kernel will silently ignore any :ref:`DTV-BANDWIDTH-HZ`
+     setting and overwrites it with bandwidth estimation.
 
      Such bandwidth estimation takes into account the symbol rate set with
      :ref:`DTV-SYMBOL-RATE`, and the rolloff factor, with is fixed for
@@ -200,7 +199,7 @@ DTV_VOLTAGE
 Used on satellite delivery systems.
 
 The voltage is usually used with non-DiSEqC capable LNBs to switch the
-polarzation (horizontal/vertical). When using DiSEqC epuipment this
+polarization (horizontal/vertical). When using DiSEqC equipment this
 voltage has to be switched consistently to the DiSEqC commands as
 described in the DiSEqC spec.
 
@@ -280,7 +279,7 @@ DTV_ISDBT_PARTIAL_RECEPTION
 
 Used only on ISDB.
 
-If ``DTV_ISDBT_SOUND_BROADCASTING`` is '0' this bit-field represents
+If ``DTV_ISDBT_SOUND_BROADCASTING`` is '0' this bit field represents
 whether the channel is in partial reception mode or not.
 
 If '1' ``DTV_ISDBT_LAYERA_*`` values are assigned to the center segment
@@ -331,8 +330,8 @@ broadcaster has several possibilities to put those channels in the air:
 Assuming a normal 13-segment ISDB-T spectrum he can align the 8 segments
 from position 1-8 to 5-13 or anything in between.
 
-The underlying layer of segments are subchannels: each segment is
-consisting of several subchannels with a predefined IDs. A sub-channel
+The underlying layer of segments are sub-channels: each segment is
+consisting of several sub-channels with a predefined IDs. A sub-channel
 is used to help the demodulator to synchronize on the channel.
 
 An ISDB-T channel is always centered over all sub-channels. As for the
@@ -728,7 +727,7 @@ DTV_ATSCMH_RS_FRAME_ENSEMBLE
 
 Used only on ATSC-MH.
 
-Reed Solomon(RS) frame ensemble.
+Reed Solomon (RS) frame ensemble.
 
 The acceptable values are defined by :c:type:`atscmh_rs_frame_ensemble`.
 
@@ -954,14 +953,14 @@ DTV_ENUM_DELSYS
 
 A Multi standard frontend needs to advertise the delivery systems
 provided. Applications need to enumerate the provided delivery systems,
-before using any other operation with the frontend. Prior to it's
+before using any other operation with the frontend. Prior to its
 introduction, FE_GET_INFO was used to determine a frontend type. A
 frontend which provides more than a single delivery system,
 FE_GET_INFO doesn't help much. Applications which intends to use a
 multistandard frontend must enumerate the delivery systems associated
 with it, rather than trying to use FE_GET_INFO. In the case of a
 legacy frontend, the result is just the same as with FE_GET_INFO, but
-in a more structured format
+in a more structured format.
 
 The acceptable values are defined by :c:type:`fe_delivery_system`.
 
diff --git a/Documentation/userspace-api/media/dvb/frontend-property-terrestrial-systems.rst b/Documentation/userspace-api/media/dvb/frontend-property-terrestrial-systems.rst
index 8cd461ceeea7..8aad9ea817f2 100644
--- a/Documentation/userspace-api/media/dvb/frontend-property-terrestrial-systems.rst
+++ b/Documentation/userspace-api/media/dvb/frontend-property-terrestrial-systems.rst
@@ -52,7 +52,7 @@ DVB-T2 delivery system
 ======================
 
 DVB-T2 support is currently in the early stages of development, so
-expect that this section maygrow and become more detailed with time.
+expect that this section may grow and become more detailed with time.
 
 The following parameters are valid for DVB-T2:
 
diff --git a/Documentation/userspace-api/media/dvb/intro.rst b/Documentation/userspace-api/media/dvb/intro.rst
index 6784ae79657c..854c2073e69a 100644
--- a/Documentation/userspace-api/media/dvb/intro.rst
+++ b/Documentation/userspace-api/media/dvb/intro.rst
@@ -1,6 +1,6 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
 
-.. _dvb_introdution:
+.. _dvb_introduction:
 
 ************
 Introduction
@@ -125,7 +125,7 @@ demux, CA and IP-over-DVB networking. The video and audio devices
 control the MPEG2 decoder hardware, the frontend device the tuner and
 the Digital TV demodulator. The demux device gives you control over the PES
 and section filters of the hardware. If the hardware does not support
-filtering these filters can be implemented in software. Finally, the CA
+filtering, these filters can be implemented in software. Finally, the CA
 device controls all the conditional access capabilities of the hardware.
 It can depend on the individual security requirements of the platform,
 if and how many of the CA functions are made available to the
diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
index b46fe2becd02..81b762ef17c4 100644
--- a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
@@ -195,7 +195,7 @@ Description
 ~~~~~~~~~~~
 
 The audio channel selected via `AUDIO_CHANNEL_SELECT`_ is determined by
-this values.
+this value.
 
 
 -----
@@ -413,7 +413,7 @@ Constants
        -  ``AUDIO_CAP_MP3``
 
        -  The hardware accepts MPEG-1 Audio Layer III.
-          Commomly known as .mp3.
+          Commonly known as .mp3.
 
     -  ..
 
-- 
2.39.5


