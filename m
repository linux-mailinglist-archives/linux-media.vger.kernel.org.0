Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35A3555EF0C
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 22:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbiF1UPH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 16:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231925AbiF1UOg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 16:14:36 -0400
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D311EAC1;
        Tue, 28 Jun 2022 13:08:42 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id n15so21651006qvh.12;
        Tue, 28 Jun 2022 13:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mR5sN43E7PB78R0HG49Z2XtIx/iPqm5I3CT9aDr5U1A=;
        b=svSV3/neHaAGKJUby/pM4IFcIC1s61P1OSUfsSmyOFC4d1FemizH8lMEQRZts4fe1/
         vQ0OzgqfnaIb3l9FZOU4Y4N9S3HfT7jFrU6CA9fY1QDk06EJupA0CLNPa9aqgW9dJhSo
         kszDLHPu63Y470IdSeSoRxIgtiQ3PZ6U0mTbRZfd5EQ8Ju3G5lKg2gN8xaAPXKg5uDt1
         3VF6j2IvJZn+/w01iyleRW0zhrCYkRkpxSSax33CiHeB2FxLbzeC71AscPV4bD/QZlkA
         FU4gE/CNQLRhOZBGOH7lkQ3DERWwZl13KjQbHiCKEeo8BrZHkBxVRh1wDEX/YM6NNRWX
         P9XA==
X-Gm-Message-State: AJIora/e4ge118EyD30vS/9WAuxuzviAFjgGnApMsBEB3NY93rwbWQw0
        Ni66DYfiQ39nZsQ9y9bGWHkmp+Zw0Lr0uw==
X-Google-Smtp-Source: AGRyM1sOXNEPRbQQRO71EV1aIU0GtKBUND9DzNf4nv54wlaoQgCNnuFCS08b5t4O5k4cLLlbAWA1NA==
X-Received: by 2002:a05:6214:410e:b0:470:4609:c87c with SMTP id kc14-20020a056214410e00b004704609c87cmr5110330qvb.62.1656446921288;
        Tue, 28 Jun 2022 13:08:41 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id x8-20020a05620a258800b006a75a0ffc97sm11951638qko.3.2022.06.28.13.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 13:08:40 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id l11so24058707ybu.13;
        Tue, 28 Jun 2022 13:08:40 -0700 (PDT)
X-Received: by 2002:a25:3288:0:b0:66c:8a91:74bb with SMTP id
 y130-20020a253288000000b0066c8a9174bbmr20131416yby.89.1656446920367; Tue, 28
 Jun 2022 13:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <1651584010-10156-1-git-send-email-erosca@de.adit-jv.com>
 <YripkuWiMOcOl8Qu@pendragon.ideasonboard.com> <20220628190534.GA22969@lxhi-065>
 <YrtbgUhNS8Z1pgVA@pendragon.ideasonboard.com>
In-Reply-To: <YrtbgUhNS8Z1pgVA@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Jun 2022 22:08:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7HzbUime4EOhtzcRV2YSA44qJRFXvu0LNtmpzgBJzRA@mail.gmail.com>
Message-ID: <CAMuHMdX7HzbUime4EOhtzcRV2YSA44qJRFXvu0LNtmpzgBJzRA@mail.gmail.com>
Subject: Re: [RFC PATCH v2] media: renesas: vsp1: Add VSPD underrun detection
 & tracing
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Eugen Friedrich <efriedrich@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Jun 28, 2022 at 9:53 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Jun 28, 2022 at 09:05:34PM +0200, Eugeniu Rosca wrote:
> > On So, Jun 26, 2022 at 09:46:42 +0300, Laurent Pinchart wrote:
> > > On Tue, May 03, 2022 at 03:20:10PM +0200, Eugeniu Rosca wrote:
> > > >
> > > > Troubleshooting the above without the right tools becomes a nightmare.
> > >
> > > Having spent lots of time working in userspace recently, I can't agree
> > > more.
> >
> > Thanks for the feedback and for endorsing the utility of this patch.
> >
> > > > +static int vspd_underrun[VSPD_MAX_NUM];
> > > > +module_param_array(vspd_underrun, int, NULL, 0444);
> > > > +MODULE_PARM_DESC(vspd_underrun, "VSPD underrun counter");
> > >
> > > Module parameters are not meant to convey information back to userspace.
> > > This should be done through either a debugfs file or a sysfs file. Given
> > > the debugging nature of this feature, I'd recommend the former.
> >
> > It is a bit unfortunate that we have to go the debugFS route, since I
> > recall at least one Customer in the past, who disabled the debugFS in
> > the end product, since it was the only available means to meet the
> > stringent automotive requirements (w.r.t. KNL binary size). Anybody
> > who has no choice but to disable debugFS will consequently not be able
> > to take advantage of this patch in the production/release software.
>
> debugfs isn't meant to be enabled in production, so if you need a
> solution for production environment, it's not an option indeed.
>
> > If there is no alternative, then for sure I can go this way.
> >
> > However, before submitting PATCH v3, would you consider SYSFS viable
> > too, if keeping the module param is totally unacceptable?
> >
> > I was hoping to keep the number of external dependencies to the bare
> > minimum, hence the initial choice of module param. Looking forward to
> > your final suggestion/preference.
>
> sysfs would be my next recommendation. I don't think a Linux system can
> meaningfully run without sysfs, so it shouldn't be an issue
> dependency-wise.

Indeed, you can add a device attribute.
But as that is not a debug feature, the attribute must be documented,
and becomes ABI.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
