Return-Path: <linux-media+bounces-16643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F10EF95CA73
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 12:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 242131C20FD5
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 10:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E54517ADFB;
	Fri, 23 Aug 2024 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fugrSDbg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424901474D7
	for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 10:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724408862; cv=none; b=a2fIQkrwG7sWX2SBizj57AtguME4pfb1THbVGQt3vJbr6UaRwb90USqLhQ/MFi7D/bKfDVxCfo44Hx03Z7c4cTj0FCnOQwvs2PjTm4jymSavRf4To4qUloT3QGiQl7nYuxB+NHi3glbieqyO4pzHkfwg3LZlELnPY9oKFRMFpEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724408862; c=relaxed/simple;
	bh=m4j4uYjmbR08IVooFLrnOUyw8equrFr1uT3BqEWPph4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vzbyl8tbEQBOE3awCxxusx4J74rNMkXJvV0T80NhgzA6DxlhGUA33xxtwn7LNRIjs/4rTNG3zore4isirCUt18W+hFFwRRdIfd8oBR1kqBSTjr/B3HvEXQdhLLl563AAYZ71bYhVWikVb44KvkhCImfRAFdensmh4nk+sklAy7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fugrSDbg; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52efcbfacb9so348970e87.2
        for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 03:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724408858; x=1725013658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=He53nieMh0Us2OfEMGc467LVa9euG1VcaGwdXqEbU0I=;
        b=fugrSDbgzXaLWb7msXtgoVqX/Tvlr+2j6zYxotftl7G0k9n3pTFjRL+JFt3trFVSEV
         kvgW8WtPQYxhLdyB6UEe+yf9HzHcG6Vt6zDt9Iv9Gg4D1+VzsaiZqVzZ0f2QBwI0l2aY
         UMmqyJn3fNp4ISYLg3NgIWyvwbXSMrbvXuFy+cGm83rZpxwiJ9M37HAgr7h/HLUVNdJQ
         5ITPvMsP3Ev3SE9VvRjgyaygGhgEvvVosZ8F0GouHx7dF6UkNLxktlw2xI8AIMO16Yod
         a6BaiGZYSaieH005LsnkEunAmt/Bl3V/3JyNzwNpgpH79+gxy++iJz8/yGNYk8ZRNoxC
         mfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724408858; x=1725013658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=He53nieMh0Us2OfEMGc467LVa9euG1VcaGwdXqEbU0I=;
        b=l/Z4Vne29OXn/xikvpy6GXva/lujacUQfJ5FTrmA6iwO+YIJHSujp9I4odRRCdFKn9
         HEsvWlvnDvuxymMWdbk9p1gql3BGFTMbu3J6lOwrJ0VBS/sF/4upyHLdayQiyOUZyd7+
         FFjemC9197fXW4+NqbqwTsAI3a9BhhNHHTv128B3Wr2c6k+J5ysQ5fKGBvnPGRnCtrRD
         gZnuQdCSl4c6jJh2IwNKccNlAmbQAJuYSbLtJ7qkqRjyV6AIroZZhDnfSOHfBzQEFkAs
         qmQp+ZpS6EFTnS5L08VNZ9CyWPGWSTE9xdS55ITLprtRu89byBv5T2p8DqcpG75vAPOw
         umdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvduyHeaJUpMFFgy9YabJ/qhz7DnJ/4A1Uvzt08fgrMTVnV+OEARA0DyzBbSM4/t2N77AypRqUdGT8bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCWhWAuGgn2f+9sc7KNiaQX8NIzjBRiHJo2SRkyfyoDuQKcnW+
	l1rz8F0UzYti9EwpAwZr8C5F8Y3VmKMYc5EZNg4DzhNNHO2E829EqpInr/Rxt567PvDAOW5hHb7
	9qlw=
X-Google-Smtp-Source: AGHT+IF9w2qk3GojBzT1Ifrv9NL5ieYcdkqI8uq/EHVIGk0eaW8Q2EwCysFBCXexAH8LaXhe5cR6tg==
X-Received: by 2002:a05:6512:280e:b0:52e:9beb:bc09 with SMTP id 2adb3069b0e04-5343877ab05mr667026e87.3.1724408858179;
        Fri, 23 Aug 2024 03:27:38 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea5d220sm504669e87.183.2024.08.23.03.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 03:27:37 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 0/6] media: i2c: og01a1b: Add OF support to OmniVision OG01A1B
Date: Fri, 23 Aug 2024 13:27:25 +0300
Message-ID: <20240823102731.2240857-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The change adds basic support of OmniVision OG01A1B image sensor on OF
platforms, and a few follow-up changes from the series extend runtime
power management support.

Previous version of the change is found as a shorter patchset:
v2 https://lore.kernel.org/all/20240813102035.1763559-1-vladimir.zapolskiy@linaro.org/
v1 https://lore.kernel.org/all/20240620124745.1265011-1-vladimir.zapolskiy@linaro.org/

Changes from v2 to v3 (no code changes):
* fix of a typo in a commit message found by Kieran,
* updated a commit subject per ask from Rob Herring,
* added a review tag given by Conor Dooley.

Changes from v1 to v2:
* updated device tree documentation according to review comments received
  from Krzysztof and Sakari,
* extended runtime power management support, added functional support of
  optional XSHUTDOWN GPIO, XVCLK supply clock and 3 supply regulators.

Vladimir Zapolskiy (6):
  media: dt-bindings: Add OmniVision OG01A1B image sensor
  media: i2c: og01a1b: Add OF support to the image sensor driver
  media: i2c: og01a1b: Add stubs of runtime power management functions
  media: i2c: og01a1b: Add support of xvclk supply clock in power management
  media: i2c: og01a1b: Add management of optional reset GPIO
  media: i2c: og01a1b: Add management of optional sensor supply lines

 .../bindings/media/i2c/ovti,og01a1b.yaml      | 107 +++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/og01a1b.c                   | 178 ++++++++++++++++--
 3 files changed, 272 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml

-- 
2.45.2


