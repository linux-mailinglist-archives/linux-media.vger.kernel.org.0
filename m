Return-Path: <linux-media+bounces-11745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7A68CC479
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 17:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61FBCB23A60
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 15:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991DA146A88;
	Wed, 22 May 2024 15:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kzwpwjtS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680C9146A8B;
	Wed, 22 May 2024 15:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716392890; cv=none; b=jtdFxzk90kgp/YZXQsbHq8gu9wOBWI93W7t8p2eO8qCDF3ytNvTEpAm/YTjexFGaGR/VzMNeLQhr5zdIF895t9y5w6tfchgtSdGu0hPGPZjT37sPR1o/l4pFb6t+w61neBAkisjEl6rA1Ip8NddIZQoDAvPoZEL50VJxVFHkgHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716392890; c=relaxed/simple;
	bh=70/isqrjBsENWifHIlq9w8VB7HnrhcF9UHZyo0v58fk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p+ZNFup+HAnhxYNuz3pmrjKwuO3LbZDFfcT1tzFXRTuWrFtZhV04PYzYgO9D1djC4Tv25pfF69a9mN2DNXIWZauwICGaUPBCzum7iyLkv9p4LCdjDBqO8dh+n+74osyQPcMU5XYxTyAXJBI4VFRtCaWoozTsj2u8Sh/cN9FhXN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kzwpwjtS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44M8t8Xv002440;
	Wed, 22 May 2024 15:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=Q1H5XskAcVk/gbacI3/dmn9csnGbbSYR9/5IRjHaEug=; b=kz
	wpwjtS1/XDi+TmgAITyimZR4Aza/YMCjhP5yZexE5paRKNnFBjyb/QMq49Syd5Hh
	2xTUN0YYfPJr3iahQcCTFdbvc0xF+vJMafEmE7VLCQc98mbkrKamYgwZFiOx82ae
	fjEtHLBI6+rNjNR3gGBoG9uiq3i7BMfupYFrlqDyg4NWF2n/NUR4Owa4SD8+AaoL
	YTfDpJFsQ3l/zqEp/G0Ntq9WdQSBfiFYdbEwsdxE3y593DPCq2irijz/Jvp5yOMH
	DEiL6utfh0X5wZCkl8y0DQRgBKuheQN4BjE6/7FQ2LAdjqsikGZ9L2L3Bhr9u9Xz
	VHr+ncvx0doHQWLialnA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqc94hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 15:47:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MFlt1D000798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 15:47:55 GMT
Received: from grosikop.eu.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 May 2024 08:47:52 -0700
From: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <hverkuil-cisco@xs4all.nl>, <quic_hariramp@quicinc.com>
Subject: [PATCH v4 8/8] media: qcom: camss: Decouple VFE from CSID
Date: Wed, 22 May 2024 18:46:59 +0300
Message-ID: <20240522154659.510-9-quic_grosikop@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522154659.510-1-quic_grosikop@quicinc.com>
References: <20240522154659.510-1-quic_grosikop@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gTTCPFckBXGfcSYjB4v1xA7gRZHIB3uF
X-Proofpoint-GUID: gTTCPFckBXGfcSYjB4v1xA7gRZHIB3uF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_08,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220107

From: Milen Mitkov <quic_mmitkov@quicinc.com>

Decouple the direct calls to VFE's vfe_get/put in the CSID subdev
in order to prepare for the introduction of IFE subdev.

Also decouple CSID base address from VFE since on the Titan platform
CSID register base address resides within VFE's base address.

Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sc8280xp/sm8250/sdm845/apq8016
---
 .../media/platform/qcom/camss/camss-csid.c    | 16 +++--
 .../media/platform/qcom/camss/camss-csid.h    |  1 +
 drivers/media/platform/qcom/camss/camss.c     | 69 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |  8 +++
 4 files changed, 89 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 5b23f5b8746d..858db5d4ca75 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -602,7 +602,6 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	struct csid_device *csid = v4l2_get_subdevdata(sd);
 	struct camss *camss = csid->camss;
 	struct device *dev = camss->dev;
