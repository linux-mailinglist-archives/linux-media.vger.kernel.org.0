Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9207E68F25F
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 16:51:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbjBHPvI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 10:51:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbjBHPvH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 10:51:07 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BFD9742
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 07:51:03 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id lx14so1700967qvb.11
        for <linux-media@vger.kernel.org>; Wed, 08 Feb 2023 07:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0FCUAdP8fR8HGttmQ9FRjYswWv2Z/w5870k5xh2T9xE=;
        b=Z0vAmf8Wt5sM/ATT3uuyPoQCnJHEUTPXqlQvKzH5WkinYxQRZTvkMYCNjjIhDZqvKW
         4eOkr/MSyG8OFENquuYQC6Uw48EgEc/rPEvsekV3K2sYGdKA2B3/ME4RKLe2oaveIbJw
         h79kWuoSesE22XqQHX+8LtvO5EXc43jfv9W6hV3fuKfpq1+BUnJDYWJ5WEmqt2f9ETEh
         cKMyWIPh2S/VeqCFOpBM86Ic4VelX5uj0rz1WhwARPkyjtKy9cqOacotztcoeyNCEBh5
         wpdLQvD3OPyZrDUqkDE7K3ybW2TmslqRL8A0V2bZ1rqvhN6htkf5iaH1evfBxXDc/B96
         t8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0FCUAdP8fR8HGttmQ9FRjYswWv2Z/w5870k5xh2T9xE=;
        b=pJnHX09d2Hq50Vp0IIDDnUVdFcnkYelkXzJgqEZDv7XAjilwtr/ryaRYU3rpH+hVyM
         Fo/Q6kR5Sn020YPWg/3wnM5KoGlweeTl/s5o4dXtXnDu9HdwgaqxWyqKU6cKuB69kY78
         fVnRyjP1A9cwHIVQQQiUeB1i1tNeqvcXmGcweQvOv1yOnpsES7wf6fnfHnMoRDm7nWvA
         AmpyolHPi9ltrQfgJ4ZpcQGno2vVfjjJ9+8VdI/2pV/nrLNRfAveuR9oCrvH3guMWsif
         VGvdO+vPj5Dd8kzOa5k/bCobPvVbyWvkVNXsA8PxB6TMt3+0BlP6mK7Y1IQQLEhoXZNz
         dXZw==
X-Gm-Message-State: AO0yUKWVvSYAFPyJ/jsOTuOJ0MEYSqpeljslLOdfmgKkRhzTkS5k7jJ9
        HWP5Mncx/hm1hQdbTmckLiwd4XnNgllxR2XVRZ9ksNmpMfI=
X-Google-Smtp-Source: AK7set+EvCQEntsJ4kMRBwUZNsL+UT5UDeEFU32hz61aliMKZXDUg7gXm5BG2ssE7v//m3jeQEq8Wwbd2HcWAPuFfRA=
X-Received: by 2002:a0c:9d42:0:b0:56b:ebca:815d with SMTP id
 n2-20020a0c9d42000000b0056bebca815dmr715571qvf.57.1675871462172; Wed, 08 Feb
 2023 07:51:02 -0800 (PST)
MIME-Version: 1.0
References: <20230123125205.622152-1-hdegoede@redhat.com> <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com> <CAHp75VcyvON1-yoBsTsZDmjsA-527xyvF+weEXWcXjO3Y2hBrA@mail.gmail.com>
 <Y+PCulPVN7GGz2T7@pendragon.ideasonboard.com>
In-Reply-To: <Y+PCulPVN7GGz2T7@pendragon.ideasonboard.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Feb 2023 17:50:26 +0200
Message-ID: <CAHp75VcEaEwFVyAm1QijXjw0tF+D9JSr2JET0RJUNMea4nGMew@mail.gmail.com>
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
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

On Wed, Feb 8, 2023 at 5:41 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Feb 08, 2023 at 01:27:37PM +0200, Andy Shevchenko wrote:
> > On Wed, Feb 8, 2023 at 11:52 AM Laurent Pinchart wrote:
> > > On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:

...

> > > > Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> > > > versions of these register access helpers, so that this code duplication
> > > > can be removed.
> > >
> > > Any reason to hand-roll those instead of using regmap ? Also, may I
> > > suggest to have a look at drivers/media/i2c/imx290.c
> >
> > While this is a bit error prone example, a patch is on its way, ...
>
> The two cleanups are nice, but they're cleanup, not error fixes :-)

It depends on which side you look at it. I admit I haven't dug into
the code to see if endianess can be an issue there, but the code
itself is not written well, esp. when one offers it as an example. So
definitely there is a fix on the upper layer.

-- 
With Best Regards,
Andy Shevchenko
