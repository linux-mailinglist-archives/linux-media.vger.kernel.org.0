Return-Path: <linux-media+bounces-48578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7126BCB3DAB
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 20:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E644930651B0
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 19:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2EA329E6B;
	Wed, 10 Dec 2025 19:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJdSGV5n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUwdYX1T"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF8A328B56
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 19:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765394739; cv=none; b=KRaLfY7J8bKwm12iKduVQdiKCTEuyY1hjXiZNpSN6Nj2O5I8sTU0PGKr3meaVxskBh3xv9eiFKlBoofqN9rxuTshyKggkot+Rlj+B1auOXw6esOxQMjzPplmn/gC9xtyfwySj1R5ySo/Ixnor12R0cSOmvEgBlS+8T1uAVK4qDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765394739; c=relaxed/simple;
	bh=D7mudJPeI1hJDn6gDAv1X9rSTls8Dp0//jRa56bM8Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmOyQHF7jd8SpdcBG8LeYL+suAVKyLind4slvZupTXEFInpzzs4vlrQBsdvadiQUqZ4Fxactd4wuVVQ23+OGoQ1du5gquZx8/2ssxB9umNi3tYu60RCm9SMiqLB+6kREtB3rEXuiEMMPSqRdE8CH0nO4WOYX+P4lJnGZ2cGVQrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJdSGV5n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUwdYX1T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAIRTAb3358991
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 19:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNUvDiFSuk29+BwU4LM3UlXsy7CBSwI76eKHWW5aQjU=; b=cJdSGV5n+Ug7pZmz
	N7PadnZ1b388lw2/TZim/4N4ajzNvbAZzxv5828XnUIgvJFs0H2qKCSACx7lLUAE
	OOeRBOWxHDBZniRqOlE/bEHyXDsSD7bBW+6Ci6YHGEeNEQj27lB4VPGjFpyqhGVr
	56Q6Ka5Olch6Cudj60IT+j9wM+U9jIxYluJ9EuOA4W/I6BDDiOrmoYRMFuXxyfjY
	/8/TatlUI2t9oF93tdIbGXhlTX1alzC1jOkvMbZg7zujVO8bjmBCLC8oSv4FFNzI
	N3fcOzaLga0B+Mxznl4KVSXRGsSKCvtuwv4pCqonM/o+Pdj0qY+heDXB2bE7mcyr
	bx6m9Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay7pp1pab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 19:25:37 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5597b3fbabfso282842e0c.2
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 11:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765394736; x=1765999536; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sNUvDiFSuk29+BwU4LM3UlXsy7CBSwI76eKHWW5aQjU=;
        b=DUwdYX1T6UQ4vOSJvwBzU0BwAk8dN6seGknQNE60DwbWj0mVPvNTWrSQE4XGHWdwd1
         KOJakzTR5R0K/6rrkE2D+faf4BJZieZnj56ovfW5ho9oNM7czpPnmYVRMEjzuXhvalwr
         N42fEWrxcMTLbBzFXREuQgrHQSFuhgOfJg2FxkozRA5/hzeGMkAJ+gYlYe/bHXv7XZa+
         LGxIEiHOrf4ndN0Li3ip+C6gQKFmgVpkMtgm/qtfM6Bbp3Q3/PgOPmZkZhxgEp328cKM
         FMHdio5gUy/F8w2KCp6krLxKpo3WbbBY4UbdxNBEQUJv5sU6MtGDsiB0Z2MFCnlsvr2+
         TW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765394736; x=1765999536;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sNUvDiFSuk29+BwU4LM3UlXsy7CBSwI76eKHWW5aQjU=;
        b=IQVyeoWHxqg14sGEDV4wrA/0y4RL3wPWMYWYZzBWBId2+CI/X+FQU4i8jSlfn5WCLV
         BmqI66SlmePe4vB/u4r1VYSDYTZbNNY59CSzqsYN0LzVEiAW58IOkY8zpIZkiw+1p6Ua
         B2T+1i7wQozC9NOijuRxJgf3qrZ9QzCCgN9vLrgQzKPdBul601TWR3vkhTWGnDgdgbWT
         xUx/Csa+siRhuNMop5pHSy5klWyqKjM4qqdWUe8tWwKU5UaRX48eePTa+K3SfddmReh+
         V6OxEGXUHJ6jXOtqvUAWmUwtGcJRAgZmSIfB2kwmFWHU0lSPCNgUNtv0YCweZUVRqYg/
         C6eQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5C929GrRzk7dQA2hBBL5rEWFFoUvbAzv3Cz9vG3GhskqyvnjS22EAB9ZpJhvesHiK5xvf55JLlS9g2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl0BPWPTP0HQdd6Y69s3e7V8colCqRDSQkaOfRh8J6BH6MbTdS
	F15Et4AbLEk5irKi3lOjW4Sfxl+idtL0Ry/UjvZUk6KOY5C2zhChmJ2Ufh7DJyJz/J0vFeTf7NU
	lzkUbCaY7dmfDGpXBgkY48DHdUmEEpY2eSjOuequ+0YMa2BEdaVyAm80slv7o0d1cqg==
