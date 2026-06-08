Return-Path: <linux-media+bounces-64195-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xHs0JsXOJmqPkwIAu9opvQ
	(envelope-from <linux-media+bounces-64195-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:16:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F336570B6
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:16:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lDKnJ3kS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YdsQCAwc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64195-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64195-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F401F30C55FB
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 14:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B0A3D3D11;
	Mon,  8 Jun 2026 14:07:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589453C5523
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 14:07:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927669; cv=none; b=FQWSTLBAmHzNDftfjA+HPKOs7twcqGfahtx6XAoP2L6LwDLXLDJk0PoeQSeAlOTXnpwxmBr389iVnhqF87Lg4iXS2PQYGr+UpPrLxhC1ghb1qea04V9DvLuOEUMJyMyNwajWBxl5WyYfBkn/z7PTLpHvwjTnwx/ugWPbOVo5DFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927669; c=relaxed/simple;
	bh=A0s5+Il8ZVmbH5Bso5yDr6ndaAOTDuKArql6IBzS6b0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pB96ZMah5TPZmzOQZkJawBHdHtSFbZUspC+H4zMfWI2StFrh0FA9NFjGXQCQwESxLbjHdWDst9NISmDgTZ9GLuUdXc0uYQ1JQJTIieBBBlH+U/tYMBNkNAeZH6F0ew4e/5Ro4PctHOohs01SII+1aIn9lO24i0m/z11BZBZR7vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDKnJ3kS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdsQCAwc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRODb3271945
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 14:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uowIbmQnqqTqEZNIE5zF312ZxkTUFs3Y6T+ij+Tr/3U=; b=lDKnJ3kSgJhbfbqt
	MNVlv7Ls73L2WU+K2WCuwEOle4vBhZgNxJsquGcD3Djl8ylUxfqZdz+JZDz7c+BF
	DPljUoRAVIhn/ZYwRiCcHA6wZgVr9tiGOp0kwtGXYiIIHiWbGKmDAK8/CwYKL28O
	McN1llrjJbxIthWUjBTpBva5foQ4LuqSzh8QH6bQYCpRUpvqAhDOR6l8hChr14vS
	4y9jl9kWgg8Cc/OcksYDe6vXCWgQ9HovNzmOMc+niAEIQO4HZVnHLW0B9UkbJfuj
	hH5d/wdMrBoDqRpXCmHmpPbB+T4+26oxQf3aceeNCGkUrcuaOot/haLykNMNZ+R5
	gH5xcg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrksawk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 14:07:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf335549b8so68578745ad.1
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 07:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927667; x=1781532467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uowIbmQnqqTqEZNIE5zF312ZxkTUFs3Y6T+ij+Tr/3U=;
        b=YdsQCAwcyDFNiyM2bUR80oOqGDB15MlBKzA0wzr6T0nFeo60zzK7btdO3hsn39BbPU
         MzPr1U58QkH6zSo36TiLzL7byJTjAkuHspZWF8bJIU/Npm3dP9WPmtP1gB0MJ6rJjKvw
         VLCrV52cnsPOys/A3mI46XvMViRVExvlYj9gipTi0l122aSGOTFSmXakbUxL5b6CEAVa
         Lliat7YTMP3s2TIR3gc1Gr6Mqj3a+bThCL0i9C6D8yyqFXH5ymJleHpJtcrqyzoCKIHC
         NGBzApOlQE9WWRJynlmymZNpZiGmxXzpmi7QnH7ufVW6kWOde/KDTeLQu3UUxDovGu6j
         N1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927667; x=1781532467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uowIbmQnqqTqEZNIE5zF312ZxkTUFs3Y6T+ij+Tr/3U=;
        b=i+tISbQfxRnnEByGXOQPT4qZRTFVQt4NBwNupvuv2JVemCfsMfDj2H5AoHXr2E3la3
         D0ZZdVgkfOSljP4+whQIl/2TdK893Qt+eY5fI2ku9pETUiXjeoeo0ZPqwEsXrcLrS7v1
         qXLJrZ3YN+lebw+QX59ugujXNxH/h8r4i/XLvul7lpzbVS2ydplEnRRjNZPyuK5LVvNq
         LtTrKskvrb744682cDAOCZg+VeTr/5ol8ixX354h3J0uA4ZnXOwQePUBu4XLsSRbnqfQ
         gv4PQlhr7Ek6tGunheHMK/6fwGXObuWexUbIol/haLxidlGh6UfguzmcJZRSFjmvTelN
         Nt8g==
X-Forwarded-Encrypted: i=1; AFNElJ8erG0bbbK/n7FABn91w4uVbtbfZ3LnInCElMD5g64rQX0nXBl9VmHte8fMwVPiEZX2pGx3LUS9RdepMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypZyOvB+4nNISL9TQegnnb6t8Ldhr3/+nR0x2jEHxCK8xr2bEL
	ZqJdEMRvPSH46PeI1Mj5bzEXViTC+6HzBBGbGzUl6Jsf5rHW42Gzr+WQ9LHuQTS6LBlJq+aHXu5
	8aTf35f0G+rh8RJqQwPg5gPFC5Um0NFs+xv6DMuj1c6xXC1YM9orDjOcJzlbkWGpZBg==
X-Gm-Gg: Acq92OF/9cqU4whjZGQmleOi4n//W5kQ4Oz8lyVLykk0OUGxNzm2oxpu+UFuY9OFU0Y
	qmdAlJFckMjPU9lMtnhr9vChe2/Cw7HBEiazu5so85eJ9RNBOsVVz+Gv+LXpOiJAc/bt0jckefg
	rfMYtlKm+8J2kLT93VzxDsSwW5slgN8/AlYE+wAH7n5+6tRLOH1th0Fb9hEYa2mvhCzXKIOseod
	tULoSeAnKFbS7cy9y9GK0nCNPUijJ6UJYzpnor/WcSt9FegztDEBKJaZ0z3WRpq7uW2ys/owv5a
	l+bWu4pDUMjbdct+H30yT9glotq5UNsljqvDZY1ODVMrGgaMCgn7pFQScBrfhbH3nrjCTcc7811
	RG9fT23PSzaSj8iAKrkhKz68+Z0JdC481l2eBydRcK2NU0fF1gDgX7+Rfb3781/c=
X-Received: by 2002:a17:902:fc46:b0:2c0:cbd8:5ff9 with SMTP id d9443c01a7336-2c1e8209a20mr170708485ad.21.1780927666838;
        Mon, 08 Jun 2026 07:07:46 -0700 (PDT)
X-Received: by 2002:a17:902:fc46:b0:2c0:cbd8:5ff9 with SMTP id d9443c01a7336-2c1e8209a20mr170708035ad.21.1780927666352;
        Mon, 08 Jun 2026 07:07:46 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:46 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:44 +0530
Subject: [PATCH v2 7/7] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-7-ca1936bf1219@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=3961;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=A0s5+Il8ZVmbH5Bso5yDr6ndaAOTDuKArql6IBzS6b0=;
 b=PCkywFV7Ad1LRXpneXA8MnC0iB+aPRyZ0mGEDWhbytABVjXWkm9rSmmQUKCE2QhjynCeF8zXu
 OKdXzoaI0E7Am0/2XMN1Hv+zsuifI5Kn6HZcFpG2wL1M7leJZQ5MguD
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: djklUN1qEIvllyjl0FstRtiOy0smY17q
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a26ccb3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: djklUN1qEIvllyjl0FstRtiOy0smY17q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX22IaAtwKwXrd
 E93/imYWUKyR0LS7tzrXOvJEm9m+p7i8UPNOVuA5c9WJzNtU3zBProAQLGnbyPUTPedIL7vfmkC
 m8ynaz3B6VEX5x1t7B3eSQIq6Z6mHQuZX21vNer9DqV7QM1gnWmGNM3eVxF7jS+cXKioQdTaVV3
 cPiJBDju3im9fbjTOuJStHbYDmzJ/5W9t5wvuTPiRleYOiHgS0g2wxbbXNU7sdyB3sE1gJhOQEQ
 TKwl1eRcktcUL89OXrP9U7TLnv4xxje/ScpHD7YO5obe1QS5T2CP4r+EsNslbLCIQqaLAufzUCx
 w1H8TNpuMFjiS8LJDERXS3vkpIPScNP7ODP6ztzB9UTfb2jPDM8vg6n9gv1EhP6NeqR9ovEutYs
 S1PljOBKgXiLiR6/CQyDHXm0LXBZyLpkudhtyKTzKnQWSmOXT19XdlM/2OEFSkHfeJc+qMBtNnt
 HvTTKGRToiLvFE+OSnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080133
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
	TAGGED_FROM(0.00)[bounces-64195-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
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
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36F336570B6

Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
different CSIPHY and sensor supply rails compared to the retail boards
(CQM and CQS) which use PM4125.

Add a dedicated overlay for optional IMX577 integration via CSIPHY1.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 70 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |  9 +++
 3 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 76b8f144983827f4905a72935e8d5291a227dc97..09f2318d1c12c4239a6a7bac4ecbca38eb65ffa2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -340,9 +340,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..340d6303adc6e1bea55f1bd0598175f0cb269737
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
@@ -0,0 +1,70 @@
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
+	vdd-csiphy-1p2-supply = <&pm8150_l11>;
+	vdd-csiphy-1p8-supply = <&pm8150_l12>;
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
+		dovdd-supply = <&pm8150_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd7594206f0ac54957e0af509fa365f54..811fd5da4af7babd412d70fee84434849846dc2f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -38,3 +38,12 @@ &sdhc_1 {
 
 	status = "okay";
 };
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


