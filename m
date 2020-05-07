Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 858421C9C8D
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 22:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgEGUjz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 16:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726093AbgEGUjy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 16:39:54 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF758C05BD43
        for <linux-media@vger.kernel.org>; Thu,  7 May 2020 13:39:55 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id u16so8329770wmc.5
        for <linux-media@vger.kernel.org>; Thu, 07 May 2020 13:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DXskb/U1rfTLrQamxPnaslHrIBvE9Q8wGx7sKVUquCs=;
        b=nWjU8neek1jkTd5k46MxzmPKEdK4LUWxb02CTjbKs+/rbvNriAUC1jj2lL11+w2Yig
         wavUdNEH6nKd7Wc/eesp8xTT2jYFRNY28imtWPswr8UjcMEXyJgSk8V8lM13A713W8yu
         LZuZ3mgoXZhZ24+nCPVgq+4hrkimkyBUF/P8bdozbd4BTI3nhZz6+Hadr40dna21NJqE
         o5cFi99J3JTJvKld3101AY6tH6Gw+xBuW7NiHZojjMXuTenzIboycox3/yJg2PwKE3cl
         cztmTZElbSEJAsEZx6OMDvAy1vtRiN1GC+NzVsYQ0nUVjhSFAvysNDTuDIxxT1i1JA0x
         stkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DXskb/U1rfTLrQamxPnaslHrIBvE9Q8wGx7sKVUquCs=;
        b=FhMBtoPmQ6pUEGZ7r9WjaEaqGFhYNE+Ws7+FxoHXFGQJd4YgYATEwFX/7hlEaGJwyy
         00BfwtNOJwrefBGY8WURMbtbUElNgGwsxsUGW5aDFRNwhwIPErisPZnkNOvHRi9Q116X
         vbkc7I5fDI5xcQdSc8KHMZrw3l7wpeoLkYTsuFw5uX60BfnkkRNgqPY45NQ1xq5g5IbE
         NmF4bYMdz/NEllJZkX9gECFGVbaNfQdDMWj5Tj74K5RSYLcUYqynjoCBHSMuuaNQqCwO
         kbzRS/Iq933eD7ziK2mty7m/Q7IL+KCgWmy99KydDDBopBQdyGfL/VSGPNVr31A1Om9P
         OjeA==
X-Gm-Message-State: AGi0PuZdFoBFiLsvnXQq26FgQILs0FgHjE1vpCs2VqsjPX5rqhsRelzH
        pWU795+bjLluoOPUT5FqJzWx8w==
X-Google-Smtp-Source: APiQypIe8aYj0LpthnAy1cmC+N58Li+3DTCxZohNo6wbhStE61FVn/fczz7X4dwdYQOkO0vNsEddrw==
X-Received: by 2002:a7b:ca53:: with SMTP id m19mr3868667wml.182.1588883993935;
        Thu, 07 May 2020 13:39:53 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-166.ip.btc-net.bg. [212.5.158.166])
        by smtp.googlemail.com with ESMTPSA id d1sm9214133wrx.65.2020.05.07.13.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 13:39:53 -0700 (PDT)
Subject: Re: [PATCH] media: venus: Replace zero-length array with
 flexible-array
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200507190750.GA15755@embeddedor>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <a249b3b7-56dc-8bed-f079-2cf163b46712@linaro.org>
Date:   Thu, 7 May 2020 23:39:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507190750.GA15755@embeddedor>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gustavo,

Two patches from you are already queued in media_tree for v5.8.

0f61e171e4bbac4595175070c75707f1b12f4e37 media: venus: hfi_msgs.h:
Replace zero-length array with flexible-array member

380f3bbd9562dc93be2e3cadc329b15284fbedae media: venus: hfi_cmds.h:
Replace zero-length array with flexible-array member


On 5/7/20 10:07 PM, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> sizeof(flexible-array-member) triggers a warning because flexible array
> members have incomplete type[1]. There are some instances of code in
> which the sizeof operator is being incorrectly/erroneously applied to
> zero-length arrays and the result is zero. Such instances may be hiding
> some bugs. So, this work (flexible-array member conversions) will also
> help to get completely rid of those sorts of issues.
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_cmds.h |    2 +-
>  drivers/media/platform/qcom/venus/hfi_msgs.h |   10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index cae9d5d61c0c..83705e237f1c 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -107,7 +107,7 @@ struct hfi_session_abort_pkt {
>  struct hfi_session_set_property_pkt {
>  	struct hfi_session_hdr_pkt shdr;
>  	u32 num_properties;
> -	u32 data[0];
> +	u32 data[];
>  };
>  
>  struct hfi_session_set_buffers_pkt {
> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.h b/drivers/media/platform/qcom/venus/hfi_msgs.h
> index 7694b1d25d9d..526d9f5b487b 100644
> --- a/drivers/media/platform/qcom/venus/hfi_msgs.h
> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.h
> @@ -155,7 +155,7 @@ struct hfi_msg_session_empty_buffer_done_pkt {
>  	u32 input_tag;
>  	u32 packet_buffer;
>  	u32 extradata_buffer;
> -	u32 data[0];
> +	u32 data[];
>  };
>  
>  struct hfi_msg_session_fbd_compressed_pkt {
> @@ -175,7 +175,7 @@ struct hfi_msg_session_fbd_compressed_pkt {
>  	u32 picture_type;
>  	u32 packet_buffer;
>  	u32 extradata_buffer;
> -	u32 data[0];
> +	u32 data[];
>  };
>  
>  struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
> @@ -202,7 +202,7 @@ struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
>  	u32 picture_type;
>  	u32 packet_buffer;
>  	u32 extradata_buffer;
> -	u32 data[0];
> +	u32 data[];
>  };
>  
>  struct hfi_msg_session_fbd_uncompressed_plane1_pkt {
> @@ -211,7 +211,7 @@ struct hfi_msg_session_fbd_uncompressed_plane1_pkt {
>  	u32 filled_len;
>  	u32 offset;
>  	u32 packet_buffer2;
> -	u32 data[0];
> +	u32 data[];
>  };
>  
>  struct hfi_msg_session_fbd_uncompressed_plane2_pkt {
> @@ -220,7 +220,7 @@ struct hfi_msg_session_fbd_uncompressed_plane2_pkt {
>  	u32 filled_len;
>  	u32 offset;
>  	u32 packet_buffer3;
> -	u32 data[0];
> +	u32 data[];
>  };
>  
>  struct hfi_msg_session_parse_sequence_header_done_pkt {
> 

-- 
regards,
Stan
