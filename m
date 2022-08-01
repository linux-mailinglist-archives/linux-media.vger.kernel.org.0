Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6884C586D56
	for <lists+linux-media@lfdr.de>; Mon,  1 Aug 2022 16:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbiHAO6c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Aug 2022 10:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbiHAO6a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Aug 2022 10:58:30 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884D43337D
        for <linux-media@vger.kernel.org>; Mon,  1 Aug 2022 07:58:29 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id kb8so6273961ejc.4
        for <linux-media@vger.kernel.org>; Mon, 01 Aug 2022 07:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Iu9tq3pnN5qo/a5o1A7ujyHn5rob+EWGoZ3UGPL3cR4=;
        b=WVEkJB0085Cwl2+++Ys2/UboVPHDaI9jxrhQy8D5v51u6KlFwfBA5jJAi8t4ZIzhVU
         h1HWp3u97772MYEYXnQQl1H78takYob2/165lo9gXW3BcDFhl+1SqGagQYf3cJrX9sEs
         kfOgZr31Ke7dtezNUGgLdb68mxqYwOhYbdzNKw/Lag2vHyvQornvmSiI+mAuM/weQ7DN
         YRgIcHgqupsOx0usx04OsyoVxeH3u5h49ZFTbqRjGBlOG6eYhlijJWpqMaqe/Nxi5sNE
         2Gv4m/i/kE4eCAdl8Hp0Pud5736pMLDmL2XYstw0xxJNz5LvOh+kPlIZd7Mgmx8RBcBa
         mrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Iu9tq3pnN5qo/a5o1A7ujyHn5rob+EWGoZ3UGPL3cR4=;
        b=PpJ8eGAN8zoctU0h5C4yrz02TCsyU7CO87hc62Kj7VgcFnHdTUcNDtMnR+ISLtlGGN
         P3HfbR4vMvUrqCG7cDKwnRx8YKKMt/0CoVd9SxekR2XysdSJLH/MLSaOejO4UiUg404P
         Z1Nv9/jsJyGxLCnrTp6JDAQFC44oc6b/i+hu9hhHM36R8C9WmH439XPBqsMtUm1H41nl
         rpmnjVoiBQR+si1qbiWAX2Q8CQbgewxX7Lk8AJfKtZWF8j5XKnK7DmB8UQ3QsmKyTDbC
         yXH9MxgiwWQSXvnG81kpxTsJx54tcDGtoo6L/1Iy+sDL+RS/K+ImYKzlhZWOhIgesEQr
         CTZQ==
X-Gm-Message-State: AJIora/6+k1l3lHICQO899hL5cYP1j+NHijQ+iSUn4tQXW30N3XHOXXA
        mGZYMnxrBdS+RahjB/qFYAn1uZ9XyCnaacQUalo=
X-Google-Smtp-Source: AGRyM1vbCk+BrlVXR8NJZX+F5SEAnDJwmIeRqMAZDS8q9yoyxZkslIBmGJbHxfGuf6wWpBzJFNeQRQm6zTQUUAbnROc=
X-Received: by 2002:a17:907:2dab:b0:72f:f7:bdd6 with SMTP id
 gt43-20020a1709072dab00b0072f00f7bdd6mr13418804ejc.330.1659365907979; Mon, 01
 Aug 2022 07:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220728114050.2400475-1-hljunggr@cisco.com> <20220728114050.2400475-5-hljunggr@cisco.com>
 <CAHp75Ve6-BQ_Ajst96cr=XvJGV247_FYLTHTz=nvTCC3NhQa1A@mail.gmail.com> <db2d74d0ab17b407223092c8e0e01784d36bbda1.camel@cisco.com>
In-Reply-To: <db2d74d0ab17b407223092c8e0e01784d36bbda1.camel@cisco.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Aug 2022 16:57:51 +0200
Message-ID: <CAHp75Vc2qWQXk-+0ath8zuTaGHmSG_ZiUYih=4rGeKx3_nmtsQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] media: i2c: cat24c208: driver for the cat24c208 EDID EEPROM
To:     "Erling Ljunggren (hljunggr)" <hljunggr@cisco.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
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

On Mon, Aug 1, 2022 at 3:07 PM Erling Ljunggren (hljunggr)
<hljunggr@cisco.com> wrote:
> On Fri, 2022-07-29 at 17:51 +0200, Andy Shevchenko wrote:
> > On Thu, Jul 28, 2022 at 1:53 PM Erling Ljunggren <hljunggr@cisco.com>
> > wrote:

...

> > > +       usleep_range(WRITE_CYCLE_TIME_US, 2 * WRITE_CYCLE_TIME_US);
> >
> > Sleep even in case of error? Is it required?
> > (Same Q per other similar places)
>
> The i2c transfer may still have written some data, and we need to wait
> for the EEPROM to update.

But in an error case you will leave EEPROM in an erroneous state?

...

> > > +       static const u8 header_pattern[] = {
> > > +               0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00
> >
> > Keeping a comma at the end is good anyway.
>
> This header pattern is fixed to 8 bytes, and will never be more than 8
> bytes. So I don't think think the added comma is necessary.

It's minor, so up to you, folks.

> > > +       };

...

> > > +       state = kzalloc(sizeof(*state), GFP_KERNEL);
> > > +       if (!state)
> > > +               return -ENOMEM;
> >
> > devm_kzalloc() ?
>
> This will fail if the device is forcibly unloaded while some
> application has the device node open.

I'm not sure how it's related. Can you elaborate a bit, please?

If you try to forcibly unload the device (driver) when it's open and
it somehow succeeds, that will be a sign of lifetime issues in the
code.

-- 
With Best Regards,
Andy Shevchenko
