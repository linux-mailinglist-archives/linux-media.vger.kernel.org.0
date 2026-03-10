Return-Path: <linux-media+bounces-55083-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBBWJDABsGm0eQIAu9opvQ
	(envelope-from <linux-media+bounces-55083-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 12:32:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2320324AEBC
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 12:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D7E73045A26
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 11:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5793C3BF1;
	Tue, 10 Mar 2026 11:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gvghw8DN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRPk5o2W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C1C3A4F2A
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 11:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141780; cv=none; b=sqAxfT34Abi6gygfF0OyhWmPf9+qDwGR06+2OyJ9zGfX8OkT8rOmrxzqOYbjnsg74faQrUcFybegbspFbD2FFmaDrVSUYp8FiAvwe7vw0dgb/Uu518dQ2qO3KPeKILnw1JTduT+YhOdq+3SIuQo8nQ37eqU68/BgkUOtjf76wmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141780; c=relaxed/simple;
	bh=PYQfNbJhq08lhf8pSFWFUAIROg8/q1W+1h6VJZjWmOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vDQHqOaAcafBSzcFVjpldo5eXA9O97kyHTN9Tr9nppUZGaJ2w5uygULhdZjVRMW8l2BeJ7c16xRzocEiHkZ2jTtcCo8C7F5mw2POZ3K6pTk+IVHRvS+uxNyySzUOnwm4YBnl0T1Skp9iVWiPyD+e0bPhu3Al4O+GTtCc3RuINYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gvghw8DN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRPk5o2W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8ooFJ246501
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 11:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4x8lVPTfI8gP2nq/1GJgFSF7/Q0HjBw1bkLIzc/Sv/E=; b=gvghw8DNIsAi2ZOW
	rSW3aAU2unXfvpyObviRS6XiDeTA4dtbT3T8AsX+/MCVGS7NNm8/S6Kt7+zM4UHH
	KbGKQm6ax7UUTaOwTgseEP7SYCNxz3rqgTBj8u648oCj1w8Ktm06wF6HHSAAqtdV
	QQ19c+3P5HAUkoycF4YYSERRzcwPvkRAxySGr9+gl/qm1+Z8+Kk1LThEikRfiJ7B
	r/PV77TMO9kVLDtNGcg2MZvaPtq/LTufVj24bCq4kGIU65RR/UxuNofAEfxxay/m
	wDD8wQYZ+n4RYD9iqm7d4XZrQ9X3QKFsLNQWXCTT1tthpouMwJKp9qiUEvhM2csr
	fT3TkA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct88027wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 11:22:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509181cc6ebso16540951cf.2
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 04:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141778; x=1773746578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4x8lVPTfI8gP2nq/1GJgFSF7/Q0HjBw1bkLIzc/Sv/E=;
        b=hRPk5o2WZjSy5L63wTDabmuvyoAjIG83yOR5aUhRvy9F7ap/mc/2/QciaLUjglARgj
         WSTst81VIx4romGz4dybJ5YRyo6C2uElSX/wEMbeUwrWVHU/XS3ZnMxQgDIydsRCKb81
         R4ENnsv7Uza8sUFScbh67OA1AUiOhXqi3qdy8qWbfIonXf/mmftD1L/vZHONvKDRGfbi
         kx+BEX6run2hnbqqp32CjjVp4dDrwaemU5NyV1twkeMqsUcJ2+cv/cbt9x7ORJGCKzJ1
         0VFaF4BasW66aGBNw/OYmr5b2tN7up86Le4883kao72K0cHtydkm9AZM4mckWy/pey5Y
         G6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141778; x=1773746578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4x8lVPTfI8gP2nq/1GJgFSF7/Q0HjBw1bkLIzc/Sv/E=;
        b=ntPpXi8YSz2KXYZnOiTaQJ6asqgSQEvqh9RCQ5wnRpUiQALB9R4t4eZqVmBKLrgwVa
         cdHFbdRzJcbmldSr8TC8EOtSC+8GEpw/vUmpnuH+hys2MVgG6LUW02ic3P1c+D6UJQBj
         BuHHwj/DNhFqZP4YdyfIpS3ptb/r1gKEOSd0N6nXKaxRomainObjhk152CqDnYl24sdt
         c99VX5CA3oKL/2q19hkj84nyjOBmFuQd6u/IzUH/MTqNNh/hiyMUpNP4HZ3zlnE5y/7C
         FIQlDpEciZLP/PsvDJlDXM0/u2UHpFr/c4lvjQK8ZexXnwbVOzyfKpkvx8yKN9wHwhBo
         8QhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9hfwYSAZHNsA5OC6soAYcb4evX6SRjVun/iQo/URSOpY+WwzVILw5NKIJfbP2QLvCcAGeaH/SGCPpeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiOLZgbuG5VF7fw+ahFw0ZUjZszosELYdBG1V+/jF434VXEfYj
	x7p9X8/qGrKMzy1V1yFikmcQV5wKC3QtLTkhLaBm6XIhhj14kZ+ho3K0bk/0yl761jKw1EXzUDL
	GwuVJt7Ln4IZGPupqcprbjsoxNdC+v/40GKPc3LngPPHAS6eGeaZ3hVDj0FrV20xKTg==
X-Gm-Gg: ATEYQzyIUZIcfTx/tTIVDsA+UTyhPwEzLGMk8S+1B37TE9Rhz44mIyI0qXqABpOx89V
	mHyaFCrpBBSvSwHybSXUZHdPkG3z7n9iVqUSxcEwjCowyJMGLOKL87+gf6pB5Y/ic3474PiKCJe
	pnO2QTeaYR4j8ElX98Kj/PcaN3tNSIcNS09JyqVulr84G+xcZRNmBovN3zf873KspDBZGJNFnha
	KtLD1Eg1ntiFG7LcVJnPW5WQhKxygOq4M4wC4H2501XHtOtY8cH3DPnYoUGkznvfFzwy1IuuWe8
	oadRbF8KRPHIw0H1LCYEEiIjB3EoXqw7plX/pzfil3ItPMN4XlntQAAM2OBD9eiT1qFV3OetVwX
	m3R64gccKV+1H6zzdxAAr6Y5tfRiUl2TCarKZrBS7x72c
X-Received: by 2002:a05:622a:1456:b0:509:219f:8e35 with SMTP id d75a77b69052e-509219f951amr49609911cf.42.1773141777603;
        Tue, 10 Mar 2026 04:22:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1456:b0:509:219f:8e35 with SMTP id d75a77b69052e-509219f951amr49609561cf.42.1773141777135;
        Tue, 10 Mar 2026 04:22:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:22:39 +0100
Subject: [PATCH v2 5/5] media: platform: mtk-mdp3: Constify buffer passed
 to mdp_vpu_sendmsg()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-rpmsg-send-const-v2-5-0e94c5db9bf4@oss.qualcomm.com>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
In-Reply-To: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PYQfNbJhq08lhf8pSFWFUAIROg8/q1W+1h6VJZjWmOI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/8Ctq9UEeQlkwgbYOvBN1J0NS/LKB7qV4njw
 JU8skMasvGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa//AgAKCRDBN2bmhouD
 1774D/9uW5xrt8/+RUVSYosRDY2s6mNxQs5JaiEfldKJ+p1+reJ9wftn3leur1dOdwHj/pB3F9A
 jOJIbwcWDRi4xx/mNWXP5Hv2xSEBxQOcf0sfrwWcK8LroDj6wlzCOxbOvuhxrfvltkttgQ14t03
 U3zs9fbzvPxeEASE1aWA0d3S5va6WP9xo42jJeOovTbPAY79OwFBoFeRrALnvVy6NxOerxKOeGQ
 5lBuAzESo+KyhCSJUv858+bItSk7gcTzAJspq73LPE6peIEYsHDuicNoHnJYH10E4HBS7nktFx9
 IyONmGVnKGA+eWGC4bh74oYTC1f1gj1COyvrzK2sHh6TvLIksPRy3KZBFHUFTYKc2V9n74ypweX
 mkivKhKMRyMxmsR/xoxKrOmTs6pbC5qM3bonRCgksg+e6Xa1GittEa5ta6/CJ1lF+e1TBq3jJhb
 bti70QpBkAPodaPfwDZhfmeCIdC4U4RdXkQb20tRu4H+bSE4k7c+kytacurPBtGm8w2CXCvRJyR
 KOm0hEFxtR3+n1gzbECyPMgHwj1KRsz297+3oq/56L7lZVaIq2TDOD+/T7H+LXQAa5Vds6WuxCh
 eiCnDXDKS+yIdOH5I9wBB6q/thrp3foV5UQ0aBDk/YGwhhfGRM9mErhiUyj9MpWlNRKuwsH/+C4
 d2Tmexu7aWpZaUQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfXwnBpNLy84b8q
 WTZlhPgnrsmQm6B42DzL1o7P+R+ZHC3Zl6W2s5nzMoAysx0O8Z1dW2046ZTLCLQmWBq3lsbnS7v
 m+4rAmF5QkEOh1OkNCCAykmRG0w6PcjEQWdHqHFh5RnqDpLoSBYU8sHflJxJQzgF1WcmOpP06z6
 pGcaYrlNlBWmVqdMLyn9XJOhwn6EzgD8K5QEFRnNFSz9BrTVi7H5PmUmpN2sWEelbEhIpVF47Mc
 FaJJBSdgOMBpU61crjaEhoIa65LE7NrOzgbovQ0s0v8XrEDgK2UldnvfRc0ERuX34pvV4FPSvmj
 KX6uVWpAJ8g+Ez3a5lFWpURmwmEzviOMbcfnO3HBmYxHomXFL4laKVNlHhXfR22KRvXNlbeugEz
 0DdswSkndWcViW4wTq2nV0cHEBSN6Wp8Xgi0dzgNmch8P4H3/b31PiBUPGTbV5ZzKVAQhNjqG/a
 PJPrvY1lpkSGLo/0quw==
X-Proofpoint-GUID: ZRFPGo2bhy0fiklLUY3GByGj4P6TGB9d
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69afff12 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=07eiXoGdt8lw6NVwCNwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ZRFPGo2bhy0fiklLUY3GByGj4P6TGB9d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098
X-Rspamd-Queue-Id: 2320324AEBC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55083-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

mdp_vpu_sendmsg() passes the buffer to scp_ipi_send(), which takes now
pointer to const, so adjust this interface as well for increased code
safety and code readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
index fae3e1ad2df7..67f3001153ae 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
@@ -163,7 +163,7 @@ void mdp_vpu_unregister(struct mdp_dev *mdp)
 }
 
 static int mdp_vpu_sendmsg(struct mdp_vpu_dev *vpu, enum scp_ipi_id id,
-			   void *buf, unsigned int len)
+			   const void *buf, unsigned int len)
 {
 	struct mdp_dev *mdp = vpu_to_mdp(vpu);
 	unsigned int t = MDP_VPU_MESSAGE_TIMEOUT;

-- 
2.51.0


