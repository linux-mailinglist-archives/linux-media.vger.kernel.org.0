Return-Path: <linux-media+bounces-40619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E08B2FD1A
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 16:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9188EB003DD
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67122A1B2;
	Thu, 21 Aug 2025 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xPwungZ5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41CB1E0DE2
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 14:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755786992; cv=none; b=bki6gAxEeC8ZMigHkfEpz88R91S5QEc4sOLljG25l/cHTuO4t67kEPoS0P7+ONclVpuP0cnJ4+DqSqsz/n1JhOAeX3YX7xwzoTSfv3TCTcaedFwqhAiiQxUm+8WXe2iif8ymizNPAK2jLesGZOmkTVk3LxWFMiAug2s6ijhyjaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755786992; c=relaxed/simple;
	bh=UBlYzUJ4FmYyAooFdHdqeTiLBdFaC2VrjAGBHRLG4F0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ea5Zr+6JOLjj0ZPV1oGUwjmeIM2ZlQzhcV9+j7gXPuVKzJY4zVHviFn9Apf2cYkrhP2PXxTlFJ9dq3YWNlAfRuRuPtCsNInpb41KxRrYVo0t89Z4Aafb18uRHR9Q92hLfyOqKfzRJgiUXuziY2K/RKgiwCyqh5u3X75QoJqmpvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xPwungZ5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c51f0158d8so455234f8f.1
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 07:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755786988; x=1756391788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f4Onvppsk2UmToKKQQaTYJ0EBQL62taZl700qE9YITc=;
        b=xPwungZ5CsrwgX7KWsWfH1oleXion/Gy2CF/079BRnUBxTN1P1yX1eSW/spi6PV+e2
         N03sgtZ2qj7mta7EN5mCgeNRtbK44pa7r1f/B29RV0VCampYkBfXHX2FBl8FRcpLM1xV
         Yf/FckxScB9fOhBzbeqfqribc7gDf0Z1nLfaPKWTicgNMPbnddyNIFYUExBHOUgfF2k6
         NhFbrgWEDRSZTNzUJ9lOYtJlOhQvZ8B+anORRtOkxj/mTarV+z7v9sHkFhO0K7iIDWQT
         QRrgihcXcEmIl7KNGV/CV6cuww2FWAyHwMrqO2d5ywSPwn2f+nUHDdMlndo6uJsFDZv5
         tUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755786988; x=1756391788;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f4Onvppsk2UmToKKQQaTYJ0EBQL62taZl700qE9YITc=;
        b=K5Yg/YZVjL+Xe1uKnfMsxAIt1tQ5lY46k5xAaSqT9DK1ciu5LuCYrSYAW/VS80ha56
         7KlXr1d09JQDKwhsE+n7HSk6Re0j50ZiMpQ7gkK+IcEXikvhdw7DxKB+sZvTKij9UG3P
         12lacAWx0M9MTSvIzAHcdjyCsdbC1JIsyJg8X7UY8RI/+5ysEQlo3nmg8v46tX8skGvT
         iTXjPAcQhmpvDZDavyK5YtsykSP8HhNdNbZKE6L1enTWjCGS95PMU86eI3WkYTxNq6zN
         39/XoZki00PU6ypcH/aNy61MD+4Zl63TJRA5yDPDVPs+/T7JbgLqYBbK0krZKY7gAmW+
         kbQg==
X-Forwarded-Encrypted: i=1; AJvYcCVhR04VMQk2q5RrIZ8HbtcFawICVSzblH7j5QGmORYAx5iPRGyUQdDlnFTAXYI8myEhXeXlzisB1csePg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+co/63JBdzVhN4h41AwMW0muNimoigVraAmS43S6yP83rggWP
	AuYAaroL5x43SCaLkAwfLjWAykGEFd5X/bwxB4jG5WCEp1dLGjNFrIkLEsy40PmJ3b8=
X-Gm-Gg: ASbGncv8Gw0uHYpizMhx10GL0FpI531pBUTYskQlsVus3tLemRIlgaPgZvg/ENklRel
	KQ9W22nHp+n/3NifUWnjJ2ZIBRZu3jVLh8tnoavMn+ojBtooc+q/9CKNgadRqlv+Mq9qO9pxbKX
	wnN9WmDHKlJUS+x0aGVhJOQHKjewAkdlWgrpA+BIfqNU4hMyydrmrgk4ip6TJ7XkDAmTP4gESjJ
	dJFW1ydrdaa+yMuRzKqZsPD33AkFBkVrkkEyz7YmxA96keMKHPpwKaLx6eQ8w9Cxu1jjdxnAYup
	2a1rWo0eStxhLUrOrcViemWEay2cEd+lTwvtbfSuJuAd7G+LtKJiUCuhxrjrmZlRtIk41fFtt0I
	09Df5ZYGM7e5ZNElY6sVSd21MnjTzCe9PcjNc7A0GDHcFUDX812aEuJRWFFIHjvE=
