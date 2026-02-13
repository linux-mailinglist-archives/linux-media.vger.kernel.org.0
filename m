Return-Path: <linux-media+bounces-52739-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFY4Emsrj2kPKwEAu9opvQ
	(envelope-from <linux-media+bounces-52739-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:47:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDE5136766
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 981433080DDA
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 13:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3E0360754;
	Fri, 13 Feb 2026 13:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZpyFuGPZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808CA23BD1F
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 13:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770990390; cv=none; b=WfHfNiTZzE8HyDpJvkEBFwfy+V/8K7tKPDeSMEl2pONTccV5rhkHWzF8/LjZLDVAApj+XFnCaoowK/UY2nDJfixo6A/jF3uYij2Iq9S4xjKEAyo7VSvtz8F0KxtaBq0ACcEv1KzmMeVzIieIFlnBtoggEQw5cTtKYe1bHB46km8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770990390; c=relaxed/simple;
	bh=ga/898w/rBkOI5h+0CfCijMC5AU1ZBzwNHy+DuGX48U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=paayAusDWElK/q2vFcxPI6B+8L7nJCAbrMD3fWSRJmHHdn0j0v103ftnuu0KtaP8Y1TWsk1mgnen6WrJI1GX6dkD1r4GjipKCbQn+mbnUKyZ2SkhkmgEASxPffVjJxF0AMJdwyTo6czimFUbCC+h3ncJ+uPKS+G8GHw8FMQRlzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZpyFuGPZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4837584120eso3756195e9.1
        for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 05:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770990387; x=1771595187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3kT6gzFtavn2g25Q3ZqjtMQzhhOeb/nLljiXXqhXNo=;
        b=ZpyFuGPZFiLFkkDDiACSvGYan3Q0sf5XU3nmMElb8zgp59PF2oMkvRtSV2CuNf4weu
         aZWvBtMbYAdfskmqSJCFmFAknYqmAnjwzTciJ+CrEexzJiIyfbQfdvj6KueIcuy50PjQ
         awvihJl3c+d7y6A+cTieouSSJIJQTnUjLvlJYSHWSBvshbyXrcxPmt33FxzLI3s64Ozn
         8ay1oVMuvaC/9MOOI2+OFG81mKda7QbLz9sZ9ekMAymNTGNIXuR0LvbYzSW434VfcpMV
         92UW3qBfGIO9nj/daIQBdMXk36VATlnpwJGvt0enqjg8w24Gk1SpuhQcxZNgHBLLCQuC
         TZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770990387; x=1771595187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z3kT6gzFtavn2g25Q3ZqjtMQzhhOeb/nLljiXXqhXNo=;
        b=UDS/E492g518ITr0FVtGpbuTNn71Jo50GPS+eb4Dghe8a6EQ6dxi+aEmsg4aiMMm7R
         8M87yMEJ+aEWTRDKiP9+D2cuQWkq1PJ9uOMkrEQEcWplCLYBCklTZl3ImmyfZ05y+JP8
         +1B27xu0pKByKvuPO6tC0Maq303q/hFVb92VuXxcEtzVGVkg3kNkhT9VMPdakjxN0ylu
         ZptLwpVrqq3SRo9lceMs9afEy+IiLw3g+fOL1bMVb+hsYF12VjM4hAFhQzYtQ+eW9Zg8
         t54IFbaFiyw45Ks06s3Se3TmAAOyoPi/gvegZn+8q3uCGnqplWaiQc2UfvmmQFntBs43
         F21g==
X-Gm-Message-State: AOJu0Yz93Wl06oInmaak07P0O3vHRKMy83iG1Ep+O7qojGJwevTefgpe
	k6pQrhu9Bm/L8/gS54mDOVk3HtNWTbzHvvEP+OjSv6FsS1gzHvnT3pnNxw+c/Rrkn7k=
X-Gm-Gg: AZuq6aKijWh3DELGBPa6Al7Cu4w1G1epEW0Yoo3zxRI/JlIGFt7KelPt+17AVMTLaqW
	yI1TlMroTPHvx2dxWN7+7AvVVWFNqYEF2p0Yu8XbXwEuqzp4WIHp0HS3ej2rUULL3Nyt/PeETr5
	EDC142ML1BhWQ09ykI6ASYYv+6ZA93S8FUr0bp/WB1lEMuWp1i0I0rACUgqRlFkMbsbQiqaf0Ex
	f4EpsI59VXbtOnm0+YRBzK/ptyOFu7TCYfQFZJph9rW3CX6BwVZ/WXY35/jWcrxo7pY6nWQvhEx
	S2HycYER5EyhbKaD5tvf8Wzsx4cGFlgBpfCLrRdkveVugWQRs6hUb5NP1haN7x1fcY4bsIHpSjQ
	7jZdTcbVz1iv//5KacZdJEIQ/vBugtwZgP3bNqe5xHsZeW0T0CxEC0/Jn8qc0rjRimXihRoKUZZ
	cpmAna4fjxe4hswMmdJVpprTziO2lwpo2Ll+Zopssy
X-Received: by 2002:a05:600c:4746:b0:471:114e:5894 with SMTP id 5b1f17b1804b1-48373a565d0mr32339115e9.25.1770990386718;
        Fri, 13 Feb 2026 05:46:26 -0800 (PST)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a2998fsm17198625e9.17.2026.02.13.05.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 05:46:26 -0800 (PST)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>,
	syzbot+e993e01b15c8eefd9cd4@syzkaller.appspotmail.com
Subject: [PATCH 1/2] media: dvbdev: Prevent a dangling pointer in dvb_minors
Date: Fri, 13 Feb 2026 14:44:15 +0100
Message-ID: <20260213134551.1294954-2-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260213134551.1294954-1-petr.pavlu@suse.com>
References: <20260213134551.1294954-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52739-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,e993e01b15c8eefd9cd4];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,syzkaller.appspot.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9FDE5136766
X-Rspamd-Action: no action

