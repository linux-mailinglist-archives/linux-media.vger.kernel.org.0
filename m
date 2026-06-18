Return-Path: <linux-media+bounces-65167-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NN03D8rKM2ptGQYAu9opvQ
	(envelope-from <linux-media+bounces-65167-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:39:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C369F67A
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:39:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o00SfINi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Yb9Ny6Js;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65167-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65167-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E03723053C2D
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 10:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06BE3783BB;
	Thu, 18 Jun 2026 10:38:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE253BBA1E
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:38:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779109; cv=none; b=KqUccMeyKyQmSrR3e27ufu1zWuwBkCDiEAP6HSYy004XQleGYR30wX5MuC0KFlBfvvmsYLo16n7RvnshlWvLGWCbpl8vmmpP5iTMlYVQfvj/pKwszGiAFh68tMMlw5jNYSHOfwDO0SlJkTZR7hMrMSi7gT0YFecfLJ/mLlKiSwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779109; c=relaxed/simple;
	bh=Rnjh2toTEuLh3Bv3Ch7kHxW+H+n/XiBjaJXvAhL1PY4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rnHEDeMEPOSSmp5gV3jfqYqWjduw2pXEkXoZMup3fDPQEaWvZ+0gbZKTjCTGGZpO6yG6SrUoUGmvFH+ONOv0p0AyIMRiALWsLiZ/Z4APOeKFzBzDJyF5gfr7P6RRpS2Facz+2PcdYOL/EMlEgrEG0c6BCVki/x5tK0v7wNlKvhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o00SfINi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yb9Ny6Js; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8Dskx2246934
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MlFgf2VUgcY3rqZBnlNXeS
	a9Ko1kPb4FJhDkZqbSpnw=; b=o00SfINi466YtQiGNhiCIZ8h2OkF2WFjxkYsv4
	JaQMQfmKXrFMKh79l4klpK5o9MNzSUtpULT7YLPQ1esLMoAKXK7fbH5s/nqWJWqj
	Y3qKCi4OPNEX9RsfV7a5dgQsR/eWJdcGo60NieN1OxDakuR15LGLFmL1btsNoqa3
	63hIvdi6eahhqs31xgc6noOgZb1Zq1bz1aOKc9zut/AWrZ41MHWzRie7nCkr2Krk
	+yQqXiuhldDemS2moTFe+6+Iab7ya8nMNroXItL+w9HVLqS+hlW9o0rmt6I1EbdI
	pmi0qF5rKBQcNMsNt85cC+Ff4ATcZ8YcJilhw75CSv3gsCdA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vmg92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:38:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9156cb14b1cso137815185a.1
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 03:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781779106; x=1782383906; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MlFgf2VUgcY3rqZBnlNXeSa9Ko1kPb4FJhDkZqbSpnw=;
        b=Yb9Ny6Js5algtCF7kDCtundutlpPLZa5qIvL12XIS0FVas6QnGGvXCkQrY7xKKVJi9
         9VTrpn0HKx7L20WvZDZ7ZNnzyJzbjUNXP8JOxznBblUrVql50COCnbM50ovex/i1NGVv
         hv+GdFc171KQ4S6zgWXoCgKRUWWGLrfuNhk9YxHXPB1HJZZE3xa0MvyzM/Pf4RTtrgNz
         AwjsX8pBqqZuamPKxxTau8t64Xxrd/IdPQdk03M0eO3P14efCkN3opCKYpPCdfQgoR35
         6Y3xO2g2NSG/GcRrmtXCF6EDy5bLIArwwTFT1V/PefeqHL4e5H/vYGDvmiF4fU5NcgEw
         DVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779106; x=1782383906;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlFgf2VUgcY3rqZBnlNXeSa9Ko1kPb4FJhDkZqbSpnw=;
        b=sPIrH8nua0wJbrKYejD++9DqptYnWYln/GnnxdJ9NXrCl7BQL3TcS07kctuO3vAJah
         1tCd+CSRaY18Q7m+HwtjW+3/mN7PskNsvhlcrLjykIXCRur02nuMcaCxB21s4lxqXUmp
         /K3oMPtzayG+ZttXx9fNKz7oNGoV1DLQ8O6u1GsRJOa+eCxth4YcZrBf0I6Peu1wsd9W
         ctgill08CBpB8c1prbAPMGheMSB0nEOmeWaIc95E1yUhyECds3PHaxY5L+hhQ8FUapac
         gjsZoCzsgfrpfMCttU7W5OtMDiklbtOIqTWjaKhrVLZxBa/Krw1Ixn9Hi7M1ynif76+g
         +fVw==
X-Gm-Message-State: AOJu0YzeIJRVQ4Z/wnEiWc49zTzJUW3ThPNu98Jvfty7ZkBpW0Mqui7Q
	3j+jjRmHgCX9ft3TkDht8kHen0TykbP0rqS4yIEc6IFbtCTlJ2nXU9ikip4YiAKR7Dbms5NQ5qD
	G7vQduzrGHhvi4/OGaA5j+Jr6/2Yf1zH1wmRWbliqzu2CW9WI66gRAdrE9UY3GDpJRK5pyMBQbl
	s+
X-Gm-Gg: Acq92OEJtNClwDO+z6dvp/DRYOPISD/8LVYWT5x29gSVtbjql+OiD/v3GWfeftDkZ0m
	L98ThpGe9JqSc6XUvBqwo+DA8Hf38uEU2D7/VFktJiVbuH6ByTbAHTUgkub2oshv1Q0YYaWke0v
	vNrtmpr3Y7upyY76cEDXGkY1JlxGruaF0aMVneNJAt1RkwqTi8+BWL+JbXFd2LS2Fijp70iwL6P
	MBDm+iydHBjAKwZHywWOZ28tVKXI9Ow/mp5WZDGcadeUIT6LEpNQG0MdZaJX+/bpsKmRekbwTep
	WDCO70zmW5ps+fbNFNOO80SuNkpvWc1u2PMHUhS4hzequ03fIiqQRmXihKCuiR4U8VN7MbyVVUC
	Exisfn/ClcaFb0mPTpBy+1RX33iWqKkLpqK3UyhX7v7xMg0/vf5oBqgNf1IirIkA9jddjAulH6q
	7q2bI=
X-Received: by 2002:a05:620a:28ca:b0:912:1:b415 with SMTP id af79cd13be357-91f282a5fdamr455636285a.26.1781779106317;
        Thu, 18 Jun 2026 03:38:26 -0700 (PDT)
X-Received: by 2002:a05:620a:28ca:b0:912:1:b415 with SMTP id af79cd13be357-91f282a5fdamr455632885a.26.1781779105865;
        Thu, 18 Jun 2026 03:38:25 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a04b472sm2029316185a.37.2026.06.18.03.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:38:25 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH 0/2] media: i2c: Add OmniVision OG0VA1B camera sensor
 driver
