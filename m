Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDC3B3893FE
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 18:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355366AbhESQm5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 12:42:57 -0400
Received: from gateway31.websitewelcome.com ([192.185.144.91]:24854 "EHLO
        gateway31.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1355170AbhESQm4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 12:42:56 -0400
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway31.websitewelcome.com (Postfix) with ESMTP id C40B6F70BAD
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 11:14:36 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id jOqClnkSxAEP6jOqClOVND; Wed, 19 May 2021 11:14:36 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=bvCWAHbH8eGnG7CPvvzIAg7IGUzCsPOMwFSTobGjWiU=; b=Rx84nMv42tFkR3Co7w5iE2qvMj
        wAGTqUuD0Uy+NuAohCnoVYVdF/yZ3WcjfQch3T9Qt6/Fsa9YPOmDI1/3IqFNQ856Q3/FzAeb40K9a
        pcKpyWPJnY6Xmrp9qje9aoSmZ6bfYQOJqr2xdgoP9hNhNOYiKm7RO6EI4fTFWtzDqqANkaJRmo1QC
        5BAToZa/2UfWG3frC6xu4BQacGxrdyDcG6h+r+VkbEfno7NqzNfxurK0qLC7SDf57WmxEVFsLMLfT
        JnKtcshN1Hjnt1mKPoyF8I97NNh6k69k/DRyYxY7WSZr9APy11ObGsOvPJmbHcDt4iSQ/nb4sAt+R
        mwPiIxZQ==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:60144 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1ljOq9-000Ug6-83; Wed, 19 May 2021 11:14:33 -0500
Subject: Re: [PATCH][next] media: venus: hfi_msgs.h: Replace one-element
 arrays with flexible-array members
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20210211001044.GA69612@embeddedor>
 <bf31beab-dc36-23e9-757f-9729be59f7b2@embeddedor.com>
 <de8538ad-48d8-7a3c-af4f-ab31ee2da761@linaro.org>
 <f63824ee-fc8b-25cf-f3c2-c7b3947b8076@embeddedor.com>
 <64aa38bc-62b2-79d9-156f-74a09f11f871@linaro.org>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <d4c57054-5708-fcd3-dd9d-fb26c40f6355@embeddedor.com>
Date:   Wed, 19 May 2021 11:15:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <64aa38bc-62b2-79d9-156f-74a09f11f871@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1ljOq9-000Ug6-83
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:60144
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 6
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stanimir,

On 5/17/21 06:01, Stanimir Varbanov wrote:

>>> This one introduces regressions, so I cannot take it. It needs some more
>>> work.
>>
>> Please, share with me the errors or warnings you see with this. So, I can
>> have an idea of what is going on. Unfortunately, I don't have access to the
>> test suite or hardware to test this.
> 
> I guess it needs more debugging, but the simple answer is that the
> driver refuse to start streaming with this patch.

I see. Please, share with me the details about your test setup. Are you using
qemu or actual hardware for this?

Please, also help me by sending me your .config file and dmesg output, as well.
So, I can try to debug this.

Thanks!
--
Gustavo
