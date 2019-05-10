Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 265AF1A1BC
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 18:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727660AbfEJQnG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 12:43:06 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43225 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfEJQnF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 12:43:05 -0400
Received: by mail-wr1-f65.google.com with SMTP id r4so8608965wro.10
        for <linux-media@vger.kernel.org>; Fri, 10 May 2019 09:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=KBlmHdCIiQJY/9VZq+9pZ+lEwAEaIE1+L8rIqpvBiPo=;
        b=PJxeppjMtX0OKOSm4Aajw6T8izCkQAgwVkEU+g10im4QMOkCopkeHpvXkcrUaoN54P
         MTbJmjiKKn5RgzmCB+r4M/4RERcz1xNmuUfwKVIW2SSePmT2ssfIOiW0wDwgYKptl5Qv
         diH4WfnnMHf4aV8K8kRfIpmbKN7jK5WPx+p9h7tYJDWvurhZBz9S10E9wk3i7V/8e2rM
         zKZEWPFgGjlFtkfjbch0cSI3Zu3RVsv2k7Bf/OpTtlfXgMTToIn7DmfsAgX80MF4wxpQ
         4oSJirqjAR/cusEuDOinOynLg5bGBetLCSrULWRleOlQW4ZZG+8ljm6jwbJ+6B0DgLn9
         7qYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KBlmHdCIiQJY/9VZq+9pZ+lEwAEaIE1+L8rIqpvBiPo=;
        b=LUOeXjqIh8xYnTRrq8RiFUqojvm3kccANBT4VOeJSBbw/83VQk495Ta2M6jbcj5R7/
         8RZMhDJq2HgWnx09EEjokCD6NUX7Qz5bqINycIaAycNMCMufZdjNTcKY2o8/+qPKaCse
         8UHYcJByDsFSMkkjG5JPIv3dO4G+utMJp1/he8B/DcIxy4b2UZUjDzy3d3bCEixr+70/
         bwELbRB7Wdj7HS2pqNbNvtb1xNj00/L6PcxsK8oswzfx84e62qJpJrRbELBZcTuo+27K
         7/68iJuj8QgdSsetWBZ2pFGCWUJW5CK/0bGYjLMN/ltrCckvimpUMHDM1dapqenoyL3g
         gw/w==
X-Gm-Message-State: APjAAAUe0g4OPNIiKSAuhyivmBfTUVq/YLWH/ZMeXVa0y4VsGpNpApW+
        vsAENN/J3b99KYXfdy2US9afnGVV
X-Google-Smtp-Source: APXvYqxDbpY8W+J41AJ8IC1A5/qFFWC6LCe5o39EjpgLHZPPo6VB8gtguWHyik98pnryRdsbSeAqIg==
X-Received: by 2002:a5d:6a47:: with SMTP id t7mr8319495wrw.307.1557506583755;
        Fri, 10 May 2019 09:43:03 -0700 (PDT)
Received: from [172.30.89.235] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id c18sm6938117wrm.96.2019.05.10.09.43.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 09:43:02 -0700 (PDT)
Subject: Re: [PATCH v4 0/8] Switch to sync registration for IPU subdevs
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     linux-media@vger.kernel.org
References: <20190503224326.21039-1-slongerbeam@gmail.com>
 <m3ftpr5lne.fsf@gmail.com> <ad321dec-4352-205e-3c04-e13865a279d5@xs4all.nl>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <de7e39b8-9738-fa1a-1a15-6939d1f38995@gmail.com>
