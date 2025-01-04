Return-Path: <linux-media+bounces-24246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D57A01509
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 14:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E30841637BD
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 13:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939FF77F1B;
	Sat,  4 Jan 2025 13:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEQTE4+/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443C1450F2
	for <linux-media@vger.kernel.org>; Sat,  4 Jan 2025 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735997794; cv=none; b=P23fqxIkCkOzetB91ikRkC/1+mIXqQ0L/58HpOnaNIz9S+hCOrui3IrFgnq1gRMytOd0GW0mrZEL2bY+pVl1+leu7ldhdcHS5FbkUj6WOTDYvt5HZw59jDoe+vif5RtTDHrsaiCKIowjVqS5DiM4OA+f9Ok5e31SCtb3c/iJXbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735997794; c=relaxed/simple;
	bh=SCPhRezpFHyDudcAIBFzciRfl6PtF7ifJEjKWoZYJE8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=j1oHYo5WNTe/ZOk9Cu+9pj+Gj3KB16ocZNHKZNuCn5cA8UUN7E3ZA4kBjIaJq1EhXdmYPj6u3j0e60b1aO/ool36dw3llW83IdFe9RT3BACf+r4snWF4wwyBrL+afGNLI0641Ho1PB3koD97cI5N5WAfA7SxFGZfbL1ljHRDd/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEQTE4+/; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so19574851a12.3
        for <linux-media@vger.kernel.org>; Sat, 04 Jan 2025 05:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735997790; x=1736602590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=N9pxsmandkNISHu2iiG2T8mQ1aegRYtYTQ9qZ9RMgpE=;
        b=WEQTE4+/OP7vv0A9o7yT0m2UzLmCcqtPApymhCqUNWMZahTo/vx67Q6DcLxBvxdpSU
         qs9hbxxwPn7iSiDmA7JzTe3B16F3t17EkS+4HGp3oobrNsliRSBFvOIWRBnU2kE5jcRU
         GQceXCmHk6Jbm7B2rAE/rJdVnIUhIJH05D05XbggDp0rWMsrqx/gpkIFSnAdp5gPnGO4
         V+i/jMdnC7umWkr25lehCk35ZCU1oUD3X3/Sfe2t2/bqslJ6pbKNvcxSIxAo25G4eRwA
         iTtnoMCjiHwnhlxjFC0Y4rRNsYqRX6GI/bV8lIxkxq5sQydWfeDZXf3UksG6VWoALCo7
         5kGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735997790; x=1736602590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N9pxsmandkNISHu2iiG2T8mQ1aegRYtYTQ9qZ9RMgpE=;
        b=DDv2wtEPaMzJbXjexCbnvmLWinfGd8eh7CALa60NbRf6cj3fH4/fdgHJWcol+VKMMl
         YZt9bH4z4abt46AZyAS8DCNCDP+oqcQmd2gjlQjW6VaLujTdCnTyiu7NRy23BFOm2GuT
         JRQb4DJ8sntAapWMOM/4KCQqWLYCmGw9VOD2bgXxCmr/MZ/SU19CXXhY4lUOoRzMiw+H
         zzvAqL9T2rbsHBJbe69tZj0bJ2Ksxf3IUuJ6WprILG41OtYkBlDeoTW5zuOqJbt87gAM
         Y1v7VzXRopUWCPo0D7l6HhNa5dg65yvzqbCad5NCsFR1dl3pV8LrjiM9Kt4bUpNNHtfg
         Xx3Q==
X-Gm-Message-State: AOJu0Yyt+1uoBQQCwleKEIQCKKxmw82ccdP6eUMY0SxNfMwSsaneMRmg
	lmfO0NdTmUc2L2PT2QzBNYDdxUlWZrprdVeekBk2ma1XjtRWTyTJ7hkqRw==
