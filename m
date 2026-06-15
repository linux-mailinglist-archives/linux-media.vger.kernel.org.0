Return-Path: <linux-media+bounces-64881-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gftgGXCpL2oOEQUAu9opvQ
	(envelope-from <linux-media+bounces-64881-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:27:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D479E684337
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:27:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eElLavAq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="c9/ptSjL";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64881-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64881-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF4A33017530
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 07:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019A73BCD32;
	Mon, 15 Jun 2026 07:27:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5323BCD3A
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:27:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508435; cv=none; b=Gbnjcb6o2t1jv98UYkWQxvWE8mnfa3w/QGIvYD4eQUHMM6x/Ch9Xj4ueSfgWOYbDlEll4YLcPOES8y6Q9JOjsmCxNtCgkHZ+oHpiizufYZfqokZL3jPt896TgFrt/cWjgFixMYyKo5RELLJ4coJYxN+EqabHX7x4cOnVj+cl5zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508435; c=relaxed/simple;
	bh=pu5aKp2dBY9Z7bUFYMTRFGkF7Auzc9XTr1kXTHyu/yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tGRilqFIR8I2yH9yZaoVrUhg3DapGgknSlHFfNl7YZ29R2Nj9xcbcLJDoq12KJc7KVfRqs1X9AqLTpO+v2eVePtUKqRsnnaZsC0Ah/nSiCNFZ3GpCTzXsrp7duq7OS0oNMGxNZzSls4CNgFlSLkYge8oNdQDxlnGc6P/BKlW40Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eElLavAq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c9/ptSjL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6KbMQ3910861
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lV3PsszzF0e8PSHEQWQ0iIE6jGmvm4gXnL8CM8FMIps=; b=eElLavAqty18WPNi
	akQ78LNkjS1KxXRN/LcVTT5t5wPm/l36I16VVcthNtebm+bPUaEK9t15p8plA2bD
	R+HvKJNLEAE1pNlOCGEjdMT98sV8Q1COUBZHwz6rz65MwV1NInGBJIlfs8aF5gbr
	zfd/b/hWYOjSSTNJDoGJHZ/pHHnfwCZ/KeHT6l81oMWbC4jhmW7E/+gzRRLer3UE
	592gLtW6W2UgRqgBcnie2KBts4aiVgZX7NE+BtbLh/f3AvfsEkYyu5OHwnl6HQXH
	m13TusyKegmMK+/Hj1xXXPguNjjSIUvLEp2jgScNmkSJp74M3Zb8NWGmG3TskK8M
	kJPhTg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6x7r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:27:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8611b27631so2242388a12.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 00:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781508432; x=1782113232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lV3PsszzF0e8PSHEQWQ0iIE6jGmvm4gXnL8CM8FMIps=;
        b=c9/ptSjLtrxW5vWNwPIY1Tyxtz6xepfCnrib2SLzZsh79qxh7wga3I/LVKlH6tb162
         GVem8OgCDQBhqLJbNWWZPPPaxuvrb8tgOuTqiI3PwHIhLfWAvOo73G9AzqglcbjUx/fQ
         2O/6zXkd2zyD7kdN8aBnV/MDtJklJTxjbV0fF+j0MUkVrN2mJ9LhmFbiXgSU3LntMpyF
         EEKhSZ9QcBi/wLmaOvOv4vgMXhj2Xjqi3apwbygNRA4MhNrqc07sisAKMg63YHojIPeX
         oZAZzM8zJ8qjl/KYOyL8DX+CzUWfTDIy5gcb5dBB9qO8LK3hONA/vCYvusMZRCsvoYST
         VBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508432; x=1782113232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lV3PsszzF0e8PSHEQWQ0iIE6jGmvm4gXnL8CM8FMIps=;
        b=mWRa3W2q+XtS9YkBhdxVCJqNfacUFHeI59+yI+l5SNTZRC8DMKKb/dEOnV+iq/zztu
         uGIAbvEq4U1MVEZMSNmBIYwVcyrcM5VsKYGERHNEJYgT35YLEOVilAWHVviTk+t5Lw3y
         14jkq4yYWwITaNR3twJ02wszKvu8ya0Jug/0/vZbkrI2jn75zJ3sOlTkCjppJzymUwUd
         uztLAGvnr8zmcEEHJqUOD+TW+Dnv75og19FPSJpLMs/Nre1ARpRpb0/Qp/2L/B1XAtJD
         LpDNCxv1Eeu2MvDhwAEIvZ4UQetN8CeKsGyIcDT8GZG4O5KPV1U5hLMjHLeNPDWQXIHm
         tZEA==
X-Forwarded-Encrypted: i=1; AFNElJ/1KlyYl7LgU3uMoal3RisuKexK54SMH+DbGjYaRp4Qka0p6C6bd8gFCyoYgNx+v8iDywfoUgCH9Iku1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Oilrq1tK5/N+jh9xRuUtkrEOXJATRSgnPR+bVuiB0dLkb46K
	S4GsyNcPUN0GUoL1HcPLkV1vNySUkCHl43zG+toPjpb4m7md3MdYKrKCtqx+K6btLdvCw3q80/G
	IsnwgDXYpkpw0n+uyFFAcQwS8HE9Ftx+siSwEc+4Jj3HXf338BTjHWQu9WHy+AP2ZyA==
X-Gm-Gg: Acq92OFfQJgW6J4ySCukKOP9rRIU7E0oxRtOInrO1EsX2U0dWQOcDlm+0rH8Vkg31Co
	5S/ncAEJ63lkWnbQru8pJmykTRi0x7TEp315J4X1EtyRzOimkk0hC4Df3fSj8bUF9GAhPYQlQBR
	Voc15mwmymc/4WLUKlruRSJm039lcoPoCHQCNRsWqVETE1qh8CMMy26aZzsCEgzUX3iEwFHdQq3
	enpbB3PXplARmz4TcsBxqQKwMWj4XjkMruaU9IICDbX0sxz59VvraYfr5caGXpAwNXVlSBjTj6v
	BhER2f4XeA7Q3sh6m9mPrCKmIoeu+UfO3CxAsNneJpTGJg93SQNyqDILD4P7uJnljrh0HL1hGvB
	cUWcqePJOLy7IaYpVnsVmMlQ5gWNaDOn8z2/KsExYDkpyXGAvGg==
X-Received: by 2002:a05:6a20:e290:b0:3b3:bf9c:7c3b with SMTP id adf61e73a8af0-3b780ec2f0dmr12418319637.8.1781508432275;
        Mon, 15 Jun 2026 00:27:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:e290:b0:3b3:bf9c:7c3b with SMTP id adf61e73a8af0-3b780ec2f0dmr12418274637.8.1781508431779;
        Mon, 15 Jun 2026 00:27:11 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.27])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651af0edsm7787406a12.32.2026.06.15.00.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 00:27:11 -0700 (PDT)
