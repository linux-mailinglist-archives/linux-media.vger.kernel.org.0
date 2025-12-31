Return-Path: <linux-media+bounces-49803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED552CEBF19
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 13:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E3F93029561
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 12:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90FE2FC890;
	Wed, 31 Dec 2025 12:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1FWZZ/H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNuM1ynn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E062E4258
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 12:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767183615; cv=none; b=qpxvcnZ3yNjqA7NqG0CJkpxhclSWP8qjg3bsE3ayHX2MnmYmWNRmZAgeFNBKgFDHuRrprLqwRqqkA18yPfaKpJB4qShLqy+dsiTZ4lnwDrnbOm7PpBdSkYgKESp7xyuun/oOjdFA6gUDGAXNlb+1c3ig4YjIbuNSoSe+kgkhFO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767183615; c=relaxed/simple;
	bh=0XBp4qHQvRoOdSB+cm7OBZxG9ycSiY1uafqRFOocwoU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=a/S4zajvjrjTgzVrZdxJCknH7cHzJ4KTUqHJk36GYoDU0JImHwIu3CnpwyfLu0GqINS9jc+sgInPc/v2VBnhAJwLvcced0w8tlmyAlG1kh9pTvcVG5ZhPnepKAxHW+TSv9AEZm94/I5pfm6n697DK87KQXD1XiRWQ82eU7HbuPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1FWZZ/H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNuM1ynn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV6QhnZ900395
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 12:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WIMpLBsHwYbfIb0xFpsqHJNZRP+D/jE3oHWK3Lj/kec=; b=K1FWZZ/HoQKUuuLX
	hPyE4G+8KIX0JGuMfgALHTQInE7i7jocsmJWG9Cqo9z/CKYLl3H1b4h/2TT1525j
	kwrxHGaycXuJel/vaW/ke/Kup3xCwnFDY5KuoRa1JMnnneeqbKtFInfz0z7nJsib
	u7L928YkrgSWnwiV2c6TMK9m0ZLU5WHALOn7NnYNYkZhMba2CmK7CtfJeI+IofkK
	+oNZGCq+BikfvIpdymBatMDn/l1Wi/8u/+e3p7XtmuoElhobaVv6LHY9HgPFGyMT
	mzo9FkKKIvAYUD45PjZZrbwQGAmy3HTMFG6+WWe3exkP3po1QftJY52FCTEE5P0q
	4slMHw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky3e0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 12:20:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a344b86f7so384547376d6.0
        for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 04:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767183611; x=1767788411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIMpLBsHwYbfIb0xFpsqHJNZRP+D/jE3oHWK3Lj/kec=;
        b=ZNuM1ynnWtulYv8zwngqCwApAlZCk6rDLugcEacUhfCBGpO/1uqUfa4I9JeQBzy42M
         /W8ic54WXu/9/6VdAt+5qjQiyUnvSrX2EIr9W71bJq+vTMLp0A2qZykhz0cvkFeQc8Yp
         t4tpzfCUB49Qqlt2GTNinKrDcZmEK8TA+zR823j066UGKf6ME+bK00LGS2+gvEkFxFuj
         P0hMxG2wdlHFS/aYx8Y2qh70faFwl2/SSXcrBQVQ2LRUP2WLK9aG1+aGJbTsy3BVZ0pZ
         f3uB7v1RP+4gv00d3dVhCVxadTaky5j8FB9a7gwQZuRp+We5uvUXheSKyDgqeQPxzFk1
         kYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183611; x=1767788411;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WIMpLBsHwYbfIb0xFpsqHJNZRP+D/jE3oHWK3Lj/kec=;
        b=jQdxcc4kbrlCh2IA2VHGT+Ko0R0gagDkGsn4zFeZf+gjGQev7o+T1V8ib3pqF7yWXT
         g0iFbjjLD9V4hUnHg4G1PZmB+qIQdbObzieh7prXCc8dXEK27RytoPWdzXooMxDxpNjR
         /dhQFcVzVW4CCxd+4sKtQyuisLdH3xsybJaY+l6OCEkAmQh59hxhmtfw+ptgcSEm4AiL
         zw8iczJnZYgH8HFDjY+mufBYuj67RsLfl8lUxtZ3XNWQXujHje4t705CF/IXYuZVqDnh
         cG84iGJiac1LMtDGdqrEnWl7fOLKJWfALBoy6MAIVXNyJiYSpfVQh6LH+oRaxgVvISCi
         7DUg==
X-Gm-Message-State: AOJu0YyNWVxTwS6J0wsrU+LpaOOeOE4RWG2RtQvE7C/aKgAS+n5FnvVS
	RJK8m1pZLdTtps/Ic2saugvhBSgd1qCKlAlOoWywCjye62uqnXWreO9F3iTjdBp9gESyUvx0y4A
	Q1xMJMY98qwYLlXRnkv6Wm6nQ3WqFeY/kWRlM1R2oAnGbErXt3SJXuWLzoHPEp/7xHLcqr9+X8g
	==
