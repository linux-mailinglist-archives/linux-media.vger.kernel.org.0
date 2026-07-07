Return-Path: <linux-media+bounces-66924-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RWGZJSGATWrv1AEAu9opvQ
	(envelope-from <linux-media+bounces-66924-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:39:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2C17202C6
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 00:39:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CgfMYNWZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=asvTJplo;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66924-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66924-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2640B3074DF1
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 22:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424D448C8D2;
	Tue,  7 Jul 2026 22:30:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1B74C9544
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 22:30:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463420; cv=none; b=FU94qkOA15jaBIFewKRstsg8IXkopafD4a1QIqSdWd2PmR1vdKC/tlYKSlbyEOc28kPQbhkYHdsZzc0omI/ucKsNPsPQoNjz6IJRvqwMk1rlhn3mYFrIHZP2mgxgygBp/Q070wofYFJheMu0UK1t5KhFDZ+cDtFS+x5GxApDbyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463420; c=relaxed/simple;
	bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RNi1jab8YZMnbJXEojmT1Sa6V3uXJ6XWyKX8RXZSlEkKqEB/+vOKbkocgqmyISjmWTmqrEfKpl3o260FqZATdul+FzPjHsnyzC5IWAd4QahEYhPqLD7MyDmTeLngIzS0b+atVmmEIwko7hPWZjzLMkMH+59+HIH79g46LlVSNLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgfMYNWZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asvTJplo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5E30542046
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 22:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=; b=CgfMYNWZdBX/GBdQ
	aj3opMyWCiVmB0q89LHsHUTw3FoLoXULVVCODUQAFamRW1lKdHirb4l1yMfRgK4V
	zxpSRF7JYTPYe+sG+o9eCkiVxGHUXoOwYbpx6mNpD7tcfha1CIQrja1U3hMwM2nA
	FkubDIe8RUrwVjr+IS34XwSNqaMoV9uRJoLsg3tpCmzpwqCGNxAxF7/QqpFsZpS9
	2DpGQBIzFnPh1sRAoW+63NKUg6DEgPCDowEWIxszQVtxwNUmZe6LbTdITv4UpKDX
	dHVHRrCYzYZmeau/j4ZInIHp9lpqSU91PcMSmofHa9U5LRb0Nl9y2lPkMew8NQWv
	BW0fTw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11upw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 22:30:18 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963b099b539so1257768241.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 15:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463417; x=1784068217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=asvTJploLBkWLnLxllf4dA+Q2y4WHgWCN0jHG4YJWB8xYCfpn7QQ2w1mbM5BlGaiOD
         zWZKzKzj5lD1P+9D1J9K1+6Eky2PLsOR68xHPhok/TihFg4/+EdHpd/lN3Vq5yMLi+iB
         8gynj4oRVD94/D2O1iTBn7ubW7ndJ+ub6iNdZf6EQDrbfLFPMrcSmVf2OJX6kV8tGZaT
         cK57m3kHbMTzPEiGtLFZcHRBeDk58w7MVCnRBCq+xREA65Z7CfSMX+qyFqOBUH+4YhBS
         ulaAbXdFDnlY6zTXLgLDmE78R+6gE2000xLp4r3/b/hO3XrcE+kRLqtKtHWS8iP+Itud
         5opw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463417; x=1784068217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=RcYGzVYrtAeIL11MK98iN/Rz369wWhPWqERft6fwSCaVJCbovv9ZLYZ2a7yOBK6N9Q
         6lOMB7SEGpJjSb99krrP8+BAfr6FpJjZ+FDU6Y8143/1SxlahKOMYMmRhjsG5KPSDDk4
         ZW3c+Vs3TniFc+T+LnHNd5k5A3+MsOPtxwDvK8nixVB8Ctv8KKgmItEfUFjD+AehPJ4C
         JSHDQ2KpT5fMGqWr+jZwJtNxvTdTWAFJDjPqJxDPFfRdNv/V74OiYDMUNeA6oIe5L9Yb
         RIeK73JJlMYMNHD83qRoNJrE+UKi6XcocsfbqZjo43itdINVIJXKBZd+iUogyMFG/YPD
         alpQ==
X-Gm-Message-State: AOJu0YxSKFXv2EfI3fxYBRRQYYu8Uqozz5LkV7gRZkYiKrBtTZMmV3zQ
	deEF5vmtMelo+u2R8m4Xuv4DKYwck9xGesFFw6EhIDMUMg6snZe8rPiXgtLrETKEYbbazjTDs2x
	yOInMlKtZth4oMTHnUyX9PFvi0OxV+WD/K+nzK5MGLuf31vOdNab09KmLvUehnA8fujMwLImV9Q
	==
X-Gm-Gg: AfdE7cmUz1iQDmZZKUo2eQIkQqEiFwduiMv3Of7DDenYHI9RTpt5fAHkDG7ripjPwtA
	O8Jn6yZiKrz9sJ4G2j8pSZpyPWnQF3JW8L552u4MpyUtE8Da1eevDpFWh8NRw0E4meQVAAfjsyE
	fIBXHLJoLnzxOS7j3VA9r9RoSAlLOXdWps8dhcMLQP4qWDWsuxwb/ytj4kRCDOFlH7/dsuntU8y
	LcF8/M7eB0azxMXo+r1dT2H9LDFqQvL8KNoamwSYbRTxduXwKuVUrcsENSAX4v63uL2buzpsPdm
	oR6s4jj8+r3WXEHn5y6gN7yO51qomdvhGJcqsaD83KBwrv2+t8oTVaD1LPv8tnQi5Rrp5NN58fa
	+Fo5/QrgoVh3ZhhC2Q7zA/+E7XvKMHCmoLkPSobQtqz91QzjR8F4wc+PnKTB7C/i6Uvv40ESokj
	s2Q0srPmsQDW6odhpXd+etZ+0S
X-Received: by 2002:a05:6102:819a:10b0:738:2cd3:2b28 with SMTP id ada2fe7eead31-744c21fe8c7mr2219838137.8.1783463417449;
        Tue, 07 Jul 2026 15:30:17 -0700 (PDT)
X-Received: by 2002:a05:6102:819a:10b0:738:2cd3:2b28 with SMTP id ada2fe7eead31-744c21fe8c7mr2219818137.8.1783463417032;
        Tue, 07 Jul 2026 15:30:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:30:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:29:00 +0300
Subject: [PATCH v6 17/18] media: venus: skip QCM2290 if Iris driver is
 enabled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-17-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGpNfaqh8eD09/9ebEAKHQImNV79crVg8ysUpmvNI9cK5jX9/
 4kBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJqTX2qAAoJEIs8ij4CKSjVyLQH/0GE
 4mGVIOZx/bqtvByuFLo6kSLLoJG37X90IkFC2o/Wv5FYcjxJAMQFN/SJQ+BBJEdL+BE1+jZ5Qd1
 KV0wqLbNVspBWgs0p9rPHJEb6ZudcihD52qtacYIXAvYceQZakmt6MzRkDpydBZsCQLhm0lkhnY
 /zpiTUxKHQztR5C7e6OgLkt7kIQtOThbdH7CluNXlYEs9/OJgUz2OTbzi8arS7A8oVKwsieHJLt
 vUHJ6zXu1L4VXWZ0G9AUXOQmJEUtr5JDxQVyyhDZjd9YZbdjYUiGFR68KUE6uINz7EOgNH4kCGp
 SXnIOXI/BFb9YjGpnyuRuzqT6D5THQtO+kVr6AA=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4d7dfa cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=4ldMYZ-nzf-nUnInMJoA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: Dp8gLMW8cnd4X3WSnRJW_CGHZNG9NVKu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX/f5BM6+wmIPG
 5AqZNQW/0/8tRQmq3mljswlVlQpE1VqhjNI2dlXJuotmsgyws2k3U9yoEHambBYAGtdM/9axjym
 xeSnIDSYuL8lMHIOmObFaRRWvISx+EM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfXyeubI7el0pVe
 poBarYI4D76ZNhoSy52pn7XvWRykGP5x1OGPadbWQ1yQb+DM93vplrx48T0xUiSi7U5CrrbV72T
 u9Fi89pR8w3UNDW9+vMKhixAUI9be5mSyMpJ6fCgZMFjbwtXYOUivIdztgzdYJfVF9kEPeGLImW
 V59BWp5TmxmLYNbVWtux/B1NxoI/nx1LvCfnz0IlpYIlxOlGkX8sxyhtvh6l8Dagm2QVGcbQ67O
 SE6RB7aL7s2kPA6ywWyF3KZlkloJyi+PoO1n3Frm+GNgmr7MRCKaXE0XxjjkH07uSQCslb4bUee
 kMFB1K5Svh2kxqucQk2VCQ9xju3QVdewnFcPFXD/O/GVLso0/8QBkkTQ62fmYN3pr7Q7EH/2/iw
 tcKMpktN5zIYVmWb7GXcAAe21EKajwnEAwKY817+3sITuB0JO8tgZB5Kox/TgpaN6ufOWAUseXd
 27qQPtrwqtSJtJGF0GQ==
X-Proofpoint-ORIG-GUID: Dp8gLMW8cnd4X3WSnRJW_CGHZNG9NVKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66924-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB2C17202C6

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..3c88594eb1d0 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1118,7 +1118,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1169,13 +1168,16 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
+#endif
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },

-- 
2.47.3