X-Gm-Gg: ASbGncsGnwFVKJ9PGWAnKfHlT8Vk31F+sCyuRdZvrTSnjwg1E0BFgGgij8cwFNoAGC8
	UGPgSg9h5jd4Us9zsS5krDrW2lNxSJb8ylq7OhWCBJL/KFT7rEqvKvPb92GupSMwJrdL1+PBaBk
	JaIPa1uT/o7Hb2qFnFT96hy0u0viopMkZsi8NELJ+0KpVhhsvubSljhM3lOoJXw/qyZwcvbgg5y
	g8q67P131fNo+21As9VyL/XfDo55Uh/tE6bCslPeGn1sYLKNpwcB+VFOmbDhSD8fECmvb1DEUy8
	uXcJKT2jN887qRtyEJ8z
X-Google-Smtp-Source: AGHT+IHASSl9MsOaBrys3buPT2Rp2LdqGu2IKVUTc0AT4AxJ41BfMLEKvItYRLsV91nY61CzvbWKVQ==
X-Received: by 2002:a17:906:730f:b0:aa6:80ed:e9a3 with SMTP id a640c23a62f3a-aac2d47a722mr5176037466b.35.1735997790324;
        Sat, 04 Jan 2025 05:36:30 -0800 (PST)
Received: from aero-laptop.. (79-100-30-28.ip.btc-net.bg. [79.100.30.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe467esm2022082066b.104.2025.01.04.05.36.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:36:29 -0800 (PST)
From: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.14] Venus updates
Date: Sat,  4 Jan 2025 15:36:26 +0200
Message-Id: <20250104133626.352432-1-stanimir.k.varbanov@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mauro, Hans,

The pull request includes:
 - A fix which partially reverts 45b1a1b348ec1 ("media: venus: sync with threaded IRQ during inst destruction")
   because of regression. 
 - Add support for static video encoder/decoder declarations which
   will eliminate the need of video-enc/video-dec DT nodes on every new
   platform when they are not needed.
 - Remove unused internal driver function.
 - Cocci fix for decoder FPS.

Please, pull.

regards,
~Stan

The following changes since commit 40ed9e9b2808beeb835bd0ed971fb364c285d39c:

  media: uvcvideo: Announce the user our deprecation intentions (2024-12-19 14:44:43 +0000)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-for-v6.14

for you to fetch changes up to 0af2a8828984a22c15938ba8376e48fad98d5f73:

  media: venus: vdec: Make the range of us_per_frame explicit (2025-01-04 15:20:32 +0200)

----------------------------------------------------------------
Venus updates for v6.14

----------------------------------------------------------------
Bryan O'Donoghue (3):
      media: venus: Add support for static video encoder/decoder declarations
      media: venus: Populate video encoder/decoder nodename entries
      media: dt-bindings: qcom-venus: Deprecate video-decoder and video-encoder where applicable

Dr. David Alan Gilbert (1):
      media: venus: Remove unused hfi_core_ping()

Ricardo Ribalda (1):
      media: venus: vdec: Make the range of us_per_frame explicit

Sergey Senozhatsky (2):
      media: venus: destroy hfi session after m2m_ctx release
      media: venus: match instance creation and destruction order

 .../bindings/media/qcom,msm8916-venus.yaml         |  12 +--
 .../bindings/media/qcom,sc7180-venus.yaml          |  12 +--
 .../bindings/media/qcom,sc7280-venus.yaml          |  12 +--
 .../bindings/media/qcom,sdm845-venus-v2.yaml       |  12 +--
 .../bindings/media/qcom,sm8250-venus.yaml          |  12 +--
 drivers/media/platform/qcom/venus/Kconfig          |   1 +
 drivers/media/platform/qcom/venus/core.c           | 113 +++++++++++++++++++--
 drivers/media/platform/qcom/venus/core.h           |   4 +
 drivers/media/platform/qcom/venus/hfi.c            |  23 -----
 drivers/media/platform/qcom/venus/hfi.h            |   2 -
 drivers/media/platform/qcom/venus/hfi_venus.c      |  11 --
 drivers/media/platform/qcom/venus/vdec.c           |  25 ++---
 drivers/media/platform/qcom/venus/venc.c           |  18 ++--
 13 files changed, 141 insertions(+), 116 deletions(-)