X-Gm-Gg: AY/fxX77jWAcjQgVhozULY2SBpY8mRklfkgjHnKyb/BcSWbrDRyBXm57JTVhjG3YKOQ
	vFI7OmCD6/QSoyx4VK9jgAE7j8uNCRUxwoxrI3dNNy0I/P+pTXv9gQofmlhRP/9oiGCOQeCUoj2
	7S8YDzQ+q5FJCpHcy/3z/wthJ/crfCdE6bxxx+o2zFAxRQnGai47XLe78L+vh+y5Ag9kazIYD94
	oejgGYKtN3XpL2s07edWHh2z4BLZvvkZ3LZG7DGQZd6OHhKaFRUd+t2/57m5f3RIFK+8aeqfZbJ
	EO1r2n7uOu5XSCp+ZjU4fZ68Vtxd4MabS5PCCMAkqOD0Egap9khDJMOhVxPqHY4W//EJCVQGUBC
	WQtHN43T59256SMoAKXMLEUXdthO/02ZgZVgLKn3HqA7LLRdgC4G1fqvoXbsE68U0rY+JIIxECX
	Y+AmqYCVld9W0DvgteQ9SZXUM=
X-Received: by 2002:a05:6122:3286:b0:55b:305b:4e31 with SMTP id 71dfb90a1353d-55fcfc59790mr1271052e0c.17.1765394735888;
        Wed, 10 Dec 2025 11:25:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7xQ2lo8xtQV3x9m4FzVjJfTJwMMg4HFl37gyVo6yMgD74bRuAg8950rMFPCAsUGiP1II0qQ==
X-Received: by 2002:a05:6122:3286:b0:55b:305b:4e31 with SMTP id 71dfb90a1353d-55fcfc59790mr1271042e0c.17.1765394735415;
        Wed, 10 Dec 2025 11:25:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbc9d0ed5sm854291fa.20.2025.12.10.11.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 11:25:34 -0800 (PST)
Date: Wed, 10 Dec 2025 21:25:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v9 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
Message-ID: <qfhlyl46i7az56t5ceyo42mw55udzwhxgpygw3jnpw3onr6qc2@5r3i6tb6ac3v>
References: <20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com>
 <20251208-add-support-for-camss-on-kaanapali-v9-1-3fcd31258415@oss.qualcomm.com>
 <scnexmcrpemu6vcms3dmq7qjvx54h5pyumjvgqduospao4x2kt@hoi7zfygjq4f>
 <458a7841-e422-4cad-83de-f5b5c1b683a6@oss.qualcomm.com>
 <puv24qramoiq4qq3i4bibatg5ihnrv6hdloul5ajbblvasvwk3@nbse2m6aftkh>
 <2e38b9f3-8a35-4a27-82d3-c1d4996a1684@oss.qualcomm.com>
 <9ecf4783-e1a2-430b-a889-997689bafe45@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ecf4783-e1a2-430b-a889-997689bafe45@oss.qualcomm.com>
X-Proofpoint-GUID: 6NeZsYP9m4oogkUKrQU1KcajFseWxDhM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE1OCBTYWx0ZWRfX+fL8RC9OPjKB
 o6U7w765Vis5zvpjhy7Gm3UnjCyNxcj0bguYiNTzN/48HS5Kcygeb/zRJzyeFHRkem1TdZ0Ga3P
 uw11I4ISPsrgJgtWT+4LinbBlgQc6Vv9YYLYlYnyPVkFqjZolfjzh8Hj1h5CIVjogW+BbRaDJLb
 OX9EDGLMX7bP58x3/xl3jU5DOcPgW4J2wjZ3AETZszSOBkKK67jeFPHsuRfxhXJ6JRCwF74SDUs
 qWFSMcUMFKSAIvSo6isuhDkq6xAZRCfCU3j6f+I/n9O3zpHIu1ZHHwHvoqE9cy2hiWp4Jg1HgPt
 71vVgbYDIjHmueEfZ5O2JqXAwXzSTjuxt9yGK/DyIKQFndr6BaRUNWrov/tl6hKogWH5M9myNfZ
 TljKhdwHZHOYYRKPBE3E8av+kCMbQQ==
