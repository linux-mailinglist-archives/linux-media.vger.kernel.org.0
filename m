Return-Path: <linux-media+bounces-59378-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDtBCV3p6Wm2nAIAu9opvQ
	(envelope-from <linux-media+bounces-59378-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 11:41:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F7A44FE29
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 11:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1CC73109CB7
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 09:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5562C3E51DF;
	Thu, 23 Apr 2026 09:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yYLk4Vd0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2253E51E1
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 09:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776936775; cv=none; b=TjViQIil894NhXE8IF2i4UuIVWxMdToxz76CShGD67mznCHB1DJMnz2UNjJKWzfKvCaDgU77FjBo2ZbO7YfGTj3e7nPqv6GsVpxorclSyns1I3kf0Xbu/bikZZKzdjmEu7R7sc04rO/Bm/L+aQamztbRJgvHGBhFHjyrhT6A0lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776936775; c=relaxed/simple;
	bh=SaeFcfd6Co0NuxG8YdGnpnaaZ7L9Qd2bRSmshLJPLds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ey9vFQ9xxi5MDc95VkilGUmacaHkAXgdu33rfo+8r3bVy11QS4Yq4oBKuY/zRu1a/CfIqvlItnbR5Uj7Z4q+jTUbwRuksIrnr7NwUQw8LKhcIy/FLnoRVIgPKLR8hoCcdasiLbeREceC372W9y3MQcy6mKrHWvhHazkFcgk1lO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yYLk4Vd0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cf7683a28so4355780f8f.2
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 02:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776936773; x=1777541573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7CgxVK2bfFuo3rfUGsXONlP7ZR5uQTEJerKL5UdOCjw=;
        b=yYLk4Vd0xHevfGTPGtOhq+JdHSa3kGtEtEgeSJuQTSAFEAOZ+koIgtRDpZgIcrO7oo
         tS8HbRGmNjxlv1Ahdt7ctgaQDim/lVKknN5WrArlVuTASJYuPIse1v0wfjhk5UsVSjo4
         VPmm7RhQSygFKcmJiNfzXEc52d/u3TNVxi6OKQnfNhL9flhAQA080Ixeou967esKK8Tx
         uoKL2FFg2a4wdvR2KFdR3MNPDNgzAwK2+rYR1Wi1aC2zMidCpjPXq4/CRFuPnWyKxUGt
         eChjWDLTTC4cONm9xgj3N2jls/B9+MM05KHKJoeoEAyls0pgkTYXkZ4IEKtWhKxw4SW6
         HGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776936773; x=1777541573;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7CgxVK2bfFuo3rfUGsXONlP7ZR5uQTEJerKL5UdOCjw=;
        b=SiN7bgmUOIARSEcKENTMINbP+YlE13xEmZtEqRu4P/J0U/IoGwLBoJ3Ox8oDAwS+TL
         zBaxRgL1ZSuN21vt+9luSWIo1rxaGRDUIVmIM3cRVfg/IusX/6qHg2VI8tDUNqYTG6Nz
         PnjqYOpvFah0JNhRkHTKSzq3ju55lI3b8uXm0Gdg1cV95DcNZzink1c451xaRLK+4YhW
         uxqVNZL38V3Ptmer02bVNr5s6L7mzS5vG2kjjluoxd4N8mg31gwuDZVU+/8Anj6vYYAq
         J03qQjhd4G1zeMP/cWj1hfxyx++TCJ3p5HzscoweVaBuzW+L16vb7bM1d87gm3O3zp1f
         /pNQ==
X-Gm-Message-State: AOJu0YxdNGcrBocQ/7/XI3tNP6HL4aLKDNpPf+D/csq+CHcbgbGAex6N
	NeCMchiy96E+ky3Gpzgviq0pvydDgFNq6QqR/sU3+YqkU/EnPpRVSrk+vCu81P+LFUU=
X-Gm-Gg: AeBDietFz0VJrQo1o2aLk8oQwRON58C5yJHODGHIrppFAp+Z7U8QJXPI5rJ0lXAqgQn
	u0+DD2vSVe70XNB65VPCz2rxZEdfrDu6EQYSKclRasPHkn5LrI74zuzUqtw9zgk8eMYc0dNzBSQ
	1eE+/C259B/jT93OVnwMqrA0PtO9qJ6LeFgFMgM2hE8hBokwG21j3d3ZqWUDvVz+XpGFAQdh69L
	s3K3PGoNVufdIiy9ZNYewpI1e2qfrIJG8jInkrFFWYq4rj9U/2PvQZ9S4LQ8tAQQC4Wnws2KTI6
	5JUbZwjiZOR0o55KG8Tdjz4Zlds0c7is6xbasM2wothI8EGCQ4VwsY7SJJmrPaRM5n1QnA4ifG5
	Imsf6MHurx/4g/OazFTmacUjYbIvzw8um+qXEKGQF70vqPCqSx4qwR7PNJ7czurp5LOMDgHO2xP
	8ABNKjNRGAn030JDlK5Ii7nniaDHy4m6Zq9iGsKvdByhvr
X-Received: by 2002:a05:6000:2212:b0:43c:f583:126a with SMTP id ffacd0b85a97d-43fe3dcaee5mr41076351f8f.14.1776936772566;
        Thu, 23 Apr 2026 02:32:52 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.41.87])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d6casm47227899f8f.32.2026.04.23.02.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:32:52 -0700 (PDT)
Message-ID: <789892a6-bf11-4b02-8f2f-7b413d62302c@linaro.org>
Date: Thu, 23 Apr 2026 10:32:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] media: qcom: iris: Add missing break in
 iris_hfi_gen2_session_set_codec()
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
 <6ETWD2EgGRSbe2pnjrqP-kk6Q9m45YyjLJedcwHlgaRAeizj0BNDCqbZYvGau-mIZ-mHR95mG8vuOjI1HNtvMw==@protonmail.internalid>
 <20260422-iris-code-improvement-v1-6-8e150482212d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260422-iris-code-improvement-v1-6-8e150482212d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59378-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:email,linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 97F7A44FE29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22/04/2026 12:16, Dikshita Agarwal wrote:
> Without the break the AV1 case falls through, risking unintended behaviour
> if new cases are added after it.
> 
> Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index dc7acde1913e65eb39734702cb164bb26b8ea6c2..494c8d9fe14b4d347fcc3bb3cfe494365de360d3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -696,6 +696,7 @@ static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
>   		break;
>   	case V4L2_PIX_FMT_AV1:
>   		codec = HFI_CODEC_DECODE_AV1;
> +		break;
>   	}
> 
>   	iris_hfi_gen2_packet_session_property(inst,
> 
> --
> 2.34.1
> 

I don't think this is really a bug.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

