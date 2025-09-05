Return-Path: <linux-media+bounces-41807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E62FFB4509F
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 10:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A04293BCD54
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 08:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE7D2FABEF;
	Fri,  5 Sep 2025 08:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="Vo801V8W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD022F83D7
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 08:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059213; cv=none; b=eNGMf9g2UL3G0zHPrBwROrPVKuZWFBEu8TlUHnjkmh8WFMqcmzX4Ta8HeSNbtoz4yEyEcs/vpcdMYKVXeNQZa7lyj/P/eYEXZn1z64xdQDR0c2eo6XyZfUwvmzCpVCOnHd647tH5LojSDMwyBTxLwC9X30Q2u8rRVQ1ulbApHx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059213; c=relaxed/simple;
	bh=ODMZ8XAY4oS2YB5dJWAE0oMKW+DSMf9CBaalfdoRQGM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VyIqlMNUjV9Qv18dBShh69PkOwXrBOKrXw7WDgZ5XY2mH52mdu3LhiU3KwB6aFqakNRT9ix2hXFAVSx/7EXABWQ/xmCckA7Snby7ei33OJ8eWG/JYq+M+eE/pVGrNfhYrnSnNhIjLyCDKKV7JfaN1BWgG0StUXGhdi2IYR46p8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=Vo801V8W; arc=none smtp.client-ip=79.135.106.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757059202; x=1757318402;
	bh=IwwmRkvoKl+LoDF53gqIJXwIz9XlREgzNxwRqm19Uho=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Vo801V8WU9zZbrWjE/LmX/m+3sL4LTXVnynbYicB40c/RKEgJqb37xEQjjZcv6/OI
	 FNTihWZeSdKn/6N5CYmUHgD0iQbYMgihTzNmxQHKCsCHBbMgY+Vziv5Mlj3T8jzKVk
	 ejbvOUnKSViG5xxqfxFH85X/09N16+Qt7fznCX5f0HmJiAFxHdlod7hyo7dE7IMawd
	 9aVtdTNlN3upL7REWXXu+aLNrB5oDN9XHDP7qDo1AjSOpgaWcTA7xbQp2d/jDNwDsK
	 +9iMP57+E9UcJL7rFVu0ex22gkStj95X57A1ydbQKqPtkq173ybYxlWC5qUK6u1EIP
	 B3M2/Lt7gYcrQ==
X-Pm-Submission-Id: 4cJ80023zpz2ScWP
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Subject: [PATCH v2 0/4] leds: privacy-led support for devicetree
Date: Fri, 05 Sep 2025 09:59:28 +0200
Message-Id: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGCYumgC/13MQQ7CIBCF4as0sxYDoy21K+9hukAY7UQthjFE0
 3B3sUuX/8vLt4BQYhIYmgUSZRaOcw3cNOAnN19JcagNqLHVB43qTkGU74zvrXUh9Brq9Znowu+
 VOY21J5ZXTJ9Vzea3/gHZKK32bmfIYIu2Ox8zzy7JjWXr4wPGUsoXxRyZj5wAAAA=
X-Change-ID: 20250902-leds-c61c877add80
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Aleksandrs Vinarskis <alex@vinarskis.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2396; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=ODMZ8XAY4oS2YB5dJWAE0oMKW+DSMf9CBaalfdoRQGM=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBm7ZtSlXHf3+LXhvFRF4lE5d+ul7RppsrONn23TXzt5b
 qQn6xXdjhIWBjEuBlkxRZbuP1/TuhbNXctwXeMbzBxWJpAhDFycAjAR3Z8MP660SGS6N9y6cj9y
 ftO5dvN7uhu/MHy7Mcu98pXF9K5nzxj+ipfsS07xnRnKwKCbuG9Vc9Kdc0UOKYcqeO/tnC70ZZk
 uLwA=
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

Re-spin of RFC patch from ~2.5 years ago [1]. v4l2 controls for privacy
LEDs has landed, but the DT part was left out. Introduce missing
dt-bindings, and commonize 'leds' parameter. Finally, add a patch to
enable privacy-led on Lenovo Thinkpad x13s.

With recent inflow of arm64-power laptops (Snapdragon X1E/X1P) which
mostly use MIPI cameras, this feature becomes more desired. Original
rebased patch is still working as expected (with respective DT changes)
on Dell XPS 9345.

Changelog to original series:
- Pick RFC patch, pick R-by, drop RFC-related commit message part
- Add new DT binding to describe generic LED consumer properties
- Rebase and test on X1E laptop

[1] https://lore.kernel.org/all/20230120114524.408368-6-hdegoede@redhat.com/

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
Changes in v2:
- Fixed mailing issue
- Fixed wrong R-by, add my missing sign-off
- Elaborated cover letter/commits descriptions to better describe why
  this is needed, and why trigger-source could not be used instead
- dt-bindings: expanded schema description, fixed s/phandle/phandle-array/,
  expanded the example
- dt-bindings: added patch to commonize 'leds' from other schemas
- leds: dropped wrapper, dropped exporting of private functions
- dts: added patch to utilize privacy-led on Lenovo Thinkpad x13s
- Link to v1: https://lore.kernel.org/all/010201990a1f5ad8-fc97fc84-9ef9-4a03-bf1c-2d54423c6497-000000@eu-west-1.amazonses.com/

---
Aleksandrs Vinarskis (3):
      dt-bindings: leds: add generic LED consumer documentation
      dt-bindings: leds: commonize leds property
      arm64: dts: qcom: sc8280xp-x13s: enable camera privacy indicator

Hans de Goede (1):
      leds: led-class: Add devicetree support to led_get()

 .../bindings/leds/backlight/led-backlight.yaml     |  7 +-
 .../devicetree/bindings/leds/leds-consumer.yaml    | 85 ++++++++++++++++++++++
 .../bindings/leds/leds-group-multicolor.yaml       |  6 +-
 .../bindings/media/video-interface-devices.yaml    |  3 +
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  9 +--
 drivers/leds/led-class.c                           | 19 ++++-
 6 files changed, 111 insertions(+), 18 deletions(-)
---
base-commit: 3db46a82d467bd23d9ebc473d872a865785299d8
change-id: 20250902-leds-c61c877add80

Best regards,
-- 
Aleksandrs Vinarskis <alex@vinarskis.com>


