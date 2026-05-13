Return-Path: <linux-media+bounces-61459-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHAPD7OJBGoxLQIAu9opvQ
	(envelope-from <linux-media+bounces-61459-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:24:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6320535015
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8409230C60C6
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702073E9C11;
	Wed, 13 May 2026 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKysgx5R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HU1xfewc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFD73D7D8C
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681896; cv=none; b=fMbS4BiRnIplLhrBu/wIyaeMKzBl+bUg2Swzn4Nk/hYKvftmSATqhMNeudwL3gZNLxPgeoeFhnAFbjv/N62it71Ven7KMHAzqx/8n1PShzAghy0prNvDrl4dc/3+D/QHqh055+LV0sxrZ9zK+1vFbCdf3atzK3qb2xxWV0CUx68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681896; c=relaxed/simple;
	bh=7UvCRgU6NE9Xz1wHDtpVy8gUtqn8OFCmDPYciKp6YWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqjNfC5eQ4fm/lsiPJ/AVuxU3izB8dHTzh7vDue8GlIsJdGGF6MLiRKPD/mYeID0hF2B5qjYBg7sPokxTqwvLaJrCYa8tyQBaXIJhq4LfDGcrHJat2Qtu70Ks9yHUJqqeUBwfi0WXjwhZy7qfxb+EELZnQ7ZPHjIwlJepzqXxEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKysgx5R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HU1xfewc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCU6qh2965303
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5mMcGTAR+YEsc2FAr9AP2GCm
	5DusrJSGJQDZhcplsrc=; b=nKysgx5RzUIvBBqEu3154iGw3McFy6jZatgFIwR5
	3a1zGFuZtVYxMGxh2xo4MtvIizTK4snVEGzOje1BxXecOAeY81Swg7BdxncGGQgv
	LG0qVDAhd9RHH7hX1SzglP9sCcW54vjIWTm1lOaynS37Ruud1HCbwPfdA0dYfM59
	pWaDwGRw+jDBHlXKaEWs3R+b7kf/Oo70kGV9LpaV4aIYNIvBPc+1Jt7l4MZq7yqm
	YZVz70RTiclUe2fpAyPIAzb5M134ZnGTa/1bau8DqvoFh0K7Y7QaBh8g28+Nzdyr
	qwESbIgBXHHa9CPlH/NoGievgVeZP+X9hbvvzuoOoAg7Iw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma59re9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:18:10 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e1f3a293aeso15140787a34.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 07:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778681889; x=1779286689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5mMcGTAR+YEsc2FAr9AP2GCm5DusrJSGJQDZhcplsrc=;
        b=HU1xfewcB6a2rJt3ofuJIgoj3ECnmrCafZgHd7lPdpAOOnXoC0f4edF8WVjxLGnnzJ
         NtRNK7F2/CN+NrNLRzCHB9CjiIz/LVKsJtIhRDSg22+1QXrjj1bFqUHukL4lFvpMAYUB
         Kiw07szBpee74l9ly+Tpy564Rhy7sVHXsyq/yeHBraxYU+uf/2ozDovSe4mg5brje4+U
         dm06ESdX5TluHOwpMd7MkpC5/90cHxadWv/Z/5NSjYx8eZgt7opbFthzfHE3VUNdz0L2
         HR1wmoqJ1R1ImI/OMUIDILP9cy8oN3c0+4ANFFAecwUuwsVP+M9O7arPS8prJDhf3gg/
         R4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681889; x=1779286689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mMcGTAR+YEsc2FAr9AP2GCm5DusrJSGJQDZhcplsrc=;
        b=kJLn7LBu3vf8l9gQWgnFHkiIU5MBPF+lCkfS8/7DIZTXswTXIMDHS4gBSYOc0x6uTf
         Ss0mWsiZt5IhWKxmzA8r5MaXbgYhFDBuSWGrvItWGxg3cA0apLiC7tp6jgh0s2JbPL16
         Hanxj8wQQcUPtiRPoeKoZBQvWCC/YPQPPkirBmej/qYsJ6VPi6RiFlNky8d9r6Roj1X6
         +WuR26/cS4MVs+O80b3Y//80M7Ju96BpZIu2IGQQl/abrwJ3FZexoCYwtwWmam40uJWL
         DblyxcS7sqPrs0PzxgaVHpzC2+vP2z+Sa7CAtCUCUa2f3pJ3jaUCf3EjRlevK+JgW4Bg
         NJCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ey2Ch3/BU8RSD13XxX7VMKc4FdjiV4k34INP6+tx1kUylENjAR2RrQUgBz5pAnLUGtNNjL87nbxRovg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVZ0O9KeL+qHNYaG/5voEKpvUILLfPLQrhaYOW7rT2GepXwzpS
	sSTpJIlwT4Bi3xxRQ62AWL7fcyH9xKLEBL9Fm/6EHmB/7SmPegQyncXgTikL7SPVJovaJhReRjj
	cPH6WFJZHG9l5jCRKEn5iCBf92nRR9PZ1Bi2pAZMVM8h1WV5RQzR71IwqHB/EyljLBg==
X-Gm-Gg: Acq92OHLG33hweU152jXFCPG1Wz8JPtyRvgKdX1Ll92gDTcbZUjDu3uLCiivlJujmGc
	TmfAwy5eOHYgQ7OBskyu7p/Lsu9T+XO1SoAqup2Jzkto7lLG+gF44QU8abootgHh86lrAyAB+2i
	AZsUIsKH3BLf8BlK/xOr/1lBXYhM+XXHVLJ7wrkUinUdZx5I6h+8qYoESXCuByZb+J//XEr6AOS
	SSO8N8QjHhagxyFP5KAfJr5mbtx20pByFUaOpO4LyizjuSskeV8FEGy/N/TRmFpQray3v9FLVPT
	TcmVmLvRhaLIGmJlPWHUa9loBU2G1g4W8E7CojWyrOhE+FryrLJGuYw3CEgrOsHT0nQrOBfJgQh
	tWZb5l4LbqS+PiTPEL44E+wyV0eA77uNpTWwgwW4NsBYkzZF8l3hlsaPElwbjNbeEQ2FAz14SAU
	4otzZR3VDIodvC1ntbDyjhurI5EprVLaXwakg=
X-Received: by 2002:a05:6830:3692:b0:7dc:d28a:3d2a with SMTP id 46e09a7af769-7e3da449eadmr2190756a34.15.1778681889492;
        Wed, 13 May 2026 07:18:09 -0700 (PDT)
X-Received: by 2002:a05:6830:3692:b0:7dc:d28a:3d2a with SMTP id 46e09a7af769-7e3da449eadmr2190727a34.15.1778681889054;
        Wed, 13 May 2026 07:18:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm4096651e87.62.2026.05.13.07.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:18:07 -0700 (PDT)
Date: Wed, 13 May 2026 17:18:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 08/14] media: iris: Rename clock and power domain
 macros to use vcodec prefix
