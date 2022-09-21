Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1615BF9D8
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 10:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiIUIwn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 04:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiIUIwm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 04:52:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E5D2328
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 01:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663750360;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lG8SDjdnZak/MUXsRfgXClx575p+L/35YYB5sP6fkEQ=;
        b=VkGSWZn6vm636jZM22vquSxI0th25iDcj6kHieCncJj7cZbgO4rUade6k9fn3xZ5QzvLiV
        0wq/TlrizTTLOMMEUuz6URpALsM4iQWqs+GvqFa9mz0eMQn0sUEBPKIoT66mMRjdhVqPTg
        8pAULZ1qsMNlLdaZWHWwGe+BQM0Jdg8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-505-_KUy0qjvPXa8hX4X1t4Axg-1; Wed, 21 Sep 2022 04:52:39 -0400
X-MC-Unique: _KUy0qjvPXa8hX4X1t4Axg-1
Received: by mail-ed1-f69.google.com with SMTP id v11-20020a056402348b00b004516e0b7eedso3866247edc.8
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 01:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lG8SDjdnZak/MUXsRfgXClx575p+L/35YYB5sP6fkEQ=;
        b=MbHc701diinkl3Jy4oomHqvobAdh3STIxoNPi20oqVCpNWHJVDCFeh/0eaR2IeCSQa
         xb4StdCvFfJ9fPn4yYa5IBrfzH8O2TWHEpiQOqA4pHSYg200Kdct5fjh6rWTUgW7Uf8j
         R9oUaH0Fq+9MPwXGwCkBZA6ejG2M3nvnOiusnHY4e5RSL6I+tHWFq6Q+aeP3SdyS9IE7
         B614P1yP3ftHFqhPuWZRaBAYC8echxRM7ObP7usVUjp2P/CsGr2oQda5Dvk/pifYaVfh
         /jN2in0zEhr9H7SRiqY7Aa602piQUcQb5FdGB8r9u56jqUlaBrNiSP0nJ967ZwWhwcrF
         3bkQ==
X-Gm-Message-State: ACrzQf1qW+Mw/OAA85+KVTqDYjHXKUAB/OVK2J17huwejdSvq1/JpG3S
        d0DqhbHrPpBuileQbGgbOsgCZihVPLB+yMFlmpiHzN/AgAgk88rFztuL15zBVS7/3xvQ+8KgwHe
        Lw94Aws+7aOLnL8VPufd1IDU=
X-Received: by 2002:aa7:c04d:0:b0:454:2f81:b966 with SMTP id k13-20020aa7c04d000000b004542f81b966mr11447511edo.269.1663750358324;
        Wed, 21 Sep 2022 01:52:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5aNy+Putz9fNOLuY2DP/Z5N8/Z2a5BH/Irm20XJPoXRL1gzT4S7udkWhKdVRtlcBL6FCc2RA==
X-Received: by 2002:aa7:c04d:0:b0:454:2f81:b966 with SMTP id k13-20020aa7c04d000000b004542f81b966mr11447502edo.269.1663750358155;
        Wed, 21 Sep 2022 01:52:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id n26-20020aa7c45a000000b00452ff2c203asm1383600edr.92.2022.09.21.01.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 01:52:37 -0700 (PDT)
Message-ID: <c52e1abb-0796-b88a-4a94-fa14c09ffcfe@redhat.com>
Date:   Wed, 21 Sep 2022 10:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 01/17] media: atomisp: Use a normal mutex for the main
 lock
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
 <20220911171653.568932-2-hdegoede@redhat.com>
 <Yx8T/uEKvVDoCvsT@smile.fi.intel.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yx8T/uEKvVDoCvsT@smile.fi.intel.com>
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

On 9/12/22 13:11, Andy Shevchenko wrote:
> On Sun, Sep 11, 2022 at 07:16:37PM +0200, Hans de Goede wrote:
>> There is no reason for atomisp to use a rt_mutex instead of a normal
>> mutex, so switch over to a normal mutex.
>>
>> All the changes in this patch are just s/rt_mutex/mutex/.
>>
>> This is a preparation patch for switching the ioctl locking over
>> to using the video_dev.lock member so that the v4l2-core takes
>> care of the locking.
> 
> So the idea behind rt_mutex here is to inherit the priority on the task.

Right.

> I'm wondering what could be possible the bottle neck this is trying to
> solve.

I don't think there is any specific reasoning behind the code using
this. The atomisp code is quite questionable in lots of cases and
I have a feeling this was just a case of "oh this sounds like
it is faster, lets use this" .

> If there is no other V4L2 driver that does the same, any specific
> run flow of AtomISP v2 code that may suffer of this?

See above.

Regards,

Hans


