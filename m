Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA8A7BE37C
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 16:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344571AbjJIOtu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 10:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjJIOtt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 10:49:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4F988F
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 07:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696862939;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZOglfncHOq9IshKLYOEwpL19o6AjMXzFStUBXb6V42M=;
        b=LHZkuw8EJhCz0l9FFKdWEA4fFDSj8Whl/acTGozlW3EkdzV3B+wLHRQzUKdY7Kk8jxxsVQ
        1TdNXbkUyA4lPppb0h8YAZ1aZl133HuqttW2BVfTFF38n5rVEE7mdl8bz/ZtEMewrcUio7
        RPy/SbV8xQfEMySaeMN8pLQqKoiIUb4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-MIx5yUx1MMSaWB9pVk1j5g-1; Mon, 09 Oct 2023 10:48:58 -0400
X-MC-Unique: MIx5yUx1MMSaWB9pVk1j5g-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-537fb536554so4019069a12.2
        for <linux-media@vger.kernel.org>; Mon, 09 Oct 2023 07:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696862935; x=1697467735;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOglfncHOq9IshKLYOEwpL19o6AjMXzFStUBXb6V42M=;
        b=A3Rvk6A2QsECaMjGl7vU9hbEnb4MT7sjiZco76DNwKK1mlBeLAUs/o54SB0tc0zKed
         lowfiyYgCNSozGvvTWERakhoxmIARCIcRQYyxEAXsdNTEoBNiMd0iJEarmZScHCtYAov
         mbjjNxaCeCHHaiXTeWMUgrk2yuqhCf7s8v5i8Rd+YtKS43UBAXpJAqdAvc+w5+COGUJ0
         d1Vu+3Y7/9d5L13WXTbHefWHIvTi4flQ+XOWqhmzT00Wlc2DaBT4IYHnX941KPQJVrF0
         /hjKM+lz9cAtThyC2teMc4Ydsui3NXWwh6y+glssAi+/OTsgNGrIsrY27p6a+5afNR7G
         zb7g==
X-Gm-Message-State: AOJu0YxraLXUjQe74oqIS/HDtrjN3KQrRSDC/LOAmJNUGDJQ2N27LYuQ
        tVPqWle+KanVUthm6bWHZzTJ89REqO6t2J4bTFcqnUFL5OQvYEackojOa4WWWkc/IcGEkux9RV3
        gsqQhf48yuBUV3nRFv1S9hE3sl9b1MfU=
X-Received: by 2002:aa7:c154:0:b0:531:287d:3234 with SMTP id r20-20020aa7c154000000b00531287d3234mr13438401edp.39.1696862935062;
        Mon, 09 Oct 2023 07:48:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOKMz5UEGaTIl0EB9avZBHeJJa/Yz5LAQokOQJawjJefU6pi3bQapWYHatLsKFu6++SnWLIQ==
X-Received: by 2002:aa7:c154:0:b0:531:287d:3234 with SMTP id r20-20020aa7c154000000b00531287d3234mr13438391edp.39.1696862934741;
        Mon, 09 Oct 2023 07:48:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i18-20020a50fc12000000b005386541f612sm6163276edr.3.2023.10.09.07.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 07:48:53 -0700 (PDT)
Message-ID: <ea89ea3c-d9c4-46a8-6e7e-035967a4a9ee@redhat.com>
Date:   Mon, 9 Oct 2023 16:48:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/9] staging: media: atomisp: drop check for reentrant
 .s_stream()
Content-Language: en-US, nl
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
 <f27c3713a56dc8dbe90c110349396fb70c6ee773.1696586632.git.hverkuil-cisco@xs4all.nl>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f27c3713a56dc8dbe90c110349396fb70c6ee773.1696586632.git.hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/6/23 12:08, Hans Verkuil wrote:
> The subdev .s_stream() operation shall not be called to start streaming
> on an already started subdev, or stop streaming on a stopped subdev.
> Remove the check that guards against that condition.
> 
> Also fixes a smatch warning:
> 
> drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:446 gc0310_s_stream() warn: missing error code 'ret'
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> CC: Hans de Goede <hdegoede@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> index c438accb0472..58cddf11c9ab 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -441,11 +441,6 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
>  	dev_dbg(&client->dev, "%s S enable=%d\n", __func__, enable);
>  	mutex_lock(&dev->input_lock);
>  
> -	if (dev->is_streaming == enable) {
> -		dev_warn(&client->dev, "stream already %s\n", enable ? "started" : "stopped");
> -		goto error_unlock;
> -	}
> -
>  	if (enable) {
>  		ret = pm_runtime_get_sync(&client->dev);
>  		if (ret < 0)
> @@ -497,7 +492,6 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
>  error_power_down:
>  	pm_runtime_put(&client->dev);
>  	dev->is_streaming = false;
> -error_unlock:
>  	mutex_unlock(&dev->input_lock);
>  	return ret;
>  }

