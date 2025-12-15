Return-Path: <linux-media+bounces-48818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B3BCBEB38
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 16:40:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D3E8430173C5
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 15:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87AA33343C;
	Mon, 15 Dec 2025 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="FNSL/aHd"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021135.outbound.protection.outlook.com [40.107.51.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBA9332ED0;
	Mon, 15 Dec 2025 15:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765813203; cv=fail; b=DDD0sBgxomvMDD1hzvPZvk/gnDmWJjQ0NiAKcZTt307bV3Jv1k/uukZu2wi0C0xoIBR/oiFqQO4pCjdD0r5SSXUF96dWCxeFyNqUzjhQ2Tx844x0J/FfaSc0zyn+Lueac1HOnRUW/Vsy6Hk5F4MKPKwm0vssbt7VSsX+xwdaHss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765813203; c=relaxed/simple;
	bh=ikJec7b0Y8ZxUohDtk2NKMEPY/ZZE85FTKFACb4C/nA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=us40Mm8tc2xuXgauVIJUZAprdQwnZGXmmpoa3TArz0i/Xo/Gkr4RyPwyLlZe2E1kGb5Tlx/S5qx8wS0mek2k8GixjTujg7rK8q0Wb4mZogKNU6WMaWWEQIyeXuMJAjYCUlHQxxiSe3lehdFOVSkaCXHBHwxs5QQmwIfUnB3Up8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=FNSL/aHd; arc=fail smtp.client-ip=40.107.51.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUnDNtWtCqWG0i/lxwCet5SSBLFjjxglGQC3y58Gg+dqz3y3CwbVrVudHawmabFW2zJs0q7dureVUwXJwQ7qeO6asRhpZ9mwFbukshxMMfkZ/LXxYyrKXb4XLvjdCb0YUlR71JACUjhr75YvytYazVsqDlLgg9KWc5ts89bcxvovWrPIy3ej9dufFCV+Tn7TdBNTFx1vIrvU+QEllGRfesh6eAURVUf4xAuYGxl0OkqK5pEGPPOCoUYUPPGHVyTviP65cN2PGKgNf7QjZAr1n7mVf+54ve6dSzAmimDL5ouQD7xltVpjZnNxQy598IJB3WHjYvjxqgXIgiSdRLSSmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NDhxpgRMpo/cfYzoXHCi+Gu80CZweobFqpQBBGG0aM=;
 b=O2thu8M1hFsVmpWx2GlgDmXBcn5BsjiYUjnnT3yO0/G7Y7G7W7duTPyrTCcbkt2SzS80Pxombs1+sfvICx37OnLAGJRkI/7PR5IjCFgVb6UgyLpRvH0Z9p8eRHQnOS0wkiYLOivo+WEv4gFTlovKg+TzlO+9B5DvpAWF/Czli6eh4fsB8UnlBnl8xx0hq8HWJwHej4htNhXzA9yQNHYu7p9nGkVsETmjkuWqxLtfUZQedxqiXJyl9ZiLEOVvLVGndTKcojr3I43rhNhN3X0n1uaSq2/vdsgE6jy9CjBSoQE0Pdn8tuX0pbOX1wPm+3nqZbbzJw1C6mJZXRHppHSJ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NDhxpgRMpo/cfYzoXHCi+Gu80CZweobFqpQBBGG0aM=;
 b=FNSL/aHdJtEpzk+MWPNoTdzwfGZV4lvBStvNOTzBIVSFB49pkIa6H+4DoBwztOZodth5NGUKxWGeFD4yx9l6ofolhtTS6DdEzb6MRmnuULX5zwVTZDAm46ldiH2GoeXVhX+jtryaouILZALOB+H36NIBXFZ7dZwxBVYLqBGbgKRfbfPrXq9vsNV6Jwov/wpbNjJLE3lFkAi9ooMjT3i5hctv6sEqVl3SpYM6zVetdLeKThLbDfOJ4PVVSOnsY+I/oIfyywno/qM4eYzH5guBZA4g3NoeoV3EWzBq0KXOwYsqAdfz5fgBmVZ8ZUPeNRA720sNZkWBQfQ/78KAqRSKrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN3P287MB1192.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:195::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:39:58 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 15:39:58 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	sakari.ailus@linux.intel.com
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: Add os05b10 sensor
Date: Mon, 15 Dec 2025 21:09:24 +0530
Message-Id: <20251215153932.46276-2-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215153932.46276-1-himanshu.bhavani@siliconsignals.io>
References: <20251215153932.46276-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::18) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN3P287MB1192:EE_
X-MS-Office365-Filtering-Correlation-Id: 023b144b-21a5-4cf1-6ac7-08de3bf033ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?huwMEC8NYHDwuiHrt4/bTDVlgEm0vALmS0Eywq1AO6anf091Q2kq+MLUCRak?=
 =?us-ascii?Q?T3Q9LIcCIr3+y/E/p24vc1gCt3YYT6tRzE5X6hnM4HyHwMWm4c+1AGg0A7vr?=
 =?us-ascii?Q?EZyFWk0NtaNY5rPHaKTl7a0wYFuWHZnxg337NoPhZsE/VzcHWKV1fc5a9kLF?=
 =?us-ascii?Q?BU4LHm5oFa7VW87cw7PzekPuYeNkBx1lQo7YY+p91uwyAAynHSYVHP37tev1?=
 =?us-ascii?Q?fWqryUOdpFII7PMjkPswW2si6qPQoo91HlXVf7yp2/sCoMji6mvoa06YkKcv?=
 =?us-ascii?Q?khxnG5P/FJZ8+NNi7HcG5LnYoq8/WH4eZ5r1+vuMb+ehI22jSr3gIa0iq1BK?=
 =?us-ascii?Q?c4Lc/TYOFfdQoFc4X7xAhUzzP7kR4NTUdx1NiCz1ufwDrhsY6jhshlFc43Lq?=
 =?us-ascii?Q?/o/wXzo5bCdz3Pz0P/XvtPOC+DbrC50f4XeEEt/gYleaWY0gb2afyQs6dhCh?=
 =?us-ascii?Q?8QSlVzgHEX7dtqZfOFXM6swxK9dv+LciTlt/IGjnaV2wECQNLvZMmXpv4wNL?=
 =?us-ascii?Q?BtBArBCZkrBDcBiHKCJ+jCOvIEgGepfGoG82WsVNsnngpIKPaO3Yfg2NZnRM?=
 =?us-ascii?Q?rFfJtO3FdvuUQylTZSsnkK3f8d+w5n18k6TxXFxo2pSUzoKBrJi/hdhPS5af?=
 =?us-ascii?Q?9PXmgFa/nWtjX02NxST4bFpqc+6u87nUpZ7FAvwGnVu6TXEpoxV9m/XXcXDO?=
 =?us-ascii?Q?bp/M7cyVXsQX5YudUhahDAZeFzTFarwuKgdhiwGT2O8mKwaUTP5ZUWfkJ82P?=
 =?us-ascii?Q?mecL4eC4gjUEe3VcWsQR+8kNft8riEUZlBjijpDVraXhGQLGdPW0hhh1zCWG?=
 =?us-ascii?Q?DN7NM8iQECI+1V1PMDyFMn7nF4EUxxgXWIUajexDWD9IhEpmx8HBXwUh6ujt?=
 =?us-ascii?Q?qoU7bkcJjra4PSdgKy8RceTVtbB2gsTOPbWoNKygSpvqhYJT3zJbZFEPw/r/?=
 =?us-ascii?Q?cItxhi0aMT2gnsYSKDmy65Ygddm65PvpPRzfoqIhcdivbC0TDMSglVPvK8AY?=
 =?us-ascii?Q?rRcaQPaQUQA4nEge+MxoOd4ptstVUaRhJua9N/BDhvyAJ3hlcmN660gO0baK?=
 =?us-ascii?Q?FX/jnc8yn93JGxMSmsgE/cLBYTM9boYdBOy/GFrIF1ylF/YqVqAtgAxgvrTL?=
 =?us-ascii?Q?DCn6sBx89BaMVvK7p5/rS1KQ6O3MQY4Q/GGQvrcAlPl6vtJTvUTCeX98HVfa?=
 =?us-ascii?Q?QEY++O/rsw2A3pczR0bGgBbb2FrAR5RP0lFvLJtiN85xpoWI2bLsbRkwbywo?=
 =?us-ascii?Q?fWn7oOkvz9Dc9qZr43Uku2VoZSCCJgujZRhcSCFOvLE8i40GfdsG1DtyrBja?=
 =?us-ascii?Q?Iqe+ym9QLpx7pjt8mY03+YlTG1/YKOdGD8C31JQwXex7keoGFPakuF8bmwGg?=
 =?us-ascii?Q?vL2v1y2wadivhfEiy5cxQgmQYyEhW7Cw3hy2HM12nvlnechY+Q9NzsJlfp+D?=
 =?us-ascii?Q?dKZ42OLpZ5W65Z3Y0h3yin3pYbTgDuOE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3WKK688K32o8n5SVWmH25cU6s4YXSSi4phbbdkf9xWK2u2vXPUQxA/SXqUxp?=
 =?us-ascii?Q?eUUcGVjoZ3dCUNDNRluMFli8GZTBh1roD0ACC+k7HRnppcMKwxrtbwnVCW3N?=
 =?us-ascii?Q?RXg0LAl0QqweOfdpTrk+mr9JtN0tnEGx2erkSBQ/gZ5Jq2iW78fKMDEe90NS?=
 =?us-ascii?Q?5c3k2yS+vVGE0JtSfWjxW9GDhYQt9twiAQtsZ1AS8Mm83TpZ029vNQ+Tc2WS?=
 =?us-ascii?Q?hIKipYRDUYZIgdkt5qlBY157ljGl4pm7SDpvYB25rtkKJC4+20dBqC+R3v55?=
 =?us-ascii?Q?ljTqI6gg0dCzpxOnmzHHAacV7DvPkFoPez/KhiD00cOSsFUBhgZEhkTJIQll?=
 =?us-ascii?Q?KJC1YdNuvOuHF3TN2M5yBneJi163ELy5P6W1tFfrE8ngAi9T3xvjIf6c30Aq?=
 =?us-ascii?Q?/7MzJP4FMIbh3m0T7QfI1bKe2ilLjQpZlRKOqrcwEnKpQ7bIoresbZl48sXl?=
 =?us-ascii?Q?K0Wyswm+swCYRHPbct7FAgcWj+78jS4EL+EsOL46bDqZD5XR+zljEx9QjzEU?=
 =?us-ascii?Q?wQxMyiS/bTk1OSGomEKHEujP9b7ofMg14GhVYDMKLjHxDBnc+f9PoKpIEfHX?=
 =?us-ascii?Q?W5dsu+6b6LRxgicQ4amhPPI71yL0YUDrC1S9Ew77smEMxLFKwL2nRGS3OMdu?=
 =?us-ascii?Q?MxXskL8fDCQ2TqJUUx3/z/bUvlaLwV6/0icwPBFKdIkUwO3sfbl+q+64efRL?=
 =?us-ascii?Q?Yso997I+fpGOYksgNpNqupxMyl4UE+uggST77qoNy59c5vC4jHii7VdCCMAr?=
 =?us-ascii?Q?Bzw+w/LGHJJzHaPH4sS92GF183QJTTLCYv8j36wyxwJpA1F7XNld1B72cO2r?=
 =?us-ascii?Q?MOthleDghicgooTpJzGtDazMyHbUM2kEY84atFN1H49R+Z9HQNuyG3FKREf6?=
 =?us-ascii?Q?GJMS2qYOKFrk7/L24wUxISh1uOEMRnfhJjdj+4nUiwY2U0nnDmKAz5Pj0DL3?=
 =?us-ascii?Q?e/jz/fMU5npqwSlpagk/KvcDlUtyeiN3LxnZWmorx9Yq2kBZpKY9NTbg4Vkb?=
 =?us-ascii?Q?amSs2HDlY0JEj7Ji48/tknA7cuCLbnyCLxNata/aeqLE+Q7Ne0y1ARCRCwZF?=
 =?us-ascii?Q?40pXql3/s7QpgPvYm+k6OeEecCSZbFynWIepY/gPsM6ZGEXowQCC5/NhBE1f?=
 =?us-ascii?Q?qTaT960vhDiYKra6wWyA0dpr6U155vKoG0lBmp247KLd8ji179CwI2+ccnl5?=
 =?us-ascii?Q?5MuW5KyigOKO8zcE5pYAHtYNISplML4vLVbkAc8cyzZIjU+MWRLo8aKqk8/t?=
 =?us-ascii?Q?d5kRAHXoUH6ogfi2FPozZbStlAjwn2bRxro4rqD3b+qdUKD/2Mfcje8sFIZ0?=
 =?us-ascii?Q?2Rm26eYvpvU9BS19qnMapdmONrLDyO27svMwAnfMflVXrWjZtfyguoLr+P99?=
 =?us-ascii?Q?KWC46jLn3zsMb7pKmZjJZMy9wydW5kwZgRIUQ7gDMLUzQ7/mjY65YEUJ5vcM?=
 =?us-ascii?Q?EbSbphWLGKj2YBTC97PAoodcXsa6UHbOsUlnPNV0NvzLDb5jh/ELgdYsnPjg?=
 =?us-ascii?Q?PemtG5fKJARGWbmk7aHWrXjV8ZgtK45pQNOKbvelZyDsqVFz9IanwcCOMSnE?=
 =?us-ascii?Q?fipmoa5UvxbrPGX6KPoZh1lg/cqaKZGWIHy9TWEfKzhCJ6oWXJyz7uiBOWDg?=
 =?us-ascii?Q?ciaGIYKLtAWrqWirVwmacng=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 023b144b-21a5-4cf1-6ac7-08de3bf033ba
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:39:57.9984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Gxl1MgX/aDPgwcnwK+MLGO9g1f0vVbXgY6PftaYgMH6kxVH8L0iplBC7g/ZC2aBg20ftjb2H1IfCrGwLrqzcTOpjBbfCUGeo/Xucx8olK3znCeatv1smpCUkDeqCIAb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1192

