Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 964CC6B49C4
	for <lists+linux-media@lfdr.de>; Fri, 10 Mar 2023 16:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233862AbjCJPPa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Mar 2023 10:15:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234143AbjCJPO6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Mar 2023 10:14:58 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F127112EE6A
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 07:06:19 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id n6so5867132plf.5
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 07:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1678460724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mI9SynFLOYtOEHXFt34hbbK+yCygpvgICPPgvO9gfV8=;
        b=VJ1dnBmXbkWcmPGgaIqe8y1AjzPkpkCDA30L72GW1BCNILg9Ux93MdjuFClsREO7vk
         lPuzSZIDtThvsRkSsKGr3zO9rAsKWjoosj6IS8v322FG/klrkxUO4FIp6lMfqPuj4TxI
         7iye1Ahz/4AiFFf6VAwHflCsxCwez6c0dgsKDphb107iKdmAqMvuRIOUZ+bfwhCgORMs
         iHbeIn5DKK69O/9p0RZAo34CKsm8KqzEPsCeBsRVrQgTElcQ7BdUZWM4zM+YwjZmMWwf
         jpTB1yeDWY83Dl59FnSeE0Klte9uU8zLnIN4Ka4GVeK62dZ/tM49vJHupbAcFDxR1gnt
         LTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678460724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mI9SynFLOYtOEHXFt34hbbK+yCygpvgICPPgvO9gfV8=;
        b=EmPUKAXjJU0eYbCOty0Fp58AfHg6uWh1TskXtF9ays4MKOQe7vEHzDckOTQg94FX88
         vGnCtKO308dGS7bfg+nyNL0B2NFXZxJ5n+vNigBgR5RuEZ5XaSsoEh0b1GS0ajR2TlKQ
         sfjpDdPxm4/QZdJon9mdkWIGB6oVlqH59AXturMvM6Q6usn4ifd8W2cJ/z5tBQEHF4UC
         aquhkiA/xf4aiKEsINvjeMskOsHz+agWHTSEhJ3gGEWdaxhDrfDkLb/ZBE1JdK1jE5Dh
         t0ANY3+T3QwpCJdVhuLoPQXUTd3vIp6nuCge3yC2oSj1gxhx+em/vQIo1fiXZ9cNJdbo
         Tufw==
X-Gm-Message-State: AO0yUKWx1Eti2/xdBhrrHRbFBEYb3D2pTua3Z+siOU+DxEH6v2B5Ki8H
        aYQDRJ2u2CcW1drotWXtfm2KDew0VyEw+YTtWsZqKg==
X-Google-Smtp-Source: AK7set8IWRb0c5QRI0mCvofn+53toeLUf0QAqBXeiHkxJiCHSENVWUwl0Cn9xhaO9TH0b6aLOo+bYIjEMz5NYxW8+6s=
X-Received: by 2002:a17:902:7e09:b0:199:6fd:ecf6 with SMTP id
 b9-20020a1709027e0900b0019906fdecf6mr9641502plm.9.1678460723997; Fri, 10 Mar
 2023 07:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20230130105423.1338554-1-mk@semmihalf.com> <20230130135418.1604455-1-mk@semmihalf.com>
 <CAJMMOfNJV+eOqTgUoLLWKQe2MJ=6fXL3aaP6d=YrSBQvfhOXiA@mail.gmail.com>
 <DM8PR02MB8169B2AC8918F8E31628F61AF3DB9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <CAJMMOfN-6fgN0VohA5ViwVXmNWtA13ycfZFoO4ys9_CLes0feA@mail.gmail.com> <CAJMMOfM41dfqx0NoiHGE=8X5hoRHo1=qPEp4KXLP1kygestEJQ@mail.gmail.com>
In-Reply-To: <CAJMMOfM41dfqx0NoiHGE=8X5hoRHo1=qPEp4KXLP1kygestEJQ@mail.gmail.com>
From:   =?UTF-8?Q?Micha=C5=82_Krawczyk?= <mk@semihalf.com>
Date:   Fri, 10 Mar 2023 16:05:12 +0100
Message-ID: <CAJMMOfN6tUzGZOkP6ZXbKCr-vszqf3nnRM-dhXfpOUSiHr2EHA@mail.gmail.com>
Subject: Re: [PATCH v2] media: venus: dec: Fix handling of the start cmd
To:     Vikash Garodia <vgarodia@qti.qualcomm.com>
Cc:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mw@semihalf.com" <mw@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Any update on this patch? It would be great if we could make some
progress there (and, hopefully, finally merge it :))

Thanks,
Micha=C5=82

pt., 10 lut 2023 o 16:18 Micha=C5=82 Krawczyk <mk@semihalf.com> napisa=C5=
=82(a):
>
> Hi,
>
> I'm wondering if there are any more comments for this patch? I would
> be happy to clarify anything that's unclear or improve the code if
> needed.
>
> I know it's pretty late, but it would be really great if this fix
> could land before v6.2 is released, so I'd appreciate your help and
> review.
>
> Thank you,
> Micha=C5=82
>
> wt., 7 lut 2023 o 12:15 Micha=C5=82 Krawczyk <mk@semihalf.com> napisa=C5=
=82(a):
> >
> > wt., 7 lut 2023 o 10:54 Vikash Garodia <vgarodia@qti.qualcomm.com> napi=
sa=C5=82(a):
> > > I have reviewed the patch, and the drain sequence handling looks good=
 to me.
> > > Could you share some details on the test client which you are using t=
o catch this issue ?
> >
> > Hi Vikash,
> >
> > Thank you for looking at the code!
> >
> > I've been testing it using the Chromium implementation of the V4L2
> > codec [1]. Meanwhile, we were running a test suite which changes the
> > encryption method in the middle of the video decoding. This triggers
> > the flush behavior and the Chromium sends the stop/start cmd to the
> > V4L2 kernel component, and the test expects the video to continue the
> > playback normally. Unfortunately, it was causing a stall of the video
> > at the same time.
> >
> > [1] https://source.chromium.org/chromium/chromium/src/+/main:media/gpu/=
v4l2/
> >
> > >
> > > > Thank you,
> > > > Micha=C5=82
> > >
> > > Thanks,
> > > Vikash
