Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 115D87478A3
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 21:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbjGDTWo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 15:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjGDTWm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 15:22:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F49DD
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 12:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688498512;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IInNlv0Cr+qsB7HstVH5gUgkHInFTFrHsC+HkDYZQqo=;
        b=We+DbT8AS7qKxUG1j5Uln1jAw7uaV9dKwXSNEA3Ep9t8UakmYKxay533Rjx12bhYHGSrlE
        Z7CFqeW1z+M4gDj9cR+3GvF+bHYBH6CKGPsZsQml0WrIvjTlrCSv8cyjC/8TlXcq8vsmIB
        kflI2uVbdGijtjkOdbi7p8ou9KIs5LM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-z0-HQuPmOnOe7Z-iF3GeMg-1; Tue, 04 Jul 2023 15:21:50 -0400
X-MC-Unique: z0-HQuPmOnOe7Z-iF3GeMg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-98843cc8980so488690466b.1
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 12:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688498509; x=1691090509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IInNlv0Cr+qsB7HstVH5gUgkHInFTFrHsC+HkDYZQqo=;
        b=WolX++dO9cSOQae1p1LJXzEIX+OHhDDKsoOm7KYXv2mXVWqm10/it13SXdeulotFAI
         x+tIGc5S5t4AtWJ9aPEzdDJ6EeLiHJA5s6CBP2V8xIg9ZczdsbQRcyyFhpHSWesGKTFP
         v3bKgZbwhpC/OIEFst8k+NnIurNb+iI3OwzHUCZ17tGDgEG5CI1b25KDhaH2+30juq+P
         TGBv3ocpw17roEeeKGM/aIiOKU7vOIL5Xr+d7rZas+IdP/DSYRdeyQzeuPAZeQEZzSNv
         ELlfJ99cm6SyjjsAtYIkI/FFy5KPSL+YaDfzCoVz8jYUJ2C3ZD8sMuMvKdCZq3/QnpPs
         lRtA==
X-Gm-Message-State: ABy/qLagdQLLBzc6RwWIeELfQ5SgeYfLcM5HyHA8QMJf66XCza0SmF09
        X3fR6bjz67RmU080TL8uFXKsn0xjhoFhJrvNsz5KtLUIjnRB0YgJ8De49v5Q8gUZ62Drpf2VDyI
        NPcTR+86GRIcv2mlDX1n6XSg=
X-Received: by 2002:a17:906:4d02:b0:991:e24f:b290 with SMTP id r2-20020a1709064d0200b00991e24fb290mr10444405eju.26.1688498509056;
        Tue, 04 Jul 2023 12:21:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6oF9LeoYsgrX3QIslZOgPcVT9RT+HkNlEBBkfTixtjeR1tO6It7jUHZRAoP/yo8ANZu0sfzQ==
X-Received: by 2002:a17:906:4d02:b0:991:e24f:b290 with SMTP id r2-20020a1709064d0200b00991e24fb290mr10444398eju.26.1688498508805;
        Tue, 04 Jul 2023 12:21:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id dt14-20020a170906b78e00b0099316c56db9sm5265035ejb.127.2023.07.04.12.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 12:21:48 -0700 (PDT)
Message-ID: <26ce49af-1267-0a9d-5eb7-f15a94395328@redhat.com>
Date:   Tue, 4 Jul 2023 21:21:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 13/15] media: atomisp: csi2-bridge: Switch to new
 common ipu_bridge_init()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-14-hdegoede@redhat.com>
 <CAHp75Vcp9aoKOw-gPeXvJ9VuO5nGN=g5HHjAxWwNyNzo6J2Amw@mail.gmail.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vcp9aoKOw-gPeXvJ9VuO5nGN=g5HHjAxWwNyNzo6J2Amw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/30/23 16:45, Andy Shevchenko wrote:
>> +       sensor->lanes = gmin_cfg_get_int(adev, "CsiLanes", lanes);
>> +       if (sensor->lanes > IPU_MAX_LANES) {
>> +               dev_err(&adev->dev, "Invalid lane-count: %d\n", sensor->lanes);
> 
> Yeah, I think we would be consistent in using the ACPI handle to print
> the messages from ACPI sensor devices.

I do agree that we need to be consistent, but I regret having switched
to using the handle for this in the csi2-bridge code. The dmesg logs
this results in are much harder to read. Most devices typically have
2 different sensors and normally it is quite easy to see in the logs
which GPIOs, etc. are being used for the sensor.

But after the move to using the ACPI handle for logging the logs
show up prefixed with \_SB_.I2C2.CAM8 resp CAM2 rather then with
OVTI2680 and INT0310 making it much harder to figure on what
is going on (first need to do
"cat /sys/bus/i2c/devices/i2c-OVTI2680:00/firmware_node/path"
to find out which path belongs to which sensor).

So I would rather get rid of the handle based logging, because it
is very cumbersome to use.

I'll add an extra patch to the next version of the set to switch all
the logging to using the acpi_device for logging.

Regards,

Hans

