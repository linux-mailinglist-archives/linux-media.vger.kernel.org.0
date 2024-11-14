Return-Path: <linux-media+bounces-21396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BF99C81F6
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 05:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08E442845D5
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 04:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A844E1E9080;
	Thu, 14 Nov 2024 04:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IDlCslGV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2511632F6;
	Thu, 14 Nov 2024 04:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731558353; cv=none; b=Xl8/5N1IGfMr6fMlZqBk7sWzJUiHFgaSRovTnh8Nl/ojMm6HfhQ9Qp44/hDZj/2ScKQpM/GEfHAirsg6UQhh0UxJbwsXOGJpb8l/jathHLwcJGZUas4OAO5AM/heTYTG3N9hLPA/7zZnwsHVGazfrAIIx0fSi2vqJTuneYSLEok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731558353; c=relaxed/simple;
	bh=YQbxOEUJBjFe56U0pk36ZoAeFLfSwvA3XwJS04whnw0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YRlOaH6npmEuxZtwXR+1vEze24BTcYWFXi6gcxOzS0e3JcCElUk00eL9GQOi5sYvXO4AGqx88qY71uF1nn5XOHLqJIABzVXNz+tr/5mwMEUfhhZoK3RDJdSJPBGSdIGZBrcCtgMK3T+Ndk5oUjHAsyx/zyxnitItoL9+g8sPb/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IDlCslGV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE406IE022395;
	Thu, 14 Nov 2024 04:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngIqrlIauypsAdLKfE1pw67JgcSdxqLGIoecxMXx0YY=; b=IDlCslGVTq9zF61o
	r+ylbEG7K+Q6OQ1VDMAEupPvi+TTjz5PbUWhmC/sdpfiQ1C0BwL7qRR5LYuzCGiq
	Z58BtoyHWq0FUvFBn4HUrZVc602vSlH7uqBreWMN/BgySmGUm5swDXDA0vwatZY1
	nCm0iMdC0FmsBtnKY8kBILLef5voLSyjx/mKHy8vTRUUqVS4ETyvmsjRg9fFHz/E
	JOBw81cGzQo2tScZYMWP4bCtQJ1CA4dLifcJWGnXQ8PQAPNQ6lx7a22ctpAD3DKD
	T6/NKiG6HIBFLTgDdt5REbd7Xh5eKqXZhq83AD6oktuyuyt8H24QxxOnZNON3MdY
	wLqmpQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w9sv01pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 04:25:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE4PkYh015978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 04:25:46 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 13 Nov 2024 20:25:45 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::dac3:ec8:4ce:6a85]) by
 nalasex01c.na.qualcomm.com ([fe80::dac3:ec8:4ce:6a85%11]) with mapi id
 15.02.1544.009; Wed, 13 Nov 2024 20:25:45 -0800
From: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>,
        "bryan.odonoghue@linaro.org"
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/4] media: venus: core: add qcs615 platform data
Thread-Topic: [PATCH v2 2/4] media: venus: core: add qcs615 platform data
Thread-Index: AQHbNPjfd2aanZ7KkE22msN8wjIR/7K2CESAgAAmESA=
Date: Thu, 14 Nov 2024 04:25:45 +0000
Message-ID: <a8c4dea53aab46b9ab8d40b9d997f13e@quicinc.com>
References: <20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com>
 <20241112-add-venus-for-qcs615-v2-2-e67947f957af@quicinc.com>
 <eldjwrookzs46mvxdp56uj2eytfeu5fuj4zs4yowcyilhra3pg@vc6v72klixem>
In-Reply-To: <eldjwrookzs46mvxdp56uj2eytfeu5fuj4zs4yowcyilhra3pg@vc6v72klixem>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PsoyLG6yDGI7CoL6yHSSkbv5L2QaJh33
X-Proofpoint-GUID: PsoyLG6yDGI7CoL6yHSSkbv5L2QaJh33
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140030

