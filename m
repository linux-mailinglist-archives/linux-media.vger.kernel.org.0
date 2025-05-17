Return-Path: <linux-media+bounces-32686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB1FABAA5C
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 15:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8697B9E6767
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E95F1FC0F3;
	Sat, 17 May 2025 13:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlzlMFS7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ED58460;
	Sat, 17 May 2025 13:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747488461; cv=none; b=qlAswOyJRnRzDJ8MVn/HXmpidY0eIaU72s5suBFfBNrQETob9ybroKSVtbsO2NdlLSpBsjTEG51ih8MBCt7KJ0mkO4OW9Q9NIXkiVLY9FjjQDAHfn9Rn0H0wEbSz/V9JERMqi0UYiBzLn+CcbfTp9e39Huc7iTITuGEfovTciRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747488461; c=relaxed/simple;
	bh=G0JdZy82lcPgNZMQuM+5P8kElr2CLcwOkMj6rCW0RAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sdRTFZ0C/1O4QJtqQW69tFOagN/Ke8mkoDZlt0ySZIgdMBmBe09s0AxSs+GQdaTwee7WK8ZdNUZEQVSYYh5TUsKf0JpoRhGkWzLls3XsH1U9Q3rOgPqxuxS+JSqfwIthSDIXVxH9XgMmj16CQVdJpY0XCjHSaNH1uqq53WIQ1yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlzlMFS7; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54298ec925bso4464759e87.3;
        Sat, 17 May 2025 06:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747488458; x=1748093258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEzcavgwumL+wdstWDYcw1ZHsLoqx0bgj1Z6uEiJjGM=;
        b=LlzlMFS77TO2X+D4+1s1KOiXbnWYkYBQ2hprUAuTu7D6S74vx/Nreb7HZg1Hxapxo9
         /HE0ArtrIanIWZnTeIdsP7m+AD8HrGrw5t5dQAasu9dbFmQGRb2n31Y9rQOiled5TnqG
         01kgkpvRnD3Cu4GYpmK8va7qiZjnataO1G5GkvcikOz6qudq6j0GYVNBLaoQIo7UJVdT
         UU0+sojUBrdutbkmyB4sgFnGMnbFhcE0/Y4X2OIzisRsk07M4Ao3wISo8S98pYJS6z83
         +PBTZn3K01wWK1Ym0xSHWWa1uWz+5BxUVI6/HL7JLyG5RoMgdU5EspxCaIsMCzkeM1Uu
         XVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747488458; x=1748093258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEzcavgwumL+wdstWDYcw1ZHsLoqx0bgj1Z6uEiJjGM=;
        b=QL/d5NqV0xl+gAJ6U3O+luXcL4zonvLVMOTkJe2KAMPZghAp0D9/1FOz4Vfd6k768h
         uinKry11tIp2NekpExRINkCK4xl254RLBE2/ur8nOdQKW7BZ+ykhlAlUcXxVqGStoAC0
         3AxjUQtxcjIkH36yJ/kKKYkts9IoprQ4rHMsYocriTeBGOm0F8ZBtaJOx1NKtLQ5Mz3W
         nmED2iXu+QLpCdm9aHrRpDeJ5ixXqg7MDbucVhc15LIDlKDwBOVthm5Fj48zHfxw4HcF
         SXoTniF8Lvod9eFJCc6KWFRkj7+4H4r2K+/jHaVJRDb0HXkqEbXr52sGghraJHwO/Jwx
         cpLw==
X-Forwarded-Encrypted: i=1; AJvYcCWYB/mCx55DCDRPY3S6npAtFy3UrlkgnPbcpqHjzN53EL1akE4L4k439zuQKQUmEUeD97I8juiGIJycKck=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGzQxONPzHv5iztomtdberSq5PjdkVav5AWXhU78WhlRM9E/j1
	XUrvRFaYpsMegiWTZ9cm7dlpQxsNQUnIBctQ4faumGEKwfdhkbtZ8MMy
X-Gm-Gg: ASbGncs4WsUOEYgI0kebolpfslpv/q06DaOZ9u74OWAIJgyL7X+JoOGzrWa9P2rYLb7
	rF9/fUhAlKBHcFdCABnxbKek4arIwY5EIIvoSVVEvoJ4d7O6NYtjyV6aQZZa2+SsNmtAu7PMWW5
	ZubPnCfPFsPocY1Jz9Z87BT3JMA2/TQTDLDnHHrq/C8VUcyoJ7MQCOQUS6DL+77IAh6p9qhhKP4
	UrGlFTtUlU0daENgzIVeMKTcgmlkmGKUQNs/AQCkhZQVt7haS6TIqdL9lMJ0UvP50F5aqtSTP2D
	knY0X2K+X+ixMyZFN+O2IAeWpn16kA0u8mSdeE1k+iNij0XMI9WknFKc5RkFknr0UUb/JHTUENN
	57ptwezg5VGksErTVQ8kYUzSBXgbOJhNhsCs/r47s3FH2tZd0
