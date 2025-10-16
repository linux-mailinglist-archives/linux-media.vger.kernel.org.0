Return-Path: <linux-media+bounces-44762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA6BE521B
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 20:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FCB319A77F5
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 18:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936C123BD1A;
	Thu, 16 Oct 2025 18:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XxlSv5eq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A513239E8D
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 18:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760641125; cv=none; b=C0DA3/TmJDVFgGd42AvvyIf86KC1uYQFtMLDOjGTymMddq2dMbvdfO+2p4bt86m3RpAfD/EwqFbc3qesYpR4Wm8QhiQZHIgr/t2enDaWOCfimXJOHo0z+71mbF3k4UKq4nC0v1V8VNJ1k5Yf+m7nI85MqRHjfGS6xmLdUUZMp6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760641125; c=relaxed/simple;
	bh=D3BqG/SCBySSRJrTGIto0aG2AhzurQ8aSCA8wd8TrNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EDuSFNwA9FwVrkuDgVSL/HIyZpGyNH20/Ykemp1f03eL4m9KBANQ/KapgAHLMeVgTFovhA6TkD+WvZxTYVF0Rou8xD3+jKR6rvX9XV0thzjLrWYEQgJrFqxeS6+rZ5CzivqdvI8QlgJAOmlli5HkCmpXiJ0cbuOH1YdHbGd+NyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XxlSv5eq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GDLu9r023878
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 18:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JJtT47iQTu8SfkI3eRVW90bR
	qrjk9X6V6doI7auJ29o=; b=XxlSv5eq3QQuuvhhc63/m0Yjc0YMIKeY0rjBpLX1
	39LQZhmQD8WKqQb7/c5GdtTBWaLfrnUMdbcThuiaHtNrEbz1GxbYMYv6DKTM92Hj
	Q8bLM7tw9ZMaIDBmLhUm4wiivhE8VsmY40e9g0/rcallRYdt17wg212SK7jM1w8p
	b5Fg+x+7Se5/T7mCzz25advpIn9Z05eCdZ88UQMNDMgMXrMr/AH/5hUqM/SLEJ8H
	6Z48fnIKvEfY30nqUjUWT7D5ldVPLlrhXFZHeWrYIObC73BvJz6yOs3CDVDWVQxH
	gC8JlBGOJx+WRPGjnUT98OGbrd7fKT+Iy4ZpC8mEUko9LQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49u1h0s216-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 18:58:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-336b9f3b5b0so1231345a91.3
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 11:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760641123; x=1761245923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJtT47iQTu8SfkI3eRVW90bRqrjk9X6V6doI7auJ29o=;
        b=wCUeqM4FyhZDBg+RzYoDdRM/Eiet86UKVoipurxK7sBrXNHTDW8vPn0/CX5G4gPeuJ
         rtqYPfakr3sXAAo97/lhzzFf2vReqMN+dr/WQHAEnzOgojQsOJOXx+vuWKQjtRXKInkH
         L7Z+sH9fdGI2dY+Xi+xy2GPT9RCLdcUTWBN9/oIEfJ4krH8NEXIKL6CFMOPVQDtu/ySU
         ylTmbO1/BkhkUA/MjQ861OeZK16FNPYwCCZ5Go6okD4mcG2HYfy3wc+2ggm1OgMiV1uW
         BCPEmwEWOoUNj1T/NdOJuQ81n7/9oazFkIcgdNH9/Pld3aJFXtqyzJcNR0I7kgL9ncBg
         hhKw==
X-Forwarded-Encrypted: i=1; AJvYcCWTsjnywv1MemIGCMUki4JPXYWxNI4MC0fsMfBnyCY926tdJC6KnQEZQ4Bom4RmY5GnAx/idNqJhGiPzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYo1TnFZ6/RugGEN9yJvJT4WJrOlNQZivtJ9/FH5g4KLmTaXxV
	sdy9sAd0BFT433UQT+YKj5NnvmnkSYd407n9dHRfaRJMh9BPC+H5S6fqtnl17ZMQjO2y5KX9VLc
	I8FeX8rH35GnPRbl1j1PwKkzFutR/CGU4gSP+sSXG7bEfAK3Gs5A0Q87VYF/pmrVHq7SN/N+HIW
	xhu8XoU64xZTCCyhTL5smQKGauwHFToZ/2X39SJfKk
