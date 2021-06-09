Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1CBE3A1E88
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 23:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhFIVHt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 17:07:49 -0400
Received: from gateway31.websitewelcome.com ([192.185.144.28]:18800 "EHLO
        gateway31.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229536AbhFIVHs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Jun 2021 17:07:48 -0400
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway31.websitewelcome.com (Postfix) with ESMTP id D9CF491F8A
        for <linux-media@vger.kernel.org>; Wed,  9 Jun 2021 16:03:58 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id r5Mkl6zMRELyOr5Mklxivr; Wed, 09 Jun 2021 16:03:58 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=F8/K6f7wiZ3lLg2x0WZnCPtmLrMXlLHqyiyVWEZMk1s=; b=olR1XlL9t+wKpGpLY3g+1tcPzg
        1n7AZQJy2G2dHbQ3K4wDQsLvChWYkG5R2GUCgVU2WlnJqkJNeJjpgDffGqoBW0LPGuV141bfHPFfy
        1LpG/Wzl8J4V1DxtoiGysZkbBUJLjkBBX7GC2sHv0i/IK2hkTdeQFBKiig5D3DBTAqdSCaXDCg6up
        PXXZvfhFrSUt8nFEOOyahokv7vQK+MHtKFxZ1LSN5UGT5Iwsypg5CETXaTo2tlYIYnyokch87qCe2
        fCCAnG2CDq3tUSfXthruHL/DSJI0STHi5gRYxdco1r9JZkp5omWfhB8oNgLt3YebZHSIPRw4c2Mgl
        cJmkagrw==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:49548 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1lr5Mh-000T6i-BR; Wed, 09 Jun 2021 16:03:55 -0500
Subject: Re: [PATCH v2][next] media: venus: hfi_msgs.h: Replace one-element
 arrays with flexible-array members
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Kees Cook <keescook@chromium.org>
References: <20210604004338.GA140710@embeddedor>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <45b64531-a251-bd71-8930-b41b7edb40de@embeddedor.com>
Date:   Wed, 9 Jun 2021 16:05:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604004338.GA140710@embeddedor>
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
X-Exim-ID: 1lr5Mh-000T6i-BR
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:49548
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 6
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

On 6/3/21 19:43, Gustavo A. R. Silva wrote:
> There is a regular need in the kernel to provide a way to declare having
> a dynamically sized set of trailing elements in a structure. Kernel code
> should always use “flexible array members”[1] for these cases. The older
> style of one-element or zero-length arrays should no longer be used[2].
> 
> Use flexible-array members in struct hfi_msg_sys_property_info_pkt and
> hfi_msg_session_property_info_pkt instead of one-element arrays, and
> refactor the code accordingly.
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
> Co-developed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
> Changes in v2:
>  - Fix packet size calculation by adding member _property_ to
>    both structutures hfi_msg_sys_property_info_pkt and
>    hfi_msg_session_property_info_pkt, and refactor the code
>    accordingly.
> 
> JFYI: We are about to be able to globally enable -Warray-bounds and,
> these are pretty much the last out-of-bounds warnings in linux-next. :)
> 
>  drivers/media/platform/qcom/venus/hfi_msgs.c | 16 ++++++++--------
>  drivers/media/platform/qcom/venus/hfi_msgs.h |  6 ++++--
>  2 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
> index a2d436d407b2..d9fde66f6fa8 100644
> --- a/drivers/media/platform/qcom/venus/hfi_msgs.c
> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
> @@ -251,11 +251,11 @@ sys_get_prop_image_version(struct device *dev,
>  
>  	req_bytes = pkt->hdr.size - sizeof(*pkt);
>  
> -	if (req_bytes < VER_STR_SZ || !pkt->data[1] || pkt->num_properties > 1)
> +	if (req_bytes < VER_STR_SZ || !pkt->data[0] || pkt->num_properties > 1)
>  		/* bad packet */
>  		return;
>  
> -	img_ver = (u8 *)&pkt->data[1];
> +	img_ver = pkt->data;
>  
>  	dev_dbg(dev, VDBGL "F/W version: %s\n", img_ver);
>  
> @@ -277,7 +277,7 @@ static void hfi_sys_property_info(struct venus_core *core,
>  		return;
>  	}
>  
> -	switch (pkt->data[0]) {
> +	switch (pkt->property) {
>  	case HFI_PROPERTY_SYS_IMAGE_VERSION:
>  		sys_get_prop_image_version(dev, pkt);
>  		break;
> @@ -338,7 +338,7 @@ session_get_prop_profile_level(struct hfi_msg_session_property_info_pkt *pkt,
>  		/* bad packet */
>  		return HFI_ERR_SESSION_INVALID_PARAMETER;
>  
> -	hfi = (struct hfi_profile_level *)&pkt->data[1];
> +	hfi = (struct hfi_profile_level *)&pkt->data[0];
>  	profile_level->profile = hfi->profile;
>  	profile_level->level = hfi->level;
>  
> @@ -355,11 +355,11 @@ session_get_prop_buf_req(struct hfi_msg_session_property_info_pkt *pkt,
>  
>  	req_bytes = pkt->shdr.hdr.size - sizeof(*pkt);
>  
> -	if (!req_bytes || req_bytes % sizeof(*buf_req) || !pkt->data[1])
> +	if (!req_bytes || req_bytes % sizeof(*buf_req) || !pkt->data[0])
>  		/* bad packet */
>  		return HFI_ERR_SESSION_INVALID_PARAMETER;
>  
> -	buf_req = (struct hfi_buffer_requirements *)&pkt->data[1];
> +	buf_req = (struct hfi_buffer_requirements *)&pkt->data[0];
>  	if (!buf_req)
>  		return HFI_ERR_SESSION_INVALID_PARAMETER;
>  
> @@ -391,7 +391,7 @@ static void hfi_session_prop_info(struct venus_core *core,
>  		goto done;
>  	}
>  
> -	switch (pkt->data[0]) {
> +	switch (pkt->property) {
>  	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
>  		memset(hprop->bufreq, 0, sizeof(hprop->bufreq));
>  		error = session_get_prop_buf_req(pkt, hprop->bufreq);
> @@ -404,7 +404,7 @@ static void hfi_session_prop_info(struct venus_core *core,
>  	case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
>  		break;
>  	default:
> -		dev_dbg(dev, VDBGM "unknown property id:%x\n", pkt->data[0]);
> +		dev_dbg(dev, VDBGM "unknown property id:%x\n", pkt->property);
>  		return;
>  	}
>  
> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.h b/drivers/media/platform/qcom/venus/hfi_msgs.h
> index 526d9f5b487b..510513697335 100644
> --- a/drivers/media/platform/qcom/venus/hfi_msgs.h
> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.h
> @@ -113,7 +113,8 @@ struct hfi_msg_sys_ping_ack_pkt {
>  struct hfi_msg_sys_property_info_pkt {
>  	struct hfi_pkt_hdr hdr;
>  	u32 num_properties;
> -	u32 data[1];
> +	u32 property;
> +	u8 data[];
>  };
>  
>  struct hfi_msg_session_load_resources_done_pkt {
> @@ -233,7 +234,8 @@ struct hfi_msg_session_parse_sequence_header_done_pkt {
>  struct hfi_msg_session_property_info_pkt {
>  	struct hfi_session_hdr_pkt shdr;
>  	u32 num_properties;
> -	u32 data[1];
> +	u32 property;
> +	u8 data[];
>  };
>  
>  struct hfi_msg_session_release_resources_done_pkt {
> 
