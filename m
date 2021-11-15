Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6EA2450728
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 15:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbhKOOjX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 09:39:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236449AbhKOOiU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 09:38:20 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22296C061200;
        Mon, 15 Nov 2021 06:34:50 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id d11so35997278ljg.8;
        Mon, 15 Nov 2021 06:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZpPEZqJd2To6lUjg28UQdB87eU7/8VpSq5XWX7MIjkY=;
        b=BD3EH+/6iAoMU0as28T1uFfMyoto9HdkPjPVtXTSSOCtUL+d4iY+gPJsCICkkkMJZ3
         Fj6nU18j0yMLl2YB25uSEETy5BxlRZfRyQ6eV7+hNQOp/c4bgrPQzoIPzrN8OYywH76N
         o+Ai8larHnuIv1b9VPGnTqfBa/ODrJmdaxv3pXrRf6t8mqCS12sAQQiI04KYT00fTAqX
         EHWGksaiLDzQsPf6brKsQj8w08sh3fSUflP33LTYPvx8hvGb5lFaSokQP39cnQdbQY6x
         0zyL0yWt0ZpR6XQwGhcoCxfACD9Vj0Y93oOlf8JU7GtBFzvgDWQjsmvOpbAXnfE2jbTa
         wxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZpPEZqJd2To6lUjg28UQdB87eU7/8VpSq5XWX7MIjkY=;
        b=MxfGCr15HUFb2eu5BZkBmOTSnCOjai2zzNR9Cup1LVhJHl4NGxgMcUld7Rc++JmUZa
         MzUCWDcl4k+Kbe+IMaSLqOKr/vA/WAVd+T4TX3a7YK5F0RoIjZeMCvd1mQWMNZ/tn5dr
         6y0E05TWS2PwduiWzelf+UqUHmPh8FjW2ZCDSkhN9uI6ntIa4e7PRZ2ubATaq6YL+RK1
         S5H2R3B43v6uFlRtvvRZS2HQHAC6ilQ0mQwC43I3pj88wW5Po6TBALwH1e0vPYlSQqJz
         j7Ep8lmP0/l4FAHIkYOWB6gMShg0gfqALlhkbtAJLrzr+2BOqEN+NyoFP9TACQ1cXPA2
         jEpg==
X-Gm-Message-State: AOAM533pOIYSAqkTf5GfwjarIJxLqxMx1px7caPdLrzDz8JY0mg1uHKv
        ViGeVlOJxjyzLNVuctVi8HgyNdXrdvI=
X-Google-Smtp-Source: ABdhPJwEKuBXdYXq5DhlVGPueFviqpJQ5pSvxJjMJzOh/ZO6vd5sjZJeTbmqyxx5SlyE0ArDXI+1ew==
X-Received: by 2002:a05:651c:98e:: with SMTP id b14mr10702207ljq.180.1636986888356;
        Mon, 15 Nov 2021 06:34:48 -0800 (PST)
Received: from [192.168.2.145] (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.googlemail.com with ESMTPSA id r13sm453347ljn.99.2021.11.15.06.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 06:34:47 -0800 (PST)
Subject: Re: [PATCH v1 1/3] media: staging: tegra-vde: Support reference
 picture marking
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211114222353.22435-1-digetx@gmail.com>
 <20211114222353.22435-2-digetx@gmail.com>
 <42b24cd0-ac37-3cfe-1fb2-d6292015318a@gmail.com>
 <20211115124402.GE26989@kadam>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e4b9d596-d206-71d1-6ec5-1a41af579836@gmail.com>
Date:   Mon, 15 Nov 2021 17:34:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115124402.GE26989@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

15.11.2021 15:44, Dan Carpenter пишет:
> On Mon, Nov 15, 2021 at 01:34:18AM +0300, Dmitry Osipenko wrote:
>> 15.11.2021 01:23, Dmitry Osipenko пишет:
>>> +	vde->secure_bo = tegra_vde_alloc_bo(vde, DMA_FROM_DEVICE, 4096);
>>> +	if (!vde->secure_bo) {
>>> +		dev_err(dev, "Failed to allocate secure BO\n");
>>> +		goto err_pm_runtime;
>>> +	}
>>
>> My eye just caught that by accident err variable isn't assigned to
>> -ENOMEM here. I'll make v2 shortly.
> 
> Smatch has a check for this so we would have caught it.  :)

Whish smatch was built-in into kernel and I could simply run "make
smatch". On the other hand, I know that you're periodically checking
upstream with smatch and patching the found bugs, so maybe it's fine
as-is. Thank you for yours work on smatch, it's a very valuable tool.
