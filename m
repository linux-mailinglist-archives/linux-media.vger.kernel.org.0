Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8BA1C4885
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 22:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbgEDUqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 16:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgEDUqG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 16:46:06 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9793BC061A0E
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 13:46:04 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id g13so104591wrb.8
        for <linux-media@vger.kernel.org>; Mon, 04 May 2020 13:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=WC6ABTsqBwsJiLzCcyNcAvTn7B7znugoI2OV2592I1E=;
        b=EHrBWaY61TDPgE1q9OHAWaVVrmc1f1K1hfABezD4mb6NxP6Owm3OJFKqtlt4Cn2eLJ
         EkjxZCNUdujxKw0Jq1dGVCK0+m7UOMb2L7eECb/17Tqa8qJAdGrzqiVje8ngCxLBTeUJ
         DhBKUNdzrYWoCluK8MO6Tyqnt0YL079q0CuXjCpZC7SVQTPBf0fm+H4T/rFyv21rCwTz
         tZlYyj/EZP6jcOOT3A6+l07faZ+0sWnqxyRBN7sI3IohnBvxHu7q9Cwi7QHwkovJwu4R
         z/88xnX5ob+M55cVg9hpVnJ0GlGEvKSMUaKC/eDdRwvHNqoNkAy1R9KU7j78cf8S3Udt
         ni8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=WC6ABTsqBwsJiLzCcyNcAvTn7B7znugoI2OV2592I1E=;
        b=OKqoycINrUEhxxTQr6K83/Ay7Y0yNqIJCB/PwZwWtgW1d7vQwN1ASSkahtDzx1XFed
         +ZVxFPcKOIMNMLZatZ21nGXvEaCN+cIzBr7G8p3UQEl4vkgehOk5lCWdF3noSzHayQhf
         ItFB3RNz6HiRlHRan6+prS9cIBKHRsBPDhOoECZvYE7lKFf2Qf0PYzzu5K3f4xajhFIQ
         xipeuUH1LJCVp2H2IjNZ1rQXzVWhi4sm46ZuzDb9brSG3zZwJM80tmuv6vbEq2KRrUSC
         XyyfuBkBdCtAGo1XwHuq7juOjRVXyJ5/Y3okX25PiqJUZ4DRG8DVzM/ViVAnKxnC3fRA
         HfyQ==
X-Gm-Message-State: AGi0PuYKBTk8EMHgMsdVEZwNeK+nVHCNz9nllHqMIjUtORPg+S+rtwZ6
        7QZmQAlKIvjiOCt/kt7v32Z0zA==
X-Google-Smtp-Source: APiQypJcLuThM2VxbyH3CXm0Wa9M0nv1PgF+H05fcWow0OzRMQcHGga2+6utMgbffixWEDrGIy4grQ==
X-Received: by 2002:adf:e5ce:: with SMTP id a14mr1207010wrn.82.1588625163170;
        Mon, 04 May 2020 13:46:03 -0700 (PDT)
Received: from PhilsPB.lan ([86.12.207.65])
        by smtp.gmail.com with ESMTPSA id s17sm134215wmc.48.2020.05.04.13.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 13:46:02 -0700 (PDT)
Subject: Re: [PATCH v2 29/34] staging: vchiq: Add 36-bit address support
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.org>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-30-laurent.pinchart@ideasonboard.com>
 <00cc89e24aa5c3d4286b6f42347aa87e7699c4e5.camel@suse.de>
From:   Phil Elwell <phil@raspberrypi.com>
Message-ID: <7cbd4185-0d26-aa26-3f7a-56b5b13e5336@raspberrypi.com>
Date:   Mon, 4 May 2020 21:46:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <00cc89e24aa5c3d4286b6f42347aa87e7699c4e5.camel@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On 04/05/2020 18:40, Nicolas Saenz Julienne wrote:
> Hi Phil, Laurent,
>
> On Mon, 2020-05-04 at 12:26 +0300, Laurent Pinchart wrote:
>> From: Phil Elwell <phil@raspberrypi.org>
>>
>> Conditional on a new compatible string, change the pagelist encoding
>> such that the top 24 bits are the pfn, leaving 8 bits for run length
>> (-1).
>>
>> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>> ---
>>   .../interface/vchiq_arm/vchiq_2835_arm.c      | 88 ++++++++++++++-----
>>   .../interface/vchiq_arm/vchiq_arm.c           |  6 ++
>>   .../interface/vchiq_arm/vchiq_arm.h           |  1 +
>>   3 files changed, 74 insertions(+), 21 deletions(-)
>>
>> diff --git
>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
>> index 3e422a7eb3f1..ecec84ad4345 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
>> @@ -16,6 +16,8 @@
>>   #include <soc/bcm2835/raspberrypi-firmware.h>
>>     #define TOTAL_SLOTS (VCHIQ_SLOT_ZERO_SLOTS + 2 * 32)
>> +#define VC_SAFE(x) (g_use_36bit_addrs ? ((u32)(x) | 0xc0000000) : (u32)(x))
>> +#define IS_VC_SAFE(x) (g_use_36bit_addrs ? !((x) & ~0x3fffffffull) : 1)
>
> As I commented earlier, this is a sign your dma-ranges are wrong, most of the
> code below reimplements what is already done by dma-direct (see
> kernel/dma/direct.c). Once properly setup, you should be able to use whatever
> phys address dmam_alloc_coherent() provides and drop g_use_36bit_addrs.
>
> Note that on arm32+LPAE, dma-direct/swiotlb are the default dma_ops, so this
> also applies there.

As I explained in an offline email, the problem is that VCHIQ needs access to two
kinds of "DMA" addresses - those suitable for the 40-bit DMA channel, and the
30-bit addresses that the VPU can use. Since each DT node only has access to a
single set of DMA ranges, I can't see how to use dma-direct to calculate addreses
for everything, but feel free to submit an alternative implementation showing how
it should be done.

Phil

