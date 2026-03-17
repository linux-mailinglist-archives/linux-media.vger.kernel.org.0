Return-Path: <linux-media+bounces-56063-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOsXNV5LuWnG/QEAu9opvQ
	(envelope-from <linux-media+bounces-56063-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:38:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6E42AA029
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB6BC30C19D2
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC863C3C13;
	Tue, 17 Mar 2026 12:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eEVe1rbf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VxHMNCaz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7384D3C3C0D
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751027; cv=none; b=mpPNzkn2kCkFE2KLNTtPEK13GRk6676yzquLsowPc0kLEFEmgbKj7ZikQ0SOI/mYv540IGNSlXrSLsm1RPhbzQHFgO7Dt+neQvZPS5dRxtRUqwC0R5HEhabP7StTynmCkIfSBlwoxRqeGHReNM6MO2exdbYmr6adcjLPWzwufRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751027; c=relaxed/simple;
	bh=D6+6jus/li56x+pBYY+b3ZKTjJKdSYbftq5axc2thAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hF8Ak0ZFWYZeWfAv/L8nKO8i+C1pUwHbFJYemmTWlqCnJgRI/3zqw2v068GcXLeyMwLJELtFIfFK+XAITZHsniAO2ZnrhJLyImT9ZP9mwx+GRlBZhQyTm/F1X/baiGbKKl78/2/N0wvn5XmmKLDZJ/MqD6YhBtmqJoYQV6NUQh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eEVe1rbf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VxHMNCaz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7JaA13124593
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4K2m8EmkyTuCsbQro3hOXDA/sCvLpdG20NK5RUNXH8=; b=eEVe1rbfQl4RZOik
	kQmOfHy9g+KUrlgJA7nyceTXFe0TTiu5JQMZBV7XkZeYhx4eiYR5fvWu31JRsoQM
	BSsRUzV/HsH5gO8Zx4w/l3n3g0rkDC77kqZd3O6JRHBheLW24HNuYuQ6SGjkcAtE
	igNfHp2k3qDjCH5fzYQFinHX0+svqK3Rsn89vuyaZRM5tu9VBzHsM1ZdoTTRuzwA
	MRIwZKGuhwjm4D4HBS4W8d+J84PRHyYCnAJY1O+duNInxSyPxeEdzE0pAR646EoS
	4yQTFZZFy52G5bC67PKtq2uu7O6wURjX9bpzrz+WIi70DmkqCaEmg1hgG+JysvHc
	vNVLGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2fbs4uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:37:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd85e08fddso6030835185a.1
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751025; x=1774355825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4K2m8EmkyTuCsbQro3hOXDA/sCvLpdG20NK5RUNXH8=;
        b=VxHMNCazWlakG0rQg23ZlAteiuqXqnP4sYTnnJfrAGWP0503AXZr7Gw/wG2korN4PT
         Xj2qwKrD6aYQ6R5GLekvFnQ3emta6Wc85oQKuLx7603hUlNDOwDhRu7c1YUQXxnfRlMt
         dB1tSUxJvSjYI5W8CX88zpdtyWe1lzE/hDnV+m+8qsZ5Q9nCA8oSLt1X4XFzbPQTNCrZ
         oZpCD9AEIEj4IRKcxq0raclQHgkurb6+UZ12xUYQNFazoBKH6luuxoZtfkSPtKDs2j+I
         eVpLDNNgItLR2386K+MR7rUQIkoBkZWyD81V1TxvdatJblbAq8jr/Qe4nL7zGKQ5UcFz
         HAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751025; x=1774355825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d4K2m8EmkyTuCsbQro3hOXDA/sCvLpdG20NK5RUNXH8=;
        b=JD5kNFKSkLVVMSpZSh2RLkh0vkIslODvSYQhb/qqOo8reoQYWGcNFmrw66T53PBAmf
         HsAubjvw4MOtoYLSU/AtrD4FLRQGxYql0oWHlAVo7ZjzHGS9PDPqtLIm0Yrc/bUe9dgc
         tp8zf2b6t42jl1R3eWoKX6xxJYxskN7hwBUB5d/gG37YsSn+K/GJE73+4pchA6WMo+ah
         CYDO4XmL4gaBy7F6WSPpVpixX3/qx2Rcq5y+sGIihyLeotawoo26ZJ7h9mbigQGAx2FX
         R4sFPMAsZtKySchnOO+h9/f5MxD42cLfguUBrzWvcKcfPh797QZOZRA1l4+NxjWf4Ei0
         hOMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLHzB6vbYPo9NPA/A+ZFuv08M+lLhV0ojad/BrLVSzamlE5pDnlsetRzn3Kzzgjae/v2NdYbmeofCkDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrk6bG7RyEweLuV9Qtrd7mkPQS944xA3H4ZWimyiZrdCpLO6zz
	QUtRUWCqloUS8K/GWJWBVU14/x+4MiRbOI8/EUUpSexJ6ENjUuQNaE0McTO0VCxvYVL+qwmVr3c
	hlJhU57Xo2EYnJt5LI+254eN/VhrNbsf63lg0tGaTKDAYaXuxccsLwPP0ZWWfx6iblg==
X-Gm-Gg: ATEYQzzxQSCJTglPa9pmKuZWFfgngeIXhxyHHvx055cIzIndbcC2xuWMHUtR8dGvpHO
	JuS86qiLvfSF5xlcibCkIxFjgN2hCke5gI1xfidFs9S044Y1j/SIkHprJEZ4wws9z+o7rdc/BiN
	h0x8grxIdrt+ld4JkVUv84/u1UjLDYjg0RTDEHMhDTJEQjg6M6j73wfYNforTXcwJsWbXwbzOMn
	BjW4a9arlbCDDkGUa2L4kdK8RGzjAR1JFjdtmSvbMnJj8k0jyeJeE+uDlO+t4TX/ZcQwzeh6Jl7
	le0CdgxZhT1/wswSFOxFaZhx6AYOhO4e49PVcknMa15HSDTKaTq3NVAyO6hUJqy6MtadVqzpyw0
	axwkq2EwY/u4dvjjNHXDlX1/GX6VpxntsJbK/0xArPipw
X-Received: by 2002:a05:620a:2590:b0:8cd:8938:eff9 with SMTP id af79cd13be357-8cdb59fff5cmr2252383085a.1.1773751024758;
        Tue, 17 Mar 2026 05:37:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2590:b0:8cd:8938:eff9 with SMTP id af79cd13be357-8cdb59fff5cmr2252376985a.1.1773751024311;
        Tue, 17 Mar 2026 05:37:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:36:50 +0100
Subject: [PATCH v3 1/5] remoteproc: mtk_scp_ipi: Constify buffer passed to
 scp_ipi_send()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rpmsg-send-const-v3-1-4d7fd27f037f@oss.qualcomm.com>
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=D6+6jus/li56x+pBYY+b3ZKTjJKdSYbftq5axc2thAk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUrnOx+lHsgQiNOkTmEDx+3tpumic0NjHLRS3
 KqB60rCDL6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK5wAKCRDBN2bmhouD
 1y25D/kBPvJvGmbh87Tm7p+4o7yQwfwul6JXdr5rhanHpwawDTxECRfEZQro72/xuExaXTi0NW8
 +ogE9W9d4Nje8UndJGvSCSMqdRh2SbV5JAm3KM/4glNysoCAkl0Wzq33oKSyOSb35g2KfmdZ1Fh
 3ZIP3sFnZtuGlju0BnpbXgBsoZSuYJzk6DNo5jphcPjy1Vv2nySE89AUID12M55fqJlwSFsboJZ
 nOwz2Ilyj2Ps3B6pVrwgsP9o8zimsmF1C3y0hQD1/UL50ojAde+rY35dZ9o4gdK3K+jbATigoYd
 t2hxRXshbdtsSxuwFn2NKPOL4k07JHcpJXjHzvl/ED+1hO6zKT6oeGPh452/qPhsfp+WX6VC1pl
 rNF8xXyToTlmgqPC7c0Fh6UvYgNQQz5pkwJbssWoSrqV6vttgXutrbVOUVTqAVPnlkwtGxLGORG
 ouDPyNqRbc08FxOryo3mAkJojtfOgGoZ+D9r4hZOEUMZnFC6yi0xAVLyj8dcmlg641NoXdFeDhR
 1eAOnHfpMylnUdbGgV/GZsGefNVvEqndiDTGWt9/8aQIIuCkfyIBgXYwIvCVc5QNLItPeVO/xVb
 kfR/E7hD+CEjP7vN784wOEsqW06CK3+iIsKX5jBjmvdf5nISIEOWMTvYl7rNgl2qYuW4nJMfu8c
 scpWzdKfIwpCTbw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: ta_yy7c5-LHLZaRaeEeNt_73MP-E_QeJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfXwrTGh0ra28rp
 JHOPZpl1PO1HX7IHQDnCbj8JcanjhMXtZODGxM2kIW9I6CO6BL7xAX6rxQPK+TDTZGMUkzpyiyI
 k/0aVugvUseCfcklh9q01chFSKKeibwvholFakWn2+Ef5ageAMqGQUdZ5VqM8OMIFnsfQ9iW2Ha
 fnpuP8GyI14Y3yMb4jeaDEE+Q+rChRNdT2gIq1LVPiOjyew0Asl4Ss8M9yJQhcFOPivfxANEjQ6
 iPJa6PPGS5YG7vTwHN5tISiBALgqtDY1OGJcSw8FVsIN/pAMk7cEa76y66J+hlZZvFu/Pqagvru
 AasLNMUoIHySmq0qaxQJKgmuRqIB8V9YWAyJhpyl6phBKrw1Ud6hBdrZqq/zyEMr28ykbGG81G0
 CwqKn51qs6ohskLPxmaqM/eT9ol+8yIFOaAk0oBbbnNsguJ7pm3Hdl0dMxx3ZqK4I/zdX9gjsAz
 1cX0tkxjzutPIuMj2pQ==
X-Authority-Analysis: v=2.4 cv=fa6gCkQF c=1 sm=1 tr=0 ts=69b94af1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=aY2cFw3b1D9xo--RORcA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: ta_yy7c5-LHLZaRaeEeNt_73MP-E_QeJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170111
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56063-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A6E42AA029
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

scp_ipi_send() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp_ipi.c   | 2 +-
 include/linux/remoteproc/mtk_scp.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index 7a37e273b3af..ee2f1121411f 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -156,7 +156,7 @@ EXPORT_SYMBOL_GPL(scp_ipi_unlock);
  *
  * Return: 0 if sending data successfully, -error on error.
  **/
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait)
 {
 	struct mtk_share_obj __iomem *send_obj = scp->send_buf;
diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
index 344ff41c22c7..4070537d6542 100644
--- a/include/linux/remoteproc/mtk_scp.h
+++ b/include/linux/remoteproc/mtk_scp.h
@@ -58,7 +58,7 @@ int scp_ipi_register(struct mtk_scp *scp, u32 id, scp_ipi_handler_t handler,
 		     void *priv);
 void scp_ipi_unregister(struct mtk_scp *scp, u32 id);
 
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait);
 
 unsigned int scp_get_vdec_hw_capa(struct mtk_scp *scp);

-- 
2.51.0


