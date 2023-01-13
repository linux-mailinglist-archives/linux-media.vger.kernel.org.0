Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5799669831
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 14:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240122AbjAMNPv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 08:15:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbjAMNPX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 08:15:23 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442DD485BF
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 05:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673614989;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mfmWBFHq3QdJ8Mbs23/FdpCEeH6NIz261ChPtazTb7k=;
        b=FPHhTA489sq+eWfrs0ttqikyr7TUAnR4HpvbA4dER7PrJ/9XYYZvt8DoW35kg/oQGOeM8/
        gGcarI6/oj+k8+HuIccMnVNhRWuyYSLkAEnbo+KjLf3s6Z7o2C6+Y9CM8oe+e/372rG/oK
        sZe6NCwO1iaA+18LbF1wv9TsMjd7org=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-mQn4DsY8OY2O0GvKgldeMw-1; Fri, 13 Jan 2023 08:01:03 -0500
X-MC-Unique: mQn4DsY8OY2O0GvKgldeMw-1
Received: by mail-ej1-f71.google.com with SMTP id ga21-20020a1709070c1500b007c171be7cd7so15280735ejc.20
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 05:01:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mfmWBFHq3QdJ8Mbs23/FdpCEeH6NIz261ChPtazTb7k=;
        b=DhXrZyZOwmMZI8cqDHRNFFamyF3VPGvoK5J7rl041rNJ7QLDOxzhkbs+aQWjKfOo6n
         hKcY6R6kWvOMMpZwF7pmeESRaksaEF3nu8Y2uSrYwjcMtK7XZeWqtRYLVVwDjLDH+KDN
         Q0wNQmCrNELiMeEF9uLyeeMT4dMWZh8g5NUh/73tvZI+kajwgRVTBjL3gz6lk8HSAYEr
         xu0R9qcatZnJoAGobmfXDOe0e2eLJPX5/GWlBQxieOF9QIzFdN+vGrvtpVg3RrCWCsy1
         cDNn6hWepIQkk1zDWwtN745Qu9bDfC9kOuhId2Yr6MIeP1hLWSKcSnNWwtHpd8BFPh9o
         ev3Q==
X-Gm-Message-State: AFqh2koqkPxfX/ydItxRq1mnau10eJTaWok/PwvsZX86j/IUWE4ifpF9
        Y9dRKwQsd+Zlhha7XwDAgUEowg3NrJuHIE84CVo+3DFbF94jJQNrY8lxVivSTBYOpRgDSIgXFMH
        3oRngbaT9pmpHubuCRrg5CJ8=
X-Received: by 2002:a17:907:272b:b0:866:d17a:e50 with SMTP id d11-20020a170907272b00b00866d17a0e50mr5823037ejl.70.1673614861731;
        Fri, 13 Jan 2023 05:01:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuq9wBoW1xaYIfkfGdyhB0kl/b0YpqvIu1HE1SWM751Xnx7RYPUt3ut2Pyn8HjPnw3coTWXFA==
X-Received: by 2002:a17:907:272b:b0:866:d17a:e50 with SMTP id d11-20020a170907272b00b00866d17a0e50mr5823021ejl.70.1673614861501;
        Fri, 13 Jan 2023 05:01:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y16-20020a1709063a9000b0084ce5d5d21bsm8488059ejd.22.2023.01.13.05.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 05:01:00 -0800 (PST)
Message-ID: <86978231-7c5a-c1a0-ef33-b49924b441bd@redhat.com>
Date:   Fri, 13 Jan 2023 14:00:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] atomisp: use vb2_start_streaming_called()
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <bc6c24ec-72ea-64a1-9061-311cc7339827@xs4all.nl>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <bc6c24ec-72ea-64a1-9061-311cc7339827@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 12/8/22 09:12, Hans Verkuil wrote:
> Don't touch q->start_streaming_called directly, use the
> vb2_start_streaming_called() function instead.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thank you I have added this to my list of pending atomisp
patches now.

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

