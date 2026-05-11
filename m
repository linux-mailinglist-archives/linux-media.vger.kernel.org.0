Return-Path: <linux-media+bounces-61048-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPIYJQZ5AWpGaQEAu9opvQ
	(envelope-from <linux-media+bounces-61048-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 08:36:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE97508979
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 08:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C92B3006218
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 06:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D976D2E542C;
	Mon, 11 May 2026 06:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RB6Cjpn1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+XTCNqf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A22224AFA
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 06:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481392; cv=none; b=C5qOzMKXbfffsLMqevUSJatHoe2md9tmYVRSM66+ogxCmyZde56ms9m6ojk4oI0SILBIVxqOOmNIgYbX00MjBTu0hTLWA1vs7AHuUBRbvtRtHJgX8ijYIngXR9Vtv3xE9hCpQ8H/hS4W9gAh13Vsc6n4jmWtLhUaz0P3ketiyqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481392; c=relaxed/simple;
	bh=lZbRbAh+DVTE8ujkY7JeZBiPbcfbY8lNdmMSt/Ya6Uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YvfJChaTVOoC68aEac7WR9EvVdcLJzj/oJ2FwL73s4mv8Ku29uQ9U39RCsYdahpZH6bIQa+oC4wOXGedHdoxjJzxMqbbwQ+ySj9ogjIWqMZTH98lUMzlgnrvh6A/7kpT7wcmWnDlTrJLWDr2purEga1W/bFTAH3CkvZTzJZbwUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RB6Cjpn1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+XTCNqf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B1RHmV3472865
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 06:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LSef7RQI0F2G/1yBQohbBWlriTMuEBGlgqLIUB16uHI=; b=RB6Cjpn1eJY8kw5p
	ZboJC02bz7VBu6IlxSk0J/7NtKWeFfuo2WxNMQz2eotVtn/sAPETnKT3mmVjOhqq
	2w8OD129WJ+Vw9+0F/FT2Y7H6ewjj14SyIUhoKST9lC3yrna0mFeqrWSGmlMYSeo
	fcOGyq9saLghWvikkjM4YvAcKMItyy4c4Q09YRVhq9mPwYw+LfIDb1Yr59qSdpXi
	lwXcCjyMu+Z8Xtbe1QrhKvdF02IcFs4mj+Spbnj2x0HnwHx0gnNCyWWmbnIZyrs8
	tTtUe7JZITFyPxblgNFTH/zkHZwlnIfDBswcIuFZ4ijQ6FXyvkuizQ0wvcpuhFFL
	qiVyuQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1ux6vvt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 06:36:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso3496055a91.1
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 23:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778481388; x=1779086188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LSef7RQI0F2G/1yBQohbBWlriTMuEBGlgqLIUB16uHI=;
        b=H+XTCNqfrGxiwjM8PCHM+DVsOqiYwwRLxKm7MAlhPdyyPSeLTaOGi7rrLaL9fKPBsG
         j4TMDs0+QsSolzqugJR3NOTCNrTmMxOy3taZNIbbDig1Lvit+AHdIuK3ST4v8HP6fgFN
         PbbGYmhn8Pg4lpkpcRGBE+TtocD6TuwGYOzFUCLX0zh3AWx++lhVJBBw72q3mwRc3ern
         apT5+F57sgVajvy1a+XL38ipyufbF8rhnPEh+R3LTpp0boLyAV+DSZzbbfzldYhApz42
         yjStT9/31JxIqQE4mlPvlJk1iImIBNJ0AEiFNjD60yTk7SYDovezQQ30RwFAhqZiOJD9
         Ffig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481388; x=1779086188;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSef7RQI0F2G/1yBQohbBWlriTMuEBGlgqLIUB16uHI=;
        b=kp6ySaPy3AdeKI+6fOk2NNGO9f5IuznPkJx0yynlhjmjCAhg6kC4cHgJ+bv1XRK7yP
         R+nhvmNyYCWZU8LlIBuYli/fCl1U61o+q0ov8LhU2BJGPxsM7pJDq1CILAV9PiCdrjKZ
         N+9ScyTV0OWD02P7iRqO7C2/ARk9wloNs5U7POmZrJtgL6L6m0Cp3OKGYWS8llU2kacI
         0KLkYQ+finatbap0Gu+QwuNdykyq5kJb83krRJCkRT6REnMBG/e2H4W5rfwX//A7kkET
         6UV81VdvjvtI+fZ95rg6XFpK8kJh3pFGPgJSHqZAo53GeeWi8OfcfHhjrNI2o9taFbcn
         z1kg==
X-Gm-Message-State: AOJu0Ywi35YvxEwL0yC9sYv2fpKuXVnX7sNlYVn5OP3PhoFg9ZSbMkkS
	PGDSc1fsZovYwN7Zqgra1Dj2dXHpX5dm/qqo6Afe2zgrgevwZUTj52DDLNcJIC5Zuumix3dVAZ/
	48+YNM7sz4zYf3TNMzmbQll0xvAON0Ck1UUDB67Ah7kRBg1TPlN062kJf/F6pUePl2Q==
X-Gm-Gg: Acq92OHLXPsEhWkEqvNsrwIZz8ZhgWAetGXhJM04hF7xyRL/wyQygBQe2bVmiRs647J
	N1iolhbB0rm12uiuwhGtYN43T1GVoIENC2xr2WEl+lzEm4/HAVEC7+vv0rlKOh4xuzAXYd0GaKe
	5Rxl3lLDt6xJYL8w+rSwk1fSOmsccWbueM4TcGV6TiYDdTJxskK8E3LzydNg0SsCl9c7EN0FqPq
	c0BKMv4SIr/cZFnBUrdR7+zpoy67JBFu4QfVzOrY4V2Oi6JGMMdHNfUaVzyX1rU6UoyUtVnsSXm
	qVwossUJ0isEdxvckK04oIR2/KpwocJxZ8+8O+oTxPyObi873Gb0KhSkK1kq536UXUP1fNU8OrI
	yLXG+rpm0xVqc8jyRgXK9Dxe87lCEmxKKQHagPZDl9QcDze3H0h65mg==
X-Received: by 2002:a17:90a:d60d:b0:365:7e4d:bcb8 with SMTP id 98e67ed59e1d1-365ab9afa3fmr22776119a91.1.1778481388264;
        Sun, 10 May 2026 23:36:28 -0700 (PDT)
X-Received: by 2002:a17:90a:d60d:b0:365:7e4d:bcb8 with SMTP id 98e67ed59e1d1-365ab9afa3fmr22776097a91.1.1778481387790;
        Sun, 10 May 2026 23:36:27 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be23b331sm3347418a91.1.2026.05.10.23.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 23:36:27 -0700 (PDT)
Message-ID: <77922d17-69c8-2710-d206-3d2f37651310@oss.qualcomm.com>
Date: Mon, 11 May 2026 12:06:21 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 03/16] media: iris: Introduce set_preset_register as a
 vpu_op
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-3-d22cccedc3e2@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-3-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA3MSBTYWx0ZWRfX3N53hBQ7kOoG
 uOX5Dr0oB1b56Rg/WUNIjGwI4pMAkyKEYRVCpKjQljI+j+D5Hn/inarU24D2APyfZvsezpnOB4r
 s3qFzOTUcKp5cEt9Ws4s4193yaGuZIeIaZcRVfad7l0aeq36Aj2TGcApxjfSYLlLrA6ZkCq0jdT
 fy5kbttWuDKNp2ru6/cstZB2BH8QLtm2hI9LQsCpccEYd4lu1xAlKLT31DWEhiEydOpQRePFeup
 rviomhabsZ3OcEFqJyY9IyKsUIzQ7b6/XqesZkBVXhExA5kTACE4j7mahMxRON2qvys/wZVCwyP
 jqgbk/xNgwMtEhZd4rhuy4sZ7+l6DuiSET8SVvIZyNkq3Mtz2Qj4JW1CTMYb7q1rXKGhYVj7tLu
 /r2mDK3wvhTzUgjRb5z+E1EuTkaxtfYX1YHPbPKmwfyO1Hz4uJD07jd59IFJzfVr+szrCefjxll
 MIYTYQl85e40MdkhWCA==
