Return-Path: <linux-media+bounces-58027-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PByDzp+z2mvwgYAu9opvQ
	(envelope-from <linux-media+bounces-58027-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:45:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD3C392493
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0FC33095C9D
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 08:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826DB37D10E;
	Fri,  3 Apr 2026 08:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ej4FKVO2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMPbFf3+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1F9372EEE
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 08:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205707; cv=none; b=tJKMh2LUo7GMPEO8GuzfqeltZ8CCCrvYccWio9xXigB6L6Kyi3u+qlOZCj+uKHRQPQmcDEYRWOF2HCJlicP7YckzBCjj/aA1wlFy4X2yZz7dzUhiIZ6pZ5OWWyDAvuL+lnZC5GEjQzsUDTeTLzpyzMXBwFy+ZyJelKm5CUyHDk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205707; c=relaxed/simple;
	bh=/xJ8nlzEUwBgB9odC2pDNog1qLXHQGWB2GUPekbM6FY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MoHveTne0qsgQO0/SfAICBsWr/BZHtyxspx5HMDls6V4GxNds3X/oad1a2QQ9U67MnwSveEiaXBOsOHahu9gpTvR7qIWIhW6zN2h/I//dFFLNT1X5fnGS2fW1/MLnI00cOcLjvwSI+43kefQ1WWOpQwiFVNHnwlUB+iPaBkZ/QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ej4FKVO2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMPbFf3+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63342OFo3780261
	for <linux-media@vger.kernel.org>; Fri, 3 Apr 2026 08:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QmKfAmOnOoidKU2K7M065NqSIxZq6+lb/9v
	nAIyjv3o=; b=ej4FKVO2FH0oAp4MNdN5hb1b9k5gUhvwvlo86YCJVpzdmzRdxvR
	tVGpIhdjlHoSoeJQnQY+VGGu8Ul+8RQTGPYnGX6MaynkGvZFP2sZgBKU2uwphhzo
	s5MJt6+hP552oi9ARgCgfGY++KgDQVAKc2sgtxwtD7dK3hni3/1DQDOIcBi/+EN8
	o4uqXMR6qtpoDohrSaLpUpuJfRVVSgt2JgUrMWBNq9DQj/QABvcvWuwPi9pZ6Ju/
	hqfMW06cN+a7m2Zz8zYklHS6vFkvZypXv27+X3/vsSj9u3UDBLwD5taGuJgBncyK
	RLZsY9ex3S8ZCYn58Pvu9/UXYxA1DWpWDvA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da663gsgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 03 Apr 2026 08:41:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c646e980bso951709b3a.0
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2026 01:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775205704; x=1775810504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QmKfAmOnOoidKU2K7M065NqSIxZq6+lb/9vnAIyjv3o=;
        b=ZMPbFf3+ogIAK80b+3QVo+7FSh4eWr1JFUQW95LT2EJXYuLFaGkplNIY30wgvtcYPD
         HaLAdxI9AdzAXDdPL7udyy7uEDNFBECwVGm4t1EEgWQf6M3hInqbwbcumOOkKjugiIVw
         6yTvgC2sVGHp1jtuv1XUsZ5VHCv5PgQfGgl5MFYJYl0LhF7J9JRiaenwqJvIAZRPiZHV
         tZ1dhYOGY6wswJOoOTWzQq2iRbLcPaL/CXL9LHXKntLvZcGMj1t7DmYkDD0q+qTjI6ej
         04xvELaJlIdFVhnhYERmPWQ9rtMpD6jEw2Yeow3jbQ/ciT9eDAwg+J5EqCEwfOyW0r7X
         XTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775205704; x=1775810504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmKfAmOnOoidKU2K7M065NqSIxZq6+lb/9vnAIyjv3o=;
        b=WRVrMsgBEIMHngNZVzI7VBjzsnFXhyFBZdcNplPxAra2IosG3UCc6PY5+j1qnOtUbx
         I4ihxHTnXLA8EjaikB1uvQbgLCXhuTR/jqhhf7ngMWgCIB1bO1lXIticeSUliiTuNNkc
         YsRx2veNYZlhcFoGFmZwwDfgK0F7b0ugt1xRhDBVLa6zDOF8Vz1KERpKWp4S87SlU93U
         ed17zH/J21kseKSffiT3YgKUyhjbNMjaZ9GwVu/6IrFyH3pdNVVE2zqTLYhvDjeHxt2/
         zb6W5TindmL5+M2c4PAtsanA9SQ5ONQCWvsXulhbFGydboWgoXapyad+3pQhNhDYDlY9
         Ybuw==
X-Forwarded-Encrypted: i=1; AJvYcCWgQt8e6wOo9729BQ9zNCE1QAD7Fa/zj9TPUoDn64C8/onsTkdnECjX9aIx6iuxbS082rgQ2kvYdWFZZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7DT+FmO3iWmkvYGwMrVaKKv+CPbLaG1JtYqc14RHQrW+r41XN
	BtAuq08YiNEfs7CTx48e5jLqJfelYbIloePduzrvv3eJx3xVJ+B5R4saPFaF730mocL8f/h/HdL
	gytk42Oj3BQ50gtZuFixy3elvYTIeR7DD3FUvdCblZAA39QXGGXhlyGL5j2ZGziJOHg==
X-Gm-Gg: AeBDievwt8rnh/r/JbYEwrQq7uEBpz50kC6btoOZFZO2+WC8MBSntV9EO9gLP4bUUZ0
	G6R7A4pnzM9vPt/Uckzz3faTDbJAQ/uzfWr23rSZhmxSiKfukwjr6gy5IBTdigiaGcvY8j1K7hs
	nQR1PSJfqAjhaDyTQ9sBKxcMXTZVP/y+Ffq6Bl8BFdYC3INPxb5QpdDWiDgh3fAHXe/rjLQVbxY
	piibA9i04ntD1AFNii6tMftWZ6HzcZY45kU/zK2NjSxPyGrIEMk30bdaGTN5AIqNuZYIZ5zurf9
	QBLx6zcnAVAp0J1QfsvFQF9xOwiJ9A0a78O8W1WLpkWyoyJ/yl8Yd8k8v6RW5Nr1Fa3kr46rdvQ
	C9O1UvpC1pz2YZmtFSxZf4o0E1EGeKDQxW5y2/Z4nef52c0xXZcx6VXYp
X-Received: by 2002:a05:6a00:2d10:b0:82c:9c47:fef9 with SMTP id d2e1a72fcca58-82d0da34535mr2228687b3a.2.1775205704178;
        Fri, 03 Apr 2026 01:41:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d10:b0:82c:9c47:fef9 with SMTP id d2e1a72fcca58-82d0da34535mr2228649b3a.2.1775205703692;
        Fri, 03 Apr 2026 01:41:43 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b2714dsm6757172b3a.1.2026.04.03.01.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 01:41:43 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
To: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com, aniket.randive@oss.qualcomm.com
Subject: [PATCH V3] i2c: qcom-geni: Avoid extra TX DMA TRE for single read message in GPI mode
Date: Fri,  3 Apr 2026 14:11:35 +0530
Message-Id: <20260403084135.1300931-1-aniket.randive@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3NiBTYWx0ZWRfXwqlJT7joiHOT
 IJS0/C6uDZp0QGvQ2GAhDVMQdlyiGwJ3SXBdZ8WQM/oY0jy4FsES5xATQ/l+Cw3hinsr6gnL9nx
 peuEZo8X602nklMHyznFFgieUiAofluki/3e3e2aZYIIiTn7uYWgCm97iLPujU/I+8PoghRdGQf
 4iJbVSmTUZNNnpJuVKl0BIHsO1HZ73a09eiD9bLyq+Gd9juPEB0ljevI7lH3Pa+WkXKMqnga8gr
 FVhpk8FKn/hxCmsVZBm69In63YmzRepvP8IjhuepoKtN0guop5so7Ei7q9ALyfH2Q4TYzjG6Zj0
 aVQEnzH1lVZJYHOABhdrREx4QhmnkS6uzJTMzmMV1viMfar3Ybbejc9h1t+LMZ98T8LHaD8f71X
 5uqfz24tsmLcCksp3664ZdU3enQMQ+zasb8zc3/O6K0qplt+4irUeK1WmeSqwHTaLlGHEpRRlbn
 1OyVd7MK+PnaJZQAWOw==
X-Proofpoint-GUID: DsDNLjJNQIdpqqXpw4thl_JhcoyBwYl2
X-Proofpoint-ORIG-GUID: DsDNLjJNQIdpqqXpw4thl_JhcoyBwYl2
X-Authority-Analysis: v=2.4 cv=Acu83nXG c=1 sm=1 tr=0 ts=69cf7d48 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qPv6kJ6rrmvbaMxWJaQA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030076
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-58027-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CDD3C392493
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
Changes in v3:
  - Added comment in the driver for better readability and changed the
    position of 'skip_dma' label to allow dma engine configuration.

Changes in v2:
  - Updated the commit message.

 drivers/i2c/busses/i2c-qcom-geni.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a4acb78fafb6..78b92db7c7fd 100644
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
@@ -639,6 +639,12 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 	gi2c_gpi_xfer = &gi2c->i2c_multi_desc_config;
 	msg_idx = gi2c_gpi_xfer->msg_idx_cnt;
 
+	/* Skip TX DMA map for I2C_WRITE operation to avoid unintended write cycle */
+	if (op == I2C_WRITE && msgs[msg_idx].flags & I2C_M_RD) {
+		peripheral->multi_msg = true;
+		goto skip_dma;
+	}
+
 	dma_buf = i2c_get_dma_safe_msg_buf(&msgs[msg_idx], 1);
 	if (!dma_buf) {
 		ret = -ENOMEM;
@@ -658,6 +664,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 		goto out;
 	}
 
+skip_dma:
 	if (gi2c->is_tx_multi_desc_xfer) {
 		flags = DMA_CTRL_ACK;
 
@@ -740,9 +747,12 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 	return 0;
 
 err_config:
-	dma_unmap_single(gi2c->se.dev->parent, addr,
-			 msgs[msg_idx].len, map_dirn);
-	i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
+	/* Avoid DMA unmap as the write operation skipped DMA mapping */
+	if (dma_buf) {
+		dma_unmap_single(gi2c->se.dev->parent, addr,
+				 msgs[msg_idx].len, map_dirn);
+		i2c_put_dma_safe_msg_buf(dma_buf, &msgs[msg_idx], false);
+	}
 
 out:
 	gi2c->err = ret;
-- 
2.34.1


