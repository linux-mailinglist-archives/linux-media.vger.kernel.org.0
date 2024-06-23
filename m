Return-Path: <linux-media+bounces-13989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE59913BB0
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 16:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B14D281BBA
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 14:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E077A181B84;
	Sun, 23 Jun 2024 14:16:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E2D1E4BF
	for <linux-media@vger.kernel.org>; Sun, 23 Jun 2024 14:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719152164; cv=none; b=Z+lpRgSeWENNl90E92MPF98j6iuGSBiLTz9QfY/fUG8OSDRKpezyyLkALp0zXQWe3E5R9tZfwCP5bvhBmGUDceHtErZKPuBNj4aNBRdgpmFGU3XAwUCaaLXI5RhyZBFdxbo4xCMlY9nGy8PCYALdZHZ/QweUg4FiRVHKCdpHBt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719152164; c=relaxed/simple;
	bh=E2raSBiLlF6ZZrYJtu9CjAs3g1IwzOHuG0mhMVvUaew=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WBc/n6N9+cYXR8hJj/ATqNwXsU9RXUS4y0GiQm9HjTk09RxS1opIS4RbjxM13rpp3ZXWpyuL8hxKc1runX40V0Xlbesvya6iCjX2KFMnES2OFtW9djWB5EkKi0dPuezzS6dEDtsrifP7mgqUXa1cOKdLHtYg4rR24N+COZIS9zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-37625537d64so47273845ab.2
        for <linux-media@vger.kernel.org>; Sun, 23 Jun 2024 07:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719152162; x=1719756962;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pel9CcDiejXovINpVpgIZJc7ZERUxuUiUUus/5uKjgk=;
        b=nJUIZMY1kazSaTNmzoaQznlfMg+Z4co9Aicbb/Fy7aXc/Z9RSISOcEW9q8juDgcggc
         nM6jb7rv7ZiRU1Upu0suuAwvmf7aiteAsyHj4F3qRLzTt4Oeqo8ap4TFSwvMFTCK1rlt
         RcZqkRem6uC4/ekzl4VRj5TKYOXp29bnjRss67+zuVp6dZdj7Cwxm5rU9/IwQYWCAIX7
         6Ok0ANPktnx0BmaxbeMg3seyC5+3+RShsEuc+Nxta4V6iO1XYGqjLenZD0DzaQWe6ACy
         /CHc+l/jPnnSBYZLYz0GoOmd+PRmNs3qX2jeqJE/ejGA6AKeBjqyJ/KNLA2Xflhv2RKz
         +m5g==
X-Forwarded-Encrypted: i=1; AJvYcCUxvR4DGvzFPku01mUxZv8ZbaZYQHSBYW4sX+RzdrN4qLQSHSvnxRagESSeJK7+9ZZX3yZysoDU4JtNg1P1hSlCnzyu0qiWorzUn80=
X-Gm-Message-State: AOJu0YzFo2l6L9263s6oR77LFAesb6s4Rqn8vL49f0NthQ2CCzgY8syx
	TMOI8kUen9bL2VN2XgluyTgWBYMlSG+jqt5BnVBBHhc8R3lhd/e22tIbirVFki2DWbaxMqqYCPy
	t7Wr3RGfF+DVQjIZy/Z9eJL+6+I8isAzfiSFPqy7hCd8ayNirtzLHY0k=
X-Google-Smtp-Source: AGHT+IG8/bc0B1SxFcwIatsKxz3UzZ1OnvzxsTMhPSaXbMhL1/kzVyN1dXRGtpl7ExZxqsd3Cvg0TY9w7hNgt9TxoMo1UwOaBFU4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12c9:b0:376:44f6:a998 with SMTP id
 e9e14a558f8ab-37644f6ab3fmr1174805ab.5.1719152162439; Sun, 23 Jun 2024
 07:16:02 -0700 (PDT)
Date: Sun, 23 Jun 2024 07:16:02 -0700
In-Reply-To: <0000000000006d96200611de3986@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f51641061b8f4d2c@google.com>
Subject: Re: [syzbot] [media?] INFO: task hung in cec_claim_log_addrs
From: syzbot <syzbot+116b65a23bc791ae49a6@syzkaller.appspotmail.com>
To: bryan.odonoghue@linaro.org, eadavis@qq.com, hdanton@sina.com, 
	hverkuil-cisco@xs4all.nl, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, ribalda@chromium.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 2998b976300d087db739f044a105c88573f031d4
Author: Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon Apr 29 15:04:52 2024 +0000

    media: common: saa7146: Use min macro

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17ba1dda980000
start commit:   45ec2f5f6ed3 Merge tag 'mtd/fixes-for-6.8-rc7' of git://gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=fad652894fc96962
dashboard link: https://syzkaller.appspot.com/bug?extid=116b65a23bc791ae49a6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11b2f122180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11fd704c180000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: media: common: saa7146: Use min macro

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

