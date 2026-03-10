Return-Path: <linux-media+bounces-55219-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBmUE0xNsGnFhgIAu9opvQ
	(envelope-from <linux-media+bounces-55219-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 17:56:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEF6255255
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 17:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4D5131A7BE0
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADEA3CFF70;
	Tue, 10 Mar 2026 16:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="enmAyuJx"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic303-21.consmr.mail.ne1.yahoo.com (sonic303-21.consmr.mail.ne1.yahoo.com [66.163.188.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71E6374193
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 16:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.188.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773161702; cv=none; b=Amp+pRYvAU7CrAiCU7XsQx9W4eGOhiMWHKBw1PYhILs8YW106foxW3Zc1161/VJZjRSAs0nfxznVy60qnRJUANVntD3mUgCufoCXB5axu9pyHHg6VUx0lEHKfAGd+WcOO2hJVsZzBqYUZ0K5m4MFYkAdYNks2h3YEdCltAguZXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773161702; c=relaxed/simple;
	bh=9P8NMCKtoNI2F5hiVkCwUSDHR3BfpsngyuzyAyR+F4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=PIcoQaiTHatdBnrDhijYDfmr3Qvg45xc5Twwch7hW3O6dhnuysGGlMT4rkmmJHhfxE69S4bbB3MsgqFCd3J0SbYfZePizzSWglf5FDCGVIQLCOhfXOq/gI0FXf2+vE+NF70vCHW3IJRmJwtfpEI2KnoKesplYIXqdl8SAC3nknE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=enmAyuJx; arc=none smtp.client-ip=66.163.188.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773161694; bh=/6JpoN9Cu82uGBMGC97VXmXgq/oyaVfI/6fUi0qOZQE=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=enmAyuJx8Hl5uCoG8f1KOXGGV7+xgCwHdbmcwyaufP3JIBtf+dNl353epKNY1i222WwaqNiqPIifgX2HrFh/Sdp3IOZyjRrJj7oICwF86e3i3uzPt0LGlYi7ykQSuZ5f2k3GQpHApvaBF8+jIsrJ/5rjMm89AAP6MZMZH5FpyzuukgisfMs/VO7uVAaQiC8sDG+ylOb6mT8Uo+otN4CgEV/9BlCGxgSJsreUW9szTqxtk5J/QZxWA8Yo9SgLcaERviAcnhgjHPwyQB9vrXUAXfIbAQqiokcdk5ZjDjKb1cbYWcP/RZT6gele3LuyWedjIdLcCyTxUZKRUssjvXDq2g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773161694; bh=Xe+4auPgn87o2MoKNT4zqMBISM49rT5vRFFgwrV0mQA=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=aZOeA/3Sl0TRtSlBEAb5C8l0TuhdY6dFyzx24F0uBKEGpqkeYaOl7G03VHbEVoFrflenR1EIpT+Okua+3/cvKUV2slFzV49SGurN0Aor/IjVaFsgZ/63D7rSOKmrm0rtFC9NS2j+RYgghiYqFeuUHEZf3TfA5Yti3sITGD1+EFwNOwiyNX6OiFR4gYvvAJ9vpIGwxh4yqv1rXbUv6klWHfm3G+BnfWprm1hCQ7g4X6+6uyW1nrgskqWzJO2OUiKrA9pSSxBhyiLihKZ7BLbMJbBTFjwb/sQfDjeMl2TtAOmA1lFsBusxIUAjGmuUnDOVaUw09tLOj5dR8NG+I1Ec2Q==
X-YMail-OSG: r2bUql8VM1ns62WQMl9FVe_YO9VUJZhsOh.JKHQ3va0mrfgpYQJGguKgKF37Rwk
 ETVFkUKVQlKDYa95r8FeIQLJjyFiqOzQe7FgEZpWX9C9Sja.21VNU5HSLeCArvWN8iw.sicox18t
 bLqh3PO_PwMa297u3nM4nbld5P6t1TljdPShNr5vavprNNC1uqtjZaP6PTfLROJZMX5cNy6h4_tN
 OBWE4LTiirsKHVELyxJeZg2j17JWt.99cWIU55I4E9m1ty1Q4czhud7r2SlobZ8.WbhZy_Y0KCpA
 278aUqYW8HiYaqMqzd3sHyOFnePPu9eZVVg8GoN62LQuhqIqjDLSDx6IeMrtp5Q9ddeG7jCr5LMq
 i_Ub9reIhDfi2evxbINbXTQckh_D_yJex7vrdO3_MCE4LBislv9w1a9UuQiVK0D3ML6.K3WOSfBj
 Oif6qBmT4RgZCFAltjeHwwloRj6j2zsqpP6rRi.6PFZs1kwFskKBXCB_RPfsKnPj0PogfJVAyNsj
 GeNZAnUpkiWNhI7_uxnDsTneg71zpe.0YYSeZkYiu.JwvLzSnn2oybW.hv9j.QOPyslPrx8sHeUu
 ye_nxygjcXLkSMzUvgkeKVx4bnWLRrkqnx3zbTJwqeG92JNVq8rpJaTLh2Tv27QNcjHBVcepYlJ9
 70B.kAMJwDDjvJrd_lT1x9dXe7TCln6LK43m5bVXTR0ROtQNV0thE9yYSdqepyr2pEQck.z7abd_
 vGU_3crJOHTapX82i8VtA7bgVnrvssbRwrxyWywDTYyihDarfxtZWlb0YleEL6Lhn97has72OWxB
 pqInivB80TATAJOVcwW_JRuXTl3SkACs1wTZ5Ihgy2YUN_hCytnzLnouELS9YaMZ8aagidzPmK3e
 idZOQX0HudTNjkTGECBzcjqp.hv_1Fd7433JGE1ejtaZGTfHOTfxd9n1Drca6aInjrJwJX3aCDCM
 7P5codWrambcMqXfEPTz6DkmnG.Y2s4enB54Y_0XnPPCsy8DEr.ODkK7OpZBswhx0PSpvZnyvDWF
 aSDdKnN87weGeiiO1_rpyN98LOP2Qbno98GXZqnEFIDoeuhTMvmlmr00XbBMg6aFUEivQO6exxx1
 u1FbQUJa8XsoPQF9MjCj2AjmhFk6Jlh1Wb7An0Hf7ViX9CQZfGq_xFXbfHHbx1nF9NyslW1a.A.e
 m6NLRrZ4585tiYKGOtIOWhLOJanCX2ZL6ItXwXfJj8p.IgVOgqKIhFix61rAfRyLZfmQM3xzsIgs
 AXy6NtvIeb8f_shmWc.uY_oYsKJH.guc55nUpnC2xSh21SaUIYbcV5Wq5GmQBfGqrIPmlbrdsgOo
 q_nyTZmPGYUayfGjUXjYJG0Aficr_9KZJPfGBvcxFQCMnT33pJxMd10jFIkCgepl.YAxCKHBkT3U
 JE5NBpomARo6QxTWvVwAtEfELkaypB1Z_c0eA0TQrvZJv2xlhGrYqBcdjGtQGb_udQ9z8V.cjqiy
 QZXP86.VzfG6qkFMnThcISzKAjPbQOrKPWgyQm10UiAL4ZodzRLh5rqL70VHgWgHfUGbjruBPM7D
 1ayoH5CWIKwpBJcn8mUiCuzUpPc6XcJGpuYW0BxT39KbXDJMWUsnHK5bXApWeBK.BmVLj60Ak8wn
 YCjwHKlyXh2HzwG6DEN1t2vxymCcB1ewcAf.ZkVOtTIqQDGtUZE1GUFhv_cWmOTAmGz4pJcEXFB9
 6LcW3lsH8xzNb3G92nOP6xJBn1sE6luVYkp66Eit92Ywe0SiCUhSQHb7k5H2e4EO4VM1f3dSmhiL
 ugcHeDKmstuPmt3CDOxkVwTQ2OYjryagQKBLkqnaFk2RhqkfXxYJOm2UTFH.OXXk90Q.TlpivX9v
 3IGvAyvJv8iE87clhfuf_fspZzMLYCYJIumIJ09_.FX4z3.lsXdKQZvljIxk5mWEEDAFXzSu1eue
 7YdE4KKWKTrsyAQnX2AcFE6DLGlbIFW9M1cmKaxLGcydYRMl9Q6nXtgiFeepTliLtlCsy4F22_En
 LEeL5UWIqUzUF3Q87ObyXDKMTZlavQMP83U7DmrG3tR2w0q4dQ1bfa4vWrMOYbAhk.EfoBddenEE
 kzqxII86e.FX2cMK.FNh_noSKi4A_mPOkut4xdGhPY93xYCejunFMOo56Ujj56MQmMKYaBt2SyDu
 7tlWVczz3YxGYMIZW0YLw7w6j7ASVe0Bwde8_J23fHU3EKw1MOFaiqWNxCr889ecKPR19n6uSo7u
 z3qATw_XXVXTPevCPX5WJDvltT9hiBDSssq4M6BV7QDgdOo9C55XrQK43E5KFNw4nkBNUhQo4j0W
 F40gI4alWVSytT54a2KucQBo-
X-Sonic-MF: <abhishek_sts8@yahoo.com>
X-Sonic-ID: d49c1791-66c4-4c54-92b5-20a428de0e6d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ne1.yahoo.com with HTTP; Tue, 10 Mar 2026 16:54:54 +0000
Received: by hermes--production-sg3-6959968fbd-g29qv (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 26379b06fff81670246abaf6a31f69d7;
          Tue, 10 Mar 2026 16:44:43 +0000 (UTC)
From: Abhishek Kumar <abhishek_sts8@yahoo.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+c025d34b8eaa54c571b8@syzkaller.appspotmail.com,
	Abhishek Kumar <abhishek_sts8@yahoo.com>
Subject: [PATCH] media: em28xx: fix use-after-free in em28xx_v4l2_open()
Date: Tue, 10 Mar 2026 22:14:37 +0530
Message-ID: <20260310164437.865472-1-abhishek_sts8@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260310164437.865472-1-abhishek_sts8.ref@yahoo.com>
X-Rspamd-Queue-Id: 9EEF6255255
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[yahoo.com,reject];
	R_DKIM_ALLOW(-0.20)[yahoo.com:s=s2048];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,syzkaller.appspotmail.com,yahoo.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-55219-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhishek_sts8@yahoo.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[yahoo.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,c025d34b8eaa54c571b8];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,appspotmail.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

em28xx_v4l2_open() reads dev->v4l2 without holding dev->lock,
creating a race with em28xx_v4l2_init()'s error path and
em28xx_v4l2_fini(), both of which free the em28xx_v4l2 struct
and set dev->v4l2 to NULL under dev->lock.

This race leads to two issues:
 - use-after-free in v4l2_fh_init() when accessing vdev->ctrl_handler,
   since the video_device is embedded in the freed em28xx_v4l2 struct.
 - NULL pointer dereference in em28xx_resolution_set() when accessing
   v4l2->norm, since dev->v4l2 has been set to NULL.

Fix this by moving the mutex_lock() before the dev->v4l2 read and
adding a NULL check for dev->v4l2 under the lock.

Reported-by: syzbot+c025d34b8eaa54c571b8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
Fixes: 8139a4d583ab ("[media] em28xx: move v4l2 user counting fields from struct em28xx to struct v4l2")
Cc: stable@vger.kernel.org
Signed-off-by: Abhishek Kumar <abhishek_sts8@yahoo.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index b0c184f237a7..5f13f63fbdee 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2126,7 +2126,7 @@ static int em28xx_v4l2_open(struct file *filp)
 {
 	struct video_device *vdev = video_devdata(filp);
 	struct em28xx *dev = video_drvdata(filp);
-	struct em28xx_v4l2 *v4l2 = dev->v4l2;
+	struct em28xx_v4l2 *v4l2;
 	enum v4l2_buf_type fh_type = 0;
 	int ret;
 
@@ -2143,13 +2143,19 @@ static int em28xx_v4l2_open(struct file *filp)
 		return -EINVAL;
 	}
 
+	if (mutex_lock_interruptible(&dev->lock))
+		return -ERESTARTSYS;
+
+	v4l2 = dev->v4l2;
+	if (!v4l2) {
+		mutex_unlock(&dev->lock);
+		return -ENODEV;
+	}
+
 	em28xx_videodbg("open dev=%s type=%s users=%d\n",
 			video_device_node_name(vdev), v4l2_type_names[fh_type],
 			v4l2->users);
 
-	if (mutex_lock_interruptible(&dev->lock))
-		return -ERESTARTSYS;
-
 	ret = v4l2_fh_open(filp);
 	if (ret) {
 		dev_err(&dev->intf->dev,
-- 
2.43.0


