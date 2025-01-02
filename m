Return-Path: <linux-media+bounces-24217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 648FA9FFBC1
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 17:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E72093A2AD4
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 16:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29AE187325;
	Thu,  2 Jan 2025 16:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PXY2ujwt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34D215575D
	for <linux-media@vger.kernel.org>; Thu,  2 Jan 2025 16:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735835658; cv=none; b=j5dtVksTe57oM+0aqCf2dAjAxrq0ohLVf9mw65v4DJdhSTHTUFjg1vE4Egn5NCbR3qxKYtndFSfVF3Law1jmbLBxu+q8L6u0vCj4qVi0YowTFQw3ukoVwSWjJcX31TUPa57MCnp+OuZwZLxREE36aq+dfh8JyrnyUukY61wqZ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735835658; c=relaxed/simple;
	bh=wHTBdBmiu42htNicZa0OxfE7W0v/WQ//2woGL/Qi/lA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PI4N7yvrRrAOsjGc6JTh6aiT6Y5Y2axRVRX7UPLifAytX+ZwxY4bxUBg7aocia84xWYA7lR7p3sBecGYaibKg/IL/gW41tFF9iraBGf0OsYGWQxLvr1nLkb3thQ0wroa//TvU4Z05Aw51bpfjLOY1Plos5Dtev4ZqV6+aEQ3YE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PXY2ujwt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so121736375e9.3
        for <linux-media@vger.kernel.org>; Thu, 02 Jan 2025 08:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735835653; x=1736440453; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/iPfVF3oCxMg1L1jShb3koLb6DQG0P/sNBtbIVIH9sg=;
        b=PXY2ujwtIQHAcEQeM3hMuUD1l78nia3PQJMNZemcpzXrrYgg3mhaf/KR/SMo3Av/0Z
         gyZe6aqeeJmmqFzkwY/1ediuhJVbqfSEfVtzc4u174gwhBCu2NcHsC3wbHuQuLK5f2xv
         kS/eP6U5y3AWSH2iqsmvG1WYCso1T7pziQ9gothe+q0F1Bgjc920ILG2Jei1CdarJrvs
         1gpEGyWnMtp1xfEWFJ9RLG1lrcfpobIb07AdLbwq/IDAMglYy6/puFfN7s84UwJy2gAb
         NYOiQajOPHrLzjdfCGjqcBzPiMaD0dVLCS4ibakKuTRD5nFSNg3bqiZLEyKhWJ7cUR7G
         D1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735835653; x=1736440453;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iPfVF3oCxMg1L1jShb3koLb6DQG0P/sNBtbIVIH9sg=;
        b=LCiJUzzawfxud1v9aUdTryFGgmlG4FbhGHi8HZxVcObG8TnJvjuME6286p7EF+k0c+
         Uf3LnhLLDemyjtLVs2tLqfwnAdYEZxqQImXOTlGRdUFZRN7Y6u2lKDFzJyzmOKQd/Pd9
         Z1jkw0GSdXhKWuGQHVVOH0QBp29BrY3p2t0ImIuIPMaPx+D54tOzXmz/GbukoO/xV+rH
         I1EH23WOCDC4AUFp7Iv9Su9aHtnCd0p2ahW+0fYuNLOw2S3sA7tM5ixXTh+/W8VYbSAu
         /flepdSfH7sJ03Ytm2AL41D/td/lO6OreU5Z/VxiRuB/MSvrCwXGdWoYD2FYid2Mknpb
         /ioQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfN2RuoS7rwqtwTWkZErp3Xe4ONH6O3HIiJVRY+OZGcqTMcyqDUCdZd8rVsPyE/LZCgFeul8C/F3pn0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys9ygz7X7rK5QLlaEDXVf1Ms3uNhj/i0cS8css7bkAoqOnISmw
	oaE1PU1Rok3WKioxmm/GAlw4OBbubnf9V9vbqbNx4WxRCoU7OMQJDSsJX6J9hvc=
X-Gm-Gg: ASbGncs4ePM+N25DjzchQdFIvl/lFpsAsqIXqz4fK0i6OQaixTyz5D8DgWHUvbMdXmC
	xkWMxGaMCqLtOgnqJNw5F4Zvvw0iHir+SKGfPRF7kKXjVRJGj+efwoYI/XiUOSjN7TiWl9VG8oj
	cL/VqoZokOuzjokdXSUvqc7gn0caRof0ylKVmN6TF8hEgZ51PE9mXcwznPecmnKTkkGjtFJJOVl
	nhbPzPMC+FKF09QGXUAJovGo6aXN44N0Yi92TfOsAbzB4ZFvNcPfwGClh6oHj5QHw==
X-Google-Smtp-Source: AGHT+IFY3T9wM6oTHZCvFUtFoVeaSUwJTlMZcbumnlzMQ8N2h0yJKFnw67TkGRF6GQ0TRXEGc4+jxQ==
X-Received: by 2002:a05:600c:468f:b0:434:a30b:5455 with SMTP id 5b1f17b1804b1-43668b78728mr372555415e9.27.1735835648137;
        Thu, 02 Jan 2025 08:34:08 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b295sm499265665e9.33.2025.01.02.08.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 08:34:07 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 0/6] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Date: Thu, 02 Jan 2025 16:32:05 +0000
Message-Id: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIW/dmcC/52Nyw6CMBBFf8V07ZjO0Ae68j+Mi0ILNFEwLTYYw
 r9b2BiXujw3uefMLLrgXWSn3cyCSz76oc9Q7Hes7kzfOvA2MyNOAhGPUAm4+f45Qe+mEUgAImA
 JdoweJnQlR86hNvcYoSSjCl0oyzWxLHwE1/hpi12umTsfxyG8tnbCdf0rkxA4SMG1tFo2Sopzf
 powHIbQsrWT6OMm0j+5Kbu5aqyVRltZVV/uZVne20ualkEBAAA=
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-1b0d6

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
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 351 ++++++++++++++++++++
 5 files changed, 794 insertions(+), 2 deletions(-)
---
base-commit: e25c8d66f6786300b680866c0e0139981273feba
change-id: 20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-82a63736d072

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


