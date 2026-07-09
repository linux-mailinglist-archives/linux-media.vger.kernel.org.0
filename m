Return-Path: <linux-media+bounces-67205-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y9I5Jj35T2pwrQIAu9opvQ
	(envelope-from <linux-media+bounces-67205-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:40:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 006A973518D
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:40:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ocULjT97;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=R6vk+2kE;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67205-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67205-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41D223078C18
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 19:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AD02D47FF;
	Thu,  9 Jul 2026 19:37:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0D93C063F
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 19:37:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625831; cv=none; b=CgRdiQ5CAceTbBD8zHGCovUyic9AGrxs4RMFZefuY3MiE0qaymgvIe13hjPUE2n9oLjRS12aJc+o1NXPdK+qbHJi6Ut+0duM/8M2kNhyCgnk7t6O9M0IGHHGPwjQtDcbaftSHD4TuPybqW2/xwhQ8basxpEYB9VTzC8M30SjgDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625831; c=relaxed/simple;
	bh=NwkqOPZThY3EP6npn6cBCU5ORPjGyqb/JKGlYfmXsR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rMvPX9ZXq6y8W16jTDWurUvBQModHY69LIpvPq9N3WHt7nnFkWUn9BM7bunArjBVobArsPvdHSyTcRqp5Ak6zxx1lRRawpy0lmCCl5lHhQ9w8zjJg/GPi7Hw2yzmFR/PTW5pe+xotuwy07m45FvWAWEC2OAsF/6qag+OFBHeJM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocULjT97; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6vk+2kE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXKtF2518814
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 19:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QlhIThoKhWV0NGGXTdce+TDsYV+ZJZQiQf8v+8Efj/I=; b=ocULjT976cnMtZJq
	ejlh4lx7n0P30nR1lwYcZqw7DLHU3zUXwhu+UU+6fIeSpoDXTJ1u9B6qUSevu+YO
	JiQLZ70wEksOlHI3kmfM96nYKt8BrMwPc+IorazNyuCpN6NcGBN+GxYRP5Mx5IU4
	sQ/pxqH1Sm/p9Uv4gLpeL5o4zlP2+q/Aq+trZOjQZNF8ui5QwgyfAg3WLYyyiDb6
	Ou1L23X6RKkJm83KK6MIjeWVsZoOWLACVvOHu6lWhre8DrewUzpwL8VAjDd1jBJF
	KTXQ5F3fdA8O/Kj5pVpJVgJgWrrdxm9Hs2H9fIWXyln5LxzFMLpLPZPSGQmvXDIn
	ENQzMg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faekn94v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 19:37:09 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-738de163061so1212786137.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 12:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783625828; x=1784230628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QlhIThoKhWV0NGGXTdce+TDsYV+ZJZQiQf8v+8Efj/I=;
        b=R6vk+2kEQzxVpH2owoYyWyAyzdzi2icfwVoZRkNDFy/ZpqfS5717AwbV24bLNFg2yC
         bsc7L8FMDNHkUdMqQLA2a1PDbnR2ttkEqEBS2wbuqc0VAawakB2KwRQAzkd1AULo4z4P
         ObJHOKjflSoIwyLhezFgxkb/2NXa5AM6Fgm0sHtvtyXsLmCe5v/PO+vm9paMm1L0TXnp
         FFREPKwjQcOGzCrFkjyQn5ouRToHPZuhWd5zLvri5MqYvOX/4FRIplngw+WdtfFChsNg
         jnozEGa8MVZAcKFa2N1dA6s/2X1FXyuugRcrZ9Ecbx7GCMOuZOsRx3kM6vbGrbePERbf
         Wl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625828; x=1784230628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlhIThoKhWV0NGGXTdce+TDsYV+ZJZQiQf8v+8Efj/I=;
        b=DH3Sa1v/CwrI6BMAy7H3gjjTYqfyTMxfD6qCg4yeHVKvWlvqPu8nQWYl8WDJ7KOZwt
         dJQO9E2lwy10CnkG3JyoUkQeVEqtwlOkl4f3KukZ6vUXnpC89PENMQOjvRSng79izIUF
         XH39z2tIgThGg2272z060EfibdejTwtAt6h+1z+Eq+U4QsmSPyS/8aQQuJ7yslPjY5Ar
         Nuzrc2/zSVd55b2tKywEcEji5SED0gMt2pDaEMZoW2b3fWBSobOTjzUYes1MCNSSOXxK
         G/+QzgdjxJ3Gy+olNL4DRowK7Wp5BUq8TYZU0R90w1YqXLvCn3sxRstohGra64pLYLrn
         /hbA==
X-Gm-Message-State: AOJu0YwvMvI3lqv4+Iqp8oLgO2vhdQBAJsxEB6u82b7G0Q2liUmlHGD3
	pZp/bsMvVPpfOlwcodbetk6pHP/8sHn9Gfu8auKbofcLbtShjz361Q8mdxsqTrJLu0+5g5PUi4N
	LwQvy6492L1tS8Wb1vo0Ki70EfXfytcAM0FCR9NiS4IqeKwc4ysz8AMo0xlHR2BD1cA==
X-Gm-Gg: AfdE7cm7r8OrLEm0jbHdlWv/vO58s1MX9yHxBb5YumYicTzSgrHdspEXEHb4ma38lOr
	IWAoY6HEl5+iW2GvsvNIu8PNQyIf0jV6ErT3yg1Vhezs7BeN6yGfUtiZ+5q0CJ/invCuQJ5sZou
	hdKRQWzeBkPNgauRBLLkZ9as3cU6BA81g4tRBxdH/8XAOUQigUQxddMZw6Q6NgTy2VB5NHBXdyz
	0FI/M2BsmH+4p6K+Brq57RwtGuZN+TJKHDTxrcLj1rcVRfNY/oYMEp5/Rzs2mYX4U8jRKc0G1QF
	Rz4pi97N6Y6OzM+m3a0gH875kXmnQfsyTd7tgXRsBV1bInci0YW6bibmD25dRVjPq6pFokma2n+
	favoDtrKuC5mTLAGWH8NjVWXXcYV63lBegeUBJ0dYeKLBwNtQ11SVCVcjeDftvkgnYaib0cLIXK
	hRDzG9aCO26AxHc7KaTZmCGLFa
X-Received: by 2002:a05:6102:610f:20b0:738:8b5c:a41a with SMTP id ada2fe7eead31-7450cb34f7dmr321028137.18.1783625828504;
        Thu, 09 Jul 2026 12:37:08 -0700 (PDT)
X-Received: by 2002:a05:6102:610f:20b0:738:8b5c:a41a with SMTP id ada2fe7eead31-7450cb34f7dmr321005137.18.1783625828004;
        Thu, 09 Jul 2026 12:37:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm46400e87.62.2026.07.09.12.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:37:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 22:36:59 +0300
Subject: [PATCH 2/9] media: iris: account for UBWC extradata in the QC08C
 buffer size
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-vp8-v1-2-6af3ab578a7c@oss.qualcomm.com>
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
In-Reply-To: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NwkqOPZThY3EP6npn6cBCU5ORPjGyqb/JKGlYfmXsR4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT/hd2wUbJLMz2y2ia77Ja/8crI7gIJWNgvBPc
 MC+OSh4UD+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak/4XQAKCRCLPIo+Aiko
 1f9bCACMWUAIHbrxOy4QMybUCjRbEHG9i0ftbno7urPW6GlLutaHvjlw7B77uUUmc1UnfOv/tjN
 UccOWS94kszuqh6QEQWUm2Cgb+IDUxiL3z4zqH1ispz6RAdk2oHvL12gdyRjrjG7kkyX7zuE9ne
 3AoRiWcdAQVJVjua8L5csIBH3MqE9r1kAayQHEPTxKiRC8ph7T9Xsnubqn5M4VYzAFiUTxtOYX+
 fj4mZqEMyvLHag2Kyt/Yns1/+TyzcvpTdcAhKkSHi6YQpSdxhnmGLw0Df/ZH1eNxY3S3h9wyMPU
 wJ1ja8voIW+slmsPBKC4hi13+IgCnaU4nBxj+L3xy/CCQiQA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfX0+RyAoKh4WJ4
 eD2J+TSFbOTyFaTDq7lZINRQqQuLC4G93m2UTROBg1i5BmmwXCsRvykh5ytkZQhdCrocjZqZTol
 nU4QgydZWyCz8Lq9qh59PVCGWIIzAUU=
X-Authority-Analysis: v=2.4 cv=SNlykuvH c=1 sm=1 tr=0 ts=6a4ff865 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=sREgFY7xmtrZiFTpSfQA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: Ta4egh1_qMaS7mlP4GmYKUZuQ683Vx7x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfX195oNHaLe9cB
 AHH4cn4404qUraKfPXMD56jkAs9aujHEkjhUyfEBazwFdNcGD/M2mvBta8gZZjQf3eVIxcycu7z
 +Gg93WxrjUkurTgLPrvsfA/yWBdw6/9MdbTaDNiOH58nKAlKk20IvRps80G5Q2w4dsdest520Tu
 T0sfdg/IEmb435QLhSWZ26BREZA/EuL9UThdcS3Va1+hJyuYhZEFq3Eyl4PMhuIm/lNQdCT6x0f
 kQaOaZoegNSV4ncNM9T0vTXnKLFNfRnYjH02YlAgWbIlCGC4bcDsJhPYUA1yoijuij7uJDBMcko
 9qRNNGOXOR3a2wGkBcC5chTjS+jmQiKsvHVa+oRTxm3E2H2oLiQ4dMbNFRS0i+2G3SCZn5svkbP
 8jv3F+N+UWJXERHchWau/3QLQSTtzqmsvtmtCwXCfYVYmfc+rTn0GhU2D0eoif3yelvZDozEDvv
 dnWSk8pZcrxa6HccaCw==
X-Proofpoint-ORIG-GUID: Ta4egh1_qMaS7mlP4GmYKUZuQ683Vx7x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090194
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67205-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 006A973518D

iris_yuv_buffer_size_qc08c() sums only the luma/chroma data and metadata
planes. The UBWC engine additionally writes a trailing extradata/scratch
region below the frame, so the computed size is too small for the
reconstruction (DPB) buffer. When the firmware writes that trailing region
it overruns the buffer and triggers an IOMMU fault; this is hit when
decoding interlaced content, where the reconstruction buffers are packed
with a gap after each buffer.

Add the trailing region to the buffer size, sized as the venus driver does
(max of 16K and 48 luma lines).

Fixes: cfd71b14b0d6 ("media: iris: Add support for QC08C format for decoder")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 246ad0abbac3..f1de4442be1f 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -261,7 +261,8 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
 	uv_plane = ALIGN(uv_stride * ALIGN(f->fmt.pix_mp.height / 2, UV_SCANLINE_ALIGN_QC08C),
 			 PIXELS_4K);
 
-	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
+	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane +
+		     max_t(u32, SZ_16K, y_stride * 48), PIXELS_4K);
 }
 
 /*

-- 
2.47.3


