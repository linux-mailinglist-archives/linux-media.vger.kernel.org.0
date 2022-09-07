Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1525B5B0F17
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 23:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbiIGV0x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 17:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiIGV0v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 17:26:51 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC4A81683
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 14:26:50 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id bp20so22100803wrb.9
        for <linux-media@vger.kernel.org>; Wed, 07 Sep 2022 14:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=TnudcrKYd1FgHOLf8g++9WVbju98ULNyqOdTl1nUFAY=;
        b=h6dSK5er3XR+4lFhMauH0LG1ov8+EeFMqrMsBPiAk9fll/kfiUUbTLdHwQ59KXwavN
         GIcP6eu0VdNaT9q/B6+9WaVlNGuN0yMAEVT6YmCfp5rmJuRaoifQg1ZsmRldm4t3QJgD
         lucVTnNoiEBGu5YDc9W5d/WTd1UQapdXlVo9LZJZ7DtImskePvjQ0hMYRibnh72S6duq
         9o6MMHBaohLEGR0yxrWczmV54g/KDfwVIIBtm+6KNopEnV5aziQr69h0iSzkvy/UYr7S
         KdRyTydEPBuJINIlEdYkdUxR2bjW3Fo/yw0/SP5/Uf2sgJHqEXLIvS36jXx1/g/uuwe8
         pRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=TnudcrKYd1FgHOLf8g++9WVbju98ULNyqOdTl1nUFAY=;
        b=gY11OPcMkZs5sEwoH7+GfU9qXxyWYfyIpKXJ7AEbHmQ5aUKpMiJaxaH/aRHMA4a1Ai
         TBYJmUoC0A8ckHsVnVEts+57AMhjiFLhjlUZXDKSJadlH8ucfP85ZhQp29nCWYW8ZlU8
         clBFil0n/TKkgUt4iyK8NomJbYxojDnQVqIiQwYDhdWrLNaAh+Ow3TQwAcouOH0kKTIn
         7hu2/YnqqarjwkbsuAs+H3dRXDZDoSwAMBL5h5T1VI+ciYBVWuPKNciztj2bP2j3h6+B
         YAHeGv7zm3GiV6ksneQRKTqigTPM3S5hOGnElbBVEFQXfp0em5w9BKvBZd+Ht/jsafIp
         av/A==
X-Gm-Message-State: ACgBeo2Ur5ZtRgTViSRS0y6DN5j9cLUbFetu2Fan4/+vUon93TzCd+xk
        chxyyCMCOOCftgC1VGbidsp/S4Bryyc=
X-Google-Smtp-Source: AA6agR6ZUIzo200bldoW9PmJr/OQ33O9be6zNEpqR+kVZL58JCcAj3jAXcy99Bz5lXSkjIUvyyL4Ew==
X-Received: by 2002:a5d:6c6b:0:b0:225:dde:ab40 with SMTP id r11-20020a5d6c6b000000b002250ddeab40mr3239265wrz.690.1662586009349;
        Wed, 07 Sep 2022 14:26:49 -0700 (PDT)
Received: from [10.22.0.7] ([37.120.217.162])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600016cd00b0022762b0e2a2sm19005027wrf.6.2022.09.07.14.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 14:26:48 -0700 (PDT)
Message-ID: <556b36fb-9255-daa4-0cda-bb3bb7f53b8e@gmail.com>
Date:   Wed, 7 Sep 2022 23:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/1] ipu3-imgu: Fix NULL pointer dereference in active
 selection access
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        tian.shu.qiu@intel.com, tomi.valkeinen@ideasonboard.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220825190351.3241444-1-sakari.ailus@linux.intel.com>
 <db44a24b-2a9a-6682-4825-eedc4ecb1340@gmail.com>
 <Yxj4jmCQ4zvKN3sp@paasikivi.fi.intel.com>
Content-Language: en-US
From:   Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <Yxj4jmCQ4zvKN3sp@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/7/22 22:01, Sakari Ailus wrote:
> Hi Maximilian,
> 
> On Wed, Sep 07, 2022 at 03:44:44PM +0200, Maximilian Luz wrote:
>> Hi,
>>
>> On Thu, 25 Aug 2022 22:03:51 +0300, Sakari Ailus  wrote:
>>> What the IMGU driver did was that it first acquired the pointers to active
>>> and try V4L2 subdev state, and only then figured out which one to use.
>>>
>>> The problem with that approach and a later patch (see Fixes: tag) is that
>>> as sd_state argument to v4l2_subdev_get_try_crop() et al is NULL, there is
>>> now an attempt to dereference that.
>>>
>>> Fix this.
>>
>> Thank you for this fix, this however only addresses
>> imgu_subdev_get_selection(), but the issue is also present in
>> imgu_subdev_set_selection(). I assume that a similar fix is needed for that.
>> I've added a diff for that below. Feel free to squash that into your patch or
>> let me know if I should submit this separately.
> 
> I've already sent a PR that includes it. Could you send this one as a
> patch, please?

Sure, I'll do that. I'll also follow Laurent's suggestions and introduce
get_crop()/get_compose() helpers as I think that might be a bit cleaner.

Regards,
Max
