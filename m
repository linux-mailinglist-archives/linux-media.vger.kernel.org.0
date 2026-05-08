Return-Path: <linux-media+bounces-60918-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDwRC9PL/Wk9jQAAu9opvQ
	(envelope-from <linux-media+bounces-60918-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 13:41:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C1A4F5DE7
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 13:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20AA330297A3
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 11:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083193DB622;
	Fri,  8 May 2026 11:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTcx7Tpj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GIseGZXB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232F238424F
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240462; cv=none; b=Ss+cPkv7ri43cF/Ta5q0NxTJ24RBVgezTF2za3d74eszLaIQs9MSd8J8KAyiK4HG1yHjKwtV/3oSaggzgPu1gpL6JkaIXjVeVKFZMmM5VZBQIyUq5/xdb90f3Afoxq+UByYuQEevYIQ5OZGly/YAst3TiS451ooPPVhzu0a4HtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240462; c=relaxed/simple;
	bh=fRzq/bQJI2C5j5nUIqvt6eWcoRIMc2Yy8sViifhUlIE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SEPShvgq7zmEPzkPWt0aV8KCLP6SfBo/WFH2uLAh6iZrFtYWD7K6hH7DmWHL14IAS1Av8+vRvykBuDj83yhkp8m877G1QYc8g4T981DTHHYIt+Z5hAktz8z0AUBHBlmtnphrLM9lpYbVblO97DBu+/fvfEceeEZS2dDGtwH+sOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTcx7Tpj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GIseGZXB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jKxT258436
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 11:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4dL9MbqmO5NoZOGWEnRN0v
	Ti6HOFxJp7JBK/cQnJ5/4=; b=gTcx7TpjQU0Idrtt+MQK5Er7+hvG8rlLcsN5Wk
	sWlfLLS5t4HkzTzj9Kb9H7a1gbmz2ZLj47mwmjazDl7+TDlA5NXKe5Ety77P9MiA
	Uv4t4WMinPlKeVAZ6AqrWnQ3xNG1z2bwF7+/eO8veO4lZpDISsOC9BVGuBw0q8w7
	2zD4AGUoCg5bJfHYkwKjtRJ6ql2HIJK4qvy/NL5W/7KqSYkfEwmoJHY/PJXN6Kzc
	tb3n7oPmTkSxjU4hpezryw7RyQ8lSFAf4KqKUv30btG/eEcN3IbR2sEBWrPAbArF
	5GrSHy1SvkfNOg4gJs3yxKKWzRfXBPcnKl/Ol9ekaqsmL8+w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1aueh3fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 11:41:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d5d03ae893so320075685a.3
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 04:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240459; x=1778845259; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4dL9MbqmO5NoZOGWEnRN0vTi6HOFxJp7JBK/cQnJ5/4=;
        b=GIseGZXBANbz+zQmwKL792iC55ZAclUdCCfNVqOpYix7dmgyEMDX378WiTVr6BqZsV
         d1EfNOtvvzbdwnI0yZwkj7eq2skxiV4ye3IrpMmKfy4K5wowesFCYhchz8F/QdTp/ot+
         gbi3NYi96eB9cv/ReEqgxTGAutOYh253fF2b621n3WFmGfYUgUhtbumER86Akz/rAZMc
         fusy3LfLCrh//1X307HDvmvPg06bnqfODNyCLqwGIlfVYisRqkc2Yrqcy8mZ9qxFCszZ
         a0MTsRdkylcoNtbIbYJawolwklLzx1cLMwchsVE1WzfClkv7MRL1y5lf+D0ZKOv2TlKg
         1EeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240459; x=1778845259;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dL9MbqmO5NoZOGWEnRN0vTi6HOFxJp7JBK/cQnJ5/4=;
        b=Wk2h/gMdyHwFGEWQeR4HxBDQw3QDFM76bCNlCYesgS4JQX+rANKo0ewCh3+elLSwtj
         CjEa8YkzxINdKfSwoW8644D5N/rnb16Djqg6oF6QmJLnDoJieZhm6peH7VnQd20WeWIX
         A5RldfbxAg9b4NNGeOpdTJ5sbqQRupspi+W28/mtYTP5VmT+/Dw371GvR/1Ib/JwYmZr
         0D0ccrT+VDfiUz1VA9V4aPA8DAXDgSob9MEJKXbdS6R6/9wKebqnsHFeC75tdKyfi2C2
         YKqB1QcArTiRd8E5bj7KpmmnOM2eL9Jo7LVFLIeUi/OEkgMyxYPAqJkurW8ehpyubyPe
         k0ZA==
X-Forwarded-Encrypted: i=1; AFNElJ/rSZCbPPDmHjwiiS7wunrr+MCNlQZOUXC6jUEOcfB64biP6terGmQYTG0nIlfxCyM/0n083EKYDrWo4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhTE/u2ezw23Pr/A+t6MGHvvejcuzXcIi9zlG7s+TK0qiSYLgJ
	OApoTgwsdgmm7BGdDrWNUIACu+OexxkN4L1pBhXzl5Vyo73bXptO3CTRq9SnS3pMV8atbjJZMcY
	q9o/vGU2Ovej9soyoNfoVdLxDw+DFYYMShyhj3DJ+YG1nOYO2JS8zE0lphqWgymblEg==
X-Gm-Gg: AeBDieviUGd1LsBH1W8jAi3MEMhjOoft1D6PZSS66GGW/ibVGNnf78YVMvypD8Z6LWW
	LP0vIcqc7VDFWg6LaZeyzw+nSkXdRxx257Q8IP0xsSYWS1+yWPjHaRyWwwKFa/0eqdWZ2JvCC9P
	V+CpaackRhu1rQstlpyDsqDj4WtJVHk4XOTSHTYSxB1Jv36PDUydOKvOVFgB/IdFvirw0JSVuAe
	qiKjAzlh77s2jZjAi6pUs2khmCFwxik1oF1tOyQ/jvjb4UHfsRj2GoX7I7LkM+BwHc21rhU6Gvr
	DB57RIfyOL33b5Emk8VbgD95zqG/Tir15PRS91JPywfWFuP5t+YenJKjfpl8EMiKsOtjLvi6vtY
	n80yMODBl4ejhkaF2Kl608wexG4nwfHE3/gRRMVa6iqzg5XFa+b998/QpzqOf6HP2/YrEOSyOCF
	0GXM2ODkWLWHB39GCEhdf4+oI=
X-Received: by 2002:a05:620a:4493:b0:8c7:ad9:d0a2 with SMTP id af79cd13be357-904d4b5c91fmr1821326785a.22.1778240459394;
        Fri, 08 May 2026 04:40:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4493:b0:8c7:ad9:d0a2 with SMTP id af79cd13be357-904d4b5c91fmr1821322485a.22.1778240458927;
        Fri, 08 May 2026 04:40:58 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:40:58 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v2 0/7] Add Hamoa Evk IMX577 camera sensor support
