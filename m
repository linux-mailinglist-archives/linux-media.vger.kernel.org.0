Return-Path: <linux-media+bounces-13549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B36CE90D338
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C52C31C248D4
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DA1168490;
	Tue, 18 Jun 2024 13:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a54VkgDI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED2416630B
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 13:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717873; cv=none; b=h5ZfrpQpS65BznONZCRfZIkgQ5hkWs5skJMf5QdAyTUBds6u9dQCbbnOd6OWc8WlfVdYDF/Gr6uXHIQxWfeUeV7TU+NUyG8LYC8iamUtdhSGkESKrOxqKreNrk0AtZNEnRRX8/MEBb3P7t5TGQ8bUknw135WnIi/iOEw2LTydo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717873; c=relaxed/simple;
	bh=j5csWzs5Y5FgVeCATjwZ5TPGuFEPTVbCMgWLgEyntJE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TMyYVSGi8DSvwE+x5g6H6EQCyPfdR55z7YT+/c/WXQH4X6qoWGOS1ztbnJRef6rnXAM+Rdbryl8PKf3yZn9CrwA+td6l9GpX+RqSKMpcV1YLsrYHEmUXR+ZN6bWWUS/BDAwlfSe4GAdT6hLRRc5zzdRmDt52gAzF2eG4pnxP9rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a54VkgDI; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7955dc86cacso307994985a.0
        for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 06:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718717870; x=1719322670; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sEpVQCs2WHPPTvu4z+KjnxCNs4018NndKnoPIviIAFs=;
        b=a54VkgDIdcJLmnBtk3hWVmnaf6Ri+61erAq7EnEXo69vUuyTHWWj+DtcEzqObFdpHs
         JXmQkMzPKM/Gz6SINJUCqngT0+8xfi+M75cQYoGGM/fmjVreNoExzp/7IUQxXAwJB/iY
         ShczuByLTizbLWyU5fyoR+ShS+K35V+PcIC9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717870; x=1719322670;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEpVQCs2WHPPTvu4z+KjnxCNs4018NndKnoPIviIAFs=;
        b=mWh2qXUFvf48zi8jPmmKWAOjjblH+7mElK+nuVrZaggWfUml9v9w3rJOjq4Pt1FGiv
         l37DZ1qtWoC66e/l+ITr2DOFKk7wspFM5V54pLCsCVeAWFmonLDMMEALZFpmD3YfXwb8
         DwdPMcNVpMtocSvZRvMnV48gWeMaQPy+UGdI96tFPQKgqkWYdMkLL4+bFhJg8o7Et+12
         Ptih17AeONnhS+9ZFZQaBJ3K8Pne1yUEnIUJwY7qyiDgSgp1PLJVcm0W8ar1KAsV9ZYE
         ls1wUJL/hDnh2xCL6pEpGN7qBawqWYnj+JSvOYF/55GMXWNHCwJLv3pKkXfkiBL+2O8T
         QLZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZPjoyNzb5eDrjy2YLB8D2xN7r5t6veXay7lza0mbGwsm7SylhUXd1qJIDGWtXDTbCaBdq40gHyapLT52S/rsTChPl/7vf/16WtYM=
X-Gm-Message-State: AOJu0YwK9AQSIv6uYRnuUXi1xBGKRMOiXIPO5lHTOn/PiP2t+lN6bdpp
	dhyq9MeaSnW1NnxcvmTb8VFQp+ZjPeHFsEXVEW3DcldY9LMQTQnARCPayJXX13CJXp5o8h5b5Sz
	db60N
X-Google-Smtp-Source: AGHT+IH+ATJpISlghCZ51TrPxjKevVpBG/hMTEI2lIHtfsOfK8SDQ4iCfGcEmZ7/L9d2wqjt2jNSAg==
X-Received: by 2002:a05:620a:2587:b0:792:9482:a9a7 with SMTP id af79cd13be357-798d243a9f1mr1406570885a.44.1718717870280;
        Tue, 18 Jun 2024 06:37:50 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abc06e93sm521666385a.82.2024.06.18.06.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:37:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 00/10] media: Fix the last set of coccinelle warnings
Date: Tue, 18 Jun 2024 13:37:43 +0000
Message-Id: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKeNcWYC/4XOzW7CMAzA8VdBOS+T43w03Yn3QBws16WRBkHpq
 ECo777AZRMUcfxb8s++qlFKklF9ra6qyJTGlA81/MdK8UCHnejU1VYI6MBDozkzJ91/y5lKoYt
 uKUJDUQxEUXXrWKRP57u42dYe0viTy+V+YDK36WtrMhq0I4eG0fQdhDUPJe/Taf+Zy07duAnfE
 FiJhoQwIPcQ/AJh/xG4QNhKcEfQsrc+mqUv3B8RIDwTrhLWNq2IF+kwPhDzPP8Cy9CkWXoBAAA
 =
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

With this set we are done with all the cocci warning/errors.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v5: Thanks Vikash
- Remove patches already merged
- Fix typos and remove hfi_resource_ocmem_requirement
- Link to v4: https://lore.kernel.org/r/20240606-cocci-flexarray-v4-0-3379ee5eed28@chromium.org

Changes in v4:
- Remove patches already merged
- Combine dvb-frontend/mxl5xx patches and use flex on both (Thanks Hans)
- Link to v3: https://lore.kernel.org/r/20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org

Changes in v3:
- Do not rename structure fields. (Thanks Bryan)
- Link to v2: https://lore.kernel.org/r/20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org

Changes in v2:
- allegro: Replace hard coded 1 with a define. (Thanks Michael)
- Link to v1: https://lore.kernel.org/r/20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org

---
Ricardo Ribalda (10):
      media: venus: Remove unused structs
      media: venus: Use flex array for hfi_session_release_buffer_pkt
      media: venus: Refactor struct hfi_uncompressed_plane_info
      media: venus: Refactor struct hfi_session_get_property_pkt
      media: venus: Refactor struct hfi_uncompressed_format_supported
      media: venus: Refactor hfi_session_empty_buffer_uncompressed_plane0_pkt
      media: venus: Refactor hfi_session_empty_buffer_compressed_pkt
      media: venus: Refactor hfi_sys_get_property_pkt
      media: venus: Refactor hfi_session_fill_buffer_pkt
      media: venus: Refactor hfi_buffer_alloc_mode_supported

 drivers/media/platform/qcom/venus/hfi_cmds.c   |  8 ++--
 drivers/media/platform/qcom/venus/hfi_cmds.h   | 38 +++----------------
 drivers/media/platform/qcom/venus/hfi_helper.h | 52 ++------------------------
 drivers/media/platform/qcom/venus/hfi_parser.c |  2 +-
 4 files changed, 14 insertions(+), 86 deletions(-)
---
base-commit: 24147897507cd3a7d63745d1518a638bf4132238
change-id: 20240507-cocci-flexarray-9a807a8e108e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


