Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B03222E8967
	for <lists+linux-media@lfdr.de>; Sun,  3 Jan 2021 01:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbhACAMn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Jan 2021 19:12:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbhACAMn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Jan 2021 19:12:43 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F01C061573
        for <linux-media@vger.kernel.org>; Sat,  2 Jan 2021 16:12:02 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id d13so27255166wrc.13
        for <linux-media@vger.kernel.org>; Sat, 02 Jan 2021 16:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ck3ahG9wWztIY7yMg0pVwx36AzZAbyYvyPdbo7hoeqI=;
        b=C60ntMSp2lyeaL1sncvuRaOwXuP4GqYXmE/wSe6KD0i0SsshcQK8RYwZiaFyTSISMX
         1znbaTbYsKe5qbqdru0403M9b5ZwBhF/tjfZENS5b1ZQTLUkiM01eZ9Zb/Krm1IoJwHN
         AoC6v9rYiKfqHGBHn1WBbq3lNtth91pv+WjiS8Ay8rqTm63gL0BmF0R4Gp7syy6EHdkM
         j6+gQsBWJ/vNTdryB64gng/QsOsXWeLjgy0/uEGlg8Lckgbxyh9U1blQytVPeECGbNWE
         LM4/x6+QgErofzKhfncClqzuC5BAnhRMQTML1vzFbeMoKI4U+0EuwWmWvvB1V3hUe2NW
         FNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ck3ahG9wWztIY7yMg0pVwx36AzZAbyYvyPdbo7hoeqI=;
        b=UsQBJUHKK02AXJlLpsCFaSRhG4UcTBref+xFGyd7U7YPYH9x7o1UDyodIEgCuhqNj7
         l8X3qamS3xmbFn/tNknGsXslJJyHUkfV+dUJYL6bQYW7MRCePQ04YfThtI435HsUA37Q
         sQhgomJ4M/BZaDx9xFXHN26tHS8xvg+Fh3NwoHPXlb3VL0/l63NJWojQ/RU7XI7ME9Nz
         RxGwRwooqJ4/0KgEUv4+pFybJIsO0o0QMW/uLQGTI7xy07GuKg2fu8lgOxSpWsWIvfiz
         m3rMD/8o4F+TV6Z0e2eLYdXckmhB0uU1bdo8IkGqGYSRDdvt/cFo+QtwBTOVwi6cT36z
         XAkg==
X-Gm-Message-State: AOAM531W4eY+Nin80IYOrt8F8aSCrOW4E0e12ON5g7aM62cvyJLv3Doi
        b342zJczsTkh7I22LyyQfUI=
X-Google-Smtp-Source: ABdhPJxoKl9B6yCFk9XDotnxBGL4RGp0cVIiHzcMKP4odyZkiUsnr7V1GxvE6puG/0PZGOkpdrTejg==
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr76047307wrt.396.1609632721225;
        Sat, 02 Jan 2021 16:12:01 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id s3sm24018370wmc.44.2021.01.02.16.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Jan 2021 16:12:00 -0800 (PST)
Subject: Re: [PATCH v1] media: ipu3-cio2: Add headers that ipu3-cio2.h is
 direct user of
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201230204405.62892-1-andriy.shevchenko@linux.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <5018d3aa-338f-7cb6-161e-4c0eefdffa93@gmail.com>
Date:   Sun, 3 Jan 2021 00:11:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201230204405.62892-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy

On 30/12/2020 20:44, Andy Shevchenko wrote:
> Add headers that ipu3-cio2.h is direct user of.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

For what it's worth:


Reviewed-by: Daniel Scally <djrscally@gmail.com>

Tested-by: Daniel Scally <djrscally@gmail.com>

> ---
>
> Dan, feel free to incorporate this into your series.
Thanks! I'll add it at the beginning so I can include this header in
cio2-bridge.h, with my tags added too I guess
>
>  drivers/media/pci/intel/ipu3/ipu3-cio2.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> index ccf0b85ae36f..62187ab5ae43 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> @@ -4,8 +4,26 @@
>  #ifndef __IPU3_CIO2_H
>  #define __IPU3_CIO2_H
>  
> +#include <linux/bits.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/kernel.h>
> +#include <linux/mutex.h>
>  #include <linux/types.h>
>  
> +#include <asm/page.h>
> +
> +#include <media/media-device.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/videobuf2-core.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +struct cio2_fbpt_entry;		/* defined here, after the first usage */
> +struct pci_dev;
> +
>  #define CIO2_NAME					"ipu3-cio2"
>  #define CIO2_DEVICE_NAME				"Intel IPU3 CIO2"
>  #define CIO2_ENTITY_NAME				"ipu3-csi2"
