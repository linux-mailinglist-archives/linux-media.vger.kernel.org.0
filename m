Return-Path: <linux-media+bounces-49479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDB1CDC3B5
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 13:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CB96303137B
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 12:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2181C337B89;
	Wed, 24 Dec 2025 12:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6Jhg4dV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKacysIF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB998338902
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579496; cv=none; b=UTGegHoRTBisZu7G5uHWPZ3BA3tpFy6vucK49Gjsz8FHNMWTaMVvr8OO5iixbdJVNwngoCweoxdx1WxWCwdNYBD2UWacQoEsRi4RW5mfvjJsKOwJJJhIGu/Rxiw2s0ez53d4KGv5XR6U2eniytFRsOc9yo3P2TXjDl32kX8z7sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579496; c=relaxed/simple;
	bh=qbaO+KrUPkeZLb1naR+flBVDrDLzeyBSpG8VDc83sSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NWKSCm6/V7J+9pZrKUXIcMdunnDCpW7Hyz50aDZL9HC+USOPr/319vivO6SZAZ7sFFL5/Rf1q7RQ0uCcZMbUA9TUqxKX+MKk9d7TST7woNOy2/Wnx4Kn3iy3gfniEAyd2HX6HMxN6LP9hey6YSqoozJChn3/4ZMiIeEhkRK6CMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6Jhg4dV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKacysIF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOBtcor913652
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mNSm0Tp99qqt/QbO3b1dRlo0T+eYUgGNVkcwCnYUCWA=; b=K6Jhg4dVwB2UkEKy
	YQeaDeJ4zYxPlg5I/bhPOjIpJNQo0DHWvbFuhw5RnhdoxL+UqSVBSb2YXZ4NGbXq
	S/H/UO/BR66mrVr+lB3hn8CYscFnTxGN1TluD6q44Z3DkNiU/LrQ+SPr5fOJ1XyS
	stm4+A8ufLSBimegQo8M3DC+B/tFYRf4rd5NVxkKpX2bx50Kc9iDBtfHF+S+m58D
	FFQNpa98bYhnHc07w5IxYPFP8ogVSkWjyw2GTKzrUW/m7R7f0c1Dn7h1pKbefk5E
	uLEcYTmCo6//9tUYfU9kDxXd+8BIPOnv7FTtifXmXcewWcwO0x1S94hEZVi6NFP+
	/LPnOA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2k6k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed7591799eso142489321cf.0
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579493; x=1767184293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNSm0Tp99qqt/QbO3b1dRlo0T+eYUgGNVkcwCnYUCWA=;
        b=XKacysIFA+pPCKmsnHU+Z01+0e7qmhXlbcoE9WyEk2+QoiHzOtnvLBKOAfI00gWclM
         qbZkd1I/j9SeV/F24oTaYzqxom/SYWbZWYOM3wUKJ+thdVAzsGkB03GL+y7Dp2rnzAzc
         Tc9a2iK6rpBL+w7f1WCXVVcgTotAELsjmMywhs3F10h4dxM7II9paSSHszRp4DnJpD2f
         WuJ+nmT7fbaPyCXJt9vqktjkAR2HOc1Kt7HNwyaUAymp3HO8fb3z7aI8Juk/Tg0QcVDN
         6/L3dqAfkiUI8Tp980Z/ETZFwXI/sK9+eFJ/3TLJJIsaJdB3xrUnR/4tklNKRsfx4a8/
         SDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579493; x=1767184293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mNSm0Tp99qqt/QbO3b1dRlo0T+eYUgGNVkcwCnYUCWA=;
        b=ccSUujD8AacJ0hjjBbABaJEIQBBPL6LCZAfXl9nLijGxBEc+WNK8AH9WShvTn3ui+I
         7VC4gszPl6QJLphS0f1HXsNXvDJ83czUEXR4TJbFLvH48A374CmiZ9dHnBag+V4toLrf
         RI6GP0hRjFrD4p8aAbVLTLmG5JOasJJvx/T+AkXgLHsmP+1QoaqEkgyMUZGrbwuwuuaR
         EOib1zj6dI9Dl4qcYc4SN4cmd7yQRCJ7htRAADBsOYAGw+SD1zLIe8QowIn7dRU01HS9
         e80RZKYpkH3shRcLWXzRovMriw85PW60Nf1vvm5yn4rNUYPXsunMS8E6OJblMR/IYVRM
         7vJg==
