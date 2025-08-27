Return-Path: <linux-media+bounces-41207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1524B38A75
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 21:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF1A7189C554
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 19:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B842EF651;
	Wed, 27 Aug 2025 19:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y/8GZvKD"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013022.outbound.protection.outlook.com [52.101.83.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149472857C7;
	Wed, 27 Aug 2025 19:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756324181; cv=fail; b=MxUDz8SDdJRKov1mOUlcIhOTqrAtH8WymiszhxduxYu9kDhOz272ntgCozbxIyXHnfDt/7yZVrwg21CV5xiG+/FoQWJ8q/ssqGvN/7tiM6985jNtX67FbQElY0dN8kNJ68FP31CyaXxMNd4tBl3+YlWgUk/s4jY7+HWvc9EDt9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756324181; c=relaxed/simple;
	bh=e8owvCjM9njosaazUDt5kCb3PY54ub2bjnHSI8TOtvE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fsX00455mi7Qyx8I2hEqb2JqK1yEfqvtfccbhIR4Gq6F64DOdHgWm3yqQncsK3L/HSnqUfVOglIgutVms/+kHJgve+AVdzQFpItBrbrE2diTBfwPVb6nv0/71OlUDLMMxU3/AkmbGgrVAl9Cc3R/bckDnsTLMHrsdBqukbpbXr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Y/8GZvKD; arc=fail smtp.client-ip=52.101.83.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+5upV+7X5hUl454yctiR4rW07q1/dL8sCuIUdlQnVtgo28iBEomL1bEtvSm/JvzaiHnQOMQNmYMVCjeWNY3mh6bcfm1s19UDPXmR+mDPCOoERcyTfvToVFpT58LehtPrmTbOZ4dv36aCbIeEKSccIr2sO3kiA8HfPUyOObRQtV6FZGaWVDID970Q7UM9ZrT6NJx/pUEJk38mfMZWVnxfsHK9mpcVfTu09h3ZxUO/91w8PUdpO/uAnzYZpaRLuHax89EwHZ+tvyiKkvmxsmZXN98RRlTiFp4S9XoTmd9EKIl7GHdhVwCp2AmwduheqqAJQyptPQilXPul1DbCzz+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSyJTCE4RJm57zd9EED+vb2BQ3pk3rkTdGLpnoMVrZ0=;
 b=iK+TowJ+Fx6QhM4jKN+2WR5tmJt645zfe4JekqDkjG4f7Gx4zluVgcYlETmx599WprYICRYpk2BM9c9WQkY+RtLn781tTO4fPTynnJVnMPItl5mFx0e2jvCifKwenGnJKNX9QZ62/fvmfzjOLYiAXdRCcYrIYmYBFTS7D4ol6YIRYfQnPeQJvu1rIO4yePYSSOhf19baFsC7WtJfqYCFiUZ4HzBJnlwvwyZHfgEHDFVRG4qM+pMDxS2M6UdAiPClitwaeZ+KTRw2kOPp4PxvNLmvVKxM8HSp1gdVhGCHSrY9+X49DkPxa6Q13vn97QFQrjAERUOZpMBrmCHgSY9Q+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSyJTCE4RJm57zd9EED+vb2BQ3pk3rkTdGLpnoMVrZ0=;
 b=Y/8GZvKDCRX0JdbD/1Y1BtLvxi9pKk7O2RMzU8dRJi5pdssgXsRYyw/zPWs+1cojhEaI/JFwZS4lKDO8rbhstDyLvfgGs/WvCdwxbBUJOn3I/6YycHJoGrFjR/ScJ9+9vVVrQRMrlYMbnjdcLU6dk3asxR8Z/Qt4M8zXB14KHL/z2yFvxxYFZUK6efTtneqjAmWDEtuxvbXDuW2z2kSYrFQGgVdfzte4ihWbhCryYZ2UDTmIG21xPcL/Q5p2N1HAy77tv2xNdH51lCUmPBbcBVYGXuTk94lrSwCIyl64qp8EwFZtWAdNXWEiXWsi5mnu83lH39x8DlN3dmMeMacYQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM8PR04MB7828.eurprd04.prod.outlook.com (2603:10a6:20b:24e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Wed, 27 Aug
 2025 19:49:35 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Wed, 27 Aug 2025
 19:49:35 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org (open list:OMNIVISION OV2680 SENSOR DRIVER),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] media: dt-bindings: ovti,ov2680: Use unevaluatedProperties for endpoint
