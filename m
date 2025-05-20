Return-Path: <linux-media+bounces-32954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E131ABE422
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 21:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49ABD8A427F
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 19:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E22285409;
	Tue, 20 May 2025 19:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jDIzpdRS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3E62836A4
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 19:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770804; cv=none; b=GbJf6D4xHImCM39I+y04hi1j5bMjqVMgcrXjJeGBQwD+ZskMajg7yHoi6ngLX0qh5rK9F0k9SjoeiwRTm/jpmgFPNXlbpFGRA1HYvHUPSvQuM2CHSvOvPO2qd3vljGjFZlFOkf2HtyWIq4krIzvgHVlWmu57+8UkRWAQKxKhciE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770804; c=relaxed/simple;
	bh=cbcMcmlbjtAT8b4+gF8YGTWbSKSzZ8NVvIsgP/AKuwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F42nk8wFwjAW31r9S9I3FQkhPlA+cFrCGKX+u6P156XEWd5yoeZN/+P4NSq7sHS5wgJWFtthzTomTgefPZS0tTdlaIJ792f1xniYVXOLyV1XxKOrcdmgkv7BKo/yYhcM6haIIlBLdBwSW+UI5ABOeQtc6FXszU5wNqivJOm5S5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jDIzpdRS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdm11024656
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 19:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i5aonaPIAkvbsT0V7cfk3ibR
	wHajdLgS0bN0SFcHVGg=; b=jDIzpdRSXFh9gEp4fLweqoJydK1dXbY7MKzVrcOz
	a8uejzaGsLs4NZl2tTeX3svcKjGyZaC3JultHrSKGW4kJi35UtcnQ0V4i3Vix8Uv
	TfOnGrn2qBy0yA64ykWm00zJskXGcWjkv/n6Afp643JA6iX+/T2aVdfp4fR7oFbe
	jCSGAdkZ+G7j1aDnGqdWCpjmCNUVaXdEScKtnYzNQs1v5BnHdMr0XZMkHCi+ToVN
	y87xKL9sZbuUGvBm49/ntuK31wJqCB5ffV0LiJ2QOYhGQbq1OroGBf6+SPAFIfP0
	jr8+se2ZnTrgWN6rSWLPojZmssZY7B7zgoDPHyEHSmhnPg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf30fvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 19:53:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8ae0417b6so106836876d6.3
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 12:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770801; x=1748375601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5aonaPIAkvbsT0V7cfk3ibRwHajdLgS0bN0SFcHVGg=;
        b=hEbnwfgW42gcdliJpxDP01C6A5geYJNiZgQZTgoSATuY4RFM1YPm+dLMliearMZ7vC
         zqAR2uM0Xho+BIbpQSCivIgrmGS419aPygM2yWjXyJAN6WwaSVQdaHBsuTOa4xBnOW3k
         kMpy+cIaxW4N/FbaO9iqDuLtRVWRwGWbC6BZEtPxB0dfyuasRNhf7IFfovkGqDlSUzUF
         N14CdZTJ0FiQwNvFssHW8m8sgJqbn2QKRta/0tzxI7iExa0xOHPw0Gm3Q1ZPBZJaDYLM
         L1Lw1tVX/fsgoJsDsykUMGNvomrkEBYZaEnxG0YvTD8ZqZwtIw/WL3BujzTtxqFoyUYL
         vmTg==
X-Forwarded-Encrypted: i=1; AJvYcCW5i6BZ2ufqtbz5cXRlpZm3NSSZA5A8N2IjTYKDY162ICQX9OTrDtscTQQI4rNcbRquj6x2abpYpTnoYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJtBsygajFd8PSEu1p/2gUS7R3ZpsNDAU3p3EWmDSjDSOTkm7k
	o2PTJXLy6FDuvxmPXSHIRiC+JeAzw/R21HWlYjOC11bUWl/+AToKTrvKGxHyAdpGlvjEyfnMFsK
	7pPrFpZNfhWMfYuZU411br5YsHXRzHf8kzNpEwigt69mF/ilBb/4V2X4zsdAUYkvxZosfFfJLJr
	kR
