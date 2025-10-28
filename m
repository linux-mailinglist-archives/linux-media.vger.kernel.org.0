Return-Path: <linux-media+bounces-45737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4EFC13472
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DE8F1890883
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6525A221F20;
	Tue, 28 Oct 2025 07:24:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020092.outbound.protection.outlook.com [52.101.225.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4615D1799F;
	Tue, 28 Oct 2025 07:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761636268; cv=fail; b=tEIZU/ExPYa3FPZwzebdy/Slbo6dflLjAYg9AJGgvly+BRW6Mh30sy3cd66u8iHTMITyLsciXY/bcSESuecAkF3/swv+2sL98FaVFc7qjZp+y8CWkmYb9AfrgouPj75BZ2hmgfHbjSvK7UPd2n8/ZtENwV+/e1MQnTiMKOYH3t4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761636268; c=relaxed/simple;
	bh=Cxwh3U4U1qJ5LfMJ3NyMGhVExPxOchfSxWYVHKN6kDI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=R6hW4+9sbMI8NZuvoFEhwiujG2A/xYIKeMrHODufQy/8EkFivo9CJxFwVbkEN+QKjx3hKieKGsn70abpBy/sCLaExNbVxQJISZJnIAsg9i/8LQR+IwGOIJjdGdBC9eDCLIRl7k0nrMD3WoJsQfXYdJeFPx6ve8FZBOsWEIawD+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wShFMzCDWMz8VQx9GDMCeJAdWPEIlVKDyfXuJhW5mL2KVLy7Hh3l42EM/+7wnMo3AoW3ImxLM1w5PQgay7QhDliyK2p8sQOaXcq0wS/PGV80yT1wftHugJz9SLQuF940cRWAH1VQ7m/vwszsLotn1anuf/bLAm76lOUcy5XzOE2j7Jac/aszvhu4jgE85WUB/QelAa9JXElaK9abor6YGBdhStDR/1+4Xlaw08NAI4OKz++MBC1MoCVvNtDAM158jUbWOe3cJfq6+xHkNHT+/CWwAHXTNcYqq52DzUwWSWeVbFgsxKwQUYFk0b3xQ5QmPIaG8LZS9jYfvblf0i7Q5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PI0G5lyTSSjlWva1BamUM3ztLVpkiOjqdkZeAZytsMc=;
 b=IGBTm/tu0E5v7bt6obBu6kpVA7GkBxlZqnwoG1O+DNyVFN+nJuwrHFmTeaF6PNoziDNDTO/TC79JFiSM+fVEMZv7Hkl+yYym0xi62B2Iv4TVr7yoTS/0yrXnuMGcgr+hfZNx+u3xAug5una3lQqwqgL09ysXrOVcbgaG51W+h2fbFuZYvgBsPFP06zOT/xNM9wTTUfrSZvVPpqBbgFxicVqpyohAIic4AvPAGiy9BvRWrdQRiprwZyEtRTLfn6OycG8+pP30nJ/Zvf3WsCBR2ANFQLDpb5bhhj9POEHnCfuKKg6DUPXp2YBhB6w+iS1KtMMTVSHZ/DViTwHJIznTbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by MAYP287MB3886.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:14d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 07:24:21 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 07:24:21 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: Fix vendor name typo in OV2735 Kconfig help text
Date: Tue, 28 Oct 2025 12:53:00 +0530
Message-Id: <20251028072302.5047-1-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::11) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|MAYP287MB3886:EE_
X-MS-Office365-Filtering-Correlation-Id: 57cf6450-b53d-48b9-ed94-08de15f30381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dEbqALQIGbMTq4JUDSBOBM/7GvLhWOZNkorVcHxyoK7hxZdQgLpHAmwiWQLf?=
 =?us-ascii?Q?du0T5O3dM6rKTjqR30YVyrG8D4nuR5BKMSG7qdZzp53+Y3iS31T8FBeycZDV?=
 =?us-ascii?Q?YSUYDi6Ki0erhXqzlogtsM3OJz+znpOqCDZD7FCesWZjy5Mf7mYp3ze1CGDs?=
 =?us-ascii?Q?Z7UcQP1a+J4yIxxo7dbipsJuju4nmDe2ljGB/pVV4Lr0q0yAVn0OSlr/KIwp?=
 =?us-ascii?Q?UoNC3suuBkPr0NRlDpBW0DKVeHAV4hG0jpGa5t+vDMD4Oi9/X7XKrgvMRZ42?=
 =?us-ascii?Q?kVABqynzdVTO5NUwXiQEIMFrPqI2SJqGqzNIOsnht/jeBAFunyzN6u680gEF?=
 =?us-ascii?Q?aZ1Oh6inEbSDW6TJODBe4H6z0VblBnylRUV3EwSoClUWKi7MTO9e2OowXxdn?=
 =?us-ascii?Q?rrJr7TxnLz/x7qjmDSNEq09Ewy7tV8DLyupopWJnC1xht5zWvScHZy5b7O+o?=
 =?us-ascii?Q?akY9ZvpHo0XzbCBVEkDQxPugRXpt0gp1p/6C5j0alBjHbOVVil5jCAjxsuRg?=
 =?us-ascii?Q?30b6S10RSW/HYGqxU2hYX4GwkqCML1YqiM5Y29XXD4JDvUTleY33Hu4VtRKC?=
 =?us-ascii?Q?hPmTuMgl+2IHL88a/u3fcUW6yqzDRGHgPvjnwCXsViY7tjIklrJa1GMnqxdc?=
 =?us-ascii?Q?5HxyvYjn0h1Y7Br2pFrpwxgoF2inVxaBCMSeKF+aUOOiRKBFpWDFlwk/knAC?=
 =?us-ascii?Q?TD0a9z5ANI3lL0FEk4L1JpMO+BoRN3iD/EDXKd+95cN0MF6McJtmuPeu9ome?=
 =?us-ascii?Q?ZcO+WWWCRJT3L9FXk/zVhnBHoSz4uPd74JIQhBDes5Ai15n+pMnedr2qoUdv?=
 =?us-ascii?Q?M0MAw7T4lcm40i1XbHqACCSRSFRZ00IWhg1e52pgtdGuh/Wxf4GqyKH2SI02?=
 =?us-ascii?Q?L24d4CNnMXcnfXmYWKHZqNuj7QnqTxxuGeX9mvVcCORrAmUMk+lxvz0pT73G?=
 =?us-ascii?Q?pOAZplp0AIe7RDJw4IOBIsJq6qz+IVJiFo6nK4HaBThMf79N9SUCnshoTCeg?=
 =?us-ascii?Q?Ehz/XvBiEnuRgT554Rv9GfJ1seVl0aP1/4qRUX/yaqtbgwhXwhln6IRv/wMF?=
 =?us-ascii?Q?FiuxgRMTmnW4mYAqtRjTgVj3PjGlwfkmP3Dl3eXOW+LXEVHy+BuZbGWy9hPx?=
 =?us-ascii?Q?Ut/nU0lbLAVlmbxUnRa+0U2Gmssz9muC3F13MczG7NbcM+B+ESos8ZWhxbuh?=
 =?us-ascii?Q?NLhA0Sk793UyozSNVeeRpF/o7XbuDifiw02mbqEFxeipoDZ+F1uVjOFScZqh?=
 =?us-ascii?Q?zkiVv8GfgEOC3Hz/nyLAuW4VUnL30pW6UIKtQraFhSa9ARpvJqiLCGWD9zEX?=
 =?us-ascii?Q?SSif/nS8HcBcfKNL2YiukK7lbikUS5stE6xfxA4eEASgSoRZByiK+zI4cAfj?=
 =?us-ascii?Q?2ECsRxArnB2oUjhUQmv4pa21Wqi3/tTYFo9YIi6vUq2QdyQn7KhCllqTt1lR?=
 =?us-ascii?Q?4hVJz/+pgn2/poh2ffw9bHlrlHlnUMGzngNo5mmPlTuPhs4iOL2ODmCzCPlY?=
 =?us-ascii?Q?flyK7O5JHxTOTplm5a9mL9HONhIvpn5YRPbt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R6icl6weve4St4Il9i2L6UrJa+RSh30+6EoYVfrglveXt+htJlZqy1VbpPxj?=
 =?us-ascii?Q?aTzM50eit1+CfP6iF1D3GykZvDd53I1XXVZNvVVqfPHQ3BGFuFgoOzDNylJG?=
 =?us-ascii?Q?6xk9ZJTR1SucV3ceENDCcwaRNka6mRgoYKfLyEYLS4/oWzsME18FPE5ida6z?=
 =?us-ascii?Q?PokS9QRgm22Cdys+v2uykIouvEVA1SoH4oRqXgk2foSpGs9ijSKR/ItDmzoC?=
 =?us-ascii?Q?ipKLN7XY8EWvkC0TYYGnr4u0H1taxwYSTN/WUjBtOR3clG9RQkgXzhca5bc0?=
 =?us-ascii?Q?tSSulPjmaQx32HGmdjDtNLXD+nAjloU6Fc0MHx+bvgTPftrEZFOmJA9QUdrN?=
 =?us-ascii?Q?GKsv0+5TwRbkp1f16Fm5dokAUDjZN4/45AoIMQrLwTFfwreZf23VMtMNHE7t?=
 =?us-ascii?Q?cBup7waQ0tdP9vYsEdfL+/q/0YVt0YUjGqhGbPC2uOGTtT3ayey78142lSx2?=
 =?us-ascii?Q?m6UQDyLr4XFoduPhOozBgfu/SrF4tJJ4lEdU+e1JkA+RoC4xXiybKJgKudUj?=
 =?us-ascii?Q?dEUpBFE7d2pxZtXQrwpOaJsaqJFXDPfxs7W4ybSFv7iO1krpw3G2ShP4uYgI?=
 =?us-ascii?Q?wvEkDr+tFECz7L/K1X06TS183EaIRSMaZ9iGclTGbJOGdVqGsPnZZg73UiXQ?=
 =?us-ascii?Q?o0xNMgC/XvZDPqWuTnufxL5JHzAG3py3pcGJEyHv0k6ct5Xab07+Hf6OPgZm?=
 =?us-ascii?Q?Sge7pR8pKRyrw+Uppz1/tMPKmInNOXHUGSzpc0xRBYUpoDGQqIP116+/4QxV?=
 =?us-ascii?Q?Zin4x57uLZnXtT1F+jyhUO2WLI4upgdpNaLrvCB5gWNrCeuu3dsIS9UU0qHI?=
 =?us-ascii?Q?+4HCC1XbSxpXRBYh9MKpQGNQgffE35h4Ss3/kwJ2Ef+1tHIhE+Yz/EAhaMoY?=
 =?us-ascii?Q?PM+OmI+5cxPnCV3dlsTYFktIbxAvT4iCADJA3rmQzHuRoYqClMj5ny/9cwj4?=
 =?us-ascii?Q?3Onynv2fRALavf6f6PgA4are3gMaL6JM3K22zjC6H6WJKJn/3ipjXCgxfn0z?=
 =?us-ascii?Q?r6zva3EkNROQM2KyL6WGr/wDdizYVQVpZFyRJ4T6DUGh5vtij98S4gfubkgr?=
 =?us-ascii?Q?ioAA/XfPOFcwTrV3myiKxQQE9BixHUDbjS/1adnEk/isX3JPS+FyYIB4HRzD?=
 =?us-ascii?Q?UD3PxBSzxh6xYtczJQFwPQGvkc0wj7y+yHZ0FvyVG7r5OFIbE7DG7zApQ2T5?=
 =?us-ascii?Q?4KBSzkg4oCQ9Ufbxxfr3ei6wOjZR5AuBZvAgPSxAcsgaFS4YYk/OENP3E4kQ?=
 =?us-ascii?Q?Odh94KYmxDuC1b9z20n78V39NNokxESW852NdzkkomXKBkS3ix3H4Dy2/RRV?=
 =?us-ascii?Q?vIkPnmo6QSyfq9OfOWFyS9UOtLxcDZE7TDgAwGLHunbCP5iOOFkwIvHf6y8F?=
 =?us-ascii?Q?X9bCTx2unjifZRFTVBritpjbya4dHEwAtzRPmTmaVtMXJl6Gf5hUa1cMXDhU?=
 =?us-ascii?Q?ilm71OFpHPfzc3590+r00oDo9lOFSjaoDGUBib7fhabY8/vt9ZtthVqcSzNQ?=
 =?us-ascii?Q?Za5uLE/XP0IL2IOc0o4Yzxd8rlxFGzOsIlK3j+8o3TphKTfUpb1shh5hLRru?=
 =?us-ascii?Q?BjHHJBdm1CsL3EyJtf8os823X/+/NKN/Kt2xQ+4I1ilNUWf/s7oLo0N74MI/?=
 =?us-ascii?Q?HxrUESmA6XjETUft5rI0Ca4=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 57cf6450-b53d-48b9-ed94-08de15f30381
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 07:24:21.5567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3O5yq5yx84LT90CoDXnd+TXB7Mtc4Z8Q6F6M/Rah1sMxaj98uD9KazqGl8AkN3xnlOPatjiliVG6IBbzo91Cp/R99uJ2vB+Zmt5QiO+mEi/zJItQrAt29T/x+VutLG6V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3886

Fix incorrect vendor name for OV2735 sensor (Sony -> OmniVision) in
Kconfig help text.

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
---
 drivers/media/i2c/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index cdd7ba5da0d5..4c1eb4279dc3 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -471,7 +471,7 @@ config VIDEO_OV2735
 	tristate "OmniVision OV2735 sensor support"
 	select V4L2_CCI_I2C
 	help
-	  This is a Video4Linux2 sensor driver for the Sony
+	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV2735 camera.
 
 	  To compile this driver as a module, choose M here: the
-- 
2.34.1


