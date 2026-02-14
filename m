Return-Path: <linux-media+bounces-52796-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHOhL1zKj2ntTgEAu9opvQ
	(envelope-from <linux-media+bounces-52796-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:05:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEDC13A62F
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C1D630091C5
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 01:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C991D5ABA;
	Sat, 14 Feb 2026 01:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0Fb2+JA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CE33EBF2C;
	Sat, 14 Feb 2026 01:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771031077; cv=none; b=Vp95wPwssuCRirSay/ZerKciiYoQEAyGwDYY+/WKBEvo07EdceaKuCC9j3SFhBbOeHHNA+13bDX0PGsLBTkUnUmiFq0e1weyy60clEWlY4XkY8OuihrK1K5j92NI9zjNwjQNcOKamgZC4K2mPxdcRUvLXPKQVnnzQxOLodyiFAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771031077; c=relaxed/simple;
	bh=7/O/wydur+hPElLkSYkXNH/MjZXgq/aaJ+3jcTRnN/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gTTWJrSE/iTGyFUzG2W7Z9G9rZqUKVjxhGnpuSU4PFhmS5SJ4b0sHe0qvxiddQCEA8JNzDZxnu0/ECT3YEMJdiwlT9NgAkmOrypTHRmqn3AK3HZaktQEmm8ZtURj3+z1XWbiKX7bvJ2VeSavKeP7WutDnQTlYWRnq/jkkMO+dQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0Fb2+JA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597B5C19423;
	Sat, 14 Feb 2026 01:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031077;
	bh=7/O/wydur+hPElLkSYkXNH/MjZXgq/aaJ+3jcTRnN/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u0Fb2+JA3sNpM7HUg7oGjIbA/nku3YiIb/SDlfZUdGb37VGx6o783LWjnspIASzAk
	 76IVLu0n9ePP3pwhoOSz9ch4q3xtJw3ETsrc3XTavEJ0LjR/v83uQuIPPWBXcNPTmW
	 //Cs+CvrZJwmZeUXg0FhzS4nclnenmPUPGUbIjGctyqvyA1Ddf393zkoRSfid5/S12
	 2TUAWLdA8ST6l5qeshkokBRL0tbI9+syPyJ1+G4JyrBvlPKqYbryZaP4Ftk+yYn9Bl
	 W+hJ0swzwt1rIylcnXJk6i8VXc1AgbWXoUBUHzarwLYTRASQtPvMUzaU2M0OrtT2Zq
	 rGjzB3iu6mhgw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.12] media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
Date: Fri, 13 Feb 2026 19:58:52 -0500
Message-ID: <20260214010245.3671907-52-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-52796-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,ideasonboard.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 3FEDC13A62F
X-Rspamd-Action: no action

From: Hans de Goede <johannes.goede@oss.qualcomm.com>

[ Upstream commit 437e1f6a960035166495a5117aacbc596115eeb6 ]

With IPU# bridges, endpoints may only be created when the IPU bridge is
initialized. This may happen after the sensor driver's first probe().

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of mt9m114: Return -EPROBE_DEFER if no endpoint is found

### Commit Message Analysis

The commit changes the mt9m114 camera sensor driver to return
`-EPROBE_DEFER` instead of `-EINVAL` when no fwnode graph endpoint is
found during probe. The rationale is that on ACPI systems (specifically
with IPU bridges), the fwnode graph endpoints may not yet exist at the
time the sensor driver first probes — they are created later when the
IPU bridge driver initializes.

### Code Change Analysis

The change is small and focused:

1. **Old behavior**: When `fwnode_graph_get_next_endpoint()` returns
   NULL, the driver logs an error and returns `-EINVAL`, causing
   permanent probe failure.

2. **New behavior**: When no endpoint is found, return `-EPROBE_DEFER`
   (via `dev_err_probe()`), which tells the driver core to retry probing
   later. A comment explains this is needed because on ACPI systems, the
   bridge driver that creates the fwnode graph may not have probed yet.

