Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEDAB27B5ED
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 22:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgI1UGl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 16:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbgI1UGi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 16:06:38 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 978D8C0613CE
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 13:06:36 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id w1so3240887edr.3
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 13:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l3/RthoWOUwuzTyUqMkIutkczyzvaZtdBdBX3vl2kfw=;
        b=igdhPiI8ZUTi0qzKtluflwazu/79pMgWhtOpYJflLX7J3wteUplQRRSQYloDJ+bW/M
         R4pBThWClqAq755nEHri1H8DfGiKcvYa2Q0LrQuq1ajyHt/NEEkJq9GtlBce3quiVkQ9
         TLhetOGldD3WyIqrfGXg7KoNdTSXLElpu2bT+hqwaTehSFB5wLEdEubI23LplSO4LeGe
         vDyBScBIam9awD3FvMKG3EeKF/rVPgknRLnOugV2BYOt+1BSo4v5DnghWyV9KyANG7Ox
         MIKl68F8gC1vhgDnuN6HZFZ0SHuwRuNwOZ/DMOafHvDBcutY8A58V5UAPiToJCYgiLjT
         Q1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l3/RthoWOUwuzTyUqMkIutkczyzvaZtdBdBX3vl2kfw=;
        b=tgvG7Y+2illUVSjzkVnZ9tfk6zhKc05J/lVqZfcUcvceSsVJ3TkLDME9qPR7L9N4pP
         48eLuFq6l95/vsI52hHNKzeFEuF0HBcQSxm4JgBg3J2C4WMhdCxa0VDoInQpVNkMgfcC
         JOQ9Rab95lFnZBLggP5A5BXywt5yxfQs+qNEzmKnz/avqmXM2zBZpPOMKTFggSVxuCSD
         MxbUCxzSFClmlWodbKjUCHE05+Z8MLtuKTTkHnEF6+BOn8Fm7FiToGjFj+Bd8lgrDO6J
         lyTU++p+ip/mYQ/3kEabE/8PNc4fTvtBI9HD7IRQ0URLFS5eZZ/B0+uBXWTMixctmmz/
         rs4A==
X-Gm-Message-State: AOAM5335i5dnf7uWYC0JKVn2a6gLH3MCuPqtJyMqCS/q3r08w/3/nLYW
        9+hkhvW0rgvqUKtxykhPNtR8vTkJzmgru7ZPqRGPxQ==
X-Google-Smtp-Source: ABdhPJzkd8lOyD117kZmTAJd38Vp62XqajHUVqn2ZnHvEp5iveEQG9dxwKfDUY7OAmwthEgQguzSjt5wjgFa96SGTNc=
X-Received: by 2002:a05:6402:2c3:: with SMTP id b3mr3718802edx.213.1601323595273;
 Mon, 28 Sep 2020 13:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <3b140eaf883b4666985c0be0db8d53e8@skidata.com> <9444c9375f58436b9e6a0fa3a4088e17@skidata.com>
 <AM6PR01MB55741EE09532A7C60CD05B71E23F0@AM6PR01MB5574.eurprd01.prod.exchangelabs.com>
In-Reply-To: <AM6PR01MB55741EE09532A7C60CD05B71E23F0@AM6PR01MB5574.eurprd01.prod.exchangelabs.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Mon, 28 Sep 2020 17:06:24 -0300
Message-ID: <CAAEAJfDnC5=iomoNivrwKt5th866qMKPY0Tw9i_PfKqsFTm69Q@mail.gmail.com>
Subject: Re: [PATCH] media: coda: avoid starvation on well-compressed data
To:     Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
Cc:     "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>,
        "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Fri, 18 Sep 2020 at 05:35, Benjamin Bara - SKIDATA
<Benjamin.Bara@skidata.com> wrote:
>
> Hi all,
>
> there are still cases where the decoder starves.
> Also, the failure log at the bottom contradicts with the 2x256 bytes assumption.
> When I increase the threshold to 512 bytes, the respective video (and all my other tests) work.
>
> Is it possible that the limitation is 2x512 bytes or is there another "limitation",
> beside the "two window" one, which is "accidentally fulfilled" with this approach?
>
> What do you think about the approach in the patch; is it possible to get it mainline?
> Any help, feedback, hints or suggestions would be really appreciated!
>
> I will do some additional testing to see if the 2x512 threshold finally catches the problem.
> When I'm done, I will provide a second version of the patch.
>

Thanks for the report. I'm seeing a similar behavior and have been doing
some experiments with your patch, and trying different solutions as well.

My colleague Nicolas pointed out to me that crafting a video
with serie of black frames in QCIF resolution, would trigger the timeout:

gst-launch-1.0 videotestsrc pattern=black num-buffers=300 !
video/x-raw,format=I420,width=176,height=120 ! avenc_mpeg2video !
mpegvideoparse ! mpegtsmux ! filesink location=black-qcif-10s.ts

We are still doing some tests to see if we can come up with a proper
solution. I will keep you posted.

If you have some (public) bitstream that are known to timeout,
and that you could share with me, that would be nice, so I could
have a more complete set of samples.

Thanks,
Ezequiel

> Many thanks & best regards
> Benjamin
>
> *Failure Log:*
> [  108.108711] coda 2040000.vpu: 0: active metas:
> [  108.108716] coda 2040000.vpu: 0: - payload: 4240
> [  108.108721] coda 2040000.vpu: 0: - payload: 900
> [  108.108726] coda 2040000.vpu: 0: - payload: 170
> [  108.108730] coda 2040000.vpu: 0: - payload: 403
> [  108.108734] coda 2040000.vpu: 0: want to queue: payload: 405
> [  109.057738] coda 2040000.vpu: CODA PIC_RUN timeout
>
