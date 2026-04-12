Return-Path: <linux-media+bounces-58613-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMZLDiTT22m7HAkAu9opvQ
	(envelope-from <linux-media+bounces-58613-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 19:15:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEC13E5085
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 19:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21230301D307
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 17:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B603148A3;
	Sun, 12 Apr 2026 17:13:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD1A30C35F
	for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 17:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776013986; cv=none; b=ZjAzIxotUm8qVYYtK6RnVwIxl0C0owoRQL/o24p27v4maP8kBH997UCELVI1fix1VpiHUDktf77gLXHFS2HHhJBZTRSsDOJQDCYzFTQY++7Aa7nqpDLcUF+LJyMulL8AQ7KULCBOuSNM2lBfoWHZhxsAx+aME0a6aK1/vKzZX8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776013986; c=relaxed/simple;
	bh=hr1MV9S561RrJoixK7OZ9h8Z/yV796RTYFnsxlWRa0U=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TByJQrZhrycreepdCP5oYsVyOgI9Af9izMuYnqumZzJ/x5HR7JojcQk+qv9IFRO40r+dlHPed8JSFAiI6ZbkzG06WxEZhlbqRivijHxIV12Q2RB7IniLs06VwGXqT5HS2tW0eWkDs6D1smr6id/RGAwuq6kHx388zT7g6e0KR5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4240a9f9375so1252825fac.1
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 10:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776013982; x=1776618782;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7b+YZHSwsuyQR6R44PrK/kYsqjsuy+wg61jI8nterfY=;
        b=RVdA24NtyfTkPcFxslMoIbCTPUg1CmTMdKerk8c8vuilg/lVeL2SBc668R+dDV6ur7
         gQTzfcivO89wPwbAL/FKsRBR3l2QMqeMtcdGwiiqTt7VSEO+DPtz9HVerJh3R5khmos+
         VDwUJg/0i4rG2algCz6+mkzc2pqdDXUwfaG4BbnRlNKdsok/nWYXN0ZRS/igTY31XnBG
         wZexy4Zcr2U/V3HQ2BnRpcPLJm+y7b4bYHVMOYzB+S1Q98blpLUqfIfTBjRHcXn/L8Vm
         3k0cV7SGEXXgAp7inyjMY5Cra6UhbEPpaIapb9P8PwLHEY+Jf5uh/cTrG3HU4yaEvbNt
         +SQg==
X-Forwarded-Encrypted: i=1; AJvYcCWcp6e2Qj84Dgq68b48MR/jIId0/7loWyVtok4Jr9zdZsLDHvKrEURIUPruJdHMpnFbYIV6uLIICBsuQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCQoh/X9K1bKZdjC3In+UfrC/dV6YpsKNKkseXg9bD6oSf1BjH
	7EyRrQDVlPgjbdGJSu2ThUqFnuPJ+uZV5PT9o5wVCxHrRnBNlow2s/gqNlyw/ozCe9qC6C/ejzi
	Q9kx3CGSDF64VLQtmMfgAI0WAROmxnqPHG+IZlbmuZS+yfA2r+bq2Tv7WGmw=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:198c:b0:68b:6c1d:2258 with SMTP id
 006d021491bc7-68be7ee194amr5127820eaf.31.1776013982752; Sun, 12 Apr 2026
 10:13:02 -0700 (PDT)
Date: Sun, 12 Apr 2026 10:13:02 -0700
In-Reply-To: <advGF8eFp3on-6hb@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69dbd29e.a00a0220.468cb.003b.GAE@google.com>
Subject: Re: [syzbot] [media?] memory leak in vidtv_psi_short_event_desc_init
From: syzbot <syzbot+afc686a471d70896c5d9@syzkaller.appspotmail.com>
To: azpijr@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=e2bba615ee79faa5];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58613-lists,linux-media=lfdr.de,afc686a471d70896c5d9];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,googlegroups.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 8DEC13E5085
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+afc686a471d70896c5d9@syzkaller.appspotmail.com
Tested-by: syzbot+afc686a471d70896c5d9@syzkaller.appspotmail.com

Tested on:

commit:         f5459048 Merge tag 'i2c-for-7.0-final' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=169f9b02580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e2bba615ee79faa5
dashboard link: https://syzkaller.appspot.com/bug?extid=afc686a471d70896c5d9
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16111036580000

Note: testing is done by a robot and is best-effort only.

