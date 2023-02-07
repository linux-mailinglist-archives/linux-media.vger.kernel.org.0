Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7BE768D53F
	for <lists+linux-media@lfdr.de>; Tue,  7 Feb 2023 12:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231348AbjBGLQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Feb 2023 06:16:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbjBGLQC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Feb 2023 06:16:02 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D96322030
        for <linux-media@vger.kernel.org>; Tue,  7 Feb 2023 03:16:00 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id m2so15311352plg.4
        for <linux-media@vger.kernel.org>; Tue, 07 Feb 2023 03:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvYHv7yD/85q93tM+/wtSvqEBzYU9y0fUg24mVC4fvA=;
        b=Hw2z5yLwQdVTJL1/f5sxZVmnowqEyplmEF0qhc8eWNiG3WY6J4gRTWwq6/3dUCMunO
         eOdrBtj6/cOO3S3Jxxc9sbQJaLXaTgUsscbxFInnHceGCkuWUkPmBIgmr+OWpL0KCUH1
         9+Vo5/DD1Yid+rbwUaGW6uwioee1Bsj7IDliC2QHMBZWIHTwdl/RoKdbbioQmOSKKK4V
         7v0s7xaD3xwYvttpQRYQFcF6hJnAiiu/lHYJMOeei50Qnpv7GHC0BTvZEhCJ31rX3UPJ
         fvwExxJbND1gvWTHpEebB8Tui8KOq3UiXFT+PWuXSFEI4twJPVmvE8ZBGWKHZbcYkYav
         /x9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvYHv7yD/85q93tM+/wtSvqEBzYU9y0fUg24mVC4fvA=;
        b=J/s3vSIkahcjF1JWDn4zjDVIEIsBQfL1ZXPp/9PgJQxaSek+jr80hH8YUrjX82HKGP
         INOkBcgrMGAUnz6IK75R8MfKGtvSjcE26hWRc0NrK3jaj/8xxRwvP/n4aP3tvPByo+Zy
         Udqk88hX4RPM9dku3FrR4QvvbTL4JNjGT9mZvvRVIKn2iWe7x/JzWSz6mDMRSoPUy31Y
         fZ+cg9SbfbknOvUsa8v3qYCu3IMyKdf4+rsdWlRPGtYLdFNu3g13ZfkBe3Hhx/jl/BtO
         4KfSr8K0oAHaXy7O3fMkcwp3as+HJRCks551ofULu9x+Y+xRC4gdV+QVf+BYg5cmffC1
         bwDw==
X-Gm-Message-State: AO0yUKWjdI48C96SJqU8mudwuJRmWfrNmlqAjx2Wp5T4o/88xUXgsRl/
        C5tMtp//9U7glNPFCx+Dfhm2lBq6+llNQy13Ji9Zvx1IvzEAp5xf
X-Google-Smtp-Source: AK7set9h5uuwTpjeufoAv64ypcC0Gz336pTIH+AFPXK/5RxCXuzs00HPIAeZZSuzWZ2Ce91kdT6ETj/dZ1xGqrxYcqU=
X-Received: by 2002:a17:90a:6d66:b0:230:7f32:bf01 with SMTP id
 z93-20020a17090a6d6600b002307f32bf01mr871866pjj.1.1675768559704; Tue, 07 Feb
 2023 03:15:59 -0800 (PST)
MIME-Version: 1.0
References: <20230130105423.1338554-1-mk@semmihalf.com> <20230130135418.1604455-1-mk@semmihalf.com>
 <CAJMMOfNJV+eOqTgUoLLWKQe2MJ=6fXL3aaP6d=YrSBQvfhOXiA@mail.gmail.com> <DM8PR02MB8169B2AC8918F8E31628F61AF3DB9@DM8PR02MB8169.namprd02.prod.outlook.com>
In-Reply-To: <DM8PR02MB8169B2AC8918F8E31628F61AF3DB9@DM8PR02MB8169.namprd02.prod.outlook.com>
From:   =?UTF-8?Q?Micha=C5=82_Krawczyk?= <mk@semihalf.com>
Date:   Tue, 7 Feb 2023 12:15:48 +0100
Message-ID: <CAJMMOfN-6fgN0VohA5ViwVXmNWtA13ycfZFoO4ys9_CLes0feA@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

wt., 7 lut 2023 o 10:54 Vikash Garodia <vgarodia@qti.qualcomm.com> napisa=
=C5=82(a):
> I have reviewed the patch, and the drain sequence handling looks good to =
me.
> Could you share some details on the test client which you are using to ca=
tch this issue ?

Hi Vikash,

Thank you for looking at the code!

I've been testing it using the Chromium implementation of the V4L2
codec [1]. Meanwhile, we were running a test suite which changes the
encryption method in the middle of the video decoding. This triggers
the flush behavior and the Chromium sends the stop/start cmd to the
V4L2 kernel component, and the test expects the video to continue the
playback normally. Unfortunately, it was causing a stall of the video
at the same time.

[1] https://source.chromium.org/chromium/chromium/src/+/main:media/gpu/v4l2=
/

>
> > Thank you,
> > Micha=C5=82
>
> Thanks,
> Vikash
