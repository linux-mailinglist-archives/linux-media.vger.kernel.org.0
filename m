Return-Path: <linux-media+bounces-61463-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIzUAnWaBGqILwIAu9opvQ
	(envelope-from <linux-media+bounces-61463-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 17:36:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B779536423
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 17:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 779C031BA1AE
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E4946AF24;
	Wed, 13 May 2026 14:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YET3eFyc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AwBrdh6u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8B94534B9
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683478; cv=none; b=CLaseUu9bQTICRNdR9UKm3D4BbhgAy0SYIggEzux2LcBeDWacF2zgBXgU6dIJtOM/IWLgE/CN1eYk+qcNtHijzDSe1tIoSfWUrkvgrTcBkqsXRSXF6FPcf8hFXdAZNaCatbssM5ZHLQ4iOcPXmjdtNZX5vzbCKwYtkGl5QHnExU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683478; c=relaxed/simple;
	bh=5/o3fOjA925+2aR0LfY+xcd4wMWyZg4/UestgLqRho4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmlspleSNRE6ah6EH9wRTi+bD19+5S67tmRw1oDJfmXyG5PagABqWOo51lqlkkxoz3lTMEev+3YGkPqXt5L4SQWb9WE43QobO++UXSFXk+jOELtDADjc9U5vGCAAaZwdLdQ3Om6zjfNj05LkJLuFO7OhY5TSsOP1+mf/M4GuU3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YET3eFyc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AwBrdh6u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DArnp21393027
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4RrmG07hzLVuJFz0XsuE9L/j
	GG6n2U+1RQiGpla++ko=; b=YET3eFyc9L9J+iBmLq0wtWQs9NyTP+jQi2cMCuoN
	OvdLsmAQ7NNFbJ55L9FZD1wkSV4QQZv3TdvqCXaCB4NO45owBFDkWDWk3g1e8H+W
	zvzrLZA9Iy9UQt25VQHYdXMMdwdgPTes1oZAob6Z2xHRnTTgfiKFsPiIy5goVeXj
	iJJHoEsYpKHaQzMDUFinqR5AlPE5NagYJYxAtiOSHCA2XGjK2nVojqBd9+mwTk+J
	0/qfqphVsPmY2Y2UicXi6am+UViKo0y4D5vg84BX8dnNLwgoUfGUCdKevP0tk+Gh
	pCmbe0K+uYwmkZmwA/vmdao61tb8tO6wQUd5pUO9a+4IUw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k2625x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:44:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6343b1bcbe8so2457439137.3
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 07:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778683469; x=1779288269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4RrmG07hzLVuJFz0XsuE9L/jGG6n2U+1RQiGpla++ko=;
        b=AwBrdh6ugoatLqYmoAQ11C3WLGqL1Gsc7khk8apB6mjLpq7ffDC9Dsr26Z835gvfi0
         QNk1GqB8qjrrzTvOSrSqb3sBqylEpyCJGZTYPMJWf1BXD1o8UuKo7eokL0CY6UpiBk+Z
         l9/eGAjSLck+X29fVQYyXYZ2JPOMowDtza5kglC7RDPGUUEUJVRULsMLGoR0gRxc4e/n
         3qSiiOOBONKi86jvV3WUw6+IZ+UCJLVIvO+Kep0MAG4gi9wxzRwTG82zIIxjJ/4HSxN9
         8eEsTBdRzX1GAOcFnxFHvNf2Om2LHIPMbz2HnSzkjJEQpJLvkmfnLIR/j+YflKqHWIVl
         fDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683469; x=1779288269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RrmG07hzLVuJFz0XsuE9L/jGG6n2U+1RQiGpla++ko=;
        b=aOF5StjddAHWrPlr5G3oS41xpCOQ0nCeIiTAHm8dApvVnhmLzkfMOJNWW6KRj69fpA
         QovnCIQef5Tyw1f3TPfK1fMn5NoZtrqpg3SlS+7GOLbsMK4S+q9g6wJG+W6/01HK/wa7
         Gqw9Ki9PdnN56j2L8Yv/BAoiaz+NSimIxlEOtRFD2URJGYqd1uj1BDNThcRFLemu6XUc
         Ej0r4egB0xBzOv+/f6S76SxF6Xbqxi/lqN7LwEVRuxjlXkWEya6WdsYWbYERkNnRDMGW
         W64MLfQHkCjaF47reCV1yLqQsAgLcsx3u4WPmBEukdCEX7j8ZS2CMtppzt2GI3jPeTGR
         Scag==
X-Forwarded-Encrypted: i=1; AFNElJ+goCVH8NAnm0TquT6GtxgYIr4bXKwehELfanE4XpYOH30+pN+xjnxAZBUCU+ruGTHRmYmM6ZJEyI05yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7e4Era3SM2z4/JXZoL+BJE/fwvw0/kGYjmVTjeHMed9aMSQLs
	mPbmKpvnlbMT3gV6ZwjKLLX3Gl/8nsZl3xL54Kir/Ib9XgdfVKXeRiODFhijVBzNBoZHMX05f/z
	ijV6YkZPDpitkR6OeW50Iruw/iaJ2UJMPks4DwpL3fm8K4o+JHlCOrGmlAIv4G/xA1g==
X-Gm-Gg: Acq92OHNbnlC26+ianUhyfcUC9P5gVv0Hf5j+2er688pokbMz8jki39eOl6eKJzGswU
	YAhFoTWP2HaufQRw2dRD94kr9D0cVaErDl4lyxMOcwCi8yYva6MKT6qtFxCnj6Y3v3g/XbjhLuu
	0S95xFUY34a6pmXUiAN4Ad9Mcdh8mT2ANmTdlXvC6yp9z4BXNURzio46B+b6eyxYOjTdRJ+MLU2
	Qe5f+6ZawdQB69sfS1e4XLfk4fALY3TOswiOldzOEqE+H+HQ5uhVzbCEMTL3oHdq26b/4EaryHA
	Vaa1YCKfK2s8054c59hXnnp4zVvEIYRtV27hVhJM5BhIZIjQel5+mFsAutcZUyPCZ64OAc80+jV
	F+ysSf8cOwZX/XQV7qBMOFFodfdSQ+EXhgVnvRyImEBadRKTQaiyCKqzBYcepGze8XE/YtHuSO7
	O2IAwBFcG8b5FStwCNKFFFFE3Qf80qlIiT9ho=
X-Received: by 2002:a05:6102:4a94:b0:633:bc46:c20a with SMTP id ada2fe7eead31-63775911524mr2035433137.31.1778683469401;
        Wed, 13 May 2026 07:44:29 -0700 (PDT)
X-Received: by 2002:a05:6102:4a94:b0:633:bc46:c20a with SMTP id ada2fe7eead31-63775911524mr2035390137.31.1778683468669;
        Wed, 13 May 2026 07:44:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c6f78bd7sm2578927e87.74.2026.05.13.07.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:44:27 -0700 (PDT)
Date: Wed, 13 May 2026 17:44:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/16] media: iris: Add AR50LT core support and enable
 Agatti platform
