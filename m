Return-Path: <linux-media+bounces-64000-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KQ0GJufXI2pvzgEAu9opvQ
	(envelope-from <linux-media+bounces-64000-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 10:18:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F75A64CE86
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 10:18:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=i1AIwVDJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64000-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64000-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC7103046EC0
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 08:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CB131716F;
	Sat,  6 Jun 2026 08:18:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2F52F5A34;
	Sat,  6 Jun 2026 08:18:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780733880; cv=none; b=tVOhX5qqEeQyQOSKWPUNoB6UzVfiMA3D3YXPv1uTT1R+IAsczA8l3+EXCeUC9lJDN/rvS+UoIOFYNU86YR4WQ85MezSqZrPxBGxIVcAUvgfiK7gLiRXvmmlwVmulGoBXMMNtfq/etU0LkfGUWSSMDoZjyl8CF9bxWRzfvaxtOLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780733880; c=relaxed/simple;
	bh=F/6oEepyPd63WZNPjLRITrV5xNoQfnuFOmwjm6Tgq+M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q2sdMNieo7c/Eg9GKMjNdKlYxPJuxkD41ILhxKJ0lDhxcpW7qv+q5QJHU15+9p7gA6Hn5dAiWQ6zfclBXVucfw2szOXfen1pDd9KHkf6vDxDu+7Oq0bH5g9qTi1J+61q2cDjqgktPgwX+w88+xpOJewxJPA6NMKzO/0Tca75GsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1AIwVDJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 157F3C2BCC4;
	Sat,  6 Jun 2026 08:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780733880;
	bh=F/6oEepyPd63WZNPjLRITrV5xNoQfnuFOmwjm6Tgq+M=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=i1AIwVDJJOsvlUaJoqrNASIq4hDRVCcam7W1qb7bbTT1PqqH6D3limO3EdN57SnQV
	 FDIGTTRjkl/w347t7IEacSGWYBIQfmOZtIs8DuDUC6o/awK39CXihTq0nJYHxRd6+n
	 ywdcnKNE0BksT7LPfz6LW7zx5KFBWAfnrv9m3CLS19dNJVs9m9Hp3+rXjWWhPVYeze
	 YXRvho7ORHjATQI1tNKR1xFrQnnYZOxB6Iyv89ybpjoNADV8V/dFEaUHbF20gubV6+
	 ov6oy5MvLixNnd4GDzKc7O2MR55hHKFOhhGz6TjNk38kRLPANDYePtktIhHRI34JT3
	 mIs4cysREpG3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1B5CD8C8E;
	Sat,  6 Jun 2026 08:17:59 +0000 (UTC)
From: Herman van Hazendonk via B4 Relay <devnull+github.com.herrie.org@kernel.org>
Subject: [PATCH v4 0/2] media: i2c: add Aptina MT9M113 image sensor driver
Date: Sat, 06 Jun 2026 10:17:57 +0200
Message-Id: <20260606-submit-media-mt9m113-v4-0-046b4cbc7f94@herrie.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALbXI2oC/x2MQQqAIBAAvxJ7bsFMJPtKdCjbag9aaEUg/j2JO
 c1hJkGkwBShrxIEejjy4YuougK7T34j5KU4SCG1KGC8Z8cXOlp4QncZ1zQtSiVtN5M2ZASU9Ay
 08vtvhzHnD9tQ+blmAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Herman van Hazendonk <github.com@herrie.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780733878; l=3845;
 i=github.com@herrie.org; s=20240417; h=from:subject:message-id;
 bh=F/6oEepyPd63WZNPjLRITrV5xNoQfnuFOmwjm6Tgq+M=;
 b=+gXCPqcUD2GXQ/cSDcEF8ziXy4lvSawR6zHJDGhNKwlA7UPmHI9NEgXE5nE2Mb5PsgvD5JNNb
 mwqAwRIht3DDkGC1ww6pP2srFw2gf50XuhjFErrFKsyc10Vw82ez8+/
X-Developer-Key: i=github.com@herrie.org; a=ed25519;
 pk=YYxdq8fb5O9vhkW3n2dCH044FPZZO5718v/du7fRhFw=
X-Endpoint-Received: by B4 Relay for github.com@herrie.org/20240417 with
 auth_id=809
X-Original-From: Herman van Hazendonk <github.com@herrie.org>
Reply-To: github.com@herrie.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64000-lists,linux-media=lfdr.de,github.com.herrie.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[github.com@herrie.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,herrie.org:mid,herrie.org:email,herrie.org:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,test-camera.sh:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F75A64CE86

Add a V4L2 subdev driver for the Aptina (now ON Semiconductor) MT9M113
1.3 megapixel SoC image sensor with embedded ISP, as used on the HP
TouchPad (apq8060) front camera. The sensor is programmed over I2C and
streams YUV / RGB / monochrome over a 1-lane MIPI CSI-2 D-PHY link.

Tested on HP TouchPad (Qualcomm APQ8060), front camera. The 10-mode
test-camera.sh sweep passes all of pix640 / pix640-nv16 / pix1280 /
pix1280-nv16 / video640 / video640-nv16 / video1280 / video1280-nv16 /
zsl640 / zsl1280 with exact frame-size matches and no MCU wedge
messages in dmesg.

Changes since v3:

  - Fix Context B (1280x1024 capture) stream-start regression. The
    MT9M113_SEQ_STATE_PREVIEW constant was 0x04 (== datasheet's
    "Leave preview" transient state); the actual stable preview state
    is 0x03. The Context-B preview-first step in stream_context_b()
    polled for 0x04 and timed out on every 1280x1024 stream-start
    with "MCU not ready for CAPTURE command -> stream start failed
    (-110)". Constant corrected to 0x03 with explanatory comment.
    Verified by passing pix1280 / video1280 / zsl1280 in the sweep
    above; Context A (640x480) behaviour unchanged.

  - Document an extensive forensic investigation of the IFP test-
    pattern generator (R0x0066 mode_test_mode, MCU logical addr
    0x2766) in a NOTE comment above the MODE_TEST_MODE define. The
    V4L2_CID_TEST_PATTERN control plumbing is retained, but on the
    HP TouchPad's MT9M113 die the IFP TPG MUX never engages despite
    every documented and undocumented enable path: writes to R0x2766
    stick across REFRESH; SEQ_MODE = 0 verifiably silences the MCU
    firmware drivers (visible darkening from AE-off); the IFP color
    pipeline can be stripped to nothing (R0x3210 = 0); none of it
    yields a visible pattern. R0x321C bit 4 is hardwired to 0 and
    R0x3246..R0x3252 (where the mt9d111-inherited test-mode register
    lives in the page-flattened address space) is a continuous dead
    block - classic Aptina foundry-removal fingerprints. No public
    driver in the MT9M113/V113/D113 family (HP webOS, codeaurora
    msm-3.4, esp_cam_sensor mt9d111, upstream mt9m114, etc.) drives
    this register either, consistent with the silicon-removal
    diagnosis. The plumbing stays in case a different silicon variant
    or vendor SROM patch actually wires up the TPG block; setting
    test_pattern > 0 on the current die is harmless (writes succeed,
    no pattern appears).

  - No driver behaviour changes for AE / AWB / HFLIP / VFLIP /
    COLORFX / SATURATION / POWER_LINE_FREQUENCY / EXPOSURE /
    ANALOGUE_GAIN / AUTO_WHITE_BALANCE controls or for the standard
    stream-start path; all addressed in v3.

Changes since v2 (already in v3):

  - Address Krzysztof + Sakari binding feedback: maxItems on
    reset-gpios / powerdown-gpios; drop |- from descriptions; drop
    redundant link-frequencies / remote-endpoint / data-lanes;
    rename i2c0 -> i2c in example.

  - Add MAINTAINERS entry per patchwork checkpatch.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
Herman van Hazendonk (2):
      dt-bindings: media: i2c: add aptina,mt9m113
      media: i2c: add Aptina MT9M113 1.3 Mpx SoC sensor driver

 .../bindings/media/i2c/aptina,mt9m113.yaml         |  122 +
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   12 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/mt9m113.c                        | 3114 ++++++++++++++++++++
 5 files changed, 3257 insertions(+)
---
base-commit: 944125b4c454b58d2fe6e35f1087a932b2050dff
change-id: 20260606-submit-media-mt9m113-242c8be69e90

Best regards,
-- 
Herman van Hazendonk <github.com@herrie.org>



