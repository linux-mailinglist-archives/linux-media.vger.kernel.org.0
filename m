Return-Path: <linux-media+bounces-807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 781CF7F4781
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 14:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08183B20D2F
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 13:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC1C4C61A;
	Wed, 22 Nov 2023 13:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8500A10C
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 05:17:14 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c59a4dd14cso80879891fa.2
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 05:17:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700659032; x=1701263832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVieDbJ2isCpLHf0WcxZi//ROqiDpZ89Q5chhxVg/5Y=;
        b=P/ZbOoa/GTGZWPxi+5jLFXwPYtIeWfmWefFIKipGX740vO1RdJWp++dDVgEK5KTpAI
         0BNjV54vx5jGV7Z5txHyP62/bMkz1KESI2j1IoRIQRnYciGf/K7QFq+WOAr/BmvqyQam
         4Wfb7l6nCb29rN0sVc4G/iX6NSxlyJVfjNnMfpq03F0//mVvHio0byW4Mg7SK6m1Jv3F
         NHr0mzCuaaN+h3w444Z0gf6IXS1Ld7voDpiBH83xgewRhvLm1m9X1V6orzA4JuVeSfFC
         Ti5S/tzeD0UC4h4VZ6/cgbScOdVmwgjyw8zWAPQ91KUTKKmhAZz/hgC8prb4LfjmRFVp
         rk7Q==
X-Gm-Message-State: AOJu0Yy0tAK9W4cJdhQPDu0BcjLobc4/xwVSoaKILOvhhsDfCbtFT3qI
	BP/KcCYtp+NRpMCI6LrewfAwig8QyAEO/g==
X-Google-Smtp-Source: AGHT+IGWo4DGLskjCkfY05Gxu/CrDWZdfEnGpzO2+7jxVlgeuaXoYb5RkvWok2CDvcAVxjsylY5Q7Q==
X-Received: by 2002:a2e:8683:0:b0:2c5:12c4:5ff with SMTP id l3-20020a2e8683000000b002c512c405ffmr286085lji.17.1700659032266;
        Wed, 22 Nov 2023 05:17:12 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id x23-20020a2e9c97000000b002c6eb321d87sm1552967lji.118.2023.11.22.05.17.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 05:17:11 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c871d566cfso56775011fa.3
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 05:17:11 -0800 (PST)
X-Received: by 2002:a2e:9613:0:b0:2c5:19ab:726e with SMTP id
 v19-20020a2e9613000000b002c519ab726emr286786ljh.47.1700659031424; Wed, 22 Nov
 2023 05:17:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACXRmJg4vKSQsXyC15LdQ5A+7Yaf+AaHmQ4sdbXNkZJ05edeWg@mail.gmail.com>
 <d6685bdc-46af-4260-b166-1eba8b86c86b@xs4all.nl>
In-Reply-To: <d6685bdc-46af-4260-b166-1eba8b86c86b@xs4all.nl>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 22 Nov 2023 14:17:00 +0100
X-Gmail-Original-Message-ID: <CACXRmJj7m+H_LCMwtCVYoAikrqYGDGDUvpJfPcCmQP65J3aT9A@mail.gmail.com>
Message-ID: <CACXRmJj7m+H_LCMwtCVYoAikrqYGDGDUvpJfPcCmQP65J3aT9A@mail.gmail.com>
Subject: Re:
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, linux-media@vger.kernel.org, 
	Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="UTF-8"

Hi Hans,

Thx for the fast response!
See inline below.

Kind regards,

Thomas Devoogdt


