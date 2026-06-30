Return-Path: <linux-media+bounces-66118-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Os2rMBTbQ2pKkQoAu9opvQ
	(envelope-from <linux-media+bounces-66118-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 17:04:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A99D46E5B57
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 17:04:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nOVlOIPw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66118-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66118-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE458304E5EF
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64FF31F99E;
	Tue, 30 Jun 2026 15:04:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD4062809
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 15:04:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831873; cv=none; b=Pcrs/+ghg/bP+PKtBVMqulupIWVPNNnicYvaZi9FZlfdHPzsVZfzXwZAhsdIVtilMw5tEERXvaDzaZ7kss2L74sOyZgvnChEUtbFrVrrhPGnOLuop5YhhjyHZLBAWR/yogAcGnt7nxt+lzDKkUnnhE3zPQqDeZ8CGCuML6KWeZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831873; c=relaxed/simple;
	bh=/AZDA9evW6vN9/J5EgwIJl1lSUEJhM4gBNz+0u2uWrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CvsWj6we16BJcJRvz3OQAtnoYzebHMKspYGFZF33F21UpFgGAbLMmcHWZSvHBd6AwP7WvbxcsfUPpSJvtyuZ48jNqGRn7TVlFEJOZS/CrqtT1+VICAREYwkQ4GyE5cG2YEsjIHFNgK/6M/gBxiUn794A8kgVCq1z4LGhD0650nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOVlOIPw; arc=none smtp.client-ip=209.85.216.42
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37fb17e1435so1696072a91.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 08:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782831871; x=1783436671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8gACLPeN5jRV3zX1gHE6qIstojaQ1Y33Ij6QKA0BZcs=;
        b=nOVlOIPwE90SBZXUcRTVSMMAB021CcDwnBuCCBBabfGm8sJfmEWT4mB5ZUHv6gpkJG
         KNQ3/7Y+g1XcrRFRXh9R1j3xe/vpNZKnriey6HaMsFY765Aw+E5k7Tk3dqV60M0t9qW2
         p6Z3eqp28DXXbOHG227NfSW/cwcCUyoy+oOTBaffWIx9vvBx0OwfKrZMBKRayymipP5z
         +tnkLlMuqhy1kmbmqg+Jrtzpr/1OY9BaVLrsvSsiDI9qQW4bgbeBkFCgACshFaYZkuVm
         /nyySc44KM3CJX/bG3nvDAupJTs1web1SqPVfgL8R68d2r/ubJY8+QSOf3s6kB6/BGUw
         qAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831871; x=1783436671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gACLPeN5jRV3zX1gHE6qIstojaQ1Y33Ij6QKA0BZcs=;
        b=jGIznc9FVGtibEahftErhnHSszGM0WAbjCUsALdlWtRmZLufnIReckNjBpLuvrc0w0
         AJ3zHgDxm9wZxMOHoVtUb+V5yh1Ha9CMfIh0Dk0w1vn+pkYZCFGjS4GLdFsGT051NhlS
         J8hiUf+cKf2FDHosASWiGJIsKijD1psP4RJd+jCGps0vPIbEhBickaTX/rGLeKWc6xtf
         mZ48OuslcioUgp2YY59lHz98A2is2NNJRWsq2N23+5qrc8k3g9VW/ifEkc6OQnWaMudS
         uRnxHHUUM+LoErmlMVDz+VAMT+mCv6lpWYyEwvrvRUzsw0nXN1HHzWGpH35XnPcz7Jmh
         Sldw==
X-Gm-Message-State: AOJu0YwplulWJX0WXEq0ZI9SA6/AZ64qBzy0tbrcI4cjID7m8tFWdiVb
	VoVkvBPogWtAHWhWVU7zBZgBNkN+BbmZH3KA9+tGc8rWhoShBpC01FXmI/dE9CnlgqHxBw==
X-Gm-Gg: AfdE7cmwR9gtGgeK6btJqRFqr16WzSjwq8TSkVNvQ2wUy6wNuwkw5kwmON8mukGxQNC
	2cBCd3ZgGe1eyBbB1+4nUivwcG2oMIMuyog26+5V/n/cUtbjwyxQy3R5pwGtGL/89E/QU3DSd9V
	j9g2b4NW6Ss9J9Y5sTmK7Az5DZRjzES/OUnb5FPMeYP6TQ6/rsm8Ki6SGPA0DrQQV/pSxsE+Nvf
	hh4Rmj+FIE+mMXb9NS+N+hD/071xBu5N1kKW0DHgGWCqSwuRy5N5E9DcTAdS/i5XfkBaW6pysaP
	FBYJXYyBXZFp88kfH0SFymtd7AtoTlKeCERSO5qV5XuVzfMHBOKzzAZiCke1UD2M4B5BgSK1dDm
	H7JUtuDuJCkgxrWlHJ3JE2IrhvscHZ9+AQyO1HW3lcXX8F1XHrOLRSuarzwY/1EEqWC8ANAPtg9
	gT03x3tIlt9hd0YdmG4xvpw8GhID80pe31eVWvKk8=
X-Received: by 2002:a17:90b:1c08:b0:380:83fc:431b with SMTP id 98e67ed59e1d1-3808c11b7dbmr722445a91.27.1782831871236;
        Tue, 30 Jun 2026 08:04:31 -0700 (PDT)
Received: from White.tail445f11.ts.net ([223.233.84.22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095ea2e2dsm31046a91.16.2026.06.30.08.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:04:30 -0700 (PDT)
From: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Kees Cook <kees@kernel.org>,
	Chuck Ritola <cjritola@gmail.com>
Subject: [PATCH] media: dvb-frontends: a8293: propagate set_voltage errors
Date: Tue, 30 Jun 2026 20:34:02 +0530
Message-ID: <20260630150403.46327-1-nikhilgurudasani314@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,baylibre.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66118-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:u.kleine-koenig@baylibre.com,m:kees@kernel.org,m:cjritola@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[nikhilgurudasani314@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikhilgurudasani314@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A99D46E5B57

a8293_set_voltage() invokes the slew or non-slew voltage programming
helper but ignores its return value and always reports success.

Propagate the selected helper's status so I2C failures reach the DVB
frontend.

Fixes: e6431a0c0d71 ("media: dvb-frontends: a8293: fix LNB powerup failure in PCTV 461e")
Signed-off-by: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
---
 drivers/media/dvb-frontends/a8293.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/a8293.c b/drivers/media/dvb-frontends/a8293.c
index 52e3dc928327..1390068041d2 100644
--- a/drivers/media/dvb-frontends/a8293.c
+++ b/drivers/media/dvb-frontends/a8293.c
@@ -202,12 +202,10 @@ static int a8293_set_voltage(struct dvb_frontend *fe,
 
 	/* Use slew version if slew rate is set to a sane value */
 	if (volt_slew_nanos_per_mv > 0 && volt_slew_nanos_per_mv < 1600)
-		a8293_set_voltage_slew(dev, client, fe_sec_voltage,
-				       volt_slew_nanos_per_mv);
-	else
-		a8293_set_voltage_noslew(fe, fe_sec_voltage);
+		return a8293_set_voltage_slew(dev, client, fe_sec_voltage,
+					      volt_slew_nanos_per_mv);
 
-	return 0;
+	return a8293_set_voltage_noslew(fe, fe_sec_voltage);
 }
 
 static int a8293_probe(struct i2c_client *client)

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.43.0


