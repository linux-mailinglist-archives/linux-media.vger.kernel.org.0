Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E60845E1BC
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 21:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350509AbhKYUmr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 15:42:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46437 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1357070AbhKYUkq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 15:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637872654;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iqe69OBEaV3O09SeWtlVBGY+PWCf0/XnLEEIUE/qX+c=;
        b=dOdloyE+5QUkn9px8MKZL6Kc7mYh1wzSlwVNQeWgIkQ8iJ59C4Q1yELDQoZkVkmrOU+d+r
        VPV5rnxOupTmH9b7CFW/vAPt1ZAtQJIN3xfnja+kMmFpGGe2LcC5afKz040eQpbG9NSmFd
        FiZQcqS/09P1zwXkEK4cmSKaBr0ceho=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-QUtg39XxMDuar9P5mPSdog-1; Thu, 25 Nov 2021 15:37:33 -0500
X-MC-Unique: QUtg39XxMDuar9P5mPSdog-1
Received: by mail-ed1-f72.google.com with SMTP id b15-20020aa7c6cf000000b003e7cf0f73daso6178137eds.22
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 12:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iqe69OBEaV3O09SeWtlVBGY+PWCf0/XnLEEIUE/qX+c=;
        b=V/w4l4lzYVUl0ZC02g+jJ0xpAVo2vvYq4zACWygTYVAsAZp4YILQlRgv+sZp9apwna
         pqQNyj+RP3+3P0D1FT8S7PDcAUu1mhP824BhH2TcCVAEVcGlOhd9Dv67eF3PW4act759
         3ugLq7lbtrVKAgNsinCVRhYIzU6uuL5s2+PUKGOTl/tUQYtnGj25EUnLrdR1jnXiAtJz
         PEF6kpI5m0f8aFrxX59CybMRxwNRXN04dfwdlV3LQsuZKYdZflrCmkSvH9apdNC0SwBr
         pdYjTO4/E897lxpjpP4upxlfTrIAGiD4ikzcTKeXHvYqx3wP60cbUQhWTTUaBndzLzM1
         /j0Q==
X-Gm-Message-State: AOAM532z20LXPhJIkWJA1zymCJ8uTcr8m4KsF7FiPOGc6sBi8P1AWn5r
        rZ5jZA5yCJt741wKE5s1jOUMvqFJuIqocRpwM1YDPmyBgbhkprA3ws3VgcHOH7hApCLm0sB1hdt
        Gce+m+Bj8W4akYS/VZx9uLr4=
X-Received: by 2002:a17:906:8051:: with SMTP id x17mr35205437ejw.473.1637872652110;
        Thu, 25 Nov 2021 12:37:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxr1JC/6Lne9TBtPbbwNOd01D3PJh1TmeYClFBWx0Xg+qCfls/008Q8f8coMoXdiJYQOnLLWA==
X-Received: by 2002:a17:906:8051:: with SMTP id x17mr35205405ejw.473.1637872651919;
        Thu, 25 Nov 2021 12:37:31 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id my2sm2049857ejc.109.2021.11.25.12.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 12:37:31 -0800 (PST)
Message-ID: <e3370781-c697-007e-5414-c83493c9183e@redhat.com>
Date:   Thu, 25 Nov 2021 21:37:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 00/17] Extensions to ov8865 driver
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20211123000017.43187-1-djrscally@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/23/21 01:00, Daniel Scally wrote:
> Hello all
> 
> This series extends the ov8865 driver with:
> 
> * Support for binding to ACPI enumerated devices.
> * Support for a 19.2MHz clock in addition to existing 24MHz clock support
> * Another v4l2_subdev_pad_ops callback
> * 4 more V4L2 controls
> * makes the driver supported by the cio2-bridge
> 
> There's also a little bit of tidying that I did along the way.
> 
> The series is tested on an MS Surface Go 2.


Thank you.

The patches look good to me and I've tested this series on a Microsoft Surface
Go (version 1) and everything works as it should:

Acked-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> Series level changes since v4:
> 
> 	- Moved the two patches fixing issues to the head of the series and
> 	added Fixes tags
> 	- Added a new patch fixing the maximum gain value
> 
> Daniel Scally (16):
>   media: i2c: Re-order runtime pm initialisation
>   media: i2c: Add ACPI support to ov8865
>   media: i2c: Fix incorrect value in comment
>   media: i2c: Defer probe if not endpoint found
>   media: i2c: Support 19.2MHz input clock in ov8865
>   media: i2c: Add .get_selection() support to ov8865
>   media: i2c: Switch control to V4L2_CID_ANALOGUE_GAIN
>   media: i2c: Add vblank control to ov8865
>   media: i2c: Add hblank control to ov8865
>   media: i2c: Update HTS values in ov8865
>   media: i2c: cap exposure at height + vblank in ov8865
>   media: i2c: Add controls from fwnode to ov8865
>   media: i2c: Switch exposure control unit to lines
>   media: i2c: Use dev_err_probe() in ov8865
>   media: i2c: Fix max gain in ov8865
>   media: ipu3-cio2: Add INT347A to cio2-bridge
> 
> Hans de Goede (1):
>   media: i2c: ov8865: Fix lockdep error
> 
>  drivers/media/i2c/ov8865.c                 | 466 +++++++++++++++------
>  drivers/media/pci/intel/ipu3/cio2-bridge.c |   2 +
>  2 files changed, 334 insertions(+), 134 deletions(-)
> 

