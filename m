Return-Path: <linux-media+bounces-55964-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLD2ICZTuGmKcAEAu9opvQ
	(envelope-from <linux-media+bounces-55964-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 19:59:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4486729F6AC
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 19:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0DF1306342C
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBEB3EB7F6;
	Mon, 16 Mar 2026 18:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bb7VeBTt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jfvLSEqH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E233E6DC8
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773687299; cv=none; b=eK7zE/YEI+iux4nRmPoDl67jOtO2R549iN51B9Qyqe2oND8cTLulN0Vla7p5vPd64iU1jpF10mwEZtMzFiEvZDFaX62Dxoq0EueVadGBPthuG+/bsp+woy81OXQeduywY/lbT147vYVcE4oFHQ3OUfsSB6mNUr5yJ5lLmsGVc/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773687299; c=relaxed/simple;
	bh=x2YTsex1Fv+Dc4RVscR+kAhkDi5JIRV/gMadA9jhh1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WyXQCn6qW34rzwbMG4JY6e/JddgPGedkz3VBmdft6up6iEy/xBsFsVwb7d2qoeeZa6FB2znHAoTSyc3WFQGUeVDZlBXrYjto9NIzDNL3lug5gVUGappAMvzYjM2j7WjugCAW6QkZy+TcyEbDcBwA9PmtFZ1hBYZvmMW2S/6RwRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bb7VeBTt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jfvLSEqH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GEgGEY3295927
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=; b=bb7VeBTtbvdYiwQG
	y0P8ywxEMOyyx3JeYxcy5RRhF5bmWA1K1J4izRmBS117uBEiXUobx9CuzB9sLbys
	QZK5/WEvtpahNK12phHchngWyAnjOsv/74xpJEmnqFbNEj/e5wVmVepIhbO92Dde
	ecnJVCitFotLsTSPehF/wyoIpmFHx94dgGV+g/DR/QYbvC0UDX4/DmMPaqHXZCKU
	tECHjINEWH52gjwRmhKhA0YXvOFyQR7PbYqFK2hDDSvfsSRt5P5qmnwsrhNXLVx3
	c7IYTxcqOx9c8RyQg2xrnWYCCT9zSdKmD5t32KTQtsbIlCLW/Z2spyst+UQwJdYK
	U/qdyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy0vvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:54:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd781c0d90so6726485a.1
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 11:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773687293; x=1774292093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=jfvLSEqHKwYTcoL5Da24FiFg+SmYWI4gk7mArz6qzfv0p4Oa6g1lOGl72QEBZn9u3W
         qOmFfkTe4O4bDpmqflf56B5KR4gek2GDSq1x1wHHQDed/sw08omOj/cTmrlYywOJH53b
         43smUARPN6JS53vspETdS8IDjiyvWKMUMcbDD31wklIWagVPRXb2Fwox5WmkEu2oN8kP
         76GGw2EfviPL+erWOCT75/qAf5YT63DVpUW0S4l+VamwZd8D2WUZZuFh1ClzGEQg4Sjf
         GCAzJuUiyeXkGTMmUa0tIG03CmTZiG6WlK/9wIxNxGIHV2XfznMe11trCKRrvI55bm3q
         s04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773687293; x=1774292093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gl1IWKRec7l4UUGWy7jC01iWiWXGTiFco1mvc7rwi8w=;
        b=hTPjTWUOuV/r+3bmNs7n8w9lxqUjK0zULRI8MARGaGGYVDZc8dWLL8xwH3KRIf1bcJ
         JXq9CoWdK+/BSHLF6Hh4wx4F6adTC+aY40yqvmCsi5BoLWeoUgJ1hiwDvG36STYmHuiR
         k/pSL5k/lXqP6Ci+cEqo8ba4KexLRCnLI/BIGRjartxymwlnhY1hVeLnFb6aSrMAgv7k
         L1zheRShEi/5YXLPgeD58bfqRKdwt6fKzp0UoeJ53TCtBNYz/R2YHwTU8cWN8LOI+mS/
         3psP1ysP2HnzforcTvasik++AUNUX5+d36E8xsbD7lU9ZfLwyeJmPVUpbQDJAbv8p8AT
         0reQ==
X-Gm-Message-State: AOJu0Yy1WG2z3kkEgHNJUZsakfXhXyvhQj/bN0x+NcwCgujiSrGS9qhD
	R18SKodGrGxil5BC4dZKPM3xsN3P/u3U3WY8TZJshqBt3iQMwwFxh2BD36ObXtP4ggl29pfiuc2
	7RnbbHryKz7OuoVYlLFixbaLvDGyPzydf946VC3LP/bTmVHcAYlEDXhK2hMU5WMME7A==
X-Gm-Gg: ATEYQzyt3HXaS38DAO4L8b58KWWKaGrF+EDszIYk6PaSZeZfg4IdduocupFQkXUw2LG
	zok9T9b0zgbich2WsAlTGiK7wrytk3G/l8rR4D+xlsCtv1XiAsT5bdD6SvVEjpF7KIQP0X0LIgz
	tee4FNSZ30+ZUZZ6wCPqfxrJCfyPHeFQoqR371Tv5H8R38ScqP8OKCykww0FZOiq7mxlb5+OJLS
	PUxtDOhKznjVChglzhtQpasF3A3Cv2RxHcqP3YEYSNYaAKbL6GpZ5CI0PUF9Y9oxr5Qteg4/EAY
	TEheEPKl1bg+4UKNrUfqpRRvuwpu6eeQi+oxvidrTJS4nOvcK+DYmIBHMJ8ZuZodZZ7wf4YrEmC
	9lFKb0QsZhzd0mZUG61jDYqGLPm4FdKmsIqmKiVM5hgpFho44dx3uB9fPbQYg2xJbILtK2qfHbR
	fMrZaoF8JHMw22DAAqG28K1HjTmlTkR0zFuHg=
X-Received: by 2002:a05:620a:2806:b0:8cd:911e:2c2f with SMTP id af79cd13be357-8cde1512c13mr90739085a.30.1773687293357;
        Mon, 16 Mar 2026 11:54:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2806:b0:8cd:911e:2c2f with SMTP id af79cd13be357-8cde1512c13mr90736085a.30.1773687292886;
        Mon, 16 Mar 2026 11:54:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e6788csm34108041fa.33.2026.03.16.11.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:54:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 20:54:41 +0200
Subject: [PATCH v7 3/8] media: qcom: iris: don't use function indirection
 in gen2-specific code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-iris-platform-data-v7-3-fc79f003f51c@oss.qualcomm.com>
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2169;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=x2YTsex1Fv+Dc4RVscR+kAhkDi5JIRV/gMadA9jhh1I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpuFH0hE8FuvPwz6kFHButCXjUmHUg/mEtu0nAM
 dT8SqMWycyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabhR9AAKCRCLPIo+Aiko
 1fljCACnZ9Sk2vmfjDzxTbXWy8y6bOII63ImmkPL4xhB9UP1/yRD7xlFLEGW2wCFPq6qelDiMUn
 li6wqAY9BwGTPfGbIOI8ljjsXcLNlFBFA+LMokLtNTt7j2XxyUrzDM57Fq/XnS4bqqWPJ6334Ao
 +E7ps7OYi3UO8+BXQ+Q70wxK+sESJdK8t8rO3Ey+HsKBU/+QJcnUsGkm55GY8nl4PpiAx7SE6Uu
 zYhvDy24uC4xJzaM64b67TiSWYUFEtPUTtKBNk8F2AlDSxBO51vPuX09RghR9V8jCCQd90pfE7I
 /bHcn47EZdBUBSUh/YVs0Tmfa1w3mk7+DA7i/OXOFsISIZxN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b851fe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=yEfzmaBkz_6XQGMMuZMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE1MCBTYWx0ZWRfX1/eUtEffJmp2
 PIV+tEdCjBAj0rlR0W3QGr6vY7wK3hnMC/X805JYIwDqtcymVvcMriJWRmHjEIcltE20ouail5G
 tj8IdflIa6Gos9yyyDjt8hf0GcggUugUl0czFFTbwWQhqjGK1qTuBuDNU+mgSPyaifQM4xjgGwB
 Rba1JYW8CMWVYlgOvwC3KlWXLvc7Msu+h76z6s7ZMxhEJZkfZnUwtBzMOYBj6O664B+QuU1DuV3
 jDWKV8b92zB5HLq0vqO5TfjftzgH2l+b73LlWOXwrpzZ/C/gAX7PG3VbbFx7U9T7TBoFFc2Hjl8
 d1iDbGrtBknBkcUoklrbHb7JY78WR9Rj9hN/hEYyq+F+1+vFnX3h0j/0KRAdWD4l2tYzcNmawFE
 LKEQWggow9YbbeFc5n9oZpvmkaxHMJrZZHIEkm/1J7p3h3efils6zGXdWGJQtNcphmQb7HaoqKK
 3HiHbat2shDyh2TLzdw==
X-Proofpoint-ORIG-GUID: VG2zow_UkEKMGlubklHWlmjKogr_u-hr
X-Proofpoint-GUID: VG2zow_UkEKMGlubklHWlmjKogr_u-hr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160150
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55964-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 4486729F6AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To note that iris_set_num_comv() is gen2-internal, rename it to
iris_hfi_gen2_set_num_comv() and then stop using hfi_ops indirection to
set session property (like other functions in this file do).

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423b..e4f25b7f5d04 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1205,7 +1205,7 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
 	}
 }
 
