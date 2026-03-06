Return-Path: <linux-media+bounces-54747-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UML8GCS0qml9VgEAu9opvQ
	(envelope-from <linux-media+bounces-54747-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 12:01:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEBC21F65C
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 12:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6B0730A3076
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 10:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5976938236A;
	Fri,  6 Mar 2026 10:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpyre+aY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JF43qghh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ED0381AE3
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 10:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772794736; cv=none; b=XKFF40HJ9u/jDX/VpFYILjSP8qfsKqDppRJ05RPP70z4oEqMg5OrVZviwIsJRsBjjFem4fQ4TgxtVvdUt1mD7nWI19KDxjhlH167UA4Ba8eLh92TUJZ5CEK0/iVW0IHwDyV7B18BQ6tJI4eMvcs7E80lL44Hb3VqMeyOnmY1KjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772794736; c=relaxed/simple;
	bh=Y4wrLPuVX7srnbblTwI31RPCAFoDu+8T1SGaO81gAkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkebLwjbXincDGu2yUDhYoKzBR8yqinL6569t17OHKxQ6IMpmiemrcd9ZLcd+zBaXjnV1Y/GRx9roG1upvl1lB2F9AgYy6H03CtxomzvW6tKMAdlwKtzHSaKFuCz+33a4JKE0KqOIqO2cIC7UjQxX067YC+09iLFPbXvpiEvAoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpyre+aY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JF43qghh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62654PQt4193472
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 10:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ENeJQR/osskk9CeVIGiXkuHc7GD0Wvkcf5KpQhI7KjA=; b=mpyre+aYbwpIG+PA
	NWRzHnk1RkoJz/c0e0su7nxe2kOBF0i07dNfpSzPHDcdpVKJFGwA863S1ORebO2m
	+bmWRNUnMidZln4vF0O+OasxBhLSPMx5OSdL8cKIDyNszcLhq3HnmYv9cntPjhZd
	XJh+vRs72wOW7kVK4zQPoYddK6mV/FUEAAAWaqh5C8T/qjd4qBmUk3NNwuivcqNO
	OcL/wPyKM2IWGi3q+Zbtb0WiLQrJa6qP/URU/POwLQcWcqSaQEgtgJCctnAonuRQ
	rIB5+peKfBHJrPukN6YM5yoMpmlUZKtMcDMUkyqQ7259Y4V12KBF9aMcODBvPq1l
	p+SgCQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5s572-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 10:58:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7381a9a932so1453908a12.3
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 02:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772794733; x=1773399533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ENeJQR/osskk9CeVIGiXkuHc7GD0Wvkcf5KpQhI7KjA=;
        b=JF43qghhmJfjuyhHQcDTuuNgmyWsEs88Sxh2PoqbZkeRRPkHvbVJDk8vykhIUVYbQc
         JJFjZI9JyUnmpL+Jd86NGNOjEvYIULNluF3Om5xy0Q/Z1YERZjZgcZN1PvnxAL8e+PIY
         IFBL1rrVJK5L/1852vsNC8NbeYG+R0kKQ7V/i11W5KPkbK5Ra0sJ4BnhUVPTDu8hAG4z
         CWDr9BjJarNKhJ6+i1r2tK59sOP3hDMSlc+ah3gb+x6guJb/gbCP6YvtW1a+SDRgbTuO
         9opjIbumtYaevARLhG3wZoBOQSONbp7M3+lw/PbtGpHYR+TujTfUKZ2t9MpP3+sSE9Mh
         PLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772794733; x=1773399533;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENeJQR/osskk9CeVIGiXkuHc7GD0Wvkcf5KpQhI7KjA=;
        b=p+HrIzvJWZtxMZmJwq9GfbOFN5oc3OjaYtu3a3Xh/+pMgSC5JC0GLpDqtBulLRNMrp
         MVh1kWq53K8RnrTVnwxXj80kiSwtp83Fp9GIyU3zRh0iFIXhgOANMymfoBC/UW3v+o7i
         j+ju4RkghCA3/MEif3anTbbEJL/a6BYr1v9UAcJBzDcvYetRlE3c7J3OwZIeGmi3c9Hl
         ljbOd1DqFdAqWCQJwHlYHJrdaltba+kYbbBQdI5N+2EqLVyjZlAirICm/e/yjCY4GiAD
         98j18p1BpTLQvtDTH6efz8GHhPM+21fI1Qc4EmUip+ng6SgGyUOYkp0Hr8Byn35gTLhY
         WcHQ==
X-Gm-Message-State: AOJu0YxiOHOrPRP3LEE4K2fiH77Wcg6oU21ppxfzKMM0X8tpKbShGblS
	egOKfnis+X15R4tQzJp3PwaZfKsXVX3snvHXRYDzsNfnXXN/XIkVIbLRDMkFsfY+66CuGlPOBNa
	ZYKy4NlRxlP0fWU1hQ3mXgB9bLyFaVGrX8+kKijHziF9GsfaXe39NH5XDbahZcvQvEw==
X-Gm-Gg: ATEYQzz34SBznCVBujozCdgnMFB076D/ZLI6dnrKqhEoM0vAsvia4DrdZOQcqpB+MI+
	JW834wMWdWsCoL5w02gz4WkZz0RBbhNVBgToAluAnml55xJ64cln1Xaui5Q5h6wcgtEfOSIsA2Q
	GGx4nskR6jhe5QRwkaolNnJ4jG88zshSkd7noU36M+EMUhpguMfRRpgB4WRO+n9t6z0gAXg8Oq2
	a1h4qMr/xxKJiJTLpfErtCdNaaPzctE7SQ13GHvF1uBleaZ7vEaPlSpQWchmF6zjnxAVNMX5sCY
	Adhan7Q6nIpLXfNdWKpO59afQzwWTkUgxHFwMQMiCPEBXbU++yHEt3XQiKpY8Qwb/3y9CIhnnv/
	76sQAJrCAMHJZQs36wZL/VZtAjT7m/S5erTAbeV6oH5Fi1zMhJf0I9g==
X-Received: by 2002:a05:6a20:734b:b0:38e:9c27:72e2 with SMTP id adf61e73a8af0-39858fe2873mr1933260637.28.1772794733446;
        Fri, 06 Mar 2026 02:58:53 -0800 (PST)
X-Received: by 2002:a05:6a20:734b:b0:38e:9c27:72e2 with SMTP id adf61e73a8af0-39858fe2873mr1933235637.28.1772794732914;
        Fri, 06 Mar 2026 02:58:52 -0800 (PST)
Received: from [10.0.0.3] ([106.222.231.181])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e195c40sm1307204a12.31.2026.03.06.02.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:58:52 -0800 (PST)
Message-ID: <c9ab511b-c773-fd99-45e2-54fe619d3576@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 16:28:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 10/11] media: qcom: iris: split firmware_data from raw
 platform data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-10-acf036a3c84c@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-10-acf036a3c84c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4vCU76PkBviJ0-3Tf0XuYaGGItGv_YS2
