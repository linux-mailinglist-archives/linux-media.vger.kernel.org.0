Return-Path: <linux-media+bounces-15112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B68934759
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 07:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE7461F22E8E
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 05:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E255542045;
	Thu, 18 Jul 2024 05:02:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2108.outbound.protection.partner.outlook.cn [139.219.146.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E949939FE4;
	Thu, 18 Jul 2024 05:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721278974; cv=fail; b=P5wEQer5pxi0Oeia/EFVlHBHY4dEw/jG4G6n+/tZhxeS9SXA1+FbXK5wEXF0T6Jy4xNlLrPEjekAcfmOveCaljZtwRi7Xu03aNN/YxCkaxfUMvVZ6FQGiqb+wp61niigSKc6c+AjM58xsq5GyKqUVF54qjYkltSEo9GiACP2RKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721278974; c=relaxed/simple;
	bh=2s1F7eZ8Q9lQopQGZP8ofOFFunuU+GbKf6rfeagap6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cTRCqdAgQh0iWpS/fhbxKazAH+iUMKyMCZyx/+33mbW6Mp5cUNXd8k4Nqwvf8B8kfMZlMwByFGIabkqAU1VVLjgKNAJrjS+IQat/xSz9EhnL2jB+4dJ9axj9FtpdCCcbSfhbEyI1QsZFxxw46xcObA+egvvjZRaCVv5WPPR4U1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GODVCWjsyzJ66m4zhr5X0Fd3tARoai66g/Sr0eNIII6D9GBSpO/Zydf2iNT1s4JTeDYF1XdxwKn6WapXnVMkvdgCJX7zO4zxZ7oGpPdEJhqzdrBnkmw+5FHERCIX85YdMw5RPDDXDHsMdhVgq0vWB7V9dyYbi3L6/RFtwUXaq7hxlRJbFcFWHtB7kdouEFDb4XfEqhMjHOfFNSVSKh/07DkbK+ik+7IElE3u4gxW7mWeJUEdERQ/7YleLLytmZCw5wYniYTebgfF/bcp+mVvorxQuvHQTJ0E8ro9wB3XyDWGDv6o0xlnXwcFmZbqZiX1Prq2OxxOhoa99hdaKsPJNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rx1XDLmsNv+KjI1/LhlUqD/tXJ4Z7DH5SC9QgQ6CVRQ=;
 b=L+xsNg+Q8y/8in7YGd0XBXq0SW7NMkgQEtGGckoZzI/HlvghX40BoVuibhwSQvw33WO/nv89TB0xxDdGVDhzwxDv/WU2PXg7M/Ky9dtxw5O+kC+Gk3Q6euCYlqYVEkZxrFhy8hvgERAY+9l7fPJuUPtwb2GY9+W5T6KCWF1T96x/lMiuGNy7li46KCgM4t7B8oMV/5N2TUWVIqfDjULrZ6dvZfqHal/NFH3pJB1XNkGgxdzlFVqjge6ZLviAiLT2PWhC0PsJmp/cp13rcU4oygSjAGoQrqTQ269opr/XOX027XyEADzyVt7+5qblrUcDECu3sX1J3DOxPBNZtneWBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1046.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 18 Jul
 2024 03:28:45 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.044; Thu, 18 Jul 2024 03:28:45 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Jayshri Pawar <jpawar@cadence.com>,
	Jai Luthra <j-luthra@ti.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 3/5] staging: media: starfive: Extract the ISP stream on as a helper function
