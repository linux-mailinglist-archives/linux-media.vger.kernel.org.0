Return-Path: <linux-media+bounces-28233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0385A613F2
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22A527AE894
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 14:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98761201261;
	Fri, 14 Mar 2025 14:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="sw0ksIdS"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2068.outbound.protection.outlook.com [40.107.103.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551261DD0F6;
	Fri, 14 Mar 2025 14:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741963584; cv=fail; b=DG2gtuMVup++npufVaVFwTLLbSzkA/y3e1B1mCvNZKW+uI3rjGWNySUS1umpQfTRgR3ZpK10yn7sHyAoKn0mkRMaLk1ywAHa9wFrayJKSBnrODqwMjAAdPAJRwRzM4dfKTES95L2+7OZnNG1w6RPOIJvOIGaKqZK78ljv/d/2eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741963584; c=relaxed/simple;
	bh=1Oewsj4XNt6xokfiSlNKUNQb4NbG4nNkPyUMeTq5vNU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=XBLw5J3c5WKTu8WbXaE7zQflW+1T+LEoRNNUe9v6TMI38QCfm/PODEX3HRq0Pe20x9XZizj6k8Fyc6oj8tRFcWuX81vRw8KROs7aiI8rmo9dDDAwBhyDqgBiphodFeZnPrc5Qz+6mM09HjFHQw3c4FgHETz02EFu9i25WjRnxcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=sw0ksIdS; arc=fail smtp.client-ip=40.107.103.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsVqjjRoVj/fD+XvWhpMxbAj5H/Gtdt2yyotWaYWdl/U74Gqf+2jGXV5RKNJ4m9PV1iHhEgB5DrJyX4Thv8QSClB4fln20ZGPX/nVhcqMAvyW1vDQr3jAY1GwkX7bSKFXo4otTHw4RERpnrQqUqggGvx5LUUkm/rPLvnLPMDZFrDKBuXSJ2QOUsBiNYFVjSI+sQFU64FNcPPx8GTrq942p6MmMfzcOhW1j9EM4UE+CWg9zGVtv/w2o0cBircswIC66nWUP4eDXu3XYDYfTBIwcW/3e3S0/xaInyXq/l7BJesZz5ALeDesaJev0K85vEHjvEK+B/7wsCdGtT13u78Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyIhlryqTffvbOslgC9jaZL7kWsAmiR5RzOr1CoMFHs=;
 b=Y5UPrQkhkTrByUsQbkSkVwyhdWEskJ64+ii17iS4B0jbDPpSfxBOGE4aJ+7l527k7f5NCGNQteBhWz+FDV4dBtpmKsmXmeRo4kzX7/SnK/hxUjvExiyX84ymgC+sTmJMYZi99Ok6NXcrtVCnTPtvC3pZOdKA0mpIfOsuHtEocMavgC86jLHyE4ZfQkC0QhXLCTJPmn/3+fm8ODDapzHHHSFSS6hSXhhiJGGzAlx45NsJz7pzBCh7k6g5Yb8QOfStfDYduDFnSsjvWLko22nFkLC4sMiPNhgL0ednwFsXEP9oeJkvI4PVBXryiF9Y31KEpxysJo7ENzseQvAYnXdvKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyIhlryqTffvbOslgC9jaZL7kWsAmiR5RzOr1CoMFHs=;
 b=sw0ksIdSMuuLsbWrxTpDnL4V6VU/yPxG28oA1J5McC+j0pGwCF6kgbPHneECKywetgt8UffYIb5aluIjrm1SeQjLeixNapn7PdlM3HpJD6bry4NEe/4l5nzzf5MqCyYdi3t2foJyXTXKSuDf/ziWEML4edR9cqMCNfSpQAAg9SQyQ3nZH117ImCtY2aSYTFfh43+rtDCyrXvaHA1OgNHLboJvCbLALtisCwVlPpeNGj8nmm/h2HmBlPpAhuEGXRP3tfrQOR3oQVyVPmWdhTiAZCymtAV4aoTGhb1LIUV+CmpcySJb8zaaT7w3bDYAkAh/CM9BPgWgUz+1XMRdudEZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AS8PR03MB7208.eurprd03.prod.outlook.com (2603:10a6:20b:2ea::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 14:46:16 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%4]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 14:46:15 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v2 0/1] media: imx: csi: Parse link configuration from fw_node
