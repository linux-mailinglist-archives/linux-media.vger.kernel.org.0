Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33B4B4148C4
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 14:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235545AbhIVM1j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 08:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235227AbhIVM1j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 08:27:39 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 666CAC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 05:26:09 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id t8so6282992wrq.4
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 05:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HZNFhw6PY3/T4DQN7yWkHN4fI7K+TJpH9IIfWzXMQrE=;
        b=fDr6KrDkAUiVURLnotDyIkrkvBBEa4HGtPQCw08G3AJL66q+GODDpJN+MR16rGZB+/
         YNy0NclqwvcWDGT914/2agJEa44V/q7dtqzn7XZWzllCMmywNfYMEuIKCK4WWv8+kVr3
         TRRoOosg5tPB1vqXPKNLWA0UCjGkAELWUC4nDTL5q0SwM/cmoelGuT35T+nf1/OKR/zn
         V7/Cc3VIhbNIFjjTP4Dl+hocrNmqEcLD55EDtWm72iA6gsc6cQnSmHNocmj2BpxAM0QK
         jVk56JzDgS2EA6JKthOJRl69ABX8yQJhJpalJ+0FyCAcida8N9/kcwTDLzjX25rT+Nru
         JMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HZNFhw6PY3/T4DQN7yWkHN4fI7K+TJpH9IIfWzXMQrE=;
        b=A5jV48sEJhGGGokAbtd7Vw0RViA8dvxWrAzlBjwbVqY6TIGE2ossGBN+3pgCHlCMhR
         fXaiBJ0Dn32VL1/qO/iCZIkN1iVwWTNZlvbxEH+/xDCeELqrBvf6kb1qQIcquQh7XhE4
         zr9kpxYCrK9CZPY1XkN7eugNvPUifKsQMPYPuZ+I5akGhBpU0QND9FFnHMyVV5aIrfOc
         ZXzH7mfIR7MxTcSqyHZAkpMIqItdRH8Ebilp7mjnJFPtaRfZP/OZ7aCMSyDBjgwoLlUd
         fyP4sUdgxIHR2sO3jGYD177vWRGOBj7cgc33Ahv1fD+YHWcG+4PcKFKUVKXPU52c4/Fs
         8HdQ==
X-Gm-Message-State: AOAM53045SsvOawQX/LYqmt9efEr1BpJAsUsO3KpCtCLi9kcNgMFet+N
        f8+Ns3vCYcWFPE92ldF/AVfvn6z9kGw=
X-Google-Smtp-Source: ABdhPJzbQrWSxMms5UYwL37R92pkHMOLWsZFARMndAqch6tkNpr/HKosfjbI9vmjBobhwPKUhte18Q==
X-Received: by 2002:a5d:4e90:: with SMTP id e16mr40954105wru.243.1632313568060;
        Wed, 22 Sep 2021 05:26:08 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v18sm1878484wml.44.2021.09.22.05.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Sep 2021 05:26:07 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] media: i2c: Add support for ov5693 sensor
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kieran.bingham@ideasonboard.com,
        jeanmichel.hautbois@ideasonboard.com
References: <20210920225422.42618-1-djrscally@gmail.com>
 <20210920225422.42618-3-djrscally@gmail.com>
 <YUmhuYiFoSL21bj4@paasikivi.fi.intel.com>
 <6fda38af-2556-4796-b3c5-a80a864466f4@gmail.com>
 <YUnUtdXpYdoIyb4s@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <f19d6824-07e7-1647-db81-5c98d25308d1@gmail.com>
Date:   Wed, 22 Sep 2021 13:26:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUnUtdXpYdoIyb4s@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 21/09/2021 13:48, Sakari Ailus wrote:
> Hi Daniel,
>
> On Tue, Sep 21, 2021 at 12:47:56PM +0100, Daniel Scally wrote:
>>> +
>>> +static int ov5693_get_exposure(struct ov5693_device *ov5693, s32 *value)
>>> +{
>>> +	u8 exposure_hh = 0, exposure_h = 0, exposure_l = 0;
>>> +	int ret;
>>> +
>>> +	ret = ov5693_read_reg(ov5693, OV5693_EXPOSURE_L_CTRL_HH_REG, &exposure_hh);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = ov5693_read_reg(ov5693, OV5693_EXPOSURE_L_CTRL_H_REG, &exposure_h);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = ov5693_read_reg(ov5693, OV5693_EXPOSURE_L_CTRL_L_REG, &exposure_l);
>>> +	if (ret)
>>> +		return ret;
>>> Does the sensor not allow reading this register as a single operation?
>>>
>>> Just a question. Some sensors from the vendor do not. Same for the writes.
>>
>> It does; if I'm honest I just preferred the individual read/writes. I
>> find it's easier to see exactly what's going on. Happy to change it if
>> you prefer though - it's less important now that the work is mostly done.
> It's certainly not wrong to do that but it takes a longer time. So you're
> much, much more likely to miss the frame you intended the settings to take
> effect. Also note the device could have a specific order in which to write
> them for the update to be atomic. Missing this could cause wildly
> misexposed frames. I don't know if this one does.
>
The datasheet doesn't mention a specific ordering, but I take your point
about the timings. I'll look at switching it to a single write operation.
