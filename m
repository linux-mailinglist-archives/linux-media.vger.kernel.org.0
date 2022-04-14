Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFC8501F0D
	for <lists+linux-media@lfdr.de>; Fri, 15 Apr 2022 01:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347632AbiDNXdg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 19:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241111AbiDNXde (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 19:33:34 -0400
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FDFAAC8D
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 16:31:08 -0700 (PDT)
Received: by mail-il1-f199.google.com with SMTP id k2-20020a056e02134200b002caaa88e702so3916883ilr.0
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 16:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=cacxPvYX+7YoVTe1rbwEqAdwSgHbgFcryjKRqnj4k6o=;
        b=f7nBJjoHSoj4ZPnxHjRC7AnktzHB39WdaGjEXna50HGAIJ56EeCsdhE1Q57cNGODe/
         mT+TfSGNe9F+KSND6SbzUOFLCyAh3BJgcrz+ZEvIlWBjjmLTOo0fl+2w8AVNNmxMEyNB
         Qi8dQK8fimkIHKUNotSNUoLoSBc4dNAQEG+j+LXkEdN4LAoL9lbXBpkHMYbRyohzhRKl
         XgXxjiZZ5acVRyZ2rtsCdqywmAcIwV5l15RJFhMUYFrTn7SI2u2RKrnNhyiO4EmV/xk0
         J0WEVRBphjJxFAQMLQ3Y7H4Qaohg5hp13WHVhtONjwqo7+8odDP//veBS6pG9tOSBTH2
         5E/g==
X-Gm-Message-State: AOAM530y4qMaEuHlDAp9M61dPeQ+VQ3ZmMOLerWi8PexaFOk8Jk6oWTa
        uUA7ucieJ2ZWR572h2dNj+xZf+n+D8NZN+Yxfyc2AU1FnOAx
X-Google-Smtp-Source: ABdhPJyIevyU0774Z/8ufRGfExJNo+ANrxot63r6R9B7mINzokzQuOulhQeJNK64zaCiOhEPwslyPLTq+36eX8PN6//sDidtLde9
MIME-Version: 1.0
X-Received: by 2002:a05:6638:16d2:b0:323:7285:474b with SMTP id
 g18-20020a05663816d200b003237285474bmr2431975jat.61.1649979067429; Thu, 14
 Apr 2022 16:31:07 -0700 (PDT)
Date:   Thu, 14 Apr 2022 16:31:07 -0700
In-Reply-To: <9ff91977-a6b5-90f9-3502-58ac641e1307@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003378b905dca5b0e6@google.com>
Subject: Re: [syzbot] UBSAN: array-index-out-of-bounds in pvr2_i2c_core_init
From:   syzbot <syzbot+1a247e36149ffd709a9b@syzkaller.appspotmail.com>
To:     isely@pobox.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        paskripkin@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+1a247e36149ffd709a9b@syzkaller.appspotmail.com

Tested on:

commit:         115acbb5 Merge tag 's390-5.18-3' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=eb177500e563582f
dashboard link: https://syzkaller.appspot.com/bug?extid=1a247e36149ffd709a9b
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=113c24e0f00000

Note: testing is done by a robot and is best-effort only.
