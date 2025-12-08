Return-Path: <linux-media+bounces-48370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2BECABFF6
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 05:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72BDA300775A
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 04:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7E32D0C76;
	Mon,  8 Dec 2025 04:00:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5697A285C9D
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 04:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765166408; cv=none; b=LOAL335dWM6Y23HvmNMcLivAJHNF8YBESWcVVuYPI3Tv+XY7dwBZ383EnKRGOOUJOLNU4/5gyR6Gknlb1HoFQgxQDJcb2XWUmyXmciLBvcv8bbD0d89eKPVuKW4uZamd470OelrCAr8BED/c2BPsDSIhP8cH7xmtONfjdWbD2yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765166408; c=relaxed/simple;
	bh=Zy8bL+FP1xBdkpARx63Bz+tj3K1g1vX4Mau6peslITE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pjjFrLRgmP09q9ZmbOXTvTyyqjqb0Mw6by3E9nlXe4tyUL4zhjltowj1MXjJ2Rmpv+Ex8IB4qQidLxfmdxbAXuiYURMH9uPrn8t96XMwky8//lSbdQMwryhL4oHjkrwYwNtGpt85ghLZ0eUP5fk9LVl4LXVgd6W5C6BhSPFP4e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7c7095cf155so3680509a34.2
        for <linux-media@vger.kernel.org>; Sun, 07 Dec 2025 20:00:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765166405; x=1765771205;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1WP/ffN6G7H+JWR9t9OzHzpl5pzo75jTA/9ZlPc+0X0=;
        b=fxYlm9R9fsDz1bBOHRDV8typClrpTjzUNVFs1xG5EzbWyf2kqBnF+5rreGZo6Q+YxP
         y9+sMHT13VOoWHq/rEF09BnlX/GVHWIQajIndPhUlv5cbI7+bXNHh/moPwkpbwJ7R7W6
         X0sK5pXlkFedBTKf25g1E27v+Zcs81Hxacw873J5x9hV0GaX26SYQIquGprtDYZ7tnaX
         Du3ZP5ZnJohPLkAtDTds/u5QiNoMnzzDWnd77KfLWQvSu3tG5e+68Aw7hbLSXo6BWa2M
         P4BhmYdB30zH0b4E5whTSfhg6rCsxEqmQjJHPDuuWs5cX+ZCu/R37nfYuEgwrmWRk86Y
         b5HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG22OEOkJSMzBiO2Jj82epscU4NP+EEPuy7RGdkxRR0PTiEQKg2Zc5yE9Xv5niBoTy/FFMvGUwbNoqRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAu/EiBK54q+0Calp7oBgBjXraLXqGDDlsO3ys9XZyrLqynRrP
	guBiDkR2UN5MbJ1T3ZWIYI5B3epydH7VyQler01TKia4Y9ansN1ABXaEo81rEZ7dY6rdNsHct95
	CoeJLVTWSYQxkMk583aFlyABfDPw1oVtBtWwfUHrVVxFRmLWoEQAI52S3sg8=
X-Google-Smtp-Source: AGHT+IFGesb8XHnh+mV37OMlqmL/b5X5/1zO9DRSScA+LL8+uqR1Pkfi+0bmpC13hJULAEl9z0dn0ZMePcPLwOZJiLRnWteIr4DP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81c4:b0:659:9a49:8e6b with SMTP id
 006d021491bc7-6599a9668b9mr2658141eaf.59.1765166405148; Sun, 07 Dec 2025
 20:00:05 -0800 (PST)
Date: Sun, 07 Dec 2025 20:00:05 -0800
In-Reply-To: <20251208031224.10579-2-dharanitharan725@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69364d45.a70a0220.38f243.007e.GAE@google.com>
Subject: Re: [syzbot] [usb?] [media?] general protection fault in su3000_i2c_transfer
From: syzbot <syzbot+d99f3a288cc7d8ef60fb@syzkaller.appspotmail.com>
To: dharanitharan725@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, micha@freedict.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d99f3a288cc7d8ef60fb@syzkaller.appspotmail.com
Tested-by: syzbot+d99f3a288cc7d8ef60fb@syzkaller.appspotmail.com

Tested on:

commit:         c2f2b01b Merge tag 'i3c/for-6.19' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14498ec2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=530ad8e7aaef67e
dashboard link: https://syzkaller.appspot.com/bug?extid=d99f3a288cc7d8ef60fb
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15d90a1a580000

Note: testing is done by a robot and is best-effort only.

