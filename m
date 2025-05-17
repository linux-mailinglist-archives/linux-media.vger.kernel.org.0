Return-Path: <linux-media+bounces-32685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A5EABAA5A
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 15:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF7B14A00D2
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BB01CAA65;
	Sat, 17 May 2025 13:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxwqXNCq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502818460;
	Sat, 17 May 2025 13:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747488450; cv=none; b=ih+ksaim6VdbnjDasthJOGT3PTZIaUywePvx3L6dVEsQy5QqNOTUMUQYIEAqQpddJPH9V2YFcmyMg6xZb3VOk0Db3bp6qV+VcwntHOqvq5tNsB34oB3UDoiADuyLs/jRPGFvTlRapdeuT6gnrE9XFzm/HPwWbgFFmp70KwPsH68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747488450; c=relaxed/simple;
	bh=BuPQYyc6pp5UC2wrsIj7kNgnkeQ1LP78BQ1KWm/Nf/U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=rV4P3gG0hjT6JmSDUXAgqqMd+G5Q8gULCj4ogi6HsGCYZ08A27cpoeHKZK3EuhrJjoiwmoxRVsZFJCLkgFZqd5Gp36nAOt4FDUHtFT0pwnznmZCebwz14CYzVDwgpsuTjyePsmOSn4YcX+2s+4BQVpt8pBbXv4BoXPYV9omQQ9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxwqXNCq; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54d6f93316dso3402782e87.2;
        Sat, 17 May 2025 06:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747488446; x=1748093246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jz6yRlWoF8TJV/KKFhBHaeGE1nqcFCdrMkeisnxGZcU=;
        b=gxwqXNCqAkzv1Qq/kmKkH3TzikoAvtQEKBhB5CrYim7vaF4cG3hN9rrjsoD3dFxZKs
         swGjL1u809fH/fctfpqxpuXyEwNMinZKoKfuyfx6b/lrw7IclxzbrLJ4MdUgVhZ642Be
         MYxybwQmQR/G2IspcPEEkwNuLFq7+y1Y2DVBPRSXO4X7ZUMz+HoPSlfek5E8uZWVNSLm
         dPNrATejgevdLf3MRy6ZOVhMLQODfWLri9vH7AwWETRoYqTxeKp9fzlPUmMlKK2wH4EZ
         yoPEQKXXLvQ1/om1znbYknD5Cgvlpe/ciDZzwmUvGxIsVC/8OVdY7BpXSyAztDuS6+BN
         WvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747488446; x=1748093246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jz6yRlWoF8TJV/KKFhBHaeGE1nqcFCdrMkeisnxGZcU=;
        b=fX0JP9goOrf1G0XqD2g1ksDfJtfygo/Mdbsc8W8mC209Of/4+dt5RGgmAWjAmFCjH4
         t89YVVYdFE2Ps6pruATB0nboHMbQTAgVmjYU9RPzbU2z8aZcD/i3Mrfh+nKkQieNtSYW
         Lb/TYoFqf4Yv8ozC1q69BFaXNlTGv4eEHL9NMgILrba9UZoqIJOY79X7/prnHxAImMBa
         0o1wntcspeE18n032Oy7CEKbOXM5VpSq7l/gQEHWSg1Y90XH114mNE9JTfIL2PNKIafw
         bYo23N6m6ZaWZDzF4EEWirfX6NTXbAvMdsDXbT4u/gVTz306ShxD8F9GK66diKJaXcJD
         BIPA==
X-Forwarded-Encrypted: i=1; AJvYcCXY/AGKKGQcWN9gb8n/RGrp+E2EOQW+QxvDcPEE4AUUbQtgMyfW7QkOKA+Ea8cHjbzcb/6C+qYgQHLxR7k=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyvt5ygmop85ao0U63L3sLRjTEWzr6LVZqQAUBZiA5E88p8EPs
	DHveuLdJ97F9wcjmpZ31OlnvgPLq1mVMbKzKDK7ObpweeSNEYSc1sZf2
