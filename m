Return-Path: <linux-media+bounces-4877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA3F84F64B
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 14:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 754D0282C0E
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 13:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB74A4D58F;
	Fri,  9 Feb 2024 13:58:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B514D11B
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 13:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707487084; cv=none; b=PqnQwNzqvKsnFIyH8IL3c1vMYeMl4tmS9X9+ftzw+K8bi8MzTwooaVh4jqqDx+yAX57ZNRKftW91ie/f1USF1tT3isLudA2ZdThaywr571iyqCdNXH7B5ycYPQhSti00xk03JUjFRwB4fTFpzsxFNbcc7pw7VtpskfwFb76tokI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707487084; c=relaxed/simple;
	bh=KgvrOHqW/nOwXmmrHWcgs42V7NoASj+/ZUYp4NpDRp0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qeIMvizqnos4VOmea8AbwhbpE1aYYnJxqWPsOtkapepHIUSd1o/hys0wP7GO4cEYVFcnG9nDW4NnYgk8E49/0uh6qrMbnZmY+Jn9wLWdkMPmsF5lY5z59a4CHgDiTIbNUntoT/fqO1q7tkRqnb1uMEWIfFmgBLCU+x67ZyYwIZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-363bedeec4fso7802995ab.1
        for <linux-media@vger.kernel.org>; Fri, 09 Feb 2024 05:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707487082; x=1708091882;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BGMm3AEkbwxMmZYoWinLQYL05MhebYQIefChB73Qd5Q=;
        b=EYQvZwdJHjPxr3FRJGINmtXl+LWHETShLZp3TCia1uUwuDem4yXzSH8jvj0Cn0bXJQ
         GnvWSLsiBzYgJ1ZKKmEEik5+AbNK5zzI62Tvv2uKk8rDSAhRYzchgvBCU41T6gWNPIn7
         mcXhbVB9z5uWe9lHNxrczys9IOCXWh0v35jLgGBkGeJFrynqJBD6AY9CvjupBtwe/aOx
         K46GwuMp7kkIKRsvjLeoKM+fs66QSZmuHc0npzZsS+HCLDtdHRlDmbUX5mXe44IwlRfF
         +wIWGdHECroT7C9I5x0BdZbog5tkyRYWzR54IUoLfwHLM+dm+G+E8AmrW4pk44OJM3m1
         Ssrg==
X-Forwarded-Encrypted: i=1; AJvYcCXs9733+hbUGtuVSv22/g9CcxpmVC9FZKPw/Vlk0thJ8vlcvxfp78vgGw8XDIzlg0YDUhhm8CFr1GW0MkHsv/swUOFBnXEr1r1hpd8=
X-Gm-Message-State: AOJu0YxQAGANzfpjyu36KrQTnW4sJYxbtxPVsuxAQ/z8kf34JTBZKWIE
	PHQvgkP5PaRmKEVaZ6NhZOYZc/smubNZcKuLnKGf/kUm/wNuVyT0NvZ0cQb0FGvtCkqJ4uCHyMg
	YmVKyFajKYSegnVnQmggkcxVG8h5LB3XafLS3kFxFGzFK3W84UGFLzR0=
X-Google-Smtp-Source: AGHT+IE1Ro5KKyB2KXxAJGaNjl4gJ7od7nzug7FOJ01vkjLcehKwnlBmqmZkRahWgzVJeNq5bjctrle8kWwK5Tq9gBrgLHQw+F9M
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2190:b0:363:bc70:f1b1 with SMTP id
 j16-20020a056e02219000b00363bc70f1b1mr101138ila.2.1707487082274; Fri, 09 Feb
 2024 05:58:02 -0800 (PST)
Date: Fri, 09 Feb 2024 05:58:02 -0800
In-Reply-To: <000000000000ce2dde0610db47a8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ff69600610f35011@google.com>
Subject: Re: [syzbot] [media?] possible deadlock in v4l2_ctrl_handler_log_status
From: syzbot <syzbot+9948f8e188482c5d1a3e@syzkaller.appspotmail.com>
To: benjamin.gaignard@collabora.com, daniel.almeida@collabora.com, 
	hdanton@sina.com, hverkuil-cisco@xs4all.nl, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	nicolas.dufresne@collabora.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 9801b5b28c6929139d6fceeee8d739cc67bb2739
Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:   Wed Jan 17 14:52:04 2024 +0000

    media: v4l2-ctrls: show all owned controls in log_status

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1278acec180000
start commit:   b1d3a0e70c38 Add linux-next specific files for 20240208
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1178acec180000
console output: https://syzkaller.appspot.com/x/log.txt?x=1678acec180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bb693ba195662a06
dashboard link: https://syzkaller.appspot.com/bug?extid=9948f8e188482c5d1a3e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=148953c4180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1746f9b7e80000

Reported-by: syzbot+9948f8e188482c5d1a3e@syzkaller.appspotmail.com
Fixes: 9801b5b28c69 ("media: v4l2-ctrls: show all owned controls in log_status")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

