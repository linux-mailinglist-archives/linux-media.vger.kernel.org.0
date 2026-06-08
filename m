Return-Path: <linux-media+bounces-64187-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rffPMs7MJmoQkwIAu9opvQ
	(envelope-from <linux-media+bounces-64187-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:08:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1FB656F25
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:08:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a9mxOuki;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EWmjHJwj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64187-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64187-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7832430118EA
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 14:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9E33C3C0F;
	Mon,  8 Jun 2026 14:06:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5593C4557
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 14:06:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927618; cv=none; b=VyWwThXq/dcU/0yw2pHxdEhQJuuGxpPr3kqcITwpA4101y56alcX2iu8gGRPeDkwB0y+xtRjbe6R6GODzPrTpevNXkG+3lbqPuifkCmghKgxQBoMDgtT+xNKP9dGgJwtlOVfFueqePEWAiRlXv9144SRcrH8SW9tImPfTbdqsLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927618; c=relaxed/simple;
	bh=+XR8a4QIxvUka2Zv8ehwCWE+21woibfF2m4rPKIhOm8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ihs8y928BgPgg72trCzUYTMOsQ0d6AJ+sSFjHEasd+c5GIDgzJGwCFffJ7S6ftc5WY9h9PCvBQomjBernlV/VNPjr4X9acZOpQM1Ea8u4LW1pzW6zoPE8ZBlnjJWgTclkBzmgyScTcTRwhjjlSUaLa49igyPU9gz1r12gcb4HKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a9mxOuki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWmjHJwj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRAoW3340126
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 14:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wQVq/uxdsibtS8iiGxP+Km
	hQ3XVNWt/D020K7D6egn0=; b=a9mxOukiZH0d0bnvWM+NhvQyX54al6FEzzRGK4
	CcP6y09gySNDA/uA09nQSysAXsRi5wAaQ20+cpTmT9XkMyCLY+ao2Fc1e2aHssec
	YiX2sasxAxF16Lz3qbw1pZT8fekfiFxXOTsai+ZshnpKFfW3zGOt34aBL4d/Z8z8
	UUKHkk9oVDWXqTvaQWvRj5DCpDjH9phwgLh5Gof6KDhAitDP2LZwGrF2zEEm6Z/t
	0oiGxZndSsjzTuyaK8ErpgZO53TICVweDmwbIn3cSIX0BYKMBO8JLUm/xxsHag+u
	cQTSm1k9KmOyQ0PLIuiX8Nu2wBtRf2kLuDJlQ4hSldMpbm0w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m0m2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 14:06:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0d0516ad7so45767975ad.0
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 07:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927616; x=1781532416; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wQVq/uxdsibtS8iiGxP+KmhQ3XVNWt/D020K7D6egn0=;
        b=EWmjHJwjd0l/z1GYagjn2I4Anl5xUUyrTwP/akkt6vAJG7TsYwgjSuKNs9quy7N+su
         S1A4aDoYPoFFzt3PZtFkxndcb1AeS/CR3NWl52WQICVGcgcdixfjMmsiMAQlRwanzxRj
         OGWjkmHe0Ye8uQnyOZvUTV1JU4Nyug3Sgvzs+B0JyH4eeM0/bh63gFZij8ywxFMeiHyF
         K01l4yUouYM9fcLIjUqkDBitAL5G7/0O8B57nj7I/LfEJhXgahdxEtAa61VYAP285RqD
         5M4qxM1Y3fctCkmqdwqM80x+XidQx2h4uMkDVSnD1HyxptNS/8AXR9hbGNjrXxi/wbfW
         QCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927616; x=1781532416;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQVq/uxdsibtS8iiGxP+KmhQ3XVNWt/D020K7D6egn0=;
        b=dyZOcPsYTOMG9QC42DZhMc4XvJenxlADvB0qbne1oey+KaYiQsAqwzPvqbE6nGLa+1
         CjlSuenaLGBThnhOGWa7eJcAaVQsAvX5JpfwR4+shQb+oI8AKsWC9OdOsQ3vCVG8DHae
         Aa5IIaVEKqsXZ2d2XQQasYqrShOpcWPrBxpmzIXTifM9dcgjymDjScdATwEJNKCR8LXV
         pXxnHP9FhJfa+ZcjU2boNwPUiPaneh9lAqohnRrwI/Z98NepiQMa3k3c2npfp1V/zpcS
         tRWCrqL+b5mTNDT2YsOjvcYYBeHAxtd3B6HuXHVQT8AIqShcT8GIowds0Ul6Bk9dsqNI
         UCIA==
X-Forwarded-Encrypted: i=1; AFNElJ9x+qfO1x2AG1YJWX8apKbFgRX1P1703/9Dbu7Id0SLDHEZj7zUoPqVspqzn8UDui91ugVlGqzzTN4pmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQVAC6azQ/11L/Yg0qx45tz0Ptj23pp15o6aKNzDLfw+iTMvdF
	IkXLBrp4ovr6HaqqUTEvf6Tk3ystmi8x5JaVjRNRUJxarINv/chop1rYlVB2GhepJX5ZmR/dMIl
	XEX1j/3o+hJIGSXT3Af1mbmAMIa5UbwxSmjGl5Jd/FVL9vIlKMykBh1tbf+d0lBF/cA==
X-Gm-Gg: Acq92OE+1nmzhtaSRrojCUTa9FFHSqZNsPSqbJZXk4Flv6n3/WHZkO89ltWnF6+Xn8e
	TwfWALQJBNKdIGM+NqZGGJno48gxGup0jsGOSgY1z2Vx8WpLFbAnOS0f838pWNd1SEBlYaiQOnD
	LnCAzBRbu1e27R1muQ6TB/hi0hLzUQ0hF28PMN2E6Q25gp/BKLrxR1ltp08+hBye0nujshLYF2T
	4AmZDpyk1YOYn0T9bX7uwFQn2CqwRLaHkV7L3BlcC0vjdL+MdcFyXRAU9Nd3rjk8xxMQjGWiAk2
	+jH5i8w5+Og4QFMy1kUnFouPbOVT+TIBCzCr/ksTZOwB6tHb777mT0bwTnY4ftWphdn0c/4SsrS
	cu85wRCE35LPRyiS0VLCkgvFAK5U8vXG0E0hGLAWp1gorGGJf1KOXi0xHVAqmhas=
X-Received: by 2002:a17:902:fc48:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c1e78e4f0emr186695065ad.4.1780927615538;
        Mon, 08 Jun 2026 07:06:55 -0700 (PDT)
X-Received: by 2002:a17:902:fc48:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c1e78e4f0emr186694425ad.4.1780927615040;
        Mon, 08 Jun 2026 07:06:55 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:06:54 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v2 0/7] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Mon, 08 Jun 2026 19:36:37 +0530