Date: Wed, 17 Jul 2024 20:28:32 -0700
Message-Id: <20240718032834.53876-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718032834.53876-1-changhuang.liang@starfivetech.com>
References: <20240718032834.53876-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::14) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1046:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d944c08-60ed-4d3f-433f-08dca6d9baa7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|41320700013|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	Fw84wif0y3Iny0kibhuiY3CYkBzRzP8rdGDKu4rezGcaZh9OZjXKbLMhs77LqIkwEhrPYmHnTWWhjYgcV7YuBpg1F0k9Ta6GPH8f71rN9znScHGv5OD7GPoi2IHJAPYtGY+OwqaEyHvBsc+VB2BMq9lfYV36QRA/2red5+2HkJgYaNsaBBXX/DaNANamV+hAlnh5RR+TwdqiEOqXJteeM8HYnS2b9Ty2kPZNDhkclrmFPeL/kPLAS3F5nTE9emqIUTLMSCqADek0rsvaLy1vH8bSFUGXyaYkBLo1BnTgIN4M6n8bffZ32jScPDlPYo5HQ2L9QiU7FfAdo5bGZiwTN5MnnCNBqm60BEvT8ZV/CyQFG1cgGBAzd89CEyGgJx8OX7ElHZrGQB8566Mbjhj+q8gg/nHTPHB+JM2cuNprBD+OaUfg0L3q5y8yjpKSk/xvOaBw8J1J4y6AewstJRpUT2V4FC9SVndgehzjieaYMGTGB9WYhg7g2aQ72TRtIqqN5fLkRLuqxQ55YnlXYkmb3NTFfs+L0vnfsizk+JaCsdIBU+tPi6prTmKqYA+sgRImBJnzlmBVQqB+UCHsijJFcQHvvw1EaH4gLdlOc9lWDiOm6FLwPybOJSPL9ebro+cV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(41320700013)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uygQNIOuFZ86SaRqpFwPiCOD/wAKjWflaUR0l4G5uS6aBPrvzeSihBAWQgbS?=
 =?us-ascii?Q?jiQhRIJjyU9cwNwAjHZ/a1Yym/fLMOPHBlbRbSLpu7EgA4gMs3MqOe0NYnI3?=
 =?us-ascii?Q?uyc/coh8XQFgWMfn0Vsd+8mvF86VZ2j/vYLT/8FU/WqpETSpgjQrlwLMwY/m?=
 =?us-ascii?Q?h65Rl9dUazsmO/GeuEmJ3Fs5OR/fitHDXsS15crhSU//FdehVqReLR9+VzYc?=
 =?us-ascii?Q?ea3z3SPpWSC0iWW74EqSmsRKc6X62hGmH/cs1FPYUXT0fC7W5Rx7wLCLLTCH?=
 =?us-ascii?Q?/Z1XGjlNf9mo59TXGqlVN8jK2R/U1FX2q+OyfSC118W7N0MzKQNRXpVL5Hln?=
 =?us-ascii?Q?V72c+oTGdMS60zbx3ikxT7BQ+49BFvsFXFg7saqOylfe7aGkz9Vwyhokm4C6?=
 =?us-ascii?Q?4VnJasze6LCrovGgqn967Kjl68MiQwOM916UfKwl3Z3U4fniF+0+JklnKkty?=
 =?us-ascii?Q?PPWeOM3w2lJWwZC/OvKcRPSOe7sEzSAsJY2sEUXfnw39J8MzJKj+a6pJLeQa?=
 =?us-ascii?Q?FM+dM45YIo0PentNJmJyY9D1/2Nn31xBcvPWcakopfNhOqnyg4yRFtCED8Be?=
 =?us-ascii?Q?uplcroqUPA3OG3EiZJ6DIv70s8QpncmRCcAT4dlaDTXAZXU4SpwRiM3pmj5R?=
 =?us-ascii?Q?Dqq5OEScJiDWcfR6rZo516V7nDZPcyBiFyOxTBmcp1xcW5ubga2ffArjTSh5?=
 =?us-ascii?Q?b1dUVSwpWk2DfNlQ286QT9lgzMW4S+fXMYqvAE6TGii+4+o/HBLRQYtr/U+N?=
 =?us-ascii?Q?z4U0kzdM64Pogrp3uMbelqLhAq8USBqYLZjYtVLdoijEL4scO1KY1KO9bXeG?=
 =?us-ascii?Q?6z+G+w/iZlKIx9Sa4d1o/fKhrn3iSmqsCp/GPzQL24lHvpLVbeoFE8jiMPT+?=
 =?us-ascii?Q?SDFSJ2jQI+J/yk+OZE67vOJ/TX1bUXOauaYkYeJy3fjb08n4ukFg78lqRnma?=
 =?us-ascii?Q?TOvSvY3n2OG+47kp/m4cJvWhdADfU+0la4zHlv/w5hPtH1D6zxvZJXyVOfba?=
 =?us-ascii?Q?L7p4KMVbaqQmrXH+5FnnnoqGf2TLVL94vEReoQsQ8H7mdTIGnBQ5w49Uh6C1?=
 =?us-ascii?Q?vG3XmA3lZfHBZ5heFLlSNIGrAV43mA1YRcCNsgDf4P4UQNWAUdYS0OqCxK7U?=
 =?us-ascii?Q?hwIgYpvDTEwgdpzTO2xzHPL8euL7VEJXwd4hib9pWgRbzYayZcak86dbjs/Y?=
 =?us-ascii?Q?TY6q8KfbnnxLWklRLBaJwdiKAVSBEyn8mjS1ut7geiPIozL5NfNSArEqSPxv?=
 =?us-ascii?Q?xLpf13zNr1Z3dTG3RzeG123/ewvTs2gTNzDiT1CPzVN29AIzUctL8BoQQD5N?=
 =?us-ascii?Q?BefhTJS84dlyX4r3uhhLDGVdKf2BLMlhIYvsnvhCP7GSs0YuhhwkbaZBkyq1?=
 =?us-ascii?Q?FjirNOy1SdFEWwk0J2xdN7sv9P7end2t+BSAeQRlt0+S5YDj0VJ1e6cOwQC/?=
 =?us-ascii?Q?6s20qYlIbl6bgQBB4c8B9tE1oD3qEzLCv2fhXaPfPPfIQhS+zGR9OwiXGEGH?=
 =?us-ascii?Q?tYn0ugpiVUDX1iq6o7RdogRgKQou+yTG0sk2e6g4fODCtMmBZ3ZgSHBhKTdD?=
 =?us-ascii?Q?GQx3OL4IW87diwoy4oVEsknn1edffnAvvnpP2zwWxHrTTmQOtACkWZqejUGv?=
 =?us-ascii?Q?SI6z2RWMivR+7SoczeZ8VfI=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d944c08-60ed-4d3f-433f-08dca6d9baa7
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 03:28:45.0350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFkDnph6ZOVO+pEUzRQ3ARs1n5Ep0GPVNR7njxGHU5bGbr5biC1zW6+b/oUWPSY4LH57g3eLjJxwQUzcylDU0KVdVepenFNZcBFIwXeuBoejpX4U8mP888C7wmwjgIs/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1046

