Return-Path: <linux-media+bounces-51774-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBbOJGQwe2n2CAIAu9opvQ
	(envelope-from <linux-media+bounces-51774-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 11:03:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0FCAE5CA
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 11:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CD22F3014A15
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 10:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A3C3803FD;
	Thu, 29 Jan 2026 10:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LV93eoNq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsWtd/9N"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014D83803DB
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 10:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680971; cv=none; b=QlFzCEwCQQ3+ecCLx03dR77C+iGLCXpjL5YPb6xxXdePRI9pKT93NLv+eb5g6BDFcgce5hBgpVomllL/Exe2Rqlt+3P+N3wsvpIK1DZB1WNe/gemc5HGTPQyFqA/RnvhHLsI+LTNu45VgcJU2aE0wR8KQ4UfeEu5JAJh1gUYmVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680971; c=relaxed/simple;
	bh=9A0iJD8u2IjHztqqRIDfM4noeZJV9Cijz4NKPsm2/X4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nltBfUWOloGWFZYDLNLtFS805HZfxQeXjD32K5hKd64ccfkjwCncIS0OZZKmteISiI/LDVO6qFmn1qkr30mroT3Y0AA/Ue7gAOfL9yCiVGB7kV3Dv7vPNRXb9jvYeIsN6e1fHocpAe5BeO+6Q1Ks1ofhRFtDszcj+2EoijoEVRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LV93eoNq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsWtd/9N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2pQd01523185
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 10:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kn3pXRnkAnLW6ZMn5kt8gyyDoOQ7s6Mqn8VFw7geJI0=; b=LV93eoNqqM0x9+Af
	epZK/6JIXyPjQ/xI65sv0bbBnk/fg/fAS8LzXrtTjmEpg0Ki0Ej9XsIy6DD+vkxF
	43K7pzNE8IL0dNRRD/JABgJ//kzj5J4xayU/Zz9YOqFljW8y/veweMA2U/0t5XJw
	+ulCbcLYKr3EuD8j4rf58DVoiQopJrwIGYKgrfPh7WwkIpPJLU7Y0zMHwgCtN4r7
	9GFkuJWuSrmDuW1gEDqgy+PHBfIeuHPb6jMJCjXx3C2UT8e4xtkEEYbKlNAs19aA
	qBEzvWvtbGkYG4Oj72orxyXpFkC7aBpOei4r2M4NzJYDvT5dDUiSSaqq+hlSVy5S
	lSL4hw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byjxhutpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 10:02:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-352e195f662so674795a91.2
        for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 02:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769680958; x=1770285758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kn3pXRnkAnLW6ZMn5kt8gyyDoOQ7s6Mqn8VFw7geJI0=;
        b=QsWtd/9Nh7fH4yePwfM+aeIIrxA38N4TPtRlN6IYu3DDoaw+p2CYwFUZ1Mkzd4f7PI
         0KhfSef9v7c1O++ns6Bwy9AQUf7S6pWAjUW1Hs/z3WGfLxNWyJxNQWaLVSah08KM1vHk
         4Mn2g2fAAxz+dYKOH5ouTcgN4eB/uEzIdA+Vm5MeG7cbiBc41mXbdn0nk3csPprW5dm0
         v/ka/Je75bqv4WEg3+MOfNAk28c7AvER5IscRb9RedKhc56IqDPN9U5x7y0mkR1YRm8B
         ZEoze2HdtnCx/Zgq2bC53/hxp1HGzHMczPFlg7NOptL8BbHKP9501g0MkX7V9cYLCHzy
         EK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769680958; x=1770285758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kn3pXRnkAnLW6ZMn5kt8gyyDoOQ7s6Mqn8VFw7geJI0=;
        b=pBhtBBATGy/s+QMrM7N+1Dpe9WqJTAfL5cpOlj/+vMJ1tD9fR6zak9l5NMFZHn/SgT
         SHKkwiy0W+NtlCPk0H6gmMwXIl28XDTVmlLjZJofVErzRq+qb5S3pzA3StdTvDVpsemP
         411hB+lyUUP4zj4G11P6mHJ9pX+RRdmUnLRq1rPwZfEbcvsoFCgOjQHHSURY0vgZK5CO
         oWcQbrILEFx813bp7gxkBztkayhdzhI3iiZGJplPTDNKf/lPSFBb0KDdLAwmOPbqL0lY
         sV+FmRe2uAExe3jmyfGskK3muO94nXVOP9f7sqKDpzpudA9JdJqyDgwvQqMdv7GYml5z
         jmXA==
X-Forwarded-Encrypted: i=1; AJvYcCWDI4NikMy2XkRKkvltbo9lP9R8v7cltzcxOkvWBHdEvUtzHGylPIDj4R14l0lKZ7k42WFVlWJquC572g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3vg1wFdMSq09d8daAQGH6VEyzt857Ybm2hx8OnKBgXcXKKzFE
	ljS2w+xh7oSWBktN2V37CSGXS3MBD1NN67/NabGzEF4vpk2z1MzKC/bJHnwXxND68PPzc8+StS9
	rctgq+WK6rEXJPXFbi1TuI89WshJomI48lqNcnrbH/itmNSTErk8QWuUAsuCQ8s3Seg==
X-Gm-Gg: AZuq6aLT80+m17h4DWfhL3+EWKNDRgzydUDqz8LUxR+sd63DFSECgi0OPmfOL6L9sa8
	btuD0EcXrjKG0alqu0OkksCSwwTRV4MaRJZPZjc2KBVvrT1d7XwDzNYh5yVT9gF3JINouPmCct5
	2nMgLgbyNQt0E2EPGqzoUA6OqdtfrZkFsH+6NUIXeG6Yahjmc2SQt/cueCDDEcdDIRQdun/bcED
	aUURa1Hlk4Ivbs7eqelEXJfxqELDumlABTOoixYkE2rDSkcJoilbmCM0YkHb8hTMkKh4NMXuN/+
	st80ojyF2MggpMrZYIz12B4ASUFexEYsI4JmyRx3Qh4PgY9cXEGQ/+urmhposJhEcR6WAqefjUU
	WeVUcyXI7ERx/7rRn0PsPMHhZGLm4lJrfrddbNZTaxKo+
X-Received: by 2002:a17:90b:2e51:b0:352:b666:6ea with SMTP id 98e67ed59e1d1-353fedbb6d7mr7340782a91.36.1769680957549;
        Thu, 29 Jan 2026 02:02:37 -0800 (PST)
X-Received: by 2002:a17:90b:2e51:b0:352:b666:6ea with SMTP id 98e67ed59e1d1-353fedbb6d7mr7340739a91.36.1769680957022;
        Thu, 29 Jan 2026 02:02:37 -0800 (PST)
Received: from [192.168.0.171] ([49.205.248.133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3542dd446b3sm13540a91.1.2026.01.29.02.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 02:02:36 -0800 (PST)
Message-ID: <5df59084-d19b-414e-a43d-8c5d26cb07e9@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 15:32:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] media: qcom: flip the switch between Venus and
 Iris drivers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
 <22583dde-caaa-4d64-bcb6-ac7f09916a8d@oss.qualcomm.com>
 <xyhl36bcpmjhav73ujlvbtwqixngr5vko75t335mlcebxrs7lc@t43mxhknuqtj>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <xyhl36bcpmjhav73ujlvbtwqixngr5vko75t335mlcebxrs7lc@t43mxhknuqtj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _IOZSBGcTdyW2aeEEurS1hqI3xvZkgHM
X-Proofpoint-GUID: _IOZSBGcTdyW2aeEEurS1hqI3xvZkgHM
X-Authority-Analysis: v=2.4 cv=b9G/I9Gx c=1 sm=1 tr=0 ts=697b303e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=OrrKugsxgu2A7SzPsjoKyw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NucSyHlijZH1nHOpjqgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA2NCBTYWx0ZWRfX15fZkRarHY/W
 44bSusi+LYSVPp6jc5q9F+1hZiAsV4OkyZNCeR9J/YtL8uDQkPUBM8SRKwA1y3OhYn6Q8XIAhYE
 YHV0x3LYIQhCoDMwGxM+p/OKDmARuWtOTZuz97bNfMBFp8PlucDXp672sdR/pkCVP2k/8kYjuRD
 RAyHO4jtyhgKMyLPIegHnsoWiw4i6g7UyRJb1Y180ImtO+1AHXEYJQrJLcB4DTLAyRCoxf31GNS
 yTNqIIwiOGxdbkCHRJnBYKvIwj2iNn/n7aWGfIBPyBDwwts+g+CBL15ooMiuNQ+rAhyZ+IP/ulS
 YgN2gSKrneOBF5aS8hanGwF55ghkwE5TltNy13r1xz41DtBAbYdy3snpuGSaII1It/xtko6aNR7
 YtAoFUflHqlNOfKvXDmXDB31rQjKMxSJun1oWOrlXgebOcHbFi9KsxM49zPoNQCPqtyVWInjqth
 FEkfw9GjR7PepNh1GOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-51774-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E0FCAE5CA
X-Rspamd-Action: no action


On 1/29/2026 5:51 AM, Dmitry Baryshkov wrote:
> On Wed, Jan 28, 2026 at 06:35:01PM +0530, Vikash Garodia wrote:
>>
>> On 1/27/2026 5:52 PM, Dmitry Baryshkov wrote:
>>> As the Venus and Iris drivers are close to the "feature parity" for the
>>> common platforms (SC7280, SM8250), in order to get more attention to
>>> squashing bugs from the Iris driver, flip the switch and default to the
>>> Iris driver if both are enabled. The Iris driver has several
>>> regressions, but hopefully they can be fixed through the development
>>> cycle by the respective team. Also it is better to fail the test than
>>> crash the device (which Venus driver does a lot).
>>>
>>> Note: then intention is to land this in 6.21, which might let us to
>>> drop those platforms from the Venus driver in 6.22+.
>>>
>>> Testing methodology: fluster test-suite, single-threaded mode, SM8250
>>> device (RB5).
>>
>> Could you run fluster on SC7280 as well ? Also please share the v4l2
>> compliance results.
> 
> Okay, the SC7280 is a bit more interesting. For H.264 and VP9 the
> results are the same. For H.265 Iris errors out for all tests except for
> the one, WPP_E_ericsson_MAIN_2.
> 
> The kernel prints the following message:
> 
> [   82.573112] qcom-iris aa00000.video-codec: session error for command: d0000000, event id:1009, session id:52ef2000
> 

0x1009 corresponds to HFI_ERR_SESSION_INSUFFICIENT_RESOURCES

Below patch would enable firmware logs and make it print in kernel logs, 
you can apply and share to know more about insufficient resource error.

--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -87,6 +87,10 @@ int iris_hfi_core_init(struct iris_core *core)
  	if (ret)
  		return ret;

+	ret = hfi_ops->sys_set_debug(core);
+	if (ret)
+		return ret;
+
  	return hfi_ops->sys_interframe_powercollapse(core);
  }

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c 
b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 6e5bd8e2356ee..2c62c8ac654af 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -79,6 +79,25 @@ static int 
iris_hfi_gen1_sys_interframe_powercollapse(struct iris_core *core)
  	return ret;
  }

