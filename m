Return-Path: <linux-media+bounces-22091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 499629D9ABD
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 16:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8B6F165D23
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 15:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1A21D0DEC;
	Tue, 26 Nov 2024 15:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d1h+cbct"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309411D88BF;
	Tue, 26 Nov 2024 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732636418; cv=fail; b=pPzMAWZsiGMh+R9R2VpBqxA3TLzGwDbSidjhE36Nf6n4NQAm4GhmjErDCIAZ0taJpZ5Y387OOwoY6klRxC3bbqelE04fHxpvh7m96KOzuVOa8W4mpmWnvRyKaho2A20XsDM77w6O/y73HO/I2KIJ7Axpi9+xTAuGJTwHBTX10eY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732636418; c=relaxed/simple;
	bh=34RPr5NQTrFdHiwYk7+t2jPCO4VmcE+w56LcAAJJHt8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Npurk6MyPFB7gUIIYujB6+uHoNPFnmGc4oiimBHBNE0JmAEPJGiGi/X7+FP0W3/b+qylI5Y22MpBEAhJFWllgA+JpzcVUk5RHSQ1gLC5fq6/9TNdDmHyaRahTvHM7XeW8ZQf5ad3314svfrXn9PZyuS1e3oAnNzgHeiZUw0XIfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d1h+cbct; arc=fail smtp.client-ip=40.107.20.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/I7n1kabLMMg02PjqlDAyi1hgjOBjRhMKJeawx+xen1LMmAupakIfgsRuRomYKaxmgP+dPEV+0CSWKRJ1epOq2waqMjmptUZGMxQMjlIY8kaE3DC0i0ptMkoEz3NJQHmP4GE1aT6ibnNwkjNl2Qvk+vND9+1nVM5fyqa9iYl9DbpTXZ7GLk5BSbnax9EDTaMmYEY+TK7BqPoPP20bC1z2fP3vqrDsPgC9e37/OE1sVvRKH/bq1Vv0f3iU8czPM6YVCVkzso6mHM0GIW+f4Llu0Dr5ebtXXhjcsckVWta2ZjIZpCCoBOR3M/CgZH6ONV4EA8vqlNn87ll9G1TSSOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udamiqqN2d9qNnXsK+VuR9xHGH8Lp50BbSe0XjOHOf8=;
 b=BDvLfHJlfso0uiPC0f9Wu9SABXmsOBwmAYtD6CotG2wjpa6fHMr7LSxY53xPQEud27InBqp+j4IYiGPUSX2qUUk8YxnDi/MIFVfZ2DlOFQ0WAg/DzMtDExsYPAUC5uEipfGkLR3X3vP5jJbYbfa7zg8L/nYw0nD3tiyBmGxm58WVZ+ORxUgzyNujB8BCIICfaV27djqbmbPfc41aiMCz2JAKGiCCiOQTTt90ZffygCCu17BoV+KQAOVuulWgLCphDzYkJnMOhqJnto5jcI6rCB9M194hiDJeezdcn807ooe6tvbzrwblkSq5gYNWlDIK+83PkELBxDiJcImDKaBY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udamiqqN2d9qNnXsK+VuR9xHGH8Lp50BbSe0XjOHOf8=;
 b=d1h+cbctFGfpdlvQNpsNBsC20eE9b9SPn2c8ZfSLhl/582jtjxRTANGnjeJgj44CQALhTfmdHa9bOBTrFIiZOBWr7/d6NbTH11eimxGqnw+O51PUYrvigvuuTdy2wfpu4/6HKTWrG5j+Qdv+Q6BEy+Ra5c0dm3lkwDTudLUCHC1iU0Qoil6pYSa/A03szSHxiIqLHpD9zAmI6eKKzmtF8ZF4BcLR03PBD8h9tiYjjRSAWf43Je6sfPMAFcGTfPsqeniBdgWajqatgpBa4s/OTofuhH+ZL4ajpRKOTA97LfnTHs3iuTzgDB/Mzoiz1pRILq8YtRnj5yhipe4PA7ekRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AS8PR04MB7653.eurprd04.prod.outlook.com (2603:10a6:20b:299::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 15:53:29 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 15:53:29 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	bryan.odonoghue@linaro.org,
	laurentiu.palcu@nxp.com,
	robert.chiras@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com,
	alain.volmat@foss.st.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	alexander.stein@ew.tq-group.com,
	umang.jain@ideasonboard.com,
	zhi.mao@mediatek.com,
	festevam@denx.de,
	julien.vuillaumier@nxp.com,
	alice.yuan@nxp.com
Subject: [PATCH v2 3/4] MAINTAINERS: Add entry for OX05B1S sensor driver
Date: Tue, 26 Nov 2024 17:50:59 +0200
Message-Id: <20241126155100.1263946-4-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126155100.1263946-1-mirela.rabulea@nxp.com>
References: <20241126155100.1263946-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::36) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AS8PR04MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4a73ae-2d81-4d5b-a7f0-08dd0e327865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BDnX14itbADedSjOdEZS7Ccy52cmtqM1Xpt3MOeQDhnh5hzhTPyhAh2xlHT0?=
 =?us-ascii?Q?iDiVhANHTFyKQemEA3qTigbctvSYluODjFhcOZoADxnr7DRDhXn4cy+3Iq9P?=
 =?us-ascii?Q?W5ym1oeYINQ+9ZRj/ePj7WKy16DMK/7HNX91/mFCctOMMByta0K+DCOJzT2j?=
 =?us-ascii?Q?vPjVmltfnK4m6L3z4Zi9bvs1hQ3XVe57bu5tgGHIYBobMwqjyN9oQX3kIqWn?=
 =?us-ascii?Q?j69rNOyieH8npNB8ilfr8sb4B5ipC8X8PjpNAekHOpGVn4WEw4CvvpGFEGzq?=
 =?us-ascii?Q?vWnOWqQWVAmxWprFhNqzD0NFA9P7ZXRlz9K/3aRd/x8a4dkt56cTnv+xkHwH?=
 =?us-ascii?Q?1laWcrBUNFi938i1StewwwGHd7ZUdqpRPqI/9CAMzj7fz8KOBBtzFa06+jQ7?=
 =?us-ascii?Q?ehgEBdgh5Lwc5rg7+kY+hXt9RCaHTD29gr4YBvCGfKS50odjM0OsGHmdf6wd?=
 =?us-ascii?Q?s5tVlPq/N1VkvB6AnkYEoCq1ihjsfqY0TMbxqlYkCyVwJp19HHHsDYWH3IQ6?=
 =?us-ascii?Q?9s2f/Uame6IHNZUQpntnpKLIOSuJM/nQkll3ygGS97ZJncGYBlGrH9txrbOH?=
 =?us-ascii?Q?OW+V+mBj6DbBp2tC0/D/hfy7MNEedA+htNwBZ4lYwQU/0t8Daah0mpFOcPMq?=
 =?us-ascii?Q?YmyHCkA8Zy1pX82bBUBSntElsy8b8SSrt7EDQXjON1TdV1gGwkVYAz72iO/u?=
 =?us-ascii?Q?6isv7qgIWFOdcUBHy4AkwSqVfA4p0NFOy1b3oZNtvELBzGwxqRM/ivo/ruJX?=
 =?us-ascii?Q?UWllkR1fwwhkCjlrOGqQz9LPsBRBbed5XV4cLOY8Zf5OPgr6KBTc3vtkGeA3?=
 =?us-ascii?Q?LuKgYUCNGVRfgxAvI5JGPBeYriSDpGnig9yDNHXqNIIekTy96QMuFqzuoJ7I?=
 =?us-ascii?Q?FUcJliVKMZ3pYxXu2420J+GVcYhppZVFkueybgQmTwzcurywm0XKvT7SuXwC?=
 =?us-ascii?Q?IM407JDsQSkFUlYg3F8qbNqJvXr0X+fltLSU9iwYg7yYjwrFDVdykFxKtxWx?=
 =?us-ascii?Q?/FdD6KFVtRquZUlU81mEgITHyPk88cU5O+/IXUp5UWXK+kgFWd1nFYJzEf9X?=
 =?us-ascii?Q?muIEnA0tSe+Z2WjymDgiQ5guMoUAdX1tzjnE2240marzUpI6WaDB+mpqSPta?=
 =?us-ascii?Q?us0W3XMYLkp4HHapi434wpbGJgRT/OCdoPAxP7tyJ2TLKNE83ULAYPFoNidJ?=
 =?us-ascii?Q?O03YX+/pdR6vLF2/PdWtko56fWzjKiWd+D8O5A6G2BZWNU0p10XwB1t8goAK?=
 =?us-ascii?Q?oMFpkepKs9dml8aUxRXfVTFCZCMV08t9ibaHntVJVr+KO6KObmblgggjdPac?=
 =?us-ascii?Q?jzC5ERN20noY31vdCrvw7D6EU3l7UqlQuNEkwvrMwb79zwvTWrOrKNi400Nb?=
 =?us-ascii?Q?TWPAcQmG9Md/qy8YbbZUJEJZ2fzW8xcgOLavF0XEEYiqmPEQxQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P0jB5o15Ntz/GUtKZQTlyW0fXxkB3LJziT3BIQmCKb3E6LTVXiDtSOqe3Omr?=
 =?us-ascii?Q?CFPJjy/1s2eJHlIM/1DfPE3OzGwWxAarV8jUd4Xl5j0VkCYe9F+rSHOkBVmw?=
 =?us-ascii?Q?QuzDf9Ixp0y++5gxdMO/Lr3dVo1DwTBMsjqS74zKBFCRpuUv8A9hnQfx6A5j?=
 =?us-ascii?Q?+rpIi4Who9eLqbwhdAQ/bi/bKYP/wVdVYoBQnS5r175hGaBPdw3cERzgWvQQ?=
 =?us-ascii?Q?R7VKWzvYzr1TTG0wqXpVs9J3skInJN9nnj+ft3nmamqc0C8UhD5ltql6Csp4?=
 =?us-ascii?Q?++/Wx7ESpNa7pftK9S+ckyw2TBkesBH2OWUdK0+6ud/p4b5h3dAE0m4PywO8?=
 =?us-ascii?Q?trZTvvymZrmezuaRrEIrbwn5E9GjdgxV1HAAixAvkOSd3GRe+B6OE/fIsLQ0?=
 =?us-ascii?Q?15r0RvustB4aq1J2UXHOnaA8qB2qaqKv73bv4FSgl99UcXYPibSJ7iDSrd7R?=
 =?us-ascii?Q?X2f/nRRgHttjVp9xghbRCl9KZzO5JuEAUGfpRtI+4wSsSCgZLwKUb+B9c/l6?=
 =?us-ascii?Q?IhWHNB/nnRoTS3NLmFpI1+2ccr/eq3+a04uz6M1jFzRGVJKr9QlX9JxnfrhW?=
 =?us-ascii?Q?SKWvx4ED9d+PcsF6KL5OvRUGXf2ajdv98BvR56CNM71Sh4f0BjRp9koffQvp?=
 =?us-ascii?Q?Aq/qaw0Gkuew0SK2Qh0MF5zcv9GEgHZyyVsx/MM/KY7X83L3WbdW/Xbu3kJ1?=
 =?us-ascii?Q?arQ5c5Ok/41h9wEKCHd1Gw/TsJ+zo3w9BfhHFELGUI5NLVRBVSuuAOTmCCZX?=
 =?us-ascii?Q?wIKUWoQzd90G6UFakfbDNSw6yYkA6FxP3ZlwyNnje0CxwcTdTFjAyFxSADhF?=
 =?us-ascii?Q?eqNihm1kVtBupbApSqyPyNwnYmvjajZl0augMRTxyQCwLb27B06VJNqhnZj/?=
 =?us-ascii?Q?F2MZ84rLtW2jL6iYBwkz7NvgM9wYU5h5SrOYxI4zcEzlzb9X8iKZzcmLM6si?=
 =?us-ascii?Q?/Ti80YIiswUMNNPOAmPSL2NooYVsoG64lgIs01DH9FYXQjl432XK7w3mtECm?=
 =?us-ascii?Q?liTpuMnYYJgvz5Szr4m25uEaH08NQm7vgjoqNH/omwE+lEI+reaF8I8l4qPs?=
 =?us-ascii?Q?pbx5T2X5HajBKGnS1spf/HmamlqfcaNxKj2O3jg5F36pOS80jnQ1ydVuCVqB?=
 =?us-ascii?Q?ROGWRPl4I58U7QV9LBK5wQrIVK4ppHVqgqSho9m3bhTtPSLcZ7kP6XVI7bQ6?=
 =?us-ascii?Q?gxTGR4lwQUTqBIES9NMkPvY5KIBhpaL2x+bnAkFx1Incpz62lhn4+noj9wjF?=
 =?us-ascii?Q?74uX0wnEQIvuAiBOHNMBv7DoWLvhUF2mQLuQypq2qxpsFNNwdP9FsXFky4mj?=
 =?us-ascii?Q?DTq4lt6BXl7UK/g4PobUpZd5JNIFe6Ty3qXvrkTxKsc19MXd4hQHnb7as4Jw?=
 =?us-ascii?Q?AavkU4G5CWZJVmoAvhkVYYcILKz6tg3yVa/N68r6nhWg7wcBPkIHWM+Wyf/B?=
 =?us-ascii?Q?fNqRX9QQqg3dGuioAV/eNn9RAzvb5l3T8afGL8ouJu8pYZXyTGig7af4RoAZ?=
 =?us-ascii?Q?tBJ9jjqOLlRrR4zi9QRFKkoVBq1bH9EDIKLPFAKgNhn4IDIeBQJcBWMyCsFY?=
 =?us-ascii?Q?dw+D9ZjRuGx6UpF2usa/J/rAwltHoq2rCpMSLTmQOoMfminbZm/Zgmx6+1UE?=
 =?us-ascii?Q?6g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4a73ae-2d81-4d5b-a7f0-08dd0e327865
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 15:53:28.9898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0Gc3qIHGrm09IIn6iqCUQD5E8hK88H4CCyE1Cd5qdw6mDeETzQUXF6FVArWm2iBfdnnf0LP5WpWJRACSleO2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7653

Add maintainer for Omnivision OX05B1S sensor driver.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
Changes in v2:
	None

 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a77770cd96b8..8372ab4999da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17259,6 +17259,16 @@ S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov9734.c
 
+OMNIVISION OX05B1S SENSOR DRIVER
+M:	Mirela Rabulea <mirela.rabulea@nxp.com>
+R:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+R:	Robert Chiras <robert.chiras@oss.nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
+F:	drivers/media/i2c/ox05b1s/*
+
 ONBOARD USB HUB DRIVER
 M:	Matthias Kaehlcke <mka@chromium.org>
 L:	linux-usb@vger.kernel.org
-- 
2.25.1


