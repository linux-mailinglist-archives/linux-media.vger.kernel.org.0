Return-Path: <linux-media+bounces-66439-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3zdjIWB/R2pUZgAAu9opvQ
	(envelope-from <linux-media+bounces-66439-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 11:22:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE65F700938
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 11:22:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=XBKI8vdQ;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66439-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66439-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B0F530512B0
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 09:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE2B3B2D0B;
	Fri,  3 Jul 2026 09:20:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AA23B3891;
	Fri,  3 Jul 2026 09:20:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783070428; cv=none; b=LZwhyPr6rPI0MkQIVNWYNyEEOZh2QWCfN1I5iFq/b270JMgS5rq0OEwlhCYnq+2pyXpJTSo/nmZ/X4ffBkUaE9ZExqKwwZZZigds9lboIaIs05/NfRvF1dMqZsgckFGY7tl1r98Ytt4qcad4zWMyQTfePp18R4G/I+cLR6Cvkio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783070428; c=relaxed/simple;
	bh=udHr5yr1SWlMFmwwE9tpkLf9yzuIASsogxWKzvn8c+E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tWsk4nUZv3N7fl12z1cA/CRGIam7UXy7e21FNVVRRaNCv+XhIWzp58BjzfJW03FRcC7yB/Jv9CBZMqJo0xUv83vz1F4ZC0lK6GeiLqgE/pLci/lxgPyUjOFFqqF/yRWslGhpgzLkGEoD31dtLggMHspYoPLn7hIfvsnOP4e09YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XBKI8vdQ; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:8a87:d565:effa:ccf8:a720])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA084DF3;
	Fri,  3 Jul 2026 11:19:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783070371;
	bh=udHr5yr1SWlMFmwwE9tpkLf9yzuIASsogxWKzvn8c+E=;
	h=From:Subject:Date:To:Cc:From;
	b=XBKI8vdQe5Z2N70j7ZGW02fcftSGyVNRNOWnY32SEAvcnzyyyyjVONBuR5toiiBhV
	 fmYlWh3Rs1U4Nd/xfeAOUWFJWUVgWHZaMQ73/Z/YL6J7gtvPEEIRN4mJrBP7dqRWYX
	 mys0YzOsbUvWICw2BNDlkdcOpNtijW9Xl8a8kHjM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v5 0/2] media: Add bindings and driver for Sony IMX678
Date: Fri, 03 Jul 2026 14:49:15 +0530
Message-Id: <20260703-imx678-v5-0-0523dbed0dad@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQzU4DIRQF4FeZsBbDP0xXvodxAdyLZTEdhXFS0
 /TdvW2TsYl2eYDvJJwT69gqdrYbTqzhWnudDxTs08DyPh7ekVegzJRQTlipeZ2Ozgdus4yIY5a
 QC6PHHw1LPV6LXt8o72tf5vZ97V3l5fRPxSq54FqUbEeNEEp8qYCxz4c0xwbPeZ7YpWlV99ptW
 pE2wZqYnQRX0gOt77QSm9akQ7JldN6Z4PCBNr+a/KYNaRvQ+uy8NBr+0efbKA0/v2jU5bYMS7E
 jp/upLrsB6OdoCsYRgi5CpwguARRdokKrzCi99yYoKjv/AGwCBgOpAQAA
X-Change-ID: 20260513-imx678-5c1aee9c1dcf
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Lachlan Michael <Lachlan.Michael@sony.com>, 
 Ryuichi Tadano <Ryuichi.Tadano@sony.com>, 
 Kengo Hayasaka <Kengo.Hayasaka@sony.com>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4794;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=udHr5yr1SWlMFmwwE9tpkLf9yzuIASsogxWKzvn8c+E=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqR369BPSGio4nL9N+HaT70ArvDvMwEqD+QY4G5
 K7W0QpoacSJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCakd+vQAKCRBD3pH5JJpx
 RYaaD/wKj018Jqp5urjxTQaesaxhNiW7Avr9eKMCRv6+QptATAflMSMGbxZdzz+NOxnbweWXDP2
 KmtcO30tjrBTq4HK8w1BlaxHXJgs5V3QSCFZ499925/0yqn1ISXXKj/49Ryq/hPRjdrPGCFiGLk
 yv5LNtRA6KUUReZqptY+c4WX7ljCqq+I2MVdOEzt2ssP2MV7R6Y5brITGzu/HjdghAKwgIhlQOs
 lf+aSeltNPo8CPiL+PhWyTF2QrjWL3rbTjzZb0epNXsI7B9/jytKVNkXyNIzUrrrmjaPvaRxIWh
 MiMIzZOrEUVT5fBB0XmgK5Mds1y8i+X7l9JL9Eo5XLA7fiGNx2M9YkemPit+7GIW0C/LK+i3BYF
 U2McuzAHGDGE1D2jNwTJBRbKvr9oDFkWEhpMFJqPkKR+OdP2enZCq/ypzCTS2UMgWIjA/rnKnRL
 x7yXH+VME+XAm0PsAKGPqnz67lg5P6F+3C/f4GH9mV0XJZmtuWV2E3c3Zurw6w+qdTEp+GeQp2F
 Hpj3jiHbygIBTDbiwNS3QxLZFjQhODaysSurG0XmnzlcuGvydt5NcsSvvYjY7Zw6LHg8AHDZD7x
 ouXl0ZmJNnV5ZW2zUb0oKc3z5fsO8L7vXQ31058ZNwWSxsnnRTlahrwYDx0htC4QSTm8Hxe56UO
 QOgk1hH7eAyoj/w==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66439-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jai.luthra@ideasonboard.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:from_mime,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE65F700938

