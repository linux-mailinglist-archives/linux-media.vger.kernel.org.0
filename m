Return-Path: <linux-media+bounces-60105-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJFOHNKa82kQ5QEAu9opvQ
	(envelope-from <linux-media+bounces-60105-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 20:09:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECF24A6B5F
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 20:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 68BA4300C0C1
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 18:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840C247A0B4;
	Thu, 30 Apr 2026 18:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBLrPH1y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCFE44D696
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 18:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777572557; cv=none; b=id0VuAABXKbQT7OFBEZ2Dn5StXrscMUFeTf2cVSi6YkDNfwao5bBbXvkTCCqP92fypDXo8ivkOm2rrxztI8PPy6jPHzceoLOK30AjXKTKPTg5WohvcEnilwTVX1y4DlPXVvEOgh42KI2IZbImwB6npkrT7x1yHbNbREFlJaNy3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777572557; c=relaxed/simple;
	bh=VXkbqPKO4qZPRHSbqS7kvLNOxopljNB7WO8rURb5MO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h56FGalhvHO6gBmCRMmP3CsBXjFQL8MqJ4joVSmtPadWI0pkg3X2JHeaZD/9A9+IXSL74OrCt1zwXzBNCX4F3/tas7haGxfk8r+B4BBAaabz379xgywAacU99IJTw3iPrG3+q8mn25j9pQeCWxvNfL3MBM4RP7+lEg/zmqybjPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBLrPH1y; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8f83efb5729so135388385a.1
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 11:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777572554; x=1778177354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t8cPDmpSFOQtey/9Ljj5/074skBZju2AdaWUz5tcdlo=;
        b=CBLrPH1y6hNXZixhhMQiRyAolRHarNmzJkfqUpHUJxLn2I3LPrH0JiXm50OdXSFXUL
         vefQLNZXxlhH6N+HoCG+fUu9UWDxvbjWY6L8FXR+s1oRiN0OgLb68ewqUXOMJTE7sBGd
         vqkpmdKnFaQ6VddkpFsLJpUxAmxhH8zgaj0aOFXo7/RkMvEGVVR9BcWtVEUmkxpSEGa2
         WdaQV0gIwMj4p9jLQMedrGuZ13Q9NN2PB4cRM2DXiLl/j0JZa+t+v7JnTtj7DFl++EJ7
         KnAUJrwkeXsuMor7LiGWF2l5RgPIrt2H9X3H2dAL4Gu4sZh10PrgOj6bJfehSf6duTYz
         yjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777572554; x=1778177354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8cPDmpSFOQtey/9Ljj5/074skBZju2AdaWUz5tcdlo=;
        b=oEnpk/vzUmqfeh51o/VHGFyRpgdT1/UI0DNJuVI67MLxse9R3HUiRS7sm16Gvm2osh
         1Z1rt3DBfWHBD433pw/gWP40tvYkX1BL6UmMUVJ7FatC0XyfyNI9iiT+ktdcCI88zGgC
         bePNHTC0UeRj+m1ADIYtnaCxX+VD5NSRt1+OeJZ/EABtgkDxrxNijTdMbG52IbkN4NoC
         3SW0d0xjXRWVgHOJPqQYve2xqphiN+cBRwcxlGnpH6oKq8hVTNI7E4MN60M3s39yLQ1y
         d/y6mFbD5OCMyQEMTJixxOUtM7RfrehnTdC7N35a/uVg/sO8vh4Q4ewOvvomrhx8jduO
         Gawg==
X-Forwarded-Encrypted: i=1; AFNElJ+nM+HL1de03EAknttCcSWGIY9+QX1+33eDhU990tr4VvxcIOBT2kIJrQJx+FBEbfMcm0ho8vxD9yvQlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzynTC1LIiK1ZEpThAjySVqiQYT+BKkOq2xE5/114bDF/GnQGzb
	fjYAwgr+h2BMPyhEGQ7JDnbVUY6RNrn8HBNmBeD4HNSPWksxKgAjCf9Q
X-Gm-Gg: AeBDieuIDdixQrJLSKTE6XD2bMctOHCb2IqtN3GOrbmJAO0pauzT49r6EUJr/iqWhQ1
	SwygqaPnba9ChTa/aqg50QLaypfToyxIkb2PcKwgzQvl3leS+UtqAeUlIIgVU9jvZVt/zB4qHd1
	WOvO/Ni1tg0RZChoz2oxXTzg1XsKuPfgUbTR0Do2eLvpNUauXG19O4W41idyd4ujrJB0HAyHzeV
	jVk5xebpRyXGqrHPnclPYfR3R+kmrB94lKb1l7RBir2QbT7VazvvCeQck8DRMxfXxKpoJYUnQY+
	bJ7sY6AR93SFLB573tyIVoJ4qPjkRiZVlJBLGgrm4C1Opy3t5APQ91ZGJoQ0T10Mhc69Rq23I27
	0uW+eTrSeL1SZKd0iaGnQBFAkUM00eyaUTAwXoqf/VIB9vZHH9fOTb8+jbt/r4ZUv5fsoIZtCS7
	H5d35MWgZ7AE338LMCH2aeuAZ+FphdUWnSrVTDIhLHwydFxE1jOxXAb3J64CiZKC3mn39mBnqak
	Eg5xtzqlM5iT9f7LxEC+5pDgQ==
X-Received: by 2002:a05:620a:46a2:b0:8ec:9b8f:496a with SMTP id af79cd13be357-8fa8941ac26mr657960985a.51.1777572554197;
        Thu, 30 Apr 2026 11:09:14 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fbb4217728sm41887285a.40.2026.04.30.11.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:09:13 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v13 0/3] arm64: dts: qcom: sdm670-google-sargo: front camera support
