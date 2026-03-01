Return-Path: <linux-media+bounces-54009-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJicFK9CpGl6bQUAu9opvQ
	(envelope-from <linux-media+bounces-54009-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 14:44:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD4E1D0057
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 14:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27B29300F133
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 13:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0D832F75A;
	Sun,  1 Mar 2026 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YoC2H12T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KeqrARO/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B8532D43C
	for <linux-media@vger.kernel.org>; Sun,  1 Mar 2026 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772372650; cv=none; b=bZjakbRYg5yqXkhJZw86rEo3HCOTesO+iqMKvuUadrhQdvAmCRCng2afEYTaz9/3jJ0AQHcW43Mn/8BwyRZoB2WkNgX8zSWkWB+Nbo4ilP77cKkEJyb94XqXPIoGgMpMMdTLzXYo1l60CStJNRcyLzx/2Hd0cg0Sv2+ZjL3UPxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772372650; c=relaxed/simple;
	bh=Nl2z5pbBFpfOc1vfgXgntSunMp2sjl/kx8Im9n4HFWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tMZgCDGirUX38CNBgnYhkt7s9W1uzc3qk+veybMxh6MtVUh7g5rL2igFzgOlriH6JOEZRfr6sTJRYtUDUJ65mLRN9UOrht641N+2wMCLFYij7CmfMYwLCSBIgCNSsXd0Ni/4RCaLsJsq/KbttMUqb5qK1wpPBmd9jVIqkwetxSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YoC2H12T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KeqrARO/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SH05mU3052415
	for <linux-media@vger.kernel.org>; Sun, 1 Mar 2026 13:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pHUoDHbp/fO0Pu/cIw4kKzW9BV89I3stMND
	+VHsatJw=; b=YoC2H12TlUdmCqPm+6MqRsNm9EMrVXnC9pYTKWMN6Kb7W72NanR
	344KcSP1B5gws8rw5x34WoLeKyt5pf567Q55Q/AlJJct/yb7ZP1aP/3kt2P8m0Ai
	+9TnhpdEmypwRhAGTrolraL7t5L/sdH3pPY5S59+eGJ986PeMzc74+GLpGJGriir
	/FmO6kVzQVpplHhmkveC0xaX55eaqQYc/mSlhjSk8dPUBUAi2HsvI0LNm6Ti0XdG
	/O7NYhOsVkzwQKK2SrxoIHQWxTRW/6JRtZCN5YqdjmW0Iq+zFC7I/SQV0AGqcQQs
	TKXb/cAtGRQznLzyaCsyLP7Sf2Q/hx1qgTA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgrtsrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 01 Mar 2026 13:44:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3d11b913so3102021885a.1
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2026 05:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772372648; x=1772977448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pHUoDHbp/fO0Pu/cIw4kKzW9BV89I3stMND+VHsatJw=;
        b=KeqrARO/dWgPlv197F0BThZKT89mRNDFk6OObnRsLkgrAKx4FmeleMfcLW17DDz9T4
         x+UQXg5w3qlGGpUP0mVe2pq9xSizXELluTgQ8ytsEDA5Bd8STFcZ4ZYmIuv3XCBm4iU+
         +1MfkbuWq8+Ivk+qg3sQstjJzsHnSV9KutF9OdpvA/WMAARJhLwQXJhSrvMx5RZF+p4a
         UTI/Vry0E3hTt4r3qbfTUlVOpgh71fljA3xxqmRpV09TETqZ23zxnpZrp7L2ae4svJrv
         EnpOv3gvxFgguv20CeMpfC27eb4y+0tVJNW++JLyVGWz+9HyJgmFUcSBVo7Ip+4WcAXU
         fzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772372648; x=1772977448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHUoDHbp/fO0Pu/cIw4kKzW9BV89I3stMND+VHsatJw=;
        b=xVeA4+JSiMZ8rYwQDcNy+1BuqQ8OFfscNvTv9r2IRUogHVy/OXDg3/9OB6MJgzPOO5
         9b0spj+jgSn49IWvToqzmd4wDdgEhBqtD5tksVgGogO05haZ4m4hDNHbVHFVFfAAjRaD
         MsHA9kupruki8nVyj5uvvfWD+XArNNwIW0HTW23EGoS1ei87d0t4Nqi1WH4yK9rcmMzG
         tzaVo+O3TpOxjUWXPBnsXO4C/KdZ4QFihTOtd55KUh3bEdHDslseLZXyPjJyAh1dWaVz
         rQ5scKXQq+qgsXtuNHjlelyA/YnWJrNuWNMUvCTSTyppo7XG8n84opLqbxo6vsyd/6px
         pXcw==
X-Forwarded-Encrypted: i=1; AJvYcCUxE1XgNzCX7Gh4bReYJYy4AROy9Ls18owSL0uID1rr3EB3OeRi2XIYOtJaSnA0ErIOdepRU16ort+4fA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7SKwznOStAXbeh8MoQNkFE1teoFtTf+9Oexj2FFB6Qlz5G7Kz
	xQ1kCMqrt5uS3ca1v4QpyMsM2b35LfTeypJMDUma5/GWVeDbVwUtC4G0P1SGVa5XDK3koHJMSn/
	GmA3nyqP7/fTkXMOjQIfUmWveIeE3U8Sr6pns72GUTTKP15Xs/J+mrBDFJdIEC5c0sA==
X-Gm-Gg: ATEYQzxxDj9qyYvuo4WcNqd+HsKVHo1RSPjYrWaH/Aqb2FB6z5LjpgsvWemMht2obXK
	cAvoDFzRuVi3hB7t3j5vt1uaCHh4VcC+rcMewdPAfcHIXApGmn1lyeOs2byscjD4DYLmdzmIOzJ
	fQkDm5iTxI6ew9aMajYAWdx+B7A6IN2TSKLEjpFBBHlO3dyLyxr4kNmUYk+kcYBAhmRwHx7Tidn
	Qe7MMlwssCJ1WUujbzNWilxyyJXiudL/F05xSPgZt/M384IuYRNq+rMsqL9X9D3ucH79yFHoumG
	Hb8MnZJ0kyzbsQxKa2JLNMS5WkKQOkhU1RPnl5vkGsDsHIA7WUTVaec9wbiaiiIeM0lSIXuASrv
	zE0NJelCLFSGJpfvYUEz6yY55AtUoai566Gn/
X-Received: by 2002:a05:620a:4041:b0:8ca:2cf9:8198 with SMTP id af79cd13be357-8cbc8e4b61bmr1095155985a.40.1772372647926;
        Sun, 01 Mar 2026 05:44:07 -0800 (PST)
X-Received: by 2002:a05:620a:4041:b0:8ca:2cf9:8198 with SMTP id af79cd13be357-8cbc8e4b61bmr1095153885a.40.1772372647508;
        Sun, 01 Mar 2026 05:44:07 -0800 (PST)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b503424fsm3255099f8f.22.2026.03.01.05.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 05:44:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [RESEND PATCH] media: samsung: exynos4-is: Simplify with scoped for each OF child loop
Date: Sun,  1 Mar 2026 14:44:04 +0100
Message-ID: <20260301134403.53643-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Nl2z5pbBFpfOc1vfgXgntSunMp2sjl/kx8Im9n4HFWo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppEKjkr5yXjBNan9e9zB+KhsoKO0yxOdrIhWWq
 hE3WdibZ4mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaRCowAKCRDBN2bmhouD
 1xGwEACFxUx6NzonYDuGcQoqsqmeUmGszDXJzjs+0xdap5PwKOQCBZ3dsb6IOO/7WEnRXubAxu5
 6cJfqMec63F4lj7Av2bE4feHgptCk3J/0dm+nIpdAVA8W63oS83aNqGJaZrjb1CFoGJ5kTaMOxb
 en84EczYSG6ci1de/QSptEwSNZ3+A7jfQgYG/C3qXsEcxkscEJ+FmP/lXA0togmnGIJz9Rh8rhN
 qAttIolSX83+qGRCZ87yQZG5AfTA8yoxxzZp5FoLktNhnN/sI/MA8m5GK7UfivCJW+axTSsUWfI
 jfqaqaBrZc1mHYygVU0/Dcv7FlR3tNOqkpChGH3zj312RevyKaUfvWk/D9Aqqn2aswFZwdn+VcB
 2ZD8ETv8qxXMGDMOKBq/HhTj4Bta8FudKYHge6s/0YKypHgRPTLheVt+bcVgcgYXaaDp2zuqORJ
 ePyBZkNWeImaU12TFBz7z1MeWEpe1iENYk5uFUsb/i1Dtu0bH3pi4UyyVbSlwgcXOYpiPq6ibYB
 LwX4iMug8vaIIRxBhU39JrMQ2eIJDWdorxOsX6AgJ4NQqEIOmuG1lPvCMDYFyO7IL+5ll5x+yuC
 vsrBoDjQAWj2rcRr5tK3ZZAo9wZNL9g91HhZtBAolUEbqlhsc2DI9ZOQ1X20GVG8UMLcw7NjD+G oVTeP95SHPCv1pw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEyNCBTYWx0ZWRfX9w9a8ozHOcDZ
 kXjyP9aCJtjIE18Ye0pa+GXyd899PDWbu5jkzvMyE4KmUuG7chvGzynMSvKPSzOpbir5VoEsY3o
 lLlneUm4M0YmEy7f9SdeR5KOfBH0VU1qEZS0mKNVF2PdTMWl9a7JqRrcEPCkOSvuMaUdqF/CGSW
 Qz34O4zdGZ2tEaYw/hRdy9EWUUBprRzX5SzDVAcWbYqqzpAX+q7uw9dyDeg4Dg3Cjh7pmmw6Vfd
 TG3/JytV/cc6xaKLvcmhhCjXdGxjyqWuH38YANDfRs4OV8tkrfCIdmZXxp5dd03SbcFn6vxBn3t
 EfTTOsCvxV3Jb59QKrgs+BHuskHd3sc2GqZyjbHA8d8FXwVcfHo+0ytjgR7OPnF9xvNl/jFATQW
 SSR936y5EMGXQder047v6C7+Ly5jxET3q2FKGY6JNbN5IBK1y78G/Yzi0BE69TaGI6BBi5Ofecp
 R2qvT9qEB4A7lkRu/Kw==
X-Proofpoint-GUID: o0aDX443aQ7IEYr0tr6dHnr5Xm_ewE7W
X-Proofpoint-ORIG-GUID: o0aDX443aQ7IEYr0tr6dHnr5Xm_ewE7W
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a442a8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=i4aJ-GEgVbPWXsRE1ngA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010124
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54009-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DCD4E1D0057
X-Rspamd-Action: no action

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Resending after two months.

 drivers/media/platform/samsung/exynos4-is/fimc-is.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index 0827fdaf455a..14d84cc96831 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -200,7 +200,7 @@ static int fimc_is_parse_sensor_config(struct fimc_is *is, unsigned int index,
 
 static int fimc_is_register_subdevs(struct fimc_is *is)
 {
-	struct device_node *i2c_bus, *child;
+	struct device_node *i2c_bus;
 	int ret, index = 0;
 
 	ret = fimc_isp_subdev_create(&is->isp);
@@ -208,11 +208,10 @@ static int fimc_is_register_subdevs(struct fimc_is *is)
 		return ret;
 
 	for_each_compatible_node(i2c_bus, NULL, "samsung,exynos4212-i2c-isp") {
-		for_each_available_child_of_node(i2c_bus, child) {
+		for_each_available_child_of_node_scoped(i2c_bus, child) {
 			ret = fimc_is_parse_sensor_config(is, index, child);
 
 			if (ret < 0 || index >= FIMC_IS_SENSORS_NUM) {
-				of_node_put(child);
 				of_node_put(i2c_bus);
 				return ret;
 			}
-- 
2.51.0