Syzbot reports a slab-out-of-bounds write in try_module_get():

==================================================================
BUG: KASAN: slab-out-of-bounds in instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
BUG: KASAN: slab-out-of-bounds in atomic_inc_not_zero include/linux/atomic/atomic-instrumented.h:1536 [inline]
BUG: KASAN: slab-out-of-bounds in try_module_get+0x46/0xc0 kernel/module/main.c:913
Write of size 4 at addr ffff888142f67108 by task syz.3.2706/18556

CPU: 1 UID: 0 PID: 18556 Comm: syz.3.2706 Tainted: G             L      syzkaller #0 PREEMPT(full)-
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xba/0x230 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
 instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
 atomic_inc_not_zero include/linux/atomic/atomic-instrumented.h:1536 [inline]
 try_module_get+0x46/0xc0 kernel/module/main.c:913
 dvb_device_open+0xef/0x350 drivers/media/dvb-core/dvbdev.c:103
 chrdev_open+0x4cd/0x5e0 fs/char_dev.c:414
 do_dentry_open+0x7ce/0x1420 fs/open.c:962
 vfs_open+0x3b/0x340 fs/open.c:1094
 do_open fs/namei.c:4637 [inline]
 path_openat+0x3486/0x3e20 fs/namei.c:4796
 do_filp_open+0x22d/0x490 fs/namei.c:4823
 do_sys_openat2+0x12f/0x220 fs/open.c:1430
 do_sys_open fs/open.c:1436 [inline]
 __do_sys_openat fs/open.c:1452 [inline]
 __se_sys_openat fs/open.c:1447 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1447
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xe2/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7feefad5b78e
Code: 08 0f 85 a5 a8 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 80 00 00 00 00 48 83 ec 08
RSP: 002b:00007feefbc79b28 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007feefbc7a6c0 RCX: 00007feefad5b78e
RDX: 0000000000000002 RSI: 00007feefbc79c00 RDI: ffffffffffffff9c
RBP: 00007feefbc79c00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: cccccccccccccccd
R13: 00007feefb016128 R14: 00007feefb016090 R15: 00007ffc341cef58
 </TASK>
==================================================================

The dvb_device_open() function performs 'dvbdev = dvb_minors[minor]' and
then calls fops_get(dvbdev->fops). The code in fops_get() invokes
try_module_get(fops->owner) but this operation fails because the module is
apparently gone.

The issue seems to stem from dvb_register_device() which assigns
dvb_minors[minor] and then continues with the device creation. However, if
a subsequent step fails, the value in dvb_minors[minor] is not cleared,
leaving a dangling dvbdev pointer in the array.

Fix the issue by extending the duration for which minor_rwsem is held in
dvb_register_device() and assign dvb_minors[minor] only after the device
creation is fully completed. This is similar to the approach taken in
usb_register_dev(), where usb_minors and its minor_rwsem are handled.

Reported-by: syzbot+e993e01b15c8eefd9cd4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=71d5d861d9adc6905054
Fixes: 5dd3f3071070 ("V4L/DVB (9361): Dynamic DVB minor allocation")
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 drivers/media/dvb-core/dvbdev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 8b980d371a45..c067bbeb9461 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -548,8 +548,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	}
 
 	dvbdev->minor = minor;
-	dvb_minors[minor] = dvb_device_get(dvbdev);
-	up_write(&minor_rwsem);
+
 	ret = dvb_register_media_device(dvbdev, type, minor, demux_sink_pads);
 	if (ret) {
 		pr_err("%s: dvb_register_media_device failed to create the mediagraph\n",
@@ -563,6 +562,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		list_del(&dvbdev->list_head);
 		kfree(dvbdev);
 		*pdvbdev = NULL;
+		up_write(&minor_rwsem);
 		mutex_unlock(&dvbdev_register_lock);
 		return ret;
 	}
@@ -582,10 +582,14 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		list_del(&dvbdev->list_head);
 		kfree(dvbdev);
 		*pdvbdev = NULL;
+		up_write(&minor_rwsem);
 		mutex_unlock(&dvbdev_register_lock);
 		return PTR_ERR(clsdev);
 	}
 
+	dvb_minors[minor] = dvb_device_get(dvbdev);
+	up_write(&minor_rwsem);
+
 	dprintk("DVB: register adapter%d/%s%d @ minor: %i (0x%02x)\n",
 		adap->num, dnames[type], id, minor, minor);
 
-- 
2.52.0


