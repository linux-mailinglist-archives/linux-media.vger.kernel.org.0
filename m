Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB5F51F9403
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 11:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729384AbgFOJzg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 05:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729317AbgFOJzd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 05:55:33 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DFBDC05BD43
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 02:55:32 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id k11so16722440ejr.9
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 02:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F2y9Crm4EpXrgojd+CYn/r/xzpbyjoctnZnKUBxxPGw=;
        b=bH52eZn08gxvWDKX63J+WIukX0j2P3n7HyPqonmets/vbXsOXhi81yedn4gWFeKKgc
         Nd97MdUX3wiXsdSQY3wQdUIPnAluBFWXhcBZ8BAQwlpAWUjchBVrXbGAlWp20KVUVUXY
         R/uBSQemQsvtwxH9SOV1pTp2yySw61Y07GninWtBfjDu5VIqdDzmfqe2jAhgIzT2Bz1B
         NRLp3I+nPXlIzSfhf1A1+gXtK0CLD4Q5Z4U/oY6RpQ2lyQkkt0yCU7eU1FiFl5kwZpMC
         zfXaocuA8lqIJ+rdIQpyAevnwQQC3rmI1YX9RyC/i/QgJ/IyrqlSl9gZkH4Fx+RfDPXN
         begA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F2y9Crm4EpXrgojd+CYn/r/xzpbyjoctnZnKUBxxPGw=;
        b=RKn1HmV+vYYSPib4gENkoAPbgOwjZykHhXAHXecSw8OI/W2g+43ODhXVK0oh4DABL3
         lvAFiXV75y28UVGFuxhFJsKdPQAjMp4fhWzkHWf1qafL6duGpgLRSEAnU+ouhie9BzRX
         BDoe9X0uk3oYNr1oXj5WBJ/X2b7CqyVnIvJyDs82HW5gJCriyMbScf7bQY7FEKa6WJKt
         Sd6XtN2/EBQCzAMByH0+3sOnPd6NebN1+A7PIBY67rEaiIAIeDO0+LG1yg2ZeXc/zoIR
         EUM/4WhosTknbAhW8XRCX6Ztr9xQhd1Pu5LZoN08zmXrr0HDsxCNIEmN4wNmB5wSm3MA
         N6mg==
X-Gm-Message-State: AOAM533lQYgje2B794rTrIYqmSrBiYTDpDJJtE8f7IlHhjHdCTxKUZSz
        2TX9GN2VvrHz4Ph0dVL/AEukhg==
X-Google-Smtp-Source: ABdhPJz6cNXf6sv5+78+bDzU/EfsCLMtxsclb4N1u2KcEBfpSY9J/kaEdBCn6renQCfjvKPO06pKAA==
X-Received: by 2002:a17:906:d78a:: with SMTP id pj10mr25691244ejb.50.1592214931572;
        Mon, 15 Jun 2020 02:55:31 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.googlemail.com with ESMTPSA id lx26sm8665063ejb.112.2020.06.15.02.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 02:55:30 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] venus: Make debug infrastructure more flexible
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20200613223919.7038-1-stanimir.varbanov@linaro.org>
 <20200613223919.7038-3-stanimir.varbanov@linaro.org>
 <20200614063710.GB2611869@kroah.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <c54a12a2-7f92-105c-a01c-8e85730f36bb@linaro.org>
Date:   Mon, 15 Jun 2020 12:55:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200614063710.GB2611869@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Greg,

On 6/14/20 9:37 AM, Greg KH wrote:
> On Sun, Jun 14, 2020 at 01:39:18AM +0300, Stanimir Varbanov wrote:
>>  	if (slot == -1) {
>> -		dev_dbg(inst->core->dev, "%s: no free slot\n", __func__);
>> +		VDBGH("no free slot for timestamp\n");
> 
> Again, no, you just lost a lot of valuable information by changing to a
> different format (like driver, specific device, etc.).  Please don't do
> this, it just makes the information less than before.

OK, one of the reasons to use pr_debug inside VDBGH macro is to avoid
having struct device *dev variable in every function with dev_dbg even
when the function doesn't use it.

Are you fine with s/pr_debug/dev_dbg in VDBGX macros?

-- 
regards,
Stan
