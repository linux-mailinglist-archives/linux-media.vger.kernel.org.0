Return-Path: <linux-media+bounces-27811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26886A563F8
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B190C188E4A2
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 09:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2180C21322B;
	Fri,  7 Mar 2025 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="U79hTK6C"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013008.outbound.protection.outlook.com [40.107.159.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74152211486;
	Fri,  7 Mar 2025 09:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339926; cv=fail; b=ZOvOb60b49zjHFIzjLIigzUZcUzD8dYe9OjfV+8ESgXwctNzkSQNHkhA0Dl20oRrW1DQ20ZT4jvuNN2IybS5ltpaGED5z9T9ckYLyhyCQuVFga2ToQvnUnYPMBO+sVDTv2RjtxxPSDlItdWINUpteTW+OPayYGb3Xy2UKjcRPEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339926; c=relaxed/simple;
	bh=HYwjPouo5PqXlBaVkKr2PMe8LuxOydElL1w+AICaYqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qoTWaCfMDDs/6Zjsc1PePrMWwcmBibsUV/Z2P+jXMcjt7XcNBo/FwW38f/oyOKJszHYyxCvaZpFgQyvz1cAVdEbNlMca86gdvt60laMuSSXyZ0GMSyrxBJjf4Hzh7FqtWb5Td/W5wnc1rnRxeAI+dEcqCPf4lmvuScD8Zvsf15w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=U79hTK6C; arc=fail smtp.client-ip=40.107.159.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrknYAghu0fVbw3pWLc2u/P8DHelGDev/Zlh7QbVmai/xK79D+FFzTCfI/S0x34k1clVS0s1ZEfunwgcUlygW8xcfbO8x09WDsuYmtaVsHHoZxnYz9zmAKo5iuYRlA8nzuecVVaf5DgcANR+511izoDGeRefn3ig2yzXxQqxWoK5rX1YrxNmjxO3ptEsPBJK9URtfYbJeYJdP2NdfI74i1imCPBl2aBeKKt0rV1aRgrCh90Cu4JipKtZldS77HJQs693uANspK5weVvjmlLaDkhxVegloIyph2Uk/ww1rbyEzriEMs5aMXKF+eCLGGa+uj67A3WpfMi4M4dvw/zoQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kor3lTNIKR1gra6DwDrdViuy7QPKz38qsXiT/yG3VRQ=;
 b=qIgyQ24/0/Y1+kjsCa0mENGqXOZxPaI+6XlmbXVBjgs0FLV9X+3s7qXESMT0lqn+bG/81yvObtJ3bMOqXShEMeuqD2hfzfhlpiBiuEUU2Dp6qaqqd5XTuxIncmfjkrwIG87h0VGr2nlwO7qUnnzOSVUhKN0IXbHtdga0hIvMOfUOAduM6eTo4S3vEjCa/X3Q21f7Y5cjySBXb0Zl4CrCBaidcw4xUKnKKMU0IqeIr4mxqXJziBqa1zcPPiBsyqSOeKnbaH37tYrY6r6YhuxF6wTyPWio5nuC4pZEJKR2/PpNIZqasOGwfEn4UTbeEErUS8oNZdk9Gye6jugbrp0Y5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kor3lTNIKR1gra6DwDrdViuy7QPKz38qsXiT/yG3VRQ=;
 b=U79hTK6CuEmeuuJvF18q16hGZ9gXD42Cl4tOyYSkdiLtY5cxGS83BMjO6P/BIkGCBRlfVORV4C3cAvwEPGL668qGW+sEGoJDnoOXIpu+Ro8kMv4saMknSmBMGORLuZKtuWGLJtrlywa8qvF5ZdKvEa1rtxltjZm1+BxtV0rcD6AZ4WAKRg7gV0/hIOWMbsPBzj/SuqNuBXRTACPv3EYrJ6VcaY+Z9U7WxqlmO+blrCfU+odMxluBbV71nj4pMhEq2HviJQBaAabRr+Tje3ltPuk1MMsPGuFeYWA0LjzIetqoKChrf9iNzPGi9HMgRHdac66PQJFocv03+h7061Ctwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by DU5PR03MB10443.eurprd03.prod.outlook.com (2603:10a6:10:529::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 09:31:55 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 09:31:55 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v4 3/6] media: mt9m114: Factor out mt9m114_configure_pa
Date: Fri,  7 Mar 2025 10:31:37 +0100
Message-Id: <20250307093140.370061-4-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307093140.370061-1-mathis.foerst@mt.com>
References: <20250307093140.370061-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::16) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|DU5PR03MB10443:EE_
X-MS-Office365-Filtering-Correlation-Id: daffb774-e839-47bc-25b0-08dd5d5ae643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T0WH0XSinExlIH8EZMCoFXXxLAA7ejqrDzkCtcJUN9R4idlFzIN6M4fvSuAZ?=
 =?us-ascii?Q?c1Y1o3Hnw05pQMH7HEQnvoHmKOuqyPX6yr3z8WRZr+/9qzut7zrATH0mjiwV?=
 =?us-ascii?Q?PnBaTqblt4y9eFtwLQOQufV7ANu3sWzMIQXWuxNQYEY2o3/fpubW4nUJP7Co?=
 =?us-ascii?Q?UaGEMcZdBUb3H5SCnf/muMHiRI4r29DwKduMPAMKUeyDKYxhY1alc0q6jkfC?=
 =?us-ascii?Q?b+AgIhn3u6e6SrO5nO5oepk+3HNXaUIgaWTOJUv9s8Htd4266yc3ld5Z4sNe?=
 =?us-ascii?Q?gFi8kY3bc5JiwBd1lc3L8uY9nXKbDUnqaC0HXbszl1BRP3ZstjE1R0gDDswV?=
 =?us-ascii?Q?sLg5WwrAzqXI9CZk8V8B3Yd7u3cpW9uEYjWZR5RUcawDogoKZPp1UPoSUhp0?=
 =?us-ascii?Q?1A976dzgoTOyE82YzrE1ksKvFYVLzj2eYQdxoSgBB9wLUj/eknY1M1knhKTg?=
 =?us-ascii?Q?wiMyowtIksryH/D5TnoeSWZiiZ2fXeQVIZj+uMw8qTj2SfZ1V+4GMrojmgd2?=
 =?us-ascii?Q?DDOx0TIsCFSrYSzS76/lOPI51bd8dZdtwYmanZjo3mKXIws32KHm+r3/5nrg?=
 =?us-ascii?Q?aGoLcQq+11B9m9UnE3Sx7CZ5QMK2Q3005FxbQkAxNjSo/p/9Fucl3fNBA6IN?=
 =?us-ascii?Q?WPJJtFQgH97Y7V2QlwPtJPyDky7CZIE6756eXyFNB6TPySsfM83KJOFOJBjW?=
 =?us-ascii?Q?STBDNLzU6pt3+gzkRUgRK72qRV4jsRM2ThM8hRy3oJaSz1J/Y7OECWnJANVi?=
 =?us-ascii?Q?Fiw0UDroscWuCqWVey88jUy0g6ysOAeTd7FvhtNreu7ekK7RUBp0CryoSiOR?=
 =?us-ascii?Q?cIMhwuEf0XVoxd3OyiY24VpsvrYFMs9lBw5tQUUqTdq9G665qxQuwhVgBRKC?=
 =?us-ascii?Q?aO7hk5bxE83O/wbZ3mq3n1vW34vSgLSzdVAYm0ejySEdWsqI4H10fqqy0PQh?=
 =?us-ascii?Q?G4ys0+aKGnqELpNij+7KSwLkaGMfDvlR5RMaOIh3/gtGUfo8+IrBLzgrK8dB?=
 =?us-ascii?Q?R++AJzum9MKVI9QcMXmaj3fxj2xTN5t2SW02OwnVHhbX4gf/wz5Zl8QfaMCh?=
 =?us-ascii?Q?lxx9I10CNEP9Um5kKHC8VNKgNJxbznAJMAUexgAZpqnr5jHN5nrA5Vs85bxf?=
 =?us-ascii?Q?5XIRPSRrFq6q7Gu28KttBknzeDYeYc4TrElZtssJOFkuYOxZ9xetdSTXzHMy?=
 =?us-ascii?Q?aNvG5NS2dWVbtxK2iVLQd64aSxHRoytyaBW/bx1IL8icIziilJDY9wuUulQG?=
 =?us-ascii?Q?1kQh5rbeI/FDU/g7On2bxtEkTFQr9pKmC786tIYcyOxCrlD3O265HXmcPXgn?=
 =?us-ascii?Q?Hb65TxEZg8SUdkzp6u1dUNafy10f3LAtygyzSsnXqURNa/U0TsaGditzJVmE?=
 =?us-ascii?Q?v3syVf6k37b635wOZDp4ubm2vMIWqwQPsxx1q13oRpIuUIHJ1NcyppPR/Dsh?=
 =?us-ascii?Q?3qRyLQiVIyOB7hcb6zMimdzwT9KveOD1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?njA2+kZTcGI3/w5mlnPZ2HkFimejS2BryaA3mQv0LKIZKFp0auuMMYeRZz39?=
 =?us-ascii?Q?dh08s/QHhI+OZeQSbaBtU7nfA+3RuI3Cc61c1CvzMR+YBP69ITN8/J/9C6be?=
 =?us-ascii?Q?/HLQMnjIG40ep73pf7+yKItOIMzX+lfHX0ommMOxXf1hI8WZLk7QnnTn+vYh?=
 =?us-ascii?Q?+P8+JywCYkD09hgA518fe6XjyhUoEuXejh2p0daiGa87z1VvlecAFEfRFafh?=
 =?us-ascii?Q?FQT6WEm7zAsvlc50GHt190WeAtKRbuZ+k+40W6uKJrZlk8NyLsQdWoHcvWPY?=
 =?us-ascii?Q?HaTe64yKnKQHMbqvT0TC+O7ivqJkEShxbcg/wqZ5ksDNtWPc0rdzqCgBjjbH?=
 =?us-ascii?Q?QoKJ2J6pOn4sC2C1SplYJ/aymH3QbrWWU16t+vNkVrIn8s6CuDw2vLGUvKN0?=
 =?us-ascii?Q?0G1azjq8YNbFUBadQTNxrJzKLB9T2e7f5AF/c0ouNQsV6hvFPDhZWE+8qia5?=
 =?us-ascii?Q?dIfD0WgfBr26MJHZFCnWsvtKbxPT79scNryWQJdDpY2HH7+dPZbl48VO0FoI?=
 =?us-ascii?Q?LXWn6F0tcqwIWYGHRQou3P60QtgZKFroiwcZpuxltwiN/EJUAlE03WYNhDHM?=
 =?us-ascii?Q?TN2R4Eb509dkffbigfeTrLqrp41oTyJLuxmyoAS9AtYU4N7DsCxactJa+tGW?=
 =?us-ascii?Q?hKuB+VsB4KrIGAi7QHh0+GKPoUU4ieD0TL7wJO8iMJsi3nMggOjSz5mV3w4a?=
 =?us-ascii?Q?036lcFuDTKJ/zlVJ8sbKKyPpnR5rbjQNTwzp8wJsFKm+9uRNfU/Eh4LMlgK6?=
 =?us-ascii?Q?+XKuHhY+EihIlSqFX0aYW3iPh6TsQvX/HuP7W6IY26AUuGECI5dkAv7ukM1E?=
 =?us-ascii?Q?XOw5S6LpLP6GIHO/uQ4q1jBFRaAn8f5mUlWAeg65HUAASaPuU5S5A+f4KBYD?=
 =?us-ascii?Q?htrkIAcUVnDHdU+Y70HqdJiR+YqN1obzn93FfeyZ+A6YI/35QlFDpV6GPr1S?=
 =?us-ascii?Q?vASOJxrfnou3Za/b0u5PiTYpMRWZX0ws2RfsHA91X9XS44WFYtapByTvWxnY?=
 =?us-ascii?Q?GTEvkM91ajPyN27reCXR3Yj76wSq381n31GWmYLmtjxaZ9oj9km3tTC2AyC7?=
 =?us-ascii?Q?It4gDym6id1lhFD/LwEcFdGvWEzafUmg4W7LXflYaeHiio1VyKds8X7ed9XW?=
 =?us-ascii?Q?d1CDxP5mhe/ZhDed0uPVnupq5R+Ljs79pmpESZlgbNB+y0/5MCACs9yfyC9+?=
 =?us-ascii?Q?V80jiupQLdCcZr0uDnAEy9WBzRo7r2MaRbSCRDbvw4zGcaHv02jK0j+psA09?=
 =?us-ascii?Q?LqGTN7/pDJuZT4qAztn6R2lKteQoWYCtkV9+UmDFJ9YQEAsyEKzLH97iyXlq?=
 =?us-ascii?Q?cSgF+In0sVCUKOInYtkn+Fb5iwNG0UX5xP8ZzzahPsnNOjj2Y6txywU/2Fme?=
 =?us-ascii?Q?EkNvZR+Uz7DKRZdxg4yhnhbrlfKVOgwOaSE0G3rqnR2+EyvSan7zIWqt9QFD?=
 =?us-ascii?Q?XqKZf+UuQiA/NO1lpMP9FU0u6V8PG+kX5oQwQsqXZ8KtNYQnjLCTGsPz7fN5?=
 =?us-ascii?Q?C0VUw2+1FkKB9W+LiFTIqOPkuw5ycJtUtmMqFils3y/Svonr3C2rJe5Or+2B?=
 =?us-ascii?Q?Ui4GgQFn+0ztTSdasuv797EsoMqZ/sRHeFIDFcYE?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daffb774-e839-47bc-25b0-08dd5d5ae643
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 09:31:54.9886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6c5Os+fpIWsG45jHFjBiET9rv20Rjb2joWAcswJ+SXDdXlEXzJKYy2L69C2MT4gtbRnaP9IfoAuQ3EnUVSJyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10443

