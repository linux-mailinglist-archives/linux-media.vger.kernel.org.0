Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8756316C4
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiKTWTD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:19:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiKTWTA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:19:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C4D1835A
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668982680;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l0+15Y8JfxRy/vfJp8dRfSctTnOGpQb74ni4V6PWTh4=;
        b=a4sa3kN7hxyzjWvNHbXVnw4t1S66WwWELSldxDbTR4aL1MP33b5ZWYK7nSKXfkAj/aMKyp
        AckFC94mf+GYlSjaTZ8rc6drQZNDvYMEMW3sTipx1/wwzA8HS2e/AJski83a0glUj2olLE
        7DgYSa+5cX9K+5toyswHQAzOdKe+iCE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-V06bDz1GM4ql_L7noq9E9g-1; Sun, 20 Nov 2022 17:17:59 -0500
X-MC-Unique: V06bDz1GM4ql_L7noq9E9g-1
Received: by mail-ed1-f69.google.com with SMTP id w4-20020a05640234c400b004631f8923baso5539090edc.5
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:17:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0+15Y8JfxRy/vfJp8dRfSctTnOGpQb74ni4V6PWTh4=;
        b=1pZIHIXX9IAn+9kROeBwWZIMvoII0BpFpAC9NAdQdPqPru1S5T356yxPMS9vfROqjx
         9CAdQ4WUCs38lHUH1tO9b7V0gnt3onadnGFFJzdkbKc4qOqL+jehLPqW/ZosnMARdc8s
         t4StZ7so4J0BH9Oz/3VSt4QVtgTYyrh62O5zmHG+i881EtsjxkblurhU/nMJm5OjsGwB
         x+wQtNMiEWXJj7ep8YxfjJmA46R8ga/Qsis+N20Girsr6GVFH6StoDMmq9ij/SOWSUXA
         jeh/tkUe0nx89/twPY8CJcl9vAHauFW0fiFHWDznkCyXlhMc2zVm6lj8VNWZxREKqWNs
         6bBg==
X-Gm-Message-State: ANoB5pllmQqDA/GiBuhSjzKGTLnVeokOsNuIZoUVzDFmw6t4wkrbWKPX
        F5pZilrD/X4j3UTVKQV/+ta8zXFAFF2pBvh374OT0vkZMtGQQAeUGurNNSW9pCaBKrUCjXJrl3s
        xuu0HNO2RY/0UfHRfwe2XcM8=
X-Received: by 2002:a05:6402:35cf:b0:469:5ee9:4a76 with SMTP id z15-20020a05640235cf00b004695ee94a76mr4832169edc.405.1668982677815;
        Sun, 20 Nov 2022 14:17:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5wF8P5+56/5C8+iPmOpiY/a3SfQm5KNhu6DzsBxHQOx2zNE6qTqrEU+L3/bS8fEbJrBNeCvw==
X-Received: by 2002:a05:6402:35cf:b0:469:5ee9:4a76 with SMTP id z15-20020a05640235cf00b004695ee94a76mr4832154edc.405.1668982677561;
        Sun, 20 Nov 2022 14:17:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id e8-20020a056402104800b0046778ce5fdfsm4336512edu.10.2022.11.20.14.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 14:17:56 -0800 (PST)
Message-ID: <f5f0e988-d5a2-12ea-cbb7-caa49f1c00d8@redhat.com>
Date:   Sun, 20 Nov 2022 23:17:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 12/17] media: atomisp: Fix VIDIOC_REQBUFS failing when
 VIDIOC_S_FMT has not been called yet
Content-Language: en-US, nl
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-13-hdegoede@redhat.com>
 <20221114203819.44e7baad@sal.lan>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221114203819.44e7baad@sal.lan>
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

