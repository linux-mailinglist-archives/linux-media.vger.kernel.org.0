Return-Path: <linux-media+bounces-27524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C5FA4ED5E
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 20:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64F3E16E1DA
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 19:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5489625BAB9;
	Tue,  4 Mar 2025 19:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="MYBpwsbN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD531D8DEE;
	Tue,  4 Mar 2025 19:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741116745; cv=none; b=pQq90vvP8wXZpBHmIDuIYjYQMenZ/0gnj1L5QvTTiuGfoqOemsuYi0TTTB+SDJhlM1dmy83fCSNbaVh4dklMn7dVYU8Z95q/LeClFcohzfBmjoz+p8XYykB16yAoTHxw1ffSjKFcXw8s93un6iHf6Br/djFl76KC7iTKNsvRJ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741116745; c=relaxed/simple;
	bh=a6WZUI0jcjxHw21Hsni+i2kKFHSLl4ZyLFsIveFOnzA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JKo32bBuVvxAIQXPHrY3R9h2/btBZv1moBFdHlXvfy9rYP51qpwaBYcLs2yfAei/LKkR3FYz3ZPpeC2WdQA9WLDbJXAnsfz9JXpTIpm7+sshwmt5YMVJXi0w5IEr+ZDez5fUqbmB4pDutKNc0gk8pMvXYh6k0Tv7eIFaB+Y/w0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=MYBpwsbN; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.1.78] (unknown [45.136.247.92])
	by mail.mainlining.org (Postfix) with ESMTPSA id AE8E8BB83C;
	Tue,  4 Mar 2025 19:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1741116741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4KGW4BctMkTgF3Q7adlKTJZsfOcPw+WhbRxOKoP2sNQ=;
	b=MYBpwsbNNBkx7fdyX6FSWnaCuq85vhdmBjPUtLZJlfsIO1CNwYcaIBNXrA93xIbpDMzSoH
	IDOlfLWyKYuYNLgkTnmVhx4Aw/u/mcYvqWNFXPYfgU7iCFwck4JP+Q5jWg+z0qkgg5658n
	4ZXRPJTmsSJq43R1lSU0rZq6qmRcAJwYQENbbExUL6P2iHNyFdk1xmRFPzDvbbJndD8pII
	6NF84x16wCFri5baijE6xNdAQXX186pALR5+NVWRyHR4KA23jzg47qm/EMIwqZBUnXbvVx
	EHIBYcPNX0pz4gmOjzb/PdYTO7QC3Uxvk851FIHY7faAN2fm01vlQ4z0RekhBQ==
From: Vasiliy Doylov <nekocwd@mainlining.org>
Subject: [PATCH v2 0/3] media: i2c: lc898217xc: initial driver
Date: Tue, 04 Mar 2025 22:32:17 +0300
Message-Id: <20250304-media-i2c-lc898217xc-initial-driver-v2-0-6a463cef3ea8@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEFVx2cC/42NQQ6CMBBFr2K6dkw72ICuvIdhUdopTALFtKTBE
 O5uxQu4fD8/720iUWRK4n7aRKTMiedQAM8nYQcTegJ2hQVK1BKxhokcG2C0MNrm1qCqVwsceGE
 zgoucKYKrOy2NqrQlLYrpFcnzelSebeGB0zLH9xHN6rv+/JW8/uXPCiQQeu+wQ+80PSbDYSyv0
 F/m2It23/cPpgLywNsAAAA=
X-Change-ID: 20250227-media-i2c-lc898217xc-initial-driver-d7b50a135ce5
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux@mainlining.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Vitalii Skorkin <nikroks@mainlining.org>, 
 Antonio Rische <nt8r@protonmail.com>, 
 Vasiliy Doylov <nekocwd@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558;
 i=nekocwd@mainlining.org; h=from:subject:message-id;
 bh=a6WZUI0jcjxHw21Hsni+i2kKFHSLl4ZyLFsIveFOnzA=;
 b=owGbwMvMwCW2fZ/SFZeSpU2Mp9WSGNKPh7poVR5q8ZgmpPayeMO86T4/z79ac+7Ptswaie3/D
 /9c1veltaOUhUGMi0FWTJHFZqPHbLH8cMlJ054qwMxhZQIZwsDFKQATCbrI8D9up8JMn3/XRa7U
 O6ldLn4xcdXUpC+z4uZLHO7g2iPyMr+QkWFiyMISSealJ6arx0mkPXNnjPyjsrmirT08hzXny4Z
 HwuwA
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
Changes in v2:
- PM functions annotated as __maybe_unused.
- Fixed dt bindings documentation commit message
- Added v4l2 events (now v4l2-compliance shows no failed tests)
- Link to v1: https://lore.kernel.org/r/20250304-media-i2c-lc898217xc-initial-driver-v1-0-e2ffd2b2fd5e@mainlining.org

---
Vasiliy Doylov (3):
      MAINTAINERS: Add entry for Onsemi LC898217XC lens voice coil driver
      media: dt-bindings: Add LC898217XC documentation
      media: i2c: Add driver for LC898217XC VCM

 .../bindings/media/i2c/onnn,lc898217xc.yaml        |  54 +++++
 MAINTAINERS                                        |   8 +
 drivers/media/i2c/Kconfig                          |  11 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/lc898217xc.c                     | 240 +++++++++++++++++++++
 5 files changed, 314 insertions(+)
---
base-commit: 20d5c66e1810e6e8805ec0d01373afb2dba9f51a
change-id: 20250227-media-i2c-lc898217xc-initial-driver-d7b50a135ce5

Best regards,
-- 
Vasiliy Doylov <nekocwd@mainlining.org>