X-Google-Smtp-Source: AGHT+IFrPdNVzXKGYHkklfqmyT52yOcqOHYvQHtEZu0vu47qp+5Bjqo/zqZyTjClQ4QBnpI30P7Ymw==
X-Received: by 2002:a05:6000:20c6:b0:3c4:edee:bcfc with SMTP id ffacd0b85a97d-3c4edeebe3dmr1420443f8f.56.1755786988177;
        Thu, 21 Aug 2025 07:36:28 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074879fe5sm11882578f8f.2.2025.08.21.07.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 07:36:27 -0700 (PDT)
Message-ID: <10d91d9d-b6d6-4a83-a697-909f97abc503@linaro.org>
Date: Thu, 21 Aug 2025 15:36:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] firmware: qcom_scm: Simplify
 qcom_scm_pas_init_image()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-5-mukesh.ojha@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250819165447.4149674-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2025 17:54, Mukesh Ojha wrote:
> Simplify qcom_scm_pas_init_image() by making the memory
> allocation, copy and free work in a separate function
> then the actual SMC call.

then is temporal
than is disjunctive

you mean than here, not then.

> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/firmware/qcom/qcom_scm.c | 59 ++++++++++++++++++--------------
>   1 file changed, 34 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 9a5b34f5bacb..7827699e277c 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -584,6 +584,38 @@ void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_
>   }
>   EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
>   
> +static int __qcom_scm_pas_init_image(u32 peripheral, dma_addr_t mdata_phys,
> +				     void *metadata, size_t size,
> +				     struct qcom_scm_res *res)
> +{
> +	int ret;
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_PIL,
> +		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
> +		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
> +		.args[0] = peripheral,
> +		.owner = ARM_SMCCC_OWNER_SIP,
> +	};

A minor detail but please reverse christmas tree your defintions and try 
to make int ret come last.

> +
> +	ret = qcom_scm_clk_enable();
> +	if (ret)
> +		return ret;
> +
> +	ret = qcom_scm_bw_enable();
> +	if (ret)
> +		goto disable_clk;
> +
> +	desc.args[1] = mdata_phys;
> +
> +	ret = qcom_scm_call(__scm->dev, &desc, res);
> +	qcom_scm_bw_disable();
> +
> +disable_clk:
> +	qcom_scm_clk_disable();
> +
> +	return ret;
> +}
> +
>   /**
>    * qcom_scm_pas_init_image() - Initialize peripheral authentication service
>    *			       state machine for a given peripheral, using the
> @@ -604,17 +636,10 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
>   int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>   			    struct qcom_scm_pas_metadata *ctx)
>   {
> +	struct qcom_scm_res res;
>   	dma_addr_t mdata_phys;
>   	void *mdata_buf;
>   	int ret;
> -	struct qcom_scm_desc desc = {
> -		.svc = QCOM_SCM_SVC_PIL,
> -		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
> -		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
> -		.args[0] = peripheral,
> -		.owner = ARM_SMCCC_OWNER_SIP,
> -	};
> -	struct qcom_scm_res res;
>   
>   	/*
>   	 * During the scm call memory protection will be enabled for the meta
> @@ -635,23 +660,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>   
>   	memcpy(mdata_buf, metadata, size);
>   
> -	ret = qcom_scm_clk_enable();
> -	if (ret)
> -		goto out;
> -
> -	ret = qcom_scm_bw_enable();
> -	if (ret)
> -		goto disable_clk;
> -
> -	desc.args[1] = mdata_phys;
> -
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> -	qcom_scm_bw_disable();
> -
> -disable_clk:
> -	qcom_scm_clk_disable();
> -
> -out:
> +	ret = __qcom_scm_pas_init_image(peripheral, mdata_phys, mdata_buf, size, &res);
>   	if (ret < 0 || !ctx) {
>   		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
>   	} else if (ctx) {

With those changes.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