X-Proofpoint-GUID: 4vCU76PkBviJ0-3Tf0XuYaGGItGv_YS2
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69aab36e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IrIcjQS8YOhLhDNCWt0oYA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=deA5lg_RuNhAItBNuyoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEwNCBTYWx0ZWRfX//cl56eQwCDS
 XOR6o/agRBddNxTcoZBcBHs7gTIJSax7WPH3/EvKiKLH46chg3hl1imlFL3CkyAPXoVaKoTDKkZ
 iL9a7EwyM7eF1aWfKUYDmT+1IDk035iJWCoeAPWUE71k9C/0L/a9qqXhcw/+cF0t8o8kbfxWOUF
 w4EZTkVO+2zFGdlmyN3ym71neThglRYgZLAmfjY7S/29wOtbJyN0PArezDZ93aiUym+6FNdru9c
 fejz2MIlqQyjIqPPyVWkHkhj57OFleXPy8AiKoLihYLZQ1NNuuJNbnrz3sMxDI7Ed7hBDZm/VK4
 0WXW0AulKj5F2pT5oDcXADUtyiLntqkFsmUOHIlcivGtwRP4hl9Mo5R1IeKGYlnijjX8639FNEm
 ePgk7dEglZN+seEIU3xXRAflXytM7Q/R8z9Kv48FJNTmu8KzKar52AjkcGBrSAoiI7fwdqEGQLy
 5Njc9mB6iCvKHmmG5PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060104
