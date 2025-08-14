Return-Path: <linux-media+bounces-39923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0B5B2691F
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 16:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 224AD1CE6B22
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 14:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC988226177;
	Thu, 14 Aug 2025 14:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HoS019Li"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771A717A318;
	Thu, 14 Aug 2025 14:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755180727; cv=none; b=IoL+yaJlZRsDUwFCSQrPX8Bxz8BJzp9B8pOkaehRIwZ1meFEJIuGvIVCjQUYCIpNTxScVEEe3LpukU+S95xWZsGkVmnspTMKtlmLWzXGXQuAquul6tqt1dff8bUo1ThlxMJmkNvVsPvjYmmyv04VhID+gSzcDIhbPIN0X/wxgF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755180727; c=relaxed/simple;
	bh=hnOCw/+sLGB5wbEBQXIBlA0WUXTcjEIr6cpmGX5WCrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KFGtiF67MchXX57b1lje2no3Dy853jMGSMosXkYUOJxp8CZB7zReawkSvYfxJEbld6typS7VrRUea8+n+LQZsJiT+5K67Q7oPe4a0PNNHb3psoZPEbn+/nVl15DaANxqzO2UOY8lJUkij5xpv3wTXpDbik3WvHz1wIV+ewbkpV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HoS019Li; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9SCFS012279;
	Thu, 14 Aug 2025 14:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JldBxj2+wJa1y97kNC71rG/NvsnEwFtSSknagQM/Mrk=; b=HoS019Lix+ZzaMp2
	sKgsxpAnaq9fICHLKWkAU7RvwWgJi352Ds43v+Qev7JfeprBjyct5nT7DJatypzk
	r29sW+xZxowIUaCCQmfOVmRqT3oBqHdivmUiYwZ7h/bloH3KwxdIU+U2FzkN4+2i
	khRCuPH+iWR0xYkai77fbLQr0OPtIhgzgqT4PPuDWvp/4SI8QlVz1sfJD1wnZ3oA
	BPyDP2XRcKw70gJ18DmYS1yT7Ovnv7EbrfeGsw5Xe3ULXFcVSI+g+JOcdQgpT4j6
	ZVgB6yLHFVPQ/uYW5Z1RMFOe8Oft1UjhWsDjBWyF3lHbafBZWyUCGK6+hAc2XTke
	tCIs+g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxe4dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 14:11:57 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57EEBuSL008825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 14:11:56 GMT
Received: from [10.216.25.245] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 07:11:52 -0700
Message-ID: <d8e64561-f2bf-0486-f607-7c1203e4df43@quicinc.com>
Date: Thu, 14 Aug 2025 19:41:49 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 11/24] media: iris: Add support for video encoder
 device
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-11-c725ff673078@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250813-iris-video-encoder-v2-11-c725ff673078@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX8dGJFX6Ardgv
 nipvxTA6aJNYpulJB5tMLOkoxsVzxKHvSiSHdbvitHhxpqQOsIjy0dTHiZTZDPnve91HQN9OUSZ
 +Q7vC8N3rZpViCChfv77NwdqcSD+PIz0iLvdsNo4VPZLTYYNDmjYVbOm3oKJtgxM2/ATW75hM9G
 Gw0bv0hh7ZsEdBOlTvi/PBnDb/DXkHjv0CNAVp3jMRDdlGmJuw65CS6UaxuAVkmzl+6DilOGE+J
 2UPkanlNegqA7f+ugFeOQVjqdPCVEPv8PR6rOjlFQf3lRbl7d0nhDvZnrVFdJ4Hoe/LKYbKoRD2
 4HcrbEA8EIaEUIJcj5MpS89hJz5E6RGL89WLxVjNcXnLKxLIU8WBilTYpb4hCYMmKE0XVpEikMj
 qAHvc1wN
X-Proofpoint-GUID: j3482zxOC9v0TSa5G7h00Q1-5t8XAWhd
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689deead cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=LasaYAtji7dtrbWHEqcA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: j3482zxOC9v0TSa5G7h00Q1-5t8XAWhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057


