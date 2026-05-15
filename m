Return-Path: <linux-media+bounces-61670-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGMKBhUJB2r5qwIAu9opvQ
	(envelope-from <linux-media+bounces-61670-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:52:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F23154ED0F
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E5DDD30F7D01
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD93747B41F;
	Fri, 15 May 2026 11:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZH6r/4P/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JLO9LLeP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E251147DD63
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844221; cv=none; b=peRN7xM9slkh8fCPedkC5bkHTxcO0ec4tZTnK+zhc+xXBNM0nwqB/RxUxiosoltNAzHZupB+DFdgzFyS8ryrNyqoQh5MH8+LULkzNN3SqP6OEcEj1EJdpBSd3xPIiTjWyw7M5YS2OSatQZuVCktVOY3lS4rJbD7c3uSOTS9hShE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844221; c=relaxed/simple;
	bh=R4hyx2wkdaEzOFeos/VVceiifZ41pzNik6VeXo4D/4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fyIz7Vp9yA0IdiS59dq4LSbTsaGzJ9V6sh4uc4tRRWla2zokjYGsNe9kLfK5pCMy/peTmMGy+edr7oNrHcbjbVOImv1bbcLr389IZ/6IyQh0eX6Y0Kfpnh/DN0lq+Lk78JYdXhCEdkBE9agoU5TECTTvXyMV29y+gUOkhMvk2v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZH6r/4P/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLO9LLeP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBJPqa3200281
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KJAZYj78iKXwM75l/HDp+1jydtLEC0dNPj7aNSYgj0o=; b=ZH6r/4P/bjfihWKc
	MWvcPuD3B8tBa1R0q1RbSZQfNbO71WlEUb7+LlWA1NB4Uj+Ei3K0zu6B0SzNZ3RC
	XY6CCujcEv6Vk6gL6ThGZ1qK6ExE13ZKdD8ljdm2ElJ+okYoeEU3+JfFPj0LghC4
	Tk/J9EvkavnoiP21apqjS+VWijHKIQVy3494l46PzjaVB4N2+zduvI59FRCUVAZa
	PhByS9XHmVX1I3QWFtViIXYrdCppNIBXBaVUxpYl4yfk1dvJhRdqkD8msJRLmVnl
	J6dgdUCPfXlMUkf9F1agxNCJbCB3FM/RZbULEbv+ey/lpIoKxDkeJYPDiXYdIHE9
	C13O1g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtym8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:23:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367fd7b8825so7020436a91.0
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844218; x=1779449018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJAZYj78iKXwM75l/HDp+1jydtLEC0dNPj7aNSYgj0o=;
        b=JLO9LLePbC2H1wuFgU8p2bNoNtUe316v4P+HQZCgB8y6ScM9PlEqcpdX6w0fq2YzFK
         mrngxa27CxlgxCMRPuobxSDtfZie2iC7ze3L0daL/av2zqmWkzgqs7S/4C9A98kIivNU
         dbLJOcmwrqXik+++5vI3LJIHwSuEQ26928CfwTjMGK3Y7oJ9I4vUNTYnYBwa2k0LWmt8
         54qQFmuaR+kj3j59Z6xyZs4xExFssMpjEaI6P3k22oL6zT0/81lY9IQ74FMRpCPqtBmm
         IKSsT4eUnft70pUfvBtgTcxWx5YPJanuzSuIIJzHNbk6qKodgsqebU8bjRxRGjvlmKKv
         VFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844218; x=1779449018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KJAZYj78iKXwM75l/HDp+1jydtLEC0dNPj7aNSYgj0o=;
        b=f3s+4Dceg2AboypPEdX7Dee9V0n4vQ48p5w+npq1jyumZBUCEKMfkFtXWCWwhNc1bz
         YDdRn0d4HaYS29C0PkNXKPqSYkq9siaz8N4XTcCFWHWn+XZy4nHRGT30EZlQnK9rKUCq
         8991UPyEOQW4nRdOLeazByW4pn0o2XhT9H4IF5H9wBcvhGOGP3V8+woB6h4/JIZfDCqT
         cWcKWQ9hAZylTx7BuuRSp3BxCJ1S4dMjnCfdG2D6ah2fIdWYNpPRBiOLjB/WeLC78QdO
         siXVm1kg02KF0U1FR/cCsw0l7AsceldHe96Ev1nffCSLqxDXYRyM7Z++xlhn7XB9n0hE
         c7mg==
X-Forwarded-Encrypted: i=1; AFNElJ9ZnnpLQ9cwMaqsaO4nGXSE4KvHCQ9rSZcR5orkVDhS3aZ64iCH4XOMm4nTCr0BvNntg5Aosn32o89ufg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySyuuf/hDwcI+HeaDGp5a48DASKv7HGlTTh2wuXbj9tyaeEF5g
	PaAXbbwQeOmHCXPQooYNOxXXFvBj0tln+ExZGjGJdTumuIjy6CphWXDJmUjS/FHdf1GIGbQuBdP
	IKo/wvNsDq8edxZcHxnefjooMiIGqtKcQb5EIXk5hLM49265u3eGwpUcX+STspAAb53d2KLoA9w
	==
X-Gm-Gg: Acq92OE+ZFRs5e6lu4LK4BCrcm90lSGwGR7MGvqxYFWDwevDNbZaULLcSeFS/4qIp7D
	aGmQBnem+m1pwRmnlRFvFTdzSI0WXFPr7EnLYhYbmhf7P5Jf92zzveWCvXZuVz1PSL+4LOQwfbp
	FUrSJzB1sBXwbXqAMxkQv7rgeVEreBRwk+zpiwh63ECxciiIcF8TshzRteGYULOfV1NCjy4CJOX
	P0RJBC9gQGfpqZGFkTEkElV0oNP9X2x5D34/6Vwdi0IPDs0eXXnJ6Or/dgvqwO1kNDBso7vxXYh
	zT8bJ0P2fw9hU51XUSFIwAZ8//meCvYosVGemJu9NfRG5yys/Qd0v4VwhbEWsxRIGpcKWnOG06r
	XC1f1m3lA7fyX5Nf+BiLrsBEc0bLxcdlb2M++q+Y+paK4iUE4TQgUvHc=
X-Received: by 2002:a17:90b:5290:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-369519ffc97mr3758473a91.9.1778844218283;
        Fri, 15 May 2026 04:23:38 -0700 (PDT)
X-Received: by 2002:a17:90b:5290:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-369519ffc97mr3758423a91.9.1778844217830;
        Fri, 15 May 2026 04:23:37 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:23:37 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:17 +0530
Subject: [PATCH v6 02/14] iommu: Add iris-vpu-bus to iommu_buses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-2-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=1090;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=nwLCkv3OjAFGS6jwKQhLZrEXe26RmaJcgKrBgwUePzE=;
 b=7o6m1C3GzJF7wYxJqXejGuZGgG9YRn2+c6vLHEyNya/et9avgtj9sj4z21cH9Kwy0U+ClNAwo
 nWMlX1NqLtBBKhO+bHZJ27Ti0SI3s3mRZ7sHQBp2smRB9uo90nuNlRu
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a07023b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZGoT60Gb6PEvP4nDRaMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: bDwMrF3BX4jikr4ND7r3x-UPhO_x1ZTe
X-Proofpoint-ORIG-GUID: bDwMrF3BX4jikr4ND7r3x-UPhO_x1ZTe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX4BcQM/pfOCl2
 ViEKUdKolFMFy4oBDENVw66j8h7TDF6Fy6tcr7YWKgr/iwpCjWxVjY0HewwtTd3Y9xaqJjdbqtu
 wp35tHZQMJKTjoQmCzVaEyoqNqhkob68TzU+tfjyjhwwbnNP08CdT5vI8RLyId1FejGCBWIm0sm
 aS3TJtWQ8V9+WinNXlJnDzdoweOg7wA8cZInyV8vVlf2vIvYuDbwpYHJfQznzLdS/zfXhdhp4My
 O+aLk826/fEpVb4KzU4CWMgVv0LXKUly4AVz8IWOsUraM7WNBUF/jgADtWU3z0tZ2K1WlzXcFto
 OGA9Bh3MReH50kI+Y+DLoU0/0q3jJAIDL+VLdrNjeQsRwvF+MaOoFrh+DSwsLsWfu1LMcxF46mZ
 ZUchN3EhV6qC9kNFf4V0279qBLS/VeeejTFrHXHsHfnvgmrEXi6VzVdQNDRxGBdkN9E++ugLeq/
 MtC0DLaBWSlC9FcDeYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115
X-Rspamd-Queue-Id: 1F23154ED0F
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
	TAGGED_FROM(0.00)[bounces-61670-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add iris_vpu_bus_type to the iommu_buses array in the core IOMMU
subsystem so that the bus notifier callbacks are registered for
device addition and removal events.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 61c12ba78206..d2c67f0de13a 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -13,6 +13,7 @@
 #include <linux/bug.h>
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
@@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#ifdef CONFIG_QCOM_IRIS_VPU_BUS
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*

-- 
2.34.1


