Return-Path: <linux-media+bounces-45995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFB0C1F479
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 10:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88B7B403F0B
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 09:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F73333FE13;
	Thu, 30 Oct 2025 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXvFdDly";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PiAhaXjP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5E52F12A0
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 09:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761816410; cv=none; b=op3+ETu1vdYt3SRGZu+p10jIADzimMrP7zwPulmhJDAW0vyXWDeGao+qaD9/IhU66l+SrcJQp5NeS+9eWhGBgdtg7YAnmoPWeONrVm+xgoUU0xv6HwBMGjuQQf3FHZ68LSDDFZUGVT+Q+sm+Hl9qExnVkMaRcl4kDDQ3gJoN2pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761816410; c=relaxed/simple;
	bh=UGkzncBmFT0Z8Xgx3vo5n6ftCbyEbJOpxTeyYrpQGd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7qrKlkiQoNTW0drTEG3qrvSI7eGg4UB50fcV0TjucBlUqB8ofI72tIP27Cyxl7iR1s9HiYKI+clO3D44S6lgN2uB2ZfHhCLjR7T5+pROLnv2Hu0RkfurpTo0JA0RD0sQ8Ya//WZ32TfOraUbK9fRdsZGkxcHNSrxhdhJtJV5kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXvFdDly; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PiAhaXjP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9CTd9811082
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 09:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MkhXCfGdSQcDvTlbYDPsW7XCU2SBVMl9E+b0/qNR+YA=; b=WXvFdDlyVDlLgs24
	hRq6p+6qK8CV9lic9QlCuUfaa0N8G3YCqYN7vRhVoRwikaXnrxpBvPouyJN9TthI
	Rvvxg6gHR2/83eMMhgIKHaF/2gzjTsd0/pwzyo1HiT7DJWdmxw4zXGOxJzj75wPv
	MxIqgQRwirpvHbcGxz6Uh5x1NIHXK1NA5mM+EXNEXSpNYv+ArFuWKkIbnB6TyN+z
	J+Mh2nk3LYfSRxD1D/R5R5tkklf9An488gzGNuxoue23wlQwz+TJGmjzPZzFtIfl
	Ecw7mI8ytS+6TnUauCSxQKMRKMdlm9JUK7i5oHYuEdiLkBsiOgfN0108MZ76Nj9P
	ZeiYXQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3mvgb0bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 09:26:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87bd2dececeso3249076d6.1
        for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 02:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761816406; x=1762421206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MkhXCfGdSQcDvTlbYDPsW7XCU2SBVMl9E+b0/qNR+YA=;
        b=PiAhaXjPWbcM5m3DHUxh22vE63xOb9Je4/o+jQaTPkL1zeZ+LZVjnXGc0SSvjW7DYl
         xEL1oFqsFclsRFWNeBTyDvSA5MLA+zCkr9LLko9g1YbPfF8Y7j8n3KZ11/VwlfQSHDfc
         abaXySNacFkDoT/XZun2x97BI9L/EaSKr+jK2fF2qBuL5+v9hzrCURvvEpJyFc+jxhKG
         45Gqdpvzb25AGF6MXx5ftxjMjxTYyE4Haap+kH5ENJ1ej4d9phR634vcUEMBZ92NrTqM
         HmspI1p49ShYQJWMo+bA/R0H5Mwft5nhPNobUu3Ydn+xmynPXeNsf6ECxVc8RPnZWfJb
         s0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816406; x=1762421206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MkhXCfGdSQcDvTlbYDPsW7XCU2SBVMl9E+b0/qNR+YA=;
        b=LoQijFCQlUdOMHHolxd/C5j0ZEWaTgaE73Cwqoyz9F50dCtFB2bc34j3DO5dY4LrA9
         J9vk2I0VzgpWrGCZVxNvaOTbpxT5STKODV3971OiFHMYDzbuJs7h4fGzOA7hZiejrA0h
         AThairA/S1WuA1MvA8oC422evCJyYVpXQgH7xzcJtJLUq9pXSJiwCpfQyeDMDQTuYUOq
         FmMNU/uE+cTLMfnx3QAOE56U0Go9/r154l3OyyN8jIGKlq0P50zDTXpcKors3/YiR/v6
         SM/5gU1kW7eUZnWcV6qGT6rrtoBLhwo+yMidAAxvYolrsPKRdCTEu7v/eApoOrOSvzT/
         adcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkFQoBQuiIpoIjfI44dPeNgNPuie/R32wtsH4ZPwqHzAvmvBJsLwVoggDzp+FFdHKCp0gKARTkr2rpKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi9g0fQRmULjS+BCAmcXuyWStRgs1RPpEyUXFJFUXOqcac4ue8
	CefjGxht1sruaBmohd4gQe5HZ84XMWhuGSOx6Byypb8yUSDTLJyK/caOjRBM+wr+jg0/msfOqU5
	2D2xryeFJnTC6QbGjPkKTKrPZg5/8Gj+xiDNBjTxGVNC+Vh1evOe64uzxrIh0TJHDZg==
