Return-Path: <linux-media+bounces-30882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D22A99B69
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 00:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CC881B835DA
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 22:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679AE1F873F;
	Wed, 23 Apr 2025 22:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oTtJGmQW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085A81ACED3
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 22:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745446806; cv=none; b=cfWG2LPCLLMwP/M45DDZierjIY5XE8IbgUIpPhuxvTdr+vKz4p024bpMgGXjcx6x+EXTLfQR9wQLz4G+JcU66sVwJzC69lylnzkRDvWekmP2KLgxnlmUXSv446G9o2qzGRN63Wwc2hTdXeXtWj+mbhUCD/+IdvOQ28xZA9YZB5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745446806; c=relaxed/simple;
	bh=RSUTCU68FCqDB21S9KgT6s2cR6CgFEajX3jGLDzwP7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f+hiXdIbKwiLhRGYFy0TuHlP+ehiFK5OGmQqtjuOYtIL3/DZuJlRbAPvj7PnUdlJS9Dhet/odmiUqRQg5BucUg8PNZsHWUsZhl0Zoj87EgESdjVPqrwMR5BNLmKH90xBrhceQDHnvtvdGOkRSlfFkD1lADlQOJgPCrdFxFhyFiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oTtJGmQW; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54d72d40343so69080e87.3
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 15:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745446803; x=1746051603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxj8CXB8A0+AOQKhy0bB4YPelvc0XBl9NfkObhujdjk=;
        b=oTtJGmQWQ0VLHdMlEG+LMrD4Zen/p8q1yKUvRUaw4kmTP8gPjj3bpz08CSpvGwga2J
         MGGkGEJ1fAvGzKshLLyKsv2rJ5mdcZ8S8VeURL/kl3TgP61GZegVy3TCalGV2M9X8H1w
         2i7tI0y+W6j93rOtD2OWNN+0zSFlzemG6WsHs3WXLyImwdiJ5L0XUgdPIFXD/pZpYopD
         Nc2EPsPlqzwimZVRkVDGuOR19hgx2G20k3m8lvhpCvHtHOh/Kpe18RaobstfkE27EhDO
         T+z4ArtDLfaLVOgzOTONnj+5O2YXTuDeRmhtwcZ/q07ZUPfupFnwK5RA2Z607Hszy0Hi
         sKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745446803; x=1746051603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxj8CXB8A0+AOQKhy0bB4YPelvc0XBl9NfkObhujdjk=;
        b=rDpiSFKnOivdil5RQKoWx6wON9MCTN6j8mXWVNy3n0h1Zkg9M8h0XQ+83ToZZrcjAf
         u+Uun75UhqNMxY/V2OzjKGCSyTGZho2PvHuJi7a1XU27QXRdTVB8cwWejsjhK66Y575x
         296wP+sC7O4qz+B/mqNbnmR4Y1ElXtnP6nbAk2H5B462ca0WsIf6QRabc4+/SQD4CY+C
         BU4z5AKhN8mYtRmfMNBqit43vkjFzV5ABZR1KvrYDp1lvtjLxT+rly7I7wytQ1F70pHg
         DyeZsS3ArFvr/IP/aL03He8xmVYNnH19/1dWnvG+abUhMxY7Ur8NCr7diUDvmrOJclEY
         dikw==
X-Forwarded-Encrypted: i=1; AJvYcCU4TYPwyW4BxUKCMI6R+I/yanqimPDoPQHBRR+V1sR+rZ0AB8+M+Q3i/CxTZ3YFjbrdq2yh8w8cidNOhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTcZ0J4cRAMpXBMMKvJP3zt8rYMcCCP5qu+WPGGmXh8FyAVEVj
	RRD1kf4nlS3J2DoBEjwYYx/km1zkc01IV2tAy/M7mZ27+PXghp8ZBxwc2ZXZpaQ=
X-Gm-Gg: ASbGncuKpzKUFpfFqyKLizXndjMesKxZ05p9xZ3dssJ5PBRlpeUuU8qpzMsf3JP0PnC
	rcw6Qm+LkEaefmuGnPWOPyV6bsgj4caeYGzJpvIzlU4HVXFbo5nrbhnagWYEYldSBGiHWOl3vtE
	pBl/vnCWSZpY0b7lEeRQaW7mCmIGBp7msgz9cRskVaduTnxD1q3uE/o7Exj4f0B3PoevTGztyBE
	LAvfDL5YxgBkem7fnfmAsYEdi5tuMRF5X7ZD9foYWJhcggbtUvc0S24j6RtjASQxY+pxAa0wlip
	GwznHju+tAVy16xEKi5kkRGZZZwM8qnoXvlAI9ZceZrNpYYeSgCbsZPUrw4ivABTcHxmwPGRL8E
	BwXee2kbi5sCR19HlFqmqrhe6C5t5eA==
X-Google-Smtp-Source: AGHT+IHsSJlTpXY6Fa9RVsSz88cws7OogMJx6T/Q4T81Tfoj7+YH6RmAUw7WURekUDGf6SZSD2VAFA==
X-Received: by 2002:a05:6512:124c:b0:546:2f7a:38a9 with SMTP id 2adb3069b0e04-54e7c3e92e5mr63434e87.3.1745446803063;
        Wed, 23 Apr 2025 15:20:03 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb371a2sm19547e87.57.2025.04.23.15.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 15:20:01 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: qcom: sm8650: Add CAMSS device tree node
Date: Thu, 24 Apr 2025 01:19:51 +0300
Message-ID: <20250423221954.1926453-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm SM8650 SoC contains a camera subsystem IP, which is
got supported in the platform device tree by this change series.

Qualcomm SM8650 CAMSS IP contains of
* 6 x CSIPHY,
* 3 x CSID,
* 2 x CSID Lite,
* 3 x IFE,
* 2 x IFE Lite.

v1 version of the changeset:
- https://lore.kernel.org/linux-media/20250312001132.1832655-1-vladimir.zapolskiy@linaro.org

Changes from v1 to v2:
* to support a regex in port property names replaced 'properties' with
  'patternProperties', a sanity check shall pass now, thanks to Dmitry,
* added a few new line separators between property groups in sm8650.dtsi
  and qcom,sm8650-camss.yaml dt bindings documentation, thanks to Bryan,
* added the fourth interrupt cell value needed for v6.15, thanks to Neil,
* added a given Reviewed-by tag to one of the patches, thanks to Bryan,
* rebased for v6.16.

Vladimir Zapolskiy (3):
  dt-bindings: media: Describe Qualcomm SM8650 CAMSS IP
  arm64: dts: qcom: sm8650: Add CAMSS block definition
  arm64: dts: qcom: sm8650: Add description of MCLK pins

 .../bindings/media/qcom,sm8650-camss.yaml     | 394 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi          | 333 +++++++++++++++
 2 files changed, 727 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml

-- 
2.45.2


