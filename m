Return-Path: <linux-media+bounces-3587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E506F82B587
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 20:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17F001C24582
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 19:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CD956B7C;
	Thu, 11 Jan 2024 19:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J/IQDl44"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E8156751
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 19:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3368ae75082so3790090f8f.1
        for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 11:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705003023; x=1705607823; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+i0UK44yHq8YceaKYIY5mCgJVLZEaoVhm3Uocx3mJfQ=;
        b=J/IQDl448F7PGdWVBsfIz8ng50+zyAMLCgJRzLbqXeaCOZABEarrDxmXFYIpWDdBoT
         Xryo4kDCLWtPfoviGIeNjLAWmN84OvODZi4oQtevSdn37fj77ehjX0b0aTLEhlxH3j3x
         YtzEvh9TLpmGyzH3Gk3jw0Fhs6Tf1HPXmulRqVLbZX4F1jIshjGbiK1AvlSUaEFSCdRx
         G03tp81Kqsd3+RlXWQ4FgS9UNl8rc+obNf4NQguDseVQBD7IhzSFDDuxes2/2LxUKv3m
         WA8Y5gOA2JZprQw20H0cbZEYGqhAEXBGzIydYeRim0tb1P9OuesU8RlEtjqWB3Icho1i
         SPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705003023; x=1705607823;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+i0UK44yHq8YceaKYIY5mCgJVLZEaoVhm3Uocx3mJfQ=;
        b=le7nGFADVSrL6t48MtzAnf9m0PBB1bd9xcz0JmGjQS+YmzZ9TXaaxDi7tn4wFN8X2k
         gy9mImn8gSweMjF2JZ+eR0oa6CjTXJt3uzXBDb0McFj/IOKTZzgOzzR/7yDGtdux7Shz
         DpcAOFiiBcnn46K/DbPPBtrZb9SzlD1b9rFAb+dm6qc9XbdpRyNIEFh8OFshHcmotlAT
         0BFOgWfRmPNQe2ZvyjIJb8WBWrBflXlQ3WOW+ri2kPSAPhfTbLcl0aMKTSFpWwqgRRa7
         JLlLNJN9RjutvwG0Zk3Siq32Z4eTrPrrBbW34R5xzPv9AOAv9BXTH8bV1Xky3Nr4sp3L
         eMmA==
X-Gm-Message-State: AOJu0YwkIMsvWpRhTdkHdWOWZcscIjmWeaLaY7YQlOr4M70lJf3FhdMq
	ciUxeZWT+0R/1lACsZug+VD0DAS5qlA1ZQ==
X-Google-Smtp-Source: AGHT+IFSIopE3QuOoLdzTjt0bkELntb0Mh5UkExonm953hmNSzSLxpZxpYk3qTp+vJmkETZ57p+eQw==
X-Received: by 2002:a05:600c:448a:b0:40e:478c:e864 with SMTP id e10-20020a05600c448a00b0040e478ce864mr206154wmo.74.1705003023479;
        Thu, 11 Jan 2024 11:57:03 -0800 (PST)
Received: from [127.0.1.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id b7-20020adfe647000000b0033763a9ea2dsm1955382wrn.63.2024.01.11.11.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 11:57:03 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/5] media: qcom: camss: Add sc8280xp support
Date: Thu, 11 Jan 2024 19:57:01 +0000
Message-Id: <20240111-linux-next-24-01-09-sc8280xp-camss-changes-v1-0-b92a650121ba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA1IoGUC/yWN0QrCMAwAf2Xk2UBShnT+ivgw01QDWkfjpDD27
 xZ9vIe728C1mjqchg2qfsztVTrwYQC5z+WmaKkzBAojMTM+rKwNi7Y3hhGJkSZ0iSFSW1Dmpzv
 +RccoOVzzlCWlI/TgUjVb+83Ol33/AkKs3gh8AAAA
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13-dev-4e032

A minimal set of patches to switch on sc8280xp support in CAMSS
upstream. Most of the SoC dependencies are either merged - CAMCC or very
close to being merged - CAMSS/CCI dtsi.

Alot of prior work means we have far less interventions to make in this
driver to support this new SoC.

Most of this series is already reviewed however it is gated on merge of
the CAMSS compat string here =>

Link: https://lore.kernel.org/linux-arm-msm/20240111-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v4-2-cdd5c57ff1dc@linaro.org/
Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-24-01-09-sc8280xp-camss-changes

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (5):
      media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 two-phase MIPI CSI-2 DPHY init
      media: qcom: camss: Add CAMSS_SC8280XP enum
      media: qcom: camss: Add sc8280xp resources
      media: qcom: camss: Add sc8280xp support
      media: qcom: camss: vfe-17x: Rename camss-vfe-170 to camss-vfe-17x

 drivers/media/platform/qcom/camss/Makefile         |   2 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 108 +++++++-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 .../camss/{camss-vfe-170.c => camss-vfe-17x.c}     |   0
 drivers/media/platform/qcom/camss/camss-vfe.c      |  25 +-
 drivers/media/platform/qcom/camss/camss-video.c    |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 307 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 8 files changed, 436 insertions(+), 9 deletions(-)
---
base-commit: cae3c85e8e3896c2a7db983290ca25933713cd0e
change-id: 20240111-linux-next-24-01-09-sc8280xp-camss-changes-8cf2bf9fcdd6

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


