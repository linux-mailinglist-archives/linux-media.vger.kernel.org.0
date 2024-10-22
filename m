Return-Path: <linux-media+bounces-20053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4E59AB549
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 19:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4A9A1C22EFC
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 17:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35891BE872;
	Tue, 22 Oct 2024 17:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CRAE6afW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0511BDA9C
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 17:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729618848; cv=none; b=DFmzGyE8KtLwZdE/3T2vEgQEkYTbsFXSck8u+VfdLnaFzKGdkBmboeI+PRAx3jLqIiQWASOS2JvoTCTvt/FXwSsXUQs13DNToJlig2rgmf5BtZkp/dym0TXMLIji1Uw+wRLNkUUoJI/KeEUP2quXHSms6wMu+4olTVHR0UTe4Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729618848; c=relaxed/simple;
	bh=C0yUyZ6XkQJmWA3d7HhAPX4tnErtrKNS5NnyzznqJX8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l3hWEqc4EHMuIFUfoulpKYsDF3eMrpvGWLSLSRw0EMozvdSnm1z7TZ45PxHJ1LC7Edq4TXmlrG0W01lBkVesHS/4rNEFMb7AwT8ngl0onvgIrQT+MLLrZq9yvM61V0tQv54NIcFBTHWLtS8s1KW+DcaoelhxVSO3PFUvyXxOKcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CRAE6afW; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ea8c4ce232so4993976a12.0
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 10:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729618846; x=1730223646; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oupby0dRgGN5Xj7RL7U1Svi3uhRY52g3w01e/cCB/qY=;
        b=CRAE6afWjlMf8YlQShYEkV+SoylcX5ZAifgdY1FNwbmkOIVIvbg5ovrhTf2uO+WuXX
         WRHU9/H56ApardiKy8+rUy8fJiSoMZSc2pPQ7MYhrai4sxAJ2RNV4bgnTPgLE9c4S/uO
         Ocanq+upQ927LS6Gk07INCRjxA4RgcyC3Hso4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729618846; x=1730223646;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oupby0dRgGN5Xj7RL7U1Svi3uhRY52g3w01e/cCB/qY=;
        b=OvSIx/hqAO/dOnJ1oqu1WO7MYsjwqPbV0KKXQzkdTtthvsCbD+Yt1oEl6Xgq9tqkEG
         58Z4tOJiV9YbPIT5lVkXNAcYa3dejlf5mSrcnQcb13cFmm6Su0wxlVv59xgYZSjrx7N3
         G6yxuSQZJyWsVMFZm5G8s58yUH19yDWVhTsgZP1SctBI3DhWZO8IfudJNTx/DgJRLJLz
         JPDCt5YUqBlD/vk/t2CpC+CsZ7Or09bMHw4dTBpOz1Lwe8TApbcjP+i2pIxW3EOCQ/od
         M1Y53A57Sb9hWjUexWzqmpC6jMpTo+IJoASH+6GU2nItya7c0Vn/SqGe3GjKnBn/ZXYz
         2yHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX53yKDcgOKP7XnqfCLeQaCkvl4RjyXJ2T/Xln9Q3Z5Hbmkv4Nqpc5cLoFhUE+R7MtqPmQCMN8SZ4gcDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQvvQ80wpKY/py53ijtrsfy+MfaHGNICDTDG0VqWXz+CM+ZDWu
	twbf4yMM2aoPQIfoE4K+Nl4gvyBH2snV2XFspr4/9/bd+c/pvdi/iEQSQztmGA==
X-Google-Smtp-Source: AGHT+IEWT04yh/p+RAO8GEp7u2SQSDOAW6FFU8HzqLUb7plIoEg+2ByMr21qcUeEkUAFRuS94KYlgw==
X-Received: by 2002:a05:6a20:e608:b0:1d7:7ea:2f2d with SMTP id adf61e73a8af0-1d977586525mr449373637.6.1729618846204;
        Tue, 22 Oct 2024 10:40:46 -0700 (PDT)
Received: from zipper.pdx.corp.google.com ([2a00:79e0:2e13:6:158a:d1d:c077:7770])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1312d6bsm4992423b3a.29.2024.10.22.10.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 10:40:45 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH v5 0/2] media: venus: Add hierarchical h.264 controls
Date: Tue, 22 Oct 2024 10:40:41 -0700
Message-Id: <20241022-submit-v5-0-552f0fec8cba@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJnjF2cC/2WMvQ6CMBRGX8Xc2ZoLbW3j5HsYB+gP3AFqWmg0h
 He3MDDoeL585yyQXCSX4HZaILpMicJYQJ5PYPpm7BwjWxhqrAXqSrA0twNNDKXW2KASXCko51d
 0nt576PEs3FOaQvzs3cy39S+ROUPmlUXpuNPyinfTxzDQPFxC7GCrZHGYFVbqMEUxrZZ1a5RX3
 pofc13XLw2WEgjZAAAA
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Nathan Hebert <nhebert@chromium.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fritz Koenig <frkoenig@chromium.org>
X-Mailer: b4 0.15-dev-37811

v5:
- fixed formatting
- included reviwed by for patch 2
- Link to v4: https://lore.kernel.org/r/20241017-submit-v4-0-d852bc7f7fdc@chromium.org

v4:
- addressed feedback from Dikshita
- included reviewed by for patch 1
- Link to v3: https://lore.kernel.org/r/20240814-submit-v3-0-f7d05e3e8560@chromium.org

v3:
- dropped reordering patch
- updated cover letter

v2:
- cover letter
- testing methodology
- Signed-off-by

V4L2 has support for encoding with hierarchical frames using the
V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING* controls. This allows for
specifing frame references needed for temporal scalability. Encoding a
single stream with a single layer allows for the layer to be dropped and
the stream to be decoded without artifacts.

ChromeOS is planning to use this feature for the L1T2 web standard[1].
This allows video conferencing apps to encode once for a clients with
different performance/bandwidth capabilities. As the application is a
real time encoder only P frame support is added.

The ChromeOS test framework ("tast") was used to verify that no
regressions are present. This was done on SC7180 ("trogdor"). These
patches were also run on SC7280, but not with as an extensive test set.

Verification of the added controls was done with a bitstream analyser to
make sure that reference frame management is correct.

[1]: https://www.w3.org/TR/webrtc-svc/#L1T2*

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
Fritz Koenig (2):
      media: venus: Helper function for dynamically updating bitrate
      media: venus: Enable h.264 hierarchical coding

 drivers/media/platform/qcom/venus/core.h       |   4 +
 drivers/media/platform/qcom/venus/venc.c       |  71 +++++++++-----
 drivers/media/platform/qcom/venus/venc_ctrls.c | 126 ++++++++++++++++++++++---
 3 files changed, 164 insertions(+), 37 deletions(-)
---
base-commit: d07b43284ab356daf7ec5ae1858a16c1c7b6adab
change-id: 20240814-submit-05880a074377

Best regards,
-- 
Fritz Koenig <frkoenig@chromium.org>


