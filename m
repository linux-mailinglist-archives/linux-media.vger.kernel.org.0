Return-Path: <linux-media+bounces-49027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15399CC9AD9
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 23:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38C6B3034ED0
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 22:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6AA2F0C5B;
	Wed, 17 Dec 2025 22:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="Sod1Q8Az";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xhx1anjy"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60A21F03D2
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 22:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766009821; cv=none; b=Hoe2NXx0Rc0dh6smhu5uKD+cJNjwgll4AZCisgv8SGGWYd+Wd/Rw1H9Qth5NAXTC8oxKiN+qObJDfDpTgeWetYjIKDUAD7rXuj4ZrD00tfMOqpgcR/s7jLZoChXpWAxsmT12EhT90ohf14wfGpntwQxbR3/+p5nGiowg9bG/ods=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766009821; c=relaxed/simple;
	bh=8mag0KEk9xXfF5SsBvqzeoqrEALqRn4kkFxSBllCqOo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IO9kxuZV+TOxBzOlQzK4Ni/mQdR7/sSSHS9y6beoVMOak7ElrCYvr2Gbm0c2kun3GroNWSUAoU6zN7occYGl3zEOfqr0CV1qOuIrdsr6fKWLAUnGSVKSyg+W2q1VOzOZME7vSI759mHAgvHR2Iu66KioMS1VRxFgeONRjPMYbdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=Sod1Q8Az; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xhx1anjy; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 07A9D7A00CB;
	Wed, 17 Dec 2025 17:16:58 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 17 Dec 2025 17:16:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm2; t=1766009817; x=
	1766096217; bh=FzfT28TD5LGgO90ZYASGS8LtPucu8v7MidkmJIZkeh8=; b=S
	od1Q8AzI6tpxjyed2EePjC0byT3LcwoJfS5P+JqBIZkhZp9Hq9XfZeMxDg69gJPj
	e9mHuCm9xrBwHEnUl4q8g5ZN+gLiSopIIYU+ieyWo17KsWYVjClszquEypJEuzjZ
	Qg1mVD9dVSIzMQnGTDNGmsgodA+F5ss9KEgxfttxi4S8MDRP6yuk1rJmf4rmF5+d
	juJv0/sn2KQW2o2WUTJkFT3HbKGwlolnHTidLlAH25jn02mAOC/VXhanQPZ8O3TQ
	cfUdPf/INbeKlZyl6cjNz+TF/LDGeu1ye1I0Xt8DL3Oy2tnay1JtduWYOPvdBUBN
	dIEmN7AzMK5v7jpvl6AkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1766009817; x=1766096217; bh=FzfT28TD5LGgO90ZYASGS8LtPucu
	8v7MidkmJIZkeh8=; b=xhx1anjyglF3ounHRTWV8isvrozRXV0H5aZA914Grjj9
	/bg1TE0BjCNyrrerWJM/gSmCokjIwAyHjEUFxX8mbUNx74F8DQBRDPUgebIBW7Ln
	dUYbp+mtoIilhltfEX2Yr6IqgBYqyimpLUJmGR9R3xUvm/a4mdQzc/kq6ayEf/Z0
	2tvTtdU5DCdeyMt3RNRcha+M25n+QwmnGxofxXJwcMEnpNLohsd19ATK4SziVXbV
	f/JsgI8QAQY9zrQmwHwP3BFd1HG6EzC8k12JbsDcwPLSp5otqpsERht3/EkOYB4i
	cOvCb2XTA5XbDf/HS+BnHE/S3dSV4xFXZdgJEpDpMQ==
X-ME-Sender: <xms:2StDaT8wO37tG98BtQpZ6D80pdfOAJIUOd85xZ9YFisJu7EMl84v9Q>
    <xme:2StDadgywOGoBBjRfyTEamFyJBZ31FWbQ1F-VpmbL98sV0r5vpll0IBKmB5z9pG_-
    7YzHtAFJ7fUbivNiWZ4isGQVtQWotLWWNrEsEkcPNX1CtY5q8JaAQ>
