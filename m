Return-Path: <linux-media+bounces-32407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E13AB57F0
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 17:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0809086639F
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 15:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251BF2BE10F;
	Tue, 13 May 2025 15:02:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FB81DED53
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 15:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148524; cv=none; b=pOqyRNvLyIIjpqF3Ybdbn50dRdUPdgzkBP1HWKsUpfQzQCz1P7wNcHiqCZnCXysBIzf6aPIPjs6UsDqr4Jkhts+VnkuRtcTjfsi4HqP/BOSMcSWJu7Aes7eJ6KzLsudjJImMiHjzhP+pEMwFfk3KgcyztVVlm1lWtrAmmCbc5JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148524; c=relaxed/simple;
	bh=hP4PegqdC13RnAQ85+yUWVwc7+/McCk2lZDiw5UO/Bg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=S2bd37ahBObGOBfg8dstoGrttxB2mrZC5bK1Bf7bvMI9jYvA11DThsBwA4drklO1z1+x9sKeeFNUkB7hdQzNmiK9KNd+QrtesQURMEq5otPpRl4liCN86UWriu7UHcQYVJXDIhBUVIIexyoPKWEsKvaOEjP3R/6Uj3VgZ85GilM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85db3356bafso1139272839f.3
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 08:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747148522; x=1747753322;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRCw3Vnmu98ynSRU7dOHd3K3QYDecyR1q9zxGNfhk6k=;
        b=m4bPa02mGYAn0loFP/HTEeIE+O/l3i90P9hTeXayDjAeFhYBmnU0sX4z2Tul77jVvD
         H2xI8xONxjE/ngNoNe3dytJgCuv3ccKkUaef1xFpX4x99aJnhvNgCRZUEryuO2Hb+OYC
         EKt/7qfT15+VAHcFS8yTLTeE839iDcuKyKyPhXbDkxjAGp94Yich9c3QOoRN+/hoWXrh
         8aqhUC9lGHFfkSAiDds86NsV/VNt5l8hIcckLnSq63/zX51Oea+5L4zqXH3ASvUvXMF1
         V2osIQ4Rdwl3KPUPuoM4UhAFoQDwnfVNAJ3D5Fzkcq7IevKLNGFAtQg3ql4OS2TXkhkE
         Q/KA==
X-Forwarded-Encrypted: i=1; AJvYcCXlJnYZOicyoZZhMUaMH7NwajGghwvS3bArMzHqos+S/4micQp0267Q5J+1LLXnRv3EwCFHeA+h68viVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Z/ZDQ3n3Yh4x3N8nyhTL/28gFCcpfjoziZDop83RkxWWmHMz
	VGqpk6+5xaLkmoQDwJBi9TcBGw6chHEfIW/g13CJfhkKWpoAeiPxJuL6W92Us1OFefVpUPzVOrC
	/KXHmAwuZ9epeuKpK5T9ZwRtA4a7OtJ4uPiSv8115XolnvtyVvtPSbYw=
X-Google-Smtp-Source: AGHT+IGMtQ161tXmf2KXLsHZBWzf4It6/o3Ywvnbm9ZKDK/irJkDeLwoCqMl97LC/tlvDAtSX5MOkOfGHaXSl5yf56Ur/aYT6NLX
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a6b:da19:0:b0:867:63db:8e4e with SMTP id
 ca18e2360f4ac-86763db8f38mr1628657039f.1.1747148521963; Tue, 13 May 2025
 08:02:01 -0700 (PDT)
Date: Tue, 13 May 2025 08:02:01 -0700
In-Reply-To: <000000000000453f3d05db72fc7e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68235ee9.050a0220.f2294.09fc.GAE@google.com>
Subject: Re: [syzbot] [usb?] [media?] KASAN: use-after-free Read in
 em28xx_init_extension (2)
From: syzbot <syzbot+99d6c66dbbc484f50e1c@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, hdanton@sina.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, 
	paskripkin@gmail.com, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit a368ecde8a5055b627749b09c6218ef793043e47
Author: Alan Stern <stern@rowland.harvard.edu>
Date:   Thu Jun 27 19:56:18 2024 +0000

    USB: core: Fix duplicate endpoint bug by clearing reserved bits in the descriptor

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12cf6cd4580000
start commit:   cd802e7e5f1e Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11cf6cd4580000
console output: https://syzkaller.appspot.com/x/log.txt?x=16cf6cd4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=91c351a0f6229e67
dashboard link: https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=143a7768580000

Reported-by: syzbot+99d6c66dbbc484f50e1c@syzkaller.appspotmail.com
Fixes: a368ecde8a50 ("USB: core: Fix duplicate endpoint bug by clearing reserved bits in the descriptor")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

