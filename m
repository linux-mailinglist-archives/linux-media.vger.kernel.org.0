Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 822D1676893
	for <lists+linux-media@lfdr.de>; Sat, 21 Jan 2023 20:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjAUToq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Jan 2023 14:44:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjAUTop (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Jan 2023 14:44:45 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97AA71BAE1
        for <linux-media@vger.kernel.org>; Sat, 21 Jan 2023 11:44:44 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id e8so6833990qts.1
        for <linux-media@vger.kernel.org>; Sat, 21 Jan 2023 11:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wm9ahWozNRIfaLVLWYiXHQvmnl2IvBDsysjsc+WJQjQ=;
        b=IQMz/2j+KF5OnHbv7DfggLA+aIo59zACuXNlEs65wsHK5S6basHLBYQhw0kOAn7Rsh
         4nQ1VjfqUPCBTerulaHgPjDW6LRov5fyFXcm6OqeAosTlHlhHJsLppnfu+Boz3oRoubO
         pz0rWDQ/nrqcSqGea0crmj5KPc1JW/ZjAUVWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wm9ahWozNRIfaLVLWYiXHQvmnl2IvBDsysjsc+WJQjQ=;
        b=jcOivAo5iSEl6KjQcC+nye4MAUIgXYkO5qig34/auHyuI2fOprqz6krTQ2pyfXj0T+
         s0Bq0nMQRY4WjP7Kiv8ZQb4AqLuQ+n0Wv8IwlHSWPas5IUBK0wbrJEfEmmRHLSGBdkcv
         JhYfDj/odVD7BSfPsY8IXCvVwcsDcW3Cmx61Yu4drsdcX54Rhr6ZVtDmc2tnpHzuvJsd
         wXCR6E1/WTWZIFTaraGx63dC9UxXEBil31Jlf0/Q1y5iVScFLUQO0HfbDk9kxsKeOHTJ
         vQgcG/xVFR6vbAgdDlIAAzLHBSNidGqnn7AXytpzMZ+QPKYuI1SdHj4IOcF6He2PWowF
         F+Lg==
X-Gm-Message-State: AFqh2koWsXGTcyEblg7aeHGJM6tTSKwCM1B/uxLC4XimIKwTYVpdMiZS
        v7ykyEOf3ijyT9QmP2XLKEuN8qwAUntM0713
X-Google-Smtp-Source: AMrXdXtN65UVmXEZiJCLUdjk++VgougTbBi8q6KoHpoDupJknM3WLT0vJ4S+g2CAAoVB0zIKqAgq3g==
X-Received: by 2002:ac8:48d9:0:b0:3b6:2f49:1acc with SMTP id l25-20020ac848d9000000b003b62f491accmr25457766qtr.16.1674330283510;
        Sat, 21 Jan 2023 11:44:43 -0800 (PST)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id y2-20020a05620a44c200b006e42a8e9f9bsm14852256qkp.121.2023.01.21.11.44.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jan 2023 11:44:42 -0800 (PST)
Received: by mail-qk1-f172.google.com with SMTP id u7so4535601qkk.10
        for <linux-media@vger.kernel.org>; Sat, 21 Jan 2023 11:44:42 -0800 (PST)
X-Received: by 2002:a05:620a:144a:b0:6ff:cbda:a128 with SMTP id
 i10-20020a05620a144a00b006ffcbdaa128mr1010910qkl.697.1674330282464; Sat, 21
 Jan 2023 11:44:42 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003a5c4905ef1044d6@google.com> <000000000000107e1b05f2c19aa5@google.com>
In-Reply-To: <000000000000107e1b05f2c19aa5@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 21 Jan 2023 11:44:26 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh0=KdGcRGn4tMASp0ZMJH215Dw+5cFZgKZ=+ry5Kh7Rg@mail.gmail.com>
Message-ID: <CAHk-=wh0=KdGcRGn4tMASp0ZMJH215Dw+5cFZgKZ=+ry5Kh7Rg@mail.gmail.com>
Subject: Re: [syzbot] WARNING in get_vaddr_frames
To:     syzbot <syzbot+59a71007ccac79e8bb69@syzkaller.appspotmail.com>
Cc:     hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, m.szyprowski@samsung.com,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com,
        tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jan 21, 2023 at 12:03 AM syzbot
<syzbot+59a71007ccac79e8bb69@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this issue to:
>
> commit 6647e76ab623b2b3fb2efe03a86e9c9046c52c33
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Thu Dec 1 00:10:52 2022 +0000
>
>     v4l2: don't fall back to follow_pfn() if pin_user_pages_fast() fails

Yeah, that warning is kind of expected.

> Reported-by: syzbot+59a71007ccac79e8bb69@syzkaller.appspotmail.com
> Fixes: 6647e76ab623 ("v4l2: don't fall back to follow_pfn() if pin_user_pages_fast() fails")

Is there a way to tell syzbot to ignore one particular warning?

Because we could certainly turn it into a pr_warn_once(), but
honestly, if a real use case sees this, I'd rather have the bigger
splat for a while yet.

Then we can remove it entirely (maybe in six months or something?)

                Linus
