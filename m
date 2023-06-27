Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F59A7401FA
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 19:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbjF0RS6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 13:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbjF0RSo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 13:18:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644461FE4
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 10:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687886278;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D8MioDIeTSCV9oChTO0+PUO3/pY82m7rR3GsaWcWR6o=;
        b=RNf3kW5h7FKcVBo+9Khmz+5CncF5lHeiVlW9/Y3oUE+vjtmRO4EAwsdCIJhYxfosdsVPNa
        iPrl24Uls8GfcMssDqtyIkCyxUFkyuoSEP3QYcwMcOWUblO1tD0ttAyw8lEmJNd+10sTS9
        PjtaHgDI13D/XjT1lIaz5pJ2nzpbjPg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-MZ4uPwr1P16y22ijcmjYhA-1; Tue, 27 Jun 2023 13:17:56 -0400
X-MC-Unique: MZ4uPwr1P16y22ijcmjYhA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9879d2fc970so349900766b.0
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 10:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687886275; x=1690478275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8MioDIeTSCV9oChTO0+PUO3/pY82m7rR3GsaWcWR6o=;
        b=Z38IftQEhLcSA5g911YnKRS5MfrbwKdXyGCMQD30+s9cgPEryh0wNWSkhXL9E5a3Yp
         NJCnISb3LDTYfjx02Ql7HUVB7maDHOBfepFGeqawrPlhRCbrKFSD70Tmm1coE0dd+/Px
         MRdc32fkK0d/XFk5vL/pTyLkbBe1QDlf8ka0X2XTNPZ3JiwirN4Yv7YH2B4wYDKZvbCD
         BScsH/gxHzAPv6pAhirb+TPpDK2svSUrOmvhEHu+wVbec++ZyR+j1EaLKqMVvo8/z3Ep
         E+dUG9NLZ8Rf+lXbFZlAuMbdPiUU+wHG85D+4fJjdTrBXmhwbCiOf61KvG8qldm+bjrx
         spVg==
X-Gm-Message-State: AC+VfDyU1asdtYlVbL7sGTO/4i7/ixFUBFuvhErGn7nkWv1uqIHfRY5T
        fYSYJ6obkr6Ao7k+dsjHYlNAAluFrrA3AJq1MIY4fW+tKy+3DDcs7Mn7cOn4GgA6t/F5dgqqb7y
        M1I1ZuUOs55FpklxDXoDiv0s=
X-Received: by 2002:a17:906:6488:b0:98d:5333:79c with SMTP id e8-20020a170906648800b0098d5333079cmr11650132ejm.5.1687886275004;
        Tue, 27 Jun 2023 10:17:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5SQx04Ag5ruRTUPKJj+O/c76q8s1dukQRsGE847KPZvxetMTCSZqHV938t/SxnUOxAsSX6wg==
X-Received: by 2002:a17:906:6488:b0:98d:5333:79c with SMTP id e8-20020a170906648800b0098d5333079cmr11650114ejm.5.1687886274773;
        Tue, 27 Jun 2023 10:17:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j2-20020a17090643c200b0098669cc16b2sm4683929ejn.83.2023.06.27.10.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 10:17:54 -0700 (PDT)
Message-ID: <c519dd10-43fb-f7a3-db4f-049a919d149e@redhat.com>
Date:   Tue, 27 Jun 2023 19:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 07/29] media: ov2680: Fix ov2680_set_fmt() which ==
 V4L2_SUBDEV_FORMAT_TRY not working
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-8-hdegoede@redhat.com>
 <abnylacvx7hhhvpu7bmcuyf7cwm2g7snmbngwi3ckaowfakuqe@yvk7ghilhru5>
 <ZJsUlErfzcpBNljz@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZJsUlErfzcpBNljz@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 6/27/23 18:55, Andy Shevchenko wrote:
> On Tue, Jun 27, 2023 at 05:08:39PM +0200, Jacopo Mondi wrote:
>> On Tue, Jun 27, 2023 at 03:18:08PM +0200, Hans de Goede wrote:
> 
> ...
> 
>>>  	mode = v4l2_find_nearest_size(ov2680_mode_data,
>>> -				      ARRAY_SIZE(ov2680_mode_data), width,
>>> -				      height, fmt->width, fmt->height);
>>> +				      ARRAY_SIZE(ov2680_mode_data),
>>> +				      width, height,
>>> +				      format->format.width,
>>> +				      format->format.height);
>>>  	if (!mode)
>>>  		return -EINVAL;
>>
>> Nit: only if you have to resend, could this be dropped? mode will be NULL
>> only if ov2680_mode_data[] has no entries.
> 
> We shouldn't rely on the implementation details of some API if it's not
> advertised that way. Even if it is, the robustness of the code is better with
> this check.

Note non of this is really important (as Jacopo already mentioned
it is just a nitpick) since this code is completely removed in
a later patch.

Also note that the check was already there, so removing it
would be out of scope for this patch.

Regards,

Hans


