Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCB86D2FC4
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 12:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjDAK7r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 06:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjDAK7q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 06:59:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8500CA246
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 03:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680346738;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n0m9899QyNGgz290CASKStrnyLjXT/71L/LfFmt6KFA=;
        b=ZGiM/DcPo60NG4NnyQcZf6LfainS6XCZbkXzqtlIbh+npI1ho+6tOBB7Nm7Q0U9k6hKaNS
        NIqaK643lYRBrMMpPKatYpQvQCn6vv5lbMeSCPQ+/BWazBOWPBXOEnJ8/41XEZbEiVDD3O
        HCbGr0nnIlXl63w+FGz8Gnsgj5pepc8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-FbLjDWZeMWeQA6FVsN2ZTQ-1; Sat, 01 Apr 2023 06:58:57 -0400
X-MC-Unique: FbLjDWZeMWeQA6FVsN2ZTQ-1
Received: by mail-ed1-f70.google.com with SMTP id b18-20020a50b412000000b0050234a3ad75so30262814edh.23
        for <linux-media@vger.kernel.org>; Sat, 01 Apr 2023 03:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680346736;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n0m9899QyNGgz290CASKStrnyLjXT/71L/LfFmt6KFA=;
        b=GicRA2iV5bzFwPJ0dEO5/ulCTkV8mvROdNglCuMtrRnP1fePo6lEmGb7S9ZDv2N9rW
         s1XZKIIAjQjXrhahEkDOmqzpFSu7Zb5cufSY8k8pg426JlBf4NiKD7R6oR1UBDEP+SI2
         pJrBsTv0olXP07khtPK01cor4GMXmzDdt9xhuaNxRXg7AUqO3VInjj+yjzXLhlV0WpHA
         xLB0XUfHVM7jZjki7LIgC0Z9Jzg85O5Kz9vguZ3C/ignfpODSsDlrfE4mnQragMNv/uR
         yV/5rEqCAjVN+/Pazu9xyuNxxL5wXZt9XLA1X444AS+ROGvUEAh80OrJVi29pCJGWGx7
         1xdw==
X-Gm-Message-State: AAQBX9ceT7F92eAmBaUnhNhn+Gy2yN2Q6rZevs08ywJHHFIohJYseU2k
        /G5riCxUa9IUcyAufh7frKHayEgY3yuzslvqZo/HcMPtiTOEAULbi8dxSwt1d8ik+XBqwvoszI2
        qFjjxsEDjKseXWFfQTPT+7Qo=
X-Received: by 2002:a17:906:3a45:b0:88a:cbd1:e663 with SMTP id a5-20020a1709063a4500b0088acbd1e663mr31508687ejf.6.1680346736710;
        Sat, 01 Apr 2023 03:58:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZtIShdxbTjbgmzNxznavZmuyezGlgZdr5OMmOztDE+cRHOW3xJQH9hVSALTDDGl9RQcTxppg==
X-Received: by 2002:a17:906:3a45:b0:88a:cbd1:e663 with SMTP id a5-20020a1709063a4500b0088acbd1e663mr31508674ejf.6.1680346736398;
        Sat, 01 Apr 2023 03:58:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906010b00b0093344ef3764sm1949606eje.57.2023.04.01.03.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 03:58:55 -0700 (PDT)
Message-ID: <109be822-9439-cd5a-c7f7-c63516f92099@redhat.com>
Date:   Sat, 1 Apr 2023 12:58:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 02/10] media: atomisp: Remove continuous mode support
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230221145906.8113-1-hdegoede@redhat.com>
 <20230221145906.8113-3-hdegoede@redhat.com>
 <Y/TqBBdU7dbYPIsW@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y/TqBBdU7dbYPIsW@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

Thank you for the reviews!

On 2/21/23 16:57, Andy Shevchenko wrote:
> On Tue, Feb 21, 2023 at 03:58:58PM +0100, Hans de Goede wrote:
>> Continues mode is a special mode where 2 /dev/video devices can be active
>> at the same time. Either the video-preview + video nodes or the
>> viewfinder (for still capture) + capture nodes.
>>
>> For the video-preview + video-recording case modern userspace will
>> use a single stream multiplexed by pipewire.
>>
>> The still-capture case is extra special only starting the preview
>> stream and then relying on a custom ATOMISP_IOC_S_CONT_CAPTURE_CONFIG
>> ioctl to set things up followed by a second stream on to capture
>> the amount of configured still pictures. While running the sensor
>> at full resolution all the time. This case too is better handled
>> with dma-buf + GPU downscaling for the view-finder rather then all this
>> custom special code. Besises this the ioctl expects a bunch of special
>> non error checked conditions to be met otherwise things will crash/hang.
>>
>> The continues mode also involves a special cases all over the code
>> getting in the way of further cleanups and simplifying the code to
>> using just 1 /dev/video# node. So lets remove it and the
>> related custom ATOMISP_IOC_S_CONT_CAPTURE_CONFIG ioctl.
> 
> ...
> 
>> +	ret = atomisp_set_fmt_to_snr(vdev, &s_fmt,
>> +				     f->fmt.pix.pixelformat, padding_w,
> 
> At least one parameter can be moved to the previous line.

Ack, fixed in my local tree which I will push to:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

When I'm done processing your other review remarks.

> 
>> +				     padding_h, dvs_env_w, dvs_env_h);
>> +	if (ret) {
>> +		dev_warn(isp->dev,
>> +			 "Set format to sensor failed with %d\n", ret);
>> +		return -EINVAL;
> 
> ...
> 
>>  	case ATOMISP_RUN_MODE_PREVIEW:
>> -		if (!asd->continuous_mode->val) {
>> -			if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
>> -				return true;
>> +		if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
>> +			return true;
>>  
>> -			return false;
>> -		}
>> -		fallthrough;
>> +		return false;
> 
> 		return pipe_id == IA_CSS_PIPE_ID_PREVIEW;

I agree that that is cleaner, but there are a bunch of other cases
in this switch case which are not touched by this patch and
they all follow the same pattern as which the modified cases
use after this patch, e.g. :

        case ATOMISP_RUN_MODE_STILL_CAPTURE:
                if (pipe_id == IA_CSS_PIPE_ID_CAPTURE)
                        return true;

                return false;

So this patch basically makes all of them consistent with
each other. So I'm going to keep this as is.

Regards,

Hans



> 
> ...
> 
>>  	case ATOMISP_RUN_MODE_VIDEO:
>> -		if (!asd->continuous_mode->val) {
>> -			if (pipe_id == IA_CSS_PIPE_ID_VIDEO ||
>> -			    pipe_id == IA_CSS_PIPE_ID_YUVPP)
>> -				return true;
>> -			else
>> -				return false;
>> -		}
>> -		fallthrough;
>> +		if (pipe_id == IA_CSS_PIPE_ID_VIDEO || pipe_id == IA_CSS_PIPE_ID_YUVPP)
>> +			return true;
>> +
>> +		return false;
> 
> Similar.
> 

