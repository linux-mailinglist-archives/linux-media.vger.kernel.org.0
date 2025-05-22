Return-Path: <linux-media+bounces-33134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF4BAC0D91
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 174C83B6112
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E074F28C5AB;
	Thu, 22 May 2025 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="pmwrFjbf"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013001.outbound.protection.outlook.com [52.101.72.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A093828C2A4;
	Thu, 22 May 2025 14:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922792; cv=fail; b=G9g4XPvNJeCfB9mwIeMvRPN0vX37V0jj5bAfCHlsv2cqwhr51FiwGAkB2wimdS2oBDVHe0Y24ZzyOvIz75I9lKDXHn2VeledxpA7/9+AgyUfnPDjE0lQG/nCmH3GNYKzPioGq3Uu7BXSESURX8uzo8mVW85Rjo9Ov2Ppzv4RNQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922792; c=relaxed/simple;
	bh=D/2/IjIMDUIH3hKZOrR+rrelhGJxuLX5CqJ9GsbjIrE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AXB0DLXnHwg0EQUxHpCxPT++yerpthbO0vj8ZcYbsTird99IBkOGu1raNNxjaxOjLtNPBSpVz4ZruHyPK91iCtEuzXrFmq5YPKxwr0MI3oxmCoQxrly+nzBh/GnivDfWqQAeISNa79EhFbuv+WbPN7JKsSVOTiZo2YsQluHBL68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=pmwrFjbf; arc=fail smtp.client-ip=52.101.72.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VblACUWwnNkv+s5nE/ONltjJujOXL6C7RXcZlP9CUaQEeAMxOn/zVWpQsdvgs4fqvTYJ4v67UNM9hMs+Pfdx9wmkS7oO1Prk0o1vfVBr7fchiHHvHlJEQZkQPabVKvKRJeDGASXTXPH/0qbXMMae1f0v24tyX7IFoe1tDfDIMBcVTCQqrGphQfEZ0pJtGT34E/CUiWw75oVOAkYC/yf5j1DMnaREEjZyCXciJS1ZSU8fDBYVRmExC4Wg5icNm0NPXEiqJ94OS1k6ZdTGGHkjia9TopcSZyGgkOyi3VCOQNVNNtmFx0klO+Otcmrnkm1iShr6w+KvLCri/JJBehwRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIk/1l1xNF4JeZCnVtlQpHInbgipwrdgUtjvKTluG0s=;
 b=gRijCcctMPSyMCG7bjwtHqW79I/OQmixuAcfmrBhKq3NTA/LsVNX6sxeCaDClM7Lu//AmmjKpNGYM02yAvb3zi2ZNf4Da+PGLK8E/PVyhNTfVM+IqJEhHuFxRLFyg7kWRCm/53KA0AkdxGvKh43fnBPtgikj7UlYug8qjc+iFQhG2VtzAIvY7STebcAm6zIMOeanRzcFgpksFgncnvm1diRAYyEDadgZZpVVuhWAQ8Gcy1NE8CslIp1xWKyc+wpm53LoVGDFDfIglvugR5pnVzJqn+YlbhVi2kq7V1SwIPM7x1NnVlEQpbGlYPasaLaJKpsdoT8D7iIaxmB5w4mmMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIk/1l1xNF4JeZCnVtlQpHInbgipwrdgUtjvKTluG0s=;
 b=pmwrFjbf64HqBgA9jNMWpCoCpM20acisc0KcBDrQqngAvIoah9HMYZrn/TGatSEPMpBecpd9yX2wQAjszrnriAxDkbTaD8GeKf0ujawMuEEIOh6m1Imx76OkNcDOPARoFANWDaZXX44OilbJatbqMedJ8r7/EgmVuir6IprZID0+HBRj0zTc9/oOdTiI7SWivi4jsb1ErD/7ZKz3fTY091ngxa+bxXcYPbDKBLjCjS9HiShSn0hcGs0ZOe7wfrDnIQz597u2ndphiIohQmCao/V3bKfDuw07484Tg+HWOpYdnisT8SG5zcVMBKju8DbzXwNLjDwekdF63nXt/kswfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by PAXPR03MB8252.eurprd03.prod.outlook.com (2603:10a6:102:23e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 14:06:25 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:06:23 +0000
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
Subject: [PATCH v5 0/7] MT9M114 driver bugfix and improvements
Date: Thu, 22 May 2025 16:06:06 +0200
Message-Id: <20250522140613.104963-1-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0022.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::7) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|PAXPR03MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f07463-f76d-486d-65eb-08dd9939d5cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+PmUaoXiQ1855mJTXfBZUURQoJyjdT+ZGHwCqT6OPsfAmMOozhp5kvCLTnGs?=
 =?us-ascii?Q?mDoxlWLA5ZGZwcuElh0p0qyfBpx3fX4xlvrgb7rULgbA7veo0klaa+0TJms3?=
 =?us-ascii?Q?v2AhtKnQMO7jzU7J72aO7DHh/N0D9+IarpxOYrKxlU0J4t9NKNPRQUh+dCUA?=
 =?us-ascii?Q?qz6lrm7mKwd+d4rgaM1oOiAHyWq/s1CThZOGVoUpGYK2wHCFrbPi9PjBwuuf?=
 =?us-ascii?Q?NC4WCpMkrc1kLESWReybGs1QjNlXCk4M0puGuOjiyaiEH9hphkFSSc89efM9?=
 =?us-ascii?Q?hJFjuFD+axbtwpGaM9SX5lk+u4uWxmBfRVHRHvrSZdLRC2Q6yiPFI8dzfveh?=
 =?us-ascii?Q?jgQiBCX11ndNXJZqDFWV84eEAMh6VL1zxAq0Fotet5vw0ToJW0kyFAr9XlGe?=
 =?us-ascii?Q?5SMuJSMLfuRBNUMGVC6dfkVYJ8zQUlSYx9O+2EV2IXrdhC0L1ZxFD7ZCvaZD?=
 =?us-ascii?Q?f7kPvM38/os1ZQRCh5UFOepxOi/Bg4XfN3jHPRBmtukBlcQMcUoElLp7TN+x?=
 =?us-ascii?Q?IeKo++cIlGnpottChzze+T3JGxoQKL3TmuYpWUhcauqdz3BmGC/GlnILjyVf?=
 =?us-ascii?Q?r03y3oQzIDfGh/ZWxe3q8Zpt6qhJ+0A1ipdfwS8dwr9W2e7Rfb6UP2Z0nsmW?=
 =?us-ascii?Q?9HXD8Xw8VmMCtVnBvxXDq4xIZvHmd4QfzoRp2JPC0SP3eujKvfs6fmudmnwc?=
 =?us-ascii?Q?rzwEt88f8AgK1MGz8qxtNUPh6D4KpWiKijZM8RyRHraoYNEH1QeKcBfiYMy6?=
 =?us-ascii?Q?l5QkOuTwYsjNPubFHN+5qvKzzBMR10WsaDybjYF+1ytsfAhkpqxE+DD1TC5P?=
 =?us-ascii?Q?n0EjrC/e3gGoADyPHxBRuX3ncBI67ij8RABNkHLOwf9i9otTCsIEqxui6jTI?=
 =?us-ascii?Q?c9Q+uPQZhafLh0S5qoGLlsObXwpsXuB+RyQbOZdyIEmpjkeqBXsefYep2sBP?=
 =?us-ascii?Q?Q4s7J9p9O7vMfmEUk+ppaZlHApOvMVulipnAlXZjtWCNkPAsuzP+vsFuRfMG?=
 =?us-ascii?Q?TI6EC7NxOKsA14GnX8ML1RS6M36qDw44HWjUaSMW9IAnl0o9rpk76OC8KJGD?=
 =?us-ascii?Q?l5GutCyxk07K0bf4NRABaksJsnIb62q74B/Eeq+ndOkHOvlMHqgsSr8lzecH?=
 =?us-ascii?Q?dJDpIue7EMgYuSFqMCKbZpuFzEjSYddnE1N3CP702ndmIIZOpV+VrwJtm980?=
 =?us-ascii?Q?CVeBuaLIs7wekUMCiyKVPcSX328o/M0fTQ2gi/VUYfGsDhdRE8VWCp8blX1V?=
 =?us-ascii?Q?1o7saTkW/lrR5qIRTqC+sJ+A6UiZw1AUriO33VnW7xJfz53kSXSOUpBHNHg3?=
 =?us-ascii?Q?SOLNTz+9csqUzMcHCTO6nmnt6I5btRI98NVHXqTwntJkAmqNmCTQX3oYQXf0?=
 =?us-ascii?Q?EjIs3DaTcuHNh3eZvuAUXcKs3PfDMkKckpI5hZIK9MeF5+DYu/xjhkMmY0/4?=
 =?us-ascii?Q?H1UP6GAseMk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IroNU4gnfuWgxngxJMeodLSsy66YQUic3Hm8nOZ8KBUUzH/heE1R7f7LKzzC?=
 =?us-ascii?Q?soWHsz3a1lMHUIWc6PXKk7b5uGA5CA21xIwJHmN47akSTd6LuzjQKqRIQb6z?=
 =?us-ascii?Q?G3OEtsbYKDBhQBFcBKUCyUkw/KO9LSiQTqh9VDeyx5k5IBrtkVP1AFgMM1xE?=
 =?us-ascii?Q?OVpBgAFBKdukVOhwEOsDqFCdgUBvPtUAuoRbvsDqdwJ3lrgmxNjkYbXvI+sc?=
 =?us-ascii?Q?0p0vVoEPzJDGpbmtHxfv7ojrhGEEYfk8XcmbiRXq7uFOWL1kWtcvsnq5enyo?=
 =?us-ascii?Q?4hjoAVpRIxpr6DW1i8T8PY8fkxGJEtx7wjztwpuc08oWDcaXmwnTBFeOMsk6?=
 =?us-ascii?Q?34VL8obBzuUEYa8K2QyUlU8T/bmsoiQ4pV2UUv/DRptVPbUiPWoAQRYPQlUa?=
 =?us-ascii?Q?VlNfnbZKBVeWzv6iCKYCxQvFpRsPckNTFtWmO3Vew1ZrsMK30W7/+I69NYsl?=
 =?us-ascii?Q?8cenRBgqf/LRJkvBw7OavB/iZ80KgyOmp0K0Q4nfAO9V+yU/nNyzsPWDjGc+?=
 =?us-ascii?Q?MIvxen7LmMQ5aID015pqkemJ7r8jd6OHzJeoSgtVSWiolks311HAFAdavPSh?=
 =?us-ascii?Q?WcZqYjuqrlb/zRHaZsmu1bO8mVw79Ht43yAcsHwnz6T2VR8RCtGUIRX9D4Og?=
 =?us-ascii?Q?X3ygsV8y/lEGk9xJVZ2rhFMRJtonuSgSMQuJEr+1K2PXLIVYbZJork/g9lZD?=
 =?us-ascii?Q?Dpqp1IGXIM28fj7IdWELv59uUlLY9R6CVCKMRgJs3QTQjSowRem97rOl47/r?=
 =?us-ascii?Q?ihxKba6gkNhdEHTvN3HbQWJf06upKvdN178aXA5KZQEe4cTmawk+Nq4iqS5k?=
 =?us-ascii?Q?/cI+bwnh4s571RDphcJyywB5ysFKG6c/Sp/ufg73d0O/9IR9nCw04rQ+JMQM?=
 =?us-ascii?Q?MAVn29LzvAPf80txn/ykYFv8HstU5o7NURAscrhdyRehuufV0BX0XIPmzbZv?=
 =?us-ascii?Q?Byc/GujUoGuR4OTK40+wRnUJNy8GrKqyOch2Ct3jn4zjCxcdCOxtCq3crUNC?=
 =?us-ascii?Q?/c4OgLVc5mwZgAscdCU8c5vo/KQ0VOzFI+rBcRZVn0flr6A8FswJt8VrvPtR?=
 =?us-ascii?Q?TdbxyGEi0CJFjFegu+otxnwo8YBbpb7817hIlB5awJTBY7gld2/0mzrixZWB?=
 =?us-ascii?Q?Z4pKyCM8PpKtgdrd1jwWZlU/LgVUjfBDwOIIiqdjbUPSQbyIRGGghxj5YOdv?=
 =?us-ascii?Q?faMbdH/n5DKUMe04qF4F3io3t/qGNc95XPdojZPJBwpGM1DstkOOeoevbf4K?=
 =?us-ascii?Q?itYvZVpo4BvX9HPX/iE5/ob5LuiKZFYfqnLYnKu38huIb50ewLgxGlA9xVOB?=
 =?us-ascii?Q?qmn4K4SmYkbbjmTSiR4ZRKs579pIFPHf8cEbtNzytafb7P5lX/EXsW99/fpE?=
 =?us-ascii?Q?j1ultvxuW03pWPrhXuJMv1MMRQzEfr+nLtc5NtcNd+YdL4Odf9Ao+7TCEZQn?=
 =?us-ascii?Q?dHU1OP+UQnz8/T6kyeHp1McWoo5GoR5JZoL2U6W4XFGZxXOxqlxJ9iB0CZL/?=
 =?us-ascii?Q?mkeO7xVsWW5/uxnHBg4UNAewtfwCrLG0tEPoRr0rHYG5tI/+NC/HwbNKmrDW?=
 =?us-ascii?Q?1WpqO2u/J4vheNZCmbbE/a1Jl6Q5XWx0sAUDNSAZ?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f07463-f76d-486d-65eb-08dd9939d5cd
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:06:23.7482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFinpAfbVzZ7s3n6hlbTQ+CZ1795b3BN3cMz1Viu0nLAxIzV0WN5XfiP8W7y7KNUq9JBle5sJRjVyegCNmPMeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8252

Hi,

this patch series contains the following bugfix and improvements
for the MT9M114 camera driver:

Changelog:

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


