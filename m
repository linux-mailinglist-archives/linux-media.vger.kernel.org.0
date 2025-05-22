Return-Path: <linux-media+bounces-33108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39771AC0ADA
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 13:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D5B0189532A
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 11:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7400928A708;
	Thu, 22 May 2025 11:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izQUvTNs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CD3289810;
	Thu, 22 May 2025 11:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747914805; cv=none; b=QmR9nWF2T+9D3Q8+rPQU+Y5s+Mv1Sw8+ZKroPGwrjNaesoUkgHEWzQx8I7FsKbkHUYP2pxiHbbfT6Dw/LK9kQfzvDqg6Q6eJAMTxixrPz06JErM9BPuUG+HDWEnMlMUxSxs+GLJQqptFQRAUyVwRgHpFHHUQkckLKdvWeEBtNHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747914805; c=relaxed/simple;
	bh=mC2NX5Ld0kmQE028hPgdun3VOJQNhT5Wj8QUYegZWRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OG1iBhnNbuhmAsmGYpEkU8xB0XbMexedHDAG4zPfF0mXoAL846m+YiqTwA4+080yK8uhiLDLmgtrDhd1NXrpOP8kdj3JrnwjEGWtkAFsVb0aO+NHM0Ui9a8kDh8HOfls74FGCZi7Ka1LC7xCLBZxG0M/3nY7T8c6EIapPxYqjWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izQUvTNs; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-550ea5df252so6827878e87.0;
        Thu, 22 May 2025 04:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747914802; x=1748519602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPcSJ2spCqExVjK74bSjE8iGNCUYyEjiFyXAqBK4zj8=;
        b=izQUvTNsJHHNTTe3/ljGtaQRIg3E7whQt3gFLLcuFc7CIucy+VyaOoFGrMzWLTkUmn
         ++RxxpUiPRBluVSmCiIy72Z2fjVwnVM4PSabdiY9cSsKK3ZJVgRrjfRzQYQ8qwu1wJRu
         h+SsxFuECZtk1Kv1qfot5od+v5YylSurOGDiSi8PFf28Whn00GxXgbfds6ZLwK1SHJLP
         MpStObkqCIgIQo37iRE/zoeBpsEj8IUQRHALSsQ2+Ebgl9oB5dWMXi9Q00iaNpen4RKr
         1ANJf5esQf6c4la5IkQ3UNhaQUYlv1EUlrw00pvHILjZ5AC78WFz8GMxGNX0R3DdvH0W
         CBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747914802; x=1748519602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPcSJ2spCqExVjK74bSjE8iGNCUYyEjiFyXAqBK4zj8=;
        b=Ru2UwVl1zsVCN9QS5RFauW60YDuNW7lhVO9BO57WBTAg9XWbtv7R1XlAKZl/XshFp+
         vRPiuQ6ebUFHZhANPvDJBq3zGmzR+WzJFUzFW9dTFeRXZymXL/8pe4h5vtb4xYR17xOh
         /WDqBmXhZPq6ca9V6FTEa1y4uFtJKKa7vb65IYaHWfMn6EleP4VzfKGJ3EY5H5bQGixm
         vzQXTSMwOFnswDira5wSV6QtBy2gxEB4HynXAMbBAblxWqBHFl3d0qTLW1XIgBaOR8eT
         C4QW6biWG0FgtIlcZjb3BAboJhxgaUiAbs90iaeZFUXSQAjLc9t17m72BnF6EolICZan
         Me1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQV2xutPTxNhRSXf06615m+WI7/SayM/21lrADEEDK289rlGNRt5rDskC7eRYuNpvSnQAe1FTks0d5kR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgVl8r8FGJnAC1Isp5SI1CLSxhZt919k1ZGsJJRXg+Dtvju3PN
	nyLS/lNWqMB8MbFyn7wmiw6auqyWyO/GTHwckW036CxUm7k5TwLjErprylPaQWhT1vI=
X-Gm-Gg: ASbGncv9cpbkf5eaZB2fOa8eOxKIVoIzSynm7pbHGpnSpM+cYC3UFr8uf0s486R3/Sw
	uurIKoJfV7BoR+3d0NglL7dk54OFhQx7h8JtxB9i4Ptn8WhJXzuE7eB7y11BN2g8mldCZID9dNI
	pwJyc5KmzNHYDXPdKfjO5bZ5oSzA7SQ9Q1MEu+mrWFJI27h8H5dwFIGBMuOfUg+90ne/MRGNNn3
	Q8BPuaL3LPDVWm2HDRo9odWrJXLDr09n6GYn7UutbcACNBpgqnYy+5WMq9ydJJ3qBHzqDBohT4E
	B9Ecvt6x3lJluOjhzv+ZT6KCpbtJ0DqXYy/LN0uGxuwzKbklXKuNWhM3oQP7Wq+h3EiJtINNwOk
	cAG8PZ/D67k0b6FYN168msSP0FAtuKaBpzdgbzZoF5ejyWCRF2IPFobBI
