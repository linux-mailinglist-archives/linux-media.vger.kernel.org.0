Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC28940973F
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 17:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233779AbhIMP1y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 11:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhIMP1o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 11:27:44 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D22C0FA0B3
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 07:24:53 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id m11so12299167ioo.6
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 07:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=y4Lq9CmvVcXXhPkYqU8poyyam6g50FxqVLy0oSkOGwo=;
        b=cr3Szu2PZkLNoOgq0/pNUQ7Fj5694Bo2qV8vrVedRjJCfzgGVXOzeEYVheg4ZPxGEv
         3aCVgAf9I5Kz+XUoyOocmaSYPYPnbuPvwm8fGpvMCuWC0o+1E+mXMACJtVgk0uIJUU9h
         t/yXY9ZSwWjKUjFKgM4E6NRaTZTBoBrpKixGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y4Lq9CmvVcXXhPkYqU8poyyam6g50FxqVLy0oSkOGwo=;
        b=tTBH+VoXAdiLteaoImIna1O8FNYt0a/ubBbolKTtNXt3QS6Kh1qQS0N/haYjzgyxR5
         6qjKKtiYIBhf0iy5Vu5OlPG92USM+No2MVeA1+dNyax3MqcuvhcXMJXKk/WO/T0HEMeK
         wVqhoTE1nWSw8AJrMf8B2Mcsbmar+ptdIRrZyggW95ZvT1/fFmsWbjdVPobmIH1Gxa9p
         ZymNjmOq+s7s+E9ZhfRe9cuGGeVVUXWgM7lxVMjOdQiJB4zAZJ0Qm+kmia5caMBDRXBM
         hqSb5d7cAiurDi74MTrbQA1EOSuhZCYqDD8Z9ln7s7TU8X8hhtGYrhxxkRxtiDwnrM9D
         NlZw==
X-Gm-Message-State: AOAM5305hfaefb6L6ffV5J3Xx/q5jg8DQ/UOh9bS6qARlbKSKjoU/tA4
        r6Uonusw2GOqPod0Ic74Mw82ZQ==
X-Google-Smtp-Source: ABdhPJx/eqqIB4vBAz8lHgsBf/5IFCa6nkTSnkdfc1eI2EY+xn1/EEl30qUR5S0dnd5MPZmncifOqg==
X-Received: by 2002:a05:6638:1301:: with SMTP id r1mr10200622jad.32.1631543093348;
        Mon, 13 Sep 2021 07:24:53 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id w3sm4899283ilc.23.2021.09.13.07.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 07:24:52 -0700 (PDT)
Subject: Re: [PATCH] media: atomisp: fix control reaches end of non-void
 function error
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, paskripkin@gmail.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210910223700.32494-1-skhan@linuxfoundation.org>
 <20210913084102.GF7203@kadam>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <7f1c09f9-49e1-718b-329c-aae9d2f69266@linuxfoundation.org>
Date:   Mon, 13 Sep 2021 08:24:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210913084102.GF7203@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/13/21 2:41 AM, Dan Carpenter wrote:
> On Fri, Sep 10, 2021 at 04:37:00PM -0600, Shuah Khan wrote:
>> Fix the following build error with -Werror=return-type enabled. Fix
>> input_system_configure_channel_sensor() to return status when control
>> reaches the end.
>>
>> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.o
>> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function ‘input_system_configure_channel_sensor’:
>> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
>>   1649 | }
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> Hi Shuah,
> 
> You're the third person to send this patch recently but it was fixed on
> Aug 2 in staging-next in commit 05344a1d2ea7 ("media: atomisp: restore
> missing 'return' statement").  What tree are you working against?  It
> seems like it needs to be backported somewhere.
> 

I am working on Linux 5.15 - should have checked staging next though before
sending the patch :)

thanks,
-- Shuah

