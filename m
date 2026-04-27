Return-Path: <linux-media+bounces-59684-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK3WCZ9f72mHAwEAu9opvQ
	(envelope-from <linux-media+bounces-59684-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 15:07:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7215347325B
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 15:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6273030CC684
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 13:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503FE3CBE75;
	Mon, 27 Apr 2026 13:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6BEJ0Mm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8rMwMKG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815283BFE31
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294822; cv=none; b=ICUq9wUVVPwL1n/J1yG0JzIP4FyJXSliUO7u3Q7N6O69rxR2yyP5syonYphNmJOHLnBaHahByP0jnrUQ5yDpp0sfSlnbzjBRftDVkNXQRWIEFGRITvFWNlmlvwJINqRK64bCHeRPz+Lbz1MJFkX3LAdVXfR86uCAGJm1vV6gV1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294822; c=relaxed/simple;
	bh=/Vo5RdswgfOHNJuNuRmCqc/7gYBqdZHdOW/lFNmJNE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kzKqbtx9+bCdsm0GsTJCVrHczTr5U6zm0U14MYs3JqzWpaV/5mVFyoXwGinIdHpO7TjRZ7ckwG8uegKTf7cBMCqcH3M1mO75cAgWiKdeH755q5GuG42TG1A/v2fYTwaUpHkEiNvH0DCpOACv9qysHsdQjxLlLMcddv0kyc7kX+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6BEJ0Mm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8rMwMKG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R9OdsP3825224
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 13:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGkcCsiEA2JIXk+TcjaMJ2B35tfV/d5doRcU1NZp98I=; b=Q6BEJ0Mmw4PMQHaG
	cGf0U4RS6zQAh2TenqOqUpm1qqfck7uK4qCYtyGWHTdJzriENvpIoJFyKYRnDpgV
	GfpRlhYPBvDiEY1j0GhqovR8durrd+Rc8HdJWUgNouuncQ9v+mDMIcJu+2tQ/UAJ
	bhMKYBlDiJejF3uhCZhIL0De9CC1wXDSOe5lYZCV66cC2b5UKPzRQ72KhqN6BdOM
	NOQCVkrkZB5ya1iEyp9MBBtUwyw/tBCqcZmjz+R5TTDOA6V/sCYzO+8a3+papD21
	Yxj/Nz0YEeaye/1IyycN+/dzANbWqHSCEbBMocnKCQiQNjCdx0eI2x9HmRkM9mFU
	tjIJZQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5550syh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 13:00:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e62562b6aso15491391cf.2
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 06:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294819; x=1777899619; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGkcCsiEA2JIXk+TcjaMJ2B35tfV/d5doRcU1NZp98I=;
        b=e8rMwMKGo/CWUQdw58MfBy8BSDtrja5xL5cLD5e/id9z/RJBaS/TOgF4uyxu5r4pO5
         ldJuF+y/RLyBHyAqIshjWfQx/DKVilgKTy01wXDW9AYAX+R+nOtcf2J6i4CAs3jIJ09q
         bc1L0F5RmQjscsP8CiFm4GCe3q3FH0lCfDjsWyNW6+0brSSu8vrNKiyfYq+mWzTYEFL2
         2pgeK+awug0yEyBq2jueQXAqAEmEWLS//7KrR+K8lQxldP4lbapxXRSB3NNCp9+C4vS2
         W3aqyavamvdWD1QARlYRNQNw2y/IGDOHK2NOzfpQIcKCVG6Os7GuGdCtwhT1P0bMV+mY
         Y1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294819; x=1777899619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGkcCsiEA2JIXk+TcjaMJ2B35tfV/d5doRcU1NZp98I=;
        b=WGdD/UrRSwFulf+m6xNr4OobOT1NLLFIbjpAvN0HdOUCGMhfg/T6y2G1jqE9HqjOGT
         dpYlWIp+OnOy5Ex8Z/ss+ZlvzZSBaDRp4HVy07DsApgr6PeWcA+EIbM4gLU8wJD+ESQe
         rkBF+/UHUJ+Hb73i2c4M+tgb+wqL6Gj017j56Ij/ZhcKBc+dfBuqsV1OvytERwQy1GfC
         UngNPYzHIgqTKhQtG7np6q88MIhPCU1OCwjnjcpiY42XsYZyqqhNfglui0bHSW/ACEzL
         /0m6KVZnMH+T2rIl6Dvbvqcptd7rYF7T0yGrZYfGpZfHLktBsN+mbyclo0FN2Uz4Om6Q
         rs1Q==
X-Forwarded-Encrypted: i=1; AFNElJ90mtSpJGWTbCJM3sjBnw9nFx46uDZgAMTrmUJMHWN78WpyOKQH1nHokDv7DE1r2MfePvwW1o12HczN7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoplwO5BdtFcGEZO+s8GNQlpjHE+RGeWFlwPQ+T2g9BTtUEEL+
	GiXeZ76I9W/g3jR8ojTeYQQxz/0Z8mSGv0YudSduxlETfh9Wm1bG2U+ForUW+udB2Fg4m95V4j2
	+uQ6zyVAsYHZJ+25T4CLBsL31e1f2YAgEqD843GVLMbV8q5F6mQAaptKU+Ont+ZEiXA==
X-Gm-Gg: AeBDietig+8L97iRE+Z46fPIhEDqIxVx/9yFdLLWSOILKYxxn4P9Ei+IAvVzwLbhfq3
	tPoWOMouxOzhppw/BphTc0bmQ05wIGQAhCh7u39vc4sBIxEJ6ZqS0kIf6zSJmA5aZhD6ofcpuX6
	WMzSvfr0Sy4T0QYwNuG8aAk0ZLzOPrPDhkX99Nd/M1fd/JpKjOzjwa147FnyRIUUeOSNpjh38px
	Zdsn25EwYcF2RVrKnYc2KX0ONLpmhP1gUj0Ipb/+oVs5BfH6WkxGWE0oTM4LEKmu8qroDl1hsY/
	ikZCHJhQjvIfvAiLMmIMUR3fDBcpsqnIXjS1Y+dMvnuo7315G8AzatK14YAGVH85vIFpxDdtflF
	pYbuAUXIRd/d5yu2zMMhGUKVVQH/uuWUNE+lIesa50CAodT2mIcKM4U5uFJ6J8RhPfZD7U2Ijcj
	N/J1GfZUfA5u6k/w==
X-Received: by 2002:a05:622a:1c0c:b0:50d:9138:3322 with SMTP id d75a77b69052e-50e36c8e98amr408672411cf.7.1777294818716;
        Mon, 27 Apr 2026 06:00:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0c:b0:50d:9138:3322 with SMTP id d75a77b69052e-50e36c8e98amr408671681cf.7.1777294818137;
        Mon, 27 Apr 2026 06:00:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451ae5f2dsm1099761466b.21.2026.04.27.06.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 06:00:17 -0700 (PDT)
Message-ID: <2134b8d1-70ca-4f97-afc4-bba0538f84cb@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:00:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera
 sensor node
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Martin Kepplinger-Novakovic <martink@posteo.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-4-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260425105300.745044-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _7rgIXg4yWSVUbhPm5ytbKPoll5rZJQ_
X-Authority-Analysis: v=2.4 cv=CJEamxrD c=1 sm=1 tr=0 ts=69ef5de3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7hjUlyXiQ9dVm2DUhQYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNyBTYWx0ZWRfXybFXSKaEzJdg
 ifIb6wk1zNOqNl5CQWtBPfNdr84kt4Wc7RjocRXErvFtLjx8gUgxsiFB0AdOw64cptXF2qCzOPP
 83UEPL0hiu1XbwtQLLjshGzW+GYcZtsKKyJMTWoSuWNF3arCuhEADKo1Gfao+97M2Y+O7/SDcsS
 LgrcRaZdGrk912XlwwVexZsT1A9SE3pvQujZiU7uS/EPl3iD69Uh/6afqPnxRHa/oryYF3HqScV
 2FfL5Y+CeT4fZ331h+nmGew6ACZviwijNqIULIe6ICYvqCqber3L3JWO/3WOMoVhlPRCIjdn8fM
 B8tDFp0FWdszrFUAmnfKiLhuFQv3P8cukT7XWE3km8q0sWrU6fhhI2EeC1wJFBbxFBODCfy/aSN
 pFV6liiS1PElayf3eJZsYSREkfeC1co0bqROrMYdDvxRDOX3fk9p0U0C0yI4FEipyUj5n4RolxJ
 IGnChDSZFsMPB7XBTiw==
X-Proofpoint-ORIG-GUID: _7rgIXg4yWSVUbhPm5ytbKPoll5rZJQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270137
X-Rspamd-Queue-Id: 7215347325B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59684-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,posteo.de,linux.intel.com,puri.sm];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/25/26 12:52 PM, Pengyu Luo wrote:
> Hi846 is found on my Gaokun3, descripting it.
> 
> Note that it seems that only Goakun3(3.0GHz) version is equipped with
> Hi846. Goakun3(2.69GHz) version is equipped with S5K4H7.

Are there any other noticeable hw differences between the two variants,
that could warrant the DT to be split?

[...]

> +		orientation = <0>;	/* Front facing */

Please either drop the comment or s/tab/space

Konrad

