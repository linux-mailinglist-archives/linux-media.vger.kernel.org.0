Return-Path: <linux-media+bounces-13807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A6B91046A
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 14:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47D9628614A
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 12:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DF51AC78E;
	Thu, 20 Jun 2024 12:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oJ+wCuns"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D661AAE02
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 12:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718887673; cv=none; b=L8yuz5xTCk/OXRpsqeiSPtni830ltCrVBEPYDP+0sdtMlJP6HEJtMavZCa8UFUINVC0aIxUHOY4vnu79hd+FEiay68+AF3JO9hFURlmcBLS3k/SZgNYvJWiIxt5UdHtV5rbamrIa00qTV4VXlCzqQsdbNkD4IDLv4Tf2bf46R0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718887673; c=relaxed/simple;
	bh=SWXpURg2mmf1K+xh8CezsKl1rXAcAXaS1Se5E2w75kA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M7p+uL1QRk9eefLk/NcFMWjMW3qovz6NWPNqxUOHXKwJAa+A3RWf9FKf2C5HQnvngwNN/f3MdsfpIVdgF8DXDPIO2jG6mN/H/HCTvzbUE/VjhkSaS/bCmUqn57YcLZvXPfNGct0llCaJrQU80NSvnXu4oHNrzIpayH2xYQ3TYus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oJ+wCuns; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2eb1cd51e05so916731fa.3
        for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 05:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718887670; x=1719492470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4WCMST2iTV2G8AzOSfMKkH9eVerbU1DvCvFJ8NhXgk=;
        b=oJ+wCunsNPR7ErFlL0/KEHcw16mP+wdFr8xa1R6PxuAYruRngxcRWwP1KlcFSBJyse
         FGTRIlcxHnw+Wl3n23wnbhxlyqGxAe8suHzCnp84WJc3hD6MumnxK0TIFtSJaoseyDl1
         4SHdOtVZ+5PlhVcBLqRTQyd4VGG2OYXqSmGAITem5RQFvPTAiihjkwLswB2zh3g/OujY
         gWd9PEFbj0BFdAkhc5XC9cG3Kc31/yxosvu8fC/ZPzxcLyqlwL3OtVDmrhPMAiczYjiJ
         mPFgG4jrTIhr9S/lrTG3aITdwYtnGJh/46iC/WWwx+j6PX2Vo7Wh+vSLZQzZbQDaN+up
         TpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718887670; x=1719492470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4WCMST2iTV2G8AzOSfMKkH9eVerbU1DvCvFJ8NhXgk=;
        b=U5spXrSXzYAfOIcbYxxH9XlezDjRwDAnDGJrV7cTtYVNop/Y1/b4wMkJDJRroc/X6H
         PdzqSBOEf+L+bv0Wnw8y18gNcex73tJux3KjtCM7wkn6eblYlMsNnuty5CPqB8xU4Bxm
         SBCDCEQTFVoWF41cYmczo1w2wTbISuxMROoPRNsaQdekYVny8cwNKv7vxf/mRX4hLz7g
         +wYfSG7P62hHOk1L78kbLHZegfjth5o1CYjcSTEbr+vDJjQW4fVf6NTOqhC+vyAqgQ5B
         qdsxgPO3jLpNMPTi/dUkkNoSsn6abAVxwQvPgekDjLykQwUh5lgv7zM29g8w39GzhaVb
         oAJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEN6q/+3iVmlq+zLxjdBX1zLFDn+MxL62fwcif9m43+dVUsO3XTijLGh7RzNu60vkXkbFJIi0KG5uDnsMJHePpUJNqFgSDXDvvRm4=
X-Gm-Message-State: AOJu0YyFJi0iSlTTuhxuLCoGd93oLPF4Pa77AZPStFzHRuhHX/kk6/Tr
	ISfetjdTyt0QJz3XFTU74aqK7GQdE8ttFidxamg9WtFqSItCz240tvvjx+XD6ZzN54GsqOzu6kP
	tjIaDJg==
X-Google-Smtp-Source: AGHT+IE8dh/T9bKkR8Vp6Ze42hc0qzfNPNgIBxQrpIXbEiTbmxRsmxIEoaM/6CPE9WkcbowyOsyKVg==
X-Received: by 2002:a2e:a986:0:b0:2ec:16c4:ead5 with SMTP id 38308e7fff4ca-2ec3cec4baemr38342951fa.2.1718887670108;
        Thu, 20 Jun 2024 05:47:50 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c17ba8sm22421411fa.72.2024.06.20.05.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 05:47:49 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] media: i2c: og01a1b: Add OF support to OmniVision OG01A1B
Date: Thu, 20 Jun 2024 15:47:42 +0300
Message-ID: <20240620124745.1265011-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The change adds basic support of OmniVision OG01A1B image sensor on
OF platforms.

Vladimir Zapolskiy (3):
  media: dt-bindings: Add description of OmniVision OG01A1B image sensor
  media: i2c: og01a1b: Add OF support to the image sensor driver
  media: i2c: og01a1b: Add support of an input system clock

 .../bindings/media/i2c/ovti,og01a1b.yaml      | 108 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/og01a1b.c                   |  50 ++++++--
 3 files changed, 150 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml

-- 
2.45.2


