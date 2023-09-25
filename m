Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17C137AD768
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 14:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbjIYMBh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 08:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbjIYMBg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 08:01:36 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB2E7DA
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 05:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695643290; x=1727179290;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FUIllxOIBeguoRNqhYUHCu/UQR6k3r+FpKN3w0rUMho=;
  b=wpfnBpimzk0dezbk3KNzPhgAlBMaq7gH2x0GkGNwl/2/zCsv5IbZYnIK
   e/sItfHIidAdfA0MplILAX+01kei98m5mpL9NJEJi7lnuJJiR7KdUl3fD
   TCOMIRrJ4Lw6S/LXT/YtxaDrGtMyaTXiMIjPPvGIMi5tg3AND5VEvRDlO
   Yk0vimqbmZmT5tnACBH5HxFrX1opyybFFZmum64duhEoKsAOfq4KZlP+F
   lF1f8KcjLFLp0QejawQtkrA/Ht4PKcqW95PLoAugvDNBbZl+0oqteXdRd
   N/efoypDw38UReLcywCmp6ApDPg8IedMYrWYys/ZREdeGBwXuHail2ipp
   Q==;
X-CSE-ConnectionGUID: qkdePJEoQ/iKX2Qg0djitg==
X-CSE-MsgGUID: vWanp5HUR/O8mhmE/YSokw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="236986762"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Sep 2023 05:01:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 25 Sep 2023 05:01:27 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 25 Sep 2023 05:01:26 -0700
Message-ID: <cc8d4b02-68bb-9245-7027-f6ac9efd224b@microchip.com>
Date:   Mon, 25 Sep 2023 14:01:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCHv2 16/23] media: microchip: don't set bus_info
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>
CC:     Arnd Bergmann <arnd@kernel.org>,
        Eugen Hristev <eugen.hristev@collabora.com>
References: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
 <20230923152107.283289-17-hverkuil-cisco@xs4all.nl>
Content-Language: en-US, fr-FR
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230923152107.283289-17-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/09/2023 at 17:21, Hans Verkuil wrote:
> Let the V4L2 core fill this in.
> 
> Fixes these compiler warnings:
> 
> drivers/media/platform/microchip/microchip-isc-base.c: In function 'isc_querycap':
> drivers/media/platform/microchip/microchip-isc-base.c:486:28: warning: '%s' directive output may be truncated writing up to 35 bytes into a region of size 23 [-Wformat-truncation=]
>    486 |                  "platform:%s", isc->v4l2_dev.name);
>        |                            ^~
> drivers/media/platform/microchip/microchip-isc-base.c:485:9: note: 'snprintf' output between 10 and 45 bytes into a destination of size 32
>    485 |         snprintf(cap->bus_info, sizeof(cap->bus_info),
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    486 |                  "platform:%s", isc->v4l2_dev.name);
>        |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/media/platform/microchip/microchip-isc-base.c: In function 'isc_mc_init':
> drivers/media/platform/microchip/microchip-isc-base.c:1996:76: warning: '%s' directive output may be truncated writing up to 35 bytes into a region of size 23 [-Wformat-truncation=]
>   1996 |         snprintf(isc->mdev.bus_info, sizeof(isc->mdev.bus_info), "platform:%s",
>        |                                                                            ^~
> drivers/media/platform/microchip/microchip-isc-base.c:1996:9: note: 'snprintf' output between 10 and 45 bytes into a destination of size 32
>   1996 |         snprintf(isc->mdev.bus_info, sizeof(isc->mdev.bus_info), "platform:%s",
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   1997 |                  isc->v4l2_dev.name);
>        |                  ~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Eugen Hristev <eugen.hristev@collabora.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   drivers/media/platform/microchip/microchip-isc-base.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
> index 8dbf7bc1e863..1f8528844497 100644
> --- a/drivers/media/platform/microchip/microchip-isc-base.c
> +++ b/drivers/media/platform/microchip/microchip-isc-base.c
> @@ -478,12 +478,8 @@ static const struct vb2_ops isc_vb2_ops = {
>   static int isc_querycap(struct file *file, void *priv,
>                          struct v4l2_capability *cap)
>   {
> -       struct isc_device *isc = video_drvdata(file);
> -
>          strscpy(cap->driver, "microchip-isc", sizeof(cap->driver));
>          strscpy(cap->card, "Microchip Image Sensor Controller", sizeof(cap->card));
> -       snprintf(cap->bus_info, sizeof(cap->bus_info),
> -                "platform:%s", isc->v4l2_dev.name);
> 
>          return 0;
>   }
> @@ -1993,8 +1989,6 @@ int isc_mc_init(struct isc_device *isc, u32 ver)
>          strscpy(isc->mdev.driver_name, KBUILD_MODNAME,
>                  sizeof(isc->mdev.driver_name));
>          strscpy(isc->mdev.model, match->compatible, sizeof(isc->mdev.model));
> -       snprintf(isc->mdev.bus_info, sizeof(isc->mdev.bus_info), "platform:%s",
> -                isc->v4l2_dev.name);
>          isc->mdev.hw_revision = ver;
> 
>          media_device_init(&isc->mdev);
> --
> 2.40.1
> 

