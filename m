Return-Path: <linux-media+bounces-52347-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ok6HPlYiGlnogQAu9opvQ
	(envelope-from <linux-media+bounces-52347-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Feb 2026 10:35:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ADE1083CB
	for <lists+linux-media@lfdr.de>; Sun, 08 Feb 2026 10:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2B25300C831
	for <lists+linux-media@lfdr.de>; Sun,  8 Feb 2026 09:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395CF3451B2;
	Sun,  8 Feb 2026 09:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="iupM7abU"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F992EAD10;
	Sun,  8 Feb 2026 09:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770543348; cv=none; b=QIPMrL87l6ssZHG2O6boqtnmaGgcvZw7S5Wc5XID7ygLomj//mAY+ymmpAAGcQLO8aHMzXhIswli4LsZBhnulKEQakz9n6SOfgUDCuekmlo12KO2BNrOvXb9DZVx6temREi3r3XQur1a91IwHbebklR0McsJBZ1ysbgzSGEQeDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770543348; c=relaxed/simple;
	bh=ZsS9ZVGQFxvN633ajWE+iB+TyUWYM1ti791hnrXzh/8=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=lJM4rxKOkuhjaWrPGkbWFt0yFHL1/tnFtujPmyEGHF76L7VWFnVqPmoG/SJ1+Zcj3Rmyi79eaEkumECFS/PrMoaIk7/wAQte7FzkjiLKJ/c9Qia/7Q1X0YjH4w2U1Fel5swA7fTm9sswFqs9EeW0XvwwAuDPJ50G7Sf7/d/1oKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=iupM7abU; arc=none smtp.client-ip=203.205.221.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1770543339; bh=xYrOQK+X+M/neFFbil4bRRbCzj0uoq0gUH+L7EfN6NA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iupM7abUvmcbsDuL5Mspgi5xvEfwsOng4J9Mid9Df+Jjg2twiBD/02XetNy2926c6
	 Q65++3Dah9JtwD+m6sZ1H8422ZAteFpFnDTM9DKJRZc//8aXTJXR+mLVDtIRI65KVH
	 eT2fs89rMW23ErRgrr2D/HkkRVeW86jSVUxbs2A0=
Received: from lxu-ped-host.. ([114.244.57.237])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 8E49400F; Sun, 08 Feb 2026 17:35:36 +0800
X-QQ-mid: xmsmtpt1770543336toa8x107x
Message-ID: <tencent_1D65CFF08D86A5C00DE712515D85DDBE1907@qq.com>
X-QQ-XMAILINFO: NAuAIaytDrXpoduKooCzd2+NYO4QZ3aXMARZd5CC5oqtrWy36zkwwofjTDbsO1
	 I9iDEylcX10k/SKGNMGgCiKA1AisxMwEyMCT8GWDuZNx3V2hqXXc6hGry1yG6Gcd/tpgHtXaCb1q
	 6VqB9y8GcwZ4HnX557dd2rM7J8dyZblBKpYaF32k6q1KERi7cW0kWZGa+NYwT4eh5LBolsb1HWwf
	 cPIoe1oOWmGU7MbV/FmmYjaAXJfajt8cS03RaoQvOOUp3uWn6+0d8qKoyaP5mR6LcAP0QbFdVJWW
	 6tztGw/P0/U0aFyXsp+h7YTuTSGvpig2syza8FS9oDukVysRmRc9e+YoCOQIwa4Tvo1CYqVbby9q
	 YdiVcqNEycTQIX3wLDeD5n5ojvdhhRJRGx18KHnWZXjhu5ASUiz8sn86T/R3uy0aWTpgxEQEOJMp
	 iGumtYG4AnRvFSmoAkYA2qkOkSTljxambrsm77cTJg78xBglk7Imby6X2Uz5ZC+Zvbt69CD9tV63
	 c+wc8joaSKcwW2za/eImkhq5SsmGlza4w0pArTCFGpQlr4sH7/Ab3Ngz6O8IekXJGhMWW0gJOqxn
	 qk5eCHYFc5d63eEvi1YwUObbF0Wll8CdFRhVqxb3mWBSvKgpZLR7YHQ6m4jvEkzjyOcoRddkgNch
	 TgNG066NLuw4DfgoKSkyW+DRXjGOnMFcgSfJwwK2TBY/pK7CqpNv08GcJifMW5u9X/Lgc5PC85DO
	 zpwshY2WqUEqRwBHR+LlCQvXydCi7HNEwZwTLTn+1icdvWAYXoWHO/A3/qvrigy7CUHxY7HoNVru
	 7A0zCwiveWbLsRLba+rH8nEg26ALkS6QtCdWcZsxk3dFTBNxwvLecMOD1ARVwjn8zCLeyhnUPo1X
	 0cTaJTUNxnDL24JEz2+o7sZZd7lsU+hjAs1rte+FGNBnnQpuD+Fy0N37uavrG255oCK0a2xUP+fP
	 /h2mWwN4Ssv4gkB2CQn+EKh3nijyEsmM39vN05rXam9b0dpajui8BeC3ZxAa4eVHqiKIDfqcsTne
	 4ivGRQcvoMK9t+Yga4
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+01d4620886bee3db0e74@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] media: dvb-core: pesfilter shouldn't be set when feed is uninitialized
Date: Sun,  8 Feb 2026 17:35:36 +0800
X-OQ-MSGID: <20260208093535.39996-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6987e3ab.050a0220.3b3015.0052.GAE@google.com>
References: <6987e3ab.050a0220.3b3015.0052.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[qq.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52347-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eadavis@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-media,01d4620886bee3db0e74];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:email,qq.com:dkim,qq.com:mid,syzkaller.appspot.com:url,appspotmail.com:email]
X-Rspamd-Queue-Id: 71ADE1083CB
X-Rspamd-Action: no action

