Return-Path: <linux-media+bounces-809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B92FB7F4791
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 14:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAB521C208B7
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 13:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAF0524D6;
	Wed, 22 Nov 2023 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I3EzI/TW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B566191;
	Wed, 22 Nov 2023 05:18:47 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AMAxwhn008181;
	Wed, 22 Nov 2023 13:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LIGvR/mTo8P8RXKEqO2CgsnUiXbWIMfaKr2PqwtVg2Q=;
 b=I3EzI/TWaujXc3urdM/9vM9LDqHPtEMGPWDzbGFfHAqZvkRQCQwKWQmHs7458haZpVQY
 dyx21f+4OvWcMsyPqYsYI8RSq+s99WYhG9mi3MVvzTHshHgkxiMZoOec2HZzYORbZv5M
 J5lD22QF86REn49FvuCcfJMqA/Mofe54Mg91xi0zRUwtZPY8j0jj7P4T+IF9gpukzF6B
 lW16TOPLrRZBl/dR0HuSyMqYKGx7qsRxk6GMrJIJ4DtDiz7kWnFQagXrpCpDJ7RvPFPW
 Maa2xmf1wk4lz00beaODag6cu5aeFPBGo+G7RlKK3Qw15XRGdoTTtZgI9LZXJlfAJ/HK Ig== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uh477j1sw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 13:18:40 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AMDIdZf032107
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 13:18:39 GMT
Received: from [10.206.101.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 22 Nov
 2023 05:18:34 -0800
Message-ID: <3068aab0-9f23-8ea9-e4dc-5ca3e9d4f51b@quicinc.com>
Date: Wed, 22 Nov 2023 18:48:31 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 venus node
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro
 Carvalho Chehab <mchehab@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20231002-sc7280-venus-pas-v2-0-bd2408891317@fairphone.com>
 <20231002-sc7280-venus-pas-v2-3-bd2408891317@fairphone.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20231002-sc7280-venus-pas-v2-3-bd2408891317@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: StW3x_QCl1Z_zq2FyGE0vrgIRgZg7dKG
X-Proofpoint-GUID: StW3x_QCl1Z_zq2FyGE0vrgIRgZg7dKG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_09,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220094

On 10/2/2023 7:50 PM, Luca Weiss wrote:
> Enable the venus node so that the video encoder/decoder will start
> working.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 2de0b8c26c35..d29f10f822c9 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -665,3 +665,8 @@ &usb_1_qmpphy {
>  
>  	status = "okay";
>  };
> +
> +&venus {
> +	firmware-name = "qcom/qcm6490/fairphone5/venus.mbn";
> +	status = "okay";
> +};
> 
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

Regards,
Vikash

