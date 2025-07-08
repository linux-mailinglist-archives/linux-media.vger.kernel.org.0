Return-Path: <linux-media+bounces-37135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D8FAFCFC3
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 17:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D679B425704
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 15:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABAE2E172E;
	Tue,  8 Jul 2025 15:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AC96w9da"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA79C221D87;
	Tue,  8 Jul 2025 15:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751989946; cv=none; b=cASrV8iAOQClEaa94tP0UBGSObU8t0M0QaqyjJxeIqh/DGZYEL5dWFRaFHME7XNgjuP/oH3NxSObwW8pBPaX/W0rp9iKsmtAEZj6n3G3zDlPJVaj3PYkVhCOwNoJJzXKw4OVIylLL3mKfFncG1TA3kWDJppzjsmFwuWFLGR3bXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751989946; c=relaxed/simple;
	bh=+D5A4PuW8x5tixefVlky3Tm8gVQ5A1rN1sYTliWM8a8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dqz+cwgfnOozz9YW4pYjkz4O/50uS11wmCEKluTqmCyEVLW+RxPhhgqOpnf5lC2kPZWgtXp7Lbj+njxQbJSfdr0aSgMtXlulF/qARbw8WZCbbgFYxLW8JScuKzvmE8SaB+ckE1evtDHlMs70hVG05X2tL8AP1rCLHKYKb4015CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AC96w9da; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32b435ef653so37646731fa.2;
        Tue, 08 Jul 2025 08:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751989943; x=1752594743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jmSkHJCz+i+8oNuJ7dtPiAVYrxKnL1IVG/oZZEY1wHc=;
        b=AC96w9daLtYpjhyQazUXKdS1LuoQ7tnXeGllws39ZnHdWoaswY2qvZagHcxdHUgeFh
         XzLHehR4UktkXQ99LWQurTFSoVKKeByajewymGLUFgSLXqJ+tJNdIbb2UZIBgZ4Dd34g
         XM7PTG7xNEh/Ipaw8jwImE+rWNdbsc9JUekWXtHwxeRz7t/l+Q8Bjs51fOnlpXPcgY4l
         ms+5XPUTC1Bdc6+tGJgfQjbQgVX9B2R9uJF2jtyYbaZvjjyLHjYIe36QSK3TtOqAXHE3
         rusISRt2IV0ha6cAaDZvpljdHKA7+nZjqiWp6nSshHZbEXTeFI7X+X6v1bvZ7D76jyrh
         mLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751989943; x=1752594743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmSkHJCz+i+8oNuJ7dtPiAVYrxKnL1IVG/oZZEY1wHc=;
        b=B0uQci0CjzKd+wsAhHMQcgv937MSUiTS5IWEoKbOvYxzGhxjwqQvT+lYJpr4yZGAbk
         OchzyUVNWg1AoL69o+EVpBsCIW2ju3WTzl2VKQ6FGZV3EpqwscpfwKS8JvaLCieJkFDv
         IbjbVwB3Xa+aVC5y+YsAaoowqH/vcaszsMMI8nJ0HniHnwTejZHGSjpIg9RbqFSj6Ceo
         g1CUtoiTPNTQ4C6xAtn3zQvCEqfgYf6fMJWuKnA62rZDCUJsO63PMOR1Ea23HbcJv5Uc
         +IdnsIbAVxkSpnbvfAvVK5cpcgST5Cn3+vLbS7m2w9TD7lhfpk2+cOsSqGoLn9EZNytB
         Tudg==
X-Forwarded-Encrypted: i=1; AJvYcCWBZ0QWP65+YXh6btlo5Xib8Ncv0hlksmTnrBYwZ1joPG0pBy4iOlk84luxggvjVEQBCV7IVsvDb9jnAB4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/QDzWkaxKAbwFAU4cx6Scx7iFPNx1nkkEu+YPdQ7mbTc7pHPv
	7PRYG3uik0eMARqXDFnrzqBGpw0//5Us4oNTBEabCUAX2SOxXpl0DaYK
X-Gm-Gg: ASbGnctdfIQ+0PDVKE1n/SJvX7zVZswPU0So8G8HczcEuf0lOLcE0ZFkNDXrLIh9vLx
	la+gPRlNrUR5Kl2zpNtUDpW94uZiTebrWHcu8Z1Ozvp8yAxx5zq2LQ2cjXWsL2pDHvx/kKM+O3n
	A7JDYtDZvv0WIkGWIk1HTbt04Y2bpU73nPhkbPlRcTipBe6N4XTq4bNtOdetLEJVAkdmh8ja8Q4
	4UoSRIwcxqKB2tP9oL3ukhrEDBiVY+IITVig4jja/sxzocGXexmTVa9YblBvamLJObjYAGs69ar
	7tlvLC/GwKeZL1pBalpf12PCz41cgzaF7/VePB9aaeeNhLyO46OwsnsWgIBJfZL8vdri73JT48H
	ajusRJCZczZmKddKRo6HUCSofogDxuC2pPsLG0dtWLn7pPtcvfUnB+hQ=
X-Google-Smtp-Source: AGHT+IGObFuGXvT2GzyTk2CgC72i5HKiSRkLhd9+Z4VW0day2YqiJnhXKIGGedkBXsduKaq6TDUcnw==
X-Received: by 2002:a05:651c:409c:b0:30b:d656:1485 with SMTP id 38308e7fff4ca-32f39af8edfmr9210121fa.32.1751989942306;
        Tue, 08 Jul 2025 08:52:22 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-6e-3100-b168-44b6-f1aa-76.rev.dnainternet.fi. [2001:14ba:6e:3100:b168:44b6:f1aa:76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418c6sm16309481fa.75.2025.07.08.08.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 08:52:21 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH v4] media: Documentation: Improve grammar in DVB API
Date: Tue,  8 Jul 2025 18:52:06 +0300
Message-ID: <20250708155206.91281-1-hannelotta@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix typos and punctuation and improve grammar in documentation.

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
    
    v3 -> v4:
    
    Shortened commit title and message.
    
    Converted from a patch series to one patch, as other
    parts have been applied.

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
2.50.0