syzbot reported a uninit-value bug in [1].

When dmx_ts_feed_set() fails, the feed is not properly initialized. This
includes the feed not being added to the demux's feed_list and ts_type,
pes_type, etc., not being set. Under these circumstances, it is illogical
to determine whether to set the pesfilter in dvbdmx_release_ts_feed()
based on the uninitialized members ts_type and pes_type of the feed.

Since dvb_demux_feed_del() checks whether the feed has been successfully
added to the demux's feed_list, it can be confirmed that the feed has
been correctly initialized when it is added to the demux's feed_list.
A return value is added to dvb_demux_feed_del().
When the feed is not added to the feed_list, it is considered that the
feed has not yet been initialized, and when releasing the feed, it will
no longer determine whether to update the pesfilter based on its members.

[1]
BUG: KMSAN: uninit-value in dvbdmx_release_ts_feed+0x198/0x290 drivers/media/dvb-core/dvb_demux.c:858
 dvbdmx_release_ts_feed+0x198/0x290 drivers/media/dvb-core/dvb_demux.c:858
 dvb_dmxdev_start_feed drivers/media/dvb-core/dmxdev.c:-1 [inline]
 dvb_dmxdev_filter_start+0x1187/0x1af0 drivers/media/dvb-core/dmxdev.c:766

Uninit was created at:
 dvb_dmx_init+0x121/0x930 drivers/media/dvb-core/dvb_demux.c:1253
 vidtv_bridge_dmx_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:334 [inline]

Reported-by: syzbot+01d4620886bee3db0e74@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=01d4620886bee3db0e74
Tested-by: syzbot+01d4620886bee3db0e74@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/media/dvb-core/dvb_demux.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_demux.c b/drivers/media/dvb-core/dvb_demux.c
index 290fc7961647..669ce8b95ad5 100644
--- a/drivers/media/dvb-core/dvb_demux.c
+++ b/drivers/media/dvb-core/dvb_demux.c
@@ -670,18 +670,22 @@ static void dvb_demux_feed_add(struct dvb_demux_feed *feed)
 	spin_unlock_irq(&feed->demux->lock);
 }
 
-static void dvb_demux_feed_del(struct dvb_demux_feed *feed)
+static int dvb_demux_feed_del(struct dvb_demux_feed *feed)
 {
+	int ret;
 	spin_lock_irq(&feed->demux->lock);
 	if (!(dvb_demux_feed_find(feed))) {
 		pr_err("%s: feed not in list (type=%x state=%x pid=%x)\n",
 		       __func__, feed->type, feed->state, feed->pid);
+		ret = -EINVAL;
 		goto out;
 	}
 
 	list_del(&feed->list_head);
+	ret = 0;
 out:
 	spin_unlock_irq(&feed->demux->lock);
+	return ret;
 }
 
 static int dmx_ts_feed_set(struct dmx_ts_feed *ts_feed, u16 pid, int ts_type,
@@ -840,6 +844,7 @@ static int dvbdmx_release_ts_feed(struct dmx_demux *dmx,
 {
 	struct dvb_demux *demux = (struct dvb_demux *)dmx;
 	struct dvb_demux_feed *feed = (struct dvb_demux_feed *)ts_feed;
+	int ret;
 
 	mutex_lock(&demux->mutex);
 
@@ -851,11 +856,12 @@ static int dvbdmx_release_ts_feed(struct dmx_demux *dmx,
 	feed->state = DMX_STATE_FREE;
 	feed->filter->state = DMX_STATE_FREE;
 
-	dvb_demux_feed_del(feed);
+	ret = dvb_demux_feed_del(feed);
 
 	feed->pid = 0xffff;
 
-	if (feed->ts_type & TS_DECODER && feed->pes_type < DMX_PES_OTHER)
+	if (!ret && feed->ts_type & TS_DECODER &&
+	    feed->pes_type < DMX_PES_OTHER)
 		demux->pesfilter[feed->pes_type] = NULL;
 
 	mutex_unlock(&demux->mutex);
-- 
2.43.0


