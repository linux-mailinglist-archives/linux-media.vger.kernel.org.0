Return-Path: <linux-media+bounces-51771-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPTxOYERe2nqAwIAu9opvQ
	(envelope-from <linux-media+bounces-51771-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 08:51:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C04AD028
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 08:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB4E9301B685
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 07:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E584C37E2E0;
	Thu, 29 Jan 2026 07:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rwxt1U0E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UfyVaWor"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA81537D126
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 07:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769672945; cv=none; b=mt1aQYdwuT+eWgNW0QslhQ7XByLknDMLHfhAsoW29Yxns4+DmJ52VxKWhQlkIKUEoNvdQVwK88qtgfCOFqxhCkmCk61HuACSBSD/TgMqB/p9DebOZxTo/K2fjd1wnRE2ugTxS7c8psX816n7dCHPBDxmXLKkPP/uqqcZuUA51AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769672945; c=relaxed/simple;
	bh=W5OCjv9SAZMljCuLBN/Nsa8uVEm2rVmAfFav+iwZiDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zzo1nCmp0lDWuaEo73FD1trvt/tB0mmxWjT/Bi3lz8aDRW7xMZM/bEc/QCoc7A2z9py2tPc23wOtY6rGkhldpc3btDbj9tVh2d1vUquNmpypcRYSmcXyL+HB+vZe6Bw3pKBoUzU7n1VAfoGE+9cX7aSI7uDdnL2ITlW+RTttKQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rwxt1U0E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UfyVaWor; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T39xSY1429065
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 07:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aAKBWAJ2X/2OLZYyocKi+WlPjuToeQEsQ6K7eCRcW5A=; b=Rwxt1U0EYFAJHXc3
	AP2bjouUF0OqKlfNEdHnPrpmW8U32DFylPUTYHThoz4//lN+gZbkSNN6iYv/nwNR
	hYQGMPItyWVGASb7oL5gozlU1D7YoBxzNI6iFUnA+ICSTraeQzZHWZJW2Supqkul
	gSSUnxRz+H8zEXCoGF1f1OFwPnHBzddtPlyh5QQ5V1Bol5d56XvDqIscMQHkA6FA
	0jam5gJHC0ZyMv5GqmnUVqv6llgHTXQ6sFotXGYElUm3uzdqbAQdTmQFuVoKjPMN
	Q6O2wy9zd9dYrEhZSj5rgMOtSQ6MTc0GJPCL2uN05MBdSgnILmNLRQPYXQvtV+ma
	qSSdxw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byydh0qbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 07:49:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81e81fbbb8cso724511b3a.3
        for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 23:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769672942; x=1770277742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAKBWAJ2X/2OLZYyocKi+WlPjuToeQEsQ6K7eCRcW5A=;
        b=UfyVaWorBmq/vCfNS01V7TWxEGgRXKx5nF5OSyOV929W8vXcp7ObWjRoAFlnlus0h6
         ikT12g0asjJmmfmAXgfGaNyTnfRqaxDUf/llAfoHvamXZI0bUei7dH/tUjjDBplUKt68
         GEeNBeE6cV1pHAxQ+u+8a+MaGROmVZKQAgY9UU4G+R4RrDrO/d61GCI85pgldWKRs+mS
         79fl6HauKYFTbVk0gP7IpS1QuTIx6njdvfGP6PgPKMP+GvR6V44CLtnH/BBjgbuG1ylQ
         Sb6Ea0/npIJ6/OF+dZhAfEDubOjrYlzY5lSDBc8CQ0aPg1mJNjkFuNsHvz8EjXw1Dni3
         EGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769672942; x=1770277742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aAKBWAJ2X/2OLZYyocKi+WlPjuToeQEsQ6K7eCRcW5A=;
        b=NqbaRW74XUGzPLHTPoLlKwJM86FbIdy0Pq9Y5spmBTA7RcfviAyyb0zhrt4olSl30x
         5q8xiG9kBTYwq/cosnbrtbWpdunlMs2HOnHa/6lqDGnOzIBJUYQ8jUL9CCjRGGTI6LmU
         lMzQzAmdUETQI389aGujmqTAPQte4lqB/6mTh455yC3h2I/he6RomDY3Gm/lwHD5GD/r
         tOxDnQlx4ZJihMlHhozpd7XDmpNzAluQoLaXgakuJUxav7xN4Ce1xSofBhpM/tXNlthM
         ECEO9Z5e9caPYIiTBRGsOBv4zI6OdIkvRxr786BWzMiTyn/IZuv/clBeYOZ0wrvHnT3s
         LgiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZm4aTfBg8lqa8q21VgTVDxuRtzgtRL5Azj7HCBAMtu3U7wqGZ3ibSDGdHc4qALqwdG+7Kw6NC8MwhdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynogPFC4Rinyyle2ZYk+xAnrCtULT1lPphLa7efz83TWNlAPnL
	fcl5546YMaUGgDAfozZ10DQIXBOo61zbc2zVqz1i9P8h+h39TbrfURT396GvPxK1XFSDbeG8V22
	HqkqGl2toB+XtHBeyF7pmaqJsx94gcIOBqg+ftbgWi2CGoUOTQZMZ2LAZGcVD4mVR/w==
X-Gm-Gg: AZuq6aJ6c6dP+9F5WZ3NyvMhbgmqm32o2FvX/gwavHTfpHpr8vGv23aCX1qLk4aeTkG
	uHxbZfLhKFYV3Rt4wFr5tQ/l+Ry91ImmW2PJoTZUiqdAmXLg5xk3FFjtiSuMMsjQLxHUCv/y2tl
	4NG9G7ykdF8N98ZyRQ5lnXR0ECGEPadF2JP04ax6sJ6WFZ6tjbglqprT3z7udgM3VFDVegwNf68
	xKw/D0TnauHxWA+TVdQU5Acb9Wk1my74k4Zoj2fEbRNYGfvU2PDifQloe8I/2VuaSNF3cVxZe3o
	0thCr+bzKsLkjSKNDIxLWpMLlE1AzNB6Ps8NrRoR7SiDS5jznV4/OoN1Syd8ws71KMCZIeqBWZ+
	szY612SVfVxjaq6EL6Q6/hSryd2Vz11/xFBr3tiJf+59wtCFaJPny8fIykxgW0W2e3eJPSu2MyU
	ZkiI3D5Eb/GpM=
X-Received: by 2002:a05:6a00:3311:b0:81f:45d3:adcc with SMTP id d2e1a72fcca58-823691851demr7241763b3a.18.1769672941696;
        Wed, 28 Jan 2026 23:49:01 -0800 (PST)
X-Received: by 2002:a05:6a00:3311:b0:81f:45d3:adcc with SMTP id d2e1a72fcca58-823691851demr7241736b3a.18.1769672941251;
        Wed, 28 Jan 2026 23:49:01 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b49fecsm4534634b3a.15.2026.01.28.23.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:49:00 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 15:48:27 +0800
Subject: [PATCH v4 6/6] media: qcom: iris: Simplify COMV size calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-batch2_iris_encoder_enhancements-v4-6-efaac131a5f7@oss.qualcomm.com>
References: <20260129-batch2_iris_encoder_enhancements-v4-0-efaac131a5f7@oss.qualcomm.com>
In-Reply-To: <20260129-batch2_iris_encoder_enhancements-v4-0-efaac131a5f7@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769672917; l=1573;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=W5OCjv9SAZMljCuLBN/Nsa8uVEm2rVmAfFav+iwZiDc=;
 b=BpLn33mezINHxThd3V9wJGzB8CfrQ217llB6qgk9L6RDiElH0g2C71VdYNUZQSZ759WXpP5Zy
 5D0H2Uw8v8XBkE01r1+djIFlmxf06JaPWQdXgxo4wc7+qECGNY6OIWq
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: nnEEV5iekCH9pVmTRyqRlozAFbcCq-P3
X-Proofpoint-ORIG-GUID: nnEEV5iekCH9pVmTRyqRlozAFbcCq-P3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA0NiBTYWx0ZWRfXyIXP8E0sF0sy
 FUCJpIxAcMqD727YGnc+JIOeV6ZzNltAMPCSJNNT64rT9A1+oqxRdZdIfUhbcu4ZTS20Hj0P0Lq
 fiLgWSBboNIsfdbtNOokdp4u4I8Fn6WGpW+Jq7BgUDx9UooXiEkXGs2TFdKMX6FCCF7GM2zp+ZF
 QcFMBLumiEI60SJ+MtVZ9dU/Ki4RYQDzYWWCEcOyPzLRaKmTDjqmnryEkLtqTX8w4/jYT5xSJd1
 f2BUpiwAtoaVQdcrBoo7a7eIvMurorvHTxCBEvD0EI3SGngYVnBga9bW3t1XZbeVAZVtlW98SJb
 c/WmwOvI/Il6GLxsGUM9QVItILD5lRbcrq/ULWnCSUceo8g4s4YnGSJh4wUj8y6FuBwlcYZkEl5
 4p512TG1I4ee9A9WXjspmDGJqqPkGCsl61NQTOBbhxxpZe2PfLoWMVgjiDn6VD1VpqK87pvbhaC
 wZRPktjFKfkD1xAZErQ==
X-Authority-Analysis: v=2.4 cv=Cs6ys34D c=1 sm=1 tr=0 ts=697b10ee cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=ihyF2tqwNky6lgPlo9sA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_01,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290046
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-51771-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 15C04AD028
X-Rspamd-Action: no action

Unify AVC/HEVC handling by computing codec and lcu_size upfront.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index c2cd4adc082394a9ab6f32a37fe4e57678019d89..f55db869fee4d64273763fd3f98d286f58e2e7b1 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -1014,16 +1014,13 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
 	u32 height = iris_vpu_enc_get_bitstream_height(inst);
 	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 num_recon = hfi_buffer_get_recon_count(inst);
-	u32 lcu_size = 16;
+	u32 codec, lcu_size;
 
-	if (inst->codec == V4L2_PIX_FMT_HEVC) {
-		lcu_size = 32;
-		return hfi_buffer_comv_enc(width, height, lcu_size,
-					   num_recon + 1, HFI_CODEC_ENCODE_HEVC);
-	}
+	codec = (inst->codec == V4L2_PIX_FMT_HEVC) ?
+		HFI_CODEC_ENCODE_HEVC : HFI_CODEC_ENCODE_AVC;
+	lcu_size = (inst->codec == V4L2_PIX_FMT_HEVC) ? 32 : 16;
 
-	return hfi_buffer_comv_enc(width, height, lcu_size,
-				   num_recon + 1, HFI_CODEC_ENCODE_AVC);
+	return hfi_buffer_comv_enc(width, height, lcu_size, num_recon + 1, codec);
 }
 
 static inline

-- 
2.43.0