X-Gm-Gg: ASbGncsUPWoloGQlX8p1119fuN816s+pURB9lCanTERwkxDIEmCfE9FJoak35O/Wk1J
	EpGyuj+UZDlw5ROm1lCSOy0MoXgT1geqmJtrVVhU50SHL7qGZZuHLouDuWPmtA/KFgwwkH7mFlU
	uZZ1VAfu9UgJ+IiheQRO41XdhZjlUPopkaUaAImdJbK1M440g3Xits8R1vibJdKwJqXXFGMz7JU
	a1xMBk8QptZPw==
X-Received: by 2002:a17:90b:17cb:b0:335:2823:3689 with SMTP id 98e67ed59e1d1-33bcf85ac3dmr1062978a91.4.1760641122649;
        Thu, 16 Oct 2025 11:58:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH63mBxrkF0nq6LEF4e/wR0nD2Mj8cqYHhBMgm1l7Boex0xBrCWtVGSEAGnfUQGhfbWNOgF2zb6teASzZIcpCU=
X-Received: by 2002:a17:90b:17cb:b0:335:2823:3689 with SMTP id
 98e67ed59e1d1-33bcf85ac3dmr1062933a91.4.1760641122137; Thu, 16 Oct 2025
 11:58:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com> <gbwjh4tqaoxq2ng7moytv5vtalxpajdid5capjfqzare6dmphz@cmnv4p2q4eov>
 <c4c40efb-ceda-c13c-115f-a473af5e8fcb@oss.qualcomm.com>
In-Reply-To: <c4c40efb-ceda-c13c-115f-a473af5e8fcb@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 21:58:31 +0300
X-Gm-Features: AS18NWAY1mmcf4ZtpL5sJ7dzpkUVwzv1FjzPm02U1BnEjVJEA1IrZIrbDYHySys
Message-ID: <CAO9ioeX3cWsy1Xu7-iWxGiT4mDFKYF+sO34vsLDit8wDX7czoQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] media: iris: Move vpu register defines to common
 header file
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=esXSD4pX c=1 sm=1 tr=0 ts=68f14063 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-53xr1lU8vRCfamL2rkA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: y2oojJerRThdoKgg2n-GUfjq6e4GCA_J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA5OSBTYWx0ZWRfX8/kn0mHXP9dI
 SOM7abRWBNzTo8SjrWfUyKoolwmgsEihbSRG0hU6aU7yw8D3Mnl8E0c/3bx+k+DCPoa3dFk6J4k
 /wTa/3eTEjD2sk6xOBVdcLq9JIS+oQ67kpacxd9qtfkZ472YxbevIpkBn774ovgiOXhKt2av+Ks
 yewSKRRp9+uGZsuoPo3yD0NY/mCiW/d5czIFm3Sju7kCRCGFcTSIovJ3JfKis3cDgdWNHH6X/ce
 TlJeeLjwqm/W12Oo1EwkneaUMeX6d70VD2eejwNc9pZYnlH/ymFLJpK/Pf1/Bum7yE8QrAkIkez
 rlQR5qaz6PIf0FDfS3a8rHEtnmFEbZ7Y/jxGFwGMXRKQH6fe3DGsQBoBv5kFwoL4L0dgGymz2Dr
 ztmGLNVQGAqAMQKh0eVVZnmP7WHDbg==
X-Proofpoint-ORIG-GUID: y2oojJerRThdoKgg2n-GUfjq6e4GCA_J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510160099

