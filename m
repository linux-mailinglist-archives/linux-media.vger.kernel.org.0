Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEFCC1946FC
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 20:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbgCZTFn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 15:05:43 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46127 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgCZTFm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 15:05:42 -0400
Received: by mail-pf1-f196.google.com with SMTP id q3so3239669pff.13
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 12:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kiD6plPdxGEWW1g2a38FdDHwUsqwwC5eT5Avd+8qM6E=;
        b=Ojc6un62E2Y8Nc7OZgPYUpwVLCHvFZ3aZthG2rc+Fw0iRVtrP6p3p1DnaJGC5ZqC/U
         Tbsnu0zx9ywxrLf7Y8tx066Nn6yC1l4hb9swL0qMMm8sPsYr0wcxe1f8H52ahh4CV/UH
         qcYsmDGSsNNtFfX6y6yQSQC+YZotleMmXg8BZlkd4ugtc20fdP7Tpy8IM1K9YNU+NYs5
         by80d0pJJD3ReIWse18oDrTQX9C0TCpfUJrbuXmGoK3bF+4QaZHCOUGOB27KBLEQIfoM
         Hq8m2fUA4zs+OXgozfY7NePbZJFLnQgVtufP/MGomjnzMkyLuKXAA1uilJJoJ4BsWeDQ
         Kk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kiD6plPdxGEWW1g2a38FdDHwUsqwwC5eT5Avd+8qM6E=;
        b=KuYbcaBFR9mP95vTXSFK6B+0poUrfCGROGYqKfOAQLIt4D5NzONjJaY+Zg6SzEiHDR
         lBJOZDo2xa2gI2aLjkj2N5yLSxbdFVUYzlaUDX3LQcwePxcJtg+yYhITfyUc7vIeVkZl
         Wy1ZJr1QVgcJQ+m7VCexmzaaFpBRyIEQG8sNxm+qOcyzRCLGlG3BcyVs5NqmsGfj1zJK
         l8m1jZeJzWAbwPHpMbMTGa8rPXOQSjH+vV2UuraRtdDA/2MZIWTEOZWOm/ULMqaJZRIt
         jH9XO5+i3HAfFOs9KwdbBnfjsKIAzCbf5qCfKmhYGTBw64E6VX1o4eJ5+zhd+p+/ac7U
         +iCA==
X-Gm-Message-State: ANhLgQ2dAs0/sSuQr70jCKsyqBssofboxea5Zl1g/79HJFZpzuNpu0Nu
        R6HFJ1etztM2pnbmObweqHVdYj8LKyE=
X-Google-Smtp-Source: ADFU+vt2xw/Kn6t3PDDpVIWYTTKWqxsGYUez3q7cwpzh2HozPv2NtHn++3x6S5j1UbIWpYwapC4Hsw==
X-Received: by 2002:a63:5406:: with SMTP id i6mr1611044pgb.6.1585249541155;
        Thu, 26 Mar 2020 12:05:41 -0700 (PDT)
Received: from [172.30.89.221] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id d3sm2329001pfq.126.2020.03.26.12.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2020 12:05:40 -0700 (PDT)
Subject: Re: [PATCH 0/8] media: imx: Miscalleanous format-related cleanups
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
 <5b773016-8a71-9739-237d-69c0dc8bd349@gmail.com>
 <20200312004735.GG1639@pendragon.ideasonboard.com>
 <1a10d9b2-3e5b-4cbd-d703-5012fa8fa6ad@gmail.com>
 <20200314223209.GC5320@pendragon.ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <f77e8a90-f83a-1022-7e4f-571bd5df551d@gmail.com>
