Return-Path: <linux-media+bounces-2706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BF3819AB5
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 09:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E91181C25900
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 08:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4333B1C6B8;
	Wed, 20 Dec 2023 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uG2eXLbI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37443208B5
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5e7409797a1so23281177b3.0
        for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 00:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703061604; x=1703666404; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FiOZE+7UgezUwljIZ0IizgfxHCrQJAp3IF03vc/Hvkk=;
        b=uG2eXLbIl1B+cK7bgZ0Ah4+YOClOSn2x/cMH2ViHawxDcRz6qOCH4drQ47eL/nXnea
         PTAJtRJ66xs5fpYgwmhQSlpU+rQo0k5T0wbLHaUWlr8imBoCqDjkaATJcHuNZKSbgob1
         26Wsqtdi1GBi5r33EIbk+LSLKlNVUZDcTa5gBHWo7sCOXBOqFKt+xOZ+7eUi7YcZWXKL
         cuid1LprIGd84WFYRTjB4yiKlMZ2oUP53gsOTvFNH5ydCJAnGlD6gGCHCRoJnhr/70kt
         08kpmBCwLJrlf9OP0ZQoPD5ucLv/paGTJAFYoKP5YDGNcT8gvNXfqtNAJdxvB7UjRmmi
         v2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703061604; x=1703666404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiOZE+7UgezUwljIZ0IizgfxHCrQJAp3IF03vc/Hvkk=;
        b=WX+xa8x99Czdj4qloe+znvCNWHczVzeWfStsFf6LYeQ7O+dLsgehpxYwJ/5xLVp37q
         1ROrsXciiDvApa5bGzaQIij4UzYx5OyX4Kkv63w9ZhtffZWDR4pAXkaBpcuIGkH2LZuH
         41WxOyXZjW08C2Mn7oNLCDhEEYxfiib+6B7UcM6qWvXFG4ek9PdY162sKFZMB72Y9GKQ
         uG36UhONXaB6Ff4Wk8jxipxzjt6GitjpvHKXUrfeDGQXYkSuXXT+JTOgbSe+V3JxhXqU
         XFfwHvarfpflYSYveMYA5qb2t0z/kv31+PYnwt+WyUM33xHJ8ZtHeY56zVbP1Oq6aBp4
         yeDQ==
X-Gm-Message-State: AOJu0YyvWt3m9wjgF80QNUQSa1/OQtrn/y/zyK/imuL5oHj/YoEBZYFc
	HMb95+bwA6P/k/4rWSNXegHMGDHyJDR5rZ3k6sFazg==
X-Google-Smtp-Source: AGHT+IGxkRC64gaemHccT43Ju/ZgNg/+R5WvX0WIP0TMu49OPz/+0MvDCtS/qOJB2emr95UK9lk0Bu+vLifYAds161M=
X-Received: by 2002:a0d:d510:0:b0:5e8:8890:8afe with SMTP id
 x16-20020a0dd510000000b005e888908afemr382198ywd.78.1703061604134; Wed, 20 Dec
 2023 00:40:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1702899149-21321-1-git-send-email-quic_dikshita@quicinc.com>
 <a033dfc5-dcf1-4969-ad4d-1836ff9ff0a3@linaro.org> <d0ea23ae-8fba-d229-b0f6-dc522f285233@quicinc.com>
 <CAA8EJpouBOLJ_1Pz_YauuOX+97ud9RkLYRaui4GM6ZFJUKYJMw@mail.gmail.com> <9d94317c-5da9-5494-26a2-12007761a1e5@quicinc.com>
In-Reply-To: <9d94317c-5da9-5494-26a2-12007761a1e5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 20 Dec 2023 10:39:52 +0200
Message-ID: <CAA8EJpoCGRT=eETab8mF2MZZ04RmCkNnFKaRBFoUYk5qqDAPhg@mail.gmail.com>
Subject: Re: [PATCH v2 00/34] Qualcomm video encoder and decoder driver
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stanimir.k.varbanov@gmail.com, 
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mchehab@kernel.org, bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org, 
	quic_abhinavk@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Dec 2023 at 10:14, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