On Thu, 16 Oct 2025 at 21:37, Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
>
>
> On 10/16/2025 7:17 PM, Dmitry Baryshkov wrote:
> >> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> >> index fe8a39e5e5a3fc68dc3a706ffdba07a5558163cf..6474f561c8dc29d1975bb44792595d86f16b6cff 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> >> +++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> >> @@ -9,9 +9,38 @@
> >>  #define VCODEC_BASE_OFFS                    0x00000000
> >>  #define CPU_BASE_OFFS                               0x000A0000
> >>  #define WRAPPER_BASE_OFFS                   0x000B0000
> >> +#define AON_BASE_OFFS                               0x000E0000
> >> +#define WRAPPER_TZ_BASE_OFFS                        0x000C0000
> >> +#define AON_MVP_NOC_RESET                   0x0001F000
> >>
> >>  #define CPU_CS_BASE_OFFS                    (CPU_BASE_OFFS)
> >>
> >>  #define WRAPPER_CORE_POWER_STATUS           (WRAPPER_BASE_OFFS + 0x80)
> >> +#define WRAPPER_CORE_CLOCK_CONFIG           (WRAPPER_BASE_OFFS + 0x88)
> >> +#define AON_WRAPPER_MVP_NOC_LPI_CONTROL             (AON_BASE_OFFS)
> >> +#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL    (WRAPPER_BASE_OFFS + 0x54)
> >> +#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS             (WRAPPER_BASE_OFFS + 0x58)
> >> +#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL    (WRAPPER_BASE_OFFS + 0x5C)
> >> +#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS             (WRAPPER_BASE_OFFS + 0x60)
> >> +#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG             (WRAPPER_TZ_BASE_OFFS + 0x14)
> >> +#define CPU_CS_AHB_BRIDGE_SYNC_RESET                (CPU_CS_BASE_OFFS + 0x160)
> >> +#define CPU_CS_X2RPMH                               (CPU_CS_BASE_OFFS + 0x168)
> >> +#define AON_WRAPPER_MVP_NOC_RESET_REQ               (AON_MVP_NOC_RESET + 0x000)
> >> +#define AON_WRAPPER_MVP_NOC_RESET_ACK               (AON_MVP_NOC_RESET + 0x004)
> >> +#define VCODEC_SS_IDLE_STATUSN                      (VCODEC_BASE_OFFS + 0x70)
> >> +#define AON_WRAPPER_MVP_NOC_LPI_STATUS              (AON_BASE_OFFS + 0x4)
> >> +#define WRAPPER_TZ_QNS4PDXFIFO_RESET                (WRAPPER_TZ_BASE_OFFS + 0x18)
> > Registers here got totally unsorted (they were in the original source
> > file). Seeing this makes me sad.
> >
>
> Sure, i will be improving this part in v2.
>
> >> +
> >> +#define CORE_BRIDGE_SW_RESET                        BIT(0)
> >> +#define CORE_BRIDGE_HW_RESET_DISABLE                BIT(1)
> >> +#define MSK_SIGNAL_FROM_TENSILICA           BIT(0)
> >> +#define MSK_CORE_POWER_ON                   BIT(1)
> >> +#define CTL_AXI_CLK_HALT                    BIT(0)
> >> +#define CTL_CLK_HALT                                BIT(1)
> >> +#define REQ_POWER_DOWN_PREP                 BIT(0)
> >> +#define RESET_HIGH                          BIT(0)
> >> +#define NOC_LPI_STATUS_DONE                 BIT(0) /* Indicates the NOC handshake is complete */
> >> +#define NOC_LPI_STATUS_DENY                 BIT(1) /* Indicates the NOC handshake is denied */
> >> +#define NOC_LPI_STATUS_ACTIVE                       BIT(2) /* Indicates the NOC is active */
> > Ugh. This mixed all the bits, loosing connection between the register
> > and the corresponding bits. I'm going to pick up this patch into the
> > sc7280 series and I will improve it there, keeping the link between
> > registers and bit fields.
> >
>
> Ok, not updating this part in the next revision of my series. Do you mean
> something like
>
> #define CORE_BRIDGE_SW_RESET_BIT0               BIT(0)
> #define CORE_BRIDGE_HW_RESET_DISABLE_BIT1       BIT(1)

No, just keeping those BIT() definition next to the corresponding
register #define.


-- 
With best wishes
Dmitry

