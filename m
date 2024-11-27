Return-Path: <linux-media+bounces-22178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B739DA7F6
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 13:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD42DB2337B
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267431FC0EE;
	Wed, 27 Nov 2024 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GkdoMgmI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF83E1FC0E2
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 12:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732710598; cv=none; b=omwfxwNlXILqz6pKcHx9MqyZLv1e8cjxeTGiWF0wYqfhHoXNFKLy3UEOVvVcnqJEJ2534oFkrVgkwdTT6KGL1GcFxqueHUiWj3q/QWOZR0aVQgzPp46kWBREFKyhDWR9A5K5YEH+nGqf3NFHF82urhTTDSBZJYCe8JWtbpQr1fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732710598; c=relaxed/simple;
	bh=eO8pZeLmCY07ZvONQ95F7bnDt5LzCJtb1w9NSPUfJh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R2tW3yk8dE8jugMxvhfH1/8LHjSYvt8yoichpLbSv/bFlEWGDCYk3Nw2G/ukZxjvFAoIrsUbfajzEAOIxNI1bDF4l8XlNaeyhOjQSGRWCCk4r/T2xV3rWpGsTwa/LOZ2v3ZtbgOhP3Xjrxy2PJUnjtJfcSi4nK+Ne5xQBIYVUDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GkdoMgmI; arc=none smtp.client-ip=209.85.167.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f68.google.com with SMTP id 2adb3069b0e04-53dd58ebccdso716403e87.3
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 04:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732710595; x=1733315395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KRcdSs7XMlGnAilpDhcNiYT3hFI3KAq1n7SCl+kMm14=;
        b=GkdoMgmIwaaGmz5I/jMOZc2DEuvqJYiAiw6yeY7DixADaY0Y+L7rIka7ebJktp3K2B
         tISsYEh1ACr+1dbu16T+snXfgu6HtL3qZw2uzql3dIiYwZFKcl6HK+/tam3oDPdByjvt
         8kaRjngBkX9KEZgWV32oa3NYJrChUulq4hTHx9Gdmkrvy4L5feTi8f1/mn46aubCrPVr
         JHSm6v6ElKctF+qPY3QMQOUMvTvtGmJ4DlM7AAcVGo2sD7OL9IHMgz2513bOu42IaCa/
         Otsvp8qxCwi4+nohGF7rjBdyAeHhoyyV6oqwQsgueOcGYMFgOhcrZcttGdKbuD+gLEWb
         rDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732710595; x=1733315395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRcdSs7XMlGnAilpDhcNiYT3hFI3KAq1n7SCl+kMm14=;
        b=sBUVva8+7S2KANGpAtiA4i5hy++kOhikq4A/3HlDL5k1LceXTTDRuLCcJVIbV27zZ7
         RN98dZRnXF9pUndMM8f2DusUsQOvILfU1sPe23mrVc5WXunIUEnYGxOH9AGyTVlw+ATU
         aZMEQnx+1QKjjQYLMYoX+ElnQniSOUssJcOTf6GvaYfl80nfdVbndXIpON44r3+7Bjzo
         gLP7/CZ5jLtnoJ1/tb9ukPkBZoYyQM1RooysMQAazpl7jta7VgXpSVgvc5leTpwPFoUp
         6F1qbt+tg8ZwPBo8CQsi6H7i/wKwxQ0Jk945KUoAbMfhZMNOaEpWWOUxouCikyMI6EBW
         rG3w==
X-Forwarded-Encrypted: i=1; AJvYcCV6IUTgSCSAN5uP9JYPiYTkUo/fvD9ehjmm87OFkFbTB+EdS1i3obGkY7NgG+5OQ7zw9QZDZU4XTXGYzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo7gX/MtX1SQgLzjYJccFa80UvHXfxWp9VX8MoU49dux0AvOH+
	ZueKT8axikbKEaEfPc/grdt7FQr0y9q2VarP3zWgtLnpzSWzTY4AqdWe43nEFUM=
