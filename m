Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 180687C6DA6
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 14:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347260AbjJLMLS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 08:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347177AbjJLMLQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 08:11:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 410F8C9
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697112628;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e0nmqy59jy/rGMIg2W3+5Ft0g6PXLLlnoefzeVrsrTs=;
        b=SrCSLvreBIdBuPQM/ha4E3z3Kz37BfdrQ3thw0VpnxSanDR3ndvLBJ71x8TJhN+DJy8VHq
        yAGxBmUT9ArOJPrCPC4epac2kdYtpBbaCVMExKLLQv2h4+JZPC2dFCd/fgdGOPWIXyPBH9
        v0ofpKPvkaib8MrgB921PlXT1F/HfzA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-hM7jqCx9N0yWqNOyt8aSZA-1; Thu, 12 Oct 2023 08:10:27 -0400
X-MC-Unique: hM7jqCx9N0yWqNOyt8aSZA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9bd86510329so68660466b.0
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 05:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697112626; x=1697717426;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e0nmqy59jy/rGMIg2W3+5Ft0g6PXLLlnoefzeVrsrTs=;
        b=BTdDQBnwuR+HnNk8yxo4AeJE9mIAtDZUQBhGr3O/eqaQB4zsJN5N0niLb9qzqyjfb5
         yBHt7ud1/lOouw+ao1lCbAFehiwwccw9iqN2nSTkhpFgy+U0/Lb4QioW9Yjz3NGCgCsC
         r381oxbO6hz2+CBvHa7xZq2hi4++hsThmdXLyKeTll62FeRt2xXm7394MCW2R5Le/nyY
         I8FhheXWCawmkS+GdUrLV8zm3f9YyljmNeJXtkLxbLYiJ3iwZtN1jwZ51Mr+U6SrsCqk
         PySW7D3GzQ7af2z4v4fJ+UYOmuaS4XXEUJ2PtZUQzyIA1iaIfiM4r3be+32mdQ1N7n+n
         eE0A==
X-Gm-Message-State: AOJu0YzgeohJTFbEq/yBnEPHKRr2MYHn7iIEoDls9brBdDUgSpDxTYSk
        NzoN17TLxLWZgfzgunU+Suop5IVceLzhueZS1e9sLXR0rjER+4EeMxwmF0XPxzbJtIfh2bAi4f/
        L3Gy2xTXuCbBUqpvXkJ3U0EQ=
X-Received: by 2002:a17:906:cc13:b0:9b6:50d3:2a75 with SMTP id ml19-20020a170906cc1300b009b650d32a75mr19703356ejb.48.1697112625895;
        Thu, 12 Oct 2023 05:10:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjvJVtD0uQR8XMo2cR7XmHJlpYVc+HmbN4viv4pGPb6gmHPLLfBWOiJNvTCRNd4xhqfQomHg==
X-Received: by 2002:a17:906:cc13:b0:9b6:50d3:2a75 with SMTP id ml19-20020a170906cc1300b009b650d32a75mr19703329ejb.48.1697112625566;
        Thu, 12 Oct 2023 05:10:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x26-20020a170906711a00b0099329b3ab67sm11000199ejj.71.2023.10.12.05.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:10:25 -0700 (PDT)
Message-ID: <c9e693a2-845f-9ef1-e3cb-724cece84756@redhat.com>
Date:   Thu, 12 Oct 2023 14:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v11 17/56] media: atomisp: Stop direct calls to queue
 num_buffers field
Content-Language: en-US, nl
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
        ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com, Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
 <20231012114642.19040-18-benjamin.gaignard@collabora.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231012114642.19040-18-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/12/23 13:46, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Hans de Goede <hdegoede@redhat.com>
> CC: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index a8a964b2f1a8..09c0091b920f 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -1028,7 +1028,7 @@ static int atomisp_qbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
>  	struct atomisp_device *isp = video_get_drvdata(vdev);
>  	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
>  
> -	if (buf->index >= vdev->queue->num_buffers)
> +	if (buf->index >= vb2_get_num_buffers(vdev->queue))
>  		return -EINVAL;
>  
>  	if (buf->reserved2 & ATOMISP_BUFFER_HAS_PER_FRAME_SETTING) {

