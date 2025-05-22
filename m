Return-Path: <linux-media+bounces-33149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E20AC0E36
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BF9FA27C4D
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA4F28C5D1;
	Thu, 22 May 2025 14:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="fUctk1Ww"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80A128B516;
	Thu, 22 May 2025 14:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924533; cv=fail; b=GciHkLOFj4igVgnQEShBkmHPpQwWpSCpEbxJRPOVcGGUGa8EwM/VWO45hbp9TTbzGjYHryQ/IgXYrBMXOuLnXcAWCqA3myeGXuQ1lvpKASJntUPJhxbjab2vS9q8fxEAid5upEum3RsBzI6gfYfLDXi+2Gpsmv3BgIpz1pDzH/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924533; c=relaxed/simple;
	bh=U3so8uSs20TR2LqvzniOzpH+3LN/h/jdG9FQifGzoqg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=M2IzAPv6FlMzZA2QvOBsrHTOdmc9/dpU9nKEfsIJS4kNsghSTnzLgYhkDFPgKyYWEIK/nc/mRrRHDdlxff8kaRQUH6klNSR1wgm2/zEHMgATbJ9XWY3gIK0cVYk0mk9vnTAVLUL3r/ogGFikx29AYsFWA7itGC59rKUCHvjuoZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=fUctk1Ww; arc=fail smtp.client-ip=40.107.22.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHlOiPhDGZIM1HZ/F+13tNC+P/4deU1mr28NgTse3k1yv6lbQll5JHXM8vY+ryWpS293sIqAz24y3VSc1xomEDh4vzeADGeDzLaHMwo3qt2fv1wBET4u/GMjjBxPYRz4Gekh5JXLx2OdUqD5MbYzSfiWn7iQigvaQWAGjHIOuCG+Of6EXYWRKQl6SUQSGm2jvAF2bP7VBez+i1Hq/vMEcFXOHCxqa3qJ2jJv1C/dVYkPJAfsFL7TnnK21QLr6iV+/khswSlSpI1otn4jkZpyo7QaUPksjOmtbIb0QDZumHhEL8XEQH10V5SHMmrRE09tN/rsbOIaw+11pc7kSCBNqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Un8qO72TtcuSc6hfGlgWEZexwcrpj3W762GSXasHJd4=;
 b=OGsLKBKkEIZeW0ymOKgZG5i4H2wD6RiYm7RPY1KPBIUzMHspsK6u5jk9ll2hxX2g3vCTC7DmS19sLxUAre0rJIA0UjA1aGBqnn3B1/wA8eaLwq/tXp23xccuKoUV/REWb+sLKEQl69dY82JJKXrNBi/KC5MlGDii8AX2GwaBkdFMgTqhmmvSQt4aEomzV7H92DcfuiC8JqOsiniGWyfzq8miuV6hu7/I3LvVK3N6KQ6/yHuzFMkCTAWQSoLGFIloumQ7k/P6YS23sbkE3dDq89kT3H9dCfmN7wNHj+YkHrddxchcxG6Fyg9Lae9I+tqUAF5qL9+ZVAGretqqHdGiKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Un8qO72TtcuSc6hfGlgWEZexwcrpj3W762GSXasHJd4=;
 b=fUctk1WwMkaKNNgqeST80CMC/In6/JsjKjdegLFAV3WuE2tuQQWJOn0Rmx9kQwokDp+sSigS2Aaf8F+oJW2iALJVSdFcQdUtmB3aH9rk7C69RO3QhxzmNAjtj+Xqwbfhg3tcrNM4537jeI1f1ii9kekSRSJsaX0GuED5HvZxaFer4OLMbLDcl9lDiZ99fZtCWBWicluwnbydlL5e/TwS3BdBtcSZcEmgGgPoxLzEiEUtroEQCUtXLgsvw6yqMVT2/jLxJNIxBuEDIZkzhLTl2z+b+kJnuyJWCJFD4i/62pkgYAL2ERGkHWsO1hDxp8/SN9MO8S20EVCKlQPoctb0bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AS2PR03MB10153.eurprd03.prod.outlook.com (2603:10a6:20b:64b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 14:35:28 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:35:28 +0000
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
Subject: [PATCH v6 0/7] MT9M114 driver bugfix and improvements
Date: Thu, 22 May 2025 16:35:04 +0200
Message-Id: <20250522143512.112043-1-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0112.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::9) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AS2PR03MB10153:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe8ab2f-a2f1-4b24-5742-08dd993de5f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a7YwF4ZcTo0PFb17pfTJisZ8bSkwAj7vlo9LVhtCy4a3oMkst6W+NKWmTSgH?=
 =?us-ascii?Q?l3wABA6jaqN+7lrX9+o3xpglvCX60ArPusKqYbGYP/7wHvhkzPU5DASwRxVJ?=
 =?us-ascii?Q?/lGhdkc5EQnF5IGB/QYFX1B8gG62kC2/f+MiaqieNTacWDjbgkh3wUiaQj8N?=
 =?us-ascii?Q?rG/8gjbVlUbV8wqwojSEmAq5ypn5fX7ev3dZ6RTZAPr1u5j5E2Qqbm5COGE2?=
 =?us-ascii?Q?7CSe34djnpXzuZHxHQyZHgL8Gddmp3FzV7llZdpkNg44eSoyP0LGrz8fDaK6?=
 =?us-ascii?Q?gM4DYlPN5tyYwri9oS2Rzx5LtD0cZm+UjcUDMErNyiDMi5shtDUvH+sSPjdH?=
 =?us-ascii?Q?ZRL+MSMx8D4TXtvAJK9/Uw5GXO7PJKmvGHj1el6GP4UrGyz3nK8vhRU1KSie?=
 =?us-ascii?Q?+YXHTLMGFREA9eeOEu1QzDZ315DAC3HvhZw1akuGGj2/0hsA7U2sTdT2NUhx?=
 =?us-ascii?Q?wFlSQBNdwQyllwSZiFTNhon0qj3qwAAmMa6u4bqHAi57gdRhJ6rDprz1o867?=
 =?us-ascii?Q?jhL09KyW1FPmr17pMTH3NeQhpgOlq5HjvcIX/GFPlTLacYRpDbFhowSDU/kz?=
 =?us-ascii?Q?xoE9vAEjcfzjuhR8m2juOh7eNFzetey4/wPXp+fdbfBELvvsuUzZDGvBSsjG?=
 =?us-ascii?Q?7XQi/S/TXZQUqRTjHcDto672X1eISL1F2QxWFkdFYeCZwp/255M2eH1NPj70?=
 =?us-ascii?Q?/w9apN455pH/G3XrQYmH/CO2wgPj04M8JbBe4OFNRIVDbxREktSASgV3VLfS?=
 =?us-ascii?Q?Lcv7+VFlgj/cPLM8DNM1h1Zp86rqseP9EJerrQutZZGo+NbaTO72AOgF4PAD?=
 =?us-ascii?Q?xDekgNSHol2AJd8+ecJoUrfscJxO6QqV3gvArizWYuwieMG9iCpBcn057Cgn?=
 =?us-ascii?Q?UC0eGeerp84iDv1YraqCxzB27fxULsboF1fJAp0MzEjn5Mwbzh1xhGyY4eKf?=
 =?us-ascii?Q?+Vbz7fJZc7Ct3dVdHkBMl360I3xad0FsfOaVMqc5Ts6zs1F9b7JaqN3pdGuU?=
 =?us-ascii?Q?i9jzFdue3iohEYj0iMJkbCEChIfs6zRCQCbWyU7ui+Npmhz033jm2oE4/2jP?=
 =?us-ascii?Q?/K5LfTQmWPnVgtrBJPd2GBTNXr+IzXVArvEMoGktiUYriEM9XE39gnJ7XZNe?=
 =?us-ascii?Q?+1RxFNA3LIw/fuwOyr7blsqmr2GY5loLW7elikY285Ogjb/ac0EIAKeS8/G/?=
 =?us-ascii?Q?wKB/lPjay7OSkmQ7v9U3UWdi6OB+MQScIiu4FdklLkIhdeAQ3FFC3ssVijAF?=
 =?us-ascii?Q?rx5VB9CLAD3f5KbVwUUDe8yUMfS6JqbSSi+YOwcbrO2ncj9rHoDrz19kcyjC?=
 =?us-ascii?Q?/nbTZLP54QZqaCyUXfeI1GYxB9mobgTvCvYlONexDzNjvEiSsZ051T8FMd3d?=
 =?us-ascii?Q?zUBmreADX2gaZWI4D3jeVcmUA+J8iWAmBkMkB+plhwpvEId6VSnKgGWSxkr7?=
 =?us-ascii?Q?ks2yYiW1Xrk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m2uosLZdm2zUcnh63qKU6UKEuZW6drGlZwp5/lBIQGyl/G9FUIljwX24Xh0J?=
 =?us-ascii?Q?aoLViY66M6/KApbKaQr/W0hRNO3AZbYhXwRH7kEqCRj4t6YO41pW+6YXErki?=
 =?us-ascii?Q?XEth2a2kCvhOCoskCHclyvtN+No0lWWFsZ8ubfD0F8fDnuDacyCbiSq1rA4J?=
 =?us-ascii?Q?4qjJT1C/KY0+G1iE/v9L87OLM5o/xf9egTbGDo9OwM1uzTBaekXaBZNmyoo5?=
 =?us-ascii?Q?9S/nf1FUqtQ7ahVAvlheQ93GRrrvuZHRMJXOHdil2VZiLz4r+uZ5r8l+lbl+?=
 =?us-ascii?Q?9tqOXdZTicsoEpF7neDA9y3NgDAmZzqn+CZ4NFjTgnLLANl3KJSeMAQd4JRC?=
 =?us-ascii?Q?+sdoM+zh8eXvW8f8eHMvgkIZbXpXnkLC0gFRrK/Ot6G7F2P8ijKSflf8SfWV?=
 =?us-ascii?Q?gfLYf5hsrSg61FxjzwfZ9vPiHzRaffCNmz1bbOJtRe9GyarNr+1uyew0IHon?=
 =?us-ascii?Q?56EY4cKtFmY0ZNSYjlGqGT/rvW+XZYGpGB9ds9nzqakLaO6L/7gEw4SehR9M?=
 =?us-ascii?Q?9Ibd4ZUW3kyLoeFHk6QtGr8Ba9hsD1u8FjviBoGfNMnimkY5+7grjHEx7ZCC?=
 =?us-ascii?Q?o7cON/zesEhwSEkhRjWuAr2eJPHEDeXhR67u6qXV1yQD3yam3E4PWiN2bgW6?=
 =?us-ascii?Q?JtkK6Ws3vXTIkDa6S70I/SsS4uPbmMpLr3PJA2kS5YVk0o7ZIQK57HxKReB/?=
 =?us-ascii?Q?bUkUJsdyWcMQljawSpkq5lAFGGy4B4ELSUGgjRQfYCYPjDFDmtJF9i3XYOlZ?=
 =?us-ascii?Q?t5uIfjJ32J8KN9ZgwoWrVCDctaEllS0CXNjJEJW4Uf/pOPYzuL26OrYIVeBb?=
 =?us-ascii?Q?8MwE2r5TMmb/X1hP2H+H+ZXNMcPbXL1DoAy+vfPrhLcNHjyfIFsl5BcyA6x8?=
 =?us-ascii?Q?ZGFTsf0BaC/b0dgnEzo5oMz06K44Kla7TXv1zzbqVLSH7/dqhx8EfFPkL1vq?=
 =?us-ascii?Q?y4hrj2AqQWpLRkQho00TR39c0nHTXnAYBR8IDzq+PkRUn9RzocLz1UotQ5TG?=
 =?us-ascii?Q?GhhnAi4pnb5G4wxI+OQvJAHdX/M9HibzeHdp/vs29ZPlGRHxdSs+s39sp38P?=
 =?us-ascii?Q?zjGqoIf7Bh18C7fBlGctYpSZubpEoQvzh+81ZiObrUl0ppa4uBzTYdpTUf9t?=
 =?us-ascii?Q?qml7b+ZEGi2ZF61Yqru+I47m99U0xas9FsPDE7FqgVH5BLrYXGpE7XB9fXhk?=
 =?us-ascii?Q?OvWuDqaqGWK6/a9xvu0mCuv9bcM0ylMHAVac6mWlGb1E924CWk6Sxlax3/Y3?=
 =?us-ascii?Q?Im7E3sjgZiep4+tB/jFwA/u8RG7rKIKKunGqsaF3T9tD3ko9+IPXsQdsjtyy?=
 =?us-ascii?Q?DmbkR5BmToAZblEH07ekJ+xLQuqhk9R8ABN5MfuAYKrWd15o8UStbm+yinT2?=
 =?us-ascii?Q?Kgw++Is6SD6ssy6ua02klEoMGWuH7vqa+OM/T5prcI82+QP+5rpBx91Vc2vx?=
 =?us-ascii?Q?G/VMFN9WtMVsE+A3/1LtHlB+A92u4EGSdVMgmZKknVhw5v6Y5O/sAhwQj0bg?=
 =?us-ascii?Q?ddmzSTnX8FKrnOyH5R5pUCkmliM0wtj4XOpykMmVAb4oNEU87MqUvquRJ22z?=
 =?us-ascii?Q?7k0jloAF5oT2cm7+2k1zWse2tpADSqHQ1kxozWOy?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe8ab2f-a2f1-4b24-5742-08dd993de5f0
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:35:28.8373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAoQ0vu4nVaxBYh1skVibg8o5N+dJ5Q78IXIve3XG1zMmG4/0s0yttNeVVVIKEfM6Ao4uIfCT0KazHjV5EDZgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10153

