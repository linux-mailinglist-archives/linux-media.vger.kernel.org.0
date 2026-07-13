Return-Path: <linux-media+bounces-67455-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WArKMCGwVGr+pQMAu9opvQ
	(envelope-from <linux-media+bounces-67455-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:30:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5488E7494E0
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:30:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N7xNIOg6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PBZFAghf;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67455-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67455-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 874FA3015C3B
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2423E3C7B;
	Mon, 13 Jul 2026 09:29:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFAD3E1D11
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:29:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934968; cv=none; b=cLqMmpIm3/AJC9b8Jtw2WNsoMtC4ra4atAP59BJnvQg+Lmd1dJ6wJPcqPmc8sersQQ/OVTfUEl9s27pmKTETQ6ArJd5bV6mNN7VVxswboZ24GIiY2jJkOS2XyvLVnO39wPU9lwDi5z2y5ek986Ac9MAFvML+GN8d++o5T2WqhUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934968; c=relaxed/simple;
	bh=H9Q9S4nCxWb1Zm1udfcX8xIsLkHTU6m5iJ+3MH4b0h4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oL+VMXb66d7DXLvaQiW/pOuq9DFKyxS929t4gM8ZeWKJ4v07u4T0bDkKzqLUwaMB1Hb+0/QQMJ1GFv1EUCPRkBb6hVMPqvJdoOFHzrNIOjSih6ib6Oumo2dbhheqE9iIVphD/n4N9meZwB6Sv+Ulhn9lMzkrNEthC95Sepnq6Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7xNIOg6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBZFAghf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nk2m668651
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sSZ7t5V/1PHtqZoF8nlySg/mPA+7I7GC9LLE6/wWuss=; b=N7xNIOg6XHYnBa7P
	BcyAYoQtCvjgZjqfB+qSMcovEVT/UdJGw4KaT9NaTSfVSwnDCZOVCsQX6b0G9KHX
	1qT7ftMycWobPUf9mJV7ZpMSI+2yCXv6Niym9CubAodkzJ2Y6j+tHPWKLpFLTidl
	a4LwRU5DbOXvX35CTl2Yd/bwydC1LF42r7jTrZG59Aw5pNc04SrfnIxbassmjgGT
	PGTc4Zi8spdGm6vJxmeYRTtnW7C1w/ffneCP/JCBC6iZc3nopTcKGOyCj03egX7J
	zRfbERtdt1TbMIzN6IwI0qfpueNdQo+akuJiTPuuz70eTs/j2aSH07ocTdrTAtXn
	OK8rxA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm1veh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:29:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so4616284a12.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 02:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934966; x=1784539766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSZ7t5V/1PHtqZoF8nlySg/mPA+7I7GC9LLE6/wWuss=;
        b=PBZFAghf9hg/YzVFWImH3AgAGhMQjYkr/3XvP1GEneHUoUEB+HAN2q7/m41V+Bt89k
         DN4RrI9awVjv0SL5obGlDdU2E10MNwCAacPhqwLy2z6qNaii3EaTibHFncuDHH5nsunB
         QOd83puU8n1WNWlunJC2W+WI1+2iZdTv20KyoVvWSohb3/8qA4k52mBE2wwK3pD5vgPs
         SjVlWIckycvLd2Gxl8SondOa9EjGdI2SB3fWsjpgAGSyDAAWZHrndUaTJlbg9r5gNukz
         lgg4AAzZ8uMow3rttk1TpkwUTuyABUTTJJoReVKO6zfBRRIxKRQtoHtSSR50mI2VST4y
         /Qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934966; x=1784539766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSZ7t5V/1PHtqZoF8nlySg/mPA+7I7GC9LLE6/wWuss=;
        b=I7+YoyHQKpaVgU0fCaZ6Y5UyVtU5UMRylbprTMnDCOGZ/8eaBUAmSw5YvBpBWR8Bv/
         C3HXDnkwA6a719drMPWJia/kmXphy47pyIU7NLhN3kF4YNM8OQOjgNAYrdz+fInDVEkE
         aoXGSrA1rKCYEcg1+IGSPrAj6oVW3bENHwpWYhm+jzbfPbQvbxNfPq5RbvKBIwUIIcDZ
         ezTycFF6j/LrLEq+uspVB0rCjfCzBcN3wd4N9JeBnnaq9034NqgsCJyu5ulYRHTvCvku
         whfHA8iVssyBYBLNP/DH2CdMZKcmhSPF8OVrbFbN7re+EopKGcfa3oc7g/rmbLSB+fcg
         xSJA==
X-Forwarded-Encrypted: i=1; AHgh+RqUB5NFdlUz9oD+KmuBxMENKUP9UssKndb2U49Jlmpq1eDleLzzTv6+gnZEACD/NKHZ1wllu2tha1bLzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXbknwHUtYId2T3fO1/+Bblsp/f+4smh44aai507why5MrSsA2
	Z6KVyknGbRXQ/fp/KddXZalI9uTEKLioj/ZBa1W+bJqr/viHlMNjg334aA2XsQ80G/YBAvOaPcK
	Pl6WN5Fk2wcX6xYMiLLVcK2HFO00e+PKb+KCbv1feK0lrZdYU9I8sXGnd2nb1+865ig==
X-Gm-Gg: AfdE7cmbb8ZC/G0Dbe4m34U4Rx+jl6h86OzBaGlCaXaJTtCD5xfc5GPIIJChE5/tt0q
	yGUSl6Ocog5zcgZssBmj+okSoEQ0+nmN5SYPG+hKS6Zn8MUypWOGI6Ge0cxtufxO7Z9eFJqPCGD
	WjsqjexWcBszaMF6FdTWwEMRUl/cxiSok9aX5bNHprVLPgbsTWrzESDOemcsgbFBBLm2SucMpmo
	ej2BJG5Q0dOqeYGrtGSS8yWNAV77zDh7sqxInrcaByvCB/sItxjwWA6voDLUn3yhASI8bhH2iNT
	mC05taF1pCxhKKZKo3RhNVKMQfGQPdLQdIEbNHE4oofWTgcIiId/BWDL5y/jRiHXn5jC/3DRB4r
	zGn82pOO5ug3FsewEwkE34J2XhXJM9kfI+IVKkaDp/g==
X-Received: by 2002:a05:6a21:7105:b0:3c0:9c19:658f with SMTP id adf61e73a8af0-3c110d3a4e1mr8672771637.73.1783934965659;
        Mon, 13 Jul 2026 02:29:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:7105:b0:3c0:9c19:658f with SMTP id adf61e73a8af0-3c110d3a4e1mr8672742637.73.1783934965170;
        Mon, 13 Jul 2026 02:29:25 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:29:24 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:36 +0530
Subject: [PATCH v5 5/6] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-5-db53be15dc4f@oss.qualcomm.com>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=3728;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=H9Q9S4nCxWb1Zm1udfcX8xIsLkHTU6m5iJ+3MH4b0h4=;
 b=n6NGtWx1z0UwRlU/KynoW2KeIaBqayHnbWyDUSFlDl3NEIs+7ENUg3o7YcZdvwQK69ZseZugq
 fixPTl0fEILA2m/UmVn6vIMXeEaPHUt1o7ygjNeBlrSfIR4ifbwG2ec
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: EnZs9z_xnt0LCeVo7s73G1nFU-ueatwm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX6JIpG82auowK
 whGkmpVzcuJKGyFRzS83Kfsp7UvGao3DHTwiGghPq9GXZEhtubOTzAwYRV5b3f5zRlrVble5a7a
 /QuXNIBqmoj4ZTpy/rCVjKACe919EzeAYqbHZAZmpiUE+YkW335Y5fuijqSir11mZKCCWQReF9n
 QHslX7gJVEmZtskYO6kBQatOKbulh4Oy99pEUIRmW8IhDsx48G8TzrJZMFpMPD9viM/2qFiuQXM
 wBD9u2sR8sHLvNQ9KZhgVH+s8wthvbMtwsCBqsstt6hNV+tV7OdYX1bG8gNGxpE7S58HNzdwYte
 DlGjJlGL8ZJ0DUiVQHnkqW52TlXNEdWnpcS6n0ScuWgIvucsEKrscZyoUe0hjpQ5vLjIL+6bQW6
 ZT4QzRLQy0UCanW1/9vptPjy1bNaZQkeenuTc5QBwItfO6oTEDsRELtf/B/4TARF+kTKKJdTWNh
 VIEsFbhadXtFLkkCwlw==
X-Proofpoint-GUID: EnZs9z_xnt0LCeVo7s73G1nFU-ueatwm
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54aff6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfXw+2T19QOcUM3
 fZjjTN5olpoRcTkmNvm2tPjruCw5VbLOTHS9UT40tNNwV5WqjCT2+me38KIxzjiv+L+hQG8YwgB
 t5jMv4T2yW2U8Phn8B1UDi+Jou/5AXI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67455-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 5488E7494E0

Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
and identical camera supply rails. The only difference between them
is the integrated modem on CQM, which does not affect camera hardware.

Add a shared overlay for optional IMX577 integration via CSIPHY1,
used by both CQM and CQS EVK boards.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso | 79 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 33e9199511aa1c229de79f8f1e8bb598a31e49c1..16e1701b6b338c2fedcd4aac4e331336c59780a6 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -337,6 +337,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
+
+shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..3a481d972cd27a2a324d96d8f47c161e11ea54f3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&pm4125_l5>;
+	vdd-csiphy-1p8-supply = <&pm4125_l13>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		/*
+		 * avdd and dvdd are supplied by on-board regulators on the
+		 * IMX577 module from the connector's 3.3 V rail; they are
+		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
+		 * level-shifter that translates CCI I2C and reset lines
+		 * between the SoC and the connector.
+		 */
+		dovdd-supply = <&pm4125_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1


