Return-Path: <linux-media+bounces-7972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C2288EDAD
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 19:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C7D529C3E1
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 18:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F6014E2CC;
	Wed, 27 Mar 2024 18:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yufmib9p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602F714EC64
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 18:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562929; cv=none; b=ha8sRwsH7hfKrCMoxxEHhijKXOLn426ng44RbQkgDs8MO2cRtu1NVUuM0eZBIFEVsCzX1UA0PTqiJ7QBflQwmRuxYMIETfXh5Nqg+mwQfg+Urdx/YrIikMyilgID+xZz2DrAMUZOoBRoiIwr2U/DcNTvhsMQGFOoXWTth3prAU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562929; c=relaxed/simple;
	bh=5X+Zdn4J7Sx+vjlv+C+dpGZruk8KxdzwFk8UAnYkPF4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Guoth8f38fJa0Hp+jAfItv/hXgZYT0OVaK3yNatGVApPMVckFN68VERXbXz9xdUJTkCW0vlDsrbB+Di3IrXm7XQ/+SWzGumTzMwLJM67EiP/Nrc/cCsHETRi8fPuxFU8jaHYLluMgsG6IjUUXiIZMpCxWa5IVk5aTGswhEDVtMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yufmib9p; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-513ccc70a6dso64016e87.1
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 11:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711562925; x=1712167725; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=do7k3J6OUzMnWn5ao/YpVOVlw0nFNOEmqZtivosXkIA=;
        b=Yufmib9pIfvNT2RB9COaqausn3Cp5swoANb65IGCAJvYOZ+F+4h7h63V2GI/DSdLZv
         9O+XtTPYISjX6VFtF6hSezeAEhIzBHqpHMbhTx6CtGL3Sb0l0dclfi2JuBnZz1ZIPTNu
         xPtuhPj+eTUXPqFTsAwdE5CasJKUGGOsTo3vX/MQ9xqcpzaaZTdzdlOkGYZfCUSXC5hl
         KIKjEqOXMsV7Rg9OoI/ctvDHWSuNcHryORiZ3N3+QVTPbf2FPYgJxxyMkNuxnBRBx+Ph
         FC/4V4m5p5OJ+QihFi0UwwuSgE/uTZV7GpZkGEC3AxpNZ73wWXRSaJ0w4IQAbtoljzoI
         M68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562925; x=1712167725;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=do7k3J6OUzMnWn5ao/YpVOVlw0nFNOEmqZtivosXkIA=;
        b=n0j2KJA0vNOh3wrlMaRP7kZ+PtMS3/xNyHDjxPQe87EJhN32QGJtwtwSRmAhHt8nqC
         FflJ280Mzg9MXhfsrCAP/8y71wiGwL4QHEmslqDUbS2O8XpiFhi89f+ExEVCws5Z39L7
         ufSY45f0Ftx5L0GCApMEAMIu+lnAlHLJJcN2Q0Tt/SXaNcCJag/cmRUpbcG7+RvNbkcH
         PL0ESanF9VSdPpJDv+2NaoMD3dt+NxoTzacXThWmb4O7jxqvLXUL8Nk+vjMY2PC7Cxkl
         wYIRbn+VJFL98pQl8DDqv690NKC6SdlI4gkHPZp6gkiewpXPdQOcrJFp75quJkdVZ+mj
         TVzA==
X-Forwarded-Encrypted: i=1; AJvYcCVUJqbG0tDvRSvolP4CHsIYzOrVgUpnhQ0QTIMqY3lNX7hbZKgb9eUeVmmLI+Is2iRZ6xROpW7hntEQl+zk2URx3bfaaba5SL09ylc=
X-Gm-Message-State: AOJu0YwKsFqNv0WEjUwlqLbMFjqe+2M9i/f1bcQ1C5t58SudQZZN09pQ
	wJUhGnlgJVbmBMMBkBYdP8bT5FASe0s5a+RVJDtwtt7ePVtSODLEJbFJrEvhwxg=
X-Google-Smtp-Source: AGHT+IGpn/tQC08ltoDLTaVOSOPnAOIJ4a0jkUhyNNQh+Sb/xS2v6hWrvFWPwQTJlIOixwmQn1hcJg==
X-Received: by 2002:a05:6512:52b:b0:513:226c:651d with SMTP id o11-20020a056512052b00b00513226c651dmr211712lfc.2.1711562925508;
        Wed, 27 Mar 2024 11:08:45 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709060be200b00a45f2dc6795sm5702733ejg.137.2024.03.27.11.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:08:45 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 00/19] Venus cleanups
Date: Wed, 27 Mar 2024 19:08:38 +0100
Message-Id: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKZgBGYC/3WNywqDMBQFf0WybkoeorGr/kfpIjeJesEmktjQI
 v57o7tCu5wDM2clyUV0iVyqlUSXMWHwBeSpImbUfnAUbWEimJCs45wuYUZDHzom6hoGIETT1Zy
 TIoBOjkLU3oxF8c9pKuMcXY+v4+F2LzxiWkJ8H4eZ7+vPduaUUd1aqaBXLVi4Tuh1DOcQB7J3s
 vjviuJKq42qQSlTf7vbtn0AJLJI8PYAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711562923; l=3124;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=5X+Zdn4J7Sx+vjlv+C+dpGZruk8KxdzwFk8UAnYkPF4=;
 b=vKUdBGHf+ENd3xkN9oa4QX3veaesQOVSsEeRFOn++rx0HaowqdxeRlSfl+H6YVr5Z57tKnCjG
 E85RANWYhiPBUTmPzg6v8CBARh9bvqUC0chKbEFkjGFEGmCwiDaOtX1
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
Changes in v3:
- Drop const within const patch
- Pick up tags
- Some stylistic fixes in kerneldoc
- Link to v2: https://lore.kernel.org/r/20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org

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
Konrad Dybcio (19):
      media: venus: pm_helpers: Only set rate of the core clock in core_clks_enable
      media: venus: pm_helpers: Rename core_clks_get to venus_clks_get
      media: venus: pm_helpers: Add kerneldoc to venus_clks_get()
      media: venus: core: Set OPP clkname in a common code path
      media: venus: pm_helpers: Kill dead code
      media: venus: pm_helpers: Move reset acquisition to common code
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
 drivers/media/platform/qcom/venus/core.h       |  22 +-
 drivers/media/platform/qcom/venus/firmware.c   |   3 +-
 drivers/media/platform/qcom/venus/hfi_venus.c  |  10 +-
 drivers/media/platform/qcom/venus/pm_helpers.c | 323 +++++++++----------------
 drivers/media/platform/qcom/venus/pm_helpers.h |  10 +-
 drivers/media/platform/qcom/venus/vdec.c       |   9 +-
 drivers/media/platform/qcom/venus/venc.c       |   9 +-
 8 files changed, 191 insertions(+), 334 deletions(-)
---
base-commit: 26074e1be23143b2388cacb36166766c235feb7c
change-id: 20230911-topic-mars-e60bb2269411

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


