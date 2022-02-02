Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 353554A70E4
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 13:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232720AbiBBMhq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 07:37:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231748AbiBBMhq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 07:37:46 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 012DAC061714
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 04:37:46 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id s9so38056121wrb.6
        for <linux-media@vger.kernel.org>; Wed, 02 Feb 2022 04:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lwgR6xm+NAPBJxDX8KHZCN27iM3UOFqU8wcuq0v0LHk=;
        b=qSZNG8ni6xKWNcFaMj1jVlgI62RrKcprWmhy9SIcRUWYbPW2ACssJPBxD3VTnHy42q
         bztklRf7AsKvNMqv4epLiEe6+Vlz04IExz42ChOc+F2Pri8mZk4vhuSkMYVT7VP+5S9/
         T7uWbwE0jeGGWVLQJSO8GX/aw9tMAz/zMgtE/bo4ioTK++x0+zMDG9lwOoN8cenguC3m
         /NjcAW+s7w0+TFs17nwXjvk3CXmwXkaw6QZdoqJ/4IppL1tDD66sskTpq+VFVZLwhOGl
         JazJF6FEE6YqcFOoYxxE4ZcQlIZCecAsRAvz7P1wDTa3BTXkjIAaV97ncWvcL/DAPkDP
         PNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lwgR6xm+NAPBJxDX8KHZCN27iM3UOFqU8wcuq0v0LHk=;
        b=6lWQeiUkF+6WXnH1+EFtce5h1BD8dUPsMZiD5c5EshD+xWyrogrlmJ7xs57zMVaTB+
         CuTDNS1AeHM0AgMxfSNzjNEY1vMh10wDucy3vS8kaBf1T8QTnjIT8JIeOh6CIp3NXxnc
         8Kh/qoFsniQYjzt1bVZHThPKTkU0znhjYoxBlInW9Q2WYQcEH6nlmWnL4As/9eSKfZvA
         9w72fEbRLWu6yOJWYwgNoiapJQhN43PPo9KLV3VwWfpS8J7TPv3xB06qyZ6GH1Mg0D+k
         nvIrcYEF2hOpuaeG1qjJ1K0NZJjknIFlPG03Ol6k6mozHCfH3Nz5UqQSPLJnmW3xA3M9
         Ao2g==
X-Gm-Message-State: AOAM531VRvc0nlgolrj4Kt8OyTPqyyQMmkEZvVg2IsC3AgOrwrUGOQQu
        LeWsYa/dmWYz4FBx094xcno=
X-Google-Smtp-Source: ABdhPJwEiJQhgThW86O22LoWVDedTWCNqPO1vCpiMPQwQop8V1OZg1ekTD06GizpJldI2d91X8bDAQ==
X-Received: by 2002:adf:aade:: with SMTP id i30mr25706340wrc.179.1643805464452;
        Wed, 02 Feb 2022 04:37:44 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id a15sm17163983wrp.41.2022.02.02.04.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 04:37:44 -0800 (PST)
Message-ID: <eaf74f02-f559-dffe-3002-0768db6fcfc2@gmail.com>
Date:   Wed, 2 Feb 2022 12:37:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] media: i2c: Fix regulator disable balance in ov8865
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com,
        kevin.lhopital@bootlin.com
References: <20220130213621.70780-1-djrscally@gmail.com>
 <Yfp3YpPto0o+uP3l@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <Yfp3YpPto0o+uP3l@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 02/02/2022 12:21, Sakari Ailus wrote:
> Hi Daniel,
>
> On Sun, Jan 30, 2022 at 09:36:21PM +0000, Daniel Scally wrote:
>> ov8865_sensor_power() disables all three of the sensor's regulators
>> on the error path, however not all of the regulators may have been
>> enabled at the time of the error, which will result in unbalanced
>> disable calls.
>>
>> Fix the issue by adding specific error paths for each regulator.
>>
>> Fixes: 11c0d8fdccc5 ("media: i2c: Add support for the OV8865 image sensor")
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> Thanks for the patch.
>
> This has been already fixed by commit
> cbe0b3af73bf72fad197756f026084404e2bcdc7 (in media tree).
>
Ah cool ok - my bad :)