Message-ID: <b11a9de2-6bc6-4345-8d81-5befb2182a7d@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:57:02 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add CAMSS and IMX577 sensor support for Shikra EVK
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3NSBTYWx0ZWRfX6VXWSPQqv95B
 SKEVYtNkFXHbIYO2Vi/4h3ElUAG86MXh8Sew/pmJXITon1uLkC4MLoAgA1f40fU+Iq8xyeL8ilW
 V1JO1t/J4+KKzrPucHDF8v9bAN7Zx48=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2fa951 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6rJd4luAlhGbPPINhpk/8Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EF_2yGccovn9CQtFCckA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: uwS3WD0uRWnJEuuiw7oz1aoDmtASApZ3
X-Proofpoint-ORIG-GUID: uwS3WD0uRWnJEuuiw7oz1aoDmtASApZ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3NSBTYWx0ZWRfX0sgs465cuPol
 YWmKcD2nU5VVItiSmdhUPHQB4nyiVpjt4myZFb5sV2NGtPv5bDpy7VG06g1LRqAA/QVoQmdKsIh
 wNBJ8jQBQS/apjvnHx4UWBOVJSe8D7l0s6CdfnaFqfUhU8E4ddRNerdwbiURQCtcTuRLoEmXq6g
 SMH54LbnV5WbC8UPjNcKycBIFBf0B74DVBkms8qiQY78VFsouvsEtNdSg4b6v5dLNN/MTj3QvMv
 TjFrxI3mObs4QO4INouN9MbAzLnjv2tCamOoN2v6wM3pxi/DpnBqHelzPjuL+S4GZV5L8A/ADeJ
 Mnajgvk9vg3sDi79PuwUI4wRRq4xnZcxd4R9tToTBvQpploCxCupqx5NMTYQ5DMsw1Zoq4Gu6Pd
 b48IVAvgyEDnIgWLHgaksADdhFlfAlNscRx/CKxu5iqbo7otmXOFDd3MhindzD0XFGocYu8aqVB
 V9DBfkRpQfyocVzPKDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64881-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D479E684337



On 15-06-2026 12:42, Nihal Kumar Gupta wrote:
> - Add blank line between iommus and power-domains in CAMSS node (Vladimir)
> - Fix data-lanes numbering to start from 1 in all endpoints (Vladimir)
> - Move cam1_reset_default pinctrl state from board .dts files into the
>   mezzanine .dtso overlay files (Vladimir)
> - Collect Reviewed-by tags
> - Link to v2: https://lore.kernel.org/r/20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com

Hi Vladimir,

Apologies, I had tested the changes with data-lanes = <1 2 3 4> 
but mistakenly removed them before sending. Will fix and send v4.

I've incorporated other comments.
--
Regards,
Nihal Kumar Gupta