X-Google-Smtp-Source: AGHT+IE6iF8G4ZUWMEJgAntJTBzXfbMKJs0muo78Cqkapq7KEggVPHZxcT+944xlqY+E1k4pZNRxUA==
X-Received: by 2002:a05:651c:111a:b0:327:fe4b:37e3 with SMTP id 38308e7fff4ca-328076ede16mr17738721fa.7.1747488457409;
        Sat, 17 May 2025 06:27:37 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-53-1500-40ac-27de-68f1-6ee7.rev.dnainternet.fi. [2001:14ba:53:1500:40ac:27de:68f1:6ee7])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf9f9sm8663501fa.94.2025.05.17.06.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 06:27:36 -0700 (PDT)
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
Subject: [PATCH 2/4] docs: Improve grammar, formatting in Video4Linux
Date: Sat, 17 May 2025 16:27:09 +0300
Message-Id: <20250517132711.117618-2-hannelotta@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250517132711.117618-1-hannelotta@gmail.com>
References: <20250517132711.117618-1-hannelotta@gmail.com>
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
 .../userspace-api/media/v4l/biblio.rst        |  8 ++---
 .../media/v4l/dev-sliced-vbi.rst              |  4 +--
 .../media/v4l/ext-ctrls-fm-rx.rst             | 15 ++++------
 .../media/v4l/ext-ctrls-fm-tx.rst             | 29 +++++++------------
 .../media/v4l/pixfmt-srggb12p.rst             |  4 +--
 .../media/v4l/pixfmt-srggb14p.rst             |  2 +-
 6 files changed, 25 insertions(+), 37 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
index 35674eeae20d..c3f7c466e287 100644
--- a/Documentation/userspace-api/media/v4l/biblio.rst
+++ b/Documentation/userspace-api/media/v4l/biblio.rst
@@ -53,7 +53,7 @@ ISO 13818-1
 
 :title:     ITU-T Rec. H.222.0 | ISO/IEC 13818-1 "Information technology --- Generic coding of moving pictures and associated audio information: Systems"
 
-:author:    International Telecommunication Union (http://www.itu.ch), International Organisation for Standardisation (http://www.iso.ch)
+:author:    International Telecommunication Union (http://www.itu.ch), International Organization for Standardization (http://www.iso.ch)
 
 .. _mpeg2part2:
 
@@ -63,7 +63,7 @@ ISO 13818-2
 
 :title:     ITU-T Rec. H.262 | ISO/IEC 13818-2 "Information technology --- Generic coding of moving pictures and associated audio information: Video"
 
-:author:    International Telecommunication Union (http://www.itu.ch), International Organisation for Standardisation (http://www.iso.ch)
+:author:    International Telecommunication Union (http://www.itu.ch), International Organization for Standardization (http://www.iso.ch)
 
 .. _itu470:
 
@@ -131,7 +131,7 @@ ITU H.265/HEVC
 
 :title:     ITU-T Rec. H.265 | ISO/IEC 23008-2 "High Efficiency Video Coding"
 
-:author:    International Telecommunication Union (http://www.itu.ch), International Organisation for Standardisation (http://www.iso.ch)
+:author:    International Telecommunication Union (http://www.itu.ch), International Organization for Standardization (http://www.iso.ch)
 
 .. _jfif:
 
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
index b6cfc0e823d2..565157709911 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
@@ -35,7 +35,7 @@ FM_RX Control IDs
     description of the correct character encoding for Programme Service
     name strings. Also from RDS specification, PS is usually a single
     eight character text. However, it is also possible to find receivers
-    which can scroll strings sized as 8 x N characters. So, this control
+    which can scroll strings sized as 8 x N characters. Therefore this control
     must be configured with steps of 8 characters. The result is it must
     always contain a string with size multiple of 8.
 
@@ -49,7 +49,7 @@ FM_RX Control IDs
     Radio Text strings depends on which RDS Block is being used to
     transmit it, either 32 (2A block) or 64 (2B block). However, it is
     also possible to find receivers which can scroll strings sized as 32
-    x N or 64 x N characters. So, this control must be configured with
+    x N or 64 x N characters. Therefore this control must be configured with
     steps of 32 or 64 characters. The result is it must always contain a
     string with size multiple of 32 or 64.
 
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
index 04c997c9a4c3..aa509039bd27 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
@@ -41,7 +41,7 @@ FM_TX Control IDs
     description of the correct character encoding for Programme Service
     name strings. Also from RDS specification, PS is usually a single
     eight character text. However, it is also possible to find receivers
-    which can scroll strings sized as 8 x N characters. So, this control
+    which can scroll strings sized as 8 x N characters. Therefore this control
     must be configured with steps of 8 characters. The result is it must
     always contain a string with size multiple of 8.
 
@@ -55,7 +55,7 @@ FM_TX Control IDs
     E of :ref:`iec62106`. The length of Radio Text strings depends on
     which RDS Block is being used to transmit it, either 32 (2A block)
     or 64 (2B block). However, it is also possible to find receivers
-    which can scroll strings sized as 32 x N or 64 x N characters. So,
+    which can scroll strings sized as 32 x N or 64 x N characters. Therefore
     this control must be configured with steps of 32 or 64 characters.
     The result is it must always contain a string with size multiple of
     32 or 64.
@@ -94,8 +94,8 @@ FM_TX Control IDs
 
 ``V4L2_CID_RDS_TX_ALT_FREQS (__u32 array)``
     The alternate frequencies in kHz units. The RDS standard allows for
-    up to 25 frequencies to be defined. Drivers may support fewer
-    frequencies so check the array size.
+    up to 25 frequencies to be defined. Because drivers may support fewer
+    frequencies, check the array size.
 
 ``V4L2_CID_AUDIO_LIMITER_ENABLED (boolean)``
     Enables or disables the audio deviation limiter feature. The limiter
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


