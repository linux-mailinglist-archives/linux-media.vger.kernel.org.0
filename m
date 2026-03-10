Return-Path: <linux-media+bounces-55034-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOnTKjajr2kSbQIAu9opvQ
	(envelope-from <linux-media+bounces-55034-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 05:51:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F37245509
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 05:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 815A3302AF06
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 04:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D1B3822A3;
	Tue, 10 Mar 2026 04:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="W9YwL3W+"
X-Original-To: linux-media@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A69175A80
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 04:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773118256; cv=none; b=vF00r7vmQihjqVKEJ42ylC0B9U+G8WIuROA8VbFA46TzMguBadPPdZPMWqXAchFjocp6suXS42JZ4QkryA8nfv8av9UOJp4qPihVGIkdLm0q75Jm4jen3J1AbyYovLZ7/odSrTde/Awy7wAor13RawVaDBn3veRhe2V/0fhn9i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773118256; c=relaxed/simple;
	bh=QmiFeMIwm6MIH/qQ2FxjOtiA9u5JvtUZbYFDszf6Jcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KRE0MaqNp9mLTYr4mYomXA0tQNQ68CsHWOPjQrpaTKNYUeORsvsDPo0dt22YF0H+xPNTbapUbMMhSFeKvAsaTDog5xtg6PIdAgIjLOOA+EOehLi/n+YMD9Yh01dHoyHPWj/Fe5WYybdAYrRQBxYFApbLuyZC77GCgrXJyVStMOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=W9YwL3W+; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1773118254; bh=QmiFeMIwm6MIH/qQ2FxjOtiA9u5JvtUZbYFDszf6Jcw=;
	h=From:To:Cc:Subject:Date:From;
	b=W9YwL3W+mglewCZnmWWHDdym1JtfmVadTAl5pz/nTf29PpeoEBQiQOsjYAnCD0dpM
	 OHWVDUpo/rCJW07NkBA2Tac9oOGr91zpbUZb2ZeZaQWjk1de7piwElyFBFU9zcZgQm
	 jtbz1dAz02VAMPwvW4t4gE3r5fNHZMsZaeqHfgAnTj15vDzTbVaZ53GrpVqoR5RDOM
	 S0XSW/Yg9Ff8QPImkd5gdk2+y4EQ3I35YDsvdTlCefjj1IoD8g/2yO9P2rTA7JRu/R
	 K9w1VVahyDkt0KLd8cXtEpdvR5yVQBPD48+5JxcA2+1swYloPHLSeqUDUixVkU0VnK
	 13o5Q15ZDDhyQ==
Received: from microtis.vulpes.eutheria.net (71-212-14-89.tukw.qwest.net [71.212.14.89])
	by endrift.com (Postfix) with ESMTPSA id B11B5A0AA;
	Mon, 09 Mar 2026 21:50:54 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [RESEND] media: pulse8-cec: Handle partial deinit
Date: Mon,  9 Mar 2026 21:50:34 -0700
Message-ID: <20260310045038.1288473-1-vi@endrift.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 40F37245509
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[endrift.com,none];
	R_DKIM_ALLOW(-0.20)[endrift.com:s=2020];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55034-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vi@endrift.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[endrift.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,endrift.com:dkim,endrift.com:email,endrift.com:mid]
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


