Return-Path: <linux-media+bounces-41180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC377B38296
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 14:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E9F717DF15
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 12:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA91350D5D;
	Wed, 27 Aug 2025 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ZnDRoHD+"
X-Original-To: linux-media@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012042.outbound.protection.outlook.com [40.107.75.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C8235082E;
	Wed, 27 Aug 2025 12:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756298387; cv=fail; b=WqiI76I7xLYenW/UWgflqjg77nAZzJW33t+8ZAYQ+BO5xed30fAddmKkV+zDzuY8E8TznxD5hy2mzo+CfVO9EXZCHkoTIqEr3hJOcW0nr2LfnvfO7yGdG0gX2aI8tw1QcAZmY9qcCg/snwJFwVGpZrnyd3RAl3BPo/lVeW1JnBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756298387; c=relaxed/simple;
	bh=n4wfPKi/8unXx3hQa6juv4MI5wFoFqfBghOwAYyyHbE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dr7zhag0fc+RQTywjbCqVPZam6MDQuvzlHZp+L0td30NncrcTyX1uRRyV/6MyNyLGZ+o460RxHz8zWKlscxDPrl3OipIZ6p0fTA1VgW2WfmzvnoIlVoxQ23iJ86vCjfuddguERzJaXuZUigegmiRgDnPcqU+x3Y0Hq38FT1e114=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ZnDRoHD+; arc=fail smtp.client-ip=40.107.75.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phLOmAzVbR8SZ075qpcCjMuk9DRiXfwK8os05pP0rORGI+GN3l8yVyOtlU/Rydg0OmRb4VZOncI+Hp+mBPboPK0ANVFPVybDGnpr77AzQM4nq8SVan9V2/kUfHXAXsEAnnZ7PxxPYJDldD9y5ri+2QBoZRsFjRBQcItHE47QZghVfJemtA3TpzJtcEPba9Hj1xNlN58yXf24reG83Iq3AsNkUk8hKq2r6DdSnYJSBS9ANrTILhBdlEqfFZaO2Ox4KF2eXw53nILjSMbaruiIGWclFZkxjaievwLmDAmLpHkBMVfT+J9Id4sHXahO1nk9dYkRhaF+2JeXYsecVVR0dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxoCh3ecuwz4cLiPho1kgLVK1G/WMmhcVhK4HenrsFg=;
 b=L2k0jM63YyreYg8QNwkiHPxlXOLPshrpE+gOu9H84S7YV7+pMneYqgqTvIOv0/exils5V95Hj2R56IFrATCkw9U3jlS5b2ljTJXSewnszpJkbiZhobAF/aFP7YzrOxp8p4J+RxrF+9BPeDBgk4hH4swbpfbdMDZMUcxXjvHMcesGHHsnwvgrdGqM6FoV1eTA4UvGdGsNjiZZXxn03ONAk9hw5j42WriI96sHX8yLVt3P1wQ9k51WEj9IylXHliOyuNkyBi3lng0UFsuXGyFblQ32Emdygn3NwHa9jQ4znAEUyJJxMQTGm53uVUj9VcIeeDWCROExXTsj+HAyHdYTYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxoCh3ecuwz4cLiPho1kgLVK1G/WMmhcVhK4HenrsFg=;
 b=ZnDRoHD+dROZPlX1c3hVO8RNyNs6ivGcTjru8C4ZOHZ/9XxmzF42mR0oDGwWYBnlGCMwpWJ9dcgU3UOFURStqA2df/wZ90tfazrbbY6Kv4apVAsmkVqHHUS3rm4JnqpkMGwEop328VSlhdGjbsSkABuESioV+WAXrRjAX7i52rx2op0FKHR41/+U6Fa4MorzuJmjZYcCynCvo1e7tKJOShiCW2mRxu6NPctTy3hb0a2/Enkb5Sk2J3BtqU05+8X+G6uFfo2pmwmLYzSi3MqO/CPEkLrF0qZgfsxjpiuwfbR7wdroo0DvTVVoUS5+DdAz9KAe3X5bwVABwKYZwpXI9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB7285.apcprd06.prod.outlook.com (2603:1096:820:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Wed, 27 Aug
 2025 12:39:41 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 12:39:41 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 3/5] media: raspberrypi: use int type to store negative error codes
Date: Wed, 27 Aug 2025 20:39:11 +0800
Message-Id: <20250827123916.504189-4-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827123916.504189-1-rongqianfeng@vivo.com>
References: <20250827123916.504189-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: fc12da85-e484-4729-f477-08dde566cb3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M9gGSu7kp5q/+7lJ5NG0/uGoeFdobYedVs/g/2tXoENnJs42q1+9F1lNNNiL?=
 =?us-ascii?Q?AssKw3J1Vx8hTREmSUZsmEPsfM1StfddTWkZU5htTBG+Q/k2CTMdxeD/yvAi?=
 =?us-ascii?Q?/A/iLSkHPqlmqSMXOTcz2fBuCHIU9GDff1ZFkpPryfie3i1DixIGliUld3uD?=
 =?us-ascii?Q?SRKttUuMwyjXRuYaqEnu/9x79FbeEkon3QdwmSHH0TgGFWPgOCyhjy6A+d5w?=
 =?us-ascii?Q?pLjfScSblBfg1Qd0EEzNe9QRbzy7d+dxE0agWQnCAb4zRC9XixgTKa/pznMz?=
 =?us-ascii?Q?bagkKk2Sfxac6Lr3tT9hvU9HhyVVg13Es8xiN+vfSe9HnUgzEAPfSHuMpZQJ?=
 =?us-ascii?Q?qnzvWXB8UqV4/F9+Vb3Ul3s/+GhRg9cmKAPzFUfYV2V9vr8JPtDlynRJFdYr?=
 =?us-ascii?Q?WQ2YOhgn8cB30pgr5FBkGrBep04stHRkwBcZ8h6z5oDmc3qhFg/n686q5Dx1?=
 =?us-ascii?Q?pb8C7ITKVrfLOPPDpjUCzVeJttnRjRFQ1fCbofWoLWC9diTY6IA21vn8eB6O?=
 =?us-ascii?Q?j328lXRTd38JqVPOu70Jdkkcl+H5RlJHl+VC826pMYG6dHoNtgG1VBUfA+na?=
 =?us-ascii?Q?veXsWOKgfCRTExZUo8JETcojeWgemh+jpk9N9CI55T8EPMS/D49yD896fpxp?=
 =?us-ascii?Q?o7rs9kDj1H967uBkoGakClbh8MaDsYPNNhtNtFfBFhATEpCX68O1cxo7qtbM?=
 =?us-ascii?Q?Yt9o9YnWeaRJrY12xVw6exP+6qkKA5Vn+aEXZ7GUZHecFYK8WjquKZ0bpU8K?=
 =?us-ascii?Q?nG20SKiFe3hKF3wwwU82I0+4rWAgz799FXgPmAd5mWd4+lEjaQZHkuFOKJhW?=
 =?us-ascii?Q?+HB97nBy/QKKFl9wtj8eI/iZgdrqV2qLvDGgA9q16QvvtBzAXpPiJydWdq8Y?=
 =?us-ascii?Q?u+S75vHXkQ8OpUp/Vioj8Pv7RqaA+J8GlH/RGVOtjA4oI+61pOQ5x0flTzhn?=
 =?us-ascii?Q?z6FJC+znI86l2Gj4o/sLcoJl4n9cFAMYt9yNawLuQUosTkFJatC7zBrdkldR?=
 =?us-ascii?Q?3+5ogk0ZTW77ahGAsAumMnFKCXGrekPXmF+z4vAj5wjCGZay2C+yTmY5Lct7?=
 =?us-ascii?Q?VHbbdIvK+07Oawtxa5M7GQvJHpA9ooIrcrjVQWHnGmAkYrBtod+f3Q6v+Kgk?=
 =?us-ascii?Q?DKg9UDu5Al7rAMghGL0DZPHRhD8rb99Tn+PVWosHX8VoRZ5FTIkoK3bSuC3Z?=
 =?us-ascii?Q?mp6GPya4X89gCBdyPBDWbaig6G12nLlsQV45FV8lebc86BXcdTTjlNRnXtPh?=
 =?us-ascii?Q?tY3lv8ua9bvhCRw6Bsa4OYCqCv8EqUGyZbnvRFyCczuFm1Zi0khIGWj6bBVJ?=
 =?us-ascii?Q?I63UtzNfHimDKFPHJgKRpKB7ZmX1kb7JFkJdBKxa1LLKcai4hiGj0CKx3Ca8?=
 =?us-ascii?Q?MQ0Q+0w4p5TbhP1EHMXNs3HI0Ak/Z/3GZpfI99xWjuzKw7volfSy5mGU4G4D?=
 =?us-ascii?Q?22g3xd1dpJknzGUpJiz3rxes2AjiaAjpXYpv+VOdlyWZUrEeYEiwaA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2LiZYK/23a2FFvX3ZP4zUWy4Kz4LsO/f+sxFHFuWs+YiRj/NuCn+4BZCauin?=
 =?us-ascii?Q?1xRjbWxxpGDlqcIF2pezAyCLhb1yZd49e9RhXFqU+QZFAzkufLTxjHGPbbot?=
 =?us-ascii?Q?XYD0tc65Df939ijoK4MfI1YRn29l59FEb0+AcTnghaT3YkEE3vN9MMggLe9C?=
 =?us-ascii?Q?TtgZiVmk2VWhOd61e9mGsfd+f03T/VkdH/hSkoIYkgLCpeO6ccgwGgjtAaNO?=
 =?us-ascii?Q?coTyzSyGubF2d0saqCnBTVHhzH1d0l9Tv4C/Zn6E8PItmrTluIyD4udpeizS?=
 =?us-ascii?Q?c8gNDhcHotMPWv+xPV2BjPLwH3KF4uJZ/1t2WKLXIa56Zt4qwJREnJF69/La?=
 =?us-ascii?Q?b+HQZAsAsIWPl0EuoOMN1xQ3Qvc7OpxShbio3NjDUucd5UXCkuml6o5yZUpe?=
 =?us-ascii?Q?wqZz2+HyQt5cqvjKVyF1ffnNvK++Vo3YqY/M2RIdEH59KoEaZqO8PhDeb63m?=
 =?us-ascii?Q?cM/nvU4b/BwmvMvBd3li38eZY43Uhd5jWU3G3wrjIk7cIne3Tj6IuXHbylaZ?=
 =?us-ascii?Q?sva7vnnY3yycoaLLwz0lTo+rsfHJ4+03Khyl2YMqU8f4ziirJxicUUYOvmjN?=
 =?us-ascii?Q?9GhabxlD3f4nb3G4vL/BnVavfHZJCQ0fj9ZY6JeyifmcEbR5zVr/1Zg31Hth?=
 =?us-ascii?Q?Bi9tLQ1Yj/yqFDuC9OSFL2sK4zaTq/xR1+PdTHLvNAD5kfoDa21MoPFUOunD?=
 =?us-ascii?Q?HvqTjtE+uXt74+n19f5XNu/33831/AyjyoGPzieH1199Jex7Yrb3N+WCsy7F?=
 =?us-ascii?Q?0qhvUb6I+gitxTLtL9Mop5jNTNDUnzH4guaAWQDWq+wlz4MwaZPl1Uso0DYA?=
 =?us-ascii?Q?LM9R+ZEiFJa7h0KQZ/AnDLHj5zn9L91aOpH8m2LopFaPv7MJBh13s51RtVxN?=
 =?us-ascii?Q?V4BPwOoF7SA7omYA+agYCvTb7k5uHm55ECb1zcBOh++ugAnVJmeuQ05yGKDI?=
 =?us-ascii?Q?5YzGuFsZnnMPTRF3leu0XX341cxwUQblnZ2vzYHAtjgBhtLeeui3hekFfmPO?=
 =?us-ascii?Q?Ub3lLSM7nWf9oDtT9sHUHplA4YlDlyLG1/F+RXKKUbXNozBfGdsZKAi1lE+y?=
 =?us-ascii?Q?9CqKjpps+ibCUM+YikTC0DmNoPqKfmdjHOli94eGyQIZCt5MTAx3v7gyN2Tk?=
 =?us-ascii?Q?i1+0DO1eYIFNLQ0+scRWDkO9DrLZ0Iso0iwgt6vF2cJrzQLdnry0YnVR7nM+?=
 =?us-ascii?Q?8CQCNzOypoUjc1QCMMrGskKDtaJkUR4ZgXia2d0gFx7S8DU4eTaibA3SpCgq?=
 =?us-ascii?Q?U3dP9SySl3GjlrBzkhkIEPvsD3pKn5BsaWw74rqW489GAMslTZrFjJ1uMBoB?=
 =?us-ascii?Q?ZOWI9u17v1LFbpKBvnkmz5ClhsV3Jk9V+VqUqr3V09pwy0Xb/xUzBIALwwSo?=
 =?us-ascii?Q?2r+Zb4kdZ7O3kSg3vqtFP1pRt1gPaQAPFjLYffMz7y3UBKlQNCkg6RMMttKj?=
 =?us-ascii?Q?cjlmLAZh0QhXcHV/VEiiYLchbYZwSme6BoYeL/Y3N1YhqgCllgrrYFvXMtXa?=
 =?us-ascii?Q?QG6QQsRaYxnIDTAZpUH3mIQgAISrNemry+1fkSH2/PZQXilMSWo37Be+puwp?=
 =?us-ascii?Q?YJD797jk7A/tkkUJduyZxOsbOvu2D0aeYE/51t5+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc12da85-e484-4729-f477-08dde566cb3c
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 12:39:41.8161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLFWh1MW8Mbkm3c9jn0uw1fIZZNzkvwLcRwFv10+kDjQRzBY92VAHqVZVmmyItkamj2mi7qqFFMR1W+h927L/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7285

Use int instead of unsigned int for the 'ret' variable in csi2_init() to
store negative error codes or zero returned by media_entity_pads_init().

No effect on runtime.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/csi2.c b/drivers/media/platform/raspberrypi/rp1-cfe/csi2.c
index 35c2ab1e2cd4..2c5b4d24b4e6 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/csi2.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/csi2.c
@@ -525,7 +525,7 @@ static const struct v4l2_subdev_internal_ops csi2_internal_ops = {
 
 int csi2_init(struct csi2_device *csi2, struct dentry *debugfs)
 {
-	unsigned int ret;
+	int ret;
 
 	spin_lock_init(&csi2->errors_lock);
 
-- 
2.34.1