Date:   Thu, 26 Mar 2020 12:05:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200314223209.GC5320@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 3/14/20 3:32 PM, Laurent Pinchart wrote:
> Hi Steve,
>
> On Sat, Mar 14, 2020 at 03:30:53PM -0700, Steve Longerbeam wrote:
>> On 3/11/20 5:47 PM, Laurent Pinchart wrote:
>>> On Wed, Mar 11, 2020 at 05:16:49PM -0700, Steve Longerbeam wrote:
>>>> Hi Laurent,
>>>>
>>>> I agree that the find/enum format code in imx-utils needs cleanup, it's
>>>> too confusing. I will be ready to give my ack to the imx-utils patches
>>>> once I do some smoke testing on a sabre target when I return from vacation.
>>>>
>>>> Note that Phillip also submitted a fixup patch to the find/enum format
>>>> code, IIRC it did more consolidating of the imx_media_pixfmt tables. I
>>>> can't find it and it has gotten lost, but I tested and provided a
>>>> reviewed-by at the time.
>>> I've found them in the mail archive. There were 3 patches, Hans said he
>>> would take the first two, but only the first one got merged. I'll take
>>> the two others and build on top of them, fixing the issues pointed out
>>> by the kbuild robot and addressing Hans concerns.
>> I found the thread finally. In fact I did some work on this set already,
>> I fixed the kbuild warnings as well as added some function headers
>> describing all the format search criteria arguments. Also changed a
>> local var in enum_formats() to better document the enum algorithm.
>>
>> Unless you've started on this work already, I will be returning from
>> vaca tomorrow and can pick this up again, merging in your patches, as
>> well as splitting up find|enum_formats() into find|enum_formats() and
>> find|enum_codes(), which is the remaining suggestion from Hans.
> I've done this already, I'll try to send the patches on Monday.

If you don't mind, I've done this work and tested on an imx6 target. So 
I will post a series.

Steve

>
>>>> On 3/10/20 9:18 AM, Laurent Pinchart wrote:
>>>>> Hello,
>>>>>
>>>>> This patch series started as an attempt to fix the format get and set
>>>>> subdev operations on the i.MX7 CSI-2 receiver subdev, which it does in
>>>>> patch 1/8. Patch 2/8 further cleans up the format-related code in that
>>>>> subdev.
>>>>>
>>>>> Patches 3/8 to 8/8 pushes the cleanups further as I was attempting to
>>>>> fix the format enumeration on the video node at the end of the pipeline.
>>>>> I realized as part of that effort that there's more work than I
>>>>> anticipated, and I'm currently evaluating the possible options.
>>>>> Nonetheless, I think the cleanups make sense even without what I wanted
>>>>> to build on top of them, so I'm sending them out already.
>>>>>
>>>>> Laurent Pinchart (8):
>>>>>      media: imx: imx7-mipi-csis: Cleanup and fix subdev pad format handling
>>>>>      media: imx: imx7-mipi-csis: Centralize initialization of pad formats
>>>>>      media: imx: utils: Inline init_mbus_colorimetry() in its caller
>>>>>      media: imx: utils: Handle Bayer format lookup through a selection flag
>>>>>      media: imx: utils: Simplify IPU format lookup and enumeration
>>>>>      media: imx: utils: Make imx_media_pixfmt handle variable number of
>>>>>        codes
>>>>>      media: imx: utils: Remove unneeded argument to (find|enum)_format()
>>>>>      media: imx: utils: Rename format lookup and enumeration functions
>>>>>
>>>>>     drivers/staging/media/imx/imx-ic-prp.c        |   8 +-
>>>>>     drivers/staging/media/imx/imx-ic-prpencvf.c   |   6 +-
>>>>>     drivers/staging/media/imx/imx-media-capture.c |  22 +-
>>>>>     .../staging/media/imx/imx-media-csc-scaler.c  |   2 +-
>>>>>     drivers/staging/media/imx/imx-media-csi.c     |  26 +-
>>>>>     drivers/staging/media/imx/imx-media-utils.c   | 313 ++++++++----------
>>>>>     drivers/staging/media/imx/imx-media-vdic.c    |   6 +-
>>>>>     drivers/staging/media/imx/imx-media.h         |  24 +-
>>>>>     drivers/staging/media/imx/imx7-media-csi.c    |  15 +-
>>>>>     drivers/staging/media/imx/imx7-mipi-csis.c    | 138 ++++----
>>>>>     10 files changed, 271 insertions(+), 289 deletions(-)

