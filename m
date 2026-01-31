Return-Path: <linux-media+bounces-51884-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK5YOEOwfWnZTAIAu9opvQ
	(envelope-from <linux-media+bounces-51884-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 08:33:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC04C1127
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 08:33:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DE9283002F5F
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 07:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F9132D0FC;
	Sat, 31 Jan 2026 07:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiTgSRIx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DiqE1ofL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02109D27E
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 07:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769844798; cv=none; b=JuQT2xzCnEkFghDHxUNT0jytJ8HV+8q8Y/E4kYcZ2tw1wV6MbrnE+aW/GEY4XjOR/ulGQAaTToZlGdPDozxukAFqJFNR8WYECkHwYzJEWkRX+1O0wpHdquBVcSUZ+OK2jsigZEYEU/RKcqlSShgFROSQqRlPWkPKYyQ2lqC68aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769844798; c=relaxed/simple;
	bh=5S+oJoEWByHPmFtCKVvtU8H7XlaT10X/45rTL9htBv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVuv3evbB0eULFC5Fxz2bl3PcNXoGW3W/GqAXcQjzA5O6kK+WzmkxO+YFs5m0jA4hrzZw2PEBkB797Y/Rsc4ps/OOg7jLo5qfXRQwjmKf3pvQM2ZkXxUoSJMxvVyvoKdhIwiYC9HC4tpK3jPHuo4Nj2Tw6agp8HgIqEpaDFmfRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiTgSRIx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DiqE1ofL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4bkB11061486
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 07:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jzAKeLWFb/MvincNffIn9cBz
	9KA9CGtPyTBhjunax5M=; b=CiTgSRIxLLQQYb4ibU/1to3X3Wz0O3dKsKi/VLaf
	R4QVbdnRM0S/0vCdrVjOiaS8gbC5lMCbS7BcPjwVnyh806Fr8djcF/Y+aM2t7e46
	37LiIGxHeaBFMx3zk+yGN67Kdkn7cBINvGO8wKDtb/q1IFXCSPnZ9MmWEbyzmQrR
	cTHyGalLyjiJdBk40hbsh55FciEx3TheJTg3DNvvJjeLjF+V0sI/436PegQj1191
	9bfMosnResVh5Cr8IlXt7JpqmOujNbE1+OlgsjVB5Tr31FUO1Fy7PAjPHIFsYS/i
	C6dLUijf8Eidp4Nn85U4AIvbrkhfuk+++rexIiCr9uzNhA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avngc3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 07:33:15 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9412e67d171so11819059241.1
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 23:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769844795; x=1770449595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jzAKeLWFb/MvincNffIn9cBz9KA9CGtPyTBhjunax5M=;
        b=DiqE1ofLEfE+YtAz0zYCeymyIKQyYdy2XMhJwdjOKKcruEyloEUo79AzPItg2Ig+Q3
         LEN5c7MvRbjFdFFl/z1TYbZOq1dDxD9izHhbj/gOMsboK9NQlF51Lmhwdtq/rurMIrOw
         UiF6rz5mih61igngnKaJtfo1fONxFRiBFzqypoJqB5eQWuikuf8M2R1rVACeit0RVb95
         +GgmYLnWWNnjeibAg/9RMByMYND4VL+HdBMefCfcRA3c+9UIxnNKquC2/6A0eqBANNIn
         AJYrrnEjl5ItRyH/We2+Sc8zfmFXXDw/WoCtdezB3uyXQ4t8TTTush+PkmWFeeReu40E
         TwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769844795; x=1770449595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzAKeLWFb/MvincNffIn9cBz9KA9CGtPyTBhjunax5M=;
        b=Wq93VEcg83wydT13gG+7TR1dKDaVFTRfCbF83VEQF2ZD8L/KF1qpG5bCnRZOpVFJgV
         toQ56nINzFlmajIxQ1S78U9kp9anyUbMVPFAuvA/BHn871MxJIktoD94ZEMN22dF25ka
         fRcWzaTz4hJxOOBZZhiIo+iliDq27Za12vbBVyGHKnlpASYXRFCRLb3RzFDWUtyjaRgx
         4/SlYakd24QsOfSEofzJ38n5jMU2jayPBdhtm2NOprP3cfGPe+dnARTulwC1iG4Oy1Ny
         TNWPOzfSffC2tnIUGgMlB93PEdPIcW0Bj0aSx0GaNiaR+ZS+gQ2yNRhayBICtdjaCR9A
         wDyg==
X-Forwarded-Encrypted: i=1; AJvYcCVuPIyvI8m60yrQV4oKHbCPY2YrQgGeefPnLdbnc/FXSZVT/W6vJFAkPdsiqhMdBb2xfyFi29kYJz8zNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjhtQ16cYBRqLmau2WrLMfNbVq3QnTYLudujSdT3FrYBluknQl
	UDVXgR0FqNlFUztScU+qYY6kyFQYRZMVhhX1i4gbKG1Iv7HWhTtPMsjjI+fAhibR47Rz6R2cI3h
	VP9jSg4fICHLCcugH3nAJrBOhcDj1AbDyTkSN/FNoEGmCPNdHnBQ8Alrqlowwl1Y0Vg==
X-Gm-Gg: AZuq6aIEObzw8bpqLCKc7wZPAJFvUySKN9sluj5xQSb7NZ4nzBIirrgi4X4UQEnEhfl
	1QhGf4v7Y7Uv0d1DT+er2s8FFf8p4umqxkicZHCHjCHd0ovvubP0YsKfJfKjkHmP2wCkZLCPArH
	5XVHZ5NQX5YZ4VzEH2HSuiGy/3/Zw0Ym/qA72bWVkO23b0ptqycENEi0CW/2oEAzrfMKniYp12M
	0Pt5PT5wZk5DsqSmMqG+YviHSRmHu3nFDkI1WNvt+GcdmwYGav6wbDuW199KXITl6JfCGT1Ll8b
	vhdT95nHh5/FyoVC3osKEhQjryeBDyCsXl6mPHD8Gnhy2wG6OU6jcYvnstMgxdJE5AkasVpukig
	TYOzY1rRunPi+U1EsgGeovtRSqWbywD3xwqx0f55nKpOKhuCa7GHZQhYCYUY86bNbmrWRfUXJRw
	loSZQpw1mXfOloSrtKkk+HNZo=
X-Received: by 2002:a05:6102:2910:b0:5ee:a2af:9da2 with SMTP id ada2fe7eead31-5f8e34a49b3mr1970387137.6.1769844795239;
        Fri, 30 Jan 2026 23:33:15 -0800 (PST)
X-Received: by 2002:a05:6102:2910:b0:5ee:a2af:9da2 with SMTP id ada2fe7eead31-5f8e34a49b3mr1970367137.6.1769844794746;
        Fri, 30 Jan 2026 23:33:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074887fasm2210704e87.29.2026.01.30.23.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:33:12 -0800 (PST)
Date: Sat, 31 Jan 2026 09:33:10 +0200
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
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Document SC8280XP/SM8350 Venus
Message-ID: <g2ft7zu7mabl63hggbyyfkhntvkmsqjvtu43r2c35ycgrghxgs@53m33fj3b2ft>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
 <3d99e35d-1aef-5e04-55c8-628918e29da4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d99e35d-1aef-5e04-55c8-628918e29da4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -pFakmzVv6LySL9uwrcC2YCtrxzYT8eW
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=697db03b cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=-QlOP09eClfSJTEkL3cA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -pFakmzVv6LySL9uwrcC2YCtrxzYT8eW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2MSBTYWx0ZWRfX7cGllnWuWcdI
 VI+A+qbl6DBfVshRdNmSCQ6j3kaxEH6k6YCLAYb2vp+amxY/Ud5+pio/MZvwV4eT7YV4Y5C6MRY
 8V2l3HpUWx5fRNRaGOp1E7/12eQGsxGOgt7FRHFuKLAiN1Y9ieT/FyrNHYE0h/zz9tHo1SeMe/0
 kWRAGi+CPbJUol72Q1gcbXqVnIxpvXC2/62dDBrSt881FaOEjnf+5URLzPkzO9P8dec4LPSZgKW
 ZNv5Aps6+bQm86yHjUjHKVkYUMwGb8ATBK8CTefKr7nG6N1zOgaERHd6FNewL07ahur8WzxNQMf
 +eXdFk5YT4ctiftO/6TZjkCAviLJqFbd4qV8qCdyJbmVV/wV7PsHxa64IKL6k0q1QLNNbtGnAb6
 jyzn3sRcOVRqsEah1jCMeEyVNmZffSAShfeKAC2x4pDMgtx+y4xlD3kz2n3H6xuATRql8KfsWvs
 RykRnlEkq1x3RqhtRNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310061
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51884-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,linaro.org:email,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5EC04C1127
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 05:59:48PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 1/25/2026 9:02 PM, Dmitry Baryshkov wrote:
> > From: Konrad Dybcio <konradybcio@kernel.org>
> > 
> > Both of these SoCs implement an IRIS2 block, with SC8280XP being able
> > to clock it a bit higher and  with SM8350 having 4 VPP pipes, while
> > SC8280XP having just 2.
> > 
> > Document Iris2 cores found on these SoCs.
> > 
> > Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > [ bod: dropped dts video-encoder/video-decoder ]
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > [db: dropped status, dropped extra LLCC interconnect]
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  .../bindings/media/qcom,sm8350-venus.yaml          | 113 +++++++++++++++++++++
> >  1 file changed, 113 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
> > new file mode 100644
> > index 000000000000..d78bdc08d830
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
> > @@ -0,0 +1,113 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm SM8350 Venus video encode and decode accelerators
> 
> s/Venus/iris
> 
> > +
> > +maintainers:
> > +  - Konrad Dybcio <konradybcio@kernel.org>
> > +
> > +description: |
> > +  The Venus Iris2 IP is a video encode and decode accelerator present
> > +  on Qualcomm platforms
> > +
> > +allOf:
> > +  - $ref: qcom,venus-common.yaml#
> 
> Pls remove the reference to venus-common.yaml and follow schema of
> sm8550-iris.yaml

Why? For example, sm8750-iris uses venus-common.yaml.

> 
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,sc8280xp-venus
> > +      - qcom,sm8350-venus
> > +
> > +  clocks:
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    items:
> > +      - const: iface
> > +      - const: core
> > +      - const: vcodec0_core
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  reset-names:
> > +    items:
> > +      - const: core
> 
> It should be named as bus not core

Ack

> 
> > +
> > +  power-domains:
> > +    maxItems: 3
> > +
> > +  power-domain-names:
> > +    items:
> > +      - const: venus
> > +      - const: vcodec0
> > +      - const: mx
> > +
> > +  interconnects:
> > +    maxItems: 2
> > +
> > +  interconnect-names:
> > +    items:
> > +      - const: cpu-cfg
> > +      - const: video-mem
> > +
> > +  operating-points-v2: true
> > +  opp-table:
> > +    type: object
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - power-domain-names
> > +  - iommus
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
> > +    #include <dt-bindings/clock/qcom,sm8350-videocc.h>
> > +    #include <dt-bindings/interconnect/qcom,icc.h>
> > +    #include <dt-bindings/interconnect/qcom,sm8350.h>
> > +    #include <dt-bindings/power/qcom-rpmpd.h>
> > +
> > +    venus: video-codec@aa00000 {
> > +        compatible = "qcom,sm8350-venus";
> > +        reg = <0x0aa00000 0x100000>;
> > +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> > +                 <&videocc VIDEO_CC_MVS0C_CLK>,
> > +                 <&videocc VIDEO_CC_MVS0_CLK>;
> > +        clock-names = "iface",
> > +                      "core",
> > +                      "vcodec0_core";
> > +
> > +        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> > +        reset-names = "core";
> 
> s/core/bus following the existing YAML
> 
> Thanks,
> Dikshita
> 
> > +
> > +        power-domains = <&videocc MVS0C_GDSC>,
> > +                        <&videocc MVS0_GDSC>,
> > +                        <&rpmhpd SM8350_MX>;
> > +        power-domain-names = "venus",
> > +                             "vcodec0",
> > +                             "mx";
> > +
> > +        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> > +                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> > +                        <&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
> > +                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> > +        interconnect-names = "cpu-cfg",
> > +                             "video-mem";
> > +
> > +        operating-points-v2 = <&venus_opp_table>;
> > +        iommus = <&apps_smmu 0x2100 0x400>;
> > +        memory-region = <&pil_video_mem>;
> > +    };
> > 

-- 
With best wishes
Dmitry

