Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C49A87423CC
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 12:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbjF2KPw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jun 2023 06:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjF2KPP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jun 2023 06:15:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08EA030F1
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 03:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688033465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Bijh5chUEAjtU4inzJ6s9CVJJTgZ7eyxRP2EplrQgNw=;
        b=TIRVUJnYMxreJX/pO3jhBFk9RIR5Bs/wycirgBLwRQAcsKtmWagWNFimP5n9/gspXkHLfC
        9UwkfkP+Swm+5xjBK4BG4snf0ev1BxM/4AzeT3GLyl6kiehmyxTFcVY+L/J/3wJwgzjZla
        PNh4B+EQwWFGBVVro2h2J5ZWcEZa07E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-3IeIyPFdOCidOJD2cIKeew-1; Thu, 29 Jun 2023 06:11:04 -0400
X-MC-Unique: 3IeIyPFdOCidOJD2cIKeew-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-987accb96dbso47384466b.2
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 03:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688033462; x=1690625462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bijh5chUEAjtU4inzJ6s9CVJJTgZ7eyxRP2EplrQgNw=;
        b=Cvay4Z7LtV3QdwCd2UbR7Yxci9VgUpwPOGxcgzcIv8booIaiU58uUyw+P4arWj9sZ3
         SjBwwqf1QLong1WNMPcXtIkG+pG8LKQ38fpe3Yjd7ftQ+PxUtkQMxkZo6wzRxdoH9z1Z
         1M2LsTF5wB0dfi2uWqedjznKP3e5sCyRCoSe+oB87Y8XgpuQRxZASYAo3LNxFKtWIN49
         oXYNQ0ZbBMsLrUWcMZp46/U3QZ8+EDZMA9IrLkgs6JmO+vGvu+/u3jI5qjseN5EHpMBD
         K4OM8SVEqHWRGc5j13eCO/kejS8Nl0itILMLuOkKuvvLuxltVmP6r07h8oatujStafGT
         2Rdw==
X-Gm-Message-State: AC+VfDxBsR+o3mX1Ik5MrKd+qx4WZ6NynJgxflAHKbIZRudanTSxpSiv
        AGGfTmm3xdbdnXp1+z3g/b9jKMDxMZtS3SMMj1OSNbBVxL39gn+fGbNhqCdK05H/MgA9bv30REe
        QPjMGXjGsby/uRTX4qUtf0lx1P7qOUJs=
X-Received: by 2002:a17:907:26cc:b0:98a:29ca:c58e with SMTP id bp12-20020a17090726cc00b0098a29cac58emr22130827ejc.27.1688033462681;
        Thu, 29 Jun 2023 03:11:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4IYgmtgSXeupEWER9mBQVhXYF+0IBmsNmF7gtkUfekKxDtHL/16/K5WKz123cJAAeprw4TbQ==
X-Received: by 2002:a17:907:26cc:b0:98a:29ca:c58e with SMTP id bp12-20020a17090726cc00b0098a29cac58emr22130817ejc.27.1688033462364;
        Thu, 29 Jun 2023 03:11:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id k13-20020a17090646cd00b009889c4bd8absm6604845ejs.216.2023.06.29.03.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 03:11:01 -0700 (PDT)
Message-ID: <199f7d7a-ae7a-3a08-0a92-14511db0daf5@redhat.com>
Date:   Thu, 29 Jun 2023 12:11:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] media: i2c: Select V4L2_FWNODE and
 VIDEO_V4L2_SUBDEV_API for sensors
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Scally <dan.scally@ideasonboard.com>, hverkuil@xs4all.nl
References: <20230629081116.919253-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230629081116.919253-1-sakari.ailus@linux.intel.com>
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

Hi Sakari,

On 6/29/23 10:11, Sakari Ailus wrote:
> Select V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API for all sensor drivers. This
> also adds the options to drivers that don't specifically need them, these
> are still seldom used drivers using old APIs. The upside is that these
> should now all compile --- many drivers have had missing dependencies.
> 
> The "menu" is replaced by selectable "menuconfig" to select the needed
> V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API options.
> 
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thank you for working on this. This looks good to me, but shouldn't
all the existing sensor Kconfig bits then have their depends on
MEDIA_CAMERA_SUPPORT / MEDIA_CONTROLLER and select V4L2_FWNODE / VIDEO_V4L2_SUBDEV_API
bits dropped ?

Regards,

Hans


> ---
>  drivers/media/i2c/Kconfig | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 815c83135021c..1d64b8a94b955 100644
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
> +	depends on MEDIA_CONTROLLER
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

