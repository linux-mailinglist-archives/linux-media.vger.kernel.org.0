Return-Path: <linux-media+bounces-50505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4725D16EFE
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 08:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F29F3038982
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 07:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BEF369966;
	Tue, 13 Jan 2026 07:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEN96sZ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDia3WrE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD41270EC1
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 07:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768287686; cv=none; b=D+k2fivSXnIupjH+z8mHA4VFgGqGTedZjlXaz1FxueRBcBg4tWocDhnQCdqIa2QRfJoGjA7uIzzUQumWqnJ/CxvLy0nDgxP2QQHr+jR5Lc1Cep6UOpewN22AfpjE2UZ8i3enuqK2GT5NqvoFPWb64hNvOqHJYarb0AygzQzns8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768287686; c=relaxed/simple;
	bh=vH63IuFl8uiDHEz6sPtIIOnAcarfSJUDtushthPddfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QODkhl/eUY37E3B8VZ7R9bw7j/uC7Z89owlAMjHOj7AaAqi7B28DwYAnCT32HR5E/+t7XbF+tTiftptJo0ESIH5fUN47yEiuu/ZATIWEhPnwzER7RMWz+CH44YdR7Qrfabw/a9N0z0ugKE9fq+/5jazHpdevw6w5N/lWEEd9ODw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CEN96sZ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDia3WrE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D58xBo2834936
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 07:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aXQcprSbWpP06tY4WL8F1pW+wcqpnIIsT6KOlR0Y+MI=; b=CEN96sZ9q4LK+NU4
	3fdBg4MU70pW/aRBCX69oklZb/7PqX1n1y7h1ttPBNxO1/e2HrnaiBiXSHActBYb
	95ZrJ74hM3bqoP2pHVH/9/Hk9a9UY8OWiZX+EyYi5//dwEF7aTKtlbefkMgb1Yjz
	Tc+uxkwHGSsEDDdxgG9ltL9YpqBTo/DjFPadaI6/SP0GsbI4DWglmSWIY+Xc682c
	kBRWOtTq8IWH4afowA+wQtYIfvzhGYAFELjOM8QeGcYDCMu0yCFFl4vgu2iWOyGD
	giYUTkV3z2JHzaUqJxl91yyPIY+78Kif4klGz4g2L+WyyM4nHVTe+fLuUY9nYCjA
	led+Jg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfn9r9ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 07:01:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52af6855fso2470585a.1
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 23:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768287684; x=1768892484; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aXQcprSbWpP06tY4WL8F1pW+wcqpnIIsT6KOlR0Y+MI=;
        b=cDia3WrE7YSWMgVzdvEx4liUuEuOdodSdxmtdwrYxB98IHXLKuj7DXZCkH5HPtPEGR
         3PRSnmOBZjSNYSVSlspx5AHrU361Z/1sgAYO2B6K5djaFYKf0YLmah8Fq0ftYjZnxkm7
         YfITRN2eP6+etXtatFnU2vNFUk0yj5XyxAUS0I3OWdPbvlRlmYrqNEC68QNzzuatGkg1
         sIqZcn4ZS8KvmwGyciOn8tgit6qLNt4CbVPCiLk0PDQ+crt0o1k398DBKIiaSmv+pDvp
         tWNnP9B7nsLCJ7LgDqbYS/cO0MLACMUyObPBTULNijzUe0mYyESicO7SIvJl+4iiv7mD
         ubQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768287684; x=1768892484;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aXQcprSbWpP06tY4WL8F1pW+wcqpnIIsT6KOlR0Y+MI=;
        b=Va6/bDwXBf8z5xetHgEns8y8tYRBkbkdIfhtifArwe+cWZMe36wJOM6lMtjKCdA0YB
         KIYUUrWJzr8bQNnZMaittiTPvjkFfcJUZ7r3EPBUIT0cGSZSVuqascKdBAof7XgveiVB
         F/x6PiiwU5I3P/MDEy0vOn8s3BzNF/LffyZvyYmnK7sIaDYr8P3sWE+wcIom7WVpZj/9
         dhZwl6VJyzbd90fkvauJnq7OtqfZY4riv0LlZFMB/qzT5oj8Qd8fbUF7Eg3xkg67pwCB
         wnsHpVeM6xOTssr/TuIK/m5dIjISssQEmpNCCfnleNlFyAGHrm/z4pwkg1FTUyjGXOxq
         ANhw==
X-Forwarded-Encrypted: i=1; AJvYcCWpxZTH5W5V+rmk3jiVZa2tBjqTBci5IKWwDpDEyKzcIojVURcwiCgXGsjaltQlrPhz8vKWt/IXKCsM7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLsBWgEUm0HpcBEWzm/bHnV4dawkB5IxfMeHX95BO+nYXbvUH7
	bGs3M7pp7xbZFPn6Eny3NJ4X3fzYczqII9QpHH2T/S0RcXtRy/3VhqJoCbTVzHxu394byPT1BX1
	uIc6DPUtdQ8mYNkx19bSVH+brPRncHes724gJno9R1hKovZsThx9GDsf2hBnE5Ftz7Q==
