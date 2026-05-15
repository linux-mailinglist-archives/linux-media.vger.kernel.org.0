Return-Path: <linux-media+bounces-61697-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wABBF5ARB2rgrQIAu9opvQ
	(envelope-from <linux-media+bounces-61697-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:29:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D8754F8C0
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F125E31918A7
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E7B48A2D6;
	Fri, 15 May 2026 11:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAqsj2zU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ls5SAeMD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D024E48A2D2
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845713; cv=none; b=RF84w27Vx/aaxXMTtW9qsJp1Hm9mcpbPDs5ZV8zrPQQ/dmdSjGbDIa2aD2SGA6OqKuiDp0fBuYoM6V97pheaKgC6SXYgSZ+3qnWlK5E1EFqI9eVx0T6AowKWrRvtgz0UhKU6eAsUaE5EOR+SJNmRhp0eRnSjmnZ2OHEu7FlsVJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845713; c=relaxed/simple;
	bh=51abVJLmqPXnrz/IkKiqyklTNSZTZj3V8WGdms5cxdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tLh+HqXMoxTJ7Bk23RLeM69mZUlgzaGKKHbkCsTJIs6M6NecdW0KzBFPJ4QBqir86ZXKjEmXUEsTH83IASmIVPfo6sQmlpo992ChqYrduvC7P2O8W7kwXY6A3vtH7xsjk26wuldC043UAYPO4SOAE6YJObhh+lhkrXVd0ZuztCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAqsj2zU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ls5SAeMD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBI1EI655050
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=; b=VAqsj2zUeciv+7gn
	YbbTtPpuvr2puR+pJh2h3j7XjTACJMAN6KWWXISlju7Qtcp3FbR0g4+TjbTe6QGx
	o7rbB6JWO03Cz0+DbkBBEDeYSSaia63nEm1d0Z0oI+b3/Ugv6WX5fjLH+r3CZijK
	LreDbnytbeReivFVC4F1nJtf+3yGRsnhhYc1PrOuulACysw/M7MD4OU2iES8reV8
	LCxPmgORESNywFSx/uA3BtN6Jp/VmGx26xbLgUbqlE3LbEiYIwygAHUOmzH07A2/
	BZypmQ/IR2RTcngLrFGjRVdskPjwLLj6R8AZto+NmY1UYXBrfaMUJLlYMPa+rk45
	CnFvxg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pu5gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50ff0bef198so186292341cf.2
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845707; x=1779450507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=;
        b=Ls5SAeMD5YxGfh4akNownR1rLpij1jQtTdhqmf/z37ZyJ5c9iHPXnaltXHnJ4+rc16
         AVlC/fv7AOCIBvyH+iNwMRiAgDmq7w/OxZy8af7p0QD34e+8NSJW8zJS2S42mKhQnrI9
         cS3Seybm/ubOHjyGBoZ3oLsclQGmcPkXYbZwBTVCBRh7Lp5HCNGoli8CjG4e+8paidFW
         jvI0i7vGUfVfQTy3PQl396gpiZ0PV7ee2vU8TmbSfnOOpW4SlVmnegXXinfSYn2rFaOm
         PA7d+6zdmuimju50F8J3i+sFqkk3ods9AFdu1W5bHw+fGsDhv5eGIF2TPMPX1VKOeTuh
         fgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845707; x=1779450507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=;
        b=Iv/cEW48TIBH8ILD2D307SXkSnDRsjK2iuIbxmqLzKO7fvPNVSXH+lfjWN5HUTg8mG
         tj2GXoX6JL97s5G+y9S+7PbriELARrADmwOqJEqbVWi3cY9Wlc7YWEEQ/Qx+QHeaWSDx
         DEziVY1RJ9VU4X7hFuA0V2ZLpTvDt9suPojTQaMprzz6KfwzRXfOWb2eiuFn58ZwkTor
         eyLun6xbyM5LonxCaDAUiQmocjMBJZnyqdwcK9NnrEJ+q+ueJLW07Fz/VYGA3ctyyEN/
         2cptMfUbqNLZXGnsdpRa3BzpMDHwkupee9v5kJqQ1sef8q+XMbxlJyi/Rd67F2Pm7DvZ
         xZKw==
X-Gm-Message-State: AOJu0YytKHGwOZjItLO1NRX7vDFNdF9JYzZ/7fZ1MoAeb3Tn04mhMALF
	ocVdpMe1PtxF4WnYI102f2go9nyHNbfi8uOz/5L5uw7N8WbQdU/DAgK7DSR+yVlH+h+K7PYAzf0
	H3wBHZOogDfjrcoPtvP05B0OhlO50PspoEQ81cCw5b7LlFAyI9fCWBRQWwbZXl2lStQ==
X-Gm-Gg: Acq92OEygtwSfYMtcRrPxa46wtWN/GqLpmTI/eYX8PjrczM90pKYoQkgYCTQ8NrCrLO
	GKky0M+EjsqSlbEs/EvaHEE8WwNvx1ee70ZBnZDGWy+gXCDkkWLtGMccELVFQQwSept41Rb/vU9
	dQcfhQWWCpUb+vyoFjCk6ikpeFD107Xb757VatvIHOA9jB5Wi17wHEcSkf9+EzrdkO+Rtauy129
	pzI1rCqr9lf8OyrmIBnRP4fCCI96qK0mjq+lizMdBAJJkg2jYFuKam2BjoYQZq3geZw+jfPeQCc
	oOWSMxWVrbnj5PtHbFbCDu3JhU5jExTBMSVbVKwzJgWGS6htX9hhzW+rT1krxRkJklXl5xKa/B+
	OUb8t1oxX2lA2pStQ3w7yVPeZY3Bj5epO/i9WhTeHIJBj8edRdxUMWGvzgkYCDjDnpQ6HM5bc1P
	yvfAKd39DPVFwNFE4AIIL5vRjfK67Q0HJYVIk=
X-Received: by 2002:a05:622a:5c9:b0:50f:783f:31a6 with SMTP id d75a77b69052e-5165a1e728dmr49565361cf.38.1778845707513;
        Fri, 15 May 2026 04:48:27 -0700 (PDT)
X-Received: by 2002:a05:622a:5c9:b0:50f:783f:31a6 with SMTP id d75a77b69052e-5165a1e728dmr49564761cf.38.1778845706992;
        Fri, 15 May 2026 04:48:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:10 +0300
Subject: [PATCH v3 11/16] media: iris: update buffer requirements based on
 received info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-11-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=51abVJLmqPXnrz/IkKiqyklTNSZTZj3V8WGdms5cxdg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf18Rt4tw9ciazUU2ifQ+Q2+z1WJlpd5R/mW
 fKXLCOANGeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9QAKCRCLPIo+Aiko
 1WkvCACwJ3omOakzMl5YF+U/gJ7ptHGhRt5iomZiP300vbr1UQfNC/DUoXQvA7Za6dxJqc5zIXV
 Do5gRGVAA6Z37u90e2SKx2/O6cwb2tn+hGdAKRQMZ0Xnbf+PTQzLqVMxT/xKR8+G38oNeLriKfj
 6ifGjlZqukjkCbGoTrRZDKjT6yNgGNd43L4F6ZJNBSJHVsPE9OrE0n6WsV9atDjetW3KLVKGjuu
 9ok6141cs+Aj8CyqIoTtpWnBi0eF5wvNqMj5kRm+Axy/eDgZhpwr1gSdiS1mcsZAEJKRhJB75QF
 hEU0wzFXvCE7TlJ1UOypXBKskPqyr8ae8Cl67bjrXabKC4Xk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: dXruV8IcnMjt41h73FjXoif4W6SK1Vxg
X-Proofpoint-ORIG-GUID: dXruV8IcnMjt41h73FjXoif4W6SK1Vxg
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a07080c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_TRJU0tGboi39qq34nEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfXwcyR/DpxXrsa
 73ssGJt9obwlCpm7zyJCkDPKdZ+uNfJgLFPNpY21HSZ+SRnlu4lAi3nKz46iHh4p7dfynok5lrr
 x4ShnqlDfwydRHlulavYtT6K1bkRNZB6RMqaik3KaJTwXyIdGuu4MqCjKEt7576ylmCLdMsCy7I
 uyoYqQ3MKxacCC+f3LOWotMkYaNyFDx82TPv2YB4cCCFebc6KUm+no94FK8xLB6587RTzvjUWMB
 Ef4Dem+9DQMlRKUtDIaAP3q6+ADcr5i9t0A4/i67ofIuD74SKKzxOuUDoZ/aBzLf/kJTIXR/mMl
 rwTDdBVv/uliQDn5HjT+8lZ59pXQP4Nl4qYJi8xzbuMSeoW1Ircabd8U5RMd0sk7bx50kt1E6sf
 RZz7Hxhn3F0uMp95iPFwGc5+FwxjGNKs8nZk8RqH/vSlDwxXrVp21dHs2vnsve3dy9obPSb+hq8
 iJBWNnTABvHosWPLkSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: B1D8754F8C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-61697-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data. This will
be used for upcoming support of AR50Lt platforms with Gen1 firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 74 +++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 23fc7194b1e3..ee996eb1f41f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -533,6 +533,78 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	dev_err(core->dev, "error in ftb done\n");
 }
 
