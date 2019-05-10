Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 555921A471
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 23:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbfEJVVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 17:21:21 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44583 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727835AbfEJVVV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 17:21:21 -0400
Received: by mail-wr1-f66.google.com with SMTP id c5so9263032wrs.11
        for <linux-media@vger.kernel.org>; Fri, 10 May 2019 14:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=bnpF5JYcWvJQ9J6lhAkXHkf7emig3B2aPttetBDGFZ0=;
        b=VvAzcITpMqxl1WTGprhevABxEHnS2UYXqBEihdHS3TNaIAN2EWvaGYnEGhrZ/vfesv
         qOvtNtMFTbO27BY7R38jajh/r4g/hUbc1iU/p8hE+2aau3A7qSgnL+lmNWRwdZmWE9LX
         Z19G+cOeliZMLiVRMlKdW8JlFcTnvzmFr2UE4Wh/KI8ZbxL4grr8vlJc/krLnRGD4kp0
         iGOv0Z1TnPFLGe3xW/68hUF3PksK3SOayhVln9TX+raFca/9OybjKTQeyCJlWJRBHnXu
         ipr2KwfgG9Wr3gu8kGVfCtriYCeHuvfaervE8Kp1gqPHvilqCccAqZ0OHJTyZPnl4yfU
         avTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=bnpF5JYcWvJQ9J6lhAkXHkf7emig3B2aPttetBDGFZ0=;
        b=D4+z3JvWoHGysCYTdgtn8la1a4JZowM8wTl85KGQVkGRfHytqnqq34vk7ifQaBr5eK
         JZ5wycfgexrcxbw1KzKKZ9EM/W+BrD+jEh+yBL90qqLvfxKBETbLkgo9Oam8QfyuNVFp
         FTgSxFX4JP9ImsorVby3wlPLSjPYC1bd/smEPWkje068VsWR1Qt/1K0UtNvvRRidmZtA
         sYxlmrmBiLzqfr/9FfBnYcMn8ChVG6dDFmutVOluelnxddiLKaKCmw1S/RWy1rac31uG
         sDSMAqwAuFdLBIVm+I/j7/QfrF6mAGqdBvH1jqD7KuEkJ2EphEzBi7INdiC541S0Btka
         +9Mg==
X-Gm-Message-State: APjAAAXjkuvn0Nhc5za3S3RdVW74H/0Btcu2IhpvWGBjK0YN9KJhPFOB
        29Awk81L4BgmlsLzuulO+3FU2Nyr0HQ=
X-Google-Smtp-Source: APXvYqzPuGxPj3hEZlmZXu1GlNzOH2T1OGAep7Xd4PX9xd2mtj0jBnWGPjGwIQLSTfZDNVlbJQqRrw==
X-Received: by 2002:adf:b456:: with SMTP id v22mr7322830wrd.55.1557523278904;
        Fri, 10 May 2019 14:21:18 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id t18sm11707689wrg.19.2019.05.10.14.21.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 May 2019 14:21:17 -0700 (PDT)
References: <20190503224326.21039-1-slongerbeam@gmail.com> <m3ftpr5lne.fsf@gmail.com> <ad321dec-4352-205e-3c04-e13865a279d5@xs4all.nl> <de7e39b8-9738-fa1a-1a15-6939d1f38995@gmail.com> <edfd3612-fe90-bc28-2d28-a33c783e5966@gmail.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 0/8] Switch to sync registration for IPU subdevs
In-reply-to: <edfd3612-fe90-bc28-2d28-a33c783e5966@gmail.com>
Date:   Fri, 10 May 2019 22:21:16 +0100
Message-ID: <m3ef56rooj.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,
On Fri 10 May 2019 at 17:44, Steve Longerbeam wrote:
> On 5/10/19 9:43 AM, Steve Longerbeam wrote:
>>
>>
>> On 5/10/19 4:18 AM, Hans Verkuil wrote:
>>> On 5/6/19 11:16 PM, Rui Miguel Silva wrote:
>>>> Hi Steve,
>>>> On Fri 03 May 2019 at 23:43, Steve Longerbeam wrote:
>>>>> Switch to sync registration for the IPU internal sub-devices, re-organize
>>>>> modules, and a few other miscellaneous cleanups.
>>>> Thanks for the series and the fixes. Now everything works as
>>>> before. So, for the all series and related to imx7:
>>>>
>>>> Tested-by: Rui Miguel Silva <rmfrfs@gmail.com>
>>>> Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
>>>>
>>>> My only concern is that Hans already pull requested to v5.2 [0] my
>>>> previous patch that your series do not apply on top of.
>>>>
>>>> So, @Hans will you push this series to v5.2 and add a revert
>>>> of [1]? or this will go only to v5.3?
>>> This will only go to v5.3.
>>>
>>> I believe that Mauro plans to get [0] into 5.2, probably as a pull request
>>> once v5.2-rc1 has been released. So once that is merged Steve probably needs
>>> to do a rebase of this series.
>>
>> The imx6 subdevs don't hold a reference to the media device any longer with
>> this series, so [0] will need to be reverted. I will do that in the next
>> version.
>
> Sorry [1] below will need to be reverted.

