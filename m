Return-Path: <linux-media+bounces-44097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F82BC9881
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 16:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38F791A60B1D
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 14:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DCD2EB5B7;
	Thu,  9 Oct 2025 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="XFYwVWxK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F742E8DEB
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 14:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020529; cv=none; b=Ox2JaaRJQrxifKCdtz4HRc0iS+tfTHvg07jK/ouJ2lqTcu1qRLCkkxe8Klm81UFQ6+9O7Ss9SqZSWim8NX9dURWvhxrC1E8d3pqwUfuiDsEglf0lIARynjIS51s+Aj1RR+csJlov4mSnsRRyoQJ5mIH7XLGuXx3h73I8PSe7hx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020529; c=relaxed/simple;
	bh=qg6QF1rDlqVC9eUrmMm4yZVRaITIh85cFqUKkQRon5g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V2Sv9X8AgM2zXdp8oPJhaOo6UNT9nK+3lUNKCi+a942cHxqK8jvmgmQXv6gpNuHGwauNVEMBRHjbljyk6CKn0q7rcjKsDFqgOtgg6Apw+uX6QUyYCGaFscxsDgK3k2osX5KhEZEOUVRjekJPwNT+FVBJalI8kejzOpc9vRvIA0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=XFYwVWxK; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so190900466b.0
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 07:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760020525; x=1760625325; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zYENJNtxtc1kPbU0AoQZVanvQQRyEjOu9GgNTqYkAdA=;
        b=XFYwVWxKwl9z6vTUGBXfrW9pKVfrOYCUN1JcsPTeUAN/phtdrgi8O+uFdqqshI2uc/
         JVm/GeyJmMFErJPpg3C9bOuZpOuz6jpPyb5l4j0VlYdq00ExTjPnRjivHJZm/2nK70u0
         TVwgx7RUlAKp6J7wXpxEc1HxnDA8JCfmLngBB+Aoi4FpuuDLz9bT+2ME4aGFGYTDWAHD
         PJFh4XmE/rYgi0N6ZZ1FM//ZezOskQinzQwfXsxTdNT1Y5erJ6o6NDG0SG9sRjIiBXoe
         gTMeFjG/wbhsb9SY8SsKd7W45Yx7xNKHvW8kspG9lh02NZJT+6kxsXdRkmnuzfBfwlty
         ttuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020525; x=1760625325;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYENJNtxtc1kPbU0AoQZVanvQQRyEjOu9GgNTqYkAdA=;
        b=IrkCKKcA8UiRiQlu0QH6M9DrOXh05JObcV5V5GfbNdLOWLPPURf1KdD5EIZfNRwWr2
         MVVOBsJ1iLfzSm/E5fr9TDjgkYHatFdXdMwFFK0fslqCURQyqPvpHfzsx1bE9FsJLjCV
         UaVl+DzXSi2gCPOmKbHxEffUzDD3UGoXZW5zazmClHO7STKCtYZ/8B1BynZzrsLq9LsY
         MmbcYtwo+hB9v3Gk4Xm0kCJSTz79KUUSxCHY2Ov3E1jhyx+jAGYWvziBD/p8YTi6qcJQ
         FU41Hc0LAnPOuIooo0EizTDyQYoa7e3dAsamx/6RwkwvbLy9B5sTigXDwAtuUmfB+nlc
         tdCQ==
X-Gm-Message-State: AOJu0Yze7irR5ss3C+8IN2bhSUU3jRONZXVOqeDPVmB0AHDjGUZ6WIBT
	KoRE3rVYHt9ozR+FCZLt7Jl1AWhm8SmmFyV5PSSHPjI+5vwVy4Xgq19sfDec+rSSgLnwsZ8Ps5N
	qWaYN
X-Gm-Gg: ASbGncvV0bLpemfPesg2qtFHMCju50HMhyQqb3Oj5Z8i3XLQfQ+h4q/YtqqKT5/ni/c
	YgqQ11wbJd8AoKoyrXk0mijJQlMv8sLjfvw6TYz6hrhsFBkZDSyxHPIXnFgPUy957hlFwCE+/5H
	zFdUrPXkAG2tTqk9OeYAGuDWkRQbrGmJi6PDwTrJf5rJAnqigHDMxJRVRfYjM5mg2ykxvcpwvHw
	rZ7le/jeni5+sJ7JU26Q8MzOuFaMutxqtc9X/A6yznULZU3n0yBzemGMzEokDQXJCRIg2jgxFre
	wui6dANtnfpy6HNH+lNAQyCpQYAWg4Wfei4tEiKdbjqsthtWy2OOJD1oB65oJGMyGqHGjh6hwWL
	cH19IirqkjgD0SgHgiBiOTlYYYQUGUcacEm7R92UOeVCzDgULggkPaetFsoYB1I/v9oZXPyHMNc
	wUSVgPtHjp7l51fIEwXX17iS1VDosi
