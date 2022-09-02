Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38EA15AAAD4
	for <lists+linux-media@lfdr.de>; Fri,  2 Sep 2022 11:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235164AbiIBJEe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Sep 2022 05:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235410AbiIBJEc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Sep 2022 05:04:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A6EA5C66
        for <linux-media@vger.kernel.org>; Fri,  2 Sep 2022 02:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662109470;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mYJgNCoJS9c+rxqFeOlaYN9sT0D37ykA0TCLZEWJUgU=;
        b=dsR6XsYzlcZEZm3jW6El/Iz37q51B1Gw7FoS7GdY/PSEYZQgF4vOs6LqZ7D4O0KZzeIOP6
        OxDOkuDWx9+t6Ifm9RjDuggGacci+4pIhvANHa8TQbnb/rmugCtu07zB2pciITDOxMb55X
        CehoqooiaSYN4AQpGfwSuEs6R5RQ/tI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-142-yJkmWROKMvCJs3vKYgPkxg-1; Fri, 02 Sep 2022 05:04:27 -0400
X-MC-Unique: yJkmWROKMvCJs3vKYgPkxg-1
Received: by mail-ej1-f69.google.com with SMTP id hp14-20020a1709073e0e00b00741a2093c4aso765399ejc.20
        for <linux-media@vger.kernel.org>; Fri, 02 Sep 2022 02:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=mYJgNCoJS9c+rxqFeOlaYN9sT0D37ykA0TCLZEWJUgU=;
        b=1S0U4Mso7lP740Krp8D+IQOGBDUosqYZcH4kzrw3RX/F/BFIgOdnZh2fiqEZC7O7ci
         WDtkodVyAF7oNkB/nkCFqUWI51+iBAtDK6YgihszA9fJx3oHMQYdAF8DBOwJJeBKM0vc
         w3FntZTHSdwamtS0PgxL4XMdv/S/fALZZVGplm0SMKxqat/lIOCQwTxsOzbISCTNuLQC
         dLiQf3lUj5cR17IU/n8iSKA8QuEzBMctPcrq5o9A0RuMjQavf6+eGsjzXDBm8i6qpmNB
         ib263mXkd4B+rOr6isQPkdV/RUy20YPt6IYCgHXcw6kcWV6YkQ6sjQQw1m7WVRo3hBgE
         1c/g==
X-Gm-Message-State: ACgBeo3AxVzcYl8SkuJdrWVu+G1QYVChGwx1WMmh64+TAnVvcdwnYPtW
        6g6oymM0/5SXy4LTXM4o+mhja/g1ywQa0lUHl7yTjPq91ujkAgIU5JA059IiGmPebnClEZFaRvY
        njfn8Y+JX1dnIEfjuJmKLG9A=
X-Received: by 2002:a17:906:7106:b0:73d:c534:1adc with SMTP id x6-20020a170906710600b0073dc5341adcmr26231913ejj.238.1662109465825;
        Fri, 02 Sep 2022 02:04:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4yjLTQimVvytP7KasoZWuO9wMQeTQmGA3S9Nb5YzxanqBHhxsFsPlzFirx8LSawOzF/cylag==
X-Received: by 2002:a17:906:7106:b0:73d:c534:1adc with SMTP id x6-20020a170906710600b0073dc5341adcmr26231895ejj.238.1662109465557;
        Fri, 02 Sep 2022 02:04:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id p23-20020a056402045700b0044792480994sm980694edw.68.2022.09.02.02.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Sep 2022 02:04:24 -0700 (PDT)
Message-ID: <ce0d2ec6-3ec7-9f9f-59f9-0bf2a6078c9c@redhat.com>
Date:   Fri, 2 Sep 2022 11:04:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 10/14] media: atomisp: Register /dev/* nodes at the end of
 atomisp_pci_probe()
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
References: <20220901094626.11513-1-hdegoede@redhat.com>
 <20220901094626.11513-11-hdegoede@redhat.com>
 <YxEOhy0YPnBuZiQs@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YxEOhy0YPnBuZiQs@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Thank you for reviewing this series.

On 9/1/22 21:56, Andy Shevchenko wrote:
> On Thu, Sep 01, 2022 at 11:46:22AM +0200, Hans de Goede wrote:
>> Register /dev/* nodes at the end of atomisp_pci_probe(), this is
>> a prerequisite for dropping the loading mutex + ready flag kludge
>> for delaying open() calls on the /dev/* nodes .
> 
> ...
> 
>>  			for (; i > 0; i--)
>>  				atomisp_subdev_unregister_entities(
>>  				    &isp->asd[i - 1]);
> 
> This...

I presume you mean the few lines above that actually:

@@ -1194,11 +1194,8 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 		struct atomisp_sub_device *asd = &isp->asd[i];
 
 		ret = atomisp_subdev_register_subdev(asd, &isp->v4l2_dev);
-		if (ret == 0)
-			ret = atomisp_subdev_register_video_nodes(asd, &isp->v4l2_dev);
 		if (ret < 0) {
-			dev_err(isp->dev,
-				"atomisp_subdev_register_entities fail\n");
+			dev_err(isp->dev, "atomisp_subdev_register_subdev fail\n");
 			for (; i > 0; i--)
 				atomisp_subdev_unregister_entities(
 				    &isp->asd[i - 1]);


Notice the atomisp_subdev_register_video_nodes() call is removed there,
leaving only atomisp_subdev_register_subdev() (which is also why the dev_err
msg is changed).

Actually moving that call (+ a few others) to later is the whole
purpose of this patch.

> 
>> +	for (i = 0; i < isp->num_of_streams; i++) {
>> +		err = atomisp_subdev_register_video_nodes(&isp->asd[i], &isp->v4l2_dev);
>> +		if (err)
>> +			return err;
>> +	}
> 
> ...and this looks like a dup.

Where as this time while looping over the stream the code is calling
atomisp_subdev_register_video_nodes().

So yes we have 2 "for (i = 0; i < isp->num_of_streams; i++) {}"
loops, but:

Loop 1 does: atomisp_subdev_register_subdev()
Loop 2 does: atomisp_subdev_register_video_nodes()

So I see no duplication here?

Regards,

Hans