Hi,

This series adds dt-bindings and a basic V4L2 driver for Sony IMX678
camera sensor.

More details about the sensor and features supported in the driver are
in the relevant patches.

Support for binning and cropping has been dropped from this series, in
favor of implementing it with the new raw sensor model proposed by
Sakari. [1]

I have a WIP branch [2] that uses the new raw sensor model to implement
the following features for this sensor driver:

- Internal pads
- Streams
- Generic raw formats
- Embedded line data
- Configurable analogue crop
- Configurable binning mode
- RAW10 output

[1]: https://lore.kernel.org/all/20260409201501.975242-1-sakari.ailus@linux.intel.com/
[2]: https://github.com/jailuthra/linux/commits/imx678-meta

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v5:
- Rebase on v7.2-rc1
- Drop note about the fallback name in the bindings commit message
- Drop unnecessary code like set_pad_format() or set_framing_limits(),
those will be added later when we use them for cropping and binning
- Explicitly set format in init_state()
- No need to track rpm_in_use flag, so drop it
- Drop SUBDEV_FL_HAS_EVENTS flag
- Drop unused format parameter from program_window()
- Use container_of_const()
- Add missing media-bus-format.h header
- Cleanup comments
- Link to v4: https://lore.kernel.org/r/20260605-imx678-v4-0-58e57c67143d@ideasonboard.com

Changes in v4:
- Drop support for freely-configurable resolution through cropping and binning
- Expect both specific and generic device name in device tree compatible
- Reduce analogue gain maximum to 100 (30dB) as the gain register
  includes digital gain from 101 (30.3dB) -> 240 (72dB)
- Minor bug fixes and cleanups following review comments from Sakari,
  Tarang on v3
- Link to v3: https://lore.kernel.org/r/20260520-imx678-v3-0-8b5f9676486e@ideasonboard.com

Changes in v3:
- Use `reset-gpios`, mentioning the sensor XCLR acts like RESETN, instead of `xclr-gpios`
- Update minimum crop width and height according to the PIX_[HV]WIDTH
  register limits
- Expect the user to first select a crop rectangle using S_SELECTION,
  and then choose one of two sizes (non-binned or binned) in S_FMT. This
  matches what IMX296 already does, simplifying the selection logic
  quite a bit.
- Enumerate only the frame sizes possible for the current crop rectangle
  in ENUM_FRAMESIZES
- Link to v2: https://lore.kernel.org/r/20260516-imx678-v2-0-4854ac61d6fb@ideasonboard.com

Changes in v2:
PATCH 1:
    - Add per-variant compatibles for mono and colour, alongside the
      generic fallback, so the variant can be declared without powering
      the sensor at probe.
    - Rename reset GPIO to xclr as that's what it's called in the
      datasheet, and how it behaves.
    - Reference the generic video interface devices schema and switch to
      unevaluatedProperties.
    - Drop "link-frequencies: true"
    - Drop the T: entry for media.git from MAINTAINERS.
PATCH 2:
    - Treat the pixel rate as a fixed sensor property rather than deriving
      it from link frequency and bit depth. Removes the iclk<->pixel
      conversion helpers, instead using a fixed 8x ratio.
    - Express HBLANK in pixels with a step of 8.
    - Make VBLANK step = 2 and rewrite the exposure register when VBLANK
      changes, so the effective exposure does not silently shift.
    - Fix power sequencing: hold the sensor in reset until power_on, add the
      missing post-reset delay, and disable the clock before the regulators
      on power_off.
    - Drop the "common regs written" flag, program them in power_on.
    - Add variant match data and cross-check the register-reported type
      against DT; rename detect() to identify_model().
    - Use v4l2_link_freq_to_bitmap() and expose the full link frequency menu
      with the configured one as the selected RO option.
    - Drop unused includes and defines, misc cleanups
    - Kconfig: depend on OF_GPIO
- Link to v1: https://lore.kernel.org/r/20260513-imx678-v1-0-30fc593ed8fa@ideasonboard.com

---
Jai Luthra (2):
      dt-bindings: media: i2c: Add Sony IMX678
      media: i2c: imx678: Add driver for Sony IMX678

 .../devicetree/bindings/media/i2c/sony,imx678.yaml |  130 ++
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx678.c                         | 1446 ++++++++++++++++++++
 5 files changed, 1595 insertions(+)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260513-imx678-5c1aee9c1dcf

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


