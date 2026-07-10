Return-Path: <linux-media+bounces-67312-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3FfxHbkZUWqM/QIAu9opvQ
	(envelope-from <linux-media+bounces-67312-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 18:11:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB80173C7C5
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 18:11:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=niHyyzJ9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="RMjoaN/C";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67312-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67312-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE9A0300427B
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 16:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CA343B4BE;
	Fri, 10 Jul 2026 16:11:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2713AEF28
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 16:11:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699882; cv=none; b=raj2NiUz4YizJMpj3JYIQuN2g5gr2ZkYOfn6Y2utTQm6gRWTNMGLg12X6U7Kr8miBb5kAHbsmA6qhvxsCb4pPXcOfwDkebU2lAlWzrvGkYJ9OezGfMeCYdnAGVA4KevflsYnYt0IVemXGETFNnblif6YNPrhQ2tXGEVOLix6ErA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699882; c=relaxed/simple;
	bh=9AdOw2utOUy8At6CB5zdi6t3HYQn47X5MK/JJiqcs1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TLLKgNNX46f4AoLMH7DQuuRsgyxixqEMHEtLwTgzD0xNoWEWo05DxXbrofPlTDpKIF2ffNo/PGIQPp3LFnO7VelBJBzCe87qCXqu+B/HjqFrDyN9OYD5CtC2U/oKrJZ7ljJPRzzN49Gk9Y55MKgZklp5kw8c9sUXZDb1Grow8+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niHyyzJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMjoaN/C; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AEciZB1123525
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 16:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9KheAc7I+aBb0Mu9MvhRuCgqeY8ZW+ixLVF
	g/AQ6n/g=; b=niHyyzJ9n6F4jllZESey+VgnsJ0EmhI0zq+OrGKZ2UwTUmL+iVx
	MbG+8FhcJ9BGjmfpQNPgJ10f3rax8Yy1oVVmGZexTbWWfEXs2zyGUEx2Xx+XHoGP
	vec/AL4xZr9vJRXrNgKyhH4BuDWhg85OkpYNKccqNFArk0DywZIIzTLHH2dHMq8V
	tds6InoIiZLKpgKPjpcXteW619tfxI/VIYu+Ulvhf6wFJQRT+g3quUsI4f+lTE5t
	RjXLxLhOWy2vXCbv52voip4K4hdIVLhFXTw66snsH86nWSIz3AmsCUDPsnPrwrsV
	UsOkVzZUIoCF+XKmIP6GrfxsBS4AlrG+hfg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n2pya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 16:11:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8486ffba174so1713659b3a.1
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783699867; x=1784304667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9KheAc7I+aBb0Mu9MvhRuCgqeY8ZW+ixLVFg/AQ6n/g=;
        b=RMjoaN/CujgIA1VsRygCHjqn8SBuidqNfcUDEfOJjN8vQxrDwL+d2BqoI5PmN+miSd
         Ma1eI+zCFES6LYNHRUUXDUVpxhpcoglEMir/mAFBLVGa3VwY7+VM3LqwhWe3FoaLnqBj
         5GubG/kMPra2RkcCL0IFGM9CBWfLQvjc2sHEDK9IWlrgmAnJ3lu9CfjE6A92+sQFBKoE
         ZoLnykVPzMd0FB34rDtkHXx2AWU7+mmW1VzxxqcvKOdkN3ShzmsXMy/ufzpja90sv19H
         J5CPdGIBrbTK4MtvFdAbhGLXQRzv0o7OJhBtTgYWqvmO1WyoqlP+NRv/hl8Vg9eWPSXG
         QDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699867; x=1784304667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9KheAc7I+aBb0Mu9MvhRuCgqeY8ZW+ixLVFg/AQ6n/g=;
        b=LRciRnxhfocdEfo2BQLQu+0cZoYdFhc4VgIUPChQi6lVMyCtlvpjcw19pRhnPVFRnu
         /0P85s4bUj1DRooVxTby1BJRy3rS1aXoWatavWSgOXSSTGlFXgkx3xewStSjdTKeoz2T
         Qrez6cfD0Nk/eXEWmtQiFOYG3ZxmVMh3lS4qg8hCBQRK/8TZqCGRILs5uILhO/B/mW6k
         dIoWdZPVif5psgdmcG5yWYX70Hk7V58QQT0SrM1ilid/ZB1AhBVzZ5h0mru8o2v1o96A
         usI+t6zy5cLkjphH3NsMn8CHl6+ZKHGniSuyxmVmabldws3voPk5pU5M5k12zkijxB1X
         JTOA==
X-Forwarded-Encrypted: i=1; AHgh+RoEjL66taGyoSQpX+AcKnwoTD1xLjkM4xcQ2hzQgmLywsmjf55Juw6SA2JrGmXoWV5802b5ci3YW9xECQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLlpvB1I4r/IZQP8MpePCus3GKEpPr6idGf2hwFUfNVwRd7AZE
	zJK+LZSm6oPtLnLD1RlTwF/yx6LKeHyl+jRs4pLm3RvJbZUe57cUkPtBL/AvVQtw9SQRJsrOl6w
	kTPG3efQfNajm4CwNfBBm/jnOGJNL1TpwEsEuGu5eLCfEJfxnoaKbcx17kDdixrOybA==
X-Gm-Gg: AfdE7ckfGuTs9A0A3oRtvWi95OMy4D3s+tQGYzmzNIon37EZ/tDofvRlrgf0nAHZvNA
	/anxYPqz+/nUA7emZul6QE/owYt8Cx862rm8RRx48xnbBgQGfci/IasEYD73MEEaDTSt526NNHL
	1RC0xf4I3GuRIelx8CArLIeWhD7gdmXTwAaSAEjWE3RwggyKaE0Ubd4hCqnzAthHqBrzlu1wTmv
	8KxX+3t/Kj+CkaSX3Z1FXsK3i0cfPvs+3vX+tNPejQFZT6Lns2UokOeMfcTakULPbRMEHRMOgkU
	wSB48giAdmTEBMV2s4128dIUw5tJHR+WGA4ZHVDsBZMmOVZCHoK4KrimKUhNIzq5HcrOU8HNJ17
	AbNc/24ZS9yAcysLc96GZRVSawKOpZ1FphAEL68peVcuuhw==
X-Received: by 2002:a05:6a20:a123:b0:3bf:97e8:a026 with SMTP id adf61e73a8af0-3c0bced45eamr14574933637.25.1783699866561;
        Fri, 10 Jul 2026 09:11:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:a123:b0:3bf:97e8:a026 with SMTP id adf61e73a8af0-3c0bced45eamr14574892637.25.1783699866069;
        Fri, 10 Jul 2026 09:11:06 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b251eesm5128818a12.31.2026.07.10.09.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:11:05 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
To: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com, aniket.randive@oss.qualcomm.com
Subject: [PATCH V4] i2c: qcom-geni: Add dynamic transfer timeout based on transfer length and frequency
Date: Fri, 10 Jul 2026 21:40:56 +0530
Message-Id: <20260710161056.1799019-1-aniket.randive@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE2MSBTYWx0ZWRfXx+u134V08imU
 5A5aukE03SU3eNR1zO10JA3AD0Mr6A7U6juIJfTLowQnEQto3oit3VTSe8ePOGvvae9tkl2OHyx
 uyIatvq+37S8NPXvF4CCh5sDRw94EjQ=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a51199b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=z1CpEO-fZNADMcIYu6MA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: uvA87MkQariBqdssIxMObiCm0o7aWoA0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE2MSBTYWx0ZWRfXxHMeV1Gf+9pt
 Jla8ddmh/WNhX3OdrDm6v/LroFi4TkwtZOBXLqPKGX8nkcsR7DzDRm847fzveFhasNbi10YRiTv
 nAtflfr4sjaLLP3n5m6XHjEChb3QafDHD3IYa8sajuQbxZda52ZdbDgiZqFGLkIxCytxwA2K2qD
 +c/3ZxL30DWlb6AXQXql2Ph1s9dG2a2va32UsdN5+THVSSXXCx0nAHTbRxOZhQAL0Cn6Pcog8HC
 EeHn8FPjQ8jmuMwAWJ8WU3MZGGlVHkGeU/7nD+/1i8XdnELI6S5OXD3KaMenKILGgYtn6dP860z
 5/ONyXspRw4eSCh8JdDnjQ7z+sVfNe89m2hFdTTghUpGmLa8YanC6iCdUWVlhhpIepSklBnopFm
 VT7qhhFeoPrFv46h4wePapirI55lhAtkC9T9ZjFv3qFCkyX5NGBZz/iL20zdCtFoqXaInQQgsOQ
 /wRnAe4XTILKJZRY2fw==
X-Proofpoint-GUID: uvA87MkQariBqdssIxMObiCm0o7aWoA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-67312-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aniket.randive@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB80173C7C5

The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
regardless of message length or bus frequency, causing unnecessary
delays on error paths.

Compute the timeout dynamically from message length and bus frequency
with a 10x safety margin over the theoretical wire time. Add a 300ms
floor to budget for I2C clock stretching, where a slave may hold SCL
low indefinitely during internal processing. This detects real hangs
3x faster than the old 1s static timeout.

For GPI multi-descriptor transfers, use the maximum message length across
all queued messages as the per-completion timeout.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---

Changes in v4:
 - As per konrad suggestion used mult_frac() for bit_usec to avoid intermediate
  overflow on 32-bit targets.
 - Updated the commit message and added a driver comment explaining the
   rationale for the 0.3-second minimum timeout floor value.

 drivers/i2c/busses/i2c-qcom-geni.c | 46 +++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 96dbf04138be..c5c3adc8ec77 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -74,9 +74,13 @@ enum geni_i2c_err_code {
 #define PACKING_BYTES_PW	4
 
 #define ABORT_TIMEOUT		HZ
-#define XFER_TIMEOUT		HZ
 #define RST_TIMEOUT		HZ
 
+/* 9 bits per byte (8 data + 1 ACK), 10x safety margin */
+#define I2C_TIMEOUT_SAFETY_COEFFICIENT	10
+/* 300ms floor: budget for clock stretching; slave may hold SCL low indefinitely */
+#define I2C_TIMEOUT_MIN_USEC		300000
+
 struct geni_i2c_desc {
 	bool no_dma_support;
 	unsigned int tx_fifo_depth;
@@ -204,6 +208,16 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 	return -EINVAL;
 }
 
+static unsigned long geni_i2c_xfer_timeout(struct geni_i2c_dev *gi2c, size_t len)
+{
+	size_t bit_cnt = len * 9;
+	size_t bit_usec = mult_frac(bit_cnt, USEC_PER_SEC, gi2c->clk_freq_out);
+	size_t xfer_max_usec = (bit_usec * I2C_TIMEOUT_SAFETY_COEFFICIENT) +
+			       I2C_TIMEOUT_MIN_USEC;
+
+	return usecs_to_jiffies(xfer_max_usec);
+}
+
 static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 {
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
@@ -445,7 +459,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
 	dma_addr_t rx_dma = 0;
-	unsigned long time_left;
+	unsigned long time_left, timeout;
 	void *dma_buf;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
@@ -470,8 +484,9 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		gi2c->dma_buf = dma_buf;
 	}
 
+	timeout = geni_i2c_xfer_timeout(gi2c, len);
 	cur = gi2c->cur;
-	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	time_left = wait_for_completion_timeout(&gi2c->done, timeout);
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
 
@@ -484,7 +499,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
 	dma_addr_t tx_dma = 0;
-	unsigned long time_left;
+	unsigned long time_left, timeout;
 	void *dma_buf;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
@@ -512,8 +527,9 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	if (!dma_buf) /* Get FIFO IRQ */
 		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
 
+	timeout = geni_i2c_xfer_timeout(gi2c, len);
 	cur = gi2c->cur;
-	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	time_left = wait_for_completion_timeout(&gi2c->done, timeout);
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
 
@@ -591,7 +607,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
  * geni_i2c_gpi_multi_xfer_timeout_handler() - Handles multi message transfer timeout
  * @dev: Pointer to the corresponding dev node
  * @multi_xfer: Pointer to the geni_i2c_gpi_multi_desc_xfer
- * @transfer_timeout_msecs: Timeout value in milliseconds
+ * @transfer_timeout_msecs: Per-message completion timeout in jiffies
  * @transfer_comp: Completion object of the transfer
  *
  * This function waits for the completion of each processed transfer messages
@@ -601,7 +617,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
  */
 static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
 						   struct geni_i2c_gpi_multi_desc_xfer *multi_xfer,
-						   u32 transfer_timeout_msecs,
+						   unsigned long timeout_jiffies,
 						   struct completion *transfer_comp)
 {
 	int i;
@@ -612,7 +628,7 @@ static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
 
 		if (multi_xfer->msg_idx_cnt != multi_xfer->irq_cnt) {
 			time_left = wait_for_completion_timeout(transfer_comp,
-								transfer_timeout_msecs);
+								timeout_jiffies);
 			if (!time_left) {
 				dev_err(dev, "%s: Transfer timeout\n", __func__);
 				return -ETIMEDOUT;
@@ -736,8 +752,16 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 		dma_async_issue_pending(gi2c->tx_c);
 
 		if ((msg_idx == (gi2c->num_msgs - 1)) || flags & DMA_PREP_INTERRUPT) {
+			unsigned long timeout;
+			size_t max_len = 0;
+			int j;
+
+			for (j = 0; j < gi2c->num_msgs; j++)
+				max_len = max_t(size_t, max_len, msgs[j].len);
+
+			timeout = geni_i2c_xfer_timeout(gi2c, max_len);
 			ret = geni_i2c_gpi_multi_xfer_timeout_handler(gi2c->se.dev, gi2c_gpi_xfer,
-								      XFER_TIMEOUT, &gi2c->done);
+								      timeout, &gi2c->done);
 			if (ret) {
 				dev_err(gi2c->se.dev,
 					"I2C multi write msg transfer timeout: %d\n",
@@ -851,8 +875,10 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 		}
 
 		if (!gi2c->is_tx_multi_desc_xfer) {
+			unsigned long timeout = geni_i2c_xfer_timeout(gi2c, msgs[i].len);
+
 			dma_async_issue_pending(gi2c->tx_c);
-			time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+			time_left = wait_for_completion_timeout(&gi2c->done, timeout);
 			if (!time_left) {
 				dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
 				gi2c->err = -ETIMEDOUT;
-- 
2.34.1