From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>

Add bindings for Omnivision OS05B10 sensor.

Add MAINTAINERS entry for Omnivision OS05B10 binding documentation

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---
 .../bindings/media/i2c/ovti,os05b10.yaml      | 103 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
new file mode 100644
index 000000000000..b76771d81851
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,os05b10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OS05B10 Image Sensor
+
+maintainers:
+  - Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+
+description:
+  The OmniVision OS05B10 is a 5MP (2592x1944) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus. it outputs RAW10/RAW12 format and uses a
+  1/2.78" optical format.
+
+properties:
+  compatible:
+    const: ovti,os05b10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply (2.8v)
+
+  dovdd-supply:
+    description: I/O Domain Power Supply (1.8v)
+
+  dvdd-supply:
+    description: Digital Domain Power Supply (1.2v)
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@36 {
+            compatible = "ovti,os05b10";
+            reg = <0x36>;
+            clocks = <&os05b10_clk>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&os05b10_avdd_2v8>;
+            dvdd-supply = <&os05b10_dvdd_1v2>;
+            dovdd-supply = <&os05b10_dovdd_1v8>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <600000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 663e86eb9ff1..c85915d5d20e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19234,6 +19234,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 F:	drivers/media/i2c/og0ve1b.c

+OMNIVISION OS05B10 SENSOR DRIVER
+M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
+
 OMNIVISION OV01A10 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
--
2.34.1


