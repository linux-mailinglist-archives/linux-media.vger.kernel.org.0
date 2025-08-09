Return-Path: <linux-media+bounces-39189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCF1B1F3B9
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 11:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70C4217394E
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 09:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98C51C2324;
	Sat,  9 Aug 2025 09:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9acF1AV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38BD278E53
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 09:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754731621; cv=none; b=M+wJJoSiqviw6kbqNVbGPnQLfX84YDy7Gmplj6NatZoi+L8Wbo/ziI6CHt7UhfevqNsONJtJpvS40abpIwB404yYqOzIfs5WJHFUh2Q3Sjw5O+X/aSlRrrZ59B0OGy73ux6hftsejbCBkLN+GT6v4uINLy5ZAN7THQwh9BnSL+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754731621; c=relaxed/simple;
	bh=T7tboWC5xtuyrDW3s626muWuhnmco34lDVGh/CoMmD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ikbx+DIdJmu9y5FDdm8sVEPe8G4sTS3L68kGm+KGzfa5CgGIiRc0REUVfmbMKs0D5mTnW7Q3nCNZCasNEq1NH+R8ZUfKNpRpIZqlW43Qf1d+h8RgPGk7FcSDNIGnlJ6gZHlbl9xj2JcGDwN3VnOqStO2gH2hF4TRL4kLpaTWuoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9acF1AV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793V8KT002621
	for <linux-media@vger.kernel.org>; Sat, 9 Aug 2025 09:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0WTGJH2/X5+ynM87MTlCWOVw
	L56/kR02TEtFJ3cp2Ec=; b=n9acF1AV4CJ492lQcfaBSsDj0oUMIp4h0HI/aMlD
	9PjtJ9b3JyilYp6Y/JjceRGzXFmmJQli5DRpnQhKemevEwODvUKtaIlHxvg+pw/7
	7wVUEtBtXrg4IGgHB7HaDC2Z/2qC17IQeb6UmC/oO0jYRauUhDVGdXnGk5I9DimH
	iRcJj2Ir4Eb36qD9wiuoXjhUbes0r9nWoPyMECrNzfFcnkTcAh3iXdCNz7pONQVh
	KO2uySM1y1VtWkbzyr30vX6n4KCNDBrrIOi3pmnOC3MIq+hB0bQKw0wXQEPHdzQ4
	q8AcfuemFAwvQ4io8OZtU3u2++iVaaWsjEIac8rzZznaBw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sgguw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 09 Aug 2025 09:26:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b096d8fc3bso65632751cf.2
        for <linux-media@vger.kernel.org>; Sat, 09 Aug 2025 02:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754731618; x=1755336418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WTGJH2/X5+ynM87MTlCWOVwL56/kR02TEtFJ3cp2Ec=;
        b=YwTFkpnFVLPq1vXIyg2V1PwQQQECJG1VI5fp9ZOqPVOr0widCCi9xY7t6KVrTDYZJ1
         ZN65HAo0WweQXTiM8SuL76Wqmq7lXEFhRbi65Du66MH7Louxv+Rs+74pz2OOzF9aKfxY
         g5JOOTXrwJoZvtzOTAhqekm22AB4lpA0I8TIRl5/n5UHTGWD4ilGNJi+bn+Bw8SiRcpg
         gkuYbZ1GsGjDlTBLIspa71kkiy/Bj0jUJUiJll9vnZP2mN7KnFXNs/B4PKOmAH4SE++t
         Z3OBucZblF7mNMwenCDz9yz18wfvKYV65gEASwwzQmikpXVfJuZG7gTSONkMrgKahLXD
         6wFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5rHEiU6NUVVb6CAxgk9SmDIX3K4lFnCd4TeFk5rrQcuR+ygAJbrNokNs+dOJRiiD6nE99xsfuqpTrpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP6Z5fMx00Ku3F7V9hoz8YohSknQQk6E7KVj33ZG9f/7gfvtP9
	eJu6kiZqqzGLg+2jBezYZ6CCBdAufEOIeo7m7LxicOZibTfxZPu4tyqBRQqpofFfpQXPy5MJZf9
	WlJWD3EUTn+GgEkeudUh3rfxlfP3gurm/jG7ChS+Vrdsrojufbl6uZX/TLeSbueR/sw==
X-Gm-Gg: ASbGncuG1fufHBS+yvPy+ef2bwvleATKR1QJOdVcZ9LHUZ61amrx+Kszpfk9JnERGa4
	dZoVD7d38Xe4iLLkbAuBOjf95FEHFjT4PTDL03fkFKtR7Tf08ZiaOrWZWziTUHKqwXliaBll7ZL
	AWMDlPedw5HvuL9fDc4EN7HSn7Xt76G8a3Bts1Gb9+JeQzwBrdYMbHtbTNfZqIgAdA8LICHsVdL
	k+a0SYcq2n5+NLb5BIpxy9K1ZzKk19teU3oa4bQ1AZZFteFRP0WippUBgzmfzqskTMkmnIOFY7H
	bfbnId/ek6kcf2Q+a9TDqfutCnLhZa4YjCjXRnaXvsSk3kIA3blQ+Zv9V43vJcDvtAjI2OhyjK4
	yI6rEmesuEc5B/mlnTc0XCL6YQ5NniEJpACYFadLsb77MKgjhLTwf
