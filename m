Return-Path: <linux-media+bounces-32913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B9AABD595
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 12:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEBC21684F3
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DE1268682;
	Tue, 20 May 2025 10:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G2kGfE39"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F80255F22
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 10:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747738341; cv=none; b=JqVRTKHoDpEOmsQRTJBfFTpbv9UvIGRGDwPB3KNLEMrLLJ45dayuv5haj1dFjpvrSFrDxQH6VwWEobnDp2WZjHB1EtkAWwDq//FME0P2wALUdHSJK2uqV1uVwD2vOBI0YcxI0+H1zdmls+iIndIP+fxjUbbYmXLvtCTqiMQrWU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747738341; c=relaxed/simple;
	bh=Oa9k0noCv5pfsZvbyv4j1AKu0STBRVDPhxiDXfVsT8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADNsGeMs9KKhaCugxERNP7xdfNDBc14J8hASa5ies1r/kRrudIxfoZ2tYvhS5hxhOX1igZj5uhLpMHuPZPiJ8FuiRGDR/XQ7bPkZEHqOtsQIfAbEBqoETP3yvYlUp6xRKrpQMJ+sK4ZaouFR3GjjJUZRXW0Wqn+HFXHjeBqlvWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2kGfE39; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K2sH40010902
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 10:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iu6hQ3FOP9u9YuNt9OId1rpc
	oHm2k7ZRa3DQfZxPW7A=; b=G2kGfE39xHXtJo3JfPN9p5Gbsjy6vaDU78zvVggd
	AjNF77Cj64hMIZVcIkerHarinstxprWv0Up9BBc9pUu+TLfRGRs4PnUH8D1NvdDc
	VHu+S+9PzQoCoryGCTmWAgf/iT7AMy4iL91HZALsh3BcUoDbOGErbnnmFGFvptxB
	3B5wdgF8rxl76WznhcKzJKWhTFDVg7kNrMkT37VLPmDY9J2mBj2dbt9n5CODS6nm
	/C2V946jtTtjlSYNn8C8XR6WSYG1zZ6WDwODyiA3niI9heI6SdvSLLa8vX6AcstA
	d4xMglzrhiwYUmZYn7GX5+TZAF78n0Q4XYFZ0XD15gqeWQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4qbrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 10:52:18 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-52dbce1a18dso4773538e0c.3
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 03:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747738336; x=1748343136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iu6hQ3FOP9u9YuNt9OId1rpcoHm2k7ZRa3DQfZxPW7A=;
        b=Ojqqd/ai7RMiNh5lojUvgTANWfJ5vEMuBuEpprC28aOkKrktqRg8p0EQLGRtpLa8t2
         Mmu4jH6S4E57m1WXWK4BzKQSCzvT2YAunF/kBt5oNpamLwpPvgoITJbkko2K2j7X31c8
         3331Ge/aJzZGVZWF9nHn67wwkAptjO5H5ft3EKPHcpJPs8q5vIrZuCNN9qklqqG0YDQh
         nLYRIxVWLzMc6Mt4gOCBezcluk2LwPbiNqCD8oI4OdfOoenMk7s5A5DksL5jjXnrf0oB
         HnfHNqCli90ELdIaYH8mrEDxJVMjY6xA+PWL1RTpZT/WYnqdeoLAJ9qfPoKlDq7/cM+Z
         qVCw==
X-Forwarded-Encrypted: i=1; AJvYcCXZp5GIX6ioQqfn/ZmrlmPbl2DoVZ4ogAcipMX4JMtcvIg8U+hpfIcq4wg2omxUcIxjDQPdUp2/fp7s7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza0985B6yN7Bp/6WsU0h9AGVoN57gcCqMLLjxLmoglK5oi6E9p
	f7NW1vFFqWjK3VfW+YYszFktFp42QHocEc7aFV4vV0bMSvsNxX8NmcR6tTtlMR+K9Bj8eo5654I
	IiYs+iGs9rrpMbaPb2/maJY7ajqBTDcd/bmXHtR1Cp2dSrRrAhtTN23BNmQW3tnRF6FL+BNQMmw
	==
