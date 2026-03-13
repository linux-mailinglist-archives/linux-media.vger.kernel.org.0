Return-Path: <linux-media+bounces-55560-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNLDKAiFs2msXQAAu9opvQ
	(envelope-from <linux-media+bounces-55560-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 04:31:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 099F027D1DC
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 04:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A40C313EA39
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 03:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91C234C128;
	Fri, 13 Mar 2026 03:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZlkqNWn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9Ri1Iak"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE7934B1A2
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 03:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773372633; cv=none; b=dnHaPVxBV7M9Kp0FJKfSlRBadeOEiWR92df+6SW6FXpW4Gr29m0EkFW2pflHNUqW+v1Wf4mKdanPz9f2iMGMUfsYE2379JYqQDZM0zwc4L9m8Z5N7Rd6/tzbAuSfug9PPzvdJRcLmidS+KXd1lzgLEugJ2ilj5sZgoMpoxLkQo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773372633; c=relaxed/simple;
	bh=upK6uBmdFj3L01J2+uso9YhOoCCeQIlN/0kiddAlHQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g3UkBlK6zgLAwVhAgyhWdWktg9gtJXkIS3u08PZ+fukeqXtdprAMzd0Hig3GdX9Tq06IWp9ymrQGeaqQ92GQF7XhuGYn9iLwWkvHlXWlJZ2bkdaClLQHwnfkrTYta7F9nA2ZVzhx+Whc+DIumPZwkjSRPkic/7oIw/JYDbi5iq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZlkqNWn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9Ri1Iak; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CHV98N509808
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 03:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=; b=KZlkqNWnjEPJtHEW
	LKHlyAf2SQ1S8T31EhRaAeYbwKdEjWqyVYxDtIK3D75hpU0v1L5jOyU6Dvfb4TcB
	Ud4iQ3iAr2+uZKmqCnEBgiLSuWFnNiB3aBPIe/7frOmTt9ebb/yDBxko9gkXGhja
	ZNeEQ7lPFuQna3R3tgRrt0LG1y3XBfPawOq3OiF55LFKx8HrvZuqmx3iVbl2GVD7
	4WYBvs7pFQQH24JXGA9lLXdTyiX3QRA97f9zrM0oJIZFqs/nbtq+/ROUOAI2li7X
	OOQZPd07kymNU0BayesKDXU98MJOb6BDUw9LReICeQ7kajVTl2DsZGzWoG8vzrLu
	cIAlXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w3176-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 03:30:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd98d96382so232358785a.0
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 20:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773372630; x=1773977430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=;
        b=D9Ri1IakqDghMo4Lyndfa4QUJzbBqJjjR7cIxVabCNP3WjMur1j6vA+wKGfmEID1k+
         WD06gNvQc8FBlnhu1Gypm6RHdnNZ4xddggzv9850MzaR7JGot+BPkkfbge9Pi3kIlzGn
         W5YQBKwjdVlDd0RA2J6mRlBczwCOelcMWDejbTWs/MQZhelx+fCbxft2Ls9m1MQ+OlUL
         csuohmzz3Zw3busHz3qM3ebzr+ahtnAkQebvdW1q2H7rnNp25i9II44LDYC3OvroH9mp
         69kmMc6clyPUl8MDIA5osydQJR+DJXgmwfbBCq1QCWK6nh61oumm2n5/DQmq4yrGKNob
         MG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773372630; x=1773977430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=;
        b=LqWurU/L3UsVnVkjOPjJR4YKYwHjgW1H6L5yLfCw8Y+qvvFjs2fsSEJeRzJ8m32+QQ
         xtPgSqU428G4obXY9iFPPVjVZcsG7JbzVFa0rW3pAq8H5WEIQ/Czb0t4Ln519i0s4Vi+
         P7qcRUVsmxemOYWSh4PF5ahCXKnzIJvMCO7dfVPcqrvMgCmPyR4/Lnj3PhJJKQ10BpNl
         SM5BAmLhNAgQiIINwgG7R79vcp/qcEcM2UeZlZmJhkm07pbjPeybcXnHVq/296U4Yvpu
         uGNDaCGVYgnyfrtw0nj9HzT8CpZSoos1zHMlrklHu9L8DP5GYkxGZmTQHLNqz2jZQ8Mu
         oUHQ==
X-Gm-Message-State: AOJu0Yz32nygVNWQ4Js2/0R3zJ/IfxJhr1FN+Jfh7jGDI8QaPhQyPACE
	4cUpS1VJ5OnfIVe8av3Wshqy7Hir9nA6CGMv1tMAa0qX7ro9d7JLhu70kIKiq5cXNNt6B+7j1Ch
	SHp+RQWJRFIuH+8EZAe9E+BLns34EMgKZD/wcGuUb9QsVmGowlf3YvPNjnjXpj4xW2g==
X-Gm-Gg: ATEYQzyEZQs4o2J8sYciACf03kUS/FzB4Izngfnt29yWrGvhsH6k4Kb+ee7lXY3aAhX
	OxKD2JD5xXnn83NLhenXh66LRLha75pFmzfhheqYWPag1yri39ZaSfkLwwOStoXkm6ID/s1W9p7
	EW0QYuK7y3DaYxYY1dFhzKbWRHi6MOVC3v0MWwFl3alPmVa7hGsPO3ybid7/cOeM4UwYxNO0Aok
	zGeX4XKE3DxHKOXu0L3Lxn89PGWArKLtawo6GLdVbmeI6keHidrZ64ZeEUb6XrfDNUpcn5wdHy8
	BtfjT4XzjYyE8qhyzl+2ISNw0SROPnSvKSR2iZfnbRYGJrAxE8CYAgK+ncMom9+A6OedDviqssb
	BSqDmCAC2EjhFNouOhJBcQky+xovoQ3YpcCUi/05Ng4obBhHWcw1EIsng2yK+7qm/lgmDO2sCPM
	SLqrs5NF7gcmlFtp6wejh9PcccgvVSFdoKjX4=
X-Received: by 2002:a05:620a:25ce:b0:8cd:aa06:77ee with SMTP id af79cd13be357-8cdb59ec591mr274565385a.2.1773372629530;
        Thu, 12 Mar 2026 20:30:29 -0700 (PDT)
X-Received: by 2002:a05:620a:25ce:b0:8cd:aa06:77ee with SMTP id af79cd13be357-8cdb59ec591mr274562285a.2.1773372629029;
        Thu, 12 Mar 2026 20:30:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d93576sm11254901fa.11.2026.03.12.20.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 20:30:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 05:30:18 +0200
Subject: [PATCH v4 1/8] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-platform-data-v4-1-14927df4906d@oss.qualcomm.com>
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6161;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=upK6uBmdFj3L01J2+uso9YhOoCCeQIlN/0kiddAlHQU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBps4TLUpz7M5B0vAIIBK69EW/dnVi41Fe3qPEo3
 cdFp9aNC22JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabOEywAKCRCLPIo+Aiko
 1VSRB/4r5rdPxqkUWWpKYcTK2DMziBcScQhC09lAHUcNNNEokUHMMC4tc+sJPgibYPdY7gdasOx
 3eAFUf8dQvpCW3R2zMcpVxoTsGcSu+eDYoeeCwBCHJ9F3574rcECoK1pG1LOgV9PJ/TRGobzI9r
 QKPppE3uKGpV7GoMGWyayaR/3z124j1mreLvvtlPeZvwXonqWm51llbGmo6IpfbV2tfEWLUwApD
 Wulicj7AuXfJObmXHCZJUpv674JPL/lG6vT9RJ1Ywyp9gl3axMKfriOWEWfzhK4iFo85cdR0UqX
 7c7UqhhmXWzvVA9Ti/jJ1FeDJvKcYVdDF1YkJFhWXn2EtzyJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: sg5YasdPKWXeix6cvXWoFhlKDlR7KjJW
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b384d6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=hYMYe-gnznq9qBW6PAEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAyNiBTYWx0ZWRfX155yPinI+dGo
 rZTbDcXnimXb7AkrrtJMZgebSQiIEoOZwKJDd4J5H8ZrhCNYaTSm/DaITpJSLA/anu0jSi2CcQp
 Vo+JiWoXH1LBq95XjN45ZUmPb3K+Bu8RkO8rE402YZIICEHIuM/0hliQIcefMDr/QHNMhoCUfQU
 1b5TF6ZN8C+3K0D1YjnaqvhlxgMPFtA/+DueqgQ5RAx2hZvTD9OyAQIuHiyJlb1IjbsfYKFJjA9
 QiUaL6suhsM51eJu+9zOoGd8zulsO15w0KcG+sAIdCssUzBflNuAml8HXnt0LR1/i/bx9jaSX2Z
 sW9PcBtmt0UaT/tK0m4XzRguURoSrsHnCJtDTX/1qyOCzEbgQ9+AePASlLfLTyrj5tr/x+A0a0z
 V1jN0aZ9q7u9nzZyk5GTkzUUS2Oi5E2Rhn8AMtRha0wOPAKJHfG/PsFtE2QEXG9fakLoLvf4a5C
 uSrkEDi3qmla9AepFDw==
X-Proofpoint-ORIG-GUID: sg5YasdPKWXeix6cvXWoFhlKDlR7KjJW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130026
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55560-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 099F027D1DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PAS ID, the authentication service ID, used by the Iris is a
constant and it is not expected to change anytime. Drop it from the
platform data and use the constant instead.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c        | 11 ++++++-----
 drivers/media/platform/qcom/iris/iris_platform_common.h |  2 --
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   |  2 --
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  4 ----
 4 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 5f408024e967..bc6c5c3e00c3 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -12,11 +12,12 @@
 #include "iris_core.h"
 #include "iris_firmware.h"
 
+#define IRIS_PAS_ID				9
+
 #define MAX_FIRMWARE_NAME_SIZE	128
 
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
-	u32 pas_id = core->iris_platform_data->pas_id;
 	const struct firmware *firmware = NULL;
 	struct device *dev = core->dev;
 	struct resource res;
@@ -53,7 +54,7 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	}
 
 	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    pas_id, mem_virt, mem_phys, res_size, NULL);
