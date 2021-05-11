Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10AAD37AB82
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 18:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbhEKQLA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 12:11:00 -0400
Received: from gateway20.websitewelcome.com ([192.185.60.19]:33823 "EHLO
        gateway20.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230505AbhEKQK7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 12:10:59 -0400
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway20.websitewelcome.com (Postfix) with ESMTP id 9DFA240105AA4
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 10:33:59 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id gUaBlLhOfDedfgUaBlc5gD; Tue, 11 May 2021 10:46:03 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tmFUjvyLjHNNWd54VOt/C+CgPE1E8GgZos/1KIo2bTQ=; b=TCJoBI3DFaFtUFUneJOq+bMesr
        zXO+uNceXFPo3XtCljhPcs4qLxn91tcJL1SiB0fDThrrwpqO03RWnanv+IZy2CAiJp45SvGtI+JKe
        BTosuWla2fDJE6DXw+qB+8kPHfpD9J/1zFHlL7FEBqhM/Qp1wGHeMxZo0Zp62NNvacJTOcTrVI5iO
        KY3+ycYyTnvxXfuxV5HM2M9c07K3X5fsFlhS1JmHSxgw/WF1lL9HdQcJeL2k3V9InvAgc6JKT9ye0
        cjusBwIA7NVVuRFQ24MeswCbWwQXusJrporo23lV412s4e4r5DweZkyN2OBmny0X82c19iDE/2FOf
        d/QHvLWA==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:58998 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1lgUa5-000RYq-Tc; Tue, 11 May 2021 10:45:57 -0500
Subject: Re: [PATCH][next] media: venus: hfi_msgs.h: Replace one-element
 arrays with flexible-array members
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20210211001044.GA69612@embeddedor>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <bf31beab-dc36-23e9-757f-9729be59f7b2@embeddedor.com>
Date:   Tue, 11 May 2021 10:46:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210211001044.GA69612@embeddedor>
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
X-Exim-ID: 1lgUa5-000RYq-Tc
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:58998
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 21
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Friendly ping:

We are about to be able to globally enable -Warray-bounds and, these are one of
the last out-of-bounds warnings in linux-next.

Could someone take this, please?

Thanks
--
Gustavo

On 2/10/21 18:10, Gustavo A. R. Silva wrote:
> There is a regular need in the kernel to provide a way to declare having
> a dynamically sized set of trailing elements in a structure. Kernel code
> should always use “flexible array members”[1] for these cases. The older
> style of one-element or zero-length arrays should no longer be used[2].
> 
> Use flexible-array members in struct hfi_msg_sys_property_info_pkt and
> hfi_msg_session_property_info_pkt instead of one-element arrays.
> 
> Also, this helps with the ongoing efforts to enable -Warray-bounds by
> fixing the following warnings:
> 
>   CC [M]  drivers/media/platform/qcom/venus/hfi_msgs.o
> drivers/media/platform/qcom/venus/hfi_msgs.c: In function ‘hfi_sys_property_info’:
> drivers/media/platform/qcom/venus/hfi_msgs.c:246:35: warning: array subscript 1 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
>   246 |  if (req_bytes < 128 || !pkt->data[1] || pkt->num_properties > 1)
>       |                          ~~~~~~~~~^~~
> drivers/media/platform/qcom/venus/hfi_msgs.c: In function ‘hfi_session_prop_info’:
> drivers/media/platform/qcom/venus/hfi_msgs.c:342:62: warning: array subscript 1 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
>   342 |  if (!req_bytes || req_bytes % sizeof(*buf_req) || !pkt->data[1])
>       |                                                     ~~~~~~~~~^~~
> 
> [1] https://en.wikipedia.org/wiki/Flexible_array_member
> [2] https://www.kernel.org/doc/html/v5.9/process/deprecated.html#zero-length-and-one-element-arrays
> 
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/109
> Build-tested-by: <lkp@intel.com>
> Link: https://lore.kernel.org/lkml/6023dd80.MmTeFf8SzwX0iK7%2F%25lkp@intel.com/
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_msgs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.h b/drivers/media/platform/qcom/venus/hfi_msgs.h
> index 526d9f5b487b..e2d2ccfbdd24 100644
> --- a/drivers/media/platform/qcom/venus/hfi_msgs.h
> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.h
> @@ -113,7 +113,7 @@ struct hfi_msg_sys_ping_ack_pkt {
>  struct hfi_msg_sys_property_info_pkt {
>  	struct hfi_pkt_hdr hdr;
>  	u32 num_properties;
> -	u32 data[1];
> +	u32 data[];
>  };
>  
>  struct hfi_msg_session_load_resources_done_pkt {
> @@ -233,7 +233,7 @@ struct hfi_msg_session_parse_sequence_header_done_pkt {
>  struct hfi_msg_session_property_info_pkt {
>  	struct hfi_session_hdr_pkt shdr;
>  	u32 num_properties;
> -	u32 data[1];
> +	u32 data[];
>  };
>  
>  struct hfi_msg_session_release_resources_done_pkt {
> 
