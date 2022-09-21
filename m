Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D35995BFA48
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 11:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbiIUJLT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 05:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbiIUJLO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 05:11:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 275C28C00D
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 02:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663751471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mHgtB/tFl8du0yqbQXDXdBCyCZjsIYKdtK32iodIEPM=;
        b=RfvGNdMX+sF/80hM6yHyxBgU09WwiUjaGJOW03yGdSqRyUDfL/TJPd4KfK4wc60LRP6UKC
        QGKgSAzE3/bowag3y2JttaT8wo4F5rL3znXkPDgITp9p+KVBU9Lcqsm6ZI9WT2AXJwy1wN
        Ff0C5qcgu9+qlTt8MdqU4RN54KIIme8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-414-5WpKtR-8M4uXtKb1dqhbfg-1; Wed, 21 Sep 2022 05:11:04 -0400
X-MC-Unique: 5WpKtR-8M4uXtKb1dqhbfg-1
Received: by mail-ej1-f70.google.com with SMTP id sh31-20020a1709076e9f00b00781c4e720feso2400610ejc.8
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 02:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=mHgtB/tFl8du0yqbQXDXdBCyCZjsIYKdtK32iodIEPM=;
        b=XBMaNXE0Q+Y4el1jAzJmRGszeFqs9KRXZyRMQtzG2ZVlBqkIcWecnnLfEoKr415aPV
         53iyVi81GlRFLtFy9yaACNmqiMEfInqjgl235AHkB5sI3fTvfUeqrD+t0/ALZKpVsKmP
         dsHpkgcJ0iFV6guXuJMaFEGPLdOWIymrHEGRL/jX5gf7qy6rufE2svNaTqj5aSKlhZDR
         UVgk/h8vlXXDxgX6352GxrIBZEjTKhE+p1Ju0qYY9qKa3BJPQvoj1Locn47m74ORB5Nd
         /FN21yfRTMoELwAJ9ZbmCqhgC03MeQI1Rgg8HOnSBhazuf4V+dMx8XlFtoBwAcOWLeXC
         RjHg==
X-Gm-Message-State: ACrzQf1JArR7j3BVeqLw1JyDFxMGUHVWqD8muiYkam2WPZ0nkd6/INXf
        rgpkr7LPuNt/+raqzSmM50dAf42rUN5UchCD58sXhqlX4MLIA9ev2CHF86PyRjjZO7xZs73bfh0
        SEAoPi7MqDd4Azm1xxoIfr38=
X-Received: by 2002:a17:906:8463:b0:771:a3d2:7c3 with SMTP id hx3-20020a170906846300b00771a3d207c3mr19144948ejc.592.1663751463336;
        Wed, 21 Sep 2022 02:11:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+DjbASLOe6LwCU8Po/eoRZVDi3/zb0SGJ6uagMY8Q5rrYm2tTAWYc/stFfB2zlNEb2/wyWg==
X-Received: by 2002:a17:906:8463:b0:771:a3d2:7c3 with SMTP id hx3-20020a170906846300b00771a3d207c3mr19144929ejc.592.1663751463161;
        Wed, 21 Sep 2022 02:11:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id f19-20020a056402195300b004531b137e4bsm1425060edz.67.2022.09.21.02.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 02:11:02 -0700 (PDT)
Message-ID: <5f00424c-b18a-7b81-82fc-4363f4796de5@redhat.com>
Date:   Wed, 21 Sep 2022 11:11:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 16/17] media: atomisp: Remove
 atomisp_source_pad_to_stream_id()
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220911171653.568932-1-hdegoede@redhat.com>
 <20220911171653.568932-17-hdegoede@redhat.com>
 <Yx8bZ4h8wrCGy80m@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yx8bZ4h8wrCGy80m@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 9/12/22 13:43, Andy Shevchenko wrote:
> On Sun, Sep 11, 2022 at 07:16:52PM +0200, Hans de Goede wrote:
>> atomisp_source_pad_to_stream_id() returns ATOMISP_INPUT_STREAM_GENERAL
>> unconditionally now. Drop it and directly use ATOMISP_INPUT_STREAM_GENERAL
>> in its callers.
> 
> ...
> 
>> -				atomisp_css_capture_enable_online(asd, stream_index, false);
>> +				atomisp_css_capture_enable_online(
>> +					asd, ATOMISP_INPUT_STREAM_GENERAL, false);
> 
> asd can be left on the same line. no?

Right, I changed this to make checkpatch happy about the arguments not being aligned
the same way as the first argument. But then it complained about a '(' at the end of
the line ... so this was not really better (nor worse).

I have changed this to:

				atomisp_css_capture_enable_online(asd,
								  AOMISP_INPUT_STREAM_GENERAL,
								  false);

now which does make checkpatch fully happy. I will change other 2 blocks in the same way.

Regards,

Hans


> 
> 
> ...
> 
>> +		ret = atomisp_css_copy_get_output_frame_info(
>> +			asd, ATOMISP_INPUT_STREAM_GENERAL, output_info);
> 
> Ditto.
> 
> ...
> 
>> -		atomisp_css_input_set_effective_resolution(isp_sd, stream_id,
>> +		atomisp_css_input_set_effective_resolution(
>> +			isp_sd, ATOMISP_INPUT_STREAM_GENERAL,
>>  			crop[pad]->width, crop[pad]->height);
> 
> In the similar way...
> 

