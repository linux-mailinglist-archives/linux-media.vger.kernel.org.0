Return-Path: <linux-media+bounces-32393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D26EAB56F3
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 16:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05ADC7AB576
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 14:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBE62BD018;
	Tue, 13 May 2025 14:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BDNoFGOO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5C71917C2
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 14:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146245; cv=none; b=unZnLW7xnn3nV1tvyd2KObH26/P2pQMoS0whvrcYzRy/RdBmPQrTNa/FprieSrj23Fm73Y3+rTD6CIc72TiopcayByCEnkgxoJ67YwQPozUcIIVQCoR6iJe9DvjxsyRWpHkwrkAAp1IqhRzk6FH2BrW7UaV4bJ/qLSfzKDO8ICc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146245; c=relaxed/simple;
	bh=kkZ+oXEH0zmpzv/CvYLZanVOw7+2wHcXfJATZ/nFZhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RFRwI7BX05jX4xT4QNn82gsxTtpVvqMIGLQFiCjFzhiwt5ka4N7PwvRJ1Ijmy0X199X1D5gPj4OY4qiaBMIp7TdefzkgPdPBwcvKEbwYN4KMmXBhyTcflCkEfl7BocbbnZ+LpZJ0vtzpsEqknrvd/NctZTwWnwhWrYogdF2Sq58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BDNoFGOO; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54fbe1f679cso648793e87.2
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146241; x=1747751041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GcxUlFICh2iCrxEXjmIj+SSgeewj3woQFngi6oh0Gxo=;
        b=BDNoFGOOA8X8waTRlhaqXjCF+w6Jvr5klf3BUQYSSuxddn2usLKpbgYxXtoyvaT7G7
         xGbIwI/N7Erf8gBtdXisyr6kDxAi/9jlWEt1rBE8dfFCrsyBrjELYFkFI08HgzraGC2T
         F5nQ1SR0CpkDyOwZgot1iHjWBPjNoN2B5aj9eqvR69wU5qtWBFjdsqwBl5zEPtOrBz8w
         Gpv9pbjJefpv941NcasuxgW+Z8+0Hjv1YdHeFM9g+y6mKO2DnSgx81Ua7ATg+IONZzXs
         hU5BU+W9qlGL754zEHtrYFN3WhMQA9ae1m+uEdBGAIi/350Ua//fFmOHdcCh5gbEyGQE
         X9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146241; x=1747751041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcxUlFICh2iCrxEXjmIj+SSgeewj3woQFngi6oh0Gxo=;
        b=IM1bOdElAfJLyMuSIQ7Vuy0MXP+wJXdaXrqPxPAUVXAXEn9Ahd/JObmGQIRp7Zq8r9
         kznP93jhHI+rFWqjFZBCU6hliydbX6q91QhInAmOsHrYRM6WunAzYz/roDKzd+Wp3ARF
         mM/RDjGDUMQDtQGLoJ4+KS/BHRDFmGq8SUGCQMAlZxaWQ2ceka8IZbLyu7/PgG3/6Qsz
         ql+/ZezdyP5BxiOHHMUI/2/oNuAmQhlAeRK9r47UI4bxh1tTx8u5gQd2qRTHIOB7D/Oq
         exFpx1xj8Hq8a7pG16dg82UAjdbCF8WYVdVc3VCe769qsWIkkwgXnx0O56PUHi7qJUG6
         WTfQ==
X-Gm-Message-State: AOJu0Yw3/661/q+aEoDFli+UaBE6CdQmtFlJ4b8JBaIrmZH8yhYGmE3b
	AzsumPtIvNVe32QN5WatHwjDxTPo6/DVk85Zhk9kNTEaT0yPobwPouevVTxCO0U=
X-Gm-Gg: ASbGnctQaWq9m9sG4RSpvHbMK6xMUyYdx2TMRlGpKvCmWNzZ1LtPiXI8tmLfCMeuT5r
	co2EcFTTxXkwUyfGdoA9yp5PTrI4Ie4ZNg1W2w9ltOt57C+gatRaqtHGPUStfTNDZj+7T6kNseg
	+d0AZXjrSM62MPDJb/5mnbc8qkIcugGP3pkRNgoVk/uLV90kXXOyCGMMDoBgPf47hBwicHkMH/W
	CqOkYWNoIAIUiBKnzp/ad7EZiyPtnH0wCRobG0TRaY93Qlis7mrJLLPOjqryDUTNfXi0BapZWXK
	e2BrhDkPMjqmhFYT65z+VY41lwk121siNrjLTNIAvTXuyuyiM4A6o8aWtifohAC8lTB5iDfEboZ
	DG1EIuIqAolA7yxByDEC+DwTEqvPfvbfaRhd+J9Up
X-Google-Smtp-Source: AGHT+IGDkLbyBVwrjWn6O4fXzjpRjNtjQ3XGBm6TwmK8QRCeTLAXdZq4thsNYlkiC1iRIseQ5Xr1qA==
X-Received: by 2002:a05:6512:6c6:b0:54f:c51b:d828 with SMTP id 2adb3069b0e04-54fc67b75b1mr2048607e87.4.1747146241416;
        Tue, 13 May 2025 07:24:01 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fba0sm1871813e87.23.2025.05.13.07.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:01 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/9] media: qcom: camss: a number of cleanups and fixes
Date: Tue, 13 May 2025 17:23:44 +0300
Message-ID: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset prepares the ground for a CSIPHY rework in CAMSS ISP driver.

For simplicity of continuing my reviews of CAMSS paches add myself as
a reviewer, as well it will simplify the work of syncing and avoiding
patch conflicts between work oin CAMSS done by others and myself.

Vladimir Zapolskiy (9):
  media: qcom: camss: cleanup media device allocated resource on error path
  media: qcom: camss: remove duplicated csiphy_formats_sc7280 data
  media: qcom: camss: remove .link_entities
  media: qcom: camss: register camss media device before subdevices
  media: qcom: camss: unconditionally set async notifier of subdevices
  media: qcom: camss: simplify camss_subdev_notifier_complete() function
  media: qcom: camss: change internals of endpoint parsing to fwnode handling
  media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() function
  MAINTAINERS: add myself as a CAMSS patch reviewer

 MAINTAINERS                                   |   1 +
 .../media/platform/qcom/camss/camss-csiphy.c  |   5 -
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 -
 drivers/media/platform/qcom/camss/camss.c     | 182 +++++++-----------
 drivers/media/platform/qcom/camss/camss.h     |   1 -
 5 files changed, 71 insertions(+), 119 deletions(-)

-- 
2.45.2


