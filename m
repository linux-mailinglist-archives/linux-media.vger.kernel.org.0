Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 204C24C575B
	for <lists+linux-media@lfdr.de>; Sat, 26 Feb 2022 19:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbiBZSP3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Feb 2022 13:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbiBZSP3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Feb 2022 13:15:29 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF92DFA23F
        for <linux-media@vger.kernel.org>; Sat, 26 Feb 2022 10:14:54 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id x5so11716476edd.11
        for <linux-media@vger.kernel.org>; Sat, 26 Feb 2022 10:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gHhV0BN7XIEwjoJSx4cFYz2utmuN4/qOahjHcvfzRYc=;
        b=S4xOXKr8xL6bWFrx78/Hp4H/80Y8ILcD/xe8pPri+NMDE5ow2HL/I7CzTbRkOKjfz0
         u0vCFSof0JB/bvrXF5O4NPGmnECtJRH210eL3dJBqQKpOTgTzGrwJ+l5fYlk6kHVdWFy
         r/gaTA4jqyMZNrgIIHiWsDgyDhodcK9DagLzZdNhoM+937C5QZOj/kPM0EaTCojf66Uu
         djcImXdaQ5d2oIOeGYlSPP/Td8hQcyWhnfFG5AFqSBl9g6Wb8XQlVhPjtUb+/SA2cvV0
         BEugFPRW+MPh4EXZc+42HRT4CK6Pd8IOh11+5bB3UR2WbY5aUJlmesZ36TQsESXiuNMk
         Gyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gHhV0BN7XIEwjoJSx4cFYz2utmuN4/qOahjHcvfzRYc=;
        b=WcsvN8kwdyKUnquY5APwq/LoFfoKxzs8K0YKp00xPJPEdpfxrf99k+uKSMvLlGcgAD
         rhED2ypL97A7pc85tpIKNlnD72ZEPL1xbWMbGuUMfZz4q4rDgpUcSWIvtLl2yIl9o1T+
         G2Gsg0Pix9WofnW6aO8Q0ihQbfuDRp76rYVy8rxsfhexX/3APdOyMfSvr2H+oxTHvdEt
         dOYS1p2i2gPPxfNKThy7FMjCjMI2Y9ljD55jbuMhXG36As52+nNUQhPOHQsSCNSEIIhu
         gd4KIVPvq7mhxt241zdVQSzHwNsz6LMkMqh8j5LN8Yd5YGV3gSSrr9BxFKiOXCYEOYQ/
         gxHg==
X-Gm-Message-State: AOAM531oxaDsTpmvf96a3HCiBQn/MobXXwHobJ0V8z0Grc4RLhVAswtF
        LOekHKXEJdPgDsCHk7BKh9zKcgx14tJ4+6NsOaU=
X-Google-Smtp-Source: ABdhPJzfpfRJr7L/1+Phwb9BGMDkoUXLN+Emv2dSFKzP4M56aRam3n9NTh4GhFfEZvwGXf5q+tRC+e8rmVOKJdhFs3k=
X-Received: by 2002:a05:6402:198:b0:410:83e3:21d7 with SMTP id
 r24-20020a056402019800b0041083e321d7mr12455820edv.159.1645899293248; Sat, 26
 Feb 2022 10:14:53 -0800 (PST)
MIME-Version: 1.0
References: <20220225000753.511996-1-djrscally@gmail.com> <20220225000753.511996-3-djrscally@gmail.com>
 <YhkKcRL57Qg/VWGO@smile.fi.intel.com> <25f6d78d-be76-5761-a7f6-2b07c18516ea@gmail.com>
In-Reply-To: <25f6d78d-be76-5761-a7f6-2b07c18516ea@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 26 Feb 2022 20:14:17 +0200
Message-ID: <CAHp75VfmvMdD1GSE62AvpjqEXx=DW1H+KuMNik+gpp2u0fkVnQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] media: ipu3-cio2: Add support for V4L2_PIX_FMT_IPU3_Y10
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Feb 26, 2022 at 4:06 AM Daniel Scally <djrscally@gmail.com> wrote:
>
> Hi Andy
>
> On 25/02/2022 16:57, Andy Shevchenko wrote:
> > On Fri, Feb 25, 2022 at 12:07:44AM +0000, Daniel Scally wrote:
> >> We have platforms where a camera sensor transmits Y10 data to
> >> the CIO2 device - add support for that (packed) format to the
> >> ipu3-cio2 driver.
> > ...
> >
> >> -    },
> > Why?
>
>
> Why have the open and close brace on the same line you mean? Its just
> the format that the other entries use, so I copied it.

I meant why you touched that line and as a consequence removed the comma.

> >> +    }, {
> >> +            .mbus_code      = MEDIA_BUS_FMT_Y10_1X10,
> >> +            .fourcc         = V4L2_PIX_FMT_IPU3_Y10,
> >> +            .mipicode       = 0x2b,
> >> +            .bpp            = 10,
> >> +    }



-- 
With Best Regards,
Andy Shevchenko
