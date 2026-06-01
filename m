Return-Path: <linux-media+bounces-63285-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ny6JAlWnHWpbcwkAu9opvQ
	(envelope-from <linux-media+bounces-63285-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:37:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A66621DA8
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 209C6302CD08
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 15:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD403E276D;
	Mon,  1 Jun 2026 15:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aRMXpgxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqbFk/2o"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4556A3DC86E
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 15:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327886; cv=none; b=SW/UtkRIpFICRgoPi1Dd5z9wN1p1sZMKwn2cPwV8yfoLxy658uelI+TWtIsU0kOtVWJp9zojCUYakdC0Q2DI0Ro4hElRhbqMFW9O0KoxkafTBW4mPgc+n2rlcGS0vtrm2Qxo0nYQ3geVg5VPwFygOwQ5aSlDs3vtZFhx80VDYJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327886; c=relaxed/simple;
	bh=adx1msWxA++Fh1PpPgwxpWK7N0yQf0Y0EEQ0cVJu9KI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h+44nbU2+1Wtz4/b/dG2e5gOB5ocOAoSOrmBvRcs8yzgISjxd+dp3E05FDGrdkvKiD++p6puEWmEO7xZz4eISnnvDpHaBHAT1euqIOcthCA5qLwBlfSG4808S+M9DyPc17U7VOzcszcepo33yhfHiJaaZ9CPPm4IX8dHifEObd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aRMXpgxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqbFk/2o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651EgZ5A3563524
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 15:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ii7fyGQTy/LBy1oCRVi7nI5P43TAFRbH9oiPCikSss=; b=aRMXpgxvpNJwTDYI
	m5lPVLJrCLXdgf+5EIIMoHglObjoXe0pFzMEB5T8BjGNksSN+ZqqbYHGngCOp45O
	NlOsvWQRVKrKjgw9PLHIaIf0A0WIbs4OHqXyiOiYbRnZtw//41wPgBCy6ewYG1kx
	U8je/XJBXJMnzImvLs+i01PND2aX3CyrM9H8BGX+qBXMG097zbd1j5Vyl5lqmycC
	1lDumkaYHA+jzktCX7J8A0rUwL1tkfHo6ILeX+Y49dOTe5isqW4jxzEuHYj1dJn5
	EhV28trRwnAwrpn7JdtdvkD7heZ3/n+nwWdN+LrKvI2LK56FlTsleKF2QzS+ot76
	b/GBnA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6rxsrv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 15:31:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304d0d0b28eso2338419eec.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 08:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780327877; x=1780932677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Ii7fyGQTy/LBy1oCRVi7nI5P43TAFRbH9oiPCikSss=;
        b=dqbFk/2oae5fxumTQq43nKIX1dF5bX4Gv+aRl8HYrePEBUSaeElDkaxmBK7aGowUyk
         k4kJaqRpAL7uug7ybrF+VHkTZQKHj634tmiJC207Kq0o0+Cm/PlaMH/ycu70Df/1jnrf
         hJX7A99YrPgp7y1dhlwKnASBOIVQOB4YT90DtNy5kqTOJhfdG4KFA73QqDZ0rhajtnb9
         6IeZAbhO06qay5iqrmO4PmXdBKAOTDZ9eXgLPfhJ5C080ySQMyXhJFhh4L6dwifKg3/a
         KlHULxZMsSZd2hY4EQfrL/3RrxMACxcnuZLOcUkCvJw0Yb21J18qMb3UoMl9OO5zYVgn
         pzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327877; x=1780932677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Ii7fyGQTy/LBy1oCRVi7nI5P43TAFRbH9oiPCikSss=;
        b=Mty1taoAZ2PBtPO7/+zftK5h3E8yWDIpx/P5z9bFqAtxCMA2n5fHpC5k8c1muyanZj
         5UHXJrDj2BVsddsP439QJG/hbv+XzrfTP1aWsWTBAxPTyo0A5F4eXjlVaSrSI66MYdyF
         VlrlaobwFMN93sqSeP8ACv+8MUCpy3BeszqSoUMFGiifqmJurFnOqGWoZlyDXk3dfTBf
         jAUbx7+lWip7ANHEHlFw4emIWGknu+P1AG2pHJ2TQuHgQx2IfML4Ni4sJMqaYtpULsQl
         ufH79aCP7n5aKc2+RR+l3oxqoGLjq3aI+VyaYHWx7jPvWWlYciwxdqpz2x9iKN+erAxV
         mt3g==
X-Forwarded-Encrypted: i=1; AFNElJ90aE15BGsFa3+sjdmEtuWiko1RJN1rjcC4vIzQW6yh6eBIBLEOmz984x22CYieJ5aD7oHsOcBcgioq6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDSWIVEtqJ2/x33wNUjfNtZrjpY61vAXbFe/o25+N4UvGWO7OG
	0xAxWPszeK23fLxzHTTLtmRPTUXNaQcji6x1hUT6ziVPWNz/qnkF5h7a1KNSKQToyW3bxruS3wa
	aKuV67fW1oFtVjbillT6husdlSDuSKA5aODJOxTkvVw8eFP4n+vMS86EHYmoh85DJxg==
X-Gm-Gg: Acq92OFoWws6GK0DJLP37KAgEPkTK5BfBSxdihjobcWeRAvLz5yOs7k72+dwv9WJ/fE
	loJZtdu/tVJXiSA8L8FsikZB4jYBjR0XjQH59/O1GWxCQy7716DnT+NcfXujkAztsrgIwrB4OzU
	XYCUO/7pgPajRW8QnoFtwafZ/84kZ/5FwzlP/TX9fG0PFBiTxpkRypgsZLeJzO2J62aO3iUjHXC
	LxTdVbhzSKBc2nO5xMw30bHmgxb5BnDys2fsQ36M/cCMkgItTIz0A0lru2yf0VePS675qxK1oxe
	dscE8qKDRihohj6eMAjbqitvPY7OKUYhyc8FaRC4fnAXPyLwDoOMgqHns7/XVXV5ga8kraVeijk
	N571rNHXOh190Ze6LPWRMNJHCH01jjmSWpiZpgciSmp3Q5kprgOhDDvjYXdgNihaTl3tN1ki6KU
	v1bOx7og+STWI=
X-Received: by 2002:a05:7301:1e92:b0:304:8364:e95f with SMTP id 5a478bee46e88-304fa64b8efmr4571152eec.27.1780327876935;
        Mon, 01 Jun 2026 08:31:16 -0700 (PDT)
X-Received: by 2002:a05:7301:1e92:b0:304:8364:e95f with SMTP id 5a478bee46e88-304fa64b8efmr4571122eec.27.1780327876327;
        Mon, 01 Jun 2026 08:31:16 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2efb4esm9207707eec.8.2026.06.01.08.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:31:16 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 08:31:09 -0700
Subject: [PATCH v14 2/5] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-kaanapali-camss-v14-2-e76f26aa6691@oss.qualcomm.com>
References: <20260601-kaanapali-camss-v14-0-e76f26aa6691@oss.qualcomm.com>
In-Reply-To: <20260601-kaanapali-camss-v14-0-e76f26aa6691@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: p0nYSHqWU7oAfeTPs-7bfYu9vmdjISYb
X-Authority-Analysis: v=2.4 cv=dsfrzVg4 c=1 sm=1 tr=0 ts=6a1da5c6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE1NCBTYWx0ZWRfX6wdFZAHrYpsY
 +n3EC0j7yE584/pOSDrPgfeluLP6mAWXOOKXi3wcTyUzmWggror05MWtKQ8ysvfXCqf62vH5XUo
 ajY9YTeW6+um8Q9EB7i8WuelZqjZ35X2JSpgd9U3JoE/kxMGKuXhd1iqCPHhL+A3IVjZukrnMiZ
 W0Uy2gFU7BZ7VmAuw1tV0dtxUfuUQ4Bqj0RNnE1BUR1sqlKIJewsVpD/YIX7Q81ctp4NcK10+Yh
 biYCiQYFvaDLsC4sCDmE9oYBMqnFxxMbnhoQIdF12NdLjHtTrqWpmFL9g9IfbNk4KKw7hOEfCyn
 FZMc4f/u0VFGDqMeOtxRs9tjqXRsjqjbQ8zPpKxjqDv0zDv7dDkrzdhl2di5ayaarR9pAxQn6uu
 mGtEk09eSFbDNTd4mqaKZzJ8YT/62Vdz6qwX3oiLDBFYIKpNnKgoRiSKEnnwm4z4oh8FxIZkVBu
 NyfdRkTkGUbvtbKFjgQ==
X-Proofpoint-ORIG-GUID: p0nYSHqWU7oAfeTPs-7bfYu9vmdjISYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010154
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63285-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61A66621DA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for Kaanapali in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d..40d74966ef9b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5507,6 +5521,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5740,6 +5761,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63..2c7a0218a82b 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1


