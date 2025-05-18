Return-Path: <linux-media+bounces-32706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 366C4ABAE88
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 09:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21EEB1899B23
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 07:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20521DE885;
	Sun, 18 May 2025 07:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pmdf0UZn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5213C30
	for <linux-media@vger.kernel.org>; Sun, 18 May 2025 07:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747554837; cv=none; b=l+zryzBXkI7FA3n6gkDv0Yjs/F9boxFIwR/CdDvqE1YYkDsKQJhIo8qwD759QdmKp5WmUQuwisF9lRK+blPmSQfxmvdQTBlS0yWRcRbpzSZJtFkQtKYrirvRzAKmPLmSE86D4d36rlOiC7eYRHEan9o/q7ueJgWR5+Q6evMsTAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747554837; c=relaxed/simple;
	bh=Gd55qKkP2RAyQotoXpy3bz9qZf9+eboVp2M8Dx2fBqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McrkHCUZWafFqSdZWgMAXITAXuFnrveVL3n1X3pLD99MbbsOF9jm+bmUyBeU5K91lGfNM99n2rwU4u8O6cdZgp/7mAAE98g8gX4awEYtBWIwiVUb+gShKr6lORRFS6/lSseGDYWkZ0MNryd+hCD1Tm4/ZnicrWjbPkRAcxm9sdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pmdf0UZn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I5e2Ux009964
	for <linux-media@vger.kernel.org>; Sun, 18 May 2025 07:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NCH+kNpv+MTmqfuSvretGbKV
	gr9iuqAvqLCjN+G0eSM=; b=Pmdf0UZnmApJ+osE1qrPh+6i2oxrv7k/OGaB4DfS
	LBshRMH9KLDA6Mz0owk9OjgLbWxaaabLEl5GSn5paes52lUAXpDGqvcTL6V+rV9S
	cfRlLrrrqYAF6PoH1XywYC0Q08OJHl/PUaimVkPfaWR211WallK7Xp8yI3v4skFg
	4+nwvzsHTmcQq+IpPs+4lSyZZdGkPJmOUU//CaN1jdm8Ke1w1+DIFIdLq5X74LzD
	IwP7UVNN4wUeBgBhk6WQJfOwRktGP+N5bBS3ojrSH8jEFWe28F5/TOHITRmht8Ip
	aAkXm65Dye9RELxL2hvglDEBIkoqj+Tj3szc1gmkgf/eIg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9smte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 18 May 2025 07:53:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c8a36d8eso17384376d6.0
        for <linux-media@vger.kernel.org>; Sun, 18 May 2025 00:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747554833; x=1748159633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCH+kNpv+MTmqfuSvretGbKVgr9iuqAvqLCjN+G0eSM=;
        b=mWDkGETjcGF9kT2dy2ScowQV3VuYmK/OspdCG9QL2695ZUOM9HeSY3oKVzlgs4xZfH
         X7axAR5qUwYlfKycj/RpA8OXLAxmLzl5rY9txeR98w4Ow1wae82BClMKgWY1L8m6p2oD
         +ODunou284t9/p6JoxmqbndouerImpMRRxXlWSuzRsaVvxfBdN1xXyi/LJLDH8v4taoN
         WRZX9bdoyDk/sWAu1ygjK3ci3zqP0+6BQAZglh27U01uoa2gEvdKZcpAarUR1DwbMhv5
         8wqh1aHJw0PPAOlIQaKuIjacvF+SlYJtqzNeInwDF/RYIfdewfJub9xa+ZsfismCzRfD
         XkZg==
X-Forwarded-Encrypted: i=1; AJvYcCVhJZTSHUhbiTkYtEnOIsNPhmMrbLbufnsmX1voTqL1CcEKtbOSdo92oduhlIcBM9gp0tfVaIHaOimsdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzqsdtJLX4pLptgCxwe0+pUgNUoB6LpzvspwXyL51gcpDlux3m
	Dodm8I1kgl9tzrAwnA84ELsgDcGxBbtw6jpLrV0Zsqr5OkS4U17IFOfRhjgNfR+tdRAPSoN04jd
	y88+VF9wT8pdijkGhnoepJQYSwiTaeBWvUpVjZQQqV8U0cL+UCoRdCMqT7sCYhsjrxw==
