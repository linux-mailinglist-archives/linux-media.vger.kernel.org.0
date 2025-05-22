Return-Path: <linux-media+bounces-33157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E34ABAC0E63
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F2EE189F0AE
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33E328E567;
	Thu, 22 May 2025 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="nd4WQiuj"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DF828D844;
	Thu, 22 May 2025 14:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924596; cv=fail; b=AA6IzelUgyBE6OEFEFWu+P1PXEoQjLu3Jzw1bWqI2yAlAr2N+h4gJkXbr/OGFF/3aQjkaStdqcBE6M2/Hg2JtjmSioAIUjdyqZH7Gxe4YtQZAHyRV/BpkmHVjM4y4TwHDQriPnfg6j95tawUsDYgTKFn0SnW+VlcEiBKN+V04WE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924596; c=relaxed/simple;
	bh=PtwewO3aSQLZ7VyBimnpgEkU0ZpMJ1lwStOvh/AbqX8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NNS3RopyOxVQB4t7kLqqbyVggGUbMCHghdsnGL3CdNSebIXxx7ePqbEObz+MbO6/61fU+obuoRMeL9vF17qMro9ilt/ZekbbWkHkyoq+crOkcXqGJhDBB6qI59pthfd3zyXYEflspV75iRM1TQqNH2uBqXTp9VbLXCggi2teVpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=nd4WQiuj; arc=fail smtp.client-ip=40.107.21.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLbonfZRRhT28+IkPJD7UFW1acHm5xsQ8TYBvzgcA3lsW9wkNWM5ov+T9vfcrYzTt4PlZrZQEb7RNlbSQf/mpbghIhE4/OWx+TrC6EXMmINZvYRlZ5wmpfG5IwM3wKA74lUhuuXq5vir0uhcjTYfXvy+9VF5wd7JyRSpILrbb8vbyrlYvcnv3Jm2/OUGF6lutKb8DBnycFiKZX7nTs61HBoYyB++gxJwN28/1FR6pT8PKCMyVidwLluSgY2y+tBdXNMrxDWM7P9/OqaoZCUV8wAmywdt8iZD7e+ICH6iRjYkU7u3bTPP5CyZ1C+X9lZUwgMBbqy7h2BJva5ldhFVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZ57eQBoB2f7s7tIlkzOfXyE1kc9Z36D+uRS6bnHkv4=;
 b=GbEpIyDVQ6+uwzrb6dMgNK9FiW/hB49gtFsMd+anIzGFc1tkKx++alNvStq9UDH13HGwJEM9eyXHgxO35f9Y13yhgwD3lyAGy9E4fzx+8vLxDOW1DdCeGiIiQ19pjPG022w0+kyUyDkM/2ZvWg3XEX9lattGq1Wh14ky88H4dsCAwio7fRmfMbxSHJD53bXXLjOV7z35AiLJinv9uvm31DpsVKrzOUdFGG77O+QSQvrsMHC6kEfcRqLmWo8MxNJ1GrknZj1AE+KRwyiDlk9nHr9+7UwNJ+mjZBZFp9/qaf3562fgKXsiJHmtocmhQtk8AWaGY4D0CzX0PCKwDir+cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZ57eQBoB2f7s7tIlkzOfXyE1kc9Z36D+uRS6bnHkv4=;
 b=nd4WQiujbJZ+2kDkuKg7O/x55Q0XY0BNjM8n4qUOP9bbrmTkS0x1Qnouyf4U2mI3LffdnXfxV0Dln2G7FPI/aJR5r1KmW33W88u8dXQRgajnoW0Hhaxft9s6PdWfg2E6l3I/Qce5bAaxJEKzXP1m2O/RfAsnh57yuGxQOOZnF+Uqt4AiSVnJEfc/JXPONlsICYCC2Ct1Qzgp+cIdkoHKUtzJMAOrYc53w95MGyomNCvfM9V3DFVhj7g58hWlsx1Uwwlo5ABxvU5OUrOcIBlFHcPjxLdBT5BCLkIIlCj767kaHmcF2JAD/w+4pQong1d52Y4FPxSl/r+bhQQAW1rQNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AS8PR03MB9912.eurprd03.prod.outlook.com (2603:10a6:20b:636::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 14:36:31 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:36:31 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v6 7/7] media: mt9m114: Set pad-slew-rate
