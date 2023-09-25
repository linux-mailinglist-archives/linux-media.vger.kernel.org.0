Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 665B97AD76B
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 14:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbjIYMC1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 08:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbjIYMC0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 08:02:26 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21D4DA
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 05:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695643341; x=1727179341;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IKzqlW9kRZprnhOSbUk5D2bSs7UFIBvMP9CfeKAfLpg=;
  b=PKvtLdRsnwf0Zut5qJbU/4y2iMGD734plPbgF1y/1ktS8FvuvX2fDP8r
   Z+mgQlsUTTcIM7GYOASJ0KwrTpwf9NaJejhMPXCDSKQFsynNH+e7qX8AR
   cGHEV5nJ3mB/7sjNncKe9jyHdfqyWlueRvKYOdCdVaGcFJR/jBoqZoOmR
   O9dX2tnS4lWffrULmqyHvGNmjpMLchiwffK9PK13qY04nxZxLGaukjFJ6
   j2IxZ2hGT0/rM5k/9XyDSOTp8zIqhPmRjWWFnFykGPy5TNXFOj164927z
   dYp7Xe8yEXZNAmzmgdcECpEVBRAbQJSz5UVbT8fM8WVlIfDP443bqGDDm
   w==;
X-CSE-ConnectionGUID: 0a5P/OeDQ3+gmaNevlYMow==
X-CSE-MsgGUID: NKRuMCWZQpCUftI/GI4Bkw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="236986986"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Sep 2023 05:02:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 25 Sep 2023 05:02:19 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 25 Sep 2023 05:02:18 -0700
Message-ID: <343979e8-f0de-5abe-e6d0-978e5e668e04@microchip.com>
Date:   Mon, 25 Sep 2023 14:01:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCHv2 19/23] media: atmel: drop bus_info
Content-Language: en-US, fr-FR
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>
CC:     Arnd Bergmann <arnd@kernel.org>,
        Eugen Hristev <eugen.hristev@collabora.com>
References: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
 <20230923152107.283289-20-hverkuil-cisco@xs4all.nl>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230923152107.283289-20-hverkuil-cisco@xs4all.nl>
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
> Fixes this warning:
> 
> drivers/staging/media/deprecated/atmel/atmel-isc-base.c: In function 'isc_querycap':
> drivers/staging/media/deprecated/atmel/atmel-isc-base.c:496:28: warning: '%s' directive output may be truncated writing up to 35 bytes into a region of size 23 [-Wformat-truncation=]
>    496 |                  "platform:%s", isc->v4l2_dev.name);
>        |                            ^~
> drivers/staging/media/deprecated/atmel/atmel-isc-base.c:495:9: note: 'snprintf' output between 10 and 45 bytes into a destination of size 32
>    495 |         snprintf(cap->bus_info, sizeof(cap->bus_info),
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    496 |                  "platform:%s", isc->v4l2_dev.name);
>        |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Eugen Hristev <eugen.hristev@collabora.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Thanks Hans for having take care of this for ISI and ISC. Best regards,
   Nicolas

> ---
>   drivers/staging/media/deprecated/atmel/atmel-isc-base.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
> index f5d963904201..8e26663cecb6 100644
> --- a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
> +++ b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
> @@ -488,12 +488,8 @@ static const struct vb2_ops isc_vb2_ops = {
>   static int isc_querycap(struct file *file, void *priv,
>                           struct v4l2_capability *cap)
>   {
> -       struct isc_device *isc = video_drvdata(file);
> -
>          strscpy(cap->driver, "microchip-isc", sizeof(cap->driver));
>          strscpy(cap->card, "Atmel Image Sensor Controller", sizeof(cap->card));
> -       snprintf(cap->bus_info, sizeof(cap->bus_info),
> -                "platform:%s", isc->v4l2_dev.name);
> 
>          return 0;
>   }
> --
> 2.40.1
> 

