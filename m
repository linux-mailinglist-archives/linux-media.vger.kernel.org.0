Return-Path: <linux-media+bounces-50450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EDED2D122AE
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:07:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5EE4B3020FC4
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72E0355806;
	Mon, 12 Jan 2026 11:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0ECFRkf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yd0eAeqw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFBB2D47E3
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216038; cv=none; b=FKuFUyhUX0iQdxiud4/K5rzqVknsMLDGAdAn4ssrC/JrCkj6eYR2V8FRgLq1z0iIbIj7Fr/6zEcg05rEOWlph/PKHktqXTA7wrkDArb6nktwm9YLF3Gi6wiO8SC+6L89oE6vUvrjar0JQePP+/NFg3xomt1LIR9xWseNRaJxwR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216038; c=relaxed/simple;
	bh=ttRq3EIRIZYlO0QVYLhCDFcObVhsZ+Odd3rWoH7N9HU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BS9WACvPPYxqcFfp/pZT2WGg6nz9cjspfwpxS0txR0Q8GPM+e3YfW1+Meymx+Fzv8xwot8yOmyM/dXBmwymzxuWEOFm7tH4WfsoNR3nr+HEV8lthisZiYyEQmAqpOsSE4unezu6DBF0BRZGOE5oXp4YdEcgXfofoFZ/rjWuDRUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0ECFRkf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yd0eAeqw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C846Tt165707
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=; b=A0ECFRkfnPl0dXD/
	5Ee5jZF6mLYqlKbtPDk/brg8Cfrf1nuCvdXom+4ieEfcwaL/XlTsA44i/rYUTKxH
	T3b8fzAjPG2wY9onrDFkz0uYHbByeMphgdQay1Aty7/Y5+5zB+qj8poPo5xRGkzZ
	/lNnpEuljiGIe9Zt7uc/063Ho6hsBMXjJmCMUcYDP3RKgUGcU/4zC2e1M4EDVXlP
	KaHOHNrQHDG7AaVdqve52k5sjHy4/xWkjef3HbveDEvqtQpBsLqZZb62fOmLgAAi
	14qVbUK1ZY3KQAmSG9jJ4hYCHqaR+Tcq9ZOJK+WXXb/U4AdTrepsc4x+2JWM1mO6
	RxFYEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kytqgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:07:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f3564e2321so11805951cf.3
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 03:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768216031; x=1768820831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=;
        b=Yd0eAeqwbLUz4PFRkcuJPsmkxw17mWeSxymAtqhGtEJJOo/tt/XsrQfAr9VTYjFiaR
         56W9pcVYlAB28p83nBDQnYQJiG03BNaI+LYFN31wyslEhJEvTIyFSG7bvvG+uNohYN0g
         8ioPEdtMf8XDzVVahbB3GQEmU8fXpDHcsFQrNdzHfZJDqPHkPQqMvTEfb0queTXFKX2K
         QNn5V5TQw7umjjm/+8TkrN1IfgH9MNAuFy742cO0+P+V7Ho6m0wRD/PDR4zRpRmSAOGU
         sCpQXEAOQCoeCRklaJz/BiU9kZPyinQSWcCfEMqCaMzSVCEhhtaJb/rCmWD6IsFw6nJY
         lpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216031; x=1768820831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=;
        b=CbuVuPcOIIJmxDyFxAarXClPNoxyBASlrE3EjwD+KY4GGgekdTFedQ9C+hPsdEkH6P
         ffII7yf+Hv3nc3SaFH7xti2w30KIS55dTrc7ETliVK7qdhtIOWozGBGKrPaI65qhJFPZ
         sK0sUgHaCWhlpl7YiH3KYvBqjiuLhLA5z8JNQFFTkly2HGSmToUrg0/jirRUAz7QNRr2
         TE9remJDlFRbpqerLYqlkmMvCn/moMuNyJz75jMf/rWeiHCJltqThPFqHn4umEYPVbWt
         iLQKT+vCLclBDIW5d6EvOaI3paTc7CiSFNtDql6htXMXg2mEcVtQQFPbLpiPnUwWrCy6
         J7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCV+2U3bn8LcYtsj/0dwNLmffhU//WYN6nkuagufxQvAAGbNCfUEifyKNu/lO8gGbUemMZzSB0o7ABc8Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzECRCl21mekAXADVm5FjN8EgH5CDfZdqD/fLajQVTp3WJ4YN7W
	yJeCUlTX9hJueI0an/RUlDPwd/r6E9AdIpt8qlfdxny4YEdKoYyvZQtb8NddXPfNmTpheueCWUI
	cT6aDDOMiV+lZpV2mGeoQsxZMfG7Y2apFoYAZUnAWx7T4IQgL59dSu6neFwKwciXwlw==
