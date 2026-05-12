Return-Path: <linux-media+bounces-61225-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBJXA3vwAmrpywEAu9opvQ
	(envelope-from <linux-media+bounces-61225-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:18:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8F051D816
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 493903019903
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 08:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127643A7839;
	Tue, 12 May 2026 08:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCPRuTbE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aeOsVdCS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83E538B7D5
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576155; cv=none; b=AK3bQ6fqh6m7E+yfBMLZlQCWSOVdNfjHKybqkcO6QVFXa065ZJmybELGJ4XuQjCBleJvyvwSuwkHBFe4d2f/tqBNVGy00kDrwV6EROE4TYppfq3k3L/avyX3OTSOlu7cjSEbBoWnfyIEz6phj8szV/CU7d1mVL5ED2fcHmJCBM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576155; c=relaxed/simple;
	bh=W5OCjv9SAZMljCuLBN/Nsa8uVEm2rVmAfFav+iwZiDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dhAPIpLmaLfj5a152B+eGAeBKi3aZuekdWuJ/w9THwTFosVh95HFgQgvxJBBuuFNEuMspvrcg3Pz/kdrXEm4AAQ4U4VUWCXkrcPwpdNuI8pDDYauGeOcyMBZUOYednCCwSgVlf0ZRFZoArd6lWuz6RI02IWgnVVRYCLKfVahKLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCPRuTbE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aeOsVdCS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C57LpD3443742
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aAKBWAJ2X/2OLZYyocKi+WlPjuToeQEsQ6K7eCRcW5A=; b=bCPRuTbER42E/UE9
	OOIaKNSluSCSc8oGXOuZzfWWG7xRY/Gw6l2j52k59An/324evxY0oZv3SLZY+3yR
	EbIYScW/V9DjE1Ihl6ozZofUV4fGK+PXwg1D4T3ee9vQaCaCy18vtgUTSP6lEdn8
	FpnSROtUdQYER5g8kvGvQyfcQfsrqLXbHCeIY1IeVREZC1dO/D0M+ENtqAre2rHO
	ckkolT9kvxyczB0+yDk/Dk4dzLuqSqfApVD0uaetv9wkJEQ2iKXMWCmE2yd9IvIJ
	DOMw2DKrmrUc7fgOYfQ6J3GbrwFcgWfHJHJl9hWRnQiYCNgx5tVM7VUVPijKKAjY
	4YJjCg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0jc1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baf7748d0aso46254215ad.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 01:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778576141; x=1779180941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAKBWAJ2X/2OLZYyocKi+WlPjuToeQEsQ6K7eCRcW5A=;
        b=aeOsVdCSNjgNv+yP1iBGVsL0oOzM3QEm8BSjAU0gk40EKEq9phjErcogBZsu953qIZ
         lnmLiU0YAYjUeRk/NceeqTzDJrlfwQq9tr8MWVSlEM7ExjBhJSQENsFe02jIb4RakNQG
         wxuSXNeBPSNA4YhfCD1pIKo6p1Bnua7wz14hd1MYen0+KMw5/ThhQYacZbULBfCae3Zg
         sGF7DJ2VQnjGtOxvh67WL9eYx+CnV/TEscVmwvPwcbkV8Bm0Va6aUV8jMWEI4812vvkC
         ePBvyKvKpzmOf3nwQNQOvDc0sJWoKVhpqMTbFZn6ZzchOnM0GXE005NJCR/X8ybg9pNN
         6yLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576141; x=1779180941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aAKBWAJ2X/2OLZYyocKi+WlPjuToeQEsQ6K7eCRcW5A=;
        b=KY6/QK2rNa5G29eSMkyk1ooUH5JbALUqimyPdQea3r+13wnzM4DlFC53xeRDvsELm+
         ToHt58+BYJdEX6US52l3y8Wldjfev78d+XfJsGWV7xWv4Gx9oQzZZO275X/4jHshINtB
         j4RKTnk3Q3QbDcP/+OT0djeCOUwL2kfxKcJ6lrjoDNplYKHlvfB/SDw6Jt+iFHEWhnwo
         Rkm0ruyg5uwA5LyRZ0Qop0l51cHMqbuZySMZlazH5MWAYoIgzkSeeVKY45pF8QiROLnw
         s5JgMQD+ud0+kmS8tCG7zYq/Q9Lvm4PpROGU0XK1XdwYfqDJ+A0IJmn92bVRIwJ9CCIe
         JR6Q==
X-Gm-Message-State: AOJu0Yzq5gmW+Ch8D4B6dgbD5Fh1MRnzIyusfRoACSWTX2z/fV87TEaT
	iVWbXCKvaEcV0E4ArpCLxxm6jnOgTSVz70puTPkB2e2pCvkpvxA3xtJ9cLR1FqmNHNrU3uPUCVM
	LJ7LHqwfhDmZKMNX/wyB9CT5N6PSSmBQoLGD1w30YxhpggyARIPBblSn7quIgix7m+Q==
X-Gm-Gg: Acq92OHA02VRKi1jh2eYdfVz6HhXtOJXtm5DhrxKW00h7fo4Fa5w9anQ87+GMUqkUXc
	aoUxiVrBHhBcv5+IcAanGL6YOo+0HMriHg1WLWVlt6WV6KIrTRgMK5u0vjX5U8a8YuJ1oP5DjZc
	kHzLx6Ouyb1XwxRm17bHh5Wwa0gdhDu76Jj2r9ppji8h/ZtJbB0UqkzEHT2MyqCYBAZmGXJXzj8
	L0prP5bZIhWFJOX/T5DASbXUYJhiXzQq/9yLxUokHLLOxy98JW4J+h5+eIigTeQeiQTiX5ULaFJ
	u6GMyTHjaf1HyGRCfXm2LYERN3ny54axthbZ4JJ481e+F8MSLKkToMLJokL4/LReB79uXTYQ/DQ
	96IkL3tyBP4tM6hzGnRf6OuSj4banbn3l4F44e1Cv4m9wE0j/NY8je6KLZcKlhxOioSicV52TbJ
	KxhqUDT4SOdteGPiSVREah
X-Received: by 2002:a17:903:284:b0:2ba:6ca2:be0 with SMTP id d9443c01a7336-2baf0cf3149mr194198085ad.4.1778576141212;
        Tue, 12 May 2026 01:55:41 -0700 (PDT)
X-Received: by 2002:a17:903:284:b0:2ba:6ca2:be0 with SMTP id d9443c01a7336-2baf0cf3149mr194197905ad.4.1778576140685;
        Tue, 12 May 2026 01:55:40 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e90854sm127641405ad.66.2026.05.12.01.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:55:40 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:55:15 +0800
Subject: [PATCH v7 6/6] media: qcom: iris: Simplify COMV size calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-batch2_features-v7-6-4954e3b4df84@oss.qualcomm.com>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
In-Reply-To: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778576115; l=1573;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=W5OCjv9SAZMljCuLBN/Nsa8uVEm2rVmAfFav+iwZiDc=;
 b=ZXeyI65zFtdp23qlYf2KAxFXLl1xjBxlL3/tg6yVFNX9ZR3a3z/EKsXyY3Zqee9uqB1G4m3de
 5Ef3W3wqNo3AF3E8KSeagGYIJ7d+RjJnfOFYQZyRh7a5Gc0qShLV51t
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a02eb0d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ihyF2tqwNky6lgPlo9sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: tWJMO3oWVYOgMC-XciYJMH0_Ud9dzMrD
X-Proofpoint-ORIG-GUID: tWJMO3oWVYOgMC-XciYJMH0_Ud9dzMrD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA5MCBTYWx0ZWRfX0KMaSgKgTjk+
 rpWylF9nwuqBGRm2zBw3H9FA/lAax7pITxNiw7iffM7Tv0vNkgpUQ/Lx2mIEcjooTciVPBMUC/s
 mN7B6G6r/JgfgcMR7zYMXSl0urxyLxvZilOo9F9CxTY8DLq7PYbQ191UMpG1BmcETYMX/BpzYWt
 h5VVGu+5uVZ9h/mc8RRSD9OERz9MalJW0rbajCK9CaVbVNP4/VjXFu7RCh3skEqI/ubhIfOfIbg
 fBxGxX39qzcI+t3r/qTBdz5Avg+WCLmUAFO7UjcYvgeHYu6nIYuaKkJ/SgVb+4SE8UEBpgAxXmT
 3R/up4Wih4AlSrn0WMc+jaLBrq2VgJLXK+pY6mrb4b49drqh3ZmA+p/b/BPitdrIOv2Th0VOOoV
 8PhLHUZ2ZUpDvWLz4YwBR+Dx3Dena7sx3y534Wfoug4n11ttjPnMD3mZcgNJ+zEeGXJ7/Hhg6zX
 I8jncP3BpBrMHT4ybZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120090
X-Rspamd-Queue-Id: 9C8F051D816
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61225-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
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


