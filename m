Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46D656CA215
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 13:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbjC0LGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 07:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjC0LGd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 07:06:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986DD46A6
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 04:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679915145;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5Pi8NhWYcyXRKgdrYA9xFAvL0k1PzcxQE6HvqC6sBZk=;
        b=SP47s5M73jbZH5PwbarZ6NghXQTvFeoDhgTwq5UkDTfNbF5sfCSHlzhFvqrpA8DkRhUajQ
        wCMAOBv4+U40zafy7HF6eZWpF8xOgDKZJsC7qPTdQ8vJ18kgDZm74B9Xxd1+4+aKlSVIs3
        qdnv180pecnGZmcoLerPQibIyl9fjDw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-QAghzuQvOWezhfps3U28UA-1; Mon, 27 Mar 2023 07:05:43 -0400
X-MC-Unique: QAghzuQvOWezhfps3U28UA-1
Received: by mail-ed1-f69.google.com with SMTP id ev6-20020a056402540600b004bc2358ac04so12207434edb.21
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 04:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679915142;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Pi8NhWYcyXRKgdrYA9xFAvL0k1PzcxQE6HvqC6sBZk=;
        b=fVQxg9dSvy870WrCH4iRM9dsjI9sb/PrTHrHPy90LcdrqKqR4rM7tVBragb0nlpMyU
         9F0c1IlVZqO5PdAgaa+/XuFj6i/Eei/eVg+Pv9ty4s9JFwiojaf5RszUVw+K26+FbjZ0
         eLthrIsDIeUzwClNdSmBedc9PDY6hAVPs/Axl3bs62QONPr6rRI9f9csN70iBjmnZPUs
         kTd4flD0MS7OJWpz9qK7pME+jNMnl6/nQMXcfw2zqvmVmOSRz3rKPxZPwMgLN63IJvd6
         7YenwpJpn0zflBSqtxt7AG5B8knpzZ6AELm/7HchtiHMV7Psa1l8nTKPiIrrOqRR2doC
         y8kg==
X-Gm-Message-State: AAQBX9fzIwAMLrMgAYOOL3PH5EouyNLF7MILzwTqxOuOUVGYHAavE90w
        GduNgfze0e6sISuo0REO03so/F/gDdamF9bzmK9B+cyTMDIw65fJUf3pqXiPGZySoxNDGOfxyjr
        NQi+8AiT9HnfDDCpbI+sIAsPU6kmLQ04=
X-Received: by 2002:a17:907:1628:b0:88f:8a5:b4cd with SMTP id hb40-20020a170907162800b0088f08a5b4cdmr15520739ejc.1.1679915142043;
        Mon, 27 Mar 2023 04:05:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z/QOpC0j6u6l5QnfWyq+HxE9GtDPdadkf2hdBhez9Ibz3lP2Rjjhfym5oYbtLnNhbjFP5Wqw==
X-Received: by 2002:a17:907:1628:b0:88f:8a5:b4cd with SMTP id hb40-20020a170907162800b0088f08a5b4cdmr15520713ejc.1.1679915141745;
        Mon, 27 Mar 2023 04:05:41 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id w7-20020a17090649c700b0093d9fddcd22sm5180355ejv.125.2023.03.27.04.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 04:05:39 -0700 (PDT)
Message-ID: <a00be1f0-462f-4004-4250-cdceff0c4e12@redhat.com>
Date:   Mon, 27 Mar 2023 13:05:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] media: v4l2-core: v4l2-ioctl: Printing log with
 dev_warn() when the pixelformat is unknown
Content-Language: en-US
To:     Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Xiu Jianfeng <xiujianfeng@huawei.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-media@vger.kernel.org
References: <20230327091051.404184-1-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230327091051.404184-1-hpa@redhat.com>
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

Hi,

On 3/27/23 11:10, Kate Hsuan wrote:
> The original implementation used WARN() to notify the user of the "unknown
> pixelformat" error. If fmt->description can be found, the function will
> simply return without warnings. Recently, the description had removed from
> uvc since v4l_fill_fmtdesc() can provide such kind of information. However,
> for some of the USB cameras, such as Intel Realsense F200 returns unknown
> format when probe(). Thus, the WARN() message shows and confuses the user.
> This work changed WARN() to dev_warn() to reduce the severity of the
> message.
> 
> The returned video format of Intel RealSense F200 is shown as follows.
> kernel: uvcvideo 2-7:1.3: Unknown video format 52564e49-2d90-4a58-920b-773f1f2c556b
> kernel: uvcvideo 2-7:1.3: Unknown video format 49524e49-2d90-4a58-920b-773f1f2c556b
> kernel: uvcvideo 2-7:1.3: Unknown video format 494c4552-1314-f943-a75a-ee6bbf012e23
> kernel: usb 2-7: Found UVC 1.10 device Intel(R) RealSense(TM) 3D Camera (Front F200) (8086:0a66)
> 
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2180107
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 87f163a89c80..aae987243a5b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1246,7 +1246,7 @@ static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops,
>  	return ops->vidioc_enum_output(file, fh, p);
>  }
>  
> -static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> +static void v4l_fill_fmtdesc(struct video_device *vdev, struct v4l2_fmtdesc *fmt)
>  {
>  	const unsigned sz = sizeof(fmt->description);
>  	const char *descr = NULL;
> @@ -1504,7 +1504,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  		default:
>  			if (fmt->description[0])
>  				return;
> -			WARN(1, "Unknown pixelformat 0x%08x\n", fmt->pixelformat);
> +			dev_warn(&vdev->dev, "Unknown pixelformat 0x%08x\n", fmt->pixelformat);
>  			flags = 0;
>  			snprintf(fmt->description, sz, "%p4cc",
>  				 &fmt->pixelformat);
> @@ -1589,7 +1589,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>  		break;
>  	}
>  	if (ret == 0)
> -		v4l_fill_fmtdesc(p);
> +		v4l_fill_fmtdesc(vdev, p);
>  	return ret;
>  }
>  

