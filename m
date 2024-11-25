Return-Path: <linux-media+bounces-21936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C21979D7D20
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 09:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47421B20D9C
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 08:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BBA18C345;
	Mon, 25 Nov 2024 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a8/SQAv0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE49618B475;
	Mon, 25 Nov 2024 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732524254; cv=none; b=JLeththaU6nFet1GMxqAZ8vJYCFmPfFM/Mx6l+dwfwWIDRyRLbbcY0jiRen4tCWKgztamyhQugHIHW4s3/Ew/cRuUp6zMeeLfPNZSEpSXZN3bnuqJ1puKcwcX8d1FzXI/62Ug+1iZDhOxjgqvRm5DicSDGhkMxf9el4uKn6u5JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732524254; c=relaxed/simple;
	bh=ngS9NbVV/2REdZo7ltVT8qkR+IjHY4lF+E0xJFke7tA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ec5qIWYEElXdlEqSfttIPn3kL7vAibr8WysjUMn4iRVngDumGeZRStk7ejN3rMuHCGgKEXS4Usew3BnIRlWh/2tomE/Dtxi7BBikNq5NM2z31Bp18A/kfKhoW9oJB6sTqa0cOCn9el9MTIAQKbKmVn0Jm3U8SjlwD8fnESUZ8UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a8/SQAv0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOMa0D8022508;
	Mon, 25 Nov 2024 08:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vI6d6MCeElNERiIDxbV7GH8wtRkirTmAlq1y3XukUf0=; b=a8/SQAv07SmKFkxh
	YmGSkp7akEHW7LjwzIIFI9VeJdMQpOU7otyg8ILWtqLSnJLHUPyB4iVNF7q8ayKO
	VIE7h5MlvAyUL/Lk2qZEFHGVWLxruGpjyGBxjo+m5zO6v7W/0B74fWUNseAjVTYU
	OhuAu2cnsg4MKvSQg8zmf4xNk5TYyOaQt/+Zgava+1uxOZTt4yh54PGxC/kiZCDH
	GSmRKOC2vrcky8oSWCUTW1D/NOmuqDixyFHiK6rVOxD+nDheIez4BrZHMUo3IkYC
	efGD41aQ6vc1h8x0G/LCrvNc3FX5KAV+mXy5Fs5H6KKgsEhQqmyAjJMCLewqGWJ1
	qsVOQQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4336mxbyb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 08:44:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP8i7SK007762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 08:44:07 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 00:44:06 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d]) by
 nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d%11]) with mapi id
 15.02.1544.009; Mon, 25 Nov 2024 00:44:06 -0800
From: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>,
        "bryan.odonoghue@linaro.org"
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 2/4] media: venus: core: add qcs615 platform data
Thread-Topic: [PATCH v3 2/4] media: venus: core: add qcs615 platform data
Thread-Index: AQHbPvvPYYY1eWJHr0iQpbQKhF55QLLHqWPg
Date: Mon, 25 Nov 2024 08:44:06 +0000
Message-ID: <3b3cab5c583a41d79acc75dd08ca84d6@quicinc.com>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-2-5a376b97a68e@quicinc.com>
In-Reply-To: <20241125-add-venus-for-qcs615-v3-2-5a376b97a68e@quicinc.com>
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
X-Proofpoint-ORIG-GUID: E-QgE2bRToqMOzxDjd5DcfkpuGiEX4cl
X-Proofpoint-GUID: E-QgE2bRToqMOzxDjd5DcfkpuGiEX4cl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 adultscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250074

On Monday, November 25, 2024 1:35 PM, Renjiang Han wrote:
> Initialize the platform data and enable venus driver probe of QCS615 SoC.

Forgot to add Reviewed-by, next version will add Reviewed-by: Bryan O'Donog=
hue <bryan.odonoghue@linaro.org>

> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 50 insertions(+)

> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/pla=
tform/qcom/venus/core.c
> index 423deb5e94dcb193974da23f9bd2d905bfeab2d9..39d8bcf62fe4f72674746b759=
94cce6cbaee94eb 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -630,6 +630,55 @@ static const struct venus_resources msm8998_res =3D =
{
>  	.fwname =3D "qcom/venus-4.4/venus.mbn",
>  };
=20
> +static const struct freq_tbl qcs615_freq_table[] =3D {
> +	{ 0, 460000000 },
> +	{ 0, 410000000 },
> +	{ 0, 380000000 },
> +	{ 0, 300000000 },
> +	{ 0, 240000000 },
> +	{ 0, 133333333 },
> +};
> +
> +static const struct bw_tbl qcs615_bw_table_enc[] =3D {
> +	{  972000,  951000, 0, 1434000, 0 },	/* 3840x2160@30 */
> +	{  489600,  723000, 0,  973000, 0 },	/* 1920x1080@60 */
> +	{  244800,  370000, 0,	495000, 0 },	/* 1920x1080@30 */
> +};
> +
> +static const struct bw_tbl qcs615_bw_table_dec[] =3D {
> +	{ 1036800, 1987000, 0, 2797000, 0 },	/* 4096x2160@30 */
> +	{  489600, 1040000, 0, 1298000, 0 },	/* 1920x1080@60 */
> +	{  244800,  530000, 0,  659000, 0 },	/* 1920x1080@30 */
> +};
> +
> +static const struct venus_resources qcs615_res =3D {
> +	.freq_tbl =3D qcs615_freq_table,
> +	.freq_tbl_size =3D ARRAY_SIZE(qcs615_freq_table),
> +	.bw_tbl_enc =3D qcs615_bw_table_enc,
> +	.bw_tbl_enc_size =3D ARRAY_SIZE(qcs615_bw_table_enc),
> +	.bw_tbl_dec =3D qcs615_bw_table_dec,
> +	.bw_tbl_dec_size =3D ARRAY_SIZE(qcs615_bw_table_dec),
> +	.clks =3D {"core", "iface", "bus" },
> +	.clks_num =3D 3,
> +	.vcodec0_clks =3D { "vcodec0_core", "vcodec0_bus" },
> +	.vcodec_clks_num =3D 2,
> +	.vcodec_pmdomains =3D (const char *[]) { "venus", "vcodec0" },
> +	.vcodec_pmdomains_num =3D 2,
> +	.opp_pmdomain =3D (const char *[]) { "cx" },
> +	.vcodec_num =3D 1,
> +	.hfi_version =3D HFI_VERSION_4XX,
> +	.vpu_version =3D VPU_VERSION_AR50,
> +	.vmem_id =3D VIDC_RESOURCE_NONE,
> +	.vmem_size =3D 0,
> +	.vmem_addr =3D 0,
> +	.dma_mask =3D 0xe0000000 - 1,
> +	.cp_start =3D 0,
> +	.cp_size =3D 0x70800000,
> +	.cp_nonpixel_start =3D 0x1000000,
> +	.cp_nonpixel_size =3D 0x24800000,
> +	.fwname =3D "qcom/venus-5.4/venus_s6.mbn", };
> +
>  static const struct freq_tbl sdm660_freq_table[] =3D {
>  	{ 979200, 518400000 },
>  	{ 489600, 441600000 },
> @@ -937,6 +986,7 @@ static const struct of_device_id venus_dt_match[] =3D=
 {
>  	{ .compatible =3D "qcom,msm8916-venus", .data =3D &msm8916_res, },
>  	{ .compatible =3D "qcom,msm8996-venus", .data =3D &msm8996_res, },
>  	{ .compatible =3D "qcom,msm8998-venus", .data =3D &msm8998_res, },
> +	{ .compatible =3D "qcom,qcs615-venus", .data =3D &qcs615_res, },
>  	{ .compatible =3D "qcom,sdm660-venus", .data =3D &sdm660_res, },
>  	{ .compatible =3D "qcom,sdm845-venus", .data =3D &sdm845_res, },
>  	{ .compatible =3D "qcom,sdm845-venus-v2", .data =3D &sdm845_res_v2, },

> --
> 2.34.1