Message-ID: <xxjntsesqwz3kforkk3hzet7fevmkcmg6mivae3n3xrco3jqpm@yu76qknvtxpc>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
 <08d40bf1-2bde-4184-8792-40342112f3d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08d40bf1-2bde-4184-8792-40342112f3d0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a048e4e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=BwEK3Y93O76JwbGyEuUA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1MSBTYWx0ZWRfX/WrYXpUQdw2v
 gLajyz3E2buvjAwANn5ns8NQAEK0MiomB6mmuyz5NxaT4iQdYLbo6UbWqRwGWAdu7HhsSpboYaF
 oU6crOO44zygl9tBUqfzGjq9VkKjVQw18WksmtC8mhEvVTOC/YCleHe99DaetJ1nBDePNpRoiou
 6o2kHDhWco9+h0uN4OtHJjTOu0+ZnkyykmpX/fpBR8gCWtlbO4Db8tbMCZfsJKaRdCHOFfua98r
 lpaigqqR+MNRSrh5M2Y7q18FAPuLHfb+8X9zRK8j6qETSvYHsIjaEsEpYNZEm5H/a2zQagwX+/q
 +UmbX64opH3rtJC5X5rAHtxmEtUAl5C0HhZA3Jbsh5D64gk5EAS2jmU8qyVi17V32Q8W4dyF3oA
 zW/dGFrtV3Z0jV1KuhD5pCFumLoVIPiwES0WjhAf8/DWSqQt7N1rFwlJnm0dqV2ZZ2ZFNrYKLp1
 WMQBgFQNwJlgoQGqotA==
X-Proofpoint-ORIG-GUID: 2buzzqf8eAmJKHaYV2B-8haGOYwwJQHu
X-Proofpoint-GUID: 2buzzqf8eAmJKHaYV2B-8haGOYwwJQHu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130151
X-Rspamd-Queue-Id: 6B779536423
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61463-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 04:34:11PM +0200, Konrad Dybcio wrote:
> On 5/13/26 2:45 PM, Dmitry Baryshkov wrote:
> > This series adds support for the AR50Lt VPU core to the iris driver and
> > enables the Agatti SoC to use Gen2 firmware and HFI.
> 
> [...]
> 
> > base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> > change-id: 20260507-iris-ar50lt-06228469aa5b
> > prerequisite-message-id: 20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com
> 
> There's 6289 prerequisites listed in this cover letter (probably a record)

ROFL. It seems I forgot to change the base-commit. It's
media-committers/next + Kodiak-Gen2 patches.

> 
> Konrad

-- 
With best wishes
Dmitry

