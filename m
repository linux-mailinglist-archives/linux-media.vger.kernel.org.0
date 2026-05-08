Return-Path: <linux-media+bounces-60958-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONmdD8U2/mkroAAAu9opvQ
	(envelope-from <linux-media+bounces-60958-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:17:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE0B4FB041
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B96830534F8
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 19:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47CC3D9DA7;
	Fri,  8 May 2026 19:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiWGhKT3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BAgfwcTx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AF532D7F8
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778267804; cv=none; b=iCemzwiJ9lYFWNO7FMDdtNhGHa/0O+TJ7gkyiy0+gTbj1X0IOwOP+DjVSvoo4XiOOSFGjfOfPJ7/054iVo9rQ5Ph1AVbAp+Q1gahoolg/+FlBl5N3SoRs724NK7ARWtFSitB5Bf9Z15UZt/0Ai2WqlUJ8C0U6WBSvD4A8HT3bqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778267804; c=relaxed/simple;
	bh=GqrSSFG+g75ZfR09SPDvsyRCtlFsE5haXopDyurtwfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGrOpwCN2lkrT+nle8ztRc7SGtQp9G/Q9cp3QhXMKI6xZc9G92yOIPu7lP3WGVIKEP68rTs81YW7KpmCdifdRcAycPUoR6fgPLheqlvVRogLYLdc/lgaV6NSMVyHvG0oxkCieMgkivTwoGX5naaTZMPzlbIrD9jaa1nLhSbu21s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FiWGhKT3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BAgfwcTx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648GTeZv145187
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 19:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0S/MaBMiXgPLIl8xMXZreOhp
	tTdxir8IQpeWuhySA38=; b=FiWGhKT316va8LDXkb4dzlF+N1sHDUFf2/kUE5pu
	ORAY3pIpzA9b/swU83iCS8Tn47OwEGnuz4J3PiM5VEJgn/PsqR537zjWMiWtAN3Q
	PAW+IvJ6H9IRAmMPxm0hzPddoHC6wHteJDnKesYGOIc2/nxs2Uw9lMchBNr28HDJ
	7NCxHDgIndXeTW5KYX1++n/jOtxdAilkH2qK747cq/Fms5FmRM+ZtFm4CMJsJF3n
	D028s57sh5cDECU3NoWOHP01b4nSnHvE7eHD4EXcMIDob/7chcrZEax3/oUjKJg9
	FXPii95Z/XKIayq6AU0ozH8cFd8h5IjxcErddyqEPkeJMw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1kdc0jf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 19:16:42 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-42c24b59b37so2675486fac.2
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778267801; x=1778872601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0S/MaBMiXgPLIl8xMXZreOhptTdxir8IQpeWuhySA38=;
        b=BAgfwcTxFSzzMxePDyCcyLFUy7rAkWTeav5MqdxsFK1LlicdkFB+owmTRz7c3md0X+
         3vz1SeGKroNFQfiabhBI2g9ap5o86BQ1mwzEzhJna1znbREYZKC5cNUxVF0JkTU7awwk
         jp76i9Di/j5rxRDg8kvwAeMUZAKT1YHxOnFdNrLMBniaAj90LNaM35n8eNKr81Etdv8M
         2sxLyAEXwZ9/Ncvi7xtm/UkrdzbxL/Sh6bkXbl9g86Qk/Ve/BNtkflG++5321wWjOi17
         vnL3VogR3SICBRzrLQHV0RQdkWVMByz9ssHSmTsEr0zmUNZkZS3freOWm0I7qOiQDiPU
         fGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778267801; x=1778872601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0S/MaBMiXgPLIl8xMXZreOhptTdxir8IQpeWuhySA38=;
        b=HQOLt/zDIR4QbwcdRWB7RxMAIDLvALkxVlhHE4DUdh5IIwjpgecDLcXniodpQTolhK
         m3dwBOLHV5BpV9rN7JVeRV3ObBG4pbtgZ5infMagNqhsypgs1YZNIywVrRFeP/iAI/ES
         sJ0bEWaUHBEZP6fGfK0itoZGKmz/ubXoazzQt3QO7+/DV/PldfbS20F3oVmgx+qv3sRl
         JTezKumV+Y90f0vVQoM5dNdOHwXV3ZCug6Wntld1RscJWkYrax7+mOlwHLI0Cq2FCNhN
         vbleZ1/iLWTiCX6HWfNQc7fJDaVXSraPqxv///u7vDdA5qMozjy3Vwe/kuee/7W6lYqA
         mboQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fQeyJUvpsYGBiR7xZFJwJ/0+ZLMSr0xdTTgFE0FRj0uf+NB8tn1zY5ZgQV7Vb85TYHRxBMnBdLzn9YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YziobBs2Qrr3/wJhedl58WqRsrhLS6rPuWnmLM5fBH5UQXP13ah
	BMJw6cuqgvA8EynszFmZBgaH7m+ib13NNngG0oVKCrfWjEbd0Abj/4Q4sz/4IosjrvgXBzZdW8e
	eOpnN6YOhh0vSpMjKG3qL/eZBKle5uKDRWT972kyueBZM+izk+Zz3XQ+vC5+UMvOOaA==
X-Gm-Gg: AeBDies7gAKGTAiokzN8Lv5Qc1TQdCqDS51fCsGKFlU6psyxIz7J3I1j8HnqYwuRItv
	16WRpC0ZWA6SRMT6xndLEFum+k82o51OiCXSwJY0NwF/qnzGw4iLpOJ56LxG3FovqF/7m0br9cB
	wyegKzKR0R3gf4B135AomLufsyWntnKMDJBELcMlpVqjFROdQsLYKcgJOLiytjy26Xr0a3pUbkM
	Z7FjsSgJoex7qlF81BZAmnWZH7r6KSqVlqBfW1CM2H+qtH3F+fPWqoVe2yj4Rj4VMKLghdwbveR
	D99FJUJxA+2aAmGdaBZI999jsftSOZOT439veIsVTVT8mrNu9YKwRWjcSB83h2YG0se65lmzXpC
	PZcNydu1cIGEmncVjpykOca8dYDkbYTZRWuD3bonXv99CzndQFyGx4UHZxsCRPIJd/bFFFFbYem
	JGC5whnUzXTRvcT1Oyq3y6s2IeFeKrjweRvpw=
X-Received: by 2002:a4a:e914:0:b0:696:1291:fb29 with SMTP id 006d021491bc7-69998cbe145mr7809085eaf.24.1778267801556;
        Fri, 08 May 2026 12:16:41 -0700 (PDT)
X-Received: by 2002:a4a:e914:0:b0:696:1291:fb29 with SMTP id 006d021491bc7-69998cbe145mr7809069eaf.24.1778267801163;
        Fri, 08 May 2026 12:16:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951552dsm727066e87.6.2026.05.08.12.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:16:39 -0700 (PDT)
Date: Fri, 8 May 2026 22:16:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 02/14] iommu: Add iris-vpu-bus to iommu_buses
Message-ID: <ewu4nbig32tl67xwghulsnyotlxezkkbx4uystuky4xe74rpud@xblm7twcvhxf>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-2-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-2-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MiBTYWx0ZWRfX74vJkeuPyHZK
 HqpBcmqyvEW1+QYiPSduRrw4kM+tpPEIhqYAhhWuTrC68Y6FPdZUjN50FakV6u/WkztuiFxWu2b
 +SPBDhKus9OB5C3sMwSZl0IKYf9oWLGWiganFyeD/pTgX+hUpTx+yGiVc9CNO4TBHFObNrH2roE
 85iE/iSwMXd/ikRsZkTJqnRbKU46URR5vuUT0jlqcTGO7o+jGjytYkortWjk0OJwr6rf2atZygC
 ubIx+To1KU3AQ67X4dVNJpAMjeP3eFyir1eeZhdN7X5/kU99dIkugbRjsXPXdgQ71TJyW/76GnW
 Xu/G/ZBC3gf7Sd3DhH6G9XV9mE9pXxE9rfOzzPDKuHms6Xvw1rolLNOLax2PpLE0huh9W4Gep31
 /YgAb7spwsumJnit4jDzEEXpOq686EaBwWz5OCIu6BEXaMr3MN5LKIgBXBXAEWGHEHAAEnD+qVC
 GE/ARb491EQlET0cJww==
X-Authority-Analysis: v=2.4 cv=RZOgzVtv c=1 sm=1 tr=0 ts=69fe369a cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0ofZ2ib08pOWvdXbZkUA:9 a=CjuIK1q_8ugA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: TbUnH0FoDwaj1SjwE8bT--JEwREv-GcB
X-Proofpoint-ORIG-GUID: TbUnH0FoDwaj1SjwE8bT--JEwREv-GcB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080192
X-Rspamd-Queue-Id: CFE0B4FB041
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60958-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 12:29:51AM +0530, Vishnu Reddy wrote:
> From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> Add iris-vpu-bus to iommu_buses[] to register the bus notifier callbacks
> for device add and removal events. This ensures that when a device is
> registered on iris-vpu-bus, the notifier triggers dma_configure(),
> which sets up the IOMMU context for that device.
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/iommu/iommu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