X-Google-Smtp-Source: AGHT+IGyl7U2kjS4B+fPmIEXgaGCAUqNftsDBqA591csvR7/RNfy6A+8c/67EAFT4dWAXSPWwEhHhw==
X-Received: by 2002:a05:6512:4508:b0:54e:8189:2ec9 with SMTP id 2adb3069b0e04-550e750b3d0mr7360828e87.21.1747914801460;
        Thu, 22 May 2025 04:53:21 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-53-1500-7c4-bcaf-182a-540c.rev.dnainternet.fi. [2001:14ba:53:1500:7c4:bcaf:182a:540c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017e79sm3343760e87.154.2025.05.22.04.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 04:53:21 -0700 (PDT)
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
Subject: [PATCH v2 2/4] docs: Improve grammar, formatting in Video4Linux
Date: Thu, 22 May 2025 14:52:53 +0300
Message-Id: <20250522115255.137450-2-hannelotta@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522115255.137450-1-hannelotta@gmail.com>
References: <20250522115255.137450-1-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix typos, punctuation and improve grammar and formatting
in documentation for Video4Linux (V4L).

Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
---

Notes:
    v1 -> v2:
    
    Left out changes based on feedback from Jonathan Corbet
    <corbet@lwn.net> and Bagas Sanjaya <bagasdotme@gmail.com>

 .../userspace-api/media/v4l/biblio.rst        |  2 +-
 .../media/v4l/dev-sliced-vbi.rst              |  4 ++--
 .../media/v4l/ext-ctrls-fm-rx.rst             | 11 +++-------
 .../media/v4l/ext-ctrls-fm-tx.rst             | 21 +++++++------------
 .../media/v4l/pixfmt-srggb12p.rst             |  4 ++--
 .../media/v4l/pixfmt-srggb14p.rst             |  2 +-
 6 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
index 35674eeae20d..856acf6a890c 100644
--- a/Documentation/userspace-api/media/v4l/biblio.rst
+++ b/Documentation/userspace-api/media/v4l/biblio.rst
@@ -150,7 +150,7 @@ ITU-T.81
 ========
 
 
-:title:     ITU-T Recommendation T.81 "Information Technology --- Digital Compression and Coding of Continous-Tone Still Images --- Requirements and Guidelines"
+:title:     ITU-T Recommendation T.81 "Information Technology --- Digital Compression and Coding of Continuous-Tone Still Images --- Requirements and Guidelines"
 
 :author:    International Telecommunication Union (http://www.itu.int)
 
diff --git a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
index 42cdb0a9f786..96e0e85a822c 100644
--- a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
+++ b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
@@ -48,7 +48,7 @@ capabilities, and they may support :ref:`control` ioctls.
 The :ref:`video standard <standard>` ioctls provide information vital
 to program a sliced VBI device, therefore must be supported.
 
-.. _sliced-vbi-format-negotitation:
+.. _sliced-vbi-format-negotiation:
 
 Sliced VBI Format Negotiation
 =============================
@@ -377,7 +377,7 @@ Sliced VBI Data in MPEG Streams
 
 If a device can produce an MPEG output stream, it may be capable of
 providing
-:ref:`negotiated sliced VBI services <sliced-vbi-format-negotitation>`
+:ref:`negotiated sliced VBI services <sliced-vbi-format-negotiation>`
 as data embedded in the MPEG stream. Users or applications control this
 sliced VBI data insertion with the
 :ref:`V4L2_CID_MPEG_STREAM_VBI_FMT <v4l2-mpeg-stream-vbi-fmt>`
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
index b6cfc0e823d2..ccd439e9e0e3 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
@@ -64,17 +64,12 @@ FM_RX Control IDs
     broadcasts speech. If the transmitter doesn't make this distinction,
     then it will be set.
 
-``V4L2_CID_TUNE_DEEMPHASIS``
-    (enum)
-
-enum v4l2_deemphasis -
+``V4L2_CID_TUNE_DEEMPHASIS (enum)``
     Configures the de-emphasis value for reception. A de-emphasis filter
     is applied to the broadcast to accentuate the high audio
     frequencies. Depending on the region, a time constant of either 50
-    or 75 useconds is used. The enum v4l2_deemphasis defines possible
-    values for de-emphasis. Here they are:
-
-
+    or 75 microseconds is used. The enum v4l2_deemphasis defines possible
+    values for de-emphasis. They are:
 
 .. flat-table::
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
index 04c997c9a4c3..cb40cf4cc3ec 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
@@ -104,7 +104,7 @@ FM_TX Control IDs
 
 ``V4L2_CID_AUDIO_LIMITER_RELEASE_TIME (integer)``
     Sets the audio deviation limiter feature release time. Unit is in
-    useconds. Step and range are driver-specific.
+    microseconds. Step and range are driver-specific.
 
 ``V4L2_CID_AUDIO_LIMITER_DEVIATION (integer)``
     Configures audio frequency deviation level in Hz. The range and step
@@ -121,16 +121,16 @@ FM_TX Control IDs
     range and step are driver-specific.
 
 ``V4L2_CID_AUDIO_COMPRESSION_THRESHOLD (integer)``
-    Sets the threshold level for audio compression freature. It is a dB
+    Sets the threshold level for audio compression feature. It is a dB
     value. The range and step are driver-specific.
 
 ``V4L2_CID_AUDIO_COMPRESSION_ATTACK_TIME (integer)``
-    Sets the attack time for audio compression feature. It is a useconds
+    Sets the attack time for audio compression feature. It is a microseconds
     value. The range and step are driver-specific.
 
 ``V4L2_CID_AUDIO_COMPRESSION_RELEASE_TIME (integer)``
     Sets the release time for audio compression feature. It is a
-    useconds value. The range and step are driver-specific.
+    microseconds value. The range and step are driver-specific.
 
 ``V4L2_CID_PILOT_TONE_ENABLED (boolean)``
     Enables or disables the pilot tone generation feature.
@@ -143,17 +143,12 @@ FM_TX Control IDs
     Configures pilot tone frequency value. Unit is in Hz. The range and
     step are driver-specific.
 
-``V4L2_CID_TUNE_PREEMPHASIS``
-    (enum)
-
-enum v4l2_preemphasis -
+``V4L2_CID_TUNE_PREEMPHASIS (enum)``
     Configures the pre-emphasis value for broadcasting. A pre-emphasis
     filter is applied to the broadcast to accentuate the high audio
     frequencies. Depending on the region, a time constant of either 50
-    or 75 useconds is used. The enum v4l2_preemphasis defines possible
-    values for pre-emphasis. Here they are:
-
-
+    or 75 microseconds is used. The enum v4l2_preemphasis defines possible
+    values for pre-emphasis. They are:
 
 .. flat-table::
     :header-rows:  0
@@ -166,8 +161,6 @@ enum v4l2_preemphasis -
     * - ``V4L2_PREEMPHASIS_75_uS``
       - A pre-emphasis of 75 uS is used.
 
-
-
 ``V4L2_CID_TUNE_POWER_LEVEL (integer)``
     Sets the output power level for signal transmission. Unit is in
     dBuV. Range and step are driver-specific.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
index 7c3810ff783c..8c03aedcc00e 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
@@ -6,7 +6,7 @@
 .. _v4l2-pix-fmt-sgrbg12p:
 
 *******************************************************************************************************************************
-V4L2_PIX_FMT_SRGGB12P ('pRCC'), V4L2_PIX_FMT_SGRBG12P ('pgCC'), V4L2_PIX_FMT_SGBRG12P ('pGCC'), V4L2_PIX_FMT_SBGGR12P ('pBCC'),
+V4L2_PIX_FMT_SRGGB12P ('pRCC'), V4L2_PIX_FMT_SGRBG12P ('pgCC'), V4L2_PIX_FMT_SGBRG12P ('pGCC'), V4L2_PIX_FMT_SBGGR12P ('pBCC')
 *******************************************************************************************************************************
 
 
@@ -20,7 +20,7 @@ Description
 These four pixel formats are packed raw sRGB / Bayer formats with 12
 bits per colour. Every two consecutive samples are packed into three
 bytes. Each of the first two bytes contain the 8 high order bits of
-the pixels, and the third byte contains the four least significants
+the pixels, and the third byte contains the four least significant
 bits of each pixel, in the same order.
 
 Each n-pixel row contains n/2 green samples and n/2 blue or red
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
index 3572e42adb22..f4f53d7dbdeb 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
@@ -24,7 +24,7 @@ These four pixel formats are packed raw sRGB / Bayer formats with 14
 bits per colour. Every four consecutive samples are packed into seven
 bytes. Each of the first four bytes contain the eight high order bits
 of the pixels, and the three following bytes contains the six least
-significants bits of each pixel, in the same order.
+significant bits of each pixel, in the same order.
 
 Each n-pixel row contains n/2 green samples and n/2 blue or red samples,
 with alternating green-red and green-blue rows. They are conventionally
-- 
2.39.5


