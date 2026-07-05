Return-Path: <linux-media+bounces-66635-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HaGMJkqzSmpPGQEAu9opvQ
	(envelope-from <linux-media+bounces-66635-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 21:40:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF0E70B065
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 21:40:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EDqYFdv4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hTA9Hu8K;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66635-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66635-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31B523014979
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 19:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF8239FCD2;
	Sun,  5 Jul 2026 19:40:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F3B376A16
	for <linux-media@vger.kernel.org>; Sun,  5 Jul 2026 19:40:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280434; cv=none; b=cC/LiyjKk8eYZYuVQg2+GaIdz3pCNo1AenhASCHgYdxm9Ug7OvnKL8X3FVVnQtzcJodfUof2DMZFo8P4HhC7sbyG7j7xKVBPLaDJtsrhQVUNbQ7ejsxtma6VQAFPqmBQkpGrY0j+DYJmfvn8alEnkkTWTJWWMIHmUzp90Q3AbPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280434; c=relaxed/simple;
	bh=hPzzIh+00z/2sTyljZcHfK6TfnoHNAT4ontX894B59I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxsKvfKockIv8xiJjwZAIqaLaFnf8VfAHdZDb65DL7m+GuLlgwGzo1BaMno+7INWNiIpmeuDMTr+IBByWcPYq1a1ZeK+u+QHG6j+b6rq42PpXrNKXtjs8/OpdxPCykZ6ndRDVhnjegsWul/qEjVYlWY5Uw+s3bPGVyNu9Dw50u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDqYFdv4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTA9Hu8K; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HiKW52348194
	for <linux-media@vger.kernel.org>; Sun, 5 Jul 2026 19:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=03p+FFlmwi4
	5suRC+aZpApiuhNt9KA4gObs4WxBM+z8=; b=EDqYFdv4Pmeqy9IR99dcNiLiDAT
	/yuTE7Ljg9Hev+D7GIua619X8FUaXVlexko06UWo2I1UG1HwTHa/3pcOiO1FNKdk
	YiY1UO4+AP6rm2LO5F78feakLwRgePs5DdWtrzsXwhYCgTfecFqPFRL/MQqcfyO9
	pb9r2UQAkfcA5gru+dfTHa2mdfv7340zDAANejxt7cH1lKuJqEenlOMOzxtkjth3
	hBP3jcZzSc9vRDjWjL0r4gMT/svWmjZh1dvVGSJdpYFTDJ+ZtuRTINMxgHG6Wmig
	3zizUVw2wRtMv7D6VUvWZqVy2hRD9jXlwyfLqvXinpJSMddoU1sfRGdzOYQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64ke0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 19:40:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so1730103a12.3
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 12:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280430; x=1783885230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=;
        b=hTA9Hu8KPQHszEz65Og1e9gCQW2eZ/sQXpMHuEmDsIJTuSZhlakz0b6YBehrxZTRsf
         mtBtQ1/+gV5LKqBDYlUXERKyjBDSvb4rzy7nmdLvd6sclFPtLuwfp3MRBLc7J2YLY3e9
         pEs5URSCAJMxiExSa0RQY4a8qSd0whJb1J8VH0KjHnQmoHg/vmWgaOYJdS105iy1dPm9
         wJa1dNDQdLzfCWekV4C4TM3A0PCBkn99UKowiL4UbwzPrzHhmGisse2fAJAgNNMYmFDk
         F0hX0peexMwNXI1r8lREqei+PM259Y70EHyCtHvZeCQ7hx+YgDTdg0tq97sN6IaHtrt8
         7v1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280430; x=1783885230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=;
        b=FO6n/zlMUa9xOMt76sr5eTMShK+HUqpiczoiVmnczxa6qSqBMQdKkhCbyDuz0tdqf0
         z1G2T1cxMhl0qxNjdmw9dFBrfRvtWgfvqCn1zhb97imK01AYPqOzuVF4XYkAIVjmGp0f
         BjZ+Y2l+L8pVVNMIoMA/ZtG8KYcFsxXejsQJDGoj3NKVrVywmEzH1dyAgF6vAbgDOmSx
         WHhX1SMdlYYVWRT5z4ioxNfuMsibPYlFub6lqqZudPmx6O4zKzMqUaKdEjrev5Hgkw54
         A0D0+YWQNZNLuOXIAjUWxTKkUJAKsEzgG8GnaDMfExMbFw42qMlZnBNNgon1uyl7fDjm
         D3og==
X-Forwarded-Encrypted: i=1; AHgh+Roeqn5rqXqcxkgGEyrjExJIxOqxwhEQjc5tH72kPw3pvfR8eb7g1zRuqSzIfOjpE75Z/F1kxjJNqXpXlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk9qSeq3wMvmq1wF1TdBVCT1UX04LHG1twmtNkEJbCmoMfMDaE
	7QT/QmjWvNn8C/rSsMVtmkzeitLJqQhmWWmpQgYMykpIYHJYB3BQd2hdHKAzHKHjG5KLjRPEcHJ
	2911uqgKREq+RNd8F17CaLzpkYqqEhOfP6VrnMLgLKUP2i13YLdZImh80HeGtnzfycg==
X-Gm-Gg: AfdE7ckEeJ4v+aOnrhp3KGz4nDMflW0knfLe3wxnHerCYgq69QUrJ1mADKp62EPyTtL
	0vGVU2l/y5zxSjcSxYmEGBMmIO69GzwBxETVQ1g3xmGvyxeXO1UzToHKTEy58wkdywLkR9mcaAX
	Lj8BYeQ1Uik6wUUhOu3u5kWN7IjgxItltpifnVi1t/bu+lX/pS/gvO/g1qkLEZJNtuakMRRawb2
	vOkf3rcQ1eBQ+Jx+OFCL2oaxs/ztwgc2KRrNwBDxYa4sbQj4uVIXZAkIM845BOxpKfQH9dytVwf
	GhojqfIeRRX/iLDDvfekvlmmnauF87+8BX/zKJgqeCryIOSc/LO7vHlghUl6Wrs1AzuASp/IUwL
	CeubVRRVCvMIux+OC6riBVRNP9tXCL8evQjaLWQ==
X-Received: by 2002:a05:6a20:a122:b0:3bf:9944:a8d8 with SMTP id adf61e73a8af0-3c03e3ed638mr7693670637.34.1783280430279;
        Sun, 05 Jul 2026 12:40:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:a122:b0:3bf:9944:a8d8 with SMTP id adf61e73a8af0-3c03e3ed638mr7693658637.34.1783280429779;
        Sun, 05 Jul 2026 12:40:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 33/42] drm: arcpgu: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:09 +0530
