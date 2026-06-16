Return-Path: <linux-media+bounces-65021-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q436J6BMMWoQgQUAu9opvQ
	(envelope-from <linux-media+bounces-65021-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:16:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E1868FCEF
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:16:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SMiuR1A6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65021-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65021-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 216B2300D7BA
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41F02D8370;
	Tue, 16 Jun 2026 13:16:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0D12D7D47
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 13:16:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615768; cv=none; b=ny2Q0uuLn+u8Sjb/zA1qigFUXvnq2Znbq5WoWAreZbAYF5JYCX5TLA7RjOmJvZOvWDmLha4N3ZltM0npIuWlPxbjKfb4y/dU1+foJXkFz6FK1zNOHcnOcUZRXhKxGjuIkctrocjS39IQjJeLcpQkqU1c78EauLd3kKbAxhfqbVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615768; c=relaxed/simple;
	bh=dUwqAnz0/TuASW4vZarIfA4GSd08JvaX0F9UAaM4aGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpW2kbqYbQ7etWl1ht8Qh/eO1XJLjm5oUsdVm+ErwyuYhWd92cpcirHJa17D8p9FZeeunpabQ7AMVE+zDoZOzxjtDdK/7ZDxaYlcxfRrC4h6ND/zZJcXV+E680hltNDNfScajbhk+Q5SnnM/YXlnfejYyGt2+cwkG5cxl7jwwcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMiuR1A6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0931F00A3A;
	Tue, 16 Jun 2026 13:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781615767;
	bh=SH7FUth3Zwij3ImnbuX7PvbB0qERb2sjAYYUuxwpQUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SMiuR1A6W0MlSHI6lYxxvOrXMIjuD0OW7e2J8K0FJVnPmIxv3DZKSVWU4eHpTCO7P
	 CnUEtJv/v4a1Q0Gc61yuc9/OfCOz3/5rulPbvbRQ7HDhuijvUzoVUS1Lc8IbA4E8eW
	 AGn4KSAz3zJZvEKcAmTX/0X7HcLNs8IccMo2tBckuW/9e7/MjP3q4lwi2eo5kKqTbv
	 TNjnxbR5t3PsAK99WQlyLtvoxqD94EHdI1pnV+4RCWdaRBjEwcFk4cUWFfnM0isPDL
	 78yjyFHtL7KuqlsLT8yWr1dIU7D14CPQc9gT9iHWk1MfcmxY+FmXyINXuuqtvHKrxB
	 F0qkN2YmMYuCA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 1/6] media: core: v4l2-async.c: unreg subdev if asc_list is empty
Date: Tue, 16 Jun 2026 15:10:27 +0200
Message-ID: <efb6cfeb1053399ebd51b83fcc4daee632281558.1781615432.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781615432.git.hverkuil+cisco@kernel.org>
References: <cover.1781615432.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-65021-lists,linux-media=lfdr.de,cisco];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mfo@igalia.com,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94E1868FCEF

In v4l2_device_unregister_subdev(), if sd->asc_list is empty,
then v4l2_device_unregister_subdev() is never called, but that
should still happen.

This causes crashes with em28xx that uses tvp5150: that i2c
module uses v4l2_async, but em28xx does not as it predates
v4l2_async.

So if sd->asc_list is empty, then just call
v4l2_device_unregister_subdev().

Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/v4l2-core/v4l2-async.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 888a2e213b08..fd0404ce9247 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -897,7 +897,9 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 	kfree(sd->subdev_notifier);
 	sd->subdev_notifier = NULL;
 
-	if (sd->asc_list.next) {
+	if (list_empty(&sd->asc_list)) {
+		v4l2_device_unregister_subdev(sd);
+	} else {
 		list_for_each_entry_safe(asc, asc_tmp, &sd->asc_list,
 					 asc_subdev_entry) {
 			v4l2_async_unbind_subdev_one(asc->notifier, asc);
-- 
2.53.0


