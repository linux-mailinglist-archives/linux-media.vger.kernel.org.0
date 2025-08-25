Return-Path: <linux-media+bounces-41012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AC3B33FA3
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 14:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1537817A182
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 12:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B17A196C7C;
	Mon, 25 Aug 2025 12:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5RY+swG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35595139D
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 12:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756125392; cv=none; b=b3VaUmd49QIdybvqOuTgfQs+Na1EetUB8A3iK+aWwHlaHkaZ+RbLp1LJnNHFC0VaaLO/E6eaERTdYEj+eGDHvZ1RQNG9vdfRV5WcvntEq8DyJwRtkVtvHt6cQPl7Sddi4yXWULAzsQIcakLu4ksdb3V4N72CgYWT0s7YRZi08+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756125392; c=relaxed/simple;
	bh=IpsradjdOMcyuR1fVdM6EKhiQ9aldyBirJaSKiTA5ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2NRbHIOVuOju4cRw7tQ55O0OfaSCnUJhTqSo0qoDwjrgEe9TjCfz/Fl4XG8b+PEnLJ8AHt1w+M2b3Vd+EQO165gBtV9nqfFUpAuwji+f8H8KklJnT+voerESAAfXz5ZIx0qznpGo2mPwynFAX/SM7p5EV4BtbN1GepoqaKcacs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G5RY+swG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8dHIb000562
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 12:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FpyvsEzvwWouANgENynapW/r
	DJSy9fLuBY8tVftQegk=; b=G5RY+swGuU+chjtXZn5EhJ9OSned4ckEdMZwpJ4z
	il0nbUSXhNV6w41cx9u1XiJe6//5OEqEgCi/tqxeyzJeRsHnC6CwfiXCt1zuKuXe
	zSC3rbgZehbc18wm4AlXSMo3qXjMTTwOTF11+uRBPXhYJLxcLID7Lv1MaDJb08b+
	EhdPfbA+kJv8s3sJXLv2Jw3msFP7zFfTtlN4QG60/lBWkPKmpO3v+UYVZKg2hg1Z
	+HxlYFmSK+6uJ3ha+OsUbek7covY9qPNQ85SFFQR6s6rZQVxZ6DiT/c9JOEeGlHl
	PAiNAEk1CBz3AuCrtYrIrLTMDnh3EFWMAY/nNaM/zytVHw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5cxsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 12:36:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7704769dbb0so1618827b3a.2
        for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 05:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756125388; x=1756730188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpyvsEzvwWouANgENynapW/rDJSy9fLuBY8tVftQegk=;
        b=R7ceDen7+aSWzk4UNzS+nDSZ0YTMgQ9rLD8Ahrjq+hwz1Y4LQKK7bJOJSoexVjXOy/
         tXOEUzdC0CafhMbAfreHwFbPchktpzz7/6ctCw9FKc+4n9aIJVnqSuoBK/Jtf3VR0hoj
         uj0F2sMi62K/WY3ImW4tftGXBheJs+JUVHZc31qxxCLSAscwzW1OS/EkVPBr/2PN8IM6
         FG7WR7DBkfTISTCgCRJWXcORGzMWUYb9BwSQvdx/mzLmG5Eqnt3qsc+KcymaS6AO9nAF
         3isZeiqsIZZXiJW03AWkwAttUXYHxvOeGtdQ+QZyiFyHI0pm95qKXA+5EMyf90MruHN0
         UcNg==
X-Forwarded-Encrypted: i=1; AJvYcCV9V3Igz+jjQVqwME3SQv5NJiMqK0XNvZ9e5dTJ7Zw5X8Xwra4zApKRp+Bse+wDmZpRo/pnlat/xI4l9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkd7KqDD53XuMCsLe+c9/cLctb9PUupPSrzAbEgOrPoxMznS3I
	PZN3Tpana3yGAcGmFOXbZmlqkeYt21z/8ZhJ7rdh92NKelneYmMmVjrakVoHVzJiL1e9Aa8daIR
	bnlUp3YItb5lpblpmHZz/qBuc+TvNZNmTHW9QTokccgeVo7913HhlffuoN2bBR3Pr+Q==
X-Gm-Gg: ASbGncs7yTUVLj1xnt5D5oHOW4rqRa9gdONBVCujJnbGyJKWWiiH2JB2abnuftXEpFS
	JJQ/gEzWHXIGFrCSwmZ3xwwlN2rsa4jHfKlmWQL9LFukCml41aEohD9M0kQYwAqOGwQtaqtFy2y
	aP7lTdxvQnQ6/1mN+YV4jmPyiMF7l2Vj1Z4qsyTKDPBWV4S4m+NQNLvTTaxAn+K9Awabc4H3bil
	WDwfCTEm4fka9qjnQE7bZF5DWKahs5Cf0r6R5ph9Tx5JYTlfOeNlZ86Km8ibL+5X9qOJaYt8bq9
	R353S/pYAGeDvA1YI98bjOtzhGk4HrAbhDm2mRILLKwgCBMqMaFB9dODEi8Z2/N5D/4=
X-Received: by 2002:a05:6a21:33a2:b0:23f:3f96:ea1d with SMTP id adf61e73a8af0-24340d77b55mr18420091637.29.1756125388472;
        Mon, 25 Aug 2025 05:36:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpAcc7C0zPEwQwv6Q+s2reKx+GekMIC1stpaw3dY97wiJpzXZAJHSAvt83lpMcdkJmcUKsKQ==
