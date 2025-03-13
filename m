Return-Path: <linux-media+bounces-28171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB0DA60384
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 22:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F9977A6E81
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 21:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD1A1F560E;
	Thu, 13 Mar 2025 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ozaDjLYc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5217B18A6B7
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 21:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741902200; cv=none; b=QnbWxHmqDnQGEqOVLyWWZYt83PoDbE4ypUKPNsOfAMBkefbeNZdk907Oj4eG+n2cJCsJeMjHzmiCflt19Ry0A8cDle98lGDcFS+ohNbKis9rI2wPAy/gQjndyWHKL59+O3gz3JQ1EjdqOlHPbXqHr4w++11I9I+L1FRdOItGPLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741902200; c=relaxed/simple;
	bh=ivCFiQ+dQHIBFUpp2swawX+0Cf4h9DDtatGLIXCMrNA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I1rPGPm9J5fHhY3QpLjxE7M7fPfgdMQ56LIgvyZsPThNoSPp7eesuCVcktQptYYsyYhw9UCN/8edarOJmDnYTEy6ArhxEYmgwOEOtB3Oo0jkGnKEp0oWXoz3MHmuogp2rb/SYziETeLlJhveKUMoWXMld8LCHbel4QidQz0wRT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ozaDjLYc; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abbb12bea54so275466266b.0
        for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 14:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741902195; x=1742506995; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FOcBiTkaVE0xIjFJjpzTTcyKlsXtOuX4g6SaNnhXi50=;
        b=ozaDjLYcxt9HJ3EzxtUOMNleMx/uaBeB5qTbXepMhLNTJXb6+BCq4h6PdNjOQJGwdD
         zzU5M0OBl+sSiFnQo6D8FWkcnFDxwxt3XnjCAryxbfUt+wQLAGiUQXPyHllfUaTrNrH9
         5hOyteDgtfwqAawxbAIhMxBmJ2o3VhsAZUYcXlJkyvexKeb+lh1vUBexFwnt+tLXgV/6
         y2186nYAE1Kzw9tA0wgA2sHf66WPk4Q77drHHX+PX6UsL3aUJUAK/hOiN2qWVdLri0kP
         8jRKSL4RlkeghTUCtJcxxH9BWdQzcNROg7m1gY81EmN8nomOy80NJ7SGm4G5Ckk2498M
         Ck+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741902195; x=1742506995;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOcBiTkaVE0xIjFJjpzTTcyKlsXtOuX4g6SaNnhXi50=;
        b=syJyacYqTw0HUy1gxKOoQqqr8Wr2QPNH5P3lmNe3nmbIUUkKmSwWgAT/5Amf7IDcMo
         0rJMgJQeS6BuYEGCS6CiCSRzORS0Z1Aga+fRO9J1jCr6Cjt9jTm0k+tjrdINno1IosRU
         zRDZJhJSLGXBK2sF3+DwwxUZPwUMA+qNU9cZfREdQqSCYyAzlTWiIyw8UGswP4np1TSt
         Xk19IupEH/5V7jSAydU6CXpUdk7EjX+aRah4oyIeXukelbfC0REl39Zxve1B3+oZ2ozU
         /mALRo3Ov9fKj7cuDhyBw0UEp8N9vSzJWO7sZbjrU83oHag8spD3iV/AvGcv0uGe+yHC
         /Lpg==
X-Forwarded-Encrypted: i=1; AJvYcCVxYPj5JWYbqZqz3ceppdLJBgdo8Ibp9T/5B5vFYC7nbz/8wfkyb6vGI2Mj2CENGQLyGJaNpwM/1q0CDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YymEsCSVPFL4/tJC63jn5T6ofFCGVrq817/o4GzNOxyABUaow2V
	aFC3dAJCa3zFfbiROko0wPrOab5f8+Uls2/5VhT/DHH4MMFbXI4l9pdljSyu5HAZIOWyhfl/ZKA
	d++TFvg==
