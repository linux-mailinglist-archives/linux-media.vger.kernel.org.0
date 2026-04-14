Return-Path: <linux-media+bounces-58696-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DzfN6bK3WknjQkAu9opvQ
	(envelope-from <linux-media+bounces-58696-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:03:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EF83F59E2
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4352B30B7BD2
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 05:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D162828314C;
	Tue, 14 Apr 2026 05:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jLO97UAN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jac/E4FW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1AA24E4C3
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142856; cv=none; b=WtYg9Kh9CARk/Wd1D4Rz7iq0XttNJmhdhdxL9xW5iF8UrO4+iigGTIvtBOBK9fqFUimijzsrQy1/hlpZt5orsJFTr0yHLo0+Rm99FgK+HNsKLSwqGAqnbtlYIp4reA5vvPOtaF36AwGGGd1e3RmtHy+bZy2bRcUD0CR3L3CpKR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142856; c=relaxed/simple;
	bh=19ZbFSBCrYzOoPAiGy4JxnUJmqAXRaE9OkXrzqWaqeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p4oomgCWhTSW4RQIg5yjLtghKqsZkbpa6tcAMqqcy6tHzmeIfruc8Z9xYolwQMEuc1TMvm+Tv/iDZupxJFGM9JSjBc57UuD6bhPOI7BKt+sNhzjzYQuNQQxIOFAY7WZnni+XoqGV9+nC/SwpXD0bAykxiIZJtdrz7HEahugA0aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jLO97UAN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jac/E4FW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCjCF2387051
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B83PPF7wFaLIu6P8FD8mebyOE2HBnaPVssabvl+NtcA=; b=jLO97UANvHvevt0V
	z9rEYqhZdFfOp8FDxjChbgfbWKgwqjyWRp2Dr2jSPUMAwTF2oThTTd24/De0r5Zj
	/4AYbHDFqeY7pvqp87iVvYk+lFqAqkISsgfH8b7l7IqSN1VuP807MwF8BxxlC1DY
	a6rQz0NYo5ciuPMKV1V1DSscETlPXRKYd9GcFkEyPMwguVTxLqJjhPhr7MJFbSFs
	VYnt6abzazI4ronkovnH9GcbYK1AUg9kCPJi6XDNU45xhlXt+ONbz46FLXeHHRe0
	XTTq/vL60McNdidRohoMwXZXSrcovLJZmjmW2cYmJvK5zXfqtMupMnAYdSF6b1qS
	jZmumA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w12gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:00:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24a00d12cso53138965ad.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 22:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142854; x=1776747654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B83PPF7wFaLIu6P8FD8mebyOE2HBnaPVssabvl+NtcA=;
        b=Jac/E4FWYN8Vu9NZ6CIRPjYhIz3u5r3BuPPCy+9smMzdQEqL7tKY13lqHe6x6N3RgA
         uBsB4GSYJl7Nya1dYYXA9XPFh1fvqL2HoluGzlq4al3bf28MjjvQizh8umYqa48HV2nz
         oo2QHQx23EPxggtgReRhm+MekO817zweGvaAt5RimGZjPF0pad3XzjdResKOD6/Pu58H
         sY49UIxAgcr0nHNj2D/HfQmH5xWpe6XCgHlGrVeRkL95eYlczauiIJE64Q6Hyj/zgZEW
         ULwSCDkMJO0h3H/8w352f+QvjrqWOqqELiZ3kpm69WL3gDcJGT673bYMkDiL/KWqW4OR
         Y/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142854; x=1776747654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B83PPF7wFaLIu6P8FD8mebyOE2HBnaPVssabvl+NtcA=;
        b=qDLl8CbUqxXcD3Rk2XnFCF4gzw5zUS3Vj03ZgqfPalnqVye+zEPzGQhTrc/EgenNYP
         OPSEUP0VKeXxFQEx+i6tDpUVgl8mqHnfyRAHIpueEcLaY3fgeLSe+sMR2e7dkdIrGKTJ
         ra9/oqbxfQasMlUifUd9Ffxkm/Xa7lWtA5RTDjXQfW3rpVeG5yUWP7PoyBJVc8jQPtbq
         7WsYIWZfr2HZUEmW/nu6T2e5ACNGa8NHb/0Zk/pU5oiBlixVHA4cuwYO0Q1VAdOxBfrz
         3w2g0UrRL4MTZBr9u7MXwGHsZse8OE05771Ysfr6Lpq0fVyXweyc0IqTse6xy1XYgf3G
         C09w==
X-Gm-Message-State: AOJu0Yyu+D9XolKAJAHls1RvA9hSVn4assDp2TDgrb7yMx6lVmZj6RMT
	7gWmZUQTvajlaTz6Zg1y7IYZFGMMuM00AQdVY0GOSDnFJhWMGtf6OyEsUCx46iijqyf6Ex01Gjw
	pPh1PgSZiXpwORv98P4+ZEOj5iY9gq1kUthGDN6Zr01aA5WumuzHpH48rmK/uJVCIww==
X-Gm-Gg: AeBDieuy+zfs3R8KWFQtHLmqT0x16RQk+Y/FEmmz4wV/oJWqcoJ2NFBD4DaNHXd7WDl
	kFZqH2KO5IcC+dhuLvtrd9AEdnBb+iHU2jv+6+KK0nfhYn1dhZSctrgEKJP5BQqhpGD+zLp6Pph
	QiN+k056jFjwJzOaf0mUnEqR0aKCuonPpnB1tu4KTrXycDjsBDaRf0sZLVXr7gIqJ+t+PlNSk0z
	VrlrQLer21BGkwQcWaUwSj500d1bl2paycHoewkvZZj9KOd5XZSufF4FrwPywCOzUV3snUV1Bd/
	lwoY0SV2mJ7e5MedyT96FKCqTtc8i1EXI+o6GjMto8wo0DUmEcqbqp9vNkteP6gP5kO4d1iBzSs
	R1xAXlSc5c0xiSuhgrfenyUBI/4dKtm9QUfAfiK2DdTHds8h32Tc1XoM=
X-Received: by 2002:a17:903:3848:b0:2b4:678c:5f1f with SMTP id d9443c01a7336-2b4678c60a9mr31930225ad.0.1776142853562;
        Mon, 13 Apr 2026 22:00:53 -0700 (PDT)
X-Received: by 2002:a17:903:3848:b0:2b4:678c:5f1f with SMTP id d9443c01a7336-2b4678c60a9mr31929815ad.0.1776142853078;
        Mon, 13 Apr 2026 22:00:53 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm134678425ad.3.2026.04.13.22.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:00:52 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:30:00 +0530
Subject: [PATCH 04/11] media: iris: Add helper to create a context bank
 device on iris vpu bus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-glymur-v1-4-7d3d1cf57b16@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776142821; l=2621;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=RTVvha8tR9bEWZ4zePSXsWhj5E2tt6V6KZzPhLuEtVE=;
 b=c+4W8E2T0rh0OB4HD2rAue10deepw7qHz+ZmyEpRFa2vnY/uZwGRfZieuCnpxWgESFhgVPjtn
 TQrqVO/eWF0D3kJzgO28CucNG+6nQbjbURMD9+4OE/ZsGfH5WP9nwx7
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: VN_Q3hitzWoo8a1GCu9aHRbWdsFqAhK5
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69ddca06 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yC2GhcDpJLL-D5KBa1QA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfX0XFA6zc+5ETw
 ottQNYlfEI3pTVkuGmis5fBGPsJpyYP6gevfdDwo5S/XXCbZsJp+D9qcLnYhtrtpJZ+HkefmsYH
 sjcdvsRrpjS9zpvzAoJBA+vonoj9tdqR3cJfkccq7ViRYzWsfg04CGMHSmdDZn8gzTQmszupvmK
 6LbBa1QQrf84KhJ6Xy3exhNdJzlp0V/Fdhp/2kC83a9JEtibZbfz2VQvzFfeyJ2HrAdxlSBG4up
 ugSkQ1tT3jv+D0IG+klA8ms8OOxz+LaJbfLjFZf8Af578Bs7n5vwlepKX+PQlL11jtmVeb+6ZKF
 plXcRL+dkURXp+4I5de/wSqgEmAvUgX55dyY4kY6v5Zn8WUjEu877gBtF+pK2GzbbGKNhLlkbOX
 MvicA9VfwUvg4PSBjG1pHqjj1KQsTyN3QxpEQCeByQvUnG4jvKIOjKI+XxVKQTT28jMwxJFmt8U
 IeEqVMNYdWubsRE7nQw==
X-Proofpoint-GUID: VN_Q3hitzWoo8a1GCu9aHRbWdsFqAhK5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58696-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55EF83F59E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add a helper function to allocate and register context bank (CB) device
on the iris vpu bus. The function ID associated with the CB is specified
from the platform data, allowing the bus dma_configure callback to apply
correct stream ID mapping when device is registered.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 33 +++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..a25e0f2e9d26 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/devfreq.h>
 #include <linux/interconnect.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
@@ -141,3 +142,35 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
 
 	return 0;
 }
+
+static void iris_release_cb_dev(struct device *dev)
+{
+	kfree(dev);
+}
+
+struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id)
+{
+	struct device *dev;
+	int ret;
+
+	dev = kzalloc_obj(*dev);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev->release = iris_release_cb_dev;
+	dev->bus = &iris_vpu_bus_type;
+	dev->parent = core->dev;
+	dev->coherent_dma_mask = core->iris_platform_data->dma_mask;
+	dev->dma_mask = &dev->coherent_dma_mask;
+
+	dev_set_name(dev, "%s", name);
+	dev_set_drvdata(dev, (void *)f_id);
+
+	ret = device_register(dev);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
+	return dev;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index 6bfbd2dc6db0..4a494627ff23 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
 int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
+struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id);
 
 #endif

-- 
2.34.1


