Return-Path: <linux-media+bounces-64115-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6ooIDLRTJmqaUwIAu9opvQ
	(envelope-from <linux-media+bounces-64115-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:31:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76113652D33
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:31:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SQlEaXTc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ToJcukWi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64115-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64115-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D8CF300D158
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 05:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF1F379ED2;
	Mon,  8 Jun 2026 05:31:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FBD3750BD
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 05:31:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780896666; cv=none; b=PiHwquJLDFGK73Lsl/mGgaPSkppk0lKyV5BAxT6Xa0a2w6O6EEXEyK80lEt2fZhrLv39TU/lfHOC8CNlFgYWM/4tgtKrk66kFS3WfcWjYmM9kwLasBcimkAiut7+biLFY4oSaKLfeEMEIqVY8lKiLg2066+smVJDp6ks1pkdIPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780896666; c=relaxed/simple;
	bh=qTx+DHtWre/vWRqrd4nb+kTk0I/WA3gYh9rVEZ8lRMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h8lVRxragzyohIzz/nrEeu+EkCQNpZTwDFuW7/uNLgKWN1I+PrkKDZQUfWXu06P8YmSQOb7yXkKX23h5JxmOQ7CPuzyu7qgL7tT/b3jGawha0v8gKea+4GkVJFeSgVsKh3F1C39x65XnpUxXHEMnQq3qSV2ogEHsFCg6nG1ocaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQlEaXTc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ToJcukWi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EAeM1469249
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 05:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hi15Xm8d7G0ExlIDhiqsbLHBGa3znaUw7XkKqHIeAEw=; b=SQlEaXTc2HTwUtKl
	vP6UjSZZiZ+KL94k8tWgc4R7n/XHQkay/RttbnXeazEA0guDyjMTBAy1uYo8xSST
	t5B6ig7rpZqMbcURmD2VdCoEpCCK12OS15fJo/hMf815er7dl7o5MMYAt/lDvqXC
	QZdsOyrhVgt5uE947omn+btpmZkXpEHuCGLL2IQOCCu5q0IS/9dhWuwTZa58sIE4
	KhPTpInViGAYiZq34qIPqyRe5BerWVAR0eoVRjFRBX314tLZ0Mg3i3oOAhgYhi37
	S4154se3lJV+B5mY/8TQJD2Ys2UfWE3yIgHPotvaTXkA+NmZvfS3fwXC5+DXyLjO
	VvNQsw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgwnxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 05:31:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517a59cc9cdso28600551cf.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 22:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780896663; x=1781501463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hi15Xm8d7G0ExlIDhiqsbLHBGa3znaUw7XkKqHIeAEw=;
        b=ToJcukWilVrOBeGWQWZTeo15riEJYQS5RfYqZJKfH5L3RNHoVMxzGqa8Y0kNosU4wG
         pcdDAqcIwsRoYz2lPzU7pPNH4eNvAi06of5UWwhwo5wwt/uDjj8qlpjiTThpwY5PP/Ck
         o1ez1HRPlBWOEFxFJ2O3wNHvQWz6GCyEnjweiiqSm+qcPlVsgGaS+hKEp8x6YKABiXep
         h9t3BFEskrYnm8LSrQA9wCPIWoTsb+yLJRCJFqyPQ0Jt85H/VHysgZButRglbD3wcs6O
         WJLBtkz8XAcA1XDUyzYSDHBHShBpYUADd2GG24XYAQy9xn4ILVP9aUcxD1Cmh43V/P5h
         PPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780896663; x=1781501463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hi15Xm8d7G0ExlIDhiqsbLHBGa3znaUw7XkKqHIeAEw=;
        b=ZD38iYd3eoCP6dKukFcZUdrGyk5xzlTl0DB1dNBDlk0vRWfYvP0ecW8LlZ+JfoBeRO
         RTEvt4cJkkZSz8Ln78fSryMdUqtPXhPSvzzKyx3PxPAgrBkFIlATMsQ183itFaxe0PR9
         +pWav/cBcegeFq2gof0eewL6wRco36fwx8Oq1mY+1Ua6PV0JCevvoFdzc+LPk9hiACi5
         NvVqIj02yRSAv57AYproGYt0/REAbkYqY4+cPEG/eLFYO01NuSAM/u39SmA3Zg7kqhdb
         lQFuDronuobfqhZojmUoVcymexxGoECwyRxfzeQ/Vw1VofQpDhXAdNYeVlwxxsXTJDPi
         He2w==
X-Forwarded-Encrypted: i=1; AFNElJ/QJN2r+W9IeraSru2eOMuSZgyypVxwgi07d00WSfXe4rs9BcZhYwdL8pMZNsB5lQQ+qunMy9Nc2wlb/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqmCHpIXrY0tqXm/nOor0aq5udbOt2JMMRI5NV4iyR0sIBGlEB
	a8mA68gD0X/dDJC+WT0Gg1hlRy0J07gx9+LG1MM7bqZbr2dUPeoOYO9yB76c9Fl6sweUmnpSXWF
	dbgFqF7qXnb51YwKcDAxea1jZUjlKwClfA3XiqITAAErBtMfvpO4lN4VdFT0UNUbRWQ==
X-Gm-Gg: Acq92OFoqoUmaWBOC65qi2xiCLyuYIS7+zaJvAZD6sY/b+5U4+kHWWEblJrg/qGRtLc
	z3iZpDLOWnMOF9xEnOfr5iekUU3dtYWGEdBgGVkMHdpDQBcME5Zf7QY7tLuITMCCvAlbOpFIUni
	8GoLWFQbewuMabJfxazakwZLQmEHrtIdutr+PC5lekiK6NPrc8G4H9swiMzaU5lS36jk0Ghwb7f
	O2Auziy7EKcWSRKnVh0MYLw087tz2Dw15yX50bTA5AyZd9zLJiWGcOveHvSqBrmHEpnKN4yrbYI
	3JmXnUkxRZMEkDJB03+/TLILEZBVUX1uYiVIoE54MzDFMSsUtr4aQ9yynjRwuUviaqKKBqTN6IE
	DVMwQpaFWovkB69M38TidAlpqzge0cWk5qLejqXCKDjLQOtf4VEsWCJME/DzPsL9f/A==
X-Received: by 2002:a05:622a:98d:b0:516:ef49:f6f5 with SMTP id d75a77b69052e-51795c5306emr207093241cf.39.1780896662657;
        Sun, 07 Jun 2026 22:31:02 -0700 (PDT)
X-Received: by 2002:a05:622a:98d:b0:516:ef49:f6f5 with SMTP id d75a77b69052e-51795c5306emr207092961cf.39.1780896662245;
        Sun, 07 Jun 2026 22:31:02 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.90])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851d7bsm6551413a12.14.2026.06.07.22.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:31:00 -0700 (PDT)
