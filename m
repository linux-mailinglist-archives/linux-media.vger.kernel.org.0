Return-Path: <linux-media+bounces-48205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32320CA24AA
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 05:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0315F30651BF
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 04:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9769A2E62A6;
	Thu,  4 Dec 2025 04:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rifU3N6H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097F51D6BB
	for <linux-media@vger.kernel.org>; Thu,  4 Dec 2025 04:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764821502; cv=none; b=JVamnjBGk6ghg8dChxlN1CUIaW/SxmyqnPxUK3ILPqRBMWYjXRAnjm2zL/WtLAJYNkSJbe8H/ssD6XkAPcvVMND0Otyiu9NGzRPzZ8RXxxAvScNaWX8HgMJK1gLZSreYS7LKbjw85IX6EUSepLPoGuVRYWKDsDg8kvCMxwXWuDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764821502; c=relaxed/simple;
	bh=eM9I/+Ky+Sqzc4/z4SR76vEmTf8sgGXLIdFST2JKdWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nojB231fpoLDLn1F0q5JGsyZtFrDqbDZMorjq6J2r3ZdH8wjWg7GGmfc3XIbih/M55j80oOKRiR+1p7ZVx+yWIfAjQEzBTPy1sOJf3bjnSN3644y/fV7P+ObY6qHWKosJjdzpJvlP3UEmWu5iM15Y+q/2swgT4+vP9n+SIGd89M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rifU3N6H; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59584766a77so62192e87.1
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 20:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764821498; x=1765426298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uOuBdn4a4Bu+jho4jgKZPwrXNWUdZd6O6w0QmANHY74=;
        b=rifU3N6H+IvW+7h9Asf3l15r/DZ1oskgIZsxSExrwy8vYNg5Y+1/4GzSw2Rqfnv+G9
         /Kzue52dpLvQYgqew608CW99CtmpmvVmLVdOG28Ie0OqZf+B3gNXVrRutK4XMpKjCTFG
         Rd7d+3m2NQ77atU0WIIlOCqnKJAbx3tk0rhmzAxmaPIuD28FJeL1EH9z0uMdCB+Byvx6
         JsEL/cTqjjj3plS1AqiCY2ebThBykTLqNAupvxsOlfWhE8GyLAnZBPZjTixq6OWjOBJ6
         qwTv+0CkDqyMJNDV3gNjXeB05M/X1Z/Lfd8pUVkUe+vdzcDhsxHo4RGQRbc481mh/jP3
         6/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764821498; x=1765426298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOuBdn4a4Bu+jho4jgKZPwrXNWUdZd6O6w0QmANHY74=;
        b=nxe2OjsHBqWfP0mZH6OITbxMj1emWe0p7/tzTuPDgDNF4e+62DcxSK4AvkVNx/CDsX
         DMcs4PbomRnDLRNGP3ay4Aq5ZIs+ZINA2YScoN7CFznHqHUCoBblSXR+88b3mHG6Niyp
         iniELEwr557ob5jTJyvWokIfquEFEK/3dFuL720nnoGhPj73WNUto/smQSDOM8dVVgo5
         yiIRaO2IMbCZh036y49BQrmJQ6IhiI993jTDvhe8FHRWAKGjyA66GbwUeptOyDBMlkLb
         wcIt25chO9EIDNbSol+H9S8XsoqAFjUic2e3c5tZ4uekigF4DMDmWIv2gzhqa4KP0sGu
         tlwA==
X-Forwarded-Encrypted: i=1; AJvYcCWrblulSM2BYMOpuPwE/1jmXTQAqbkKviVM/WjI810+ohFRezOkNtopiTx62yPN8AbPJBL9L2kE+rC0lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPjEfM+CfIm0N9fl0bxFYDgyc/ZwXWyTi0275v6z+R7Lw+qlcd
	znThfmP+uzGfIQ5xwm4/D0uDIXHLGbzDQ6zZ/Mg/QsQtJSkVs3lIqqrLlhOpT5EdxZg=
