Return-Path: <linux-media+bounces-64017-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2hvUBzYUJGoV2wEAu9opvQ
	(envelope-from <linux-media+bounces-64017-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 14:36:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8808664D72E
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 14:36:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="HB/O4002";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64017-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64017-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1618302A4D9
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 12:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFFC3AC0CC;
	Sat,  6 Jun 2026 12:35:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD4E395AF2;
	Sat,  6 Jun 2026 12:35:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749328; cv=none; b=r1V7tjw+NPgv6NFQKxRTT2VZRe3XUHUGNyCuS229igWpA9zJoCxmIXytjgigoU8wju/QK/TxhSTsUlfgKhK6OiAnhv3ECcQe10JITyt1rhZGOlmqGT2cE7SMQv8xVTtj6XGdsloMkDBg6FcbOEeyN7j2U8IXnH7vBT0R4r08ujI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749328; c=relaxed/simple;
	bh=Gzx9HxWa4AXbjKi3u14vusmbkNBTIyZW73WJQXjm9uY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R/vT+uh3Gs8LR1NJaDaj4k+ua9yJEURFFJWyDDX+809pUmF1p1s4t2TlkamAHOETuCHq2LeVahm3xGeH47HGT9NXZ8pdOAO/q2B2U/ivlmZaoMzqAMPlkpFTboo5edUjcx0Lzsc6QZvnuuMP2boocE4J+H9+7Iy1UTHi/6plTZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HB/O4002; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59915C2BCB0;
	Sat,  6 Jun 2026 12:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780749328;
	bh=Gzx9HxWa4AXbjKi3u14vusmbkNBTIyZW73WJQXjm9uY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HB/O4002MvyXBKGS4v2M1mWYLzVbAqxOElk6wHas10rC75mTvhFnMgqMKJBLDmnr5
	 YF/8k+ZDk95qTgP52nQ+8W7LfRLY7iOtrALJoHAAw4AClsNT51oXdHRFHLb/SgDp3o
	 NUtU8KT3VWoQoBCVAO3Tnj7+f+pWpQS4L4nwGpR2pqY8tlTBAreSj/R+s00id5hl50
	 xEQ21pzWRNFBYDMFhjaiE9WEWoriNp9XJYql8z6HUJy5pYqy4Wlrpk05+oCO36vIjt
	 M19I7W3tFGK1KWouDD6o8x9if4oYmgvHMvhRFcHlfzgBhg8fncDmQmjYSv9wg35BP9
	 QRec2NykjQTVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDADCD8C8E;
	Sat,  6 Jun 2026 12:35:28 +0000 (UTC)
From: Herman van Hazendonk via B4 Relay <devnull+github.com.herrie.org@kernel.org>
Subject: [PATCH v5 0/2] media: i2c: add Aptina MT9M113 image sensor driver
Date: Sat, 06 Jun 2026 14:35:26 +0200
Message-Id: <20260606-submit-media-mt9m113-v5-0-2088c7358e11@herrie.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA4UJGoC/4WOTQ6CMBCFr0Jm7ZhSK1pX3sOwoGWAWRTMtBIN6
 d2tXMC81feS97NBJGGKcKs2EFo58jIXOB8q8FM3j4TcFwatdKOKML5c4ISBeu4wJBvq+oTaaH9
 11FiyCkr0KTTwe699tIUnjmmRz76ymp/7p3A1qFCZxhnv/GWw5j6RlKPHRUZoc85fLQdF3rkAA
 AA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Herman van Hazendonk <github.com@herrie.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780749326; l=6552;
 i=github.com@herrie.org; s=20240417; h=from:subject:message-id;
 bh=Gzx9HxWa4AXbjKi3u14vusmbkNBTIyZW73WJQXjm9uY=;
 b=+O83h6yMB4py5DeUjH1W8QZVz1VIvg7EUlX4ZMlUNzeSDW+jxDBZWcJDuoGZb3kndwdHoD5eQ
 m/ambjDNr1WCofBJou4D2mAac4c3TtLC5HuHdyNm81tgiJ48WXEtMAa
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
	TAGGED_FROM(0.00)[bounces-64017-lists,linux-media=lfdr.de,github.com.herrie.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,test-camera.sh:url,vger.kernel.org:from_smtp,herrie.org:mid,herrie.org:email,herrie.org:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8808664D72E

Add a V4L2 subdev driver for the Aptina (now ON Semiconductor) MT9M113
1.3 megapixel SoC image sensor with embedded ISP, as used on the HP
TouchPad (apq8060) front camera. The sensor is programmed over I2C and
streams YUV / RGB / monochrome over a 1-lane MIPI CSI-2 D-PHY link.

v5 addresses 5 Sashiko findings on the v4 patchset plus a follow-up
regression caught by an on-HW unbind-during-stream-start race test
(see "Test results" below).

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
Changes in v5:

  - [Low]  Kconfig: select V4L2_FWNODE alongside V4L2_CCI_I2C. The
    driver calls v4l2_fwnode_endpoint_alloc_parse() / _free() and
    embeds struct v4l2_fwnode_endpoint, so it needs to select the
    helper rather than rely on transitive selection from the host
    bridge (qcom-camss).

  - [High] mt9m113_stream_context_a(): propagate the SEQ_CMD_RUN
    poll timeout instead of unconditionally returning 0. The
    bounded retry loop in mt9m113_start_streaming() can now
    actually retry the wedged MCU; previously the silent return 0
    let the pipeline stream from an unconfigured chip.

  - [High] mt9m113_start_streaming(): take a single PM reference
    for the whole retry loop and bypass runtime PM between
    attempts. V4L2 bridges hold a managed DL_FLAG_PM_RUNTIME
    device-link reference on this sensor for the duration of
    s_stream, so the prior pm_runtime_put_sync_suspend() /
    pm_runtime_resume_and_get() pair was rejected with -EBUSY and
    the MCU was never actually power-cycled between attempts.
    The retry body now calls mt9m113_power_off() /
    mt9m113_power_on() / mt9m113_sensor_init() directly; on
    terminal failure pm_runtime_set_suspended + put_noidle keeps
    the PM core coherent with the hardware state.

  - [Med]  V4L2_CID_TEST_PATTERN: only set test_pattern_active /
    test_pattern_value after mt9m113_apply_test_pattern() succeeds.
    Previously a failed apply left test_pattern_active = true
    forever, causing every subsequent s_ctrl refresh site to skip
    its refresh thinking the MCU was halted.

  - [High] mt9m113_remove(): defer per-subdev cleanup
    (v4l2_subdev_cleanup, v4l2_ctrl_handler_free,
    media_entity_cleanup) and the kfree of the surrounding sensor
    struct to per-subdev .release callbacks
    (mt9m113_ifp_release, mt9m113_pa_release).
    v4l2_async_unregister_subdev() does NOT block waiting for
    in-flight ioctls; freeing the ctrl handler (whose mutex an
    in-flight VIDIOC_S_CTRL may be holding) directly from remove()
    left the ioctl unlocking freed memory. Switched sensor
    allocation from devm_kzalloc to kzalloc and gated the kfree
    behind an atomic release_count so both PA and IFP devnodes
    must drain before the struct is reclaimed.

  - [High, found in HW test] mt9m113_start_streaming() failure
    path: the unconditional trailing mt9m113_power_off(sensor)
    after the retry loop double-disabled clk + regulator on every
    failure exit because each in-loop break already powered the
    chip down. The 3-WARN cluster
    (clk_core_disable / clk_core_unprepare / _regulator_disable
    underflow) reliably fired during the unbind-during-stream-start
    race test. Dropped the trailing power_off; rely on each break
    path to leave the chip off. Re-verified on HW: WARN cluster
    gone, retry mechanism still works end-to-end.

Test results (v5, HP TouchPad APQ8060, kernel 7.1.0-rc1):

  - test-camera.sh comprehensive: pix640 PASS (1.38 MB),
    pix1280 PASS (5.9 MB), video640 PASS. Context A (640x480) and
    Context B (1280x1024) stream-start both functional.

  - 10x rapid pix640 + 10x rapid pix1280 stream stress: 20/20
    streams started cleanly. No MCU wedge on this session; when
    a wedge does occur, dmesg now shows the
    "stream start failed (-110), power-cycle + retry N/M" trace
    instead of the pre-fix silent return 0.

  - 60s mt9m113_remove() / bind cycle racing concurrent
    VIDIOC_QUERYCTRL / S_CTRL spammers on both /dev/v4l-subdev*
    nodes: zero Oops, zero BUG, zero KASAN-style splat
    (this kernel has no KASAN; latent UAF could still go
    unobserved, but the macro-symptoms a UAF would produce are
    absent). Driver re-bound cleanly at the end.

  - 120s concurrent multi-subsystem load (camera stream loop +
    dd to eMMC + /dev/urandom + filesystem walk): clean,
    USB stayed up, MDP stayed active. Driver still bound at the
    end.

  - dmesg post-sweep: 0 WARN, 0 BUG, 0 Oops, 0 clk underflow,
    0 regulator underflow, 0 v4l2-subdev WARN.

  - Kernel build clean (ARCH=arm, CONFIG_VIDEO_MT9M113=y,
    arm-linux-gnueabihf-gcc).

Changes since v3 (already in v4):

  - Context B (1280x1024 capture) stream-start regression fix.
    The MT9M113_SEQ_STATE_PREVIEW constant was 0x04 (== datasheet's
    "Leave preview" transient state); the actual stable preview
    state is 0x03. The Context-B preview-first poll in
    stream_context_b() timed out on every 1280x1024 stream-start.

  - Forensic NOTE comment above MODE_TEST_MODE documenting the IFP
    test-pattern generator silicon-removal investigation
    (R0x321C bit 4 hardwired to 0, R0x3246..R0x3252 dead block).
    V4L2_CID_TEST_PATTERN plumbing retained on the chance a
    different silicon variant or vendor SROM patch enables the
    TPG block.

Changes since v2 (already in v3):

  - Address Krzysztof + Sakari binding feedback: maxItems on
    reset-gpios / powerdown-gpios; drop |- from descriptions; drop
    redundant link-frequencies / remote-endpoint / data-lanes;
    rename i2c0 -> i2c in example.

  - Add MAINTAINERS entry per patchwork checkpatch.

- Link to v4: https://lore.kernel.org/r/20260606-submit-media-mt9m113-v4-0-046b4cbc7f94@herrie.org

---
Herman van Hazendonk (2):
      dt-bindings: media: i2c: add aptina,mt9m113
      media: i2c: add Aptina MT9M113 1.3 Mpx SoC sensor driver

 .../bindings/media/i2c/aptina,mt9m113.yaml         |  122 +
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   13 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/mt9m113.c                        | 3252 ++++++++++++++++++++
 5 files changed, 3396 insertions(+)
---
base-commit: 944125b4c454b58d2fe6e35f1087a932b2050dff
change-id: 20260606-submit-media-mt9m113-242c8be69e90

Best regards,
-- 
Herman van Hazendonk <github.com@herrie.org>



