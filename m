Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9B172F660
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 09:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243215AbjFNHdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 03:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238639AbjFNHdR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 03:33:17 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC20E62
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 00:33:16 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f14865fcc0so2287e87.0
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 00:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686727995; x=1689319995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qkWUYxeNpxiShyt/biqf0PvJmlpRvEtSSRqqG9LGg20=;
        b=Q33P7o+fu2X34hrkntGtMU0jIuiUSMlEpor/wwql9xBvzGOS2N6LLDN8ShTHfJxbip
         tecrPeBFTEAhcjZIvWek2T0FlxNGahyhReRHFVY/GlsxXmVPyOlrNBI6q/fdmUYxOkcJ
         teJLLAxBphdKEO0YpujMNDdLJuXdYl3kjFwQ1ILH7BRCPe6NpRYMkTEOQ4EZTC0oRefp
         JXTJYv8MU/9EYqsIapfJwUv4D6malYKI4MrVCsbEEd8pJMntR5m0hURX72jh2UyDex6w
         APlZF1Csrik1q4tuQNtpHzjIa5mBVSsIceaHc7mQWERbUyAOOWOobFOFaPAn7/2JUcyE
         3i0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686727995; x=1689319995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkWUYxeNpxiShyt/biqf0PvJmlpRvEtSSRqqG9LGg20=;
        b=Y/y1pmVR1JYy0WmxTx0nHKz4lPcR1LbKsLiVFb4sV+T1ctO1U/NWa9nobju8XmQi9H
         259NxDsZ5IowmrAoMoeu/mfrnlIJ9qjhITBjDZlv+tNjU3zpuqO8Z28CwpOrixfeprYu
         JsYbKiliaSRHfy4IbLdrhvH7aorWFtf+wA1qE/JViTgjEUiPseI015orwS2cxHKe7LTI
         zbUEhGa66yApEXvHSPPyOJp2t/x1wS29tpzwvDe6A30Ua2H6c6qJwmNECcLlGKKUZGv6
         f42RJhx+Y3/i7JPWd0GA8X0IYJMhntw3PBmtpXWpidUF02DyBxw1KZmcxLj1Dxd3/+5W
         OOOA==
X-Gm-Message-State: AC+VfDy/v6Ytjv+cjJf3mTzGMn3oZZ7HlYdR0zjpYHV/O2HN0eE8qAb5
        oSvVkWorF93pa9ftKJPeQ7DVFsRNSnJvqds2uQ6pMQ==
X-Google-Smtp-Source: ACHHUZ7jmduHKMzJV4DW9K/I2UmCi6bSW7ZCxI84e5H3m243tIdv98qbYVlnEeFzbG23nkVVry5ZG+nAthWBTpqD19s=
X-Received: by 2002:ac2:560b:0:b0:4f6:3c00:1764 with SMTP id
 v11-20020ac2560b000000b004f63c001764mr39438lfd.5.1686727994625; Wed, 14 Jun
 2023 00:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000fe7dd005cc2d77c0@google.com> <0000000000006d819905fe07c52f@google.com>
In-Reply-To: <0000000000006d819905fe07c52f@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 14 Jun 2023 09:33:01 +0200
Message-ID: <CACT4Y+bvzX7METN=jCcmY96dF-XNysYtF0s70Y2nxNNeYDUpsg@mail.gmail.com>
Subject: Re: [syzbot] kernel BUG in vmf_insert_pfn_prot
To:     syzbot <syzbot+2d4f8693f438d2bd4bdb@syzkaller.appspotmail.com>
Cc:     airlied@gmail.com, airlied@linux.ie, christian.koenig@amd.com,
        daniel.vetter@ffwll.ch, daniel.vetter@intel.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, javierm@redhat.com,
        linaro-mm-sig-owner@lists.linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, suijingfeng@loongson.cn,
        sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com,
        tzimmermann@suse.de, zackr@vmware.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-15.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SORTED_RECIPS,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 13 Jun 2023 at 21:23, syzbot
<syzbot+2d4f8693f438d2bd4bdb@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit a5b44c4adb1699661d22e5152fb26885f30a2e4c
> Author: Thomas Zimmermann <tzimmermann@suse.de>
> Date:   Mon Mar 20 15:07:44 2023 +0000
>
>     drm/fbdev-generic: Always use shadow buffering
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1025ee07280000
> start commit:   0326074ff465 Merge tag 'net-next-6.1' of git://git.kernel...
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d323d85b1f8a4ed7
> dashboard link: https://syzkaller.appspot.com/bug?extid=2d4f8693f438d2bd4bdb
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14fd1182880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17567514880000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: drm/fbdev-generic: Always use shadow buffering
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Looks reasonable:

#syz fix: drm/fbdev-generic: Always use shadow buffering
