Return-Path: <linux-media+bounces-53698-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIj6KrGLoWnouAQAu9opvQ
	(envelope-from <linux-media+bounces-53698-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 13:18:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8751B7028
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 13:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 884AD3079E1B
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 12:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3033EFD2D;
	Fri, 27 Feb 2026 12:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3mx7txH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIvS3PrT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563483101A5
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772194723; cv=none; b=nk8wQGkinecWTLjP6FkCj6uhsbxZg/IiC7dVA2eWJ/lxY0mZHe4bU0kSE/OO9Nv/9RB4jCepFEYYL2sojfKOuzuJW56/ubjrUP/iz22Em/N8iSfcpXUBf7be+UgT/oxoFuco3FvzcMOzyAQPY2qfw6VxrKvkm/oq4X8ylxzbeUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772194723; c=relaxed/simple;
	bh=r+1DW+vdCAjVaMGv1CiNUwmbl+sMNb8OlHajpZHROh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dvyr/9pa6FZxABHIjtXAj+uUvDRC29tjsDJksvPCqiIBHrRZo5MS0gz23dVQRE9JJfQMDLBGbNlrsjhk/59Xbk2SL7+jF/vkkp6k8dzdmdPDWnOpmh7ZItTtCUceNehNF5Vksb86Z1lSt26f/KqzV9jKDqHynEeZZ69Ggup3mZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3mx7txH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIvS3PrT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R7fVqY2309061
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 12:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D8tWzmoXEJMcJCOwQW7bKfdn
	9etfoFJAKbZ55ZWqmvs=; b=N3mx7txHI25hX9oAPBSrI8EpAyDyAMYkO9CyZi++
	X68X/GsgtVqUFkEPMJ+VPWaqcAO9nKLu0Gfb+dVM/1u7YOO6rX24ajr6wfiJ2E1/
	FFUvuYJv57XqRLcqsvs6NTbLk3+aw3N2/gaA3rRA/4/s6yDL6ovhr7HsAB2hFdEp
	jCsP8UbJ3KALZoycQH85dFvhRt2EEJMLX3IFY+coPiV4R1EHsb7uQFNbsYDINj/E
	0+kc26JrJITYZyLH8e+XIqU1oMbZsBSvMRhMr7IHOfpZolX5JDuFATw050nLVefv
	yN2HZZ9sSiyjlAQLj8AZCJgSvKrf0kYG98MXZ17LmH12Ig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck73q0t4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 12:18:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb52a9c0eeso2594295485a.2
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 04:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772194719; x=1772799519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D8tWzmoXEJMcJCOwQW7bKfdn9etfoFJAKbZ55ZWqmvs=;
        b=RIvS3PrTjCNarJyTLnxETUDmfPJbrxl8a55AJbYbWp/Q4PXLJO4Gi/m58ySPhLc9Q1
         PqKAP5BRKx5UaBdtbxTt70EANNhxzn+/pz3jJg694xsNyMUh7LKcVxHjVN3agBpYGCjQ
         N9y4gsnRWnc1ZViKBOpkfJS7lbbFPErO9pwiIT7ohRrSHvtOZDwokkV5qlvPZPbiWWfH
         AtsQkOtI0JmLBGw0lW+ioY4+KXCnSsaE5Le042w1BYVsFowr9pONJGWqdLN1251JT2eQ
         wECKVVuh4S2LXYSeVYBhrhxvidCvwt7G+6Bgi+jJYTbcyVzU0273FanSCvQ/tD28FTfR
         sX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772194719; x=1772799519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8tWzmoXEJMcJCOwQW7bKfdn9etfoFJAKbZ55ZWqmvs=;
        b=DnFGPHpyvx5AhotVpteHqtQba3S+KJ9RFHFEkKW81IUkUnB0z8n7DMXtb7mxLJlRUu
         VwvP73XGhNmjSJP4EBqQE0CJYZkqJNP/C3gpenJDUHQxDKljutEh+F5lrDE7KHm0u8rH
         4JXz41hnowbahNyxozSqyw0fmJQd8sR75foMBGvUkPOxbWNzDd8XfSc2u6Uq2F1qAoyo
         HnbIMTKRL6EDbU3CUGriOC1NEP0abSF2Xj9cv13KTp8rUEcdDkHreon/uwDOWvNFdtC9
         3RN3QhYRHD8a4HlStNXi0FH7llb23Tk0eI3exBtOhm1ac9W+dIgzUuuFn5f8+EJEtjAu
         TSRw==
X-Forwarded-Encrypted: i=1; AJvYcCVImav0CbByzr/3qx4D6vR/ByA/k8tmMk1N1e1faGkY7lgGNB2RvA0hnUTWc9bSskizXUeYkreGr/k/pw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9JgiNbI6JzeBGCvtZGaYyV7ZX91Vm8dtdNohMaLVJaXzUC3AX
	DPPe7Uol43n3ubPugMX662LlY2Q7pm5evhZ52Hb+bMbn9efhfUVJsr9zaJWTib5+DtwRsxraBz9
	Uu+DNUMgN70cL1IliEP96sCAlZCAVRGLflQkbg0IYhdGHUEJif2qbhwGo/0xCdv1M/A==
X-Gm-Gg: ATEYQzx9MmrcLyCy5C3fPvLUXARwBTVPnahN3akCBd4VF81J4aN7oo6ge944019ThVN
	utqicvjYE5n+ZT4MHRvZfNQUbZm107di8molqiwC08pTORdF3JCYrDq6jXqhOv4M/M+rBpHImvJ
	shHCiMZIg4MEXq1CwmkJeHofFXaF0Q+04nimk+BhvL6wxcmaGlcIqRv+N2R/QfMwRAQNbga0dTL
	s5SNuQ0Sdbw/qb8mn9/QFdBHiG1GAD1h3EV3ABBlHjQ00ZhbFv6NI0oBcUToaUcPcCHZN4OvHVx
	SLKf2kfq85uL8vfFDJOk4CZHtRzMYGvhyFOeHJ0Ln2TGi3lHdIwJRPIA5IHGJJjksTlO9GXM2jf
	tYx5AeHfso4WqEmMwdVg8PnesRH/sguGdLXhMEJiPzKqKZRbh1Z4jNbmB7eQFG5EsMGlZkCje9G
	6xyWiF5kkCodf0sAmbF56zACej/L2s4TpOrNQ=
X-Received: by 2002:a05:620a:40c8:b0:8cb:7b27:9336 with SMTP id af79cd13be357-8cbc8d6d746mr324227785a.5.1772194718462;
        Fri, 27 Feb 2026 04:18:38 -0800 (PST)
X-Received: by 2002:a05:620a:40c8:b0:8cb:7b27:9336 with SMTP id af79cd13be357-8cbc8d6d746mr324224385a.5.1772194717960;
        Fri, 27 Feb 2026 04:18:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1111ce8b1sm420933e87.28.2026.02.27.04.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 04:18:37 -0800 (PST)
Date: Fri, 27 Feb 2026 14:18:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: iris: Add support for Gen2 firmware
 detection and loading on SC7280
Message-ID: <yjtzeyjovbi3coyw4rblczokuki6t7oj5ni3exrzksdg4dwwd5@seuaf2tmrvub>
References: <20260227-iris_sc7280_gen2_support-v2-0-7e5b13d26542@oss.qualcomm.com>
 <20260227-iris_sc7280_gen2_support-v2-3-7e5b13d26542@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-iris_sc7280_gen2_support-v2-3-7e5b13d26542@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEwNyBTYWx0ZWRfX0qN4wwYkFg+j
 u9DIDvrzY5W61GMzkxC9BCtmgfZajFA8g4K78yGAqviRLBzuhYlQihcY0iCcS2KqlYknN5c12S5
 Wk4JOlX/z5hslDJ64jpfcVS/TDFwNQodCeRlQNNDI/wsephHScG6xQI1kJObo4ZbNwX+abkYikD
 Py2IhBOocdhPaiQz/zTlnzBi3CIwZZqgS5ysKTlQdKZbKKpP0EcyHlgdZR8T2oyEQWk9zUkopSD
 iTVXDW7cV2gSbSsJXns2+G1Fi5jGYq4En+oIh0Km+hPfIBFePqr0lfu17GB0ZwEQZq7hFqZJPWg
 8q+DM0+f1gtEuoKoCgiIyyw3ZcvGYnEfMbTeUFWD7ZxJPsJMUvYob6lGzw86mKTr/kywjIPwsMW
 nwNjNaLUjjwvA6+dHpCuITYC3EfEM2AR/Fyect8uOIoDWgRdQdxaVDRyOA8JW7736AlCuwgWtsl
 4gqmc7+7wOI567Fpa3Q==
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=69a18b9f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=vAhLNi6rj8_hoSnI:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Dpb5IArLtI-tnkYCkt0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Ix1optxkmMBVKKGqtlIJDjLgmxKDf7Vf
X-Proofpoint-GUID: Ix1optxkmMBVKKGqtlIJDjLgmxKDf7Vf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53698-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,60fps:email,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C8751B7028
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 12:21:03PM +0530, Dikshita Agarwal wrote:
> SC7280 supports both Gen1 and Gen2 HFI firmware. To support both
> dynamically, update the firmware loading mechanism to prioritize
> Gen2 availability and detect the loaded firmware version at runtime.
> 
> The firmware loading logic is updated with the following priority:
> 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> 2. Gen2 Autodetect (SC7280 only): If no DT property exists, attempt to
>    load the specific Gen2 firmware image (`vpu20_p1_gen2_s6.mbn`).
> 3. Default Fallback: If Gen2 loading fails or is not applicable, use
>    the default firmware name defined in the default platform data.
> 
> Additionally, introduce `iris_update_platform_data` to inspect the
> loaded firmware memory before authentication. This function scans for
> `QC_IMAGE_VERSION_STRING`. If the version string starts with "vfw" or
> matches "video-firmware.N.M" (where N >= 2), it identifies the
> firmware as Gen2.
> 
> If Gen2 firmware is detected on SC7280, the driver switches the
> internal platform data pointer to the Gen2 configuration.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c   | 70 +++++++++++++++++-
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  4 +-
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 83 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_sc7280.h      | 15 ++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  3 -
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  3 +
>  7 files changed, 171 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 5f408024e967fd21ade66cc3fa377d8507f9002e..f6ee7f58d4ce215ad9f7fb5fdcadec17f99c8848 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -14,6 +14,53 @@
>  
>  #define MAX_FIRMWARE_NAME_SIZE	128
>  
> +static void iris_update_platform_data(struct iris_core *core)
> +{
> +	const char *marker = "QC_IMAGE_VERSION_STRING=";
> +	struct device_node *node = core->dev->of_node;
> +	const char *found = NULL;
> +	int major = 0, minor = 0;
> +	char version_buf[64];
> +	struct resource res;
> +	void *mem_virt;
> +	size_t i;
> +
> +	if (!of_device_is_compatible(node, "qcom,sc7280-venus"))
> +		return;
> +
> +	if (of_reserved_mem_region_to_resource(node, 0, &res)) {
> +		dev_err(core->dev, "Failed to get reserved memory for version check\n");
> +		return;
> +	}
> +
> +	mem_virt = memremap(res.start, resource_size(&res), MEMREMAP_WC);
> +	if (!mem_virt) {
> +		dev_err(core->dev, "Failed to remap memory for version check\n");
> +		return;
> +	}
> +
> +	for (i = 0; i < resource_size(&res) - strlen(marker); i++) {
> +		if (memcmp(mem_virt + i, marker, strlen(marker)) == 0) {
> +			found = (const char *)(mem_virt + i + strlen(marker));
> +			break;
> +		}
> +	}

This should be done in iris_load_fw_to_memory(). Saves you from extra
memremap() / memunmap() and also from scanning extra data beyond the
loaded image area.

> +
> +	if (found) {
> +		strscpy(version_buf, found, sizeof(version_buf));
> +
> +		/* Check for gen2 version string: "vfw..." OR "video-firmware.N..." (N>=2) */
> +		if (strncmp(version_buf, "vfw", 3) == 0 ||
> +		    (sscanf(version_buf, "video-firmware.%d.%d", &major, &minor) == 2 &&
> +			    major >= 2)) {
> +			dev_info(core->dev, "Gen2 FW Detected: %s\n", version_buf);
> +			core->iris_platform_data = &sc7280_gen2_data;
> +		}
> +	}
> +
> +	memunmap(mem_virt);
> +}
> +
>  static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  {
>  	u32 pas_id = core->iris_platform_data->pas_id;
> @@ -64,21 +111,38 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  
>  int iris_fw_load(struct iris_core *core)
>  {
> +	struct device_node *node = core->dev->of_node;
>  	const struct tz_cp_config *cp_config;
>  	const char *fwpath = NULL;
>  	int i, ret;
>  
>  	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
>  					    &fwpath);
> -	if (ret)
> -		fwpath = core->iris_platform_data->fwname;
> +	if (!ret) {
> +		ret = iris_load_fw_to_memory(core, fwpath);
> +	} else {
> +		bool fw_loaded = false;
> +
> +		if (of_device_is_compatible(node, "qcom,sc7280-venus")) {
> +			ret = iris_load_fw_to_memory(core, "qcom/vpu/vpu20_p1_gen2_s6.mbn");
> +			if (!ret)
> +				fw_loaded = true;
> +		}
> +
> +		if (!fw_loaded) {
> +			fwpath = core->iris_platform_data->fwname;
> +			dev_dbg(core->dev, "loading default fw: %s\n", fwpath);
> +			ret = iris_load_fw_to_memory(core, fwpath);
> +		}

Make SC7280 default to Gen2 firmware. Then:

	ret = iris_load_fw_to_memory(core, fwpath);
	if (ret == -ENOENT &&
	    fwpath == core->iris_platform_data->fwname &&
	    of_device_is_compatible(node, "qcom,sc7280-venus"))
		ret = iris_load_fw_to_memory(core, sc7280_data.fwname);

> +	}
>  
> -	ret = iris_load_fw_to_memory(core, fwpath);
>  	if (ret) {
>  		dev_err(core->dev, "firmware download failed\n");
>  		return -ENOMEM;
>  	}
>  
> +	iris_update_platform_data(core);
> +
>  	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580eb10022fdcb52f7321a915e8b239d..f1bbbe043e3a3ccc5eebf67091162678eb83bf45 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -43,6 +43,7 @@ enum pipe_type {
>  
>  extern const struct iris_platform_data qcs8300_data;
>  extern const struct iris_platform_data sc7280_data;
> +extern const struct iris_platform_data sc7280_gen2_data;
>  extern const struct iris_platform_data sm8250_data;
>  extern const struct iris_platform_data sm8550_data;
>  extern const struct iris_platform_data sm8650_data;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index df8e6bf9430ed2a070e092edae9ef998d092cb5e..6dbdd0833dcdc7dfac6d7b35f99837c883e188e7 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -414,8 +414,8 @@ const struct iris_platform_data sc7280_data = {
>  	.dma_mask = 0xe0000000 - 1,
>  	.fwname = "qcom/vpu/vpu20_p1.mbn",
>  	.pas_id = IRIS_PAS_ID,
> -	.inst_iris_fmts = platform_fmts_sm8250_dec,
> -	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
> +	.inst_iris_fmts = platform_fmts_sc7280_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sc7280_dec),

Why?

>  	.inst_caps = &platform_inst_cap_sm8250,
>  	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..5f3be22a003fe5d80b683b43a1b2386497785fb1 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -15,6 +15,7 @@
>  #include "iris_platform_qcs8300.h"
>  #include "iris_platform_sm8650.h"
>  #include "iris_platform_sm8750.h"
> +#include "iris_platform_sc7280.h"

Don't you end up with two copies of 7280 data in the object files?

>  
>  #define VIDEO_ARCH_LX 1
>  #define BITRATE_MAX				245000000
> @@ -1317,3 +1318,85 @@ const struct iris_platform_data qcs8300_data = {
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
> +
> +const struct iris_platform_data sc7280_gen2_data = {
> +	.get_instance = iris_hfi_gen2_get_instance,
> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	/* Gen2 FW for SC7280 requires bigger size for line buffer for encoder */
> +	.get_vpu_buffer_size = iris_vpu33_buf_size,
> +	.vpu_ops = &iris_vpu2_ops,
> +	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.icc_tbl = sm8550_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> +	.bw_tbl_dec = sc7280_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
> +	.pmdomain_tbl = sm8550_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> +	.opp_pd_tbl = sc7280_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
> +	.clk_tbl = sc7280_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
> +	.opp_clk_tbl = sc7280_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_sc7280_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sc7280_dec),
> +	.inst_caps = &platform_inst_cap_sm8550,
> +	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> +	.tz_cp_config_data = tz_cp_config_sm8550,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.ubwc_config = &ubwc_config_sm8550,
> +	.core_arch = VIDEO_ARCH_LX,
> +	.num_vpp_pipe = 1,
> +	.no_aon = true,
> +	.max_session_count = 16,
> +	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
> +	/* max spec for SC7280 is 4096x2176@60fps */
> +	.max_core_mbps = 4096 * 2176 / 256 * 60,
> +	.dec_input_config_params_default =
> +		sm8550_vdec_input_config_params_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
> +	.dec_input_config_params_hevc =
> +		sm8550_vdec_input_config_param_hevc,
> +	.dec_input_config_params_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
> +	.dec_input_config_params_vp9 =
> +		sm8550_vdec_input_config_param_vp9,
> +	.dec_input_config_params_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.enc_input_config_params = sm8550_venc_input_config_params,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8550_venc_input_config_params),
> +	.dec_output_config_params = sm8550_vdec_output_config_params,
> +	.dec_output_config_params_size = ARRAY_SIZE(sm8550_vdec_output_config_params),
> +	.enc_output_config_params = sm8550_venc_output_config_params,
> +	.enc_output_config_params_size = ARRAY_SIZE(sm8550_venc_output_config_params),
> +
> +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> +
> +	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
> +	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
> +
> +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
> +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
> +	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
> +	.dec_output_prop_avc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
> +	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
> +	.dec_output_prop_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
> +	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
> +	.dec_output_prop_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
> index 0ec8f334df670c3c1548a5ee3b8907b333e34db3..6e05f2542a5457bd0b3b6acced3bd54d166b2023 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
> @@ -6,6 +6,21 @@
>  #ifndef __IRIS_PLATFORM_SC7280_H__
>  #define __IRIS_PLATFORM_SC7280_H__
>  
> +static struct iris_fmt platform_fmts_sc7280_dec[] = {
> +	[IRIS_FMT_H264] = {
> +		.pixfmt = V4L2_PIX_FMT_H264,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_HEVC] = {
> +		.pixfmt = V4L2_PIX_FMT_HEVC,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_VP9] = {
> +		.pixfmt = V4L2_PIX_FMT_VP9,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +};
> +
>  static const struct bw_info sc7280_bw_table_dec[] = {
>  	{ ((3840 * 2160) / 256) * 60, 1896000, },
>  	{ ((3840 * 2160) / 256) * 30,  968000, },
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 22c7b3410710328b900fc49459cd399aa0e89b02..1f44d3ea337df63fbf5317b9b99139a0867267c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -12,7 +12,6 @@
>  #include <linux/reset.h>
>  
>  #include "iris_core.h"
> -#include "iris_ctrls.h"
>  #include "iris_vidc.h"
>  
>  static int iris_init_icc(struct iris_core *core)
> @@ -257,8 +256,6 @@ static int iris_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	iris_session_init_caps(core);
> -

Why?

>  	ret = v4l2_device_register(dev, &core->v4l2_dev);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index bd38d84c9cc79d15585ed5dd5f905a37521cb6dc..0727d5d19cb9b7ed1f72ab840ae5dfda0162e23d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -9,6 +9,7 @@
>  #include <media/v4l2-mem2mem.h>
>  #include <media/videobuf2-dma-contig.h>
>  
> +#include "iris_ctrls.h"
>  #include "iris_vidc.h"
>  #include "iris_instance.h"
>  #include "iris_vdec.h"
> @@ -196,6 +197,8 @@ int iris_open(struct file *filp)
>  		goto fail_m2m_release;
>  	}
>  
> +	iris_session_init_caps(core);
> +
>  	if (inst->domain == DECODER)
>  		ret = iris_vdec_inst_init(inst);
>  	else if (inst->domain == ENCODER)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

