Return-Path: <linux-media+bounces-57367-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JdnEhLvxmmpQQUAu9opvQ
	(envelope-from <linux-media+bounces-57367-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:56:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC04934B64F
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EC7A300B46B
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38B335B65E;
	Fri, 27 Mar 2026 20:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcgozyTN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1ekTEc+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE7637999D
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 20:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774644674; cv=none; b=XYIxbYmSbs/ylCqKT/RT2vlVtp/Jfe+acXyVURGVkFtZAqQ0Mvk++vvpjiVKkCYa5KUyj7pqO1LxG7QcY7V4culiEb3KARLtBvviD+V6S6UnTxi6BybNXLyziX8TgFmGBvnqXkUZcBFjKdcTd31lTGxqQ3a6/Cf6p2n6cGKSK2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774644674; c=relaxed/simple;
	bh=Te03HsV648pFJkyGTNt1Dmxz6MZhJrSjreplqLeUXwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ah9MNPkUtoFlBNdAEn8wj9XoclfTRoedKYql5jf1GerRxhlKLlQjy7ps1F8AfegS3J+z8OAsFt4mJKSSRtzAIPMmHpGCiUzOQl40p6ehfiGaAnBRwOsJXG3QSI6MK/g3K2yRWKCVVxvzYiA/R3Foy1P3BswaCEcAT4AlKNRTqMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcgozyTN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1ekTEc+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2RfR133569
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 20:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5vNj1FkteFeY/dYUVbMc/bS/
	d+JE8rzOzKMJKumnlKY=; b=mcgozyTN+95TSr5y+vMcle6H75WtNTDawO4OJPxB
	8OiSc//+NEPdLsjDNRwlFZ44/U9KAz+sKWjb89Nq8QOxYg9LX0a0cgR9M4Ho8Uwm
	EuBLRlI1vWRUnZad1isiC1+7jzhjvZZu4MMWVhb7lU8y/evPuMtfwsFimzrSOdAd
	in262LVUWrQoTSV+yNi7TSs0fcPQI6nceztj+L+/aXnjyuHLEcVswJPan65XZ3Ba
	O95oYjPDxrTMI6KHwfBV0MwoThdw3WYom28iMTQTUTxUZ0rT2NAswUHfblQJBdBr
	D16y6YxSVLP+lQTnlYXanNRFE2lBILf6geFIBeOF27/cvA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5sxhhmmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 20:51:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so64078551cf.3
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 13:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774644671; x=1775249471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5vNj1FkteFeY/dYUVbMc/bS/d+JE8rzOzKMJKumnlKY=;
        b=C1ekTEc+pu9W4uKWR0XoxqxtXsnBca3lwAn17bog5Mk9ZZZxMaCmD0juE/Dyhc+RAA
         yrNMJTn6EkvoiEx7e85cRSZD0Ez4K+I3qEb97ke/3z+H2HdRRZnx8En6LEFQDZF0LuZL
         jVYxfSdUPOlGUrLCfjystRdyvr0d3LGx7DxAbKlDJkJ+JOmcTfLSwOfWglgwKrdmtTVk
         9ejaNixpMgp5z9awoi2Bx53HHe0SuVF2d/1zOdgnADNiTGdHbInlLspdoWsLe6J4E+NW
         zwLK7E6F8y3RnCeu0z0+eQ/if5AlUkE2haFmWYzrt8N75i4FcLtd2sssQX10bIsDSIbq
         IEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774644671; x=1775249471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vNj1FkteFeY/dYUVbMc/bS/d+JE8rzOzKMJKumnlKY=;
        b=RXj7g+FhXBNrBJd1FLHL6i/Rz3NxCKYZQwJL1xKeLWeVuT2Onu+bvsmdQT2KbXZ2/d
         U1l1kDNP1sTuvqFzzxElOVsSlII8qfSUOXWe741niKDkuSBxWgPZ13K5v41VTrQXB30b
         wG7Qohzd4irOdvbtsrKfHlG8T03hCvO4ORa8rpaazhNFh/KypoqV+91Kb7yJuHchXMkI
         LcPD1/dQDzHAXEk2CHaKoHTU1B+HqpL3l59Zk5auQlOQsiW0N89ZxW9XjK3R6vfkM1Zp
         4ImZvJ7/J2ORXJYVYJvJy7ffBrbSL+u21KsgBYYdSpFlSRpwi9VzoCM4KDzQbhHlA9ab
         PHBw==
X-Forwarded-Encrypted: i=1; AJvYcCVV+OlF45KHsEA6de0d+VERaj4HDg+fqqdOgC1vkuD/gTiD17Kh5xro5A6m84YFmC8z5geeqtWSCH39Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSPh7bH1gqcvHSdW9k2YLVyb8j8jHAH2uNbPIoilRhYa2Bj/sK
	j/St8pgfmnrTg+2VG5W0oByj6gU+/m0UFASP71cNjzqyClp9dDtNFdkWCClq/Dnfs80j0BKjmAL
	nmYmP15NUiX0px15WW1OHXIYZEHFugG26Sl5KlxjEH38pbnMPz9iWD46DX2NwF9yL4w==
X-Gm-Gg: ATEYQzxJ+NnN0S+o6LEMChv+YSCC9n533lQLBwcJJXpEZUQhxpacA5j81WzPmIBcxto
	728AlrEN4o9L9GfJasvgmkqUvhzMSPuwXrCaWPRhY1KBYm6tojSsUuAfGlv9hzfH5YGcFc5iXOR
	Ufy/TK6jz2c+89tjAtQDu71ViIeMvE5JwwQoPPqllfPg1B0VkLquV34Yzu/W8d5bpJIRfipyAJi
	SVJvjovHbKNt5FTZQc0kUZk7aYRHmZXvZSrwm/nVjd5+pVCjTdY0x56gKVG60Dr62+eCChTaycn
	yYBH+x6VIlm3C4MpDU1OP0CjAj03zMFjMtMnqBZZG4V7y4fjntYxnyzFJ5a6fF+mfga++2EX003
	bP3tB4RrrSTVOresuXchYxh3QU8RR2C0vCWzkIZkY4vqfg4f0F+ndcWp//AwUlPd0o9r9WXSHOx
	DLFa/yxoOr3CfBRUJ5if8a2pOAAifDoC29XZc=
X-Received: by 2002:a05:622a:510:b0:50b:3a6d:db5d with SMTP id d75a77b69052e-50ba39ad465mr55341001cf.65.1774644671586;
        Fri, 27 Mar 2026 13:51:11 -0700 (PDT)
X-Received: by 2002:a05:622a:510:b0:50b:3a6d:db5d with SMTP id d75a77b69052e-50ba39ad465mr55340701cf.65.1774644671181;
        Fri, 27 Mar 2026 13:51:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4329sm16395e87.3.2026.03.27.13.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:51:10 -0700 (PDT)
Date: Fri, 27 Mar 2026 22:51:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Message-ID: <2houacfdkozzk35ky5xtwe3utkvyx4lroyrhvibb5lg6lad2g6@56akvtqigaep>
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
 <f1c8c412-1d27-4c83-8c5e-76b9369ea6e9@linaro.org>
 <VwCtoebjwHqLTucsrGruvBpedA4k-Melt7C0DA0aHSVld3PeotwZdtMUm3EFpvQyScrl6yejmLaK7bY1avT1zQ==@protonmail.internalid>
 <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
 <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
X-Authority-Analysis: v=2.4 cv=QZVrf8bv c=1 sm=1 tr=0 ts=69c6edc0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=g4nqrqiC9Za9_vF1seoA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: GNfstgAF5HqxZhhQyuzuRtiiKsWIOdH0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0NiBTYWx0ZWRfX6kOV2YC80xZj
 K/RSVkJbAlAyplygFQeZciPiNAekShDM2H2HPQvpotj0J0bgPhngsLIcikGlsbRCtTpMGZC4qH+
 Z6nTDcqInhLAJ3SJA8ewNntXv4UO+cQhWWn27tnoneT38erKFONS8QzN7ut5Sci9Q5aMh/voSID
 6L+hLB6bei4qvTNDb7bVEfbb+lsjC6oWfltPOPCNJBVPUEbeDz/QKb5lgIQPgmSJlFQ6VUEw+c7
 pjWW+BVZiPinTlu5MHPfmiN4l6L9iV4UHSTfDaosne2xFmZ5v7ICzyf9RyrV/qRITw6AqfaSKq4
 BCtuEj90Wq5WRDFUiP0E92igogGGiroWroog3sKV9dMcoqKqH2JmlQCIIXs/XGFECzLbyqcp4cq
 9wZ876WSyGpZLtdz17ZH4cUt5ArEhv+8HesHsLc3QKc9OusfBcQlL4DIw1tp4RXN2ycQ0lf+T86
 4JyfeWqbKfVrpxRs2hw==
X-Proofpoint-GUID: GNfstgAF5HqxZhhQyuzuRtiiKsWIOdH0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270146
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57367-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC04934B64F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 02:42:10PM +0000, Bryan O'Donoghue wrote:
> On 26/03/2026 10:28, Vladimir Zapolskiy wrote:
> > On 3/26/26 04:03, Bryan O'Donoghue wrote:
> > > On 26/03/2026 01:46, Vladimir Zapolskiy wrote:
> > > > On 3/26/26 03:04, Bryan O'Donoghue wrote:
> > > > > Add a base schema initially compatible with x1e80100 to describe MIPI
> > > > > CSI2
> > > > > PHY devices.
> > > > > 
> > > > > The hardware can support both CPHY, DPHY and a special split-mode
> > > > > DPHY. We
> > > > > capture those modes as:
> > > > > 
> > > > > - PHY_QCOM_CSI2_MODE_DPHY
> > > > > - PHY_QCOM_CSI2_MODE_CPHY
> > > > > - PHY_QCOM_CSI2_MODE_SPLIT_DPHY
> > > > 
> > > > Distinction between PHY_QCOM_CSI2_MODE_DPHY and
> > > > PHY_QCOM_CSI2_MODE_SPLIT_DPHY
> > > > is
> > > > 1) insufficient in just this simplistic form, because the assignment of
> > > > particular lanes is also needed,
> > > > 2) and under the assumption that the lane mapping is set somewhere else,
> > > > then
> > > > there should be no difference between PHY_QCOM_CSI2_MODE_{DPHY,SPLIT_DPHY},
> > > > it's just DPHY, and the subtype is deductible from data-lanes property on
> > > > the consumer side.
> > > > 
> > > > So far the rationale is unclear, why anything above regular PHY_TYPE_DPHY
> > > > and PHY_TYPE_CPHY is needed here, those two are sufficient.
> > > 
> > > Because knowing the split-mode exists and that you have asked about how
> > > such a thing would be supported, I thought about how to represent that
> > > mode right from the start, even if we don't support it.
> > 
> > It is good to think about this hardware confguration in advance, however
> > the process of describing such hardware setup is incomplete.
> > 
> > > 
> > > To support split phy we will need to pass the parameter.
> > 
> > What you call "split phy" is a DPHY, and "split phy" can not be supported
> > by adding this parameter, because it does not provide information about
> > lanes, and after removing this information it is just DPHY.
> 
> That's just not true. If you read the camx source code you can see
> split/combo mode 2+1 1+1 data/clock mode requires special programming of the
> PHY to support.

This needs to be identified from the data-lanes / clock-lanes topology.
And once you do that, there would be (probably) no difference in the
hardware definition.


In other words, I'd also ask to drop this mode from the DT. This
infromation can and should be deduced from other, already-defined
properties.


-- 
With best wishes
Dmitry