X-Gm-Gg: ASbGnctzljSbyqTFeydD1tSwoAvdBZjY3khW9ztBwEl8E+OfeJssp/y259QRb0yI3gK
	2PfoLURt1cz8sfP+XnOmiLFQOSmmpT/P7DeK4E5PRmEQXk59R2fa4bjlsuSpvHehjEiIt8ZWLZz
	RyqVonQM287lkfXTlK5BnireSLg0IIaoFuyQNsRWZBlVpP8co3Jpey3nUXcFGytWc4/Vbf281J1
	wzcOVMU7hx4blK3sXaIHzP+KTSfVwJxjw56rEgqu1h5xJqMFcI3wI2ZbiK3Y/BbWuloBovcdmKJ
	ROsJlZjNvY8N7Q6hlKpoY3m439HcNYCj309PofrGE55DHHaOmP+JSOVqoc+IPtkNvWZM8CJJIky
	ioz7oXpM9A4r7Mqsqj4TtFDT1AMszoqiWYe5XkP5g68CU/Q2hN8E8NY+zpfZzXnYr+G+e
X-Google-Smtp-Source: AGHT+IELOlpPoOFEVK43UMvO2j81qUn9SHxfy1MqgJX+vzyn1bwPLuIJfXz10sGX/px7dyIGukqLlw==
X-Received: by 2002:a17:907:2ce2:b0:abf:51b7:6071 with SMTP id a640c23a62f3a-ac3301768d7mr9148866b.13.1741902195496;
        Thu, 13 Mar 2025 14:43:15 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a489e0sm126938866b.151.2025.03.13.14.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 14:43:15 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v5 0/5] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Date: Thu, 13 Mar 2025 21:43:12 +0000
Message-Id: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHBR02cC/x2NQQqDMBAAvyJ7dmGTmLb4FfGQmLVdaFPJ2hIQ/
 97Q48xh5gDlIqwwdgcU/orKOzfwfQfLI+Q7o6TGYMl6csZhHPAp+VMxc93ReiSHTaddBavhGxk
 iXMJLFY2ny3odYkwuQAtuhVep/9k0n+cPJW0ouXwAAAA=
X-Change-ID: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

v5:
- Picks up a Fixes: that is a valid precursor for this series - Vlad
- Applies RB from Vlad
- Drops "cam" prefix in interconnect names - Krzysztof/Vlad
- Amends sorting of regs, clocks consistent with recent 8550 - Depeng/Vlad
- Link to v4: https://lore.kernel.org/r/20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org

v4:
- Applies RB from Konrad
- Adds the second CCI I2C bus to CCI commit log description.
  I previously considered leaving out the always on pins but, decided
  to include them in the end and forgot to align the commit log.
- Alphabetises the camcc.h included in the dtsi. - Vlad
- Link to v3: https://lore.kernel.org/r/20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org

v3:
- Fixes ordering of headers in dtsi - Vlad
- Changes camcc to always on - Vlad
- Applies RB as indicated - Krzysztof, Konrad
- Link to v2: https://lore.kernel.org/r/20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org

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
Bryan O'Donoghue (4):
      dt-bindings: media: Add qcom,x1e80100-camss
      arm64: dts: qcom: x1e80100: Add CAMCC block definition
      arm64: dts: qcom: x1e80100: Add CCI definitions
      arm64: dts: qcom: x1e80100: Add CAMSS block definition

Vladimir Zapolskiy (1):
      dt-bindings: clock: qcom,x1e80100-camcc: Fix the list of required-opps

 .../bindings/clock/qcom,x1e80100-camcc.yaml        |   9 +-
 .../bindings/media/qcom,x1e80100-camss.yaml        | 367 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 352 ++++++++++++++++++++
 3 files changed, 724 insertions(+), 4 deletions(-)
---
base-commit: 9fbcd7b32bf7c0a5bda0f22c25df29d00a872017
change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


