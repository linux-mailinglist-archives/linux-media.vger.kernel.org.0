Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D572428A7C
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 12:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235772AbhJKKG2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 06:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235719AbhJKKG1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 06:06:27 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D460C06161C;
        Mon, 11 Oct 2021 03:04:27 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ZsAPmxj3kk3b0ZsASmM0Dv; Mon, 11 Oct 2021 12:04:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1633946665; bh=rmKfzfF1sxGJ4PhfThUHFV7E1M9VYlASwIwSx2gzoXM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=j8T0k8krqDMem+fjbyghmdfwoeEbPqVw9JYej1bwbMF/4Q7BV4pmG6r3ee8tscc/B
         zAhglDO+ciOk12DU84ejzbA7i+/Y4zQQz+v8v2l/+igOgVqT/9AqJy8GL8WGrwyTRZ
         sddWsIfWXvLDNSlYkQUTVhM2ncmHP5mVt0Xg1OnM98OVQdQZ70PHxqBp5UIucTWgzi
         8YnkDuRQklL60jjTFr3TOKVHFlGKyLKvB+syGNOYRgNPdh/m3rckEdQk7WezyBGRc0
         PhjS8Nty40ktFXOWKsmSnJYtwu79Q2EGCPKq8RqnSLxTkb282RHFGzth8mT3DFmfJ5
         UrRzyU4wfO2AQ==
Subject: Re: [PATCH v3 6/8] media: v4l2-ctrls: Add ARGB color effects control
To:     Dillon Min <dillon.minfei@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        mchehab+huawei@kernel.org, ezequiel@collabora.com,
        gnurou@gmail.com, Pi-Hsun Shih <pihsun@chromium.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com,
        Patrice CHOTARD <patrice.chotard@foss.st.com>,
        hugues.fruchet@foss.st.com,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
 <1633689012-14492-7-git-send-email-dillon.minfei@gmail.com>
 <290d78b5-b6d4-a115-9556-f2f909f573da@xs4all.nl>
 <CAL9mu0KxAmULQofQMgt2JxVLs=L-YT5HZa+mA7sSKebG88GbcA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <8331ab8a-39b7-588c-146d-77197d7637a8@xs4all.nl>
Date:   Mon, 11 Oct 2021 12:04:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0KxAmULQofQMgt2JxVLs=L-YT5HZa+mA7sSKebG88GbcA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfI6gIQYzNuZRRJ7atifRKhQb6OnM6G4qdQlLJpYTELraJNgcaUYZWWeK4YOeU0wIKPqpIoERADNR3JzdrhPpMUXJxysktZjRzn4l77Lx8PzOutjDvbPI
 LWJS/iuWcf3xMboLPaGC2UIYzKEe1FfVtAPrPFFZBxHyl8j3Y6jYwO++mchOq48XWpY9Vy6hfAlBWtWr0qHW40e8s9g9nWmBfsqVnPDKRvhQCbKXNuE96Kx3
 0SppxcUbjkIRls5oUkMayziAWGBYFn6h6BDip5cCH0tOhZr2ok9XV8zBPQdB77+2xnulM658FFdGnjE+weRam7bgodUQRfA5Dqu78i6LvK2I2qqsYt3tCCDZ
 WNUUCUWmxGsTfFUP+694fE+BEbnWrJcsCHR5avKMpijAjEqe0a3hP8H3gW0Qsc+vfixGn2qsW1H2gUYGGtfUKQCeFcZMrdprPMOARzwqA/cbbpVhux675Yj4
 K0t+nhUZpT5fnsgtIU7W5mlkubaZowS7gBLifXifLe+Y4goSC4MEvz/M/P9S5q7Rs0H/D7LNEoijR4i6NeNEWO06jT7I0lGCAag6xqxE4kM/wDdQUYjhwyM5
 dzZi9FqJuT7waa6CCk2o2CqLwBQ6WBjn/Va9l3Dq9uuv9FqmxAB5mkviJ+n4Jtv80Nh67GHiQQM5elcqd+ueWvf4/ZbQCq/wNnARcL0o1bSD5/pgoZGzE38O
 NtzR/qHs1ExUaJlwrg8SSV70cnCYW7Rvp7FeYwZh1HGAOSlP6uO2oFWHMmkLvFE+0ou9qvYi8yQnRMdMDF/PTwwk4GvSCEfBkBPFBkG6l0kOFGN5Taf9h3Q3
 BPLhWUbcDy0bvPK4ECMmi2c+noQ/eLPNJbT6PmsBSYQ4vf12t0EUOPw2qGVdVZlSvawVRq3Itez2+cFJIHjWrngKcJeQpq+SzKBHI4Lipc7xFdztajMT7oAB
 0McHghWZ438fSWUhFvXclgzqfoo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/10/2021 12:00, Dillon Min wrote:
