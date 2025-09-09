Return-Path: <linux-media+bounces-42116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B51B4FE84
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 16:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF196444D0A
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 14:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60AF42367BA;
	Tue,  9 Sep 2025 14:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ozu9A2xC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD8D22172C
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 14:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426420; cv=none; b=XQ0a3G+lyPt3ACC7Qc61hYWH6EJJ//pvf+YiSEwrvoYUNG8bfCEh65m1efIVykwwHlKr1EKFg2yxxxj/X/Yme7PcnmUGIlNEWOxDumcCtH39xquPRU29KMYxBLVIOjEh0RAjxCq1o++T2rZtHOnDTwjcO+KQX29AELkcfpTD8yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426420; c=relaxed/simple;
	bh=LYg9kkS3/eGoksJYpWuzYpEAsLarJctZuZ4l+/3X2/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDxO/D1niSLFPjwfPqDQnuqKaWYBsDCcld9+dRKgmx+mqtkxf5o38d0nv+/sQf31aCEAuv4cfDL0rFNmUsNemgCUB4OUfTUuhmMf0qgoDg6ZMXPg3KopN8AQSL1U6uOJ0g+Bjjy2Zlk6P3Gpa0RSLKupIQCyR4CVyXyDlpfjvAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ozu9A2xC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899M2B5002306
	for <linux-media@vger.kernel.org>; Tue, 9 Sep 2025 14:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RaiuPSwScN1So+PWSJmzhuha
	k5hJv4sAaqtK90ZKdho=; b=Ozu9A2xCN38svH8qQO4SH/IbWO1Epuis5xzMXswO
	7+b4Wp9gy/wGuogKEFs87voIPlwJVd0wXF8+bnwLOW/I3Ks9Prh22YEbJIVUIAHL
	N8QTVvITH4REGAKtK35pU2W2ZoxekQj9I+jaJgMePRWmduvBnOMU+wocHN/C8Yj1
	MLgwrGIVV6d6dL055W0O5xQl8yeF9fMRf6hiDIy7825PHCt/6w/QCbBVvLPLeB9b
	+jnlsT14oC3tLtqMo2i2rQYASzN/Sdo+VuU+EzyFwvzZt8x612zYU79rIot1vNV7
	L+RyeDK7Yflrvkz9S90eUKUZ/EmjxngYyeVDN3XfRnwNYg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg0939-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 14:00:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70de52d2870so38712266d6.0
        for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 07:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426405; x=1758031205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaiuPSwScN1So+PWSJmzhuhak5hJv4sAaqtK90ZKdho=;
        b=EjYuFAg2lbWyP09GQsdYtwf9o1X3aKhNC3+Ki+OClEF9+4SV4edQC1dfpFEQGHC0GP
         cgSwbL6Y6SYTEPODspNytwBR1Jldl1fXdoG5v+t5uvnden6jETk7DmGZFY1HjVNP5i+G
         H57iNk4FVuprrKovEbZofUW9rlT50yIWISSHt91bsa0J4xgZnoBXDSFa9orqCziCHcgB
         3ySEkJsIwd+a8kdLS1uVTci/yAXp20uy/8mssFORkNj3bQ1yd7qMsSNN6Y1Gt9XWsbXY
         uKNyTsq6Xe75gJe23pRNgqxKMz/U8TXl1IJ1JJ7gqeqGUA0T1c/VLDqpXjRud3k9iabj
         Bu2g==
X-Forwarded-Encrypted: i=1; AJvYcCWKE8j+YadzU5GxtPw1CTrMCEDbeerhd5Ppx5LW0Wvuxazd7/1pAixNg3wO2zhom9RgbpDu+QNDuz7/Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxsaJJr7lJmMGT5sPuqnK+EFMEZjLgpMFK29nYZ+hmzxIcGfrf
	pY9Z53G8WCNfudfbr5snvt53Rj3oVQyxIWGS9MCX0885nINtsfhdfhjR+JgXJd0dN/FV8PHPuSL
	YIITRkGvT8Dz7DdlSQfj5mrq4JtY6c/kZLGxXUWnhQNVZ7VrnzJX7XARiLmivl9XT3Q==
