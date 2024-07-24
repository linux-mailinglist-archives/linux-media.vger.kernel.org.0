Return-Path: <linux-media+bounces-15317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9608F93B120
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2024 14:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CE751F24946
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2024 12:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A12158A3E;
	Wed, 24 Jul 2024 12:57:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2E5158A27
	for <linux-media@vger.kernel.org>; Wed, 24 Jul 2024 12:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721825824; cv=none; b=LD4Jae3OxQkq4cg2spXYHzubs2o98cvyyb82vq6D22nHPUOj7CtpI9Pi405XxXohLQ8Z1x/fR01UtU8JFMDUgb3gV3QbtLWyqsM5VxDYiQMdDqiMQts1gPzSRw91enQ40hn0UVxrnIADr+UOdyqPzoCVxvdE5p0c/za/s/B8B0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721825824; c=relaxed/simple;
	bh=eMO9oaTYJTw7/pYmgEFRo+hnx7JERKfTjoDMEGw7rvk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oDGmykgZUxqilvYFC5tXsZkA/xlCECfF3y1uBGQlO0mRwlKJJPWApadeIw6yGNQxvgy+EMojIbY01CDuWjeIvKtttEqv7OaDw1fMScKetAwSMfLDBh4Ag0vQIiACJUnj/4x8OKLCt5GZBVMbW6sjVuN3wDSGB6GN6CJEr1o/WTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-8152f0c63c4so102362039f.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jul 2024 05:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721825823; x=1722430623;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sWF/vEehNNZ8eqC7U5IQ3mszOLthKw898Ewf4PdqwSg=;
        b=sKKY8TNGQ69YjBsyTbkFLRudrf+d27kXUCxr3uGoANZNkaNGhyBb7TCt392hhYY9lN
         yzd1aPDJfQozNXeM7+O3RZTTAUvv19z4zpFc9RjgNecUVhxYKWj2xhygkYObV+nhK64/
         uhJYQs78+03F3OXMFF2BJ/lIEO8auIJISuGibRjVRqQOop05v4X4xrsqSLPMmJiWs9gn
         nFixzK6US0hy2J7BRHH2wBg9HiJWipMibkbO0zemf+plMtbuaoTyCTjJJYS5/gZfWKB2
         fK+XnBUR87OXkc9UQuj7WpQEfvW2vG70pq0XzJ5vXvkoynyokS2zhytX/3bPI/9HI7cW
         PAMA==
X-Forwarded-Encrypted: i=1; AJvYcCUu5e1fc6wXf/Kny5t77cB0Ht4dPti2LO36YbhDl+Hg9Xdwa0WRAdFnlY+GQw/tYQzRWvMw0Ze1r+ZQGyuP0DyR3TXVg293ZWtK7ZY=
X-Gm-Message-State: AOJu0YyeDxAcr/Ri2fZVlRpLLzT4uUk+4TzHm6m8ZacWUdemXvU9DdD2
	L2s8X8ZYiePnJ6jv43Ct5wQWLtsFBqBoaFpgcIWHoXn/CZtu4m9cFLo36r/rZ45q8Xh3Xf2Six+
	p6Maz6Lp7eBvu+4XVXe2ln9gM03F7sRoTwuUcdYq5n1ox5d46J1Vm2yw=
X-Google-Smtp-Source: AGHT+IE+80N05IIoyLx4suhOWzjDC4b3xUK6256qg6ywXqEciukJkJUXNqup5dDfum2WGGluw39Mcx+flqntE3d+GjVmQu9LF6j3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:8412:b0:4ba:f3bd:3523 with SMTP id
 8926c6da1cb9f-4c28fd31a25mr100554173.2.1721825822776; Wed, 24 Jul 2024
 05:57:02 -0700 (PDT)
Date: Wed, 24 Jul 2024 05:57:02 -0700
In-Reply-To: <000000000000ce2dde0610db47a8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000883205061dfdd0b3@google.com>
Subject: Re: [syzbot] [media?] possible deadlock in v4l2_ctrl_handler_log_status
From: syzbot <syzbot+9948f8e188482c5d1a3e@syzkaller.appspotmail.com>
To: benjamin.gaignard@collabora.com, daniel.almeida@collabora.com, 
	hdanton@sina.com, hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mchehab@kernel.org, 
	nicolas.dufresne@collabora.com, sakari.ailus@linux.intel.com, 
	syzkaller-bugs@googlegroups.com, umang.jain@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit eba63df7eb1f95df6bfb67722a35372b6994928d
Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:   Fri May 10 07:11:46 2024 +0000

    Revert "media: v4l2-ctrls: show all owned controls in log_status"

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=146553b5980000
start commit:   c942a0cd3603 Merge tag 'for_linus' of git://git.kernel.org..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=98d5a8e00ed1044a
dashboard link: https://syzkaller.appspot.com/bug?extid=9948f8e188482c5d1a3e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=100b025f180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11abdfc8980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: Revert "media: v4l2-ctrls: show all owned controls in log_status"

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