Correct, thanks so much.

---
Cheers,
	Rui

>
> Steve
>
>>
>>>
>>>
>>>>
>>>> [0]:
>>>> https://lore.kernel.org/linux-media/d5b4a68d-520e-0e93-d44e-07974058d690@xs4all.nl/
>>>> [1]:
>>>> https://lore.kernel.org/linux-media/20190412164400.1270-1-rui.silva@linaro.org/
>>>>
>>>>
>>>>> History:
>>>>> v4:
>>>>> - Add **cc arg to __capture_try_fmt_vid_cap() to validate colorspace,
>>>>>    instead of calling ipu_pixelformat_to_colorspace().
>>>>> - Add error message if capture format validation failed.
>>>>> v3:
>>>>> - A couple patches did not compile/link. All patches now build so the
>>>>>    series is fully bisectable. No functional changes.
>>>>> v2:
>>>>> - Added a patch that improves the pipeline upstream/downstream search
>>>>>    functions, which no longer require the media device.
>>>>> - Add a patch to remove getting media device from v4l2_dev driver data.
>>>>>
>>>>>
>>>>> Steve Longerbeam (8):
>>>>>    media: staging/imx: Switch to sync registration for IPU subdevs
>>>>>    media: staging/imx: Pass device to alloc/free_dma_buf
>>>>>    media: staging/imx: Move add_video_device into capture_device_register
>>>>>    Revert "media: imx: Set capture compose rectangle in
>>>>>      capture_device_set_format"
>>>>>    media: staging/imx: Remove capture_device_set_format
>>>>>    media: staging/imx: Re-organize modules
>>>>>    media: staging/imx: Improve pipeline searching
>>>>>    media: staging/imx: Don't set driver data for v4l2_dev
>>>>>
>>>>>   drivers/staging/media/imx/Makefile            |  18 +-
>>>>>   drivers/staging/media/imx/imx-ic-common.c     |  68 +--
>>>>>   drivers/staging/media/imx/imx-ic-prp.c        |  36 +-
>>>>>   drivers/staging/media/imx/imx-ic-prpencvf.c   |  88 ++--
>>>>>   drivers/staging/media/imx/imx-ic.h            |   6 +-
>>>>>   drivers/staging/media/imx/imx-media-capture.c |  90 ++--
>>>>>   drivers/staging/media/imx/imx-media-csi.c     |  45 +-
>>>>>   .../staging/media/imx/imx-media-dev-common.c  | 346 +++++++++++++-
>>>>>   drivers/staging/media/imx/imx-media-dev.c     | 449 +-----------------
>>>>>   drivers/staging/media/imx/imx-media-fim.c     |   9 -
>>>>>   .../staging/media/imx/imx-media-internal-sd.c | 357 ++++++--------
>>>>>   drivers/staging/media/imx/imx-media-of.c      |  41 +-
>>>>>   drivers/staging/media/imx/imx-media-utils.c   | 170 +++----
>>>>>   drivers/staging/media/imx/imx-media-vdic.c    |  84 +---
>>>>>   drivers/staging/media/imx/imx-media.h         | 113 +++--
>>>>>   drivers/staging/media/imx/imx7-media-csi.c    |  43 +-
>>>>>   16 files changed, 857 insertions(+), 1106 deletions(-)
>>