Message-Id: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG7MJmoC/32QwW7DIBBEf8XiXCKMYbF96n9UOcACMUocx0DcV
 pH/vdhRpB6qXlaalWb27TxIcjG4RPrqQaJbQgrTtQj+VhEc9PXkaLBFE844MMmBpiGco6aox5T
 o5nCfFD14AI0SwJDivEXnw9ee+nF86ujmewnPzyUxOjmK0ziG3FfgWiENGtViJ7XvGsk6wQQzV
 jiLDXID1qpWkN9QhXFHqusXks3UKmk7JaQAAf3yp0Hw7mU4IdJ4G8vEyzlRXq46671vDOsXSTb
 yIaQ8xe+9nqXe0f9tYqkpoyCk5diiklq9zzkc5ru+bM8eyiDHdV1/AKK05kd3AQAA
X-Change-ID: 20260526-shikra-camss-review-cf6f66ac566b
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=4610;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=+XR8a4QIxvUka2Zv8ehwCWE+21woibfF2m4rPKIhOm8=;
 b=5RqYiF8ZJ4ix2XlVQX1XdpIbS2/xDotGO6lNHgV+jXSRyC6eKHs4pORJrkXU46w4gt62Zo9Cp
 ho2ZFQDHy+UD4caXRs+wZWsjJBWZy2qLe1Y8jofqXWzsw5ixWWyfIWZ
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfXyoO29payXf5k
 06mxduk+YXRf7Vpewk0Dztb3xa6z+1ZJCoKCEilic3+M5SsswBoNgZuol9+WKeNEvApF3lBMnLq
 TRD6+DK79yoqV8gTWcE5SVYrNs0tQ0f3FdP9Jh6vs4PHFl1lBFHVmyu9kP2IRRPQi1gYJpIrkOz
 wZrt3l0zanDpT1dCB+dFMkrLWGftnq/s0cQcbC0bB+VGOWLiHE/RPub3U+jsLRIGoQSoD1XuYvl
 InhYLZh8624KtL4Z8nSq7rWKv072Lu21fzsKazuKujtPG3Zju0sTIBPfzW/kM9DSAz4bRo6uWEw
 b59q3wDKP7HGpz9WM5Uh9K4VKTiWqrnuiOd8BgPd7OjYeBDoboB9ApIvAn3OynXv/DtrzX7V29d
 svSZunox31w2uiHG1b6HaD7h1iXqHjZZCMxesCwpBGRlimAGkCGkIV+PIN2sReNE3UdH7neADxQ
 s5SvPoq7TvVc5813RCg==