-	struct vfe_device *vfe = &camss->vfe[csid->id];
 	int ret = 0;
 
 	if (on) {
@@ -611,7 +610,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		 * switching on the CSID. Do so unconditionally, as there is no
 		 * drawback in following the same powering order on older SoCs.
 		 */
-		ret = vfe_get(vfe);
+		ret = csid->res->parent_dev_ops->get(camss, csid->id);
 		if (ret < 0)
 			return ret;
 
@@ -663,7 +662,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		regulator_bulk_disable(csid->num_supplies,
 				       csid->supplies);
 		pm_runtime_put_sync(dev);
-		vfe_put(vfe);
+		csid->res->parent_dev_ops->put(camss, csid->id);
 	}
 
 	return ret;
@@ -1021,6 +1020,11 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 	csid->id = id;
 	csid->res = &res->csid;
 
+	if (dev_WARN_ONCE(dev, !csid->res->parent_dev_ops,
+			  "Error: CSID depends on VFE/IFE device ops!\n")) {
+		return -EINVAL;
+	}
+
 	csid->res->hw_ops->subdev_init(csid);
 
 	/* Memory */
@@ -1031,9 +1035,11 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 		 * VFE to be initialized before CSID
 		 */
 		if (id >= 2) /* VFE/CSID lite */
-			csid->base = camss->vfe[id].base + VFE_480_LITE_CSID_OFFSET;
+			csid->base = csid->res->parent_dev_ops->get_base_address(camss, id)
+				+ VFE_480_LITE_CSID_OFFSET;
 		else
-			csid->base = camss->vfe[id].base + VFE_480_CSID_OFFSET;
+			csid->base = csid->res->parent_dev_ops->get_base_address(camss, id)
+				 + VFE_480_CSID_OFFSET;
 	} else {
 		csid->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
 		if (IS_ERR(csid->base))
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 0e385d17c250..8cdae98e4dca 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -157,6 +157,7 @@ struct csid_hw_ops {
 struct csid_subdev_resources {
 	bool is_lite;
 	const struct csid_hw_ops *hw_ops;
+	const struct parent_dev_ops *parent_dev_ops;
 	const struct csid_formats *formats;
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 8a3968d1cd83..1f1f44f6fbb2 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -32,6 +32,8 @@
 #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
 #define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
 
+static const struct parent_dev_ops vfe_parent_dev_ops;
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -84,6 +86,7 @@ static const struct camss_subdev_resources csid_res_8x16[] = {
 		.interrupt = { "csid0" },
 		.csid = {
 			.hw_ops = &csid_ops_4_1,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_1
 		}
 	},
@@ -105,6 +108,7 @@ static const struct camss_subdev_resources csid_res_8x16[] = {
 		.interrupt = { "csid1" },
 		.csid = {
 			.hw_ops = &csid_ops_4_1,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_1
 		}
 	},
@@ -216,6 +220,7 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 		.interrupt = { "csid0" },
 		.csid = {
 			.hw_ops = &csid_ops_4_7,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
 		}
 	},
@@ -237,6 +242,7 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 		.interrupt = { "csid1" },
 		.csid = {
 			.hw_ops = &csid_ops_4_7,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
 		}
 	},
@@ -258,6 +264,7 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 		.interrupt = { "csid2" },
 		.csid = {
 			.hw_ops = &csid_ops_4_7,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
 		}
 	},
@@ -279,6 +286,7 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 		.interrupt = { "csid3" },
 		.csid = {
 			.hw_ops = &csid_ops_4_7,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
 		}
 	}
@@ -425,6 +433,7 @@ static const struct camss_subdev_resources csid_res_660[] = {
 		.interrupt = { "csid0" },
 		.csid = {
 			.hw_ops = &csid_ops_4_7,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
 		}
 	},
@@ -449,6 +458,7 @@ static const struct camss_subdev_resources csid_res_660[] = {
 		.interrupt = { "csid1" },
 		.csid = {
 			.hw_ops = &csid_ops_4_7,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
 		}
 	},
