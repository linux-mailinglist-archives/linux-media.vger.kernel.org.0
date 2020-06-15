Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13C5C1F93D6
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 11:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729354AbgFOJqY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 05:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729155AbgFOJqX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 05:46:23 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C1EDC061A0E
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 02:46:23 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id b82so5427632wmb.1
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 02:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5vLWjaHiJRQUv9HYjet2Ro+847tC7bWZlp/6gW1hp+k=;
        b=pZbL0b71fcZ3qeaiBqM/qq+IDxdbXYez5t3AVkIiOmdBi++z4mHjQDXEXhwqoYcDnK
         pqCHPF8yJpKHiEavtbv8GSZNfCToqcM9JvTNalNTZWjtUIhAJCWW2BdlN8TCZZ3iYJWw
         4BdZS7MiiM7ILKJeQpqkPTY+U2dUbq8UXL8JRLWC708S28kPAEbeIWjieut4ENeM/X9U
         Ynx7C417tFzQrlljDidRsl6sRtANLuDgYshOvHVhehv78gleILZEdW5PtWNVUtfqOLs5
         TyLZ9iEYnTO9Q0iGCWQC4frTtkeezkbukYMGrDrs2nZOr8JLhIJckPiCuB9cUW7StRfb
         dHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5vLWjaHiJRQUv9HYjet2Ro+847tC7bWZlp/6gW1hp+k=;
        b=B4s2l+bK41br60xTDnffj+kVU/OYnK527vrtAmImiGQrRs76X87c9v/y8pc5Jnix7P
         faPFBWFpP7HlroYWzVwqyYBI+x/FSo35DdunPKyTkQabuABm/NLEK2Kiot1Wp7xK8Dlg
         Mo736bQuV0W5RvAbPI/wsSwgAvdXp8ldQpogclx4RmehPNU0O7YSFx/365hTWMMSZjDj
         YsY1WDiimzvTcXQkDR4nN8Xpj+550ausFwQPFH6x/dB2DnA2So9QXYV0pJP6GvRUOhgH
         4Wtu2tS9ahlRTERjvlfuJ0YHIS+PAV0KzyJLScveVnSrRzbSV4i6oUC9G4B18gnNM4Kd
         e9SA==
X-Gm-Message-State: AOAM531o4fVJsBLr8/iVrkkB4LyRx2XyzEGeq+Ic5/6OjEw/NdJOlngv
        ZctBf3iWtx+mgfyx7WzyOa/HAw==
X-Google-Smtp-Source: ABdhPJy35U//0vDfeb7NBwQoHw2dAPfMraqx8xyFJshCpSUg/dci31/5vabPF+lADyR2Fg6PWyKM6w==
X-Received: by 2002:a1c:dc06:: with SMTP id t6mr12512135wmg.118.1592214381839;
        Mon, 15 Jun 2020 02:46:21 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id g187sm23677843wma.17.2020.06.15.02.46.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jun 2020 02:46:21 -0700 (PDT)
Subject: Re: [PATCH] media: ov2740: add NVMEM interface to read customized OTP
 data
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, bingbu.cao@linux.intel.com
References: <1591954922-14006-1-git-send-email-bingbu.cao@intel.com>
 <20200615092923.GT16711@paasikivi.fi.intel.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <f4204020-3b84-c138-6648-1e22e194138e@linaro.org>
Date:   Mon, 15 Jun 2020 10:46:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200615092923.GT16711@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 15/06/2020 10:29, Sakari Ailus wrote:
>> +	ret = ov2740_register_nvmem(client);
>> +	if (ret)
>> +		dev_err(&client->dev, "register nvmem failed, ret %d\n", ret);
>> +
>>   	/*
>>   	 * Device is already turned on by i2c-core with ACPI domain PM.
>>   	 * Enable runtime PM and turn off the device.
> Could you add #ifdefs for CONFIG_NVMEM so this compiles when it's disabled?

NVMEM already has dummy functions. IMO its better to report an error to 
user as the current code does. This will atleast alert the users of 
existing nvmem provider that has been disabled!

However with ifdef users have to really look into code to be able to 
understand that there is nvmem provider as part of this driver.


Unless you have tight memory restrictions I see no great advantage of 
adding #ifdefs

--srini
> It's bool so a simple #ifdef will do. I think ov2740_register_nvmem() could
> have a dummy implementation so this wouldn't litter the probe function.
> 
> Thanks.
