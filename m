Return-Path: <linux-media+bounces-43298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5131BA7524
	for <lists+linux-media@lfdr.de>; Sun, 28 Sep 2025 19:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 619F53B7FF2
	for <lists+linux-media@lfdr.de>; Sun, 28 Sep 2025 17:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C22E21B185;
	Sun, 28 Sep 2025 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EWmN8MXQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199D51E1E19;
	Sun, 28 Sep 2025 17:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759079864; cv=none; b=nx663w/pFkwMJLtuxZzcHYxiNofWiaL6gQuESIlzjZFMadduExJg0rcf08mShaGpmyZsTNoPK20dLwGZtwHZjh6YYLZpXwDmcHjPAmzNDU73+4YfYuo2OYtUoCIucAqtyMvqnss0OCbBC92wlz7zm1JRW/A4hLB8IlMlXofv3ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759079864; c=relaxed/simple;
	bh=mfsuLDXo3AMk+dQskagp6VBHkOK/uarcO+agLmlOZU4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GRS6cwCmBsvprtEkraSvC4TUx8Y5UQsvoxLV+Ow1ywPGaY4V51RYj5gARXf441pkDRi3WWTJkfb6YhTaMSWSLL3cWsUI+HdLzo+JM98mauUnRK+QNvjOUauE4fLkWjfr6tPcdDVQVf64febTcqnDIBNvf/8JofVkdHS1idBImHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EWmN8MXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SEc1Xr028178;
	Sun, 28 Sep 2025 17:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mu19hy+Cq2LYY2B/KNvOPCMGCiPAry45bWG
	zQlTjlF0=; b=EWmN8MXQopo4mm+LLmuUre63X8yZBorlYNTdGSls67Ilc4d9KXb
	QcJsRukUHYbi5BUEGh5hdDccEQwTam6kiNV2JdJsx/rZMnWJlXXxCZbuQnsw6GZa
	hwEGKOLKmkx1WoflYDtZkLC/lElVXLS8Y78Np2Q+jf5SoUQGEh9ZO4pKCOBf8h9f
	AZnxGOuImdgryS8m5xgomleWXGdEqG8IiPputotzvyuqGjnvNQR2zPNRep4Dj1BV
	C+it4mwwYzaL+LGoKE5uMCdJc7xj/oDiCqXonyubtmneRICpDg5yWPJraotFN3Uv
	WUXXF2PgPOiPgJdGrtIAud9slsGAOM7OEdA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59muby1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Sep 2025 17:17:26 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58SHHMIC018672;
	Sun, 28 Sep 2025 17:17:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 49e90k74pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Sep 2025 17:17:22 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58SHHMXF018651;
	Sun, 28 Sep 2025 17:17:22 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-charante-hyd.qualcomm.com [10.213.97.134])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 58SHHM2b018649
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Sep 2025 17:17:22 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 389980)
	id 316715C8; Sun, 28 Sep 2025 22:47:21 +0530 (+0530)
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
To: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
        saravanak@google.com, conor+dt@kernel.org, robh@kernel.org,
        mchehab@kernel.org, bod@kernel.org, krzk+dt@kernel.org,
        abhinav.kumar@linux.dev, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
Date: Sun, 28 Sep 2025 22:47:15 +0530
Message-Id: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tWQD4WF2PEK1aphGceNujNM4d5tL3yGj
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68d96da6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=eXcPPdEb-0Tx6XvSbZUA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: tWQD4WF2PEK1aphGceNujNM4d5tL3yGj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX4gNcW0AGStRF
 katoCjyaggoknCnPz+d8CJMWDLDpeRWMfzns0Xym7x6Qe22nO6iVjJDn8mm0LXVL5Z9TU8/jcph
 CtanbBw72gjNkwCnBWMagK9VLrTNYHkhhsYWyA6oROU3wfDB3yha5MEsPlAIg78FdgKKwZUVvGG
 uI1Xx7BigoeU7dZhjx5j6LEi5GGTPJiXYf+VW6938l4HIkgh7WhBgQS6k2YFvFqwWIqujpd+/pl
 8j8HRd3CsgFcC2Pr/A835w5tj9Ilz9EF0AOaPquS9OpYZS5c6jUJipQLje0/gb7l/TVwcHKmaH0
 coAm2jtTjVTQKsckT8p51h0jKGj8frr6igSTKFFKqJ5dU1nnJQhOJl1OkeQ2cGXwVdCuXA5Wxew
 B6/Xh6j+D+m/ebPBhfXYxa6d4opisA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_07,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

This series introduces a new iommu property called iommu-map-masked(may
be there is a better name), which is used to represent the IOMMU
specifier pairs for each function of a __multi-functional platform
device__, where each function can emit unique master id(s) that can be
associated with individual translation context.

Currently, the iommu configuration - at least for arm architecture-
requires all the functions of a platform device will be represented
under single dt node thus endup in using only a single translation
context.

A simple solution to associate individual translation context for each
function of a device can be through creating per function child nodes in
the device tree, but dt is only to just represent the soc layout to
linux kernel.

Supporting such cases requires a new iommu property called,
iommu-map-masked(taking cue from iommu-map for pci devices) and syntax
is:
   iommu-map-masked = <FUNCTION_ID1 &iommu ID1 MASK1>,
		      <FUNCTION_ID2 &iommu ID2 MASK2>;
NOTE: As an RFC, it is considered that this property always expects 4
cells.

During the probe phase of the driver for a multi-functional device
behind an IOMMU, a child device is instantiated for each FUNCTION_ID.
The call to of_dma_configure_id() on each child sets up the IOMMU
configuration, ensuring that each function of the device is associated
with a distinct translation context.

This property can also be used in association with 'iommus=' when dt
bindings requires the presence of 'iommus=', example[2]. For these
cases, representation will be(on arm64):
   iommus = <&iommu sid mask>; //for default function.
   iommu-map-masked = <FUNCTION_ID &iommu sid mask>;//additional
function.

USECASE [1]:
-----------
Video IP, 32bit, have 2 hardware sub blocks(or can be called as
functions) called as pixel and nonpixel blocks, that does decode and
encode of the video stream. These sub blocks are __configured__ to
generate different stream IDs.

With the classical approach of representing all sids with iommus= end up
in using a single translation context limited to the 4GB. There are
video usecases which needs larger IOVA space, like higher concurrent
video sessions(eg: 32 session and 192MB per session) where 4GB of IOVA
is not sufficient.

For this case, it can be considered as iommus= property can be
associated with pixel functionality and iommu-map-masked= is with
non-pixel or viceversa.

[1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/

Charan Teja Kalla (3):
  dtbindings: add binding for iommu-map-masked property
  of: create a wrapper for of_map_id()
  of: implment the 'iommu-map-masked' to represent multi-functional
    devices

 .../bindings/media/qcom,sm8550-iris.yaml      | 31 ++++++++++-
 drivers/iommu/of_iommu.c                      | 44 +++++++++++++++
 drivers/of/base.c                             | 55 ++++++++++++++++---
 include/linux/of.h                            | 15 +++++
 4 files changed, 133 insertions(+), 12 deletions(-)

-- 
2.34.1


