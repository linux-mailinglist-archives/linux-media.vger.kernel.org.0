Return-Path: <linux-media+bounces-56308-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCbeGIjDu2n1ngIAu9opvQ
	(envelope-from <linux-media+bounces-56308-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:36:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5D62C8C6D
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF805307770E
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 09:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AD13B8BCA;
	Thu, 19 Mar 2026 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="clAlLewL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGbpAmFW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FAC2264C7
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911353; cv=none; b=QH6rjCY192+kGRfco5Fs+W4qjlwyVZ9KtQHfx5sWAab9zZzCzSUcC85CA2B0nsnTKUuGOzQjjEn93qEyUqX0LGDJ4xF4K6aDpdEhV3Fyqyehaa1TJeZIVZDZp5fJ2p6eH5f5efKtsO3Moe77qdN6oPzUZn5tnJ+s5FVsR7nwvAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911353; c=relaxed/simple;
	bh=cmK5vb2FrzvsJpQbbpfUCD6ag9GhDbKdfLd00Vc5POk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EsiXwDJfwFRtFWZ47KfEqknElhGVue7wqXrV91ZJl47Bkmp7qtyBQQoUcdOUQpQ9jhMKS5pzdoAjnOMgWZ/WLTOJLXlvnEkLOSfSA7s9t36N/eq36jPi122GS+8nkkpRY1iKiV8ciiI+4sDd/Gg39SPNg6wLIILtz8DgVgr22Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clAlLewL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PGbpAmFW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J747Dd3369542
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7R6L3xS16p8YnPfIpy5Ajv
	p/9Vk4dIecCcE5jDcOgcA=; b=clAlLewLIOZ9K/z+68+N3XC+5NM17JnlY+4KHn
	aMOMt3eiUD16E1RFax9a3iM7o6vtFMBGjVYIlyl+9sOfbvpIXD3pT5Q3sf+L+5XX
	wL9h8626aDfSOEku+iUwMPBePvzeHrtagQ5ZctNXDNacqTUNwrJc57wYdPmWxwfj
	phg7/wPBmJCNg8WYDVXKUywVbAnEBwcjg90/de9J5OKEUXVVnsNQVl58xqPeJxEb
	tPOxa+jvR09XFRpUbt5s6EAWZxZxqsqS7aRS9AjWlPJpiCOY3nVn/FH9H+iI4PU3
	I19P0aqFhIV64umTNzMq/1HO3Lifh9LgbEkQIchdcHea+tmA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9jhgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:09:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a0013d87bso135289536d6.2
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 02:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773911350; x=1774516150; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7R6L3xS16p8YnPfIpy5Ajvp/9Vk4dIecCcE5jDcOgcA=;
        b=PGbpAmFWstBsk40Fnxda2KQjyILyf0Bh2uM0y9SiZbjV3m8mCrDPlYOYwYNVmBYmo3
         dLN9bHsZ6wvBCHWEeJFjQLS0GfQn0Y1jBeXo7SVpeWDfdyitEpHwRi+7tR1jVI7rvoiH
         dUPgA36PVdhBzNne8G+/dqMXuKqOyzTk8MNrMNecq8EhCiSbWU+hS3EqSRhnqTMmsThp
         b+1Gp9FgkFlX201HR5ZDs58nKXV53Or1IZyBWPok+uWEMZbqwB5wSrVDHM9sAS8wv2OE
         pJgY2w4418VnvkrksbySwU6kBZNz6sT59HVNp1CHAFUasyLElteVoXyae9Oif/0F8DBQ
         TcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911350; x=1774516150;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7R6L3xS16p8YnPfIpy5Ajvp/9Vk4dIecCcE5jDcOgcA=;
        b=MV4FM/kBQNaoBok/9fKG5q5bIjAGws4gG0HKoSKWVjqfI/HKj1rjg1K57dk81H2Y0K
         RbpTJWve4pVlfjFZmKSPb9M57+VkVmkmU5JozVAjFCTSN7bsKFrcDKCXDe9RnsusSQn7
         rkfS4roT81YcrcsvVSnmukAFghXoVLNwAz0ZhST2E1s2slfJdk6zBRBaVCKFFnjCS6b0
         woVLyfoC45G1I1AlRv73oMlv1yX9lBPZ9lrEO+zGdtu4AjtbcgAQ/SN0okFdPdMKgl80
         RFm7egn2t/jhG5qSrWWnm7/k8UaCqU35siEGbrxeiJTuuJWcj4VHQuSM2MZJfmTmdcii
         YqMg==
X-Gm-Message-State: AOJu0YxaSUF/GzJ9P2gptvXNxX4+vzcoX5LxYjSZKeaEMozDIjLMEqjN
	+Hleo13IGWkZv1fgdQFjmqBsxNZ65p8j6CtKKinVTGoygIx0gIjEMshmTJox6rx8Jv6aF85R86d
	2zYXYOe342uoiEsBvZheT0doyd3cry7b80I+AjPjHkIQl4o4iJ1Tk//feZG4PIpltzw==
X-Gm-Gg: ATEYQzxuynGiwf3v8Af5+jLcVxgYbWODMwWycUlRlkaDVCzZs2JYNETnZ3bRCcD08Hd
	OkalAabOlJAGyIKn7H+Uy0cMtSR5SbLPom8TyzvKJQ8Dd6K25G4GehAatAo1VZPU6gI6di05oJ+
	37aGO6d86yq7FgeVYfqmwNa7Kpw9ib007OAjzQOV+iI/qbl5knq264h2CF96X1MDKYVt2hWef+y
	Vgi+cAjsucyo2tVE802AS1wWMP7vvrTAQAHneTBQW5v1N8wON35j7tso2O3hP5mjfJ/Rs0PZNrd
	ZlZTezSj8q/u1EtUrCeZDPqmFPb4dLK7NJKLB96uKsNY36H25p8Epqa1qwkVCw/GmUqEhWviKNa
	UPz5jEXhQ2Py/nb8ZkLNwZME/phFsM04fPQz3FC0LF/+NfzW8ch0burtvrSN4mgnABUzMvjQsWU
	8H+Nm8JAX5dn5B
X-Received: by 2002:a05:6214:caf:b0:89c:59f7:b29c with SMTP id 6a1803df08f44-89c6b5d9b8cmr100093606d6.57.1773911350481;
        Thu, 19 Mar 2026 02:09:10 -0700 (PDT)
X-Received: by 2002:a05:6214:caf:b0:89c:59f7:b29c with SMTP id 6a1803df08f44-89c6b5d9b8cmr100093176d6.57.1773911350060;
        Thu, 19 Mar 2026 02:09:10 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c6b8e225fsm42545146d6.3.2026.03.19.02.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:09:09 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 17:09:02 +0800
Subject: [PATCH] media: qcom: camss: vfe: fix PIX subdev naming on VFE lite
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-camss_fix-v1-1-e69a3590500e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC29u2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0NL3eTE3OLi+LTMCl1TA7PEVEMzk0TTlGQloPqColSgMNis6NjaWgD
 LIIcbWwAAAA==
X-Change-ID: 20260319-camss_fix-506ae164a5dc
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773911345; l=1403;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=cmK5vb2FrzvsJpQbbpfUCD6ag9GhDbKdfLd00Vc5POk=;
 b=uB2Vdk1SwsXGTpItusglghU/kY6JG3r7Xn2ldw67gDYCf1i6rT4lqvFADibnpwY9ipPvL0XU8
 6+ka8Xftb7gBjRNnzSqcP1wLIG830UlGCABaJR4GyIH2C0kx7a90/K2
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MiBTYWx0ZWRfX+CjIi5vLSZc/
 qtWdYKN4Dxl0T7J4wTVDIvArsUS0luPWP+p6SAIJAehEE6aLKq0V5Z7ORpKs5kIheWGi4BhTeVd
 ndvsFYMpFXZ372/IBjTBCus8hMJg27a9sEvqBlIoGgkcyhPKizpW4JCQKkVhIEi2JSWQvxclXYe
 vDcgoOhslEjvEw+yQDWD4UtBgkv7MDH9mhcS2SSWtT8Su2RD0im/7ToRLNasT2qvPYSDteBS7LA
 3qcG5za36/EOrAIz9DwQwwZekdDJoSC3jrFOtYA9+5ttXZE09Vom73TXfeEL0ZfAWpAxaKoSTId
 xQBSotHT84iYyxKHCJBwNHMiYCeY72o6N+agsl25HIYmcDLYihmAziIQzY8WPVJjqlU+Uv2M6rV
 HevvT3najv5HRdyd0Wg40HlIbKC7gKKXEk9PFvpST46QPd5dczHjPcRsjtYPQFe2XTAzPcN2pOJ
 g6gCCEBAditHHuGkvJA==
X-Proofpoint-GUID: DAGdRXgXlG_7ciolwhuzLBHGkNCGGN85
X-Proofpoint-ORIG-GUID: DAGdRXgXlG_7ciolwhuzLBHGkNCGGN85
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bbbd37 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=y1k1fiDKQnIFYaxJ8vAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190072
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56308-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B5D62C8C6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VFE lite hardware does not provide a functional PIX path, but after
the per sub-device type resource changes the PIX subdev name is still
assigned unconditionally.

Only assign the PIX subdev name on non-lite VFE variants to avoid
exposing a misleading device name.

Fixes: ae44829a4a97 ("media: qcom: camss: Add per sub-device type resources")
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 5baf0e3d4bc461df28d8dcf97a98dec04fa17ceb..2ee4f9ae0ab50e22f916736f1d1664767bdb6a36 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -2053,7 +2053,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		v4l2_subdev_init(sd, &vfe_v4l2_ops);
 		sd->internal_ops = &vfe_v4l2_internal_ops;
 		sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-		if (i == VFE_LINE_PIX)
+		if (i == VFE_LINE_PIX && vfe->res->is_lite == false)
 			snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d_%s",
 				 MSM_VFE_NAME, vfe->id, "pix");
 		else

---
base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
change-id: 20260319-camss_fix-506ae164a5dc

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


