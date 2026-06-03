Return-Path: <linux-media+bounces-63688-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SO+YLfGnIGpw6QAAu9opvQ
	(envelope-from <linux-media+bounces-63688-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 00:17:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1450563B86F
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 00:17:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SY0UVSOP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QcECFVck;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63688-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63688-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FD7A3062F4D
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 22:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466853E2AC8;
	Wed,  3 Jun 2026 22:14:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55173FE352
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 22:14:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780524879; cv=none; b=BMMT+EOqGca0tvFcqud/M0s+ZpySN+Rp/d91xA9v5m2/KxYBtoc4h0J29B7FkvdS7NtSJRsJqlJKtGg2HuprGRg3abdg4h9AUzIzjiMto6z4nyBuxswgT2xmQmiptk/2jAOyWYDv+eVSOFAldKBtfTQftT2OgR2IDMwzFqTKgMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780524879; c=relaxed/simple;
	bh=xza65rbfkM2Un1lEJ0wJL7agA0Xdz4vvAnnun5N6O+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sbe1udF+QFo5KEzlP8lZJ6rb6vun3z4nA3Bfo61Q5fe7WxUb/HT+ENLseSK0syKzxVxUC1M9HM8f2ZOjlqXFOTgqyeAengiFYXn/Ln9aZBhQYgMAb2A8PZgs2T0E5ykp1SRKS4vpMfF3cVomH33rdyhNWP9ZiObqcsxezqYIj4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SY0UVSOP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QcECFVck; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653HvwV23233934
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 22:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xsSXOlAcJwLY6R8+0TCnImJK
	D3AIKkU0hbSagYVOEpo=; b=SY0UVSOPXpph1zn/qRbhp4saP04lSrbHSxxQZ78w
	sIDiCyw0hMCV5J+KVCnuHQ965aHMPg6YQKGJLI9b8tvRcOCiEsZOT4P9FLUn9EKg
	2e0/69On81keTF3GBYzEjm9374fH956TGhM+TfhjNSrRnf1Rv0QWCx6rPOOWtPgi
	rIa8XvH4UTfqDlxCJb+e74auWy4N9YvZhMVpqDeyFmFhBLE1+tfMvTks24pPu4FP
	gVk99ezkTBuAdMWOlAJGc1fAZBRpZy42gjV/SiGumtO/wOT2SuQadusN9MR2RHnT
	jbtVdITEV1pFRhHNT1UB9lYOVXxlWTz+32Xlp+O9dT4Izw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s0xb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 22:14:32 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963d7e5ac77so36208241.2
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 15:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780524872; x=1781129672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xsSXOlAcJwLY6R8+0TCnImJKD3AIKkU0hbSagYVOEpo=;
        b=QcECFVckUMQdp+hHKJMzoG8RoRYcvkcwiQBgznD2KNK3xLXRw/dpNJc6GuEceXlW9O
         E7H1uqogUPPuKxhQEMQ5jc6VB9MZYcavGH2gutq4zztGTgkGGV29Je4VxHdB3MQG7e9s
         SI7epGJ8/pdmm4kbRYj5tuGzIg86yeVtbF+f+W/OJK/CdL6r81MZlirRPlRZAyV7k5HE
         oucLzxZIcvppR6x7fhT3zVVWoRr5dfMBRHClTm1fSXR0PjsK967wFzgtc7SN1nbkmziR
         PjX69Xze1dgGYNmdUeVzjzkIrJZXYLSoz+qAIzJozZGbiqSDQ7Ejfj9aMcfdWGeBrRPI
         nYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780524872; x=1781129672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsSXOlAcJwLY6R8+0TCnImJKD3AIKkU0hbSagYVOEpo=;
        b=dCf7/p2mfGLXB6mhBbjZ98SymZeHRel62k1aQ9CU271K0aCvntrP0Nc+989Ik1ZFBx
         5GtB8Lpx4n9QTN9e8xsESHViYsaqygnhyKA9a0ICJMtTZD0x+BS4vPUXGmx/LQTMOk+a
         GyMbJ99VfDJjdIh8i5/SOMBa3Esyf0ihez38b0xyKkcfTQrVqEsLpJzNeq7NVIh94za9
         IIztZVgHfqQmxySmWtU7EkAyWy3pgimdUrtqHTeG5jT56WrDxXrIJjJ5wQEQ1LlOkO1H
         BaMa7HNGgv3i5kvxSmb0iV4dJgFkQY3ub+ZI7Ecw9I76wuhbrwf9pd5+VhAXr24rTOnD
         SEyA==
X-Forwarded-Encrypted: i=1; AFNElJ/qNqMj5dIvhMuOYdu1N8OxN4VSboOHlwzY0iJuZfUMAQti0q3iud5tKDQZ+ZzrKyKJFTOdpDCfKVptVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzFfUmajzakst8dZ9wsPifpD13ksF71gHr9jVmzuQ/SKHXat75
	uhJ1rr90oYgR3uMXrccvY9076XsgwyjpIVi4LqYFbfVwOgtZ5qmiPxOHCOcfIap+srqa5l8RXUO
	3Q8JMZselKuViSRWh4aOZdBS6OLZ/I8aqCxNeNqUCTjzoVO0HwQBeue9phms/MfwaPA==
X-Gm-Gg: Acq92OGbhZK2d0wp+RPPQQsPokPe/xHGSywjxYlPLmO2hM7V2uOgAm9F6FHVIFgg3EW
	xBMOh0BvZhXg+0CkT+0Qf4WjNcMs1ir9Qv4d4/1j2gVwfhw0UEjNafdWNA/Xy2HT/3JzTvHyDeV
	O0S2T5v7A9nUpvPVkkqgeL4eGIdXEEm69epHPAF1BZiwtUa7EQ23YbJKSTd8Ht7HzZPN92nyJxz
	YVxo8vGC1IICNsZMihTDnfBluJUsLNwnYTqNeWd8tGa8fZ8sGQqe7gJ48y7DXoRQ49OAZIV8ywj
	129uifqfMZJhSRTDihmGWAIcPlHDScL/n54lda6CYkwDhqhyXsd+bfxDOjVEcvOfv7vbPuFwZ9z
	2cUzbgOrLzUYRZyeX+Q8PAsf5MsuKgdoJIr1n01h7lZuuE0HfCLIivgWH6DzLWMtZpR+aueC73V
	ffya1m36LYhNjcZ/j3XPsbNkSQ2dVfYoIFQLdoF19P7ioesA==
X-Received: by 2002:a05:6102:dd0:b0:632:5628:6d8e with SMTP id ada2fe7eead31-6ec460bdf6dmr2693534137.21.1780524871670;
        Wed, 03 Jun 2026 15:14:31 -0700 (PDT)
X-Received: by 2002:a05:6102:dd0:b0:632:5628:6d8e with SMTP id ada2fe7eead31-6ec460bdf6dmr2693507137.21.1780524871182;
        Wed, 03 Jun 2026 15:14:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97a714sm869014e87.43.2026.06.03.15.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:14:30 -0700 (PDT)
Date: Thu, 4 Jun 2026 01:14:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Message-ID: <htxqjgwjczsghunsbvo44lwkadzeg2kp6wfcksf3hkmcubvs2d@cw5r67uxskvu>
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
 <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
 <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
 <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
 <b6a8c860-8b47-4250-a428-5225d0e64a1c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6a8c860-8b47-4250-a428-5225d0e64a1c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: IgDIZv8bG2pzn23sua0uym2q_eZiS1B4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIxNiBTYWx0ZWRfX2Tkn8c1sz+pD
 77wvZO6/z0Rc4cH9ROSgxRgtRadhxE7htrE8f5SfvSGIMPX8SunI8luDYYu5bOJ/eREHnCTyqLh
 r0JhPZUTtyatW6nH/spgEWWmrtUlB16IE23gLxTXuQevrAIzM+KdQ5m8i48ddEtPesPUL3PXE1S
 KBBzf4o3P8ZRilKT0KivydhPxbwgwwsi4uaed8Upq1uxvebqEnzOQqO3zAWDWvQG9xF136LhEpX
 csmMfaNkVGMi63+5/MQmAk5YDss6kzHYm9RpWWZGuJGdoYJh/LwAD0Yk2m3vL+qeHjuQdXBOD66
 YCQPcIuaH4EFwJmqiXEC+taikqORecfxqMMmneNxgtuZ9nLfqJw3XFXZhsyD+HrmU4RS607LEwj
 vYJL9qJQ/yLuOscVaUUeZlRIsn2HoYrzE//UhcacuOJ37Cf/I/rAlv1NDDA9LfBwn7d3u6sxYds
 ZUDXA+k/UdX7kyyZy6Q==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a20a748 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=mZDqFNyF9VkgOTRxVPMA:9
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: IgDIZv8bG2pzn23sua0uym2q_eZiS1B4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030216
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63688-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vijay.tumati@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cw5r67uxskvu:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1450563B86F

On Wed, Jun 03, 2026 at 02:37:48PM -0700, Vijay Kumar Tumati wrote:
> 
> 
> On 6/3/2026 5:57 AM, Bryan O'Donoghue wrote:
> > On 03/06/2026 13:40, Dmitry Baryshkov wrote:
> > > > Are you sure about that ?
> > > Yes.
> > > 
> > > > ipcat I thought designated lane 7 specifically as clk-lane i.e. named it
> > > > CLK_LN of some description.
> > > Split configurations explicitly use other lanes for clocks. E.g. check
> > > the RB5 Navigation schematics, CAM0B connector.
> > 
> > Can you please check:
> > 
> > CSI_3PHASE_COMMON.CSI_COMMON_CTRL5
> > 
> > 0 LN0_PWRDN_B Lane 0
> > ...
> > 7 LNCK_PWRDN_B Clock Lane
> > 
> > ... just a badly name field
> > 
> > CSI_2PHASE_CTRL10
> > 
> > Bit[2] = IS_CLKLANE
> > 
> > Right so CSI_2PHASE_CTRL10 controls lane mode, indeed. Thanks for checking.
> I can check this with the HW team. Although the SWI has this knob, there may
> be some limitations to use any lane as the clk lane. AFAIK, only two
> specific lanes are clk capable in DPHY mode.>

Having clock-names property doesn't mean that all values are valid.

-- 
With best wishes
Dmitry