Message-ID: <qvbtzbrjcdbsu37gb4h4cqqmann5tygbzpwurx73hhgrome2a2@3mf3oz5i2e7v>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
 <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
 <4eef8b17-47b5-e8f0-4a44-87fdf1d69d18@oss.qualcomm.com>
 <cyjxjidbe4qpeb5pwv6u5yqwhldqffenzgp6z4irgxkloturt6@buswzuou2w7z>
 <8541d1e8-9ad9-489b-9c00-b7a92ce0a13a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8541d1e8-9ad9-489b-9c00-b7a92ce0a13a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX/NpqLo4QnP0x
 YffShmc0gNNGTDn69DsJ6jAtXInNk2M27Rd6iMYc25ABOnk2Yb6+w7N3rv0AcX4VapsDN+8PnhU
 6VEBbnkTimPO9qcGNDLjCgYpa7zVnHJcJGUTXMxJ7P375q9HwG/7GOOWys0+ILWoNxSjU+l8ihv
 IItRzoPaOwLOb0zUJp1HBA7FawkDPHvVf9/Opab8GDlY8oH5iJ8zXS8zYJTIEcH2A6W6Ixi9gHq
 gWsqyMuH5poO7xafa10Y92Qv31v1qspJyjaaayDUAfy8SRte3PQGSvLiIU0KO83oHzLc/So54S6
 v1KMHTWZd3XcQHIzTQgF5EyK8wlbyOJ9jmC64CyWesRJd8qU7tuSo8XwRwWx+8iaGIelR3p6OA+
 5Si1FvgWONYxyVc3Mgo6XAmsXqUp7AVOZr0eFww4Sp1msS82dsaMhHktuVqKk35iLWXI05SyD1/
 /en1+7SGdOvckfEtHtw==
