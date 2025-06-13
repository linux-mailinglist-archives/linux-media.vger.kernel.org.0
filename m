Return-Path: <linux-media+bounces-34708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4366EAD8555
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 10:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 306681895312
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 08:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC65626B768;
	Fri, 13 Jun 2025 08:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Ld2OFGfH"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013002.outbound.protection.outlook.com [40.107.44.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076712DA741;
	Fri, 13 Jun 2025 08:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749802715; cv=fail; b=QtJtbje9JNuuNut0Blp4eAcFyqGaCOA0HIVpcZ3u3V0qh1FxTT5C/RxODxSUH3JV63YozrlIOEu0hpMbyhRaP/rfYk9yb5NCcY+LVz1uZHkhUiCpTlwzT3H30br/2LidlBmwxJS01f3JJDj5LLPepcBK5kCJfCJ2PwamHnjPIE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749802715; c=relaxed/simple;
	bh=HJpSh/M4d1QxtxuVCXfSM1oq3SxwkK/5UV+5uyp4Vkg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ovqFWxR2yw0H6IiGfmjxJ0ouIyXmv8fSOupfUG+0gEUqgVRWASL7GxY7wNSO5KGRoBC0w6tjVIbH9r4R5s7YSfL8RRkkCJLVgQF4b2iwB1d8PNndqYr9x9Mb44eSykHU/ebJdsaGZDwwB+gft7MO4ZAX4CRGdCW8Htv3DZ94VDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Ld2OFGfH; arc=fail smtp.client-ip=40.107.44.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlA55ztoYdt6rmG1SwiQ2Xds7bt5Y9w9RvAIlCR7tEaMeKGt2omn0CFIoTBzousurCWCu4cSzUuLJEDmPkT6MY/vhYpySmz2d177IHMoIiy+6vqhaNqVza/z/d/D2sjy1dYj8wEwld1RDWzxY6QhrHAOjvwUC0YEHyGiuap9TN+JoSoOAsL4hscWfmkZbeQ9zBmCQhj5+XMrVWlBgcSadrn5Wg46x2p+9+88JvQXamWKtZ4c1am06f6sb6E2mGNIVZ0eUA+LDx48bWYNIuVd4PwlBKRxT7WZEsGoSHSazK64R2YdCnqjGZVO0B4irXzIkhLLb2Qmyc8WQVHNi6A3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrdrW0hodwnSJKUocIRTr67z25yB93KvSadG5D280Ss=;
 b=OvcsMVh5nCvv0NXJAw88LfLhBJN+DMX7Z9f7mYjrtoKp4lWx0MovDqhV+q5BB7VIm4Pf9NLE7vQT17HcpxqBbms109vh1XXkzBqmv/MWr+ymqwAleKjfNrjad7SLzWL9dRp7fNeyhbZI4r53Oz34VOYKqr43uyzrk4vUw6vWYP1pbL/BheX1KwPZyimva9GnjpWOgjrt32ILu9xEFxomZHuyMe3330+8kTBctXRE4p1s+nJYHdO9Qc9lSlpVlrR4fs11DTqXFFUAo2Zwkfx+z1DfVodDNIO7Krms5/ugROeisePq2p/zj7bYy9EDXDyVLmOaSy6LuhBPEPUZBIBvLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrdrW0hodwnSJKUocIRTr67z25yB93KvSadG5D280Ss=;
 b=Ld2OFGfHmuTB7dI2K618xLnMhzXPkz61rnvruTDuXLE/B+CAKrLZHA9Fc3VYvqcN6CG6xALpNq0a3HE6Ko3eFsdRe45ZK5eg5uqrPX60CYOrrj+oeA9EJpnzxH+BI9ShXxe6JaWecFpeqtJxPMFNpiKHEaVHe3idjuLnEsljtASNfnonLhYefBLk3UwSaQQK8F6y6Wf4Jbt0xD74ywphXz6M0LoZcSqBp+WqOvdhWkVGq+Q4duwcuMGjRB7yE9xSb8+PoIqHO22NmiB0uUnHb6aCpsyXRHsOwy7Txoac2+W05d+kEwDyTAXR2gDe0dGAFcjsevi5elTWl9Kz74dBAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com (2603:1096:604:2ac::8)
 by KL1PR0601MB5535.apcprd06.prod.outlook.com (2603:1096:820:b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 08:18:23 +0000
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49]) by OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49%4]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 08:18:22 +0000
From: Pan Chuang <panchuang@vivo.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pan Chuang <panchuang@vivo.com>
Subject: [PATCH] pci: cobalt: Use str_enabled_disabled() helper
Date: Fri, 13 Jun 2025 16:18:07 +0800
Message-Id: <20250613081807.49989-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096::17) To
 OS8PR06MB7663.apcprd06.prod.outlook.com (2603:1096:604:2ac::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS8PR06MB7663:EE_|KL1PR0601MB5535:EE_
X-MS-Office365-Filtering-Correlation-Id: df39436b-9647-4894-3991-08ddaa52dc95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xNwA06VUY5SGDpC+DKLEW1vh8yTkZXnig3KaItQm8z6X40wVJMiXpvdswtsz?=
 =?us-ascii?Q?tnaSBQlRz6yEeRlnkZaOMSE5IcbDhWahuRtaso79vDXKvcKE7eFJQP4xz6v2?=
 =?us-ascii?Q?+bZ1+63++MBJFpC4Wtieoh8r8kIdO6tkOJSJoRxVweJkRTSwOzuCNJEfsKtZ?=
 =?us-ascii?Q?O2wClp/pcAXBjik6tYufCU80Afag2CppFXu9kmavSgLBkd8S45b9rqwuuaeJ?=
 =?us-ascii?Q?LcZr1giXMkHx6IdqtAlpcGvJ2ZlZkVdf/JQClQjfuXdpYjLpWdEshiVCee4j?=
 =?us-ascii?Q?3G8LTERrn7WB07Y+XRiVaiO9bEHgBTFcvbb4Q2bdG11vLhRr9B5IgKhvwM4C?=
 =?us-ascii?Q?aMinWy2aOvZ91AlUiUkwy3Wr+4DqNrMD1OcqWsMs/tF2jifS7suZS0WwiEcL?=
 =?us-ascii?Q?2lgZ10jIuJ1gFi8b8FxOyUIZGpfDXy2HBBrTk0PV9obeOJI/kDjGEIX5KtYL?=
 =?us-ascii?Q?L7BK6QXewz89hDWHVIvXUzf9onRknytFc5hQQohjLHbMamilCqnmM40Y8yaV?=
 =?us-ascii?Q?gJbb/+M2mzuWwLRJsUws2ANcnr/v6PSulYWMOM1JtaaJZIzw/7e8MMg23LGP?=
 =?us-ascii?Q?IrAJk7zLOrZmQ4o/GIzcIfC+MvFNb3xKN/2QCm3kTi/d8at5eoDsUfKqh5cf?=
 =?us-ascii?Q?Fwqm5qOx18I7zCJUy7BBpn4dKBG8LjK2aJhGleFtBWPezm702jHc8c2nJI3+?=
 =?us-ascii?Q?QpjgINqFhwsi83NqE6xA+BzhQMvsdTCwWEqPPx67FE2eH5kStRbLZ8SLLy74?=
 =?us-ascii?Q?IJVyq0BVIs2ZD22zyi8RskU4BmySzJTTXmHNMGIGcn6YZSwQQ5IduXF4Llol?=
 =?us-ascii?Q?8/q38w5f0M4uQgY9Ge+QEnJcH4rSYgOGVnK5RRI6EYwB4dD70J0KkehqbXom?=
 =?us-ascii?Q?x/ywA9NsHqyE+kx093vxSTqeAKWZq39Bs8JUytKNNJSd8ZfOt8+t1WVNpps5?=
 =?us-ascii?Q?yoGH3b4n5TQUe9bXT0StES5/h6wTvH7IRmf5KMQNdhvh+A/C86nqJEsejDki?=
 =?us-ascii?Q?80dAQBNM+V7KXt6fZV4hJ557ze8S0HRULd8RlENgg3F/Trw26ira6XvcHRkY?=
 =?us-ascii?Q?qrqA/B+4cpN2f5dXgqyuMxzgsV/azC5SI1QpmXY3nID+8o4F2Z5yxcxTzzDA?=
 =?us-ascii?Q?scmMknbIoTWj/olmcu/vS/qXAbCF8nloSsquUAEoXv+e1lAaR5mWP8za5wWQ?=
 =?us-ascii?Q?wXPllNpY4j5n0zp39hsMhJFdIAG7Ko9NVw8fRCkYvCowoDwW+qKtS9DXCFWn?=
 =?us-ascii?Q?Bcyo8rRW2aZWOTjWUF699I0rvu8mmdOx7O1dREwkzNGS6jA0NGO6JlJigYoY?=
 =?us-ascii?Q?rhiHdkXTqR3hgKA7BjB6geG6wc1vH3Vi6eAzD74CqF4XkL7cCaj/xIGH3ZJl?=
 =?us-ascii?Q?lwv4qkITYwnQkzxJKjHcaJtn0vAjs+bjk6TTAprgUjTDT1o75SSyHpPHYA7N?=
 =?us-ascii?Q?/J/ICVQ4TFlLUYo1BRCjrg6nSJz+z7ooa5Gr5m2V/nNQ+c4shIii+g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7663.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6hiQc6jQyyeZL3wKFuU2gO4iKZOnxMiwziU0dcTWLUBKpr1v5/JvF6w4PZZf?=
 =?us-ascii?Q?82CYfGc3ub/QE3GLPS3kaNqnSy18grawWJHPyhvAmaUFmw2+r5Jh7Z9llaRb?=
 =?us-ascii?Q?i72rX0VJv7wstuoEvzb1PqtkKqUuhowdR59PSCIynx0kNbf7anDNg+LM++ad?=
 =?us-ascii?Q?49L14908RGdRhHehdYvCz154Duh6Lb+AYBEU3K3FvS0lKcim6/BvXiJBlBS0?=
 =?us-ascii?Q?kJ3DzM1I/Z2fPvJiOcZSluVLmh/KjGDXPzHMLDBTylmBtZywtZ0GrY3Emtl6?=
 =?us-ascii?Q?Sx9EgB+pvMkWimLtH6I/mSauvf7WuALQq7r7AK7k6eoBxwiu4N0duFpnWfiH?=
 =?us-ascii?Q?GQSFw6vF/8duDHgbpBquZYvJw6eGWogwYFb8fwI9JugPDRR3N6bJk4xGIWmF?=
 =?us-ascii?Q?lJIasgpfEk7jidkvQ7miQQDywS3cjVusB0EGWzSRhS0+4a4/4NHdR0ef7Aba?=
 =?us-ascii?Q?BwGu2SiZVXuiOvLMPUsn1uCDtbmwS02YAowywWxcxv/Rti6rZsntIR8O0fGI?=
 =?us-ascii?Q?lV6Ajn6pkOGqYcbE6QMTQYy7pibc6zO1wu7v75p3cRbpfe2gJoNbS1C5I47S?=
 =?us-ascii?Q?vhdxC2/nu55DsGdrfOCWUpFg3XKktJXECCRKgGRNhxCjuBfGCK4kljRe9sMw?=
 =?us-ascii?Q?sJ0xJKLqQS77JPipx56G3WTBbFAzM/srptCAj++Y5IflsHCSnQ2MUpK04xoi?=
 =?us-ascii?Q?XnovThABCUNkb6kxORfX2oasxoSrlue3LgGzxAw6MsNXD2Xgl6ArMsuNR/3e?=
 =?us-ascii?Q?lNsiWEfi9IpIqxImvjOangOrXYlI5uBU5kVRCBUb9wqYZb5zLecvsQotaRWL?=
 =?us-ascii?Q?NFlDNGE1IZrVDp7f1O/okwvHupAe8RbimGeK+/h9SR7wVOn1WXhW2XWEr+HS?=
 =?us-ascii?Q?q0m7omqw5uY05ZrbEqF5OxdM62OE9rxB3feMsrTK56KoSynV8xOhgi8SY1LJ?=
 =?us-ascii?Q?F6rwDw8LP9Kq0/2pJC/7MrwmSvPZiiZVJKiGkKKUK6UIUVd/MT3BztslWw3/?=
 =?us-ascii?Q?uL/QbMecW/s226TscsuTkXz6OafT3Fh27ucvYLBqGVP1JV6u34N6WoG+Muis?=
 =?us-ascii?Q?EQxCWB2Y0+fVTkgU4n2us41D7yEi/qVk0stWdDal/PPB2Vfg5LHu7JCYnFUo?=
 =?us-ascii?Q?MLc9CKZaVAtEmlI0P4HKJ0UPARIzZXrn3dlO7IkcnnLocrlzRRE+TkMp9Geq?=
 =?us-ascii?Q?AksZEe0L2UD07oFWRgA1QhP1QUNMxG0XrqaDez0+zOSM5Juc2FUhXoGgOxpH?=
 =?us-ascii?Q?4BBsoxa2wcEF6LUxwlLTwA2DwF9InBn4HqOgiwo/KdaWIYd0rAOV7AUlvGu5?=
 =?us-ascii?Q?YelcyxNpIohQRjWlz+jSyQSKX9VD/gjPUVELtg72i3nYL38CYV59hf8Y67Ea?=
 =?us-ascii?Q?wJwURwe4qwqCN96hqghqq1QNJwWWnOnN9Kuo0B4scW7N0nP4Igo+ee5aiFlK?=
 =?us-ascii?Q?kSsv+MtF3hzVP3guV3zmWhfDYucVXyEIU0OxfOE3eq86hqtcSfUM/BTG+U07?=
 =?us-ascii?Q?ZEr1Cq2LEuWsiCdsEg8YTyWAwpzb4DKdT1HEH3ynp48ctioi7ndhAGxAG2C8?=
 =?us-ascii?Q?p6A/Ip4n51wci8Uz0zi2Ef/GB3TZnVzoARvuohrX?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df39436b-9647-4894-3991-08ddaa52dc95
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7663.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 08:18:22.4006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPMTFiHg9LSVQEB+i699fgkdJA6CrItJ8i3xfQOHaWkCXWvMhSCKwYOjTwXmlIUZlmAX0sampCYe76gj4uMIew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5535

Remove hard-coded strings by using the str_enabled_disabled() helper
function.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/media/pci/cobalt/cobalt-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
index 39e25cc53edb..07476227f003 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.c
+++ b/drivers/media/pci/cobalt/cobalt-driver.c
@@ -260,7 +260,7 @@ static void msi_config_show(struct cobalt *cobalt, struct pci_dev *pci_dev)
 	u32 adrs_l, adrs_h;
 
 	pci_read_config_word(pci_dev, 0x52, &ctrl);
-	cobalt_info("MSI %s\n", ctrl & 1 ? "enable" : "disable");
+	cobalt_info("MSI %s\n", str_enable_disable(ctrl & 1));
 	cobalt_info("MSI multiple message: Capable %u. Enable %u\n",
 		    (1 << ((ctrl >> 1) & 7)), (1 << ((ctrl >> 4) & 7)));
 	if (ctrl & 0x80)
-- 
2.39.0