Date:   Fri, 10 May 2019 09:43:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ad321dec-4352-205e-3c04-e13865a279d5@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/10/19 4:18 AM, Hans Verkuil wrote:
> On 5/6/19 11:16 PM, Rui Miguel Silva wrote:
>> Hi Steve,
>> On Fri 03 May 2019 at 23:43, Steve Longerbeam wrote:
>>> Switch to sync registration for the IPU internal sub-devices, re-organize
>>> modules, and a few other miscellaneous cleanups.
>> Thanks for the series and the fixes. Now everything works as
>> before. So, for the all series and related to imx7:
>>
>> Tested-by: Rui Miguel Silva <rmfrfs@gmail.com>
>> Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
>>
>> My only concern is that Hans already pull requested to v5.2 [0] my
>> previous patch that your series do not apply on top of.
>>
>> So, @Hans will you push this series to v5.2 and add a revert
>> of [1]? or this will go only to v5.3?
> This will only go to v5.3.
>
> I believe that Mauro plans to get [0] into 5.2, probably as a pull request
> once v5.2-rc1 has been released. So once that is merged Steve probably needs
> to do a rebase of this series.

The imx6 subdevs don't hold a reference to the media device any longer 
with this series, so [0] will need to be reverted. I will do that in the 
next version.

Steve

>
>
>> ---
>> Cheers,
>> 	Rui
>>
>>
>> [0]: https://lore.kernel.org/linux-media/d5b4a68d-520e-0e93-d44e-07974058d690@xs4all.nl/
>> [1]: https://lore.kernel.org/linux-media/20190412164400.1270-1-rui.silva@linaro.org/
>>
>>
>>> History:
>>> v4:
>>> - Add **cc arg to __capture_try_fmt_vid_cap() to validate colorspace,
>>>    instead of calling ipu_pixelformat_to_colorspace().
>>> - Add error message if capture format validation failed.
>>> v3:
>>> - A couple patches did not compile/link. All patches now build so the
>>>    series is fully bisectable. No functional changes.
>>> v2:
>>> - Added a patch that improves the pipeline upstream/downstream search
>>>    functions, which no longer require the media device.
>>> - Add a patch to remove getting media device from v4l2_dev driver data.
>>>
>>>
>>> Steve Longerbeam (8):
>>>    media: staging/imx: Switch to sync registration for IPU subdevs
>>>    media: staging/imx: Pass device to alloc/free_dma_buf
>>>    media: staging/imx: Move add_video_device into capture_device_register
>>>    Revert "media: imx: Set capture compose rectangle in
>>>      capture_device_set_format"
>>>    media: staging/imx: Remove capture_device_set_format
>>>    media: staging/imx: Re-organize modules
>>>    media: staging/imx: Improve pipeline searching
>>>    media: staging/imx: Don't set driver data for v4l2_dev
>>>
>>>   drivers/staging/media/imx/Makefile            |  18 +-
>>>   drivers/staging/media/imx/imx-ic-common.c     |  68 +--
>>>   drivers/staging/media/imx/imx-ic-prp.c        |  36 +-
>>>   drivers/staging/media/imx/imx-ic-prpencvf.c   |  88 ++--
>>>   drivers/staging/media/imx/imx-ic.h            |   6 +-
>>>   drivers/staging/media/imx/imx-media-capture.c |  90 ++--
>>>   drivers/staging/media/imx/imx-media-csi.c     |  45 +-
>>>   .../staging/media/imx/imx-media-dev-common.c  | 346 +++++++++++++-
>>>   drivers/staging/media/imx/imx-media-dev.c     | 449 +-----------------
>>>   drivers/staging/media/imx/imx-media-fim.c     |   9 -
>>>   .../staging/media/imx/imx-media-internal-sd.c | 357 ++++++--------
>>>   drivers/staging/media/imx/imx-media-of.c      |  41 +-
>>>   drivers/staging/media/imx/imx-media-utils.c   | 170 +++----
>>>   drivers/staging/media/imx/imx-media-vdic.c    |  84 +---
>>>   drivers/staging/media/imx/imx-media.h         | 113 +++--
>>>   drivers/staging/media/imx/imx7-media-csi.c    |  43 +-
>>>   16 files changed, 857 insertions(+), 1106 deletions(-)

