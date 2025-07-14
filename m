Return-Path: <linux-media+bounces-37596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA665B0388D
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 10:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8732A179045
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 08:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63BBE23909F;
	Mon, 14 Jul 2025 08:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="Vyw9xqBZ"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012014.outbound.protection.outlook.com [52.101.66.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC95523956A;
	Mon, 14 Jul 2025 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752480021; cv=fail; b=n691apkd/TpatACLThpci2eow+0ZxeUZH6exPMjCbvuJY+gdrRTvk0EuO94ZqQMJ+KsMxxMpB7NV24A/t4pY/NfKcASyf8Qnz1Layw42KVoX4OY/r7681Tp28blsO/5UcCd/pHEAEM88chlMpwfofZ+mdZp+cHJIrPFzET1E3oI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752480021; c=relaxed/simple;
	bh=MAgqXfrQKNq+XudLAFt+hXcB+fZFAa3v7ZGGMoFAg4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F0KKaVtAnc8P8XS1/3CvPAUzrsRDkdqGbXj4nmdEAd8qiGWDcJk5Es9els6Fo5ImCdojImXLzcJCvGO9vng5DEn/Wgov5fiynOTJUOLRYtc0cRsd0rZ/3P6NZgQbI1BVzcaJohnYs9fzY6oQhbfY/BGbZCjWR4WGEKtg//d5o7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=Vyw9xqBZ; arc=fail smtp.client-ip=52.101.66.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCZ83DnR9zggj4gwinVxNwn8ctuI45WrxUHGksA1h3f4WruozbtJXiXh0HD999evFQDKKmoocax302Kt0I98J7n+4thoAZIv00ZeFGTgB+AK5tO3d9TvoV5D4+qWET5BBh6/fJFmUxbU2ibmvIFKYGyMMGn8cO83/JXv92QSImsIl6alFhxQJ+EyXObKlmX4ucqjZFLqIFYht1aE0/pfjW85To7wtK8QdBAGhS/OVP/WMzSJdspOozdoIzCJuEliNC6nTODPO2knzSoQSoqvMpu7+jff/nTo1SbWLw8vqRgbkzMui0UXYaKUsIxZ8xpViga1k7ws48oANaI0KD1uPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4lIUeyrwAJ8V27yL8Kx7miXqXnaOthaBAcO7hKLWjI=;
 b=u1Zqg5C5Zska4L5JeCwuHsaKnVR7vHNaf5KtErev+NqjJqAYeh+t4AB8c6UlQvtjmSUvB89QwLKw0VuSoR8GgJrdBqy89Jd2nnTVpctSZBSP26AHAtK/KmV31sAiBhvQ7bK2h/q8cn1SpE9riQs1nFb1FC93lxo+GhSfc6FlxhVsqjtO1G7rNe+TxxX+BdsWuVV3IX+fi7JkthfgmtGG2Fep898HRusPwumdtdUT/+0F1ZkhOIZA7P4H9UiNPY/sevqMlo6d4C51Gvf9+XRTbgGQK+zH/SwXcg+FTa9HDBmy3dYbfx57ra2dKF9v6kU11c4GB/j8+R+fk4NUuQOMXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4lIUeyrwAJ8V27yL8Kx7miXqXnaOthaBAcO7hKLWjI=;
 b=Vyw9xqBZNnZWLs8z4b3LvC1sxUozKazXpt03lndKKheGwv43Jkyk0ebIJFwPJWr8GbNwPGwtRakyamUT84j+mhJFQj1jikV/KxiDbFKQXeoilYrpJloliVxDmcoml72n1QUClhh5BL/X7YpUfhYnaZssg2T8HYoJ2XMLWNBq+Y5vJN5OBTOO6PRwpIR5wudDo9NiYqE6FhrNBDP/JU9D/VruCL7eF6K0CuP9Jk64ZQkbosEbUe+zcWIm3QFpRgtkgC//UPMOVM3Wt1EDhAme6FnuVbLX+t1TkyWK2KlktMppE+/jQXw5M2j3yF9hHsaW8lxpJ4fq6wW3TSUyvm78pA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB9PR03MB7755.eurprd03.prod.outlook.com (2603:10a6:10:2cc::22)
 by GV1PR03MB8837.eurprd03.prod.outlook.com (2603:10a6:150:a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Mon, 14 Jul
 2025 08:00:13 +0000
Received: from DB9PR03MB7755.eurprd03.prod.outlook.com
 ([fe80::2ef6:ec79:4089:ce54]) by DB9PR03MB7755.eurprd03.prod.outlook.com
 ([fe80::2ef6:ec79:4089:ce54%3]) with mapi id 15.20.8922.023; Mon, 14 Jul 2025
 08:00:12 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v8 2/2] media: mt9m114: Set pad-slew-rate
Date: Mon, 14 Jul 2025 09:59:27 +0200
Message-Id: <20250714075927.511610-3-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714075927.511610-1-mathis.foerst@mt.com>
References: <20250714075927.511610-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZRAP278CA0015.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::25) To DB9PR03MB7755.eurprd03.prod.outlook.com
 (2603:10a6:10:2cc::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB7755:EE_|GV1PR03MB8837:EE_
X-MS-Office365-Filtering-Correlation-Id: 94a4bb08-f8bf-46d3-9ac1-08ddc2ac75e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/Pf+j/nPejmJe95lJDn0APDSCaRTsOMb5zqV1DeBlRbKNuLRODTobxHoVs+D?=
 =?us-ascii?Q?wC0vJg/rWAIURZ+/n6G+PunUmDuESeqZ6xmpEzxeNhxK/4pVUjjST5VtHxuJ?=
 =?us-ascii?Q?nY9uy56TACyqFAhvRO4Myg+X6lJGNUq4SgNnnYpwHPqdxbwuFZ2Ae4coziC9?=
 =?us-ascii?Q?XSyETW6/I90OnArW0Lmz9EnF0nGtkQEmQ7oxlwPrKZ9Iw0kR9FTOG1R+k12J?=
 =?us-ascii?Q?NX5uE4L1sBYnOVkQPZiVhuP5A6pCBDe5B9zxB0DPpt8JzME4XQn8JenM/Rha?=
 =?us-ascii?Q?iU/2AwxNPw1fyF1Rw8tfJ7TDpnBNkI0CmVSvLnDbnsWEpFuYnArb7SmcQJM0?=
 =?us-ascii?Q?/XYifpndosoOCHEm6PAvw5qFR87qtmpVIvK5GAHHI5xAGULPbciB+dnuPYDG?=
 =?us-ascii?Q?GR2yZVYlCdLdWasqnA++LVDWF2ey/K89cdgNRvzvrd4fdgoy9eioEU3sSsw5?=
 =?us-ascii?Q?hoij7rLDhrEDNHYGSx0ZTdP4itxtQSDg9b6roR5z+PrxwvxHT+0g1emdNAAU?=
 =?us-ascii?Q?g3ebwFJdq9ZlwZdO6j4VL3byiHTYlfaSWrIA+V46KE9zM4VEw+UGhFu8dkdr?=
 =?us-ascii?Q?1Un01rDTG/tDc+z4DmqUOjD0/z689u9ThaNXEXZnaC/k7PAXYYaxaXSQ0bOg?=
 =?us-ascii?Q?NE9zHhVXZ36PPhe4nm6u8/Az/UeuIZLyAEa4iEIYhSuarzMFxM9mulG+RafY?=
 =?us-ascii?Q?Y3D1LdS7/RayEt7Uyl1hhmbtsiu1x99S34adujogxy2e8+W4lrmmRG6opA+A?=
 =?us-ascii?Q?J6WoUxS7voafgW84MLW5tU/4K4Npat9ZKNtWsOrFjgb/uyDoUp5SyT/TYKzm?=
 =?us-ascii?Q?7fgz7x1AuWTrMdw1f5KPkLEzEFD/UR3/WVMpU035ZMgDA1mv66PFpvxjSzbt?=
 =?us-ascii?Q?uDEvC50dihUiTDy90nQYTRn9R1BSQgv5asJQPNCTuN/Tb3sdP4eNRjibY483?=
 =?us-ascii?Q?89JmQjiZVWp1bBTAgPZHmdfp1xF9AtdcI96uSV8oh2KeA1T7UEt3VaMW76jB?=
 =?us-ascii?Q?W7KWUsWcYtI4E8gAvxilXuDD8YvyfA+JuYiW9ZYyVb6LjpG4fMo3ZJ+HHZDP?=
 =?us-ascii?Q?IUaBnqB1kcfcQxjWSBrWrcjxv/cIvAcQxGf0xZgHIQI/EmkcZ5EfJ1ibAMOZ?=
 =?us-ascii?Q?yNWluT6JpDpz02Ok6c+LgCwupMsEr21Bz03ERCO4T7SyIz9LtRSA+JNtOAtY?=
 =?us-ascii?Q?9xy5xiPe23KiDXZwn/pLvZ22svG0s3WWeD4srxsVniZoHjM1aJIVbjZkYdox?=
 =?us-ascii?Q?Ze8Zlr5XjXDrNlUKGrRQkF6VLRlV4TIG4urJ2v1/GZ2sJ4hYwrw9gvBAWVtc?=
 =?us-ascii?Q?quXa/n3d6JOcH8BpEpCLTK3LwR/YDpnA5QlETeI/NJMeu/vLA+1xk+DuuUUC?=
 =?us-ascii?Q?H3hg3fFoIBVbwNfdGOlWIZTGkoj1tlmw/+7BjrWyRCxq/5JdI45bvJNsphU+?=
 =?us-ascii?Q?3M73KdsbPwBrSk88Zj7CNIpJ8tp2Bl9qR6CPC0Hy5nHCg/4ldmO+yw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB7755.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E30/GNLnZyUUhTQkmJlPQo41BnR7IVTr2zGnD8TVj0393LhgcvSerKhJZToB?=
 =?us-ascii?Q?Aj5CIRKwWDW6xfWqoWrwlJhhfGsJlQvCrKNBmKQzGf1WHinoRyrPaaXnw9I0?=
 =?us-ascii?Q?LLitflyIwKk/KyhEsRpcTd0KxFkUdGsDHa8IVys6zBCmndzwDgr6OBnMPlw0?=
 =?us-ascii?Q?x1C53pg6qfrRIf1CRihMzp1NsbkQEha9psPWCvNFyP37a2uq/yBeUf4m5/6A?=
 =?us-ascii?Q?sjhD0LGHMRlq72GqmxjMpZ9dxsFEY7OW/Af4SPSIeVDU5YqzdNoOF49/XERS?=
 =?us-ascii?Q?dV8MTvhEpWSPpwtSEJ3DFbwn3U/NPVwJ0i9cfELyLSPGaK3Ag8M7tJYmSb3L?=
 =?us-ascii?Q?A2xmgaMNU6wHn6Nyc9qAe3LUdFddzCAuOpm6+b5moVaOw9eOURrzA0uS6kGh?=
 =?us-ascii?Q?pH38GR0Vhcd4FhQpIsmRGCihoHsbnZZu+BE4qG67EIjFbCdKEVbOxg+FskxA?=
 =?us-ascii?Q?7Hw+FO6x/2uW67XAQfk2IBUvvf5dDR2zbVrpmY3lR3O8JDzK9An1z8rIRVnv?=
 =?us-ascii?Q?76VsvJaElyXfUouCGeTAoaMJ9df58MFGhhlPq2lgtMpq8VDjTW/kEoDNT41V?=
 =?us-ascii?Q?4/xSPoc9WO6upJo9CXte/MG1MQFz9GI625VJwUCvn2lVFu2PhP5ejuXy7gAj?=
 =?us-ascii?Q?YjZVgqoOCtVhB5S7TUWj5ZI1KlcbGovo0YNlMrB5qmifDvyLiyha02xIogV6?=
 =?us-ascii?Q?2WR2MLozA41uVfbO5HXADi2+6ZHsT8ECUNlodRX6zqqoqRCCrtNM63fkqzuN?=
 =?us-ascii?Q?BB9oR9hE2Tr3OVUm162tk6McQ9DGq9CtJQy1JQTi1J5EiqXP6irFGeA7GoFj?=
 =?us-ascii?Q?Bujssd5EdqNEPCpTc8kTqk3QZs1lFgybbf6IvAGMmV0Fqo1anN13GsUdbzmO?=
 =?us-ascii?Q?41LiWEgQuJ1og0tqee+N1di0bZ8xOgrvqi6Y43fJvOMsX+dr/flLU2ELqDUK?=
 =?us-ascii?Q?6RFV7BRdXp2+GPTfW6qpUrcRiF1qNSIIPChoJxDtCdjsSXftPDqTh1wip5RC?=
 =?us-ascii?Q?lfHMG1X+HmagRoERgB/5ttJl3dDW++XTzJaFD32OrE7lT0pQqOmFbV00ZdYl?=
 =?us-ascii?Q?1w+5tyuPB7+SJg8scY0MG7TlbfZC+if38syjbjMGT9bfbMYTu7BW/PagkPKH?=
 =?us-ascii?Q?FfNVaan2CXE5xD+bxNQ1GSfFYSOo3v9TlaQK9ijlDf2trqhhigfnXUQCDMCQ?=
 =?us-ascii?Q?8krpSrNIdpm6JvQwrOK97Qga9bcg8ZVvrtdgKuNqffYNwXwwWcoIctE6q6+g?=
 =?us-ascii?Q?M0vdjvpmAWeBscj/LwHivP+gseyY7lWYCDyANyIhc6bcZFmvi6G9C13tVDgf?=
 =?us-ascii?Q?Ep7JtSax2w8cs+hv5xSoSnyYF8lhTGPn3uC7gaRBfG2Ff4yWCV9beT/8QYFR?=
 =?us-ascii?Q?j4rC3YuwrJUqgmO7CG0pKbLaimJS9/8y3OFU3+MFhRIbB5AhEv64RKWdKQdS?=
 =?us-ascii?Q?RyyEbb8G/ix0ZeRTFA6sWP6MBCy61TAjk9JnEHp1Akgu9ofEs2e0y8Ka79cZ?=
 =?us-ascii?Q?Mp/oYnQ8vDF3qBxaNmsPvFf7zgJqlIGreT1mhOmMX0AdW1RHOpQKGKb2GaVK?=
 =?us-ascii?Q?h//kEzmS2Te1g35jlad+THbNnQchHWtaFmjeHytQ?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a4bb08-f8bf-46d3-9ac1-08ddc2ac75e3
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB7755.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 08:00:12.5686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AE9ddQDZPzfr8ZRO9YCevRlRN3+e6kzYswv3YRXMOKVrYWhPyq/7twSNiSPbD8GvKKzOT/eNA3oIsQnznBFz9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8837

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
index 2020c33cac02..72701112fa4b 100644
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
@@ -645,9 +650,6 @@ static const struct cci_reg_sequence mt9m114_init[] = {
 	{ MT9M114_CAM_SENSOR_CFG_FINE_INTEG_TIME_MAX,	1459 },
 	{ MT9M114_CAM_SENSOR_CFG_FINE_CORRECTION,	96 },
 	{ MT9M114_CAM_SENSOR_CFG_REG_0_DATA,		32 },
-
-	/* Miscellaneous settings */
-	{ MT9M114_PAD_SLEW,				0x0777 },
 };
 
 /* -----------------------------------------------------------------------------
@@ -779,6 +781,13 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	if (ret < 0)
 		return ret;
 
+	value = sensor->pad_slew_rate
+	      | sensor->pad_slew_rate << 4
+	      |	sensor->pad_slew_rate << 8;
+	cci_write(sensor->regmap, MT9M114_PAD_SLEW, value, &ret);
+	if (ret < 0)
+		return ret;
+
 	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
 	if (ret < 0)
 		return ret;
@@ -2382,6 +2391,17 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
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