X-Received: by 2002:a05:6a21:33a2:b0:23f:3f96:ea1d with SMTP id adf61e73a8af0-24340d77b55mr18420044637.29.1756125387834;
        Mon, 25 Aug 2025 05:36:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7703ffb47b9sm7429354b3a.3.2025.08.25.05.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 05:36:27 -0700 (PDT)
Date: Mon, 25 Aug 2025 18:06:20 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: qcom,sm8550-iris: Do not reference
 legacy venus properties
Message-ID: <20250825123620.wxf6x6ep6jm3oykm@hu-mojha-hyd.qualcomm.com>
References: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>
 <20250825113734.iekrgyvctamhb5y7@hu-mojha-hyd.qualcomm.com>
 <a3325bf1-2a3f-416a-ba2a-4fb1e9f85e61@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3325bf1-2a3f-416a-ba2a-4fb1e9f85e61@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX1MTOM3OVeyhz
 LB/OWIDXPJ0lHkyaN68/ssuzkCTn+/2tczWumscbrom2CaXTrQfFAthPKwbSCWICZvl0iLgs747
 J3I00kBOUoZlIoKpyjbKIoLY5+49oqg1JMBGFpaVG/DQQN6/4n2F3zwOoJr4qSCDEAoWir0iOOL
 to9BKdZJpv7BG+Oph0Eml2p/rQu0NwUYqtU3FX2yv/vWrnvFDUQA85LF4azt2ZmCMvWxJNtzccy
 JjuiIUECD6dNSY9ATJI1gBSyOsPKvxbky8O16HXSxtxnqBeDn/4AaUenRVC2vYP79kSveJXhGJE
 SN/C5gzTtZ4feq4JdmbxnHw0E9RCvDNKob/vbRP+9h/p/N7sF9/uFRGQuG/pzp5TbmTU6AsIJED
 lg4mwX0g
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ac58cd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=u8hhPA04-lIrY9isCZcA:9 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XB5Ykn5JEFGMEgaOF1wdWD1c7GhUumti
X-Proofpoint-ORIG-GUID: XB5Ykn5JEFGMEgaOF1wdWD1c7GhUumti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On Mon, Aug 25, 2025 at 02:02:56PM +0200, Krzysztof Kozlowski wrote:
> On 25/08/2025 13:37, Mukesh Ojha wrote:
> > On Sat, Aug 23, 2025 at 05:53:50PM +0200, Krzysztof Kozlowski wrote:
> >> The Qualcomm SoC Iris video codec is an evolution of previous Venus and
> >> it comes with its own Iris Linux drivers.  These new drivers were
> >> accepted under condition they actually improve state of afairs, instead
> >> of duplicating old, legacy solutions.
> >>
> >> Unfortunately binding still references common parts of Venus without
> >> actual need and benefit.  For example Iris does not use fake
> >> "video-firmware" device node (fake because there is no actual device
> >> underlying it and it was added only to work around some Linux issues
> >> with IOMMU mappings).
> >>
> >> Stop referencing venus-common schema in the new Qualcomm Iris bindings
> >> and move all necessary properties, except unused "video-firmware" (no
> >> driver usage, no DTS).
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  .../devicetree/bindings/media/qcom,sm8550-iris.yaml | 13 ++++++++++++-
> >>  1 file changed, 12 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> >> index c79bf2101812..320227f437a1 100644
> >> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> >> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> >> @@ -26,6 +26,9 @@ properties:
> >>            - qcom,sm8550-iris
> >>            - qcom,sm8650-iris
> >>  
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >>    power-domains:
> >>      maxItems: 4
> >>  
> >> @@ -45,6 +48,12 @@ properties:
> >>        - const: core
> >>        - const: vcodec0_core
> >>  
> >> +  firmware-name:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >>    interconnects:
> >>      maxItems: 2
> >>  
> >> @@ -69,6 +78,9 @@ properties:
> >>  
> >>    dma-coherent: true
> >>  
> >> +  memory-region:
> >> +    maxItems: 1
> >> +
> >>    operating-points-v2: true
> >>  
> >>    opp-table:
> >> @@ -85,7 +97,6 @@ required:
> >>    - dma-coherent
> >>  
> >>  allOf:
> >> -  - $ref: qcom,venus-common.yaml#
> >>    - if:
> > 
> > Saw your reply on 
> > https://lore.kernel.org/lkml/59951c47-1015-4598-a885-25f8f1a27c64@kernel.org/
> > 
> > Just trying to understand ABI here, how all of a sudden we remove a binding
> > for a hardware just because it did not get noticed until yet that as it is
> > not a real device and we always say device tree binding should not depend on
> > drivers but the device but we are saying Iris does not use fake "video-firmware"
> > device node for removal. I am a bit confused.
> 
> About what? What is unclear in standard DT ABI rules?
> 
i.e., If a driver is not using a particular binding at any time, its binding
can be removed.

> > 
> > Whether removing will not break any ABI as initial binding enables the IRIS
> > related code to use video-firmware, now we are removing it.
> > I believe, removing binding always break ABI ? or is it depend on driver
> > code not using it ?
> 
> There is no single user of this, out of tree (I briefly checked) and
> in-tree, so there is no ABI impact. I am changing the documentation of
> the ABI, but there is no actual ABI break because impact is 0.

Something is unclear, that is why you are willing to change.

> 
> I am really sorry but it seems you ask about basics of DT, so please
> first get into docs and other existing discussions.

You are right, I'm learning and not an expert.

> 
> Best regards,
> Krzysztof

-- 
-Mukesh Ojha