X-Gm-Gg: ASbGncshnxwn319vJMEBBP6lLP1p/T225tI0cHdO6svicEvRie5psWSC5sDATOUAD3g
	pA5BdfgUPMrzn8OaHElpOfSTSfin53Aciy5SWr0kPXjVA0DFyuG7Omi2ZNHxLW/iYvikN8+akJE
	lTVsE2dHVXnif1AIoz8QWCJpANd3G0qpoWf7LmW8SNn2TTsqI4EmAfLJybtmbYL0Mq3v6Hun6mv
	XS1DPbPLm5zzTp7ZVPKrN+FcbhJ9jf2Yj5KJi3inEgp3WDSYDySl8HWNzmTj7oUsAlxj3386Dfp
	DLydkVuUHmXBJEbnrCqjZF7jA3zyIbo1zQuYD/mxWbHPKoy1qUPaogrjxlVQ4bPKsV3uprZ+uN+
	rZ26ouOCZ6yYCRj10/e6SJdwi1XbD3FbSgi23l4QfgWuizOcdU9fk
X-Received: by 2002:a05:6214:e85:b0:758:2117:887a with SMTP id 6a1803df08f44-75821179a69mr16533336d6.58.1757426405038;
        Tue, 09 Sep 2025 07:00:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj1Ux9j67rzf37hWL5A8Jozn7wOidkUvzvPy9tqT1pZirgwULyxpmO/uSUwFeT3zwLe1DRvg==
X-Received: by 2002:a05:6214:e85:b0:758:2117:887a with SMTP id 6a1803df08f44-75821179a69mr16532636d6.58.1757426404347;
        Tue, 09 Sep 2025 07:00:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680c4246b7sm546172e87.13.2025.09.09.07.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:00:03 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:00:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_svankada@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: media: camss: Add qcs8300 supplies
 binding
Message-ID: <ez5d76piv6srwceueajokplx73xj6xtgvyqgtbpjkdtoo7ijgt@7xn3uxzdcgvy>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-5-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909114241.840842-5-quic_vikramsa@quicinc.com>
X-Proofpoint-ORIG-GUID: c3JDOKIFlo0AByHd5U3ylfyAL-HeVNok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX6fp8jy2d9XTz
 Sx92QYaPRO5SpmguE6AhylgqZ8L02Oq2pyRzQ6qbnWfa1r2qSWn90ndRvDXVdpU6W1BB0pF3o59
 Or4bc+VXOkPaA7s9P/AA6K1jg02aKq6cYfzgkOVPh9V2JvMEbaxHr1QxwRfKHQgokEQxxQRxkvw
 ZJh396XIiccdBCzBFS+0IrGtQkIXiPNCA7eqDSyx09qcLo1Y0bXKBPFqWHvrc4U4WZtFr3nQVOx
 Hh1m3YUfB3rgWY/TOdXLu2w/c1D3HGsgyOreCnz2OB3x/08wl3diyogNfzZJKPGU5bZ8BcjJ3iD
 NbTCEFrmxeDniVtkvWWipHIrm+fyo4qHGM8UZiNRPSxPoSXct5pN2gmFBrP9aqP7D+34D38Lo8u
 J/QElpoh
X-Proofpoint-GUID: c3JDOKIFlo0AByHd5U3ylfyAL-HeVNok
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c032f2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=vE47tFul03BpYyIIO6YA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

On Tue, Sep 09, 2025 at 05:12:41PM +0530, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Add vdda-phy-supply and vdda-pll-supply to the qcom,qcs8300-camss binding.

Don't describe patch contents.

> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> index 80a4540a22dc..559db6d67f06 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> @@ -120,6 +120,14 @@ properties:
>      items:
>        - const: top
>  
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -158,6 +166,8 @@ required:
>    - interconnect-names
>    - iommus
>    - power-domains
> +  - vdda-phy-supply
> +  - vdda-pll-supply
>    - power-domain-names
>    - ports
>  
> @@ -328,6 +338,9 @@ examples:
>              power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>              power-domain-names = "top";
>  
> +            vdda-phy-supply = <&vreg_l4a_0p88>;
> +            vdda-pll-supply = <&vreg_l1c_1p2>;
> +
>              ports {
>                  #address-cells = <1>;
>                  #size-cells = <0>;
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

