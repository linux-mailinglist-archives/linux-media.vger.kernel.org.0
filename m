Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEDEB1A1C2
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 18:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727660AbfEJQoc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 12:44:32 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42974 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfEJQoc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 12:44:32 -0400
Received: by mail-wr1-f68.google.com with SMTP id l2so8631023wrb.9
        for <linux-media@vger.kernel.org>; Fri, 10 May 2019 09:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=PbDWBL5WxTI7SfU5kuDlccpaJ8mdYJuP0SPdlOmEG6g=;
        b=O3px6ONitIjpSzUIFVtRkJqmB81H32PZTVkXjGSgJgukzzfBz5n0lIAE66JwS3qery
         fSqfPs8xqAIo8oWWlM8W+cHHLL6p9VWTbuy69/TmB5nuszm54+QKoK0mV+P3WpeGaDHX
         4ASXtJigu350ovmSab3q1V1/+dYZfiEus9I3b7/EyCbJpiWe3hjwNf8gsvmMkuLrtDR8
         4XLXcnm3FEXFa5uO8TtMAu00e+tXrreK7JkZNuDrH4znKcwt8ZSgu/hqayF+vsPqLzV3
         evqvF3tiQGa/nTe8BmBYXENPvqWFMsEaqMxYyFORlNmV8JU8QPQKeW6WW1P7IIHzjgOQ
         9Hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=PbDWBL5WxTI7SfU5kuDlccpaJ8mdYJuP0SPdlOmEG6g=;
        b=WNpVupuoaXej96hvOpUFpzpE615oAA844snEU9R6uI+ooOY2WdDq3MF5U2mSv8C7Ij
         phiBt+TBJ+/yGQ7zt94MXexfbM5D3CFXc7jdH6DoRWpbbBwUQCah9ZONSqF3FIuspVKj
         zTi3jyXrgV9W1tk1VF8blYbw6S/oYJm3zX86Nqgk2f+uho3e3HSFytDLUaSw5yAdF/F8
         aj1UWeDL9MkLUnBhdqdIjFTA7uqezjh2hxzhzJSR64KLUAzUxxheR/r2rkMo53eDYm56
         id5WsITOt7JavubTqJWdNJvQWDTYQf/GhYJlcH7xaWYCUFFKjFPxEgbUSwXmeqlN4l0/
         WlkA==
X-Gm-Message-State: APjAAAWMLBhb6AoUmv8AjWcltzSRbumHOZhKYonEbsxRuZ5j3sW0Q6j8
        agcNfUw4kGfNFr9JNQPvSKnC6hQE
X-Google-Smtp-Source: APXvYqxv8ur7JRc2AMrxHChs1J6EqgF77adAzmxZCtJL/m6VSyNAaK+sfgK1befmU0Ic31ur/KgewQ==
X-Received: by 2002:adf:e5cc:: with SMTP id a12mr8849269wrn.78.1557506670088;
        Fri, 10 May 2019 09:44:30 -0700 (PDT)
Received: from [172.30.89.235] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id s22sm8091827wmh.45.2019.05.10.09.44.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 09:44:29 -0700 (PDT)
Subject: Re: [PATCH v4 0/8] Switch to sync registration for IPU subdevs
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     linux-media@vger.kernel.org
References: <20190503224326.21039-1-slongerbeam@gmail.com>
 <m3ftpr5lne.fsf@gmail.com> <ad321dec-4352-205e-3c04-e13865a279d5@xs4all.nl>
 <de7e39b8-9738-fa1a-1a15-6939d1f38995@gmail.com>
