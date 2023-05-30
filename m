Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70BA4715E3F
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 14:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbjE3MAD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 08:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232213AbjE3L77 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 07:59:59 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA1B184
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 04:59:36 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-75b3645fb1fso283471185a.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 04:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685447975; x=1688039975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvO3o41wpE7tIuz+7/RXzUDRymm5mGnkid1kFHuadJE=;
        b=cHOZ30EAG3gJjjLD83nNTuruiaWLYedXYd8HJfj7x6S3xLBv4qZv3tA4eGuWTXlC7o
         aTQaN8OqouSROdf54ehfhNO2ySKkTUFdP+n4xVJtRi+VpSaOBsftNK2ayik4Vjzq7D/H
         2/A9f0fT5Ol//2yyon6Dj0TFC2IV1frSAvl37pxC5gf2Enj1i51QEauOIaClB5IRZtzp
         haDafk01ekEvw/3SxykUX++2zZG/GImvCtVSznC/yQLyRXrK00VA5IsPkD8c1ZtAU04I
         LHN3OVO5kyS1Je6F/liYr6R0/+xXCi4BjJ791SMCm4gxJHikedXDnt1tqwDo04Rudc2m
         htHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685447975; x=1688039975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvO3o41wpE7tIuz+7/RXzUDRymm5mGnkid1kFHuadJE=;
        b=dvpwuFdb9Zr+oRLpS2a9ydH+C1uoziOzXDAynQzTkN1Rr04NDfgJycJqftAL0xLEvK
         soJwJ1xrxXRF0nbL/qXZ8ilnAll+GotJ0Xj9qTqJf3I/VmIiG2eDDDXxgwUkJiKjsC1/
         1M4oghLB7mPizGEtwyVkr6QYd8sDCfZcH+QJuK8q7DOEJ3D6sKwbmaDYdeRDlm+gryIF
         EhbdjPSdIEkb+rLAVFnTRTxRrm9Gsh/M2yRExG4dVQ9GqqkP4OJoh3t1tlzYIdWeriGU
         5YpNSRuXTXOWYqoCGAmTgqmBlVTY4xOFR08XxJMWkpvd1HK0fAmrkDYABqZJyyBSkCH7
         FXSg==
X-Gm-Message-State: AC+VfDw8wIN57efWzKexr/Ot+0PPR1/eCxWDFoPcHXjWZnD1o2a9Tf7t
        /H7dODyzX29rgob/ITbo3mysigBZz9yBKRC6p+M=
X-Google-Smtp-Source: ACHHUZ7tJCKsJWv8pQBfp9Iu4AIhSNsoEXZ+nAYEusqljIifxLZWK34KK1ldKNy4eNamGzT8wJdnKSyCk5R/OR/lXSU=
X-Received: by 2002:a05:6214:2305:b0:5dd:5c8d:866f with SMTP id
 gc5-20020a056214230500b005dd5c8d866fmr10857874qvb.23.1685447974993; Tue, 30
 May 2023 04:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-15-hdegoede@redhat.com>
 <CAHp75VeCfTjw_Lu5SUx6u-O7QtFe2QXvCy2wZLSajJi6WDFiwQ@mail.gmail.com>
In-Reply-To: <CAHp75VeCfTjw_Lu5SUx6u-O7QtFe2QXvCy2wZLSajJi6WDFiwQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 May 2023 14:58:59 +0300
Message-ID: <CAHp75VdsCQ3g+OtfUdUgQ-3eor66Y=6Qpg5S=bn923Zt+B46XQ@mail.gmail.com>
Subject: Re: [PATCH 14/21] media: atomisp: Refactor atomisp_try_fmt() / atomisp_set_fmt()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 30, 2023 at 12:05=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, May 29, 2023 at 1:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.co=
m> wrote:

A couple of additional comments (based on the branch contents).

...

> > 2. atomisp_set_fmt() starts with basically an atomisp_try_fmt() call,
> >    except that the only atomisp_try_fmt() caller: atomisp_try_fmt_cap()
> >    adds the sensor padding itself rather then letting atomisp_try_fmt()

than

> >    do this (duplication).

...

>   bytes =3D DIV_ROUND_UP(br_fmt->depth * width, BITS_PER_BYTE);

It's actually NIH BITS_TO_BYTES() from bitops.h.




--
With Best Regards,
Andy Shevchenko
