Return-Path: <linux-media+bounces-67453-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nMhxGAOwVGrvpQMAu9opvQ
	(envelope-from <linux-media+bounces-67453-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:29:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE087494BE
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:29:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="eWL33Yg/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FfJ0FZCJ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67453-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67453-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE4DD3007A5C
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5BF3E2AA1;
	Mon, 13 Jul 2026 09:29:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84A43E0C47
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:29:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934956; cv=none; b=t4pXEaD3TiZtcMIhzPvcwaJ9l2XJOMbkMI/r3zkpVIbmbxoodOUV0fHnnRAJGBqTjc8t8fLPVCp4k7XMz46agBASH8c+R1S1PgAnsr5nfLTs1IMc63n1NHvCXczemuAJACQ5L8vEtRl4xBlk+cZUmasOTk8ovB9TAGLO0QDR8Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934956; c=relaxed/simple;
	bh=3DT6QRDlnKNLdhYLJ0aWsJwYiHRrU9kcv1vYTABy68U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJ0dY9pmbNqSHmQAcPLAgIUtsz7gFwizo2L41PKioYMk2WEJT+UahcWQFu3T7wu3PJao5Mzr/UhdyoRQM5zm+/XvavnKnjlLBkOTPAa5M7EYG+3Vy4B0FOxyDUiBCU70c8P2HIYkVa4yC3hwX+QJa34AAWq0Y9FfEPdsSEMxXsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWL33Yg/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FfJ0FZCJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O01l668987
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPZHmS6h/AcJRV2idSAJRkkNucwFXp3FnUZZxD2wUGQ=; b=eWL33Yg/FdDF8gik
	hh9Q5gFuv1X4L1wriQAXWuu423D5iDCwzwo2LrV4USpyiOLFNLg4MGc2WejsLyIA
	kVBgmZuoWjZGDeSYxUdg7+4bHnZnP52sNzC6amsMXsnp0TjwZbAKNUuBJntb8LZw
	vmJRqq50sDvhtWJzycyUQQfacceKJ1WZOBHMYI9z0L2WM63YMjRsE4ppA5D/OgPD
	ToOKd5heWqm7AEaKAnFl2rc7M6fyZSZqTVYS8GJVTbwNGpAFTJvwl+umFgfYSxts
	jB8Ig5xSVmhb3w5zJ+QXAcS/ECMNo+UITDGtpNt6GR7tf6CHR15H6wsq2Zwt58H6
	Y7CBNQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm1vdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:29:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc640dfde3so39942915ad.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934950; x=1784539750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XPZHmS6h/AcJRV2idSAJRkkNucwFXp3FnUZZxD2wUGQ=;
        b=FfJ0FZCJpUrB8A0QoTw1lfM7Yl7wpTDuEmf4GzTSeAUkA/r29+Y+frtQ2JFetvQy+/
         K1yxI36cs26cCGtfVbDIQtdqEnZm7jSeD3pSOa05tTHZ1VdGTFRjLOz1cvZQOBXiqkzB
         Q2z0AfaAai0D5eonL/vxLKZ6UgOiKd4yIYzrNjtqkcVo6R1o/V46N1SC1tXaOPxVY9tG
         UuoguSC1QDRXRIkGPlDDPYBtnnxGa9Fd7uiu12+IeIywRswcRbjtl8KrpkaZWoSCb/OX
         9/qr6wTCCPkQaeMjujpQR/kvytlD2yMGTg5Ll1QBp/wSqJu+O4msw3q0d3MQmZ9Z2Tz2
         ETaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934950; x=1784539750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPZHmS6h/AcJRV2idSAJRkkNucwFXp3FnUZZxD2wUGQ=;
        b=axmZCtQOSiJALT+O0SJYoOp0lSIb7K1cj2+8uKsLgg8P6e7TdOca/7zWxYsCz3B5GN
         Z2mu7hzihBq5CKlXCM5rjv2q61VW16KX+d/1r322OizrcykswicwPqjQtW0g7FhlwT3h
         gfLZaQl62vnmoeSWAErWooafwsqKntodOmMG8xWwYO8K2RpDHJ/OGAdBYEhkJT9pxZpb
         m6IxWbyQ1uUb4zQxa7Pe+A0dYCAWIEFKo087Rtkkmij7Zfamr8T7D2iEpKHmQnIVkuuH
         MIMKGWU8vTHT+VlgttC+++At+SNfSnU4fkmLhfDbgQdNwJwZjZ+4XCGItHTB6qnTVNGs
         i+6A==
X-Forwarded-Encrypted: i=1; AHgh+Rq1NZRTgvXfNUZsNMxz9qxjDqZuUHOJGqK7qG/s31qrsjx5gvRAWNKFxx+v1A8OXglO22Ehz/MFrlpt/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMufADxw+vhzqCvWGSCa44tKykSRHok4Lf52xJC7Svub65FrzM
	hm5F01tMWgX1c4UnUQDia9PYMpOEez9U+yqXVZOhNWgmysjyvrf0oVLRJ/divZgTA7x0xQQ4hqF
	AxpPKCEU4a4l0kuCy46fdnUL4TgNKGv/NYqwvReQJcOUZVsQ3UdylLwAr9w0COcLEfw==
X-Gm-Gg: AfdE7cljUW0+54uUl66WRz2BD/JxedKYMYwDU52eCDHRkVCRVedEYKWGVqHD3OXoUlC
	dRM6+pTYwOUC+oIlc7Zu367ApWb1j/YldPcjR41H47isxDESdVbH/CKqqK+Q0p26iI7pNNBIJ+j
	lbajs5AfP0PbAhLZT7vTB/iBOIbO1nvwNadbqkK+K0r+YjrS4irwzIgY4ebuO5d6ORKiaLNz5qs
	TkPEP8bw5+ncG2PgFt9k0Bd0Y2yMxzh2Pqe9NyAKS4/HHQv2cE68j05xci8mKa6Kgbb66uBqkmF
	qhZJ8nA4P61zCMM7rbCpyHCD9P2WwlJeTg/uiuielVnbL8ON84KcHDmb5t7V6E9zRKCIpZqrMmf
	J0hicMCpPTmL5oxHxoAtbLaNpH87vALDXnOv/YjHLRg==
X-Received: by 2002:a05:6a21:7010:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3c110a73f8fmr8546335637.35.1783934949674;
        Mon, 13 Jul 2026 02:29:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:7010:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3c110a73f8fmr8546286637.35.1783934949195;
        Mon, 13 Jul 2026 02:29:09 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:29:08 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:34 +0530
Subject: [PATCH v5 3/6] arm64: dts: qcom: shikra: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-3-db53be15dc4f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=2621;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=3DT6QRDlnKNLdhYLJ0aWsJwYiHRrU9kcv1vYTABy68U=;
 b=G28wrDzWu2NzTARFJ54PJ3XxhPcMa5sc5Ppjqr2j6H7OiEQ6JhJ7NsLaMX5AT2fjmUeLDnYUz
 kaenrXUlaSFCGevPMgLBSABMYZai/+myb/fnRfHumo/yKYXSWY6FdhW
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: out4VK8Z_H09DsdusGaxXlSN5Q1ijoLT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX+dt4O73tu0ux
 ogvtm6XgQnxo0PSv0i67+B2ZWqaSnyuei6U0gIE4JiRg2k8FIDuo/SiBSmBWZM/YsPZXsPLnmOn
 jh7iV7dXlz03ERHgJKOeCklChN+4N8CFO+KzlFSQ11tSBS4N/uspU8NJbhevqXWiNenY6fX+xcV
 27Q90U5ZjVQuRMd0IOMJyPnThtSGLuhLkBoHBSIydTWxhyTA+Gt3p5I0Mrc/unzGHxuNL088x0S
 iOxakt0FN9tyScKdhoxoNpw3HCYf99FXqyHstPo8d09MbN59mVazM8uo3kOBkpXKd3X68wN+mKS
 omcCzL8vCHjvx20XEYbisvEewm3q6WE/JlZoSkhHGKqVheh2sRxe975/TUIFNX/qXOScZoz/A5M
 MTHMJRURmYIRncEkoZrswNN7IwEjTmU2m2m1aMh3oPybAaWVxw6MBL9cmmRl/mV5mkgMuaQ/O7N
 XToRZ9cOQrZtC4ArrFQ==
X-Proofpoint-GUID: out4VK8Z_H09DsdusGaxXlSN5Q1ijoLT
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54afe6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=s9wsCz4ZXjtKvCKk99UA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfXxYJy2AloIRo+
 4s6qkVx3lPXFo1UXliEoEYVUyHkVL0+Nv09REwhPnNy9DlUbszIcwHFyQbhglNBcpDZDgNszKx0
 a7dc8fjoN1/i2zv+U9W3XZ584PR2bzE=
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67453-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,linaro.org:email];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 5DE087494BE

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 6335caca329808ee04d9067f1f95e8075e2fc3ed..18da1380e52acdd8813625eaceac796e342efd16 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -355,6 +355,38 @@ qup_uart0_default: qup-uart0-default-state {
 				bias-disable;
 			};
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c0_sleep: cci-i2c0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_sleep: cci-i2c1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
@@ -702,6 +734,44 @@ port@1 {
 					reg = <1>;
 				};
 			};
+
+		};
+
+		cci: cci@5c1b000 {
+			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x05c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		qupv3_0: geniqup@4ac0000 {

-- 
2.34.1