Date: Thu, 30 Apr 2026 14:09:58 -0400
Message-ID: <20260430181001.9256-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1ECF24A6B5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org,collabora.com,ixit.cz];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-60105-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

This adds support for the IMX355 in devicetree and adds support for the
Pixel 3a front camera.

Changes since v12 (https://lore.kernel.org/r/20260331194437.41041-1-mailingradian@gmail.com):
- rebase onto v7.1-rc1

Changes since v11 (https://lore.kernel.org/r/20260324020132.8683-1-mailingradian@gmail.com):
- mention 24 MHz in mclk2 comment (3/3)
- drop applied patches (previously 1-4/7)

Changes since v10, 4/7 (https://lore.kernel.org/r/20260311020328.57976-1-mailingradian@gmail.com):
- add data-lanes to dts (everyone's review retained) (7/7)

Changes since v9 (https://lore.kernel.org/r/20260217002738.133534-1-mailingradian@gmail.com):
- reject zero data-lanes (4/7)

Changes since v8 (https://lore.kernel.org/r/20260210020207.10246-1-mailingradian@gmail.com):
- allow clock-lanes, but make it optional (1/7)

Changes since v7 (https://lore.kernel.org/r/20260117040657.27043-1-mailingradian@gmail.com):
- restrict data-lanes to 4 (4/7)
- include first patch (1/7)
- add back optional data-lanes in bindings (2/7)
- remove assert low on power on again (Bryan's review retained) (3/7)
- use dev_err_probe in power on (3/7)
- remove second error on probe power on (3/7)
- add review tags (2/7, 3/7, 7/7)

Changes since v6 (https://lore.kernel.org/r/20260107043044.92485-1-mailingradian@gmail.com):
- remove NAK from Krzysztof (3/6)
- assert reset GPIO on probe (3/6)
- change delays in reset sequence (3/6)
- remove __maybe_unused from OF match table (3/6)
- fix alignment for arguments to devm_regulator_bulk_get_const (3/6)
- remove front camera pin configuration (6/6)
- remove clock-lanes from camss endpoint (1/6, 6/6)
- remove data-lanes from camera sensor endpoint (2/6, 6/6)
- remove blank line at top of binding (2/6)
- add review tags (2/6, 3/6, 5/6, 6/6)

Changes since v5 (https://lore.kernel.org/r/20260107042451.92048-1-mailingradian@gmail.com):
- add Bryan to CC who added a Reviewed-by

Changes since v4 (https://lore.kernel.org/r/20251211014846.16602-1-mailingradian@gmail.com):
- add NAK from Krzysztof (2/5)
- label the camss ports (3/5, 5/5)
- define endpoint properties correctly (1/5)
- use devm_regulator_bulk_get_const (2/5)
- remove clock-names (1/5, 5/5)
- set reset GPIO as active low (1/5, 2/5, 5/5)
- explicitly drive reset low at start of sequence (2/5)
- make data-lanes in endpoint optional and start at 1 (1/5, 5/5)
- add mclk3 pin (4/5)
- add Reviewed-by's (4/5)

Changes since v3 (https://lore.kernel.org/r/20250905215516.289998-6-mailingradian@gmail.com):
- separate camera mclk pins and move to different patch (4/5, 5/5)
- remove polarity from rear camera pin (5/5)
- remove output-low from front camera pins (5/5)
- mention effects of dcf6fb89e6f7 ("media: qcom: camss: remove a check for unavailable CAMSS endpoint") (3/5)
- specify single clock-name without items nesting (1/5)
- rebase on 49c6ac166cf7 ("media: i2c: imx355: Replace client->dev
  usage") and eaa7d46d9654 ("media: i2c: imx335: Use V4L2 sensor clock
  helper") (2/5)
- do not use of_match_ptr for OF match table (2/5)
- remove redundant GPIO validity checks (2/5)
- describe endpoint data-lanes (1/5)

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

Richard Acayan (3):
  arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
  arm64: dts: qcom: sdm670: add camera mclk pins
  arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera

 .../boot/dts/qcom/sdm670-google-sargo.dts     | 100 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  46 +++++---
 2 files changed, 131 insertions(+), 15 deletions(-)

-- 
2.54.0