X-Rspamd-Queue-Id: BCEBC21F65C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-54747-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:

> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index a936ab2aedaf..be3449861993 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -201,9 +201,32 @@ enum platform_pm_domain_type {
>  	IRIS_APV_HW_POWER_DOMAIN,
>  };
>  
> -struct iris_platform_data {
> +struct iris_firmware_data {
>  	void (*init_hfi_ops)(struct iris_core *core);
> +
>  	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);

Makes sense to split firmware-related data out of iris_platform_data into a
dedicated iris_firmware_data, one comment though, get_vpu_buffer_size
should be in iris_platform_data since it describes the VPU’s buffer
requirements independent of whether the SoC runs gen1/gen2 HFI firmware.

Thanks,
Dikshita

> +
> +	const struct platform_inst_fw_cap *inst_fw_caps_dec;
> +	u32 inst_fw_caps_dec_size;
> +	const struct platform_inst_fw_cap *inst_fw_caps_enc;
> +	u32 inst_fw_caps_enc_size;
> +
> +	const u32 *dec_ip_int_buf_tbl;
> +	unsigned int dec_ip_int_buf_tbl_size;
> +	const u32 *dec_op_int_buf_tbl;
> +	unsigned int dec_op_int_buf_tbl_size;
> +	const u32 *enc_ip_int_buf_tbl;
> +	unsigned int enc_ip_int_buf_tbl_size;
> +	const u32 *enc_op_int_buf_tbl;
> +	unsigned int enc_op_int_buf_tbl_size;
> +};
> +
> +struct iris_platform_data {
> +	/*
> +	 * XXX: remove firmware_data pointer once we have platforms supporting
> +	 * both firmware kinds.
> +	 */
> +	const struct iris_firmware_data *firmware_data;
>  	const struct vpu_ops *vpu_ops;
>  	void (*set_preset_registers)(struct iris_core *core);
>  	const struct icc_info *icc_tbl;
> @@ -226,10 +249,6 @@ struct iris_platform_data {
>  	struct iris_fmt *inst_iris_fmts;
>  	u32 inst_iris_fmts_size;
>  	struct platform_inst_caps *inst_caps;
> -	const struct platform_inst_fw_cap *inst_fw_caps_dec;
> -	u32 inst_fw_caps_dec_size;
> -	const struct platform_inst_fw_cap *inst_fw_caps_enc;
> -	u32 inst_fw_caps_enc_size;
>  	const struct tz_cp_config *tz_cp_config_data;
>  	u32 tz_cp_config_data_size;
>  	u32 core_arch;
> @@ -241,14 +260,6 @@ struct iris_platform_data {
>  	u32 max_core_mbpf;
>  	/* max number of macroblocks per second supported */
>  	u32 max_core_mbps;
> -	const u32 *dec_ip_int_buf_tbl;
> -	unsigned int dec_ip_int_buf_tbl_size;
> -	const u32 *dec_op_int_buf_tbl;
> -	unsigned int dec_op_int_buf_tbl_size;
> -	const u32 *enc_ip_int_buf_tbl;
> -	unsigned int enc_ip_int_buf_tbl_size;
> -	const u32 *enc_op_int_buf_tbl;
> -	unsigned int enc_op_int_buf_tbl_size;
>  };
>  
>  #endif

