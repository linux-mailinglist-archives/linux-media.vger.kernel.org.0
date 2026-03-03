Return-Path: <linux-media+bounces-54256-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PwOFguXpmnmRQAAu9opvQ
	(envelope-from <linux-media+bounces-54256-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:08:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFC91EA8F6
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCCAA303B923
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 08:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB6B387567;
	Tue,  3 Mar 2026 08:07:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5D837DEB1
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 08:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525249; cv=none; b=FoS3xElSRIiNWZRiU1i65LLNup9V8760G1tg0ZNUzGuS6155IsE5VOqXk0p8L6oEowo/kKQK76dowVryLA2iWbgopEbuC7bt4XQ82jGgZC868ZOSpEy8kB9NVFZevemxXWtT6Ueut7nn7z0aiOa9ByUha35KzkmVO6K4OofOerQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525249; c=relaxed/simple;
	bh=ZybpNwbrM3vZut0aJW4nT3Oi6K7E6FUrKXZxi1hbFbQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=V5cCSWIsbP4Sf9PzNK+qa88ofCuHI9IMajFV0ZgME4s5Vzm4caYfoHMOJtEIv4QKhqqhYWoybl8H7nNW2UfHOmnyclE9T5zO6fEIhKrFUEJtf7I7n+FiiuUv4X2GKnbNoUDH+CjtJ4QqwZQKEqxh6XX7p334KBgRqOXBieKCCY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-679c6ef1538so102132688eaf.3
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 00:07:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772525247; x=1773130047;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ej8Iv24B4gTH5C1v2ZIh0yJb2MZISKaUKTnJyDzhFg=;
        b=ZmcahsnEGtBpOT9dITGILhOuXBUEY9Q3z56ODOlnoeQp6x9NAfPqU0dmo5sUESuvBS
         UfLrTVzeBU50BPQ2Bkij0JOb6bl7qKi/e9O9WaMODa8AsFrIIMqWavzGyqNkrCHM5zwB
         GONQ1fNKtfllyfDyZI3k/MiePymzXue39MbMA3LXEfrD5GasvhldUC8grnqaAyELoVBf
         2MPZl1n+jju0UryGbKaUhvgCaLYNXJty1Q+HDsGN+HGXBNIcL3d7+f75uT7mGNQ9NHOr
         tOj3vzj3nSzlSYxu0/HZivu3a9KCUP9R3rAQPvXdimPSeqJXBWx7MjX2JCkAFP/oJLhV
         om5A==
X-Forwarded-Encrypted: i=1; AJvYcCUOt+hiVt9n+xVkFtGE/l4NdqvSgbRwJk9Zzy1f4fPslFXN/W6n6LdLZZpc+2MQitoS6e7FAFTzMNNjxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw77g4muF/fAL9cYjk4NJNEHADW9EqqJFkLNDrEGgRzyhjoc7Jv
	Xm2lf8o1yIcANDcMoifIgIpPKn4mPj/LLcUa+DrXLKSg5OBk1f1/3IC4fcv2JkA5UOTzkkkkVap
	mqxxf92ozeMDoz9Uvkq0rbDUe5obJfOhTI1+igewb/Yujy6QBNVfNFDH2qDU=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c91:b0:679:96f:3ef2 with SMTP id
 006d021491bc7-679faf4f1c1mr9515653eaf.60.1772525246852; Tue, 03 Mar 2026
 00:07:26 -0800 (PST)
Date: Tue, 03 Mar 2026 00:07:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69a696be.050a0220.21ae90.0009.GAE@google.com>
Subject: [syzbot] Monthly media report (Mar 2026)
From: syzbot <syzbot+list844890cacd1fd70d3d36@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: EDFC91EA8F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-54256-lists,linux-media=lfdr.de,list844890cacd1fd70d3d36];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.895];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,googlegroups.com:email]
X-Rspamd-Action: no action

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 8 new issues were detected and 1 were fixed.
In total, 32 issues are still open and 103 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  2684    Yes   KASAN: slab-use-after-free Read in dvb_device_open
                   https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
<2>  451     Yes   KASAN: slab-use-after-free Read in em28xx_release_resources
                   https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
<3>  340     Yes   KMSAN: uninit-value in dvbdmx_release_ts_feed
                   https://syzkaller.appspot.com/bug?extid=01d4620886bee3db0e74
<4>  137     No    KASAN: vmalloc-out-of-bounds Write in tpg_fill_plane_buffer (4)
                   https://syzkaller.appspot.com/bug?extid=dac8f5eaa46837e97b89
<5>  124     Yes   general protection fault in dvb_usbv2_generic_write
                   https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322
<6>  120     No    KASAN: slab-use-after-free Write in as102_release (2)
                   https://syzkaller.appspot.com/bug?extid=47321e8fd5a4c84088db
<7>  111     Yes   general protection fault in vidtv_psi_desc_assign
                   https://syzkaller.appspot.com/bug?extid=1f5bcc7c919ec578777a
<8>  34      No    general protection fault in vidtv_psi_ts_psi_write_into
                   https://syzkaller.appspot.com/bug?extid=814c351d094f4f1a1b86
<9>  11      Yes   BUG: corrupted list in az6007_i2c_xfer
                   https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209
<10> 4       Yes   KASAN: slab-use-after-free Read in v4l2_release (2)
                   https://syzkaller.appspot.com/bug?extid=a658d41cf8564471775e

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

