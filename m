Return-Path: <linux-media+bounces-50445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8F8D12212
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7044304DAC4
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BE93557FB;
	Mon, 12 Jan 2026 11:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dK5wC/Hy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MGpUMcf4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3A6355049
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215754; cv=none; b=kZXI1LUTVcM1iFlTC2diQjP6a7THy7yjU/ilP1xQuAOHiuUym8JH9FbjFWprosrAHxWtqtf5w2Z5UGK0mtRRJLG6Q2kkGR8TJASm1fZzH6j35KZ9ynuSlg+if6VN4qZE08Ud6d3l1dPsY9gbvpNhVQg+L/vxJoHI+v9yOioYrbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215754; c=relaxed/simple;
	bh=4MXLd1zoDPiz+3pUSavofyIGkstIv7K7Nj71IsCh/BA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ht59BbWQ49p73I8IeTwmxEbg9wLr/3LX22OILyyACHOSe4OkBdxd2OOcBzJ1MY3XIfv3O0Hkd1aJNqt1Ib2nlc6bOF8OqsuC3l+/hVtPl04/Z40ckbOW+bAqlBW2ReB8syCVrviNxj0Bv5uXZTlMZFTJgj4qxpHkWL/qSUgbXRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dK5wC/Hy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MGpUMcf4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C83il73124249
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hgr3rwX6phE1sKitQ5f8gbi3SGsrDPRP11Bp1zyGzhI=; b=dK5wC/Hy7eENKsMi
	yenfvHx2CpdMwHRLCf28CJSwSn8sUDCWIbQHtyE27k82cfXmZhfMTm4UKYFBEPKE
	UWhYHO89l07edcgiiMhUYFIJNmWjDfnbiJ7SA/cDTm2939VR/4HFxPTGuzqlG9qb
	zeHbPAn2VoAVFtWVPiBF9IcVsEWmNE4cTBRbny+1nmj9V792aP9jrUsN309FJJob
	L30nlXaU4EzHDy+BjLKwXJi2KztFIP69cvJUvX/EFjdiuMYArbRggvXalvcdw2dM
	dGNbktdTC++M7oSvLPR8rbAKvJ7DJpHPW9d2tyKqKofQXSLTMqNBS8YRZMVr+YzT
	uM/qZg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntum38e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:02:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ffb8ac2cebso10728591cf.1
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 03:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768215750; x=1768820550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgr3rwX6phE1sKitQ5f8gbi3SGsrDPRP11Bp1zyGzhI=;
        b=MGpUMcf4/+eP/hqO+Mf9KAplWu4cokzgx//agWiN5VH/jyQlIp78b1KkAtgwCITxpf
         1WFwOrv0TweS+hheu+YzDeT5XMDHrHdAYbhZKjsLTC4nPbQxGn5PxLLmYlPf1pJfodo3
         FRphIn/br0aOWxIx9UAIs49+75A/NJmREb92vXIzb2u4xaJL3aGuiL2TkEsIIcvGAF3E
         YGVqoS6ocEauW8v8yNJEUeUsLZyRy8f2p6jV8TwyaQtJDj/otzB1MLfZdQwxOstPbCHx
         wYD9HjXStmC5j33RaN9Ydt1mXSnbOyKhSGMAYbsORtz1jqEbOd95Uh21nNlbqnxlu8jT
         WQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768215750; x=1768820550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgr3rwX6phE1sKitQ5f8gbi3SGsrDPRP11Bp1zyGzhI=;
        b=ld5KwQasoV/QQlMSVhAqqc1JIeQ/OimxJpXNn3nCsRTp+mCPeAbe/b77dxFNjCi90C
         WAIw5tHrj9pyjJ80r5TszDdojM8brB5i3Llpk1wZPQQoBdzXBCVkypBfaaZgctJyAT2+
         A3Wz/xCRngrXCU9yZLUin7GVHarjrdrc2oamc1cuNTdj6+7heW70wmmccEhLtx5zByti
         pMriqNxOgM+thn2mNkC2hd+aJzJSxJCkowS4k9xdIA5MEru63I9rPqq4LKhxrAdUgaWu
         Q14YCeRoMzYbiulofqAeeolfFonHGOjTK+qwrdoq5CW/r0H+J9d8tO/04EW5YPWWqJlQ
         ycAg==
