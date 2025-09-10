Return-Path: <linux-media+bounces-42190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95911B514E9
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 13:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1B191C82F38
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 11:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708B6319845;
	Wed, 10 Sep 2025 11:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="AtdkphF0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E56C30E0D9
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502482; cv=none; b=rSpqONrjGrkBGj+vyTF3zNi3cy1Lds2WS081wpjIQp4fIDhlw63K+aRljY8VSCWUzYGb89hGKcy14GWz7H+h0PML9YS159gbmWSx42K549mCEa7GXnoMbSWEL+dPkzUgGqqUi6x0ihmx/bbn5XAzYynh8UxwWKfx3d+rpzVbf30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502482; c=relaxed/simple;
	bh=qsJHj1/1oQfPkq1JRCPMlD2tTi2M5NZLR9YYmawyVz8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MIByKokDxJwENv3Lj+W6UkJ2+ynQckstONq5oC5Wu7ybT/jdrGu0leWXfNcmJ2WrEUBW/oRXByzJYG7pda9oQy+vEvnJP5WfQDhfzL0Y0RbENVIRv7glS6G371qHlX5f7U086PTVbyiyRIeb9Hf1/cU4PUNryL5QaqkIkwf0ZTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=AtdkphF0; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757502472; x=1757761672;
	bh=GGr7fDU5v7KaXRd0heWu4LqMfFjXkgK/6awD39LMV8k=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=AtdkphF01wT4SiyUHCXgAtzNhXcV4Wy5b2Q3KzOajeLEwIJAKbguBTLjuiEG/voTX
	 Wa/SQi3REY5UKA/uM7RpvYgvu+bexG3o97Kgn+nXfa1MKw+4sbeeycYj3JQjHrP41A
	 auZHhi4mlpjMmEGabgLt20CaEfIBUiWYNwoYOWzatgQH8/OkY7IjIg5UcdL+H6Wa2e
	 TimUJlhFJuvdIfKPCKr6wyXHuIHfzHMtFaWzcvfCzPf5cZ29z/7Axmg/RMZLENllJl
	 VbknhM6DpoPFnXocpn9OcM6Kv9wdw4ER1Lc10TJhmcgTXHcBSi3Kn2FseHKnLLTC4O
	 nvgO4U4+XDQkg==
X-Pm-Submission-Id: 4cMHwP2szfz2ScCw
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Subject: [PATCH v4 0/4] leds: privacy-led support for devicetree
Date: Wed, 10 Sep 2025 13:07:36 +0200
Message-Id: <20250910-leds-v4-0-1fc320488233@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPhbwWgC/22Qy2rDMBBFf8VoXZmRrFdCCPmP0oUqjR2RxG6lR
 LSE/Hsndhah7WbgDnMOzL2ygjlhYevmyjLWVNI0UlAvDQt7Pw7IU6TMJEgNK5D8iLHwYERw1vo
 YHTA6/cjYp69Z8/pGeZ/Kecrfs7WK+/aXoAoOXPlOoJBaWvO+q2n0uRxSacN0YndJlc+gfoCSQ
 IyuN6bXJnr3H9g9g+4BdgTqlVIxKABj/oC35Y+Mnxdq4bw8w05Yip9bWDebxShAgLIgW0uTC04
 1lWF3wDzisZ3ysCXX7QeSVqS6WQEAAA==
X-Change-ID: 20250902-leds-c61c877add80
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3237; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=qsJHj1/1oQfPkq1JRCPMlD2tTi2M5NZLR9YYmawyVz8=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBkHYxheb8r40ty4+pzO8wTXCq6la94LV0g3Jx9yvj8x4
 bvO8ttVHSUsDGJcDLJiiizdf76mdS2au5bhusY3mDmsTCBDGLg4BWAittMY/qnK8czacojR72bZ
 HXe/mN7/mlHBHK/Fz172UL4e7C1tq8Lw4+2cZXubObdqfM6wfnPpX+p7tdqojMxvd+uj7nD9dY7
 jBAA=
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
Changes in v4:
- Rename `privacy-led` to `privacy`, depend on x86/ACPI change
- Simplify example in dt-binding for led-consumer.yaml
- This series now depends on: https://lore.kernel.org/all/20250910104702.7470-1-hansg@kernel.org/
- Link to v3: https://lore.kernel.org/r/20250908-leds-v3-0-5944dc400668@vinarskis.com

Changes in v3:
- Drop unnecessary 'dev->of_node' check by Andy
- Keep 'panic-indicator;' in DT by Konrad
- Fix property/property-name order by Konrad
- Add missing 'led-names' enum definition for video devices by Rob
- Add oneOf to 'leds' to avoid conflict with nodes of same name by Rob
- Link to v2: https://lore.kernel.org/r/20250905-leds-v2-0-ed8f66f56da8@vinarskis.com

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

 .../bindings/leds/backlight/led-backlight.yaml     |  6 +-
 .../devicetree/bindings/leds/leds-consumer.yaml    | 67 ++++++++++++++++++++++
 .../bindings/leds/leds-group-multicolor.yaml       |  5 +-
 .../bindings/media/video-interface-devices.yaml    |  8 +++
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  8 +--
 drivers/leds/led-class.c                           | 17 +++++-
 6 files changed, 96 insertions(+), 15 deletions(-)
---
base-commit: 3db46a82d467bd23d9ebc473d872a865785299d8
change-id: 20250902-leds-c61c877add80
prerequisite-message-id: <20250910104702.7470-1-hansg@kernel.org>
prerequisite-patch-id: 429eb224c966424b458a7179e10e1f3172408eb8

Best regards,
-- 
Aleksandrs Vinarskis <alex@vinarskis.com>