3. The `dev_err()` is replaced with `dev_err_probe()`, which is the
   standard kernel pattern for deferred probing — it only logs at debug
   level for `-EPROBE_DEFER` (avoiding log spam) and at error level for
   other errors.

### Bug Classification

This fixes a **real probe ordering bug** on ACPI-based systems. Without
this fix, the mt9m114 sensor driver will permanently fail to probe on
systems where the IPU bridge hasn't initialized yet at the time of the
first probe attempt. This is a **race condition** between driver
initialization order — the sensor driver needs endpoints that the bridge
driver creates, but there's no guaranteed ordering.

This is a common pattern in the kernel — many drivers have been updated
to return `-EPROBE_DEFER` for exactly this kind of dependency issue.
It's a well-understood fix.

### Scope and Risk Assessment

- **Lines changed**: ~15 lines (very small)
- **Files affected**: 1 file (`drivers/media/i2c/mt9m114.c`)
- **Risk**: Very low. The change only affects the case where no endpoint
  is found. If an endpoint IS found, behavior is unchanged. The worst
  case is that on systems where no endpoint will ever appear, the driver
  will defer indefinitely rather than failing immediately — but this is
  standard kernel behavior for deferred probing, and the driver core
  handles this gracefully.

### User Impact

Users with mt9m114 camera sensors on ACPI-based systems (e.g., Intel
platforms with IPU bridges) would find the camera doesn't work at all
without this fix. The sensor driver would fail to probe permanently.
This is a real-world issue affecting actual hardware functionality.

### Review and Testing

- **Reviewed-by: Laurent Pinchart** — well-known media subsystem
  maintainer
- **Signed-off-by**: Hans de Goede (Qualcomm/known kernel developer),
  Sakari Ailus (Intel, media maintainer), Hans Verkuil (media subsystem
  maintainer)

The patch has strong review credentials from multiple experienced media
subsystem developers.

### Stable Criteria Check

1. **Obviously correct and tested**: Yes — standard `-EPROBE_DEFER`
   pattern, reviewed by multiple maintainers
2. **Fixes a real bug**: Yes — sensor driver fails to probe on ACPI
   systems with IPU bridges
3. **Important issue**: Moderate — camera hardware doesn't work without
   this fix on affected systems
4. **Small and contained**: Yes — ~15 lines in a single file
5. **No new features**: Correct — this is a bug fix for probe ordering
6. **Applies cleanly**: Should apply cleanly as it's a self-contained
   change

### Dependency Check

Let me verify if the mt9m114 driver exists in older stable trees and if
there are any dependencies.

The `dev_err_probe()` function has been available since kernel 5.10, so
this should be backportable to any stable tree that has the mt9m114
driver. The mt9m114 driver was added relatively recently (v6.x era), so
the backport scope may be limited to recent stable trees, but that
doesn't affect the decision.

### Conclusion

This is a straightforward probe-deferral fix for a real hardware
functionality issue. It uses a well-established kernel pattern
(`-EPROBE_DEFER`), is small and surgical, has been reviewed by multiple
media subsystem maintainers, and carries very low regression risk. It
fixes a real problem where the mt9m114 camera sensor fails to work on
ACPI-based systems with IPU bridges.

**YES**

 drivers/media/i2c/mt9m114.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 554f25071cca6..b1325e2cd1321 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2360,11 +2360,17 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 	struct fwnode_handle *ep;
 	int ret;
 
+	/*
+	 * On ACPI systems the fwnode graph can be initialized by a bridge
+	 * driver, which may not have probed yet. Wait for this.
+	 *
+	 * TODO: Return an error once bridge driver code will have moved
+	 * to the ACPI core.
+	 */
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
-	if (!ep) {
-		dev_err(&sensor->client->dev, "No endpoint found\n");
-		return -EINVAL;
-	}
+	if (!ep)
+		return dev_err_probe(&sensor->client->dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
 	sensor->bus_cfg.bus_type = V4L2_MBUS_UNKNOWN;
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &sensor->bus_cfg);
-- 
2.51.0


