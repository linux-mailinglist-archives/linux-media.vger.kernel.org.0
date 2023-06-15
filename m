Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97BB57312FB
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 11:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244193AbjFOJD5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 05:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239563AbjFOJDz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 05:03:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB721720
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 02:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686819788;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S9g3npIT2jua5VrsszLK4EBQv5IxM5EAjlMujFVlJ0w=;
        b=HimUk9bHcBp3bd9a5drCScuqf+Dfa2LUhwI7H7FcEQYDVXfZ6A1RnG/Fn12yctbz4xehd9
        x+NzASVOlBhOZd5rnkaOCOpDQ0m/Gl7QiGl17CLEaf0AmhuhmzjYwS8ssM/hC4+bRW72NO
        urFqsqwIWXWpfnS40P9GO2wk0g2DntQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-VscQk6VGP2yo90ShWcmHeA-1; Thu, 15 Jun 2023 05:03:07 -0400
X-MC-Unique: VscQk6VGP2yo90ShWcmHeA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f8277702edso8613375e9.0
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 02:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686819785; x=1689411785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S9g3npIT2jua5VrsszLK4EBQv5IxM5EAjlMujFVlJ0w=;
        b=ijx/kEFszJuVoDDQxaM9SH9xX0eeQfx9mNiD8f/woeg+rfiwChkbZ34JD2iHaU/8WO
         CVMQ5ZZuTis1fNs6o1Njpo1U5+GcEGFpOoZC1OguqrwGKjNjafTbBrVQO4h5YTMsYvJ+
         xkTWJ8WzZ+GIjiGkEGNqoeX1us0HeHg02er9s7KvM2d87dxPUtfxfMQhl0q0dW5ZBF+S
         i1zsnWSjlak4rHk5CGeFpEYCH7he5jbUAJ49tzO07GgLfG+xOFoq5soyungGnW57ixZf
         2/ErNCSpE3ywwKdYJXxF9QyVmxdGLIFqeoRL0OgLA7YCiinBMQb7ITEFP3QmFIhgcgSP
         y/Qg==
X-Gm-Message-State: AC+VfDzATTfreL0MpYZ2xVr3XESeKw+cAGHF9m7YPVOIEbO+WJq3PEGm
        pR71LeV6iHFxu39pc0RHQah2yvXn1IUUGVjCb1hsCVyt2Ae5eyjNn0Lyqelfmp5vuTH9ukA/W8z
        ToyPgVJFKC+1iuX1YFHypIcZ4+QlzzGg=
X-Received: by 2002:a05:600c:3786:b0:3f7:f45d:5e44 with SMTP id o6-20020a05600c378600b003f7f45d5e44mr12471385wmr.32.1686819785614;
        Thu, 15 Jun 2023 02:03:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4J+qDolYEi4ZbTP8Eg+KSmyRC6hTvdPnIrRRZ/gqpHz5hxQHWQ/kvQa7ZIK5b2aFLR434Q+g==
X-Received: by 2002:a05:6402:14da:b0:518:7bc3:7c4e with SMTP id f26-20020a05640214da00b005187bc37c4emr3812146edx.25.1686819764176;
        Thu, 15 Jun 2023 02:02:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r18-20020aa7cb92000000b005163c11700csm8662419edt.74.2023.06.15.02.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 02:02:39 -0700 (PDT)
Message-ID: <2123e55c-7591-14d9-3303-9ff152181637@redhat.com>
Date:   Thu, 15 Jun 2023 11:02:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 4/5] media: atomisp: ov2680: Convert to new CCI
 register access helpers
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-5-hdegoede@redhat.com>
 <CAHp75VdgN4Uc4_LdPO+q1kwV8so4Uey6h8R8fqyf=XEO9Ns8_g@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdgN4Uc4_LdPO+q1kwV8so4Uey6h8R8fqyf=XEO9Ns8_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On 6/14/23 22:15, Andy Shevchenko wrote:
> On Wed, Jun 14, 2023 at 10:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Use the new comon CCI register access helpers to replace the private
>> register access helpers in the ov2680 driver.
>>
>> While at it also switch to using the same register address defines
>> as the standard drivers/media/i2c/ov2680.c driver to make merging
>> the 2 drivers simpler.
> 
> ...
> 
>> @@ -121,7 +59,8 @@ struct ov2680_dev {
>>         struct media_pad pad;
>>         /* Protect against concurrent changes to controls */
>>         struct mutex lock;
>> -       struct i2c_client *client;
>> +       struct device *dev;
>> +       struct regmap *regmap;
> 
> Similar question as per patch 2. Do we need both of them?

You are right that having both is not strictly necessary,
but the entire atomisp-ov2680.c file is going away as soon as
my main ov2680.c driver changes series is merged.

The only reason to upstream this patch is because much
of the work landing in the main ov2680.c is copy -pasted
from the state of atomisp-ov2680.c *after this patch* ,
so having this in git history before deleting atomisp-ov2680.c
is helpful in case someone ever finds the need to compare
the code.

Since the next patch for atomisp-ov2680.c after this one
is going to be deleting the entire file I really don't feel
like spending time on fixing this minor review remark,
I hope you understand.

Regards,

Hans




>>         struct gpio_desc *powerdown;
>>         struct fwnode_handle *ep_fwnode;
>>         bool is_streaming;
> 
>>         } ctrls;
>>  };
> 

