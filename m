Return-Path: <linux-media+bounces-67450-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KWxaNwuwVGr3pQMAu9opvQ
	(envelope-from <linux-media+bounces-67450-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:29:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DAA7494CD
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:29:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=d+ZsdQW+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UtVC9AWO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67450-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67450-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D1383033D10
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A3A3E168A;
	Mon, 13 Jul 2026 09:28:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AC63DEFE3
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:28:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934930; cv=none; b=ukdhABwaVJB9bzaqJhZvooDxUxVaMhAxgDZGmxZRSZiQeRddSVOy2SbxbcAv2W9eaGAiBz3C+28RqXw8jS4OYTp+sGk6dA78rb925Cv+fnjbG+dR7joQA8wpBH54ppnEpoVDOsTlPHRAfMMGrRdJwc17ZIzJZTv30hqJ5qEPsa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934930; c=relaxed/simple;
	bh=PuN8ENYNOK4zFEX7iR5tP4Qc4qPqD1yrqd+US3xeGx0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bHIE1Wc+gYyX3Td1hUM5Z3aW/vO82lP11t9X+HRV0K/S/wgGDSlE8yCRURKdYvBTWuzzxEJDejoD9BjFgWEgWAVDt3ccga3N3ZddrFLVCCXHpFKHexTWUyvB+kw1VGUE8ZEnt7OqRR3dK5Q/Xt0IS1IVZii2PmLIjVXM4+4DGGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+ZsdQW+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtVC9AWO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NkCe668646
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q0wnSw6IM70ZatIRQ0h/nF
	SD5yzhjm8eQKBwsFtZV7A=; b=d+ZsdQW+UAY71hYNVEJ643lTUkZjPviGbuF5op
	k0sEWRytegRpGwtK9ToTMm7Dz9hL3MCKu/ULcWKIAjCI6Nak9Fke9FpxK05xy7Op
	12SUOXu2GO2cYp4hlF90R2u2/z16pC8CPZzUjo95r8sG30urqX3iijmeWSZX8T7D
	KeN9lL2hSHgaFifpHC2o3b6TJuCiLFA0dvsP11Yb6Yj0qiRxC2i079ldTVBZUnoP
	alKO6zA21PiXRhWpO/HGC48Ym+fqE6bjiW1Mql6Gs4Q2IpgIFjf+jYDTgDtIF9jH
	3fg1gm7d3v5/q7IqAouL/d4iDlH8rix+HL7R15/Kd7S6lBhg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm1vc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 09:28:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8483e038efeso3256781b3a.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934926; x=1784539726; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q0wnSw6IM70ZatIRQ0h/nFSD5yzhjm8eQKBwsFtZV7A=;
        b=UtVC9AWOjCmKwTp5BLPPuMzLGvHQXJ6dkzfvQltuumVZVWL8DRJmDd/9DdYSwAotUx
         FZHf6JeOiBOP+sFuBLj4zqGSYrC1YtYk/LIpysput+N/Yfg6u6vbbdXNnXT7/YqSZT/w
         oRYMzm+36cmsLdtYrYTJntliHO20IyOnnZO+4vyfU9IVvS3YK+T4i1fzs9PO94zsekG2
         PVoIYE5sIi0sbx6fJApUyuYAIl9C9WdxzDh0R382LFC8ZfUfFRmrja91g3Dbf4rbMMMj
         H4GX5hs/lLGL9a8EOgqBn02p8vA2QhxhY+MNj9lntxui7Vcq20jA78k8kPNiUK9kt7Kg
         oUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934926; x=1784539726;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q0wnSw6IM70ZatIRQ0h/nFSD5yzhjm8eQKBwsFtZV7A=;
        b=buU1EleVVm4H85brSXBNyJQjmo0RPmpcDsNwlcs0lMfHDtIjqa6/EdHjGlOuo2tm1m
         XuTbXo+U1eASF2w2F8wrgMJKSc91ryi+6Cz72rZ+6PUxIcyUeQ4w5rcyLyE9Bdr7UMxo
         g2owVm6jBEiPlACvg+P9zLPc9acc5bQXJ3iCb7a0MCFO9v5ohcobIgyzEDlIe0uecSAM
         +fdws4c2qLDpVyhwlCtIzpWBZsqtqrF0aTU/UI+aOdTyJZ1ymwUwmNY/Qg+c7JUTyTXq
         9K3dnxGsj5WRpt2oNm9MJ7sWFdwWglVdkRW7+r5q7n6JtSi/TGlDLv4QkZ6mLAAAgLw/
         sYow==
X-Forwarded-Encrypted: i=1; AHgh+Rq6ocmP72BrH0prKgLYQPKKZ/W5fj3xLpAq8H/l8Py4TPVYuRuwwMsH92ewPsKHXHGrXxiTce9eLWRMRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuGfWD2OZ8eK6U9Lld5WdYRfqLX9hIaW0MO6eVTYzvgFdcYNOZ
	MoBEArD3ohOheatsOEQRtJBgE5XHAihKrce8FDltJ4MVlwV2ZKj355bDSjgKincs2Tci2/e6B8A
	tIg+gLxoqMroD2RXuw06OvT9r/iB6Xi2nQrA52pwCdOfd4+KtxO4KyWFyj7f6BpkI0w==
X-Gm-Gg: AfdE7cmiviG+PqHXRs2z31NfrhKdsNWc7WBKpdgPE1rQ6nNrBW4e0Ww09mKndqovuGg
	uG+BybcBWP96jw4lj4VcS8zoD117jPUYmsxuLfRDQgb0X+JAD7u8xXgc20jTyvcnt5bS8AR99m6
	GD2c8UkOBmPRgphheMpjiKy6UKBZX4DCC0vrnoJVPiENBXHJrYreZzEbbrwFNy7GrGLVE8M9qFn
	tahkY6yRCB5roujOhZs0pW4mwgvOXKfRA8tHkkgFK977r0qixbif8JvGNSeKlYVsycfV4SsqKYT
	ItWW+Og1mq0jo/JwNRla0IhQWe5SvfDNQtDDfDjhSFAqra7G9Bp9GhC0FrBb3pzXEFR/iyr84pT
	Kr3EPMBBTuaSFVlPiVkogq6rY192EBKqOoU0olfDgkw==
X-Received: by 2002:a05:6a21:648e:b0:3bf:80c9:6b3e with SMTP id adf61e73a8af0-3c1109f717cmr8402575637.30.1783934925910;
        Mon, 13 Jul 2026 02:28:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:648e:b0:3bf:80c9:6b3e with SMTP id adf61e73a8af0-3c1109f717cmr8402553637.30.1783934925471;
        Mon, 13 Jul 2026 02:28:45 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:28:45 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v5 0/6] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Mon, 13 Jul 2026 14:58:31 +0530