X-Proofpoint-ORIG-GUID: 6NeZsYP9m4oogkUKrQU1KcajFseWxDhM
X-Authority-Analysis: v=2.4 cv=WaMBqkhX c=1 sm=1 tr=0 ts=6939c931 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=LZ9LMmeJzoCIL4emDIIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100158

On Wed, Dec 10, 2025 at 09:50:51AM -0800, Vijay Kumar Tumati wrote:
> 
> On 12/8/2025 3:21 PM, Vijay Kumar Tumati wrote:
> > 
> > On 12/8/2025 2:48 PM, Dmitry Baryshkov wrote:
> > > On Mon, Dec 08, 2025 at 01:03:06PM -0800, Vijay Kumar Tumati wrote:
> > > > On 12/8/2025 11:53 AM, Dmitry Baryshkov wrote:
> > > > > > +  interconnects:
> > > > > > +    maxItems: 4
> > > > > > +
> > > > > > +  interconnect-names:
> > > > > > +    items:
> > > > > > +      - const: ahb
> > > > > > +      - const: hf_mnoc
> > > > > > +      - const: sf_icp_mnoc
> > > > > > +      - const: sf_mnoc
> > > > > You know... Failure to look around is a sin. What are the names of
> > > > > interconnects used by other devices? What do they actually describe?
> > > > > 
> > > > > This is an absolute NAK.
> > > > Please feel free to correct me here but, a couple things.
> > > > 
> > > > 1. This is consistent with
> > > > Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml. no?
> > > I see that nobody noticed an issue with Agatti, Lemans and Monaco
> > > bindings (Krzysztof?)
> > > 
> > > Usually interconnect names describe the blocks that are connected. Here
> > > are the top results of a quick git grep of interconnect names through
> > > arch/arm64/dts/qcom:
> > > 
> > >      729 "qup-core",
> > >      717 "qup-config",
> > >      457 "qup-memory",
> > >       41 "usb-ddr",
> > >       41 "apps-usb",
> > >       39 "pcie-mem",
> > >       39 "cpu-pcie",
> > >       28 "sdhc-ddr",
> > >       28 "cpu-sdhc",
> > >       28 "cpu-cfg",
> > >       24 "mdp0-mem",
> > >       17 "memory",
> > >       14 "ufs-ddr",
> > >       14 "mdp1-mem",
> > >       14 "cpu-ufs",
> > >       13 "video-mem",
> > >       13 "gfx-mem",
> > > 
> > > I hope this gives you a pointer on how to name the interconnects.
> > > 
> > > > 2. If you are referring to some other targets that use, "cam_"
> > > > prefix, we
> > > > may not need that , isn't it? If we look at these interconnects
> > > > from camera
> > > > side, as you advised for other things like this?
> > > See above.
> > 
> > I see, so the names cam-cfg, cam-hf-mem, cam-sf-mem, cam-sf-icp-mem
> > should be ok?
> > 
> > Or the other option, go exactly like
> > Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml.
> > 
> > What would you advise?
> > 
> To keep it consistent with the previous generations and still represent the
> block name, we will go ahead with the style in qcom,sc8280xp-camss.yaml. If
> anyone has any concerns, please do let us know.

Krzysztof, Bryan, your opinion? My preference would be to start using
sensible names, but I wouldn't enforce that.

> > > 
> > > > > > +
> > > > > > +  iommus:
> > > > > > +    items:
> > > > > > +      - description: VFE non-protected stream
> > > > > > +      - description: ICP0 shared stream
> > > > > > +      - description: ICP1 shared stream
> > > > > > +      - description: IPE CDM non-protected stream
> > > > > > +      - description: IPE non-protected stream
> > > > > > +      - description: JPEG non-protected stream
> > > > > > +      - description: OFE CDM non-protected stream
> > > > > > +      - description: OFE non-protected stream
> > > > > > +      - description: VFE / VFE Lite CDM non-protected stream
> > > > > This will map all IOMMUs to the same domain. Are you sure that this is
> > > > > what we want? Or do we wait for iommu-maps to be fixed?
> > 
> Yes, when it is available, we can start using iommu-maps to create separate
> context banks.

It would be necessary to justify removing items from the list. Wouldn't
it be better to map only necessary SIDs now and add other later once we
have iommu-maps?

-- 
With best wishes
Dmitry

