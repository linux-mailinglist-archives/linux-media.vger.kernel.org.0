Return-Path: <linux-media+bounces-41876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFD1B46635
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 23:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 051D03BF20F
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 21:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68402F28E9;
	Fri,  5 Sep 2025 21:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ildhq7pX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE432DCF5F;
	Fri,  5 Sep 2025 21:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757109336; cv=none; b=B+nZ4V0/QXkdMyNqRFjtLNQb2tQ0bovC+WUSkQxTpTde/aJI5cyJU00rj7pD82sd5PPo62KKf9TpDMzHkbpkgZBsC4io2oNyVKa1+NJI0Uiw40TZa0xEEBY5FSqM/xKr5gBfBhPzQKtg/Vwfi730SNtdqVHNWk6Fh3qygLtWm6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757109336; c=relaxed/simple;
	bh=cYqPi1Z6IVaPvGjCa6IuqRllsGq/ootMKJ1Z3V1Jc/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m6cPIcnzRLZG6BqHphXkyiDgE0sd0TLTwF83NWMoCxKpzHtH6afkrX3swvDV0+AJbAizx51nrAlLc53co+K20Fy5Gy/DSoUQ4eldCIbi0VAMMWQXO90W9+VS22hKnATjh2iuw6tU+sf9Wy3Il/D0j/cUbSTi80YcEaAPR15JDzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ildhq7pX; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-7240eb21ccaso27537296d6.0;
        Fri, 05 Sep 2025 14:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757109333; x=1757714133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=by+8F+anZTxCA7oR1eWPQaNsp7sK68gCNn3HzHRj2Jg=;
        b=ildhq7pX7nH8qS2gmkRdoHz6tdAYyiPhCfFZovqz9CgklVU194gdRqYKGjngfqelOO
         8nSzPE1Cs6QQ4xi6eaJ4vsGemYcdqNWpmUITnsUN2iJyvBpqamNItcSsqY3m+EFLa3ge
         fT+/lVE1qkFAHCo27olZGM+H5OBQyZuwoPzdMB8Xj/ImQJdjGJHRIFparvLgrnluy6hX
         HmKrMS8wpvJGrsRE3L7WCHlDEGzIjdk0NAndCxKgwOVRkXRGzDrxpVQxAkkjRS5UpkSB
         TDCHpQHqGaK5Qyiv3YtIUtIEulU6kbBjccdPQmXjmXTuKjQbo5Xbew1EcqJuKWoklg18
         JrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757109333; x=1757714133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=by+8F+anZTxCA7oR1eWPQaNsp7sK68gCNn3HzHRj2Jg=;
        b=XxaqgFbmtKZyQBGYAMiA1VPtcKemn2SlwM+S06zfGEegNkdSNbqgXAl7LMN+hpBIbV
         iXOLS5S910aG+FW0hZeHB49Piet5qbkZV4gldfO3ISzu5z1QEehL/6k6k4acs/ahqJl+
         izeo2OMLxrfuAZH4kPNT1MTgQMhEyAc9nYEyPhkVXyOt4Pru6E/6pSCtoAm5lYDNYgCn
         NFTAS2+/440lrL2+JTq9S54GXKQJIJx1WYyw0jUEGZSKlIWQMLsJb4f9nawA/36XkoV9
         5dNbouvMwNgY65pAJgal95Umr1wrL0iGkImbZN2QulH8zyim29925WSiTq8MX4fSOgFh
         Ikug==
X-Forwarded-Encrypted: i=1; AJvYcCU7V7muUgV6VmMnxA7/O6Rw+3mJzuADBQXDCfQHBpLGxycy04Mc5AefgeA4gYpU3qDzRO/9I/uve1JJ@vger.kernel.org, AJvYcCWY0FZr+M2v3LFw4g06COSt49vIOtA3T6y74OzPEptXWTY2IQKNTDjaBr9rVwHqx6x/I0J5OLZyyKXulmGPfA==@vger.kernel.org, AJvYcCXx8Jt//iuE+lxqP1ADUpd7cKzklNpjHl9zfwpy0sID6QYuQx3u7PLjNKLStMiKxxbXAaItK3ufGKIRMJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM6zBaOryr859oU4Fr0fLSfo89sN4fam3N/5Ss5ZEsRAnxSj56
	eZqnLQB0at76oBZ7Yi1ueuuAD/JsbK867DnTMUeW3wM9qHPVD2aFIlEe
