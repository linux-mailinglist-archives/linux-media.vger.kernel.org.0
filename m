Return-Path: <linux-media+bounces-61438-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HFxHeN1BGqdJwIAu9opvQ
	(envelope-from <linux-media+bounces-61438-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:00:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC47E5337E9
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6787031F9B06
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E36947D93A;
	Wed, 13 May 2026 12:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5HuTHAF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnATUcqJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F89847D951
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676582; cv=none; b=k0oaS6kzlb4bdnyvc9kDSwHCvnCqsojRxwL0U6NaROqD9GzLksQGSpza4Z01InoHJr2//VYc1sXs/tHN6FrN69glyu/SKnE9IBSyR7LEc8DL30sExDycprVpQ14d+LnCE96rf3qMyWwln7HvaAIoUwgToFlewVlwMLl8PaEChvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676582; c=relaxed/simple;
	bh=51abVJLmqPXnrz/IkKiqyklTNSZTZj3V8WGdms5cxdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VKLs/tVWd6sv8HRHdzdb6HPYTXr01IogXyrSKpaoLziI45Le/3p50+1DFgrXx6IEmKNgp8t7Oim194ihKjQE8S6hPZuGR6vpNIt184D7uA7IA5ogDYfRHEzkpOEcgfrkg670Wq9yv8FhNHKRu1vKTG6rUY/0HwlcRKd62aA54wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5HuTHAF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnATUcqJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAWpBp1393169
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=; b=B5HuTHAFd+YIyu/2
	QcIMHpwhtFcSt2NFbTxfnHc/zjhH5m4xeJ9qeX/hI6o6fT5GKI0I/W4Bd6Ns0Zre
	g8kSTyWSrIRwqIFhYgMHdol7tJUZDnwUU6a+hn+zu/+AeYInJds4k0zWKXlYDpTR
	sJa5xkPAJ8AwyFFikBIn8Xr8gkSDTl9IIDVPW5PtzwEOSws16mO0PokArulqM3PB
	oGJcHUrREK6qC4J8eKIFLlOhVjYgh+QIVDH1Y2D9WljEVwMWl3KRwJ9sAYhKhXIM
	wr7qntbEpeug/FUohD0wVK8nIh/qsfVZNSFhFmxE1NPKc2f8EYnMAxArVktQ824S
	62EE9g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k261p13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51494d74d4bso106594441cf.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676576; x=1779281376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=;
        b=TnATUcqJWgVZMivvJ3a08H9E/Gx3J0hypFcqSEXNihUwmofehfjWP33GdZwwb6BmIS
         lrOxxhsg3UCeVQQpJcKRtQhfhmW/1mjm4S03ycWxUYDoi5pUP9Al7EEuFnB/9LCYXqun
         J5e8GE263FnZxUL0TI/ZO5wCe0Dz+XB2iOvVoaTmd6SRm3a2UqskFjyfhLDfApBNcmr8
         8u1h9CcTXgcgeIod32sfzWPCAkns/qtZ5D0E9q8MuGRsiquuLShUDnf+FLcWaUgSuhdK
         1BRByk+Ujijp6HIO5Ua8EJENEykOylDqhNoIzaufDx0c1TuHHiwpxssi6AQCOb7NixO4
         7mHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676576; x=1779281376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=;
        b=MxFfoIs3fdcswXpNwO1sJ3ooDyiPmDKNDFHY6FBA2GRTI4H2lLZNJBRUn2DxbYPfZb
         7YwTbBV6++OZfe851u0I+QE9MrdeFMl79bqXucFbYwvPOgLwkcOXhK46+20A3WuD5OLY
         Z+Mka9oaPvgVV32oEmaXr1Dx3l94qUd878/bcZM/sAexe0S30Ptfw92OL3gMyHINb6H2
         o524wHA9mYyEaJ/eUf1PpeUCAoW2VCt5Bw5E+vhqakzh0DF8htux0/zsrZNSe7yGa/CW
         ZjaeIc86KzpWJcudNw9TFcb18Rop86N1K4S54c89fa8etHADwd8FMia3rWi0o6PgFSMF
         Sdgw==
X-Gm-Message-State: AOJu0YyjU7FR+Jx7lhgmb7HUqWlQJALtfKEVkgyCbW1oWk+4A2MnJfP8
	3K96A4AKlodJp7ptmjpwgSbabOSTh6CJFIMs7+IM0njqHh/qIcfiaJAAWycotgP+o8Tj9+uI+Q5
	98Mso5joTyHYr4Iqmle1q+PVOD+3eJdVDqOK1oCaO9MMwDwf9pSsJLEbZ4M+kL5qoQw==
X-Gm-Gg: Acq92OG5AockrjdKrUh7nExQUZJfGgakuIhLVWWJfaHzfl83hKZdaTTtwYLhvixvoZu
	Crum8hMBCONb1+lsXnxQIdeYCRqy+PL8VrPnWX3homsAwxFPv0KfyMCpNTWM66OiPyxN2jRzegL
	GEcYMq/PxdcDJcXMTrxSSh/cJDl7mYDV37QmDtYeKD0hOaT3qmDZqoVYzEENsughfQITlUFpK0g
	b07ZegKJOqIS1uvXfz49jSHgS97qLfVJmBN8dbKKKDPabi0aNkHcM6wGkQQGbUU1whSTHy4s76R
	CAmbT9cK7MknBOXJSeCtT2r3HjyWsIqnR6QDEUB6FZ7t9n0adq+fRJInK+5KD5/ThCqn9YKi0/Q
	NniNJ7PVvmYDk01HkWyaIzAaMpDb6U3Ad/WXXKJcJs61GQJqSqB5xszS3uYI1YwLTYquwA0rstN
	tUmV1yZHnXOA94ZR5HfzwamMmIqiarezoFz+U=
X-Received: by 2002:a05:622a:413:b0:509:5c6f:c0e with SMTP id d75a77b69052e-514cf01d4c9mr99998691cf.37.1778676571419;
        Wed, 13 May 2026 05:49:31 -0700 (PDT)
X-Received: by 2002:a05:622a:413:b0:509:5c6f:c0e with SMTP id d75a77b69052e-514cf01d4c9mr99998331cf.37.1778676570943;
        Wed, 13 May 2026 05:49:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:45 +0300
Subject: [PATCH v2 11/16] media: iris: update buffer requirements based on
 received info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-11-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBHNBXR5BkkB34CVfSLNuImHH7Gy/ZgmIB/A8H
 EIAocIhG/OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRzQQAKCRCLPIo+Aiko
 1XZ5B/kBwnwQjGjpk5WumUdb4z3B8ob7rKlTIhOjuIigeerdT+MKXIF/ADFCQDfGarAhwUQ1tSt
 21vUUPST1hTfTN/zFv72tNxdKI/t1lKJw/Frkmh9hdRW2jbfx39ekYWUeNiAJyxjqo2WAftdnf5
 +IfABkfLKlBmH+ZTEg7OE5T1Dci2jGNinqutNTpRrt/VUGOpr1GPtxZn4MPXzl82VTO0s2HeeEl
 EPkwuSIVxZIb+yf9lzwsITEd0hyK9rjLPVqI6S7ZBQ/mo4vVn4wqogYpSy96Ah/bDpc3yNkspL2
 asuKRWupWK5P+pVSYA/4XD7Tdqj3kZ5qhlZS1+KGnsrLCK8j
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a047361 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=_TRJU0tGboi39qq34nEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX59RUnQfk7arI
 JVA46AXOG90oGIBvlpXUheEZs9xBbew3eL+UmwFfKSt45KvIqg9sCDqILyK2N6FCwZuu+sU7d8D
 pI0a4K8rh9/kkTvysBpHZz2DzhXE/tg9o2J2l0RTiqCHUdWH4vs4ozBVIIHfo23HNGfk0Dbcqle
 uHpYQSb10DRPSaCX976o5Ik/1sSPf1W7jyPD444w6Y+f8BDEGlXTr0qImcwD0kwfB3f5YdQJQr0
 N27Xa05+SF8/7AHuxjeJtiCIzsqMk0ei3iybBeATV/BJcZHoXwe2fYfearUBEbsQ7W4/BEGV/Hg
 ZpwYTs0hq9uVIfyfflvroIdW8pchaLZesyBmDTevIcryuipWNqpnSUfgZfACK0Zc4fin87LUiJx
 k1sNSxHhPs37lJXOt70mqth1ZunWd6MkwQ7iT0OHwGKv/kMFfzIwFQdyRJ2PT9YCA8EIgIZk5E5
 0/NmV3Q3JHUt2fcz83g==
X-Proofpoint-ORIG-GUID: 2atD9itbK4iwS4ONyeV6tWM1XpfCDALv
X-Proofpoint-GUID: 2atD9itbK4iwS4ONyeV6tWM1XpfCDALv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132
X-Rspamd-Queue-Id: EC47E5337E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-61438-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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


