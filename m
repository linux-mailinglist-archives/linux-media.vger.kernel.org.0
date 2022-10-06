Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87DD65F670F
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 15:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbiJFNBc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 09:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbiJFNBa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 09:01:30 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 413C797D73
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 06:01:28 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id bj12so4310032ejb.13
        for <linux-media@vger.kernel.org>; Thu, 06 Oct 2022 06:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=HFc7f2WKa/j1PhUI19mVsKIdUn9komv6x1mgVqD/NT4=;
        b=EXoj9b7Aa9Ba+5E5K8Rohf9GP+kFGcBOceuZprMTxgGU9GSVc+riIajgVcxyQzBFs8
         IE6RNmEwTkVU4iL1EF1dorXC13JsffWH6I35CaA31DZg5XL1MyTlemu9WUDCDBIpniEI
         2jwh+1slMaLfEL2y3wfP86lcWk6nY1pWTBnPlFKJ60WxX6nyZACgg56owQF+oMmA16Nx
         QXnzbxuzUbOcp0YkjJmBL7jPHJV8Sh88SJwiDvv3kIaBzb5yfAsu9YNuFzgNxsjVLoUS
         2KpB3JNVVnrGHjUTd0FQTG8anHIKKLewKjDbp7T/r/0WyTuo6R8BQAtSoMj3VU7hY9WJ
         GLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=HFc7f2WKa/j1PhUI19mVsKIdUn9komv6x1mgVqD/NT4=;
        b=e4PKTrcuKJHQCL/cjZTEbt7+4jusC/iPFsLWBriWcWICqwqqPvOshPJ1DbAjt6Hob8
         ZnESKNcWuhUDCsiPtidjUk7AKDxzHBYEgtpf3RBfCO9oHj7rxWwrbkpe+aQ6Mrqr1IEh
         BeY7p/TYua32xfS67GMe3ads5INXiqZurM+TfPvsIXiWdKp+IvBLV2qDpCm5tw8Bz2qy
         v674y03sPicwYvBgs3goUcoqtjLcTnheqpZYasvmaj7/i1wGKvN/X5mUSclCthIoC/kK
         L0AxsYxcxfSPHZ4ImMlwUpZCk46jQcqJGHQUDcoxvGRRR66yNYSfuZlTBuvo/pMItOU1
         btMQ==
X-Gm-Message-State: ACrzQf2q+SLb6ifJhsR9VqcrEX3WmsuqTO5xNGD9cqOb0CmoOFtaBb/q
        Lac4jAiNMlrw0/vvpyeYC1K0596YrwdaNzudcNKxAw==
X-Google-Smtp-Source: AMsMyM6AN3YA1YVvvF+FqLh0kGwuupc3asOwVb7PwZIcip5OMYy7cSVwNtbYeNFEHYZH+w/tzVEcGQb8c7CSnVLqX40=
X-Received: by 2002:a17:907:1c98:b0:78d:3b08:33ef with SMTP id
 nb24-20020a1709071c9800b0078d3b0833efmr3912008ejc.175.1665061287512; Thu, 06
 Oct 2022 06:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-7-dave.stevenson@raspberrypi.com> <20221006092319.x4nc5p5y3c7oqyc7@uno.localdomain>
In-Reply-To: <20221006092319.x4nc5p5y3c7oqyc7@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 6 Oct 2022 14:01:09 +0100
Message-ID: <CAPY8ntBF_VhYsUSL3=HDCHK=smgGXXrrq7tYn7MwSL2wJNLcFw@mail.gmail.com>
Subject: Re: [PATCH 06/16] media: i2c: ov9282: Correct HTS register for
 configured pixel rate
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

Thanks for the review (missed responding on my first pass)

On Thu, 6 Oct 2022 at 10:23, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Dave,
>
> On Wed, Oct 05, 2022 at 04:27:59PM +0100, Dave Stevenson wrote:
> > The calculations from pixel rate, width+hblank, and height+vblank
> > do not give the correct framerate - it's half the speed it should
> > be.
> >
> > Whilst not documented as such, the TIMING_HTS register (0x380c/d)
> > appears to be in units of 2 pixels.
> > The default is 0x2d8 (728) which can not be valid as-is when the
> > frame is 1280 active pixels wide. Doubling to 0x5b0 (1456) results
> > in the correct timings.
>
> Not sure I get this one. If TIMING_HTS has a 2-pixels units, won't
> 0x2d8 be correct (as it equals to your desired 1456 pixels) ?

Bad wording by me.
From the datasheet the default register value is 0x2d8, which is less
than the width.
Treating it as 0x2d8 * 2 = 1456 gives the right numbers.

> >
> > This driver isn't using the default frame width + hblank, so
> > use 0x02fd which is half of the width of 1280 and hblank of 250
> > which is reported to userspace. With this the frame rate calculations
> > work correctly.
>
> So this patch is basically changing the default vblank from 728 to 760 ?

Again bad wording.
The driver was using a value of 0x5fa intending it to be 1530 pixels.
(As discussed later, this is due to the driver using non-continuous
clock mode, which needs an increased hblanking).
However as the units are 2-pixels, the actual value required is 0x5fa
/ 2 = 0x2fd.

I'll reword this.

> Should we rather move the per-mode blankings to the mode definition
> and program them when applying a new mode ?
>
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/ov9282.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index f7823d584522..1cd6cb4addfb 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -242,8 +242,8 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
> >       {0x3809, 0x00},
> >       {0x380a, 0x02},
> >       {0x380b, 0xd0},
> > -     {0x380c, 0x05},
> > -     {0x380d, 0xfa},
> > +     {0x380c, 0x02},
> > +     {0x380d, 0xfd},
> >       {0x3810, 0x00},
> >       {0x3811, 0x08},
> >       {0x3812, 0x00},
> > --
> > 2.34.1
> >
