Return-Path: <linux-media+bounces-38963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB9FB1C56A
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 13:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0D1818A7CF5
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 11:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CE728A72D;
	Wed,  6 Aug 2025 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z3OEHhFl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF461E520F;
	Wed,  6 Aug 2025 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754481104; cv=none; b=U/JIEbAner64ZDCQFV2W2Yy+vhnetBCnJVVUPhmbRzhrTq7qnL5j/6EnCjINt0xKZUMWuyskDUXXtbctqBBuuwqTne8B81tkYTUYx1LhQo/dWPQz6LmJSPGvIpkusIDAX7rc3iNggT2vt/NZCBU82pkqDkSI3ABq6ftIgmeVQjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754481104; c=relaxed/simple;
	bh=axg8GVU+sQgT6RpBYpnPWl7+5BXIHmtnLpUwPFBT2VY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IQfc61zLhWMIPM+c58SOWZ/fsDZvGkHUI4LxE/uk0I3DxeHHtUUITiUQ3ZBlJWT8e7UgPgKsxCUug7B3ZHf5+jn2ckwKybbM7S/t5uPTkbPdYrDYZHB1ScCH+vJywS1OYzqoeCVMPqgWphEzCO9tKbAEmt42+ZMXQ9hQcqFnWaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z3OEHhFl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766LUZ9010375;
	Wed, 6 Aug 2025 11:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PWJMON5MyDD8wzJM9aPsC2
	YSHNjHQv1YLu+W8TKA8Nw=; b=Z3OEHhFlzD4VLjMLbKqIiWRNiXytT0gpgdCOxE
	5eT30UWrPWkucYkbiMlzVjIPKCugq+97llzomCsAkpm8WFo0TfltGt9cLKZ6PwYn
	g2dCsA6PUhEg+UrRQTL5udggDTeCobmGb4/TZuSatfzbQuyAedZZFPW2KRZaM2SN
	sbOb/BPipWinyfvz6tqTKaeapBFxg4qwHS2f2ChVOqZy7LVhWtH8JtadnTV3Hy6Y
	H+/dj2DBlrZSXT79T2+SagSH6/k116KNu3xc5cNELpIFWrad252bS8biXiwZjpEw
	zE5PvRemiCGry4MqA5c+yU8PJDvyiC9oFKjLyaZhm9OjCAEw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy7tk4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 11:51:34 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 576BpXsM021549
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Aug 2025 11:51:33 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 6 Aug 2025 04:51:30 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <thierry.escande@linaro.org>,
        <quic_vgattupa@quicinc.com>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, Ling Xu <quic_lxu5@quicinc.com>
Subject: [PATCH v2 0/4] Add missing fixes to FastRPC driver
Date: Wed, 6 Aug 2025 17:21:10 +0530
Message-ID: <20250806115114.688814-1-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Mftsu4/f c=1 sm=1 tr=0 ts=689341c6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=YlbaB52rY0KjSQttpCIA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bcAMjXkqaeldELEsnnqkRXvN0K06xY-P
X-Proofpoint-GUID: bcAMjXkqaeldELEsnnqkRXvN0K06xY-P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX+AsFboWaDlW1
 CYgUvJbW8x2l2nAF8LDh6eCd9UpYyiahzON7lyYVSmkEpQyroC6WhjMsVJyeIh2kB4yfB5twA+b
 KY8AHZT/VzeoEwi/47Dk/POo0PvHYelT+ZLF+coD2x0LKfMp0UMDjLNl1BKg5mUid6/xorpn1T5
 tIAeokaxdeUvlnmQlwhUji1pPFrl4ytHXPSiWc3m2CUesgKMPgS15vqkP4xJVAnsx0Rl9+f+uFr
 V7rNL5bj6RuLXKCPccYIpQfW6FLFi/44iXeXkTrSBhRdl+vMkHLtwmQaBoYhXShnI2M5GcHFplr
 gdh31FIGanUivMlJXM87/RGLC1oYqrq1VcrEyTiAw3IWH2S9yHLJm7zmeWeNv2bVr2iOm4+hjh9
 jGnJSYOF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

This patch series adds the listed bug fixes that have been missing
in upstream fastRPC driver.
- Store actual size of map and check it against the user passed size.
- Consider map buf for map lookup.
- Fix possible map leak in fastrpc_put_args.
- Skip refcount increment for DMA handles.
Patch [v1]: https://lore.kernel.org/all/20240822105933.2644945-1-quic_ekangupt@quicinc.com/

Changes in v2:
  - Fix possible map leak in fastrpc_put_args.
  - Remove take_ref argument.

Ling Xu (4):
  misc: fastrpc: Save actual DMA size in fastrpc_map structure
  misc: fastrpc: Fix fastrpc_map_lookup operation
  misc: fastrpc: fix possible map leak in fastrpc_put_args
  misc: fastrpc: Skip reference for DMA handles

 drivers/misc/fastrpc.c | 88 ++++++++++++++++++++++++++++--------------
 1 file changed, 58 insertions(+), 30 deletions(-)

-- 
2.34.1