X-Gm-Gg: ASbGnct0ueTY9x1AjHzrIUXbcgj7r9U2hc0q8kkA/rXVKe+RArrcBv7GSF0NKHWgvoh
	MbSYDT07AktqgNOxrCZgHfmVvzFO342+1G9D/Eks4pPEbVANA703vU/AgE3PEe4wBXWevwv6YIB
	uTXnf1jxfui3vZHO2PCDUd1ke8aSomlnGxcW7bClDN/Sd0UrRNGTfaKzMTwdvA/+ehUaBXSr/UM
	ycco6yk6Xrio+bl4r3ejXzLQ2w9YNzRueTu87N+ECA5JzStAWicN7CcYLWSN95SdJvqxjM9XEtj
	2lJK6Tthi07QojX5zBPNvFu1rpSTm9CVTdSZGJ8/iNp4Q9NRVsvlcty04qt2UfTUg/yaWZlmWTP
	gggUA7LHuiueneQIdbo82Jf1Fyr8vOFNRi5QC25pT/X4qR7BBOA4bgzGWFzI9ctmXR453agkqx3
	ws75KfUxCf06HMZANG91ksrexGHUyv/vFWv6VNhQMWJs7uXUfc1WtwbSwCK+wK9Uru
X-Google-Smtp-Source: AGHT+IEbWOOb3mwV9TkTurbc6MKjci3Oq32RbcS6zeXERQUM+wscZl+ijWfyH5GXJ1WqQXCERNokjw==
X-Received: by 2002:a05:651c:549:b0:37d:1585:4056 with SMTP id 38308e7fff4ca-37e63978975mr7989161fa.6.1764821497880;
        Wed, 03 Dec 2025 20:11:37 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e6feba575sm1984031fa.21.2025.12.03.20.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:11:37 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/2] media: i2c: add Samsung S5KJN1 image sensor device driver
Date: Thu,  4 Dec 2025 06:11:32 +0200
Message-ID: <20251204041134.131707-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung S5KJN1 is a 50MP image sensor, it produces Bayer GRBG (2x2)
frames in RAW10 output format, the maximum supported output resolution
is 8160x6144 at 10 frames per second.

Changes from v3 to v4:
* added Tested-by tag from v2 of the series (Neil),
* renamed voltage supply properties to match pad names by Samsung (Luca),
* replaced regulator bulk operations with the explicit power on/off sequences (Luca),
* set a default number of CSI lanes explicitly in the driver code (Sakari, Bryan),
* added a blank line before a commented line (Bryan).

Link to v3:
https://lore.kernel.org/linux-media/20251023025356.2421327-1-vladimir.zapolskiy@linaro.org/

Changes from v2 to v3:
* made data-lanes property optional and described its supported value (Sakari),
* removed a macro over a number of supply regulators (Sakari),
* simplified a function to calculate pixel rate from lane frequency (Sakari),
* added a error check in s5kjn1_set_pad_format() (Sakari)
* added a trivial function to get crop rectangles (Sakari),
* minor changes in s5kjn1_probe() function (Sakari).

Link to v2:
- https://lore.kernel.org/linux-media/20251016020419.2137290-1-vladimir.zapolskiy@linaro.org/

Changes from v1 to v2:
* added a collected Reviewed-by tag to the dt bindings documentation (Rob),
* managed to get one PLL setup to cover both supported output modes,
* vflip/hflip sensor controls swap media bus code of Bayer patterns,
* extracted a common initialization subsequence of modes into its own array,
* set a step to the analog gain control like it's done in downstream,
* reworded a sequence of CCI commands in s5kjn1_enable_streams().

Link to v1:
- https://lore.kernel.org/linux-media/20250928200956.1215285-1-vladimir.zapolskiy@linaro.org

----8<---- V4L2 compliance results (v4l-utils-1.20.0) ----8<----

% v4l2-compliance -d /dev/v4l-subdev28
v4l2-compliance SHA: not available, 64 bits, 64-bit time_t

Compliance test for device /dev/v4l-subdev28:

Required ioctls:

Allow for multiple opens:
        test second /dev/v4l-subdev28 open: OK
        test for unlimited opens: OK
        test invalid ioctls: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev28: 41, Succeeded: 41, Failed: 0, Warnings: 0

----8<----

Vladimir Zapolskiy (2):
  dt-bindings: media: i2c: Add Samsung S5KJN1 image sensor
  media: i2c: add Samsung S5KJN1 image sensor device driver

 .../bindings/media/i2c/samsung,s5kjn1.yaml    |  103 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/s5kjn1.c                    | 1487 +++++++++++++++++
 5 files changed, 1609 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
 create mode 100644 drivers/media/i2c/s5kjn1.c

-- 
2.49.0


