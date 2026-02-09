Return-Path: <linux-media+bounces-52402-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIWfAyfUiWklCAAAu9opvQ
	(envelope-from <linux-media+bounces-52402-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 13:33:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5914E10EAAB
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 13:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6753B301918A
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 12:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793AD19F137;
	Mon,  9 Feb 2026 12:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H49sXja4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GpWZFMyM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B6F1D5151
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 12:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770640409; cv=none; b=YOOGTidQRSIE9hROJy3o3ldhcMqg5ezvT79VSwOfGkHOfktpAE5Moy2G6tbo60bVWVWRK7tC8D5tL6YUS5tDKgLVQpa9XumP1XtQfzs+ySosI5595zxKn18b5zYqTk6d+0BSPdgbQm7d1Iodivx0jhXq/RFny/x2XM+sC0Tjr0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770640409; c=relaxed/simple;
	bh=4Z5Oc/DQsgL5w4NKy+KxR5Xl05bIUtPTD2RkIW7VyI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gG9DM47AMCi8zc3RnUGctlC/wlbaaSUoKeGSNXxgx9HWV/71OK4TQMFKef8VL8/Gclgl+wDpP8mApV8SRSpQKGObR0qYnv+kdxGkFEkMIKrELCbnbrRboEUSrdIuV4ZynYUTmF4o3coxqO6Z7sZPS+EGgO8FIuU+rJD3nVG/QZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H49sXja4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GpWZFMyM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619Aki6j3699860
	for <linux-media@vger.kernel.org>; Mon, 9 Feb 2026 12:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HbgFX091DMLdpZ6nO8NbVI0IDgUaIoLLSqQlUXXoxUA=; b=H49sXja4dIKDCpX4
	g8jB79M6LNDg+n4Cfvt740KLhu1jYALxAnQto0POKXGyX9zIQl3oTyDimiKCmAru
	2ZZyzowYLF+g0AhjxLInYjz8dNlmPl+j2hHSWZJ1ibe6RSHoVcKPP6fPYHPGHhaN
	K7LKA2XA/n4ranZNaBGLc+HRLEbfWsYlLA+Rv33ad/sjHlaQwc1e+0uZ4cT44l0q
	P5qyqZ+PzKfWP5Xe4PxApQJjICP0eBsNbkkn96Q2m8YFL4FvvcBvPmkNIlFA5pKp
	BRdnncR1AzIr6zcj0SkhWezkaPmxRj+EHpDKdyFHDip8WBuBJZ99iHed+7VKNduW
	ebSBCA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7e4m8adc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 12:33:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c881d0c617so789192185a.1
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 04:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770640408; x=1771245208; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HbgFX091DMLdpZ6nO8NbVI0IDgUaIoLLSqQlUXXoxUA=;
        b=GpWZFMyMD4/k1J+olX3EsrxXEXeMycjHRe5rXquBQhnKefU7S1gcyhwcqWFKJcGmSo
         Acsp1UDLb5ykZgKczMXDn2Jm/9Ln3bkYWZtayOuaJx6+TgNemIrICB8+100vvpM4YO/C
         r+tnK9rxSfdIdXHWb5EdKNae954cHrjUJjk5gE7Lnc3qP5zHRrnnhl60YWWx8nzkRCgA
         3SRJsr9iUcXaDGg4LiUkRDyJZq9SwvHhxC/ywTdkNGVO1mW/4I99vwk+WtnwR5+RPSv5
         ifgwwxzUv1R9oPnSHTOCjSKyxSD0EelH7XUHduy1qZs21SrN4jeF0DIJYmGuJvjwkass
         e3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770640408; x=1771245208;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HbgFX091DMLdpZ6nO8NbVI0IDgUaIoLLSqQlUXXoxUA=;
        b=HWjZ2D/IB/lWXTYZ/yQMQ95+PIe7NA3zw+OnV5uxlCGQ6AaGsnImM4yJ+GXJmHwYYp
         yHItoYA5/QD5BUJRt/nnFZNQWgWENvxWLVswPG2/pO3NybhSjzwJ6J+02CupxQYu4obC
         jgWlfPpUCLz664cpUEAp+DTUOyKWSCpgocvDBtpiKWdri2SV2U5OiehpNIDWvvTGBZO/
         WznOjKhE+o+4jhuyrN2ZO/1D5Dk696ENde5CpBCsZnsM/Hi/r9u74SOwQPKZ761mH0+e
         n7P1A8g7EVhl04ah103boABQByWYVUVpiVK2GW7PypXz3mLVfX9Rp5rviinZynrToxXn
         vHjA==
X-Forwarded-Encrypted: i=1; AJvYcCVHEANmCXQtN9vEVuwOyWGGryTq3wIjGAYF6M3CGkAEHl+U/Jdp8KYX8jIzbkSbO6hjE8/WBfPtKHV68w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiFKRf9ZlhkoxFTcn25yXMcF+3p6PzmURjtBgurXA0erHHQBKD
	32iK7DhA7s0mg3ceKc27cKqq+MRk4US3skjNJ2zM+B3q3Tschq4YPrZanFmRwjCAn5iz7Viea/y
	b1P2GBgJr4WkqgHxNL/Sh373SixEPaJ0wqAn3uxfX68BuFy7NPa3eCT1Rw0whac9QTw==
X-Gm-Gg: AZuq6aLiIXaXjiE0TaKmB4LXXCd0NO9oFg7cN3UsnsqanvEPzoeFMRY+u7+jcasLbpI
	1053dv8ggXRvKoS969fCDuWiemen6P4nRQIzygY61bkULTzYXfT83EidbyAl4f2die70JLDNshU
	FMBiD1qLp72mP/i544aJxXkiERbHf1QhXKy5lWrygby2FYL7Ook+aMT8qpwYIbUbVYd5D/nIcb2
	ITLr4q42NmS8x8XwcrymGIrKzDqmbiQY/tGVPZX7xQD9s+3mS1PnP/VA2JP44KopQxJeYnHQ/mH
	7QbgLpNd4kWmk6bsZNvJfsVhkhiCzw9Q+/cJ7bP0BdNH17Pym9gSQelqAvZm5wYTSOSPwbGEusB
	SJEM6TBCYpM76FbgA8soff96VMU6eTylYmtfBYP54ltdv1ovLmZIFB1XN0QwazfiiVHmL0IgBB7
	6ddwEb4hhcRPeIuGXSdoc8KMw=
X-Received: by 2002:a05:620a:8283:b0:8ca:90de:43f5 with SMTP id af79cd13be357-8cb065196b1mr767737585a.63.1770640408057;
        Mon, 09 Feb 2026 04:33:28 -0800 (PST)
X-Received: by 2002:a05:620a:8283:b0:8ca:90de:43f5 with SMTP id af79cd13be357-8cb065196b1mr767734385a.63.1770640407512;
        Mon, 09 Feb 2026 04:33:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e21982sm2593222e87.71.2026.02.09.04.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 04:33:26 -0800 (PST)
Date: Mon, 9 Feb 2026 14:33:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
Message-ID: <cs4beqxgn7uedeohf5lks4ildjp7il6rtolsodvxltk2o4i7m4@ptahaxggutgw>
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
X-Proofpoint-GUID: nii8Y4CXPhp0-gXDSZc2uhZ_Mq8qaMJr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDEwNSBTYWx0ZWRfX5S3AmEYqoKM5
 joFkMBji6A1KmyCSnR3YezMVB34Tx2yiQ5Jkv/CGnYlqxZgTxT+r8+bgE0CbeToncahX2cAQKC6
 h/guuWjFNIavbZuoDX9W2jidWM2+eRRg5UeRF7T/Marsah+DrawRzKD16BLrfvRocDgsZ7AcIEe
 K91EANdgjU3b7PHBpiM5SSHYyoFjyQ+D97Z8UJPcOV2qP55FCUjLD/Tulxrxn9XpgjfFk+suuTN
 nlpOnbVGNFkvOmQ/ImxMGZPOgRqqap+9KVu3MFWikH0JYaKu+yeKBJ+Gv+EMMQoGgatLVJXhzXI
 dIV/e+mNt0qrqQOo3wtFXXd8tatQiXy6Usn7UcAGQd2w7Oa9HJWk62zWFHv7BaJkFNC0/8Chbum
 dv0O86AO3jy9AajSlzOyk5P/0+RBpLqmiVyt8DaMg0VdBh8q+PZIlyPM6Ew/RUoqha1X34F72G/
 /a1Mp1rn8xn3jH+5+Hg==
X-Proofpoint-ORIG-GUID: nii8Y4CXPhp0-gXDSZc2uhZ_Mq8qaMJr
X-Authority-Analysis: v=2.4 cv=WecBqkhX c=1 sm=1 tr=0 ts=6989d419 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=SLWnhb8ndqFUObRpVggA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52402-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5914E10EAAB
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 03:15:26PM +0530, Dikshita Agarwal wrote:
> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
> use Gen1 by default, but boards that intend to use Gen2 firmware can
> opt‑in by specifying a Gen2 image through the Device Tree
> 'firmware-name' property.

What are the benefits of using Gen2 firmware? Why is it left as a
board-level selection? E.g. for the non-fused boards, would it be
benefitable to switch to Gen2 or not?

> 
> Based on this property and the availability of the referenced
> firmware binary, the driver selects the appropriate HFI generation and
> updates its platform data accordingly. Boards that do not
> specify a Gen2 firmware, or where the firmware is not present,
> automatically fall back to Gen1.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.c       | 30 ++++++++
>  drivers/media/platform/qcom/iris/iris_core.h       |  1 +
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  4 +-
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 83 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_sc7280.h      | 15 ++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  3 -
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  3 +
>  8 files changed, 135 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index 8e4cc6d6123069dea860062f0172f1e4b90cfc13..b14b04b32b62e324a70a558063dc673f7b9c2981 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <linux/firmware.h>
>  #include <linux/pm_runtime.h>
>  
>  #include "iris_core.h"
> @@ -10,6 +11,31 @@
>  #include "iris_state.h"
>  #include "iris_vpu_common.h"
>  
> +int iris_update_platform_data(struct iris_core *core)
> +{
> +	const char *fwname = NULL;
> +	const struct firmware *fw;
> +	int ret;
> +
> +	if (of_device_is_compatible(core->dev->of_node, "qcom,sc7280-venus")) {
> +		ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
> +					    &fwname);
> +		if (ret)
> +			return 0;
> +
> +		if (strstr(fwname, "gen2")) {

How is going to be applicable for the possibly vendor-signed firmware?
Or for the firmware which uses a different name?  E.g.
qcom/qcm6490/fairphone5/venus.mbn - is it gen1 or gen2?

We need to query the firmware and detect the interface based on the
query results. Either check the file itself, or start the firmware and
query the running system.

Moreover, I guess, this is not limited to SC7280 only. My guess would be
that any platform can be either gen1 or gen2 (not implying that both
firmware versions actually exists for all the platforms).

> +			ret = request_firmware(&fw, fwname, core->dev);
> +			if (ret) {
> +				dev_err(core->dev, "Specified firmware is not present\n");

Doesn't request_firmware already print a warning?

> +				return ret;
> +			}
> +			release_firmware(fw);
> +			core->iris_platform_data = &sc7280_gen2_data;
> +		}
> +	}
> +	return 0;
> +}
> +
>  void iris_core_deinit(struct iris_core *core)
>  {
>  	pm_runtime_resume_and_get(core->dev);

-- 
With best wishes
Dmitry