X-Received: by 2002:a05:622a:1a9d:b0:4b0:699c:6083 with SMTP id d75a77b69052e-4b0aee3455amr77335041cf.54.1754731617717;
        Sat, 09 Aug 2025 02:26:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjB41i2CRfA5m9ojPwStfOn6feqjAz3XYsVpgrlnxVTxiq+h3z4Kw6kxYAr5H+O0CCQ4j4Jg==
X-Received: by 2002:a05:622a:1a9d:b0:4b0:699c:6083 with SMTP id d75a77b69052e-4b0aee3455amr77334781cf.54.1754731617174;
        Sat, 09 Aug 2025 02:26:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88ca2e9bsm3276386e87.123.2025.08.09.02.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 02:26:56 -0700 (PDT)
Date: Sat, 9 Aug 2025 12:26:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 09/10] [RFT] arm64: dts: qcom: sm8250: extend CAMSS with
 new CSIPHY subdevices
Message-ID: <upuv35iaf27dbpr7dwxmmw7qd3ykszh62bbwxltwfexpwzgfvm@qpxeeoiv4zsg>
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
 <dcc33f04-1b19-47d7-aca2-03d38173b6b6@linaro.org>
 <eb42d052-1fe0-49a2-9a83-05c5a5b7394e@linaro.org>
 <63ce3c8b-51a3-45a7-a40e-330839d7dbf3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63ce3c8b-51a3-45a7-a40e-330839d7dbf3@linaro.org>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=68971463 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=rHuCzYw7AAAA:8 a=KKAkSRfTAAAA:8
 a=LMqgvOWI1VrB9Pf8dzIA:9 a=CjuIK1q_8ugA:10 a=ppdfHDQsi44A:10
 a=kacYvNCVWA4VmyqE58fU:22 a=m_JjNGcxB5ZvlCAwQ5hH:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DLHiwv4fnDCPdzBByg7E_MKfzK7mm5Rn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXxP7gKKx0CxYe
 QWbLojvHTvdWuz7EmNKXta+jKr78Ac6YnnaR0X4o3Y+r+yFmQGNqpzchgwWfmBUgPCMI7WXOtQ0
 1z61ISkKv9ds6bwh2aCcU3jPIH23u5bgYYeSOSFgpEmH+G+mgMn6XJzXv+zYhhl5Zv3QN0+xOWk
 lPsuEF2dUNjTvLXc7vmkraOmgKriwYWz8fcuzAFpY8QCchjR8ho6BQjNec5//xFNtWYmaLzZmdy
 Q/y27kc/GEW3fW9aLywU8/oTQ2w0OXIojjYzZvsJcvOn3ox18KeEizIoWXWH9YiP5zkp8puH7j2
 Vqtpvyfn5LC6EC/6kV8O2wktzq68s1mM8SLAWwKBUpwG81Gt50xoCkI1duK/hYVtqlqBKgmjs7y
 WfFdsMgs
X-Proofpoint-GUID: DLHiwv4fnDCPdzBByg7E_MKfzK7mm5Rn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On Thu, Aug 07, 2025 at 04:07:24PM +0100, Bryan O'Donoghue wrote:
> On 07/08/2025 15:17, Neil Armstrong wrote:
> > > 
> > > https://lore.kernel.org/linux-media/20250711-b4-linux-next-25-03-13-
> > > dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org
> > > 
> > > V2 of the CSIPHY above will incorporate feedback from Neil and
> > > yourself on adding endpoint@ to the PHY however I think we need to
> > > have a conversation about standards compliance at attaching two
> > > sensors to one CSIPHY without VCs or TDM.
> > 
> > The PHY is able to setup 2 lanes as clock and connect 2 sensors over the
> > 5 lanes available, like for example:
> > - lane0: cam0 data0
> > - lane1: cam0 data1
> > - lane2: cam1 data0
> > - lane3: cam1 clk
> > - lane4: cam0 clk
> > 
> > Any lane mapping is compliant. There some Meta slides about that at:
> > https://www.edge-ai-vision.com/wp-content/uploads/2024/09/T2R10_Kumaran-
> > Ayyalluseshagiri-Viswanathan_Meta_2024.pdf slide 13
> 
> Hmm so that would require splitting the CSIPHY between two CSI decoders
> which I'm not sure would work on our hardware, perhaps yes, perhaps no, or
> routing both sensors into the one CSI decoder and then separating the
> data-streams either in the driver or in user-space.

The RB5 board provides exactly this setup on the CSI0. It can be
switched between 4 lanes going to CSI0A and 2 (data) lanes going to
the CSI0A and 1 (data) lane going to the CSI0B connector.

> For such an esoteric setup I think my initial suggestion would be to push it
> into user-space, even assuming you have gotten the PHY to co-operate with
> having two simultaneous clock lanes per the above link.
> 
> Looking at the PHY regs, I guess you can set the bits but obviously the
> analogue component of the PHY can only really operate from the one clock
> lane....
> 
> Interesting.
> 
> ---
> bod
> 
> 

-- 
With best wishes
Dmitry

