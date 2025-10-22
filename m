Return-Path: <linux-media+bounces-45300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70183BFDA28
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 19:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C2B4E34FE55
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 17:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F4F2D7DE8;
	Wed, 22 Oct 2025 17:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ovU/kvt+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A562D47FF
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 17:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761154776; cv=none; b=awCeDIIOtubIaLDz5D8y5ucsyl1ldtYZXW0fOzeqdI0rW4pzgSGkwog+7r7YgND6FCORl4tXyISRO4bniG3XtUHDHmGDpiKQrqRV4rC6ddK1aca1n70je6Et/eppvEm6Kxu1oHnoMevNrEThHOk6YucHGSvFKGQhEkPAc27qGjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761154776; c=relaxed/simple;
	bh=fLelTF8/0IqQy3P2oy26e3VdYKHcJQv0D7rNT0G0sf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQauIF/yWbMmnecD5yB8Rk/lMKjKY+seuoozzpTcmVp7UF4x12hVg+FxAgukD/ky5WYI0Bo7iaAG4pO0Np+HSHMIBk9FhQn+7nDDVwkhryXSzE6ofxtcm/L9eHzxhRdGCZMsZJdeDFYex4lYN3MDuEBFzGQWnMwk9uXaSDrg+KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ovU/kvt+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAVV1n024521
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 17:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fLelTF8/0IqQy3P2oy26e3VdYKHcJQv0D7rNT0G0sf8=; b=ovU/kvt+Fe8mZ9v8
	wxfn21NP7PS5PYIcvFEMP6qaEOzjvhnt2Ub7h1coPJ2U8o2htWenlKudNmzQPscC
	PDisyCc0KYada3aJxGQQCtzmVUoUnz6rGFLRM8zcrGUGLUITkIuzfnBmDBg8Qttk
	LiP6F+LpEy1YSJurL01oM7T9u72wAX19C7EueYvIwNvxCKIp9Lcyc86f6d6tPEay
	AI9wn+78QRP6LNjkjuYY0vlKC46mPH3LVLh4erZdVtKuKH5Kt+gXUFYM7QfNZqEM
	pW9PEP1h3savFphn6QPBNiMW9qKXP1DPqcffITKspcicy3CHa/2w7Y2wfyIIQGd+
	pJBbMA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws7x4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 17:39:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32eb864fe90so2919991a91.3
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 10:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761154772; x=1761759572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLelTF8/0IqQy3P2oy26e3VdYKHcJQv0D7rNT0G0sf8=;
        b=IurOAvQTQwCrV2oVL7OAjukGfMNDGAmGyF/FWddSL3mtbk0v08dpRal9cJsV6TQ60L
         jWVGuRo4E3Vb559GsIDtTN5wGQMGwllPKYOy09AMFe7LOOxedyFkpsNFNtesObh5qBHK
         pSU7JYT+ITmiIQh/Vb+O8J7JFgO3QG3ZkIDzoleS6CqeVDivgTn7YcOtfoQmSb2LZUJL
         C5/z311ZhkIPPGXnP+uSeh6xeKI2bE8BTS3ltE6aEz7jDjsdMFLxrruFQ2oqClpDmjbx
         jNUS5oV/wTbleGj0PRqjHEVqVcCK2wC4ctKWo83BBRJiK1A7gGOmospd9zHOB+Rs1hfz
         VqBA==
X-Forwarded-Encrypted: i=1; AJvYcCV60b1vCwYu61HF/aW2592nSwmmxJ5QshIWUBp6eQxSvLYUtXN1cbyPZxeeESAkmZl7eIYOEWkis6honw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwi8vIK8hCJwV74l/sP5WaLwixlbDDFEfKHfKmYDsOR+ttl2mf
	Jn41fGjMzi26SuyoP85i1RQWpSJVbYDvnfspy0G6BjvP7FZKT2tkVSOccAyRVXjtoW2Rqz/FMXg
	arv4eYKBLPyAKawznWenaQubQru1/4QCu/d0Cr/2JQv25HAd3ECtsS4X7KuT7n5I2nQ==
X-Gm-Gg: ASbGnctL9J2j65+cnHJk6hknpKJKKjR/74BGSZGVRRcMv/Tk84FpGXWoTWdoccIMNIQ
	cGAmO7NPWUPHAUgr2z+teWx9L83qaKrqQ09lBj3RitItwfuexWkW2CWWmiVpS4/yRKK+ZQIRS5L
	Up2p+ONBUEj30jfAID7KW2Q5A853Us7lG4RXAow63lbe5u+35+Vg++4joYHFm1JGKqHWOeS5O4Q
	7jd2EAMBUiewNxO02FjZThVwRSiQTburKNMeCUIHshBlaFaeH4tXVEzWfuoC8KNT5RaOQJczI5R
	P4y9wOyI5MJxa0jZcPYL8WoIgUT44ZVhVgx3r6y1+HCKFDk2yQ1AICfiNtsGBO8+KBsP722nDw5
	jonXIugf0hpigP7dAIf5PV/fbBzw8a1VizamDwPp+fQ5wfdNuM9A3Ug==
