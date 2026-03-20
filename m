Return-Path: <linux-media+bounces-56453-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNJ+H9ipvGnD1wIAu9opvQ
	(envelope-from <linux-media+bounces-56453-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 02:58:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BF12D4F14
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 02:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 433A1302BBD1
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E57347FD3;
	Fri, 20 Mar 2026 01:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3T/0T2X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+rFbhna"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2FA33F8DE
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773971742; cv=none; b=IwcdXYJN1NS0ut4KHAy+WnzOmrrlsfgDAldlWxf+D0fmcwg5yhCOO/yawX7UD4U4l7ziDXoERj4wNIYW2SW0Jk5KE59+wwfHnvZjVmorphdrIbrR4z80io5ou3ZLc6P3+gperaEvUe9DFcTlCuD+AVPby0KDANrueyX1fvIz1Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773971742; c=relaxed/simple;
	bh=tosnyhh8DtswMdbD6EGU7YTtdFXnAzWlifAthWRXRV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UidQtRjB7brz7mCjZeNJw5qb96xCgg5Pi+Tosin2n3ZXaNGDIIXOD0mC7LP0GwOC08if2R1o43n5bZqkAK2wbmovrmKnGvR4deVr6VRlYZ2bV1ZpIqKVFVIJD3DLkBiRN9DBzUfio/bEv3FKMEnQmsEc5tcqusP+KSGl/3vPBWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3T/0T2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+rFbhna; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JNlR5V3648621
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zAAZ9np3vSaZuqX49z75F1UXFOFKtBEtrhQT2MwCAZg=; b=e3T/0T2XBfjsVQV6
	gO6KBbnstrUI7dI/EQjf6C9a0rgXeHbq/LIAo0kMx5ZkU/nopK01Wot7dpF0uN4S
	SLZ6mWk6YvOFLJ6iGNWu5rkTV/vf7gDCpdTyrpC2unzE2le5/tFtwu8rbVMrpIHM
	FJ4uxpX+FSs6PoJ278DZIR62Ze5nTuzma6WCUw+F13FCzK8vPs/Y+dct5A/Jlz3Q
	VnEkYZTGiKnzF1bMZ7DfBa5eYFuH74tKFmyhytTw77vqr2WxPTmUxNx2SD6ZILH9
	6xxtbwGuHXuMPIkwNSF9LShhn9cX5N8l4TXk9OczoSx8hK13KRvd13tIQ/XKyXBJ
	zp95RA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k0v9wn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:55:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091327215dso22460021cf.1
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 18:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773971732; x=1774576532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zAAZ9np3vSaZuqX49z75F1UXFOFKtBEtrhQT2MwCAZg=;
        b=I+rFbhna9lRQnml+W0MU0XwXl4M1uK7QbJcpRqLVksWMysm33+26giVVhnfR2uIiZJ
         yNHQgcibWppdW6iHuT+gLCvU/9VUvScB/aWytFvbcGENx2VNKJ9U6xmHIhrizTtQB/Qx
         dT5O0mOhZVcOB6nX0E34BQm1t4wAEkI3VvyMITAX9efo5rbZStHJ62BnTFp++4LZZJdo
         vJ5qUdGLle+SRa4kYAQNUjJFtsI/9Nkp4AIf5RdDc8kI4GIDxMdh0o8q/BloWiUcfTTh
         gyQ7hvNw932LqgCtkKp7yDMLA0hHXBOMPyA22uiY1SfFEG6ydbCQqeLu8oqtl3S1vHGw
         GnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773971732; x=1774576532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zAAZ9np3vSaZuqX49z75F1UXFOFKtBEtrhQT2MwCAZg=;
        b=Tdm8jq0VuNONR9oG6YUpO8zjbW6bnzdx+zhJG8WnpEaqKIX9VlJec9mQKi7znMUkpD
         L+UqX+bmNoVeEdvbM+Tc2P5851hLD3QoniJNtBrqATsg/qmGl2dvkxh9VY4uNz3IQ+cv
         2Ss+fefqeWBTstxErRAY+wCKQU5PvzpofG1hHAJgCEFaQTMveeICfEKr76axDxhthiey
         fR5tzQTyy6BBsyuNIngPo0DUzTMW340kfuSXGXtJrQFqW/lNAQlJtBvFt548yYBXHvrh
         HVJgwz6pLsOIkLAKkuXUMT9phXwxZLPKYpJ9Zt1tL951SZ/ItPAiC0+cWQUI5/GZU/XF
         x4aw==
X-Gm-Message-State: AOJu0YysDjS6zNdwOaIs1n0tPd8DOf9X8EyOBcel+r2VltrPQQoQGHWk
	J8PURd5j1JuL6IqscJ2rdEFHJ0p5OZTv1jCpKGMPIaxfC2BFzZl9Xg3+82l6Pbz+JkVjdXJ6s/2
	ykqmDQrCjVajhvQMPptr5VxahG4Q1jrBgB0h6cME6o8EhBQWYItGBdu7jPpHTwwynvA==
X-Gm-Gg: ATEYQzy+Zm+ymiGC7eE0On6DinFoh+gFtFGDTnHQ2suo8+4pYIwK2eH0bnm3MO3VQ39
	nqunCK+zjird9z0ZwrqROqt0BxsTSFjpABFnJqgJ10NijMRMIspE7LgAuyyoq2gqWHpGVGi1afI
	i8wo6+CGV2vffW1ISt/wLZbLQGGssDtu7OspDhGYiNjhHx5Ub4FAqY1DvDr5TsBsw3O2iP8etPl
	1oR+oHG8QiRVBBl1OtZsvpE+qKdrqE1ezFR2v9zTOKimcmsf7o6llWftyrFzKW/ASYNhAMW75Wz
	PwX+kzh1XyE7wpGdK3fCj5kh7Gt6otea+LGVZ9wf4R+nHRpaqCyDKt8b5tsRBI554z+3nGf6I1r
	Vh5jMlrIw2Af4s8vafV2wY25IvJ8zxRZM0r/ER8vEhxbLMAGySVbBJ2uvUy5tFW2NUwjHd3p/VS
	70YCrbfa6K7WD5rrQ4c61bPiPOKQ4H3YZNsI8=
X-Received: by 2002:a05:622a:a9cb:10b0:509:379b:d46 with SMTP id d75a77b69052e-50b373f128cmr18706921cf.11.1773971731406;
        Thu, 19 Mar 2026 18:55:31 -0700 (PDT)
X-Received: by 2002:a05:622a:a9cb:10b0:509:379b:d46 with SMTP id d75a77b69052e-50b373f128cmr18706751cf.11.1773971730928;
        Thu, 19 Mar 2026 18:55:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305eefsm232344e87.70.2026.03.19.18.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:55:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 03:54:51 +0200
Subject: [PATCH v9 11/11] media: qcom: iris: extract firmware description
 data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-iris-platform-data-v9-11-3939967f4752@oss.qualcomm.com>
References: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
In-Reply-To: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12526;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tosnyhh8DtswMdbD6EGU7YTtdFXnAzWlifAthWRXRV0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpvKjmI4E1wr9DKwJQ7Y3M8UWGSJNwUsYXGjgu/
 A/xCr2taxCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabyo5gAKCRCLPIo+Aiko
 1WvXB/41aSKcwqUeU0f7/Ih4g88dG/28asJkNq27A+Q+OI15F64eJK5Ld5CrmBzYt26RoOKMtuK
 SOZOcACPZAAkF3p1tujhJk0TzsNfwRBW8FzJsGOvge/r+VHbhn9+L7fyK5ZtMixe/+CjPC4UMBN
 HSswy+b6goQWOfxIiYaHhOdl3OQixgL4km5vJLhuoVdNF8dE4EmT5JyPs24vqiW9tufH/mZIGnu
 9zzyBI0y4j8XT2GR0cLQ2h32JpIB2/uHGpKuoYYgwdnjWddTp9A8afR6xRGjL3qb8SoE3wkUXOo
 iw42aE0S0vdLkWpfKscrJvNeo2CUTEuJ+x9M/nxMv9JQ86H0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 1AqyfqhNcqt63zX9ehNs4emnD2oK5h7m
X-Authority-Analysis: v=2.4 cv=EcjFgfmC c=1 sm=1 tr=0 ts=69bca914 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=pn2aoerzR4tYcExiNNwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 1AqyfqhNcqt63zX9ehNs4emnD2oK5h7m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAxMyBTYWx0ZWRfXxWhA2uU1UpwZ
 zdWoVIBiiQqMsNsIdo86alf9+yk/x07QnproqxsmEjiwffQdiaa2bMn0qlgH4oJ1qupOQpe2dyy
 Y0sE8AQLOgyJ1Vv1LFAFG3Wyv2XdzXxrKhvIinsKLW12ftIgfNFTW38UitlZBzcvgRk46pdV03T
 iqPE2FR/G2ug27D4cpUaDZim2nwOGt4S5mq49LcypEGg6uBKA2/rO2ezbM9Ne2OZK7BAVKjC05F
 C3tXG1E/emDV4wJxu/YP4rxC3Ucra7T4v2QC/dpfemzbp8gD3Zm0CCYIZ7PqorcSygWDaTWuLlV
 NKvNLdR/IEFPVg6YqVMU0UK/AX1+RUBeFaboPVQ8af149qNdmnJkzq39PGfp0iU7j8wQ3xN1qOE
 HGYssd6mRxz2l/FICQ+OjD1vqLuZPuAEmU2aAK2dQs49+7Vg0ARvClxZBXw4BK+ttxxsvIbtNhx
 aLIGxVZvg2prCu5nKsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200013
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56453-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 38BF12D4F14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In preparation to adding support for several firmware revisions to be
used for a platform, extract the firmware description data. It
incorporates firmware name, HFI ops and buffer requirements of the
particular firmware build.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     |  2 +-
 drivers/media/platform/qcom/iris/iris_core.h       |  1 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |  2 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  2 +-
 .../platform/qcom/iris/iris_platform_common.h      | 15 ++++----
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 20 +++++++----
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 41 +++++++++++++++-------
 drivers/media/platform/qcom/iris/iris_probe.c      |  3 +-
 8 files changed, 57 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index fbe136360aa1..ef7f6f931557 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -295,7 +295,7 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
 {
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
 
-	buffers->size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, buffer_type);
+	buffers->size = inst->core->iris_firmware_desc->get_vpu_buffer_size(inst, buffer_type);
 	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index e0ca245c8c63..7f36eb65dcbf 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -99,6 +99,7 @@ struct iris_core {
 	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
 	const struct iris_firmware_data		*iris_firmware_data;
+	const struct iris_firmware_desc		*iris_firmware_desc;
 	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
 	enum iris_core_state			state;
 	dma_addr_t				iface_q_table_daddr;
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index bc6c5c3e00c3..1a476146d758 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -72,7 +72,7 @@ int iris_fw_load(struct iris_core *core)
 	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
 					    &fwpath);
 	if (ret)
-		fwpath = core->iris_platform_data->fwname;
+		fwpath = core->iris_firmware_desc->fwname;
 
 	ret = iris_load_fw_to_memory(core, fwpath);
 	if (ret) {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 3fb90a466a64..83373862655f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -918,7 +918,7 @@ static int iris_hfi_gen1_set_bufsize(struct iris_inst *inst, u32 plane)
 
 	if (iris_split_mode_enabled(inst)) {
 		bufsz.type = HFI_BUFFER_OUTPUT;
-		bufsz.size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, BUF_DPB);
+		bufsz.size = inst->core->iris_firmware_desc->get_vpu_buffer_size(inst, BUF_DPB);
 
 		ret = hfi_gen1_set_property(inst, ptype, &bufsz, sizeof(bufsz));
 		if (ret)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6dfead673393..6a108173be35 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -250,14 +250,18 @@ struct iris_firmware_data {
 	unsigned int enc_op_int_buf_tbl_size;
 };
 
+struct iris_firmware_desc {
+	const struct iris_firmware_data *firmware_data;
+	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+	const char *fwname;
+};
+
 struct iris_platform_data {
 	/*
-	 * XXX: remove firmware_data pointer and consider moving
-	 * get_vpu_buffer_size pointer once we have platforms supporting both
-	 * firmware kinds.
+	 * XXX: replace with gen1 / gen2 pointers once we have platforms
+	 * supporting both firmware kinds.
 	 */
-	const struct iris_firmware_data *firmware_data;
-	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+	const struct iris_firmware_desc *firmware_desc;
 
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
@@ -276,7 +280,6 @@ struct iris_platform_data {
 	const char * const *controller_rst_tbl;
 	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
-	const char *fwname;
 	struct iris_fmt *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 692fbc2aab56..ff8ce078238a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -16,6 +16,18 @@
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
 
+const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
+	.firmware_data = &iris_hfi_gen1_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu20_p1.mbn",
+};
+
+const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
+	.firmware_data = &iris_hfi_gen1_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu20_p4.mbn",
+};
+
 static struct iris_fmt iris_fmts_vpu2_dec[] = {
 	[IRIS_FMT_H264] = {
 		.pixfmt = V4L2_PIX_FMT_H264,
@@ -62,8 +74,7 @@ static const struct tz_cp_config tz_cp_config_vpu2[] = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.firmware_data = &iris_hfi_gen1_data,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.firmware_desc = &iris_vpu20_p1_gen1_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
@@ -78,7 +89,6 @@ const struct iris_platform_data sc7280_data = {
 	.opp_clk_tbl = sc7280_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu20_p1.mbn",
 	.inst_iris_fmts = iris_fmts_vpu2_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
 	.inst_caps = &platform_inst_cap_vpu2,
@@ -93,8 +103,7 @@ const struct iris_platform_data sc7280_data = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.firmware_data = &iris_hfi_gen1_data,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.firmware_desc = &iris_vpu20_p4_gen1_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
@@ -111,7 +120,6 @@ const struct iris_platform_data sm8250_data = {
 	.opp_clk_tbl = sm8250_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu20_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu2_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
 	.inst_caps = &platform_inst_cap_vpu2,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index c2496aa0f851..c3b6cd6fe777 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -17,6 +17,30 @@
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
 
+const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
+};
+
+const struct iris_firmware_desc iris_vpu30_p4_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu30_p4.mbn",
+};
+
+const struct iris_firmware_desc iris_vpu33_p4_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu33_p4.mbn",
+};
+
+const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu35_p4.mbn",
+};
+
 static struct iris_fmt iris_fmts_vpu3x_dec[] = {
 	[IRIS_FMT_H264] = {
 		.pixfmt = V4L2_PIX_FMT_H264,
@@ -71,8 +95,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -89,7 +112,6 @@ const struct iris_platform_data qcs8300_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,
@@ -102,8 +124,7 @@ const struct iris_platform_data qcs8300_data = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.firmware_desc = &iris_vpu30_p4_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -120,7 +141,6 @@ const struct iris_platform_data sm8550_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu30_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -137,11 +157,9 @@ const struct iris_platform_data sm8550_data = {
  * - vpu_ops to iris_vpu33_ops
  * - clk_rst_tbl to sm8650_clk_reset_table
  * - controller_rst_tbl to sm8650_controller_reset_table
- * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
 const struct iris_platform_data sm8650_data = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.firmware_desc = &iris_vpu33_p4_gen2_desc,
 	.vpu_ops = &iris_vpu33_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -160,7 +178,6 @@ const struct iris_platform_data sm8650_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu33_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -173,8 +190,7 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.firmware_desc = &iris_vpu35_p4_gen2_desc,
 	.vpu_ops = &iris_vpu35_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -191,7 +207,6 @@ const struct iris_platform_data sm8750_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu35_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index dd87504c2e67..d36f0c0e785b 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -251,7 +251,8 @@ static int iris_probe(struct platform_device *pdev)
 		return core->irq;
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
-	core->iris_firmware_data = core->iris_platform_data->firmware_data;
+	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
+	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	core->ubwc_cfg = qcom_ubwc_config_get_data();
 	if (IS_ERR(core->ubwc_cfg))

-- 
2.47.3


