Return-Path: <linux-media+bounces-62934-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAiGHEtuF2rHEwgAu9opvQ
	(envelope-from <linux-media+bounces-62934-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 00:20:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0595EA9E2
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 00:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6D2C3012E79
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 22:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B133CAE66;
	Wed, 27 May 2026 22:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="DfeZQjWd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C043C1F37
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 22:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779920450; cv=none; b=iLj2wzTGxcJqpxiu14ZytBzrWzUsLNYy1TRfyTHpDNBNkv0SLcLkWRfAO566VzBusgTrBjfWim29oYbZsWte6QJXDuxg1WyvCuBZTUQUDETVcIGSQwVUuvbC8mQ1CmPgosofOmN/Da7i+8KuHgU2ECthKvRaif/EmmPWLQNV56s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779920450; c=relaxed/simple;
	bh=6k1GzOtD1cvaKLIURlB3K/r2E6Aj2rpdFDCe2M5ojN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d59yeCBQfAk7EcUWWjeZXl1xdy4Zt1OJKp5jU62kgOBkAETgXNeVjNxjyLRhDwATqdMVzN8RzFdY/mbwb3MmrTao0+vyMihhnjbcloxq76uePbjWsUPTsnj+kvlyP45eHIUjTs7BlvTBc2V8Gz9/RO7utEEKbb3x8lQ2S2MM/xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=DfeZQjWd; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1779920441;
 bh=7gVamC9QIBkVIlBQqlmeulL6YTNqPoqDI2SywO3fCYI=;
 b=DfeZQjWdh8j3MfPnT7f8xop+HrftO8vB7FfHxCFAc6bNQgGfdAWNNBB47G/xkbk1qrmzYBrUt
 tp6aytbHyDALFPJkxfIyBUAmC4bHyybc3H2QcW7NFv6m6TO/vGMRHlysxMsgYpApif7Uo2xzfgb
 XW7vhJnpzT5F/5g+3AAoHSopgybovEikm+hai10svQ+1x4PExD1IQvqw+tb9GapUo9F6Jctg6Ol
 MTd+l3FnG5vQwstPg8HbeUe7dbZOmSz3nMWMs2VvPIXi5vhWcM5iahmKkfSGAEzt2yOW74c7gMZ
 DM8trpMlNxR0qv9iOmpMX/vtU13GTZL+J9XZs3cv9wfw==
X-Forward-Email-ID: 6a176e326f814b0e1265b04d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.8.15
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Young <sean@mess.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Jonas Karlman <jonas@kwiboo.se>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: cec: core: Add missing rc_free_device() call
Date: Wed, 27 May 2026 22:20:23 +0000
Message-ID: <20260527222024.1906303-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kwiboo.se,quarantine];
	R_DKIM_ALLOW(-0.20)[kwiboo.se:s=fe-e1b5cab7be];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-62934-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonas@kwiboo.se,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kwiboo.se:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5D0595EA9E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The commit dccc0c3ddf8f ("media: rc: fix race between unregister and
urb/irq callbacks") removed the implicit call to rc_free_device() from
rc_unregister_device(). However, the commit missed adding an explicit
call to rc_free_device() in cec_unregister_adapter().

Add an explicit call to rc_free_device() in cec_unregister_adapter() to
fix the following issue reported by kmemleak after dw-hdmi unbind:

unreferenced object 0xffff00010ac10000 (size 4096):
  comm "kworker/u16:1", pid 39, jiffies 4294897739
  hex dump (first 32 bytes):
    20 23 4b 0a 01 00 ff ff 08 00 c1 0a 01 00 ff ff   #K.............
    08 00 c1 0a 01 00 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace (crc e11baccc):
    kmemleak_alloc+0x38/0x44
    __kmalloc_cache_noprof+0x4a8/0x5e0
    rc_allocate_device+0x48/0x2a0
    cec_allocate_adapter+0x3ac/0x800
    dw_hdmi_cec_probe+0x264/0x634
    platform_probe+0xc0/0x188
    really_probe+0x4a4/0x8e0
    __driver_probe_device+0x2f8/0x440
    driver_probe_device+0x60/0x160
    __device_attach_driver+0x1a0/0x2a0
    bus_for_each_drv+0x100/0x1a0
    __device_attach+0x174/0x350
    device_initial_probe+0x90/0xb0
    bus_probe_device+0x4c/0x120
    device_add+0xdec/0x116c
    platform_device_add+0x354/0x598

Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq callbacks")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/media/cec/core/cec-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 0fcd3b5e60c8..465da6d25204 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -371,8 +371,8 @@ void cec_unregister_adapter(struct cec_adapter *adap)
 		return;
 
 #ifdef CONFIG_MEDIA_CEC_RC
-	/* Note: rc_unregister also calls rc_free */
 	rc_unregister_device(adap->rc);
+	rc_free_device(adap->rc);
 	adap->rc = NULL;
 #endif
 	debugfs_remove_recursive(adap->cec_dir);
-- 
2.54.0


