Return-Path: <linux-media+bounces-52790-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFWMCtzJj2nMTgEAu9opvQ
	(envelope-from <linux-media+bounces-52790-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:03:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8E713A44A
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:03:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A76DA301DFA4
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 01:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DC01FF1AD;
	Sat, 14 Feb 2026 01:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tiPKGB8w"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181C819004A;
	Sat, 14 Feb 2026 01:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771030980; cv=none; b=fEFBJkIjr4afVaSWzmdZo9riKOWe/AfNQ415R6NoJxLJUei2qUy0xtkwilOGcefU2UFW9w8UyjhyjG9dX6RrFXneB+sGY+WO1KCACHM7ar+kiwBoNU9XuImuYB8yq8gl8lLtanQQ/FFr1eFt9ugPBs9bs7u40ouoBbHkO8muudk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771030980; c=relaxed/simple;
	bh=VSI6CnrW6/IKVWVme+wtXswdhlJrcqigCGiPuij2fzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kPbDI4xfi2G01oHWgA93bLjWGwRbULcxd4AjDb3lRZPijikdxueZMY9X1rhhrfN3mz4rhberSCQBAFeAuGvldM2ULYrxjrek8v3wFe08mzg5VfmRGrk2C6PG/h5q51WB5LMrH2c2b+7M7GXIaEmMlxMEZJ1sdZJyQl8HKDFeCGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tiPKGB8w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D250BC16AAE;
	Sat, 14 Feb 2026 01:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771030979;
	bh=VSI6CnrW6/IKVWVme+wtXswdhlJrcqigCGiPuij2fzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tiPKGB8wxGFIetYDyGDdggkZ2Y5kfsnyrYSrb7vATSaE7MgLlTA5LUR9WZlAx0D0O
	 1/mP9ePUlMJJ/wBLr2/KBGZPl02XJeoCyy/LNai05B3RjPspmnokLrQQ+ku+QLupCX
	 /P+Rl19tIRBLeSrFuDCVRGouVHAaqrWxkoDth7YqAPNH226YkmVCu1DAM2BWWPUaYt
	 uNli5+yTD331W/ekW3EmhmW9K8X3XulAN4luR5JRAEmBNzL4Y6rJrF3WP/Ra9t4lKE
	 oMj4rUeczEz/7OU4PDsJk+e9FuvKTcA/7wZKNzdnwf9zU8gIL1BUVQbiAuWGcjmDPg
	 sP8ctj4iSeN7A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.12] media: mt9m114: Avoid a reset low spike during probe()
Date: Fri, 13 Feb 2026 19:58:08 -0500
Message-ID: <20260214010245.3671907-8-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-52790-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,ideasonboard.com:email]
X-Rspamd-Queue-Id: CC8E713A44A
X-Rspamd-Action: no action

From: Hans de Goede <johannes.goede@oss.qualcomm.com>

[ Upstream commit 84359d0a5e3afce5e3e3b6562efadff690614d5b ]

mt9m114_probe() requests the reset GPIO in output low state:

	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);

and then almost immediately afterwards calls mt9m114_power_on() which does:

		gpiod_set_value(sensor->reset, 1);
		fsleep(duration);
		gpiod_set_value(sensor->reset, 0);

which means that if the reset pin was high before this code runs that
it will very briefly be driven low because of passing GPIOD_OUT_LOW when
requesting the GPIO only to be driven high again possibly directly after
that. Such a very brief driving low of the reset pin may put the chip in
a confused state.

Request the GPIO in high (reset the chip) state instead to avoid this,
turning the initial gpiod_set_value() in mt9m114_power_on() into a no-op.
and the fsleep() ensures that it will stay high long enough to properly
reset the chip.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of mt9m114 Reset GPIO Spike Fix

### Commit Message Analysis

The commit describes a hardware initialization ordering issue in the
mt9m114 camera sensor driver. During `probe()`, the reset GPIO is
requested in `GPIOD_OUT_LOW` (deasserted) state, but then
`mt9m114_power_on()` immediately drives it high (asserted/reset),
sleeps, then drives it low (deasserted). If the reset pin was already
high before probe, this creates a brief low spike that could put the
chip in a "confused state."

The fix changes `GPIOD_OUT_LOW` to `GPIOD_OUT_HIGH` so the GPIO starts
in the reset-asserted state, making the first
`gpiod_set_value(sensor->reset, 1)` in `mt9m114_power_on()` a no-op, and
the subsequent sleep ensures proper reset timing.

### Code Change Analysis

The change is a single-line modification:
```c
- sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+ sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
```

This is an extremely minimal, surgical change. It changes the initial
state of the reset GPIO from low (deasserted) to high (asserted/in-
reset), which avoids a brief glitch that could leave the sensor in a bad
state.

### Bug Classification

This is a **hardware initialization bug fix**. The brief low spike on
the reset pin is a real hardware issue that can cause the mt9m114 sensor
to enter an undefined state during probe. This can manifest as:
- Sensor failing to initialize properly
- Unreliable camera operation
- Potentially different behavior depending on the prior state of the
  GPIO (non-deterministic)

### Scope and Risk Assessment

- **Lines changed**: 1 (single token change: `GPIOD_OUT_LOW` →
  `GPIOD_OUT_HIGH`)
- **Files changed**: 1 (`drivers/media/i2c/mt9m114.c`)
- **Risk**: Very low. The change is logically sound — since
  `mt9m114_power_on()` immediately asserts reset (high), starting in the
  high state eliminates the transient glitch without changing the
  overall reset sequence.
- **Subsystem**: Media/camera driver (i2c sensor driver)

### Stability Indicators

- **Reviewed-by**: Laurent Pinchart (well-known media subsystem
  maintainer)
- **Multiple sign-offs**: Hans de Goede, Sakari Ailus, Hans Verkuil (all
  experienced media/kernel developers)
- The logic is straightforward and obviously correct

### User Impact

Users with the mt9m114 camera sensor could experience unreliable
initialization. This is a real hardware issue — the reset pin glitch
depends on the prior GPIO state, making it potentially intermittent and
hard to debug. The fix ensures deterministic, correct behavior.

### Dependency Check

The change is self-contained. It modifies a single GPIO request flag and
doesn't depend on any other commits. The mt9m114 driver has been in the
kernel for a while, so it exists in stable trees.

### Risk vs. Benefit

- **Benefit**: Fixes a real hardware initialization issue that can cause
  unreliable sensor operation
- **Risk**: Essentially zero — the change is a single constant that
  aligns the initial GPIO state with what `mt9m114_power_on()` expects
- **Trade-off**: Strongly favorable for backporting

### Concerns

This is a minor driver fix for a specific camera sensor. While the user
base may not be huge, the fix is trivially correct, has essentially zero
regression risk, and fixes a genuine hardware issue. It meets all stable
kernel criteria:
1. Obviously correct and reviewed by multiple experts
2. Fixes a real bug (hardware reset glitch)
3. Important for affected users (unreliable device initialization)
4. Extremely small and contained (1 line)
5. No new features or APIs

**YES**

 drivers/media/i2c/mt9m114.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 51ebbe7ae9969..554f25071cca6 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2434,7 +2434,7 @@ static int mt9m114_probe(struct i2c_client *client)
 		goto error_ep_free;
 	}
 
-	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(sensor->reset)) {
 		ret = PTR_ERR(sensor->reset);
 		dev_err_probe(dev, ret, "Failed to get reset GPIO\n");
-- 
2.51.0