X-Gm-Gg: ASbGnctdVz5Fn16kPTdY1jo+wMLa4fHjNEA6Pdx0EoiEeQLVQVnlF+84D62mj3r+hLL
	LGml+tkbV4sQ/qwqcAuAS/g87uPXyv6Q94Pk48bNJg+X1mHiDOlOVQQ34kKLcDkmzc2OPydK4dJ
	J6+ePnlG2eL9br/mrqLS+NjkKpYRryUbTxoHydbXHziUAgX8cY9kAo3ZNy8q1s+ccgbwUoBmFX2
	Z2wfL1AEEsoV5P/tij4JoQYchQpNk+d4PGrHzUsAwOn1tOTPO5BmDxxpifWDfmpu8CmS4e76M8e
	/Mrra61KEUHFEw6cFebywAzrfx/AJjklrDX0QJMUEsWCScjE3xzdg5tEb7mVSXzJ8CVvi0CWcyQ
	=
X-Received: by 2002:a05:6122:2492:b0:52c:54fc:745 with SMTP id 71dfb90a1353d-52dba83ecaemr14446979e0c.5.1747738335993;
        Tue, 20 May 2025 03:52:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKLSIG2Onln6gXMObDRG2o81ByYnYJZsZgsh86zfCf5MH9TVDxED5HmWvf5vBdtOWBgkCTTg==
X-Received: by 2002:a05:620a:44cf:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7cd4608ea23mr2402476385a.0.1747738324922;
        Tue, 20 May 2025 03:52:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f47csm2282736e87.237.2025.05.20.03.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:52:04 -0700 (PDT)
Date: Tue, 20 May 2025 13:52:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, bryan.odonoghue@linaro.org,
        todor.too@gmail.com, rfoss@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs615: Add support for camss
Message-ID: <gsj7aya7lr3quuw56n6p3utvz27qaqn5rxoihkvecsgfy4itu3@zoekpc7fyabs>
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-1-ac25ca137d34@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-qcs615-adp-air-camss-v1-1-ac25ca137d34@quicinc.com>
X-Proofpoint-ORIG-GUID: 8ZunYjxuXXEVfiamqzsjAmI9SEvfcuPG
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682c5ee2 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=Sj07yxY_p6yHqL6ZhSQA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8ZunYjxuXXEVfiamqzsjAmI9SEvfcuPG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA4OSBTYWx0ZWRfXxey9rOZW3SbK
 C0N/+IjrpSkrAxBhc1+jPsPRHkIZGig08Zqz4XNFr3566650B8BeGGV375YGz+AHqa65ctolKRW
 qGpvjFFiTEXjrKabZglD9+qgl8KnuUEAVbsDccErX7EGkJkGlx3oN4UoyyJvQcKUkPu9F9SrDMq
 zVqd4jFEa0J3SBMWfSX7+63lXTevLNiYVctb7Fttym0AMfut0kKiTKXYPN8HjfhDMzAQh7O0Qfg
 ssgvfQXpVuIp138fOcHIiKI5Vo82m0mivX7daLIFgh+trlqXlBypDecy5Hw0tb4Lk2BxOK1z8Iy
 543+Vxmzlxm7ysME1rzaxkSIhWnfCWECJ4D3thU1vxk9hHsBtnEFfbZneCZ0uQ4xJvtJCxBP5oL
 7ciXWMgfUTIG09UvM+jxqU1brj/0LaQJ44/W2bPBs0bc11HtNEBgJnWD4TEXFVqNB7CNRvL/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=736 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200089

On Tue, May 20, 2025 at 04:56:51PM +0800, Wenmeng Liu wrote:
> Add support for the camera subsystem on the QCS615 Qualcomm SoC. This
> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
> 
> QCS615 provides
> - 2 x VFE, 3 RDI per VFE
> - 1 x VFE Lite, 4 RDI per VFE
> - 2 x CSID
> - 1 x CSID Lite
> - 3 x CSI PHY
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 133 +++++++++++++++++++++++++++++++++++
>  1 file changed, 133 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 47e350f175860e7b06f7b2c13fed75a65e489c8a..535251efc6b559447482b9ecc67ca26e7efbbb8c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3242,6 +3242,139 @@ videocc: clock-controller@ab00000 {
>                          #power-domain-cells = <1>;
>                  };
>  
> +		camss: camss@acb3000 {

camss: isp@acb3000 {}


-- 
With best wishes
Dmitry

