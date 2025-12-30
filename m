Return-Path: <linux-media+bounces-49756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEFCCEA430
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A76C730213C1
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF6532C933;
	Tue, 30 Dec 2025 17:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbQDM4iG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QKsSEHZR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71813319617
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114211; cv=none; b=MWCZdc/taIci2l+kh9EWbP8a93zMzqwkK7jr4962ToMcd6rWiWEfBP1KzUCjqIopANWto4/YIl/pf/mz1Sw9mEuv1JYs8+hEzIBvaqOecvfCD//yIAuk3uWOKryI7iMSOWRI9ePV5wTxXxxmctvehuwpSh9d+mMSJIO3RRhz8I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114211; c=relaxed/simple;
	bh=VA0nUzj3f4RFSQ22T1Jzu/K6QAu2QU6LIG4Gj9MryQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TzaRwwlmuCFV/oGaGF8ujOGlHR/UG32NweLujSLsmMHkN8JhumJqpcDKmGNILpzDf0epQiqV2H/HJK8+mgofmfFR71P6zTgBsiq5r0haPRM4I1AkK4QfKK9pCW2xf1feYyHxxJt4dsZ6F6TAGxuclc1fE3PF6lRFMaY0i0JCn3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbQDM4iG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QKsSEHZR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUDceY12547842
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5PUqkNeoyZsyllIXj51Z9AXHTnp8eKBjR96p3ukD7pY=; b=kbQDM4iGyuLFwO27
	oIOnfYzUvqwVUgnJ2VZ/atldMKTdWrCboVCQ5Nz8DiXsifVd3c2BRK77/olLDyaV
	OAEOUhjuGP3fyfylaprbpr+jMcOE2Fa2vv8+vkVnz6Olh68Mmkkdm3dtUzc1xQkF
	MT6n9RO/EWjqTls0c62U9QmghemeKVdLZbs0bvjWTt9jImDwWw9B9jjtbhWPBiIH
	rYZ1wdZyTw8JybrAZd34pnjIDzqRG9b2XIDBE+BLcnldp9H92u0VQPU8qchvnyYf
	nU99luD+PqVzuKFESpszIA1Sc60VkwX5XRUVKE10x3KqenmCIaEyoR/iujgqUWJO
	Vb40zQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7399sb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:28 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-78fbae83badso122570157b3.1
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767114208; x=1767719008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PUqkNeoyZsyllIXj51Z9AXHTnp8eKBjR96p3ukD7pY=;
        b=QKsSEHZRjhfsEMdgAGhLE00zXXKX6G2l2WQcf9d2ndMWMTx6l8+vaPZrGrslAJbNax
         270bnVn1YK1N/SYgw9Ja7qHmw6Xw3ZDsuOTfPj6LQyBQuawV3uRrBpmVUyNexOyk4lL1
         5CN4bajHodtIIS7/dAXxCseHIvWE7gyjBuLogxyLl9zUIPOuu8bMXfXd+8TSC3JqmPD7
         PTJbSEu3Ry5uXZlpnPP+6u7olbbAZCY0mX2652KjiVZWwV34Bi2l0L9KiAxv8AgC9nyR
         XE4o8LtZOionOgOpF1JXeyQ9f21lF2g7wzCMrgkzG/pV5vS3WkZtg7WSfSnpMTt0t40X
         fB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767114208; x=1767719008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5PUqkNeoyZsyllIXj51Z9AXHTnp8eKBjR96p3ukD7pY=;
        b=l5uz2PlIubaIypSWKXh4q+aE1nE/5E3/62dGMbbWgSRbx6kNelqX8GXWQsBa0ypyLG
         q4o8Sr7t2DTqSNm8kJQijpItJG/f1QNHv4kLbQcZytmzgVAlQD3HHFSYRSHIhctE2k+k
         RiYZjDTcnOVYD7vIBIaL2YQHjpyzp9KWfB3tT0CA//hGrOYk5U7r4xgLv+d5LW3MdlXU
         ERoeDp/NC4Whht3VFS9a+HF9uRm05qh2WU4L/i/ijBbd7Vq/nyBkdFnmNM5RZvSPJy0x
         YUjpIPIwDej4gcwtizBkbczLVg8RODhXg4KdQaWZFn0ijFVB3u8BTiRQF8a4o6iU5Pxh
         Rgag==
X-Gm-Message-State: AOJu0YxmiWwFUkn7rmvgHnl+APvVg2gEJPDbSWjBqBv4W4d/wTEdzTmJ
	4WNkQlaCESJBYB9dZnNiHJQpSuXorIKVlzRfdoEERdKP8If//rqwhQyl/fbbEOWzouwtz+B8JhD
	eq7y2pAGP0l20iiba0uRRz9a2quUhsd+/e8sJM+7l7rnc4J2CYsmguC0b7l6efSlGoA==
