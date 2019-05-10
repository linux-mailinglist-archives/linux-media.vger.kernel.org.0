Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 161F919E6F
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 15:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbfEJNph (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 09:45:37 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39569 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727247AbfEJNpg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 09:45:36 -0400
Received: by mail-wr1-f67.google.com with SMTP id w8so5561383wrl.6
        for <linux-media@vger.kernel.org>; Fri, 10 May 2019 06:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=/kwEtNrt6Tx03dWdWgJh3txugz+EdsZXM5JiK/VgH00=;
        b=FP5/4SyOxHZYE09zgfxy/ISGMohU3kp1od72h6mCKJHSlXt9RJFefFRaQ0XcQK3Qv9
         aIfTuk49Sr6i9LIRIrDSCPUPjXatE7CBTaGuxUZTkYQuwGZzteKlu9mReoX2Z0+0S2Sn
         chA+Fb8MU7gpfb5bcqT+5E1zhFIjgX9bRKGaKKz6aiFt5VUFBuiRFKRtnhAbZ0l0s0m0
         EHCyxDUhBIRPPuOsFALO3X3SggD4eva185dsSeF5IdSUoNLGZN95gUb0ZgipTzI/3H3V
         Iy0EL9bv6r2DaE5dmRph0UZcioV14tpTdalULo651KQyClU8LX5Umwvmz22YdWdNI00u
         uvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=/kwEtNrt6Tx03dWdWgJh3txugz+EdsZXM5JiK/VgH00=;
        b=Jx9zNDKCheJcxGEdwXPfhaijWmqW5KMRFVuZMoN1bVSADcta0VHRZHdFx7cNKz/sBu
         kPzpdWpFf+LgomSkUk4kNceufyCufN5PLoKxhc1r9bAN1Dvzd5Bp6nPZ2JZ7dPnSFxqE
         8Dcefxv1FcMSMfe1CMxYTD62PTmfXzjvAUdh1RuG75Ci4OGb3KAe8jLnwsnLxrZaNoHu
         FfxGE0S6WjKKtVsmwAQvRcMQ6GEV+FOqiBsi3lxxsWDgjfqxRkxQLITy6ibodSLeRpDW
         Wf4oKn72QrzyOxQtrJ8bFY0eDMasxZjyUMPZ/f9+pN2N6oRYbJm6Ewkw9kCjVI5ppHCh
         4R4g==
X-Gm-Message-State: APjAAAX+KfpC8NswME/EjN9kRl47/F/ZQ8tL7Srn4u9ZoViJAHJHZWEd
        31k99TRpT4r8wdUap+LL2nLxGiR2z5Y=
X-Google-Smtp-Source: APXvYqxhvWi9pSNJMayGglXo1QxtMUthR2vzd1EQyuOCuPmCig8QFPe/41ieGMS+QMYndsF5FfWy8w==
X-Received: by 2002:adf:a28b:: with SMTP id s11mr7856539wra.16.1557495934819;
        Fri, 10 May 2019 06:45:34 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id k206sm11512651wmk.16.2019.05.10.06.45.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 May 2019 06:45:33 -0700 (PDT)
References: <20190503224326.21039-1-slongerbeam@gmail.com> <m3ftpr5lne.fsf@gmail.com> <ad321dec-4352-205e-3c04-e13865a279d5@xs4all.nl>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 0/8] Switch to sync registration for IPU subdevs
In-reply-to: <ad321dec-4352-205e-3c04-e13865a279d5@xs4all.nl>
Date:   Fri, 10 May 2019 14:45:33 +0100
Message-ID: <m3ftpms9s2.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,
On Fri 10 May 2019 at 12:18, Hans Verkuil wrote:
> On 5/6/19 11:16 PM, Rui Miguel Silva wrote:
>> Hi Steve,
>> On Fri 03 May 2019 at 23:43, Steve Longerbeam wrote:
>>> Switch to sync registration for the IPU internal sub-devices, re-organize
>>> modules, and a few other miscellaneous cleanups.
>> 
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
>
> This will only go to v5.3.
>
> I believe that Mauro plans to get [0] into 5.2, probably as a pull request
> once v5.2-rc1 has been released. So once that is merged Steve probably needs
> to do a rebase of this series.

Ok, looks good to me. Thanks for the reply.

---
Cheers,
	Rui

>
> Regards,
>
> 	Hans
>
>> 
>> ---
>> Cheers,
>> 	Rui
>> 
>> 
>> [0]: https://lore.kernel.org/linux-media/d5b4a68d-520e-0e93-d44e-07974058d690@xs4all.nl/
>> [1]: https://lore.kernel.org/linux-media/20190412164400.1270-1-rui.silva@linaro.org/
>> 
>> 
>>>
>>> History:
>>> v4:
>>> - Add **cc arg to __capture_try_fmt_vid_cap() to validate colorspace,
>>>   instead of calling ipu_pixelformat_to_colorspace().
>>> - Add error message if capture format validation failed.
>>> v3:
>>> - A couple patches did not compile/link. All patches now build so the
>>>   series is fully bisectable. No functional changes.
>>> v2:
>>> - Added a patch that improves the pipeline upstream/downstream search
>>>   functions, which no longer require the media device.
>>> - Add a patch to remove getting media device from v4l2_dev driver data.
>>>
>>>
>>> Steve Longerbeam (8):
>>>   media: staging/imx: Switch to sync registration for IPU subdevs
>>>   media: staging/imx: Pass device to alloc/free_dma_buf
>>>   media: staging/imx: Move add_video_device into capture_device_register
>>>   Revert "media: imx: Set capture compose rectangle in
>>>     capture_device_set_format"
>>>   media: staging/imx: Remove capture_device_set_format
>>>   media: staging/imx: Re-organize modules
>>>   media: staging/imx: Improve pipeline searching
>>>   media: staging/imx: Don't set driver data for v4l2_dev
>>>
>>>  drivers/staging/media/imx/Makefile            |  18 +-
>>>  drivers/staging/media/imx/imx-ic-common.c     |  68 +--
>>>  drivers/staging/media/imx/imx-ic-prp.c        |  36 +-
>>>  drivers/staging/media/imx/imx-ic-prpencvf.c   |  88 ++--
>>>  drivers/staging/media/imx/imx-ic.h            |   6 +-
>>>  drivers/staging/media/imx/imx-media-capture.c |  90 ++--
>>>  drivers/staging/media/imx/imx-media-csi.c     |  45 +-
>>>  .../staging/media/imx/imx-media-dev-common.c  | 346 +++++++++++++-
>>>  drivers/staging/media/imx/imx-media-dev.c     | 449 +-----------------
>>>  drivers/staging/media/imx/imx-media-fim.c     |   9 -
>>>  .../staging/media/imx/imx-media-internal-sd.c | 357 ++++++--------
>>>  drivers/staging/media/imx/imx-media-of.c      |  41 +-
>>>  drivers/staging/media/imx/imx-media-utils.c   | 170 +++----
>>>  drivers/staging/media/imx/imx-media-vdic.c    |  84 +---
>>>  drivers/staging/media/imx/imx-media.h         | 113 +++--
>>>  drivers/staging/media/imx/imx7-media-csi.c    |  43 +-
>>>  16 files changed, 857 insertions(+), 1106 deletions(-)
>> 