+			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
 
 	memunmap(mem_virt);
 err_release_fw:
@@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
 		return -ENOMEM;
 	}
 
-	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
+	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
 		return ret;
@@ -93,7 +94,7 @@ int iris_fw_load(struct iris_core *core)
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
-			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+			qcom_scm_pas_shutdown(IRIS_PAS_ID);
 			return ret;
 		}
 	}
@@ -103,7 +104,7 @@ int iris_fw_load(struct iris_core *core)
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+	return qcom_scm_pas_shutdown(IRIS_PAS_ID);
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f42e1798747c..e4eefc646c7f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -12,7 +12,6 @@
 struct iris_core;
 struct iris_inst;
 
-#define IRIS_PAS_ID				9
 #define HW_RESPONSE_TIMEOUT_VALUE               (1000) /* milliseconds */
 #define AUTOSUSPEND_DELAY_VALUE			(HW_RESPONSE_TIMEOUT_VALUE + 500) /* milliseconds */
 
@@ -226,7 +225,6 @@ struct iris_platform_data {
 	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
 	const char *fwname;
-	u32 pas_id;
 	struct iris_fmt *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index aa71f7f53ee3..07ed572e895b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -360,7 +360,6 @@ const struct iris_platform_data sm8250_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
@@ -413,7 +412,6 @@ const struct iris_platform_data sc7280_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index a526b50a1cd3..1f23ddb972f0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -934,7 +934,6 @@ const struct iris_platform_data sm8550_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1038,7 +1037,6 @@ const struct iris_platform_data sm8650_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1133,7 +1131,6 @@ const struct iris_platform_data sm8750_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1232,7 +1229,6 @@ const struct iris_platform_data qcs8300_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,

-- 
2.47.3