X-Gm-Gg: AY/fxX5rfFM5xm4462N3jU2ZOtB9I4meetpDE1ZFSy+Z4HIskDW/S6B5vnIUxvOYhCF
	ohLgiGWnZFtIN9P+vQG5z+WzZfRXqpvjYFotnoDSE9M72NhiYfVOe+ykwJ9is977X/igPLfm9HP
	YM5Z3mr+jcsdWaZg22hG9yKAdEWlWnQ+W99zX7aL9VzkohgRol3OYQWTFHp34mphDG3pxsyXXVe
	vZ+dCaTcvVk7hMg13eaX9COMkbfS/WLGEZ723F2yE2QbBUWEGulkNUjfQpCIJiEAKV8jXJepty2
	LaC2JB4xekpKCSMuthv5iWDoQK903J6Kjfdb0ftYHfpDe/5BMrcZSTQWQpiQ+J/EaMNr1q9LXMs
	tbTR832PSAhKFl3Ki8AyhOW9oBw39YGUlozAaxIwMoMKJpk+c8EYeJFixC29pGXLVfcB4f5NwB4
	9go0Rcuw8PQLnWRoZrKrqEBBIUR02zpRp162iv1Fsd
X-Received: by 2002:a05:690e:1486:b0:63f:ba88:e8ee with SMTP id 956f58d0204a3-6466a85a863mr27726563d50.21.1767114207628;
        Tue, 30 Dec 2025 09:03:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvH67x7N9VqfWTIkbVzkjlKI4q8M6OsJrMDLumQlRZCmpGzL/vpyLEDXjwwUVbQJGk4/yKMA==
X-Received: by 2002:a05:690e:1486:b0:63f:ba88:e8ee with SMTP id 956f58d0204a3-6466a85a863mr27726528d50.21.1767114206965;
        Tue, 30 Dec 2025 09:03:26 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdb9sm3776086266b.7.2025.12.30.09.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:03:26 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:10 +0100
Subject: [PATCH v5 13/14] media: mt9m114: Return -EPROBE_DEFER if no
 endpoint is found
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-mt9m114-atomisp-v5-13-763539e76094@oss.qualcomm.com>
References: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
In-Reply-To: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: n4OxXqoEAxXyaBkQcItCf9S7mdrX2chp
X-Authority-Analysis: v=2.4 cv=HrV72kTS c=1 sm=1 tr=0 ts=695405e0 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=tX04M20y6pLIItW2OsUA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1MyBTYWx0ZWRfX1ExXw+IXW9xb
 nh/pLOKR5f0OFPO1aAj2dVKQ7LNpmeFaM8XUoVu81wFPL5hKq6Mi0W7Ehs72lqxFyXzQuiup0jQ
 y+d4Jy38R7Den5jRwF/4ibfnoLXGLio/rFvPtchhsk7SG3YvgW5tl72I/+qffQ8XgqwS0Qe5xFn
 8wWx2qaYnFhhj30JKwwrFCPMNgti2HdVHkOrcneHTFRv7nctt6BcNTrvVUh0mr/BChpmIK/EJ/N
 e4qGuQIV0EGuwrFLue0zBWJxQrqaBi3XuUPiyBK4xuo+7F4WDN+p9L3by6PYqq+MCoGVmbcerYv
 NksbagtdT7pYtf5AR4r3bvM7mt5Y3CNelWps9Lo8/OwzxLihgtfCqmywueB0gKtKcB4tVTHfsXG
 Hcfy2GEQ7gxLh6QYua+Ww/IvOjfnivNfhKq0FWEqHmrTWkqcUlVRZ9FOSvtAnNfvBslMjuafEre
 3Q53YtRXYgzcIwAV9Sw==
X-Proofpoint-ORIG-GUID: n4OxXqoEAxXyaBkQcItCf9S7mdrX2chp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300153

With IPU# bridges, endpoints may only be created when the IPU bridge is
initialized. This may happen after the sensor driver's first probe().

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v4:
- Update comment about why EPROBE_DEFER handling is necessary
---
 drivers/media/i2c/mt9m114.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 18fcf1a105a4268a501f517a155f12def0753929..9712d61ab9512f3b8ff31423afb81b61bc3bdaef 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2460,11 +2460,17 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 	struct fwnode_handle *ep;
 	int ret;
 
+	/*
+	 * On ACPI systems the fwnode graph can be initialized by a bridge
+	 * driver, which may not have probed yet. Wait for this.
+	 *
+	 * TODO: Return an error once bridge driver code will have moved
+	 * to the ACPI core.
+	 */
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
-	if (!ep) {
-		dev_err(&sensor->client->dev, "No endpoint found\n");
-		return -EINVAL;
-	}
+	if (!ep)
+		return dev_err_probe(&sensor->client->dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
 	sensor->bus_cfg.bus_type = V4L2_MBUS_UNKNOWN;
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &sensor->bus_cfg);

-- 
2.52.0