X-Gm-Gg: ASbGnctjPKpCexgGhrOK7ZYU0aWcWktFUp26x79ysuCZmoJUwKW2VGAT1dYR+K62Chj
	v6cVLGoXFZvEHpP2LSlpsO2R5K4fXJCsuKl+Ag3iZznj7h4VkXj/wYrxJdg9XewHxQDjqAq9YHI
	dSpyAgiY8aItdKQLzJ8FoVFh6/D48GxNTTBBQdN8RdHVQ0tzLqA2T1JVmVR40PhEQ+7QFZA2OGu
	H1QrdRHkhnNp25q/WnoJ7Q300Xwt/1gcdy5K1Dk2GBhwZIYawHsHseqDI50+Kbc/IvvW2QeVHMX
	+Yh4PiX0M4cPT+jM2fhkfj3vRHghI9yHCZLEzPfGC3itVK7TX5OLgn16I85ai/Vu7C0y9xWIsu8
	=
X-Received: by 2002:a05:6214:202e:b0:6f2:a537:f47e with SMTP id 6a1803df08f44-6f8b0881b36mr298714896d6.42.1747770801080;
        Tue, 20 May 2025 12:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6seWDXes4rNoHVANTe5ljrtRMlWKBBOEr44H3bHaU05H3MV8xBXWEhAY/qN3HOFoCI+hEmA==
X-Received: by 2002:a05:6214:202e:b0:6f2:a537:f47e with SMTP id 6a1803df08f44-6f8b0881b36mr298714416d6.42.1747770800694;
        Tue, 20 May 2025 12:53:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f52csm2477061e87.234.2025.05.20.12.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:53:19 -0700 (PDT)
Date: Tue, 20 May 2025 22:53:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8939: Add camss and cci
Message-ID: <5acpcyzscv47uyyjhtpfi3x7oh47wafo4n6kd5iu6zs7rkpzro@nwkupv5mpjpi>
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
 <30dd203f-d7e7-420a-b310-2c36869f3aa8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30dd203f-d7e7-420a-b310-2c36869f3aa8@linaro.org>
X-Proofpoint-ORIG-GUID: Y5Ap0RUneXHsa4iP3Qcedn_7j2VJS-zC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MCBTYWx0ZWRfX1SumpwKBQi5t
 lMr/CkhV2CDy7hq4smvd0l3FFHLGGkVhk1ryvOcYrsym/cAx1qUUdCZPjNiqMPC1VX5MZ+TuHXt
 mFhzXf9gOB21s3/5NhwDXjGpX5ytTAtYuqxfQw00eSDXXS4N/HjArIF+de/6Af4NhuLcFWd/RD0
 m+3zIgHo3SkkgwZM+5KdnpZmVpvx3JHTzEdqK8T7mISBR6QdnFuxJK5btPljfoGT2thxJi1Zd+O
 HQ+xHJnbctCMb6Jp/BG/2YVT3qP6SVG6UaNTxIrRf7k0lE+p1EwswdtPR5rYMoD9T+jyXI/PdNN
 hI5TBXWLK/Y87V3JtfVBWH82w8C1378BHACV26S2+RTX1vqMokyD1ttwf62RWAcB8Di94pK1JUY
 VpKbSRe80ZpW+dw4tRXdKD/nsDGg6HnZ7WFMVv9Scpn8Jtsw2uFMel/s1mArVnd25S4/+WZP
X-Proofpoint-GUID: Y5Ap0RUneXHsa4iP3Qcedn_7j2VJS-zC
X-Authority-Analysis: v=2.4 cv=a9kw9VSF c=1 sm=1 tr=0 ts=682cddb2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=a9wmfB65m3qGRrS3yC4A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=732 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200160

On Tue, May 20, 2025 at 08:23:02PM +0100, Bryan O'Donoghue wrote:
> On 20/05/2025 19:39, Vincent Knecht via B4 Relay wrote:
> > From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> > +			compatible = "qcom,msm8939-camss";
> > +			reg = <0x01b0ac00 0x200>,
> <0x01b0ac00 0x0 0x200 0x0>

No.

                        #address-cells = <1>;
                        #size-cells = <1>;


-- 
With best wishes
Dmitry