Hi,

this patch series contains the following bugfix and improvements
for the MT9M114 camera driver:

Changelog:

v5 -> v6:
- Add 'Reviewed-By:' tags. Sorry for forgetting this in the previous versions

v4 -> v5:
- Apply reformatings and small refactorings as suggested in review comments
- Split PATCH 4 into two parts: One for applying HFLIP / VFLIP while 
  streaming, one for applying set_selection while streaming.
- Add condition to apply set_selection immediately only if the size of the
  cropping rectangle does not change in PATCH 5
- Use device_property_read_u32 instead of of_property_read_u32 in PATCH 7

v3 -> v4:
- Rename DT binding from "onnn,slew-rate" to "slew-rate" in PATCH 1 and 6 as
  requested in the review comment.

v2 -> v3:
- Dropped PATCH 2 ("media: mt9m114: Add get_mbus_config").
  Based on the comments, this issure won't be fixed in the MT9M114
  driver but in "imx-media-csi.c" in a separate patch.
- Renumbered patches accordingly.
- Fix the incomplete renaming of the DT property from 'pad-slew-rate'
  to 'onnn,slew-rate' in PATCH 1 and 6.
- Fix checkpatch formatting suggestions in PATCH 2 and 6.

v1 -> v2:
- Fix the subjects of the patches
- Dropped PATCH 1 ("Add bypass-pll DT-binding") as it can be automatically
  detected if the PLL should be bypassed.
