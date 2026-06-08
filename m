Return-Path: <linux-media+bounces-64189-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C6wEDnzOJmp/kwIAu9opvQ
	(envelope-from <linux-media+bounces-64189-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:15:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFF365708A
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:15:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="CP5/pt2v";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="UvWw7te/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64189-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64189-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45772308309A
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 14:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFEB3C583B;
	Mon,  8 Jun 2026 14:07:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE293CC9E4
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 14:07:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927633; cv=none; b=CaG+f8g/Dd0nQ6vZynVPX2Iz+bEOECetjdmAIj+wImKXjJA8d03veMsuIjXmldYKk4/8M3zn9jegpXfNUtNOhyeuBr2bQp6I9ri1bUkf65fsu+4sH1tYLymFcagNSQ2JleD/3FbZlhlIH5kg5OC2L3SsMOdyOMQkg6GrBUC3QPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927633; c=relaxed/simple;
	bh=mQqM1w0igZ6gBceLVpA3L2XftiTNlEyJu5WZnfpZjYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VvpmJEuzm374kKhqxNZHptygGLlyWaDhWo0CNfclDhL9d1dH3ijPNpnytMz08/lO5le5Tjj/dqtHkNyrH38yCOAELAvYaSnCiDXCIbpW1P9AwUVgNc2csuYJ4xPl0hrVkGqaroML6GdxjkYSlbB26/JK4d8YwceQy9YT9VBNx1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CP5/pt2v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvWw7te/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR4CH3336023
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 14:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PuMgbKDOyQwBHJzatzWciwXjmsp+q/nFMV9PYpQ10wo=; b=CP5/pt2vogFQ9/zu
	BY6AKFYkcseBG2tu3CPfUAFZ/QYkVNlP10oR+YLVDZHOTf9L+GsOkjMPy/zi61yS
	z8nQV4eRLst/vM78FFTqmKYXr/nVsRNxdjJtu6LKcRgqGaJmO97iGnuft/dQJF3k
	x2FwWNsM2ZM/5rAlFjdSXY1ZX/igNCPdpYzb9rSZT+j0w7jjm85UN5tteoKAyULn
	fp452DF35mf7o9ZhlFPu0HhlnvCSo03diWfzkHLHAp6lHT/HCALQOCPo8O6y25LD
	em08AWL4V/dMGe69kRjVJkVTaExdo7mgwg4mvHA59QhaPnsu9SSDMXehUpmMtX4x
	RSUqCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun411cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 14:07:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so84903425ad.3
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 07:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927630; x=1781532430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuMgbKDOyQwBHJzatzWciwXjmsp+q/nFMV9PYpQ10wo=;
        b=UvWw7te/8Zc00+yoRNU20htNoTMO2tbKRHBlAeDFcskV41gfmcMrYYsUF6u3Zyh1Ky
         48ghtPF+0X1AFGpVhBSrGHtO9NGTxDo1f2+ms3ggFUj759m74ZXerA1VmQCkaF9fq3nv
         FmNO6t2Il5W280dzEQdmmQ3zohXJvNGn57VJq7rzALTK+fhMVgsNUZ4M3lWqDben0Uwb
         2MuVBLhJ3YMBKiQcrM6SgOL6APNzbSdKChUH0NifzzMUibrc0beF0nNzWIIYbtiHTbqy
         oEqOBvjzDQz+VOAvAI0cVvQGzZPgJ9RaVmxkK0xoxUTjos1qo3lKu5x49c2nZyn6UcHB
         B8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927630; x=1781532430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PuMgbKDOyQwBHJzatzWciwXjmsp+q/nFMV9PYpQ10wo=;
        b=sboFs1wYLLILAEIBZ1HqwwE/wzVGUhUbZGDhbXYz2ngE3HGpynOa8mMrzAlcQGk8Yo
         XO4D5bZq0o/+q5Sf3fMC6EpGOR9gUPLf4lzsMblCB5XOhd5h0we046NTZSAPgW3i21n/
         hGlswAWXEIihFK0fxf8FjXHpqBDKxqceBAL2Q/uPkTlT4Xb03gbSFWrN5XQ0VBHfLdYE
         iCZK5N/De3ms3H15vskQs9QejLU6Q9t1m8HFAhpWFTkB1Yv9auUxqBJELwurWZpN6m0T
         90V3dl+r/W1QDybG8saWerDrPtu6PKb3gTWfZSA0Y2qmaOzY7qMR5OSsJAuafrnKfEDq
         LQ/w==
X-Forwarded-Encrypted: i=1; AFNElJ8Yju90m4O83iY2F1wVWNiFsen/IDbyinc5dLMtPNr1THP6jNn2jJrAJCNDBAtYFjoBrogjGZkOwhuMlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwTgV7bd6Qgh4izIZ6GByqHw0ZlvSJ8osr6SE99YmnJOB0iZSV
	2o7vnzoSYny0LXQWXIpigPOYdrYlVDNBuOKWozlZYB5+8UtxK34KXeDZmbo9r+SncdGok4i8gzc
	89dtnngIFzlTROmJUXBWHhWnYidzpWjzUdf3FjqKBZ+lGlx3REBZNutpBm4gYAsrTaA==
X-Gm-Gg: Acq92OEXPQbQ8ZPK9aDAlfvX9dTDxyRslwcplLmU7PM1JtyoJnHEPHRnEUb2R/ufz7y
	9Nr8gIueJPCJldGU5DCRrYHA67bnUliOp6KWuqta6FlVJvWYO3LcX8fl40ZiEpKNitgIaUqWcjb
	CyGVnz4eaO4XNTThzuMRjEgeE/EkTtTZN5qIndGEuFnijAJuBI5eVYsx/e4rAp13M8mvmrijniU
	LjSx4oRzUs9wnl78phCcw/UYDQ0ZiYgE/vpKKO0NF30DPH9dVusoUxXswX5yRm96js7c9CTdM3X
	rPqQy8tLkLrb14be7+ShyxwoYHYQOt227L4uKbTGa9z1rxSX176W4MqfKXstM6wRP4yiFySRYhh
	F+40Hwl6xIcIrveJVjQrbjzKyyQ7K3zISNd2N/w7FHDDuVgXU9xdSQjIAehJQZ/I=
X-Received: by 2002:a17:902:ef08:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2c1e820e30bmr194406545ad.13.1780927630395;
        Mon, 08 Jun 2026 07:07:10 -0700 (PDT)
X-Received: by 2002:a17:902:ef08:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2c1e820e30bmr194405945ad.13.1780927629848;
        Mon, 08 Jun 2026 07:07:09 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:09 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:39 +0530
Subject: [PATCH v2 2/7] dt-bindings: i2c: qcom-cci: Document Shikra
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=1258;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=mQqM1w0igZ6gBceLVpA3L2XftiTNlEyJu5WZnfpZjYc=;
 b=l8C0oDCVF0z+wAAe3f1ETkYCRM41rQ3byPRVTvb/6lKc/KRgZkw4TgfV7TAbSpwLqbckDutfq
 MSCZkcBP86pA3vry1LMmY+U8R5P4bc7WLYWyk1aWsCm5VV9xaA+Ftdo
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX5AXJqOi0UAe2
 ZFXMOhcJ8LBxCC9EdvAawTBJWiYyb1ypg2UCK15roqpXnMDIN7VBqyWLpbvjtQn5Huq1Owk1GYF
 3t2iOifcee5TtfksOxHBbWtfmKRdgRVsnMid2YuW3PPVbGITqlmx0KYBMOEyjR3kO1I6SqBJaYx
 U0RxlQrmZGVUWoO6gtNDWuIgK1Hy0B70txrYLOj/02JXOFojlPStm97OHnjirNJ90lZAh7U6Z9u
 7zCq20Hdi6NEByrkNGALo8WpEcXnVLTvles/QAaNP1ERQfjSPBt6k8WHWQqzjIxWVj3C1Byn6AQ
 LFRbTYTdCPEv4WWE/4p5ISjDOvrDnl6fuCqo6LFewBA+yTM509JETFQVzwazLDvSGoaFLJahrAz
 dafeKkuljC5B0NicThbpNzsZ2r2iihIY284iUvJGyhaI5BGXQ7lHjeB/Lpi18WHA+zctnkeiSxJ
 NrRMnFgHn7r6Mky6NKQ==
X-Proofpoint-ORIG-GUID: 9ccG5OhU6MJw4u8NTnrm0wGlt6qXw_TY
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26cc8f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LDBv8-xUAAAA:8 a=KKAkSRfTAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=DZeXCJrVpAJBw65Qk4Ds:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9ccG5OhU6MJw4u8NTnrm0wGlt6qXw_TY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64189-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:wsa+renesas@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DFF365708A

Add Shikra compatible consistent with CAMSS CCI interfaces.
It requires only two clocks.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 7c497a358e1dc8cec8b31c17bfedf315e4e00606..c94069afd8d06dbb08ddd6b49e2de7dc7acdc29a 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -35,6 +35,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,shikra-cci
               - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
@@ -137,6 +138,7 @@ allOf:
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci
+              - qcom,shikra-cci
               - qcom,sm8750-cci
     then:
       properties:

-- 
2.34.1