+static int iris_hfi_1_sys_set_debug(struct iris_core *core)
+{
+	struct hfi_sys_set_property_pkt *pkt;
+	u8 packet[IFACEQ_VAR_SMALL_PKT_SIZE];
+	struct hfi_debug_config *hfi;
+
+	pkt = (struct hfi_sys_set_property_pkt *)packet;
+
+	pkt->hdr.size = struct_size(pkt, data, 1) + sizeof(*hfi);
+	pkt->hdr.pkt_type = HFI_CMD_SYS_SET_PROPERTY;
+	pkt->num_properties = 1;
+	pkt->data[0] = HFI_PROPERTY_SYS_DEBUG_CONFIG;
+	hfi = (struct hfi_debug_config *)&pkt->data[1];
+	hfi->config = 0x1000003f;
+	hfi->mode = HFI_DEBUG_MODE_QUEUE;
+
+	return iris_hfi_queue_cmd_write_locked(core, pkt, pkt->hdr.size);
+}
+
  static int iris_hfi_gen1_sys_pc_prep(struct iris_core *core)
  {
  	struct hfi_sys_pc_prep_pkt pkt;
@@ -1065,6 +1084,7 @@ static const struct iris_hfi_command_ops 
iris_hfi_gen1_command_ops = {
  	.sys_init = iris_hfi_gen1_sys_init,
  	.sys_image_version = iris_hfi_gen1_sys_image_version,
  	.sys_interframe_powercollapse = 
iris_hfi_gen1_sys_interframe_powercollapse,
+	.sys_set_debug = iris_hfi_1_sys_set_debug,
  	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
  	.session_open = iris_hfi_gen1_session_open,
  	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h 
b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 42226ccee3d9b..86571423ed94f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -80,6 +80,7 @@
  #define HFI_BUFFER_INTERNAL_SCRATCH_1			0x7
  #define HFI_BUFFER_INTERNAL_SCRATCH_2			0x8

+#define HFI_PROPERTY_SYS_DEBUG_CONFIG				0x1
  #define HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL		0x5
  #define HFI_PROPERTY_SYS_IMAGE_VERSION			0x6

@@ -142,6 +143,8 @@
  #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
  #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
  #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
+#define HFI_DEBUG_MODE_QUEUE	0x01
+#define IFACEQ_VAR_SMALL_PKT_SIZE	100

  struct hfi_pkt_hdr {
  	u32 size;
@@ -303,6 +306,11 @@ struct hfi_msg_session_flush_done_pkt {
  	u32 flush_type;
  };

+struct hfi_debug_config {
+	u32 config;
+	u32 mode;
+};
+
  struct hfi_enable {
  	u32 enable;
  };
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c 
b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 8e864c239e293..102f7689b5e57 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -683,7 +683,7 @@ static void iris_hfi_gen1_flush_debug_queue(struct 
iris_core *core, u8 *packet)
  			struct hfi_msg_sys_debug_pkt *pkt =
  				(struct hfi_msg_sys_debug_pkt *)packet;

-			dev_dbg(core->dev, "%s", pkt->msg_data);
+			dev_err(core->dev, "%s", pkt->msg_data);
  		}
  	}
  }

> 
> Compliance tests:
> 
> v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
>          Driver name      : iris_driver
>          Card type        : Iris Encoder
>          Bus info         : platform:aa00000.video-codec
>          Driver version   : 6.19.0
>          Capabilities     : 0x84204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x04204000
>                  Video Memory-to-Memory Multiplanar
>                  Streaming
>                  Extended Pix Format
>          Detected Stateful Encoder
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video1 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 18 Private Controls: 0
> 
> Format ioctls:
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>          test VIDIOC_(TRY_)ENCODER_CMD: OK
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
> 

thanks.

Regards,
Vikash


