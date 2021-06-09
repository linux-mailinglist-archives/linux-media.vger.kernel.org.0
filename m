Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E51E3A1E8B
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 23:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhFIVIX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 17:08:23 -0400
Received: from gateway31.websitewelcome.com ([192.185.144.28]:21481 "EHLO
        gateway31.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229557AbhFIVIX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Jun 2021 17:08:23 -0400
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
        by gateway31.websitewelcome.com (Postfix) with ESMTP id B278E1440F0
        for <linux-media@vger.kernel.org>; Wed,  9 Jun 2021 16:04:52 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id r5Nclm16EMGeEr5Nclar4v; Wed, 09 Jun 2021 16:04:52 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=aGBUJ9HOtviuGvbmgQnPzao3xVoE+BnMOpGtLCe0oYI=; b=qzDXrNzNII/znLV8UiB96rbABF
        z8S979CmOSrBzynuGrimRN/2Q1PBhrTumifH6kYbN4oyhkF301AZkJQdERIcUu+cWr4YnXwrkqBL7
        x9BhXfr3GX2RBDe180MqKSMY7ZzGOmYh5Ed93ZiSbke9qmR5/2BUDgwKMvr2XMYYeQpdLD6gxBPGH
        3qRzbNR7QkyPSjvBvmOvSN8pNZEQ1Sg8I1lbUJEpCUci85fawaqN0bWUbaQT6Fy4ScwbrRP+CZNDj
        WcX89T8Uhb8LJ8mYlu3xKC5jdfHw8xNrlI5xW70h1Egkq+5H9LibyNsjlbCE7KTxSTHhUHIfvOJjp
        6+YaqGwQ==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:49552 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1lr5NY-000UuU-VN; Wed, 09 Jun 2021 16:04:48 -0500
Subject: Re: [PATCH v3][venus-for-next-v5.14] media: venus: hfi_cmds: Fix
 packet size calculation
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Kees Cook <keescook@chromium.org>
References: <20210603001708.GA55239@embeddedor>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <9c717bb8-e01a-b6b1-0480-996da8135155@embeddedor.com>
Date:   Wed, 9 Jun 2021 16:06:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603001708.GA55239@embeddedor>
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
X-Exim-ID: 1lr5NY-000UuU-VN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:49552
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 16
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Friendly ping: who can take this, please?

Thanks
--
Gustavo

On 6/2/21 19:17, Gustavo A. R. Silva wrote:
> Now that a one-element array was replaced with a flexible-array member
> in struct hfi_sys_set_property_pkt, use the struct_size() helper to
> correctly calculate the packet size.
> 
> Fixes: 701e10b3fd9f ("media: venus: hfi_cmds.h: Replace one-element array with flexible-array member")
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
> Changes in v3:
>  - Fix size calculation in call to struct_size().
>    Link: https://lore.kernel.org/linux-hardening/202106021254.39A1561075@keescook/
>    Link: https://lore.kernel.org/linux-hardening/113fd896-464c-6aef-215a-a53ac6103a62@embeddedor.com/
> 
> Changes in v2:
>  - Include linux/overflow.h for struct_size().
> 
>  drivers/media/platform/qcom/venus/hfi_cmds.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
> index 4b9dea7f6940..f51024786991 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
>   * Copyright (C) 2017 Linaro Ltd.
>   */
> +#include <linux/overflow.h>
>  #include <linux/errno.h>
>  #include <linux/hash.h>
>  
> @@ -27,7 +28,7 @@ void pkt_sys_idle_indicator(struct hfi_sys_set_property_pkt *pkt, u32 enable)
>  {
>  	struct hfi_enable *hfi = (struct hfi_enable *)&pkt->data[1];
>  
> -	pkt->hdr.size = sizeof(*pkt) + sizeof(*hfi) + sizeof(u32);
> +	pkt->hdr.size = struct_size(pkt, data, 1) + sizeof(*hfi);
>  	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
>  	pkt->num_properties = 1;
>  	pkt->data[0] = HFI_PROPERTY_SYS_IDLE_INDICATOR;
> @@ -39,7 +40,7 @@ void pkt_sys_debug_config(struct hfi_sys_set_property_pkt *pkt, u32 mode,
>  {
>  	struct hfi_debug_config *hfi;
>  
> -	pkt->hdr.size = sizeof(*pkt) + sizeof(*hfi) + sizeof(u32);
> +	pkt->hdr.size = struct_size(pkt, data, 1) + sizeof(*hfi);
>  	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
>  	pkt->num_properties = 1;
>  	pkt->data[0] = HFI_PROPERTY_SYS_DEBUG_CONFIG;
> @@ -50,7 +51,7 @@ void pkt_sys_debug_config(struct hfi_sys_set_property_pkt *pkt, u32 mode,
>  
>  void pkt_sys_coverage_config(struct hfi_sys_set_property_pkt *pkt, u32 mode)
>  {
> -	pkt->hdr.size = sizeof(*pkt) + sizeof(u32);
> +	pkt->hdr.size = struct_size(pkt, data, 2);
>  	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
>  	pkt->num_properties = 1;
>  	pkt->data[0] = HFI_PROPERTY_SYS_CONFIG_COVERAGE;
> @@ -116,7 +117,7 @@ void pkt_sys_power_control(struct hfi_sys_set_property_pkt *pkt, u32 enable)
>  {
>  	struct hfi_enable *hfi = (struct hfi_enable *)&pkt->data[1];
>  
> -	pkt->hdr.size = sizeof(*pkt) + sizeof(*hfi) + sizeof(u32);
> +	pkt->hdr.size = struct_size(pkt, data, 1) + sizeof(*hfi);
>  	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
>  	pkt->num_properties = 1;
>  	pkt->data[0] = HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL;
> 