X-Gm-Gg: AY/fxX6+cFs/rsT7q4vKFQfJSuWVizOFU96PjfHE1tHMf5Ld/Ts0J5S/RirlTLaHXpB
	cjN5YZJZbwuWhbunm5NM8dW5wt/ctLd6AcgWNQITnU0rIgvHR8Q2onYw/R3gqLC46QQ6HRVSUi0
	ubCV3nj5CGF1AZH1ZAWYxoR5B3GbkXNrYAdyTS++reHrVwHeJmsSCydhaBgJVLiZdmg4fqRT3Uo
	EBbhnAtpw6tAobbO7v1Tpab/4GTJydrPuP91KjgvOCfu2lDt7oEIMflr6de1xKmklhpAnjhI/tM
	/n6c2GpDjGXMXw4dqJFW2B5qqSJZ/a4XVi/0otPpktRBFbWEI0QU5ihZu83qVDQaHujmn91SxTR
	q+gO8RDTEAbZlUEaAF1jFaMZkPs8hEgzRN2vu0mjOszlQfldmkbgvnn2TTiRgBXLViNYHXaQ5Lg
	IdnzmJfKbbwGwMAHmfs1D5mC0=
X-Received: by 2002:a05:620a:3911:b0:8be:8e2a:3132 with SMTP id af79cd13be357-8c3893cd7f1mr2582006485a.58.1768287683563;
        Mon, 12 Jan 2026 23:01:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHViNFPRf43wJMq7N3oN0ERKUBYaBMdd3Ccd3RWzK174+8fpW+ZGUBifAcR49KhMTOaYzUIuQ==
X-Received: by 2002:a05:620a:3911:b0:8be:8e2a:3132 with SMTP id af79cd13be357-8c3893cd7f1mr2582001385a.58.1768287682940;
        Mon, 12 Jan 2026 23:01:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6fa7f0acsm4588036e87.99.2026.01.12.23.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 23:01:22 -0800 (PST)
Date: Tue, 13 Jan 2026 09:01:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] media: qcom: iris: encoder feature enhancements
 batch2
Message-ID: <4oegbpuzqdr2v7sdi6ojyejzs4pcstctkpllhswuymh5pek77c@yyodmmropodb>
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
 <e92d8c53-44b0-439a-bfaa-df16ad5d4934@linaro.org>
 <258e30fe-7b23-47a4-b3c8-a38227fccdfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <258e30fe-7b23-47a4-b3c8-a38227fccdfd@oss.qualcomm.com>
X-Proofpoint-GUID: _p_jOnm_LUZwFCtNPKNwkF3aAh6vrnCn
X-Proofpoint-ORIG-GUID: _p_jOnm_LUZwFCtNPKNwkF3aAh6vrnCn
X-Authority-Analysis: v=2.4 cv=HN/O14tv c=1 sm=1 tr=0 ts=6965edc4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=MxFkaXIYAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Vlw9s6kSZOytnfEpRPkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=bWa-HqqoEbs8MZQ2NTq-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA1NyBTYWx0ZWRfX3As1Xg73hLVz
 tt+DU+0jSywJgeyo0LFgrcvEUfNIB/g0ik1NizEo3uRsRY92feFVjj0vl05xJtDYGNVIH/DgF+y
 T/h955ayOGI08VifM8WNX1rL2kUp9NvHQwoRFHD9Xxkohqtw6HE6Ge2peMvrYcplZbf49hv2sIA
 tObIBbkoV+EzPrEhQp3Ee6F2FHEMRvdU6ULDmq0e8n5rfWENcgLZAfIWbWhK8z6fkUEHX8h0aqq
 SGpY3Q87BKkRlS9RfLtVHRc7hT8RQFCKVc+Z7w6tWcftX2LvxtS7FpQqKwcuMGE/bPdlg3VNDsD
 cYIxU97HCBG395srl/rz/1kxU3XKyPufL2D8fH3E/QcO1zR/b8ktgVQU7s35bR8XHxSyXfHZcmP
 8sQkfTLl1dg8d3RA4gfBg/1+oMpeYtQeJivvjyuLPmgDLUPCiBhqTS3Msv0WtiTHnJGM61w2Aod
 su/MIfPSDynO31ZGSDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130057

On Tue, Jan 13, 2026 at 02:29:53PM +0800, Wangao Wang wrote:
> 
> 
> On 2026/1/9 23:02, Neil Armstrong wrote:
> > 
> > With the following reverted:
> > 456c99da41cb ("media: iris: Add support for QC08C format for encoder")
> > causing this: https://pasteboard.co/t8HmeNaIFMDR.png
> > 
> > Nevertheless, the changes are functional and output are visually
> > coherent with the parameters, so:
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> > 
> > Thanks,
> > Neil
> 
> Thank you for helping with testing on SM8650. Did you revert commit
> 456c99da41cb because v4l2-ctl couldn’t run properly? There’s a change in
> v4l2-ctl that needs to be applied, please check.
> 
> https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u

If the kernel changes break userspace, then it is a regression on the
kernel side, which needs to be fixed there. You can't demand all users
to update userspace apps when performing kernel changes.

-- 
With best wishes
Dmitry

