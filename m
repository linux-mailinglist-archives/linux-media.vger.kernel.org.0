Return-Path: <linux-media+bounces-57833-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHHcDoyPzGnXTwYAu9opvQ
	(envelope-from <linux-media+bounces-57833-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 05:22:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A30E37440B
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 05:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B14C3106EC6
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 03:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D175537CD56;
	Wed,  1 Apr 2026 03:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuFa5F4r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JS/fFXnE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD30A37E315
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 03:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013328; cv=none; b=sIgmC6qJv1+hsdkIXSvoLJBC6romwXXCEAIrVKSXNqAJMKtdUGqRtpiVbXQkFjHPK7CA5jUHJ/MitxwqAf1Jz5N+ovjJF1EgxKemlNySSX2GbzY7tfnpCP34LR14gf7tzGMWoozAVKlvbiiq27Vu2C5bcbhbPn/9J/gxIgnDWf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013328; c=relaxed/simple;
	bh=W5OCjv9SAZMljCuLBN/Nsa8uVEm2rVmAfFav+iwZiDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cXcCLIKFfFO18FfRiSbm9fxC7ekPzCgU1fXrlEyFAvzNbeR3Kwim6ObM8upEMJryjTW+0+4624UB+ltf+7CbOz4Xdk5SrXAPB7evg8A6w6lVhEYv1EDJy6Bi00tbo7zDlxTHOHxoEh+u8TgbANu1+snvei1fq+VtHKsIMbdr2Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuFa5F4r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JS/fFXnE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312IsP31004301
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 03:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aAKBWAJ2X/2OLZYyocKi+WlPjuToeQEsQ6K7eCRcW5A=; b=FuFa5F4rbsDhBXqw
	qJase/+LucrAtdU67q/+06ZXITevRGgEsjZlU8CinmlYqaj/i0oIeO9+vEgCs+mK
	V1tRqNEix03Ne2aY+3GyNJUuZbJ9mC444YFSZASXjH1omwAcF+2AYYHf9Fv80CZN
	n6WV1Wo0X2eaoJDcTE0HgFG3zqRMPyoYvGIkoELCALwPfYkK8O7E/wRRdlz14D8G
	9zNHDuL2u8V2tH3r2c11Os5usUjHTCY2Xi+mmLMCu6OBD1l1yrNsob/XG4PMkdTh
	hu5F+xT9JpOaJ4bdTah39fIru2Sjj3VNHT9WAKu8wjjeNd38EObVK+iYC5o0dNa+
	YcZXOg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjg606-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 03:15:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76b69fb9d6so341291a12.1
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 20:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775013324; x=1775618124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAKBWAJ2X/2OLZYyocKi+WlPjuToeQEsQ6K7eCRcW5A=;
        b=JS/fFXnEE7Ht+NtYYljHHUsM24SFOWbI/i6NL8qbamiA5UtXeiMoIDehauyOc9vt7W
         Rkap8Q4TW3NGMCZdw0kyOeUbhHTq3fDjY+oQ7FmSr8s3mP6a5K/G55Ei8s5Y15fXi0xQ
         mSTsej1v/mV+dpQjDrezmZ12LB+OoJiRn/s1f3+/w9/LdmyZjItERIfollqbQp50rDjI
         dfIzoj1tZOnUIxM85jgoYsClWOUtG7ZFIYrvzwgRmynvVYt39tqWIx3luHG4VS9ygszL
         wiSqHmv3CFv/oYOiOyceLajHOa1XniEwMevpKEBjMUk1d6Yeg9CYE72QTh9+wLl4QtkG
         TL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775013324; x=1775618124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aAKBWAJ2X/2OLZYyocKi+WlPjuToeQEsQ6K7eCRcW5A=;
        b=MuxZ94kBciyejDXyCYF0+/4vcrDMUft5qSiBXtzl9IeTZPCQD/z6G8bUmtyvYee3SE
         mDwsriEebC67eP2Rs63nnvuzfKnY9X2bqeCIN95aJHY78Gtgf6AbUorjhk4SUNkU9tRM
         ilWB9+LxX3xXSvLwwD+y47NrIykSsMJ2/w4HPdHsXEBpIgM20UyYzQ1Gn2hKX4ZccZv3
         KNYz22EZKO0ysHIzh866cz36G0gNIZ7YWlABUxEpyRZx7u1LMFXN+kK7TadPH/54AEIR
         FaUdrANn1rwtp+N+o4aLVDg6SW0WEjDkzfU25H90IpYm2DZKPhfWMMMnxonhOKL8gdl6
         eAxg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ/X9Pq4daFi3WsUL9ie4RBn6XNcOc4cqQ51EwjViwgMrwjU6qY+RSy/q5eynJK62VqHx6MZFBmR8Y9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ9dBzxR9+1OaMeIrbGBbSHGq7Wr6sBYPaSzD86uDRtDhLY6MC
	61yxZtVbl9WmpOwqsAqK23J5CnC5cKcBGQQF0elubko6DknfGRk3Hl2A1qB7zUeJJj6llS4j/FH
	XNkIUMDjIeo7H/1dlvUCpT0ho9N3PL+u2ICIIpYHQZvOI+MVpnzLTUGnDt/grdim0AjtiGWN86C
	dF
X-Gm-Gg: ATEYQzxCmId/LqDs1lJYV0/nrdmEw93a99U8lCIOTq/htgfOGJPBTYa3ZUtucoPaqEp
	WF9kjYi3jF9FkCDEOZLdR2VlzU6oizCDnGV/iL5b2uXZPLXZGhfB97O/Wv19tscvVhICM+iWA/g
	9TlxrFALbW4uc0PAWdO6h/fUyqs2VqQLMkSu7JIDolHp5mIMQKpOCpitS9Q6VrqViuQiuf/RytZ
	0X1U4HdH+vIboeC/zDwdG0ebt00iMjn3wnP7tYtiTQs03S3PR2igdFeBqXggLVDEXFE4ceE3yz+
	KlDP8rb9cfLZAzvxuGlhvQn8UY7KY/G1rTSqFbIowTB4RRZNG1oQB63yHS68cg8e0ROZHjVKGed
	uLvHS0SbTbnpJwDzj1YlnvvUDTfcmhcDsvebtI+TP0kC/GMms1Nk0qFJQLjZ/myvy/jU0hs1i+P
	lIKHcuLpxpyZ9gWDHNIzvB
X-Received: by 2002:a05:6300:218f:b0:39b:9faf:c7b4 with SMTP id adf61e73a8af0-39edbccba6cmr5791364637.4.1775013323790;
        Tue, 31 Mar 2026 20:15:23 -0700 (PDT)
X-Received: by 2002:a05:6300:218f:b0:39b:9faf:c7b4 with SMTP id adf61e73a8af0-39edbccba6cmr5791342637.4.1775013323274;
        Tue, 31 Mar 2026 20:15:23 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76ad00a246sm3246584a12.16.2026.03.31.20.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:15:22 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 11:13:48 +0800
Subject: [PATCH v6 6/6] media: qcom: iris: Simplify COMV size calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-batch2_iris_encoder_enhancements-v6-6-7022af3401ff@oss.qualcomm.com>
References: <20260401-batch2_iris_encoder_enhancements-v6-0-7022af3401ff@oss.qualcomm.com>
In-Reply-To: <20260401-batch2_iris_encoder_enhancements-v6-0-7022af3401ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013294; l=1573;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=W5OCjv9SAZMljCuLBN/Nsa8uVEm2rVmAfFav+iwZiDc=;
 b=JVljgXNlYmLykbCJ7PzPiPCExKiY2Ib2kiElo+ahhGb46R5GNHbCbqbbA5mK5YK3eBnvO49bY
 2rx88C9uGqKDXIED91//W82+xK4FSoKqQ3ZI73WB9ONd+rTEI9fs5ON
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: Z9Jv4q9GDmAed-DlU1bjidebuZzIuAVt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyNCBTYWx0ZWRfX5PLXJSiic/A0
 m3qXiYy0lOiC/1xKslPN0ykUqyCDZccmezoOvJwKAPYlCOcTBbhTxKo36JYYmyUK1r/vOokYG7D
 I9b0Ndl4J8jeRLKmFlMpHR6xYK3VW+Xp8Zgg1fPngfcGqfb1UpKQExfRUxJvCWCRZX1JeNsoX/V
 s3akxODQRQZK/eYNt0+FYiQbzrHhTJa9tEUyYb1aM07kkrGBKgGdCzGlTjnnFfhFET6DcGah7kJ
 f0h1TmVmsALKsaomWRGmOkzszrCXGbp8E2hzSQhh4KDB3W40T5UadFXiGAkjAnT2TBc/86aKHVG
 AJ8Fn6UwxKNAru5aZyDtq5Xtjrli0KOp/i7S9K6oQMyVW4wP0/JdYhQevNt+LEvTdNOcXaxvg/Y
 DSxTDzS3fT2GZqVjRC1mez0zRq2bT2B7ttlR10/FENo3BDC+RyYFan9fLqJYsT3YZTCpUJOO+UG
 RSqk/EqkuY7Jdlms5IQ==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69cc8dcc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ihyF2tqwNky6lgPlo9sA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Z9Jv4q9GDmAed-DlU1bjidebuZzIuAVt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010024
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-57833-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A30E37440B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


