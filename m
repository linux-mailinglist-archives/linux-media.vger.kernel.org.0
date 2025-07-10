Return-Path: <linux-media+bounces-37299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A0EB002FA
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFE6D1C4178D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280E228E56B;
	Thu, 10 Jul 2025 13:11:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020116.outbound.protection.outlook.com [52.101.225.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD17727F749;
	Thu, 10 Jul 2025 13:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752153101; cv=fail; b=MEf0FZIVGs6Kl6jouvCkuh+6CV4wYfigbUD5zD9vrVuQqCkgaPUWv0pK/rOORvFotV3e49X0uFNf+JHOZnidMvDDc/ErWt1lG6mI0oiT5KK8gh3YMN+mwBIYVUEByypF0IhBRT4C6fp6uvNuld/5ti1r4biBQ7EpO03TrHe9DU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752153101; c=relaxed/simple;
	bh=Jo+5KUiZF02MS1n4t9V0eOWZPZ+jVKjoQ6qnfqrouUY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fLoba4+uMuu2Eb+Nui9DEccttx7sUnM7bupvE8YcbnfsjoR5MV5gdbuJ2+4oNQV00JgC7k1yTQwt1WdTT+jFzWnAU10h+cG5tKIevBawiBXNZLbFhV1ojEkoz2F1Hy25MQclEBTsAvkZ4ZIwm4WiMH++/2fQdHrs9QnAaBHlxpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JW9FnW4mKjifVCa/0hjxHpnhtd8ocQ0PFSIims3Bzx23gf45OAT7+D7fcg49UF/UIq4q4Bfz955V7Mlh+HZNJqulFl3oi3CHdUJ5vyOERTYBFzYEF8zQ719o+dGbL9PnZpx4z+vqDE55L5wL46jEVeE5YF4cFCUbu4uafeAvmDQmiyscnb4pl1I+CdMfIJ3/oSyJsiFo+0xFQm7pU3FujDkpNWAZRAV8wbxdBvPxxhrggbBGfwUqYFoupBd1UzjBupRANunFc5Nhd1jBlefnJcQUmGNSsXg2kjRSao8LLA9BarZZ1uoG5Jmg3Yq1rxIz75jCDfdTzV+ZySQVtnzdtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGWmMJNVUX4/Ab8so+NvMLkdE6RzD7FinFEop8qE42k=;
 b=p0eoN58QBo/iR6JvvDpJjHm1zohZak/5xRR1b85Cc6I2Sed1nJhG/HD4pChOjpGdvhwxTd9aeXzNrSN8G58H25tTcZLgHJekbSLqo25pbuhuxv7Wya7+tj+fQhhi1xriuBBvDtIHNtnx2wct9r1jIR4Opm1lnY1nMjgZTRcxEwZa7l3RSNaKsz9jZoQbczp27V0i1dWOf+1DQXVzrchsCr2z/pCNcqnDOdgtlUNe3H+aawMMcBvcanQueXlJi3EAs9cYBZ3OW89v2dm5CnA9Si0R2HKKySYij/0sVIFTD8CtHEoB3jnLU1vbiVfTTrggCfaDvbNuKX/B2C2sOVJ2Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by MA0P287MB0108.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 13:11:35 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 13:11:35 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	krzk+dt@kernel.org,
	kieran.bingham@ideasonboard.com
Cc: dave.stevenson@raspberrypi.com,
	pratap.nirujogi@amd.com,
	laurent.pinchart@ideasonboard.com,
	tarang.raval@siliconsignals.io,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hansg@kernel.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] media: i2c: Add ov2735 camera sensor driver
