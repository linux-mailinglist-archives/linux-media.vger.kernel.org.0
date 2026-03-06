Return-Path: <linux-media+bounces-54721-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJBHCUGuqmluVQEAu9opvQ
	(envelope-from <linux-media+bounces-54721-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 11:36:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B40A21EDDD
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 11:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8CB583008445
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 10:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCB6361DAB;
	Fri,  6 Mar 2026 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaf2w4mh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C5236309A
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 10:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793399; cv=none; b=BVSm3nOCKcBzjOHlVt20wRIzqeztc9w5BhxUhLVq6mhc7GHi2FSQ+x5KV1xlSbdWEuiQ5z6U9detSY7wORPIkENkgy015N6MF3tU2E1lzckLevY4uaRY14MJQkbvlcCX4CYtRnpD+gr/pM/qrkkowcWTLsK3MDNr4b9ENEFFGCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793399; c=relaxed/simple;
	bh=aaWtfuMIlwXcj8wRx+r/8nYmCfr9QmP6cTAQtbDeFr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jZgaTvwTU+4T3TKUCOA9KSmJ4JZCine6e4mh0T4fdk1XueaJY73fXq1Quh3oAteI0wmhdljmuhA44QdKSb7sBeT0vvpRk2X+WMzDe2o+4vb2I69LcAN7WLMQaNNcdJ/6Uvu2THIFdR4nJ4OucgXTQg08v4w22QSfmKU3ItGiQVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaf2w4mh; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a12c19affeso2156785e87.1
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 02:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772793396; x=1773398196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zJml/yLnnjSPJKQY6M87aIBCO5slyXTHcl3eiCEqAKo=;
        b=iaf2w4mhwsidB2Rl0k+o1Qu4n5Y6jdozW87OWU7ut0Hi1RObel7zpYAMgDrIuFojGC
         UV7JOoZ32pEIdecru5g6bix+Ig3DfEhnyonjU/xR3gvZnMcjye+G53xjGr8K8ZKdKTQF
         426s3VungCSGv5mzjL2Uy0TRuEwQdHfHmqP80oUI46TI0Nji/AGjB3QsI3RMdjbpi4mn
         IrRKkKhJUbUhGq3wA0HyHnHAe1KBBJ0xvBQQ8p3Xi/547a++BafaaTVLe3JElG6Dqurb
         tEFdCT7gmGcLQNZ84ayaelljgyiQb+Mc0h1wvCps9NZp1uVjo0Sm6BYRApbyRKWLeRtx
         eeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793396; x=1773398196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJml/yLnnjSPJKQY6M87aIBCO5slyXTHcl3eiCEqAKo=;
        b=iS4zUPAEvhR9VM+ShL+iv5ceHpbfZvD68JqQpxn4KDKzqQqbhjMne/eojUkzRQhsVV
         7kxYyWa5TQ9W3aYW7wKPSErlqBmwPWkg20xdCpvTqpeWzaJXUtZORynY4im5Mt7XFPhH
         qwGniUfz788uOWpWxbmNZ/D6rOAHnJWrrSrWwAr4PpzLPPVW7xCvwNaN3q+AFK41V7Zb
         kcyc19WhMANkPmWkmJWF0y9QAAXSW5w3xNmoEfVy/GHvzonvLnOY6Jb0tT8e2DbzEICT
         baFD0bJSgtFoG9lvQogHZOmSq+F6oEOjKn+JWA8iBs1pfjvmgVtQoPOYaypGSIPg+hQt
         3ytw==
X-Gm-Message-State: AOJu0YzC3kF/B1IUW91ARG7r/lVHB9EJqTYL0ayBe3sX1SRJ4j3i4JVK
	FDgIPxNTKdAQSWlLwQdEt29ORtGcRjAvjiAxShRHaYNIXLm2x3vdoRx1UEf9Y0hq
X-Gm-Gg: ATEYQzzqr0kQg2seP8Oz2CJhaOaBHfBEs3UZLeAfmphTe0Fcm48QG3iCSbHgwUVbxJa
	/D/729sNZLR+nvMcgG9KGpSr0m9qa3Ragbni2iu98rGrlnFApZyOV4PDo9oZT8dQGW0QfvYsSrm
	iPRb/8hS9YtfUwJLGsbp0UKw5TgjtNdNaoPCRm4tbBgChI7FppHpCnhWUtQanJNNBSLWLpvdR75
	EU3rqk+mSmaHdHw/2l3IOKTGNJzPtPoJkWCyDymALh1T568+xRVaVKmHsuCnK9PlzEB0zfQ2aVX
	t8kZxz7FFPc1QPv2Ky5xBO3VT6Sw4XbVTcvKfIt/Kr1bNPiaggTp5Vse14HZInhjAFAa3oyAIYV
	ocui3FdU8sGwbXENXabwyET/N9S38ztQAtjiE0SCm2F/58eyr6t0aV2lxsrQGw6C9NQarPuGJsd
	Vj5w6J99bQAK5JKKPzLf/fzOPhgWWXPgrseQmYPXU=
X-Received: by 2002:ac2:5694:0:b0:5a1:1de6:bc66 with SMTP id 2adb3069b0e04-5a13c93d9e3mr562049e87.18.1772793395649;
        Fri, 06 Mar 2026 02:36:35 -0800 (PST)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d03da54sm258243e87.40.2026.03.06.02.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:36:33 -0800 (PST)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [RFC PATCH v3 0/2] media: i2c: Add onsemi AR0234 camera sensor driver
Date: Fri,  6 Mar 2026 13:36:12 +0300
Message-ID: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2B40A21EDDD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-54721-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,raspberrypi.com,intel.com,vger.kernel.org,kernel.org,linux.intel.com,oss.qualcomm.com,linaro.org,foss.st.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

This series adds a driver for the onsemi AR0234 CMOS image sensor.
The AR0234 is a 1/2.6-inch global-shutter sensor with a 1940x1220
pixel array, capable of 1920x1200 resolution at up to 120 fps.
It supports MIPI CSI-2 output with 1 to 4 data lanes, raw Bayer
(8/10-bit) and monochrome formats, as well as DPCM 10->8 compression.

The driver has been tested with 2 and 4 lanes on an ARM64 Rockchip
RK3568 platform with a 27 MHz external clock. Both 8-bit and 10-bit
raw Bayer modes are functional.

Notes:
- 1-lane mode is currently disabled; attempts to use it produced no
  valid image. Further investigation is needed.
- The driver uses a private streaming flag to protect cropping changes
  during streaming. Is this the recommended approach, or should we
  rely solely on the subdev state?
- The DPCM (10->8 compression) mode is included in the code but could
  not be tested due to lack of suitable hardware; any testing help
  would be appreciated.

Changes since v2:
- Added devicetree binding documentation for the onsemi AR0234 sensor.
- Added support for 8-bit raw Bayer output (verified working).
- Added DPCM 10->8 compression mode (untested, included for
  completeness).
- Reworked mode handling: each mode now specifies input/output bpp,
  DPCM flag, MIPI data type, and link frequency index.
- Reworked link frequency handling: the driver now accepts any valid
  link frequencies from the device tree. It expects two frequencies -
  one for 8-bit mode and one for 10-bit mode - but does not enforce
  a fixed set; frequencies are validated by attempting PLL calculation.
  This makes the driver compatible with a wider range of system
  configurations.
- Updated ar0234_calculate_pll() to use a temporary structure and
  update cached PLL only on success.

Changes since v1:
- Improved error handling: use cci_write() with &ret chaining for
  sequential register writes, as suggested by Isaac Scott.
- Refactored format and cropping support:
  Replaced static format list with dynamic cropping rectangle
  (struct v4l2_rect crop).
  Implemented get_selection and set_selection for V4L2_SEL_TGT_CROP,
  allowing runtime selection of the active sensor area.
- Migrated to modern streaming model: replaced s_stream with
  enable_streams/disable_streams using v4l2_subdev_s_stream_helper.
- Corrected blanking constants: replaced ambiguous AR0234_HBLANK_DEF
  with AR0234_LINE_LENGTH_PCK_MIN; updated min/max ranges.
- Added ACPI match table (untested).
- Style fixes.

Any further comments or test results would be greatly appreciated.

Alexander Shiyan (2):
  dt-bindings: media: i2c: Add onsemi AR0234 image sensor binding
  media: i2c: Add onsemi AR0234 image sensor driver

 .../bindings/media/i2c/onnn,ar0234.yaml       |  109 ++
 drivers/media/i2c/Kconfig                     |   12 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ar0234.c                    | 1309 +++++++++++++++++
 4 files changed, 1431 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
 create mode 100644 drivers/media/i2c/ar0234.c

-- 
2.52.0


