Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD0578F30A
	for <lists+linux-media@lfdr.de>; Thu, 31 Aug 2023 21:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241165AbjHaTFh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Aug 2023 15:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbjHaTFg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Aug 2023 15:05:36 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851B4E65
        for <linux-media@vger.kernel.org>; Thu, 31 Aug 2023 12:05:33 -0700 (PDT)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id EA45A66072A6;
        Thu, 31 Aug 2023 20:05:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1693508732;
        bh=Qh342r+wUIL5/ZvLem+1VQxIpFbRNyjDnPlwoIEJImo=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=Gk540ZTm09jlL5PHFMo9p+1kuMpjFBkBz7njihBhBFM4UEXdlaXmLJrblmp+C13Qf
         iYK3Tjc9n6ZArlJSPujbvkXngxds5PTD2g5O356JkBh8HwSdHTm5tlgD4rUpKkulKB
         9Dm9F7USOaRvrGI+2yAwotfTpirc5R3bqsLiV++9Uizn2Qln9O/5XBSauwswayatXd
         +tZDdAmlbHF2AJlfCXPEszNpHeVgfiF9jd5Zz5GWyR+8y3wUStxXlnSGiRhZ5Rschb
         JCbkaxhTaWEdtVHp6cwUKsSYVdzVWfIyUcurwWnu6V75xrJgZiRKzqUcGlpX0/ehgH
         ndL0VYgCTTH9w==
Message-ID: <52da36a4-b69a-931d-2937-164fa99e79c0@collabora.com>
Date:   Thu, 31 Aug 2023 21:05:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next v2 0/2] media: cx231xx: Add two macros and switch to
 use kmemdup() helper
To:     Jinjie Ruan <ruanjinjie@huawei.com>, mchehab@kernel.org,
        linux-media@vger.kernel.org
References: <20230822111832.822367-1-ruanjinjie@huawei.com>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20230822111832.822367-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jinjie,

W dniu 22.08.2023 o 13:18, Jinjie Ruan pisze:
> As Andrzej suggested, add BUF_SIZE and TIMEOUT_MS macros to replace
> the magic constant 4096 and 2000.
> 
> On the other hand, use kmemdup() helper instead of open-coding to
> simplify the code.
> 

Sorry about the delay.

I think I'd prefer the kmemdup() patch as the first one so that it does not
depend on the patch adding the macros. And then the one adding the macros
becomes optional.

Speaking about the latter, maybe BUF_SIZE and TIMEOUT_MS are a bit too vague?
No strong opinion, though. Also, BUF_SIZE is suspiciously identical to PAGE_SIZE 
on some/many architectures. Any thoughts about it?

Regards,

Andrzej

> Jinjie Ruan (2):
>    media: cx231xx: Add BUF_SIZE and TIMEOUT_MS macros
>    media: cx231xx: Switch to use kmemdup() helper
> 
>   drivers/media/usb/cx231xx/cx231xx-core.c | 7 +++----
>   drivers/media/usb/cx231xx/cx231xx.h      | 3 +++
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 

