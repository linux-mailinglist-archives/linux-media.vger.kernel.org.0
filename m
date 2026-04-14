Return-Path: <linux-media+bounces-58746-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DJ5OIBa3mmLCAAAu9opvQ
	(envelope-from <linux-media+bounces-58746-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 17:17:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2903FB9D9
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 17:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEFCF306EC6F
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 15:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41763E1205;
	Tue, 14 Apr 2026 15:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QbYhIVGT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBqx4iQu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B4E3D6CBA
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 15:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776179776; cv=none; b=XUESeNYmGAdXOwzr7FhzCj2W+9yEfHz++/MC/FLBSFfjzUw2g/CKNKKYTGKXDbIkCl17rVxYOtbbInOln+0LEAcgLvWNKWohkTChfshuMpMBcQfhhyT80VG5dCR5CSPlS2Y+iexaOP4aNXT9ldZAT4k05pgNBbVviXbg2FrM7cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776179776; c=relaxed/simple;
	bh=GudSgVh5zGLUJIOGCDbMHamjSv/lulJ9mtwapINd6Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJ0ZFRtOuNwBmRZ5BoU4gs13c6+8K4IQHvyjGOhKZjMsag/RnWQx8bRDrk9Z3KU6HS43/E1IyA51lO2/6uQmGbK3x1o1TDQQm2RBORQPS19sycuSiERtNrgrb9jhthkTsqw3SNiNBhA7tswju6P1eOMvn6KWFHQSfLhOTwrryVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbYhIVGT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBqx4iQu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBtCjb2386357
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 15:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y2iIaBupa1ZFZoZaC493mfOp
	0zJnBLl7xcKpovJeqPw=; b=QbYhIVGT6CYES30c+BcksIQO4IoTyS0q0AE9Rgk6
	jbF6f6NtPvwVCgHojdo7aoSf1LxqwpLYwszQZsO0f58ixnO5TKRVjtSK0ZIzlqGM
	xgjj45B4VmaZn2fWZFTWWs5SYbKO8qJWJbqrmtY1G4Wydv+J/eq82EqAaxclu6Tp
	NHsqDvrc3HlYb2mQy0zNogC4ZW/qGFAIDnpguGH2lAbaH6RAJbt7mR0RD7PGIJ9j
	rWkJUvYlLfYYYgi5prNfhOK1qUYhfY3NmW40K0yRv4AH3KRp2J0aTz5nmH+XbPbG
	TIsPM7Ynj4n5uVAa/SGOQBWNbo6B6wQCs3Bcsx6KlUEGug==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w3b3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 15:16:13 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-46335278e7bso8928002b6e.0
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 08:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776179773; x=1776784573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2iIaBupa1ZFZoZaC493mfOp0zJnBLl7xcKpovJeqPw=;
        b=LBqx4iQuXCnI8twknCEBE7pSQP1fRPck3EGnISjBNe3e20JzPc/VxFFw8W13XtzFpT
         gxTN9NpS29FGSu0z9peEKrdSOPjDxc8/8qMKKc8bTsgTkTC7RRv4uVfAkxpl8/CWJXYb
         zdBWh/TTY9izpggStAL6ncxt9LhhpnTkitgF4VM65LDirPFT3oLv/Tk2gu1r7j+VNLn5
         kXVDWh4wdGEkeq0SOgYVUxFwExyAgL3mQC1V+uT/8G8wJ9Nauj+kfzXFWdCzHU/9KzSD
         a2KhKKZQNEl5A8j8GMd8B9k13j+x1CVzyfNXzTR31b370OAEd/RyGYtceywZWEzIz2OX
         zk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776179773; x=1776784573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2iIaBupa1ZFZoZaC493mfOp0zJnBLl7xcKpovJeqPw=;
        b=aHmLfPzW9Rvkk4cu1obAipmUDBf79IUFIEnKcr73/+1MqGJqkfs/3UqrK1tPwy3ABC
         ewt7V85u0vNSZ0/HXYxnREHxkDX9u5ohjcU2FOPmd8SJNtZ9Bn7v8WWbzJE2dlKgvMqh
         QpFkVyi3JJlmUBXjvdgpVJgZiF2WrFPaMYctMGB8GUlWVOA6c95n+P5eve1BXRSbh9yd
         qYdvWoGxoKMsToGxrrQwyPzfyOANyx8fJyaC1NRR4UUgo1xQLdkXay2gUcqkv23Av7DE
         tMzhnV++I3Nv9erqiI3MwBM3imAPQm6ERYpPlbAy6prUKeJEzgVer+LftwJA8FTvFLeJ
         bJyw==
X-Forwarded-Encrypted: i=1; AFNElJ851xkDrbwf8ZA8NioyPjIOs5MfYC9MEqaus6fY5YQ4/G1oLZdTW9jk7LJFdIihB/wPUMS+p2hgK87W4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRrNeZMAebAt19gkfZ6SE6R1RYu6GaKj5nywlwhuC2IbC57ACF
	UTeDGCU3NPeBB2fqpB5Wb+S45CgstPRy9ehywlAVbuGSmpcJ6Xni9iz9GLoS/PBfCfEhT3VI2Zh
	4IlJXerxxhKutBCtZGomZENn4aiEng24TIozWHUvm7ibV3sRNgf9mPPO1Eh1PkhskQg==
X-Gm-Gg: AeBDiev7tHuM3PhKpFabTrjOSMzz3yR2ijdClUfvGexeiZ4iKbAaAlsPFhAbuVRceAE
	Wuyiobmc/FFF3PMZ/+iEOaA4v4pqcB5X+eNtAsxQDZc2+Q9xJU95qChTXK7MU2Gvnx8rgzDbrAK
	bZ//yn5gYvvoZDKt141TlBDWM+O4h2U8i6pp7LLDRKqGXKvn6FpgWwMBIVBYWinfPx1PkK4UOL3
	qsFGECfIawZrwf7WPxC41b8auNp3WnTru9bGOZYJZfvrf5sqZ1zz1YBo5pDUuDrY9K3jm+YcRhd
	qb2tfkXgFXoLHuydw2fbj3g6NL6Mgr3gbl9ZHuc7euopO4niIDAogt+BloNtF8aPqR/F7+F455s
	C4+y/RKgwRmVO/+blqaEpPHjJ8pqoqBysF3VMuB+O8oMl40MxyaBZ6K2SWdKFdq1SSuepaxIQOe
	QF+eX4iT/hai51JeqDxSnkNJlvtmMxSY+6Ascf9DAz/scuDg==
X-Received: by 2002:a05:6808:f14:b0:467:f56b:5267 with SMTP id 5614622812f47-4772a866badmr9869348b6e.10.1776179772829;
        Tue, 14 Apr 2026 08:16:12 -0700 (PDT)
X-Received: by 2002:a05:6808:f14:b0:467:f56b:5267 with SMTP id 5614622812f47-4772a866badmr9869302b6e.10.1776179772241;
        Tue, 14 Apr 2026 08:16:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40006d23dsm1131145e87.25.2026.04.14.08.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 08:16:11 -0700 (PDT)
Date: Tue, 14 Apr 2026 18:16:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 03/11] media: iris: Add context bank hooks for platform
 specific initialization