Op wo 22 nov 2023 om 10:48 schreef Hans Verkuil <hverkuil@xs4all.nl>:
>
> On 22/11/2023 10:26, Thomas Devoogdt wrote:
> > Hi all,
> >
> >
> > I have two questions:
> >
> > 1.
> > When running v4l2-compliance on a proprietary driver, I get this error:
> >
> > ```
> > Input/Output configuration ioctls:
> > fail: v4l2-test-io-config.cpp(227): fmt.fmt.pix.width >=
> > enumtimings.timings.bt.width * 1.5
> > fail: v4l2-test-io-config.cpp(386): Timings check failed for input 0.
> > test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: FAIL
> > ```
> >
> > Which brings me here:
> > https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-compliance/v4l2-test-io-config.cpp#n227
> >
> > ```
> > fail_on_test(fmt.fmt.pix.width < enumtimings.timings.bt.width);
> > fail_on_test(fmt.fmt.pix.width >= enumtimings.timings.bt.width * 1.5);
> > fail_on_test(fmt.fmt.pix.height * factor < enumtimings.timings.bt.height);
> > fail_on_test(fmt.fmt.pix.height * factor >=
> > enumtimings.timings.bt.height * 1.5);
> > ```
> >
> > The problem is that the driver supports VIDIOC_S_DV_TIMINGS but is not
> > able to apply the specific format just returns the actual timings.
> > This is from what I know, not a violation, so I'm not sure what the
> > driver should return if it is not able to set a custom timing. Or is
> > this check just a bit too strict?
>
> This test enumerates all timings returned by VIDIOC_ENUM_DV_TIMINGS.
> All these timings should be valid supported timings. For each returned
> timing it calls S_DV_TIMINGS to set it. Then it call G_DV_TIMINGS to
> verify that the width and height of the new timings match what was
> requested. Apparently that worked, otherwise the test would have
> failed there.

Yes, indeed that part is ok.

> Next it gets the new format (G_FMT). The driver must update the format
> when the timings are updated. In this case the width of the returned
> format is more than 1.5 times the width of the requested timings.
> That doesn't sound right.

I found that G_FMT returns 16x16 (not sure where that is done), but
DV_TIMINGS was 0x0.
So fail_on_test(fmt.fmt.pix.width >= enumtimings.timings.bt.width *
1.5) triggered.

> Your claim that S_DV_TIMINGS can't set the new timings is dubious
> since G_DV_TIMINGS apparently returns the new timings correctly.
> Also, ENUM_DV_TIMINGS shouldn't return unsupported timings either.
>

I meant hardware-wise with not supported, but S_DV_TIMINGS itself is
indeed supported.

> >
> >
> > 2.
> > For another driver, I get this error:
> >
> > ```
> > Input ioctls:
> > fail: v4l2-test-input-output.cpp(443): use of deprecated digital video status
> > fail: v4l2-test-input-output.cpp(496): invalid attributes for input 0
> > test VIDIOC_G/S/ENUMINPUT: FAIL
> > ```
> >
> > It might be true that setting V4L2_IN_ST_NO_CARRIER is deprecated, but
> > is that really an error, not better to just have it as a warning?
> > After all, how can userspace know specific details if needed? Perhaps
> > checking that V4L2_IN_ST_NO_SIGNAL has also been set is enough, and if
> > V4L2_IN_ST_NO_CARRIER is set, but not V4L2_IN_ST_NO_SIGNAL, then it
> > might be an error.
>
> The NO_CARRIER, NO_EQU and NO_ACCESS status flags are DVB specific, but this
> ioctl isn't used by DVB anymore. I think very old drivers in the past (long
> since removed or changed) used this, but new drivers must not use this since
> it makes no sense. Note that v4l2-compliance is often more strict than the
> V4L2 spec itself: it is meant to ensure that drivers follow best practices.

I changed V4L2_IN_ST_NO_CARRIER to V4L2_IN_ST_NO_POWER which is fine enough.

> Note that the error message is not very good: it should say "digital TV"
> rather than "digital video". I'll fix that since that's confusing.
>
> Regards,
>
>         Hans
>
> >
> > Thx in advance!
> >
> > Kr,
> >
> > Thomas Devoogdt
> >
>
>

