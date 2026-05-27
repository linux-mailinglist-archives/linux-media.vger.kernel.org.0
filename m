Return-Path: <linux-media+bounces-62912-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILTcF0QSF2pf3QcAu9opvQ
	(envelope-from <linux-media+bounces-62912-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 17:48:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEBB5E7284
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 17:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2162C302428C
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 15:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FBF3D0BE5;
	Wed, 27 May 2026 15:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Kyqb76xq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF7B37BE9A;
	Wed, 27 May 2026 15:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896455; cv=none; b=iKdGZ3yFhup+cKlrHLcNrhBnVZxfCMW1ELfqFQs/kXeVjNHYUVL4/Sqh2ovxBX7fGOal7z3LEASusoN2xuMQglYdIQIvktx2WyTThHVuIyBFoLIkugHd7DyE8pO5xwjFUU2s3IrD2KpnFRNdwMLjaCbNZHQFsroqf3W8r0TlWco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896455; c=relaxed/simple;
	bh=Oq456jBypb1E3Uv4FoqBZO1xETzfNULCvhOaL55fWDI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kqOKW/znGKE2dBjljxoaEV3RKH05Q+zvNSzyCyr+GHcpqR97hiTqH/CZiRs/JjkZrNRNSCUOSKmeWUi2/2LicfBiTfq0cmJ03RyE4/P60gbYH0zKfqWCLvMdhf2kiVLJfXZKReM0IBRTR9Y0cRgnXp83V0kW/ysNWxXC8rSeUE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Kyqb76xq; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1779896411;
	bh=b6f//cpmg0rU6n4qLdQH4XSUoA5aJ7wUqZj0ORH/CVw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Kyqb76xq0kR++nxCtuRQf6zo/MtESugUshOQN1dgN85WUtLcOBg68gfWS6xETzUtS
	 n5qM+yEWaFtDJ1yrab4AGYbiAEm2e4Fv4gDvjROpw8XAU5f0qwk3bvCENmRU76PFVq
	 QkWUfEYuVxW9hDtWVUIQuIj7/BVO0shkXYZWqnZY=
X-QQ-mid: esmtpsz20t1779896405t51db01f1
X-QQ-Originating-IP: MSGMppTP7GWZpAIG2Y1UuRSYFOW++7dwXJIKEbxEsdA=
Received: from localhost.localdomain ( [117.129.10.21])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 May 2026 23:40:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9323689886002992201
EX-QQ-RecipientCnt: 12
From: meihaipeng <meihaipeng@uniontech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Jens Axboe <axboe@kernel.dk>,
	Ingo Molnar <mingo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Andreas Oberritter <obi@linuxtv.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	meihaipeng <meihaipeng@uniontech.com>,
	syzbot+acc3b75c010446ad403f@syzkaller.appspotmail.com
Subject: [PATCH] media: dvb-core: roll back partial PES feed starts
Date: Wed, 27 May 2026 23:39:36 +0800
Message-Id: <20260527153936.6988-1-meihaipeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NY9onNi0bKzibz/mFUPviP8wh/iOJPAvcmQQLMez/RSUAMXcPUNq96oU
	BmlxIWhKEgOvGkVNlhEAsM6LHq+seQV+VDUfsnzsY5XfBRQne0CpmmO2kHgBZZdw43cYgid
	4vZF7FRKer714deEB7RmM3r3ySiMf+ca0YyP1k2tVch+Ild4i0aZ12U0MewdYBJ5cTiu+PQ
	KlIP1oqtspC/oNS/6C00cbaynE8lTccGfC5lFAvIQyhA/3pv+pkMyRusjDcH6X8/r6hU+Ui
	ThyrOqKCHAIsEZvCUVuDApRqGuXreV1fAU4VNMO+uDJZP1La5LK0gcqnvFKNr3+AI4sB8aA
	bD8UKAxqDcpoYcb8M+FIOSudNw9dG0sZIuUaQGWPREw/3tHMjIedVZolBV/AQASkRba+mai
	GGgPrtts2Xym8oIB+ZkFeKi72Nm+tps5RELlWTviphzrbqChwFLBSTxyBnqZGy+IWjdbRLY
	OEQFByFWrTS9ve4AidAmppJYdc6niKgYg9Y92cAVjxGit+9Mt66Hdyb7xh6FzhHm8xfCOSe
	X1ox8Y2SszYYuIo3xiVbZOrKg9+WJh/lKJij+AIOwLSJFhYtHoo0ez8C3LOMKODLC/dVisp
	Nb61vWfYZBdPhMSMgSaukUP4H6S9qbHfSsTKtCldKf0Ff5q2nRc94rEpW4J6Ux1m4wweU7I
	qegDqEkYt3GvHbBwb7R1MN63PfFDUOn3lalfdX87SMtyVXjX5Ea5gmBa2yat3OPD1gqLZKH
	awyELdp0FE+30k0BNEB6afT83qHWU7wnPgkM3mnJNFuBgr23VoOZd0Tgl4WKE/onHS2OMKf
	sQqJQH/1DjrV3Jbpn/IqXncVmEl6X0OmaTx0lJm2r0G8QPRJTZPVy4wBF8rrINjsuUmFQVm
	POH2317q3B8C2uq/+FjCfE5OffoqYJO0dTB4jWsdpE9AVrghaCnuNLplxIaW3flTEhO3ChO
	TK5iyRBWJZxcWtCZ2JhuPZQvYhdpoEGso53x7yfEhFFERmxnNATjzbEAGJ05TUCCwq5mTzD
	X3fwAgnH7ZKj/Oatff6rcLxeCDuT/gdKhjy0IH6K8WfNeXIDGWhk0qQvWSPwJDV3UOKpA7t
	xjcUTvZqZEQ2vUiNRkQ8PPD2FfTYi9uXk23YxSC1nXzSbfPfIPShnE2ouzIqEzQqxBy7YZc
	hh7l
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-62912-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[meihaipeng@uniontech.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,acc3b75c010446ad403f];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,appspotmail.com:email,uniontech.com:email,uniontech.com:mid,uniontech.com:dkim,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: CAEBB5E7284
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

syzbot reported a kmemleak in vidtv PSI descriptor allocation paths, but
the leak is caused by dmxdev leaving partially started PES feeds running
after a later PID start fails.

dvb_dmxdev_filter_start() keeps the filter in DMXDEV_STATE_SET until all
PIDs have been started successfully. That is true both for the initial
multi-PID start after several DMX_ADD_PID calls and for a later DMX_START
restart of an already running filter. If one PID has already started and
a later one fails, the error path calls dvb_dmxdev_filter_stop(), but
that helper returns immediately while the filter is still in
DMXDEV_STATE_SET. The already started feeds are then left alive, and
release/close paths can repeat the same no-op stop before dropping the
PID list.

Fix this by clearing feed->ts after start failures, rolling back a PID
that failed an immediate DMX_ADD_PID start, and explicitly stopping any
PES feeds that were started before dvb_dmxdev_filter_start() aborts,
regardless of whether it is the first multi-PID start or a restart.

Fixes: 1cb662a314499 ("V4L/DVB (12275): Add two new ioctls: DMX_ADD_PID and DMX_REMOVE_PID")
Reported-by: syzbot+acc3b75c010446ad403f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=acc3b75c010446ad403f
Signed-off-by: meihaipeng <meihaipeng@uniontech.com>

---
 drivers/media/dvb-core/dmxdev.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 3c8bc75e4d6c..b5209e1611ad 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -612,6 +612,21 @@ static inline int dvb_dmxdev_filter_reset(struct dmxdev_filter *dmxdevfilter)
 	return 0;
 }
 
