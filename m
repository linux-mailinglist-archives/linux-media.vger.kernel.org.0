Return-Path: <linux-media+bounces-53071-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKH7EwiQlmkwhgIAu9opvQ
	(envelope-from <linux-media+bounces-53071-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 05:22:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD6715C00E
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 05:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A68D1302AC14
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 04:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6F6279798;
	Thu, 19 Feb 2026 04:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="z2SpYNyn"
X-Original-To: linux-media@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABC51D555
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 04:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771474945; cv=none; b=a58pHF1CTqJz/WSB0EZGNUzOSrHGclBHPGhWn7qjwNqoVmukIAf0DqSuGNQuesLJB18jO/rYb4SuoztyFLeWRi9zrrv6ZTO5jI6rJdAyDsc4pjLR+k/J5uRGYRzUWVZvP7UIouLgMXapNiGkHZ+/2s86BS47rR2dS51avz85XdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771474945; c=relaxed/simple;
	bh=QmiFeMIwm6MIH/qQ2FxjOtiA9u5JvtUZbYFDszf6Jcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K9P85L8Y553R3vxohTf9rTG9q/f2e8rT475njhw13DmP/jJajG/QpOn/fITqQzpZMt97UJl4egqE7Q5SRMT4SyOQkRYXxkcmzQTq7e8pVQGKcFUpJ2CVLNsb7eEUj8gj7rMggZ6JglPcKmpek/5FQP3al5yLeC41oz3mO17eBEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=z2SpYNyn; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1771474458; bh=QmiFeMIwm6MIH/qQ2FxjOtiA9u5JvtUZbYFDszf6Jcw=;
	h=From:To:Cc:Subject:Date:From;
	b=z2SpYNyn6mFnAhEXq87SZ8dYObZ/7082H6gPwmqB4MlE4ZYltrFDlUQ09myFrMKfV
	 qrfOLFQHpCvVPfbVgfjWMQGtYhWA/Xdly10vDFRq8AwZcusnjA33dpuWAsSSU5cuvQ
	 Ci1Lakt4NM5dYC52Nhhd6hiFNcrflKsso6Liye+HWw1ovqlNlvvfgghBYPxUD3vd1i
	 0NIA3nVLp6b71OlM4vYBlNsFLK4jxv8pIt0+4Vm9wM7LEJulhCP5lDhdEGr/WihkQo
	 n4nn8uZ/od1OrjKefj5kZF31DnI+oQyB3UyJmPD0Sq+jDbt3U4ji0umAAYCuAUjHcb
	 XE+Jrw4/nwnjQ==
Received: from microtis.vulpes.eutheria.net (71-212-14-89.tukw.qwest.net [71.212.14.89])
	by endrift.com (Postfix) with ESMTPSA id EB7FBA041;
	Wed, 18 Feb 2026 20:14:17 -0800 (PST)
From: Vicki Pfau <vi@endrift.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH] media: pulse8-cec: Handle partial deinit
Date: Wed, 18 Feb 2026 20:14:08 -0800
Message-ID: <20260219041410.608067-1-vi@endrift.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[endrift.com,none];
	R_DKIM_ALLOW(-0.20)[endrift.com:s=2020];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53071-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vi@endrift.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[endrift.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7CD6715C00E
X-Rspamd-Action: no action

In the event that the cec dev node is held open while the adapter is
disconnected the serio device will be cleaned up but the cec device won't
be. As the serio device is freed but the ping_eeprom_work is not canceled,
the next ping will still attempt to send, leading to a kernel oops.

This patch both cancels the ping_eeprom_work in the serio cleanup as well
as checking to make sure the serio is still present before attempting to
write to it. Note that while the added serio = NULL line looks similar to
one that was removed in commit 024e01dead12c ("media: pulse8-cec: fix
duplicate free at disconnect or probe error"), it notably happens before
calling cec_unregister_adapter, and as such shouldn't lead to the
user-after-free that removing it fixed.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/media/cec/usb/pulse8/pulse8-cec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/cec/usb/pulse8/pulse8-cec.c b/drivers/media/cec/usb/pulse8/pulse8-cec.c
index 60569f1670fe5..67834ed333d32 100644
--- a/drivers/media/cec/usb/pulse8/pulse8-cec.c
+++ b/drivers/media/cec/usb/pulse8/pulse8-cec.c
@@ -235,6 +235,9 @@ static int pulse8_send_and_wait_once(struct pulse8 *pulse8,
 {
 	int err;
 
+	if (!pulse8->serio)
+		return -ENODEV;
+
 	if (debug > 1)
 		dev_info(pulse8->dev, "transmit %s: %*ph\n",
 			 pulse8_msgname(cmd[0]), cmd_len, cmd);
@@ -655,6 +658,10 @@ static void pulse8_disconnect(struct serio *serio)
 {
 	struct pulse8 *pulse8 = serio_get_drvdata(serio);
 
+	cancel_delayed_work_sync(&pulse8->ping_eeprom_work);
+	mutex_lock(&pulse8->lock);
+	pulse8->serio = NULL;
+	mutex_unlock(&pulse8->lock);
 	cec_unregister_adapter(pulse8->adap);
 	serio_set_drvdata(serio, NULL);
 	serio_close(serio);
-- 
2.53.0


