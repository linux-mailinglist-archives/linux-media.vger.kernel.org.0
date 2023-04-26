Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 526396EF403
	for <lists+linux-media@lfdr.de>; Wed, 26 Apr 2023 14:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240651AbjDZMJD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Apr 2023 08:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240408AbjDZMJB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Apr 2023 08:09:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17CE9EC
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 05:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682510895;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E7D6zQfSRqsoWm7uFzM+H07JsF/GP5PB8m9+w162O14=;
        b=AqQuqGteskqnnE0IdwsgaTljZLsEH9Yb1z0bVnS/gAVRgYQGGgvJ+1UEmGR5COg1mN9ESG
        paEUJRgq7lkArz1lFlbOVE6hhqYvBMOkCW+kXYPNqMliGO1DvNP9AwX7mODuhpNhIXrfwR
        909M2gPrlJD+yGeakajIj1oGGJDoue4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-qdCeU5e4NIq1uq_EyK3OxA-1; Wed, 26 Apr 2023 08:08:13 -0400
X-MC-Unique: qdCeU5e4NIq1uq_EyK3OxA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a355cf318so760134666b.2
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 05:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682510892; x=1685102892;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E7D6zQfSRqsoWm7uFzM+H07JsF/GP5PB8m9+w162O14=;
        b=YVu4/NihdvvuaiewelZcKiF7v/11eztMsXfXoBqekeMUH8t1PRyJVHYs5s6XePFGvG
         gIWX5XOn4BQC3+yp32EJjouYkj10VNCcNoY+Zx32z29DloyYAUeThBTJhtRiB/dzWo6K
         uzt4h89nICWkefyM+tqcQoJKD+NSyRYhF2zuB6RUX3J77GoNYYsOxnqImrklmUwunJP6
         27D01SfO2dRrxY8Ji+gZ60rgPom+DGer+1N3dghy805BC15dTckDjSsYPp05zSvvtINd
         KRFCSLoSBAukMETk6jFtY65NE4AK690KRNpNkZCWc/Qq2AgAA++6H6wn1prYMVBWn321
         oOCA==
X-Gm-Message-State: AAQBX9fHmvx8EY321ezoqhSXqld+1s2PnDx5CPuow9ESTxuBH1QUVvhM
        VMYjUnsxuE+gbZVV1sv76fdV5lJKpRBHknuiXu8iLo5GFiCPXl7+326b85UDGPCxlHtpUTPUWa5
        fHjpYJBzNl176Fdua/4sQnx0=
X-Received: by 2002:a17:906:241b:b0:953:7e25:2156 with SMTP id z27-20020a170906241b00b009537e252156mr14918994eja.51.1682510892652;
        Wed, 26 Apr 2023 05:08:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350bVe/Rpq76BfRZ+RUKpA1mwy2wgqhwR+8AnNZW60yXZAB0BoQPcCcbuoZhpgW2PjnKPj0ATxA==
X-Received: by 2002:a17:906:241b:b0:953:7e25:2156 with SMTP id z27-20020a170906241b00b009537e252156mr14918974eja.51.1682510892344;
        Wed, 26 Apr 2023 05:08:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id pv22-20020a170907209600b0094f0025983fsm8191204ejb.84.2023.04.26.05.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 05:08:11 -0700 (PDT)
Message-ID: <e1b4e5cf-269f-9ea7-c2fa-453708385944@redhat.com>
Date:   Wed, 26 Apr 2023 14:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/5] staging: media: atomisp: sh_css_sp: Remove #ifdef
 ISP2401
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230425074841.29063-1-hpa@redhat.com>
 <20230425074841.29063-4-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230425074841.29063-4-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 4/25/23 09:48, Kate Hsuan wrote:
> The actions of ISP2401 and 2400 will be determined at the runtime.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/pci/sh_css_sp.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
> index 0dd58a7fe2cc..297e1b981720 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
> @@ -952,12 +952,10 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
>  		return 0;
>  	}
>  
> -#if defined(ISP2401)
> -	(void)continuous;
> -	sh_css_sp_stage.deinterleaved = 0;
> -#else
> -	sh_css_sp_stage.deinterleaved = ((stage == 0) && continuous);
> -#endif
> +	if (IS_ISP2401)
> +		sh_css_sp_stage.deinterleaved = 0;
> +	else
> +		sh_css_sp_stage.deinterleaved = ((stage == 0) && continuous);
>  
>  	initialize_stage_frames(&sh_css_sp_stage.frames);
>  	/*

