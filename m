Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8A835689C
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 12:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350467AbhDGKAz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 06:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350460AbhDGKAl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 06:00:41 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B713FC061756;
        Wed,  7 Apr 2021 03:00:29 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id o20-20020a05600c4fd4b0290114265518afso849908wmq.4;
        Wed, 07 Apr 2021 03:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=waneLiTPyr93n33EgplSceqj/1lZ2OvepBeYFzO1CDY=;
        b=l9gXrPML27gIv5NpFap6oZbVP4Tv4ly4vNEAMCuZsyngDUV4qQvsQd90iJ8zznCYqV
         tbWny/27otQejhIzIbuxilv2zl1drdUW98+8msECUFcbybKNxlTJVDZ7MAh7CenAUj3Q
         wFqnBFL5nwSRXWlyrMScKPcUXabEFFrq/bHMJDrYgNTlj93evTTG8E2aPVppw3TIr9cl
         LNBKVNm6Jbp114DZCw0AayTSL34ugn1IVwGRhv7f74yT6+IrzBNOhFMi0dUfG6IAl+RC
         IH3C0asFWlUDKBjpcE/BezhKulBZBb7tEDv+FuaIwdroAHGip+ctCZrq6Qiw9twauy/8
         Z1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=waneLiTPyr93n33EgplSceqj/1lZ2OvepBeYFzO1CDY=;
        b=Mqfu9jfm9wdoRwAtCcAlP9rHnK2s6/6prB1pEMJa+0n3fgWgek3kX2FqVJSngezGMG
         XvlH8dZ3OrKILP3VdfBbYbzVYgFEIqeugKLGYA/Ks5tev0PFF1zccK1kwOLRwrPH7tnI
         b4w4zLyZoDvftLU3s3sv8YZP1jaKr3sq1Uo1NEZxrSwVxRDJuTeSsyx6d/laa51l1TD7
         F/XjfDdotRlbQkeAp8AStKX87MMRmargldF5e02Y897L+lWhieuettqa8JTOag4w9YUI
         U+AYv+NopXB7xRaLu4jGbwtfLgU2cw1Yy1KRb9X3r2p/nRamLb4Gvkn+Xix9h6K6LWKU
         gB8g==
X-Gm-Message-State: AOAM5302frWMdmz5g31M9FsmmB/jRlhElGUUGcI09kSxBoJh2+eetldO
        menlW+t+xXy5pgNg+FMGuuU=
X-Google-Smtp-Source: ABdhPJz3Do1VWrBS6vJD+XdmeCYawjFe0NvVElfquSm+wCALRzeCfI/kmhMqkHH+2oDVB3Kl+GKu5w==
X-Received: by 2002:a1c:bc8b:: with SMTP id m133mr2276492wmf.103.1617789628543;
        Wed, 07 Apr 2021 03:00:28 -0700 (PDT)
Received: from ?IPv6:2001:818:de85:7e00:ef5c:3f2a:a646:d6ec? ([2001:818:de85:7e00:ef5c:3f2a:a646:d6ec])
        by smtp.gmail.com with ESMTPSA id k131sm5635210wmf.39.2021.04.07.03.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 03:00:28 -0700 (PDT)
Subject: Re: [Outreachy kernel] [PATCH 1/2] staging: media: omap4iss: Ending
 line with argument
To:     Matthew Wilcox <willy@infradead.org>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com
References: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
 <441d27060ff6477d0ad418f41e194b96373c1f7f.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
 <20210401152844.GF351017@casper.infradead.org>
From:   Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Message-ID: <e175859f-4f68-0408-415f-a3e19f7e4874@gmail.com>
Date:   Wed, 7 Apr 2021 11:00:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210401152844.GF351017@casper.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Em 01/04/21 16:28, Matthew Wilcox escreveu:
> On Thu, Apr 01, 2021 at 04:07:38PM +0100, Beatriz Martins de Carvalho wrote:
>> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
>> index dae9073e7d3c..e8f724dbf810 100644
>> --- a/drivers/staging/media/omap4iss/iss.c
>> +++ b/drivers/staging/media/omap4iss/iss.c
>> @@ -559,9 +559,10 @@ static int iss_reset(struct iss_device *iss)
>>   	iss_reg_set(iss, OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG,
>>   		    ISS_HL_SYSCONFIG_SOFTRESET);
>>   
>> -	timeout = iss_poll_condition_timeout(
>> -		!(iss_reg_read(iss, OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG) &
>> -		ISS_HL_SYSCONFIG_SOFTRESET), 1000, 10, 100);
>> +	timeout = iss_poll_condition_timeout(!(iss_reg_read(iss,
>> +							    OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG)
>> +							    & ISS_HL_SYSCONFIG_SOFTRESET),
>> +							    1000, 10, 100);
> This is not a readability improvment.  I would factor it out into its
> own function.

Thanks for the review. How can I do this? I don't know how to do this.
Beatriz Martins de Carvalho
