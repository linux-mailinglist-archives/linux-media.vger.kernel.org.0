Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63469587CA1
	for <lists+linux-media@lfdr.de>; Tue,  2 Aug 2022 14:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236262AbiHBMtt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Aug 2022 08:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231797AbiHBMts (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Aug 2022 08:49:48 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDC863BE
        for <linux-media@vger.kernel.org>; Tue,  2 Aug 2022 05:49:46 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id uj29so12596674ejc.0
        for <linux-media@vger.kernel.org>; Tue, 02 Aug 2022 05:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=WRSw/Ef6cXIopBGWBWtWJdmsG5JJDeZWMkiq8oBxyRU=;
        b=GjOltu1zUqd6hso2lnCoShfP6hAOR46lNHMYEePc+BnnamsxHEYg7+9bk/Jjxd7G2r
         0pakTEQcRA8+jaOOfDPEWfJliRtz4mE14EsJPMxc7k6AcB0fBwecATbdOxCrwFWvjv/l
         +2DnXXFWC9TH3rtL3K3sLBwJHUiR3HKirFkmCyJ7VP5ZV/XXfm2fYPodDGc6r9zPFxfx
         87yCaAzt1bRhvTpNvhQuTV+nLttPSav7vOL1iFPpr6hKAHFC0xFMIjFS8+z7+Op7HHmV
         CAq12ZFSqmo6y6HkjQcUGJ6XvhS9upJkaMTN76K+7xnQIkcxyLPIc4jDMCkJw6/N3jiQ
         +zYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=WRSw/Ef6cXIopBGWBWtWJdmsG5JJDeZWMkiq8oBxyRU=;
        b=Ulw2HIbCxHyB2T5Rxa3rNvm6qTRRYu/0RYsxYNgnCcpRgLDGFkHOrDzU3tWuWeyxyZ
         YVuHFUAVmwi/LiZn1e/2dRbi+UjmHespBrdJhNbogpiXa1pAL2sbTdibIIKHzEItz74U
         vsU5k81+/mxH954J0oz3yw9ftlff7Viczx6UCKI9JEgLabZWbgFOx4dR4D9rU/clYBax
         FwfmY153e+KJcUshKcIzTznjlxFkpG5jyePR4+NoXfLnXt8vXpnVBARdFIFPPMnuadZF
         zH+qnAIOA5vDq1odzBb7GnJ6lg0EKlpOaxU+BBYRSo0FbUm6G+v5rISXaE8MePQ9FfKU
         Qgnw==
X-Gm-Message-State: AJIora/kJCJVhStAe/ArmwaFuAqvcauTgzrO1WK5o6GK73nTQW9qskKG
        Lc2seEjDyrxEyhB3/u2i9YcMD479Lf3izZ17GVM=
X-Google-Smtp-Source: AGRyM1tqj2FjAyfFIN/PD43v2D2V9U/jkvT3fJHgYUTWvVlLSnDYKRPTUFRwBPLjKBekTUzg7OLw7Sfdcv0AJq6Zo3M=
X-Received: by 2002:a17:907:2dab:b0:72f:f7:bdd6 with SMTP id
 gt43-20020a1709072dab00b0072f00f7bdd6mr16919117ejc.330.1659444585155; Tue, 02
 Aug 2022 05:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220728114050.2400475-1-hljunggr@cisco.com> <20220728114050.2400475-5-hljunggr@cisco.com>
 <CAHp75Ve6-BQ_Ajst96cr=XvJGV247_FYLTHTz=nvTCC3NhQa1A@mail.gmail.com>
 <db2d74d0ab17b407223092c8e0e01784d36bbda1.camel@cisco.com>
 <CAHp75Vc2qWQXk-+0ath8zuTaGHmSG_ZiUYih=4rGeKx3_nmtsQ@mail.gmail.com>
 <b426bd08-6c52-3891-9319-b6cc52bdfbab@xs4all.nl> <CAHp75Vdtv6qtjxACA+nET2wyzHpHqxvPeZ-KhRWSByGtH4T5TQ@mail.gmail.com>
 <5d3fe43f-5615-137d-b712-f6c9079460cd@xs4all.nl> <CAHp75VfWhzz4jzyQAD4UYTN8dBWiKsvimKOPiKozGyNd2_oj=A@mail.gmail.com>
 <CAHp75Vd60urVv5R+fE+xxqMNJhJSmXZnfJJwU5t-m3E_T+pcWA@mail.gmail.com>
 <CAHp75Ve87Pvh-ZGHA=wK+ex9kq58FusA-p1EtVzdwKO_3MRyOw@mail.gmail.com> <390ab4ac-ad6a-5bef-349b-379ef772afa1@xs4all.nl>
In-Reply-To: <390ab4ac-ad6a-5bef-349b-379ef772afa1@xs4all.nl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Aug 2022 14:49:08 +0200
Message-ID: <CAHp75Vfqn0oUUvFGu2SegRBRPLpxazXVT5_pNmcD8FUi2_fjuw@mail.gmail.com>
Subject: Re: [PATCH 4/5] media: i2c: cat24c208: driver for the cat24c208 EDID EEPROM
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     "Erling Ljunggren (hljunggr)" <hljunggr@cisco.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "jonathansb1@gmail.com" <jonathansb1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 2, 2022 at 2:45 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 8/2/22 14:26, Andy Shevchenko wrote:
> > On Tue, Aug 2, 2022 at 2:23 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >> On Tue, Aug 2, 2022 at 2:21 PM Andy Shevchenko
> >> <andy.shevchenko@gmail.com> wrote:

...

> >>> You are blaming the wrong man here, i.e. devm. The problem as I stated
> >>> above is developers who do not understand (pay attention to) the
> >>> lifetime of the objects.
> >>
> >> That said, the devm has nothing to do with the driver still being
> >> problematic for the scenario you described, no?
> >
> > And the cleanest (at the first glance) solution is to make v4l2 to fix
> > this bug by suppressing unbind attributes when the device is opened
> > for all v4l2 subdev drivers, and restore it back when it's closed.
>
> Why would we do that? The patch works in the scenario that I described:
> the memory is freed in the struct video_device release() callback, which
> is called when the last reference to the video node goes away. This is
> standard V4L2 framework behavior that works great in the case of a unbind.
>
> Without devm_kzalloc it works fine, even when unbind is called. With
> devm_kzalloc the unbind attributes would have to be suppressed. I see no
> reason for that as media maintainer.

I'm not sure anymore that we are talking about the same thing.

Your driver allocates memory with kzalloc() in ->probe() and frees it
in ->remove(). How is this different from the lifetime of a devm:ed
object? If what you said is true, than driver is still problematic,
since ->remove() frees this memory the very same way at unbind call.


-- 
With Best Regards,
Andy Shevchenko