X-Received: by 2002:a17:90a:e70d:b0:32b:6eed:d203 with SMTP id 98e67ed59e1d1-33bcf8f14demr27496768a91.24.1761154771593;
        Wed, 22 Oct 2025 10:39:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzmMG9fdaAA2inrKULTHZS4DJ1sZoPnRULNrfeFDnHK+yfYZ15yMpfN1cpGbPHSU0rFRLuNQ==
X-Received: by 2002:a17:90a:e70d:b0:32b:6eed:d203 with SMTP id 98e67ed59e1d1-33bcf8f14demr27496726a91.24.1761154771059;
        Wed, 22 Oct 2025 10:39:31 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dfb7f8310sm2728378a91.5.2025.10.22.10.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:39:30 -0700 (PDT)
Message-ID: <95538ded-d2d3-44bb-8aba-cc55ab0d4ea1@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 10:39:29 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
 <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org>
 <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
 <c4fd6bfc-cc9a-4f37-99b3-f36466691a1e@linaro.org>
 <CAFEp6-2=GJL-gc+PSyAL4=prp_sXdZJS=Ewg5nP2kcp_Gu85Fw@mail.gmail.com>
 <33513b43-f6d1-4c76-887b-39611a75e1f4@kernel.org>
 <WnfCknsSyJK68PQZkE2q7COZHRpsLOFlr3dcbwiVR6SBWtF9iRQ4MGzp_9q31O0kyhZwoncQWfHjJQvpz7nyfw==@protonmail.internalid>
 <ab43c5c9-edc5-459e-8ef7-2aa8bec559c0@oss.qualcomm.com>
 <0e6e1b8a-d9ae-42d1-b1ad-4314e0d76ab7@kernel.org>
 <2c0011d3-a692-457c-9ac0-a445fc82df37@oss.qualcomm.com>
 <48bede40-584a-409a-9bca-7ae3cc420667@linaro.org>
 <124be1cd-1cc8-4c04-8aca-eede808e736c@oss.qualcomm.com>
 <wQXRQmbUmfMvej8K6_8vXS41CKntPY998YjO9D3oixzxaMuV4isW-ebPocmhNjppbBpEvXx1524Q-BT-UHfh7Q==@protonmail.internalid>
 <6efe686a-fdd5-4f17-a0dd-d44a16a67a36@oss.qualcomm.com>
 <3d2b0de7-4c39-42d3-a6fd-d41386559e1a@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <3d2b0de7-4c39-42d3-a6fd-d41386559e1a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX0EycJweqmpgY
 m6M3OUwizeGWG3+qPzAeoXysXKizEI9/ttkhwD+Qk8WSSIvEd/5+WeU7X24AL+rXupnq/tWC870
 4L4Gelnf4KXEUKqjdfAPPMuURFm5WIZP6ZYm022IjwutB+oJbo5IDSw+NodsnS5MdkUFBXbWEyV
 E2osZbX68racht0zgM2UJw0SBpyVlcsjUOJnEzaB6TznZX1jIDoZ5oUzxLiK/3zef/Fy96IMcRS
 /dQf47wv7/2rAeNAQRke3uZs8lvdDv/C6BZBYzvNNmF58fTDiJU14psMPNxIAx9oTaltwGXZ5P9
 Ycxjlwx8IZAfEr88Bf1IBuiQkmCWBplyNvXbE57UckDoz7QRfaD6XyBYDVCmRu9ZFhWgbcEfaWt
 /0IEs/lcldJEQDmCBAysDvyXbOx/eQ==
X-Proofpoint-GUID: 6faPQYvFlaD6CuCeWFnONOkKDlLWfbhf
X-Proofpoint-ORIG-GUID: 6faPQYvFlaD6CuCeWFnONOkKDlLWfbhf
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f916d5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=apREhrRnQ4vd8KJXgwIA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148


On 10/22/2025 9:00 AM, Bryan O'Donoghue wrote:
> On 21/10/2025 20:19, Vijay Kumar Tumati wrote:
>> Hope this clarifies. Please let us know if you have any further
>> questions. Thank you very much.
>
> Eh.
>
> So can I take this statement as Review-by: from you ?
>
> That's basically all I really need here, RB or NAK.
>
> ---
> bod
Sorry, yes.
Reviewed-by: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>