Date: Thu, 10 Jul 2025 18:40:57 +0530
Message-Id: <20250710131107.69017-1-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXP287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::35) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|MA0P287MB0108:EE_
X-MS-Office365-Filtering-Correlation-Id: 44e25294-4a31-4b54-6cc4-08ddbfb34c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4GQMTSQttMFqIFCxCT5H0MMHL08ZFplGFEIe/L/hh/uGR6uAuVpvIhSP3SJ2?=
 =?us-ascii?Q?853nqylAejwlFHCcYntF3NLA98x22EAwfoHUQCmD6q3mw4/UTi4MUl17RZDq?=
 =?us-ascii?Q?K0Fwjx3WBjWw1BQc6mCuo3rNw8Baz2RMfbD9PrAcmt3Q8UXhDRz1AQq9CE3p?=
 =?us-ascii?Q?4gDEQYtI4bC2O9jEAUrAb6nUXiPjjIeX6db5a3jxsJsGgD31Cc37dYHpuRaV?=
 =?us-ascii?Q?c8kYxhyV++ELbcdNX/igSn8qQfXLQNi3lTd90Zd/AwcxB3wYWVnhnGgufRXM?=
 =?us-ascii?Q?4/6roQU2HXiMKoG8cFeV7QURovdzr9jva35x8Sk7ubNU8Mzdd9Kmgg4h1iX4?=
 =?us-ascii?Q?VN3i7Q5AIYay8ccEyzkPVYJr1W5RbquegwhmYqcTkU2VE9+4Sr6wK5Qw+lIx?=
 =?us-ascii?Q?9v65uNm6rYEGC3FlxOwOQrzWcN2f5D9txh0XenM3I/BSgYgpTz6IBKA+LpnG?=
 =?us-ascii?Q?KmPeQTAFzLQCqXyEXLYnl3XywzraUmbNBNarSKEYWJOgUaL2+ySiqCPjkfLe?=
 =?us-ascii?Q?3mUxJiey1SP2g+oZ2i/elMOE/IV1qnlzrYl6qVOsDqMcxzzXcfZiUzIr9tn7?=
 =?us-ascii?Q?I/VcZcV7Fmrc4m5GgLYu+4Oh5vHc/p9lEWVV5hYvy2a1+v9b0npPtVnyblJx?=
 =?us-ascii?Q?Nj3QWxotXqR84dhj60QPcsUbamK931YRiYxMWmeLAhgALs5xMY/sxWRz/cVn?=
 =?us-ascii?Q?pegaPMMhhW3qCrdqhlQ/wL80fIEGPZm5RCk+VPxBbIju3mEsXLEYFwwgtKkc?=
 =?us-ascii?Q?Fi9t3qYF7ifD84C/OqBpvNjY9mxzSP57bOdPsvbKX/Nuv2nvP8wazp6NJ+C4?=
 =?us-ascii?Q?+ZF7DK6uF7WmLEUCATvH0YMKSOJTe+oORMLXwYDVD7N0vymYrykBad3lMlYm?=
 =?us-ascii?Q?tiu4HJT1ie04z/xEvIp9cLRdgHa2qR0S3kWKpu0ZYx0o9g1k/PB7wjo+XY5+?=
 =?us-ascii?Q?G0U18EVU2v4rpCTe6b99GQGqb5n4I4Pe2eceaWFcGCi5tg1JdqvS5g+umTh2?=
 =?us-ascii?Q?4G0pjpEm7dON4+S3KugsjCecwtBBqTmkX2xXHuFKAi2sF5cRQN3GFXXKHH24?=
 =?us-ascii?Q?6GXPBozV0uK3qP3L0NpsERKZchafLewsJfeQjkSKWqq1ACDjix09CMKzLIZG?=
 =?us-ascii?Q?Xl/ixiIjKPWcC7okHp49oKzdsIiUZbFGYBmJ0zhCRAi0hlmjhHkh6FCL6P96?=
 =?us-ascii?Q?yXq6u8+hBbQQ2DOdPtfYFEbcsfqrXLsWZXg6Qqa5aqqvDu5tW0Il/xVJVJ4E?=
 =?us-ascii?Q?JzLiWWpMdpcpdc4dX8E9rqtBM8CHegCvyeT8DLsWBkuKurAUqka2+fLLdkh/?=
 =?us-ascii?Q?nHrZytFNp89+nYIqya+UrLs0U+/H2fyAqU/cK2yG+cKTmO37tjm6qrqp3SSj?=
 =?us-ascii?Q?OKhaUq01VwRaVekt5gv/JE5vL/fQ+EwbegFGHyptpub0/TBCS3sqIWbN3QYn?=
 =?us-ascii?Q?z4Iq6KoVrHZJqmVnv52UhZhAakY5201T4SBMBiaBFwKfhbKAte3qFw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dsch6sJWSVdQCK0Cu9wU9SKHAF0WE7Ym31mnsfKKYgTioGfg/xGijQVbsYOS?=
 =?us-ascii?Q?hvS5By1HDSQq20+fCkLn1bHleESqFg4Jb4u8K4J27WJu+rnSGUqwBcqaWg4y?=
 =?us-ascii?Q?JWH/9yo9OFzGHkKO9pmWdpVpq93r+wopC6zKPRq83bFczCNacc7oYio4GD10?=
 =?us-ascii?Q?7WvpoyFgc4YFuwbX4Hf2Hyt3X21VkdEuf5DvyFjSqjG6TXLiF+yqzx3J6p3j?=
 =?us-ascii?Q?3syBbH6I8xIRWno7d7A+8RbSf/rGq7DV+xjZNgu5rFuXFlgdkqK3npDP672g?=
 =?us-ascii?Q?ypl00d7j9FeH6F9g4ZWJdOYM38dt55A7AzDFsF2PMIdpMNnz4tpTJPm+5yUF?=
 =?us-ascii?Q?4CFP0BXqE6LJ00Id3kEWShp9qPTZZVYZ+repN0YGMuTjOvTwHkGA1Sem3Apz?=
 =?us-ascii?Q?KAlZ42lDlhAuB0TIbUwQTDHqwyrw2Ha2Wc1eVR/7R6qwrmhwOzHKqs7TEheL?=
 =?us-ascii?Q?IsLN6s4rsYhj0NF/KQD2mmn5HWJ2hzxWyq1JIjgyuN3EVFSIqmtgqPImEKXt?=
 =?us-ascii?Q?R0OqsbkNCcYNQnntIXMZAE4YK1yNWV0Nj8aB2vGSyssQbD+50sl4F5RDZUrz?=
 =?us-ascii?Q?XmI158uq6x+fYfoGKMj9yHz2VBC614w3JiGEVudUvQ0R/dHROV1OpTQ8aPqa?=
 =?us-ascii?Q?Z72UFDHTA+4RZ0emA8rJO9hXFMaldHsPpN7vWDels478hBScAg+QVhKiBri2?=
 =?us-ascii?Q?tHftVIWMsAD1GWZs6ufa6LgjFYEN3c9baP3TMpdhQJulopA6we39ffFrJPk3?=
 =?us-ascii?Q?EsK97KkUQuLj0Sxa9cs+O42ODpkAPJidLEwmzgONG8mvIp005qmZSbUGrRuK?=
 =?us-ascii?Q?hiCQ+TCvDtopf6E+uWHEq146Zt6UMavU2cn0CpqJFJBxi+MGA7pxzXh45Zr0?=
 =?us-ascii?Q?1kyurjmVwkBxlstoonPG2ICo1NMQG56gZJJzeUYYXn5IdDMPNdxoqQv37lHm?=
 =?us-ascii?Q?QIuL2u+VuLxU3OYGTILvV6Vj2BTxGwJpRtetoeCe5l8rRYH9DQ/kt40Gm9Ui?=
 =?us-ascii?Q?kToXHQyaFhVUc1EX5AEhR2gMUdVx2021iZuQ0Bhq3r5wFRiYHqZL3LCIiYHG?=
 =?us-ascii?Q?mRQk9YISVkA+ma6EGwCxf0mPJ3fysVn48vMqHYKYJNpTvPInK/MtSVB4b7BR?=
 =?us-ascii?Q?Xapxkv7C9XXjUP09rm3pYDj7ZNDrS9kc/M7OqipM2z7pC5fE0bip1W0h2Pi+?=
 =?us-ascii?Q?WqXGbcqMywujglTOZ4swQxw1hL5oX65rMLLddeYOVojLstuiGTrD90PSviHD?=
 =?us-ascii?Q?6tqv0BUZTuO5EeI9+/cj08DCUdNq+Qq9HYoJPdKkVNArrWHPgOWcsu2IvsFF?=
 =?us-ascii?Q?ja1ZXYEuVkFg5iGZUJU6XuQu/YnS4BHKK/+t7XkapdDWqzAaL9gRfmCZ/yu1?=
 =?us-ascii?Q?sObsePDobL8eScPx83qq1U+NFiwywPe1TvT87ihEv7ZZCMc56iI0CFLvBOpO?=
 =?us-ascii?Q?KiqyLQxtlZBnfVR0cJOLojWpoC4a3gbcOWhWpOJ+udM7pAldH3PcvFVhLbbn?=
 =?us-ascii?Q?wl7r99qzLaQYgIqv2mC7RK1ziO1DhZ+ZfX4GV3VB2cKwNmV7Z6gzpptSmKd2?=
 =?us-ascii?Q?L2EJXgA6NGf/0rX2gO84DBgHMGcwAOB1MOe4A7Y3tf+m792WvyHvm0vhN28b?=
 =?us-ascii?Q?yvXfmMecOiWn1ZCRgI46mo4=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e25294-4a31-4b54-6cc4-08ddbfb34c0e
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 13:11:35.4090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMaIDbmL/EUVrhmiAhxg5gtpaGwKmMc3V/2UO9Dt/p7dkOc3OLocV/uIo1Vg0gWxL/m1cwpZwZcplUBVgkeoMHsq/p0PsLH0wav48meRfKfShWB/TBP3yE1s8XKeWl/u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0108

Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.

The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
active array size of 1920 x 1080.

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- Test pattern support control.
- Supported resolution: 1920 x 1080 @ 30fps (SGRBG10).

The driver is tested on mainline branch v6.14-rc6 on IMX8MP Debix Model a.

v2 -> v3

In Patch 1/2:
- Renamed pwdn pin to enable pin.
- Changed supply names to lowercase and added them to required properties.

In Patch 2/2:
- Stored page number in CCI private bits.
- Added helper functions to handle page switching in cci_read() and cci_write().
- Removed ov2735_mbus_codes.
- Corrected control count to 9.

v1 -> v2

- Added necessary header files.
- Corrected indentation.
- Used the ret parameter in cci_write and cci_read functions.

Hardevsinh Palaniya (1):
  media: i2c: add ov2735 image sensor driver

Himanshu Bhavani (1):
  dt-bindings: media: i2c: Add ov2735 sensor

 .../bindings/media/i2c/ovti,ov2735.yaml       | 115 +++
 MAINTAINERS                                   |   9 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2735.c                    | 962 ++++++++++++++++++
 5 files changed, 1097 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
 create mode 100644 drivers/media/i2c/ov2735.c

-- 
2.34.1


