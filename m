Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDF356D2FD0
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 13:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjDALHN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 07:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjDALHL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 07:07:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D55527C
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 04:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680347183;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=082wN2d40YxS8UzRA5DpIleZHbfgWjfwCTFReqbA0DU=;
        b=b0n6v8ZeDlLz5ezeefDdf0PbpuNrFh/mLYBGgVb/GDCT3nYdf+z7TgC1ThUPpU+RmmidLM
        X/YYt+hOirwUN//zOWSiqglzkgB2QryQry5E76+MnN+1Zr2ZkKIrfnvxv/BvllazqbPRXh
        xclQJ8twBuXZp2/NsxCG7fV2qJqonNg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-5iS3-iMoOyuaU9p1gTN4Qg-1; Sat, 01 Apr 2023 07:06:22 -0400
X-MC-Unique: 5iS3-iMoOyuaU9p1gTN4Qg-1
Received: by mail-ed1-f70.google.com with SMTP id h11-20020a0564020e8b00b004e59d4722a3so34950174eda.6
        for <linux-media@vger.kernel.org>; Sat, 01 Apr 2023 04:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680347181;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=082wN2d40YxS8UzRA5DpIleZHbfgWjfwCTFReqbA0DU=;
        b=kLgB3XarJJ9sTZkpqaeiXYHmnw2SKnV/QmdY2Fg0XHmf1CvYYUaxr4DiCGp5KKgezo
         OzxSKPMB71NBJJblLo5uCjRj7YCUz/42QbTtFFPYOCcxtSlXIt5QHV6kVjdy+fnpyLp/
         tWE3HVrR4YJPCRLUZvPjmQf+1MSVyNx6Y182VP7YXu4vui71eqX8AcSLMO8vGZUiGC/w
         ij1ndNl7+KSAMMMgOZIn9Dn7uG3FYYIQ7K3rUwMQWwjuUPi5lhPM4eQysWAhnbxRw+Tx
         tiujfXeQY+EXuIT6ltfJsL+BmkSvwtoz3HGJr+uR69qYU1LeHInMUYIa9b+r9GQqgpkV
         jY4g==
X-Gm-Message-State: AAQBX9ccSDe+9fi4l+lSdONGiIc4jBr/Yml49NQ2tJRVFqdnHzMkTAtZ
        8lq7SLg8sQWCtQmjtQHhq1+q/5Am7b65F+DB9R3tQbmYKkDBPxIj4ZCRwYWRhCZbn2uRKG3LRM1
        pwwm8fxTJXyLoUiL9uPQFamw=
X-Received: by 2002:a17:906:f1c7:b0:933:c474:420b with SMTP id gx7-20020a170906f1c700b00933c474420bmr31523514ejb.19.1680347181552;
        Sat, 01 Apr 2023 04:06:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350bNZPrff+UqQRkf0DfJ6wFD1zt9oWjO2MGu1jVR8hfJRAUQUuPkhITjmruRCr4ujfAnV/gUfQ==
X-Received: by 2002:a17:906:f1c7:b0:933:c474:420b with SMTP id gx7-20020a170906f1c700b00933c474420bmr31523495ejb.19.1680347181277;
        Sat, 01 Apr 2023 04:06:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id mc3-20020a170906eb4300b009334d87d106sm1978160ejb.147.2023.04.01.04.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 04:06:20 -0700 (PDT)
Message-ID: <d452fe83-e063-8f18-2582-af04c7cec867@redhat.com>
Date:   Sat, 1 Apr 2023 13:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 04/10] media: atomisp: Remove crop_needs_override from
 atomisp_set_fmt()
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
 <20230221145906.8113-5-hdegoede@redhat.com>
 <Y/Tqs3hEYzeZ9Om4@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y/Tqs3hEYzeZ9Om4@smile.fi.intel.com>
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

On 2/21/23 17:00, Andy Shevchenko wrote:
> On Tue, Feb 21, 2023 at 03:59:00PM +0100, Hans de Goede wrote:
>> Remove the crop_needs_override local helper variable from
>> atomisp_set_fmt(), as it always is true now.
> 
> ...
> 
>> +			sink_crop.width = DIV_NEAREST_STEP(
>> +					      sink_crop.height *
>> +					      f->fmt.pix.width,
>> +					      f->fmt.pix.height,
>> +					      ATOM_ISP_STEP_WIDTH);
> 
> Not sure how long this code stays, I would indent it as
> 
> 			sink_crop.width =
> 				DIV_NEAREST_STEP(sink_crop.height *
> 						 f->fmt.pix.width,
> 						 f->fmt.pix.height,
> 						 ATOM_ISP_STEP_WIDTH);

Thanks, I've gone with:

			sink_crop.width =
				DIV_NEAREST_STEP(sink_crop.height * f->fmt.pix.width,
						 f->fmt.pix.height,
						 ATOM_ISP_STEP_WIDTH);

Keeping the first DIV_NEAREST_STEP() argument on a single line.

> 
> ...
> 
>> +			sink_crop.height = DIV_NEAREST_STEP(
>> +					       sink_crop.width *
>> +					       f->fmt.pix.height,
>> +					       f->fmt.pix.width,
>> +					       ATOM_ISP_STEP_HEIGHT);
> 
> Ditto.

Ditto :)

Regards,

Hans