Extract the ISP stream on as a helper function and open it, Let the
other files can use it.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../staging/media/starfive/camss/stf-isp.c    | 27 ++++++++++++-------
 .../staging/media/starfive/camss/stf-isp.h    |  2 ++
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/starfive/camss/stf-isp.c b/drivers/staging/media/starfive/camss/stf-isp.c
index 4e6e26736852..8c6388edf049 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.c
+++ b/drivers/staging/media/starfive/camss/stf-isp.c
@@ -55,23 +55,30 @@ int stf_isp_init(struct stfcamss *stfcamss)
 	return 0;
 }
 
-static int isp_set_stream(struct v4l2_subdev *sd, int enable)
+void stf_isp_stream_on(struct stf_isp_dev *isp_dev,
+		       struct v4l2_subdev_state *sd_state)
 {
-	struct stf_isp_dev *isp_dev = v4l2_get_subdevdata(sd);
-	struct v4l2_subdev_state *sd_state;
 	struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_rect *crop;
 
-	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
 	fmt = v4l2_subdev_state_get_format(sd_state, STF_ISP_PAD_SINK);
 	crop = v4l2_subdev_state_get_crop(sd_state, STF_ISP_PAD_SRC);
 
-	if (enable) {
-		stf_isp_reset(isp_dev);
-		stf_isp_init_cfg(isp_dev);
-		stf_isp_settings(isp_dev, crop, fmt->code);
-		stf_isp_stream_set(isp_dev);
-	}
+	stf_isp_reset(isp_dev);
+	stf_isp_init_cfg(isp_dev);
+	stf_isp_settings(isp_dev, crop, fmt->code);
+	stf_isp_stream_set(isp_dev);
+}
+
+static int isp_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct stf_isp_dev *isp_dev = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev_state *sd_state;
+
+	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	if (enable)
+		stf_isp_stream_on(isp_dev, sd_state);
 
 	v4l2_subdev_call(isp_dev->source_subdev, video, s_stream, enable);
 
diff --git a/drivers/staging/media/starfive/camss/stf-isp.h b/drivers/staging/media/starfive/camss/stf-isp.h
index 955cbb048363..1a3e8cf7859c 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.h
+++ b/drivers/staging/media/starfive/camss/stf-isp.h
@@ -421,6 +421,8 @@ void stf_isp_init_cfg(struct stf_isp_dev *isp_dev);
 void stf_isp_settings(struct stf_isp_dev *isp_dev,
 		      struct v4l2_rect *crop, u32 mcode);
 void stf_isp_stream_set(struct stf_isp_dev *isp_dev);
+void stf_isp_stream_on(struct stf_isp_dev *isp_dev,
+		       struct v4l2_subdev_state *sd_state);
 int stf_isp_init(struct stfcamss *stfcamss);
 int stf_isp_register(struct stf_isp_dev *isp_dev, struct v4l2_device *v4l2_dev);
 int stf_isp_unregister(struct stf_isp_dev *isp_dev);
-- 
2.25.1


