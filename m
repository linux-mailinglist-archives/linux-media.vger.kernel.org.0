Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBD316316E2
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiKTWkx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:40:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiKTWkw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:40:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4314523391
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668983997;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hoSHzQL4DUaK1Wqq7ep1f7TaKzUePlXTfhewoznSyVE=;
        b=GUgRNPkxO1529Gx4+PYm12A/cMJq4G7GGke8HPmWSgkplhXaRUr0cSJdD3qFgdPaGT7XsJ
        OwicJ2FA0iz4QmwbO4LGMswmVQjTCPlXRjX83yhpYJoNDBeCjM4NShsRgLpLdkWKE0QKPY
        mNVVJI3hZ2m39FQKQfK1Xh1gue/xjy0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-418-BxXHws-3Myaw07iMnsjRYQ-1; Sun, 20 Nov 2022 17:39:41 -0500
X-MC-Unique: BxXHws-3Myaw07iMnsjRYQ-1
Received: by mail-ed1-f71.google.com with SMTP id w17-20020a056402269100b00461e28a75ccso5506844edd.8
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hoSHzQL4DUaK1Wqq7ep1f7TaKzUePlXTfhewoznSyVE=;
        b=tjVuGj8dFqb6C10NxaV3OVAZ4sHIwvThfcMd5SeYyRxTfP8S0HV/lojXL0ONiXtoDB
         cuYqgqR21SD8eBk6EfCM1qhyCCs+K1iatsbtQND8IwiCqtZiO2eupJX14w5NffI05qW2
         sgpTAIdOK5gmCWFTdwWdMOyOqvY1AvzghLHPdkKO22+7IfDPwjizmi1QJnaa9dIJgR8Q
         VoBnxqrmhrdtXCXL5h5t63EP+FxfpdzorDBFQN1yHKpbmquXoJsBYsjJjxv2dOF0A1ne
         bwqVPuEM5Ua4TIe6ZV62nYeHSJltlpQrAA0Jrhah1Ahs58LMiyESSL3Ohh22NgnOIoFF
         OB/A==
X-Gm-Message-State: ANoB5pm+ispVL4o8WLyRTww3vyEko3WJBc6pjPs6tO50/+mVliu3Bsfu
        oEAZoROA6zOZ+IuMwJsKh0lPWT24ty1MWazAvHY/YSJwWu/D+PXYINa+aAXkNCdzNEVLX3ru8oJ
        5dtHQBveKOTlIyAaph4QnrUg=
X-Received: by 2002:a17:906:e0d2:b0:7ad:b45c:dbe1 with SMTP id gl18-20020a170906e0d200b007adb45cdbe1mr13706304ejb.726.1668983980423;
        Sun, 20 Nov 2022 14:39:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ARpjfFDI1MJ8Veby3ldYkRuyL8mRhwTYL/RNxCCeXCcmahCflUwM/ugp4ZY0YXQ62/UzJPw==
X-Received: by 2002:a17:906:e0d2:b0:7ad:b45c:dbe1 with SMTP id gl18-20020a170906e0d200b007adb45cdbe1mr13706292ejb.726.1668983980253;
        Sun, 20 Nov 2022 14:39:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id cw24-20020a056402229800b0046730154ccbsm4479804edb.42.2022.11.20.14.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 14:39:39 -0800 (PST)
Message-ID: <79417219-537c-dead-02ef-c18bc93f83f6@redhat.com>
Date:   Sun, 20 Nov 2022 23:39:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 00/17] media: atomisp: Convert to videobuf2
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <Y3Iy86AUKvoMz2l1@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3Iy86AUKvoMz2l1@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/14/22 13:22, Andy Shevchenko wrote:
> On Thu, Oct 20, 2022 at 09:55:16PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Here is v2 of my patch series converting the staging atomisp driver to use
>> the videobuf2 framework, fixing MMAP mode not working.
>>
>> New in v2 is that the "media: atomisp: Convert to videobuf2" patch
>> now also contains moving over to using a per vb_queue lock as is
>> standard for v4l2 drivers. This removes a bunch of FIXME + checkpatch
>> warnings (due to commented out prep for this) from v1 of this patch.
>> This v2 also fixes the 1 new warning pointed out by the lkp test robot.
>>
>> For some more background info here are the still relevant bits of
>> the v1 cover-letter:
>>
>> This also contains an important fix to try_fmt handling, so that
>> the various supported output formats can actually be used by userspace
>> which calls try_fmt before doing s_fmt.
>>
>> So slowly this is starting to look more and more like a standard
>> v4l2 device (with all the complex pipeline handling hidden in the driver,
>> moving that to userspace seems to be impossible with this design since
>> multiple pipeline steps are handled by a single firmware program).
> 
> I completely in favour of the series, so
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> for non-commented patches, for the commented, where comment is a "side note".
> 
> For the rest depends on your action, if you are going to address as suggested,
> feel free to add my tag.

Thanks, I've pushed an updated version with your suggested changes and
your Reviewed-by added to my media-atomisp branch in preparation for
sending a pull-req to Mauro with these changes.

I'll also add your patch "[PATCH v1 1/1] atomisp: Make bds_factors_list be type
of struct u32_fract" there once I have had the time to review it.

Note since I send out this series I've been working on a bunch of further
cleanups / on preparation work for getting rid of the ugly PCI power-management
errors on (runtime)suspend/resume.

I will send these out as a patch series now and I've also pushed these to my
media-atomisp branch.

Regards,

Hans

