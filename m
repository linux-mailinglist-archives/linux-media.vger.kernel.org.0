Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B48D37AB7F
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 18:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbhEKQJD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 12:09:03 -0400
Received: from gateway33.websitewelcome.com ([192.185.145.24]:15105 "EHLO
        gateway33.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230382AbhEKQJC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 12:09:02 -0400
X-Greylist: delayed 1436 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 May 2021 12:09:02 EDT
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway33.websitewelcome.com (Postfix) with ESMTP id 685A61C02E
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 10:43:59 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id gUYBloXQ5PkftgUYBlniaf; Tue, 11 May 2021 10:43:59 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=dkHmssWkYSnVX6EaXwJj4jSdOD0P55hQ4BkXIHn4CG8=; b=N8eN31bmt9ZiD1VFibgDMDvHZ5
        ynVgEp4RMnUrMJHFDEMLWpeToOganlH95/nuzt090KSLSgx2hIsF8lo5cbwH0xcg022y1G1/bylu+
        Ubv7dm+JAo+9ekKqb7LgLqjOWUmhNzQRWYvsLy8UNgot8Uw7C5rFbXxdM+ty8o8QZ40dp7GdEO6qH
        l2dZxruwmT9DDr0UtBG75DlBvXCuIs4V0EXOLqbSaXGlNkmdsbrrO3CkORrMTAqYk7PZ9m7uofOkR
        +AXwdQ1MinKFxFU0WBIns5m+KCuhrAiBaV2Zv8LNUg3qQZGJruSQKFgPCJ19T0xOWUf1FhZZMvcSD
        DzHFzLEQ==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:58992 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1lgUY7-000Ozb-UF; Tue, 11 May 2021 10:43:55 -0500
Subject: Re: [PATCH][next] media: venus: hfi_cmds.h: Replace one-element array
 with flexible-array member
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20210210225720.GA13710@embeddedor>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <6081fb66-7f43-cab4-b7ff-ce4b291b8865@embeddedor.com>
Date:   Tue, 11 May 2021 10:44:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210210225720.GA13710@embeddedor>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lgUY7-000Ozb-UF
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:58992
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Friendly ping:

We are about to be able to globally enable -Warray-bounds and, this is one of the
last out-of-bounds warnings in linux-next.

Could someone take this, please?

Thanks
--
Gustavo

On 2/10/21 16:57, Gustavo A. R. Silva wrote:
> There is a regular need in the kernel to provide a way to declare having
> a dynamically sized set of trailing elements in a structure. Kernel code
> should always use “flexible array members”[1] for these cases. The older
> style of one-element or zero-length arrays should no longer be used[2].
> 
> Use flexible-array member in struct hfi_sys_set_property_pkt instead of
> one-element array.
> 
> Also, this helps with the ongoing efforts to enable -Warray-bounds and
> fix the following warnings:
> 
> drivers/media/platform/qcom/venus/hfi_cmds.c: In function ‘pkt_sys_coverage_config’:
> drivers/media/platform/qcom/venus/hfi_cmds.c:57:11: warning: array subscript 1 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
>    57 |  pkt->data[1] = mode;
>       |  ~~~~~~~~~^~~
> 
> [1] https://en.wikipedia.org/wiki/Flexible_array_member
> [2] https://www.kernel.org/doc/html/v5.9/process/deprecated.html#zero-length-and-one-element-arrays
> 
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/109
> Build-tested-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/lkml/602416da.iZqae7Dbk7nyl6OY%25lkp@intel.com/
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index 83705e237f1c..327ed90a2788 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -68,7 +68,7 @@ struct hfi_sys_release_resource_pkt {
>  struct hfi_sys_set_property_pkt {
>  	struct hfi_pkt_hdr hdr;
>  	u32 num_properties;
> -	u32 data[1];
> +	u32 data[];
>  };
>  
>  struct hfi_sys_get_property_pkt {
> 
