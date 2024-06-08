Return-Path: <linux-media+bounces-12780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9144901402
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2024 01:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67C221F22579
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 23:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589C043AC3;
	Sat,  8 Jun 2024 23:51:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D1D1CA96
	for <linux-media@vger.kernel.org>; Sat,  8 Jun 2024 23:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717890665; cv=none; b=APNAhUhVrh/bn/Kxbn7/mnDM5woDTVKhL3qJxLnwSw72HYNJ7hnaGquLYaOiDULkEUagii7E8MOyeBZjwIbeKVLP/6Upo7ymmPMWyw/bs/sRg4m+EUsHQav8V5u9g6yl6WaaqHIV78UTiCAKXi2MQMUZzYJs4K6AkgWb21KQV6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717890665; c=relaxed/simple;
	bh=d0niSI0BPqgORWJ8d6uor4Qauk2a0PRIg7Z3CF9XdmY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BYmVHybRSSv7f7cZhLUoA6fXKgkVca/wfR1Xh9GEh6D3S9Qd+kxoAA5sUfpSOWSi9a6OzZgPB/LGDAectqz4uRzShHQDVrQNhgLHtheFzlFnjLztGHiwraeOwMojz3BP7CEVV6zWrNfNLA/X8C6cw+2P3m/Z4LIqnj/+v94FPT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-37586a82295so18808145ab.3
        for <linux-media@vger.kernel.org>; Sat, 08 Jun 2024 16:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717890663; x=1718495463;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K1VLo2KJi9o9tzQVg0N1w+H/e9lvP5uDzyw9PtVc0as=;
        b=QUxb+etjzRnOpi+oZr0BmzX3ovr7zgGobTVwIfNNJSVxg4WAJbpVeZRye5EOXGFZBp
         pbsV1uiJxLQNoCZQMRyNIDSsVhmJJZYC8fRbJeXwIxkzTR0zVLblRzSUyx3lZwMNrEkT
         Sj6u+5Vm7Bmyb8EXA6a9jsJNJTL8T6O3HUcsRZtxN5Tn3VVmobT81vcEmwYE1vQHaLbB
         0B/9TwIVfDf9E0+8+MVCWZP/79dUtq77bIvnd5twntWghuOtGw+r/NuYFunDL9TbbQvN
         308oIdQVYj+m1WgAYJ1EenfVFLt9wbv8gAYflFwrt18TPW0+6fBgrgOtNZlT1WD2q0fd
         nURQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5bDh0nEAStn6+tDemEYKtn4H1E+i5Jm2fJu5C/iR0aVWFcd1dUL59dSJl2MZdGS8NtLEc87tOBE50SM0u4V/YL2G+SGgbMTGRnjY=
X-Gm-Message-State: AOJu0Yyg2hwfl4NXbMPH1NMvSlMwOHh0TChpK1SJt4K8Y2PXCcIeTKhM
	U2UocCS6s2h8dXcw2ihiCb+wHr650Fw4Sz9TcPKefVftbFiAFT+809F4/aZJE9RcIM4fQ6Tu8R1
	5U/ar+VdaxOtAMfW1kXc+hj2RHljqfzkTEcOsEOwq/9gn2YDhQLC3898=
X-Google-Smtp-Source: AGHT+IHJ8bs/U3I3g1f4q/Xp24Ah0Qnma9lKdfqjhw9W8j5aEoYUBtabb+mH1Cbm0PU1piVVmfgBeW2+PGKAZvVoTvSuYOx3fOwS
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c49:b0:374:9a34:a0a with SMTP id
 e9e14a558f8ab-375803d3e9bmr5712495ab.6.1717890662891; Sat, 08 Jun 2024
 16:51:02 -0700 (PDT)
Date: Sat, 08 Jun 2024 16:51:02 -0700
In-Reply-To: <0000000000008b96230610c6b3fe@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b99437061a6996df@google.com>
Subject: Re: [syzbot] [media?] [usb?] possible deadlock in vb2_video_unregister_device
From: syzbot <syzbot+3b1d4b3d5f7a358bf9a9@syzkaller.appspotmail.com>
To: benjamin.gaignard@collabora.com, hdanton@sina.com, 
	hverkuil-cisco@xs4all.nl, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
	m.szyprowski@samsung.com, mchehab@kernel.org, syzkaller-bugs@googlegroups.com, 
	tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 65e6a2773d655172143cc0b927cdc89549842895
Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date:   Sat Mar 2 10:37:08 2024 +0000

    media: usbtv: Remove useless locks in usbtv_video_free()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1009e6f6980000
start commit:   b401b621758e Linux 6.8-rc5
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=eff9f3183d0a20dd
dashboard link: https://syzkaller.appspot.com/bug?extid=3b1d4b3d5f7a358bf9a9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13ffaae8180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13ef909c180000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: media: usbtv: Remove useless locks in usbtv_video_free()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

