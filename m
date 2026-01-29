Return-Path: <linux-media+bounces-51782-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFUXFslJe2kdDQIAu9opvQ
	(envelope-from <linux-media+bounces-51782-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 12:51:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDC6AFCFA
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 12:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0CCE23003BCB
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 11:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236283876BA;
	Thu, 29 Jan 2026 11:51:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE3137F8BA
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 11:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769687490; cv=none; b=N1lC6NGtQyeztIo9jRvcphvSHQ65Fnj138S//NevoiZAMnbN+Jna3F3nbCTQcM5ba4AnKGG/RodM9/A9NbvR9Tc7Nrk7eQUHRxQtfmJrgmFXnIrMejzrGiV2YqwKXIxxjsenbrQ1BsJCByFGbbLNYafM7qBe5FfHi4UCVPEGiE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769687490; c=relaxed/simple;
	bh=g6yQLauMufwkVIuvaSmIDa+pfcxdfJra++V/cCHFZYQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kaXf5E3YeTKOjSDnpQqAcYFp3lVIGH8jt3WIcT7itmsULZyQYkbn8vUB8BaPJaLxjgAab7qhdiQnm7kiRlrBstq4szvhvpTBgk3gldL0BOur9JC7qWRRnaACDjNvIgxM3HBKdhmhKNs/+CkMqQCbuAeLlx0YXMs2lh6UN/UxwFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6630b11377eso497132eaf.2
        for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 03:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769687488; x=1770292288;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GhJiKf1yyl/q9NR3YiZbqQgNiOsPlO2TL8OechDRyLg=;
        b=c9Vzao0PJ+6QjxHWs1VPCGeIMHMDC40KQHNfx6h4MB8VKp6snD2zyUYswASTgwR9gg
         1i0LjdSdyF/tWOixZCh4R+u+09xe8XMlrbkJvRleaRFjfMRhVE2gm9pwdrpDGE3C8zDO
         rTLxv2ZkhVT6nY6dME1bT9+a/Auf35+eP4lpUpI+T4Q5S5v3O5cln9iBdnBT7XYAZPA9
         TDc+3gl61QYTHdInggXO9EwC1k8rkRLh4ZLAt0hbA6f+vi3qHFHllbMnYppI681s8dS8
         pu1c9mAXfkaNBdqR7KxH3FqTcDZh3GTZvdkPfRHuzZogeNsydk1tKBAKotAP8/AMU1jc
         WNsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKJup6cYsUe47ogGjO47KxxtDczB3jiHbpyWw3PBIr8PX8Z7LqwH4Ly0JsoIDHsSFD4xGcYSe1065f8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeyPUEMESdale/x52zzatrkLmQxnVDNT2BLE/OsmW7/frpbI8C
	nFEtISbiByYMzMaZMQptVDUjaecVptBGlr9QWgKbpCp+fabZTZWSILQHaO+g3Hg963jnRxho0nA
	9Y5rw5su1YPQHJRpaBtSJYRz9IK3x0G73c2zlkWWyukw9tY2dtYrniz3rQ/s=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1b06:b0:663:951:1634 with SMTP id
 006d021491bc7-66309512317mr651820eaf.23.1769687488294; Thu, 29 Jan 2026
 03:51:28 -0800 (PST)
Date: Thu, 29 Jan 2026 03:51:28 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <697b49c0.a70a0220.9914.001a.GAE@google.com>
Subject: [syzbot] Monthly media report (Jan 2026)
From: syzbot <syzbot+list05f0ca42ea87b12951f5@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-51782-lists,linux-media=lfdr.de,list05f0ca42ea87b12951f5];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,googlegroups.com:email,goo.gl:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7CDC6AFCFA
X-Rspamd-Action: no action

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 2 new issues were detected and 0 were fixed.
In total, 26 issues are still open and 100 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  573     Yes   KASAN: slab-use-after-free Read in dvb_device_open
                   https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
<2>  450     Yes   KASAN: slab-use-after-free Read in em28xx_release_resources
                   https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
<3>  423     Yes   WARNING in smsusb_init_device/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=85e3ddbf0ddbfbc85f1e
<4>  190     Yes   general protection fault in su3000_i2c_transfer
                   https://syzkaller.appspot.com/bug?extid=d99f3a288cc7d8ef60fb
<5>  115     Yes   general protection fault in dvb_usbv2_generic_write
                   https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322
<6>  111     No    KASAN: vmalloc-out-of-bounds Write in tpg_fill_plane_buffer (4)
                   https://syzkaller.appspot.com/bug?extid=dac8f5eaa46837e97b89
<7>  93      No    KASAN: slab-use-after-free Write in as102_release (2)
                   https://syzkaller.appspot.com/bug?extid=47321e8fd5a4c84088db
<8>  37      Yes   general protection fault in vidtv_psi_desc_assign
                   https://syzkaller.appspot.com/bug?extid=1f5bcc7c919ec578777a
<9>  11      Yes   KASAN: use-after-free Read in em28xx_close_extension (2)
                   https://syzkaller.appspot.com/bug?extid=a11c46f37ee083a73deb
<10> 8       Yes   BUG: corrupted list in az6007_i2c_xfer
                   https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

