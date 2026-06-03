Return-Path: <linux-media+bounces-63476-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QEO6Ke+uH2qdogAAu9opvQ
	(envelope-from <linux-media+bounces-63476-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 06:34:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 004F263428E
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 06:34:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63476-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63476-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=appspotmail.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBEFC306EB00
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 04:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A213F4103;
	Wed,  3 Jun 2026 04:32:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C4737DEAB
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 04:32:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780461145; cv=none; b=phBbzajX0OBTcRQJpJ+MW7gCk3uFVll5NwvXjLUjadhjmJBNTE7GlZtu7maMkXjVKNbr0VHxzCyquoLB4sUGCdYnOI8ag0QzPglUDJWIADkLtpL4S68DnJI+yM2YaLrkxdFFNlLTEHxmf9Kj3Bw8YYeijDN3XjGCoGvysCvhY2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780461145; c=relaxed/simple;
	bh=YFcUaUj6kxkv9rqhNTP8GplMzelCIexEexCMwAhcknM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QXjvxJ9y/ggOasdEtc+b61HfybBq6YNmM1ma4RRpernlTxZVMoSwiw2jsqaJKQ3qK9liDW3BH7Vgxyxx+RaqLikx9zXVDF7D/67jv/k5vZ50E/fxCHL58EmWGYwhwQhQ9rWxNH8A5W+Fulm2mtcnkFr3Kpew/1J5iLbnrYiOnqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e6eeff3b75so67597a34.0
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 21:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780461143; x=1781065943;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L6I2nLDGac1Lc5F9iWGirVMZobXIs5WUzJ/DO9M8Iqs=;
        b=rpLcsumd2jHDmeT60BIOYZ1RWkjEwuP7JuYYUsqZxI28K9LrfOzaVE6pkppI2mMJc8
         PxyxXzD2Ead2bPfbz+YA53m7Tz7JHKuy6EX2UgQrgBco3Uw3bV6ffbXvrfHjlVTVNPG2
         c2NHxHj+K2J5cOnFtP9LiXCVlP4qKu3jPdk9x0Nj6TKysvadNPppLIeBzgWTC+REeJM0
         oWV+6w12tMmEsFNIyti9VAU3HKjRNNdG8CwxIs2FD7ZYJqUz0tt5JgjBwTtRE7+Jdii6
         wQnHBwIJIwAY3wpJNEa9xuJkMttBz88SEh31XloV9hYkuY9DE070hej1Onrm1M4ITiOK
         l41Q==
X-Forwarded-Encrypted: i=1; AFNElJ9C4DEHpGhCdDY99hLVMHUVXZ/3mdDuRA85z34RVgtzH+gklHKDzRZrw9BcDi3QYsc4ybHIqvh7rfLrNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPfxPl9nUcR+7T/z4eo0cINAxfNrKoOqqilua4DC4RfS1eAal5
	yjvXnVutyIKIn53qn0ScLonJ8KpeIXqhjCpxdS55LGJ14ZUPbg9NLAR9yxbHIhLEvTrVldqtARQ
	xb0Xe+/C8hYz0jk8DpAzSUU5wW2MQ8D85C7cbqEHZUeprIEv/h1klMgk/bN4=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b87:b0:69e:42fd:4070 with SMTP id
 006d021491bc7-69e47def91bmr1050511eaf.8.1780461143170; Tue, 02 Jun 2026
 21:32:23 -0700 (PDT)
Date: Tue, 02 Jun 2026 21:32:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a1fae57.3b158e77.2846f8.084d.GAE@google.com>
Subject: [syzbot] Monthly media report (Jun 2026)
From: syzbot <syzbot+liste916efb0292109d94721@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63476-lists,linux-media=lfdr.de,liste916efb0292109d94721];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspotmail.com:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url,goo.gl:url,googlegroups.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 004F263428E

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 3 new issues were detected and 2 were fixed.
In total, 29 issues are still open and 112 have already been fixed.
There are also 8 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1583    Yes   KMSAN: uninit-value in dvbdmx_release_ts_feed
                  https://syzkaller.appspot.com/bug?extid=01d4620886bee3db0e74
<2> 460     Yes   KASAN: slab-use-after-free Read in em28xx_release_resources
                  https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
<3> 134     Yes   KASAN: slab-use-after-free Read in dvb_frontend_release (3)
                  https://syzkaller.appspot.com/bug?extid=ae466a728017ec940b41
<4> 8       Yes   memory leak in v4l2_ctrl_handler_init_class (3)
                  https://syzkaller.appspot.com/bug?extid=b1de0d5fd8a15fac11aa
<5> 9160    Yes   KASAN: slab-use-after-free Read in dvb_device_open
                  https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
<6> 5       Yes   KASAN: slab-use-after-free Read in load_firmware_cb (2)
                  https://syzkaller.appspot.com/bug?extid=db4326df1b9af04f68fc

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