Date: Thu, 22 May 2025 16:35:11 +0200
Message-Id: <20250522143512.112043-8-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522143512.112043-1-mathis.foerst@mt.com>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0182.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::15) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AS8PR03MB9912:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc942b7-1fa5-42be-e208-08dd993e0b38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?duJ8Bb/ruPoKtfMAIlN9JAEAtkJhB543lJzersycVGKIW2j5IQpRKn/aZNiv?=
 =?us-ascii?Q?UvZtUBKC75Ae6iUCqK+kWhczrpNq2W/pgW5+/vw4tJ4I7pHHlBgOk3rfZANk?=
 =?us-ascii?Q?qwoeR0hvUFxsmF9bkQfdigcGCxbAqaiZXMPuzA0wSGft8O8gSzeiFOb5l2xZ?=
 =?us-ascii?Q?nmuqA/yK5gmTRCfwCH2hqB1cB3REhknE+JnY7+L+0K3awyAm9yzcDHS01+Qp?=
 =?us-ascii?Q?UtEfGoHTkhGgHtKbz7LElvjl2SuKGjA36ANZd/6SwYMpjCJlf88f2fu0nG8H?=
 =?us-ascii?Q?DXNrKEzxspxCBSODW+3ZW0jXFQuGiG/ZvnJZMGrzRwFhzLIsfEZ3MfsXS3A5?=
 =?us-ascii?Q?t7lqACdWRXCPkIQwb6N7mdGtze7GogVL2wKW0b4EHVl92wmZi+q8AldjRBOw?=
 =?us-ascii?Q?jzF1h7I9G6xj946kCWaEwt23ftnP9ITe7YlUzb2I9Yg0KNxooT5DvEKs4b0m?=
 =?us-ascii?Q?NkUdf35ZHZLvorc0H7Nk68xkzW1GdKgMG/2DdMgthPUJ2gYVce7E/0O1OjFR?=
 =?us-ascii?Q?DPa2w97f6w8frxMtXNTtXaokeLjGI6u8cciMewXUp3tlUeWdbOGCpUC4jBHn?=
 =?us-ascii?Q?1TuJ3Uf3WW2kGzXDJOdHPSJMSRaLZqMuCNJ57lFYb6Siyx6gZNn0JeuvgLDr?=
 =?us-ascii?Q?d8jwQxBploQ3aZxVuCNjZf/jKFSOYaLBOmIeHlPop0t7sKFFqFKKtjDTByw3?=
 =?us-ascii?Q?zRLEXEqjkSrgQZ8KDipHYebNoZatH0I4InQ1rjjb/HaYZwJvXcBviETr7Zpm?=
 =?us-ascii?Q?0SUi4FVdrEEVG2CZ4TyojFg41oixPBunFy+Iqj1dot6y+VoxNrbzQdeNxuFO?=
 =?us-ascii?Q?DAJG/+Onh3c1X4jCyk2hkHTM/eWSxTiDCWQcAhRZvS2LYEqSVUIfdWGtpV4+?=
 =?us-ascii?Q?6bl9nuSO0ZSaCKynVqGWjpEdi4DbUD2CBlwvpmK4/aOPxn00eTxo0yZ7c2bn?=
 =?us-ascii?Q?+5L/shEpZJJMebrSS6XkoMnti7uyZvy8CQKV0F6SUYaLiyBrwID2MHGH/SQm?=
 =?us-ascii?Q?PNyqi9KGWisp+Dehvx7cMZDQRyFQJx3KEWBa7yo6KROw5cOlt3L4/RXa/4Je?=
 =?us-ascii?Q?lT6CTQVi57NNotqMlcXGkgneEXDGL5KWe+vH3lVps8hUihmspgtGeHKTlYWg?=
 =?us-ascii?Q?xAnFCTfdvXMCe1RSP7CfRJJm9tz9/kTCbLLQxl3DK6gYA5P4d4r7MoAnm6p7?=
 =?us-ascii?Q?Yzcx/EJCHliYGMjNMhFm/BqIN8QFDNR3dk/y/J6TR+gv+Gw2McVBoNjLebwr?=
 =?us-ascii?Q?xmPk3AiWHvN91J00Y6nICsD3LX8YWg8CwePhNKcXRneCmhpQbHeQLWh0iW7Q?=
 =?us-ascii?Q?3DmfsRfmaZtyYhONPdMqlZmVNE8nSsC+K6V8TTYPTqTiAdiz12fegG3waTyE?=
 =?us-ascii?Q?36XMFCLEfisR6YnrjV9tdRELxhbhQkIZU4Bm5f3BOgOhcrreQVtYAG/n0QUh?=
 =?us-ascii?Q?lM2/RaG8KN4YzggQ/PqAjAQiWb+Itauhp8dlyzobdqB6fCqJApQt+w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NZfxVcOTo5odOlGD1qZpfaTaC71Q/swU7u4v3CXxKby4xy1PjgN46Yvamixh?=
 =?us-ascii?Q?XMGMHp3KcPMxEStPxcXFeJtCOMbtsW9IoeCWD7/oSVgC3DwCwsXn+o1vXmQE?=
 =?us-ascii?Q?9DBLaz7U2NMr58Lt9Xwb1myT0+jxWFPCKUFSRJrYVmC50EKPmrHw9JnCAViT?=
 =?us-ascii?Q?mA7z5NKfKFNah9JyfQVDbtqmsQKFlyZDWFl4NOWlmmhy8NgvC17PqVR8P56k?=
 =?us-ascii?Q?B2RkAjTUHGttXtHYxd3/23Iy4meJAIJalnKBIF665JO8xoheFSnXBQRRbtwP?=
 =?us-ascii?Q?KNnEQPbvOkiKip3v+f0DuLyQhNti1eo2xEW7WtU/z5yK/Xjgu0BrhrW5LDq7?=
 =?us-ascii?Q?a35WMQnF+7z8kISc+UsFidRcZlIWthbAt+VKwBb7gJwpp9SJQFaKMlYRAOPE?=
 =?us-ascii?Q?/WFKti8A/H1L0rz2XGO8lFDnERP+c3GFY1eXivtKs//61UiNR7bRGc5T7ale?=
 =?us-ascii?Q?d/cte41T9ny4Vw3FnfYgWc1+i96s/oeV7xJlERuQzTera0xtEohr/rgGF/Bz?=
 =?us-ascii?Q?EUOqsJKqXYfNI29CtOn3O97sdfBUpdFYH01zO6crNlIz+EG+ABa7S0F2KP1x?=
 =?us-ascii?Q?IutcktGWKpj+5/kIGZqRRlZn6kjuyZcn2VCjhEsht/xu6Ozlqg/ptyM5qCZs?=
 =?us-ascii?Q?XtsEakD/O193PwSLKKGPnExvndO4zflaxpKVJXM5Zh0o/d7kVR+z7B0/MIIu?=
 =?us-ascii?Q?ID6zSj1fum5MquRq5U4cKn05cT453gdD/Tn3EjisR9jIZ01CGIMKfvmU0Fk0?=
 =?us-ascii?Q?NjU1PEWn5akZmw+UZCxFCoGlfo4JAtdOJJnMuAAsNCQV0Z78WegGYN6D/jyM?=
 =?us-ascii?Q?Vnq9vY1GckKQKAsBZjsEwyaB/Yad+WySxMiMUirddUhwRylrxMQsxCANgLyk?=
 =?us-ascii?Q?QyDZWHgOdP6vswLmnSFrEWHFtpJ06uq/Btjr69im+3vCz7nnD5Za3RmM+AZ6?=
 =?us-ascii?Q?Zn0JWSj9NUTXIu8Ta5xVN+uHs+ACf3vLHP7I792qfR1hCWZCYwOLif0vkoNx?=
 =?us-ascii?Q?p882mvT00vvh9yOyYtcrsOlk5/4Exd5x8a0MQqi9MBZrQoFJuJDSx4REmXrO?=
 =?us-ascii?Q?z+1GlBjVpEp7xtUTUT3/r+S6Ja4fEXMVLi5LHNXqXt02mwu6J5YOTrzq04OS?=
 =?us-ascii?Q?Oma8VOc12t6gnS6JnOWk1O0aZ3ZzYXKib+zvYZqxJxPtMFcRJuEbl0cK1EeP?=
 =?us-ascii?Q?HcMVpbrEZyqL3aX9dRZRkbzVszAw83vmOZTatu1LFhL+iykFrmC0VYAWYIrV?=
 =?us-ascii?Q?G+shTGhDK4qOnaeP0M87CKbjTtzXLkBOo+o+3OBfZRFU+rviEMmxE/AoMK1T?=
 =?us-ascii?Q?wdUyg90PrOmB9F2c85+Sxhh39os8FzZ+JJ5Blkfuj43HK4l/UjI0p/Wr2HOz?=
 =?us-ascii?Q?5C8r8Kjjuf1L0b1YdW6nIXqia1dB5K2raUPD1XmEKK8vYGmmcg9Vw2vk1rgs?=
 =?us-ascii?Q?y8FtUpFgAPeFaZxzpJw/wQSqFml6eAAYX1/dVn6S29YWMIbZj1WR3hQ08xhA?=
 =?us-ascii?Q?Gk6sGMOCkjCowrxKSM2XXKS/FyfeS64Qd6WxzhVFbzqrL1P6wuLFSK74r1Th?=
 =?us-ascii?Q?CxPBYrLhg1uMDfUsW5Hqc6KFhQYxMZEd4uWk2G8P?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc942b7-1fa5-42be-e208-08dd993e0b38
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:36:31.3003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bjZEnwPB2vFHVcC0MwM2EoS0O4t1iT4LbH0pDKV9dQs69vSN90I46NDDevJUWnjvWExPustTTGS0bsMdmrJUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9912

