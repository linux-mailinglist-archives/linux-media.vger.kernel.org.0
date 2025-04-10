Return-Path: <linux-media+bounces-29958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DD2A849AF
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 18:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 915834A3224
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 16:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBACA1C700D;
	Thu, 10 Apr 2025 16:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZgRYCZLy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA381EF0B1
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 16:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302613; cv=none; b=r+bc6WCR8ye7yVsyPsYLhRmD7Ghrq8Aatc1OzBGlIxvR4jM7lqVIC7k685U/uoGjkjMEdWwS3S9OOO3LGCJ8IM3lVVudKM2DqQnEvYzkIb3KNrs9LYNx66igxl7q+Yt/2NMU89UTI3C9O2883W6fA0dxMzv1yqPRJ1FpRNYErJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302613; c=relaxed/simple;
	bh=ZT1naHPMwcnziJgo4UbQxNWT1qHNuQGDv9YaGQAevXU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sO+iKcvdEp+1xbM3L8t5Qui22aEIMkAPwOTUTPiYM2DUrVfyuEhzpuK/yhB5VNKrPcXkg09oMBaZhfry3Rn4iSeguzEhaqzhVpbJTTbjbiXeZ5LJEsiCoF/UyS55jdeMYg157d72VKK3Wo5IJ6gL3LOXWeNxcNjeM+GCFoDn5SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZgRYCZLy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso7416615e9.0
        for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 09:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744302609; x=1744907409; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CmSQhXqEv16lMgPQ+xzd2jwzH2nXMAOrej8vrFccN5A=;
        b=ZgRYCZLyU6SBQ3VpdQaIX9fnBjgzBmfVAHOsenSoDQQuvEejuBAclgaL2VWE9I5xpi
         HZ9yaj8hjTzPJNDT23RpPWG9jH0TDDrr1e9vE0SLLiCuEX0EhJlFdkn5SyTl3YamAPh0
         2JOibgGdZ8XEXo7zT2vjbH+9woF9cUz01Mf0XZiTTMn6JGA8u2rYbSKW17aghsdzbAXP
         RhZE14xDt67nVOHdaCcVHWwuoZGcBDsE5FG3P4XiD11RNV29aZBtbOnJt3uRJDPwGdeR
         zD4hXAwVwnB7NBNh3Xw1IgtukSp9PrjYnzqzQ6YvVvbJZCkusCRkS5CGmM9MYI7DrWhT
         Hehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302609; x=1744907409;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CmSQhXqEv16lMgPQ+xzd2jwzH2nXMAOrej8vrFccN5A=;
        b=u7xTY8m0+54LMo5pWeVSl7npriQaW+6hlVJMAenD3sYRnT/uojM5QHEYfnZXmBOEAc
         2bZ7u6PEKm6E7SO32TYN6XGyDQQ5YB8PD1nJUURjy+XmjFHL0W+KMDTO6Z+uaXU9nA6w
         SGmeRO1IMIVhypwiqKqlRJFL0FBiqNeDdAnKwKqS1kM/+IpId0cqbRtV4NasytbrRY12
         q6ef3Xd0LReTD5XtP77yyyAUYZyR3a5XaZgh3YDrlwXlUNmNxhl6LYU0l6l5eWCLZnNV
         WLFNm3sVIMdGRlrOIRNG/u4eZc7P/VrFlZhacobxA5jmPa/20UNAASWtriXFJcjvGKnW
         Fwmg==
X-Forwarded-Encrypted: i=1; AJvYcCUj8KdjLj5uLOvuDcH2M7Hps2ZjW4IEkIjJ0uR8aAeX73QskYUstRe4ritNJjQ3B5gMLmTT2S8+MH1YrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpMRXsls1P1vPiRP16GonmYKETj2mLFIIG9NWdE2okI8mS7w2s
	a1kS6iHYJ9x/ZKnybmHP5okdc9W0+FAqADwJCZSCVvgZs8p3Is12RpO3uglcUzE=
X-Gm-Gg: ASbGnctUMeZhBLZlzW3H8fs9ElH7Ju0z9+08fIEYBTR2rrYbgIu7psSvHkyvrmQz/y3
	dKGaB5LwBYWDZoId/LYxcf0yrz98PxoEVuumHNBU0FmKsyMCXE7zciKxkXaEJxaLVbtvgmOVH8b
	0kOMpq4I3kGDYBxDtk/WbghgUuTwmfSfdXRU0tvkhZIs3BdY2nWDFYu+Y+AC389whJCVElz4bSr
	zQJ4y0tFq60vJ1ed/5/0enJDdP0Qke8UokhWXSQnj2ngFILufGvP37wfVnAYNghy2m4PUmGx0gp
	UOzOXGf0NReeSlvVkSyn4nZ5blCwHyinpEN2Zibcnf9Wvi+e9jkTy/+nzkadPQyGT0i7kLoF
X-Google-Smtp-Source: AGHT+IFqSeHKIM9S2EJiC4vMqu0IORLlomRAI/05NMUp22VoBDjNuDgsC0XQJSAWXvOHZULfmc7Gbg==
X-Received: by 2002:a05:600c:154a:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-43f2eb98fddmr31789625e9.15.1744302609092;
        Thu, 10 Apr 2025 09:30:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8936129dsm5350663f8f.18.2025.04.10.09.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:30:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC v5 0/8] media: qcom: iris: re-organize catalog & add
 support for SM8650
