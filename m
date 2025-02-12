Return-Path: <linux-media+bounces-26087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 246DBA33036
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 20:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 456343A8F21
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 19:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCF9201023;
	Wed, 12 Feb 2025 19:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b="VulS0tOu"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2110.outbound.protection.outlook.com [40.107.92.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829BC200116;
	Wed, 12 Feb 2025 19:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739390245; cv=fail; b=PL+fvH28U0giJZfRkomZRzY0zfA3uPZj/JIGRGhXtkNK36S1Vvr2KFwfJ3BgQmPKEtkylBt/MYMilbob+Og5GKOg37VLBUYyHftW5+L6GYYZvdCqhVnNa3lrddAW8YI5DE+pzGmbWb+7Ze8+o2/kVqyWV+8//IVenTIllPm80+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739390245; c=relaxed/simple;
	bh=MMHVwpb5VTsxourmOU8wkkWo43SaAEeYtSW23dB0su4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mkFmX4fnNGXmWktj4UIbYPBhGQ/1rLzGyy94y002ey5wTBofJgaOb32+zM6RAeFAKGTMmoodwTFnQuz0v2RDoiKny0WK7ORDYALAJQRGYMrfFciHSknVSt0mRYAtU2oGJu2O1LYEFU8CPmUhS+AM5NUiiJCL6XrYgvRECL/xJxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com; spf=pass smtp.mailfrom=d3embedded.com; dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b=VulS0tOu; arc=fail smtp.client-ip=40.107.92.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3embedded.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5qyLjdh0pRWoVuUMJo5OdIgq7wQsIuChw28Paxfm2i1/SFqXVL06HeDAnxUadNgcEw9KopxOMVFbkRsTmqsHMnKLWHkTF5hOP3cfyFCbdC9CMvPZju3P15L2paipuoUpJX8TJUI7Ls6rRjNXdZlVAxew5kHtzpVwiWddsOgTK9KpFtw4hwoQa8Q7kRHFDhXK1k8QmfGkjN19V6qDVNVxQhCCR7KG7Qibfbt3Uz8iwzNnnqxJfZ5i9qO4gHeHrGpoLKiMqKdZ83oSwUqnj7l6sL+tTJkj32jXSbBRrT+/bIbtlY1kiGv56X4+e5OaP2Z3s20lNJk/yOgKVr11vhefQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbZP9NZP/cGp+K3MS/yJu/U8r+S7pcFs6KefWIAYdwg=;
 b=yUyozbfXqy/OF7UMwUTur57biQ2pIv6x5IPyr4xWV2BD8mbwCmIuulQLK3fOnDjbbFFJWZrauY6Di33ynWUO6tKs/Mg/ncNqAkR6iDU+IzeQdAdasN3O2g8KmD/VI32f1JNiJyJ1UIqEYEEoP4j5rTFv4hT78RjxsXRQ1QDrjnnoNTa1ZVmuzEz7XCNmUA6WoY4Ke7TYj9bwQawj01/dcs2Vimv2ZYPZsZoOdRqg581imngiqUXQy9CAnItQ5OEfo1LhVZHq8RWj6fDzyGtl4jr6OHfMN2XfzWN4JKeFqNxwQ1Wcc47bWN6xsb841gsu5oXtpE/Jc2vnP5DIKyhxmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3embedded.com; dmarc=pass action=none
 header.from=d3embedded.com; dkim=pass header.d=d3embedded.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=d3engineering.onmicrosoft.com; s=selector2-d3engineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbZP9NZP/cGp+K3MS/yJu/U8r+S7pcFs6KefWIAYdwg=;
 b=VulS0tOu5cnEgYjuahJJ3BtwUy24hnTV2aZG9oBqapTiCz6UBVCGjnSP9JbnanV/bmnb9spSrNX6rE/dewDs7vWeZmWv0Sk4A46toakFkpWHkQO9n5vkwT5SXDA7THILudkawgRKMXOlDMhRpGHdYxqiMWLitc3O6TaHewlfwX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3embedded.com;
Received: from BY5PR14MB4194.namprd14.prod.outlook.com (2603:10b6:a03:20a::7)
 by PH0PR14MB5496.namprd14.prod.outlook.com (2603:10b6:510:14c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 19:57:17 +0000
Received: from BY5PR14MB4194.namprd14.prod.outlook.com
 ([fe80::8455:2eef:6470:1665]) by BY5PR14MB4194.namprd14.prod.outlook.com
 ([fe80::8455:2eef:6470:1665%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 19:57:17 +0000
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
Subject: [PATCH 1/4] media: dt-bindings: Add Sony IMX728
Date: Wed, 12 Feb 2025 14:56:53 -0500
Message-Id: <20250212195656.69528-2-slavine@d3embedded.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212195656.69528-1-slavine@d3embedded.com>
References: <20250212195656.69528-1-slavine@d3embedded.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MN0P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::14) To BY5PR14MB4194.namprd14.prod.outlook.com
 (2603:10b6:a03:20a::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR14MB4194:EE_|PH0PR14MB5496:EE_
X-MS-Office365-Filtering-Correlation-Id: 0252f66b-ee6b-4fba-5d99-08dd4b9f7417
X-LD-Processed: b7153db5-3376-478b-b601-92ce9bc0d3bc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?lGHretrQHtHqobdnOXny5tye66cyQPjkIsuQwvlFDcWi+Ww7lJN5VCDqhjpF?=
 =?us-ascii?Q?G/pAXM5WWtpTd+JnA9iKGW2iztc4L33piYo5JZ0bsi3groAFX43kLmjY+TtH?=
 =?us-ascii?Q?WkgA7i0iYCtIC+nN1UfKPXHc2tinhzks/3/BdJWO404tfMM7esAB5r+m643o?=
 =?us-ascii?Q?fV0ngIjBzdgZN58JpJvxXWH6eO6askTQwgBgMFvz2+kdZbBdad1pmFTqmSI7?=
 =?us-ascii?Q?8ueP/5YFpWs51cmeRRBLC/E141Fa5uxMNeKVEZAsnN0Kom+s0Uc3D0FnmT6j?=
 =?us-ascii?Q?NU5XQcFZLvRC0i/HMB0xKTcuPI9xgEqZ2ZOeADeWdaEhVgbqNb9W517HH4Eo?=
 =?us-ascii?Q?JWRrk2M5KNWNESbvnqICTmjrEKPcUv1I1OqAWwKhM187akHw+qcUHHDzlqtb?=
 =?us-ascii?Q?NJLot5pPoeVKM3y6pRXFyVBRYcTSyovJfbIx7soxxhw8e4ncEz9cSrU8a1BV?=
 =?us-ascii?Q?au/AjEOXUHY1pYYSxeNP5HI9OAxt1qOA6Cx7NPzZxjuDK44hrMk9c/h4wVb6?=
 =?us-ascii?Q?NmwVjN+NCe8AJWa+2xPsRF76g+5fbrjxFBiV60zGxGB4NkM8sl97n+oOWI81?=
 =?us-ascii?Q?A8JTJXfYX+rHJIuFMFnkwlnjE8/ccVqEeXAd7cC8makecHXeLz4J0n2Je0ZV?=
 =?us-ascii?Q?l8VLanatAqFt2N6UWpyPYG4NbUGQFIGbGgyrrYYhpoHjSr7yqoKSh8bWMyPO?=
 =?us-ascii?Q?IzgwpZQoMHf+qNz906p9Cr2swlzhYM5fptM7NSvnrv2AEPObLpdmVme3ORJj?=
 =?us-ascii?Q?thtQJZAuhg/BX4pLrwQb2iflr5OaER3OZl4SjdJ0VlY/amdMZsKA0UpOqSyq?=
 =?us-ascii?Q?yCH7dGkWfdqHGLSP+/JK/xILZ5KX6HFxyGOixsjscxFw8ZdYDp4+Pnm24qLS?=
 =?us-ascii?Q?hIGzHTGwg1XQfaK257bXNhV3gceM/QZG46UytkxB7deP6YLhAJ17IzQS6UuJ?=
 =?us-ascii?Q?xEmWPlcIuNz5GhxoqdbXUeuCDro008RQ5T71w3HLUde1S2Cp23udB4LRhYLC?=
 =?us-ascii?Q?fNirlL5TZcbP2RLfdYPyzeeIjcNe+c5rvKVGAHbPne0Fp6x4NwFtFJrcI8Ky?=
 =?us-ascii?Q?dMRidU9EfECJginGDESVilDgLY8ef1onOAUetuo9fqL2KlImInNzDKtgM4oc?=
 =?us-ascii?Q?AfizHMf1pE5QgwzzVNrWmzO5HeXJMjwiiqqBeeHL9YGO10jfduGyHRI4QMhD?=
 =?us-ascii?Q?s4AUcnA2DQLiCDJstrxFABeV5+AcKII5bf2qp+KXQ78NI1qbQYqn5Soksy3J?=
 =?us-ascii?Q?l7NPRfvI3/Fqm1GELwWqR3SmME1Ck+F7Q0dxz8+SS7hhuz0lQPi1EqPIrZV8?=
 =?us-ascii?Q?+A8+8NZ/yrS0eUQK2F8YnLWq?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR14MB4194.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?7b1TBBkZkBrWUrg4HtcKQPZCboF9Ati3DX/DRf7BaC7efxQtw844YFckz2ET?=
 =?us-ascii?Q?mz00QCc4ynsyWzk1Z32nMquetswmmfl/lAkl8ZDQdqdY26B3ziSkiWweAcDN?=
 =?us-ascii?Q?Wi0m4wI9Vn+B/39RVf1LPG+3HCbXCdDaHPJJIi2viE+wpn2XIxK3PK1h8m2B?=
 =?us-ascii?Q?Xa+LVkzahmPsI1vn+/Sooo5zbh+dC5CyeGTjngidb3OZL8fvk0W45dQohI0C?=
 =?us-ascii?Q?8G9fJCK3Y4ExNmScltj8MlfHO4Z6PzGgjEO1eIj9MHKLhUCL0y7LGaqGd2Jy?=
 =?us-ascii?Q?diElD9epmgK+2j98AQ/FOu1X/XHLen8OfXi8GJOlxbUk3DI1FSypvM+p5cxk?=
 =?us-ascii?Q?Siqu/YxhO5NS8xdwX/W28iSuu6dTBzl0lLRTrmVCVuBqgOoR6s1a+z0UvUAz?=
 =?us-ascii?Q?uJHiOYkb9j1zodJ6AdRXpyIHrb6A0ZfEzZ7/VpRq2KVePvFTQIdZdHdwO8uc?=
 =?us-ascii?Q?goL1UGTwSOjqQLgOGb1c36zezuXzcCfz3/Rj8aXYiOToOXlBfnlvJDNvaS48?=
 =?us-ascii?Q?BSW8qqvFhtDbtv6Uyui19ycI6xXw1W/3XJoZ7XAG5mgY5zeiq/nuvpP10Zqs?=
 =?us-ascii?Q?9W36QYgIIIZioic1BKFn9DFXX6dmls8tuKQWQCKn/X5KbPP6L+guUNhDOaMq?=
 =?us-ascii?Q?px2jeL7uVv0t87vT0/7uFPMHlrLHnsd9c/WZ0ZizbBFpArchWulPTjdeHwZM?=
 =?us-ascii?Q?tnDFX7lz2iTJfdxI9GatHL3mfPemLsjefwyMDsm6Eo6etGNmWTWfpu0jwLdl?=
 =?us-ascii?Q?V9wy2puPhHhqHXxL72HM955bEWRMePBleOtwrqZQ3UwNePTktjt7IIc5TOy8?=
 =?us-ascii?Q?z6vGEc0KhFdqMlD9TAQyVfVO5hv21MqM6mmVH5xCrsLqpCYHa2G6KLYyl8ig?=
 =?us-ascii?Q?1rcqTYkJyDydlS4PZtE54VVzOOtGmWRGyWoPz498mxCkD2/e+HOkInqF6Czz?=
 =?us-ascii?Q?4rmtVwjn6Gc8xv84aebBzU0Xs4lvkaE1SDW+RxYIBF7ti1gsQBRP5n803dtp?=
 =?us-ascii?Q?vILmB4kB9WdDO2pRbtJEOXKtGAYg7vpqaBQ08zvtp9IishawX5F26LsmdqYB?=
 =?us-ascii?Q?onrDew6B0SmKgTZvlF5Y+re+OuZxtzD/wZF62WxySApg/kMI8qVwB1s7eymq?=
 =?us-ascii?Q?bg7BAOGX6G1YMh4pLj8R2CV0Z+WE3CzbXzNJ9KeG32RXu6ui5/FHQ8xeRinE?=
 =?us-ascii?Q?xmNhuELIXOfUZmtyGwcJUro2FaCh6D6FBAtlWX0+C97TMFk6UPCh2XIe6W3O?=
 =?us-ascii?Q?+m8riosAz8itXSTM1S2VGzcI9RYk1USwoBXFz3xCFlJalp2LaQbZBta0fp5C?=
 =?us-ascii?Q?BNnCyxTFrxDehj3rIggulI88y9yVDADQ/8XWdDV9ZAvCB8ckpnF5qUys9gzY?=
 =?us-ascii?Q?gsEHcMpGiu9PNAaGCMpxjyKws6hvRYwCffccA/emPm3fjsS76zxzZr/wEBzM?=
 =?us-ascii?Q?T1jH18xZHD2QjX9mPFMTGxUkG1yWEpCJkgpMwIVNU+IoBbi2tQFNF7V4nqaQ?=
 =?us-ascii?Q?8yJKtwYWQfhD9AHQGs0LC/5N6jRw+lh+KJOCyLadOgBFvhzRALG0bopcykUg?=
 =?us-ascii?Q?0st9Of3i3C+7cJ5I4THdOqxYi1edmKuY+fTMdtqUil4PEWOp3RbVKDZwZhqU?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: d3embedded.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0252f66b-ee6b-4fba-5d99-08dd4b9f7417
X-MS-Exchange-CrossTenant-AuthSource: BY5PR14MB4194.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 19:57:17.7945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aktk1XvlyX63EhyqMoUbJDorEpWSvArrcDLoCGD3MY9irbXjw4spSrRmaGVH/syH/xOVf2n+IHOtIYL2q9kJmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR14MB5496

Adds bindings for the Sony IMX728.

Signed-off-by: Sebastian LaVine <slavine@d3embedded.com>
Mentored-by: Stuart Burtner <sburtner@d3embedded.com>
---
 .../bindings/media/i2c/sony,imx728.yaml       | 96 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx728=
.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml b=
/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
new file mode 100644
index 000000000000..f76000ed7bff
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx728.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX728 Camera Sensor
+
+maintainers:
+  - Stuart Burtner <sburtner@d3embedded.com>
+
+description:
+  The Sony IMX728 is a 1/1.72-Inch CMOS Solid-state image sensor with a
+  color square pixel array and 8.39M active pixels. It is programmed
+  through an I2C interface.
+
+  The sensor can output up to 3840x2160 at a maximum of 45 frames/s over
+  a CSI-2 serial interface. It supports RAW24/20/16/12 and 10.
+
+properties:
+  compatible:
+    enum:
+      - sony,imx728
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Clock frequency from 18 to 30MHz
+    maxItems: 1
+
+  clock-names:
+    const: inck
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      Specifier for the GPIO connected to the XCLR (System Reset) pin.
+
+  error0-gpios:
+    maxItems: 1
+    description:
+      Specifier for the GPIO connected to the XWRN pin.
+
+  error1-gpios:
+    maxItems: 1
+    description:
+      Specifier for the GPIO connected to the XERR pin.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: ../video-interfaces.yaml#
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        clock-frequency =3D <400000>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        camera@1a {
+            compatible =3D "sony,imx728";
+            reg =3D <0x1a>;
+
+            clocks =3D <&fixed_clock>;
+            clock-names =3D "inck";
+
+            reset-gpios =3D <&gpio4 17 GPIO_ACTIVE_LOW>;
+            error0-gpios =3D <&sens_exp 1 GPIO_ACTIVE_HIGH>;
+            error1-gpios =3D <&sens_exp 2 GPIO_ACTIVE_HIGH>;
+
+            port {
+                camera1: endpoint {
+                    remote-endpoint =3D <&vin1a_ep>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 575f0e6f0532..50bff3558d7d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21885,6 +21885,12 @@ T:     git git://linuxtv.org/media.git
 F:     Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
 F:     drivers/media/i2c/imx415.c

+SONY IMX728 SENSOR DRIVER
+M:     Stuart Burtner <sburtner@d3embedded.com>
+L:     linux-media@vger.kernel.org
+S:     Odd Fixes
+F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:     Maxim Levitsky <maximlevitsky@gmail.com>
 M:     Alex Dubov <oakad@yahoo.com>
--
2.34.1

Please be aware that this email includes email addresses outside of the org=
anization.

