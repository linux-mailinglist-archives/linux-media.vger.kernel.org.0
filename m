Return-Path: <linux-media+bounces-14884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 302D692DC79
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 01:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6EA0B21286
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 23:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A1D1534FB;
	Wed, 10 Jul 2024 23:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="uRUsS3Oc"
X-Original-To: linux-media@vger.kernel.org
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCEC14A0AD
	for <linux-media@vger.kernel.org>; Wed, 10 Jul 2024 23:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720653421; cv=none; b=tq362crGmVZdfhdR3KvumSIaHHoyj1pmJj39JyjxBx4OhoEvfvTdKN5CziQMG8muq3sa9GQnzptkUOU1/xmZ7AC5pGFOGIg0bFrGCGI5L/bCbX+2qVbKEbq9GIOIpp2+gaq6kQUAXjjh2Af059TDSXQpFn5sXGjwN0bX7PZxVLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720653421; c=relaxed/simple;
	bh=sC+v9/yANl9hLQYeBgjFHxA+lkxPKYW5RPrkbjfI/zE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aO+mLxtF9sJSeA18bWPXxHXBI8Nyz9g7GEaG6wrncTodEnUbAcxw/A7ycPfDU4QB1zvHiXLbPAFAyYmlAYvTyOUYEBWHfccxeoAXqgDDRjg2EYAa+ZzoUAYk0DJGj4iTEr7gitJJdrwiM91Anbme3H7IfjTVWTw66Us1H6RhwlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=uRUsS3Oc; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-5007a.ext.cloudfilter.net ([10.0.29.141])
	by cmsmtp with ESMTPS
	id RcXWs4D1fVpzpRgYPsRrCh; Wed, 10 Jul 2024 23:16:53 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id RgYOsll0VLUYtRgYOsvIxS; Wed, 10 Jul 2024 23:16:52 +0000
X-Authority-Analysis: v=2.4 cv=M8dLKTws c=1 sm=1 tr=0 ts=668f1664
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=frY+GlAHrI6frpeK1MvySw==:17
 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=mQTSY71ofxE6tXbfK60A:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AX4VtRHSQCF7dAnD2xsWmA+IklZiBVIQGTjA3CNugNA=; b=uRUsS3Oc2b9NPpqrHgj/SWUpdR
	ViqpY9movygUdVcpKD/LNIdGBlz+1xNNThF6GfeBaXyDYpI2ono3NYcSAa8qI7oVrPUIulbE8fI45
	kV2VpjraNnHZwV9/EeIC1Pz5Y5vWsdGcHGajcunj09RABZyYZ+OgY9FxNHmuF+f5wNjOHnchKjZS4
	JvuUuA/KiX84KwxhAzy5tZxe7Bne7cCDgyKRNvmgPDbZIb3P6AHePemKNjrvbn2gZgNmYNvn9lYlT
	tplq8f5JW+XgSlzC53qwXUP0Xf3dAnygPyl7iKdyvcAe/cnAgoGJPIQDKVS840kh4vw37kppo5V/S
	tmodMN3A==;
Received: from [201.172.173.139] (port=54868 helo=[192.168.15.4])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1sRgYN-004Cic-22;
	Wed, 10 Jul 2024 18:16:51 -0500
Message-ID: <4193c6b4-164e-4c65-bd8b-cf392b1a865f@embeddedor.com>
Date: Wed, 10 Jul 2024 17:16:49 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: venus: hfi_cmds: struct
 hfi_session_release_buffer_pkt: Replace 1-element array with flexible array
To: Kees Cook <kees@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240710230728.work.977-kees@kernel.org>
 <20240710230914.3156277-1-kees@kernel.org>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240710230914.3156277-1-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.173.139
X-Source-L: No
X-Exim-ID: 1sRgYN-004Cic-22
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.4]) [201.172.173.139]:54868
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNY45M6RJibk2aiIaE/1t78eVbLek5RAT7CMOJJpZpliB4p7uG5m6sEHkq8pu2b0K/tGlFAprnagEIQGQtb5Zbq41shyk5fhOFK/t2dB+nd1r8EEfSgF
 nAZhnBDRfRWi2SGoAAaa7uBEBOYZURFEBaiKp7FIFsDdTNY97FYoXpzd1ri3AkjlDfIRAaBmWxcveAWeNPvU6GjFuSPV2nIDWEs44mP3W3SxjMVRKswTOcj2



On 10/07/24 17:09, Kees Cook wrote:
> Replace the deprecated[1] use of a 1-element array in
> struct hfi_session_release_buffer_pkt with a modern flexible array.
> 
> No binary differences are present after this conversion.
> 
> Link: https://github.com/KSPP/linux/issues/79 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
> Cc: Vikash Garodia <quic_vgarodia@quicinc.com>
> Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index 20acd412ee7b..42825f07939d 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -227,7 +227,7 @@ struct hfi_session_release_buffer_pkt {
>   	u32 extradata_size;
>   	u32 response_req;
>   	u32 num_buffers;
> -	u32 buffer_info[1];
> +	u32 buffer_info[];
>   };
>   
>   struct hfi_session_release_resources_pkt {