X-Authority-Analysis: v=2.4 cv=QJZYgALL c=1 sm=1 tr=0 ts=6a0178ed cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=h5up4yhgnEjzzxj5UEEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: bR6KIGajvrpbrfX9HXqPPPWV9VJbVnbY
X-Proofpoint-GUID: bR6KIGajvrpbrfX9HXqPPPWV9VJbVnbY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110071
X-Rspamd-Queue-Id: CFE97508979
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-61048-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> index 02e100a4045f..f608a297d4a3 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> @@ -368,4 +368,5 @@ const struct vpu_ops iris_vpu4x_ops = {
>  	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>  	.set_hwmode = iris_vpu4x_set_hwmode,
> +	.set_preset_registers = iris_vpu_set_preset_registers,
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 7bba3b6209c2..ff0070c85ccf 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -472,7 +472,7 @@ int iris_vpu_power_on(struct iris_core *core)
>  
>  	iris_opp_set_rate(core->dev, freq);
>  
> -	iris_vpu_set_preset_registers(core);
> +	core->iris_platform_data->vpu_ops->set_preset_registers(core);
>  
>  	iris_vpu_interrupt_init(core);
>  	core->intr_status = 0;
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index 09799a375c14..21ed4c9bd5e3 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -22,6 +22,7 @@ struct vpu_ops {
>  	void (*program_bootup_registers)(struct iris_core *core);
>  	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
>  	int (*set_hwmode)(struct iris_core *core);
> +	void (*set_preset_registers)(struct iris_core *core);
>  };
>  
>  int iris_vpu_boot_firmware(struct iris_core *core);

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


