Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 250A2113387
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 19:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731499AbfLDSRK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 13:17:10 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:42827 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731959AbfLDSRB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 13:17:01 -0500
Received: by mail-io1-f71.google.com with SMTP id p1so522548ioo.9
        for <linux-media@vger.kernel.org>; Wed, 04 Dec 2019 10:17:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=4wdFb/go3+wXQG1FazkaJLX0eWR/JfQ2cs/FXkmodVM=;
        b=JnMpLFC6H0Q+jMt1jjECxU/q0KyrJACCSqxdczSGZHr1fDRgI6V2I6WFZDW0fHTexl
         cWy8r6dgmSN1s+kRItx/TR4ylIwNrDKXMM5+Eod23AstzD/ubqVrrZiFjd/L+urn6Urr
         1JMnsHRBm5lr4vQJR5S5MA4M9C9EtxIJlTZUj94sSrR2Sw3QOiIvUdu9TRY+Hz/ovDkH
         k15juVNCy7iG+qLiiLkfLigoKMfiwI7GQ2hQ/uXNiYcMIbapaYTRXYH3JmmqVNYDpX78
         5tqgi4Xn23OZlEX0L+kmQ9uZXyjv2ZC5lc3Q3mohsxFzviCQIVoh2ZE1ttaP5wixpVZJ
         d2Iw==
X-Gm-Message-State: APjAAAUEn5mo8PyuZBNs3v4UZFe0WkZY/Z/zVKcFadVVwOkQMmmY+2bC
        LecD+iXn37d4q//48ZrAWLBU0boY3MucJRS8ns255gntFwsk
X-Google-Smtp-Source: APXvYqxfEJfcqqHIsUcy3WUxOi+VGXY6BPT7GEEyyyT795+CsrgW5AxgzYvjkVDBbiwQc8KpAHs0g0CC3cd5CmVN4OqVVyq0yZ6f
MIME-Version: 1.0
X-Received: by 2002:a02:40c6:: with SMTP id n189mr4320421jaa.18.1575483421189;
 Wed, 04 Dec 2019 10:17:01 -0800 (PST)
Date:   Wed, 04 Dec 2019 10:17:01 -0800
In-Reply-To: <1575471809.30318.6.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ab6be80598e4d18d@google.com>
Subject: Re: KASAN: use-after-free Read in si470x_int_in_callback (2)
From:   syzbot <syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com

Tested on:

commit:         22be26f7 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=387eccb7ac68ec5
dashboard link: https://syzkaller.appspot.com/bug?extid=9ca7a12fd736d93e0232
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1063382ee00000

Note: testing is done by a robot and is best-effort only.
