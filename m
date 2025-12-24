Return-Path: <linux-media+bounces-49443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9946ECDB5BD
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 06:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70C5C300910D
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 05:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4F115530C;
	Wed, 24 Dec 2025 05:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kVig/kiC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i2cxGFDc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69AB7082F
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 05:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766552612; cv=none; b=g3V8+GhHYyqlL0ik54wTE+D5VOV6wn4ab4pWtDvejYI5fEuS/hasEDzXEJf8zKvenwAMzrf51e6xb3v0WKwPq6MI3F1UMjcc9GChtPhhF7BHu+8k9fGl6n5I+b2ToUHhXHw1URj20bpgRV58AFcW3efIJdew84vGsbvzZ5HIGhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766552612; c=relaxed/simple;
	bh=VBHucSIk2mL+cP78ZIxzb1+etZueT3233H8ESPtlA2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msYaOAqYnP2k8CKl5snyEL8wTRYIMeBs/9nlcvBu8OMS+ApinxBAMGZQEXtWoWOzImJpr7kbjhX2GhgEFQiGstFBi/zjHO5xn5JjH0FVIqwzhNrbAYQlXPHRPlZos+xgqSpkOl2I5JoZW6CiZDnGt/2O3s88mhbq8RYgAxs1F/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVig/kiC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2cxGFDc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3wKUV3796520
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 05:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=liuHTqwVbAYEe3Lp7EYXcpno
	orb5ueWy4zH5whvl2ZU=; b=kVig/kiCLit6tPWq0LxVdoL0Q6LwTX3Q2p9wxNaR
	SY741qmHov681U9Ubq9MWh8W6tnmMaRMMfUMhrNXb49JjJaIXIS0/ZuAfyer38j6
	NYbSHMURrS2Q36NkmrNfLCoNgS/37B94UrabOqifJH1nmW+Qog7I99v82edmd66C
	ji7KT4I8j8Io5LwKB5piKUxksdp//zvg3Y6cAcrxohVHwb9b5dKozz9HmA/uh73n
	Cwt6FJUHx4rZNEnyApv/fDgtVtY3dd/9CXka8NzSsi6hiAQclT2g/kzYzUgx3uQP
	I3KijO97ZQiT/bKD1gLo9UGTYAs41lVolghXFqtJd69jqQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b88r683vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 05:03:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eff973c491so139597751cf.1
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 21:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766552609; x=1767157409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=liuHTqwVbAYEe3Lp7EYXcpnoorb5ueWy4zH5whvl2ZU=;
        b=i2cxGFDc8qwv+4FV8lDzcWe0L8QRan8YNqYp46FjedvBdciPD0zNyj12Up4n9Dnrk8
         VTUhM9+8uaaRjUMxPtRCFeuD/TRxvm6yX5KMxGtNsV09FNDKkoQkCkkLMUAzT27H8RXt
         Z5awtfflMtcHrNtNaQdVMogicF9e8zYZ4ictxYSy32C3ZHSMbvTHLyDRNX6YcZ6B0sVI
         jQ6JTCLL3fnZfftuCf9vUHSlYheJxliYShxfbb+XwrDLOtIeMWfHoFpK/IGHBLztRFRj
         7478keUjt3nyrIt9Xpwrvcw+qY4NtqJHKmys1sUI4wdNdqIWzrG2uv5l4DjBWLDu377q
         FRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766552609; x=1767157409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liuHTqwVbAYEe3Lp7EYXcpnoorb5ueWy4zH5whvl2ZU=;
        b=W7S7AFRgMCed80rnAQ3LK7ezNto7UCvrRBkPfPfZG1UpnM4E4Zw4mDmPMEKDRpUP+O
         i+QQgPZE4UhFmdo3yd45bWHMQYnqzAQ/o2R2i0XSPsuC8M7s5ECpHyrixvdDiztae4UP
         E+zLJxYbutCTdZTqqaYT5500xVbC15mLox4xacq868/SbeOksUYVPJIfgd0ClyDQGQz8
         TD3EVYXOLe/yTVCNpyu90TAJp+gryQtQ4JhP6/RBAZ/RKTosCIu+o3N5yDBiSBhmaT5L
         MyGKmC/Pn941w0qes/nW4ArNPrkMb+AF+1iTQyHVLEM84Wb0jqxsn07bQR0Jzi87oJhe
         XZ6w==
