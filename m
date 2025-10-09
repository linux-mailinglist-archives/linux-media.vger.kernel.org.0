Return-Path: <linux-media+bounces-44103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F74BC999B
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 16:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A6704FA2C0
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 14:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1682EB5C9;
	Thu,  9 Oct 2025 14:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dKamZcO1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0342EAB85
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 14:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021120; cv=none; b=oHmOmLvys7PeYqvywc9eBLJdE6KT1d/dpPrfz/7CdleiQf3f8lw7iVLL908x3/GHwbcdXTGeef9mEb4DFm8BjiAFCAgdnFHMXeWc6HpFkm0irx4t/ovLIkfZlUzDmrbtS+3sRNAYQqHG25oQ8TnoxmFPhyA8C/O9uCWrsu9zCFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021120; c=relaxed/simple;
	bh=Wpq6X2Bh4pWgoixvchHMpCayL0dRsdmKyfhfouSikNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYTPmjedQdsytsZmXmkbLwizjwi4aOyrlrUXsBwPBRMRHQ847PkHSIoxkHgQjXubdRhCLuikCH/34mA8VbPxGw4umVrtLuTo1OtAQ+uMBvJP9yY6HeNCm3Si3oE+Wpa3MW4IYOqeiKjq8iktM8JFKSpOqyQh0lpUrXn7b4tD59w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dKamZcO1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EHT4029247
	for <linux-media@vger.kernel.org>; Thu, 9 Oct 2025 14:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zS0WtM/F0U5NDqRQEtXZLsZ8
	HXMsmD9R/IgnETcvlU8=; b=dKamZcO1PgD1eBG2bOoP2bTgvej76gs+GV39sjRY
	D/FMLr8lm5c5vEAmGFHfpPSHsQWxWYpj1RI2m4pYgU4nx+k+eZ8SNm+GyGQRY2MN
	S4oa3FBi7sWMvwuZGPmqBDZInsNgeIi08TCi8uuPz7YKvXCtET3K/PTNmPAA0kno
	OHUyElwGsdJoKt0tq+VOEf3dVtEc2Uuwwfq+c8uBwOcWgf+w69AQWXHadET1m5yv
	+NgioEwbFLzZQYvPu+TpNgcSMkEmCVnZtRHE1fmk+paRKFnce/qean2E9nuLA2D3
	vqZIP6cPxSsAZmCGTSvdUOKNy2y8BixFCdHTVpcnltcsAw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nk7hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 14:45:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-879e66b788bso59109366d6.2
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 07:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760021113; x=1760625913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zS0WtM/F0U5NDqRQEtXZLsZ8HXMsmD9R/IgnETcvlU8=;
        b=JQevvIbb70mpFbl62ZyUm5ZBYO6kIgL7jOhyAAEfVn4e2taqDSwrOdvtKGOBOo7BbQ
         MomhyuSQqZScUVvFbyEUODCA0vZ9FbXw4NQZ3tFEfrWCDwPpFC9KHP+dHOcJ5j7DlZ2q
         eoaYBvB2NsnLx3JCJxAx5RAq7vEsyq5fb2ujdJMPmURvBzGsoRazCLgDVfiL1EyBI1rh
         2hEQYVMlC1e6w6Ce02RpHTvYZjc6rQSsTqGf+kPcIh4O/d3A8A3mTuiRM6LM9MQLTn5Z
         BS/OlmHlatTDlKvorhyyrWoYJdTKJ6aQG8B4gnfgTglzSLc6lUwrgsry9MiLEGQXrEO9
         FyWg==
X-Forwarded-Encrypted: i=1; AJvYcCXsTR58Zrbw7YK45jTu9Obviz6q/77BY9FbMqIJAws1pEM9TQUWEE26jlfHC2X1CFOmvlvPS+Xx//ziug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzPmQUlKY3diTWRHPtrGpl3dH4cUL7LdfqFEva6598Zbja0eUR
	1X4clbMuT+WZxEtUO8H+KRHsuFSfIhSJJ4qmZAfD6ZFHX/55jXqMUAVdnghx8FGV+BN4Aix9it2
	0EK6ZEfUwa20xDWC+/MwCM8GKGjQ7nwY38MkijeMpT+XRYFtgq96Z56cvgmhgdoC8XAg1zA4drQ
	==
