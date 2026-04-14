Return-Path: <linux-media+bounces-58737-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AYnIroZ3mmFnAkAu9opvQ
	(envelope-from <linux-media+bounces-58737-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 12:40:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 483E33F8DDB
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 12:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5F753059321
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 10:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09483DBD5C;
	Tue, 14 Apr 2026 10:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5s6uWQ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cz2Yw2xd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B853D8104
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 10:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162846; cv=none; b=rgVHFnEGEaXWYypsrvKocUnFIirfSkHxm/P7xMptvCZLmkH1Xz/ra32OIlEKsuN60yfLwcbADWcfhbuqe61XEF6WLDiG4yRt61tqUn4f5WxbaufkT/FVgCr+qwMredmVuKYTe7CnJnLLZPU6zIEzKSd7nhmS1TeHf2p0q2NHz9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162846; c=relaxed/simple;
	bh=6xVop/Vp6aPMRmYhd/BDDjugJx7MJYQ7ilDbOya3PP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=duP8E7Pw5wus0gLWmGCyCmyNADH30LEIuPJ02IW4IBqwLFoe4UycPDpqXqkOda7dQo8WkzlbIVc2F1A+CzVTwCjt93GgzGYbAaj9Myy6ORB4KenVQlXomtF3+oeC2xO+HVzPu4S+oAx64ugGQb8vqDAUyc57/tBoTqcAaE0fYO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5s6uWQ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cz2Yw2xd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6SGuL2386515
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 10:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dw877TpVaxRflXLBD58PE5cB0SmsbMU2KUvevDBMkuU=; b=O5s6uWQ7H9Rt3a1O
	QOdLyVN2ZIocXVY9FUdfMmx5g961XMXl1pBHe1dPIC9+mM1KhgPctWyTg4z2xwx4
	q55Gy7EDbMxUqD/u1uIZU8sK5bMRcAgzCrd02Z4YnFTqQeZtHis+BFkHoHRxGTAp
	Zuxw7nGW17W7d+ILneU3Gfcn6uSxMbiEVIw5EwqR3mmj5/yaGdV4qXSSuu4FhXNT
	XrrcxlECKmfLtgBtZz7Rd7QtKzLlfeMPtobhAWiWD8FyhzBs/s+snq+irKjuPP0c
	YB3xyxbXXVtGy59vsElhtjgjGpHQiIS/ijL4+Xr7W9eJL5Qb3kxSjAHTtAgIWFtH
	xZdtYw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w2a71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 10:33:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50dec198720so8131861cf.2
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776162836; x=1776767636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dw877TpVaxRflXLBD58PE5cB0SmsbMU2KUvevDBMkuU=;
        b=cz2Yw2xdo5vN/WCav8zwcFyvRVX7h9fMcelD6+S5Y4OG33/wBCwJL/F275/4abhmlT
         4RXYM75usKqpr/JBQpyM/y7R+iIhk4N7XIwKEb451HEV6Neay/d6rVkNzztwyRSHXd28
         IP/I9yY24/orqadhYFfIODcInb3VFG7uEwYQaER3Fa8cA+klxk/g/Ffvz1jETEt3cWCF
         EhEW/w2zfOL78K27NxV4p21GIEzyDbVPQm6pvpTxZhMMIuMkZUYCDSAn88I30Zn5oQFt
         xSaOdYdRVu3ByLi5+wpRLTEczb9a2MvB7TBPLrH64aR3qN/KwlhOwD5Fe4iLTsLYqyR5
         Lqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162836; x=1776767636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dw877TpVaxRflXLBD58PE5cB0SmsbMU2KUvevDBMkuU=;
        b=ModHlJCtNNKfNG6YChUpTnse3t0kof33OqmY04Lt1EzJydylUSBTf2LeuQegBilHbM
         AVYq6uZTHdrL+jXIeOXTUpiFTRkhhuD5lXrL5NrghAOaYL9E0RrV/V4TNLV3SrArYN2a
         b37cM/+H2AHz28vRf1V0/E/rzERxsM9EmTkru9hfXrdSiBNIST9VrJmifOb0Gy71ckX3
         kG+SxVY8o8R/IyYdjKipk7NvossGPiZRyaEga8YZs1t2F8zRAjww2SlO5CyssCe5ND2B
         8ZxngBU8y88snzbqabzh65HAsKDyUH5DcGSOg6cMsub3XaMTbY4l/LxejcdA29sA6xBN
         NcLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xVMhyi2uq2T31y2APxJR8lStmSuMSQwcqTbKJuAYJ83TR9irhHpo/4LoRxW4lN/d+9jLX0xiNhGFyfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoN8Dpw5J8dtbE0Xg2tHPftQ2nnQ/XfVePF6z4NuxIMgkAkVvv
	0sh4tBmcHLXHwfHE4SRKa8M91z5j1YNyGOvGCjEr2vbfUmIHXHm1lULav95DTmCYU3emK6XSdiT
	2q5UnOFBMHjusME4UoaPfo7X95YWKNIoqIvwN3d3C2dewFVCKQRFmelgf+maO2qJXGQ==
X-Gm-Gg: AeBDieuY4Jau/Jpp6+HhasRY8DHvf7aHgWlfd81jk2g4a9uWYwejpS6p11pEtKYUu8n
	/f7ZMToZ2SkUYz8b6TV3iHSx3372cUmz+qJu9tGBxKFFqFekk0+i1FXpC90+z9QB/znvS+bgWeX
	Y9/KEldzjYZN90AI6GQpVXfVSYpORyfAWKC6fzMzMtmC3oWmpw6Nch3N74g1Z3DhjUthJhqtUNG
	jcGSd7p1XRgcY2xF7gj5NvJ17Cwwf9USkPZdhvMxb2/PGHZAf5AF62yTA78SaOYW6B8BVPHMCJC
	kOjatpDYS5aktB16Pfr1vJdVo1moAp5VHpmmInL0sCngXS9H1BExFC7z5WHAgVCjvcIG9iQCJJW
	SgVU0ZVeZk+IxJkNIYMWP8pfGIw0kDuWOU7ySpjmjTNQGuAJP+Xd+ONsAwXEZ/nb/RwjbjuoCsO
	yWRPMXoLfPZ8Abow==
X-Received: by 2002:a05:620a:178d:b0:8cf:db7b:6229 with SMTP id af79cd13be357-8ddcff969e8mr1534353085a.7.1776162836129;
        Tue, 14 Apr 2026 03:33:56 -0700 (PDT)
X-Received: by 2002:a05:620a:178d:b0:8cf:db7b:6229 with SMTP id af79cd13be357-8ddcff969e8mr1534351385a.7.1776162835709;
        Tue, 14 Apr 2026 03:33:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6718f52c111sm1018232a12.18.2026.04.14.03.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:33:54 -0700 (PDT)
Message-ID: <462eb5f0-e05e-4cc1-8d6a-6b06e105a517@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:33:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate
 sub-devices
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: awT5RI9QOYpQfInsrg-wWasj-odEEGD-
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69de1815 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=ZL2hiuJarSggSDoTJZYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5OCBTYWx0ZWRfX1xO4TzeEYyBf
 L+PL4dLHyikvvI5GAN7pwzLnd0Ukuw+ct2zdbg7tFKmZ9drv0Wl9iUsqdc0NOM/9a92VDTZOqR0
 OfUfey8YQH/tyFWUAx9G4zOquM6nwMVjmpMALP2YSAoUD7qMbWA3noXigT9/EijKmqmEZ6RZugW
 XAiuHvopvlxwoAonmE001hSbziCxLElTdopc4lTRY5DfLirHFL1ZsN5AYY0UKOjB5eiY7Z4ZsJl
 YJiHgnrFkk+n52VBf3xwiP12g7MebNFFomnGKhrKlj9YNcnlbNRaSHRiqE8SszQ9KXDZ8QkhuUj
 8Y1f/ES8WEFmkoncct61x4Hf0aaD31Hm8qTMXtjGYIzEtiCrhJJkPMaDbc+WMAkGeLRzpNoKDV2
 DSw1XqbVxLFoq58qSy6exFd4jd8eMmfzs2Aacje2fYfZoDHKNl1SN5f3UWY74v2GQWTVjx1ruVT
 SRDv1ijqPx2Z/+/gqNg==
X-Proofpoint-GUID: awT5RI9QOYpQfInsrg-wWasj-odEEGD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140098
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58737-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 483E33F8DDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 2:28 AM, Bryan O'Donoghue wrote:
> Use devm_of_platform_populate() to populate subs in the tree.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 00b87fd9afbd8..66ea057291f6d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
> @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev)
>  	if (!camss)
>  		return -ENOMEM;
>  
> +	devm_of_platform_populate(dev);

If you want the camss probe to fail if any of the PHYs' probe fails,
check the return value

Note that this doesn't necessarily have to be the case and I can see
arguments for both approaches

Konrad

