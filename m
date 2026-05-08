Return-Path: <linux-media+bounces-60916-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPmSBKLB/WkpigAAu9opvQ
	(envelope-from <linux-media+bounces-60916-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 12:57:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A81E14F55D0
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 12:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF43E301E4B2
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 10:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C92C352C54;
	Fri,  8 May 2026 10:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCUWnA8A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akXmvyBv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDE832AAC6
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237847; cv=none; b=VClZ3zMYNx4fIjtZtY+BlkWKIYbg5pXYvrhuD0Sr/R9Hjy+59KPUkCwDmPvm7lQMOgthphv26Bsj1ghZwyZQlfpL8cTeJhl762TbFqSGdYBWUjH+DVYjhod92vII9TInOfc82WR+pMnICtmGwu/WMDT8QjkxVJF+rtsZilqbC0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237847; c=relaxed/simple;
	bh=t3UEkdbU94HVj5nKi8Cl4Rw7eUN1E66WhXCwZhA9aww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G95bowEzRHW6/He3UydbQjdPq7KYAvnhZE0Yl1W61NF+2LME/3XVPPr6p6ektu7L/3RsDzuyRr6YMUQOzZ+ZNX7oRQL6sAPV6x7fER0mc4yt1YPg41Jboto1TB0fhxWgCBI3FE+wGyUv2+0+mBcl1LOSctaKrT7flH/SxbEbDXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCUWnA8A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akXmvyBv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648AT7ih2198948
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 10:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOkyDU+po95G998uSCTnKWvTpeSwwYnWfOiQLsZmx+U=; b=RCUWnA8A0Dkc3BhJ
	a0N5CzTaw8w/EP0tJAxJlGPPrWwnM/aQuUGHWXAyqqlaS01UKiJje03sOlFv+IJw
	fjmIqqMqYSUIf4GJ+cOb6FZNUgZu7kNQuOi5bpxIuuJaHDt34PN96IyHIA2dS4S5
	l9k0OXs6frvBS5KmMmb88C3q1YNTH/yqIF7y8KrvCrTMERYomiBcD7HXu8lSfRQx
	xb5hNCMLDR4qf4wCa/tO6Rr9lfwFz6UkduS//i/P69dT5q1ZgzzdRrXheIljKTsX
	ylMi3cl1+raD6AvWyjnmNn3OIedqM6X6PKjZVUHxUR529uy7Z015Gdfnrq7Z3ZOf
	qV2G8w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sjys7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 10:57:25 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-631337cbe45so88114137.1
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 03:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778237845; x=1778842645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qOkyDU+po95G998uSCTnKWvTpeSwwYnWfOiQLsZmx+U=;
        b=akXmvyBvNPID2apr3Vr2cC5tN9wEqlKkrnNLpX4QmHkqXrcfyHnQYNf9TbOPy0qDJE
         J2nk4wIoseN7armGPh4A2yq8YzV9bw9Zga4ygAArZJrACdYjyDnlgA0f7VSHxXGQXRs8
         wf2qS6HU57Avr4fms90ic30Hg9aqkDE9TyDucdzWHbnYdL176uec7iXVJFwZYueU0WxX
         NtczMEwJ78cVponuUhg0rO0OJMRyaKNQ11HVvVrIkydcBEJcYvCcJvvVKX2chyhDLJ2Q
         JpeonsbtKFkFkdePHtrvugqDmEp7xOE8UEwC8tYl6lOyGHAuNEEMi+2vUkH32x0n542Z
         3aUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778237845; x=1778842645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOkyDU+po95G998uSCTnKWvTpeSwwYnWfOiQLsZmx+U=;
        b=d1e457F57nZAPRXTliqoqyzlz0ISj+vCjCboKj8rQDYATHkyZShTa8p6/mybwLTDSp
         x04zyOVsGeOwXFNAbnsNXzbJkP4FGDjJbvbIaRb7zzF9pyv2ZXrA81Fe4ziVM8VTCVMK
         P39kqhX6P4XiNE0tSoUDAgl//wA7XTS3ebkGTZlBf1tafo8ul2Pto2y50vDeHdYhGdfR
         tgeqTtSeEbAeCDfmTVcnSBgl163F48srOuFaskvojF7unJm+CrRnzEpsQ/gM0egEEip5
         a9YByssOSop2OcJL0IRkBk5nEfuaD6MgQj7k1ia69OLjaBj1xQXrREcUn2tb0MNWIK3u
         gbtA==
X-Forwarded-Encrypted: i=1; AFNElJ9iuB0crmGARaaMFVDX4mKqcp0LX8owk2gpmiN8FDiB9AVs5oqyEvYJ1B79VwcDud6aTPj4Twbz4OylCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrBKWj5B5faIYMgKegHT7D+q9XZ+nrem8LKmQxcDG6i7M3b+HW
	ugJsqnTPl0Mo69pcXCMYYAGEkS9lucq6OpsvK31OAsA6V+74Z7dWqq84wb1G8UOKTVMMtAretIw
	3/ev2W1tpv27sGUM3Tn690m4FeGOJD8xpMR9Tn9vmneh++ZFSNq97IsQZSO2Q236IDQ==
X-Gm-Gg: Acq92OFWK41cGH26NldsWIjwqrvTdaUMwzv8ESh488nbk7+p2G6ZHiY17EZNt1DF222
	xRHK0PXe05z4kcPPyWWyISXDk2ILC3TzmLFsomTaTAKGdnn9cX5VLH+3OSnPGoGpiSkr1j78C5n
	JUVvHkPaA0wtsZ0CMGsu3/Hkkq3FiRY0gUvwxa30374P2Yz82yGDql/c96aG7cpiKCrI7dml7cu
	Q1P503whsMxW4QhbgkegX0ojF9TQoRpXp2NprYeqf70Zf/d2INpNqJem29hYrxlVyk/S0l9p75+
	YCQDmZIiWDXMdh31yHjrknEGwmiPwnUY9+WGbsCCvPefjUsx1PPkUPGh5TEF6Z+xfBFeFOVg7Pl
	M4nYAeXZFCnAeiOdBe2TLiTLoZKaBLf9KdCln5IKvHkQFzJ2TKRwwkUX8PtquRLbj4qlPO8L6r4
	mdpvs=
X-Received: by 2002:a05:6102:6812:b0:631:4ad7:b365 with SMTP id ada2fe7eead31-6314ad7b6e5mr37442137.0.1778237844548;
        Fri, 08 May 2026 03:57:24 -0700 (PDT)
X-Received: by 2002:a05:6102:6812:b0:631:4ad7:b365 with SMTP id ada2fe7eead31-6314ad7b6e5mr37436137.0.1778237844149;
        Fri, 08 May 2026 03:57:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359db2sm65177566b.49.2026.05.08.03.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:57:23 -0700 (PDT)
Message-ID: <faeb57d4-5260-4d62-85c3-de51d6623195@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:57:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm6115: add venus device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
 <20260507-iris-sm6115-v1-3-0b082ad8eea8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-3-0b082ad8eea8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMyBTYWx0ZWRfXx8j/yV76OjW7
 RZgP4SoL+5aKG3iLn+kXoR0Ar7iq229nxgWhSrQ+L3hCPO7BFATe6KL3saOvxZfLxhP24VqlTjG
 3ug1AaEaow8MTNY5SkfD5cAnxb/RrtQeAcv/XULazNRzDuaIYVzLG74adJFXWs1HyjIRDFLdxzO
 AcXD69vI2J//W2hjnpUi7KZ8XxvtwTgPmdL+t49J43V3V/HdOGdOjhkw39OYtZU74btIiZOUmSP
 LV5bedr4fygdxJdnrDm/3XsGkSzn08o1E9nWwz5J4LJC2Kz3WfyYMZ7+GWpN5LFc+3+7qdnfsUc
 mKCd/CbZ4sDvl9JCCwvofeIku5wp+nIZuqiqOk7mVbO//4hTAKu8NQNFtJ/TUSLcB6051YaWLzW
 1jbU8xEn6H9MzDKJR7bvfLmO7+/SUvtt+IIAUdJOEAuUC+OP28Yl2yhd+BbzrcYP+cmFWvHsA9T
 OCev5ZjAxodprl3Z/UA==
X-Proofpoint-ORIG-GUID: m-d99sFMYsCStgtYbjfk5iuhouYE3T-S
X-Proofpoint-GUID: m-d99sFMYsCStgtYbjfk5iuhouYE3T-S
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fdc195 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=N9Plf5D_esIoL16y4e0A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080113
X-Rspamd-Queue-Id: A81E14F55D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-60916-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 9:08 AM, Dmitry Baryshkov wrote:
> Define the video en/decoding device present on the SM6115 platform. The
> core, AR50LT, is mostly compatible with the one present on the Agatti
> devices, so it uses qcom,qcm2290-venus as a fallback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

