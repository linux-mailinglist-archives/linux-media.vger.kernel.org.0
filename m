Return-Path: <linux-media+bounces-55079-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJvOLSP/r2mmdwIAu9opvQ
	(envelope-from <linux-media+bounces-55079-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 12:23:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A92324A8CD
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 12:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9E55303A3CD
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 11:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1C33876A7;
	Tue, 10 Mar 2026 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXC5niV/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JwSLXJtD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E580B387587
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 11:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141771; cv=none; b=FHpq/f3n9jqzc0JUjDhdh/R03F+9B7tC03Zr/1QoHXoWmeHQtf2H7Nj3h+LCe89RtBbwoaH2sb016C3DOVcN2S2BSv1kW1cxIrOmQET+5igG7mY1glzzfYvq2lQx/cFk737hQRqopTivmZB9bMqp9ShS8vwHzvQSzAkQR6RT7IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141771; c=relaxed/simple;
	bh=4kCGFUerd9XjwVun1nTUlYZGlcZap7SHC0pIvgPDfIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDQ5q0e9sYUBDLiKSn+jG9wqrOou3wVJ1FJ6dv/GbWJ2BcUeHN6F5Hd/rXnQd/Cs8oJIkx3RlWsDx5uR2ITRd+VjT3Yglvsbh9Z9IUkf50Ee/fhnoahj0sSigOB9pbPCwiO3uleuJUh6v2ywhwZLNeYTHgSd65RQEQ0D0FFXW0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXC5niV/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwSLXJtD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8pl9f3690891
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 11:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	20kNf6AjJi8G3MZa9GHdnqNbJyccoW/mMnIokY0W6ck=; b=OXC5niV/J3he/RXV
	HBpr+nDe8/aemQ6+BeRrlf6BTUhi4MbRlVL+gBPWo27/X9tFluI9FqmHL7mPKE4o
	QzY9Xkbb/ZZXBpBnn1bYiEvPn1v87+aiP0rNiRGYdB6MeAwYwa0i0BBG+FXky8E2
	1XO6IYq9lwiKR4ucnNjiXu+/bnpBs7J9/BKn4s6v9B6ngMWo2xZD0FBjynyCChYi
	nGycch2+hmCt8a4PSTN4KrdJM5Cn3imNMfIgWfhPOvYvJM3ovG+Pa3YPu6BL+j90
	vBr65LbveEQwJ1qEqtdXJTnaGL96ziMc1GFm7/CONJmAx1UxJ/k8VGQRNtTY+4QT
	JF09fw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5ngm81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 11:22:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb0595def4so832593385a.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 04:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141768; x=1773746568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20kNf6AjJi8G3MZa9GHdnqNbJyccoW/mMnIokY0W6ck=;
        b=JwSLXJtD/zhzT7dBJn6DJ7xFlwhuXr15lE2YGDO4K0nD9qVf/QhWimCnphy8RZwILE
         vZm9N9FCOmJkHVPSp5YcZo8Nq8QTQYLBPQJEYJyn0BdN5YWMXbYNnh1ZRrb4IaT64u0M
         Jgdo4TCQoB/XzYm6KG0y2GEU0IpwlfRszzIGR9vO/WhaBYtcI9JGe6n37txb499bJ2B2
         xRgv0apIn7d/QNM9CCCwzIR31hVYT9Ex4+Bg7954e21wIDROJeqNz5hf3gdmDk/6ACow
         gBpMZ5jLR5SPl3PMQbyMrn8NfqKMY4je0wLaVsDpDeBaE4XPY7aiu9NQfmnbr0/LDRUn
         j+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141768; x=1773746568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=20kNf6AjJi8G3MZa9GHdnqNbJyccoW/mMnIokY0W6ck=;
        b=fv1YqVu3/9DzQbwARDiw1CsjGnD0lCWE8WScoJDGT7dCDrtEkLm72wNXfEnHELQbKm
         8L4PGNPrVgZtEclwhcgiMyMtGmLL8DcCZpHK5TXNIZNiB/4XbNeq0iaRyLRzWquq8KaD
         EDWdoBn0B3Wkt3+hbeZtgF+HboWIxkCk7z0GbFam3lw1y9hxJQLDAcaPLMVFjeOtfnR9
         TNbOqBWG6GVxKQ0UdyTFIUz1aK4+Nz24UA9bT59vU1qLVgDxQB0Cz/noXR9XvAuvxSvP
         0jSeq53ECco8CK5vOMlGGXB7MxU3bQCJxZ4psNwwB5HhXMzIYkLSv77nMe9VtV4S5iZO
         nc8A==
X-Forwarded-Encrypted: i=1; AJvYcCWLSCvjXS7MrYi3gyhUTQRZCaWIVSPaed8kRebxgwuv++k6EinYsBOLCSX16uKKA/ILYVJ1VdYb52M3nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBjvfoaXR8MNchpGAU6L+29nDnLgUXSswtUTHXSwBajdxhmccm
	ufk0NIMSWX9lnMMwGpEqJbPiaj9lsfRee9wzUFlBvEvDxhX6/nmzXjdoRoGLR3kGe+rdg8JCVMA
	x0R9/62DeK0peod6R+c8ABjhnvJsbK96N0PZdk7a0a3CogNAuyut+E7Sznz26huupmQ==
X-Gm-Gg: ATEYQzxBxhB42R4XGJnEV1PadL3gtoYhNOZiS87GZzM7lXE46kTknN4hrSSVlTKzBFm
	JF6/7OhPBl70eLUjT7j3AASRZXejLrtZqLHSaQe+P4TlaQIAplhF24su/q4VAEEGu3OUOB8El6J
	JwHZvZ15atqdhvqDHNhywxRkpZcaf2M5ARUVZ2ZlfAZgcPv2BjDKA26N1OihfVve8ZC0mCF0A9U
	TVqsHdJoQaxEfnCXqRwv08KKzSbpGKNVAONGMQrJO2rXpAU5i6dw8h7mDJ0+Eo3KzbMeX+6v491
	lYujQ0suFlsyI/nUAmA1fGrdWGRpzRMUxddNcrv8BbrAa/2GwNcNvNB/QcogPtpZKXD8BYCFzlw
	pMp2Z4ZTDlCzyovqoW4OKzSy1WDHum0f66WchQnkxjpEj
X-Received: by 2002:a05:620a:6c0d:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cd93b5aa5fmr298331585a.10.1773141768251;
        Tue, 10 Mar 2026 04:22:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6c0d:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cd93b5aa5fmr298328485a.10.1773141767852;
        Tue, 10 Mar 2026 04:22:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:22:35 +0100
Subject: [PATCH v2 1/5] remoteproc: mtp_scp_ipi: Constify buffer passed to
 scp_ipi_send()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-rpmsg-send-const-v2-1-0e94c5db9bf4@oss.qualcomm.com>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
In-Reply-To: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
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
        Mathieu Poirier <mathieuu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4kCGFUerd9XjwVun1nTUlYZGlcZap7SHC0pIvgPDfIc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/7+Tx0V/XsD3XPBcWawLv/UH+qV9b41Eo9mZ
 PhOc+cPamCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa/+/gAKCRDBN2bmhouD
 17siEACHdzjRE+5UXVUKCQjtmsjXeQ1XmAMVe185ibjnPxGTUlZVM7o6brVwHHjW5yQlxXVhnE9
 OiEkttDjUGuvEOi3/umPRm/llumQaTLU7hYxz72No2AU0ED+Dra5FJ2C54Uk3BL7ADo9RaGezym
 Dat5knmeLz+H/9HwFjkHVHS1qJwa29wO/X3O3eMBRaagrF/UTZm9zyU8+LVQOWkYDg9wezZWy/y
 uCrOBXO9Bk03hDhoWqnXO8IxB5dmgazfpQjflf0TgE874HJG7CnqMcHC998DsEtytNTLjByOW2n
 zo/3UDqiGLTbo5tLK0NU+dbbaAc+yXcF6uQ4IVh/T9Ox+CugW1eLlJWSU0wiPBEOwuQSyt/J0yh
 XoFLHbdnwJ4ShgTKT8qKV0VRZAsifHzQTtHT0IJWEqaxarseoCA/JZjEjVewt0/oaIiMmwaBGev
 c6s+HtAvQafDzV9b/w215PsFPi+NLjNqWZiRxcFKJJg2SodeJBjdDTnjQvjC04VuRdu7t8q+go4
 H2AdknxoAgj+yomEIbt25lm9IazxGEr33WRfKSjwR9gBiFUBBleKgpl4Fsuhf63WBAbgekWdtHm
 7wPD5hlMrxKgl/MeBE4iz7oJigEgFmEmwEWEnQ/cNPE3iq3tuUX34v/RNn2diRcHHFolSvLtOib
 9luiHafINMvBsOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: iC6-CMpwjsj85XIIrrFsfccSnjgUNA8D
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69afff08 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aY2cFw3b1D9xo--RORcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: iC6-CMpwjsj85XIIrrFsfccSnjgUNA8D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfX+OrO5Kk83Wrb
 VkXsx+JT3aAiSiCYgsjW67RpJJloK+0HzaATFHMyDXepEgMcxLhkr/xZ5syP9vZ1/AYcnxQC9ZK
 XqnbuqSJkWfLS0gOWoPWkPIKH+9apZdDZ3EZsyyn3KycB/Kmlyh+M+zL8TGs+Nx+n+YecikpQgx
 c3vnzm6EdT3QkzsQGrnb+hifvxCDbrJ7sEQyGB7fTw6s6/0eOkHNmNAwajcdNszCweZMCKis32e
 qEJrbKcX2GdOK0AjKgotxEGe0yBe21B+tgjMqhYGr8U7ehI3S9obQRsbDEH/zxsyHjYylGoKf/u
 QOp+AumAKSVgsWsZmYbPKxKzX/O10Q9KRsJ1jMC5baWSXowLOB6fDL9sxVtvhMB6Hi23oP4/SXz
 FtUWouT3JGUeUNPj6vAAcJdvjkCH4q09rZ1QpEnunjga1q6OuyBrdB2cNINKLsYK/IXRePA2l7L
 OZkaK9aEZXa5ODFJu2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098
X-Rspamd-Queue-Id: 5A92324A8CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55079-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Action: no action

scp_ipi_send() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
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