Date: Thu, 18 Jun 2026 18:37:42 +0800
Message-Id: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHbKM2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0ML3fx0g7JEwyRdU9OkpDTj5MSkJINUJaDqgqLUtMwKsEnRsbW1ANL
 atodZAAAA
X-Change-ID: 20260618-og0va1b-55bbf3cabb0e
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781779102; l=1057;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=Rnjh2toTEuLh3Bv3Ch7kHxW+H+n/XiBjaJXvAhL1PY4=;
 b=s0H63bG+QSu683GNKV14NJU8bBVH+TUUZBaseFtkQ6gUEXOWPLMnscn4GycOseCD+IjIiEEcs
 +NI9inDYCawD4gdPkKRFFMbkwY3FDjr2It66EwAxCMiePUlGOnZxoAV
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: 7hUH7Ay4zf_MIMFp2V2JAvU7RO7d7d68
X-Proofpoint-GUID: 7hUH7Ay4zf_MIMFp2V2JAvU7RO7d7d68
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfXzHVL3bFV+O3/
 PNq8HdyuGmhUmDnDlU5myNbpPEAXKNNZwgIGPzERj/iYIJV8CaUNSomnfFs4TMcsUSq0IMjmuEk
 yteTmkSOGbu2ikTh+nrgpTw2o/RhVqApZO8e6gsg2od1snOPjEX/DnbpZEnQEB3myCYePKW414O
 mzt677SvBUcEPkOT2T6qquw8ZZUcU6sIEpS+qStVMgPltirwacCsPltrudgZFDySn8unEEsD+ww
 J5AUrp0dTsAKaDGhEK8/a7xA5r41UOAscSrsIA8sDqbo41FlJAw8+vwq905IqfVOD24gKBInEs2
 nq6qZjOX6QIgbtBEcUc5jyivbNpD7W9kJ50Oig8iEm6R9/jOQKBpsoIbfpmB0zfh/7Ac5RwuKit
 LvlO/Q5HC3TNgji69eOytOnwuqQGDjIxll+E7eVnGBPNa5p28oZ3i7XEdv2oKKJVeGY9NmfEt1i
 WKJ5dSpIjewzWPYObBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX7OZptacBpaId
 4rTj3WiiwZg0LzUM51P9b5u2lDgA8E7DEch5wkUd+Kn+G3TKSf9movSLHmYKRexeYCf3JY3pAn1
 P3bU1NZyVrwyXhoHDGPFs5MnWKynygw=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a33caa3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4V15NcdV0gEvtUevzWYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65167-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wenmeng.liu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D49C369F67A

Add OmniVision OG0VA1B driver support. The OmniVision OG0VA1B is a
1/10-inch monochrome CMOS VGA image sensor. It outputs 10-bit raw (Y10)
frames at up to 640x480 resolution over a single-lane MIPI CSI-2
interface and is controlled via an I2C-compatible SCCB bus.

This driver has been verified on the Purwa EVK.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Wenmeng Liu (2):
      dt-bindings: media: i2c: Add OmniVision OG0VA1B
      media: i2c: og0va1b: Add OmniVision OG0VA1B camera sensor

 .../bindings/media/i2c/ovti,og0va1b.yaml           | 104 +++
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |  10 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/og0va1b.c                        | 867 +++++++++++++++++++++
 5 files changed, 989 insertions(+)
---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260618-og0va1b-55bbf3cabb0e

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