Date: Fri, 14 Mar 2025 15:46:08 +0100
Message-Id: <20250314144609.219486-1-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZRAP278CA0018.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::28) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AS8PR03MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: 618bee19-5405-4350-b6e5-08dd6306f918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vtD80hrrBTKe9ZgQ6B/Wz431d9AO19v05L7bPckPWd0W++T0j4aKuYTMSN6M?=
 =?us-ascii?Q?NFpSX8SAVeEw1UGKy/XnCx1CfNmLM1AM7jlZVh4S7eIdE10ZpzIQmkkT4zUi?=
 =?us-ascii?Q?l0O4dl9TjXNxl4sW+KhFv4VnGAZoCNZ7tnEUjAcO5zjaIzwGpoVwL67xB1Ys?=
 =?us-ascii?Q?ZKIWVb7Cycd0Eyy/niLOeQDxWF75TVeCHdWBOSRk1pxNJsZBGhytDuhyUzhK?=
 =?us-ascii?Q?KKzqN/DZ2C2RLLrh8sRNEa1HuV9zHZfBGuvYrfQH9pIHTZ7qgEQmKgWWo/6F?=
 =?us-ascii?Q?wsT8z3EcBQX6YGFcBDbKa0DDuS9InqJvaOn8dBynlCWQLZRspWeIac7dpAvX?=
 =?us-ascii?Q?IlgCisyDkc01VKaG3pCYnNDWq7gaSxSS9+liTgWVf7f0/Y9SNs87c8vzoWvi?=
 =?us-ascii?Q?TcK4NCKxHo2gN8vCGCXcYZLcCoBqt76lprs76p1P/gKVJ9viZ/eWNFmWSomW?=
 =?us-ascii?Q?o3t0yQXgpzkz1jBGUUP5zu5x787cSI1PxiN5EJl5bJmDkIApONNtN6BobA+A?=
 =?us-ascii?Q?YRGXkRFHMNdiwka+MCovydxSZAZIF9TcYzshsOtumxy7kPTPoXxetRY/4wg9?=
 =?us-ascii?Q?BAsfqecineV2+m0hHQfYfP4hIjuoB497Yoi8+HPbnLsKfbj7JN0wkEn3HDdx?=
 =?us-ascii?Q?8tm3OUYGBeZk19i4qmV3ToiiEny9U4nzk+HeF7Z6NQsCFDo6wVeskJSvJyho?=
 =?us-ascii?Q?vTKAsdIS8gEt5qAPmuTrBAHVA72+Y8q5PjhTQnt4zHyp2XiKx8XbdLn2xNGE?=
 =?us-ascii?Q?RosJT5tELGO95ZYCSt3OOLwIjH6tTSNQp68IiQoWvnrQrg+pKeMhtE50pIb7?=
 =?us-ascii?Q?2YOvhpIDsItulgtrwWzP5CiNMpQPLonLT7860z+6RptQ/Fkvat362UCcc11+?=
 =?us-ascii?Q?fgUAsqPEtHTB15boaZlEjPdTTmiNGYbOFthOCXXP4uK3oqlxa6xESGFRMJo8?=
 =?us-ascii?Q?rZ6Wgz6PopE+tMUmYGd2sS3sTvlkqf+VGf4QQR0lCnOFhZZwuNs3oj9PDU9J?=
 =?us-ascii?Q?wNJ1u763FmrqesSrdqBlRg8XsQ1VJVKAEHiW+YmZLoZ967MwXn33QUVglLju?=
 =?us-ascii?Q?qb/6AvQVqm0Gh44L4WMf4E7y+uvC72R6KnPSxO2igleIfwiWVcPgON16r53r?=
 =?us-ascii?Q?Ms+str/uaT/VzRl2guOeVIVXjzxcbi8FzZiHA3BgG3v9ZjUfuBsNF4sqx2fX?=
 =?us-ascii?Q?iDaOlOsGVWW4FaZ0D0mdEGi4N6Y6NSKGt+WG8xWcQ84plv5MT38J5J2Egg5Y?=
 =?us-ascii?Q?5g08NCNVbN3TRWMqH6ICRo+xBl2P2arCwFqIbvGEepD7hyAYH1RvdC+Ey0+F?=
 =?us-ascii?Q?6tIxuo+C/gD9mrB8HJSTIcS8RLN7luWI4+7GIHeoEHxbRpsklsQE5QIzogG0?=
 =?us-ascii?Q?t2D7UH9ZYa0r8+iMcPBhuYghhgGONi2uM80fdRipq5lpCFcUqd1THIRLicfm?=
 =?us-ascii?Q?Kzr9I/fksymTVQBtf1w6/Gu5u4mY/cYF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xjw8K0zkmh1ZgaZQ2ptDzkaXCWjPkcy2TndjXXs7JexRUtYlaTkqC0GOacZ4?=
 =?us-ascii?Q?IrUBrUk1V8e/+MmeT6IO3gvNYlo9P/2Dq+X6a6bGX1DYXOy4a1GhlPpvU0wT?=
 =?us-ascii?Q?d1UaOd3Tq72oXmnUNE+bPVe0RHAuO7pFrMX9vmDY050LRBAKKYyoh5S93EYV?=
 =?us-ascii?Q?nX0HO9ZYfAqzehOj7kIiSvteN+tHPEt8NWIrJQO74T0+7sOuGlwBGfHX8pmy?=
 =?us-ascii?Q?dfA7nBBpVJC2QJ5FsbrkSHzeXpZI0+3bwMVyZ5Ee434ETpip1TtXexW79QLf?=
 =?us-ascii?Q?3GASREQABQQQqcMpNJNNOK1VYt0gd9jNLM5C2px8MCzqWYaiWjPNElCuznY2?=
 =?us-ascii?Q?G+BMWSuoWLcR8AD/bmzRm3vICPQTZtamPjMNXccvYOzTx9x6kAFbWlwp9Ybm?=
 =?us-ascii?Q?AL/U2aSLqrx/0u5Vg15/6zqpBdLL/IjFDLnN6zv3Cc+twWbd2ATLJoruFDGm?=
 =?us-ascii?Q?NuKcSOm54zk+oykxmqjTRH544x6xnRahqeXDtA90sFueT5V6fyhyqvFtiOcB?=
 =?us-ascii?Q?sBUOt2awSrqZdGU7RO/lr/Wvb/y351NpYyQ1KdzMlGaDUtnMdmjYgFhn3zdO?=
 =?us-ascii?Q?VlygMFmPIKRr7XVOmDcRnz9ltJCOn6/NxVVd7NTaMJXGSLienYiAUgOpMJAH?=
 =?us-ascii?Q?saXScC39HW8QmaPiCJOS9tFESOJ1M1CLAG+7GclBDc9g4iVNHwRZhGJF1t61?=
 =?us-ascii?Q?RJkrghQA+vmRfsH2e4Nwc3wCTWYKhWAQu55qYyyWvekyBLmg7lWTB/xDUZpv?=
 =?us-ascii?Q?AGZY59HmEApYrHs2GL8hsOwYWtPqEnIzd5Plt2aPgdVjCVpHorHC8QC0NKLN?=
 =?us-ascii?Q?DKSqb3pHoYTUfxLO/jFS3FzvvI+wgG++587FGN8Z/xp4oZhRxcKTXvXuWgAw?=
 =?us-ascii?Q?5tRg488Fuwp0Q0feMOWxloDprBD0sFZlLmDTrvBQGYh82aU7CgCSGiAYpT1q?=
 =?us-ascii?Q?kdLBdlqcnNG4VW1WVDf+G0L+7HAt5yXwlpdePO3oREfn96YOc8YArBdjpuvw?=
 =?us-ascii?Q?H1kevjkX4qBRVuY+5Go6nrqNggU0XU00Rt3cc73qjPcjUSdhj1cAbg/5uDRm?=
 =?us-ascii?Q?k4+e1tpZXo1l39wARWaLZSAi3YQbpk6E9p88kHdZXg8zbF9CuKO+vYKdYfRu?=
 =?us-ascii?Q?4/WFQON82dIY+pY+XJyxq3Yi1rBe9WEjLaehDUgJlea8vxKINdrdA819r0Us?=
 =?us-ascii?Q?xZ2agzqejO0QBAxuxgxeLEfbgConcU1QHDADcV/BpiuVwW0ZzQHUYwkQPF/u?=
 =?us-ascii?Q?cXkwQZcePQ3Qf2cs2bXUktH0AFMO/8b4AenRUN0k3NlxjC9HXVR3zQZyc3H8?=
 =?us-ascii?Q?uW2BNNB2sSTpLHDJllOQ+by2N0QHsFgHT5Ne76uGtVevDlV76UNXPI4N4SfD?=
 =?us-ascii?Q?yj9aoeD1fCmCTsB2boHUDJIZw211ZGyneSGEcGM67hxT5kML3/mWoCWZYjYP?=
 =?us-ascii?Q?1pRHNxEMZJsuG43wChNzHtdhHb4NCmEUsi4KbimLCWotrtPlu6Xn6WXlasvD?=
 =?us-ascii?Q?u2gj59AJWo9rPXEEtQyREf7yvKgbvhqjiQd6JK1qRUUhBc+ek2mrHKkMR3+c?=
 =?us-ascii?Q?RrN0q94ipY1zCnBBl9S8i0x1/rnvvDyOlwukBYB1?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 618bee19-5405-4350-b6e5-08dd6306f918
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 14:46:15.7998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPaUa8QzieQWIl0pmBMHvHCIYl1zHl/r9JddqOj0JSloTfxiXKpGapxywnfzze5dbsSUO/8uG0EkbZTsaXKWfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7208

Hi,

this patch fixes the imx-media-csi driver to work with camera drivers that
do not implement the subdev-pad-operation "get_mbus_format".

Changelog:
v1 -> v2:
- Factor out the function "csi_parse_upstream_fw_link_config" for better
readability.

It's the follow up of this discussion:
https://lore.kernel.org/linux-media/Z8AoA6WjbXQufqR6@kekkonen.localdomain/

I tested the changes successfully on an i.MX6DL with an MT9M114 and an
MT9V032 camera. They both use the parallel camera interface.
Sadly, I don't have the hardware to test with a MIPI CSI-2 camera.

Best regards,
Mathis Foerst


Mathis Foerst (1):
  media: imx: csi: Parse link configuration from fw_node

 drivers/staging/media/imx/imx-media-csi.c | 36 ++++++++++++++++++++---
 1 file changed, 32 insertions(+), 4 deletions(-)


base-commit: ac9c34d1e45a4c25174ced4fc0cfc33ff3ed08c7
-- 
2.34.1