X-Gm-Message-State: AOJu0YyJWWxA1UaywBOmCt4s33A5T8KXIHHhwW2ifYJsMdW77s/nL/Om
	LHb4uLR8S49EJhjoGCOPZ0uKaPef8q6zDzOQtznoBIK5xzQCutBFR7t6+D01pxgnt1ua+tYVl0p
	S36v6ulpDAhMRJ/T2nPWuK0Xsm27d2s+OjYW7d64I6CizZoq5XwtAVJHljMALYyifog==
X-Gm-Gg: AY/fxX4LMmMtdlTLnVgbI19iSGM16ElI3JstxNFJ8PBF5w+11o63xaEFcILY59abCYy
	DkEBpOpHP9izKmVUwk2UwtgrlnqiSZFVs5hyg7Q0WwD+IQdEP4mk/klgiDFBDZTx9bSnbGEBoz9
	sgqdBBwdL6qo3VQiEVtugBht5qVHyP5vXITo+jz3Jbup1Zu8zMNqOjCP/AI72rCEzAQhC+s09U3
	XYwkdNIcBaD1XvlW5sjWaAzltkz/Xjz/ReTCn6y7C/QN3MSsHiqLL1HVhL/UFaDc+8qZ5QvVqCV
	TxhKxdo0U/3HQsudVz+WVI9aeGatXcF0b4TJhljkJCDHOzJsHBBlXImpalA/bu+c3ebEeL+rSaj
	ChG5Ns9yNr/f7ZFeK08P0RVON6gJ2agC0tHDEFj0YMZjh73C+oFoFb7LBuMM+Wfcu6rhNbftL7w
	ite5xZ0MogxDSJE5zNcuCMYXPhCEKm0K7tBZDF1yFh
X-Received: by 2002:a05:622a:14d2:b0:4ee:739:142 with SMTP id d75a77b69052e-4f4abd9950cmr250542351cf.51.1766579492887;
        Wed, 24 Dec 2025 04:31:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPfq+1lAS3Zg7DMYsp3u6LwyxjpY85e8gp5rXL8GOrBoGfda0utAkjjBd8oBQvZKn8ZMi3cw==
X-Received: by 2002:a05:622a:14d2:b0:4ee:739:142 with SMTP id d75a77b69052e-4f4abd9950cmr250541961cf.51.1766579492426;
        Wed, 24 Dec 2025 04:31:32 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1750304066b.48.2025.12.24.04.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:31:31 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:31:23 +0100
Subject: [PATCH v4 14/15] media: mt9m114: Return -EPROBE_DEFER if no
 endpoint is found
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mt9m114-atomisp-v4-14-60b25da7a1bc@oss.qualcomm.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
In-Reply-To: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwOSBTYWx0ZWRfXySI4HptDiJqo
 LdTUqwCeSsPY0g3CIBWNlKFyUlwzyJyA88moCY1t1cHf6D83g1SRRuKDLgmPXnYvZ0cRbncI50P
 yrJ7u5LWw6QaWH6tyrSvWXxfSkKivHzMDlkS4EV7Axl0C5GZGakqPZnNQZ6N3NVMOvVKT7qmfJN
 RXkPTCD9sbBZrSsL1bhb/4BxQB68woMqSN+Z4RtYtYJQNIlEAQuaFgU1+E97s9YFewlv13Y/ySH
 fHaNVIl7G/V5iywTn43vIHoXHXGfmI+i7Wa4xtzfPbHYrBfb05HKFGjsi3missbs/Bn7LHEjR5C
 DJMCz726U37cJtS5+zR16uymy2joT5Z1rEUeORFEaib6DktwrRqLNYM5IohMlEYDuvhJhIOzr84
 ujV5P9n+UOOMYtMvS2Wdrgh8XcdAjMhx8GknbQMcQpD4t+8+f961opIJfBbLSeYdqDM24yL483a
 baW0Z2+pt5aub0G9ylA==
X-Proofpoint-GUID: oPLvO4V_EvgMqiGQ7wjOF-eJz3NfhvOP
X-Proofpoint-ORIG-GUID: oPLvO4V_EvgMqiGQ7wjOF-eJz3NfhvOP
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694bdd25 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=tX04M20y6pLIItW2OsUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240109

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
index 41e98f719a23045293ee47d8980675510a142afa..9bf900095515447d22265521349cce1d7892e9b8 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2448,11 +2448,17 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
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


