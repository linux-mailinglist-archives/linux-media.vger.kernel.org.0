Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3337475A8
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 17:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbjGDPxe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 11:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbjGDPxd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 11:53:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674D8E76
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 08:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688485968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Zk3Vv8BnZlJ+Djwrcd1Wi7b1Ft5eDNE/4tdeZJe6nkg=;
        b=WOiv6y8TzvXwtnPSe4ioGMGi/zmRppjsbw8ua8qtmYcDxgsyWlhbjaqToJcvABtfcZeib0
        bBMtR+cmH6XhWGwVAA2HiX211AFXky8YOclQwXeI+h9i2ngVEd00ZKiWi0L1c+eHZCUgMn
        iIbgsj/nuZQWWxPnQI8SNfgrf1UaxVw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-d3Alqp7_MY-K2LnryLwYig-1; Tue, 04 Jul 2023 11:52:47 -0400
X-MC-Unique: d3Alqp7_MY-K2LnryLwYig-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-51dede4f01eso3073732a12.0
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 08:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688485966; x=1691077966;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zk3Vv8BnZlJ+Djwrcd1Wi7b1Ft5eDNE/4tdeZJe6nkg=;
        b=hhVEGZCZEuW5qrboGRgYHhhAQjxY7ueH7UpmD5Qu6DIShhJTwekqOjbEUuZvWu2+PB
         gieoOhUD9r2kXi/k7yI8vK7AScXiBi8HC/ehHpBQcdbg9x2p0tLCdGn3GNBpcwOnLyfK
         2mniw8uwR5oXaaykuSATxQJ2252DQb1lZbdamOnvCQS0bZDsxCTLNt6ofGKXHlSbQ/k8
         LLH3jZ9q6WfFz5wnzAAEymd9RE/LFCjMp32m96bng1N049WyHazzUrpFMbckWONwgwyn
         iVJMAbpoCciml8BZ3dUZKWfIPzv4vNEUZutdkxspHC0c9D9ccjA5KSba5nNE1MALVy7D
         k/VA==
X-Gm-Message-State: ABy/qLad/pZLMUQ4oCYYSM41SWn9YTiKXIsX1tG+p3i0ht8zUr/bFttg
        Nq8slMO2081rBOI9QCR5yG61plowfFxwaIFRGkuWmMJdowQtYkNHMzy67AAsS3oRzsTqgpp8h/Y
        mUquciYihYbSj/+6CRABbBQY=
X-Received: by 2002:a05:6402:1848:b0:51d:8967:325f with SMTP id v8-20020a056402184800b0051d8967325fmr10877455edy.36.1688485966059;
        Tue, 04 Jul 2023 08:52:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFGyibRynp1R5wJWG/NiCVmeWM0Hj+SLuWoYaoQBaohH6BEtp9wk10RROxqOgCdIy5GHNwV9g==
X-Received: by 2002:a05:6402:1848:b0:51d:8967:325f with SMTP id v8-20020a056402184800b0051d8967325fmr10877447edy.36.1688485965828;
        Tue, 04 Jul 2023 08:52:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id j18-20020a50ed12000000b0051dada80305sm8362992eds.63.2023.07.04.08.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 08:52:45 -0700 (PDT)
Message-ID: <e5cda25d-ca1f-63b2-4c4b-db6cb7ccb8e7@redhat.com>
Date:   Tue, 4 Jul 2023 17:52:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 14/15] media: ipu-bridge: Add a runtime-pm device-link
 between VCM and sensor
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>,
        Dan Scally <dan.scally@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, Hao Yao <hao.yao@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-15-hdegoede@redhat.com>
 <24dc6ebe-0dd7-4f71-50af-c51ccb3714d5@ideasonboard.com>
 <ZKQ6aVxZupe61i9T@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZKQ6aVxZupe61i9T@smile.fi.intel.com>
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

On 7/4/23 17:27, Andy Shevchenko wrote:
> On Tue, Jul 04, 2023 at 04:07:43PM +0100, Dan Scally wrote:
>> On 30/06/2023 13:06, Hans de Goede wrote:
> 
> ...
> 
>>> +	strscpy(work->board_info.type, fwnode_get_name(vcm_fwnode),
>>> +		I2C_NAME_SIZE);
>>> +	/* Strip "-<link>" postfix */
>>> +	sep = strchrnul(work->board_info.type, '-');
>>> +	*sep = 0;
>>
>> I think strreplace(work->board_info.type, '-', '\0') here would be cleaner,
>> and either way probably we need #include <linux/string.h> for the str* funcs
>> here
> 
> What we need is something like strcut(str, '<$CHAR>').
> 
> But related to the above code we can (besides using sizeof() instead
> of I2C_NAME_SIZE):
> 
> 	snprintf(work->board_info.type, sizeof(work->board_info.type),
> 		 "%pfwP", vcm_fwnode);

"%pfwP" ? what on earth does that do ?

Regards,

Hans