Date: Wed, 27 Aug 2025 15:49:18 -0400
Message-Id: <20250827194919.82725-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::14) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM8PR04MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: e50f7e80-c262-47cf-5bd7-08dde5a2d978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tfjl6rne1qI6o7VF0DVCAejb+n410Fwmiqc358g4zSDQGvzR9KralvioyVxW?=
 =?us-ascii?Q?ZGDipPbkJ6ivppX/mlZ5UCBBCFG/8W66JslI/la3BznyahyBL3c68kBcfO5A?=
 =?us-ascii?Q?mEUWc04BhH5pF9gPdWbjrY4a+yguecpxgVWJxZ8tLqODXfdzndB2MbZBgdfG?=
 =?us-ascii?Q?yrVVC0px0irr8ORrkHlwQ82WbeOLgGl2aDunXO6W/Q8+3WvfV90/O3TO4t0H?=
 =?us-ascii?Q?RlAnZR9BrSLxiVr4qtsmR4iOhCM70id8ervLpfcii+N+LYAV2cPjLIZfW0wZ?=
 =?us-ascii?Q?bCCYbExaa9eZmMVjq46+g67VFp+qS9SL/plCyFsGLmmVxgMuI1zRue4m/s71?=
 =?us-ascii?Q?7C6PS10TQBD48u4vybjPWFMhOO29BbNqWetnhEoF1I0+Et7KX/bzP4dcyzDd?=
 =?us-ascii?Q?ubxG35lf2eycjArYTQX3iOryDeD5VKmdm8EbVDas71imHk4jd1DbTD0EX+1Q?=
 =?us-ascii?Q?RQHetmRF9MlRZEP1eiCoyjr3e8TpvyHscAOyjEIPEtNyo2pkUdH4OzDst838?=
 =?us-ascii?Q?/PcaX8CCimfkFjxrfDCDRvLDJGlw3UeGsE/fiXcfmtQHdEWv3jS7XKJko308?=
 =?us-ascii?Q?hoGg1clt57tXnjD+21S/jk33YFd2xVCxqOv9l7gegwLv+HNEiGg7/j84ttAc?=
 =?us-ascii?Q?b3GLSPhh0he7F2yfmhfi72rrlZOYci3qQSYjTzh6QB87rMilgZGiLcYLpDYJ?=
 =?us-ascii?Q?+v7rQmeSfP4omCyinMMcYJzlL1Umv8tqQ2PCGyUyYSBj4UgU3oSOU8cU5Fdy?=
 =?us-ascii?Q?r6qNZQtK5agn0VswkBjtgJV7jPT5LrC2Yl/1jHZQQLxvFOPKY8OLhgevnLy5?=
 =?us-ascii?Q?WzJVZHcvbFFod+V2b9p11ACz6+xVgTeB2K0JF4gqkBKskoJJJDAOgMrbLqfl?=
 =?us-ascii?Q?QuQmvxfLvP/Wghr9ag8jSMy4CZ0F4DIypZiYU3qSIT7gWwWWUlb4hXqMPKBt?=
 =?us-ascii?Q?XYTzb/lKDr3kDb06/p7LJF0J2bqRet8XMpy9ZNhCY5Rks0vY2ljVzYI8aiPf?=
 =?us-ascii?Q?RXwlU1/dJJNL+KOq5S4/jeJLmCcIBpvyjO92971TOVt2Lk8SuPsRdTEDZ1Yd?=
 =?us-ascii?Q?8kAWzdGtoJdM3S2X56e1E5Tx9+xXnAu5p2IY9S/tF27KKaEXOHFfJlLeXwWt?=
 =?us-ascii?Q?Y4FAR2VjbW9wEMs5uecsS+NEtwy6pG1glhK5r2ZZ6ZQaux4P3InY9e9k+mdH?=
 =?us-ascii?Q?UAKIl1ngrBcvmw1BneW+zjbHL4JDFBCLB5J74Ixc/ZDctYvIr8lQrn8C5Tm3?=
 =?us-ascii?Q?PGWm8ae/dvbql6xVQvzcqAsvAyrZl92+CnZ3P908gOzbUTOLPGkFbVmfP3Gu?=
 =?us-ascii?Q?LPk22as8SXNfNY1gvg2exQft4P0smi0on+YDSCaH0pr9OwcPb1pq9gjferBl?=
 =?us-ascii?Q?RvESYlIjbHNx2TxOEFn1j8krDaNNZF8UfKZu7BbXAzp7c0lybTkUAMTmmlbZ?=
 =?us-ascii?Q?dcQ3V5EMRcw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eSAgMLssilnalbjEHe3eDIRUkIb0erg3oQtHbw4aIUQSkrD9/dV6CML+FMpr?=
 =?us-ascii?Q?r5W+FJWeneTvtC1B5RCACC2Bevc4WqZ6EDR5sj+CwgcO2EmzBZGWkwHJweCF?=
 =?us-ascii?Q?oU5MwIcwih+UXw8CcKadAlJTqGcOn3AuEZQxUyFIddz2Zdxv9kTTJoQqHJLQ?=
 =?us-ascii?Q?WKUU7O3ntwQgobWYj7WMlqZI254i/lI4bwRm1TixIw/S5N77Cmi4Azmo0Yit?=
 =?us-ascii?Q?vkEVZEKIHIqFzoDIRqOipnfH3FZCSvZTc+Jk1tSHtygIJYqqHegM1nmTTd+C?=
 =?us-ascii?Q?fp9LbJN+qF9YhRR8k9B8l98vU17FfRjkmRWMpJkIMjrq9bNaRXRTmDiN32zZ?=
 =?us-ascii?Q?pcMS6UjNCSLZdJHkKT/4IisZryTEAhQMklJeJgVrnb8PNk8f4q3SefL21oRz?=
 =?us-ascii?Q?QnyjQHDNaiMhZcZx1/2bshkr0XE8RHH75m8OcLMDy+6Jaj3E75uGrPLSUPGt?=
 =?us-ascii?Q?C0IC4COfoYgsbF0EuFgnINGXtCab888QQiIUEAbm43t7EPzYDmFB3dNkOJX+?=
 =?us-ascii?Q?RuwD+Jcrl0b7guyI02nITkGtdrV5NlI3fjyfhapNNtnyau1WaMdHg487fbTS?=
 =?us-ascii?Q?6TysjNg6HxsxDFniEZpaz1b+GDRT8MHKfLPu+a6At5fjOhjg9EHzSQcp5+mL?=
 =?us-ascii?Q?szWfLlGuSKQ+xufm9B4c62MT24VM/P8VI9k+RkoBXeqVn+uNvS0aLXWSfjTz?=
 =?us-ascii?Q?iJfZsoPaer+KdmrCufdiPvat8FQuCP7UJorsPpJZQLJZ8I8KWtluIwx/QBh8?=
 =?us-ascii?Q?lz5FJGoBusnnannHFGZLQ8Ifaa7AdkFYh4Vy0s7S6T8bUnYEnyfcCv1EKqpG?=
 =?us-ascii?Q?heciYiUrX//OyJcVixuxP9gFLvnhBgKWuHnkJ/VBBe7ZwVLyvUImQe1jV6i/?=
 =?us-ascii?Q?iYsKJW5KU5mu9w+48rAgS1wdpq2JBGRYuJP/MieI5BMz1mJH6Z/JGkKaeNKD?=
 =?us-ascii?Q?V8717VRIzodDwERjGA6VXDsLg84FWy6zN3z463khlGquKuZHATL71Nddbi/s?=
 =?us-ascii?Q?9V95RwNPzDYH+Jn1Sg4OHCYuiZ5LHyt3wCnoblXJG0yIOOOq4nnT6lakW5K4?=
 =?us-ascii?Q?2EaZojflGjaxmBM4q+QFNxr3fxnJ0jH7SwzLaydLh/9Y++yVGm56/YR2UDDV?=
 =?us-ascii?Q?J3KDFC/CXIc/OHP+60KP4vtJEJfXpAc0YG+iNY4hTdxpQFE3YqzftP3cY4XP?=
 =?us-ascii?Q?Xl5ujrvjpH0CJxOGTqfnebIuWTi8B6pEtVorVbiEaB5ViV2IycvBJgj+wZmJ?=
 =?us-ascii?Q?3nVcKIhnRNoAxjhgKwvQ9IUFOjWgvcYeDDo9cj5dCDfKmcooh53WUHhYaUL6?=
 =?us-ascii?Q?2o69IalfDJpyAOOcwu9Y9QA3m2lUZIZ6C5lRj4FYnQy03sFYfA/LHdrPk/z5?=
 =?us-ascii?Q?x2X5Gi7PIIhMENe7uiXpc3fjIjLv4zOE7XL5d7FXoLDi692f6i+tNUOvDxYr?=
 =?us-ascii?Q?jEbRAbDdnC0J1E1UVw8CNFt5VYbbNW0z49e3Sb7RAEvwK8h+GY8RANuYiBnv?=
 =?us-ascii?Q?W+i7gLlhVKWG/VW2iFVttvqHO0+GgPuJucQ8wfzOHp8wiDhIkELriMoRHr53?=
 =?us-ascii?Q?I5RaqIGyYcnEpsWD0knnbSD3fGP4PnODQiF/vTgp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e50f7e80-c262-47cf-5bd7-08dde5a2d978
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 19:49:35.6515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wztGXA98p1AgqcTmcvTia0fSyR3kYDJpnMxyv7ipI/Fnu5qZ8CrmkYvpn3MvhojyMaxwMQm6z3dB9a486zj5RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7828

The endpoint ref to /schemas/media/video-interfaces.yaml#, so replace
additionalProperties with unevaluatedProperties to allow use common
properties.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx7s-warp.dtb: camera@36 (ovti,ov2680): port:endpoint: 'clock-lanes', 'data-lanes' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov2680.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
index 634d3b821b8c7..ec5c40684b6bd 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
@@ -58,7 +58,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        additionalProperties: false
+        unevaluatedProperties: false
 
         properties:
           link-frequencies: true
-- 
2.34.1


