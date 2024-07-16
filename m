Return-Path: <linux-media+bounces-15058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9A893341F
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 00:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB8C31F216D8
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 22:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312C0143899;
	Tue, 16 Jul 2024 22:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="slATpH1q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B884C1860
	for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 22:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721167989; cv=none; b=IQpqpGV5HaLffyzhxsv6wKc40DguLs4imQFu9DXX8sWerWIQpLbAVP97jzyxEunBts0sQJ/gKtkn/g/rEbwwIb8n/g3oVBwc+2QbDl18mPEb+je3N+iztWNAJUHbe2LvuySAO/WBGQq3IfeH1FS7KU9w3yorDoswYCJkUv278xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721167989; c=relaxed/simple;
	bh=UfxoPitMaKS4uL2fg6YY7BkFuaoC1Yyd1kVsVIG0HX0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D7mdzLHGK6De0CVk6iCuwwKYOngieeF8SJvs6xZkXj+Ma7011c3zm7/gLubc9JFzj+l3pwsPGgGvfxXf72UPewU/8/5r+16/dKG4p/YraCCFWJuikRnyyOYfDGEci++TKhxRKVpQSvLww+p8Ymjc9IIzTgt0Z3KN197DF3x35WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=slATpH1q; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-58c947a6692so7692243a12.0
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 15:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721167985; x=1721772785; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OWKj2Qy9GB1PksJ0/OQajfy4XSpvSn3p+KH1EsPaTSE=;
        b=slATpH1qRFdYM5U9W5IjbrMKSJRBUwUoh/8DV5CT3t0y7qK8w9qbZWT5boCDA8NAwE
         MiwvsX2fcyW3GMbjnFV+HsO6F+l/NNIq8S2ijE7kDI19gVfBn7KWtylbPXVouQ03X2ZW
         7nlRQck5/WNeED5nzzgjzKFqBFn418mYcUnOUKwZbG2qf6/PIW2vbJthZkfGjTG7rJWW
         gXnHStM50JsjQIHflvECbcooPQnhbRtgnGNaSik1Y93YQpDKPGaVtOQhRV5Ru5s7vRQ0
         UccUfAvEz65kLkoXlr1b4OXxw2od3xUfPIjvXNS6FGXVeCAsIl+5Y9FbqB7o83M04Zod
         8TFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721167985; x=1721772785;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWKj2Qy9GB1PksJ0/OQajfy4XSpvSn3p+KH1EsPaTSE=;
        b=mdK4Jz4peAcyZxn/WbkcdQiLENNeFuIUVy9H/EsvTMuQwFj/8UC+7XeFehd1zit5U7
         IgJfcz3fiGVthD6IQkKd+/uDsUuXAlESqOd71xR2SBaJlNoXIaqQUratJB+H0EzpQAlv
         4LQ6h2tXN2xivh5kPFh0Im6jBTh2sf4UaLxlyTCLgQ7KhYVqBQwbaef9h9aiaRYxbec4
         yyCTC6uNG6DKyZu53HhWKtzrSBcT3A0Vc//kW1zIlBR9X9WHHMk6T/GAoBQmuhV58wiF
         1RSzAZMOlgNmDIUpwGNDZ5aV4NDi1uJiByFUS2KTVDCLmO+7BSsEEGw7d+OXKAleetlL
         4uFQ==
X-Gm-Message-State: AOJu0YzNHBSTYm6AyX8n6uxC0xbi6yc1uo0bDPbYLfWnIelvS5UveTxv
	FytUp9UdGn8mZbDZmAsrhow0i//55BykGvE529XIHtTAP3Ob6Rbu3yBJhVrMo0A=