X-Gm-Gg: AY/fxX7SdfveUFP3AM0dRJmjOZogmBt7hPiObGdnbD9BKKst52TzScxVL05acEGM+bk
	qA3m14N5jsf9hU/JBsEzoqdYZgttlkwoKRiGDsb7VaS6+e3AIX9XnzjhSrVqhaFeivx9amG6/ng
	7a2TX3aV+0cXFw+QXEWGREkrRVqlDYlRxA+P0glI17Debyu/3dBXyuTS7ACsLeTGDilH6HGvPNZ
	39BErh/Z8Sb4LaE/8Ilsd45vzINNJl/hLIxe5frTQhDtW2LLo2d/Kh9rEKH0SwQ35xJASQZ2COG
	38XU6Oc92La7eLTnSstuqNIIvoxtJlp7EVU9+pP3UZ5v73ZVxmMIJhot91P0KoKm0K7NQs3ZBxT
	crr1xH03q7ybuf4nFpv3MUPDOBdZ/vVmL/U9x5xnDZqVkZkGUppWrLFaAKy4qMwbfLaHsKRfEeg
	797k8S/od+Op0Rwk2vIvD80ZPX0GX4FPZZ8rQ+j6+9a3nvkZB5LzAkuOG+AMON5vTYPo9ol1yhz
	nFo
X-Received: by 2002:a05:622a:418d:b0:4ee:275c:28d7 with SMTP id d75a77b69052e-4f4abdd6345mr509370821cf.75.1767183610793;
        Wed, 31 Dec 2025 04:20:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbDrKCbJ4KTkTC0sIYvIO+1Tdys8A8/aAeALD1Ym6IrnmHVKU26oTetqOjE6kE5soE+/cxqA==
X-Received: by 2002:a05:622a:418d:b0:4ee:275c:28d7 with SMTP id d75a77b69052e-4f4abdd6345mr509370521cf.75.1767183610355;
        Wed, 31 Dec 2025 04:20:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b83926533b7sm571737666b.20.2025.12.31.04.20.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:20:09 -0800 (PST)
Message-ID: <df474294-54cf-4807-96a4-0740bda0e08c@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:20:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [v5,00/14] media: mt9m114: Changes to make it work with atomisp
 devices
To: linux-media@vger.kernel.org
References: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
 <69542bba.050a0220.395720.fae7@mx.google.com>
Content-Language: en-US, nl
In-Reply-To: <69542bba.050a0220.395720.fae7@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwOCBTYWx0ZWRfX7dU3zjn5SN+d
 cxIP8EBfOicxqHxDS7wNRMxox/PJrNonl5lzS+sBREDlh3fPNlSjjTvBPI5rslzjwIPk5vnxyXC
 tCZGUP8SdRON6AhcniCVbEKA7fq8Oi7ABuwn0K38eCZKaD0xYwjNuDrFbpfanVY3/Jjeyxyas9u
 nU0zoHc+lemvLglr9x3TNtcoW3u7l7E00thwKCUdNuKiDFM1150OdbND69UQ+4QIrWHXe3BBmeo
 1RPvBKWsDb2VeAN4abohDETp6GdkIVasTS+G9JmUVDbhwmgBbreT99RHq11NeBiooLYP4hGHXCS
 /PPSt/PnIf634lOOERPCZzsR2In9Kdr09uddSlFYGMimZMnBqBQEceUqwVvXNqgnghSCr9yiO9L
 QD66xzyOn8NEq7cMhrkh9M9m6C+4Q4tzAPt3kANbxTZqaRUc5FTXZy8jzycl0V9FQOYIlSwGEfN
 IVnTbH+Xm9UzWmBj7cA==
X-Proofpoint-ORIG-GUID: ygBZAc7Qzpjn4jXacsZ4DeFxHOyKttTU
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=695514fc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=EL5vKT8FNufO0qat:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=3ckJxVoKBelMY1Jl2wUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: ygBZAc7Qzpjn4jXacsZ4DeFxHOyKttTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310108

Hi,

On 30-Dec-25 20:44, Patchwork Integration wrote:
> Dear Hans de Goede:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test checkpatch:./0009-media-mt9m114-Adjust-IFP-selections-and-source-forma.patch checkpatch
> CHECK: Unnecessary parentheses around 'format->code == MEDIA_BUS_FMT_SGRBG10_1X10'
> #90: FILE: drivers/media/i2c/mt9m114.c:1907:
> +if ((format->code == MEDIA_BUS_FMT_SGRBG10_1X10) !=
> +    (info->code == MEDIA_BUS_FMT_SGRBG10_1X10)) {
> 
> CHECK: Unnecessary parentheses around 'info->code == MEDIA_BUS_FMT_SGRBG10_1X10'
> #90: FILE: drivers/media/i2c/mt9m114.c:1907:
> +if ((format->code == MEDIA_BUS_FMT_SGRBG10_1X10) !=
> +    (info->code == MEDIA_BUS_FMT_SGRBG10_1X10)) {
> 
> total: 0 errors, 0 warnings, 2 checks, 65 lines checked

This is a rather worthless warning the fact that
== is higher precedence then != is rather obscure.

Also I do not get these warnings when running checkpatch locally
is it really a good idea to have the CI use stricter checkpatch
settings then the default ?

I would assume that the defaults are a careful balance between
getting useful warnings while leaving out warnings which likely
lead to false positives like this one ...

Also it is unpleasant to get these complaints after

b4 prep --check

says everything is ok. If we really believe that more
strict checkpatch settings should be use then IMHO we
should make this the default in "b4 prep --check" (1)
otherwise we will get contributors who do everything
right and then still get a CI complaint like this which
is not a good experience IMHO.

Regards,

Hans

1) And when I say the default I mean the upstream default,
not enabling this through some local config changes




