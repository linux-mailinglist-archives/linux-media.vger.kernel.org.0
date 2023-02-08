Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59A6B68EDE8
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 12:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbjBHL2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 06:28:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjBHL2R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 06:28:17 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7189C28847
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 03:28:14 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id z5so20230829qtn.8
        for <linux-media@vger.kernel.org>; Wed, 08 Feb 2023 03:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J7YpfNmkAKeiQRbYqt6rvLG7n/PQqFPtfmCT30QU4IU=;
        b=HtYsaoBpdOlbY8Y/b0VGrVOb6VoCm0SqSgiczMXLiJaeTc+04jtzQMskjCYB5C5OcF
         GEXov6ehfj+3N27qvZJH1yGjVe4bS/LxnBeDqlup7mvtgnDiJGO/svLv5QaOUxvj9u1L
         snLUJWFulzRh0Jlse/Yx3IUPcXKOd1yoBUG4rNEy2Bd96CgegybuSzb2fgGFplwladqp
         VdBYtxQRUTCMYT1ER6bA4gHXGKAaqt3B5YpXQlFjA/VG9JBzivZioaOFTpVbqaMIMuPI
         pgl25io1KqoV+BCjj225IdxMROPdJxIFK5D9U7rnMndGcSCO5jfJc0lK+Cv4SKfqhkOU
         8qZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7YpfNmkAKeiQRbYqt6rvLG7n/PQqFPtfmCT30QU4IU=;
        b=WLLwokNmMTfmVQBeu0lIZE8WYn2kXNAFYQsDoW6Y/a/aVPLHjWFqR20pb7DacF6ZqY
         hy0oD+B0VfHCBayfvg7wINufEKF2hed8CqdDdD1hoId5a5xHUjrgxFffG+AfzepJcq1q
         rWylpX2ZsyQpTUkCD5Wo7/6dPwn4kOOMlceRsSUsfjASfc7xOZJpF8NuTYyNpqOOpFpt
         XSepO+2WjpwBpp0YZ6+msYdPuDr968Ov905yI8ago5GlftqJyirKKAfScb7IdAgamQ9/
         +dIgpzrKnBr3zguwDu2KZAAts9BS7BaeX+E+1lT4XnKyrXAEIbizEWxdsPCbkQZdQrYH
         6UeQ==
X-Gm-Message-State: AO0yUKV1QBUzuN4o1McPEu4RbxjcD94bfG8IGTvFHWDNL9AiNjOGEtM6
        /BdsLtnYAtSLlB99q6DtJmiRCiCGtEQ30h7XHZ0=
X-Google-Smtp-Source: AK7set8jaCUipbc0hNu7gRUHgc2ylVfsf9/2wYfCf3Q8JN0SrFk+CmXhpHcX3sA3e7jkR4OQup2uADLHUHAsZvZTHMk=
X-Received: by 2002:a05:622a:1456:b0:3b9:a4ee:be1c with SMTP id
 v22-20020a05622a145600b003b9a4eebe1cmr1241819qtx.391.1675855693515; Wed, 08
 Feb 2023 03:28:13 -0800 (PST)
MIME-Version: 1.0
References: <20230123125205.622152-1-hdegoede@redhat.com> <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
In-Reply-To: <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Feb 2023 13:27:37 +0200
Message-ID: <CAHp75VcyvON1-yoBsTsZDmjsA-527xyvF+weEXWcXjO3Y2hBrA@mail.gmail.com>
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

On Wed, Feb 8, 2023 at 11:52 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:

...

> > Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> > versions of these register access helpers, so that this code duplication
> > can be removed.
>
> Any reason to hand-roll those instead of using regmap ? Also, may I
> suggest to have a look at drivers/media/i2c/imx290.c

While this is a bit error prone example, a patch is on its way, ...

>  for an example of
> how registers of different sizes can be handled in a less error-prone
> way, using single read/write functions that adapt to the size
> automatically ?

...with regmap fields I believe you can avoid even that and use proper
regmap accessors directly.

-- 
With Best Regards,
Andy Shevchenko
