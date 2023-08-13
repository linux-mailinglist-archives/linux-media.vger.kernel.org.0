Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6194677A778
	for <lists+linux-media@lfdr.de>; Sun, 13 Aug 2023 17:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjHMPbE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Aug 2023 11:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjHMPbD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Aug 2023 11:31:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D95E0
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 08:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691940617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KVrWFD8v3bwv2ACGGWu8o4gJmDRF+GmURj+vmIcVrOU=;
        b=Epa1yTISxscooTxFmGkykWxYoGD2Wm0LE4dZi7awGgot4vqE57YWEUrGMP4YXBdscTBQf/
        AnxRG6MLdI1eVwJatk5J/Qn37i3R4N4mhdJCfzSvQNHi7FgGLTA2ZBvvvGQAyVQSXGEyDf
        i96zCxS9ECE+lEEMeCkuqF7y40Y2eUc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-IXm6zSioOJSTtrNGjHBNNA-1; Sun, 13 Aug 2023 11:30:16 -0400
X-MC-Unique: IXm6zSioOJSTtrNGjHBNNA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-99bcb13d8ddso240879266b.0
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 08:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691940615; x=1692545415;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KVrWFD8v3bwv2ACGGWu8o4gJmDRF+GmURj+vmIcVrOU=;
        b=hitXZkFR8/bbJHY4Qw2ddiPVY+lPQjuUW9fOE30FBMSxqzKkusxD+xBfzV0QioLVln
         9c9kTJeCzD6ecBeSPCnc1HXU+CkyUzCJEwwCiovX0OkFffMkN85a0QiDNnhJhYDPFeYS
         sxKpPnQTFo5e/3Ka5KN8StwjlpBp+rdZUH0AvyvqnaTZFWmTK3LG5cCm3kFBODiEILX9
         NIkoMjfnFoa52QCh9o2bKJwB8Ia5aCeEDpFg+B+Y5ENc0eyyEd9xOieZowv/afTdAY+P
         HcycCsFBAePJ0XTeDUVGOR2pIbbWV7T9F5yY/bmFxaqbyLpJ2EFoBxCrcJIuWaaXcyA9
         hZZA==
X-Gm-Message-State: AOJu0Yyi5JR+OncFm6CfFbiyKZkVeGRBsDsK8jPfIUP2u4dWVbZLayif
        VLCRDu2FrtjEVau3b6fSzXacJKPrwCxfIXPi3MyPdtHPSroP8t6eDHr/z8XZcwrp8feA9DmnW9M
        ofOOzT8N42ga8E8Ht0QBLevY=
X-Received: by 2002:a17:906:3284:b0:99c:570a:e23e with SMTP id 4-20020a170906328400b0099c570ae23emr6215096ejw.24.1691940615508;
        Sun, 13 Aug 2023 08:30:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIik3ZGvenTZOH6kovFW01OsGI5chXF71X2V0wVw5m5BTrkOxIU6EGdaDJf+9lprOCbypNLg==
X-Received: by 2002:a17:906:3284:b0:99c:570a:e23e with SMTP id 4-20020a170906328400b0099c570ae23emr6215085ejw.24.1691940615126;
        Sun, 13 Aug 2023 08:30:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w14-20020a1709060a0e00b0099b5a71b0bfsm4654052ejf.94.2023.08.13.08.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Aug 2023 08:30:14 -0700 (PDT)
Message-ID: <dc73e131-5779-613d-90ee-bdd3f7eccaac@redhat.com>
Date:   Sun, 13 Aug 2023 17:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] media: atomisp: Disable VCM for OV5693 for now
Content-Language: en-US, nl
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230813152645.45834-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230813152645.45834-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 8/13/23 17:26, Hans de Goede wrote:
> ov5693 sensor modules have a VCM, but for unknown reasons
> the sensor fails to start streaming when instantiating
> a VCM i2c-client (and the runtime-pm link between VCM
> and sensor).
> 
> Disable the VCM for now, until this is resolved.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Note I have applied this series and 3 other pending atomisp patches from me to my media-atomisp branch now.

Sorry for not giving any time for review, but I believe these to be obviously correct (or at least the right thing to do for now for 1/2) and I'm preparing my media-atomisp branch to send a pull-req to Mauro for the upcoming 6.6 cycle.

Regards,

Hans




> ---
>  drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> index 03940c11505f..2483eaeeac73 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> @@ -521,7 +521,12 @@ static char *atomisp_csi2_get_vcm_type(struct acpi_device *adev)
>  }
>  
>  static const struct acpi_device_id atomisp_sensor_configs[] = {
> -	ATOMISP_SENSOR_CONFIG("INT33BE", 2, true),	/* OV5693 */
> +	/*
> +	 * FIXME ov5693 modules have a VCM, but for unknown reasons
> +	 * the sensor fails to start streaming when instantiating
> +	 * an i2c-client for the VCM, so it is disabled for now.
> +	 */
> +	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
>  	{}
>  };
>  