X-Google-Smtp-Source: AGHT+IGnwJxzBQPGzvSXp56aICeUzxZOOU5BPT910//mGT1ooDV473aPF4s8OP70+9XJdQr/+Q2e8w==
X-Received: by 2002:a17:907:9404:b0:b07:c1df:875 with SMTP id a640c23a62f3a-b50acc2f5camr910308766b.56.1760020524610;
        Thu, 09 Oct 2025 07:35:24 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486606dc84sm1885797166b.45.2025.10.09.07.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:35:24 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH v2 0/4] Add support for Dongwoon Anatech DW9800K driver
Date: Thu, 09 Oct 2025 16:35:06 +0200
Message-Id: <20251009-dw9800-driver-v2-0-3c33ccd1d741@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABrI52gC/13OQQ6CMBAF0KuQrq2ZqVRaVt7DuMAyyCwEbLFqD
 He3xYWJyz/JvP/fIpBnCqIu3sJT5MDjkILaFML1zXAhyW3KQoHSYNHI9mENgGw9R/JSGwTt2tJ
 qApF+Jk8dP1fvePpmT7d7Yufv8aemkmxWYLNZoZWmMUYp6hyesY4qe+cmkHTj9cpzXcT9FiuR2
 Z7DPPrXujri6mYMAdTfwIgSpNuB3ilDZdnBoWvYT/040Da54rQsywfxAco0BQEAAA==
X-Change-ID: 20250918-dw9800-driver-58105cd495e0
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760020524; l=1771;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=qg6QF1rDlqVC9eUrmMm4yZVRaITIh85cFqUKkQRon5g=;
 b=0IPOGbH5/g3cluV4Dd76aWVPqMxXuQRc+3hbzdt/zNF1QAbEvPS0OTsI6XcQF49WG4VWicYAB
 BV5FWzJMsfgD5V5Oqfg+byEn353sjtUjqedClkCEM06H0NIdCm59x+Z
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add devicetree bindings and driver support for the DW9800K VCM driver.

The driver code is added to the preexistent dw9719 driver, which has
similar functions and method order, but different register sets.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
Changes in v2:
- Reworded commit log on patch 3
- Changed code formatting in driver
- Link to v1: https://lore.kernel.org/r/20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com

---
Griffin Kroah-Hartman (4):
      dt-bindings: media: i2c: dw9719: Document DW9800K
      media: i2c: dw9719: Add DW9800K support
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI pull-up
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add UW cam actuator

 .../bindings/media/i2c/dongwoon,dw9719.yaml          |  1 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts   | 11 +++++++++++
 drivers/media/i2c/dw9719.c                           | 20 ++++++++++++++++++--
 3 files changed, 30 insertions(+), 2 deletions(-)
---
base-commit: 6063257da111c7639d020c5f15bfb37fb839d8b6
change-id: 20250918-dw9800-driver-58105cd495e0
prerequisite-change-id: 20250709-dw9719-8a8822efc1b1:v2
prerequisite-patch-id: 5a1b6083c0f5df1421cfe6952dac44d9ddb7fb07
prerequisite-patch-id: db5f49e91aaf521fa487994765b4107f543531d6
prerequisite-patch-id: 76bfa65d3ff23fc827790b0868bc34655cfa93fe
prerequisite-patch-id: b76d61c90bdbf20f437d2fe438d54e707621e953
prerequisite-patch-id: 46fc09662693e6a51bb89ab4d0914265c74bc3bb
prerequisite-patch-id: 4e0012f76dd03d5653ba185a8ccc59017a1b90d1
prerequisite-patch-id: a618641cd4b7cde40825fa0d4201b6c27e74266d
prerequisite-patch-id: 8b43ff7e81258cc7624800e4bf645458a0f05380

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>


