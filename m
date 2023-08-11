Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC1877907E
	for <lists+linux-media@lfdr.de>; Fri, 11 Aug 2023 15:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234721AbjHKNLl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Aug 2023 09:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234343AbjHKNLf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Aug 2023 09:11:35 -0400
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95EAA3A94
        for <linux-media@vger.kernel.org>; Fri, 11 Aug 2023 06:11:31 -0700 (PDT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-564fa3b49e1so2075560a12.0
        for <linux-media@vger.kernel.org>; Fri, 11 Aug 2023 06:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691759491; x=1692364291;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=85i9+xl+xM5AuqjpBE7xe2qIMsQEToMtFqeiJTlbC6c=;
        b=QX+9fcVBNTZOhIp+Fq3+i4Ep5RaoED6z8dw205OOTmtzAy3xQIRUsLdnm7qDGbAiA9
         k84WD04NClmLes3vJ7oLiHBYMxk80xXRRMvF15cLKrKmAyBwj60XsbAlqkD0tpjzz1nN
         E/KRkRm9QUkIyOpM9m+MtmKExPdsOsKeZ4xPofEJoI62m3wZeZdyUUWLsCqLoq7MXQiA
         hLYvxyET4hi8kDjOKXDpbMX0XvowDaqBOnfkjiZ1Ttrim2Gd/szEDdkhGmw5bJ6gwKqm
         A4wZ8b6eW/l1SAysX0mYnp7nClF3YYpU+baFYEsUAAyISThpqvbtq9MxpyQ/QEUr/Fgl
         ftaQ==
X-Gm-Message-State: AOJu0YyDBcf10DMJQW4ykiAz0jVHwcPcOJmnz6piqK6oOZ58eBMlXEEo
        eq4iRuQ+C+kZ1hdchd3FGxrCRbzbV4fHaLOxI4yN0bAFtdxz
X-Google-Smtp-Source: AGHT+IE6mlpOJnrQYygGL94RLN7nZBqIXwoLj/2fLMhBjffAqYtlCaP2RhL+Vdgavypmlox1QgfnsdLW044EoCryJciWsqSMmjVU
MIME-Version: 1.0
X-Received: by 2002:a17:90b:612:b0:263:3727:6045 with SMTP id
 gb18-20020a17090b061200b0026337276045mr417243pjb.4.1691759491089; Fri, 11 Aug
 2023 06:11:31 -0700 (PDT)
Date:   Fri, 11 Aug 2023 06:11:30 -0700
In-Reply-To: <0000000000004f463f05ffe76731@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000830cdd0602a573be@google.com>
Subject: Re: [syzbot] [usb?] [media?] WARNING in smsusb_start_streaming
From:   syzbot <syzbot+a7c205f9c1168e2f1dcc@syzkaller.appspotmail.com>
To:     duoming@zju.edu.cn, hdanton@sina.com, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit 6f489a966fbeb0da63d45c2c66a8957eab604bf6
Author: Duoming Zhou <duoming@zju.edu.cn>
Date:   Mon May 22 23:59:32 2023 +0000

    media: usb: siano: Fix warning due to null work_func_t function pointer

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=122f7a3ba80000
start commit:   d528014517f2 Revert ".gitignore: ignore *.cover and *.mbx"
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=d576750da57ebbb5
dashboard link: https://syzkaller.appspot.com/bug?extid=a7c205f9c1168e2f1dcc
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17dd0d94a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15ea4fa0a80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: media: usb: siano: Fix warning due to null work_func_t function pointer

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
