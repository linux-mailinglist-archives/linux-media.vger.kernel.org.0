Return-Path: <linux-media+bounces-51518-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKUwLhDNdmktWwEAu9opvQ
	(envelope-from <linux-media+bounces-51518-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 03:10:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 854ED836DD
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 03:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51CB730058F8
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 02:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA43245012;
	Mon, 26 Jan 2026 02:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sa/pSIOb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G5zpL9oU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA1321A447
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 02:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769393393; cv=none; b=nAwBO4ipgePDHDvZdmHyuS8PckTOTN+DjJPFt63fTd7cygGeSRs6sI5MZZdgwXQ///GyoMKRHG6kIIXbVF5/1uEfeA9BhazqOZ4aqO2Sy+IicxgY8UFE7kVvWMeU5wWSF323odpUcuUTdkzg4jQAsCSCKrw5vyfGTVANguJDM8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769393393; c=relaxed/simple;
	bh=JEd3DfqN/K5qIES7JtABDfJMqyIJ9oHtt5fbP6+eFbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b7KLupcatytD/1vqRPx3ebHPtrGOar9YeNkioc/CwXRtOsTSuirTiSgkKyRtalcI4GDtnSXhW7Myghz6Z5Kmsx8xqq0KwKqC4XzY03IqZRfzoZ2imOIlmMtd4Mj1FuJxBg2Je/YGXN07S/BgxKHXq7vwmeJDyY7dJhfzJo6SJFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sa/pSIOb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G5zpL9oU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PHr93c3814103
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 02:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YIDeFDRJGhAX/rPmOfgE7xD2TFlnPCZkaj2/8rl97Go=; b=Sa/pSIObmENZhzFc
	mFFCIjD2QZr1pQXht8BvI69YPxxTpEGKGOc3egJiYdg15AaBbqcjbGOvP/ybmYjm
	PM8aGwC/E8qJTR/F03YSWYX99M/bc2pSA+/EcZbwrt6y3bFgKHDKbrpmmYCnnNsf
	aMMRvLq6syX7/z+AM8ez/U0XFcxcsoIhj7pJdr/tyYa+eJa6DzN+jHHVkcPetfC0
	4QBdvXTdQe3sX+Fp0Ga2vdJTw89O+DBGYTpXrmjZS02wUc/ojA50LjqQqUVZXWiT
	qadRqQd6L9Fj9LU+YjMoZnK7dqlxH4Pclx42MBJ2BLi3Leua5Vs9dTner38FYHjB
	JEgGuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvw4wtkd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 02:09:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5311864d9so386996985a.2
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 18:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769393385; x=1769998185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIDeFDRJGhAX/rPmOfgE7xD2TFlnPCZkaj2/8rl97Go=;
        b=G5zpL9oU0lWvp7sJy3dlAiekS+6eRwk5sQnl4sIBuT5qRv69TIgqYB8133y8As9786
         Alp2fT0nhYRqhDI8+6/KG7UmmOpQShJ7RUyKS+z77WIjn/J/vhiZWm63Ft+KuaF3tD/O
         +xb3xMOJZCfHGf5Ti6oeTW23j4XfGht+DLGWMC7T/coUmp0KndZAlm66IwJnb7Pg/caH
         RVknV29tDiW/gTvFCe4+9KFVu81kvxIMzVAcHdcbQuuYxDwLpoJYL2Lq3GUtet4RWROi
         VdD/S1SQZEOWavtXGaiY0C+F4VppkKybah7Yw2TIHnJ0pFg4nN0o/FXl1OrGKk4tG8Wa
         aa3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769393385; x=1769998185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YIDeFDRJGhAX/rPmOfgE7xD2TFlnPCZkaj2/8rl97Go=;
        b=J5ISinzQPgRtF2z6Isg68ElZMFtcLpNscucbUoxZMnrh+d0ycq7ASe2+c0CkVFBaEn
         8Bgos7t3DraJBS57p/UW1GRqorl3aSx3MemMxQBKEXM1yJgYX0KGWBuCkBdJeGeO5iS7
         vudksPocwELzT+0kTVMOFU8R9Spw+8knqni81ZW5wFhKnzOWVgztDyrFIDJ2rRP1mPCM
         xzeOg/gX6Er6ENP8mi5GPdhItvzH0eYUtThJkIXU7OMs+FOI6+AFomPLpek8OmIdJHJj
         yDYmQe4y/UyDIIeWqCSRWd8W5BYZYgfMyHexUsWCjKsHbtjlFgCGUTWqo1DiK2aqYIYt
         ekBQ==
X-Gm-Message-State: AOJu0YxesZ054cvZQfumQonVRJ27xOGkuqlirJgNj1Skt7zdF83sEp6l
	K7d+rtRiLxdHombP8/pMQvW3sPUgjgpWBaxCGfgvC77JlaHf5Dfq92yzzNXhs3XIvTo1v67wcl7
	n1DqJmvdktc2fEc1jyYmOtmczvllSaOKimlpA30JC3Fr22TOjPBYNfnIDeepcNl7hag==
X-Gm-Gg: AZuq6aLpKSU1DRcViRao7EVbAgYewyOY+XOUq7Czi9tUaf4ceeZUG6Ka/OsWtlQXO1c
	zT1IYNaMP7UUiVmmimaQlzQxU9v5JJKTuV904QX8axCNUdJ3XjZlqxgObqnV+vdCXvdbAiTCYED
	CnaixR1hhZleT8GREwMJYoHRuLzF+GIBhazsT/GT1g+MC9YE2yJu0GyZJo4DK36klxnWS9N3b5Q
	zfqpaKbJ2J+LpxhemnOkxUixkaiOLgRlHmnrI3zLpBpME1KyH+g8HLrM9p6kNk0CNjKdfNCyuJ8
	B78PmM3Q7McsUxZQglNNVeUPhg/oMHicG3NMbeKLWGBzaEPNr3hH4ckSBUrcjoMKQvhr6lHujQ/
	wnY+mJye+wcdHQnK5J9HA+IgYCkhlyKxEca47wwftnaFBc9SsGkWNhGOn6WS5yUgu6M99VEEc6u
	A15GmgNUgAiuPcWo7WjllDJds=
X-Received: by 2002:a05:620a:3199:b0:8c6:9fc2:9f91 with SMTP id af79cd13be357-8c6f9590c5cmr354606685a.30.1769393384639;
        Sun, 25 Jan 2026 18:09:44 -0800 (PST)
X-Received: by 2002:a05:620a:3199:b0:8c6:9fc2:9f91 with SMTP id af79cd13be357-8c6f9590c5cmr354603385a.30.1769393384211;
        Sun, 25 Jan 2026 18:09:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9faed52sm22778201fa.2.2026.01.25.18.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 18:09:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 04:09:37 +0200
Subject: [PATCH v2 2/4] media: dt-bindings: qcom,sc7280-venus: drop non-PAS
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-venus-iris-flip-switch-v2-2-b0ea05e1739a@oss.qualcomm.com>
References: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
In-Reply-To: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JEd3DfqN/K5qIES7JtABDfJMqyIJ9oHtt5fbP6+eFbM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdszjKZbGDSiJEXw18Hmw3P7Py7hKEIulRnQGN
 KQO2K69Kw+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXbM4wAKCRCLPIo+Aiko
 1dB9B/0eFUGFn86X+dv5oRghrs+Ba8ZJJfGaJA9byKixkce2MnC9NzkBsZch12SgiDIb8ecSoox
 Au4cgPAOk/RdFbXGLEHVL66UewSOjO7mf/td4SmTNQo1T2VNV1axcORToenbLH2ZVMaidd5CorP
 eSohVbAjaGzG/4BXeoMbto439ctB9NntQuTylMwZE3Lo6qLZvgBc9gHatwy1YOrXOdiwEVsT+xS
 uzGpwP6Tn9Z3z0WxiQvpjYTUTOy1QLazJCLB5+Bp/mIKUNb6wOWrMXmjvXQEcBGpxl9vf+qXgMv
 x4+PdcLS0NR9dQzQ5mqWJMwY75YS7dvHfT1g8PDYrboX67tB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: fhWK1V_HLkBci3dBDGrNLQpQ6Gco5Ahv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDAxNyBTYWx0ZWRfX585r1KbxON6p
 SbxQwaF+1bsz1Zooz2bznpwsY3kmLNnqCTAbTjpkh5RhD57cwkRPZFUBup421P/qChE7Ojy4Zez
 RdqGukqj0HosS2l6jGkrumNfQtxBchhdu52m4JcA7Eg9pxdJnXYxxzhZkzzZRcfR+l0zRkDb9Uw
 OBl+oSKwc91pMtN49kTxSlPa0z/75Bxd9yvc/2M6kP219OEiJvd8SMbMNT2pavLsdWklilvOHiZ
 U9Kl0EzuMpMcm5V9IgQY3OYU54av5b8IdRbIn8PHUNZKXI+zwCjUrjXkSmUYjHYzt13mYc0LAE6
 /8QqjIEffZntfM41ke0iLdIMYwadXIKo2REI6E0yuRlQFrxMyrXISKtO3BaDCNm7+X5GLMsG57Y
 ysixz620Ib7iB0Qah9/O6+ZE8gvYONG1a/l9ACfAw+i/nSu4SSzuqZaeVsTuPbfLiR+uGYpu43/
 R9PKhNMYq976AU+Gujg==
X-Proofpoint-ORIG-GUID: fhWK1V_HLkBci3dBDGrNLQpQ6Gco5Ahv
X-Authority-Analysis: v=2.4 cv=POgCOPqC c=1 sm=1 tr=0 ts=6976cce9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zCM7-lDapuS4FQW10A4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260017
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51518-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 854ED836DD
X-Rspamd-Action: no action

The only users of the non-PAS setup on SC7280 platform are the ChromeOS
devices, which were cancelled before reaching end users. Iris, the
alternative driver for the same hardware, does not support non-PAS
setup. It is expected that in future both Venus and Iris devices will
use different ABI for non-PAS (EL2) setup.

In order to declare only the future-proof hardware description drop
support for non-PAS setup from the SC7280 Venus schema (breaking almost
non-existing SC7280 ChromeOS devices).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
index 413c5b4ee650..9725fcb761dc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
@@ -43,8 +43,7 @@ properties:
       - const: vcodec_bus
 
   iommus:
-    minItems: 1
-    maxItems: 2
+    maxItems: 1
 
   interconnects:
     maxItems: 2
@@ -120,12 +119,7 @@ examples:
                         <&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
         interconnect-names = "cpu-cfg", "video-mem";
 
-        iommus = <&apps_smmu 0x2180 0x20>,
-                 <&apps_smmu 0x2184 0x20>;
+        iommus = <&apps_smmu 0x2180 0x20>;
 
         memory-region = <&video_mem>;
-
-        video-firmware {
-            iommus = <&apps_smmu 0x21a2 0x0>;
-        };
     };

-- 
2.47.3


