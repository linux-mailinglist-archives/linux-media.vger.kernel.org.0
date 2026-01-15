Return-Path: <linux-media+bounces-50821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C560D29429
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 00:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79D8E3038F4F
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 23:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95DC330D23;
	Thu, 15 Jan 2026 23:32:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1688D30F527
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 23:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768519927; cv=none; b=sjv8nJSx8xKhFH7tOHJqMzX50EA28Ut+0QgrLUVDbkpQbCGJ3As2c7N3xFZKRLPQfoQpNmU7VymReKxcpwmmADk6MaXaKobJkGYgawIs2jNHdOxhYT9jGRYpMHUZUFWsHdQRjze3kF2S8A2xKwT2oNq9j2ZnyPdDuv66uLgvBz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768519927; c=relaxed/simple;
	bh=P/v0iQODbENxZ+IU0S9qzJ7x5dRTcX8H0zRGHcekz0U=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QNt9qNbSYwYT5Duaxff7XuXzXmkGivyafdA2GH8B5lJm81IxoQkrQdWpi6RFAQDsvEVgTqRb+SqndGLay3Wky3jopL/FjLBetuvE3kwoW63wN7CBbOksE1Pp4CRXMTkjrbciIPDlF1Eg2SNbHc8mGhgqPoF3QH7wlxtlymh+q8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7cfd3f150ebso4153280a34.3
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 15:32:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768519925; x=1769124725;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SfA6BIjQ70CyAKBrgdN+IDy6ooAoTbvTAzbTxfm5ZTs=;
        b=iBxTlElEFQAi3Sxra8+GO9ls7tfvI7j1qLHFj9coC+sRN8YNeqP0wnAjp36KKezSaW
         OqJrQlRripCWRg1Mnqk/JQmd16X+/2SscJUMcODih57r1y4688hO8m4iLd9BlREv6WI2
         OtJUCmclrPrOzEqP3MMo7APZhOdnGui0PoORKYcJNYJNN1GgS+uiHU7/+6NzttAXO+zg
         dw1h6C/1CzOcCivcM/PiL/uaYI5kxGqNt1xfeaOCxxcdbOBl2K2Mt5b8ZVzx5KhDXO0u
         3cnOg2+KYiDmtkhjOL27Bn7GWwKdglFvxevr4bJWExj9+JiDWWSj94XTz28XC54Z9HGx
         GuyA==
X-Forwarded-Encrypted: i=1; AJvYcCVIM1z8cTNl2Mv/02awvZbyj2/VwMQlS+N36MDNVHVzSLsG8Aar1rSk1iYS2T5N1ua5gVxz+2XoICO55Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRTQfWl386OmeFI7BAaJAxPKd0pN8gSoWgzbRggguzz0vSeW0d
	ZX4lBQW0s4Xs6GHIxFzaplecMnqnjRVwRrO/Ym22Eg0YzZhMbO6lUf0S90aAYZxOKGsi0UFKSnZ
	lBUpZnZ7vDtzBuyUD4inCKghjEVv47jDvSVUxUwtCfS+zdgzAeNpG1HSmr4Y=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:450f:b0:65f:6c62:eef9 with SMTP id
 006d021491bc7-661188cd343mr334000eaf.3.1768519925128; Thu, 15 Jan 2026
 15:32:05 -0800 (PST)
Date: Thu, 15 Jan 2026 15:32:05 -0800
In-Reply-To: <67917ed8.050a0220.15cac.02eb.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <696978f5.050a0220.58bed.0030.GAE@google.com>
Subject: Re: [syzbot] [fs?] BUG: corrupted list in remove_wait_queue (2)
From: syzbot <syzbot+4e21d5f67b886a692b55@syzkaller.appspotmail.com>
To: abbotti@mev.co.uk, axboe@kernel.dk, brauner@kernel.org, 
	gregkh@linuxfoundation.org, hdanton@sina.com, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, lizhi.xu@windriver.com, mchehab@kernel.org, 
	standback@126.com, superman.xpt@gmail.com, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 35b6fc51c666fc96355be5cd633ed0fe4ccf68b2
Author: Ian Abbott <abbotti@mev.co.uk>
Date:   Tue Jul 22 15:53:16 2025 +0000

    comedi: fix race between polling and detaching

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10d49dfc580000
start commit:   038d61fd6422 Linux 6.16
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=515ec0b49771bcd1
dashboard link: https://syzkaller.appspot.com/bug?extid=4e21d5f67b886a692b55
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14fbbcf0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11034aa2580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: comedi: fix race between polling and detaching

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