X-Gm-Gg: AY/fxX4PVTEveYdFLln5hCj6dFzAqIwnGI+/+l8Ez7URpM1ms4PG+xRdGx2rifnOPRr
	RV6uJZwhhr0T9l6zrdV5oC4dRDpnblrwVqt3i7YNm/4rmS6GAvISsMEI0nr+DR0WZBfvr85JMdP
	iFsw9qbKTuAIHHrS8K26RmzLKInFtsNAsw/pDI8W1MJcx8uPzMUA/gsFEN64hNALW8AGQCEjG0l
	meWNVwECevRXbDLrgP1oQKXklZB8dxPbH3bINdjSIv8zZcnqeeRwj/LZXElVfav049srpIwj5Mz
	dFQOFBWhHK/JmVGbRpnXf0R+ENfkHt7GN+XQxSI2enl/2AtTo2/nstu9Iwncjgw1wkbRYPueC4F
	gACRAjfI4u++QajH+IPEWWecEEAUd0PZlfA8OdiN5N62XAeSqsZkeP8mdIcFn0BagbBA=
X-Received: by 2002:a05:622a:1391:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4ffb490058amr190474321cf.5.1768216031404;
        Mon, 12 Jan 2026 03:07:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8bZ9DLH4NWCdH7EePQEzlpw6QhI9kvYUV+M/ik2/g+M1Hc8pMsJCTVVcitzVSpTEcge8P7A==
X-Received: by 2002:a05:622a:1391:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4ffb490058amr190473951cf.5.1768216030771;
        Mon, 12 Jan 2026 03:07:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm476444566b.16.2026.01.12.03.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:07:10 -0800 (PST)
Message-ID: <61ac4661-77ea-4696-bbc4-531f925d5fd3@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:07:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] drm/msm/a6xx: use new helper to set min_acc length
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-11-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-11-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0bEyH-9gOxf0CrbCEhjcAeBM0O7ZAZH0
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6964d5e0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=su5gWXN3lQTy_5l37lIA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 0bEyH-9gOxf0CrbCEhjcAeBM0O7ZAZH0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfX/ni10odq7zk/
 fe9Cv0aKSG9hdz/AmijRd0MXQOOWGjDpjMbUc0FaVTJ6W4Cxs5VKb27C/c4b23u5yBhPFtz/9a4
 l+ynZFdzCwDIMJJp1Yt+RkaxOdCgkM3zpjZvIoBEcDICkR3mLKIBqNrTaA4E4XF8iwVemuiVHMe
 UdS91Fc8DTEGFDC6RPyVcFEcJKMR9qPbUGh11iffNo9Lmdy95xbii7a8H4SvS+khWQwQ96BZp0B
 mDVSWr0WHaIhm+Lh6ZpCxOyTYIh6Q+ZHzNuthx91x4M4JDemh7DW8UfOeHdUQjTxzjLm0OSyCeF
 adXFpsc0Q302L8Z77pktmGlKZx0UB3NEihpbRFI3JM11CWENAWbdCITzE2Q3zM7KrryE4gWN1lF
 FJ0epi5u3DL8VpF2Xn7dnnVPHJ5W1IGP3oMTHjQYEe+rtrXDlQcK6YqSineBXAY9Qw4+QPwv5Qj
 2nKPFxIga05LtGYYqtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120088

On 1/10/26 8:38 PM, Dmitry Baryshkov wrote:
> Use freshly defined helper instead of hardcoding the checks in the
> driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


