Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31B2FF3008
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 14:42:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389140AbfKGNmI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 08:42:08 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:50361 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389105AbfKGNmI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 08:42:08 -0500
Received: by mail-io1-f70.google.com with SMTP id t193so1842616iof.17
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2019 05:42:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=+84sf74G2+LtOjaIUAIm5mQgUcZUIwnjbC/PvAs6V+Y=;
        b=GHRTVsPu5u22ieoK73qR5ucjcTN2O3VXo+5k6apeDG+4pa6fg0p5PtP3xOKXeb9jDL
         4U3h0ZfVWVtB4QjhQPqXAMqWQvipZYbiYB3D03ISDBvjsVciWh6YLgCgHOfZB/a0svar
         xkuM+y0MQTY/LK0oDi37EcWhTFxEwr8pD3Oty28aU4SMjC7RyoYSlWeqvsprCdhEs8UN
         FeNdDq/M7o05iUSaaVjrHY5MpsJ3a4nGwtxOzRcHbSIkBIhUHBIgOlGowLvUSWAsJ4ge
         u31dKTRq8txQAllqQ4N8uJQl7uCWHpjONU/THEAeHXa3dvglZBlGJDItUBtu0XWZWZyc
         YUZA==
X-Gm-Message-State: APjAAAUFXdk0mjecM18iUBEk7iACEqrYOactLofevKPEX8UarXvR1EfV
        vtk8d6Xg76aXT8gtx7Q5BvIr5Tl0sjOZnlrKBPh39jlAkxYA
X-Google-Smtp-Source: APXvYqyDXVEYlUfk7geo3GgENWWqznzoIPNLvT/v/4WhhgkMFihALxGFrTFCqPjEvWIS25EzJfmt9/ngeJ+New1kGdinWyOcoDmF
MIME-Version: 1.0
X-Received: by 2002:a6b:14ca:: with SMTP id 193mr3506977iou.140.1573134126410;
 Thu, 07 Nov 2019 05:42:06 -0800 (PST)
Date:   Thu, 07 Nov 2019 05:42:06 -0800
In-Reply-To: <00000000000080601805795ada2e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c9f0a40596c1d46b@google.com>
Subject: Re: INFO: task hung in vivid_stop_generating_vid_cap
From:   syzbot <syzbot+06283a66a648cd073885@syzkaller.appspotmail.com>
To:     andy@greyhouse.net, davem@davemloft.net, dvyukov@google.com,
        hans.verkuil@cisco.com, helen.koike@collabora.com,
        hverkuil-cisco@xs4all.nl, hverkuil@xs4all.nl, j.vosburgh@gmail.com,
        linux-can@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, maheshb@google.com,
        mchehab+samsung@kernel.org, mchehab@kernel.org,
        mchehab@s-opensource.com, netdev@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, tfiga@chromium.org,
        vfalico@gmail.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot suspects this bug was fixed by commit:

commit d65842f7126aa1a87fb44b7c9980c12630ed4f33
Author: Hans Verkuil <hverkuil@xs4all.nl>
Date:   Mon Nov 19 11:09:00 2018 +0000

     media: vb2: add waiting_in_dqbuf flag

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1417a04a600000
start commit:   9f51ae62 Merge git://git.kernel.org/pub/scm/linux/kernel/g..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=62118286bb772a24
dashboard link: https://syzkaller.appspot.com/bug?extid=06283a66a648cd073885
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15701a33400000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=154c8e4d400000

If the result looks correct, please mark the bug fixed by replying with:

#syz fix: media: vb2: add waiting_in_dqbuf flag

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
