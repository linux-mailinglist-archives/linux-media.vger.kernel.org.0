Return-Path: <linux-media+bounces-57849-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIOUKhDwzGknYAYAu9opvQ
	(envelope-from <linux-media+bounces-57849-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:14:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5044137851A
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A1501305AE8C
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 10:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE693E0C62;
	Wed,  1 Apr 2026 10:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EcQjUpHd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E5dUNcsw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87BD3DFC75
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 10:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038446; cv=none; b=IFLC33ItPB9lE+EXIA1JRITMLJ1kxZnxhgfYlZ7X1xxVXWB3Hee/akO4kUkqO/a95WQtEurG4AuLa+nDxTLLIkv69QSFKl4F6iqcKhFAXjwvzn5VxEmDIwQbP0c1myXhjwQwDZMbG8BrhOZ9gk2pt2B1r+2SWg3cylxjs7kYPfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038446; c=relaxed/simple;
	bh=EEswu+6fbqBa08SHQjIIuTp3bMH1hK4CRlphTe6mLzA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t6cCPqDxYQEhuTwFy1bzOy20qrXt8f56OwMHaMt1qOPII8DNIf1g8m+jeyO5mxLBOxKLy1Ompytu4tWYqJNG1ztALWKwJlsQJScyp9P40yMa8cWYa7XQLqUDyRbfSYI6ldCcgOi/1mt77I3p70vN7ao+Uyw5D6tZu3Xu/qqPtvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EcQjUpHd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E5dUNcsw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317SbQf1578366
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 10:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EnaTxDzY/SHS22gfoLDFYPunIIYegtMK3o1
	Q5/kWemM=; b=EcQjUpHdFbEXKNQ/vGfUKZ1KOJKi+aE+2oC3k1CVSMeewo+2ORy
	20/hBfCvCAR0AsJf1BRHeHHeyU/6Q9FkUxS48BKl3Gs4WWFNeQDrUxbWyLeOjTjm
	w3GNLs5dSUtyNn66o4BOGO32CjS47lJQMZhphely4uU79bVwKxqy773iaqCSNrbv
	oIw1OVk5qLJlYrj29TXp9TvseLr5eAZvZYHpadqwpDeWOhM90dzssrl/BOxgrMbw
	8RLFkyR+p/KOuPkU29cD+zUzT891yXFOMeHS1iY56enkVPWOHJ8MpnHrbUgeNPaJ
	lZ7XG9Cgj7puJExfi8mPEhT8nibUZDvbeIQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8k6kuh0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 10:14:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2489af602so8915005ad.1
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 03:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775038443; x=1775643243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EnaTxDzY/SHS22gfoLDFYPunIIYegtMK3o1Q5/kWemM=;
        b=E5dUNcswB0gDiEpgmyNjJPMO+QjCBuOy77C+HvV+uVIiHo9j8CFVBtqT559ztykr0F
         /h0CcKkn5Q0p2YwrCFfbyzwWdtc2saFt8CBea9XOBBtOg2UyQS0wQmXHzoo5la5E/NUt
         zBZpKeEKkokGMID4dcKgFX+M+XX4eEEPNOsbPXBVx7in0TJTdiTdM6gOXqmb3m5+rrXP
         WkDk5Do1vUmKurQPT9A7Oa3uxy8/mRYjURTkoMNkCdE3U7w6MKtTmwsNKbB12kbwW50x
         ZpYjpSheAUc27m5EG5MsV5wB7VdNSs1sNPHg6jl1z1Dov1iJX1x2i5vv68O1krOAKI+O
         owiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038443; x=1775643243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnaTxDzY/SHS22gfoLDFYPunIIYegtMK3o1Q5/kWemM=;
        b=r4zJ/oCa7oWidwrfIfgCu9R/KCzhonKadtfJLGvGI+haK4+zYrnmbSqm8LphX3w7ep
         bJ6pgc7JD7NxFHl54Q/+E17iNsjtjAvNqGzPtvn1BfA/bHAi0DspzwoMYjMi9FnHQS5v
         TDESQDsQTBDESMvUdIOxJdKmGlmjIY0xEp4uuVXoyUe4YkHWXlniOdq/LdcB9F5RTEka
         nG89NNJ49ko/m+TbqUCT1rtL6rDO/T6b5/MJZp43IOW94wlZf+nDVE56RYER5G1nKHhg
         Nm84SBEzU+kLIalaMxoBh0M3RDP8W128kfFDIwx2ZDMwW1eUVIgZn7dXuPslpoGm7V0g
         nvyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcczWOP7OaMO2epOiyPeVDW/i7jvdKcs4DElWSjhHtFEZeHAWiBA0T9AT9BSCfBdIltvn6KgwI971zcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yynn2E6jypWkGf+BHm7I4EcIUuHsEJggmWk+HmzcG8CLgcygxHv
	bXcpaBRoKz42013hqpooFBftkTDi/+4KTiIC/LEFwCetYO6k8rzIAbksjn4qTgShjKLyE/ro1bR
	5yWcbt8IecizX40mOWsQGPNZb95CV4dInTmynKm8OyIdM2kjDWuJHdykKeWj+fqZ6KQ==
X-Gm-Gg: ATEYQzxafnyHUiUDE6WUl1MCiEQh2MPdTCsOdnaZNcfb8idtxXEVZ2YVcusPko9w7ho
	UEGDZX0tY3xD/NMUB086cUjj2ODtkk3wcCXPcDEAOqZ+iYsMfKoHnLxt291Hi7sFnv0War3cj7s
	uAS7gFsHsk36agyHjxOY8kQcvXFA6brJIZ2+pDsxVqvO85bgPbmvabDM+opYDNYjBH57MVD897m
	15N108eyLNBtijtSWpCsfKIMMg8yuWJcYO3RX8GFTmmZtFvrjeZIAshc3gUTDlRk9UDU8swMQ1r
	Lo78z1VcuXNnmI4FrrYLDanuPLErhy/jzRu+y2V09SNKF4NoJkYk0ybIcyfdAZ1nBbClbH2szjY
	z+EFzubDKWDpeJ745T2evSag45x0xP+sOVgMCE7IPoxfd0aN06sixYaIV
X-Received: by 2002:a17:903:1b6b:b0:2ae:5346:d4e6 with SMTP id d9443c01a7336-2b25efabff3mr60943235ad.28.1775038442634;
        Wed, 01 Apr 2026 03:14:02 -0700 (PDT)
X-Received: by 2002:a17:903:1b6b:b0:2ae:5346:d4e6 with SMTP id d9443c01a7336-2b25efabff3mr60942995ad.28.1775038442085;
        Wed, 01 Apr 2026 03:14:02 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c5f5bsm148503885ad.82.2026.04.01.03.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:14:01 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
To: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com, aniket.randive@oss.qualcomm.com
Subject: [PATCH V2] i2c: qcom-geni: Avoid extra TX DMA TRE for single read message in GPI mode
Date: Wed,  1 Apr 2026 15:43:52 +0530
Message-Id: <20260401101352.4065798-1-aniket.randive@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bfJmkePB c=1 sm=1 tr=0 ts=69ccefeb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=qPv6kJ6rrmvbaMxWJaQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5MiBTYWx0ZWRfX88323rBJTMZF
 he5rk3BYvK66KvmDBPqq9PjekRYSsEisXEp1gIsbNFYOxoG+orqut4PD+lAuVV1GvtZvn3ZNC1h
 7dHCE3l+HmRbs1d+fWlw+J85R8UgwlvindxJyy2XhDGRLOiKsA+ne4LkbNb/+OgNYmymZTq7/6m
 HOsAF0wZ6au2KRwBH4NB2HVjaGxjnkTocR0YKV0Z863PmMcQ/ruMSHKsqz9PPUjoBfnvXrxkMYt
 PDks1Qog3Wp8eMifVH90/l+4AkJb0+6jBifKfvHDgY/vHMjNgr1IJGdzL7OfNV0gf4v8D/f+SZR
 DqZn/oroADs32jIvr51+cVSH6uXwpgFSggVsLCbP+5MgjYtWWl8oO63Guno566wzxzXN17LzaTV
 yZJyUjYRGT8mag7BY30iE6YcW29VTCgGuf4KxmM4Zcccw9nZTJIo2ttCdFOfeaAet3FowrAgcyS
 yBhvSJFO1xMbMKlAbCg==
X-Proofpoint-GUID: 3Xk8-pCj6-mtvIrvv1tP_HxGVh_WTq3P
X-Proofpoint-ORIG-GUID: 3Xk8-pCj6-mtvIrvv1tP_HxGVh_WTq3P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010092
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-57849-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5044137851A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In GPI mode, the I2C GENI driver programs an extra TX DMA transfer
descriptor (TRE) on the TX channel when handling a single read message.
This results in an unintended write phase being issued on the I2C bus,
even though a read transaction does not require any TX data.

For a single-byte read, the correct hardware sequence consists of the
CONFIG and GO commands followed by a single RX DMA TRE. Programming an
additional TX DMA TRE is redundant, causes unnecessary DMA buffer
mapping on the TX channel, and may lead to incorrect bus behavior.

Update the transfer logic to avoid programming a TX DMA TRE for single
read messages in GPI mode.

Co-developed-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
Signed-off-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---

Changes in v2:
  - Updated the commit message.

 drivers/i2c/busses/i2c-qcom-geni.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a4acb78fafb6..2706309bbebb 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -625,8 +625,8 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 {
 	struct gpi_i2c_config *peripheral;
 	unsigned int flags;
-	void *dma_buf;
-	dma_addr_t addr;
+	void *dma_buf = NULL;
+	dma_addr_t addr = 0;
 	enum dma_data_direction map_dirn;
 	enum dma_transfer_direction dma_dirn;
 	struct dma_async_tx_descriptor *desc;
@@ -639,6 +639,11 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 	gi2c_gpi_xfer = &gi2c->i2c_multi_desc_config;
 	msg_idx = gi2c_gpi_xfer->msg_idx_cnt;
 
+	if (op == I2C_WRITE && msgs[msg_idx].flags & I2C_M_RD) {
+		peripheral->multi_msg = true;
+		goto skip_dma;
+	}
+
 	dma_buf = i2c_get_dma_safe_msg_buf(&msgs[msg_idx], 1);
 	if (!dma_buf) {
 		ret = -ENOMEM;
@@ -668,6 +673,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 		flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
 	}
 
+skip_dma:
 	/* set the length as message for rx txn */
 	peripheral->rx_len = msgs[msg_idx].len;
 	peripheral->op = op;
@@ -740,9 +746,11 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 	return 0;
 
 err_config:
-	dma_unmap_single(gi2c->se.dev->parent, addr,
-			 msgs[msg_idx].len, map_dirn);
-	i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
+	if (op == I2C_WRITE && (msgs[msg_idx].flags & I2C_M_RD)) {
+		dma_unmap_single(gi2c->se.dev->parent, addr,
+				 msgs[msg_idx].len, map_dirn);
+		i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
+	}
 
 out:
 	gi2c->err = ret;
-- 
2.34.1