@@ -473,6 +483,7 @@ static const struct camss_subdev_resources csid_res_660[] = {
 		.interrupt = { "csid2" },
 		.csid = {
 			.hw_ops = &csid_ops_4_7,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
 		}
 	},
@@ -497,6 +508,7 @@ static const struct camss_subdev_resources csid_res_660[] = {
 		.interrupt = { "csid3" },
 		.csid = {
 			.hw_ops = &csid_ops_4_7,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
 		}
 	}
@@ -683,6 +695,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.interrupt = { "csid0" },
 		.csid = {
 			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
 		}
 	},
@@ -707,6 +720,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.interrupt = { "csid1" },
 		.csid = {
 			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
 		}
 	},
@@ -732,6 +746,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.csid = {
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
 		}
 	}
@@ -914,6 +929,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid0" },
 		.csid = {
 			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
 		}
 	},
@@ -930,6 +946,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid1" },
 		.csid = {
 			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
 		}
 	},
@@ -946,6 +963,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.csid = {
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
 		}
 	},
@@ -962,6 +980,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.csid = {
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
 		}
 	}
@@ -1161,6 +1180,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.interrupt = { "csid0" },
 		.csid = {
 			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
 		}
 	},
@@ -1176,6 +1196,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.interrupt = { "csid1" },
 		.csid = {
 			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
 		}
 	},
@@ -1191,6 +1212,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.interrupt = { "csid2" },
 		.csid = {
 			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
 		}
 	},
@@ -1206,6 +1228,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.interrupt = { "csid3" },
 		.csid = {
 			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
 		}
 	},
@@ -1221,6 +1244,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.csid = {
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
 		}
 	},
@@ -1236,6 +1260,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.csid = {
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
 		}
 	},
@@ -1251,6 +1276,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.csid = {
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
 		}
 	},
@@ -1266,6 +1292,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.csid = {
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
 		}
 	}
@@ -1610,6 +1637,48 @@ void camss_pm_domain_off(struct camss *camss, int id)
 	}
 }
 
+static int vfe_parent_dev_ops_get(struct camss *camss, int id)
+{
+	int ret = -EINVAL;
+
+	if (id < camss->res->vfe_num) {
+		struct vfe_device *vfe = &camss->vfe[id];
+
+		ret = vfe_get(vfe);
+	}
+
+	return ret;
+}
+
+static int vfe_parent_dev_ops_put(struct camss *camss, int id)
+{
+	if (id < camss->res->vfe_num) {
+		struct vfe_device *vfe = &camss->vfe[id];
+
+		vfe_put(vfe);
+	}
+
+	return 0;
+}
+
+static void __iomem
+*vfe_parent_dev_ops_get_base_address(struct camss *camss, int id)
+{
+	if (id < camss->res->vfe_num) {
+		struct vfe_device *vfe = &camss->vfe[id];
+
+		return vfe->base;
+	}
+
+	return NULL;
+}
+
+static const struct parent_dev_ops vfe_parent_dev_ops = {
+	.get = vfe_parent_dev_ops_get,
+	.put = vfe_parent_dev_ops_put,
+	.get_base_address = vfe_parent_dev_ops_get_base_address
+};
+
 /*
  * camss_of_parse_endpoint_node - Parse port endpoint node
  * @dev: Device
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 588a52eb2d43..73c47c07fc30 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -135,6 +135,12 @@ struct camss_clock {
 	u32 nfreqs;
 };
 
+struct parent_dev_ops {
+	int (*get)(struct camss *camss, int id);
+	int (*put)(struct camss *camss, int id);
+	void __iomem *(*get_base_address)(struct camss *camss, int id);
+};
+
 void camss_add_clock_margin(u64 *rate);
 int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 			struct device *dev);
@@ -145,6 +151,8 @@ s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
 int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
 int camss_pm_domain_on(struct camss *camss, int id);
 void camss_pm_domain_off(struct camss *camss, int id);
+int camss_vfe_get(struct camss *camss, int id);
+void camss_vfe_put(struct camss *camss, int id);
 void camss_delete(struct camss *camss);
 
 #endif /* QC_MSM_CAMSS_H */
-- 
2.17.1


