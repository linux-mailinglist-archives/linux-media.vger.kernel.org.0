Return-Path: <linux-media+bounces-30921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FA0A9A795
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 11:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D4331B82384
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 09:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF4921D591;
	Thu, 24 Apr 2025 09:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBk/5ikW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEEC2101AE
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 09:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486510; cv=none; b=l+sTMJiDHoLDY5RABpQqmlsteOoK8alk/6nejfojVY8LZzut3RUksqt6zF7pzgarGRGmcL2h1CeM0JbyIy0SrUOsqaclt7uJjc31JkU7RZBiZC/zHH8NfFyr9lCkQ3dhG8vB7jIee7wGQ73mndwwFYH2o7JBnv9XFszwTbtObE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486510; c=relaxed/simple;
	bh=cJTS4h8qLRojZ8VoSi+xz4ukVm/2Bvkl9jt6qESf3Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyxOJTl/LyWvcDRQFo6YWhZ3tAcyUU8kB52cqNXP4yKP0vAvGeIx2VBDaSyr/3Pn9lIV4a3H/QVjEzt43iBaXFg7Q9TecLencAGb2Jrn4ktf+WI1DlvUh5WVtcIL5XZ2DtviflWTasLxHyBMEUi+VZuOtX7nK3kjTRUbe/D4l9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBk/5ikW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F66f013213
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 09:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xzXZ2sQZ0fuZC4M7pch+4US5
	mpXlHFEAEEK/BeG4woY=; b=NBk/5ikWsUbRruaW8hiPfj4m+a9fZ6SzN/fElfwe
	Ec8BluSgDCCkI1QL+6AfmIAqNtwQPKyhSCW8invga/jUYvcUn9730UD0jZg/3lyD
	Gp7OizFulM8Uy1RRQ/jPHyof8Hs9oUSZb1gVVA51uLFOW4nKzlnmbL1IUbaM2taw
	HqGqnh1N+4QUh2Olp84IgcbG+4pev/stgW0lp0cJFerVPcoBXxduxxgPWrQM8okJ
	/kV+UyMaPUYKeycLls/bxvnD90DM8xrVCbHplyO7cHyT487Da1KvqTtfbu6If5rw
	Dh8ZTswTSxNWPj7nX41In/vXiE8Ag3Vr4wYmUVfezTV5Dw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2cy7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 09:21:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so167523185a.1
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 02:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745486506; x=1746091306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzXZ2sQZ0fuZC4M7pch+4US5mpXlHFEAEEK/BeG4woY=;
        b=Pe+1bKCPR9BryRiOl+6ziv0TvdT25XnjmrL0NTCiO7QSAUdd/aTxXft/3eCa4UOD1F
         nDumAoZv3iIFw4+ym/mElceWjvaiyfqv75sBFJrfsmYmM9xYLnxCs1W3ArVayhcIh6BG
         GLw/1yYxDpDn33J++ywYGaC3aOQDAA4tTweN0jB/NDsRPAV0TEJsaBOrxa3n48Cq33h0
         /V+xQtArd24O2SEkTxwvoJNulwm9BIHu3wtpDNhLoDkKLooIBE87KTEHtroNt4yVkhjq
         SlizHdaLOIJIsEWOciMOJEWkOKw6OMZLu1okVxwXyQDi7XeqSJZexIWlLQRttb8tUhuc
         ajpg==
X-Forwarded-Encrypted: i=1; AJvYcCX8zaY+yFByfgC/TAWX6x9V2bLDbkFtPc134KfBreGpWdTB3VcNHw+YeUz6gjNCqVIcrQt7y8AAzPPpqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztQJZQ9tQM3wi2F9AP8UIrhVOO9ziD/kDBgZ8feUNGgsuuQ8Id
	jC+7AAsZWoIudq1GxFP/WIXXxXUqAvMh6j7FbRc/ZHQ+yQN4xeFqouFEodLdEFn2elYseV34mRi
	O3xYnvZpSLn4pW2eF9eHuy6HKOX03+kAVYOSuCnmWLNp3shQGeMpGbCD6ft6Y1Q==