+static void dvb_dmxdev_cleanup_pes(struct dmxdev_filter *dmxdevfilter)
+{
+	struct dmxdev_feed *feed;
+	struct dmx_demux *demux = dmxdevfilter->dev->demux;
+
+	list_for_each_entry(feed, &dmxdevfilter->feed.ts, next) {
+		if (!feed->ts)
+			continue;
+
+		feed->ts->stop_filtering(feed->ts);
+		demux->release_ts_feed(demux, feed->ts);
+		feed->ts = NULL;
+	}
+}
+
 static int dvb_dmxdev_start_feed(struct dmxdev *dmxdev,
 				 struct dmxdev_filter *filter,
 				 struct dmxdev_feed *feed)
@@ -652,12 +667,14 @@ static int dvb_dmxdev_start_feed(struct dmxdev *dmxdev,
 	ret = tsfeed->set(tsfeed, feed->pid, ts_type, ts_pes, timeout);
 	if (ret < 0) {
 		dmxdev->demux->release_ts_feed(dmxdev->demux, tsfeed);
+		feed->ts = NULL;
 		return ret;
 	}
 
 	ret = tsfeed->start_filtering(tsfeed);
 	if (ret < 0) {
 		dmxdev->demux->release_ts_feed(dmxdev->demux, tsfeed);
+		feed->ts = NULL;
 		return ret;
 	}
 
@@ -768,7 +785,8 @@ static int dvb_dmxdev_filter_start(struct dmxdev_filter *filter)
 		list_for_each_entry(feed, &filter->feed.ts, next) {
 			ret = dvb_dmxdev_start_feed(dmxdev, filter, feed);
 			if (ret < 0) {
-				dvb_dmxdev_filter_stop(filter);
+				dvb_dmxdev_cleanup_pes(filter);
+				dvb_ringbuffer_flush(&filter->buffer);
 				return ret;
 			}
 		}
@@ -884,6 +902,7 @@ static int dvb_dmxdev_add_pid(struct dmxdev *dmxdev,
 			      struct dmxdev_filter *filter, u16 pid)
 {
 	struct dmxdev_feed *feed;
+	int ret;
 
 	if ((filter->type != DMXDEV_TYPE_PES) ||
 	    (filter->state < DMXDEV_STATE_SET))
@@ -901,8 +920,14 @@ static int dvb_dmxdev_add_pid(struct dmxdev *dmxdev,
 	feed->pid = pid;
 	list_add(&feed->next, &filter->feed.ts);
 
-	if (filter->state >= DMXDEV_STATE_GO)
-		return dvb_dmxdev_start_feed(dmxdev, filter, feed);
+	if (filter->state >= DMXDEV_STATE_GO) {
+		ret = dvb_dmxdev_start_feed(dmxdev, filter, feed);
+		if (ret < 0) {
+			list_del(&feed->next);
+			kfree(feed);
+		}
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.20.1


