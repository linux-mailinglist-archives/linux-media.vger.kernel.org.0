Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C88C84430BB
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 15:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhKBOst (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 10:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbhKBOss (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 10:48:48 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB75C061714;
        Tue,  2 Nov 2021 07:46:13 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id f8so55348258edy.4;
        Tue, 02 Nov 2021 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PqTPhnZWWSI7aaZPpC+xELL83kKV2UGyYtjIddeA+HE=;
        b=S1/OyhmF4WKgNKAgKcKtKJ5M1kCxZU+WBMXZ07ktnV3k4kqdvrLp8ECjE+tnxLNlNO
         22kILURY4+CKYKBE9XyTa/p5TlRt25wIoctoqejOARgFjd2W8Wp8k27X8uIwGZIkNz/I
         FkehMXVaI7ghPs3WP5NNYliPyxwuNCIUBWV7H2VxdxQpo2lPrIgL1Zb3MReI4L3Micyw
         rv1JM+yvM6HB1dWdfbOXe0HSxHLB2KXdWMTiBaJ7Z71sSevG6Rc+OMXQpRhEM3qZcyLc
         MJZfaIQBYTQDPmOiEabMF40HrOslcGCQ97dV1ttvskUeMDXlqh0SzJdlna1uBU/uKCZu
         Abew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PqTPhnZWWSI7aaZPpC+xELL83kKV2UGyYtjIddeA+HE=;
        b=bunSpdyrojpkjxogM9grtSolquUCJnSK9UMr7B2yk8c0jaiesDLi24dW+hG7yiVXkv
         DEzaCcu++mSFRWkTtH2WSYI6KNmw2lKwMoIGxw3GkfjIkEKJt1PLa4v72CTtjC75c6If
         NYZoI+rTnR1hEx0f9iiyyEQnN8hiBlX8miTGLZVpyYRTeDa6Vu9y6gOymarwFazLT7Fv
         Oc2UAWE47zzS6By86ufsy8mRoPCQNGP6u4F8uF47nad+wBBAnBQn6sbLm2Fh5Q8tRIWv
         tyT4joSNLb7HB/mFZwOT237sn3Z+QybDuUA9MIaM40/suXvAlRv56boSPKH1EnOfHn7C
         2tww==
X-Gm-Message-State: AOAM530BW1Im6HVt+M/h6bW6XULDfhi46BoRiggKe7KmM97cT2F4aX94
        bfyBY3RQrhvDKkuvzKQE0kP80ajicL+BmhWhJZ8=
X-Google-Smtp-Source: ABdhPJyil3/Y4/MEwYq4e9TpWqscZQDReM8TqFCTgf0g+O7x+5hVA0udsrU+qd3+XBdQxBtQFFztlu5DaK1IREZ2Cjk=
X-Received: by 2002:a17:906:6a0a:: with SMTP id qw10mr18609747ejc.141.1635864371916;
 Tue, 02 Nov 2021 07:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211017162337.44860-1-kitakar@gmail.com> <20211017162337.44860-4-kitakar@gmail.com>
 <20211102130245.GE2794@kadam> <CAHp75VeThcCywYZsrUNYSA3Yc3MjJwfiCBCGep1DpWFFUg71cw@mail.gmail.com>
In-Reply-To: <CAHp75VeThcCywYZsrUNYSA3Yc3MjJwfiCBCGep1DpWFFUg71cw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Nov 2021 16:45:20 +0200
Message-ID: <CAHp75VdnvxCWYrdrBqtSDP0A2PCT6dYvHAhszY9iH9ooWKT49g@mail.gmail.com>
Subject: Re: [BUG/RFC PATCH 3/5] [BUG][RFC] media: atomisp: pci: add NULL
 check for asd obtained from atomisp_video_pipe
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Tsuchiya Yuto <kitakar@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Alan <alan@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 2, 2021 at 4:44 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 2, 2021 at 3:10 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > On Mon, Oct 18, 2021 at 01:23:34AM +0900, Tsuchiya Yuto wrote:

...

> > Run your patches through scripts/checkpatch.pl.
>
> While it's good advice, we are dealing with quite a bad code under
> staging, so the requirements may be relaxed.

To be more clear: the goal now is getting it _working_. That's why
this kind of noise is not important _for now_.

-- 
With Best Regards,
Andy Shevchenko
