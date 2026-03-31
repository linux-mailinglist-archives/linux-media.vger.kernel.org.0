Return-Path: <linux-media+bounces-57740-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJHCEk2Dy2l4IgYAu9opvQ
	(envelope-from <linux-media+bounces-57740-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:18:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF926365FC2
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E97363077ED5
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651023D75C8;
	Tue, 31 Mar 2026 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4jkQKek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="izlp8XG3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D8C3D75AA
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944692; cv=none; b=LRURG3jbZhK/+f1cHz3lojwGmonMZhUbkCiJHH+zbjUli3kXZF4YDIjpATF7IYNpO7OhqnTrO3vwUqjz1C1CaL/69EXb8iyiYdb5U6dSwClDEtqeCy00+dmc6ICicGsh2ko8Hsah0qZTeMycoZ1qTd6gWUSvMB6YeIAOa0N/8BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944692; c=relaxed/simple;
	bh=egz/YBysPIT/DR8xazNLX/IWZeq7/2xoVdKwriG25yI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=acve+wO0tDh/3QUdYer6LArLgLQ3zWuxCeiK2YASiyY//VOfjHGesMfmBYOdJtb62/K1BbIpV4siau2CQOPJvbhCPU5FdPbZs6OROgoXlO2ENB1m6wuR/yVz4X666KC+pZ5G8ZFtkTf7bULbAIIKtXwrk5WGUlX/WWS+7yjQZOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4jkQKek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=izlp8XG3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V810bY3175040
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 08:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ya9ss3qs88Jv2C6GaxnSZ4/OaIyRrKMXJp2kiZJl0I8=; b=k4jkQKek5GQxWpBR
	/P10y3kb0jNU/u8YAYxTvOTJyM3brSMsExKqMikRpna4SuEmd+G3i5FKLJfxrkYg
	A0sFO/9+mcCsUxvprBhidexfwwaM1/UU8ANTm7f1G5koOEZw6nm+1AE2ruhWJMxa
	2hG6COAEYEenX4SVYKZmtUhpOTdUYn0QjJCNykZk3AEmJNVoIFoVqPNWwP0lZOT7
	AjRrZiBGkTWF02GdOpwXheSvHkCuVqchCunCmNuUEjoLv19i+ilK4xqIKhErdAYf
	eTTm1aFvHpAcMWTZrozSsRPrpV8WobCPK3oD6d3ZXXjWeJv1D3BdxLjDO/EgNLO5
	LuVkqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h4emg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 08:11:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb39de5c54so208503485a.0
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 01:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774944690; x=1775549490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ya9ss3qs88Jv2C6GaxnSZ4/OaIyRrKMXJp2kiZJl0I8=;
        b=izlp8XG3C8jVBvr0WLYQs/xIhG5YGsKsGLh16mWNh5IoupunM3/LJjIa+PPktvAuaT
         XcV6sJpy+7dTkKMPNitsdAHPGzv4U+ZfRV5+xtlazwLsYXApQ6E3UmYt3iNt4kd+pQRC
         i0VRR4pagrb4wCjuRVyC22G6nYaOqkAl6MF1L/O9EN+b2jDStJySdtzYaJdBMediPF4l
         gAO4Z2KbClX4Gbu8F97JDYjGXtFMzoApivEOJVp3raO4VtmnBukKONZuQjWeFliPMCU/
         7THeDw3LPilKsVkE7VsEX6V3jZzc1oCiHwHipK7WirJNGoJRQfSeumYOw7FKg6ZDMbjA
         bQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774944690; x=1775549490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ya9ss3qs88Jv2C6GaxnSZ4/OaIyRrKMXJp2kiZJl0I8=;
        b=auSt3xdxcZGojmfUZnlVx85j78HMUTpQHv/1L6kAe9vpdVfVn8cNRl1p0qjhA1TEMm
         nG9gduG9dEhlqY85NhLTI3sV8I0ZtI6aNHUOApefhg3sguGNSP4rEEVqj+uC/vuHK6QX
         iM/EaipsVa7umR/N4y2R6yIzfrCN+PLqADAvazmc8dE8T3d6ZA2LQGa6We/lhghISYX5
         aHupf5WeDLhM608vVNeGufMox2oQR5BqbcbBY+iD1ZH1I+KU0Y/K7+sHu+/D0x2oQZGQ
         V0uAp4vvdRBQnAqlXvnqMiCKQAnPEFegFClDIb6o/8Tkh4U4vQqThwmkAKppzkp5Nav9
         PAdA==
X-Forwarded-Encrypted: i=1; AJvYcCXWcKpYVLgjSv93Ivbyl+h2z56qzSWFEIephHxS7T/UwiBMvPvCVYdIleVHYGObAqxQakjNF3wKxkbhNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHtgGlkmGdtRSf4X6T7dZuaWC1TwVKEgVM4XI7xDRvKBf0VA/Y
	pJD4+MoPCWIipwdeOlBL5AG4KfOkwveoKFMBa87LL7WbuB7TYXPa2lUBA63+xIl39s2NRtuDAJY
	0UmEJq8O88f0IN5kXzuO3aoUvFtmKIv9Zce3++OynZlahJ70U+6Ou3ofMUNntzB882w==
X-Gm-Gg: ATEYQzyldnwBDa/Z2Oz/5lg9B/BgU20AHUEqrSrlKZLVsXAmPWipNvAnQtUx5q0c3qQ
	QZRxDsf7sPu98d4+ah9uG42NIsxdlVZIkBAY1xdazyNrj8L+kqDR91FMbRe6bIO2TgaFisDfXkU
	OKYctH0LSQEKRW7JHRwfqr9Z6jj7GBU07kD+WI7xK2SMD5g6Ve35wNlonucKNLquszSMzddITsF
	pis+P4ZJr2tx7+ytr6qD/dMCLqHAcEZz1WPyzsskLghJShZoN3yD+e78KWFZzbflY8HQ4g6/XAQ
	ljJ7u96KPc4CL78ECyJoTj+fZqfsMkw/1CUNGBMRp9nPAWWrfKdv6fwSh3tSBU+sXn5o/lS16YH
	rzTttHo9aHgmPIE+7Jl6sXQRtaPREDNdzj2FNm5STXuGuzAsYN8kS+7la5pIBYYoXDiAaVctAJ2
	Mt8yI=
X-Received: by 2002:a05:620a:1a0e:b0:8cd:86a2:340c with SMTP id af79cd13be357-8d01c613499mr1640091685a.1.1774944689992;
        Tue, 31 Mar 2026 01:11:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0e:b0:8cd:86a2:340c with SMTP id af79cd13be357-8d01c613499mr1640088985a.1.1774944689520;
        Tue, 31 Mar 2026 01:11:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b76081af8sm3354264a12.27.2026.03.31.01.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:11:26 -0700 (PDT)
Message-ID: <393c666c-e182-44d7-a706-7e44ddf28d51@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:11:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: johannes.goede@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
References: <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
 <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
 <8DTHyPLaUjGKd83PvBsisjn_SnpUnvkateTtwz9P6CChP9VGfDyQmJa4Rfd5KwOBOLhtGFJPDzfHrXC4zvV-Fg==@protonmail.internalid>
 <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com>
 <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
 <YGrwXwjIapZW_V-EEG8mk_JtJLxrTU5MYUD26CjvLYIgig9JU0zXq8UIpB_zxYL2Qxq_ZpHc02YfSBkVhDvJug==@protonmail.internalid>
 <4hasliun3wkook2pvfkntjlzs7elu67ine5q7nd7ptjthx5qvw@rntvb7lnajpc>
 <96d3bb35-3fae-47e4-b484-1a37f2f41b43@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <96d3bb35-3fae-47e4-b484-1a37f2f41b43@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3NyBTYWx0ZWRfX6pv9fVSNoTxw
 Vr8656X3IUnJRA10tcTF5tJlAgEX9gzqiYHJqAl9Klp67PVIrrd9kwJLC3ZnHbi6cv0MOIvAWmt
 bCE2vRBGbKT335VQFeFgzSVuG/92raN67APLKIks6tvMhalm4Nzua/8XrIujXFqHv92xI+o3rdv
 uXwpbWHOfjvhlyoaqyNgSOvL760bAJPZ7aE8wVAhByYJYOSZ8807nWFr3wcYM9UHprMnvwr7/He
 V0YlJbN0i9HdM3Sft9QH51zWTAxMRhrotOkLaUKgRAmVKxRSSUzHpZrZIifxIDMyHO9mKRcbeOd
 TnLpgteGHO1k2o16/kZOMzRpu2p0+k1GkhIoFFOkSI+iayuixqb6rxTRdhcoeQ9IUb5DdAATfoq
 hC5g3Ffk4YYd0F4J89jQ9Cio2rVxjqa9A8P1fgyTfh/HsS0OcJxhPjJxZJZpoaH9DPEjs2jPFyC
 zk1ormaHh0QHHvUCgWA==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69cb81b2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=otHzuWimHOfoUKKqOskA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: gNZ14YfozwcyqFrGfIy8jxLyMo__YlPu
X-Proofpoint-ORIG-GUID: gNZ14YfozwcyqFrGfIy8jxLyMo__YlPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-57740-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF926365FC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 12:51 AM, Bryan O'Donoghue wrote:
> On 30/03/2026 19:55, Dmitry Baryshkov wrote:
>> This sounds like the most horrible idea: letting userspace directly
>> program any registers in a way that is not visible to the kernel.
> 
> No I'm wondering if there is a way to construct the basic format in user-space so it doesn't need to be re-interpreted stuffed/unstuffed.
> 
> As mentioned I believe there is a defunct qcom project which did/does just that, not sure why that hasn't been investigated/developed.

I believe this isn't a great idea since the format will at one point be
platform-dependent (I think it may be already) and one will have to teach
_all_ of the userspace implementations about all of these specifics

Unless I'm missing the bigger picture, we're not talking about super
large amounts of data that would need to be slightly shuffled around

Konrad

