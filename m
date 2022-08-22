Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDB7C59C206
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 17:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235875AbiHVPDb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 11:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235864AbiHVPDO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 11:03:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85062EE
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661180592;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Tlzmui5ajtbLtR4OUWaQmiktJo3sDd1IJ8yRtxLLoi8=;
        b=ChkuMkdGs59GtCKlENh7BdjVauYlu9CL1lwPutmOL1kcpRFm4IJTjclU0amknYNv2M3yKC
        Y++sJjA987mzC7HC27rDr36TPRStsOA5Fx8S4quS6fYeGPR9soMsWbW5ORA7ldCjG4u07m
        Rb5bONJDjnlUoftKBaGeHq9uoHOdp/E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-410-UFUShSycPsGITAlJrZuWRA-1; Mon, 22 Aug 2022 11:03:11 -0400
X-MC-Unique: UFUShSycPsGITAlJrZuWRA-1
Received: by mail-ed1-f69.google.com with SMTP id b6-20020a056402278600b0043e686058feso7128034ede.10
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 08:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Tlzmui5ajtbLtR4OUWaQmiktJo3sDd1IJ8yRtxLLoi8=;
        b=R6SHwiXI7zTBYMrUVMeZ/sHh9A1DA90b7quoL7w9Ed/gUnANkV141UyNfLO5zCTtla
         uNKax+FY8rOUddsREI8c2KGk8YKpFi8tZwdyhrRqU+BRDExDHlLtvH+OROEIwteBqgWX
         e55ZlPBrFcs2sBYGhu5J9xcO6BdfHoAT+IB3E/iwekc560tUV3d0dyT9vMNi37qn5HED
         kflRZv3NQ+LBQo784SSgfA6wT0Fc7D0ZoYNHAy1c50uSiuLh5s16619nmmFlcl0Kmtr1
         aCL238AVRstbf8cqKUjG4Mv8b4JBS53RoecJ1QWzqAnD4N6nfPumQSQfmIYhmMHJ4aXW
         /ywQ==
X-Gm-Message-State: ACgBeo2kT/xebfHRUYw1TkXoD5YEwo3ZXDp3LHnc5q16FVQ8iHn38H8e
        J1qNXGc8rffnPi4J9p2Vcp7evq1BzIAfZclYrLOkGZ7Dv297JxGdAR9qMFB+CCJRXLeiI3Fo34u
        E2MFZEh/lLB22aMrFJvFr9Qw=
X-Received: by 2002:a17:907:6d24:b0:731:7720:bb9b with SMTP id sa36-20020a1709076d2400b007317720bb9bmr13186708ejc.717.1661180589920;
        Mon, 22 Aug 2022 08:03:09 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5GcENmYTUOK/Snra3bYXwezD2rbZ+y/0FnfNgK7HseapkMA//RqNwjvM0/sz38dwcO63GZ3g==
X-Received: by 2002:a17:907:6d24:b0:731:7720:bb9b with SMTP id sa36-20020a1709076d2400b007317720bb9bmr13186695ejc.717.1661180589740;
        Mon, 22 Aug 2022 08:03:09 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id v14-20020a170906b00e00b0073d6d6e698bsm2979526ejy.187.2022.08.22.08.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 08:03:08 -0700 (PDT)
Message-ID: <7978041f-f324-2554-cd64-04102330bb14@redhat.com>
Date:   Mon, 22 Aug 2022 17:03:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 13/13] media: atomisp: Ensure that USERPTR pointers are
 page aligned
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
References: <20220821215027.461344-1-hdegoede@redhat.com>
 <20220821215027.461344-13-hdegoede@redhat.com>
 <CAHp75VdJETEOf_t_F0f591zOj3U_ALuadE4LHzF-8sXPPgUnEQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdJETEOf_t_F0f591zOj3U_ALuadE4LHzF-8sXPPgUnEQ@mail.gmail.com>
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

On 8/22/22 15:03, Andy Shevchenko wrote:
> On Mon, Aug 22, 2022 at 12:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The atomisp code needs USERPTR pointers to be page aligned,
>> otherwise bad things (scribbling over other parts of the
>> process' RAM) happen.
>>
>> Add a check to ensure this and exit VIDIOC_QBUF calls with
>> unaligned pointers with -EINVAL.
> 
> ...
> 
>>         if (buf->memory == V4L2_MEMORY_USERPTR) {
>> +               if (buf->m.userptr & ~PAGE_MASK) {
> 
> offset_in_page() ?

Ack I've switched to offset_in_page() for v2.

Regards,

Hans


> 
> Further we may utilize helpers from pfn.h in the driver.
> 
>> +                       dev_err(isp->dev, "Error userptr is not page aligned.\n");
>> +                       ret = -EINVAL;
>> +                       goto error;
>> +               }
> 

