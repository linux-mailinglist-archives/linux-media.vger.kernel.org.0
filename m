Return-Path: <linux-media+bounces-15000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0E2930C01
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 00:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B823281719
	for <lists+linux-media@lfdr.de>; Sun, 14 Jul 2024 22:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7F238DD7;
	Sun, 14 Jul 2024 22:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mLotulF6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D29B38F86
	for <linux-media@vger.kernel.org>; Sun, 14 Jul 2024 22:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720997635; cv=none; b=iRc2T8dHlVCNOpMNVmW78Vggsu95vvg+OkF/Mh5L4wawtB41HRPl2qOkmdkYCu2k5jTs2oT4FHMGbTLf3tk/MRyXZdxLkq93+5O+JfTPSGcalKxttOCkDAfYUvzomREnwXvbSy8ywHauPGupumlBRoMQ4C5iYaOToccWY2Uj9V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720997635; c=relaxed/simple;
	bh=ys1n5+ZFESe4r0ck3NYdHAwyXgdZq/cIcFI1NLRzeJQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p5Y5sGYyrhF2udDMFO37GMDlY6IdcGTC+LP8X2fc7isv1EBQegzEXAGLjyGQApznC87jhdKFe4AWgewlO9JA9CPmDYbbCaF+Gnf4eqGe/AauMMGA9PqM1UsV75IIEu3E8+/As+3pfGfz3JeGm377B1RLD5WHVlbwxqJ6/xqcIbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mLotulF6; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ec61eeed8eso49054371fa.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jul 2024 15:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720997632; x=1721602432; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vSw6ICbIjXMbfWEuPsG2mS7dPjLtUBfPSwkxJ1RENbc=;
        b=mLotulF67lpJEJT8EW5r201Ea5q1LIydOTSJU9ntoCxMWK5NeYEE5pUQSzFsBtkC4m
         oRAb6ZRP2W7hC2C/xf0NXKMTQ0iHlYFW7fKfeDWlqRYtvuH/hfarNdoAF97OLDNeJt94
         0Cbw3L6lZjzzSy6KK10L/dEoOjIVDC1z1MLf1hKsNlKgHHmKG05+PpXJfGdPr+aDfeGF
         nrql0K9sHxaq4H4GUp+ALHLJt3f2IIZdgGMteZpw8Rcs+77U1nGikf7t1+kl6yQNQyjj
         iVfc49MfVI8bk9VY5RJTt9TssQcI6bxlqjC15BI528HMcPqoJtoMHCvcMDhORb+t0sIL
         G8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720997632; x=1721602432;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSw6ICbIjXMbfWEuPsG2mS7dPjLtUBfPSwkxJ1RENbc=;
        b=JpJMX3ARiOAWWuJ8nBxzLZw/QgTr0I6rAtdD2BOqa7BzRwhU9QdK+10fSVRGT6EtIw
         LrXU0utbIj+eHAbWaF2AHPwLPxqURNI5YOr6tyPSZI1DIVHPkjbegyoNNLMnA14GAmT1
         Uca8RbPSJ59DsSgT4pJLCjKd1lPnin36EL2mgigMK/i7PCxeM9P8HYDIhqMzUJEjNtgm
         zncBWR27GUKgrXojUbZzKyWk2hP4qu2tRT5UUG2lqPnPMHAcJ+6NdQAjjOJ/0PqbpD4w
         yFoEaK/9RZCw3UFDSwuxONsRCKGHpzQDiCoVj2U5tLk5Bx/TR2yo0ifEM/blsf3byGrD
         /J6Q==
X-Gm-Message-State: AOJu0YxRDT1AdbiZIA5BhkKovLVUP2gLEkBEJX6D6BvqAi4osSwxW0Gg
	kF1MJgUd9mFXcXYJqPTCp+UefMlqfujib/e9NujZl0+H9MqGX++eICj6W2DRvjs=
X-Google-Smtp-Source: AGHT+IFFzYXnyaWp/sJbKfs+k/FzQVbblKsLFmcyHIJF9nrUmA5AXXCdjCLKSI2LbxePqTiJWX0jzg==
X-Received: by 2002:a2e:9693:0:b0:2ec:6755:a0cf with SMTP id 38308e7fff4ca-2eeb31895b8mr109208351fa.32.1720997631587;
        Sun, 14 Jul 2024 15:53:51 -0700 (PDT)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279dae34casm40632445e9.0.2024.07.14.15.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 15:53:51 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/2] media: qcom: camss: Fix two CAMSS bugs found by
 dogfooding with SoftISP
Date: Sun, 14 Jul 2024 23:53:57 +0100
Message-Id: <20240714-linux-next-24-07-13-camss-fixes-v1-0-8f8954bc8c85@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAVXlGYC/x2MywqDMBBFf0Vm7UCMia9fKV2EONUBTUvGloD47
 w7dXDj3wDlBKDMJTNUJmX4s/E4KTV1BXENaCHlWBmusM33T4sbpWzBROdA6ND3qF8Mugi8upBv
 GIZqx88HPoJVPpr/QyON5XTc1lDBEcQAAAA==
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hansverk@cisco.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-13183

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


