Return-Path: <linux-media+bounces-63021-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xB+lI1BgGWrDvwgAu9opvQ
	(envelope-from <linux-media+bounces-63021-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 11:45:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAED600265
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 11:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9639E3014768
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 09:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416C73C4575;
	Fri, 29 May 2026 09:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pyN9kRIT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhPZlD73"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21D53BFAD0
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 09:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780047945; cv=none; b=bxIrlvaJL3zAA9xMHPXAFAVyQ+CRr7E0EU3v4xvKv/bSVYcPVDj3ULXub99XyelOedlR0P01DQbFI76fkFvHXI64xnV7R4RRJ1mAO3A3CztxqrDykYwgrOqlUUky9sdDLKh6zvcS4zOT2bbfXL1sRkzH3E23EgU9MhyxRmWmPXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780047945; c=relaxed/simple;
	bh=4d0rimpxQUNcM63dGzxewjxyF1i/4vDxt4Z/QMTInVA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FjkSlUU3tkFCMFrt5L/7wuMCR01qAJKExa1P53MkC5ndJZNISYS+u7fX+dPWvk846ExlUDBPg5koeoSiO+qLrTG7pRB0CU8NYM66/8Z/WEnCLAP1GqKJXbxQk+baDaS5JJTTQ3gfM6WMsqp6gBBJllEZqr9CfZS8PebFcEWv3Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pyN9kRIT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhPZlD73; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T7cCK11495141
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 09:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uz667M+0GzNu3DQdktJc+dlcwqwGLPErXGT+hqHNISM=; b=pyN9kRIT9v8vFNST
	oXxTDt7sJgih08c7g4Y6N1DueLiFLz+c0bHxNGB72KGOUJnDUk7Bk2MWgOBKjcem
	XG597OsBMgVMlfYXK+1R60Wjcm+VllBQwG5jIQ7nlSkBZPsvd/Fl+9z3lJEXcG2s
	OjZLv14M4rfGAtLGSINniwHHuaSMmV5WVTlfQw4EyVx5eJdAkX6BIdQ6N3wm0WVG
	2VOPwJujgoeNbHR5lvzKDtiB4uhW3+0KA8BgQuSyZO0Mi3gHAdbxUKg88LZQvFSd
	fOpRkdrIdOJAdB8ItCgB68SM/sxOoW5KXxlNDmC1NOsW5eC1nYi0Icl6USfUHkxO
	u34hWw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef0159yv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 09:45:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36ba98cc003so850454a91.1
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 02:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780047941; x=1780652741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uz667M+0GzNu3DQdktJc+dlcwqwGLPErXGT+hqHNISM=;
        b=BhPZlD738DWlgMNi03LwbenlcwV9GWDI7AGCgUeMIMhlXj6dkOMgHxn/20G34OabLB
         Jemb2j0vRKvVkHEhRPXACs8ljDyaa7ppR6TLVvylLRGzockUDTtgBp4Q8LXN4xKG23rU
         +zU9ngYlZXoqqeSzewYk2EzKRoOb4KOS+x+A4fmczea86aXxV/bwyo/VcevznsXP+C1s
         gVMWT4gB6u41yj7CDf/4wueHXkvK0iR2ZDJMVxnEjtDv9MoHityl6oo/BfxnzWdlDlA1
         8xAfGah8ARqvdFmPtUKt79MQ/c0WsbkwrZempth3VeRwN7/xdGjTI946CjTS0KR9Lcje
         8rDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780047941; x=1780652741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uz667M+0GzNu3DQdktJc+dlcwqwGLPErXGT+hqHNISM=;
        b=WPbe8DbBAetvMyeRcMOm+aSNKxWCJwMw/hPV+EGHF/u8JgBHx/1qcdn9BduQ6RBPdB
         bd2pOziAYRZV1YNphT3i1TsNdrZGa877n01u0VbuuI+DuypKSTE1XIRy+3VFS2dU+qAo
         jkFAQ+/gQpAcFuDulmu9U8BsqgwObkSHzvRoi+hV4C4TueK4Vs+yhTjumaDhA/2BG3YH
         TNdFF4Rknr970HvfKrDeqgTTcoBbmicfDizmwGuGEfBx/+DZyug3TJ3u3cBEyTHEO9KU
         R7IGobphs5yody3GeyvwzHOrRJQoHImFCecvl60kvSVWwWQDghbvUmf3URmoiG0mEslV
         SgFg==
X-Forwarded-Encrypted: i=1; AFNElJ/zYZc4VVohy9t75XBCXHOmy4/TKxX8U3iOjLIgha8N6xhQHOux+HJSACLg/LCKh0C7NX7LXQjGYJHkdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbXOnRGyC9XJFZ/nU8anhAcsUzIDCjLo6aN9uYlTvenIHXj05s
	l+2Zf9LeVGOAZqqY+c+PHUlg5p/e9OzRCcNT3n0c75r1+XpAyb/2JCvyJ+ZyeuvwVBei/f80Tvz
	3czGEhRNriNjRRfg405kfU4XnKzzc9e6tKRzD4Apj0GJ9SzdpFBVxN4AYWPVST+X5Cw==
X-Gm-Gg: Acq92OEH8pSnF3J8USaBjolaflquIvxXdfmwSbEyDZ0mVoj2w7o337iEkfPLsckzRI7
	AIXVvt+1AkWSY/ERxIDVu6bNz38JyIk6Hcrwm+tLem/r1AxEz158Y3OrUoaIOMFmC0T9ZPz5scr
	3S+qt93oFRcr9+K6kfKH9GlbyD7kWycG3pJv5CwqxHqTnB8Y/4NZLh40SR492FGbAO5RJt0gph2
	xfl3RtE6jjzRzvtBkUviXBHnXG/+hFcL6lRxu6jtk6X/bO1nz62XPFjrk2GNb6volaY8tvtWqCK
	4NXc5g/e7WlXsJ1q7Ako+U8m5NhsUy0cR23LHgzsUjz+n/5e/sDo2/vIZnZOaHnqwMUeWfrKdY2
	xT45bFmmak7opiKCNgorPyWxxTNzCbQxroYswvuFjn3a4SU8iz1MR9XUpbt2RB3KwE4Yajycf7s
	EB+sRRR6BX0MIpuSA+GEZBLexNv1M=
X-Received: by 2002:a17:90a:c88e:b0:36a:95c:7613 with SMTP id 98e67ed59e1d1-36bbcd5b0bdmr2738462a91.10.1780047941292;
        Fri, 29 May 2026 02:45:41 -0700 (PDT)
X-Received: by 2002:a17:90a:c88e:b0:36a:95c:7613 with SMTP id 98e67ed59e1d1-36bbcd5b0bdmr2738429a91.10.1780047940781;
        Fri, 29 May 2026 02:45:40 -0700 (PDT)
Received: from [10.249.20.117] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc0c341dasm1644114a91.15.2026.05.29.02.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:45:40 -0700 (PDT)
Message-ID: <ce5f261a-8c39-4fca-a267-31bea6fc1e85@oss.qualcomm.com>
Date: Fri, 29 May 2026 17:45:34 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/5] media: iris: add support for purwa platform
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <keD2FYytnyM7Tuz-kCdnzVBtv7rq_24Kr2dEKBfOpBjqQnmRFqksX-dY7IE8TlIB4ke44GBSYStsHtoa0x4DJQ==@protonmail.internalid>
 <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
 <dd93b5b9-ac3c-4fc1-bb54-a68ce6d477c7@kernel.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <dd93b5b9-ac3c-4fc1-bb54-a68ce6d477c7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WDrLtZhsOivw2QL_W4dG0HK9J0CgLPAK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA5NSBTYWx0ZWRfXwjxCxede4RWX
 NAncl69FLNq7Hvyyi0vy931Hp01nx23gCQREX947oXQdHmnruD3rhLF4Q2uIA55yZbS16xNSv0t
 NMJ7/1e9c//OzmGO+sRVTDFOCvXM6PzdHe3H7h9sNFVlEP8kSpvVJA9mKh7TniwoD1sZ0GClD9R
 zAsokqExPJulb963twg1/2cwySrelbGdrKlo5L+esGUFA7j80MxplwRqB9ZOyarjVhLnbDQxgOG
 851pe5IB4EZ/CbVS/EU5lbV7IskhzuhK70I+7DJ9/4eQyZFLcTBF7AqPPjxSVhWgCMdUzZkD9fP
 BCzFz18hkkZnwFpguWmIJXPmVL0CBNR4x0nSDsWu8h2v1PlZ6SrxdeLz31PMVL8cIzFkg77AZ8z
 ITPGNOCgZvsrsZp1yXkY4Kt/IjZtvnK9WAjal6G7t+FfSr0ea8Kw+iWt71CcYkqu9qIjvK3jv1z
 A+K416BJfzsVAL+oXng==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a196045 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=2yV_Bs2KBFBxzfrgXuIA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: WDrLtZhsOivw2QL_W4dG0HK9J0CgLPAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63021-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2CAED600265
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/5/29 17:15, Bryan O'Donoghue wrote:
> 
> Ehy why are camcc patches prerequisites for vidc ?
> 
> I'll drop all of that stuff since you don't depend on it and and you 
> don't actually want to be gated by it.
> 
> ---
> bod

Only the last two patches of this series, which are the DT patches, 
depend on videocc. Please drop them. The driver is good to go.

-- 
Best Regards,
Wangao