X-Gm-Gg: ASbGncvOB/zOM7NT22IZjM5HxjLwqrfau20PouwPRv/kpWo6XLk4lAeArOCE9cMp2hU
	tavPL5hLyPPG2TNx3G7BiNPGEEB7eVpqaM+P71Dq0pIljhD6kXqQW1B1Wfq29fUZa8g+mBAlLUh
	rqDMGNVw19QkUqmfTEFq69mWO2TV3lb2an4FkjCRRQ8/cQdZg3r80kiFyY6oifEPO0kJ53tlPrJ
	xpO0txjLpCELS86noLgv7zssifZZ/IMs2ETt6T4g9QOSASbxYSSKzt/YiG6hHQFAa+IJqRNjtIg
	2hLKHKqHeMnn/Pn8YeU+FFrVWrX25s1o0bOVER4VAA8Kdb22ZSI+KN6/4UToEeZL1wC71zBQz5Q
	=
X-Received: by 2002:ad4:5f8e:0:b0:6ef:3de:5ff7 with SMTP id 6a1803df08f44-6f8b0866722mr157539866d6.15.1747554833473;
        Sun, 18 May 2025 00:53:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5UQa6GtkbtnH1jyMstQjulp/q5Zi30s8N50lryqhsEDLJ9mabwv/z0hxlSz4ENs+TLfPPyQ==
X-Received: by 2002:ad4:5f8e:0:b0:6ef:3de:5ff7 with SMTP id 6a1803df08f44-6f8b0866722mr157539606d6.15.1747554833090;
        Sun, 18 May 2025 00:53:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f161ecsm1331272e87.43.2025.05.18.00.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 00:53:52 -0700 (PDT)
Date: Sun, 18 May 2025 10:53:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: Add qcom,qcs615-camss binding
Message-ID: <rgomihkry7flm3kjbd766itt6lvi7shr7w65q5iujkin7ermkh@dcfd5v76fmv3>
References: <20250518-qcs615_camss-v1-0-12723e26ea3e@quicinc.com>
 <20250518-qcs615_camss-v1-1-12723e26ea3e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518-qcs615_camss-v1-1-12723e26ea3e@quicinc.com>
X-Proofpoint-GUID: EYVKVseHHb9IM3PI_lABJk_E3OdZEO05
X-Proofpoint-ORIG-GUID: EYVKVseHHb9IM3PI_lABJk_E3OdZEO05
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=68299212 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=PrroZY9GjRLnrjcbjksA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA3MyBTYWx0ZWRfX+BWmLsvZwQK2
 6Qr2jb7RUIFmBNKSfLuylF49ZiFjS8M3kCh18yI6+r139a94sOvsoOnvQnJuREXPHiys6FAMq+Y
 dMHu+lj3qituHzFj7G1rmMNzdf5MbTf4/GQBgmxv/vj9i2BZEdT+D1b0Mgg6mQjjefUB5Gtai13
 QAym56N+yemS7IJAWyfGRNc8NWLtxw/mj0jimT9XAYdnogUsBVknu1laN4bM92rxZ19gm/EYM2E
 knMB8id8/k3AMf+f+ks5/EGeP1/QZXOGHltoyzB/4ICUfu0al+FFaHKtneX7Rj25TMqHAooGyky
 fccDc0fgzHYv1ADhOGls76y9YILoXkS5XNuy2XcpQczSWKTX0unigYuOew+9RtF7IqiDNUB0K6d
 YcTFB9lt5/MdQRfZ9+Et43qcMHQxtaOhMa45Xae2dfLDz2EIizCKAle1oYWOneQD5zqQvyGi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=954 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180073

On Sun, May 18, 2025 at 02:33:07PM +0800, Wenmeng Liu wrote:
> Add bindings for qcom,qcs615-camss in order to support the camera
> subsystem for qcs615.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  .../bindings/media/qcom,qcs615-camss.yaml          | 356 +++++++++++++++++++++
>  1 file changed, 356 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs615-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs615-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9a87243f88d4b739cc29033509878ae706d3017f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,qcs615-camss.yaml
> @@ -0,0 +1,356 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,qcs615-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCS615 Camera Subsystem (CAMSS)
> +

[...]

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/clock/qcom,qcs615-camcc.h>
> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>

Could you please update internal guidelines: when adding support for new
hardware, don't use bindings for clock controllers, use ephemeral clocks
instead. See below.

> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,


So this can become <&camcc_camnoc_axi_clk>, <&camnoc_cpas_ahb_clk>, etc.

> +                     <&camcc CAM_CC_CPHY_RX_CLK_SRC>,

-- 
With best wishes
Dmitry

