Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD4686D2FD2
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 13:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjDALJy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 07:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjDALJw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 07:09:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D491F7B3
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 04:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680347345;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yZI5gzblLbzd4ocsRZ4H8EgESHkje2pYcL+YafNEzFs=;
        b=gl4SUH6Zy/bK03LwQdwPMFW6Vj08XFQyNZg8krjnwcd11MuepTKUvIUDYGn3pyrlmXCxAs
        ACQhP2NKGb6beG4DDIRauWF+Hcdu57ZOjOUU2AU6YVCei8tCp1BjBwLDdLLGNd5lYRzgjh
        Qr0s7Z+UW3/mD/6f7ftU3Ku5bweI4Jg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-1Vz89Rc0PyOF5C4U4G5V5g-1; Sat, 01 Apr 2023 07:09:04 -0400
X-MC-Unique: 1Vz89Rc0PyOF5C4U4G5V5g-1
Received: by mail-ed1-f72.google.com with SMTP id h11-20020a0564020e8b00b004e59d4722a3so34956105eda.6
        for <linux-media@vger.kernel.org>; Sat, 01 Apr 2023 04:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680347343;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZI5gzblLbzd4ocsRZ4H8EgESHkje2pYcL+YafNEzFs=;
        b=eCP69alqC2naqRoWYBuUX4uXxLKpbVBZPmDfV6yHNv3mqJsBgp5biWe1HBjOzVOw/I
         P3dda0C+yo6CSTh3QcTujQKk5md2X4/yamsSzkLSq6/jPMRhvyFVymBvtA0ecOqt/Gdr
         MX/urzJD9RElBvD92e7AIT4gilOuJtysq2VyhIoaj+0cIXm0riqYA/fEjjKFnJxoGMQe
         igaHs1CkxU5JY+V23hS7jj89guOAVMlzMQtwMJYN05nZ6fLd6b6mgwAzTeGlzEgisD6t
         ACo2bJPsOGaB1hMpLdIoo4/hPXNB2v9LSrd4Tvynl18kwHwRjB97Hbze55KBc/7Gpb16
         +tew==
X-Gm-Message-State: AAQBX9d5KdK/HhIKggu8OTp4bdrOlfdaSC8T6S2M/O6I/FKLMx3sKPn8
        w+6L9BwfyRMBvf+8Z2OrF6zxsaoBWQcfj9pXLV2zT/TNFOOXMESHFq46zl3G1od4GKc03cXc6Gr
        euuG7MgkmIfk9V7pljDsdVck=
X-Received: by 2002:a17:906:3592:b0:934:8043:ebf8 with SMTP id o18-20020a170906359200b009348043ebf8mr29370624ejb.26.1680347343030;
        Sat, 01 Apr 2023 04:09:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZR2FvyyaudUU65TI76rdKXkl5MXvG8ge/EbTH03vRHElwus7fEgqHWvdMWDVfotbwYdN1w3g==
X-Received: by 2002:a17:906:3592:b0:934:8043:ebf8 with SMTP id o18-20020a170906359200b009348043ebf8mr29370610ejb.26.1680347342782;
        Sat, 01 Apr 2023 04:09:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 19-20020a170906309300b0092be390b51asm1957572ejv.113.2023.04.01.04.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 04:09:02 -0700 (PDT)
Message-ID: <a9bf8968-fe9d-877a-bf1c-54df30c557c3@redhat.com>
Date:   Sat, 1 Apr 2023 13:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 00/10] media: atomisp: Remove depth-mode and continuous
 mode support
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
 <Y/Tri9ArpjxWZfoB@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y/Tri9ArpjxWZfoB@smile.fi.intel.com>
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

On 2/21/23 17:04, Andy Shevchenko wrote:
> On Tue, Feb 21, 2023 at 03:58:56PM +0100, Hans de Goede wrote:
>> Hi All,
>>
>> This is the first step of the removal of special/obscure features
>> discussed here:
>>
>> https://lore.kernel.org/linux-media/ea81b17b-7d1f-a5e1-11dd-04db310e1e50@redhat.com/
>>
>> Plus some follow-up patches removing some dead code (some new dead
>> code as well as some pre-existing dead code).
> 
> As usual for non-commented
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Thanks!

I have just pushed this series to:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

Adding your Reviewed-by to 8/10 patches and addressing your remarks (except for the switch-case thing) in the other 2 patches.

Let me know if you are ok with / want me to add your Reviewed-by to the other 2 patches.

Regards,

Hans