X-Gm-Gg: ASbGnctuGD6ivJcZYPwH6ecKZYEQ+UwHBCAEQ1GT4QH0SiwKy7AsirCi5tTPR06PdUr
	t2yjs1reZ+j9///KHnEDWX7TlveLm3HJEQ0rdc2s38Yu1VmLCCnr0G2Xl3DVyOPcmFqh2d6YKi/
	4C82dv5KSU+RWdLQrkFFiw9G/HgIsF9r4WT4BDZoI9JisnGjuu/7hkJtOx++IYPloVC/nJmAURC
	V3Lz+Fnt4UZOgcbZ+Cc0rfy/h4TqHuacjuaflkKFfo79iD0kZNbaHqqfgxXP/e/3kF8ghAfKuc+
	r0P4AxsbZu8xDr4OTdL5GJh6U0eR7ca4wrLLtIMoYFCWV/5NWqhw3zYwZOGRDmmXqDuKdi+Rbss
	=
X-Received: by 2002:a05:620a:1929:b0:7c5:3c0a:ab78 with SMTP id af79cd13be357-7c956ea73aamr256991085a.14.1745486506321;
        Thu, 24 Apr 2025 02:21:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7mFBXzRRSv9QJD9iHy+ibiIGa9pagdqpuIXwRTp5W2woKy22E/vHZGvaQczZ+I70l+2H9+Q==
X-Received: by 2002:a05:620a:1929:b0:7c5:3c0a:ab78 with SMTP id af79cd13be357-7c956ea73aamr256988685a.14.1745486506008;
        Thu, 24 Apr 2025 02:21:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb262e1sm163072e87.34.2025.04.24.02.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:21:45 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:21:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: add support for video
 node
Message-ID: <47dtgkfqcpalixg36vxcurkmh5z52kdp7rbcvwl56wsyjsisdo@ylmmrvwde4nz>
References: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
 <20250424-qcs8300_iris-v5-4-f118f505c300@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-qcs8300_iris-v5-4-f118f505c300@quicinc.com>
X-Proofpoint-GUID: AZd9F5wnUIjQYsoGnI7s0fh8h1pQiLVT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MiBTYWx0ZWRfX+Q12m2OvXp3n NG6O3oTNaVg2AubxMxloVACdD/qtCJLVjhRkSIDRzdIbfDv63X1i4JuQCycUpwvlpw0S9YRVt8/ 79hGBIQnBiPKRGFcd17UEMBDN2l7X7FEW7ub3YYSfn/+BGOs1nHn14NHsMmmp30TXYr4e3PyM90
 2Bbtm99tz5AuYVqLyhHmRZpoG3a2ARqA0WbS1E6uIrJO1jnVaAC3c3X2ePm+eA36hRNgv3VIRAU KmEdepfyoG9JfyY4NZjpkdc/SrNbv/nlk78TYdHQTsRlqZIQohI4Gj9QfI99/WVD0VwThoNPdMd Q/wwFaSTypPr+Ox8u9EDr3yx8FIU6JPQChSS3+oWmRUJgaTol5PZVjnSouLwyG/olUIn7DQwAZk
 pgHSWC1kFWiT9wA86YrMsWydNpUX+Rluk73R7ijjNVlkEowiR+Anf9A+zeD68BVXIETKkE0p
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680a02ab cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=7jjsK61l1hG7xBlPe1EA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: AZd9F5wnUIjQYsoGnI7s0fh8h1pQiLVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=809 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240062

On Thu, Apr 24, 2025 at 02:20:48PM +0530, Vikash Garodia wrote:
> Add the IRIS video-codec node on QCS8300.

Nit: you can not "add support for the video node". You can either add
video node or add support for video en/decoding.

> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 71 +++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 

-- 
With best wishes
Dmitry

