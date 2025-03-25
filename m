Return-Path: <linux-media+bounces-28719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E44A7043A
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 15:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1CF18910BD
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 14:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA9625B694;
	Tue, 25 Mar 2025 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xNLQ4yuT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530EB25B670
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 14:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742914175; cv=none; b=QPKLSaclYyYVhkopybDnyjxvv3QVFw6PaIubVt1B5j2CSTJhF9vWEnwFTPiVN6BQSp5SIyRk/Ll3WkZx4YYi9u3OxIYcLyT+1oMr8wGlgsBgRQdJ2MTRE1sRY/qJQD58wT5TZaBbQVUHzgYURYMlEud/0QFdK2O9OpZGgk/jQes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742914175; c=relaxed/simple;
	bh=M2JUNSlGZNKszg+sXxKav9A7TU+mFF4rXGQf57VMlcM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UTHSe+9KyCf9/26U7y6qHLr7yRQS+fLU0bVE6g3oeelHTB/+ysJA1p54csZYKp37qB2jUp4HNOkZPNPQxgkJ3uZpncSfFVpi5pKNt8wq+TOk0BgxzLdi2fzEQChHiSAB2mG2cCYGyH8vAdUqCl+FAkG4Mg+31syx/l2CVcIMC58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xNLQ4yuT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39727fe912cso2081672f8f.3
        for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 07:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742914171; x=1743518971; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=apY04UJmIzUwaHQeU0TYcXSziQP74VWklTBx+F3Tz7k=;
        b=xNLQ4yuTuxR8i/EFAdGC/M2OxuxsWImpbg5rcvKqST0SQI0gPnvxRahQt7ayNKnUM5
         ewsv6XQL82iHWUFtOpuIOJPTdl8ltWunIcBomBqN8v3CmUn9CGx3UFL1pydrSqUZmdK+
         FodkeWLRvNPtROb/ZIHHEx2jLyF/WN7ORfgylgW8rorsg2nz9NQFPNcwVdfNj3SM1SG5
         ywXuzqwrGDF8I+NhKuHg/D6nY2VVBMk9EwKd+RobCWQMlnsexV2Ay6ExYvtjKzjEn/x2
         ccaCIzN91AQSGAP741eqd9a43Hr54IkfMh878RSJ1/5zT4KEZSqB1NuoGJu4kR+7zkrr
         6zFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742914171; x=1743518971;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apY04UJmIzUwaHQeU0TYcXSziQP74VWklTBx+F3Tz7k=;
        b=W8uyqfzN+Musqu/eQTNoe9Ees/hIuQrs6vN24bdT3dXwXhp6nmi4miHbZpHeM+OADS
         nWCD4R3ATUkWkjYKxIqU1B9l3zQCHowVulHt5+vxudUkE33xKBlmLWomMFmcxz8tTmGK
         ESz5pFiDXtH0VJQhkrKKmmIBcxMJF+yxD8XJCAQagILXYTARdoCyKFLKe5LfZfwE7d3k
         EX2G+6hUR4R9UU22XmdR0HJca2+zZ1tq4bhlqAjrUUMNv3EdWuwWpSjPP2ApyFJUt5VO
         D2OjXP4ZhsDOlA4K9ayZ3HrqACNG04ejnn96HT1FiAM0I30+z6FYiHZt5ipKpcrJqRnZ
         n6KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE3U09xNXHLJzLkm8pivNJ5oitz2cPLl9DXa0oLULWc3+L1ssOlZb35zcGWSE/HcXpcgBy4wXu8123jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWPuiXZXs2/CO6+15bK9xF00i8cNIqRKgx+/jXpxVVfn399Yzl
	bnBd+Z6OQnKE+NMdfUaRhVWW49SpRFrMo1mZmTNW5pyQSWhOFDo/k+pm24cmjVw=
X-Gm-Gg: ASbGnctILa7YNIoHVhKYlJ2kEmbxtJlqB/FEky8IuI9DeKGJmcBZrLsnzqjJ53Dl+AH
	BvxsnomeWc5tu1I7BGnRpt4Uc1eeOIE/ZE+wbmM5ky+Ch6NXBWAZVXNLKSO03Hv5vRTeKDqSdCe
	LyAYsd3byCNvkMYTU+ENG5SJuN/T5+dGXX7bTvk/MdKQZvg0B6+lAKhU6IbiAQf/slXYXAN9w2r
	z8+ETEX1UsO5wrxv+gsO6+hC8hqhV1GG8BLrjzuvHQNYLPkiOqraw5U/XsZFvAd76WhYu9uSGAt
	YE3yTTsp9Atqzw0UR7kaPrbp6XHPMCd53MEb5Eu6pg/Y951I7/9GtIeto6DiLZ3pTJaIGQk0LmO
	WEn/qo2OODNsN9cYZ8L37
