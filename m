Return-Path: <linux-media+bounces-53901-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +I8IKeGVo2lPHgUAu9opvQ
	(envelope-from <linux-media+bounces-53901-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:26:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E231CAA12
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10AAB304EAAE
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4827427C84E;
	Sun,  1 Mar 2026 01:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nanezdwy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28202BD0B;
	Sun,  1 Mar 2026 01:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328033; cv=none; b=MXyKoSo6OO19kW/LGxmSJ4mjz55m6pMa3rOLT5KUyZHQUYDHcpZYzZHeoxFlYRN58K7Q796cUqPjG3dXCwF6L/FcOHtqvSR2qL19gDJF0uUN3HIeslrJXllZ4rrVUO8yorN24P9ZjLtzoJpP8XEFx1kp1G5UQzcCafVpKdDVEeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328033; c=relaxed/simple;
	bh=68bUwJHNOtlCVmQlD3fy5u7HzhnLcqn5zVxiLvNhbdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uVOdQypOdJxzawW9dmIgOWEpX47824QoejGJ5o/JXnXIo95q/LsdORrxJo4Xkug7Fp/gW/TBRx0Q9J88Ar3mdaSiqZ/DGumN+he18U/pQtVNfbnewKvNOAh4DBX0/ohX26yzXVhGTEZlohjaHLmBONgY023TyWDURvjm6dR0MTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nanezdwy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB828C19421;
	Sun,  1 Mar 2026 01:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328033;
	bh=68bUwJHNOtlCVmQlD3fy5u7HzhnLcqn5zVxiLvNhbdg=;
	h=From:To:Cc:Subject:Date:From;
	b=nanezdwyzsM6Bbg1JKSGI8oGUayJnHrH3/Gri4nGeDYqlCuLIosaz7H3WIpK3oq8S
	 r4lMsEpFZLnUSNsLvXv4C561zpSTuL4ubwavuCR8oXfikjNTTAbLKbzBPMlDVEQLIM
	 Ys4hKHq8mJymvhb5o/kPW+Xtq890aYzkuC5QcD5NB0OTC+kEJMshcvGMcawUK6W7ET
	 zaoLL+4xugMuVEMniy1LDZ/5YpsSDIGGhTRBOLfbAiIerrBinOqZUFHuLnyGzuNrVH
	 4cR+uQraGs1i0dnifc+1GhfaOvFqedRV+3eWxMtTCo2BBBJzUCglmjpIPC0Re694tV
	 XZv3njJUd6yTg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	ribalda@chromium.org
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Neil Sun <neil.sun@lcfuturecenter.com>,
	Naomi Huang <naomi.huang@lcfuturecenter.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: dw9714: Fix powerup sequence" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:31 -0500
Message-ID: <20260301012031.1676096-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53901-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,lcfuturecenter.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,arducam.com:url]
X-Rspamd-Queue-Id: 44E231CAA12
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 401aec35ac7bd04b4018a519257b945abb88e26c Mon Sep 17 00:00:00 2001
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Dec 2025 07:53:43 +0000
Subject: [PATCH] media: dw9714: Fix powerup sequence

We have experienced seen multiple I2C errors while doing stress test on
the module:

dw9714 i2c-PRP0001:01: dw9714_vcm_resume I2C failure: -5
dw9714 i2c-PRP0001:01: I2C write fail

Inspecting the powerup sequence we found that it does not match the
documentation at:
https://blog.arducam.com/downloads/DW9714A-DONGWOON(Autofocus_motor_manual).pdf

"""
(2) DW9714A requires waiting time of 12ms after power on. During this
waiting time, the offset calibration of internal amplifier is
operating for minimization of output offset current .
"""

This patch increases the powerup delay to follow the documentation.

Fixes: 9d00ccabfbb5 ("media: i2c: dw9714: Fix occasional probe errors")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Neil Sun <neil.sun@lcfuturecenter.com>
Reported-by: Naomi Huang <naomi.huang@lcfuturecenter.com>
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/dw9714.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
index 1e7ad355a388c..3288de539452e 100644
--- a/drivers/media/i2c/dw9714.c
+++ b/drivers/media/i2c/dw9714.c
@@ -149,7 +149,7 @@ static int dw9714_power_up(struct dw9714_device *dw9714_dev)
 
 	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 0);
 
-	usleep_range(1000, 2000);
+	usleep_range(12000, 14000);
 
 	return 0;
 }
-- 
2.51.0