Message-ID: <edfd3612-fe90-bc28-2d28-a33c783e5966@gmail.com>
Date:   Fri, 10 May 2019 09:44:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <de7e39b8-9738-fa1a-1a15-6939d1f38995@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/10/19 9:43 AM, Steve Longerbeam wrote:
>
>
> On 5/10/19 4:18 AM, Hans Verkuil wrote:
>> On 5/6/19 11:16 PM, Rui Miguel Silva wrote:
>>> Hi Steve,
>>> On Fri 03 May 2019 at 23:43, Steve Longerbeam wrote:
>>>> Switch to sync registration for the IPU internal sub-devices, 
>>>> re-organize
>>>> modules, and a few other miscellaneous cleanups.
>>> Thanks for the series and the fixes. Now everything works as
>>> before. So, for the all series and related to imx7:
>>>
>>> Tested-by: Rui Miguel Silva <rmfrfs@gmail.com>
>>> Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
>>>
>>> My only concern is that Hans already pull requested to v5.2 [0] my
>>> previous patch that your series do not apply on top of.
>>>
>>> So, @Hans will you push this series to v5.2 and add a revert
>>> of [1]? or this will go only to v5.3?
>> This will only go to v5.3.
>>
>> I believe that Mauro plans to get [0] into 5.2, probably as a pull 
>> request
>> once v5.2-rc1 has been released. So once that is merged Steve 
>> probably needs
>> to do a rebase of this series.
>
> The imx6 subdevs don't hold a reference to the media device any longer 
> with this series, so [0] will need to be reverted. I will do that in 
> the next version.

Sorry [1] below will need to be reverted.

Steve

>
>>
>>
>>>
>>> [0]: 
>>> https://lore.kernel.org/linux-media/d5b4a68d-520e-0e93-d44e-07974058d690@xs4all.nl/
>>> [1]: 
>>> https://lore.kernel.org/linux-media/20190412164400.1270-1-rui.silva@linaro.org/
>>>
>>>
>>>> History:
>>>> v4:
>>>> - Add **cc arg to __capture_try_fmt_vid_cap() to validate colorspace,
>>>>    instead of calling ipu_pixelformat_to_colorspace().
>>>> - Add error message if capture format validation failed.
>>>> v3:
>>>> - A couple patches did not compile/link. All patches now build so the
>>>>    series is fully bisectable. No functional changes.
>>>> v2:
>>>> - Added a patch that improves the pipeline upstream/downstream search
>>>>    functions, which no longer require the media device.
>>>> - Add a patch to remove getting media device from v4l2_dev driver 
>>>> data.
>>>>
>>>>
>>>> Steve Longerbeam (8):
>>>>    media: staging/imx: Switch to sync registration for IPU subdevs
>>>>    media: staging/imx: Pass device to alloc/free_dma_buf
>>>>    media: staging/imx: Move add_video_device into 
>>>> capture_device_register
>>>>    Revert "media: imx: Set capture compose rectangle in
>>>>      capture_device_set_format"
>>>>    media: staging/imx: Remove capture_device_set_format
>>>>    media: staging/imx: Re-organize modules
>>>>    media: staging/imx: Improve pipeline searching
>>>>    media: staging/imx: Don't set driver data for v4l2_dev
>>>>
>>>>   drivers/staging/media/imx/Makefile            |  18 +-
>>>>   drivers/staging/media/imx/imx-ic-common.c     |  68 +--
>>>>   drivers/staging/media/imx/imx-ic-prp.c        |  36 +-
>>>>   drivers/staging/media/imx/imx-ic-prpencvf.c   |  88 ++--
>>>>   drivers/staging/media/imx/imx-ic.h            |   6 +-
>>>>   drivers/staging/media/imx/imx-media-capture.c |  90 ++--
>>>>   drivers/staging/media/imx/imx-media-csi.c     |  45 +-
>>>>   .../staging/media/imx/imx-media-dev-common.c  | 346 +++++++++++++-
>>>>   drivers/staging/media/imx/imx-media-dev.c     | 449 
>>>> +-----------------
>>>>   drivers/staging/media/imx/imx-media-fim.c     |   9 -
>>>>   .../staging/media/imx/imx-media-internal-sd.c | 357 ++++++--------
>>>>   drivers/staging/media/imx/imx-media-of.c      |  41 +-
>>>>   drivers/staging/media/imx/imx-media-utils.c   | 170 +++----
>>>>   drivers/staging/media/imx/imx-media-vdic.c    |  84 +---
>>>>   drivers/staging/media/imx/imx-media.h         | 113 +++--
>>>>   drivers/staging/media/imx/imx7-media-csi.c    |  43 +-
>>>>   16 files changed, 857 insertions(+), 1106 deletions(-)
>

