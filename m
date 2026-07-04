Return-Path: <linux-media+bounces-66583-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wk8jI5n9SGq6xAAAu9opvQ
	(envelope-from <linux-media+bounces-66583-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 14:33:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBE8707A16
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 14:33:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=appspotmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66583-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66583-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A92F3026316
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 12:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA833B42EC;
	Sat,  4 Jul 2026 12:32:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE343002D1
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 12:32:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783168353; cv=none; b=olBI/82XiTkgKN4N+nowEk8j/TUv/DJbROc5fv+NfgJPArfdO0hWhc8j9VEenNqwLcr42V9mW+gVX04ay/Zd5y49zEZlhuBK1TgwApV77temZTRpkldvDXSJ9D0iyOQWH1YQ3s8saxhyVu+Vvgyf5GuSrEpwR/oV/kPR3tr6l2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783168353; c=relaxed/simple;
	bh=pME4bjC1HkKzkbK/vNZ4vKpnul4WN5lrJo2q7vXU5kw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=B7FyXZA1jNDESZTkWpdbgK2x1YwRjA/Q9VZnWRCuyxcCj2bL2udSPPJc4XU50luoyq/Gja+A7nKfllXqq8MJl5NUL+pBiXFKi6TZw+dDKAopSj2ER/nRT6XDBFRnUhQNIvUgO898yY40dQwrQduK9q082yas0DH474llJrDlc0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-495b8120909so1668535b6e.1
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 05:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783168350; x=1783773150;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3g8up3Ie74hsjB9ySAePHf1aEy+sKa4ZFtk7OEjujUQ=;
        b=F380m6fuWF0+HVwI0zFYmfa36kyGrCYgUi+ZFb961GWEJye3BV+H51thn9bn47zDq6
         yMLge+dEOZVC2gZtBOQVbahyTnlsS8bG2zHerxoJxanEQWGeI0k6z8q5kLdknj5dGHrR
         bL+xqiRKnU/hhV20UJMlrxq2OdAbsg6Z758HAX3BtqjjfzypgV/tZrRviXuF5CGWgig8
         J+n8pnNeEFojILhvhIVVYwttRp8djf2xZMxwBScyaokJ5w0OTUfAMEddVybLcE+BLEo4
         Bt730weiPNZQIn59vfdT8ceiBx9jO7dCF4A4sZVMzrBvVYJ20QdK+1EFDXsZigTTxcyl
         k4mA==
X-Forwarded-Encrypted: i=1; AFNElJ/dQOG601OJQSMHk2Uaw8MhO2gRGfDoe+Sgo2WG1ZlzooMwERx4k8xa1bjC/gzjrjw5KlEVQO+yRetrZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygtU1a1+iXimJE831AB9zKu2zQp2EzExXZs+W2/dc9+HW4zQdX
	06YAXX8qJmlF14jijwl2OvGhDSjXgqarScU9fsC6kT1PYwN9wRiAYemdmSpSHLy7NJHXSeRg2qW
	AGPvSaGD/60dNIqdHL6AaWr3C69Flh/uYmMWG4SJZhqAjusIi013CAGPcAdE=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3442:b0:495:db98:cd6d with SMTP id
 5614622812f47-499ba7cc59dmr1554230b6e.27.1783168350517; Sat, 04 Jul 2026
 05:32:30 -0700 (PDT)
Date: Sat, 04 Jul 2026 05:32:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a48fd5e.34acba0d.1e07b.000c.GAE@google.com>
Subject: [syzbot] Monthly media report (Jul 2026)
From: syzbot <syzbot+listf5c80a0ffb2174ebbefc@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66583-lists,linux-media=lfdr.de,listf5c80a0ffb2174ebbefc];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[goo.gl:url,vger.kernel.org:from_smtp,googlegroups.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFBE8707A16

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 0 new issues were detected and 0 were fixed.
In total, 26 issues are still open and 115 have already been fixed.
There are also 8 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 464     Yes   KASAN: slab-use-after-free Read in em28xx_release_resources
                  https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
<2> 35      Yes   KASAN: slab-use-after-free Read in em28xx_unregister_media_device
                  https://syzkaller.appspot.com/bug?extid=07b93bb3189febcab189
<3> 12102   Yes   KASAN: slab-use-after-free Read in dvb_device_open
                  https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