X-Google-Smtp-Source: AGHT+IFO/llIMhBjWdvoGGbmOFXa5izdfPmyddf1gqBXhtYJN/T4CsPdhiUXJkJvkOuxOQx6a9RoCA==
X-Received: by 2002:a05:6402:388b:b0:58b:abc6:9cec with SMTP id 4fb4d7f45d1cf-59ef0ed3199mr2010850a12.40.1721167985082;
        Tue, 16 Jul 2024 15:13:05 -0700 (PDT)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b268a28ddsm5582997a12.71.2024.07.16.15.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 15:13:04 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/2] media: qcom: camss: Fix two CAMSS bugs found by
 dogfooding with SoftISP
Date: Tue, 16 Jul 2024 23:13:23 +0100
Message-Id: <20240716-linux-next-24-07-13-camss-fixes-v2-0-e60c9f6742f2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIPwlmYC/4WNQQ6CMBBFr0Jm7ZhSWymuvIdhUcsATbQlLRIM4
 e6OJK7d/OT9yby/QqbkKcOlWCHR7LOPgUEeCnCDDT2hb5lBCqlEVZ7w4cNrwUDLhFKhqJA7Z58
 5Y+cX4rS1caI+a6tbYMuYaD+w5NYwDz5PMb33wbn8tj+3+uueSxRoOlNrdXfGGX3lD5viMaYem
 m3bPqFtrWjPAAAA
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hansverk@cisco.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-13183

v2:
- Updates commits with Johan's Review/Reported tags
- Adds Closes: https://lore.kernel.org/lkml/ZoVNHOTI0PKMNt4_@hovoldconsulting.com
- Cc's stable
- Adds in suggested kernel log to allow others to more easily match kernel
  log to fixes
- Link to v1: https://lore.kernel.org/r/20240714-linux-next-24-07-13-camss-fixes-v1-0-8f8954bc8c85@linaro.org

V1:
Dogfooding with SoftISP has uncovered two bugs in this series which I'm
posting fixes for.

- The first error:
  A simple race condition which to be honest I'm surprised I haven't found
  earlier nor has anybody else. Simply stated the order we typically
  end up loading CAMSS on boot has masked out the pm_runtime_enable() race
  condition that has been present in CAMSS for a long time.

  If you blacklist qcom-camss in modules.d and then modprobe after boot,
  the race condition shows up easily.

  Moving the pm_runtime_enable prior to subdevice registration fixes the
  problem.

The second error:
  Nomenclature:
    - CSIPHY: CSI Physical layer analogue to digital domain serialiser
    - CSID: CSI Decoder
    - VFE: Video Front End
    - RDI: Raw Data Interface
    - VC: Virtual Channel

  In order to support streaming multiple virtual-channels on the same RDI a
  V4L2 provided use_count variable is used to decide whether or not to actually
  terminate streaming and release buffers for 'msm_vfe_rdiX'.

  Unfortunately use_count indicates the number of times msm_vfe_rdiX has
  been opened by user-space not the number of concurrent streams on
  msm_vfe_rdiX.

  Simply stated use_count and stream_count are two different things.

  The silicon enabling code to select between VCs is valid but, a different
  solution needs to be found to support _concurrent_ VC streams.

  Right now the upstream use_count as-is is breaking the non concurrent VC
  case and I don't believe there are upstream users of concurrent VCs on
  CAMSS.

  This series implements a revert for the invalid use_count check,
  retaining the ability to select which VC is active on the RDI.

  Dogfooding with libcamera's SoftISP in Hangouts, Zoom and multiple runs
  of libcamera's "qcam" application is a very different test-case to the
  simple capture of frames we previously did when validating the
  'use_count' change.

  A partial revert in expectation of a renewed push to fixup that
  concurrent VC issue is included.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      media: qcom: camss: Remove use_count guard in stop_streaming
      media: qcom: camss: Fix ordering of pm_runtime_enable

 drivers/media/platform/qcom/camss/camss-video.c | 6 ------
 drivers/media/platform/qcom/camss/camss.c       | 5 +++--
 2 files changed, 3 insertions(+), 8 deletions(-)
---
base-commit: c6ce8f9ab92edc9726996a0130bfc1c408132d47
change-id: 20240713-linux-next-24-07-13-camss-fixes-fa98c0965a5d

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


