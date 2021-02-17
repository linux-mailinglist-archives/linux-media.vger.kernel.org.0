Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB9C31D6D4
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 10:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbhBQJLc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 04:11:32 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:55779 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231542AbhBQJLb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 04:11:31 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id CIqxl7UkCZvk6CIr0l6rUq; Wed, 17 Feb 2021 10:10:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1613553046; bh=uSxzPPyVvXNWM+WQDeaRwP48PE6c7mphNoRppLem0rY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=e3CJEEyAjmSERDt8Inx1KHZ0hF2Wo0JERbLmD7awKrEGqC+gkG1qYyw55ux8La0kO
         W6n3lTXO50JP00pI115gXNMncz2Z+YMN+zXSZ22YZCp2FsQJVsgq3gbff/SjH9NGPk
         1pJlCIa5jgFg9unlqFvjRiAYzXrbpsYd8SK96Kd69YzIiOhyEF3pyj/VZnJFS7a1UH
         7Fs/cE2nO5OGBuC4zN+/mQQVBx8i5Kfp+25nT/MIVwypToL5iiJRaqNTX/P3k6wdPD
         FrQPLSm0Krod9bbO5pQvL9De7DBvsipUJFp4tJVajwmAiWKhs5q660PaAjBDP0crNg
         0MTl7iH9ZtVzA==
Subject: Re: [PATCH v1 00/18] Add HANTRO G2/HEVC decoder support for IMX8MQ
To:     Greg KH <gregkh@linuxfoundation.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     peng.fan@nxp.com, kernel@collabora.com, devel@driverdev.osuosl.org,
        Anson.Huang@nxp.com, krzk@kernel.org,
        linux-rockchip@lists.infradead.org, wens@csie.org,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, p.zabel@pengutronix.de,
        s.hauer@pengutronix.de, mripard@kernel.org, robh+dt@kernel.org,
        mchehab@kernel.org, ezequiel@collabora.com,
        linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
        jernej.skrabec@siol.net, adrian.ratiu@collabora.com,
        linux-kernel@vger.kernel.org, paul.kocialkowski@bootlin.com,
        kernel@pengutronix.de, shawnguo@kernel.org, shengjiu.wang@nxp.com
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
 <YCzO7SRmBKzGeMUS@kroah.com>
 <04dfae0b-92e5-e02d-c687-ba4d28b7aaf2@collabora.com>
 <YCzVmRVL79KMkxXQ@kroah.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <63b62e9e-b95f-59a4-b830-c56d2cb9e4f8@xs4all.nl>