X-Gm-Gg: ASbGnctVq1TwNfsizCbbUTadYCukvrb7pMgtVXQpnGvsDP4ZU7ayDHoMjpN6+BOvcBc
	BQWd9Lif89JdRxDEAagC2Ki1QjEmjVPc2wUWQZWTpj3IqX0LjHh7Gr3XilS2s2JZEIGyzFhsdff
	N4XAe18yjjNmxu37+K7BoTp5jImKPAyerEVKlOttT42BNVofGwuh29FXKR46ClK2IzEkYd/YAup
	Z3mavBPOWGwwKA9dq4WZqBb1qGvyUR1YmfZv/kQd/fMgw09wC2efETIQabCOTXSHd4BwDtcT6kW
	MKJ/stzpPIbA77bK2i4deDgH3JJBPNCUVv3b++acfebfqQ4kp86QjU0DXlXN3CMxBXzIHbV1P4z
	xnyS+yJ5UYVmvSb4yv6P5kJBuYw==
X-Google-Smtp-Source: AGHT+IGegbV+ZSDfsNB2/X+BJ1NfsL20gwhrgoUVOJZT1GoyWZM5jwyKDs3DP8o4W18Gbr38NVBZBw==
X-Received: by 2002:a05:6214:ca6:b0:70d:f55f:ef97 with SMTP id 6a1803df08f44-72bbdcead63mr58138406d6.1.1757109332115;
        Fri, 05 Sep 2025 14:55:32 -0700 (PDT)
Received: from localhost ([174.89.105.238])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-727f26995desm43379716d6.48.2025.09.05.14.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 14:55:31 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 0/4] media: i2c: IMX355 for the Pixel 3a
Date: Fri,  5 Sep 2025 17:55:17 -0400
Message-ID: <20250905215516.289998-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the IMX355 in devicetree and adds support for the
Pixel 3a front camera.

Changes since v2 (https://lore.kernel.org/r/20250714210227.714841-6-mailingradian@gmail.com):
- use devm_v4l2_sensor_clk_get (2/4)
- require supplies and clock-names (1/4)
- move unevaluatedProperties down (1/4)
- disable clocks as last power-off action (2/4)
- use 0 in gpio pin power-supply (4/4)

Changes since v1 (https://lore.kernel.org/r/20250630225944.320755-7-mailingradian@gmail.com):
- too much to have a complete list (1-4/4)
- squash camera orientation patch (4/4, previously 5/5)
- squash driver changes (2/4, previously 3/5)
- remove labelled endpoint node in sdm670.dtsi (3/4, 4/4)
- change init sequence to match other similar drivers (2/4)
- retrieve clock frequency from devicetree-defined clock (4/4)
- remove clock-frequency from dt-bindings (1/4)
- remove redundant descriptions of child nodes (1/4)
- switch initial drive of the reset GPIO to low (2/4)
- set mclk frequency to 19.2 MHz (4/4)
- add vdda-pll supply for camss (4/4)
- use common power on and off functions (2/4)
- use devm_clk_get_optional (2/4)
- remove extra layer when describing mclk pin (4/4)
- rename regulators (1/4, 2/4, 4/4)

Richard Acayan (4):
  dt-bindings: media: i2c: Add Sony IMX355
  media: i2c: imx355: Support devicetree and power management
  arm64: dts: qcom: sdm670: remove camss endpoint nodes
  arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera

 .../bindings/media/i2c/sony,imx355.yaml       | 112 +++++++++++++++
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 116 +++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  12 --
 drivers/media/i2c/imx355.c                    | 135 ++++++++++++++++--
 4 files changed, 350 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

-- 
2.51.0