Date: Thu, 10 Apr 2025 18:29:59 +0200
Message-Id: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAfy92cC/x3NwQrCMAyA4VcZORuI7SriVfABvIqH0mUz4NaSV
 BmMvbvF43f5/w2MVdjg0m2g/BWTvDSEQwfpFZeJUYZmcOQC9UfCmosktPm8BsJPsaocZxQVwxR
 rfOcJPTvuI3k/nEZooaI8yvqfPOB+u8Jz33/Isr1weQAAAA==
X-Change-ID: 20250410-topic-sm8x50-upstream-iris-catalog-3e2e4a033d6f
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3647;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZT1naHPMwcnziJgo4UbQxNWT1qHNuQGDv9YaGQAevXU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn9/IMKbkRSxg7StrAd02cJPMA5J+jM4ZSZAfisRV9
 i2FhFe2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/fyDAAKCRB33NvayMhJ0TgcD/
 9pwraSP+JBy6WoWCY+0F00mRHfwFZ3P+WoThPNFseD+Ks++o74jrfaSvTJr8iAq07v0kb2mGCAmGIq
 6wcwwXVprWgRDHDCNB31V2KLy//iA4q3I6pKIlX32BsJOiqGTFvEt1GHdT4Iou6l0dGeSUmssGa09o
 13/upBc+AfiFIQyahpAXtFExRWcE0ZgtqUfmFMwZ1VVDF4Eh+R1llplpOq6h3WoaYwQmwhu55ee+8Q
 qUebfpr1dLiEFiDPBGFlcngfCsuBszfpf01BZIngux9auHoe57duo/tMrnQx8rhsgRvQWtYN2cmjLr
 sSqR7H9ZvC1cNqyXw9WHTLYXNfp7yUYtc8rVZAogJHwcxkQtm5wu5TcYPQ3KOqrKj6jNvNrXL1OmTC
 87T3SHF1x5es1B7yIC12y7JNNhxDbzlVzWTchZzggMqDkNipObtnYcjJBOVxio9xowk31ljoFilLCY
 dpu0gc/d3VEIHE3avAzDktqrkrmQdTJcRxJEJx2bwDpb1KjVD1U3rdPWLSlBjqr0lk7Hds5Jr4IZyh
 kyjlN2MxViMYS8hCVfzPf35RWP9YqonpDfpJiB+Vi0VK1t/WjVBhnfT+ZlUm+HZixifil6GKTDzuvH
 STuw1quJjJQeOBf2Yw7RYIVCfxhwwURWoJDR6XHuYkfvC2GqyvJL+Kiiq/xg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Re-organize the platform support core into a gen1 catalog C file
declaring common platform structure and include platform headers
containing platform specific entries and iris_platform_data
structure.

The goal is to share most of the structure while having
clear and separate per-SoC catalog files.

The organization is based on the curent drm/msm dpu1 catalog
entries.

Add support for the IRIS accelerator for the SM8650
platform, which uses the iris33 hardware.

The vpu33 requires a different reset & poweroff sequence
in order to properly get out of runtime suspend.

Follow-up of [1]:
https://lore.kernel.org/all/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Reorganized into catalog, rebased sm8650 support on top
- Link to v4: https://lore.kernel.org/all/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org

Changes in v4:
- collected tags
- un-split power_off in vpu3x
- removed useless function defines
- added back vpu3x disappeared rename commit
- Link to v3: https://lore.kernel.org/r/20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org

Changes in v3:
- Collected review tags
- Removed bulky reset_controller ops
- Removed iris_vpu_power_off_controller split
- Link to v2: https://lore.kernel.org/r/20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org

Changes in v2:
- Collected bindings review
- Reworked rest handling by adding a secondary optional table to be used by controller poweroff
- Reworked power_off_controller to be reused and extended by vpu33 support
- Removed useless and unneeded vpu33 init
- Moved vpu33 into vpu3x files to reuse code from vpu3
- Moved sm8650 data table into sm8550
- Link to v1: https://lore.kernel.org/r/20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org

---
Neil Armstrong (8):
      media: qcom: iris: move sm8250 to gen1 catalog
      media: qcom: iris: move sm8550 to gen2 catalog
      dt-bindings: media: qcom,sm8550-iris: document SM8650 IRIS accelerator
      media: platform: qcom/iris: add power_off_controller to vpu_ops
      media: platform: qcom/iris: introduce optional controller_rst_tbl
      media: platform: qcom/iris: rename iris_vpu3 to iris_vpu3x
      media: platform: qcom/iris: add support for vpu33
      media: platform: qcom/iris: add sm8650 support

 .../bindings/media/qcom,sm8550-iris.yaml           |  33 ++-
 drivers/media/platform/qcom/iris/Makefile          |   6 +-
 .../media/platform/qcom/iris/iris_catalog_gen1.c   |  83 +++++++
 ...{iris_platform_sm8550.c => iris_catalog_gen2.c} |  85 +------
 ...ris_platform_sm8250.c => iris_catalog_sm8250.h} |  80 +-----
 .../media/platform/qcom/iris/iris_catalog_sm8550.h |  91 +++++++
 .../media/platform/qcom/iris/iris_catalog_sm8650.h |  68 +++++
 drivers/media/platform/qcom/iris/iris_core.h       |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   3 +
 drivers/media/platform/qcom/iris/iris_probe.c      |  43 +++-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu3.c       | 122 ---------
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 275 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
 15 files changed, 598 insertions(+), 300 deletions(-)
---
base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
change-id: 20250410-topic-sm8x50-upstream-iris-catalog-3e2e4a033d6f

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