X-Forwarded-Encrypted: i=1; AJvYcCUR1n5MepW60WSrnrXGPefwPezDXlvuihRvhvI555C1PlINBuKKookMpvdH/K0JU8ew5dXx0BoGx/EDJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/IOwOadJuWsL5dqpWbJyIHfx8shflPtjz7y1nUeBc/OXIm8xa
	3ySNs9v/0Eg3axf2DRNA5fAfRtjxS2E18TIcVhS0dkWHOzp521QVOhk01AdQ2zxDRoPwYGHn69s
	HmNhoilhN2lZ5cJFAXBVaRNTpb6BLCDzoZxq5wX58KFL37h7ajhFtWRAnOa/pxmjn0g==
X-Gm-Gg: AY/fxX4AdnyrXXjJ1sc6zx89hK2cjFTT2jqmFMAj+lfYVvrP946u/3AR2jon7OebyrY
	9YbJijs4t5kiEZ9pyZVI2PD4/h8dwv7P8oky+4Sz9C3SGzif1EJmhQsGf+wpiQ1shZLrTZWC1fE
	6FBhebbgS07EodjX5/rm9alBkY6tOJ1LtRS3C2z3Abvk63a7G0RtLm2R36VzDCzhVC9KSa/hSfl
	D2kkoqMD/TaLGnEDaWevKksUOq4w44oH1xsrjf1SrQPJPcy4dnuS9JL7dAXzmE0QG/3c1mw+Qx5
	O5zKhQ17YKR9yZoHe8jERwWNRuDoN1f8UGXG24XyuBYN0vSjxN8tECcIzvjPOxZKUHMfMFXpkac
	QPnywtt+EZYRX+m037Epwa3jKYgRRaNEpnpUFV2yBVDKO8Avs9KrrKIUlcAXBkrsIcZyN3e49Or
	gPvHQk3/DzygU18q1ncyLF0Hw=
X-Received: by 2002:a05:622a:189e:b0:4ee:1962:dd48 with SMTP id d75a77b69052e-4f4abdcb687mr259476761cf.69.1766552608905;
        Tue, 23 Dec 2025 21:03:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyVkbJxFOo4XDM33tNLMgzo3yaDscPLYW6v0rTNHm+5vHoDZokcP0YbQqxOlSX3acngDj1Xg==
X-Received: by 2002:a05:622a:189e:b0:4ee:1962:dd48 with SMTP id d75a77b69052e-4f4abdcb687mr259476441cf.69.1766552608394;
        Tue, 23 Dec 2025 21:03:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262ccefsm40839931fa.23.2025.12.23.21.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 21:03:26 -0800 (PST)
Date: Wed, 24 Dec 2025 07:03:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: dt-bindings: Add qcom,sm6150-camss
Message-ID: <3342fv43qdkmm66jgc63hho2kd3xn65p2fv3tyk3573izlxf7i@hgjsp2kwqyuh>
References: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
 <20251222-sm6150-camss-v2-1-df8469a8343a@oss.qualcomm.com>
 <20251223-pompous-inescapable-sponge-3fc9f0@quoll>
 <c6174a0a-9a76-4284-8675-bb5ca78a7b35@oss.qualcomm.com>
 <eklzmnlnkanrper7lt46vap54u5giprsmwhwpr4am5ytwyohov@kjqvls5vjani>
 <6b52d19e-8ff1-4bd6-b854-bcabccc7cd74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b52d19e-8ff1-4bd6-b854-bcabccc7cd74@oss.qualcomm.com>