On 11/14/22 21:38, Mauro Carvalho Chehab wrote:
> Em Thu, 20 Oct 2022 21:55:28 +0200
> Hans de Goede <hdegoede@redhat.com> escreveu:
> 
>> camorama calls VIDIOC_REQBUFS(V4L2_MEMORY_MMAP) to test if MMAP support
>> works (this was added specifically because of the previously broken
>> MMAP support in atomisp).
>>
>> Currently this fails because atomisp_get_css_frame_info() fails in this
>> case. Although it is weird to call VIDIOC_REQBUFS before VIDIOC_S_FMT,
>> it is allowed to do this.
>>
>> Fix this not working by doing a S_FMT to V4L2_PIX_FMT_YUV420 + the highest
>> supported resolution.
>>
>> Note this will cause camorama to use mmap mode, which means it will also
>> use libv4l2 to do format conversion. libv4l2 will pick V4L2_PIX_FMT_RGB565
>> as input format and this will lead to a garbled video display. This is
>> a libv4lconvert bug, the RGB565 -> RGB24 path in libv4lconvert assumes
>> that stride == width which is not true on the atomisp.
> 
> Hmm... should we add a patch on Camorama for it to not use libv4l2 if
> format == V4L2_PIX_FMT_RGB565?

This is not controlled by Camorama but by libv4lconvert, AFAICT there are
no atomisp2 native formats which are supported in Camorama without libv4l  ?


> 
>>
>> I've already send out a libv4lconvert fix for this. Also this can be worked
>> around by passing --dont-use-libv4l2 as argument to camorama.
> 
> Was the patch already applied? The better would be to apply it at
> libv4l2 upstream, as a fix, porting it to old versions, and mentioning
> on what versions this got fixed on this changeset.

I see that you have already found the patches. I will add a comment
to the commit msg pointing to the now applied patch.

Regards,

Hans



> 
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  .../media/atomisp/pci/atomisp_compat_css20.c  |  2 +-
>>  .../staging/media/atomisp/pci/atomisp_fops.c  | 25 +++++++++++++++++--
>>  2 files changed, 24 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
>> index ea6114679c53..f282572d69da 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
>> @@ -2688,7 +2688,7 @@ int atomisp_get_css_frame_info(struct atomisp_sub_device *asd,
>>  
>>  	if (0 != ia_css_pipe_get_info(asd->stream_env[stream_index]
>>  		.pipes[pipe_index], &info)) {
>> -		dev_err(isp->dev, "ia_css_pipe_get_info FAILED");
>> +		dev_dbg(isp->dev, "ia_css_pipe_get_info FAILED");
>>  		return -EINVAL;
>>  	}
>>  
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
>> index bc47a092a8af..f539df09ebd9 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
>> @@ -50,15 +50,36 @@ static int atomisp_queue_setup(struct vb2_queue *vq,
>>  	u16 source_pad = atomisp_subdev_source_pad(&pipe->vdev);
>>  	int ret;
>>  
>> +	mutex_lock(&pipe->asd->isp->mutex); /* for get_css_frame_info() / set_fmt() */
>> +
>> +	/*
>> +	 * When VIDIOC_S_FMT has not been called before VIDIOC_REQBUFS, then
>> +	 * this will fail. Call atomisp_set_fmt() ourselves and try again.
>> +	 */
>>  	ret = atomisp_get_css_frame_info(pipe->asd, source_pad, &pipe->frame_info);
>> -	if (ret)
>> -		return ret;
>> +	if (ret) {
>> +		struct v4l2_format f = {
>> +			.fmt.pix.pixelformat = V4L2_PIX_FMT_YUV420,
>> +			.fmt.pix.width = 10000,
>> +			.fmt.pix.height = 10000,
>> +		};
>> +
>> +		ret = atomisp_set_fmt(&pipe->vdev, &f);
>> +		if (ret)
>> +			goto out;
>> +
>> +		ret = atomisp_get_css_frame_info(pipe->asd, source_pad, &pipe->frame_info);
>> +		if (ret)
>> +			goto out;
>> +	}
>>  
>>  	atomisp_alloc_css_stat_bufs(pipe->asd, ATOMISP_INPUT_STREAM_GENERAL);
>>  
>>  	*nplanes = 1;
>>  	sizes[0] = PAGE_ALIGN(pipe->pix.sizeimage);
>>  
>> +out:
>> +	mutex_unlock(&pipe->asd->isp->mutex);
>>  	return 0;
>>  }
>>  
> 