Date: Fri, 08 May 2026 19:39:56 +0800
Message-Id: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIzL/WkC/22PQW6DMBBFr4K8zkSOsYGwyj2qqJrY42K1YGKDk
 yji7jGkUjfdfOmNRu/PPFmk4CiytniyQMlF54cMYlcw3eHwReBMZia4qLgQNXTYe/yk9A1CKmX
 QytI0Fcv7YyDr7pvr4/zmQNc5K6f38M+YC1af4hWMc7ghJGfIaw0a+5yWLJdlLWqSuk1qlV8wE
 mjf925qi4HuE/waarZ2dS5OPjy2N9JhK/vn4nQADmVlm6NCIU1jTz7G/XXGn9W8z8HOy7K8ANR
 TYhUVAQAA
X-Change-ID: 20260227-hamoa_evk-2455daf43d86
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=2824;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=fRzq/bQJI2C5j5nUIqvt6eWcoRIMc2Yy8sViifhUlIE=;
 b=pm1iTN0cRuDGr++C9tkC79mDzIlvW2vPQrXX2yoIZuHLs5D9nStYfMk6lqzLZmFYv5peqDPLA
 /mfxkjq4KlbCK68I6wQ7mQp3lrECU6TeeSQrWgamAg4AS+srYfRp6aT
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfXylAyP/7up1ub
 LeiyMJCZSbYUXzUPVT11Hcmw6x9P8RTgLNvapNx81nC3ShbvjyZUQezZe9AmV2fpShm4QI8/k59
 ANlzYCzH4LuR+tKHT8zJHHm+7nEA9ulhQM0wr/9d6mE+0W0B1H39ri8L/SB75bDIOU5du5wP2Jy
 YGGJsI7PAY5IOJ2i3jKCujdFUewX1FuS8cYaRIDVIegxNaYaqAPnfxTUHURoJlfz4EtjXkuzyfu
 tSRnOXTUx5tLYD0vgs61EJ7IWl6heejkLWi7mqF/YV4eHaS+iBL7+GyZjLAFYEJx/oukRdBMLiS
 nF70UKBpHHOF6lBfgo4lDrtKOQSjIGsyQAAEr35O5t5vbpqGQj/e3WjLYuknJFanYlYvldUbYM+
 zZr4vpzZcWGVb6YI4bu+me4PHeGYM4ar8fuptiyyO4oN5c5rNBi1cMwCEZwdvewhu73yxXEDQ0p
 89I+oVWelcMHsA727Bg==