On Thu 11/14/2024 2:01 AM, Dmitry Baryshkov wrote:
> On Tue, Nov 12, 2024 at 05:17:58PM +0530, Renjiang Han wrote:
> > Initialize the platform data and enable venus driver probe of QCS615=20
> > SoC.
> >=20
> > Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> > ---
> >  drivers/media/platform/qcom/venus/core.c | 50=20
> > ++++++++++++++++++++++++++++++++
> > 1 file changed, 50 insertions(+)
> >=20
> > diff --git a/drivers/media/platform/qcom/venus/core.c=20
> > b/drivers/media/platform/qcom/venus/core.c
> > index=20
> > 423deb5e94dcb193974da23f9bd2d905bfeab2d9..39d8bcf62fe4f72674746b75994c
> > ce6cbaee94eb 100644
> > --- a/drivers/media/platform/qcom/venus/core.c
> > +++ b/drivers/media/platform/qcom/venus/core.c
> > @@ -630,6 +630,55 @@ static const struct venus_resources msm8998_res =
=3D {
> >  	.fwname =3D "qcom/venus-4.4/venus.mbn",  };
> > =20
> > +static const struct freq_tbl qcs615_freq_table[] =3D {
> > +	{ 0, 460000000 },
> > +	{ 0, 410000000 },
> > +	{ 0, 380000000 },
> > +	{ 0, 300000000 },
> > +	{ 0, 240000000 },
> > +	{ 0, 133333333 },
> > +};
> > +
> > +static const struct bw_tbl qcs615_bw_table_enc[] =3D {
> > +	{  972000,  951000, 0, 1434000, 0 },	/* 3840x2160@30 */
> > +	{  489600,  723000, 0,  973000, 0 },	/* 1920x1080@60 */
> > +	{  244800,  370000, 0,	495000, 0 },	/* 1920x1080@30 */
> > +};
> > +
> > +static const struct bw_tbl qcs615_bw_table_dec[] =3D {
> > +	{ 1036800, 1987000, 0, 2797000, 0 },	/* 4096x2160@30 */
> > +	{  489600, 1040000, 0, 1298000, 0 },	/* 1920x1080@60 */
> > +	{  244800,  530000, 0,  659000, 0 },	/* 1920x1080@30 */
> > +};
> > +
> > +static const struct venus_resources qcs615_res =3D {
> > +	.freq_tbl =3D qcs615_freq_table,
> > +	.freq_tbl_size =3D ARRAY_SIZE(qcs615_freq_table),
> > +	.bw_tbl_enc =3D qcs615_bw_table_enc,
> > +	.bw_tbl_enc_size =3D ARRAY_SIZE(qcs615_bw_table_enc),
> > +	.bw_tbl_dec =3D qcs615_bw_table_dec,
> > +	.bw_tbl_dec_size =3D ARRAY_SIZE(qcs615_bw_table_dec),
> > +	.clks =3D {"core", "iface", "bus" },
> > +	.clks_num =3D 3,
> > +	.vcodec0_clks =3D { "vcodec0_core", "vcodec0_bus" },
> > +	.vcodec_clks_num =3D 2,
> > +	.vcodec_pmdomains =3D (const char *[]) { "venus", "vcodec0" },
> > +	.vcodec_pmdomains_num =3D 2,
> > +	.opp_pmdomain =3D (const char *[]) { "cx" },
> > +	.vcodec_num =3D 1,
> > +	.hfi_version =3D HFI_VERSION_4XX,
> > +	.vpu_version =3D VPU_VERSION_AR50,
> > +	.vmem_id =3D VIDC_RESOURCE_NONE,
> > +	.vmem_size =3D 0,
> > +	.vmem_addr =3D 0,
> > +	.dma_mask =3D 0xe0000000 - 1,
> > +	.cp_start =3D 0,
> > +	.cp_size =3D 0x70800000,
> > +	.cp_nonpixel_start =3D 0x1000000,
> > +	.cp_nonpixel_size =3D 0x24800000,
> > +	.fwname =3D "qcom/venus-5.4/venus_s6.mbn",

> Why does it need a separate firmware file?

SC7180, qcs615 can be enabled on same firmware ideally, but due to a differ=
ent signing for qcs615, it takes a separate bin (venus_s6.mbn).

Best Regards,
Renjiang

> > +};
> > +
> >  static const struct freq_tbl sdm660_freq_table[] =3D {
> >  	{ 979200, 518400000 },
> >  	{ 489600, 441600000 },
> > @@ -937,6 +986,7 @@ static const struct of_device_id venus_dt_match[] =
=3D {
> >  	{ .compatible =3D "qcom,msm8916-venus", .data =3D &msm8916_res, },
> >  	{ .compatible =3D "qcom,msm8996-venus", .data =3D &msm8996_res, },
> >  	{ .compatible =3D "qcom,msm8998-venus", .data =3D &msm8998_res, },
> > +	{ .compatible =3D "qcom,qcs615-venus", .data =3D &qcs615_res, },
> >  	{ .compatible =3D "qcom,sdm660-venus", .data =3D &sdm660_res, },
> >  	{ .compatible =3D "qcom,sdm845-venus", .data =3D &sdm845_res, },
> >  	{ .compatible =3D "qcom,sdm845-venus-v2", .data =3D &sdm845_res_v2, }=
,
> >=20
> > --
> > 2.34.1
> >=20

> --=20
> With best wishes
> Dmitry

