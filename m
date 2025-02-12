Return-Path: <linux-media+bounces-26089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9B2A3303C
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 20:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3D38188BE76
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 19:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D904F20102F;
	Wed, 12 Feb 2025 19:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b="J6J+w5c/"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2110.outbound.protection.outlook.com [40.107.92.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F53200BAA;
	Wed, 12 Feb 2025 19:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739390259; cv=fail; b=bgKUIe4fU4FKumRzcEdokVxlTUXfqDg6/NEHspoWqnMIKvq/FMtV/P7VdSTJaJDDP+U5RLw45BKGQMyJ1Yw76kl2WaSFm4HeT1DRsIJeZ8Tkrd0LBRfo4gJGbiRMSlqy8SgVQGIpuDJA/g/yXVMcvu3zHf918MWYBD1Xo3uIfuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739390259; c=relaxed/simple;
	bh=njDw+zcD8He377DESH/dNXWt99abOiSQdPVVLv5pWlI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pvqkt0ezf+MiHYVl5ybVGswGcuADPIA126PVIw5eEmhkfdHQ0SkkdFpthqq/v2lH4vPQBhOytI3/dU9orpInfzWY4xAFHmpGPULM9QX0GrH2arcgUEe5jf2PH6p0ZCDIbhvDw/L1m4TwjjI9HQJI/OC8UXLFvli0nc+WVvXAsuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com; spf=pass smtp.mailfrom=d3embedded.com; dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b=J6J+w5c/; arc=fail smtp.client-ip=40.107.92.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3embedded.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWVmjke0XrStjuOOR+lC3ZNUMxsfxsEWIWKoJK+1ertlSfiIQA2fvY+STJWP9h5ht8gY+b+9MK04PLOwew++cGu7rYJfIXESlB/gFNwZUS5b1TMLpXln47aZ0kO4ogrn/1rxiXVrrk9D5d5FBnxLYpbyVF7LZt965QIU533Qp2Vqai5JrcIzxrHiq3xtg2WNt2hksWpYQI2D/b9oUZ4etpn+jXOlEMirxoQVu+CbrKZMBVsOSWqAzW/AdYbkichywfBe1LKitLMtKSytJ1t79Pp576G3YM44OhjVeiTs4B0fQ73mvXN+JAlvRje0Xijbg7OBX7BMEjjWVjH6AzxJDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Zdj4alquONPff0YbQKPV9O7P7WoEvo7XtUYVRI8G2U=;
 b=bZNGi/HG7DAzoVxdWnaVJFikf8BcYcSeUUCrybVlG7OegCpjA0beemtvXkrrGu5xYh58aRzZUNyIvj96cTHmkjzMDtAUv9Jy1raIZcNTRf0jK96Ax8EbIzAnonZDKt3or3P3YpO0FrQZAkcodtLX51dmL07UB/T8WWBuIldheAGiXzx+Myce2NChyKjAP8SJiM7uBiWT1PAAe6E1bsdOeEobcMl1iDcpEZCR5dKlaujppi/xreeHPKTjacNU0/DnnZ1By3BP45HOZ1oMgviooO2taXUz/mTyIoED/1XgpCnTlC+4vldGsN4AFjnwav8wy/NC6optXk9Yvnc0l531cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3embedded.com; dmarc=pass action=none
 header.from=d3embedded.com; dkim=pass header.d=d3embedded.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=d3engineering.onmicrosoft.com; s=selector2-d3engineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Zdj4alquONPff0YbQKPV9O7P7WoEvo7XtUYVRI8G2U=;
 b=J6J+w5c/pTbz0F7UaCp61XbkoEuqobhiFsc8O8Me0Yw30WbK5tBV+igBdqOkBMXoXxcmdmV/s585DPO5EOoS0L2hwW306GDou/NHyP/FGnVn5DWghgIn93OXxJuaMUdJBfA4gqM4+BgTC4odmRvbgqeBUVQmpLXF5JDpBuJZMGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3embedded.com;
Received: from BY5PR14MB4194.namprd14.prod.outlook.com (2603:10b6:a03:20a::7)
 by PH0PR14MB5496.namprd14.prod.outlook.com (2603:10b6:510:14c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 19:57:24 +0000
Received: from BY5PR14MB4194.namprd14.prod.outlook.com
 ([fe80::8455:2eef:6470:1665]) by BY5PR14MB4194.namprd14.prod.outlook.com
 ([fe80::8455:2eef:6470:1665%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 19:57:24 +0000
From: Sebastian LaVine <slavine@d3embedded.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Achath Vaishnav <vaishnav.a@ti.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jianzhong Xu <xuj@ti.com>,
	Julien Massot <julien.massot@collabora.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian LaVine <slavine@d3embedded.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Stuart Burtner <sburtner@d3embedded.com>,
	Tero Kristo <kristo@kernel.org>,
	Thakkar Devarsh <devarsht@ti.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Will Deacon <will@kernel.org>,
	Zhi Mao <zhi.mao@mediatek.com>
Subject: [PATCH 3/4] arm64: dts: ti: k3-am62a7-sk: Add overlay for fusion 2 board
Date: Wed, 12 Feb 2025 14:56:55 -0500
Message-Id: <20250212195656.69528-4-slavine@d3embedded.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212195656.69528-1-slavine@d3embedded.com>
References: <20250212195656.69528-1-slavine@d3embedded.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CH2PR18CA0029.namprd18.prod.outlook.com
 (2603:10b6:610:4f::39) To BY5PR14MB4194.namprd14.prod.outlook.com
 (2603:10b6:a03:20a::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR14MB4194:EE_|PH0PR14MB5496:EE_
X-MS-Office365-Filtering-Correlation-Id: caf2dc4f-d502-411d-be70-08dd4b9f7820
X-LD-Processed: b7153db5-3376-478b-b601-92ce9bc0d3bc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?moQ3cMChbMh1YczcEqZl/Mx+tec4oTmi+MHjDxgEgD7W/cXYH6bdyZeODHff?=
 =?us-ascii?Q?G0qbXQesl/hZHFcKz0UmpQuZx38JxiV0UL6CYnoXgOtsi7F5JgzjWyhAhPqs?=
 =?us-ascii?Q?MIoG3gyf6JOvAzala68mN10fOCx7vrSI/6BefrzzPFPZDNJH13NQsG4mU+0m?=
 =?us-ascii?Q?HLXQQnKnDM8+j2lDgwNArJKVUpyitv1m7sqprE9AoONkD5XpDl0NjPoF1naE?=
 =?us-ascii?Q?DJ0SQW6KLc+aiGLon+orwfhvqnGNks4PbQfMbaUc1UlxzXnmOsOUgu/1O7++?=
 =?us-ascii?Q?zi79DxttJf53sZiBCs2lXRs1tF21bR7AIg7ZEOAKVWzDAt9AUW5dilbQkuEc?=
 =?us-ascii?Q?WTwX8dQlXoF2SDL9mTw83ecDKCNLt0e1bM9/qaS+soCMHXtNsq6sp4MrJ4Rf?=
 =?us-ascii?Q?4LdRIGy7p3Gias8mFuUAmb3Hds5S/Ukw7RUYIrW+yX7isYTW+8qskLqjuw3O?=
 =?us-ascii?Q?7b0PYen1UwDojbXBoWPqchfX9VsBd0BG1z178MiESpgKi4K3UEbSVyvWJkE3?=
 =?us-ascii?Q?QWZdLS1QTydcLccyXDTyRQmJ0YfB65jMiGToNd6UKI1UBdpESPZqfPuKUewY?=
 =?us-ascii?Q?CQilKLgah2260G/Qd0z/W1A7YyWC+MQQylMEr7e5IglEQgEvFeCpht/9IUxS?=
 =?us-ascii?Q?vEh/j5zXWs1utsfBBm4efqkFqrTf/rlG464gZWZ79p48gGz77hIof8BIsosk?=
 =?us-ascii?Q?4E7D/Ts8Tm3fkPg4NdIDojDyoyPBi/Y6WLeV0bpW4o+nckVfK0Hw9qjdXeWs?=
 =?us-ascii?Q?p8uoCscLZc6UwitfcLIUKlI/TL1MFrQdPwdps7S4X8d8aW7ENXMX7+rTfvW9?=
 =?us-ascii?Q?E5UnCLxnx72Q1Qj7AkSSJJQ+X54sUjXkXy97q9QXy0PN5nRfgTUm3Aq3GPw8?=
 =?us-ascii?Q?x/4EF2h096w1oTxb7PGL2IpD6DlyRvnXVuQRf6BktfHs/uVft8TgCglgW7aQ?=
 =?us-ascii?Q?JS6MfLYlUs4k68V3/bbnHWC3PWtfnio1mIqmqGZqkEli2goV3oyvvcHaZ5aZ?=
 =?us-ascii?Q?qn9mHJTqmKyCVR0HroEKRPuom8lR5tdGvgrdeIOjU+YmpTt7SX2erz3wG75M?=
 =?us-ascii?Q?rCx6GuYDphqt9neGiNxSGJ1Fg+xx0aytRwxV/rprVen+J5PivKChca9SVmYz?=
 =?us-ascii?Q?m+HDp5nDdB3DMIKsPpKo3wP4xVrs+uu5PrIAgWhcTP7z0ifJTT9khE5Inp1c?=
 =?us-ascii?Q?pDEYf7zdfjMVmlpfrGjw6u/wiVBQCIzYYYolO4qbbB8lSrPVavaTnv9c3tlM?=
 =?us-ascii?Q?p97RfLoSyubAIx4GxByjotOeFfQucWkNOx7HdaMTydAK3olaA8ykVIAL+0UY?=
 =?us-ascii?Q?pW+lw/yO4OhyNDQmJpbLJC0h?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR14MB4194.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?kB2AQuH2lvWVZ29ITVJhJQrv35bXm47wvzTnjvyPYpcaKn1fz2u6vbI9B4oB?=
 =?us-ascii?Q?ZiiKJMqCv/5wGPkFGZNIvzxM3MctpCDT54cMrPpdbBMeVWX7bhLz7J918RO8?=
 =?us-ascii?Q?SCeJ6Xb3oaWj7S0FV81lZNeKtz/YknCLEoigpzfFTcEsmQrqcuG1NXWDm838?=
 =?us-ascii?Q?8lzH2UJhWpR5iIUBAEFBgeLzGsOGkNp9waTmes/VJKIvBC+4AtgU0147hgDs?=
 =?us-ascii?Q?cQR57J68VcoGx2cT4zuYkK76XsypzLexd7PqiYwWomVHkJysQoOHWNU+ZoPi?=
 =?us-ascii?Q?NNIbotq8cla4sdsF5KABWvimZvv/2zMB91s5JdE7O84D4tJZ6aAsDjwDB1S+?=
 =?us-ascii?Q?3F09DFdnwujuSJMJRFyK687ByYXt4iP1KugT9K6YLNIOfUWZt7LdAdQD5xmU?=
 =?us-ascii?Q?RaqM4iWDcIdJ0eTxRzVkj48QD583Z7tleAQLfVc3MawlpR2t82pyXiCjGxRC?=
 =?us-ascii?Q?Vw+mKsNitxeYUwdNiF7mItTT3Mc/5Jra1CqKeg8W4zxgnsL8Dz2jMtjzwNk+?=
 =?us-ascii?Q?fz9Kez8+0puN769ELTtTtnfldRAfu+WNZDgpXYJmrwaWOyxN9IsiCyiomn10?=
 =?us-ascii?Q?POLaLzsn0Rum+PqHr9pKP4P+DFRyqtNp7FBeQQ+appKydm5fDMwsKSP5tjMw?=
 =?us-ascii?Q?fDsmSAX9B2xoj/3tSiudXCPflJXa/nLOkaEpzKxCjT8gb2lsuOWS5A34GJPQ?=
 =?us-ascii?Q?iNiussOzjUnkDTpiDfLn99j7dxup18sLoC9hCfjO1zZO9I2NolmynzGalkw6?=
 =?us-ascii?Q?SuujA06Uipj4X8tVt1EKQjnrQaw8Q6a/12+f8EkM36jQ9KHm8d+BpDMVUuCU?=
 =?us-ascii?Q?puXLxNB8+eV7xPEurQuCte2m6kilk/sUfUfpiC0QpYr7AdBdGJzbP1zRaJcW?=
 =?us-ascii?Q?4O3guUVyv9erp6yj/mFRz9Qa8ZYtCtGOEXcrNwht6bP8Byfp/SiXa6JufBjs?=
 =?us-ascii?Q?QDljoeBcpnT40TvNzQZSfVo5+A0hNsV55bPCp1AIEbhVl0u1fVq7O6tDEyXb?=
 =?us-ascii?Q?Eo1yTmZm3OjB7TjQcyQeusd09khp6wYVIka1B+8DuXfxqW+5FZJjimZQGvSM?=
 =?us-ascii?Q?/YGbrr1mkJKAo+TG66PJTeKpoOFy4/pH/kYvEJLdLn0it6eXsSWq1aex3Z21?=
 =?us-ascii?Q?5I7zsi+Wf6K3gSJH19JvGwFHhOEHLPGr6aeWbPQx56sZlu32AafbXjWj/5lq?=
 =?us-ascii?Q?2NpGrsTCevrSlVYBtgO8AWTbKLIdwU3DDooikQS3BXLv+l9+x9V/oCPSE2Ip?=
 =?us-ascii?Q?ik2VjX5CQm46zgly2cf4KteglML3/mfXmHDbawGXLUlSKSFUFJ5ixFj/+nZa?=
 =?us-ascii?Q?ZFscM4ClFc9KnpWR5BsvqEC1rbqQNi2hhMW4xaTf9TQCBv+euTXZ78oXYBoB?=
 =?us-ascii?Q?Z9f1umlZwJYLh0GmV9+WX2NoK+o6dhbq0B5Ae6DLR8Pjv9XMt8juwrOyjtcc?=
 =?us-ascii?Q?neX76HhogZWVOtd7NVlF3XXjwN5nmFBuQeBvoG8pxGPgDxXHV3irwsN8K7tA?=
 =?us-ascii?Q?6+jpsaYX3MWFKV2r+VbqRqG6z4zCjiZ+8jaNYs/BlzQbQsxnqMYmCtdeALdV?=
 =?us-ascii?Q?NV/YJP44EJmgj+03KF/4ZOpB5Ljcxm4DZCZWHX5fKISriIm0zIqSDbtBnnTV?=
 =?us-ascii?Q?bg=3D=3D?=
X-OriginatorOrg: d3embedded.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf2dc4f-d502-411d-be70-08dd4b9f7820
X-MS-Exchange-CrossTenant-AuthSource: BY5PR14MB4194.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 19:57:24.5735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7dNTlf8klcwgoL8vrpMwwwLEKYzF70OccQ1eP1Of89+Pz95GKGIjzeWQD2W6U+61OkdHVOaWhQWGPjTjOyAqrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR14MB5496

Adds an overlay for the Fusion 2 (FPD-Link IV) board on SK-AM62A.

Signed-off-by: Sebastian LaVine <slavine@d3embedded.com>
Mentored-by: Stuart Burtner <sburtner@d3embedded.com>
---
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am62a7-sk-fusion-2.dtso    | 115 ++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso

diff --git a/MAINTAINERS b/MAINTAINERS
index 27fb3c1be732..bf6a48da0887 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21890,6 +21890,7 @@ M:      Stuart Burtner <sburtner@d3embedded.com>
 L:     linux-media@vger.kernel.org
 S:     Odd Fixes
 F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
+F:     arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
 F:     drivers/media/i2c/imx728.c

 SONY MEMORYSTICK SUBSYSTEM
diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makef=
ile
index f71360f14f23..fcd8d11e5678 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -31,6 +31,7 @@ dtb-$(CONFIG_ARCH_K3) +=3D k3-am62-lp-sk-nand.dtbo
 # Boards with AM62Ax SoC
 dtb-$(CONFIG_ARCH_K3) +=3D k3-am62a7-sk.dtb
 dtb-$(CONFIG_ARCH_K3) +=3D k3-am62a7-phyboard-lyra-rdk.dtb
+dtb-$(CONFIG_ARCH_K3) +=3D k3-am62a7-sk-fusion-2.dtbo

 # Boards with AM62Px SoC
 dtb-$(CONFIG_ARCH_K3) +=3D k3-am62p5-sk.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso b/arch/arm64=
/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
new file mode 100644
index 000000000000..68e06d643bfd
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DT Overlay for Fusion 2 (FPD-Link IV) board on SK-AM62A
+ * https://www.ti.com/tool/J7EXPAXEVM/
+ *
+ * Copyright (C) 2024 D3 Embedded - https://www.d3embedded.com
+ */
+
+ /dts-v1/;
+ /plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+       clk_fusion2_25M_fixed: fixed-clock-25M {
+               compatible =3D "fixed-clock";
+               #clock-cells =3D <0>;
+               clock-frequency =3D <25000000>;
+       };
+};
+
+&exp2 {
+       p9-hog {
+               /* P9 - CSI_RSTz */
+               gpio-hog;
+               gpios =3D <9 GPIO_ACTIVE_HIGH>;
+               output-high;
+               line-name =3D "CSI_RSTz";
+       };
+
+       p19-hog {
+               /* P19 -CSI_SEL2 */
+               gpio-hog;
+               gpios =3D <19 GPIO_ACTIVE_HIGH>;
+               output-low;
+               line-name =3D "CSI_SEL2";
+       };
+};
+
+&main_i2c2 {
+       #address-cells =3D <1>;
+       #size-cells =3D <0>;
+       status =3D "okay";
+
+       i2c-switch@71 {
+               compatible =3D "nxp,pca9543";
+               #address-cells =3D <1>;
+               #size-cells =3D <0>;
+               reg =3D <0x71>;
+
+               i2c@1 {
+                       #address-cells =3D <1>;
+                       #size-cells =3D <0>;
+                       reg =3D <1>;
+
+                       deser@3d {
+                               compatible =3D "ti,ds90ub9702-q1";
+                               reg =3D <0x3d>;
+
+                               clock-names =3D "refclk";
+                               clocks =3D <&clk_fusion2_25M_fixed>;
+
+                               i2c-alias-pool =3D <0x4a 0x4b 0x4c 0x4d 0x4=
e 0x4f>;
+
+                               ds90ub9702_0_ports: ports {
+                                       #address-cells =3D <1>;
+                                       #size-cells =3D <0>;
+
+                                       /* CSI-2 TX */
+                                       port@4 {
+                                               reg =3D <4>;
+                                               ds90ub9702_0_csi_out: endpo=
int {
+                                                       data-lanes =3D <1 2=
 3 4>;
+                                                       clock-lanes =3D <0>=
;
+                                                       link-frequencies =
=3D /bits/ 64 <800000000>;
+                                                       remote-endpoint =3D=
 <&csi2_phy0>;
+                                               };
+                                       };
+                               };
+
+                               ds90ub9702_0_links: links {
+                                       #address-cells =3D <1>;
+                                       #size-cells =3D <0>;
+                               };
+                       };
+               };
+       };
+};
+
+&cdns_csi2rx0 {
+       ports {
+               #address-cells =3D <1>;
+               #size-cells =3D <0>;
+
+               csi0_port0: port@0 {
+                       reg =3D <0>;
+                       status =3D "okay";
+
+                       csi2_phy0: endpoint {
+                               remote-endpoint =3D <&ds90ub9702_0_csi_out>=
;
+                               data-lanes =3D <1 2 3 4>;
+                               clock-lanes =3D <0>;
+                               link-frequencies =3D /bits/ 64 <800000000>;
+                       };
+               };
+       };
+};
+
+&ti_csi2rx0 {
+       status =3D "okay";
+};
+
+&dphy0 {
+       status =3D "okay";
+};
--
2.34.1

Please be aware that this email includes email addresses outside of the org=
anization.