> Hi Hans
> 
> Thanks for the quick reply.
> 
> On Mon, 11 Oct 2021 at 17:40, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 08/10/2021 12:30, dillon.minfei@gmail.com wrote:
>>> From: Dillon Min <dillon.minfei@gmail.com>
>>>
>>> - add V4L2_COLORFX_SET_ARGB color effects control.
>>> - add V4L2_CID_COLORFX_ARGB for ARGB color setting.
>>>
>>> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
>>> ---
>>> v3: according to Hans's suggestion, thanks.
>>> - remove old stm32 private R2M ioctl
>>> - add V4L2_CID_COLORFX_ARGB
>>> - add V4L2_COLORFX_SET_ARGB
>>>
>>>  Documentation/userspace-api/media/v4l/control.rst | 8 ++++++++
>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 2 ++
>>>  include/uapi/linux/v4l2-controls.h                | 4 +++-
>>>  3 files changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
>>> index f8d0b923da20..319606a6288f 100644
>>> --- a/Documentation/userspace-api/media/v4l/control.rst
>>> +++ b/Documentation/userspace-api/media/v4l/control.rst
>>> @@ -242,8 +242,16 @@ Control IDs
>>>      * - ``V4L2_COLORFX_SET_CBCR``
>>>        - The Cb and Cr chroma components are replaced by fixed coefficients
>>>       determined by ``V4L2_CID_COLORFX_CBCR`` control.
>>> +    * - ``V4L2_COLORFX_SET_ARGB``
>>> +      - ARGB colors.
>>
>> How about:
>>
>>         - The ARGB components are replaced by the fixed ARGB components
>>         determined by ``V4L2_CID_COLORFX_ARGB`` control.
> 
> Sure, will be addressed by v4.
> 
>>
>> I also wonder if it makes sense to include the alpha channel here.
>>
>> Looking at the driver code it appears to me (I might be wrong) that the alpha
>> channel is never touched (DMA2D_ALPHA_MODE_NO_MODIF), and setting the alpha
>> channel as part of a color effects control is rather odd as well.
> 
> Indeed, Alpha channel is not used in current code. I'll remove this item in v4.
> how about change the code like below:
> 
>     * - ``V4L2_COLORFX_SET_RGB``
>        - The RGB components are replaced by the fixed RGB components
>          determined by ``V4L2_CID_COLORFX_RGB`` control.
> 
> ``V4L2_CID_COLORFX_RGB`` ``(integer)``
>     Determines the Red, Green, and Blue coefficients for
>     ``V4L2_COLORFX_SET_RGB`` color effect.
>     Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
>     bits [15:8] as Green component, bits [23:16] as Red component, and
>     bits [31:24] must be zero.

Yes, that looks OK to me.

Regards,

	Hans

> 
> 
>>
>> Alpha channel manipulation really is separate from the color and - if needed - should
>> be done with a separate control.
> 
> OK, Will use a separate control when adding blend features.
> 
> Best Regards,
> Dillon
> 
>>
>> Regards,
>>
>>         Hans
>>
>>>
>>>
>>> +``V4L2_CID_COLORFX_ARGB`` ``(integer)``
>>> +    Determines the Alpha, Red, Green, and Blue coefficients for
>>> +    ``V4L2_COLORFX_SET_ARGB`` color effect.
>>> +    Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
>>> +    bits [15:8] as Green component, bits [23:16] as Red component, and
>>> +    bits [31:24] as Alpha component.
>>>
>>>  ``V4L2_CID_COLORFX_CBCR`` ``(integer)``
>>>      Determines the Cb and Cr coefficients for ``V4L2_COLORFX_SET_CBCR``
>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> index 421300e13a41..53be6aadb289 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> @@ -785,6 +785,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>       case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:   return "Min Number of Output Buffers";
>>>       case V4L2_CID_ALPHA_COMPONENT:          return "Alpha Component";
>>>       case V4L2_CID_COLORFX_CBCR:             return "Color Effects, CbCr";
>>> +     case V4L2_CID_COLORFX_ARGB:             return "Color Effects, ARGB";
>>>
>>>       /*
>>>        * Codec controls
>>> @@ -1392,6 +1393,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>>               *min = *max = *step = *def = 0;
>>>               break;
>>>       case V4L2_CID_BG_COLOR:
>>> +     case V4L2_CID_COLORFX_ARGB:
>>>               *type = V4L2_CTRL_TYPE_INTEGER;
>>>               *step = 1;
>>>               *min = 0;
>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>>> index 5532b5f68493..2876c2282a68 100644
>>> --- a/include/uapi/linux/v4l2-controls.h
>>> +++ b/include/uapi/linux/v4l2-controls.h
>>> @@ -128,6 +128,7 @@ enum v4l2_colorfx {
>>>       V4L2_COLORFX_SOLARIZATION               = 13,
>>>       V4L2_COLORFX_ANTIQUE                    = 14,
>>>       V4L2_COLORFX_SET_CBCR                   = 15,
>>> +     V4L2_COLORFX_SET_ARGB                   = 16,
>>>  };
>>>  #define V4L2_CID_AUTOBRIGHTNESS                      (V4L2_CID_BASE+32)
>>>  #define V4L2_CID_BAND_STOP_FILTER            (V4L2_CID_BASE+33)
>>> @@ -145,9 +146,10 @@ enum v4l2_colorfx {
>>>
>>>  #define V4L2_CID_ALPHA_COMPONENT             (V4L2_CID_BASE+41)
>>>  #define V4L2_CID_COLORFX_CBCR                        (V4L2_CID_BASE+42)
>>> +#define V4L2_CID_COLORFX_ARGB                        (V4L2_CID_BASE+43)
>>>
>>>  /* last CID + 1 */
>>> -#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+43)
>>> +#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
>>>
>>>  /* USER-class private control IDs */
>>>
>>>
>>