Message-Id: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMCvVGoC/43OTW7DIBAF4KtYrEvE8DMmWeUeVReAoUat4xoct
 1Xkuwc7i3ThRN2M9Ea8b7iQ7FP0mRyqC0l+ijn2pxLUS0Vca07vnsamZMIZR6Y40tzGj2SoM13
 OdGn4b+oCBkTjFKIlpfmVfIg/q/r6dsvJD+eCj7clsSZ76vqui+Ohst7XKBoVhASyvG9jHvv0u
 35qgrXw9P4ElFGUquFOu1qZ+jiMcTeczedyYlfGyk78TiHT2xQvlDOwF2gDcNgf+5w3KPGHArV
 NiUJp0EJqCFI37AEl/0HJQllnFTANtVB2g5rn+QrMUnlzzgEAAA==
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=4511;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=PuN8ENYNOK4zFEX7iR5tP4Qc4qPqD1yrqd+US3xeGx0=;
 b=EKIr3fC4K4hhA9EAn48PYmRKnOCL56cBopti13qR6AQU4CmzUuuVy6UWePcII27pGzhDh20fI
 UycOoqoIeOICfIByBVGqXJqdTH1mDw6i/FM7OrwttkHWBF5eRfn2avS
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: QEOeI-flc-uI4zD3RZp9vjaXVySYJ94h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX1nbgPy8FWSFs
 Y+m8aXUhtv/307diLWqn0KhfNxwnKohvjdfP/4YQO1ZWbBo+3AbByUkSwIIdaL+mVYso2tkWoa1
 h8RiAxcL2HUBFPXV4sBPw/W9EHdf66zEJt97OURYMlYHXFBwgI9P/BKVxIjGyZSfJsu3rCaVRSQ
 ELjM3nbt2JtZKcaCbPhyLBSsmWaL8UhfGkGsRrFYwafwkCLlG5r8kfhrT19Wyp2hXZQN1/R1H5F
 5myjKyUPb4vrEVauD7RSbjlVqqlrRM1nQF5d9vu22jHRJCt3IMxkKTWwDNth55E3vST3a6XjlF3
 NE48M61DLQRY24dq84e3C/F1fyHQ8dUWOdtPZ81xWzUEstcEB3CuDgmgKTihAEFxhSFsGKhvot4
 2sv+5SUyTgiqVzpJK2k3ON8CDbh0jVEFuI1JxF19HgWdjswJu3kEmhc0nQCVNI0VAau/TQwEsVO
 4JVT6+2NvYpBD17ZBvg==
X-Proofpoint-GUID: QEOeI-flc-uI4zD3RZp9vjaXVySYJ94h
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54afce cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SCY8RljC4g58VSpTV0sA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX6KmaSv4XApz5
 wDeTeyhXJCd8UVNeBo1rk9Xqb5+mnWHQiPSs7xkXbgZSlUgzAPKUa/o+v+EYXoO0dotFX2yygj1
 y2l0uuEcN3zUVTzi6DMgf6N2jV84/D8=
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67450-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url];
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
X-Rspamd-Queue-Id: 35DAA7494CD

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

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v5:
- Rebase on top of linux-next (20260710)
- Drop dependency on shikra-dt series; now in linux-next
- Drop dependency on shikra-gcc-rpmcc-clks series; now in linux-next
- TLMM pin entries roughly sorted by the pin index (Konrad)
- Link to v4: https://lore.kernel.org/r/20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com

Changes in v4:
- Fix data-lanes numbering to start from 1 in all endpoints (Vladimir)
  Missed in last rev.
- Link to v3: https://lore.kernel.org/r/20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com

Changes in v3:
- Drop dt-bindings: i2c: qcom-cci: Document Shikra compatible; already
  picked by Andi Shyti into her i2c tree (now in linux-next as e3a8f8329397)
- Preserve blank line after compatible const in qcom,qcm2290-camss.yaml (Krzysztof)
- Add blank line between iommus and power-domains in CAMSS node (Vladimir)
- Move cam1_reset_default pinctrl state from board .dts files into the
  mezzanine .dtso overlay files (Vladimir)
- Collect Reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com

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
Nihal Kumar Gupta (6):
      dt-bindings: media: qcom: Add Shikra CAMSS compatible
      arm64: dts: qcom: shikra: Add CAMSS node
      arm64: dts: qcom: shikra: Add CCI definitions
      arm64: dts: qcom: shikra: Add pin configuration for mclks
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay

 .../bindings/media/qcom,qcm2290-camss.yaml         |  15 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  79 ++++++++
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  79 ++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 198 +++++++++++++++++++++
 5 files changed, 377 insertions(+), 2 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260526-shikra-camss-review-cf6f66ac566b

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>


