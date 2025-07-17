Return-Path: <linux-media+bounces-38007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E65D4B08D33
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86B221894208
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC792C374B;
	Thu, 17 Jul 2025 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NcrtNwI8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2B52C17A3
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756007; cv=none; b=bG3giwvppx+500FoR9eJSaStWnQR5j3ilWqQz3Rr1++8gyqekTOhcpdQXzdWi05nA5uaPQbtfpKf0on/lPsDLvF6Vh7+CoNlbe7oAeN+qab3dZ6eY4rUPxr9XGcPYNQBZju0zjG2D/1W8Drd7xVLoPMr3DmhtFjSqtGpxHt9QDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756007; c=relaxed/simple;
	bh=HECWTOF5w1fsGyPWcw2e1Ysjoi+3vaK8f3knj5F0NJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r/78r3xI6n0B9eCQhTNbYHrMHvlQwuHDYjYFUDpcWVkWckbale6+cpQ2H0QSOwIe/pNsj63cdxWWgV5tA5xrvzTBq0F+Hr/aIgzTRs/IF5Fm4+lgyS0PnYQGRjQixOcCa66KTiVmFSLp3FUCrDV6HtfgPoWHBEaRvyvXlKve/08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NcrtNwI8; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b4c37ebf3so2218591fa.3
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 05:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752756004; x=1753360804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/iN8qcbM5Ap4e1fU476G02YHM7tz6hEQR2mzb3lV4l0=;
        b=NcrtNwI8U221728CRJl9dCcoikpYbOWA9EvFusVkh8T63NPuQnjBqSQa2nCJkYAPyb
         cx+9geP9Qql03yaMEvKVj6CBEkbnisuJGknC7oZgO50bysZB/MDSx3zUgwfv+MhJkczs
         hNQc6QidegHJq+RMnUDQQv+acncAV4LoOVKkSetcztRWZdSY48QYXCgJeLaeBrvRD2cy
         7EXA4JvmjYxmg9ykRmwUdJG23guJTxfnczo097ny4wRDBJ70Jm2spNB8mlvjtSulWmZk
         GW9H1d+6ruRRzVkzFx2vSr/144m8um6XzySebXTYrRMNWbxhebExJYLnRbRe/a4RuwF7
         6D/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756004; x=1753360804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iN8qcbM5Ap4e1fU476G02YHM7tz6hEQR2mzb3lV4l0=;
        b=DpRg9UhyNlGd9liFKVU+5nFrw56S94B4H0UJvHVxHcbT0lP7hW9jXpO2OL9ShTzOru
         Ub8QUEOflxqBqqR0OCdnpzOET4IoY2EQrQWKINiEAt32SCXMk0yan5SrQ8Yul7lAKpAg
         TMHEktnaTDP5sqQEZXp8fxhvo7K6lP1Ov0zbG34ByhA6JyrasHLLeKpR2b+Yv9puyZeW
         +PGvutHBofTd/RBL8XvVxbrVkODf15O1AgV0Wl4q3fO+Eb7TL721f5iqjtF3at+jtTWk
         ffgoqdCIvzory9dU2kVGl1UX0/UrSitVWG1uyckqnO0zCdMIfEGBwxVdgXwhYQJD008u
         gVyA==
X-Gm-Message-State: AOJu0Yxa/zBoPkcg3f/UzK0pWgaAS0iZTJpgb6KyXBorNNm2LSlLfsCf
	f7LJycNIBOb/iV5pCgLd3+qPMbdKNfNASQjlGT3EiYlyJBcohUZznVpdGgZPVEAZdm4=
X-Gm-Gg: ASbGncuwjPFRpHXfUCDEcm7JWAONEFYrA64UIBTXx9JB3fU9zKQUc96XFLd5pShJ8Ld
	ddjXg4rJDFCbaqJgs6fw3zQkL+mSs676A25fvcNKi2uLtTlkFjpEKZ4yAlwn2CI4v2KjPJlLvRx
	ZxcLYkEuwspE0NsnVCuGUL/oyNCwkjSb+uIkVsLng+OqkqReHBl8qOsUAQ6WAziNK7QXuz/4rOP
	i7oD6LHF63H1ENE8bNtK1cNG5B4cgMKVmS3/0qJWFqqiDdqsUMBtFvVQOzNF8x5VrFE+nTLJQMm
	+kWQxas6y/Yu0AOmQ8fJKiGhr6CbADFxq0qX+i0lQ4+KG9XmdVc+mtwBlyM7dDLtQ6m+Mefcgoi
	1q57B8VVtreteTvQjzEMpYG9+yibrUG3j82uNKx1iaq0B2pBQhScMvHkKYqfcNG7G4j5rz16kj9
	jwcyoJA8oYAs8johGKMAg=
X-Google-Smtp-Source: AGHT+IFxOFXc9GfQCAh4UwhojW5VIlIseM/LQ+blHB6j5oe1cb4c1jumNKoVyqA6/IdEGOmdlu8sxQ==
X-Received: by 2002:a2e:a9a4:0:b0:32f:4e1a:19f2 with SMTP id 38308e7fff4ca-3308e4b3babmr7673721fa.6.1752756003442;
        Thu, 17 Jul 2025 05:40:03 -0700 (PDT)
Received: from localhost.localdomain (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab8ed701sm24624871fa.90.2025.07.17.05.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:40:03 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] media: i2c: Add OmniVision OV6211 image sensor driver
Date: Thu, 17 Jul 2025 15:39:59 +0300
Message-ID: <20250717124001.108486-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OmniVision OV6211 is a monochrome image sensor, which produces frames
in 8/10-bit raw output format and supports 400x400, 200x200 and 100x100
output image resolution modes.

At the moment the only supported resolution in the device driver is
400x400@120fps (Y8).

Vladimir Zapolskiy (2):
  dt-bindings: media: i2c: Add OmniVision OV6211 image sensor
  media: i2c: Add OmniVision OV6211 image sensor driver

 .../bindings/media/i2c/ovti,ov6211.yaml       | 100 ++
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |   9 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov6211.c                    | 877 ++++++++++++++++++
 5 files changed, 995 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov6211.yaml
 create mode 100644 drivers/media/i2c/ov6211.c

-- 
2.49.0


