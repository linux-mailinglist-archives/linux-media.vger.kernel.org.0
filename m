Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3C055C4D5
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 14:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240230AbiF1AzM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 20:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236425AbiF1AzL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 20:55:11 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B5A1D0D6
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 17:55:10 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-318889e6a2cso101554727b3.1
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 17:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ewB9tqDe857T8ggXZg8HbcwoNM7sv1R0ZyiLuOgtfYg=;
        b=RzVmkuc541YwM89IH6yZvCoRTtc4TomGLzax4GJJm+kYXo4kQYZGHZTvKBeD+2iHbD
         vsYdAqidl2sWspdIut+/c4Y6gztnDD8RemMAT7frEiMRCnNAr4dUC8dK2LuErDp33uQX
         /g5W5TpolWGGt6Apg0ZV1BFjvBFYsFSwh1roeHzgOEM33s0qsEs6feNBJpnr2CP4Mct7
         JcGAoewhP1n8VGCDNVP/iixz9yuJJDZvqCusICdSoEc2nn28mdvXuYzrh50rI/npeNBh
         yWrHmn21nbPR5vcpXaDmV3k8StPaWTw1na8sS7UzJN8cZtINZ14eYjg2Gahrg1r4wH/J
         9I4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ewB9tqDe857T8ggXZg8HbcwoNM7sv1R0ZyiLuOgtfYg=;
        b=BJZj+aqIEbjeGxjphth/EVLU+xZj2TZS6l+xl99wTQr9lEqAPvtOGwbGMkvhMVnezt
         wwc75XAGyf9NWZlMvgiopUWNL7Yw4FypIqN1K/oEwdeqLF8UKGW1xM37zC1xBlAT8BaG
         qZRBtLSdmeW9P7tKnW4rc4gqrsEk6kKC59OW7+frhooGqJfD5t0U/NWCi4IQiBDY51vy
         uv3gRYtEg2ussp7pJ9hj2h0OAm4jJriUDrwZC7je0ANYNtkcGjAa2KNJ8w5vkJmz0uNQ
         0dYDwXgSPhJoZyr9M7iGyTyXbjVszT3vQE4iuh+69lUYR+otVbIBCBrr6BCCL2zcnhWd
         0NEQ==
X-Gm-Message-State: AJIora/KoL9UqCObeyzvu8iWEsUxTbnZx+zztDBLE7oBQ2dHGqycnFBp
        RpGLZ4AKfsZmaKjs9MXyvBoE0B76ih3hNH0wXpLGDibGhHk=
X-Google-Smtp-Source: AGRyM1vG5S4ymQ9a5t7lMjCG6/iV5At9WAfaCtQDj3sXEaOTEpqMHLRfcbRxyVcsU4sQOaofM9kZ13fi/isKMxWoWAg=
X-Received: by 2002:a81:3210:0:b0:317:7755:749e with SMTP id
 y16-20020a813210000000b003177755749emr18290578ywy.37.1656377709911; Mon, 27
 Jun 2022 17:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220617015745.3950197-1-yunkec@google.com> <20220617015745.3950197-2-yunkec@google.com>
 <177345ff-f601-e440-31e0-2c967736af6b@linuxfoundation.org>
 <CANqU6Fed=E1ogvR1ccwJA9bR_9VxU4QPd6PjvBAyRrMeQuRWfg@mail.gmail.com>
 <610bc1b9-c013-46d7-4446-5a5eab4c2569@linuxfoundation.org>
 <CANqU6Fcspk-CWi3xYfUBg80vUWb1ZhJhr8G6YF9Nna6nrq_17Q@mail.gmail.com> <5ec4238c-080f-f2e6-9b30-6595f9afe92a@linuxfoundation.org>
In-Reply-To: <5ec4238c-080f-f2e6-9b30-6595f9afe92a@linuxfoundation.org>
From:   Yunke Cao <yunkec@google.com>
Date:   Tue, 28 Jun 2022 09:54:59 +0900
Message-ID: <CANqU6FcLNhMf4x=ie99vuPFUmk9vQYRhcjm6RnEQ8QWAZfs=TA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: vimc: add ancillary lens
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Shuah. Just sent out v3.

On Tue, Jun 28, 2022 at 12:43 AM Shuah Khan <skhan@linuxfoundation.org> wro=
te:
>
> On 6/26/22 7:30 PM, Yunke Cao wrote:
> > Hi Shuah,
> >
> > Thanks for the pointers.
> >
>
> >>
> >> Why is this necessary? How did you test this change? How could
> >> one use this feature?
> >>
> >
> > Add lens to vimc driver and link them with sensors using ancillary link=
s.
> > Provides an example of ancillary link usage.The lens supports
> > FOCUS_ABSOLUTE control.
> >
> > Test example: With default vimc topology
> >> media-ctl -p
> > Media controller API version 5.18.0
> > =E2=80=A6
> > - entity 28: Lens A (0 pad, 0 link)
> >               type V4L2 subdev subtype Lens flags 0
> >               device node name /dev/v4l-subdev6
> > - entity 29: Lens B (0 pad, 0 link)
> >               type V4L2 subdev subtype Lens flags 0
> >               device node name /dev/v4l-subdev7
> >>   v4l2-ctl -d /dev/v4l-subdev7 -C focus_absolute
> > focus_absolute: 0
> >
>
> Send me v3 with all of this information in the commit log and add
> this to document as well.
>
> thanks,
> -- Shuah
