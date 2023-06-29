Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29BE5742913
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 17:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232492AbjF2PEu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jun 2023 11:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232499AbjF2PEr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jun 2023 11:04:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFEE230C4
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 08:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688051040;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ttEB+OK6KENb+ypGCwa1/2v5yEw3o94baRMAlYka2S0=;
        b=EUmdgyKPVRq3zkcLP6YCfh35+qLI4iKi9JKqrq2rJinG5rOM6eBzdI7Z4aMNdL9TP7lW3o
        CRHiZs6QxaBETjpsBMvvs6pj89m52l5siLiUSNc9tDhXEuZCqPPgS1wY5NWmhBQGk04eSu
        eTB2HkPwVU1X/ON0rEntg6igWMvi1vE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-jGz4p583P92P13IHPyxGWw-1; Thu, 29 Jun 2023 11:03:54 -0400
X-MC-Unique: jGz4p583P92P13IHPyxGWw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-51d96b7f36bso516249a12.2
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 08:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688051028; x=1690643028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttEB+OK6KENb+ypGCwa1/2v5yEw3o94baRMAlYka2S0=;
        b=QmZcp8CaoRqpmueduWpyNCaavpHvaUXW5+6ksZkMsZWx+43vOK2iHBrTfBrW1sCSgK
         COES8Jw8NyYx8XFiVs5rY/KDqxS262sEH/sFoOwIBrRpUG8rNRCYgJj61slk/OstEJN0
         zuiQTul2UB0Pt74UpZoCSLQMOCqtqO5D8My7fE6r+lMqWB12K9EKsUWC2DZ/2waRBr/o
         XvckH3XYX3ajL6ghiqKR+BdRomX1J9RkNcw31+k7h5GQBbMERYNnjeOh/lcgEhrv4HA1
         YVqaR7ipuix4Ag/jqwdRinLxVBZZ15EocBg2CB8X/M0jtP42bf2H806bq9QWus2IR4/6
         UFFA==
X-Gm-Message-State: AC+VfDysY55rd7vMCZLUGKNbNy/A5T1xFzORvau2g41iCK5O5syb963T
        a0M6IsU0ssyVx+6eEAEiESMs3L+nFDTymofO0+OnT8kd1w4+Z3i+b1iD+IVngC81qIdTJSqY1Mk
        RoUicr3ah/keJIieaN3m69AdU5hYjQQk=
X-Received: by 2002:aa7:cc11:0:b0:514:96f9:4f20 with SMTP id q17-20020aa7cc11000000b0051496f94f20mr22299290edt.41.1688051028494;
        Thu, 29 Jun 2023 08:03:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5oxuCde35n7o4ubhEime+ZM1EF68W38PZmn7uw001fH6lV8lLA5tmuNyD2ui9rdnZSXIXvxA==
X-Received: by 2002:aa7:cc11:0:b0:514:96f9:4f20 with SMTP id q17-20020aa7cc11000000b0051496f94f20mr22299276edt.41.1688051028189;
        Thu, 29 Jun 2023 08:03:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id rp25-20020a170906d97900b0098e17ea781csm6158412ejb.94.2023.06.29.08.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 08:03:47 -0700 (PDT)
Message-ID: <712d9f02-9a97-3e07-94b4-9e6abb7fe9cd@redhat.com>
Date:   Thu, 29 Jun 2023 17:03:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/1] media: i2c: Select V4L2_FWNODE and
 VIDEO_V4L2_SUBDEV_API for sensors
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Scally <dan.scally@ideasonboard.com>, hverkuil@xs4all.nl
References: <20230629122648.924600-1-sakari.ailus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230629122648.924600-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/29/23 14:26, Sakari Ailus wrote:
> Select V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API for all sensor drivers. This
> also adds the options to drivers that don't specifically need them, these
> are still seldom used drivers using old APIs. The upside is that these
> should now all compile --- many drivers have had missing dependencies.
> 
> The "menu" is replaced by selectable "menuconfig" to select the needed
> V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API options.
> 
> Also select MEDIA_CONTROLLER which VIDEO_V4L2_SUBDEV_API effectively
> depends on.
> 
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
> since v1:
> 
> - Select MEDIA_CONTROLLER, don't depend on it.
> 
>  drivers/media/i2c/Kconfig | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 815c83135021c..c7ffaa79abeb9 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -25,8 +25,15 @@ config VIDEO_IR_I2C
>  # V4L2 I2C drivers that are related with Camera support
>  #
>  
> -menu "Camera sensor devices"
> -	visible if MEDIA_CAMERA_SUPPORT
> +menuconfig VIDEO_CAMERA_SENSOR
> +	bool "Camera sensor devices"
> +	depends on MEDIA_CAMERA_SUPPORT
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	default y
> +
> +if VIDEO_CAMERA_SENSOR
>  
>  config VIDEO_APTINA_PLL
>  	tristate
> @@ -810,7 +817,7 @@ config VIDEO_ST_VGXY61
>  source "drivers/media/i2c/ccs/Kconfig"
>  source "drivers/media/i2c/et8ek8/Kconfig"
>  
> -endmenu
> +endif
>  
>  menu "Lens drivers"
>  	visible if MEDIA_CAMERA_SUPPORT

