Return-Path: <linux-media+bounces-64891-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +CmWMhK5L2p7FAUAu9opvQ
	(envelope-from <linux-media+bounces-64891-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:34:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E30684908
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:34:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Oq4d66CB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MDnfBTLh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64891-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64891-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 451D5301A90F
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 08:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E823F3CE092;
	Mon, 15 Jun 2026 08:34:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160193CCFCA
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:34:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512455; cv=none; b=UTphACRPPZ+y56ymQKJw/cAlXYc/t4CZXE+Z/1chNXK3ILAlteDoL0uC86BE+WO7dTbfYXXvtMKhoh7FyzTMH7WMs4lYgMSaYIWxs5KM2EA5/86pFOWD2XOhmHZ3oYt7TlXCpAbpgOSIBSV9nToDOUFHRfSJ/s/idJMhlWM9++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512455; c=relaxed/simple;
	bh=g58ufgvkhduxRPaecFV0Yc1onZng4TUfPFKHjRrwmD0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BDjJpk72YPGExiZ/AXofwPSyy/fyFnfF6EcecdnmEgG9Xu7fuklTcqqypsxxWpKp9DOXtcuyvzGI3dkboCqch3G0FO9jUjgGDZo+65eOctAGFKTlaWErKZ1TFyhvnMphcXcvmJAlWZB991R39nGWGHK1hWjtJFEIrUjWO33JC30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oq4d66CB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDnfBTLh; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6K9iF3692490
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sUbn6Jgp3v0pvFlFI/aNKH
	2XE/o7/MSoFt7auzr9ERU=; b=Oq4d66CBV2iPvoTEXcDyAfVAV+Q9kriY3HVolx
	cRQawG0Bzat53M9d52A6pUL4CzG57vsNliIBS4jc5BsGYDP3lnXh9hJqK3Zv4kWz
	lKAIO6meuHyg4I8sMpYMm06L88vFo4C07QmL7JYEshTIHixQUUM5z2TQc5qEMQiD
	aigJij8DwH+98805i8plisSlAkO3uNG7KP04flA2iE8GVACTr/jeqa1z2a83V0Nj
	al6JJMCh7ovwaeg+pE+ck7J/LdG47a5qwHPhiJ7bHQV95x2V6FTAEeh5fFxkgC7b
	Zvsr1kMCJfnviWCAtFVNQ4Lxb0YZkYK9aaS3O8Q1Bj9xhYIA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk6ec1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:34:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0bfcd629eso37088565ad.2
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 01:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512448; x=1782117248; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sUbn6Jgp3v0pvFlFI/aNKH2XE/o7/MSoFt7auzr9ERU=;
        b=MDnfBTLh4Ty60e6tiLqGhA7+s0bHZ+732Sxwr4Q/EB0aemtgFf6In6M10fhhjgvtXy
         3ZP8yVnmW9TGnfpyARr03+idifUDGpikebhOljYIrCzwpHJfWmqnZmcRTOmUJwWbb74M
         bN+qfJ2ryBI2CYZ1ghND9D3Xxvm2a8CwKxJ9ufLuyuHH5oVhKAIIkw8eWEk4a5B5/PYD
         JX9bDWLUYqhQfHefUFzPyGFxqpvz9aN8Tt1PteAHw65Xad/lhZoB/b7RZPDL9cJ/AGzk
         6OYUpbrIM7bQK9WeuBJbvRy9UJ/Kg1ODsKzkjycguJYEOz5TusRa4lMA9iCaVdHTEydr
         Ypwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512448; x=1782117248;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUbn6Jgp3v0pvFlFI/aNKH2XE/o7/MSoFt7auzr9ERU=;
        b=lE/DM5Svpc8pSIXPXPORAxVIKCCjuIPSY9sbQlWXpknPUxnCGrUU/K6708+ZiATQxr
         1DiiYe3drAavzVjt+MzFnbyDYVyMZnayvhFQMkrX1z1fd9Q8NpEuliSwh9apKF+uD+M8
         lUeIdkWuj6oGJP1A0/urXiwUpyd4sazME2f5TQR9HNzLPcu7tVtc8xW5xQtTb7+Z8gpT
         JLq0JZ3w4yk5/0hv4eWiM0837LXQq6/N95xK0l8bnELFp2QOAGseNIECudl6SQVFyc1Y
         0zmU080BwoToYmagqKHfFGJAsjXQivH16UPmdp/v/2DkLUpfZEh7JZIyHnYA6rquFKlm
         D4Mg==
X-Forwarded-Encrypted: i=1; AFNElJ+fkv6RwB6HOxZ30pHjsMusIngnwUsvh6uQtCL0FtQ/9Yqt9PouRwd7ZQTDcFuuCJc+6G03m5GVw9GUew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQuTqACc4/6XNmzE2K5G3RllhiymiNitjqHOUzdY74VO7HqmEE
	gWsfSSzsjEdRE7J719dfok0iu1tsdyhNhaV1SoHSi9I5PbJjZBUBFKgclQ0QFp4VzwQYc2teOdA
	nujUkFcoiL4i7sTGUj8Ffhk0OFGs59Cfel2dluKb0Ue/hSoauKvLtiXcgMkWbPEj9hg==
X-Gm-Gg: Acq92OHK13l9Lt4zn0xTDlCFyOYxHM3mIJYDGv/eYId04ZQz6EdyAreaBfIHn5r5OEN
	6Z925qiWF5P4PlqFzg6zmZl2BU66Zsh9l2Q65McNhK7iZqWu03p1y+XMjs02u87BVlSq+Gn+7mj
	K6P3kFY6nwBht7OhEdRUlTdawGWeBAKu/X15zHWSe3fZ1A5Tb/brwz5hT80XIOZhRO+O7Bjj5bx
	9LZFuSA/pOyesUqaC1bzW1bOLcWYQdhjFBTnOxLoElMzYRWNcDPiSEabtfdZJ0yRKZGJxTvYogI
	9EGD43mhwI2eGoSNLHw9TFRyqR1prY9k3d0mJCdKZznGqsxMx0FwYfKJ2sR7t/+Okkz0hUrBdVS
	7SnR/fBHuaxaqmYJvTbEcWUXZW8/6MpJqXLmGNuROXcDTpOhP3VZ3
X-Received: by 2002:a17:903:228b:b0:2c0:a711:534 with SMTP id d9443c01a7336-2c6641baf51mr107117765ad.13.1781512447705;
        Mon, 15 Jun 2026 01:34:07 -0700 (PDT)
X-Received: by 2002:a17:903:228b:b0:2c0:a711:534 with SMTP id d9443c01a7336-2c6641baf51mr107117365ad.13.1781512447201;
        Mon, 15 Jun 2026 01:34:07 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:06 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v4 0/6] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Mon, 15 Jun 2026 14:03:53 +0530