X-ME-Received: <xmr:2StDabfr5KgYfi1mkh85IMVf9jLqZY3jBrIcMz5U2ODzbo3c-ceTH1nz3wD4q3s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegfeejgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhephggrlhhtvghrucgh
    vghrnhgvrhcuufevjffpgffkfffgtfcuoegtohhnthgrtghtsehstghhnhifrghlthgvrh
    drvghuqeenucggtffrrghtthgvrhhnpedtiedugefhieekueevteehudeiieeftdetkedt
    jeeuhfevvddtteejhfdvleegieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegtohhnthgrtghtsehstghhnhifrghlthgvrhdrvghupdhnsggp
    rhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqd
    hmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhtrggt
    thesshgthhhnfigrlhhtvghrrdgvuhdprhgtphhtthhopehmtghhvghhrggssehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhn
    thgvlhdrtghomh
X-ME-Proxy: <xmx:2StDacoUieL2sth20zwYAhS3IWVEhz-Y402v4Jo6vUa-qyVbB-046g>
    <xmx:2StDaYBpLnsgppffP9p7T0CXoH4Q0Qdv-ySAvvkEf_QdygG1XkIDaA>
    <xmx:2StDaRbSuIKEWyVw5nX38zp5ng0Jfr7AhqdGf1-btMHhDhbG1S5OVQ>
    <xmx:2StDaT7KyxjGAGPNp0eUAqO_57DwYfXDYiSYpDtqVy-Eg3Qi1itOoA>
    <xmx:2StDaUlo6xTgDHaz5_66pMOKTa13IDhYH6KCWpThhTEXm-ciMe6ci_DV>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Dec 2025 17:16:56 -0500 (EST)
From: Walter Werner SCHNEIDER <contact@schnwalter.eu>
Subject: [PATCH 0/2] media: i2c: Add ov2732 image sensor driver
Date: Thu, 18 Dec 2025 00:16:23 +0200
Message-Id: <20251218-ov2732-driver-v1-0-0ceef92c4016@schnwalter.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALcrQ2kC/x3MQQqAIBBA0avIrBN0QoyuEi1Kp5qNxggSSHdPW
 r7F/w0KCVOBWTUQqlw4pw47KAjXlk7SHLsBDTqL1utc0Y+oo3Al0UgTBePiuAcHvbmFDn7+37K
 +7wdyuK7cXwAAAA==
X-Change-ID: 20251217-ov2732-driver-2e8ec05d3bc5
To: linux-media@vger.kernel.org
Cc: Walter Werner SCHNEIDER <contact@schnwalter.eu>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766009816; l=1436;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=8mag0KEk9xXfF5SsBvqzeoqrEALqRn4kkFxSBllCqOo=;
 b=mJ9cplmsQRuPXntrzIitQmZOFLpkewfHPGMi5t0XrVFKCYdrW1MbByBCQdP1ZBeCkF2i7Ttmf
 eT8A3dYxV1kAcc26NFZSkgXxL7Sn+M2UT8VvzB1prlIUZd4OfFOZpb3
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=

This patch series introduces a new driver for the OmniVision OV2732 image
sensor.

The driver was written from scratch using modern V4L2 APIs, taking
inspiration from existing camera sensor drivers like the Sony IMX219 and
with help from the libcamera folks on IRC.

This initial version provides basic support for the sensor, future patches
will add additional features.

I'm new to all this, so feel free to point out anything that can be
improved.

P.S. I only tried this as an out-of-tree module against the 6.18.0 kernel in
a Yocto project, I'm not sure how to test it against 6.19-rc1. But I did
compile it with 6.19-rc1 and ran dt_binding_check and checkpatch.

Signed-off-by: Walter Werner SCHNEIDER <contact@schnwalter.eu>
---
Walter Werner SCHNEIDER (2):
      media: i2c: Add ov2732 image sensor driver
      dt-bindings: media: i2c: Add ov2732 image sensor

 .../devicetree/bindings/media/i2c/ovti,ov2732.yaml | 111 +++
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |  13 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/ov2732.c                         | 797 +++++++++++++++++++++
 5 files changed, 929 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251217-ov2732-driver-2e8ec05d3bc5

Best regards,
-- 
Walter Werner SCHNEIDER <contact@schnwalter.eu>