X-Proofpoint-ORIG-GUID: Mtz1IHhbMEx2fO5hKnxqZtJgeMWRljAn
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a048822 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=fE9t8tTNEnyIwWf7O9AA:9 a=CjuIK1q_8ugA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: Mtz1IHhbMEx2fO5hKnxqZtJgeMWRljAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130147
X-Rspamd-Queue-Id: E6320535015
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61459-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 07:40:23PM +0530, Vikash Garodia wrote:
> 
> On 5/13/2026 7:17 PM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 10:37:20PM +0530, Vishnu Reddy wrote:
> > > 
> > > On 5/9/2026 1:52 AM, Dmitry Baryshkov wrote:
> > > > On Sat, May 09, 2026 at 12:29:57AM +0530, Vishnu Reddy wrote:
> > > > > The current clock and power domain enum names are too generic. Rename
> > > > > them with a vcodec prefix to make the names more meaningful and to easily
> > > > > accommodate vcodec1 enums for the secondary core for glymur platform.
> > > > > 
> > > > > No functional changes intended.
> > > > > 
> > > > > Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > > > ---
> > > > >   .../platform/qcom/iris/iris_platform_common.h      | 12 ++++----
> > > > >   .../media/platform/qcom/iris/iris_platform_gen1.c  |  6 ++--
> > > > >   .../media/platform/qcom/iris/iris_platform_gen2.c  |  6 ++--
> > > > >   .../platform/qcom/iris/iris_platform_sc7280.h      | 10 +++----
> > > > >   .../platform/qcom/iris/iris_platform_sm8750.h      | 12 ++++----
> > > > >   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 21 +++++++-------
> > > > >   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 30 +++++++++++---------
> > > > >   drivers/media/platform/qcom/iris/iris_vpu_common.c | 33 +++++++++++-----------
> > > > >   8 files changed, 67 insertions(+), 63 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > > > index 55ff6137d9a9..30e9d4d288c6 100644
> > > > > --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > > > +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > > > @@ -49,14 +49,14 @@ extern const struct iris_platform_data sm8650_data;
> > > > >   extern const struct iris_platform_data sm8750_data;
> > > > >   enum platform_clk_type {
> > > > > -	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> > > > > +	IRIS_AXI_VCODEC_CLK,
> > > > >   	IRIS_CTRL_CLK,
> > > > >   	IRIS_AHB_CLK,
> > > > > -	IRIS_HW_CLK,
> > > > > -	IRIS_HW_AHB_CLK,
> > > > > -	IRIS_AXI1_CLK,
> > > > > +	IRIS_VCODEC_CLK,
> > > > > +	IRIS_VCODEC_AHB_CLK,
> > > > > +	IRIS_AXI_CTRL_CLK,
> > > > Why AXI_CTRL is better than AXI1?
> > > 
> > > Glymur has 3 AXI clocks: axi_vcodec0, axi_ctrl, and axi_vcodec1. Using
> > > positional names like AXI0/AXI1/AXI2 doesn't convey their purpose, whereas
> > > naming them as AXI_VCODEC_CLK, AXI_CTRL_CLK makes the intent clearer,
> > > especially when platforms differ in the number of AXI clocks they expose.
> > 
> > => commit message
> > 
> > > 
> > > > 
> > > > >   	IRIS_CTRL_FREERUN_CLK,
> > > > > -	IRIS_HW_FREERUN_CLK,
> > > > > +	IRIS_VCODEC_FREERUN_CLK,
> > > > Can we at least group them too?
> > > > 
> > > > >   	IRIS_BSE_HW_CLK,
> > > > Is BSE a core or a codec clock?
> 
> IRIS_VCODEC_BSE_CLK would be more appropriate here.
> 
> Core and vcodec (video codec), it refers to the main processing block and
> are referred interchangeably. BSE and VPP are the sub blocks inside the
> core/vcodec block.

Thanks!

> > 
> > Unanswered
> > 
> > > > 
> > > > >   	IRIS_VPP0_HW_CLK,
> > > > >   	IRIS_VPP1_HW_CLK,
> > > > > @@ -206,7 +206,7 @@ struct icc_vote_data {
> > > > >   enum platform_pm_domain_type {
> > > > >   	IRIS_CTRL_POWER_DOMAIN,
> > > > > -	IRIS_HW_POWER_DOMAIN,
> > > > > +	IRIS_VCODEC_POWER_DOMAIN,
> > > > >   	IRIS_VPP0_HW_POWER_DOMAIN,
> > > > >   	IRIS_VPP1_HW_POWER_DOMAIN,
> > > > >   	IRIS_APV_HW_POWER_DOMAIN,
> > 
> 

-- 
With best wishes
Dmitry

