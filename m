Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0E136DC536
	for <lists+linux-media@lfdr.de>; Mon, 10 Apr 2023 11:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjDJJj6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Apr 2023 05:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbjDJJj4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Apr 2023 05:39:56 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAFB41FDD
        for <linux-media@vger.kernel.org>; Mon, 10 Apr 2023 02:39:55 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id a23so1834014qtj.8
        for <linux-media@vger.kernel.org>; Mon, 10 Apr 2023 02:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681119595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6I6hXg7RWCwulMV0yHvWMgd43aePZg6bbcgwgcjMizk=;
        b=WgPTe4BZo/hCISDLBprIVQ8b/PDKqWkcYUjUUSIswUbyPNQ8ieiQ1hcI55FiahVyr2
         +5UH3Lf+xngimCbbm//VUIVJxeE/TdhVv2eIUfGapWrSayJmo/oz1ObXCgXpEsaTgOFc
         Wuh7G2ipdNTL4+JjYdLlSchgop3uNWtN/LN+9vo1jETgSKcYiL+0fZ9LcetWwCBxgJnL
         ATPb+Rd7UnS3w+Lu11t42vbRi9+dA03lzMBaPYrWB8skMMl5BnB4Y97Tl+iuhtt6AGxy
         rCTqU7eHFc7Tr/eSjVIQiA1SdA87hf1fx2MxVbaeOQu1PPgp7xVmEAS0FACJc9z5lSuH
         zqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681119595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6I6hXg7RWCwulMV0yHvWMgd43aePZg6bbcgwgcjMizk=;
        b=liJ6Z5mRcVyaCzleP2fY14GdrB64okatf47gOr0hrfCWydxPe9YZtin1rhXubVFPrP
         82OHdxsyEyzye2MuxukfQfiZ0qXH3NTKKMVoGVkAQtzI+tXnEeiqwMClokT2lLAg8Db1
         SsuCurbNvNAL0sAPPxwa0V7V7ihy+5P/5yz3oQegtEQCLJj8I1wSpY8f/xkFCnqI08NX
         lxsRV1JyWiijVtyzEg6bzCdWhLe6AJuCxohapWxw/ZmjMlINZH345Sf/kdLr6xfhOX5e
         zbJSKIMHPKuxo278ifgXcnQjQq+9Vd4DJPHq9HICgZoA/G3080EgWuvcUFqubEzZVNNE
         lWnA==
X-Gm-Message-State: AAQBX9cYqjruYpY3ZmAjsNbkNsSUBc4jp5nYfyuYchfB33upfUk7OgBP
        TqlC9ftM8iHEMXJ4hqVbODrXQFQBu8AThYO6Whx/rS9lI7A=
X-Google-Smtp-Source: AKy350YctdRl3MORz6dRiJYAJzeuWY+WjYBvQ0nv5cKhv8ZDzQiRymyUIGdkPOBQjqHdDa3T2QYBAegNny5nkFKTBG4=
X-Received: by 2002:a05:622a:152:b0:3de:d15a:847f with SMTP id
 v18-20020a05622a015200b003ded15a847fmr3753837qtw.0.1681119595000; Mon, 10 Apr
 2023 02:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com> <CAHp75Vd8kcr0YCU7_oCSc8YqW5ZarP4RpQLexGV10A-auZi=Fg@mail.gmail.com>
 <ada1cc14-3607-a48b-cdea-7d72ba4db3d1@redhat.com>
In-Reply-To: <ada1cc14-3607-a48b-cdea-7d72ba4db3d1@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 10 Apr 2023 12:39:19 +0300
Message-ID: <CAHp75VfHsh9-ZUagxRCRfRs1+QF1eJjWggy5PLgLj1sWproksA@mail.gmail.com>
Subject: Re: [PATCH 00/28] media: atomisp: Further sensor rework + exotic
 features removal
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Apr 9, 2023 at 4:09=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 4/2/23 21:13, Andy Shevchenko wrote:

...

> Thank you for all the reviews. I've pushed a new version
> addressing all your comments and adding your Reviewd-by to:

Reviewed-by?

> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=3D=
media-atomisp

This is what answers my question in the reply to patch 28 I think.
I'll refer to this branch for AtomISP latest code.


> I'll send out a pull-req to Mauro for this, wrapping up
> the atomisp changes for this cycle.

ACK.

--=20
With Best Regards,
Andy Shevchenko