X-Proofpoint-GUID: qaZ2_nu7OMcmBI3HExtl_D3WGi_kcwBu
X-Proofpoint-ORIG-GUID: qaZ2_nu7OMcmBI3HExtl_D3WGi_kcwBu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA0MCBTYWx0ZWRfX9ADjbB07eGOH
 y7gQchcZPGmEzVtE+EDcOJQZAAg2yU0IYb+U053b434K1ZMGAp91cBnT1ZKxV3pF+0LGPXf7/tL
 ZCfkCAhuLe1yMKQ5nwh5No2i9Zz/1VyIvja6yWlzAcL9sqGM5fWk7eZpWdOfKBcPzKmDgshxt8m
 7kBBPeHuEfXUfj2GamrL1SlFQmfKzwDwO51PURrbP5z0rSAa2pTX7xnI/em9/4dvCZ00QSdrzer
 lftgbH5F1bU3ncjH9peYODLSgWdI/uLXQXGpwWAlOukWAlvdzVS1Q3yFIEsCPmLphqJwxCcnqOj
 RX4QYR0D14AevSA3TI4cOsvpUhfZAuQxr1S3kphI+oU4YnVO/Eu3A0f8UWyE67PTYq440ZaMy/f
 Bi8IW9FrAE5hWBSvaxN7pzdw9AaBKaw9TM2vIQBqQ5ciDca+j+4Dy00932+Djr3SSlxFkguv45S
 +eOGcY2ss5daGUyxhNg==
X-Authority-Analysis: v=2.4 cv=Qahrf8bv c=1 sm=1 tr=0 ts=694b7422 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8Qi-EdINfos2Zg447EQA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240040

On Wed, Dec 24, 2025 at 12:31:33PM +0800, Wenmeng Liu wrote:
> 
> 
> On 12/24/2025 12:21 PM, Dmitry Baryshkov wrote:
> > On Wed, Dec 24, 2025 at 11:18:02AM +0800, Wenmeng Liu wrote:
> > > 
> > > 
> > > On 12/23/2025 9:38 PM, Krzysztof Kozlowski wrote:
> > > > On Mon, Dec 22, 2025 at 04:28:39PM +0800, Wenmeng Liu wrote:
> > > > > +  interconnects:
> > > > > +    maxItems: 4
> > > > > +
> > > > > +  interconnect-names:
> > > > > +    items:
> > > > > +      - const: ahb
> > > > > +      - const: hf0_mnoc
> > > > > +      - const: hf1_mnoc
> > > > 
> > > > Same comments as before, do not invent names.
> > > 
> > > <&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
> > > &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > > <&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
> > > &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > > 
> > > This platform(qcs615) is different from others. It has two types of sf,
> > > namely sf0 and sf1.
> > > The same as it is:
> > > sc7180 sc8180x sdm670 sdm845 sm8150
> > > Do you have any suggestions about this?
> > 
> > Which _names_ are used on other platforms? This question is quite clear
> > from Krzysztof's comment.
> 
> The platform mentioned above either has no camss ICC node or no support for
> CAMSS on the upstream, so this is a new one.

I did a quick look for you.

kodiak, lemans, monaco: ahb, hf_0

x1e80100: ahb, hf_mnoc, sf_mnoc, sf_icp_mnoc
sm8650: ahb, hf_mnoc
agatti: ahb, hf_mnoc, sf_mnoc
sm8550: ahb, hf_0_mnoc

sc8280xp: cam_ahb, cam_hf_mnoc, cam_sf_mnoc, cam_sf_icp_mnoc
sm8250: cam_ahb, cam_hf_0_mnoc, cam_sf_0_mnoc, cam_sf_icp_mnoc
sdm660: vfe-mem

I'd obviously hope for some unification here. Other than that, we have
two clean winners: KLM and X Elite+SM8650+Agatti. Yours proposal is
different from either of the options. In fact, none of the platforms
have the same _approach_ as yours. Why?

-- 
With best wishes
Dmitry