Message-ID: <75755586-0cc6-4dce-a1e2-726b33623eab@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:00:46 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/12] media: iris: Add support for glymur platform
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a265397 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=LkejVvrHZj9QS69ASjwr7Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=kk5GEcIQhxhgB6gqvmQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: UhnobEzR9DB9VQRCrKzhquQqZCVqDgcI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0NyBTYWx0ZWRfXwAGgRrbuycKr
 /2zJ4h0DPAPnqlfeim7UV9+9w25jhiHsBpXJqtzd/HW0mpA+u0+7r2ExZ5TRDYpq7dckPAnB9Io
 SXztaZTSLy05MuU5eZ+1MoWjyMot1or5gY1hFKQp/2ocpu+fXhGm26dK+xTqFnUBSVf8h1D58uf
 d21uUlVV6W1/IEq/XRVz2puLMLM4tWBmZV9kq4mvfo4SO/jLFBPyLN34MtrF1d9P9rnn8WbMLX4
 llPFfKUCLj74IwcplTVB3HRPklOFb0I1CrTAGIM774ePodwGTtqEkrGK7NWPGu2Ar+JQSXgJgtk
 KkbpCjsBSZFp9Z0p7YdSqFAN8P7SRQf5YzRcbcy5KjrUxkpM0HTn5bUtUC58VnVNf9ubHPQy+ET
 iJSZKCOrIYXAs9//YEs2X6My3c3ZfM+j8/dkfN9ZC+XKdVq7BUPwWB7FmO1OEZPTTIzLDj3D3aa
 iQIzsntDliaNFcuiOkw==
X-Proofpoint-ORIG-GUID: UhnobEzR9DB9VQRCrKzhquQqZCVqDgcI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64115-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76113652D33


On 6/3/2026 7:48 PM, Vishnu Reddy wrote:
> Glymur is a new generation video codec that supports dual hardware cores
> along with additional power domains and clocks.
> 
> This series adds platform specific support in the iris driver to handle
> the extra cores, power domains, and clock requirements introduced by
> glymur. Add support for firmware loading through context bank firmware
> device.
> 

<snip>

> 
> Vikash Garodia (2):
>        media: iris: Add iris vpu bus support
>        iommu: Add iris-vpu-bus to iommu_buses
> 

Bryan,

AFAIU, if media maintainer can review and ack these patches, then we can 
check with iommu maintainers to pick these ?

Regards,
Vikash


