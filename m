Return-Path: <linux-media+bounces-59675-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBsVDVBb72mWAgEAu9opvQ
	(envelope-from <linux-media+bounces-59675-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:49:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C3B472C1C
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 50ADA3008465
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D443BE659;
	Mon, 27 Apr 2026 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbDvfWxb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqlwG8O7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5353B9DAD
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294013; cv=none; b=AoRNrfu+vH5VMH606dZB9Yj2vzvuDy2NslvEgA9+pUC/h7aOCFXS9yIuBwAg+MExNXSKVCsP/C8J8kehMzjIVCtaR5Jq+l1eykCcfJ7I+ptxo3dXy3jnJFdzvTSWzNlDjv/C3Z4x91NMJAKzojTlOaOm1XAb414VCvq6zaOx4GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294013; c=relaxed/simple;
	bh=lPbPNpJ2ajYXcbSU6CUgF1cdOaknw2iS5g76PqOTMJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A/yu4evCjbdb+xOPSeZfYPa446T+hehLn/X0y9y898pKNQtlQ7ezNfjQin8ftAs+QEvYfjZPBH7yNjibQE80A3TzCP5PCekvarnt7RFLpBaf/NQzHtZw4A9vqRZ0nTTc3kVue2/cKYnhfDYRKgfMQEK46JqFBljquqOCe1Qmg30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbDvfWxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqlwG8O7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8ki2W3962350
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+rZxWV2BVzHNmwNyI4KXBWCRAzv77VAsdiAZYzEAZKc=; b=kbDvfWxbKpo8tYce
	l1OaVfKx2eJfaNCcN3nbhN2Lz1E/0sxlqzqE/RjKegt0WTh9cMYUFgojSREZ4iho
	2G7DoUdE2u87qIdqOfGsDgpSnjO/UeVqeaYIuYoPyPjmcNh269gdn+l1EVtu3ZgH
	+3qRqwo8MA8ftaSrORJj6BJ05Gmb+NUUib8F0+6TEmz3dlVjcszu1YOtB8EGELvs
	Dn9x5RQK9EM3RuD8CMbvwpS4ah+fXLPlfnifaFrHDDDHIDer/qS39P+6RjTWwLA9
	xMFRRJfGWaH9MZsyAroL7IndcN6/4lbKkLRlYs2SO3fbHmVd7LmyHKZPZcA5u1Jh
	BYXN4g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k313nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50ff0bef198so40038041cf.2
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 05:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294010; x=1777898810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rZxWV2BVzHNmwNyI4KXBWCRAzv77VAsdiAZYzEAZKc=;
        b=iqlwG8O75Zg7jCNRHXfk5Vqk7CUxc3cbbc7NSwUjEZ4ftprGERSPIwg82wPaYLTnlJ
         7UKNtS/ToV8pRjmmHd8d8ZklUizB5k5o/+kKc7BBnTC2sNu10y2nlcZSkSdhmQzVwYXF
         VEy020Y0HWNpUpFhaGxBchZcuHkZSppoKPNmCpYnV2fDnzsaxnEWNCAqeoVJYCFC3Pvm
         LEVh4U2TQ0LmyQkw6k1PwmsVD9WNZZKOoqoqjp4JiYjh+SMR6BOdz7YKELwExpKn9OgJ
         IQN/ymehbm/oEzd5nCv8Fow5Zo26lEnApjQKl4tD3crygFuaBMypmg/7mQF05uuNlR4P
         atFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294010; x=1777898810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+rZxWV2BVzHNmwNyI4KXBWCRAzv77VAsdiAZYzEAZKc=;
        b=XIPatqJ77mnkykJ5nl9BWwcSTdLeCRsq2UIxaEBLAh9rx6/ZshaePAlll0tja5LmWi
         W9eKi5tTS6FF6IYhJXgXUh/GSzquRm96UEVtLmvawoChSJ7CFcnC1jNjfhgf2Zw3FYFJ
         1Exkd0yq4FyNgCIIRih/ZZ7pOmo+bQH/w7aO8cLZjdr8bG5CDjQuP5tesRYb+zlDIyUT
         GhSFYLd/IPu19yAX/a3TwqPO0K9XZQIshqwwxB4FA9ALuDymXfyUqqrRI0Rgw5vlGn6D
         +LWLozBlTziRUc6ADekLBMg1/bE54Q0Rwk3ukp2r4SKDJd6O2RgNuxSeOHYg3BeAJN1Q
         ij5Q==
X-Gm-Message-State: AOJu0YwrygAk9MVgsI65yCA5XD6cWfSCMAJjDLgE4WI2NIS7Rc39EXnb
	h4SWqNqcV+B+/5zx4wP9Iff55eJY8Hlj4u9oHaSefA5RZI7xRnR2AiGxafqf2vJGgEfvJN714m0
	7asI6B3oewh2aX8smBOOEcY1aft6KqbWy8fOo2/fUqD9kLujCNX4RFqjeANzn+/e9dQ==
X-Gm-Gg: AeBDieskGhu7NXAm4plbgh0FdpaZoDMIhKEs9jIpSftOJqHFDWm98pqQggqD3pZXOCw
	tEzva7Z0S8hsDwxtRBkSBidrnDs6A4bsbGoY+4ZW1d16hPkeAAUYzUBPQDXTPPxoYqKIBy1yvr9
	PjE6tLt1R6XRWdftHEGpm9C/mo+lkQz0kvmwgKxltV5E22VJ/cmOGhS6d/9sLitPWiiqXW2Cufm
	2GqR7c4jJ/tVybF6buTGznioiBqpmQcNatTv++cFyaOfvgVf4lSk4v4nr4AoIT5aeHql/2Ol6tg
	xxxP3+vLhucxx+V2oA9Bola6qAU+0f1akA+4+1I9NNOomCIZzGWk8gNB1Lf8ZT57ixYmgWeaViW
	CN5nZnZ0k5O2nQJpDkpTpRxbujT0Yd6o/9osv3Wc08000ujs1Egh4z1tQ65j3CytlhN5VsM7qbh
	9H1DBx+E+EuxXZkNcTK2fOtVha5qc=
X-Received: by 2002:a05:622a:65c2:b0:50e:5acc:e792 with SMTP id d75a77b69052e-50e5accf287mr351235171cf.14.1777294009721;
        Mon, 27 Apr 2026 05:46:49 -0700 (PDT)
X-Received: by 2002:a05:622a:65c2:b0:50e:5acc:e792 with SMTP id d75a77b69052e-50e5accf287mr351234781cf.14.1777294009301;
        Mon, 27 Apr 2026 05:46:49 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:48 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:35 +0200
Subject: [PATCH v2 08/14] media: qcom-camss: Add image formats for Qualcomm
 CAMSS parameters buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-8-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX0+Rx4aqaJ/bK
 TJfkc6fysn9+w9DB/nAqYYO0ffqycZBI6EKJXv3jO4nif8EkSAi7pobYuaZHvBCa6/q7D6LulLW
 Y4/4sPX88h0R9LNgGzo4PlIFr6tu7Tm3Xlyj7R+8Bu60KKHVR9XubLnvDt2iO7gyg1IEZF3UJ+X
 lJM3pqxwTi8F9fa6dcE+9JwzseNmX1ZnxXJc9c7lyr87Wx39pWSy39SSfL+5zhr7f69u8qV3wMa
 /yYhVFqX2loB/S79c73hGWa8siwE9A80i6VeDA/j1ctzBLeiZKG+JW9spE4Nl2w/Q2YYGZJErpA
 5PCfVcvpkHSaWOwbDSTwB2K2g5Wy1Secgt+cEjy/EGzzsC/T5Yzk0+HMSmaAPw3vT7AMA+IeeOC
 b0UizyYwmUrbzbATL5855J3FpOFkgZZz0QyVASKdjPGd07MOR824kXhCcerT4P2ViGoNARek5hi
 1C678aHLwAGiYTaWlgQ==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef5aba cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=QedBaXGEmMrZQ1XkLmwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: cEyHBuNkvwDaImngzhtPiIr2UFiaHfug
X-Proofpoint-ORIG-GUID: cEyHBuNkvwDaImngzhtPiIr2UFiaHfug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135
X-Rspamd-Queue-Id: 53C3B472C1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-59675-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add a V4L2 meta format code for the Qualcomm CAMSS ISP parameters.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..7b6e9a9a514f037190d55d59409dd6cc97522943 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f06890182a5c399a223c1ab0a546cae1..f861211ebd7aefbcf4096885388069efed27ddc3 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -888,6 +888,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS offline ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP Parameters */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1