X-Gm-Gg: ASbGncvghRSQ8OdBCbfOKqouIK4Y5w37t0jIbQPN/ZnfF1Hs5IP2qVbXwyCKiqsRi0M
	HnVmNu/Y0w+QNuO32LZh58TgzokNFamKfbXaJ96Avjt3Q2pOOQnQxEEqoQrXLaQlWPSzaBAfvgK
	YrD8/tqBAw3iUnfQf3wmpcCvI6mk6uLIZiiroYx4ol8NP1JShFEIWFY9vPumLxolYnFeKyLm/lA
	ZCaQS86xtBFJjqM1eSxJVoi6A1IQKxsCWyS8ywAqXIsYb8fZh9W5j1uR+v37HMUz+7/GJj6nDPk
	UPD2V+2ckuL4jFmD0mr9HN7vjP7w3d135qilhY7xyYQg91lM0YwS6AEvZRNzbAdajuaJ7XNylxv
	ey0SmSlnHtMc6cGrGGTFZigUChzS/fPkQg7wPIaGGRmT/pXCz
X-Google-Smtp-Source: AGHT+IEJG5SvLLN4GhKl1GOCfg4hKdVxZC6EdDjU7HRV/ARDxptfS8vTVx7TIrt5S76RjAOcOne76g==
X-Received: by 2002:a05:651c:3243:b0:328:423:cd64 with SMTP id 38308e7fff4ca-328077a2ac9mr21581391fa.25.1747488446096;
        Sat, 17 May 2025 06:27:26 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-53-1500-40ac-27de-68f1-6ee7.rev.dnainternet.fi. [2001:14ba:53:1500:40ac:27de:68f1:6ee7])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf9f9sm8663501fa.94.2025.05.17.06.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 06:27:25 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: mchehab@kernel.org,
	ribalda@chromium.org,
	hverkuil@xs4all.nl,
	hljunggr@cisco.com,
	dave.jiang@intel.com,
	jgg@ziepe.ca,
	saeedm@nvidia.com,
	Jonathan.Cameron@huawei.com,
	corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	W_Armin@gmx.de,
	mpearson-lenovo@squebb.ca
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH 1/4] docs: Improve grammar in Userspace API/DVB API
Date: Sat, 17 May 2025 16:27:08 +0300
Message-Id: <20250517132711.117618-1-hannelotta@gmail.com>
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
 .../media/dvb/fe-diseqc-send-burst.rst        |  2 +-
 .../userspace-api/media/dvb/fe-set-tone.rst   |  4 ++--
 .../media/dvb/fe-set-voltage.rst              |  4 ++--
 .../media/dvb/fe_property_parameters.rst      | 23 +++++++++----------
 .../frontend-property-terrestrial-systems.rst |  2 +-
 .../userspace-api/media/dvb/intro.rst         |  4 ++--
 .../media/dvb/legacy_dvb_audio.rst            |  4 ++--
 7 files changed, 21 insertions(+), 22 deletions(-)

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
index 9f44bf946183..a985eec140cf 100644
--- a/Documentation/userspace-api/media/dvb/fe-set-tone.rst
+++ b/Documentation/userspace-api/media/dvb/fe-set-tone.rst
@@ -26,7 +26,7 @@ Arguments
     File descriptor returned by :c:func:`open()`.
 
 ``tone``
-    an integer enumered value described at :c:type:`fe_sec_tone_mode`
+    An integer enumerated value described at :c:type:`fe_sec_tone_mode`
 
 Description
 ===========
@@ -41,7 +41,7 @@ this is done using the DiSEqC ioctls.
 
 .. attention:: If more than one device is connected to the same antenna,
    setting a tone may interfere on other devices, as they may lose the
-   capability of selecting the band. So, it is recommended that applications
+   capability of selecting the band. It is recommended that applications
    would change to SEC_TONE_OFF when the device is not used.
 
 Return Value
diff --git a/Documentation/userspace-api/media/dvb/fe-set-voltage.rst b/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
index c66771830be1..e80ba7220d2d 100644
--- a/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
+++ b/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
@@ -26,7 +26,7 @@ Arguments
     File descriptor returned by :c:func:`open()`.
 
 ``voltage``
-    an integer enumered value described at :c:type:`fe_sec_voltage`
+    An integer enumerated value described at :c:type:`fe_sec_voltage`
 
 Description
 ===========
@@ -44,7 +44,7 @@ power up the LNBf.
 
 .. attention:: if more than one device is connected to the same antenna,
    setting a voltage level may interfere on other devices, as they may lose
-   the capability of setting polarization or IF. So, on those cases, setting
+   the capability of setting polarization or IF. In those cases, setting
    the voltage to SEC_VOLTAGE_OFF while the device is not is used is
    recommended.
 
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


