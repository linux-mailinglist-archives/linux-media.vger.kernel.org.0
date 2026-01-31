Return-Path: <linux-media+bounces-51883-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBQ2O0avfWm9TAIAu9opvQ
	(envelope-from <linux-media+bounces-51883-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 08:29:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE2CC1111
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 08:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E7A3301051C
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 07:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9912F3C07;
	Sat, 31 Jan 2026 07:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZ3JVAD6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYO20vBd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B902E7657
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 07:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769844539; cv=none; b=X2A9as0qdZetB5+jVh96lvkHCwQ5JjZGsSnSgta5goFnR/YTo/VRDEemMvToezcmGVW5Kwv2SOrOXJUmBnRRSsRe08JD81ymsN83oGlkK8n/0FjcCMRgoZStD78THwez1ppKBb8CRaL5dKlMj12OoOsuoC2YmjR8wzIPzePG+fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769844539; c=relaxed/simple;
	bh=JywgbqP3iPNVKZImRXe0FTMblFbA79L1/KWh/FDaAQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWBN0Y/CGfVwKiXDenNCBs1hECb47Knvl4rV+hsftX3mnjP+KePVnIvZcWGNThrrsVvf/XZMif7DOzHGDgGzgO7KPndDOJ7wSe6KErS63+YPFo9J66/VG1OcKUZqPa6IawX57JMPl2YEcCCUKyUNV0COdpEXR6vsPy61vG6eet4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZ3JVAD6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYO20vBd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4VRPN867194
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 07:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7YGT+HJkl9M6Utc3bav4XrRP
	HhfYSx6U1/BYsSX9PTU=; b=CZ3JVAD6TXPSY5sGyKz1SSgWagGvrrxqOMfGZJUO
	+66ktk1kp2aSe6EaXwGphYmYP95KkYnONf/gaDosyvQfUvIOTJHJSG1oQb+Lvi4V
	pk4FveY0rIrHgTGjboPZR2YpVZRmfY7VPQ55AGfOLS1Ok31qb7lFadHrL7+7Kp5Y
	ftqMDraQtrkaxEFAPV8yn0DHTfw/TDHVEWnqKqWIxCQLIpGP7oRXRhvacBpkR/Do
	opC8ogd+8QtsmUd576ER+23hRcVzxLHtgKcyax7Rlkpout1A2Wb2jTwi3kWtLkIN
	pNG4J8IDvTv56SW8APZbMPLs3ZtVFpHQiS5x0UdiPdqbXw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1asdrcqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 07:28:56 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-566474bad5aso7940931e0c.3
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 23:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769844536; x=1770449336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7YGT+HJkl9M6Utc3bav4XrRPHhfYSx6U1/BYsSX9PTU=;
        b=CYO20vBd0fjgOVGGlL2FMbkIY2hiE20HCAGRY+BxV+/QGHRwkdVe83UnsmRJmWbdj0
         kdkqrsyH9L0Ml9E4CPPYR/E4lEsBmi+rbcmKlxQ+Mwginn4Z12DsqnkqydgCcZlr8Y9B
         jsQqK/pyMrKvGhpbH1xi9GNLFKK1/4gX8z0HP0+wQDsVRR4pYShH0ie0P8jVDGvEqYQ/
         cbyT/SsRVfCams2AwHuNtwOiuRMNojqoXW/L4mxmUL0W9mHhQEU0obPWnVFAQ1ihRngM
         TMTVZelll0GIQfUTydye1FbOauN6zq4m5uD1fEbXeHqRs+5ChvQn5bhpeqJXqJjEWzg0
         Bptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769844536; x=1770449336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YGT+HJkl9M6Utc3bav4XrRPHhfYSx6U1/BYsSX9PTU=;
        b=qIoz8+UDuMh8rXVjyir9VfnRMscB/YJmNEctQZL3sdytiAmQEUdhLHf4LNQGx5Ue1s
         jUu0yz5+4wK+W5VnV4Wrm0IsuxqnNCWpVFADZQsSR29fMwvbRtdJrjviF3AiZ1Zlcgl+
         X86FI7X86QS1uo0ghXBVry5ZSIvCj5GhXWQnHk/tjFiwfDGxzS572Sr0L5CtOQMC1P+h
         PyJ9RC+J0GoykNa2+/8PWl56zyY32/fbwA/OcRnsxyzqfdVo9Ldgie/ij6jRUBpS28x5
         zl1mI8dX7AMpTXOEyEbru5wnQapRoQNtsUNeoo/H1hkQJ2x2TC0LHortrYMEKVKhWkqf
         qDzg==
X-Forwarded-Encrypted: i=1; AJvYcCVZTbDWtTosDjDp2YG4fX+9+NKO/gGe40q6nLAW7M72JEtk2Jxh6FnbtknaYgyy60zm1bfuWBF2B0AfIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQF0u4+VYu+p2UEVZUi2Jb0H0dhYC3g/Jzn/7aqbL7seGkSNQI
	/PcsUtrN4TRjOWFy9foMhDBgBUBvlH3/oZea/jWf17oLF1CygMycZftpjb8HzjtSWjVuo5a7f1V
	b2KTD/vXvz9YkvqPvDPzYT33/xVDKY79Jai2qEr5ME3dVJkswrLxWgYutdsQUUAHSnw==
X-Gm-Gg: AZuq6aIO7L35IgOuwCN6Smw6T5KTdTOCcYGIo0sXXPLepoowuA7WgqxstGmDrqLoJfa
	3OsEvYj04Tq/7ZjNAB2MZqq9aZtcKK0xseWpbwDfb0p2aXSPsDKCSmvafsh1TSfD4ydlrNl8VPg
	1GoE6/m9cUbsTIjO0ZejJV4TKsuKjQSULoi1GumDiXbGGLDyZdaOF45eXO0cFbuOHu0e/eT+g4R
	LBh9GfdasQtaQMI5W7HeIQAI/OZ2E03fk4GwnV34it43p6iRjIF0OlPXsnnOWaRU9eOWJkJJ/g/
	rmTiKADCUOUcCxWGCvgnoBhgOMthpZplLMyn0CLmDmqHqXGI+p94Ap78VrANdjV78D6NCo8vgUE
	PZ+3WSuLBpSpl4+lK/pppzdTX8ytVtYnuEBgn4fVufANGlr1NiAFQnRRFiWObBOSxPlf46h8pTa
	qhp7o3F/t7KjXivV6oSXNROpY=
X-Received: by 2002:a05:6102:5089:b0:5ef:a59e:617a with SMTP id ada2fe7eead31-5f8e2601012mr1855008137.21.1769844535894;
        Fri, 30 Jan 2026 23:28:55 -0800 (PST)
X-Received: by 2002:a05:6102:5089:b0:5ef:a59e:617a with SMTP id ada2fe7eead31-5f8e2601012mr1854993137.21.1769844535435;
        Fri, 30 Jan 2026 23:28:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bbe5fsm2151900e87.85.2026.01.30.23.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:28:54 -0800 (PST)
Date: Sat, 31 Jan 2026 09:28:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 2/7] media: iris: introduce SM8350 and SC8280XP support
Message-ID: <rhsmmvbxjzb4ylxryo3n6j6wf52tjpxxon6fww6tsfhxttc2g7@xfsnyfkqh3ke>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
 <8c5cd9ff-e549-00ab-60c6-814b52f50949@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c5cd9ff-e549-00ab-60c6-814b52f50949@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2MCBTYWx0ZWRfX9DIxHBfqEdcx
 WNP+/U23hY3RYvvfNvXBYLRGKVD8XwfMvkzzASZ8VEB37MW4w/ngBLswPK7Uz5ry8RC2MrF7YMk
 zqyT0+qh7lTo8bftJcYXMLQajS+tFeYshSfSTGutsbJUtoWZOAf5Ds+7TQDjXGi+pkp5DlOQIGz
 XPrm9abAU4l23B39tYK+tXYu8U9wfWekHptfxZhXGhrbPYUG+Mh7+oI7KyQPpIF3PsjJHusq1GV
 mb2AxQWn0nk1fsO1ofGnqtO4hBZcJ3u3m8EfsiE6qgbNjNAFfPFfrDRYRMQ/8Iwyyr/MgOtHrGv
 FxWJvZjrJyzth2i/Z6e/29ajzmcNGe1djFGIgilTAx/1YVkId/08QGY5YxNmiCFoV/lxUqEW30n
 XTEogwkaU5c5gndlAL9ZCnVRwgf5Vp2FDi6SNxVDcvL6hqk5IektB6cPws5xLTBoKh3v4LhqFM8
 7IPBi2c5rftUII46iLA==
