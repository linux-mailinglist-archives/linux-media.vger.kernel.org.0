Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9962A3A792F
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 10:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhFOImB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 04:42:01 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:37363 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230455AbhFOImB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 04:42:01 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id t4bwla9VIhg8Zt4bzlNaUe; Tue, 15 Jun 2021 10:39:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623746395; bh=P272GEMadL8ZFN1YvcW3dMHdgber4KEpXLxvk//n2Ys=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=eICmrzWstZ7AN++H0c8Q/gITGcC0Xl09uqdVWcEQr3wJs5JdcQ8MZZYHWw1bqa0jd
         mB4XJjN2bWix+VzzOFobdXIhsuRV7//yqYHjmppUZoICT2YmEu36F+K4ECSS0hKa4z
         b0sgAd/9J9gTJ5PLZZi6tPz8a0M/QD/Ut9jAdyJhQMkumda9qdL69wnit/XyIoENtU
         ovXpYJVM6h1/Dosx0Ik0kAdbSnJ5R8UEEJ9dO7bJ34MbqbbJ5DoINtnrd2oe2UXvuC
         8hBBXcxZXVa1TXMEyFu4UoP6iWWERzihA4Gggbne1b9hoUHE1b7FcnNY7NVniJmpPT
         obXpYYduipt5g==
Subject: Re: [PATCH 7/9] media: v4l2-dv-timings: Add more CEA/CTA-861 video
 format timings
To:     Nelson Costa <Nelson.Costa@synopsys.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>
References: <cover.1622631488.git.nelson.costa@synopsys.com>
 <6a0dcbd4f6dae00c664e5ef80cde3f1eb530c382.1622631488.git.nelson.costa@synopsys.com>
 <d4b681b1-7bac-7b6f-fd44-5beb68d3f820@xs4all.nl>
 <MW3PR12MB4459A066F9B85A478CA92977C13D9@MW3PR12MB4459.namprd12.prod.outlook.com>
 <c4122867-9b06-2a1f-a1a0-9176f6ae7b52@xs4all.nl>
 <MW3PR12MB4459428F816C3816B1EBB583C1319@MW3PR12MB4459.namprd12.prod.outlook.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a6f78f33-99b8-c02e-b58c-86eb1bd97969@xs4all.nl>
Date:   Tue, 15 Jun 2021 10:39:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <MW3PR12MB4459428F816C3816B1EBB583C1319@MW3PR12MB4459.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfL6NW/1ucZk6RvK/RGh8CVaFh54+iXNMlqxXjlwsZBIeh3ZfrQgmkhckOJAEgkCQdl9XEAmP4VtGW9Sx1loV8lsvjnFW0mPC6CfhxB6N21qu4NWNgG4/
 eP2a4YSKhm0FphrbRrR5V+0gZG5zNxYPShxucWAfR+XxRb3j/kEtxm33UxARkfcGHgP7WvFCHgl9PIpppKxnmBCr1fH11Ox4A0MIg14axcf2v6JMwodlIqvD
 U6qWmCnve9B97KT/2Gn9gXdpUD4OK9mo0via65pPfuXYT6mnKucrXggIEAnZQ6MufL1lpRqtAWTW5lT3ub6v7fa2mEje39PFW8Uz3t+cBEevVcQKDk1oTt35
 QNDf2xk5LqWPgw4035G2/nP0xDfMrco/FCezFO3m2b1KtPenkR/ZQ990ORr26RAW5R0C7G2mhhtoEQeXrru2xihTNgllr+IF4LBWNZFGLKu5Y3cwd/w/LcJF
 4piFUojQj/OinvCHdGsBDPJYl6yd9kNmUBidP2i1Wfy7SxICY3yw6PNxZP4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/06/2021 19:04, Nelson Costa wrote:
