Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8110646C43
	for <lists+linux-media@lfdr.de>; Thu,  8 Dec 2022 10:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbiLHJxG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Dec 2022 04:53:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiLHJxF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Dec 2022 04:53:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A20C61753
        for <linux-media@vger.kernel.org>; Thu,  8 Dec 2022 01:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670493131;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kEuioTJJggcz3ajgjP8tAoMmJq8xKsihSebbNKdfIgE=;
        b=YOYbc36l3g3DXHUBHJv71Bgjb/QWZbf8ncNkjiPElYPKrRE8ZeMQ9RfOLi0sz8nQpiv5fk
        Xk8PF92kyGFmA78fEoBBMWHEFnGudNPXmnHwl5FeQ2TjrB7jwInsonhbaN7UEVbp6Fyxhl
        xPrkrE2gUXcXmd4I7RJaSlzAwi/Yw5c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-505-TojS-IdOP0G9igwNCOU85g-1; Thu, 08 Dec 2022 04:52:09 -0500
X-MC-Unique: TojS-IdOP0G9igwNCOU85g-1
Received: by mail-ed1-f72.google.com with SMTP id x20-20020a05640226d400b0046cbe2b85caso708843edd.3
        for <linux-media@vger.kernel.org>; Thu, 08 Dec 2022 01:52:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kEuioTJJggcz3ajgjP8tAoMmJq8xKsihSebbNKdfIgE=;
        b=GK2Tp8yVQ4wf/u2v3B1eepqsgUXA6bSjbGYwVy0ZxapOEevDiJeybGXceVfCHrhs1n
         F0DImxbGJeQt9gxldnEK/wkPV+vbgmnnlNWWKfC/J2VivtYvJ/8OsrKvIoA3jHF8nvxS
         oMEzjdWUgl2WuNxxz599BQgkJMho1MiqRgsxXFfVG6NEquWn95IqfC44N0QxJWotMKJF
         MsKTOc7y052RqEtE43y+H0pqzICwsGXNOtNyaeycjFuLKs1Sycug00NHbccthHg4PT0q
         fhXcfmBaGQKkO5+lbRYtwZSKfTMDRuJxziHOoWyRNE1MBWVD9M1a1aAPfiJtwpDsPoVy
         AZng==
X-Gm-Message-State: ANoB5pkbPVoF9+xOhQCbf7DvM76viYWv3vqSH1RgkHEyiEWyYdhcQug/
        WrwW3Tqc0B3JDfjrGgHREI8Ci8ZEJvobpUFm1q6zu3dAPYyerelyqGaZitRBcQ3gpceTToyEuQ7
        e4bOEkUJvsRZ3cLhUni/suw8=
X-Received: by 2002:a05:6402:5011:b0:469:9c84:3bdd with SMTP id p17-20020a056402501100b004699c843bddmr42934490eda.302.1670493128316;
        Thu, 08 Dec 2022 01:52:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7tRTyfMLRt+bADZXcNKMg1ftbJWVQw2K2td27VopTHo5erHMRoNpZ/toLfUYB61PoWWmuscQ==
X-Received: by 2002:a05:6402:5011:b0:469:9c84:3bdd with SMTP id p17-20020a056402501100b004699c843bddmr42934484eda.302.1670493128061;
        Thu, 08 Dec 2022 01:52:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id eg18-20020a056402289200b0046267f8150csm3178063edb.19.2022.12.08.01.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 01:52:07 -0800 (PST)
Message-ID: <ad8baadf-9140-0226-1129-b5e5497412ff@redhat.com>
Date:   Thu, 8 Dec 2022 10:52:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] atomisp: use vb2_start_streaming_called()
Content-Language: en-US, nl
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <bc6c24ec-72ea-64a1-9061-311cc7339827@xs4all.nl>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <bc6c24ec-72ea-64a1-9061-311cc7339827@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 12/8/22 09:12, Hans Verkuil wrote:
> Don't touch q->start_streaming_called directly, use the
> vb2_start_streaming_called() function instead.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Note I have been doing a lot of work on atomisp cleanups / improvements
recently. So I'm sending pull-reqs from:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

to Mauro for atomisp changes. And I hope to eventually cleanup this function
a bit, so I plan to take this upstream through my media-atomisp branch to
avoid conflicts.

Regards,

Hans





> ---
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index cb01ba65c88f..4f35e8f8250a 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -636,10 +636,10 @@ static int atomisp_enum_input(struct file *file, void *fh,
>  static unsigned int
>  atomisp_subdev_streaming_count(struct atomisp_sub_device *asd)
>  {
> -	return asd->video_out_preview.vb_queue.start_streaming_called
> -	       + asd->video_out_capture.vb_queue.start_streaming_called
> -	       + asd->video_out_video_capture.vb_queue.start_streaming_called
> -	       + asd->video_out_vf.vb_queue.start_streaming_called;
> +	return vb2_start_streaming_called(&asd->video_out_preview.vb_queue) +
> +	       vb2_start_streaming_called(&asd->video_out_capture.vb_queue) +
> +	       vb2_start_streaming_called(&asd->video_out_video_capture.vb_queue) +
> +	       vb2_start_streaming_called(&asd->video_out_vf.vb_queue);
>  }
> 
>  unsigned int atomisp_streaming_count(struct atomisp_device *isp)