X-Gm-Gg: ASbGncuoux9kpBOUXqYuvaE7vM5jSm7zLE3VG8TBiWybQcq+6p8ngWa8LoZeDbBWlq7
	b3QFWQ7loKqCP5yYLBbfWjHsH2QqwBDvjFELld1WsYXkLyZH2IYYseNAlFHzgVu1rC8YEuXbz7x
	J/soyj/9xeQmtuyruSqvWiV+6BJghBuW9u1gzZOQLqs6cpmacg3Hv8idGYMnqdA9OUv6YgZsQe9
	QCNot8NL7+8GoS1naTQq93rB3zTiDbMnMNWti3VnYMiMEe2GHhpRjxkvFiZIKOq8cACJ3vuAGiV
	8ULE9i06I3PZXf5EmMDxRgwQSk/18U5eCgbbPTb9LUMUkbQ1m6PblF5yGXfdj6lnL5aj3y+dP8K
	smWOHjBlOVxmZppQHSf8reYZDyM6sHFWwt41kq/Af9qEMf+4qXecqL6fG
X-Received: by 2002:a05:6214:487:b0:84f:81b4:4440 with SMTP id 6a1803df08f44-88009c059damr57947736d6.7.1761816406238;
        Thu, 30 Oct 2025 02:26:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENOdltg392rpt/C6P2DXClkaCW6AuvtVnIkahf+FfBy++WBa3yu6xR0D9iLMYKtJjowkMGMg==
X-Received: by 2002:a05:6214:487:b0:84f:81b4:4440 with SMTP id 6a1803df08f44-88009c059damr57947516d6.7.1761816405687;
        Thu, 30 Oct 2025 02:26:45 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853f9a0fsm1679780866b.50.2025.10.30.02.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 02:26:45 -0700 (PDT)
Message-ID: <49f067c0-20d3-4039-95e6-fc19ce48881d@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 10:26:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: make sure I2C hub controllers can't use
 SE DMA
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Wolfram Sang <wsa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251029-topic-sm8x50-geni-i2c-hub-no-dma-v1-1-5e264258a5bd@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251029-topic-sm8x50-geni-i2c-hub-no-dma-v1-1-5e264258a5bd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA3NyBTYWx0ZWRfX8/FZ1gJUeFut
 yIyGjkZ3fL+xWWk5t0aUkikYWGwIR8aIA6tV8/BvQa2DOwFWxe3anxjx2DncN54n06yI+PJZHk6
 0hJ6qIxwxD5Q0jUPCzQP2laDmwaG8czmR9CJy5IZJ1mcYAWPoZD0cthcQjE/87aKZilK5D4qHqk
 NfC4Ukowy7Z54KUQW/YgD7zSMm20Mm1N0iVLGTQc01MUey06VaEUJo19Q/uKfsHKSxC4pY9GMDa
 WmWzUPuJVHN3iAfRAy0Oru/dx13CzlNnVv4572SersEoDySO8HnA0xS9wpP4MbWhppB9D0hnv6i
 A0QcuVlJ7DtzpjsXSUboYZdBnn6gzasnVqKtzJMDWbVZblqXew0xQPqTLYca8cIjYxQPwp7wPcK
 +9ypjEWTknW6QJOnRuLwbVVBh+bygA==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=69032f57 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=7QP1INNbtZu8WugdpZMA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: AEcyBGwe2qPsHlpI-S5qqoXBxvHW-JHa
X-Proofpoint-ORIG-GUID: AEcyBGwe2qPsHlpI-S5qqoXBxvHW-JHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300077

On 10/29/25 7:07 PM, Neil Armstrong wrote:
> The I2C Hub controller is a simpler GENI I2C variant that doesn't
> support DMA at all, add a no_dma flag to make sure it nevers selects
> the SE DMA mode with mappable 32bytes long transfers.
> 
> Fixes: cacd9643eca7 ("i2c: qcom-geni: add support for I2C Master Hub variant")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 43fdd89b8beb..bfb352b04902 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -97,6 +97,7 @@ struct geni_i2c_dev {
>  	dma_addr_t dma_addr;
>  	struct dma_chan *tx_c;
>  	struct dma_chan *rx_c;
> +	bool no_dma;
>  	bool gpi_mode;
>  	bool abort_done;
>  };
> @@ -425,7 +426,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	size_t len = msg->len;
>  	struct i2c_msg *cur;
>  
> -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> +	dma_buf = gi2c->no_dma ? NULL : i2c_get_dma_safe_msg_buf(msg, 32);

Not a huge fan of putting the ternary operator here, but I don't
mind that much either

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