X-Forwarded-Encrypted: i=1; AJvYcCUG/Ki9lpnk0sU4evjSDDWMySSaFdtpnJC2LgqsOk0fAPoQv8tfQ9d9oA3IujOWzMyRbCDfc+rcWZ+PiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT+pE3xmHKCPFJIjo40RsuLxf9JzQGY0PjGWMI+8OXrhqYoC2N
	5qXvjHJwqpN+X6aVULpHbj92furv1cFdmUwfwQD4tB61c9wIA78BRBc6+uNK/VapzGF71jxYaSq
	xTpfbg4B8IxUzLBVUFJj9KBo7OaPP0NgzuLwouV8BdE1cawt2UObBWePFTUInE5gVJQ==
X-Gm-Gg: AY/fxX5Hk2F8eRWjsRE0mpVNEyIFWL/xA6+mk1ivaFKnTKDRbxa9+M21bP3nZAJAn0H
	H+anF0qNzI4USXrgCUL+k0z9fp9q25diXR2UiLUg2c84HLPzlJMi+t3wrAQx4baaMVjZTJrCThU
	rvLY6PH0whEOM2kp6Q1pfKAPj7WYmJ/dxKreHPZwFQGJLlY7x8m7hr7iQxsV7DnIcxHfxClzHFC
	Fn7XLvqKwjf6cFyPqJ0gXVGd2ycv+oD/1wJ0vqmeIg3lO84gDzU0L+rCqdj0oVFhiejJYyKI15x
	LGxUXtUrj18fwFP6e/ccNA/mw9s5PSprpJuaQDFbFwvwbS6aq8P0czOFnXFtpfOOIl/coVfykON
	hZ1RVEmBu3HaInkRfIXpgQmhQO/0MkuSVUbCY9uLjDFOveJo34/fPbox2ins5BQbThVk=
X-Received: by 2002:a05:622a:408:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4ffb4a68dc7mr189484431cf.10.1768215750290;
        Mon, 12 Jan 2026 03:02:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmAI9yXYwAAD0iHcKhXVU23FUkawySDiFTgiByQEI1XgGg3bSuLF37l4LbUipeTxEIuhvlQQ==
X-Received: by 2002:a05:622a:408:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4ffb4a68dc7mr189483721cf.10.1768215749607;
        Mon, 12 Jan 2026 03:02:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be65197sm17398854a12.19.2026.01.12.03.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:02:28 -0800 (PST)
Message-ID: <3ef982f8-0f0b-4775-b701-d45ac2c05728@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:02:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] media: iris: don't specify highest_bank_bit in the
 source code
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
 <20260110-iris-ubwc-v1-5-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-5-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NyBTYWx0ZWRfXyopkZp6G2oJq
 1/dsEglpGaiTm87i2QSggk5iza1a7DevgqHxHyyH3WfdSxnCXL2pSnb9kQD/B9YT85+0VDtQrs/
 uyDFhhHvCC+W/kDikxK7zcsuJoYc5MtkQ0A3078o7skq1XVBi1eptPbpvf6f8grU6XcQcheOuhz
 ECS0CxG+PouYnYC4k3bKbiyFmN1U6Jqh6ifvLTPeIgDvpsx2zCtQ7xAnvakQBRneTvL38lPFaGs
 lV53j9nfTnZvCRYLTn9aWDapu+cExTlpJEUYGqcVqp07J3cF6YB+vV9rJd3LdmUCirXBF2wWjAI
 O94M4JMJO3oaMQEzvQCKde8nG2OOloAhiNFhrXxBAT7SlS6Rg3nA1pjqpGE1ilkp37NkRiH/gbp
 kgAxp8QJBPIHPH1dpCiWYbuZ9T8mLftsu6PjuGByyDxYXGCa6mt0Cb6UuCe7WRD8K9OnC/Cs/n6
 BAAcgJdkWIsibGtXCnw==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=6964d4c7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ss-qTuU1ZYQsC6pQTdcA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: jdluHXUzg7mZcqs_27usIy0D4cf_endY
X-Proofpoint-GUID: jdluHXUzg7mZcqs_27usIy0D4cf_endY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120087

On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> The highest_bank_bit param is specified both in the Iris driver and in
> the platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