+static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *inst, u32 type)
+{
+	switch (type) {
+	case HFI_BUFFER_INPUT:
+		return BUF_INPUT;
+	case HFI_BUFFER_OUTPUT:
+		if (iris_split_mode_enabled(inst))
+			return BUF_DPB;
+		return BUF_OUTPUT;
+	case HFI_BUFFER_OUTPUT2:
+		if (iris_split_mode_enabled(inst))
+			return BUF_OUTPUT;
+		return BUF_DPB;
+	case HFI_BUFFER_INTERNAL_PERSIST_1:
+		return BUF_PERSIST;
+	case HFI_BUFFER_INTERNAL_SCRATCH:
+		return BUF_BIN;
+	case HFI_BUFFER_INTERNAL_SCRATCH_1:
+		return BUF_SCRATCH_1;
+	case HFI_BUFFER_INTERNAL_SCRATCH_2:
+		return BUF_SCRATCH_2;
+	case HFI_BUFFER_INTERNAL_PERSIST:
+		return BUF_ARP;
+	default:
+		return -EINVAL;
+	}
+}
+
+static void iris_hfi_gen1_session_buffer_requirements(struct iris_inst *inst,
+						      void *data, size_t size)
+{
+	struct hfi_buffer_requirements *req;
+
+	if (!size || size % sizeof(*req))
+		return;
+
+	for (req = data; size; size -= sizeof(*req), req++) {
+		enum iris_buffer_type type = iris_hfi_gen1_buf_type(inst, req->type);
+
+		if (type == -EINVAL)
+			continue;
+
+		inst->buffers[type].min_count = req->hold_count;
+		inst->buffers[type].size = req->size;
+
+		if (type == BUF_OUTPUT)
+			inst->fw_min_count = req->count_actual;
+	}
+}
+
+static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
+{
+	struct hfi_msg_session_property_info_pkt *pkt = packet;
+
+	if (!pkt->num_properties) {
+		dev_err(inst->core->dev, "error, no properties\n");
+		goto out;
+	}
+
+	switch (pkt->property) {
+	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
+		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
+							  pkt->shdr.hdr.size - sizeof(*pkt));
+		break;
+	default:
+		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
+	}
+
+out:
+	complete(&inst->completion);
+}
+
 struct iris_hfi_gen1_response_pkt_info {
 	u32 pkt;
 	u32 pkt_sz;
@@ -657,7 +729,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
-			complete(&inst->completion);
+			iris_hfi_gen1_session_property_info(inst, hdr);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


