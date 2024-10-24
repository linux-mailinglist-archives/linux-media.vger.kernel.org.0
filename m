Return-Path: <linux-media+bounces-20158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A941A9ADBF5
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 08:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 548321F230C4
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 06:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DB817107F;
	Thu, 24 Oct 2024 06:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FXjCmVbA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A078B17DFE4
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 06:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729750697; cv=none; b=O87uERNxd3q5XwQ2y9OvsskRXByYttG11k4q6FIS3D1BrbIq0cnof+jgECZiJQ5CVejqbneYj4+1j1ZXyRtd1oxH0yZUZGGOvdiKKFbqX5sTFDJzWvxNITWdeWlig2qBGHCCbUnAi55RCeExb4S9M+JbtDh+TAgGC/0hwM9Sr9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729750697; c=relaxed/simple;
	bh=xvHXD7Sxf6tgti9Zh3HY02O9Z5oWaluA27USkHsd2Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WhY0ev6EEC+qYkvrOcB6BraB5rdHBIqIkTwc8dKNVWL2jmxNGw4bmUTXYoE0TfohbHwytGcSFODpAp4P5tdWZlPx1cIgrxy0u92yymsujexReoh2edPOV11Yi2mqnGQoDAOOtGSXxL5dd9HLK3/K1+L5jLfIaZMJJUjYt+cCynM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FXjCmVbA; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c803787abso4372425ad.0
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 23:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729750695; x=1730355495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f0+q1MIaFTnyGhakBrCeGviCLva9CPSQoA7IMbCsTXI=;
        b=FXjCmVbAEh4eFftiP5Oibi6fi2tP2WUQQ0vmLMKBYRfo90lucOD3XEAAt1Fp4goiUx
         0LY85szTxDUxWalyaWaVJoRyfKP5nbbgpoGCAO1RDSJ/gI0bdymkABsuOsXauw7BwpBH
         pMtPwOUJvzGWk9vMwUdZnJ3fdPiNwp6vG3uow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750695; x=1730355495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0+q1MIaFTnyGhakBrCeGviCLva9CPSQoA7IMbCsTXI=;
        b=cNM5xEc9ayx0qUmtWFzLnrguxbcs6AYKQ9/GC/oK0z9hHzgqbHnGioHBxPVSHcR67h
         42y0rd/HTlh+Yraje4BOMAs3FoKvQReek7Z/DOLaQeH9CjwaMG+RXXBGjw0Xooc989T1
         ZSCpYdH1LCRJ1/tIYsddBU3lsxgfToD159PIYwgwMtuN3h/w9mAOAildGNpRHEcfDPnE
         /HP2MhyGcMvEANOfQPQPe7HppoTwp7NTayk9sLPPqUC9q4ZeA5wEO64SFfwh0S5lcUCr
         w1Hp/3e45eeOOuvV5AO21rDGAOBuMctay79JX0EEUd/lGOzo01Xx8ZsMc+0mhITyKLE1
         EbwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMw5lK6698c/hXOVSak5kI6WLLH1VTbMwUUml4WLtrg8grAvB9aIZXqbMjXNw92gEI2ZV0+qgCyrvw8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMMS3q5gNjuZHF7u41FgVCbV8kO/dyq3uWB6H6IVRRJe6CWYis
	hrCkrmDYrdQjC9De42LjXRQME6vDDBD1JQI7+w+jdEjBbgN+z6TF7Zq1DzuScg==
X-Google-Smtp-Source: AGHT+IFQxFviGHeiXxtOVNTLZO+cDk9rC6vusoMFJo9C+wrYXhIN6FRh/awN02p4XAP532k2jtjZBg==
X-Received: by 2002:a17:902:c403:b0:20c:7e99:3df2 with SMTP id d9443c01a7336-20fb89bccb2mr17836175ad.23.1729750694988;
        Wed, 23 Oct 2024 23:18:14 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:9422:d958:f749:9a30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0bd561sm66418885ad.179.2024.10.23.23.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 23:18:14 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2 0/2] media: venus: close() fixes
Date: Thu, 24 Oct 2024 15:16:56 +0900
Message-ID: <20241024061809.400260-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple of fixes for venus driver close() handling
(both enc and dec).

v1->v2:
-- reworked 0002, as its v1 made no sense whatsoever
-- use synchronize_irq() (Tomasz)

Sergey Senozhatsky (2):
  media: venus: fix enc/dec destruction order
  media: venus: sync with threaded IRQ during inst destruction

 drivers/media/platform/qcom/venus/vdec.c | 19 +++++++++++++++----
 drivers/media/platform/qcom/venus/venc.c | 18 ++++++++++++++----
 2 files changed, 29 insertions(+), 8 deletions(-)

-- 
2.47.0.163.g1226f6d8fa-goog


