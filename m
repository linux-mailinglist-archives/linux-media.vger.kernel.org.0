Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0169B742418
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 12:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbjF2KlX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jun 2023 06:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbjF2KlV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jun 2023 06:41:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCB5D170E
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 03:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688035232;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0ANddkFGe96tK1GWZAazQoF3YNRL4aEq2ES6nYiQyAk=;
        b=MdKc0y2/jTPZED9c8LPCCGgE6g7xO+jACxAY1M9IfYHr0donf+OTYUOpEwtGPFm6BUILZl
        r5+4SUAuz+p57CLSn1FFbwJ4wmbeN1yk0N47ugB0EZZYs19uPayh9YDoiyWCAiM17uHlm3
        N0myqrKz3m4NHkcb01YeSMaTHFBayuQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-lptP4ZFYOYS3n4JFx7bhZw-1; Thu, 29 Jun 2023 06:40:31 -0400
X-MC-Unique: lptP4ZFYOYS3n4JFx7bhZw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9835bf83157so46561766b.2
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 03:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688035230; x=1690627230;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ANddkFGe96tK1GWZAazQoF3YNRL4aEq2ES6nYiQyAk=;
        b=R/h75A/PBftU5WyhAnCjVe3pFFby/qfcw94/Lsqgs5TG/Ylz3hZXayxvJO/M903unq
         gmgwZD+MD7LDLKAmmbpJKS82QNmMWAIrddgMMifBNcXuQyQiiFpBHp6FmwtOlRDmIjGF
         W/xoKCAlcycg4iM85iTgjQzzJl2adKO6poSzzDwL3s+/n6BI8HJnugE7+gn1S5Zud3Fu
         8IRilcO9M7OLgs3Uc6yxgP2vV4Fanw2eaPiNw3C/GUc6ab8OZhGzTB+iTkCd33E6IluH
         pytG95Z5tp8UopyBNn72F/7qP1/4cVyCF8ZWuOsbRJVzhnfzEK4udPtOf1QdJcNjw7Ay
         xRZg==
X-Gm-Message-State: AC+VfDzd5FXgFofCEFbwKoZLAOKvdbNWloM7dqxR3lEUVN+iP5FxR6lq
        7fq1ybJpuBdqWh9oxY5QGSHBGMhIvY7P0SQKh4VqyLCngawNSVtdGDl+FZiiHfzXtuE5UY7/PNF
        P+YZV8tGJ4MH2L+tYjt473WQ=
X-Received: by 2002:a17:907:6d8a:b0:988:9621:d85f with SMTP id sb10-20020a1709076d8a00b009889621d85fmr25009432ejc.58.1688035230265;
        Thu, 29 Jun 2023 03:40:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ANdxeMBoLhsQUYgo9OkeCUjerwqJxpUCF/nweg0y21rUlblrUB8rF9whV7/mwEXLYXxvmsA==
X-Received: by 2002:a17:907:6d8a:b0:988:9621:d85f with SMTP id sb10-20020a1709076d8a00b009889621d85fmr25009421ejc.58.1688035230022;
        Thu, 29 Jun 2023 03:40:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? ([2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id bm4-20020a170906c04400b0094f07545d40sm6623673ejb.220.2023.06.29.03.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 03:40:29 -0700 (PDT)
Message-ID: <50af0ed6-5166-cbad-5464-e3a3b595c79a@redhat.com>
Date:   Thu, 29 Jun 2023 12:40:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] media: i2c: Select V4L2_FWNODE and
 VIDEO_V4L2_SUBDEV_API for sensors
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Scally <dan.scally@ideasonboard.com>, hverkuil@xs4all.nl
References: <20230629081116.919253-1-sakari.ailus@linux.intel.com>
 <199f7d7a-ae7a-3a08-0a92-14511db0daf5@redhat.com>
 <ZJ1bc6YuHPg6YpOT@kekkonen.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZJ1bc6YuHPg6YpOT@kekkonen.localdomain>
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

On 6/29/23 12:22, Sakari Ailus wrote:
> Hi Hans,
> 
> On Thu, Jun 29, 2023 at 12:11:01PM +0200, Hans de Goede wrote:
>> Hi Sakari,
>>
>> On 6/29/23 10:11, Sakari Ailus wrote:
>>> Select V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API for all sensor drivers. This
>>> also adds the options to drivers that don't specifically need them, these
>>> are still seldom used drivers using old APIs. The upside is that these
>>> should now all compile --- many drivers have had missing dependencies.
>>>
>>> The "menu" is replaced by selectable "menuconfig" to select the needed
>>> V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API options.
>>>
>>> Reported-by: Hans de Goede <hdegoede@redhat.com>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>
>> Thank you for working on this. This looks good to me, but shouldn't
>> all the existing sensor Kconfig bits then have their depends on
>> MEDIA_CAMERA_SUPPORT / MEDIA_CONTROLLER and select V4L2_FWNODE / VIDEO_V4L2_SUBDEV_API
>> bits dropped ?
> 
> Yes. I thought of doing that in a separate patch while this one could be
> backported independently of any added sensor drivers.

Ok, doing this in a follow up patch sounds good.

> I forgot MEDIA_CONTROLLER now can be selected, it's not something to depend
> on anymore.

Ack.

Regards,

Hans