The MT9M114 supports the different slew rates (0 to 7) on the output pads.
At the moment, this is hardcoded to 7 (the fastest rate).
The user might want to change this values due to EMC requirements.

Read the 'slew-rate' from the DT and configure the pad slew rates of
the output pads accordingly in mt9m114_initialize().
Remove the hardcoded slew rate setting from the mt9m114_init table.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/mt9m114.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 9ff46c72dbc1..f3f9ecc0866c 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/types.h>
@@ -42,6 +43,9 @@
 #define MT9M114_RESET_AND_MISC_CONTROL			CCI_REG16(0x001a)
 #define MT9M114_RESET_SOC					BIT(0)
 #define MT9M114_PAD_SLEW				CCI_REG16(0x001e)
+#define MT9M114_PAD_SLEW_MIN					0
+#define MT9M114_PAD_SLEW_MAX					7
+#define MT9M114_PAD_SLEW_DEFAULT				7
 #define MT9M114_PAD_CONTROL				CCI_REG16(0x0032)
 
 /* XDMA registers */
@@ -388,6 +392,7 @@ struct mt9m114 {
 
 	unsigned int pixrate;
 	bool streaming;
+	u32 pad_slew_rate;
 
 	/* Pixel Array */
 	struct {
@@ -650,9 +655,6 @@ static const struct cci_reg_sequence mt9m114_init[] = {
 	{ MT9M114_CAM_SENSOR_CFG_FINE_INTEG_TIME_MAX,	1459 },
 	{ MT9M114_CAM_SENSOR_CFG_FINE_CORRECTION,	96 },
 	{ MT9M114_CAM_SENSOR_CFG_REG_0_DATA,		32 },
-
-	/* Miscellaneous settings */
-	{ MT9M114_PAD_SLEW,				0x0777 },
 };
 
 /* -----------------------------------------------------------------------------
@@ -784,6 +786,13 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	if (ret < 0)
 		return ret;
 
+	value = (sensor->pad_slew_rate)
+	      | (sensor->pad_slew_rate) << 4
+	      |	(sensor->pad_slew_rate) << 8;
+	cci_write(sensor->regmap, MT9M114_PAD_SLEW, value, &ret);
+	if (ret < 0)
+		return ret;
+
 	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
 	if (ret < 0)
 		return ret;
@@ -2398,6 +2407,17 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 		goto error;
 	}
 
+	sensor->pad_slew_rate = MT9M114_PAD_SLEW_DEFAULT;
+	device_property_read_u32(&sensor->client->dev, "slew-rate",
+				 &sensor->pad_slew_rate);
+
+	if (sensor->pad_slew_rate < MT9M114_PAD_SLEW_MIN ||
+	    sensor->pad_slew_rate > MT9M114_PAD_SLEW_MAX) {
+		dev_err(&sensor->client->dev, "Invalid slew-rate %u\n",
+			sensor->pad_slew_rate);
+		return -EINVAL;
+	}
+
 	return 0;
 
 error:
-- 
2.34.1


