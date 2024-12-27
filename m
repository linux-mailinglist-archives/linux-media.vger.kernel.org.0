Return-Path: <linux-media+bounces-24129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EB99FD4A6
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 14:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF964164ADF
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 13:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DCF14F9FB;
	Fri, 27 Dec 2024 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YXEtfF64"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666491F37AA
	for <linux-media@vger.kernel.org>; Fri, 27 Dec 2024 13:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735305136; cv=none; b=VibW6BJjdHJdhbw50CEFMUmkYohc3idv0odAQbtYN0nkpFvONvlVtXPM4dylEC3pK2uncA1wH9nM8mwTBsiHxKrYGmFltNDJvlKXtPWuovj+xBM+/5zx1ptcsVYKXK6fv3fS6Gu1jz5dd43io/n+7ACtam/AThK1H5HFe+2EOc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735305136; c=relaxed/simple;
	bh=o6AAcz9J0udUgMaYOxi05wAWfjvg31AtsZqAU1K4TPg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KcLM0YRoL1h3yOUD7p4LvpbQAJzA0CD/pDFq+U4dCNbhUehiF0O3iqN2BxflMXwXvXRsxZIdLeSfr0crg6sfyDwzOr6tckocBgqd3K9Vv/OAmwC61/bFI9sQc3GQeS2gxp8MdJ4PfdjHvUFpnDMebH3/Brs1IzPSvxaaHs3geJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YXEtfF64; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385e87b25f0so5254492f8f.0
        for <linux-media@vger.kernel.org>; Fri, 27 Dec 2024 05:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735305133; x=1735909933; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Sm+sDgdDQlH/NgufjiV344PWkD6XSva0idB1/UqFcc=;
        b=YXEtfF64lpnyp9A9yxyzw6OE1KtHHsb3PcUgAYmOMt2rbr21h1jU01v5gweRawowGm
         RFCuRQOlJFwlVaRcEgxVfjRYKeyAZb5GEic3fGY0RtUA/uEdUGtBFth88enTVOjR+vW7
         7FpVsVsQPlsq3csONBqhAgC7B6qrN48OJaNmsL7Ui42CFwN7vpdJGjDqYkcAVBEse+si
         mNvaPAHT/IUjecYiwzNe+FNDORglRqAQciYj9m3WePH57Dgf1KEzyvLYmCnctrhg4pwh
         dW37jvIS1CbqC3+2qZ7Firki3CEzQ0gDmES8KPGKl9/favYGH81juRJEIXmU1earbqN/
         9bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735305133; x=1735909933;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Sm+sDgdDQlH/NgufjiV344PWkD6XSva0idB1/UqFcc=;
        b=w+iDaH5KfaPWVc1HdYXSYpM/yN+VuvFhNWj5LHhFa8dtTpskqJG0Thibph+LxuQJjg
         tMg4qg+NWpC5KJaZMqWMeN4HOHzVGrAukFPTrwrOwTnBuGBfKc+WT9u44KrOA5ik3fV1
         q3DXD6mTzrquf1mvroIqRtDJ33azWJPxR1K/wlPE250LzZPWM0I+P0lauxgdc/c5tzvN
         bp/9/QSIhgv4RxJAQiQG1+sED2V3rP8Ntu3Pjd4Vu3/1GZgMIV58he6XyKIALmN76Rnn
         5aDKOIQzUG0zdFBJknjSzfyATvA0Xqwbi+HMFolcRBdGVyDhWa56UYroMEo2XFKUntxI
         0/xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPtsQ5V1h8+UUcz6zAXccBmE7qIj8ct498nbo7rr18R65Ep1ovNiJv+J8R3DisR/ItNWh3Q6ZJzwiDEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzibVX7+KfE6XdpcltMOYBgj5Vojf333iF1Clz0TOxcaLBY4GpW
	LbXz06q6fIshJlfENlSTTfio2UJJIWLNZod7VD+0QLsasYzG0U3sKsV9zKrPXlY=