Message-ID: <3vuensoscjzsjuh7c5e3jff5cej66iwboiau7vhnpvtmqevexf@ouox5cize3fn>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-3-7d3d1cf57b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-glymur-v1-3-7d3d1cf57b16@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FjXH-eZIH4evVvTGyCJcQVlRO-st4ve6
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69de5a3d cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Y-W-850UrnaCaRLArZcA:9 a=CjuIK1q_8ugA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0MyBTYWx0ZWRfX3NWHA8ZtjorQ
 P+qCd1shs4/AuWyUec4bBEzHxqeHh4RONsMOMQn6e/ChzoWr+GqyojEhYdgqVRoootCAMjrsjVX
 dB+GTh/j7qeLZgLvXN3Ca2BGAC+kiZksnocqFz/52+/P8VbZWaGTVeb7Ufa8/Z5IuVeV5josRVB
 14gPetUqpdDvv0BLXG4ZgYmfQgM05glxwwQgUo3wYuoiRJtY/8yRSBLrwPkctUbMWBGmuyZivEx
 R4P8PP9CZNAYKbxlrvIZG5ojBpQ1g8A4J4gR5McJa2GQAHPOlqU2LoJwPuD9FhC0uUBzKu+Lwu7
 lJzky476/V5T1aUUMfxaqbqyzkn+B9b8J8b0nZcRhoIGTfpHqXKZgmy0Q97IIOZNiqHsMidtM03
 xE3GYsT4vFNP2z7qZS3oECDrdah1aVfovwyO9z/2BWKag/eayrSyUCNeksoKnOi/NgzzEMZkBOG
 hD4gFrVrlTXfzBp/2ag==
X-Proofpoint-GUID: FjXH-eZIH4evVvTGyCJcQVlRO-st4ve6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140143
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58746-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C2903FB9D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:29:59AM +0530, Vishnu Reddy wrote:
> Add init and deinit hooks in the platform data for context bank setup.
> These hooks allow platform specific code to initialize and tear down
> context banks.
> 
> The Glymur platform requires a dedicated firmware context bank device
> which is mapped to the firmware stream ID to load the firmware.

Change the order of paragraphs. You should start with the definition of
the problem rather than putting the cart before the horse and starting
from the solution.

> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
>  2 files changed, 24 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