X-Proofpoint-GUID: WG0iz8TKotDDEt1Da9NZEl1Y8_UYDDhL
X-Proofpoint-ORIG-GUID: WG0iz8TKotDDEt1Da9NZEl1Y8_UYDDhL
X-Authority-Analysis: v=2.4 cv=LNNrgZW9 c=1 sm=1 tr=0 ts=697daf38 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vmlUpWuaLe_beuDpSQAA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310060
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
	TAGGED_FROM(0.00)[bounces-51883-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4FE2CC1111
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 06:46:04PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 1/25/2026 9:02 PM, Dmitry Baryshkov wrote:
> > SM8350 and SC8280XP have an updated version of the Iris2 core also
> > present on the SM8250 and SC7280 platforms. Add necessary platform data
> > to utilize the core on those two platforms.
> > 
> > The iris_platform_gen1.c is now compiled unconditionally, even if Venus
> > driver is enabled, but SM8250 and SC7280 are still disabled in
> > iris_dt_match.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/Makefile          |   5 +-
> >  .../platform/qcom/iris/iris_platform_common.h      |   2 +
> >  .../media/platform/qcom/iris/iris_platform_gen1.c  | 111 +++++++++++++++++++++
> >  .../platform/qcom/iris/iris_platform_sm8350.h      |  20 ++++
> >  drivers/media/platform/qcom/iris/iris_probe.c      |  10 ++
> >  5 files changed, 144 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> > index 2abbd3aeb4af..2fde45f81727 100644
> > --- a/drivers/media/platform/qcom/iris/Makefile
> > +++ b/drivers/media/platform/qcom/iris/Makefile
> > @@ -10,6 +10,7 @@ qcom-iris-objs += iris_buffer.o \
> >               iris_hfi_gen2_packet.o \
> >               iris_hfi_gen2_response.o \
> >               iris_hfi_queue.o \
> > +             iris_platform_gen1.o \
> >               iris_platform_gen2.o \
> >               iris_power.o \
> >               iris_probe.o \
> > @@ -26,8 +27,4 @@ qcom-iris-objs += iris_buffer.o \
> >               iris_vpu_buffer.o \
> >               iris_vpu_common.o \
> >  
> > -ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
> > -qcom-iris-objs += iris_platform_gen1.o
> > -endif
> > -
> >  obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
> 
> This change is not needed in this patch, pls remove.

It is necessary in this patch. We enable gen1 platforms which are not a
part of the venus->iris transition (they have never been supported by
the venus driver). As such, iris_platform_gen1.c now needs to be
compiled unconditionally.

> 
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > index 5a489917580e..49dba0f50988 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > @@ -43,7 +43,9 @@ enum pipe_type {
> >  
> >  extern const struct iris_platform_data qcs8300_data;
> >  extern const struct iris_platform_data sc7280_data;
> > +extern const struct iris_platform_data sc8280xp_data;
> >  extern const struct iris_platform_data sm8250_data;
> > +extern const struct iris_platform_data sm8350_data;
> >  extern const struct iris_platform_data sm8550_data;
> >  extern const struct iris_platform_data sm8650_data;
> >  extern const struct iris_platform_data sm8750_data;
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > index df8e6bf9430e..c99ff4d4644d 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > @@ -14,6 +14,7 @@
> >  #include "iris_instance.h"
> >  
> >  #include "iris_platform_sc7280.h"
> > +#include "iris_platform_sm8350.h"
> >  
> >  #define BITRATE_MIN		32000
> >  #define BITRATE_MAX		160000000
> > @@ -392,6 +393,61 @@ const struct iris_platform_data sm8250_data = {
> >  	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> >  };
> >  
> > +const struct iris_platform_data sm8350_data = {
> > +	.get_instance = iris_hfi_gen1_get_instance,
> > +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> > +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> > +	.get_vpu_buffer_size = iris_vpu_buf_size,
> > +	.vpu_ops = &iris_vpu2_ops,
> > +	.set_preset_registers = iris_set_sm8350_preset_registers,
> > +	.icc_tbl = sm8250_icc_table,
> > +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
> > +	.clk_rst_tbl = sm8350_clk_reset_table,
> > +	.clk_rst_tbl_size = ARRAY_SIZE(sm8350_clk_reset_table),
> > +	.bw_tbl_dec = sm8250_bw_table_dec,
> > +	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
> > +	.pmdomain_tbl = sm8250_pmdomain_table,
> > +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> > +	.opp_pd_tbl = sm8250_opp_pd_table,
> > +	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
> > +	.clk_tbl = sm8250_clk_table,
> > +	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
> > +	.opp_clk_tbl = sm8250_opp_clk_table,
> > +	/* Upper bound of DMA address range */
> > +	.dma_mask = 0xe0000000 - 1,
> > +	.fwname = "qcom/vpu/vpu20_p4.mbn",
> 
> This firmware is not compatible with SM8350.
> SM8350 firmware is not released to linux-firmware yet.

What would be the name for the firmware? The downstream uses vpu20_4v
here, so, I guess, in upstream we should be using vpu20_p4, but a newer
version?

> 
> > +	.pas_id = IRIS_PAS_ID,
> > +	.inst_iris_fmts = platform_fmts_sm8250_dec,
> > +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
> > +	.inst_caps = &platform_inst_cap_sm8250,
> > +	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
> > +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
> > +	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
> > +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
> > +	.tz_cp_config_data = tz_cp_config_sm8250,
> > +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
> > +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> > +	.num_vpp_pipe = 4,
> > +	.max_session_count = 16,
> > +	.max_core_mbpf = NUM_MBS_8K,
> > +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> > +	.dec_input_config_params_default =
> > +		sm8250_vdec_input_config_param_default,
> > +	.dec_input_config_params_default_size =
> > +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
> > +	.enc_input_config_params = sm8250_venc_input_config_param,
> > +	.enc_input_config_params_size =
> > +		ARRAY_SIZE(sm8250_venc_input_config_param),
> > +
> > +	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
> > +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
> > +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
> > +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
> > +
> > +	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
> > +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> > +};
> > +
> >  const struct iris_platform_data sc7280_data = {
> >  	.get_instance = iris_hfi_gen1_get_instance,
> >  	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> > @@ -446,3 +502,58 @@ const struct iris_platform_data sc7280_data = {
> >  	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
> >  	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> >  };
> > +
> > +const struct iris_platform_data sc8280xp_data = {
> > +	.get_instance = iris_hfi_gen1_get_instance,
> > +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> > +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> > +	.get_vpu_buffer_size = iris_vpu_buf_size,
> > +	.vpu_ops = &iris_vpu2_ops,
> > +	.set_preset_registers = iris_set_sm8350_preset_registers,
> > +	.icc_tbl = sm8250_icc_table,
> > +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
> > +	.clk_rst_tbl = sm8350_clk_reset_table,
> > +	.clk_rst_tbl_size = ARRAY_SIZE(sm8350_clk_reset_table),
> > +	.bw_tbl_dec = sm8250_bw_table_dec,
> > +	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
> > +	.pmdomain_tbl = sm8250_pmdomain_table,
> > +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> > +	.opp_pd_tbl = sm8250_opp_pd_table,
> > +	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
> > +	.clk_tbl = sm8250_clk_table,
> > +	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
> > +	.opp_clk_tbl = sm8250_opp_clk_table,
> > +	/* Upper bound of DMA address range */
> > +	.dma_mask = 0xe0000000 - 1,
> > +	.fwname = "qcom/vpu/vpu20_p2.mbn",
> 
> this firmware doesn't exist on linux-firmware.

It was based on the assumption of having 2 pipes. If Iris here has 2
pipes, then probably we should still point to vpu20_p4.mbn?

> 
> > +	.pas_id = IRIS_PAS_ID,
> > +	.inst_iris_fmts = platform_fmts_sm8250_dec,
> > +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
> > +	.inst_caps = &platform_inst_cap_sm8250,
> > +	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
> > +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
> > +	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
> > +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
> > +	.tz_cp_config_data = tz_cp_config_sm8250,
> > +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
> > +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> > +	.num_vpp_pipe = 2,
> 
> sc8280xp is IRIS2 4 Pipe.

Ack

> 
> > +	.max_session_count = 16,
> > +	.max_core_mbpf = NUM_MBS_8K,
> > +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> > +	.dec_input_config_params_default =
> > +		sm8250_vdec_input_config_param_default,
> > +	.dec_input_config_params_default_size =
> > +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
> > +	.enc_input_config_params = sm8250_venc_input_config_param,
> > +	.enc_input_config_params_size =
> > +		ARRAY_SIZE(sm8250_venc_input_config_param),
> > +
> > +	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
> > +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
> > +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
> > +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
> > +
> > +	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
> > +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> > +};
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8350.h b/drivers/media/platform/qcom/iris/iris_platform_sm8350.h
> > new file mode 100644
> > index 000000000000..74cf5ea2359a
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8350.h
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#ifndef __IRIS_PLATFORM_SM8350_H__
> > +#define __IRIS_PLATFORM_SM8350_H__
> > +
> > +static void iris_set_sm8350_preset_registers(struct iris_core *core)
> > +{
> > +	u32 val;
> > +
> > +	val = readl(core->reg_base + 0xb0088);
> > +	val &= ~0x11;
> > +	writel(val, core->reg_base + 0xb0088);
> > +}
> 
> you can reuse this from SM8250. That would work.

Hmm, downstream driver was explicit about clearing only these two bits.
Is it really fine to clear all the bits?

> 
> Thanks,
> Dikshita
> 
> > +
> > +static const char * const sm8350_clk_reset_table[] = { "core" };
> > +
> > +#endif

-- 
With best wishes
Dmitry

