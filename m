Return-Path: <linux-media+bounces-57473-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM5EH1hzyGkNmQUAu9opvQ
	(envelope-from <linux-media+bounces-57473-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 01:33:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D6F3504E0
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 01:33:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95D2D3007898
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 00:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73371C3BF7;
	Sun, 29 Mar 2026 00:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ya9djmdE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDZwEGdt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB8D1CAA65
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774744405; cv=none; b=b89/BT/uCor3hbtRjvBpF7/NTPfZgD/ffoJ/aT4p9U8ZNF3zFx4j53XlJE21c1aXjgEORp/nCksHZ2KRM3RNXyBzcjNV4UvtmJlv8ccs13D0K+AAmceKrwsPENr903I+b9hMY+JPH2r3GpdcHKVcgEQCZS50xWXkTg+VVDhreV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774744405; c=relaxed/simple;
	bh=R9G5DrWK7ZdreBHQ/NvwOHQkAkxN8nydMv+XrJUDCnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCo13m7t9aGF6ThxWw5piJBKHIcWfoApzUjcfUW6/7cAebqBG+dgipO7nQV6hkNMscgGMyGR01XwoY4lN2CBv34xEO15PMhy7izvj2VxojwpfwADDfJ46jj3NF2qOWyag4RHk93xG2M0OQvhr0NmFjTYZRu5xLNS7Mv4+ppqVTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ya9djmdE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDZwEGdt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62SKdT9q822657
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yu4Ju/BNMWhFePsUEYj76VBRHr5svFe8Za8zkvDfGq4=; b=Ya9djmdE5C2/pVnk
	u8qbOgyadgRG0/o8j+Tfrz6ohRU+idoQsVFu1J5YNNm8MiMTk6C5e9qjPLVEjoJx
	FQV05Gp7CkqEyuNhhWXsqMxFAmDQk95JuGl+9DlE+b03Wpq6tbSISZv1ucKxildY
	ywIKg8cORZYSRR2k0vuqLiB9xSH8isaz5zmJ7o5pMl3823iKb2RKvJEVQrQoICDy
	DP2UKojzjG5zHFGb9y/Funk8LWACbuqeei2Z4xbH3k/DkPcYgqRk1AsJvGbRb+Cp
	w2ytSCs+jYX7vBCPYE5IWArisztl6OjtZHonYSt2a8tQMQWAu2zAXEV7lUgPDuvD
	pi9UoA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66afsvb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091782ab06so168860131cf.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 17:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774744402; x=1775349202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu4Ju/BNMWhFePsUEYj76VBRHr5svFe8Za8zkvDfGq4=;
        b=VDZwEGdt1lVZUToXEilfWZ4GfVl9JIAnqIIXxsTBqxgV+imi1yYMMYOYc6LXo384Hy
         JpjPoaUMfDopVD5ys6YMSKYtjiPq6aI4andoTXUtBVOpvcJDrz7YAs/kSh1C74zNec4R
         Cr06Yz4zdlKc0mEoWU83hYbRq7fTEvkIN1ZoWCYannldlUSmdaxrCantUjy6t3z5ApWj
         hKetGFHhBCjCHSt7hMGes+SOZKFBsE4DXn/xn5b8scZqrUZ+zYwmH7r8tVvx7PGbDuTc
         iBbb7vx0cSxiuQSVF+93cGKqmup5wbJiF2HsLZaO7MOjCaolnrv5QouXiLUJQUwA4nSu
         Qu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774744402; x=1775349202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yu4Ju/BNMWhFePsUEYj76VBRHr5svFe8Za8zkvDfGq4=;
        b=ouuoTzINnYShBy9f/85TTiV8L07Rb6+myqkyuF3i+9VPo+UQbgtc/cdINKwpgST/iB
         4cmHitBQzNs2S2yXo2tUyoI5JXyFEMRT+AjPXyvodXKS4YW067WX4qYsCQ7kBZDw7QTT
         w+qHg7qSDng5C2z6VcjYa56R5OnmgB62he5wahNYHMNp3WWEYaDh43UbKQ/MBpNklskh
         YxYdCCZfDumpriz5U/eqODEQ3AvYwa8OaewaL/oGt/cOnn4anOMzijyAGsQw1dVOfSWQ
         VqNZp6F0r4MoQ6x0BV/Z+tsaiqXu4dYgw86I3nXMSTwEY4TEDj2hXBMqOHx4dXMJNCnj
         NCmg==
X-Gm-Message-State: AOJu0Yy8opHEr9LdyJeOuW+4IQj5ApXsJDIgRD/MvgUvAliPkacZxsYA
	+VBQQBIdYuksOaBs9WNd3m32D34Z6FMbmjN9j1Ht1FxV0VL/nXY0yL6mdi3+No1dy0dCRPlzu6p
	SX7AGPEF8XV1vRqjI87NqmozTn4e6JFmGeUuvzyvE2MR9CkyGjA/rY6I35lNCxjimhA==
X-Gm-Gg: ATEYQzzOveXixmqYl1gdP3fr7TM6qyeDmNtiKS9T76EOP3o1pUUmxEXEJmEP7a64J6G
	M2S8tHZkLeOfYXKr3S7XNoQipTdfAaIC6eApCGcSIPRDTc3u7D+QhcAtYLjRGx4Soi3axvuQ+6n
	asE42D9dqbqZrz7P+UiwfbMIZMaK9Sp6Vhg6/MsLtLq91QDgcPgJi1lDGYl8IPsiJoSJLn1SFIw
	bd3qjPVkau6t0+aWVVLFoFfYG1umJmS2q1iKD4Td9VQpAT3bRniKEkE/B52nlj43yOx6haiQgVs
	3SCk5daSV9J2dHeXl4D93e1bka7QXEDb990CA1AOH5C2CNBRXHosT0mGfzmKpetD7MbYvXneYje
	eSKW0FucpbR3R1meZK4ErQ1jgzNzpG/ZxxEJAybqzAPacgT1zlkRhRIbAkMKu7ldr/0ZcV1ziA8
	yR1qkPuCEhjIFeA5ENiGt4vT43FTzkPs+mIsE=
X-Received: by 2002:ac8:5802:0:b0:50b:3c78:ddef with SMTP id d75a77b69052e-50ba38c8fabmr103942341cf.41.1774744402109;
        Sat, 28 Mar 2026 17:33:22 -0700 (PDT)
X-Received: by 2002:ac8:5802:0:b0:50b:3c78:ddef with SMTP id d75a77b69052e-50ba38c8fabmr103942101cf.41.1774744401625;
        Sat, 28 Mar 2026 17:33:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83892035sm7024731fa.22.2026.03.28.17.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 17:33:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 29 Mar 2026 02:33:02 +0200
Subject: [PATCH v11 01/11] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-iris-platform-data-v11-1-eea672b03a95@oss.qualcomm.com>
References: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
In-Reply-To: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6224;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R9G5DrWK7ZdreBHQ/NvwOHQkAkxN8nydMv+XrJUDCnI=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGnIc0egjt+DeQOTRkMh3QdYNg8EzID8ShgV8XCGmVqrAnQSk
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpyHNHAAoJEIs8ij4CKSjVfB8H/12Z
 fKrCiMV4OEPb6QjVS1cuA+4VSpa8EXZpC9rmfReogfIBN/0xCO2Tw7UAXiHwfWKMoX7adY4N+wn
 3cVWHtEmTnrrwc3Co6o7CwF1qSDBkbNZOoVdPzBUApnlyFDyWRal9iE5mEOUVEstKi4GLFCt6FW
 aFpF4hNcFlogqreA29UqMYtJkMGqyikBVsszyy00MrP0l9hBX1g5emOWJhyuCgkwSSP8wF/Ks1O
 GSenuOigxQuqsaOguIouEMRk3194EaIrtbleH3TaBDhZWgsQ0lNZ2gkN15xLu0nu3G3nDxGHCX1
 vFi4U2gaiHqxLhf+z5zgscMBnrC3pU92Ruy5Eek=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 86jpNEuYywyzvezOkEzlJeSLS5ebrFAk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDAwMiBTYWx0ZWRfX+RRGGO+4bqAG
 dv0Mj2Cd19thL94gkSMRiRp0sOiB91Wzmo0VD8Sn4tlY2MCIbbwLkGhtf4aCmwietGInm9Xk6MH
 C/4L6430SBVbtuWILlWrY+7uML5ESL2KSChVTSusEbnKsmwBAoJ/WoEYveM9ISiLvDk8Q8788PQ
 CdcaBMzUUc/Gx5TULXeLGHFE3lbErhjCquJ1IMXkmSgpZg9MKKjUQ/f0PS74nqqlCBE+xW9i+2E
 Fyro+z1+McGkfaejha0HCF8Cl5fFLFLhF04hJsHCeNiNhnTIYdeu/HmG7esW6lzrhFHGLUMJ621
 4DCcBAVNKOwci6C8ICMNc5lBd0m5Ici1QD14U0cLqJlrerlDaBZ1gTN/UnxpQMHlcOFwVjQMag2
 aRuHGUZSbeVZ6NLTUTLhl1Z581h5Oq57DKaJJ310tfixjjQZOf8w9onnVB/E6J5Avg1AMwqc/eK
 9tUG467L16UzYdZLhqQ==
X-Authority-Analysis: v=2.4 cv=KN9XzVFo c=1 sm=1 tr=0 ts=69c87352 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=hYMYe-gnznq9qBW6PAEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 86jpNEuYywyzvezOkEzlJeSLS5ebrFAk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290002
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57473-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 30D6F3504E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PAS ID, the authentication service ID, used by the Iris is a
constant and it is not expected to change anytime. Drop it from the
platform data and use the constant instead.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
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


