Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12A886F455A
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 15:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234420AbjEBNnB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 May 2023 09:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234536AbjEBNmi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 May 2023 09:42:38 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8787283
        for <linux-media@vger.kernel.org>; Tue,  2 May 2023 06:42:04 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-b992e28c141so5436034276.0
        for <linux-media@vger.kernel.org>; Tue, 02 May 2023 06:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683034904; x=1685626904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZF8J2g+vdvWtCVolMm0ili3y/hj63QFvGzYxEo1evOQ=;
        b=K4mxB7SNYb+Z6lQBW6HSulhBefj5w8b3cj7vW4dHxDUA+ZH9uzESHELQTe/b9Voij4
         56RN86llpvpV5X6D3OhSuFer+0W1wX0ppSjSkVs2zmTc1oW921xCd5PjIGBxlSG+mNr9
         y7i5ksPp3fmbwRh7baentLAAF7dv0oa4PBzcX4njTOuWNrvaaVGHE+UzBWTfSvLVmCpH
         XcJl959jWOgMNj6RaOfz9HnGvPGh1RUHkdMtVMO7am488pQbIK8wNtLIH312c5jMV0o4
         tgqF2omPx7GZfvAzuPtiYouUUl+7XzUHGRzP32VmnGOL7d81HdDb0nYA4CNRlzCbfUQV
         7pEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683034904; x=1685626904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZF8J2g+vdvWtCVolMm0ili3y/hj63QFvGzYxEo1evOQ=;
        b=bq/n8Q6e1J8lSSuOMeTFZG1VvNmkxf8PlWJdVYotkjhVbzCeS95okPkYGp6/HKxeWp
         WC8jAUB1EOHsiN/jd10MaukXAUqL2rvZ++Vhyaakzm00oA5DEk3lvV5cdNwlCSx9ap6E
         jnIiQRyxAvpnbzs5B1Ypd5nFc+/LKp6tRYyg0c7lNcVbxA+YMKUAWItdYEChTHoEdUN4
         iMXQseSaZFeeO9IFX2LDn3Qt3zISEIBdfjkDPt7yyRJZ9qoGbwvAUEboYeXgBnX3/M1a
         7TWc7BOZa7778FQP8foJ3RT2dN3arsluOcsZVQZd8yKsG9FwJjDWOttHUIlgpccZbFLz
         uvRQ==
X-Gm-Message-State: AC+VfDzV8wwVj2GqJs/kBXc2H+BGo2aKLMN81dzrvAx2gF1Ry8X0T7fo
        wSbIDBiAyyk1YQp4YiKepZVVZfE+QjBexntb6EI=
X-Google-Smtp-Source: ACHHUZ42iO6PrUoNvCxmFys6f4l96/PQVgewVnx2B7DBRAejKdTn5YjoSjpa51Wd2+CpB1WYUYWzvsAsLIgx98PG+ag=
X-Received: by 2002:a25:b1a3:0:b0:b92:4703:8cf5 with SMTP id
 h35-20020a25b1a3000000b00b9247038cf5mr17037166ybj.50.1683034904563; Tue, 02
 May 2023 06:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <893a7e34-1d98-23e2-4d27-d25cb3ee5bf0@xs4all.nl> <9d4c52eb-103d-e89c-bba1-89cac0e53600@collabora.com>
In-Reply-To: <9d4c52eb-103d-e89c-bba1-89cac0e53600@collabora.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Tue, 2 May 2023 15:41:28 +0200
Message-ID: <CAPybu_1paGZaHBhLPuhc1m50xd2vB0NRtj73nrdzDTvkZuhO+g@mail.gmail.com>
Subject: Re: [ANN] Request for Topics for a Media Summit June 26th
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
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

Hi Hans

I would like to share the progress on KCAM from our end. It should
take much less time than last year. Guesstimate than 15-20 minutes.

I am also trying to collect all the requirements that we are getting
from vendors regarding V4L2. Guesstimate 10 minutes

I am also very interested in some of the other topics :)

Looking forward to meeting in Prague!




On Fri, Apr 28, 2023 at 10:52=E2=80=AFAM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> Hi Hans,
>
> W dniu 3.03.2023 o 15:44, Hans Verkuil pisze:
> > Hi all, >
>
> <snip>
>
> >
> > So if you have a topic that you want to discuss, just reply. It would b=
e
> > very much appreciated if you can also add a guesstimate of the time you
> > need for your topic.
> >
>
> I'd like to discuss "Stateless encoding in V4L2: Trying VP8".
>
> I envision the discussion around these topics:
>
> A)
> - Introduction to stateless encoders and previous work in this area
>
> https://github.com/bootlin/linux/tree/hantro/h264-encoding-v5.11
>
> https://lore.kernel.org/linux-arm-kernel/20230309125651.23911-1-andrzej.p=
@collabora.com/T/
>
> - High level decisions
> - Rate control
>
> B)
> - VP8 uAPI
>
> C)
> - Challenges
>
> About time: Let's try 45 minutes. But of course it is only a guesstimate.
>
> Regards,
>
> Andrzej



--=20
Ricardo Ribalda