Date:   Wed, 17 Feb 2021 10:10:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YCzVmRVL79KMkxXQ@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfCWTvvS3ntp+Ze+ND5twq3FMCVE1sSa/yxM9eKULJNJNKc944I4NbpFvKDCdcH0V3BJX+oU7FTwzESJgXnCwL77Ih7EB0zX0uU5PzaBLnRI9R34LXBgd
 zrERyF1rcsEuHD8tIo3a/zrZt3UKpKGOIRrhjSgachV2bh2GtGg0coYnosYcgp4hFp19eDpk7JOzbBEBv/X6IafM3sfhJ8HRNe8VJJBtJN0K/3Dj7Oz7KrIt
 9p96GxBx56YG3x9fF4JSrMs56oXPz/47sMw/RWnptfoUPtQp1og8S8Ot9ZgYgsYTxu8fMZlcwxR/FDSAjoWZMjrXQT1A0Jl2dlR1cQFx8qvyY0fvHOJNg5D9
 Xc7DBRcN1PAplu7kW3gBTE2PG+fczJEsvL4D274Rvzc8RW2PjcvGfvaUkmIpniCljdI8ulw8s4KEMEOVUoxBLowsYcZW7+rlBflkkRGTBGFlu1Wg2hhfpkKX
 SDYJBx+xlR8GQDQ+KiP5ACFgmAlp0rTazN0fVEylVdiQpAVNb5OwNLXH9Zx9hKooOx3RoHR+EVkXbcuN+RXrGavzcEMTc57e/cXOcPEAxTagUSVakKKjPdb9
 Qb3YjD+Ei02mNV22HyYJKc35N7RjJsqjMVHIsrmkAhETKdf9d0EcNfak/03J5poePHe/Z34EGlNCJPKx6NCXUymZ+Uq/1cTuknrzBNfzBI7tQV1E17N7WAed
 TU2+X66uywWoAkmwNDUG2DL8yEfZcxl8utD1JLcaflcPqJ2+xqgkn/XugDGZrw1SOjhEv2aqWZo45b1yIPvrim6FAfod8J7pu2LAXaKZgYxH+XEQu58OdsFK
 3GCh+CHxbluTV8FThcw2AybhlCuBA2tF3p1on9HIoIhmu7sen7TQLidyHl2SSz3pnDD5uwA+hsclFq0z6BPpt4s7Tip35a3/A1d+Lp6jMUqjXYqhfW6wmfQL
 14tRqoyYAqkj1ODAACQ70Q0pMXUBxpy5weS2QLm3HdQUYTMJ5QuvXBkDPIu1G79dDRnWNWRt2rHvQhM+5Vp0qRFajwvRSOE1TRlyXlKUMegPOp+OanOGF1P0
 o55OSHtLD1cW+cIAyA4FEkSpQ99E0StnZ9jTLY68N/ZwXgc253cpprT8
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/02/2021 09:36, Greg KH wrote:
> On Wed, Feb 17, 2021 at 09:28:09AM +0100, Benjamin Gaignard wrote:
>>
>> Le 17/02/2021 à 09:08, Greg KH a écrit :
>>> On Wed, Feb 17, 2021 at 09:02:48AM +0100, Benjamin Gaignard wrote:
>>>> The IMX8MQ got two VPUs but until now only G1 has been enabled.
>>>> This series aim to add the second VPU (aka G2) and provide basic
>>>> HEVC decoding support.
>>> Why are you adding this directly to drivers/staging/media/ and not
>>> drivers/media/?  Why can't this just go to the main location and not
>>> live in staging?
>>
>> G2/HEVC is added inside the already exiting Hantro driver, it is "just"
>> an other codec from Hantro driver point of view.
>> In addition of that v4l2-hevc uAPI is still unstable.
>> One goal of this series is to have one more consumer of this v4l2-hevc
>> uAPI so maybe we can claim it to be stable enough to move away from staging
>> and then do the same for Hantro driver. That would be a great achievement !
> 
> I know I do not like seeing new additions/features/whatever being added
> to staging drivers as that encourages people to do new stuff on them
> without doing the real work needed to get them out of staging.

In order to support a specific codec (MPEG-2, H.264, HEVC, VP8, etc.) for
stateless codec hardware like the hantro, V4L2 controls need to be defined.
The contents of these controls is derived directly from the underlying codec
standards, but it is quite difficult to get this right with the first attempt,
since these standards are very complex.

So we went for the strategy of keeping these drivers in staging to make it
easy to work on, while keeping the APIs for each codec private (i.e., they are
not exposed in include/uapi/linux).

Once we have sufficient confidence in the API for a specific codec we move
it to uapi and thus fix the API. We also renumber the control IDs at that
time to avoid any confusion between the staging version and the final version.

We did that for H.264 and I hope we can soon do the same for MPEG-2 and VP8.

HEVC is definitely not ready for that yet.

The key phrase is 'sufficient confidence': one requirement is that it is supported
by at least two drivers to be reasonably certain the API doesn't contain any HW
specific stuff, and it passes test suites and review by codec experts.

All this is actively being worked on, so this is very much alive, but it is
complex and time consuming.

> So what is preventing the existing driver from getting out of staging
> now?

Once MPEG-2 and VP8 are finalized it is probably time to move these drivers
out of staging, while still keeping the HEVC API part private.

> 
> And how are you all creating new userspace apis for staging drivers to
> the v4l layer?  What happens when you export something new and then
> userspace starts to rely on it and then you change it?

Nothing is exported. So if userspace want to use it they have to manually
copy headers from include/media to their application.

> 
> Anyway, the media staging drivers are on their own, I don't touch them,
> it just feels odd to me...

It's an unusual situation. But putting the drivers in staging and keeping
the codec API headers private turns out to be the most effective way to
develop this.

Regards,

	Hans

PS: stateful vs stateless decoders: stateful decoders are fully supported
today: you just feed the decoder the compressed stream and the decoded frames
are produced by the firmware/hardware. I.e. the HW takes care of the decoder
state. Stateless decoders require you to pass the compressed frame + decoder
state to the hardware, so they do not keep track of the decoder state, that
needs to be done in software. And that requires structures to be created that
store the state, which luckily can be derived from the codec standards.
