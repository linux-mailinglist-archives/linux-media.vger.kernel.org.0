Return-Path: <linux-media+bounces-22020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AAB9D8980
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FE4CB38045
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 15:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3796A1B4128;
	Mon, 25 Nov 2024 15:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="py1HtW/q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C9217C61;
	Mon, 25 Nov 2024 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732548868; cv=none; b=O6Tdn5c55pwZD/XGHvjiTqNUO9EAROv/hKme+O5uPjGPW0ZMlhza7/13YbgrWKcUWBi4D7M6p5GLtY1qW4bOljntdv0kofPjTZjQqywa1URPDOpZppklPk/cs1jvDF6W5vmN6JUBBi1Je3mRsJG6Ug1bplmOeMb9RHsxbgrXPno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732548868; c=relaxed/simple;
	bh=LBJTpUrDpVzSnNAsnGYQuxSC35AOO/iD1gYyvbBCKeQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=olo4MZ9Cf4dy6QaYjWbg11gk2tV7YZVdmI6PuWuX8hkUV67bq7WJ/jBohYm40dcwEjnzaIWG9DlYjn1YY4RDPuUroHQTmEOG1kYzLSZiJY5erZv7e3Fp6sov2cWsv4fkvSZY0iCSkBHNlAMh/ecSNbalE5T6OhbOP5loL/CMJKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=py1HtW/q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APBLqpt018283;
	Mon, 25 Nov 2024 15:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JqrPI1tcV4YR0pbQ2iwQENV/L6lxxf+7Kdex3PCv3w=; b=py1HtW/qiVC6BZzk
	Jaa2pAfF079eiUNOFN0+Af5i7SjiixbAPkSIbzPVTzTJb0cjq9HqzNXGXBxmlniD
	yfBxTWi34OXt8MNjl5VvOWIW5h6omVIOUkvEvJQYldbwYacADLDAnHrk2lvWonHh
	PbRa0TthW2Lx1uWNU7B5SqgqLGCYGxBhD2cmOM4rAveNWIHbJNA7jhqq/9b9UkOu
	LXqnpo17GjO58JkHEB31yLwjLTcKjHuYVQ+HAFAKciIAEFVgD6d3P6XVFfYipMQq
	wTns3ZB7BktagscBrDRRTonAgKOeFxEKAZnZRyv+wOCHw0nhRyvdJrogk7ey2Y8/
	EbPcGg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4336cfnb2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 15:34:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APFYKeQ007454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 15:34:20 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 07:34:20 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d]) by
 nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d%11]) with mapi id
 15.02.1544.009; Mon, 25 Nov 2024 07:34:19 -0800
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
Subject: RE: [PATCH v3 2/4] media: venus: core: add qcs615 platform data
Thread-Topic: [PATCH v3 2/4] media: venus: core: add qcs615 platform data
Thread-Index: AQHbPvvPYYY1eWJHr0iQpbQKhF55QLLIhfSA//+VjZA=
Date: Mon, 25 Nov 2024 15:34:19 +0000
Message-ID: <da432de1369e4ce799c72ce98c9baaf1@quicinc.com>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-2-5a376b97a68e@quicinc.com>
 <j4nnlbstclwgoy2cr4dvoebd62by7exukvo6nfekg4lt6vi3ib@tevifuxaawua>
In-Reply-To: <j4nnlbstclwgoy2cr4dvoebd62by7exukvo6nfekg4lt6vi3ib@tevifuxaawua>
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
X-Proofpoint-GUID: eqNWbg3Mw1MFj0z7Ml_dOH2sYAVhPDHC
X-Proofpoint-ORIG-GUID: eqNWbg3Mw1MFj0z7Ml_dOH2sYAVhPDHC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250130

On Monday, November 25, 2024 9:36 PM, Dmitry Baryshkov wrote:
> On Mon, Nov 25, 2024 at 11:04:50AM +0530, Renjiang Han wrote:
> > Initialize the platform data and enable venus driver probe of QCS615=20
> > SoC.
> >=20
> > Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com> >
> > ---
> >  drivers/media/platform/qcom/venus/core.c | 50=20
> > ++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
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

> I really want the firmware discussion of linux-firmware to be solved firs=
t,
> before we land this patch.

> SHort summary: can we use a single image for all 5.4 platforms (by using
> v5 signatures, by using v6 signatures, v3 or any other kind of quirk).
Thanks for your comment. We have discussed with the firmware team and
other teams if we can use the same firmware binary. The result is we'd bett=
er
use different firmware files. They should respond in the firmware binary
thread. I will push them and hope them respond as quickly as possible and
give reasons.
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

> The hardware seems to be the same as sc7180, only the frequencies differ.
> Can we change the driver in a way that we don't have to add another
> compat entry just for the sake of changing freqs / bandwidths?

Thank you for your comment. I agree with you. But based on the Venus code
architecture and the distinction between different platforms, I think the
current changes are the simplest.

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

