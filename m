Return-Path: <linux-media+bounces-33107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CECAC0AD9
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 13:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 369EA7B1285
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 11:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F43128A1FB;
	Thu, 22 May 2025 11:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duNmFUPk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE3D288C36;
	Thu, 22 May 2025 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747914797; cv=none; b=pBhR+D/WHJw0PhubZgtMsmNFlpqcGprIahmLatpRdwyiEN+qE5nyxwGZl7+Askt5USsYiCObXKrxGcmBZxqZb0jXYDkL/J/JYZKxiYpFShaxUqzVe0xp4MyJtn8fU5/I7/zFDKoJ0ItObzH3IEbQv1uxhTKxmvLdm9garfrSK4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747914797; c=relaxed/simple;
	bh=pWgg5uHq1Hj4byR4xuPyJSNZim4/mrvZNsi9sBCeduk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=F4BL+Q5V/LdO0gFjEcWk1E4Yn/pWtbwij/X+A4QSF/wNfpk4HW+d+LE3GlDfYCh+oowjDvdGk02Gfyy5mepN32VxakYpVVgoaawEN2Ij4IAQtPUEpUILvcurl9pWffscOAC+D9hMm3VQsi2ww6Gz3abiwVO60A7LGvvl3XuzaEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duNmFUPk; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-551ed563740so6597378e87.2;
        Thu, 22 May 2025 04:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747914794; x=1748519594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yUl8p2w7XYKuy3CZvywHLks0IKC7NaJ4hSD5ixu79mY=;
        b=duNmFUPkw2xmBCdtjhzOxN5TDhkmk7IdVvWgSl+WGEuxVfGHmYbT/XdI3pmCiUZhRr
         Zli92W7Oup2cS7EMO1zLpN0Vpf4PSc5YJRAcPL+w/WBoFEbL0nOKxVACk88UbjSzdrfV
         +BpRfvr7VWEE4N9oRtefiVJMiI7pO7dzImNcYFM8WhhVMLvPutwKpqYYhlNUOzFpFSSG
         MmxnzHzr7iDK6ZpfYjXP/xnB6sginusYN/TivhDi+mHPZ610z8iEPxNKyGLJuttYvnu5
         3RvVbl9JVxwAARsV50HLe/dU+Hiq0iuptxp17xZnZy9AtXcOIdta5MkzTMEV4x9rO861
         PgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747914794; x=1748519594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUl8p2w7XYKuy3CZvywHLks0IKC7NaJ4hSD5ixu79mY=;
        b=E3fI4+ETDPoTgyNEUcVJpxNa+vLv96e9n/vxHtPS+6RFY3G8WtIdNikhNvG0lKVzWt
         zU2qRUH0qCker/pbYyz+1xKshbvU8pbNNh2SWyI/LgTzLrh01yS8eyZY9bRXPvydVR9I
         Hv7TlJMjxu1AL1OYuJKjGFrJhpjqhzn22XjDmUvqLTHsjjo4+MZzwz5XRx2MIz8gOut0
         +AptVTLXaoKULcy7LkI/eJzgw/5LT9wE0Obdgkz46ktPdKW3TcsFBl8BSR8pk95NPhd0
         /6762c7upXGg4JVOAeKqN7VMO+Apd7gFg0DJes/6B7jDxc/ztlySjr4vOfUeq/LM3Fii
         Segg==
X-Forwarded-Encrypted: i=1; AJvYcCUfSlY7HyqOfimE0wnpvEGnnqhxnRJDy1ECMdk0KJe+v1T/PF2slaMKpq96zp0XXUI79kuWbudouZB1HnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/cXUVzdavn+H2AMZbnzrtiamcCDk7vGrzF0W/n8E2htJ7fn5b
	5MKuo8X4I1GEmXAhfgX7obfg6d7EklnLQsOcOWJdgY96Xw57Os29cDtm
X-Gm-Gg: ASbGncv9TFsdj0oWNWcYUzmfiyldA5Ek8NUzGt2ZRGRMoV9ra91mTVVj4FIi7h5Qebb
	N7K45lWUakt5Fe3HAzIqJ0pGIgkqLmGSYInXyPzzsDJN8D/GgCWByqso1eRbCFaXiqTt05nN8Tf
	SEpM8undp7qKXmNe2JyHgrd6zh8RKpdHzgvCiUusGjm4Q9v1Cumvjg75Xuf/QlVH840SCtvo1cB
	KMNTJdyCYIZl4Eea093TlGqVh6rz5cfgNP8kXq2Gper7Hs7j7kb+L+7hh1YwAzJLS+kXPQEtump
	ndTLOE1VV6h7I8omzIftmqks706Qc8lzCd/W7YRmICiivOy0loYhGxLIfcFIhpMSlU7biGjLXac
	taHiMyubVPmGBQk3ssd/gtIvpyVIVRcoJVMsu2fjDLFv0Mw==
X-Google-Smtp-Source: AGHT+IFlEASRKAIWw5pz50sIKoDkCSz9iHN2U6yfJV8d32kyTIT5U4beqYHrTP+oBiblg0zjCifuNw==
X-Received: by 2002:a05:6512:2616:b0:54f:c35a:3754 with SMTP id 2adb3069b0e04-550e71cef3amr6410581e87.27.1747914793247;
        Thu, 22 May 2025 04:53:13 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-53-1500-7c4-bcaf-182a-540c.rev.dnainternet.fi. [2001:14ba:53:1500:7c4:bcaf:182a:540c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017e79sm3343760e87.154.2025.05.22.04.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 04:53:12 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: mchehab@kernel.org,
	ribalda@chromium.org,
	hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com,
	hljunggr@cisco.com,
	dave.jiang@intel.com,
	jgg@ziepe.ca,
	saeedm@nvidia.com,
	Jonathan.Cameron@huawei.com,
	corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	W_Armin@gmx.de,
	mpearson-lenovo@squebb.ca,
	skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH v2 1/4] docs: Improve grammar in Userspace API/DVB API
Date: Thu, 22 May 2025 14:52:52 +0300
Message-Id: <20250522115255.137450-1-hannelotta@gmail.com>
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
index 1717a0565fe8..2e067fac1ce7 100644
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
+     the symbol rate. The kernel will silently ignore any setting
+     :ref:`DTV-BANDWIDTH-HZ` and overwrites it with bandwidth estimation.
 
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


