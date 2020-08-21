Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC6624D1B6
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 11:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbgHUJs1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 05:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgHUJsZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 05:48:25 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53B3C061385;
        Fri, 21 Aug 2020 02:48:25 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k13so628829plk.13;
        Fri, 21 Aug 2020 02:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n0gxWhKy8HZT9XqQrHP7qU76kr+KPT1ex9umU9pXHWE=;
        b=osVGyMuEzo2+GKkTLQba7FeGgYH958kaGau2qYDDBI/XvHwKz+hfv3Kb9gLOEYFuQ9
         Oy5LbYuAwZPVMpeTVtFsG1gIANz5vXPHJApamEGGDFIRhYz+x3bw8yyETS6pccCUtREM
         p0evb7r3GCK2wbmUo3N1e5b4w0v5ZETiUq64KFOdIHutXsMheDKwQxwxKvhnatFuc5Zk
         vLMmt0oKZU6E5DfJVNTLAU49zdiYnvpSpXFhwXVvVpscce9JiSUpXv/yLaoNkcV8CK/I
         9sJO0srddWK35YRu6gC4W2ZZ+7xwnqR6H/xon3v6ix37Ckm6PHwki17PZ9PUfrC3iGgS
         bJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n0gxWhKy8HZT9XqQrHP7qU76kr+KPT1ex9umU9pXHWE=;
        b=Rk5FU0H7jV+Lg2nAPj4R0bc1k0mrDRUMwZb1qRgVV5LvhJNLNG43itZgen5E9iKeNC
         2V/lpsdriCuyZYouZq+c44bTggzKfVKEbalZDCq+13XDmyunVp6hcP7TCPrSYYj0Cx67
         /XTb6ZblicGxZeKC/wNZp+GOsJGuv7b8Pxm9u5x/nYhd6bc5O5MGJQDDfpa5+tEfLj9B
         OyN90BZ3bdboBLCVjOnekQu21vJ/vSaUmFLq1XJU5Ddd1IKyrEa1fRyTdVRiLqCXNqFe
         nHPMRldNq28nu5U7hl3qPDVdHhALwT1gMObJJKsGeImqaz0SlB20fsk0S0ivzgYoCVHO
         QqIg==
X-Gm-Message-State: AOAM532LSl4RcRejr0Y2QzUie6zniTMwBRg++ND5BPE9cLKsEgcJQO3J
        Bd6G8pwT8xXC0OgfcrIS+uTRy2Ouas16
X-Google-Smtp-Source: ABdhPJzPxMw/GkVtaa/3YcwQtpvwf805RqnVAiPPLRe6mxdBj+kjewtcCTKhpqRRxLQIzXrDRdfaQw==
X-Received: by 2002:a17:90a:17a7:: with SMTP id q36mr1856454pja.61.1598003305256;
        Fri, 21 Aug 2020 02:48:25 -0700 (PDT)
Received: from PWN ([2600:3c01::f03c:91ff:fe6e:64cd])
        by smtp.gmail.com with ESMTPSA id u29sm1993493pfl.180.2020.08.21.02.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 02:48:24 -0700 (PDT)
Date:   Fri, 21 Aug 2020 05:48:13 -0400
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] v4l2-tpg: Fix
 global-out-of-bounds read in precalculate_color()
Message-ID: <20200821094813.GB480216@PWN>
References: <20200810050532.640075-1-yepeilin.cs@gmail.com>
 <774bcf2d-c8eb-086a-3569-c7e530d8a63d@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <774bcf2d-c8eb-086a-3569-c7e530d8a63d@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mr. Verkuil,

On Wed, Aug 19, 2020 at 04:26:28PM +0200, Hans Verkuil wrote:
> Hi Peilin,
>
> On 10/08/2020 07:05, Peilin Ye wrote:
> > precalculate_color() is reading out of `sin` since `tpg->hue` is not being
> > properly checked. Fix it. `cos` is safe, as long as `tpg->hue` is higher
> > than or equal to -192.
>
> Thank you for this patch, but there is something I don't understand, namely
> just *how* tpg->hue can be out-of-range.
>
> From what I can see vivid sets hue via tpg_s_hue() when the V4L2_CID_HUE control
> is set. But that control has a range of -128...128, so ctrl->val should always be in
> that range.
>
> I would really like to know 1) what the value of tpg->hue actually is when it goes
> out of range, and 2) who is changing it to that value. Can you do a bit more digging?

The value of `tpg->hue` was -20551. It came from the userspace, see the
"\xb9\xaf" on line 500 of the reproducer:

https://syzkaller.appspot.com/text?tag=ReproC&x=14b49e71e00000

  NONFAILING(memcpy((void*)0x20000200, "/dev/video6\000\000", 13));
  res = syscall(__NR_openat, 0xffffffffffffff9cul, 0x20000200ul, 2ul, 0ul);
  if (res != -1)
    r[0] = res;
  NONFAILING(memcpy((void*)0x20000140,
                    "\x4d\x43\x66\x34\xfd\x89\xb9\xaf\x0d\x59\xa2\x83\x4c\xfd"
                     ^^^^    ^^^^    ^^^^    ^^^^^^^^
                    "\x3e\x64\x7c\x96\xcd\x59\xf2\x3a\x18\xa3\x81\x49\x22\xc0"
                    "\xc1\xbf\x02\xa5\x50\x5f\xcb\x48\x92\x0e\xf3\xdc\xff\x85"
                    "\xb7\x84\x21\xab\xef\x31\x3d\xb1\xb6\x5d\xbf\x07\x8e\xee"
                    "\x5e\x7c\x73\x32\xf4\x9d\x1e\x62\x6b\x6a\xa0\x74\x73\xe6"
                    "\xca\x1b\xdb\x7a\xca\x76\xd8\x37\xb8\xd9",
                    80));
  syscall(__NR_write, r[0], 0x20000140ul, 8ul);

I guess the root cause is a race condition in the vivid test driver,
which completely corrupted `tpg`. I see bytes like "\x4d", "\x66" and
"\xfd" around `tpg->hue`, too.

The reproducer does two things: the above write() on /dev/video6, and a
preadv() on /dev/video3:

  NONFAILING(*(uint64_t*)0x20000800 = 0x20000000);
  NONFAILING(*(uint64_t*)0x20000808 = 0x1f);
  NONFAILING(*(uint64_t*)0x20000810 = 0);
  NONFAILING(*(uint64_t*)0x20000818 = 0);
  NONFAILING(*(uint64_t*)0x20000820 = 0);
  NONFAILING(*(uint64_t*)0x20000828 = 0);
  NONFAILING(*(uint64_t*)0x20000830 = 0);
  NONFAILING(*(uint64_t*)0x20000838 = 0);
  NONFAILING(*(uint64_t*)0x20000840 = 0);
  NONFAILING(*(uint64_t*)0x20000848 = 0);
  syscall(__NR_preadv, r[1], 0x20000800ul, 5ul, 0ul);

I commented out this preadv(), then the reproducer didn't cause any
crash. Unfortunately I don't know the code well enough in order to
figure out exactly why...At this point of time I'd like to send you an
v2 as you suggested, it should work as a mitigation.

Thank you for the suggestion!

Peilin Ye