X-Gm-Gg: ASbGncv91udc6ply1uVfz20HXapP285UHaRnQbWK35ifFPztXsOgzu5hdLSw4U9aw6e
	c8dBTxp04RRZtHCOIh0kBfDxuNFy4nSZG9o2HzOTWKgkESB9SG744mI8vqqvcLVh/J0oXx3rIR2
	MJuRPUUnbzGgnyYiz1GPTV2NJR2ltzkpCB8bt98wEUWmEIWa4e12pV07fSJl7HvNe1Bit8XB3lp
	9jp1aqXMi3ox/2LcGzfaBLWegNb312QuGQferwv3EqIr2hOMRdvNUy8aWn540s/hV9WhM6SivKr
	9KLgtEP7Oj+J0Tu9JNgMGZopW2A7TggWHhBzrUI=
X-Google-Smtp-Source: AGHT+IEmhY/XevE73lIO5R+T76MBj7DXNOF8lKpN8Jyne4r1vkv6Io8XVDa+jBnr77B+i8BS8pEL7A==
X-Received: by 2002:a05:6512:3e23:b0:53d:ddc6:259e with SMTP id 2adb3069b0e04-53df0108cbcmr392654e87.11.1732710594838;
        Wed, 27 Nov 2024 04:29:54 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24953a1sm2276621e87.228.2024.11.27.04.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:29:54 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/6] dt-bindings: media: camss: Fix interrupt types
Date: Wed, 27 Nov 2024 14:29:44 +0200
Message-ID: <20241127122950.885982-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was discovered that on a few Qualcomm platforms types of interrupts
do not match the type given by the Qualcomm IP catalog, the type in
downstream code and the type requested by the CAMSS driver itself.

The mismatched interrupt type between firmware and the correspondent CAMSS
driver leads to known problems, similar to the ones which were discussed
previously:

  https://lore.kernel.org/lkml/20220530080842.37024-4-manivannan.sadhasivam@linaro.org/

Here the situation is essentially the same, namely a repeated bind of
the CAMSS device is not possible due to a wrongly specified interrupt type,
and it may lead to an issue in runtime manifested like this:

  irq: type mismatch, failed to map hwirq-509 for interrupt-controller@17a00000!

Changes from v2 to v3:
* gave clear commit messages addressing Qualcomm IP, thanks to Depeng Shao,
* hence keep Krzysztof Acked-by tag, since the only expressed concern was
  a missing reference to the hardware specs,
* added Reviewed-by tags from Bryan,

Link to v2 of the changeset:

  https://lore.kernel.org/all/20240923072827.3772504-1-vladimir.zapolskiy@linaro.org/

Changes from v1 to v2:
* added gained Acked-by, Tested-by and Reviewed-by tags,
* per patch review requests from Krzysztof deduplicated "media:" from subjects.

Link to v1 of the changeset:

  https://lore.kernel.org/all/20240905164142.3475873-1-vladimir.zapolskiy@linaro.org/

Vladimir Zapolskiy (6):
  dt-bindings: media: qcom,sc8280xp-camss: Fix interrupt types
  dt-bindings: media: qcom,sdm845-camss: Fix interrupt types
  dt-bindings: media: qcom,sm8250-camss: Fix interrupt types
  arm64: dts: qcom: sc8280xp: Fix interrupt type of camss interrupts
  arm64: dts: qcom: sdm845: Fix interrupt types of camss interrupts
  arm64: dts: qcom: sm8250: Fix interrupt types of camss interrupts

 .../bindings/media/qcom,sc8280xp-camss.yaml   | 40 +++++++++----------
 .../bindings/media/qcom,sdm845-camss.yaml     | 20 +++++-----
 .../bindings/media/qcom,sm8250-camss.yaml     | 28 ++++++-------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 40 +++++++++----------
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 20 +++++-----
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 28 ++++++-------
 6 files changed, 88 insertions(+), 88 deletions(-)

-- 
2.45.2


