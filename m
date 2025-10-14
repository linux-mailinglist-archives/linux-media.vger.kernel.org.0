Return-Path: <linux-media+bounces-44373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 14493BD82CB
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7DF694F9D5F
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B3930F95B;
	Tue, 14 Oct 2025 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TZ9wiWkT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A52A1A5B9D
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430457; cv=none; b=T9qR9t+QhnEbFHYtgaqHBfIwGNIPDIVXRvdU8T5lSAGYxAbzPaQwHW3YyLeZj0zOvEFKT3VGDGELNn7CJafmy0j1TOf/v/NW38VxeNxk5Xg6BdYovfjCaJOMeSiIiLzitoFAwa0LPmlVk1zDcMcXjHfxwcNE32noLpgqe2WDC30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430457; c=relaxed/simple;
	bh=63drt+Y0L2AmHZ2njRNv8YyUNEFDYX/MIBoZ/DyBZgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gz6SZ8VsyZ8SsxLXbzfo33TPtbH87ZKV8vXnyzjpp7W7bFyzegKm304ST9VgamZoLUgtBWIgU6K/Xy5JNcXVSVhS1p7YeN/pULkantplrJQGpHybGngWdsNuffQ2RsfERJq0Z4COQMTg+1OefG2O3f9YOJcinkQw9/a6PUenRrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TZ9wiWkT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87HjW009007
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6wXrw/9FqovJoYHuRJUtoPyXQUuX2rF0lSfGJ0TL07E=; b=TZ9wiWkTxOeoXR7A
	7JCYYQtiFX8iQfvJW7tZ8KxpW2XVRqwi52e8ta+465Q+AZl4r5Y12d6oANGtkBsJ
	4a7EjjmCEhqFdH0fnsRoIZJNUMdUCsG88QGrLg71H2doLAocgwPt6Wr0Rv/zLHJY
	5wgUGzTdwXJZIrCVXA0jjn4He4hQW52TetqtybidipRttBdRWwZZnYDhwk8i+d0K
	wTywdcVmQw6eBS6fkpn79AA/VuHPk1L27R9yWdrI9HcsxMe9PxtSajOby6I36gqo
	9fifBVX2GvGOYJWhAROb2fk+lcNbG9vVA0KRdAqwDJbDV9Bg/UfUu9Mqtw5hPLru
	v3HEUw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5frrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:27:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3324538ceb0so14866942a91.1
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 01:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430454; x=1761035254;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6wXrw/9FqovJoYHuRJUtoPyXQUuX2rF0lSfGJ0TL07E=;
        b=JEz9IggCZsCkg6iApBL6X07yZJ11OJSTZWeVFRxaIDdEUQIVJ6APAa8uiW7se620w6
         fNkWXA9fWFgv2abzNt6MnOjbLQUZ3+ROeUBuIfBfswuxFu9seAiXzZ13qYqVixwdchFE
         A7bbhgSf4Gz4/SHvvuCOXVZSX5ovFdZvTlvwkxSwUzsl8NegHG+zTaKrVzZLsZMapF5j
         sRVlToMvFO3FH8plJNkFzF/ht92Z/056Bi4olWPxL8G4R9T/hQrypt/7dqL3ooMqY3Y4
         CKnOiLt/wMbEwMwt/m4/DV2LuxLFnEK07SvRsmZsDTfHRjOxQHi2js03phIX0948096U
         Y02w==
X-Gm-Message-State: AOJu0Yy/I73w09p6EtyUrTLY4XvyjKmhJl9WNPkezpj/l29kPOizEtGd
	Z/8e7uC4cUEgIxuP1f/bZLK9rDyuF7+vsGON8tiWRLVGHnZIk6E2pTXPvRyQs+qq0z00Ek755Qy
	xYPE59CKvlVXjmdn2oNPNJOM4uABuYQbDzY8LlobyM6bFm+cmNRdMCrrDsCmNeNrhvg==
X-Gm-Gg: ASbGnctB7kBkIgEFfvw+L9DXS7hkTrqc5P9Fn50ZeI4TtTdAmLNJh1GrAq7Lc8YaUW6
	fGjmUzHCc18NcbW221i7WWKKcTqjlmAuw51tumTzI9HWqZ99n8w19fh4Gpr9tABCxvLcDzxXDHu
	kLpw6ZhL52NHZNshZVHRVCCvIdfu5cXU9PPbEwzsDEirjGK2K+ESyZlVWiINOIp9UAMYQW6Dgv+
	ENBommsQET2ywu646voI6nYbGaREm65P0QURz9IcyMFtWh3sDfrFn1elL/iAbGNsmA/NNNekkvA
	IGsMc1BBnNWoNfM3L0LHMpI2RgO6cJSUcsO5Gee4ldaZsAI2SD9BCvmXmLqyVxEiVTRsxTcL
X-Received: by 2002:a17:90b:3881:b0:32b:94a2:b0d5 with SMTP id 98e67ed59e1d1-33b513a322emr32936926a91.37.1760430454061;
        Tue, 14 Oct 2025 01:27:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2qatucYyq+zixxTIuFLs9PC4U6NqhiAm3Cbok6ZrGfZvraa8sbxAwHtKleWsNsu2tad8Kyg==
X-Received: by 2002:a17:90b:3881:b0:32b:94a2:b0d5 with SMTP id 98e67ed59e1d1-33b513a322emr32936907a91.37.1760430453634;
        Tue, 14 Oct 2025 01:27:33 -0700 (PDT)
Received: from [10.206.101.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df916d0sm11863256a12.44.2025.10.14.01.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:27:33 -0700 (PDT)
Message-ID: <a4208d2a-e9ff-9b34-6477-54123ccce89d@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 13:57:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/8] media: iris: turn platform data into constants
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
 <20251013-iris-sc7280-v3-2-f3bceb77a250@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-2-f3bceb77a250@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0BNYRrF7ndVyGdxNjxyBU92V-4AvaenT
X-Proofpoint-ORIG-GUID: 0BNYRrF7ndVyGdxNjxyBU92V-4AvaenT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX8jQ0kQF62Psk
 qlDC+OhFzlHNgNcvrr79D++Xh4FinI/MaRc08v2X+J3DYlCLPpjqvd59rtFjTFTqotDuVeguOOH
 QFpBH6fjD4YRb9j1RDTc0F9/VVnjpsqtiL9tBAD/QXivkpL9WqUzzjoGlc/9gWc7wUftKzNtkEp
 OxQANHvybXvQwAKfrY4i63nXmCkYlOovX5UduDMP/PmjoJfSXAJQix6IylyHpieoDt28mcSd6Aq
 I+9vf3vlpqY+zAugDvBfltTXHvPT8j3UhvUcPviTNwzeG9JDgwScEGKlsoG1926BVkx4wHlWZFE
 14Vcdnqudn4jiBrAL1GeWKYEBINs6C5i4U9QdLiYdXdRxahlcJq+iV6nJ0C/kyKmN3mclyo8LtI
 rY/uUYBjd85ErG0qeVnyzFaU5jeL1Q==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ee0977 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5Kv_vQZlazJxXpBqwIAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020


On 10/13/2025 7:38 AM, Dmitry Baryshkov wrote:
> Make all struct iris_platform_data instances constant, they are not
> modified at runtime.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 10 +++++-----
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  8 ++++----
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c |  2 +-
>  3 files changed, 10 insertions(+), 10 deletions(-)


Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