Message-ID: <20260705194019.2565498-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXxnLlkvbD/+L5
 c1Hb8C4h9Qr7qG2RUQhQUeK6bQSwdxdfyjtWk0rHOjiDGibWjqf+CgpyAi0XhT7nrxV/J7wbLJw
 1FeReEc2hHFoNyF3ctU5Ld7kkVuzch9Hrpv6+WB3fVX0X8xF/5s8J0xbBcQk/Z5cirXlyDKfcAs
 jOQEnuOrnOdBPOWd8TY8fCeKtOilUiNd/g4FppqVXBE2pcR9xD1hOZmlce1g4TgSXKsYMxVze3j
 7qThfir/R3kWEsOWQPs/lqa+jjM5zAdKPt+N3Fv7H4Mr6Xcl8ybF7IliQ5F4VEzgApVjOu5GY2N
 Zi1/t+1AFZx00WAepdPQsZOppAuf2u8dNLuMTdAGypBCJQiQnY+9zl2zN2zdHhFWm6STHn17nY7
 O7zrVnCTvNOmaDXNi0SCsDHHZsQW0oIDNfFOq8IVT3susoDEBZ9OjIC2jK/1atWJBZw7DlGV2q9
 UJGe1Uxvbg9N8HQNjTQ==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4ab32f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=lEtn7xO9CsvGDZioIccA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: f-5FkMkHs-K2raa8_W_15Br9_HEKganf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX+x66HaTHhtE0
 DGZAyJynbiZUwgg0hi9xfg4H3FDrkxDokzkAFaGWCUKzUbBEauZe7v8ccpSdgKNmN0VQUfxBpz6
 FHfWU/pq7ErgMOhqeFAsgjmZybXLH4g=
X-Proofpoint-GUID: f-5FkMkHs-K2raa8_W_15Br9_HEKganf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607050212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-66635-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:sound-open-firmware@alsa-project.org,m:konradybcio@kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FF0E70B065

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the optional reserved memory region is released on device removal,
fixing a missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..fa01407570a8 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -278,7 +278,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		 arc_pgu_read(arcpgu, ARCPGU_REG_ID));
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
-- 
2.53.0


