Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C534A3D300C
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 01:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232412AbhGVW0r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 18:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbhGVW0r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 18:26:47 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D198AC061575;
        Thu, 22 Jul 2021 16:07:20 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id a80-20020a1c98530000b0290245467f26a4so592826wme.0;
        Thu, 22 Jul 2021 16:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kcMAq+vYImtg9x3yikhRSLQWDkrCJClS0YBuTVPr5G8=;
        b=BNP6aLmeZ+XgvFBiW3PUFt8JLuqYt6ywI/OHzzre1Narpoi/zja9pQPf/p7Lg2SEp1
         0WkY8YoS2DBJl82ZX0LCPk6KlTaEdjcBxTCteBlapRPqMxXJ91u6pmVE/iGJxBgW9swS
         U8CoYOzhm6ASwfPjAX73xfgv9ukUHfFH2DT+OS905Y2U8k4DZENCI6mE8XcvkuVUHJZ4
         3QIGDK+jKeP+K6xx71j0KrEeIfk9JY/IryGe5nkWDkNJx/PjeZJQxH10YLFVxUoIGYXO
         6Czt9APFAW76im4q5EBBfNEenR2wJLZld59EvvHYwAg5WVPCw3HcpFBjl6MHq5UilKGo
         Ifzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kcMAq+vYImtg9x3yikhRSLQWDkrCJClS0YBuTVPr5G8=;
        b=MWpyR1/4kjUZK94xK/jg7qN2mIb9WDxVm21ZMjkJwfpY30An5G2FI0UPx87tyNM0tj
         K3dIP2309m2j0z/xeRqHAGgAhx2/Niklxho1abDpv1/gIRQ4UGdiSd/JDhltAwxB4sVl
         y6xlbhJLuBKd0e1/86urPnz14Gz9b02+67WEM0CYZi0j055oq9oKTnj+FOcncFZUBFGX
         tzWPKJWTOgFHr2K0MOfyDOoffbZ51pWvs3Nle7dflmOyrcxsf9FKolrsqKPVrM8YOlYL
         +pCShNtZrU/Qp6LgJtlDTZMxAeycoUxlmefNfaAc+xGZss4h7gnXPDeV+mg+DNc5vI4R
         Nkvg==
X-Gm-Message-State: AOAM532OdYTK+j6sqrDxrESInh1L/BYp+Bdv58A/KM42plge+hikTRJy
        PIRPNmOmZ3PLZqQY6hstcvw=
X-Google-Smtp-Source: ABdhPJxzRRGnluDMLSY3iS3iFV4f4vW/EZQ7p+vLjlgQ8nyT7uh9GDif9qZr+U7avsyZQgFIxUFnkg==
X-Received: by 2002:a05:600c:3b98:: with SMTP id n24mr11415552wms.182.1626995239526;
        Thu, 22 Jul 2021 16:07:19 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id 129sm26501878wmz.26.2021.07.22.16.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 16:07:18 -0700 (PDT)
Subject: Re: [PATCH 13/13] media: ipu3-cio2: Add INT347A to cio2-bridge
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
References: <20210722203407.3588046-1-djrscally@gmail.com>
 <20210722203407.3588046-14-djrscally@gmail.com>
 <CAHp75Vc60J1kTs0Kv5ibc+5zqCTvRDDAcmHFKFDi-4Qd-rBHuA@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <339f54cb-6be1-1bfa-9b32-fe7dc28a447b@gmail.com>
Date:   Fri, 23 Jul 2021 00:07:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc60J1kTs0Kv5ibc+5zqCTvRDDAcmHFKFDi-4Qd-rBHuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy

On 22/07/2021 23:22, Andy Shevchenko wrote:
>
>
> On Thursday, July 22, 2021, Daniel Scally <djrscally@gmail.com
> <mailto:djrscally@gmail.com>> wrote:
>
>     ACPI _HID INT347A represents the OV8865 sensor, the driver for
>     which can
>     support the platforms that the cio2-bridge serves. Add it to the array
>     of supported sensors so the bridge will connect the sensor to the CIO2
>     device.
>
>     Signed-off-by: Daniel Scally <djrscally@gmail.com
>     <mailto:djrscally@gmail.com>>
>     ---
>      drivers/media/pci/intel/ipu3/cio2-bridge.c | 2 ++
>      1 file changed, 2 insertions(+)
>
>     diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c
>     b/drivers/media/pci/intel/ipu3/cio2-bridge.c
>     index 4657e99df033..6195abd7582c 100644
>     --- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
>     +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
>     @@ -24,6 +24,8 @@ static const struct cio2_sensor_config
>     cio2_supported_sensors[] = {
>             CIO2_SENSOR_CONFIG("INT33BE", 0),
>             /* Omnivision OV2680 */
>             CIO2_SENSOR_CONFIG("OVTI2680", 0),
>     +       /* Omnivision OV8865 */
>     +       CIO2_SENSOR_CONFIG("INT347A", 1, 360000000),
>
>
> I assume it may be positioned at any index in the array. I prefer to
> see them sorted by HID


Yeah any position's fine; I seem to struggle with alphabetisation for
some reason :) No problem, I'll order them properly in v2.

>
>
>  
>
>      };
>
>      static const struct cio2_property_names prop_names = {
>     -- 
>     2.25.1
>
>
>
> -- 
> With Best Regards,
> Andy Shevchenko
>
>
