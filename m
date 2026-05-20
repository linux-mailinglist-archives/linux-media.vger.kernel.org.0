Return-Path: <linux-media+bounces-62316-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCHnKNfUDWrW3wUAu9opvQ
	(envelope-from <linux-media+bounces-62316-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:35:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CFC59100C
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0153932EA78D
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60553F44F5;
	Wed, 20 May 2026 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ou5uPaKM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D363F6C3D;
	Wed, 20 May 2026 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290298; cv=none; b=OjeUxglVNQvacoYp7XzwzmFPvd/9PWU4I5rzCnY9vHM9K8f1wPLg7OfPEsRWkf8s567lazmEkmkpURWU4EyZ5HpydOszbFEy4qPrunmDcsFVRn9xdUqb4WduEgJTMJcpOtHacj3ci6V2Y4fV8Nm2lXdrSXU7Te5iG/HkhPXt9xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290298; c=relaxed/simple;
	bh=EY0BvrTfxRU9NobHmDD0g/YssHb3Dywa8XdSb4/xI9U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r8GkpJdBp1qqdxVcJDM0mVTZDVA9kiahKdCvk+CAK+aUFshdoiHj9iFSbXwNQmIbNSgaVqF+5kplfaxixzNnS+rks1qaINTeC2cljOGbAfLJV8+56ODb0r7/dYvVaq99Y5N6/7QcFxkHkhtjTrAXYZbf3iRYsbphjPZAm1eaTF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ou5uPaKM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:ad48:920a:da6f:a034])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25D05E9C;
	Wed, 20 May 2026 17:18:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779290281;
	bh=EY0BvrTfxRU9NobHmDD0g/YssHb3Dywa8XdSb4/xI9U=;
	h=From:Subject:Date:To:Cc:From;
	b=ou5uPaKMr0jVBZ/TatiTQsMQXWlQrTUWBfmMdcneO/3e/RH+kmTqCv4gEKBnADocE
	 2YLhy2TAI1Uekhu9KL6+/02QcE089A6tM/H0PbCHuxCCb5gLg7joNHezigpli4nKWL
	 TRXOVnbLvuXZTTODuVoHp1wZ74bZl4plwoGlY3t8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 0/2] media: Add bindings and driver for Sony IMX678
Date: Wed, 20 May 2026 17:17:24 +0200
Message-Id: <20260520-imx678-v3-0-8b5f9676486e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Py04DMQxFf2WUNUFxXjPTFf+BWDiJQ7OYSUmGU
 VHVf8dtJYQEy3vtc2RfRKdWqIvDcBGN9tJLXTmYp0HEI67vJEviLLTSXjkwsixnP07SRUCiOUK
 KWfDyqVEu57vo9Y3zsfSttq+7d4db+0exg1TSqBzdbChNGV9KIux1DRVbeo51ETfTrn/T/ofWT
 NvJWYweks/hH/r6OKzRxyc/tj2uEwE7SZ4vZTsM2tlsZ28sEXgcDcBok0YyNkSnQnLZOuKaZdd
 vrGC78y0BAAA=
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
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3127;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=EY0BvrTfxRU9NobHmDD0g/YssHb3Dywa8XdSb4/xI9U=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqDdCnucBzfzlJUeBqWOyA3Jc3ATOXm/I9Gt6SZ
 eNllYUe7OaJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCag3QpwAKCRBD3pH5JJpx
 RamUD/9zr9+iL6juuUhBvab8yQsAJOu+JppIMW6Breo+RrHwukp96OUqXfdL358R2e1yM5/i8Nq
 QhHzRcUwz8MOmpms7UvOeDyEpFAvk89DSWwF+wJzpdTWSiCq8DMMntqgUg4YmLCxOBmqpXWMSpM
 8buVEI4h8R6GhOPpY5vsxakt39jvgcIEMvPGdfJRkX40LQp6HE2bmJK2m/CY7IJUC4SeJ4XsuKh
 4EzLrUG0dkrcDmfGTLQmN04tu/TCDa1ZN4uAQouWNfSX9YKWbc/9lmE5D3vP7ZwY9uysFeHWnuZ
 kBCM6G1k1mcOPt0LLEsGCK3VfQbCtHQ92nx0uxzzkmHRqSbZ4Nlvx5L86Nw3PbvKmViC542eckP
 D2GhZpODRtvRRvSG9CfBlnpzqKdr7qSUCYD11Fv1E/hlmu8i22RiyzClEWjK47f3WiG9Hcv6uiN
 R8Ri3lI2aBFq+8Ta7lGpTfXSOocC81L5kW1q6YnExX1R1I05inPzoFJtwchq7OVe2X30M9wv2Zi
 JP+5PmVV+6fQ8InB76eXlVvti7QzjgTFDVo9b0Lz1qXP7dd2swmIv7hJAb3+TT7UaIHrG0HfMvX
 Ie30lMeSxgbFK11DO8dUAd/si+sCxSYOtmBGi+TtpC423pel3k98m4AdXVcz9BSSgHROkNsAq01
 WpeuUoZ82UUz2/A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62316-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 11CFC59100C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

This series adds dt-bindings and a V4L2 driver for Sony IMX678 camera
sensor.

More details about the sensor and features supported in the driver are
in the relevant patches.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
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

 .../devicetree/bindings/media/i2c/sony,imx678.yaml |  129 ++
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx678.c                         | 1599 ++++++++++++++++++++
 5 files changed, 1747 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260513-imx678-5c1aee9c1dcf

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