-static int iris_set_num_comv(struct iris_inst *inst)
+static int iris_hfi_gen2_set_num_comv(struct iris_inst *inst)
 {
 	struct platform_inst_caps *caps;
 	struct iris_core *core = inst->core;
@@ -1220,12 +1220,12 @@ static int iris_set_num_comv(struct iris_inst *inst)
 	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
 				NUM_COMV_AV1 : caps->num_comv;
 
-	return core->hfi_ops->session_set_property(inst,
-						   HFI_PROP_COMV_BUFFER_COUNT,
-						   HFI_HOST_FLAGS_NONE,
-						   HFI_PORT_BITSTREAM,
-						   HFI_PAYLOAD_U32,
-						   &num_comv, sizeof(u32));
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_COMV_BUFFER_COUNT,
+						  HFI_HOST_FLAGS_NONE,
+						  HFI_PORT_BITSTREAM,
+						  HFI_PAYLOAD_U32,
+						  &num_comv, sizeof(u32));
 }
 
 static void iris_hfi_gen2_get_buffer(u32 domain, struct iris_buffer *buffer,
@@ -1257,7 +1257,7 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
 
 	iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_buffer);
 	if (buffer->type == BUF_COMV) {
-		ret = iris_set_num_comv(inst);
+		ret = iris_hfi_gen2_set_num_comv(inst);
 		if (ret)
 			return ret;
 	}

-- 
2.47.3