> Hi Hans,
> 
> Thanks for your comments!
> 
> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Date: qua, jun 02, 2021 at 19:19:25
> 
>> On 02/06/2021 19:15, Nelson Costa wrote:
>>> Hi Hans,
>>>
>>> Thanks for your comments and feedback!
>>>
>>> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> Date: qua, jun 02, 2021 at 13:26:17
>>>
>>>> Hi Nelson,
>>>>
>>>> On 02/06/2021 13:24, Nelson Costa wrote:
>>>>> This extends the support for more video format timings based
>>>>> on SPECs CEA-861-F and CTA-861-G.
>>>>>
>>>>> NOTE: For the newer SPECs the CEA was unified to the CTA.
>>>>> The CTA-861-G then includes the CEA-861-F timings besides
>>>>> the new timings that are specified.
>>>>>
>>>>> CEA-861-F: Specifies the Video timings for VICs 1-107.
>>>>> CTA-861-G: Specifies the Video timings for VICs 1-107, 108-127, 193-219.
>>>>>
>>>>> With this patch, the array v4l2_dv_timings_presets has support for
>>>>> all video timings specified in CTA-861-G.
>>>>>
>>>>> Signed-off-by: Nelson Costa <nelson.costa@synopsys.com>
>>>>> ---
>>>>>  drivers/media/v4l2-core/v4l2-dv-timings.c |  139 +++
>>>>>  include/uapi/linux/v4l2-dv-timings.h      | 1595 ++++++++++++++++++++++++++++-
>>>>
>>>> I prefer to split this up in two patches, one for each header.
>>>>
>>>
>>> I agree! It will be addressed in the next patch series.
>>>
>>>> The v4l2-dv-timings.h changes look good (my compliments for all the
>>>> work you put into that!).
>>>>
>>>
>>> Thanks!
>>>
>>>> I am more concerned about adding all these timings to v4l2_dv_timings_presets.
>>>>
>>>> There are really two different things going on here: the v4l2_dv_timings_presets
>>>> array is used both by v4l2_enum_dv_timings_cap() to list supported commonly used
>>>> timings, or to match against timings parameters (v4l2_find_dv_timings_cap()), and
>>>> as a lookup table when receiving a specific VIC code (v4l2_find_dv_timings_cea861_vic()).
>>>>
>>>> All the new timings you added are really only relevant in the last case when you
>>>> have the vic code.
>>>>
>>>> I think it is better to create a second array v4l2_dv_timings_non_square_vics[]
>>>> (or a better name!) that contains these timings.
>>>>
>>>
>>> I understood.
>>>
>>> We can then create another array as you said. But when you say 
>>> "non_square"
>>> you mean that the vics have "Pixel Aspect Ratio != 1:1"?
>>>
>>> Because the new vics added have both kind of vics with "Pixel Aspect 
>>> Ratio != 1:1"
>>> and also "Pixel Aspect Ratio == 1:1".
>>
>> There are? It's confusing since for 1:1 pixel aspect ratios I expect that the
>> picture aspect ratio is set to { 0, 0 }, instead they are all filled in.
>>
>> I think it will be clearer if I see a v2 where the picture aspect ratio and
>> the V4L2_DV_FL_HAS_PICTURE_ASPECT flag are only set for the non-square pixel
>> timings. Also, for the timings with 1:1 pixel aspect ratio you don't need to
>> add the PA... suffix. That suffix only makes sense for non-square pixel aspect
>> ratios. It's confusing otherwise.
>>
> 
> It makes sense! That way it will assure coherence with the current 
> implementation.
> In the v2 patch series this will be addressed.
> 
>>>
>>> So, for the new vics should we create a second array with name 
>>> v4l2_dv_timings_extended_vics[]?
>>
>> The new vics with non-square pixel aspect ratios, or with pixel repetition.
>>
> 
> You mean the new vics added that are square should be kept in the 
> original array?
> 
> And only the new vics that are non-square or with pixel repetition should 
> go to a second array?

Correct.

Regards,

	Hans