- Renumbered patches accordingly
- Switch to uint32, add default value and clarify documentation in PATCH 1
- Add 'Fixes' and 'Cc' tags as suggested in PATCH 6

Link to v1 discussion:
https://lore.kernel.org/linux-media/20250226153929.274562-1-mathis.foerst@mt.com/
Link to v2 discussion:
https://lore.kernel.org/linux-media/20250304103647.34235-1-mathis.foerst@mt.com/
Link to v3 discussion:
https://lore.kernel.org/linux-media/20250305101453.708270-1-mathis.foerst@mt.com/
Link to v4 discussion:
https://lore.kernel.org/linux-media/20250307093140.370061-1-mathis.foerst@mt.com/


Bugfixes:
- Fix a deadlock when using the V4L2 pad-ops get/set_frame_interval

New Features:
- Bypass the internal PLL if EXTCLK matches the configured link_frequency
- Make the slew-rate of the output pads configurable via DT
- Allow to change the cropping configuration and the horizontal/vertical
  flipping while the sensor is in streaming state

Thanks,
Mathis

Mathis Foerst (7):
  media: dt-bindings: mt9m114: Add slew-rate DT-binding
  media: mt9m114: Bypass PLL if required
  media: mt9m114: Factor out mt9m114_configure_pa
  media: mt9m114: Apply horizontal / vertical flip while streaming
  media: mt9m114: Allow set_selection while streaming
  media: mt9m114: Fix deadlock in get_frame_interval/set_frame_interval
  media: mt9m114: Set pad-slew-rate

 .../bindings/media/i2c/onnn,mt9m114.yaml      |   9 +
 drivers/media/i2c/mt9m114.c                   | 264 ++++++++++++------
 2 files changed, 185 insertions(+), 88 deletions(-)

base-commit: d608703fcdd9e9538f6c7a0fcf98bf79b1375b60
-- 
2.34.1