On 8/13/2025 3:08 PM, Dikshita Agarwal wrote:
> Add support for registering a V4L2 encoder video device to the iris
> driver. The encoder device is registered with the name
> "qcom-iris-encoder".
> 
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h  |  7 ++++++
>  drivers/media/platform/qcom/iris/iris_probe.c | 36 ++++++++++++++++++++-------
>  2 files changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index aeeac32a1f6d9a9fa7027e8e3db4d95f021c552e..09e83be4e00efb456b7098a499b6cce850134a06 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -25,6 +25,11 @@ struct icc_info {
>  #define IRIS_FW_VERSION_LENGTH		128
>  #define IFACEQ_CORE_PKT_SIZE		(1024 * 4)
>  
> +enum domain_type {
> +	ENCODER	= BIT(0),
> +	DECODER	= BIT(1),
> +};
> +
>  /**
>   * struct iris_core - holds core parameters valid for all instances
>   *
> @@ -33,6 +38,7 @@ struct icc_info {
>   * @irq: iris irq
>   * @v4l2_dev: a holder for v4l2 device structure
>   * @vdev_dec: iris video device structure for decoder
> + * @vdev_enc: iris video device structure for encoder
>   * @iris_v4l2_file_ops: iris v4l2 file ops
>   * @iris_v4l2_ioctl_ops: iris v4l2 ioctl ops
>   * @iris_vb2_ops: iris vb2 ops
> @@ -73,6 +79,7 @@ struct iris_core {
>  	int					irq;
>  	struct v4l2_device			v4l2_dev;
>  	struct video_device			*vdev_dec;
> +	struct video_device			*vdev_enc;
>  	const struct v4l2_file_operations	*iris_v4l2_file_ops;
>  	const struct v4l2_ioctl_ops		*iris_v4l2_ioctl_ops;
>  	const struct vb2_ops			*iris_vb2_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 4e6e92357968d7419f114cc0ffa9b571bad19e46..c3be9deb0a57cc2cf25d69784d54be5e4a5fe06c 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -146,7 +146,7 @@ static int iris_init_resources(struct iris_core *core)
>  	return iris_init_resets(core);
>  }
>  
> -static int iris_register_video_device(struct iris_core *core)
> +static int iris_register_video_device(struct iris_core *core, enum domain_type type)
>  {
>  	struct video_device *vdev;
>  	int ret;
> @@ -155,7 +155,6 @@ static int iris_register_video_device(struct iris_core *core)
>  	if (!vdev)
>  		return -ENOMEM;
>  
> -	strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
>  	vdev->release = video_device_release;
>  	vdev->fops = core->iris_v4l2_file_ops;
>  	vdev->ioctl_ops = core->iris_v4l2_ioctl_ops;
> @@ -163,11 +162,23 @@ static int iris_register_video_device(struct iris_core *core)
>  	vdev->v4l2_dev = &core->v4l2_dev;
>  	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
>  
> -	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> -	if (ret)
> +	if (type == DECODER) {
> +		strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
> +		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +		if (ret)
> +			goto err_vdev_release;
> +		core->vdev_dec = vdev;
> +	} else if (type == ENCODER) {
> +		strscpy(vdev->name, "qcom-iris-encoder", sizeof(vdev->name));
> +		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +		if (ret)
> +			goto err_vdev_release;
> +		core->vdev_enc = vdev;
> +	} else {
> +		ret = -EINVAL;
>  		goto err_vdev_release;
> +	}
>  
> -	core->vdev_dec = vdev;
>  	video_set_drvdata(vdev, core);
>  
>  	return 0;
> @@ -189,6 +200,7 @@ static void iris_remove(struct platform_device *pdev)
>  	iris_core_deinit(core);
>  
>  	video_unregister_device(core->vdev_dec);
> +	video_unregister_device(core->vdev_enc);
>  
>  	v4l2_device_unregister(&core->v4l2_dev);
>  
> @@ -258,17 +270,21 @@ static int iris_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = iris_register_video_device(core);
> +	ret = iris_register_video_device(core, DECODER);
>  	if (ret)
>  		goto err_v4l2_unreg;
>  
> +	ret = iris_register_video_device(core, ENCODER);
> +	if (ret)
> +		goto err_vdev_unreg_dec;
> +
>  	platform_set_drvdata(pdev, core);
>  
>  	dma_mask = core->iris_platform_data->dma_mask;
>  
>  	ret = dma_set_mask_and_coherent(dev, dma_mask);
>  	if (ret)
> -		goto err_vdev_unreg;
> +		goto err_vdev_unreg_enc;
>  
>  	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>  	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
> @@ -277,11 +293,13 @@ static int iris_probe(struct platform_device *pdev)
>  	pm_runtime_use_autosuspend(core->dev);
>  	ret = devm_pm_runtime_enable(core->dev);
>  	if (ret)
> -		goto err_vdev_unreg;
> +		goto err_vdev_unreg_enc;
>  
>  	return 0;
>  
> -err_vdev_unreg:
> +err_vdev_unreg_enc:
> +	video_unregister_device(core->vdev_enc);
> +err_vdev_unreg_dec:
>  	video_unregister_device(core->vdev_dec);
>  err_v4l2_unreg:
>  	v4l2_device_unregister(&core->v4l2_dev);
> 

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