X-Proofpoint-GUID: eNcarcLh8Soko1fGDEo4um3RYXCHzuW5
X-Proofpoint-ORIG-GUID: eNcarcLh8Soko1fGDEo4um3RYXCHzuW5
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fdcbcc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2_56qyuii6Uzx6krxeEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121
X-Rspamd-Queue-Id: 96C1A4F5DE7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60918-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hamoa EVK is  based on the Qualcomm X1e80100 SoC.
It lacks a camera sensor in its default configuration.
This series enables the IMX577 sensor via CSIPHY1 through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

Dependencies: https://lore.kernel.org/all/20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com/

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v2:
- Drop src clk.
- Fix typo. -- Konrad
- Port the code offor Bryan's IOMMU, CCI, and CAMSS.
- Add mclk define.
- Use the unrefactored csiphy.
- Link to v1: https://lore.kernel.org/r/20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com

---
Bryan O'Donoghue (3):
      dt-bindings: media: qcom,x1e80100-camss: Describe iommu entries
      arm64: dts: qcom: x1e80100: Add CCI definitions
      Add dtsi to describe the xe180100 CAMSS block

Tingguo Cheng (1):
      arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M regulator

Wenmeng Liu (3):
      dt-bindings: media: qcom: x1e80100-camss: drop src clock
      arm64: dts: qcom: hamoa: Add camera MCLK pinctrl
      arm64: dts: qcom: hamoa-iot-evk-camera-imx577: Add DT overlay

 .../bindings/media/qcom,x1e80100-camss.yaml        |  31 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 .../boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso |  74 +++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |   7 +
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |  15 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 368 +++++++++++++++++++++
 6 files changed, 489 insertions(+), 11 deletions(-)
---
base-commit: b25f15a8600145233c948b40cab6d7d57bac3076
change-id: 20260227-hamoa_evk-2455daf43d86
prerequisite-change-id: 20260506-purwa-videocc-camcc-fef043727e4c:v5
prerequisite-patch-id: 61bdb45446193b72dd8a4b093e4ab2f78db2f066
prerequisite-patch-id: b5be9dcbb612a14108f890b2782860847edfcbe4
prerequisite-patch-id: a03b10745ba5c628d09fc5278aef832864e31823
prerequisite-patch-id: 026db5dd71d5b0472225ba72c8ba2781334143a9
prerequisite-patch-id: fecc5a4a13c8e1c35ddd2f35e7469a327ead3b82
prerequisite-patch-id: 24424189b11acee204622997908d85a0efbb2503

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


