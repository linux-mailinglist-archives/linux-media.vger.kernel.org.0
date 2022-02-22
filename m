Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A91E54BF92C
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 14:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232283AbiBVNYU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 08:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbiBVNYT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 08:24:19 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470A76AA50
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 05:23:54 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id j5so9814631ila.2
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 05:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NG01V4rSNTZT33LEKpbidR/6EgoGpN6Ih9EymIaNT1k=;
        b=lIr9ibXZOUGTx1oKv9faCqb8e/UrOmAE/6Rtg6KdDiRWNi13dsYmIy5AMXr7dqDG38
         Ps9Q2BlretU0kOvAeBMDOvTceEnNSRbEyK7QkFAr9LsvOu1Fhtr0GjgJXr7bd5w3nbTW
         7PrFI24MDPOroJ7gbbpTlX072abxZNDqSjMrgFeGBiPeMDr8QR3MByDeV89RCkJMabW8
         u+dCZ0o9w9GsAAgj4DyB57W9dfTLEilFX09fgN+VFVJdwxjda7dFX6CnkkyhEgXQAs+s
         C2rdkFRGa1YTDFvyqTEiOHYuuzsrVncltLhFQe92l3agfYbc9aqhQnGUOYIiQszcDb/k
         TYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NG01V4rSNTZT33LEKpbidR/6EgoGpN6Ih9EymIaNT1k=;
        b=l+JrjEQfHMQ9Mw8WuCJhQz5bBInNDR7SQ7TuKJkHpw6HD4SPF/c7zG28wpCw0iZXPP
         Uvf/WidTfJiriuH6W6yiKrDzFWAQkPng8mum5n+UD3iC1fFr2I4C09NXlDEJhkINffgu
         q1V8JNaMUGrttu0dU8AF7AfekqUYk0fCZoB5daVeWaoaWk+SAQd7sgtcd8C4mJUCO9eG
         TxIJySZBDxOPYneL6nwnERT1lAeYqTV702knqdUvfhaxUa7CDWLqeI01/TMhpWz4asqX
         34wDnMnUso1ghL2MbMPx/ouOTaJNGXID1TVJ4mQfBht4XEQgoRIhy+3OsIAcuQDZ2xJx
         E25w==
X-Gm-Message-State: AOAM530aTcQFK3h/xEpCMYhFMsR0l5zV8HRyzJPsMiOlN6/LNLW9zm3B
        GubT/UBcKTgWjsUVmIuZI1FOO73S2iORYJdXmYY=
X-Google-Smtp-Source: ABdhPJxr666BIpbHEMeZhjBfPHSwvr9Ce6Q7TGWqXhbFTlceJBWxwMlsRPbWB0Rf46a01n2iACBd97/z8yxzNFqGaV0=
X-Received: by 2002:a05:6e02:17c5:b0:2c2:57ea:489b with SMTP id
 z5-20020a056e0217c500b002c257ea489bmr4966985ilu.91.1645536233640; Tue, 22 Feb
 2022 05:23:53 -0800 (PST)
MIME-Version: 1.0
References: <20220222063202.petjwwcfctzsbhxx@basti-TUXEDO-Book-XA1510> <5d5dee88-9dbf-e4d0-4a91-11ff4ecd82ea@xs4all.nl>
In-Reply-To: <5d5dee88-9dbf-e4d0-4a91-11ff4ecd82ea@xs4all.nl>
From:   Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
Date:   Tue, 22 Feb 2022 10:23:42 -0300
Message-ID: <CAPW4XYa92xJKaM1E4jdwdC=eJsyQhaJM0Qf_iQQYSO0==6j8ag@mail.gmail.com>
Subject: Re: Deprecated Maintainer entries?
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sebastian Fricke <sebastian.fricke@posteo.net>,
        Shuah Khan <skhan@linuxfoundation.org>, dafna@fastmail.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Feb 22, 2022 at 4:46 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> The same is true for VIMC where Helen was maintainer. Shuah, would you
> be willing to take over VIMC as maintainer? If not, then I can put myself
> up there as maintainer (but 'odd fixes' only, probably).
>
> I added a few collabora people to the CC and also Helen's email, although
> I don't know if she actively monitors her gmail address.

I am. I'm sorry for leaving the community suddenly.
Please go ahead and drop my name from the MAINTAINERS file, I can give
my acked-by.
Please let me know if I can help with anything else.
Thanks for organizing this.

Regards,
Helen

>
> Thanks for pointing this out, Sebastian.
>
> Regards,
>
>         Hans
>
> On 2/22/22 07:32, Sebastian Fricke wrote:
> > Hey folks,
> >
> > I noticed that in:
> > ```
> > ROCKCHIP ISP V1 DRIVER
> > M:    Helen Koike <helen.koike@collabora.com>
> > M:    Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > L:    linux-media@vger.kernel.org
> > L:    linux-rockchip@lists.infradead.org
> > S:    Maintained
> > F:    Documentation/admin-guide/media/rkisp1.rst
> > F:    Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> > F:    Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
> > F:    drivers/media/platform/rockchip/rkisp1
> > F:    include/uapi/linux/rkisp1-config.h
> > ```
> >
> > Both maintainers do not work for Collabora anymore, so they probably
> > will not receive any mail on those mail addresses.
> >
> > @Dafna: I do not know which mail address Helen currently uses, are you
> > aware of any?
> >
> > Greetings,
> > Sebastian



-- 
Helen Koike
