Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25A3B32CA28
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234453AbhCDBoV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 20:44:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:39466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234869AbhCDBoI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Mar 2021 20:44:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 573EB65072;
        Thu,  4 Mar 2021 01:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614822208;
        bh=t4UmCxBr0X2rFT5RYkjjWlB4rSuRDWHeLK2SBF9Cr+E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mxAYAMI/FEuWndjbzSX4Ev8GWdjc+XrkVbydbnW/Y1eR49qRYQdWine9eJhb3jHtZ
         b5Igry/3FTgo+JBAAxnfXoPEOQqGGlyKwNEZjhZCC26FUsinzRhp4e+S5Ln0tqdhJU
         BLdSZNDAdRabtNAvhMXHwvNSzkHPdE7DcubdDO4WCEi8Hqb7cznOEZQkeQh3Itxdif
         u15BXy9emmfJNZCpM1ub6nAVDEV/Oo1ShLd+rA0NgQWPvZWAj7zbBYXertRE4KTtAr
         /uZJUW90xqYPLbL9m7KdH6e/CbgqAFOswgX1yiH48XX/Q5byvBEPqw6uFA0C3sGHkB
         av0TWT3JhUBUQ==
Date:   Wed, 3 Mar 2021 19:43:25 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] media: venus: hfi_msgs.h: Replace one-element
 arrays with flexible-array members
Message-ID: <20210304014325.GB43221@embeddedor>
References: <20210211001044.GA69612@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210211001044.GA69612@embeddedor>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Friendly ping: who can take this, please?

Thanks
--
Gustavo

On Wed, Feb 10, 2021 at 06:10:44PM -0600, Gustavo A. R. Silva wrote:
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
> -- 
> 2.27.0
> 
