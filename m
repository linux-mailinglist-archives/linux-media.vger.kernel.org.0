Return-Path: <linux-media+bounces-34871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCFBADAB2F
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 10:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49B4E3B211C
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 08:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70EC270ECB;
	Mon, 16 Jun 2025 08:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="MLywj7Ga"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013031.outbound.protection.outlook.com [40.107.44.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B85D111AD;
	Mon, 16 Jun 2025 08:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750064069; cv=fail; b=EUGA9KqSkC/j8AQm9RSgTmm2gs7ZYxIG0F5xUj0L4zB02DiIaJ0t0bqbqtzyJoPSwb30lOMB6qx+MLceTiLQu4U2sZRhmQGvsohv8Zk8JsMTop7v0361kkA0446sTWQevK+lqdEIx/gqYyMuAfuhyQFqRBErQ4DhrP78LqyzcZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750064069; c=relaxed/simple;
	bh=LzhyU76mfMOqTBC+YR4MYTUcwjKOnZTvny8qF12fIXg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KhcGVuhoTJa2RwFdCn0mojW35XGLTOtEHZkTRKmPGg7mizskssilXG2tBBdIKGrfeiNPL2F5+y3KnEkjXFHMprxT0LVZH1SCeWXNHQthqH3RdzbIvFtQqSFTEoNdhxyYHoGnhyYOa7sDk1TjpS1Kz6BEV5ene5h/xmie5BgVY4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=MLywj7Ga; arc=fail smtp.client-ip=40.107.44.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fH0MWLvFx8tnTPSrC0QVNWaOC6Q551DZu3Ewyeu5GpOrvQhwlw3UHenFB8eNOXbul0ZUuofzMLgslC+NOxAw9/XgiQC0xEQma6YurOkM7DBz/ZNgwCfxzvokO4dkHqL/Taxq0N7BnFWSXvLUCAWY/7YVqDypP2BFJdFfgt3ryuqXC9gAZoq5+ARSRu9SaOr5WJXnbUNyXAwzRxVI+q6gAV1iZ9JYNG4er7zlP2JlFkQqAICiuyisUozAI0OB2dBBmVWQyUJjL3QA3gju+Ou2bBDTDMXKt+WmYrdYuG40YNvBAC+L7apq7R5Rp4O6zNrzdBqmtd41PnznM0RUTvcxvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y66L/Zh7ZPutwS8w57GYKFmpaPMByKrWnD357+TEtqk=;
 b=qUsklWjqv1kec55fJHYB+u84kTm0h1Bugan2jSZaHtBVwbrBf9/nGSgFUM54bH3sdpMFqQQipruCP/vy3txuy4AwSm0hUxfM3jWgrH2JVHJgAZk0Z99cVsH77y6xrpep9jty8OA8urv6ghAmE/QIjjwCk8Mw/vgvl+4p1lq/Roaw1Txd+Jzy2lvEyIbAL0bNUj63lmx9z3hpCerOKCWFuUvDDzDtNShoNQsQ7nAX49bvsXewFCTa6ESeG4E59ir4K9mtgmXOAf/AtrpmjzI7rzxnfaTs4fdh9fhB1mFiIfwr0TihVpANdPtJuLbbjZLe6QnVCY1a8nKFwKcRODWufA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y66L/Zh7ZPutwS8w57GYKFmpaPMByKrWnD357+TEtqk=;
 b=MLywj7Ga2nqyF+sMZlUcDpLUVRRSAed/DKLNjtJxXImluiF8qPBzT9w16m4+P1WQp7VwNeuonSXKRb8KaAow787VW+8YDOeUqBWO3CfrKx9csem/KGY58SRoMR3rSHeievPydToyOEdjLexNrThAU7Kw9GlRCZgNeYWWhfHt8XbKNv7e/90BE3sui9wpASFJDdzcmFTl7AU9VYqle1aaqTJS84KhcAwaiRbR3kL56Yv51Z9TLA6C51TGoB4IDlrgc/9A91wxTX85Oc2MUMgqKgBltIaSu/SK72aBUrCxMMq2LS+PSTk/xV0mTiR2AulRhjdGVkkf6BZTHxNa/dsvwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com (2603:1096:604:2ac::8)
 by TYUPR06MB6269.apcprd06.prod.outlook.com (2603:1096:400:351::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 08:54:21 +0000
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49]) by OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49%4]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 08:54:21 +0000
From: Pan Chuang <panchuang@vivo.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pan Chuang <panchuang@vivo.com>
Subject: [PATCH] media: cobalt: Use str_enabled_disabled() helper
Date: Mon, 16 Jun 2025 16:54:04 +0800
Message-Id: <20250616085404.3787-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0091.apcprd03.prod.outlook.com
 (2603:1096:4:7c::19) To OS8PR06MB7663.apcprd06.prod.outlook.com
 (2603:1096:604:2ac::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS8PR06MB7663:EE_|TYUPR06MB6269:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ea566b-b24a-49a9-9f24-08ddacb3629c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fo/ZWTauTgbo/Jnz1Y1a5jzFd6DxmmpcnP6sBSKsJsnRdRMU56jdmeCGYArm?=
 =?us-ascii?Q?V74fCPJIzefWAr4BjVl5k4VpJnU2UviCzF7A7WEGUSmQcCTlWSPNgKNuH0IF?=
 =?us-ascii?Q?s7yX7AkSxEbN2F7FMALhHs3gCyzcoBjgaRTZRU7EleFpKCiuwfyMvorZp7sW?=
 =?us-ascii?Q?ca+GsR19mJA84AYwm04PVrmGkC9ajFsGSRVpImPspSINObM2vCNNN7nGgVBI?=
 =?us-ascii?Q?tZaH9mue1GEzmOV+194HaKs8ucWIgkrq65CAodjbutsgxdygMSi6S3LI+D/x?=
 =?us-ascii?Q?g8loJTJb8FJCvwQkEqG0STfvuvihaKJUlfHo+454foR2Q1Uc5Lxashsxv5F5?=
 =?us-ascii?Q?syjxaidCqY36f7gJiNS08/cBXFAhgauzFYzjBDF94XvUGi6SJrFys1jhTlLO?=
 =?us-ascii?Q?3BpmKZPLFNn1VQJkw5fIM/H8ibzYWNZ9x/oKEm/XK8oih8ECL5o0FY8MbOd1?=
 =?us-ascii?Q?mf7kyhaMZd9r2/TkA1sC/gLOq8NQiFqS11rDDLxMVKZG7F/dZv+4X5lv9wOa?=
 =?us-ascii?Q?74q7ow97ldyygq4ValGkqX12NiffMfolPWQb5C2Ui5glhU6ueoVQewdCqB9t?=
 =?us-ascii?Q?5xBOyKTTMt0iEFiLe7j3nnz69paW1BA40xPbOsl4z2nZEXb4JyenoKdQCQ8f?=
 =?us-ascii?Q?Cri8EY+BQIEy1TyOseTAEUcNeX/L3n79SHLj7sGg6j1x3wSK4xvd/mMnfpc7?=
 =?us-ascii?Q?eTBfYOyJFp39jx3q+7sOwORULAkoZylfBhx0flgsK84n8ZsjtC9uNF5h+ne/?=
 =?us-ascii?Q?fho9KwoXZVwRtq3YD2nD2ULCFzAih8H+TSl3bqBS193TJ+fCXzf156m9PoJM?=
 =?us-ascii?Q?b0ZnhNRniprX2Ll4yLk6LbC4YiXkIdv8M3LFyXo4y3K5CtvA7yh6yX1dRNqv?=
 =?us-ascii?Q?Zjxhlv85bF+lA03DPtWdWeg2wZQbxYfVWaAbqkNKOIBP1gf2kl0kp1O2QGxH?=
 =?us-ascii?Q?IpwEdA8Oq2yxteJCHaJ+3fseSy/n7+zdr5I2iYzs/RbXyMLjSC8Gmk5jjsq+?=
 =?us-ascii?Q?l0BnEuWbklNK1RGOx3ub+MwL0y2dvIM9/FooGXab87q1qwWrF0n2mCFTd3Qu?=
 =?us-ascii?Q?oLerTy03OIIvVhf+NH9ShQRjF/S7QubqKsk0waabhcu1I8RZNXeZVfEfLfnZ?=
 =?us-ascii?Q?XaHlH8XqFLBOusETVRsdf2EuCY7cVZhMIDFvIXQerVHw1I4YtkukQZQFWRpj?=
 =?us-ascii?Q?w4cFWUdlgYr24LSJ9xUZ0sJz6aNM7fUGzW6aBbvNWgSQTZJPyPqVCBHbDpO7?=
 =?us-ascii?Q?l4OkcKtKrD1tcj6F/16ABp6NdDKouCKVwX/ZrsIYbvjWhCPleWnq0TYHaxYJ?=
 =?us-ascii?Q?sIi9O+QY+ojOM024xcY3b5l9I0YuJOW2n5xx19op1AoOeUOPdBexeUHbIVDP?=
 =?us-ascii?Q?7iFZ33Sv/0F+Ii8wTGRfMkLFAD8gBBc/GjV+SeS/BTwmrY0aIMIj1ZnJI0a9?=
 =?us-ascii?Q?YgssUw29SK8VrO1F7ovZleP4cG7V1DfB+u/i4TH+wJlrzOkt4w3dcQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7663.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qi1fV9lOc+tISD7O+bEOOYimiR2ouNuomGFMo702gb1vf71ha5IBhQ8LY79W?=
 =?us-ascii?Q?dVU1Y4apsQ+gXIuntS54SFKYJww/mIU1dU6v02t4pQKUXI8S+OoEjHbSVYpb?=
 =?us-ascii?Q?Oj47+iwzVVgGZFZylHyLg8C6syKlHOkB+zjTHzFyU/LRmXoKqPsmMTigbnsz?=
 =?us-ascii?Q?51I9EMm5K3EvdB+olhFMEvU1BL3SttOvgl4ZzqyiHVylzTlZACRFk8WR8/0I?=
 =?us-ascii?Q?WEw2Quh44S9LMSHCwJo999PueSEK/gmwrQkMyL00CSUxxSlq0PkyPUQYkG2R?=
 =?us-ascii?Q?LYFsHTW4EKTQuEqqlsKr7Rnjglu8szlFtVuYuEuLMCLVfpl5Td1GoVHu1hJS?=
 =?us-ascii?Q?RuI/MH7Je0hgWnsFKU7q17MkXB5CoZDRwjob0AVfYyvHtKzcAcXqR2AmHRdI?=
 =?us-ascii?Q?myJGQydO7/py7NKzipCc4aEnRcKYsR/XIRAXrkcR8heC7khCDdslwItca+PO?=
 =?us-ascii?Q?ZD+fbUtoHXvtJ9Rx6Jjkoni88d65DXWw9X6UOxPIUM0TU3VMoto8FcYf/mqy?=
 =?us-ascii?Q?er5zrcDTVt9k4ox5/zXduNSa9LXknvFrO7fmXYY/ueXacDLoqskFZ6XbzaUp?=
 =?us-ascii?Q?nkWaB9e1hrgc19OLegv65r9gqi6sYXOOySmYM43FFZtH9FLv5ZK0JnqvOL5r?=
 =?us-ascii?Q?UYtzF1Gcmmdp38Ca9BXxlboYLIx2vhq8hHOkpgpkPqbUGphx2j6n1PD3nbdG?=
 =?us-ascii?Q?4jq6gUdd5GB867ziCabc1nw/A+LPLRSvml53iiZyYCFRO9qeM6cK+1t/b0Mx?=
 =?us-ascii?Q?7CMU3r2vS2m9UR4r9RBitB/kngNoWwVr0DptyCxzKukbcF6QpKZ1QxbGg1yC?=
 =?us-ascii?Q?bfQM6++H+K5eWiDiLO4fSPhMJB9seHyj9HqT9K+vgsimwby4pZZVhQpk8g+l?=
 =?us-ascii?Q?w/xHLf31QHFmDJMx7FF2QxV9huJOU28hCp5UIMDlrGH2c49sTaMFiAdOGLtr?=
 =?us-ascii?Q?8x2LrubQ45xGu2EJpPSjx8sRREH5DeXCHMkyr2D9wLkaPY3SFoz6i2CdAUAz?=
 =?us-ascii?Q?6NOzxdzcsXGQaI+YfHJ/LPUPwpq8Yk/4//oojjJWocyB8PbOGhg8S20kgPOP?=
 =?us-ascii?Q?FT6fahqS8G0b6Z5ayUeaXgh/A/eKPzId9/xMyv4oJxrgEyiis57VvzHijZk6?=
 =?us-ascii?Q?mJzHd/Y4QBxxpYTO1PMhgk3077CUDjIgPUSoH81h2m8bDb53t6/UYvFs4/QX?=
 =?us-ascii?Q?vWvaY5XVpkkYHskNJfryKdmxSEay/wjK+iF4manHYR6bZnfxMCZaOlQlxlbQ?=
 =?us-ascii?Q?b7nfh4KelBBEVsRutBHxw5oWwkEu8zwA/sluHCLaVeL1Lei0dB/FX7bs0ihM?=
 =?us-ascii?Q?OC6L9Acrvx4h4ZEH1s7sz+glCEAYBPW1OvR7t9fgAaD/2zYg0DyC5Ma+7aZk?=
 =?us-ascii?Q?02+LdmUQhYdkEifqQgdbD0TgmGWD8dMHR3u+/GNSDe9XvCJ5lEOLnRBDFK2T?=
 =?us-ascii?Q?cK0MMQIRPpmA5oij655E4KFiEm4GqO1tgDCBofBvNjqATQjt6tLUKP0wcp3i?=
 =?us-ascii?Q?IQoJMcjrcXF2yzU8QoEKX865eBjBHuyq3Dr077vuvyS0KfzlPrfsn3UfSBj/?=
 =?us-ascii?Q?vhkjR+UCMKpPlNzDGIm55qNG+vYZUnAbLlNU6oE7?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ea566b-b24a-49a9-9f24-08ddacb3629c
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7663.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 08:54:21.4133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ueZcWcK7jv6V2BLAuQO/0OfWVQAshIitX+bI2petbVI2ljrXUPQXCt1mPkIDvKnnQn6aE6XQ/kKmAi8LyBhrdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6269

Remove hard-coded strings by using the str_enabled_disabled() helper
function.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/media/pci/cobalt/cobalt-driver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
index 39e25cc53edb..7fadf588a20c 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.c
+++ b/drivers/media/pci/cobalt/cobalt-driver.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/delay.h>
+#include <linux/string_choices.h>
 #include <media/i2c/adv7604.h>
 #include <media/i2c/adv7842.h>
 #include <media/i2c/adv7511.h>
@@ -260,7 +261,7 @@ static void msi_config_show(struct cobalt *cobalt, struct pci_dev *pci_dev)
 	u32 adrs_l, adrs_h;
 
 	pci_read_config_word(pci_dev, 0x52, &ctrl);
-	cobalt_info("MSI %s\n", ctrl & 1 ? "enable" : "disable");
+	cobalt_info("MSI %s\n", str_enable_disable(ctrl & 1));
 	cobalt_info("MSI multiple message: Capable %u. Enable %u\n",
 		    (1 << ((ctrl >> 1) & 7)), (1 << ((ctrl >> 4) & 7)));
 	if (ctrl & 0x80)
-- 
2.39.0


