Return-Path: <linux-media+bounces-60188-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILQEO39f9mnNUQIAu9opvQ
	(envelope-from <linux-media+bounces-60188-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 22:33:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 816C74B3744
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 22:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09378301A902
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2026 20:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92F438CFE1;
	Sat,  2 May 2026 20:32:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D59C2EC08C
	for <linux-media@vger.kernel.org>; Sat,  2 May 2026 20:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777753943; cv=none; b=ce5rM/E+GEwDjvUUhPkgW3aCMlvePWLOX3o/Dn9wbI20w5tDpsatD3zIe4RmHAB4LDeclEe06oCoY/+CjZAJgDB9h72fD1noAlMikio9gUM/BkUgWO2S7UNx/5l2d1odTpn8i9P+blLC4JFpTKQo979BjMtDzh/KNuIdRyHRclQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777753943; c=relaxed/simple;
	bh=bMFGkhWOHiC+cNqt4KTDR+lWUhEFVbYEzdIGuIy9P2s=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QzIbOUkb+wBLPnBFsTtHdHrKvCB8jvDM1Wen/QAAd3/zL/dIO315ZbIHeh7CW2LDtBfl9Vhfqwv6I+qHJaxgYyul9pVAOHws4f47vaqx/TFl7aVcVm2i1SePZCaVdr/WS9RtZ3e0gm4uLQ0STQ27qyt5Dqk9eLpa5PV7nqgWdtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6961e8fa90bso6630715eaf.0
        for <linux-media@vger.kernel.org>; Sat, 02 May 2026 13:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777753941; x=1778358741;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V6GNnm+jHp0GioRiwpyPcy4w69nQee1a83IZ6tu4f8Q=;
        b=RUo1xCAtYszf/iaKYmiqFn9gsg+xzt0xMwbhncfihBGCqj63N/S+zMEq2hM1k3KBVg
         68zSx2hO+it2B5H9mdDd0oz+T2eucIXyLgnoIoVaeGn0vUGDQpyaETHWcXpS4i5FegEW
         KVcOUGY766ki3OrvOW2VVMBsyTX6JK4QLQ4yjSiSpdwLlDydeHyOslOMyYEiDj/qvacf
         z3TaWvqzuw5LkCjbEDFXZbZZobtDVRChIwhWnYY1HiJwhjxz02MLcz2sk/zaC5DEK18j
         OKiwDCZJrLXO7z1wWAPK2ZTSPrEm9lnRHCkJ8jXYK9QsK247iTT6qofUyPFwxzQUl1q4
         x2IQ==
X-Forwarded-Encrypted: i=1; AFNElJ8k6StrM1ES1R4q+ZE0gdRyQBxw5mz8oV64AfXXTpWjFwdwiG6dExQO5osilStmkOa6duyzFOjqmcUFOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcgQxNQ7VAGfK8TxwmUbR1pbkjmZM2CokJ0q4jYSJ8n3Y9mVlP
	fWzwTXBChsyEJGQaELR/PHJRxmgO8uF3ZIM4oFhtCTRm0LhBbY29YAYKtlgyVSQtWGJYueGEwTY
	ucSkHR5gQon8lkQrc+Qf7xUvdEFhRlpksMY6tzX0II01YVG8xxoq0FqkdmAE=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f023:b0:694:9071:b60d with SMTP id
 006d021491bc7-69697c65b37mr2248748eaf.44.1777753941339; Sat, 02 May 2026
 13:32:21 -0700 (PDT)
Date: Sat, 02 May 2026 13:32:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69f65f55.050a0220.312cd3.0026.GAE@google.com>
Subject: [syzbot] Monthly media report (May 2026)
From: syzbot <syzbot+list13e6aa10e2534df74017@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 816C74B3744
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-60188-lists,linux-media=lfdr.de,list13e6aa10e2534df74017];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,googlegroups.com:email,goo.gl:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 3 new issues were detected and 0 were fixed.
In total, 36 issues are still open and 110 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  7056    Yes   KASAN: slab-use-after-free Read in dvb_device_open
                   https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
<2>  1125    Yes   KMSAN: uninit-value in dvbdmx_release_ts_feed
                   https://syzkaller.appspot.com/bug?extid=01d4620886bee3db0e74
<3>  458     Yes   KASAN: slab-use-after-free Read in em28xx_release_resources
                   https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
<4>  368     Yes   KASAN: slab-use-after-free Read in v4l2_open
                   https://syzkaller.appspot.com/bug?extid=1a7507a194fff09e5c44
<5>  242     Yes   general protection fault in su3000_i2c_transfer
                   https://syzkaller.appspot.com/bug?extid=d99f3a288cc7d8ef60fb
<6>  199     Yes   general protection fault in dvb_usbv2_generic_write
                   https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322
<7>  159     No    KASAN: vmalloc-out-of-bounds Write in tpg_fill_plane_buffer (4)
                   https://syzkaller.appspot.com/bug?extid=dac8f5eaa46837e97b89
<8>  115     Yes   KMSAN: uninit-value in dvb_demux_read
                   https://syzkaller.appspot.com/bug?extid=bd7c90de4c9f1f8ab660
<9>  91      Yes   INFO: trying to register non-static key in as102_dvb_dmx_start_feed
                   https://syzkaller.appspot.com/bug?extid=3f395d8da879a58fb019
<10> 49      Yes   KASAN: slab-use-after-free Read in dvb_frontend_release (3)
                   https://syzkaller.appspot.com/bug?extid=ae466a728017ec940b41

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

