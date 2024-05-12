Return-Path: <linux-media+bounces-11387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7468C3849
	for <lists+linux-media@lfdr.de>; Sun, 12 May 2024 21:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACEA51F2207F
	for <lists+linux-media@lfdr.de>; Sun, 12 May 2024 19:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323D15915C;
	Sun, 12 May 2024 19:37:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DAC56B85
	for <linux-media@vger.kernel.org>; Sun, 12 May 2024 19:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715542627; cv=none; b=C0+IbHwDrCcqcPNmvd773P2ibnAlSt9TOLOmZDHHnjNY38RDc0YX3vYKJ8Z7U1zJUZi18ryK5akwX48mrENeE5ym0iq6GB0oIMgA8TwDFmlE5UOwgZq0Ee1M6ArHTEq8IYVEnA9NUXJXELBa6l0sEq8MAKHMx8jgj56tR0Y2dNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715542627; c=relaxed/simple;
	bh=kyd93mqSF82R8nszEN3nDKoKUXfQOeLHYtm9U0w+AYA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=O3s/bR/eqwIk2gGxTMLapEgJptTb/6rqFh2gELoj4Tg9fGEzUHIfU7CoUJW7IQVDxExwi98LezSQIj6fTt2By+XynBUNvTBQzac4E4jz8nmvobr4L2duFGzAwLJsm0qCZrDeannhTbX9nCZ2NzYUF5N/kgNr/4WB1V8T9ZrhJgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7e1ac2fbcb7so465511039f.0
        for <linux-media@vger.kernel.org>; Sun, 12 May 2024 12:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715542625; x=1716147425;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVn/OxZZaVY2YhgVyRsBmiKCFaHKe7OYXMQofi/q71Q=;
        b=fJ6WFKRbilrskKBZLDUSsWAU04ym30oXreEQObaqMBzXPs5fvOtpricRbaSeKdW8tZ
         7iu/ttF2PH59FWYrMrVbxaXEGXFKZpKcFz+LuTABLQnp6WXojU8P3yxjlElGvOoIva/Q
         gxTy5sCqEBIfkXFKg037Yt4GoneT+YHNJ+nryF6OkTitM7o9ZfDrclfOQxnvif68XU+P
         9Xu2GcxKLQMuZ9UoicgyPKPDROINCDVz1v/HZpC5sjtHH4Q5MtLvb4da5EUNLSEmZ6Qs
         /63oFrJDC3my9Lcm6pI669V116q0eV+a3Be9dDhRoDkaQmR+W2fMNEpt/Q8+HfR+ctEN
         HIog==
X-Forwarded-Encrypted: i=1; AJvYcCX+IZ3IJFxRqk5SGBgDnsNmwPrfpVuTQATKUcbar9xKJLugWBaTrhDMFAagOB5frmlbiBBEeFnzFPzekWRyweXnQhJiAe+8P/aO71M=
X-Gm-Message-State: AOJu0YxwTqkRFfdkG3BFYPDV8dLYuKoR/2ZvU7X4hfUKapj663FSBfTz
	R4L/kh8uT7CJ48C6yzfldAmdongSxe73i3CtUwkVOGNaV1r08qylvHhMdzATiAJ33KNGDZTjUGJ
	XDWRvJwrYA7FBnVtXHRyh6RglZkJzAkSfKrV4O5GuWebxbSOzNsSC0yQ=
X-Google-Smtp-Source: AGHT+IGDS4MzOj5DR3HwqtSuhyI/oGt5Xu9CBnIDswORRMQ+lAMRu3qR2PZxLFcQnybLBtI0Q4Kjbto+VKB+6t/KDiLXjmW3OA5F
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:8506:b0:488:d9fb:b418 with SMTP id
 8926c6da1cb9f-4895933e5a1mr551182173.6.1715542625498; Sun, 12 May 2024
 12:37:05 -0700 (PDT)
Date: Sun, 12 May 2024 12:37:05 -0700
In-Reply-To: <000000000000898d010616c1fd03@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ca4700061846e4e1@google.com>
Subject: Re: [syzbot] [fs?] KASAN: slab-use-after-free Read in __fput (2)
From: syzbot <syzbot+5d4cb6b4409edfd18646@syzkaller.appspotmail.com>
To: brauner@kernel.org, christian.koenig@amd.com, daniel@ffwll.ch, 
	dmantipov@yandex.ru, dri-devel@lists.freedesktop.org, jack@suse.cz, 
	justinjiang@vivo.com, linaro-mm-sig@lists.linaro.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, lvc-project@linuxtesting.org, 
	mdaenzer@redhat.com, pchelkin@ispras.ru, sumit.semwal@linaro.org, 
	syzkaller-bugs@googlegroups.com, tjmercier@google.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

syzbot has bisected this issue to:

commit ff2d23843f7fb4f13055be5a4a9a20ddd04e6e9c
Author: Michel D=C3=A4nzer <mdaenzer@redhat.com>
Date:   Fri Jul 23 07:58:57 2021 +0000

    dma-buf/poll: Get a file reference for outstanding fence callbacks

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D17c1007c9800=
00
start commit:   5eb4573ea63d Merge tag 'soc-fixes-6.9-2' of git://git.kern.=
.
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D1421007c9800=
00
console output: https://syzkaller.appspot.com/x/log.txt?x=3D1021007c980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D9d985095f83428b=
e
dashboard link: https://syzkaller.appspot.com/bug?extid=3D5d4cb6b4409edfd18=
646
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D11a13cf898000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D15c4d2f8980000

Reported-by: syzbot+5d4cb6b4409edfd18646@syzkaller.appspotmail.com
Fixes: ff2d23843f7f ("dma-buf/poll: Get a file reference for outstanding fe=
nce callbacks")

For information about bisection process see: https://goo.gl/tpsmEJ#bisectio=
n

