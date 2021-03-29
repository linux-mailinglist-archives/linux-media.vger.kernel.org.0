Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0267E34D948
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 22:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhC2UsI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 16:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhC2Urw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 16:47:52 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81806C061574
        for <linux-media@vger.kernel.org>; Mon, 29 Mar 2021 13:47:52 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id e18so14144155wrt.6
        for <linux-media@vger.kernel.org>; Mon, 29 Mar 2021 13:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3qYuKfMWSCgX+js+2GWSJXYUGgZhqF401yOZtCsqoWs=;
        b=WQm1dG09J3fKMl6GRgQIUxr6+kCY4bPhm3w3Wz2N5Cu1BheprV+RVI6N+cFT1ZHuYe
         acY1rZ5rSey1Ofr5MSpQI3ShKBOpqtDHzFEh1MqIozJlsZ1W0U9vmlR37HtbR68D4htz
         X9v/yBvsZNy/1gBjfIxKw8JEqgkElhhoX0es7jAeS16io5WHwcP+QmbXwpqYwVSzPdVY
         1ocIRKQnL6Ee7MLsiDOtfCDQtx0UuncLm1HkXyOWUkR8zUjHrxPcKfDoBxd5FGa4co9R
         7ks+d0fKhM8s0RjbL6BkKhmS30uCejBPtEKUlUEsqLiZtkDT5rbMQ3Ad95/JKWLD4GoL
         qbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3qYuKfMWSCgX+js+2GWSJXYUGgZhqF401yOZtCsqoWs=;
        b=lg0hK8wp5ZiKQQQteM0KlXfzB9sksvkFMz8dugC6096g/URN+C4d7KhuL0bZSQEpDH
         E+Qb5GrjK1OElvCXBz3BA2MrLa6Rja9HJnXQVubfbCbHkZpdGlNyK5714XcMw+YIzcLT
         43BKQEEx2jZvl7aMya/p5YDVWWyItfJZRAMVGE2GJovemZjy2PfOVoHTSR3AYSAPKBiY
         0fvQKcS8eFjcwctet4o469x7TfPROzQdpmufhr+1ms7V3nq24mbX+7MeK98uB4NJ3qno
         e3adpn8I6fhHdiTf/bBVyPW3qtYvlmN1/il2QefqzOTss40702VIxCMhwCaFBvM5H1o3
         JUWQ==
X-Gm-Message-State: AOAM531hShanpugp3nYESahndKIdrnM2e1xvdMglblP6xpwtT00C2950
        UOtV8asVR2xvq589WN31hNE=
X-Google-Smtp-Source: ABdhPJyegX1C42uZZjK893w2s3IMr0quphEhCNhT+2HwAhk2Oh4x5zC+8pS9Ge3w2CTb73XTCxECoA==
X-Received: by 2002:a5d:6411:: with SMTP id z17mr29788754wru.119.1617050871190;
        Mon, 29 Mar 2021 13:47:51 -0700 (PDT)
Received: from [192.168.1.211] ([91.110.20.103])
        by smtp.gmail.com with ESMTPSA id l15sm30892226wru.38.2021.03.29.13.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Mar 2021 13:47:50 -0700 (PDT)
Subject: Re: [PATCH] ipu3-cio2: Parse sensor orientation and rotation
To:     =?UTF-8?Q?Fabian_W=c3=bcthrich?= <me@fabwu.ch>,
        linux-media@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210321191155.55723-1-me@fabwu.ch>
 <682898ab-c63d-160e-8fdb-7003a856cc07@gmail.com>
 <abe2dd5f-7854-091c-9871-4aa11e5d8b28@fabwu.ch>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <77ca125d-f603-af81-b1df-99c71e62d777@gmail.com>
Date:   Mon, 29 Mar 2021 21:47:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <abe2dd5f-7854-091c-9871-4aa11e5d8b28@fabwu.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabian - sorry for the late reply.

On 22/03/2021 15:16, Fabian Wüthrich wrote:
>>> +#define CIO2_SENSOR_ROTATION_NORMAL		0
>>> +#define CIO2_SENSOR_ROTATION_INVERTED		1
>>> +
>>
>> I think these are good here but...
>>
>>> +/* Panel position defined in _PLD section of ACPI Specification 6.3 */
>>> +#define CIO2_PLD_PANEL_TOP			0
>>> +#define CIO2_PLD_PANEL_BOTTOM			1
>>> +#define CIO2_PLD_PANEL_LEFT			2
>>> +#define CIO2_PLD_PANEL_RIGHT			3
>>> +#define CIO2_PLD_PANEL_FRONT			4
>>> +#define CIO2_PLD_PANEL_BACK			5
>>> +#define CIO2_PLD_PANEL_UNKNOWN			6
>>> +
>>
>> ...I wonder if these ought to go somewhere in the include/acpi headers.
>> You might be the only person to refer to pld->panel in driver code (at
>> least a quick grep doesn't show me another one, and only another couple
>> of uses of pld at all) so it's probably not a big deal, but it just
>> feels slightly the wrong place. What do you think?
>>
> I agree. What about include/acpi/acbuffer.h? But I don't know if this
> hinders the acceptance of this patch.


Yeah I think that's probably the right place. I don't think this is a
blocker no, but you'll need to do a v2 anyway to extend the array below,
so you could include another patch then.

>
>>>  #define CIO2_SENSOR_CONFIG(_HID, _NR, ...)	\
>>>  	(const struct cio2_sensor_config) {	\
>>>  		.hid = _HID,			\
>>> @@ -80,6 +93,7 @@ struct cio2_sensor_ssdb {
>>>  struct cio2_property_names {
>>>  	char clock_frequency[16];
>>>  	char rotation[9];
>>> +	char orientation[12];
>>>  	char bus_type[9];
>>>  	char data_lanes[11];
>>>  	char remote_endpoint[16];
>>> @@ -106,6 +120,8 @@ struct cio2_sensor {
>>>  	struct cio2_node_names node_names;
>>>  
>>>  	struct cio2_sensor_ssdb ssdb;
>>> +	struct acpi_pld_info *pld;
>>> +
>>>  	struct cio2_property_names prop_names;
>>>  	struct property_entry ep_properties[5];
>>>  	struct property_entry dev_properties[3];
>>
>> You should extend dev_properties to 4 members; there needs to be an
>> empty entry as a terminator or it'll be a problem in the event someone
>> tries to access a property that isn't there.
>>
> Good catch. Thanks I missed that.