X-Gm-Gg: ASbGncttVWrs1NgUzDvMkrqe7spePhvlkh870JXriRsBsUIEWe6JFvEYR92LgvHuKdZ
	jlt1hcu75k7dkTuWeGLbATshvJaY+IPvskhWkVWIsweh0Tr8JohM5ES9ZeOVPCVwPf8/QYGWCFA
	nQcoC4IdLU0rhAx9RlE+2ylD6YimdT07ruraQXEswig41fNs8DEQeyezpW+1kZX4KSr6cVYP7Bm
	KRa72EpF4qxoXnkR/kbcBotRbwBFezwKD5KcSfaHXOjeItNbE+Dbmq+uhWRd7c6xw==
X-Google-Smtp-Source: AGHT+IFRAeRoU+IdqAaoKzRh+DY3FMLdh4h364QfZ7giAar2WSsgfkdc7AMMqclquzc5rde5/NGSNQ==
X-Received: by 2002:a05:6000:1faa:b0:386:3672:73e7 with SMTP id ffacd0b85a97d-38a1a1fdecfmr27843731f8f.9.1735305132744;
        Fri, 27 Dec 2024 05:12:12 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c42sm298899425e9.9.2024.12.27.05.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 05:12:12 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/6] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Date: Fri, 27 Dec 2024 13:11:33 +0000
Message-Id: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWnbmcC/52NQQ6DIBBFr2JYdxoGQWxXvUfjggrqJC0YsIbGe
 PdSj9Dl+8l/b2PJRXKJXauNRbdSouALiFPF+sn40QHZwkxwIRHxAg8JT/LvDN7lBYQERMAW7JI
 IMrqWI+fQm1dK0ArT1LpuLNeCFeEc3UD5iN27whOlJcTP0V7xt/6VWRE4KMm1sloNjZK38jQxn
 EMcWbfv+xe5LVqq5QAAAA==
X-Change-ID: 20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-82a63736d072
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-1b0d6

v2:

I've gone through each comment and implemented each suggestion since IMO
they were all good/correct comments.

Detail:

- Moves x1e80100 camcc to its own yaml - Krzysztof
- csid_wrapper comes first because it is the most relevant
  register set - configuring all CSID blocks subordinate to it - bod, Krzysztof
- Fixes missing commit log - Krz
- Updates to latest format established @ sc7280 - bod
- Includes CSID lite which I forgot to add @ v1 - Konrad, bod
- Replaces static ICC parameters with defines - Konrad
- Drops newlines between x and x-name - Konrad
- Drops redundant iommu extents - Konrad
- Leaves CAMERA_AHB_CLK as-is - Kronrad, Dmitry
  Link: https://lore.kernel.org/r/3f1a960f-062e-4c29-ae7d-126192f35a8b@oss.qualcomm.com
- Interrupt EDGE_RISING - Vladimir
- Implements suggested regulator names pending refactor to PHY API - Vladimir
- Drop slow_ahb_src clock - Vladimir

Link to v1:
https://lore.kernel.org/r/20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org

Working tree:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/arm-laptop/wip/x1e80100-6.13-rc3

v1:

This series adds dt-bindings and dtsi for CAMSS on x1e80100.

The primary difference between x1e80100 and other platforms is a new VFE
and CSID pair at version 680.

Some minor driver churn will be required to support outside of the new VFE
and CSID blocks but nothing too major.

The CAMCC in this silicon requires two, not one power-domain requiring
either this fix I've proposed here or something similar:

https://lore.kernel.org/linux-arm-msm/bad60452-41b3-42fb-acba-5b7226226d2d@linaro.org/T/#t

That doesn't gate adoption of the binding description though.

A working tree in progress can be found here:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.12-rc7+camss?ref_type=heads

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (6):
      dt-bindings: i2c: qcom-cci: Document x1e80100 compatible
      dt-bindings: clock: move qcom,x1e80100-camcc to its own file
      dt-bindings: media: Add qcom,x1e80100-camss
      arm64: dts: qcom: x1e80100: Add CAMCC block definition
      arm64: dts: qcom: x1e80100: Add CCI definitions
      arm64: dts: qcom: x1e80100: Add CAMSS block definition

 .../bindings/clock/qcom,sm8450-camcc.yaml          |   2 -
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |  74 +++++
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../bindings/media/qcom,x1e80100-camss.yaml        | 367 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 352 ++++++++++++++++++++
 5 files changed, 795 insertions(+), 2 deletions(-)
---
base-commit: e25c8d66f6786300b680866c0e0139981273feba
change-id: 20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-82a63736d072

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