>
> Hi,
>
> On 12/20/2023 1:07 PM, Dmitry Baryshkov wrote:
> > On Wed, 20 Dec 2023 at 08:32, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
> >>
> >> Hi Dmitry,
> >>
> >> On 12/19/2023 12:08 AM, Dmitry Baryshkov wrote:
> >>> On 18/12/2023 13:31, Dikshita Agarwal wrote:
> >>>> This patch series introduces support for Qualcomm new video acceleration
> >>>> hardware architecture, used for video stream decoding/encoding. This driver
> >>>> is based on new communication protocol between video hardware and application
> >>>> processor.
> >>>
> >>> This doesn't answer one important point, you have been asked for v1. What is the
> >>> actual change point between Venus and Iris? What has been changed so much that
> >>> it demands a separate driver. This is the main question for the cover letter,
> >>> which has not been answered so far.
> >>>
> >>> From what I see from you bindings, the hardware is pretty close to what we see
> >>> in the latest venus generations. I asssme that there was a change in the vcodec
> >>> inteface to the firmware and other similar changes. Could you please point out,
> >>> which parts of Venus driver do no longer work or are not applicable for sm8550
> >>
> >> The motivation behind having a separate IRIS driver was discussed earlier in [1]
> >> In the same discussion, it was ellaborated on how the impact would be with
> >> change in the new firmware interface and other video layers in the driver. I can
> >> add this in cover letter in the next revision.
> >
> > Ok. So the changes cover the HFI interface. Is that correct?
> Change wise, yes.
>
> >> We see some duplication of code and to handle the same, the series brings in a
> >> common code reusability between iris and venus. Aligning the common peices of
> >> venus and iris will be a work in progress, once we land the base driver for iris.
> >
> > This is not how it usually works. Especially not with the patches you
> > have posted.
> >
> > I have the following suggestion how this story can continue:
> > You can _start_ by reworking venus driver, separating the HFI /
> > firmware / etc interface to an internal interface in the driver. Then
> > implement Iris as a plug in for that interface. I might be mistaken
> > here, but I think this is the way how this can be beneficial for both
> > the video en/decoding on both old and new platforms.
>
> HFI/firmware interface is already confined to HFI layer in the existing venus
> driver. We explained in the previous discussion [1], on how the HFI change
> impacts the other layers by taking example of a DRC usecase. Please have a look
> considering the usecase and the impact it brings to other layers in the driver.

I have looked at it. And I still see huge change in the interface
side, but it doesn't tell me about the hardware changes.

Have you evaluated the other opportunity?

To have a common platform interface and firmware-specific backend?

You have already done a part of it, but from a different perspective.
You have tried to move common code out of the driver. Instead we are
asking you to do a different thing. Move non-common code within the
driver. Then add your code on top of that.

>
> [1] https://lore.kernel.org/lkml/8c97d866-1cab-0106-4ab3-3ca070945ef7@quicinc.com/
> > Short rationale:
> > The venus driver has a history of supported platforms. There is
> > already some kind of buffer management in place. Both developers and
> > testers have spent their effort on finding issues there. Sending new
> > driver means that we have to spend the same amount of efforts on this.
> > Moreover, even from the porter point of view. You are creating new
> > bindings for the new hardware. Which do not follow the
> > venus-common.yaml. And they do not follow the defined bindings for the
> > recent venus platforms. Which means that as a developer I have to care
> > about two different ways to describe nearly the same hardware.>> Again qualcomm video team does not have a plan to support sm8550/x1e80100 on
> >> venus as the changes are too interleaved to absorb in venus driver. And there is
> >> significant interest in community to start validating video driver on sm8550 or
> >> x1e80100.
> >>
> >> [1] https://lore.kernel.org/lkml/8c97d866-1cab-0106-4ab3-3ca070945ef7@quicinc.com/
> >>
> >> Regards,
> >> Vikash
> >
> >
> >



-- 
With best wishes
Dmitry

