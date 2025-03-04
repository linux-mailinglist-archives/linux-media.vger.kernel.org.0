Return-Path: <linux-media+bounces-27497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 834E8A4E41C
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 16:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CE611893A5A
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 15:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC92C2992D2;
	Tue,  4 Mar 2025 15:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="HUuKXovM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5CC280CEF;
	Tue,  4 Mar 2025 15:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741101995; cv=none; b=BzKDi8CfAP+/dCIARIAUORlxlnsFPAYFLIzxBN6a9eEIPuEayKnllI4gdke0TVyeJYxM5mCILPaiS4CUKpmL9hYP3i9jI1A/8H77v2IQneqwtz8lbQXSsIHaPPyFrspKQZiorYTCc0lOF+QtMlZ0WTKls0GDR6F9gfQkCVsuWok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741101995; c=relaxed/simple;
	bh=GU0LNKe6uVNvNUAnc8ceCRbIDyyheagNzJ5Ha/IG2d4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WBU3lMD4ZZKlieWUPdxBLwB4RTlTgh1GdW1ONgnsE9VRKDijuDrnZLYb+Yuyn/MGts4jZuwNzTYIhnP9J1B5EbzoN180I7nSPTtOlbk7408P2emS62UhnR5U9I3FhXBgO0/3R0HwnZa35Hg+EJK7yeuR2pt2YxP2/AX8A+j3YeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=HUuKXovM; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.1.78] (unknown [45.136.247.92])
	by mail.mainlining.org (Postfix) with ESMTPSA id EBAE6BB83C;
	Tue,  4 Mar 2025 15:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1741101672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z56Wxemg8k6+6raOvR4AwA7wqf1rx7RCGXsrb/Q6BWY=;
	b=HUuKXovMn2qI1VszrfvjKKqnlXnbmHDE/Q624sTyeDbZOQnXrRZ6++lo3u9LmpRG0DF2LX
	dvyxlLHSFO8sJ2WyJYgBX/ve0A2Aear3olZ/rRzx3vnSD0lDevM1fYBYd4i7qwkeq9lhYW
	LxKj2DwYrVtxuBQPhCurG17Wlk1nYqEhiSqLLEEx/sk7tGMmcq+h4yaTPAy4HykMlRxrZo
	rMsuPfgOz0fDvxx5KbhUivhBNKOy2dddW7Flc+IedS3NsJqqthadTEDR7wdhxwc4RNQKVM
	yYHkJ3wLDKwabt8Z1rKGJ/CaaKHVZz2nRv9U+1/MSUElYQ9kUbkG6Zmr6oWB/w==
From: Vasiliy Doylov <nekocwd@mainlining.org>
Subject: [PATCH 0/3] media: i2c: lc898217xc: initial driver
Date: Tue, 04 Mar 2025 18:21:01 +0300
Message-Id: <20250304-media-i2c-lc898217xc-initial-driver-v1-0-e2ffd2b2fd5e@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF0ax2cC/x3NQQrCMBBG4auUWTuQjIRUryIu4mSqP9QoiZRC6
 d0NXX6b9zZqVmGNrsNG1RY0fEqHPw2kr1SexsjdJE6CE4n8tozEEOVZx8soPq7KKPghzZwrFqu
 c4yO45M9BLVAvfatNWI/L7b7vf5XJyt51AAAA
X-Change-ID: 20250227-media-i2c-lc898217xc-initial-driver-d7b50a135ce5
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Vitalii Skorkin <nikroks@mainlining.org>, 
 Antonio Rische <nt8r@protonmail.com>, 
 Vasiliy Doylov <nekocwd@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268;
 i=nekocwd@mainlining.org; h=from:subject:message-id;
 bh=GU0LNKe6uVNvNUAnc8ceCRbIDyyheagNzJ5Ha/IG2d4=;
 b=owGbwMvMwCW2fZ/SFZeSpU2Mp9WSGNKPS6WX8MzsvhnGsdoyXuxczpfpvl7at9VsmCa8+3DBp
 fpy2uryjlIWBjEuBlkxRRabjR6zxfLDJSdNe6oAM4eVCWQIAxenAEzE+zTDP7X7xhpszLf5y/kK
 75lcUnHWubbpWq676/FH78WOZl1kcmb4HxLxYb/ls++l33MEPad9n/aabe7BTXtKrrHs4F9YnvO
 qmw0A
X-Developer-Key: i=nekocwd@mainlining.org; a=openpgp;
 fpr=3CB1489B166F57199296E520B7BE22D44474A582

LX898217XC is a 11 bit DAC, designed for linear control
of voice coil motor. This driver creates a V4L2 subdevice
and provides control to set the desired focus.

Tested on Oneplus 6 (oneplus-enchilada)

Co-developed-by: Vitalii Skorkin <nikroks@mainlining.org>
Signed-off-by: Vitalii Skorkin <nikroks@mainlining.org>
Co-developed-by: Antonio Rische <nt8r@protonmail.com>
Signed-off-by: Antonio Rische <nt8r@protonmail.com>
Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
---
Vasiliy Doylov (3):
      MAINTAINERS: Add entry for Onsemi LC898217XC lens voice coil driver
      media: dt-bindings: media: i2c: Document LC898217XC bindings
      media: i2c: Add driver for LC898217XC VCM

 .../bindings/media/i2c/onnn,lc898217xc.yaml        |  54 +++++
 MAINTAINERS                                        |   8 +
 drivers/media/i2c/Kconfig                          |  11 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/lc898217xc.c                     | 230 +++++++++++++++++++++
 5 files changed, 304 insertions(+)
---
base-commit: 20d5c66e1810e6e8805ec0d01373afb2dba9f51a
change-id: 20250227-media-i2c-lc898217xc-initial-driver-d7b50a135ce5

Best regards,
-- 
Vasiliy Doylov <nekocwd@mainlining.org>