X-Proofpoint-ORIG-GUID: 3nEFuJbNuvhxx8N-H6jDGnKU6MlXiN7k
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a26cc80 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SCY8RljC4g58VSpTV0sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 3nEFuJbNuvhxx8N-H6jDGnKU6MlXiN7k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64187-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:wsa+renesas@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,checkpatch.pl:url];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: CD1FB656F25

Shikra EVK is based on the Qualcomm Shikra SoC.
It lacks a camera sensor in its default configuration.
This series adds CAMSS driver support, CCI definitions and enables
the 22-pin IMX577 sensor via CSIPHY1 through device tree overlays.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,qcm2290-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 qcom/qrb2210-rb1-vision-mezzanine.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-cqm-cqs-evk-imx577-camera.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
- make CHECK_DTBS=y W=1 dtbs

This patch series depends on patch series:
https://lore.kernel.org/all/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com/
https://lore.kernel.org/all/20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com/

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v2:
- Drop qcm2390_resources struct and CAMSS_2390 enum; use qcom,qcm2290-camss
  as fallback compatible string since Shikra CAMSS is register-compatible
  with QCM2290 (Loic, Bryan)
- Use oneOf in iommus to describe all valid SID combinations: VFE-only
  (Shikra) and VFE+CDM+OPE read+OPE write (QCM2290/Agatti); add
  per-entry descriptions naming each SID (Krzysztof, Bryan)
- Rename shikra-cqm-evk-imx577-camera overlay to
  shikra-cqm-cqs-evk-imx577-camera, shared by both CQM and CQS EVK
  boards which use the same PM4125 PMIC and camera supply rails (Bryan)
- Add reset-gpios pinctrl state for IMX577 sensor (gpio33, cam1-reset-default-state)
- Add comment in overlay DTS explaining absent regulators are powered
  by the daughter board (Bryan)
- Collect Reviewed-by tags
- Add reset-gpios pinctrl state for IMX577 sensor.
- Link to v1: https://lore.kernel.org/r/20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com

---
Nihal Kumar Gupta (7):
      dt-bindings: media: qcom: Add Shikra CAMSS compatible
      dt-bindings: i2c: qcom-cci: Document Shikra compatible
      arm64: dts: qcom: shikra: Add CAMSS node
      arm64: dts: qcom: shikra: Add CCI definitions
      arm64: dts: qcom: shikra: Add pin configuration for mclks
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../bindings/media/qcom,qcm2290-camss.yaml         |  16 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  70 ++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   9 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   9 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  70 ++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   9 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 197 +++++++++++++++++++++
 9 files changed, 387 insertions(+), 3 deletions(-)
---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260526-shikra-camss-review-cf6f66ac566b
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v4
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>


