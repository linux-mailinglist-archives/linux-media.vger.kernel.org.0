Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6896B667EFC
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 20:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239964AbjALTXw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 14:23:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234531AbjALTXZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 14:23:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C61C165F9
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 11:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673550719;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7kJGBPfLzsKWYBkbEqVSm0Taa6swycqnKArb8CckmYM=;
        b=a3c19iU/P/BKHCRjoquUaozyM+0yztltC6gmaWl9XFIKJit5J3EcbFPXAez44oSFaNcAK9
        XBxVvtwzyLwulfWJRCtLW4j47vwF7cWQEKUhW6kYCYM2Qgv3DAIs/OHAIxbxiuvYQIGBdF
        f1m8ugN+mN6ojtBxiV4HMDC3OgAPAKs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-451-pOcZJPs9PtqEt8TXpmYWPQ-1; Thu, 12 Jan 2023 14:11:57 -0500
X-MC-Unique: pOcZJPs9PtqEt8TXpmYWPQ-1
Received: by mail-ej1-f71.google.com with SMTP id ga21-20020a1709070c1500b007c171be7cd7so13548307ejc.20
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 11:11:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7kJGBPfLzsKWYBkbEqVSm0Taa6swycqnKArb8CckmYM=;
        b=L4Fd+LAj7bqAymfjugExhJahv3h61XX9FwEJUQF78+g1Ukgem6sTOQD7QHVelgYLbp
         aYMUA2F0dvGb8mPqPTqmXXXAspZol7eX8TLYeg+MaNdrCgoyZe/AQN3BlijaYFL1zj8j
         ueXLXbSOJxqqcP/Rb1SvvMveNgx11eayw50lxLsdIavs/ThUX0yqApdvPbWAaw4e+3X1
         sGBXMMUeLw46C4X4WwnEXoBt1j2R4svCTILptuLvEkl9i5Jx4y049mbnD84PLZs4wlSV
         zh7PXVuk3zkyoNINPIuzHX5FiA7MCKaRTvcrmYY4GT3owGwb2aYyoyCbeV38bJkDxRXK
         cDYQ==
X-Gm-Message-State: AFqh2kqhFcY/fV4Rzyw3hqgLacICWAufmZxHdB/mhodtnfpgknEuCHDr
        vIuoeRD1Zp1iQJ/KUnCmbS6Uj3uqBQIoGjzJ8AuHdC+cI4TUgT9mqD3jmgOYBcNQ7/MzUDookyP
        8s3ygIH3B9bmKOQIus3IU5Po=
X-Received: by 2002:a17:906:dff8:b0:865:d833:19ca with SMTP id lc24-20020a170906dff800b00865d83319camr3219701ejc.55.1673550715155;
        Thu, 12 Jan 2023 11:11:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXupsg0nk3dnExE/Z0ZnGKDOMbW6SWx9S6Pdu2nqRxWT585OfzoLrCPejk3o98mkLuk8WHUhtQ==
X-Received: by 2002:a17:906:dff8:b0:865:d833:19ca with SMTP id lc24-20020a170906dff800b00865d83319camr3219689ejc.55.1673550714958;
        Thu, 12 Jan 2023 11:11:54 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id cb1-20020a170906a44100b0084d199d7f08sm7694089ejb.21.2023.01.12.11.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 11:11:54 -0800 (PST)
Message-ID: <ee2a3678-9beb-0fb2-a9a2-c5257d1c216a@redhat.com>
Date:   Thu, 12 Jan 2023 20:11:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: int3472/discrete: Ensure the clk/power
 enable pins are in output mode
Content-Language: en-US, nl
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, linux-media@vger.kernel.org
References: <20230111201426.947853-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230111201426.947853-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 1/11/23 21:14, Hans de Goede wrote:
> acpi_get_and_request_gpiod() does not take a gpio_lookup_flags argument
> specifying that the pins direction should be initialized to a specific
> value.
> 
> This means that in some cases the pins might be left in input mode, causing
> the gpiod_set() calls made to enable the clk / regulator to not work.
> 
> One example of this problem is the clk-enable GPIO for the ov01a1s sensor
> on a Dell Latitude 9420 being left in input mode causing the clk to
> never get enabled.
> 
> Explicitly set the direction of the pins to output to fix this.
> 
> Fixes: 5de691bffe57 ("platform/x86: Add intel_skl_int3472 driver")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be fixes) branch now.

Thank you all for the reviews.

Regards,

Hans

> ---
> Changes in v4:
> - Split out of the "int3472/media privacy LED support" series, so
>   that this can be applied separately as it really is a bug-fix
> ---
>  drivers/platform/x86/intel/int3472/clk_and_regulator.c | 3 +++
>  drivers/platform/x86/intel/int3472/discrete.c          | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> index b2342b3d78c7..74dc2cff799e 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -181,6 +181,9 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>  		return PTR_ERR(int3472->regulator.gpio);
>  	}
>  
> +	/* Ensure the pin is in output mode and non-active state */
> +	gpiod_direction_output(int3472->regulator.gpio, 0);
> +
>  	cfg.dev = &int3472->adev->dev;
>  	cfg.init_data = &init_data;
>  	cfg.ena_gpiod = int3472->regulator.gpio;
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 974a132db651..c42c3faa2c32 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -168,6 +168,8 @@ static int skl_int3472_map_gpio_to_clk(struct int3472_discrete_device *int3472,
>  			return (PTR_ERR(gpio));
>  
>  		int3472->clock.ena_gpio = gpio;
> +		/* Ensure the pin is in output mode and non-active state */
> +		gpiod_direction_output(int3472->clock.ena_gpio, 0);
>  		break;
>  	case INT3472_GPIO_TYPE_PRIVACY_LED:
>  		gpio = acpi_get_and_request_gpiod(path, pin, "int3472,privacy-led");
> @@ -175,6 +177,8 @@ static int skl_int3472_map_gpio_to_clk(struct int3472_discrete_device *int3472,
>  			return (PTR_ERR(gpio));
>  
>  		int3472->clock.led_gpio = gpio;
> +		/* Ensure the pin is in output mode and non-active state */
> +		gpiod_direction_output(int3472->clock.led_gpio, 0);
>  		break;
>  	default:
>  		dev_err(int3472->dev, "Invalid GPIO type 0x%02x for clock\n", type);

