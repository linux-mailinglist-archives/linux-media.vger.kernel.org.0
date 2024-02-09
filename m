Return-Path: <linux-media+bounces-4909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2964A84FE30
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 22:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABC451F23072
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 21:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448A7179BA;
	Fri,  9 Feb 2024 21:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BJyS6+Cr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE22514F6C
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 21:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707512976; cv=none; b=JyTATQO4nwX89Z3CL38yqDWJ+76keh012bsHQ5bYzytivo/8LxlY38XrNoLw8uVddHqjF1+Az3UVxX/3ptyUy1nRQsikEj+OLOLTGUKG+n3xsojOGNqaRbHnYe1MXgLvzmCQFHE+d0ZfbtK0SAi1pWFwpn3SPWzRQQ6GoR7cdaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707512976; c=relaxed/simple;
	bh=TgTIkiOxuNQ1a1CE04BAe5d7kMkxUJYrxgLOnh2qf5U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cwekYM8Qdb4NsbH12IUi2X1Wkj56ZPrgs7qCAtLDF5tZJDMnztG5ZPqfRh0apZPrlu6e+eYhB1KNdY2vr/7IRcPKhs4XJU91xcLrVEtdG26uLzOHco1rC6cBmeXcUbyqm9fGufjLXD8PtDec+u+76m/L7kcBo14eOQ8Iy8P3lcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BJyS6+Cr; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a3a77f27524so172728866b.1
        for <linux-media@vger.kernel.org>; Fri, 09 Feb 2024 13:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707512973; x=1708117773; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lLSVoQCZITmHHkE2ANSeJMkPS5k1b3W1O27n/YVH+Ps=;
        b=BJyS6+CrIfkpTesRMFJOgQjD0skfxp3LAOxEgPWH+CM6twI6usf9/tsheyo0+qMia7
         IQsjZiRACIegQc8pQGUS9+1LpAay4REZVDMKmVEXp1KjcuIRZ8bdJBgvOowM59heTkJH
         jP3a+kNejkSWq3sYb3m4Y3oWIhBar6Gs8KRPAddAxsRvaC/IXlh7aJreIHuYbz74gJIJ
         WlLumRtyozAqID3ApiJTdocG0gHwUMZvQ6YB3uwwaYV6o+75fcPPqoqu7af+6qQPyVsr
         0tDwb5LbEx6ySNBWY2wdnvwxsYJ/NpaIj3ADbQaX/RQy2jjDWrSAyAuN7MmTq3gJxxiP
         ScKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707512973; x=1708117773;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLSVoQCZITmHHkE2ANSeJMkPS5k1b3W1O27n/YVH+Ps=;
        b=TdDUJeJLpuMv8pOjepcJ87WqCfpiVA06OV0owmHd/Clc4wQwF1pNKq2WTx+kYTZMea
         ANgLMySmb5U+2EgOrGw7QfOpnvlEvRVZkY/oOQ/exyppUgyERIPOyorgN47hUsTSLlsf
         j9ZWl2AIF7/stakUdxmmTGou+8tTNAVrqWCQ/4GCsYHStBDfm8UqL7FPSOZrIIyvTW+d
         xSfy03Cn+DXemIqZbRNjk878S2DUpKHnBzJ3P/AkiuDRkCp4FBSdRQmsRc9Nzyd7ZbU6
         6pCzL9GAMaXgCXPIc03wricG6ZUP6ZMch76v+ilAkhqV9gtJeM6yghrXlA4Fe6rJc7pB
         O/PQ==
X-Gm-Message-State: AOJu0YxWFA9vLQF0cjIn7K6PjswHqKoHvLL/9wEd7lD6W17Gtaktn8eb
	8R+2f9ArAxDvRyBopO88UH5qYD2MD+mUN4dIxVHoYTESsIVVeaLUWfD5hm0hEhM=