X-Google-Smtp-Source: AGHT+IH9rm5v4ZHEV5KW/bsEjstp3xgcmbEYr/WJQS57tNiYdX3wCME+4ueS35KPYkkr+hEgxeVEAA==
X-Received: by 2002:a05:6000:2c3:b0:391:bed:ec9e with SMTP id ffacd0b85a97d-3997f892a55mr13900198f8f.0.1742914171379;
        Tue, 25 Mar 2025 07:49:31 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3b4bsm13796071f8f.25.2025.03.25.07.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:49:31 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/2] Import IPU6 ov02e10 sensor driver and enable OF
 usage of it
Date: Tue, 25 Mar 2025 14:49:27 +0000
Message-Id: <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-0-4d933ac8cff6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHfC4mcC/53NSw6CMBSF4a2Qjr2mDx7FkfswDCi9wk2kNW3TY
 Ah7t7IEh/8ZnG9nEQNhZLdqZwEzRfKuhLxUbFpGNyOQLc0klw1XogNTw4qWRpj8SilhiOBwSyA
 b4AqEAp+5RMFBKmy14p1tdM/K3Tvgk7aTegylF4rJh88pZ/Fb/0CyAA7G9rJuVW207u8vcmPwV
 x9mNhzH8QVVIhLd4QAAAA==
X-Change-ID: 20250317-b4-media-comitters-next-25-03-13-ov02e10-23e68307d589
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: Jingjing Xiong <jingjing.xiong@intel.com>, Hao Yao <hao.yao@intel.com>, 
 Jim Lai <jim.lai@intel.com>, You-Sheng Yang <vicamo.yang@canonical.com>, 
 Alan Stern <stern@rowland.harvard.edu>, Hans de Goede <hdegoede@redhat.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

v2:
- Squashes previous progressive series into one patch
- Adds yaml description - bod
- Sets GPIOD_OUT_HIGH on reset line - Hans
- Optionally sets the reset line on power_off only if gpio valid mirroring
  power-on - bod
- Adds Hans, Alan and myself as MODULE_AUTHOR - bod
- Adds a MAINTAINERS entry

This patch has been tested with the x1e8100 Dell Inspiron 14 plus 7441 and
I believe also by Alan Stern on an IPU6 system.

Link working Dell tree:  https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.14-rc6-dell-xps-inspirion14-lenovo-slim7x-t14s-camss-sound-wip?ref_type=heads
Link to v1: https://lore.kernel.org/r/20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org

v1:

Similar to Hans' progressive series on ov02c10 I've picked up via Hans the
IPU6 driver with some additional fixes from Alan Stern.

https://lore.kernel.org/linux-media/20250313184314.91410-1-hdegoede@redhat.com

I've made a number of initial changes to this driver sufficient to get it
working on the Dell Inspiron 14 Plus 7441 with the Qualcomm X Elite
x1e80100 SoC and its CAMSS stack.

link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/x1e80100-6.14-rc6-inspirion14-slim7x-camss?ref_type=heads

This is a first pass which adds in the minimum to get the sensor going on
the Qualcomm platform. What would be nice would be someone on the IPU6 side
giving it a test.

A big TBD here is the YAML for this file but, I'd like to make sure nothing
has broken for IPU6/IPU7 with the modifications before diving into
Documentation.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (1):
      media: dt-bindings: Add OmniVision OV02E10

Jingjing Xiong (1):
      media: i2c: ov02e10: add OV02E10 image sensor driver

 .../bindings/media/i2c/ovti,ov02e10.yaml           | 113 +++
 MAINTAINERS                                        |   9 +
 drivers/media/i2c/Kconfig                          |  10 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/ov02e10.c                        | 982 +++++++++++++++++++++
 5 files changed, 1115 insertions(+)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250317-b4-media-comitters-next-25-03-13-ov02e10-23e68307d589

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