X-Gm-Gg: ASbGncsYnTZ5Rbedr0Z3+RPJrkEpzbiJsJV5MeAbHRGWKcUYy9CI/OYJeOL5h5YsaGr
	aRDO5/1f1hCkHK6R6ek+CHtVPnCvCRIPZmza4moBBmEWaEn8ryOoN/FNhu6vEEK5JTvbSTHSqeR
	bXgEdofraZeEB7y+wQTtjiOz5X4vDcz6fvGoOpOq7R4VLCe/39o+PxsOa/bxnHMXUMF/FtdyA/1
	1UCnXsOuXonYfPiEfmubcKHZd5+4ytj0LoZniIxNqgi5u+d9nGi0KhL/ylfxfvFvJRbFfsc/IrC
	vC06PwM4Iyk7k6smyZoAyO1di4nZLtEFndDuXrRkG9GiUWLceAQFLAJdrbXCV9+GMD0pO6pvR0i
	7PKdNREA242CKZkQiSs6FZXRuTqRCxgM8zQwgpt9GI6tO2j+LkJSRq+keSw==
X-Received: by 2002:a05:622a:114c:b0:4e6:d0e3:ac8b with SMTP id d75a77b69052e-4e6eacdb2b9mr121918341cf.3.1760021113326;
        Thu, 09 Oct 2025 07:45:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHExsw3wuCbhIUXYsG7UAJJhdf1NCRTGbXdHExJaMXOVTC3+o0DKeg0yWshy0/W0pdkUoQVvw==
X-Received: by 2002:a05:622a:114c:b0:4e6:d0e3:ac8b with SMTP id d75a77b69052e-4e6eacdb2b9mr121917961cf.3.1760021112870;
        Thu, 09 Oct 2025 07:45:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907aeb40bcsm1095761e87.121.2025.10.09.07.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:45:10 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:45:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] media: iris: turn platform caps into constants
Message-ID: <cwpv42re6a6o7lk4jqetuwfbtnr65fuwcl5hcbldaxls7xj5e3@tkdngtx6mh6l>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-1-def050ba5e1f@oss.qualcomm.com>
 <206dad42-7a7e-5293-55a0-d6d5bc702c07@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <206dad42-7a7e-5293-55a0-d6d5bc702c07@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX9fqYlMCBCwu0
 WDZDfTb4aiU8NpolwO8a20j7UdtoocHIFXabKAaoeSIHB37uqdh5C6dv7fRT1uETofxr0h5Uvlz
 A5d0C1RREj1WWrGZQ9tySVp/+r30luFKEwWihNHwXAzYqog3EkdBfVMIuFkOt0nJXIceRdfaYc9
 vr+NgI7kwoPkSdQjN4+QFFFFXp7xi7IyEAs10Ns4+ZJv5lSNr2sq6spK+eFhMpuetf0AgGEcjvW
 H/Y22m+HCCMidwYSxHyycmS8iYvFEiwsdHZyOFQjiAy/PiwJf80wqwzQQQSoJOfnX7sgE2bagxb
 zaf6mwXvdeWUeVtpmEYZXCPcfdiJgS9E4FBcxoKGx1JjsUlYvGFzd2VWabui+nziCKqWRtb/UNr
 VdgqI/sQG+Iv8UJJSjRbGknJH7UjKg==
X-Proofpoint-ORIG-GUID: YsKFC44V8YlHY-Mflv2InfKGSUdk3vCV
X-Proofpoint-GUID: YsKFC44V8YlHY-Mflv2InfKGSUdk3vCV
X-Authority-Analysis: v=2.4 cv=VK3QXtPX c=1 sm=1 tr=0 ts=68e7ca7e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=kPCPtfcKM0uLTnIstR8A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 11:38:54AM +0530, Dikshita Agarwal wrote:
> 
> On 10/8/2025 10:02 AM, Dmitry Baryshkov wrote:
> > Make all struct platform_inst_fw_cap instances constant, they are not
> > modified at runtime.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >  
> > -static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
> > +static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
> >  	{
> >  		.cap_id = STAGE,
> >  		.min = STAGE_1,
> > 
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Please trim the messages you reply to. There is little point in
scrolling the whole patch (looking for comments) to find the R-B at the
end.

-- 
With best wishes
Dmitry