The function mt9m114_configure writes the configuration registers of both,
the pixel array (pa) and the image flow processor (ifp).
This is undesirable if only the config of the pa should be changed without
affecting the ifp.

Factor out the function mt9m114_configure_pa() that just writes the
pa-configuration.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 49 +++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index b06003b69f6f..9a49dab65180 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -789,39 +789,22 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	return 0;
 }
 
-static int mt9m114_configure(struct mt9m114 *sensor,
-			     struct v4l2_subdev_state *pa_state,
-			     struct v4l2_subdev_state *ifp_state)
+static int mt9m114_configure_pa(struct mt9m114 *sensor, struct v4l2_subdev_state *pa_state)
 {
 	const struct v4l2_mbus_framefmt *pa_format;
 	const struct v4l2_rect *pa_crop;
-	const struct mt9m114_format_info *ifp_info;
-	const struct v4l2_mbus_framefmt *ifp_format;
-	const struct v4l2_rect *ifp_crop;
-	const struct v4l2_rect *ifp_compose;
-	unsigned int hratio, vratio;
-	u64 output_format;
 	u64 read_mode;
+	unsigned int hratio, vratio;
 	int ret = 0;
 
 	pa_format = v4l2_subdev_state_get_format(pa_state, 0);
 	pa_crop = v4l2_subdev_state_get_crop(pa_state, 0);
 
-	ifp_format = v4l2_subdev_state_get_format(ifp_state, 1);
-	ifp_info = mt9m114_format_info(sensor, 1, ifp_format->code);
-	ifp_crop = v4l2_subdev_state_get_crop(ifp_state, 0);
-	ifp_compose = v4l2_subdev_state_get_compose(ifp_state, 0);
-
 	ret = cci_read(sensor->regmap, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 		       &read_mode, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = cci_read(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
-		       &output_format, NULL);
-	if (ret < 0)
-		return ret;
-
 	hratio = pa_crop->width / pa_format->width;
 	vratio = pa_crop->height / pa_format->height;
 
@@ -853,6 +836,34 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 		  read_mode, &ret);
 
+	return ret;
+}
+
+static int mt9m114_configure(struct mt9m114 *sensor,
+			     struct v4l2_subdev_state *pa_state,
+			     struct v4l2_subdev_state *ifp_state)
+{
+	const struct mt9m114_format_info *ifp_info;
+	const struct v4l2_mbus_framefmt *ifp_format;
+	const struct v4l2_rect *ifp_crop;
+	const struct v4l2_rect *ifp_compose;
+	u64 output_format;
+	int ret = 0;
+
+	ifp_format = v4l2_subdev_state_get_format(ifp_state, 1);
+	ifp_info = mt9m114_format_info(sensor, 1, ifp_format->code);
+	ifp_crop = v4l2_subdev_state_get_crop(ifp_state, 0);
+	ifp_compose = v4l2_subdev_state_get_compose(ifp_state, 0);
+
+	ret = cci_read(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
+		       &output_format, NULL);
+	if (ret < 0)
+		return ret;
+
+	ret = mt9m114_configure_pa(sensor, pa_state);
+	if (ret < 0)
+		return ret;
+
 	/*
 	 * Color pipeline (IFP) cropping and scaling. Subtract 4 from the left
 	 * and top coordinates to compensate for the lines and columns removed
-- 
2.34.1