X-Google-Smtp-Source: AGHT+IEek5gg1zQMqEFU8MTLWOBrkfovAr4todlxLd3F0XeHLSCqDCV14N9MblL+PoSnpMTZgnE2iw==
X-Received: by 2002:a17:906:46d8:b0:a38:2e6b:ca1d with SMTP id k24-20020a17090646d800b00a382e6bca1dmr172850ejs.63.1707512972964;
        Fri, 09 Feb 2024 13:09:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVempmfIxnzT3BObkA5rvK5QUErU0GODdQ4aIsDLpD3eoFRTAzIPUbITXtDAyGcFkYly0VZZ4sgkoiUo/XYWxh3JFR2TPpNpI9bs274YINMhRZDXniMzT/u+I4G+TdWbpwud+ef59OJL3xs1A7e/50hUO3Ot44wLOB/BG9o2Dx6loLd2tE8BMCrkbHA35hnY2DL1SCTv+bsTODjKbhNqQJVEgZ5hWmcazOgHRY1hqT5ke4383NrJ/57qZygWQSP5VmiJRHZ/g2addrGz2P0yqyGH3FjjthsQ7p82taF4dmpJWdyhdmcedF5UE7W7+T84LanQ/zEylgmB2lkzNO/RKQ+Qrp7f2Rx/pKeooWnzsHnlUvmezcXe3Jt++VHp5xqt++lztHcaGgVze5W+IqTu5QSGVenIAaNiZlQH3d9F8u6r/j72Z9LQNYf71jaB26a65C0thL5FViWDwhGE9i0I9wvOgcmnqAxU9CVppjDEzJVdNYv8IpeE7+c8nA1AyQK8g2y4w==
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id cw3-20020a170907160300b00a381ca0e589sm1108516ejd.22.2024.02.09.13.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:09:32 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 00/20] Venus cleanups
Date: Fri, 09 Feb 2024 22:09:21 +0100
Message-Id: <20230911-topic-mars-v2-0-fa090d7f1b91@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIGUxmUC/22Nyw6CMBBFf4XM2pq2GB6u+A/DogMDTIItmSLRE
 P7dytrlOcm9Z4dIwhThnu0gtHHk4BPYSwbd5PxIivvEYLXNdW2MWsPCnXo6iYoKjWhtUd+MgTR
 AF0mhON9NaeJf85zkIjTw+yw82sQTxzXI5wxu5mf/fm9GaeXKPq9wqErssZnZOwnXICO0x3F8A
 QJrgOS6AAAA
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707512970; l=3004;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=TgTIkiOxuNQ1a1CE04BAe5d7kMkxUJYrxgLOnh2qf5U=;
 b=ari/TotuVkFsJHDotXqORag6wWUCNmUi3ZO38ARf7edmDaaPN0FKYzBYrdD++u6ctYsjC7Qhn
 GfVA2WpnaP9DnRMyVMYWAS5yKhlOLX3PKDtJygb1hApaVs73jLBQh91
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

With the driver supporting multiple generations of hardware, some mold
has definitely grown over the code..

This series attempts to amend this situation a bit by commonizing some
code paths and fixing some bugs while at it.

Only tested on SM8250.

Definitely needs testing on:

- SDM845 with old bindings
- SDM845 with new bindings or 7180
- MSM8916
- MSM8996

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Fix "set but unused" warning in "Drop cache properties in resource struct"
- Fix modular build with "Commonize vdec_get()"
- Rebase
- Test again on 8250, since nobody else tested other platforms since the last
  submission (or at least hasn't reported that), I'm assuming nobody cares
- Needs to be tested atop [1] and similar, it's in latest -next already
- Link to v1: https://lore.kernel.org/r/20230911-topic-mars-v1-0-a7d38bf87bdb@linaro.org

[1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=d2cd22c9c384aa50c0b4530e842bd078427e6279

---
Konrad Dybcio (20):
      media: venus: pm_helpers: Only set rate of the core clock in core_clks_enable
      media: venus: pm_helpers: Rename core_clks_get to venus_clks_get
      media: venus: pm_helpers: Add kerneldoc to venus_clks_get()
      media: venus: core: Set OPP clkname in a common code path
      media: venus: pm_helpers: Kill dead code
      media: venus: pm_helpers: Move reset acquisition to common code
      media: venus: core: Constify all members of the resource struct
      media: venus: core: Deduplicate OPP genpd names
      media: venus: core: Get rid of vcodec_num
      media: venus: core: Drop cache properties in resource struct
      media: venus: core: Use GENMASK for dma_mask
      media: venus: core: Remove cp_start
      media: venus: pm_helpers: Commonize core_power
      media: venus: pm_helpers: Remove pm_ops->core_put
      media: venus: core: Define a pointer to core->res
      media: venus: pm_helpers: Simplify vcodec clock handling
      media: venus: pm_helpers: Commonize getting clocks and GenPDs
      media: venus: pm_helpers: Commonize vdec_get()
      media: venus: pm_helpers: Commonize venc_get()
      media: venus: pm_helpers: Use reset_bulk API

 drivers/media/platform/qcom/venus/core.c       | 139 ++++-------
 drivers/media/platform/qcom/venus/core.h       |  66 +++--
 drivers/media/platform/qcom/venus/firmware.c   |   3 +-
 drivers/media/platform/qcom/venus/hfi_venus.c  |  10 +-
 drivers/media/platform/qcom/venus/pm_helpers.c | 323 +++++++++----------------
 drivers/media/platform/qcom/venus/pm_helpers.h |  10 +-
 drivers/media/platform/qcom/venus/vdec.c       |   9 +-
 drivers/media/platform/qcom/venus/venc.c       |   9 +-
 8 files changed, 213 insertions(+), 356 deletions(-)
---
base-commit: 445a555e0623387fa9b94e68e61681717e70200a
change-id: 20230911-topic-mars-e60bb2269411

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


