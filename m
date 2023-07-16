Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 190DA754D63
	for <lists+linux-media@lfdr.de>; Sun, 16 Jul 2023 07:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbjGPFBe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jul 2023 01:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjGPFBd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jul 2023 01:01:33 -0400
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DE61980
        for <linux-media@vger.kernel.org>; Sat, 15 Jul 2023 22:01:31 -0700 (PDT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3a1ec37ccbbso5502312b6e.0
        for <linux-media@vger.kernel.org>; Sat, 15 Jul 2023 22:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689483691; x=1692075691;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gc8P9j4aAtUD818FUv9FldLGl7WtvU/qesSGY59z6is=;
        b=jknAFRvKQFNrDpPMaSDqBkYPhXB4h5u06ixIBH3RLUnfcEKXtTXcNLc1LoUzKXSqqu
         ndx7ANYY4GuIjLdJrsBZmUfOIF2/8DK74PFGiJR2vYdscE2VoFN0FC7r5saW/NNRZUjq
         RBQRmaLMFmo0M8vGxM39lFRyY2LvCgpwsRwOry8VRMf7GeTFJjWQjvLj0sQmLPUqltWM
         X/tKfRI15295GMXuN30WgSK5X1m+cq4Wyzxagbch3eNqw1Ns3dxGrChHlzDRHNeVKoNR
         1duG96uzUHbnzW+lTa9QTkdPg2siBdMmVxJ9gHSy+MTqA1kvFWdCn0iWIZ/UjB2811eF
         OWpA==
X-Gm-Message-State: ABy/qLZxrR4tB6S1zbhQL2qIrJaVwd9Gq1QWF3beKqA+S9a+9QR+NdGP
        tK77gQ9yjz73lluHQd9D39hcbLilxEDm2HtQpYMSn2Apzmvy
X-Google-Smtp-Source: APBJJlHiKkQSYHWZqiMGK6JjPBORaD5zWjOurp/X4RHYedM4t3zbGTgydgOk6gzh9XX0dFzBM53cFrKdyB0aFSTeEV/ZZD4WxY07
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1316:b0:3a1:e88d:98ab with SMTP id
 y22-20020a056808131600b003a1e88d98abmr11466633oiv.6.1689483691033; Sat, 15
 Jul 2023 22:01:31 -0700 (PDT)
Date:   Sat, 15 Jul 2023 22:01:30 -0700
In-Reply-To: <20230716043411.4950-1-astrajoan@yahoo.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004209890600939346@google.com>
Subject: Re: [syzbot] [dri?] KMSAN: uninit-value in drm_mode_setcrtc
From:   syzbot <syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com>
To:     airlied@gmail.com, astrajoan@yahoo.com, christian.koenig@amd.com,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        glider@google.com, ivan.orlov0322@gmail.com,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, skhan@linuxfoundation.org,
        sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com,
        tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com

Tested on:

commit:         d1d7f15c DO-NOT-SUBMIT: kmsan: add the kmsan_exceed_ma..
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=101d3fdaa80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=36e4a2f8150fbc62
dashboard link: https://syzkaller.appspot.com/bug?extid=4fad2e57beb6397ab2fc
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15430342a80000

Note: testing is done by a robot and is best-effort only.