Message-Id: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPK4L2oC/32QzW6DMBCEXwX5XEf+XQynvEfUg/FPsBJCsAltF
 fHuNaCoOaBeVpqV5pudfaLkYnAJ1cUTRTeFFPpbFuKjQKbVt7PDwWaNGGFAJAOc2nCJGhvdpYQ
 Xh/vCxoMH0EYCNCg779H58L1ST5+bjm54ZPi4LVGjk8Om77ow1oVuHEiqeGkajt6D62KLpfQVa
 0dsS2mrUkgBAupJ7BkEq16GszE43rs8zfWSMCOVcNZ7zxtSTxIt17UhjX38WV8w0fW8f9tOFBM
 MQlpmlCmlLo/DGA7DQ1+XQoc8VuzE/lBA1D6KZZTRtOLQeMpodexT2kHxNxSV+yieUSp/USjqh
 bJkBzXP8y/efcnn8QEAAA==
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=5223;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=g58ufgvkhduxRPaecFV0Yc1onZng4TUfPFKHjRrwmD0=;
 b=yXSiR4DbCVYmsZXuGQrYPps0MeF2uwOCsQUdOCRyxhXzorsLJA5Xtphe6+cf9MCN67bqzY1eq
 24glSooIVEfDavBBtTw3ltu9b/Wr/g6UUlCWtaeNxu2/U8RW2OjiDeS
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX7f6+l4prWyMh
 anQGa3v3Dkip+RPhdGVupiXNHOoWIjfeWOtVV4chdfiVZv0soZYqmGlPEb1Z6cjO9NEFBueCgDi
 mb19tYla30dibYm9KtWzsOXlcD4p2cs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX4rffnWBgQcCh
 MZi/JQKWFSlDry9g4A+Xf5iDt5KNIyLREVOPv4Xz5nv4tUKiyUvONJeMPirFNuPyqCRV+s4A8dE
 XAmaNbYUhahtaZq3YWwiZzKF9J3e7HIiS6VOgoaS6ikR2k1Qxf6ZNq3L0qkUAv6+m50eI6gysrE
 euABKt023Zplgga2nWS6L0u/x94/Fg1gyvoQ5OXA+EPXw6EfR3WpZ7LBKzUYRPNMNuRAPK7jh+h
 gjq2WTyz/a4sch1AsCxnB3RZMGjBQbUpDYqgrzSL//NCgdPlUpu3zeo+v2FsDnkb7Rx+j7hWAyD
 4fLnQiFDZrdQ9BWh/ra9qNYllC953Am3nBG8EvFFVyTN4uxI2nKaK1TGCk06E9yGn9ZNkVHSI/T
 DyQiNoxAbCm7A1iVFI6xTF04vLngvjDG94l5wEnJCLOvELmiWtRULZuTAAeSwW1BZUdDCr5JN2i
 327ydgU0Lmzf5XohmSw==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2fb900 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E40xv7DK0V-5u9Ck0vwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Yfl0Ml3RSW2kogSge7AdZPtsDnNEw2GS
X-Proofpoint-ORIG-GUID: Yfl0Ml3RSW2kogSge7AdZPtsDnNEw2GS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64891-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,checkpatch.pl:url,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 54E30684908

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

The Shikra CAMSS binding patch does not depend on the rest of the series
and can go through the media tree on its own.

This patch series depends on patch series:
https://lore.kernel.org/all/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com/
https://lore.kernel.org/all/20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com/

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
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
base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
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


