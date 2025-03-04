Return-Path: <linux-media+bounces-27491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CCCA4E344
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 16:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E29A488375A
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 15:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A768278155;
	Tue,  4 Mar 2025 15:12:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020134.outbound.protection.outlook.com [52.101.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6AA1E505;
	Tue,  4 Mar 2025 15:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741101152; cv=fail; b=oJnv27yocI6B4p8+LBL1ELpEJROgo5s3dJYTOepkUwY3L5GNkbOvsnpGGgjyEGevpJ7sblzFHtNx2S2iOaGOk7gKyPBayzOZ5SxpYScb8lQbry2IM7hwxiCaYuCk2YRmOgaYtDa0dN8nVEY1nUf6fuE/NjHi3OqLgVP4kv37sSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741101152; c=relaxed/simple;
	bh=bEWzpZdI0RCaK9lgbSRZ9cfNA+EY4Tz14MeQfZnWZqI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=o1+4lJLmoDrnGOwcp2dzn2/5+a4t+wrdLBc+nd6kknEF4UUpHGAAf9+LenyXHDTcvXJpMQltPmQhH9o9ruuSNup+i64kdX5FgRqybrSzSUazyIgxbJ1ZJApfkT7QOI+ij3wdNyO5ThMHPwSbUtGUh0Y5iJig/WKIgVQzXHguv3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMSe79Mp77hSF/tRHBbXEsx53QepzpHt34omYtNVN//XbgnuyxhHIRWB73Bvf8bbSidQtjhZey398USC7oE3X3/W6NEHU9UUzLm+qA1H/LxJABztnjqDPFhwtdg4kDjFB6fiAxKOlUaygoW2GZddIC/LS3n5NykKyHeMRjY8UGsUE7CUMwpar6tpbMMQJOeN0QmcDu3B257+4QlHs2o9hiElTw8Zwr0X2YG1aXtPdtv/wJdt7xQU8l43awnWEKMhoyrHG04OxuTF4wZaNAThq1CCGjBQ3dP/v4NCkKGeJS75yfsyDeDm2bj4VBUHy/q+ryapmK4jkHqY3Rz0n6XxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUqJAEwXcXtqN8QRmZ/80pLfR7SktP5EycoUnkljBvs=;
 b=Wcrvub48g6E1+LuyQn9TffPDmVfDkbOGCqaR8+r1Fyw3iaYe52MO02S/tXtv7CRb3to1n+dqUUV7luWJADEHYqH5HQw7Ci6sT5lt4uErk7j5jPH8BjVtn/lx0cUQl5ZKKBVUXFAR7KbRgSYDjtR8Yr0iFPF6754M4bqnUqtIyZR8VN+KBExC/BpfvBiu6cbcox4R0eVKioveDmkFB7fwjXoedUaT0doiksuTMwrARkDSoWwIINNEZAHNu9a7e2gIqr+4RSybx9nR888qz5WAKkwJBRZssid93uF1hdKULZR7JYH4E0qUY8P77a6xpbV8zwo0fpVabVAE1ReMG6PFEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB1836.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f7::7) by
 PN0P287MB0672.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:160::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.29; Tue, 4 Mar 2025 15:12:27 +0000
Received: from MA0P287MB1836.INDP287.PROD.OUTLOOK.COM
 ([fe80::2f96:dc5b:f53f:b759]) by MA0P287MB1836.INDP287.PROD.OUTLOOK.COM
 ([fe80::2f96:dc5b:f53f:b759%4]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 15:12:27 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: i2c: imx219: Minor improvements for runtime PM and stream handling
Date: Tue,  4 Mar 2025 20:41:32 +0530
Message-Id: <20250304151134.105771-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::20) To MA0P287MB1836.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:f7::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB1836:EE_|PN0P287MB0672:EE_
X-MS-Office365-Filtering-Correlation-Id: c13ec7be-91ac-4144-b4a8-08dd5b2ef959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fZ45ZqgkHfUQXrKeXVfVhfvNP1ZnqbnSe9w9j80OGo5Uq4jEZhTbO915gv90?=
 =?us-ascii?Q?6dhEgJ5TVD7lDWoJZSI5azAW0Io02gjTpNm5XygUZUgyudxMI0Z4Vbvj2R4x?=
 =?us-ascii?Q?60KHT7SMSlA0v1iL8jHQYOBqX8mlo7MN0PFv/btBPsAvX/LWTlAHSzjC5JHd?=
 =?us-ascii?Q?IlyBZYaguXB8oC67nFVomh1PWzNvTYILIP7lbZndSlcrv9yLPXxDjhN7RvrC?=
 =?us-ascii?Q?u85KDrXEX3Oir3lbyUvG7Xm3UgPlWEMV9EKaRPwPGCCe4g906j5ZzsZuQsRa?=
 =?us-ascii?Q?Fc84pFdy7bVmoRRgZLrdOaKmXwNTLNplywBk8eLS6Uh3mjrmF/Tqu2pB/y/n?=
 =?us-ascii?Q?QpVimoQcdBu2sC1LG1wxy/WUnh/zx9DFF1qq0VRRONASSm8TV1i0l39lujjo?=
 =?us-ascii?Q?2NrFlK9EHRX0dtjwvPFLjlzEGE9vS2w2eU3w2K4mcR8adGzMslrSv6bsPYmp?=
 =?us-ascii?Q?VgiKMTsw18mf1ikbI4HiRiNNfalGKxvFH9FlX9Cbh7Sbtmgou7PBqBXIOD5c?=
 =?us-ascii?Q?wiYXQG9eB8ff/2ckk5UW//oFxa2fJGHgq8gk4/8KrfnuK7GmdSbLF+Ja575b?=
 =?us-ascii?Q?6c8OfVy5FGUQm5QxkInjpdReVrF92uLBX787tHVRhDZ/XP1JFuUUEBOUA20r?=
 =?us-ascii?Q?6IscTd7HpARPxS4Uk+aFtwXSdLEe+p7lwMqxqN2tgOhgQB/VHswK/d/9vyV4?=
 =?us-ascii?Q?WELQl5S9DYNkVeOKLAU1G5xAqg78ime9gI2z+HMTK6iXOxtYVOF5gS1C/QHv?=
 =?us-ascii?Q?Gg928x8SvBjueC2Gp5TVCqYzPtxF7rTZ/uNlgW9852DHKilja/QTrQID9OUi?=
 =?us-ascii?Q?Obi9SD+ABp5WNQ4bD5XMGhJFoGZHHgJ5nmLNPCGhwAfMZGVdeAp/BUHrwhZf?=
 =?us-ascii?Q?JnKa14tXqPltNKag35BbvkwhcCNDjuzEAX6s8eI3FVEO52d2zOg06lBVa9ZS?=
 =?us-ascii?Q?6Yqwd9eHuec0OaHIQLinntSIQOwr3YpmNr2VlMq1jFhTto8LOvJqEFYieqEU?=
 =?us-ascii?Q?yKJkFZUj6+fl9NkZCTSlY6ewKqMR/k6ysx/gz23dYQnMB13/r0bVpzU0vpxC?=
 =?us-ascii?Q?CVV7DPorUL7RRkmQuSpXn/NUcq9nkcmDC9441t3qlWKHJ+3rMtnevU4YhZrp?=
 =?us-ascii?Q?khalJC/wXtXtN08gybH8QufqBM1LfdCocosMTQo2PwTMMFPJygv5x4TsmE16?=
 =?us-ascii?Q?tMGvk12XBslF50Hzx3vTshMqx4KISzRq0q4HEESyJnIZDO7eMOlw4qma5agV?=
 =?us-ascii?Q?QEo7f9C5m0v7v1ZmD8tCOnegSnYG1ev7GCJBV4bPUblxjjpBGjKkGS3UH+Qm?=
 =?us-ascii?Q?3rblC95NmGuoMZ5LDeAKqWszA4/Z9WGOscJr+r6RgUbz8CqGa202jh2AAD1d?=
 =?us-ascii?Q?4EHRNB0IzSfuX7l3NcpBu4sN0sj+4bIYsOe4v7FdF7y4RtWcPMJAn/4Zg61P?=
 =?us-ascii?Q?xOte35y4ZHB84gyDKl0Q0XfMTNTmJhTs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB1836.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oyoY3eLlodlYUeMV33A4SJWB/PrOYVprcJIPx+nEOiBEl0hJzx4YDgFE4dmn?=
 =?us-ascii?Q?4EfoytyvFvJtSRc7JQEKkN1rm1EKTOKANAkLX9jHhCHLnW7QzoQGRkIL3lcS?=
 =?us-ascii?Q?SKBXKLpG90/73i2VLl6rvc9OUgf7mK7wtbbcpbSrC+3dOAGGQy17elFyvkYh?=
 =?us-ascii?Q?u0TLfmNWEZ45+2sBL76ydbh1tD8/qFT6QbUah3enAkv20grsVGcLGFpRPKKp?=
 =?us-ascii?Q?4EVew1FLH0FrI9x4QDX+Q02t+lADVpu/PqV5xD/7ttuxvZR2MV/Rj6BKuNme?=
 =?us-ascii?Q?SCpPp+rzuSyw256wbOo6si92mHqKpLTmG9a7MiAERqdWDahAlJ9aO0qVOL17?=
 =?us-ascii?Q?wyqUOsYZQr6JQ9rpgFPj5qdjfnE6cIWPwQDyAtt++AjHj3gYtUdaq2/II8Tb?=
 =?us-ascii?Q?TaRLD9gBXf5o8J2/EdEC89h881PbHWGs05ESMHx3wdP3mD9kn3IDw36dNcW0?=
 =?us-ascii?Q?w5em+y2tCE7h8dae0BIMar3ZOdIT8jYGnlmbE8d+kQ1GDk1EWQN/k+w/qt8t?=
 =?us-ascii?Q?hk5HVWwI8nqk50N5JibkBRPDb87WtmsfFwPjAh/9yc3/C6PoJTiRjXuwWYLH?=
 =?us-ascii?Q?5da6X692DOsQtsR/6vM939F0PsX527bTNGZFI9hUGDb7SuOO5hizjjrTh+Ip?=
 =?us-ascii?Q?WviQg+PxRNZIqrpH+HBzEXXRE4txUc1As5xYOKHCnbSxLgUCeLgLjguM6QgA?=
 =?us-ascii?Q?7jyFUbqa22H3+TtzUATs5CyaUpKbbhEfsezL0xwcdKWi3jhpA8uyos7DNZKP?=
 =?us-ascii?Q?3pE2KdQW3V0EBsiyjCLlgDQs66pP1tCZgcPSj3yNIvdgJcV2ImhKVXr+5dJF?=
 =?us-ascii?Q?/UJFBUHjfWcpo2J+LNTx1wBrBuV35gyFkKXF/8f1/lpJHl0Pw1GBKthR/PMf?=
 =?us-ascii?Q?tVaLPLifC0g7fN4T8Ovr7vkRpiiEVBtpruAGbx1610X6UBGqHvU5YHX30uWE?=
 =?us-ascii?Q?WD6bhrnaXES4amGTWdItKmfpl+G5B0yX0anVUvUV6b/ScTHMNouIu4juleC6?=
 =?us-ascii?Q?t+cO6Mgr1A1NJK31dY6ZVyXww0WjlLUu6rVdRSTF014qCw2+ZC4JHI4ImAum?=
 =?us-ascii?Q?eGf8nqMnp8U3oZ+1MfbimOKcocNSJxH6SPYXAOwSwSy6XHGw9tvZivaOcOQw?=
 =?us-ascii?Q?wCLxJgJ5r7pOyvgSN7jhcobe+Y4r9W7XqX+vAbmIW3vwNFqygjNeH2p640BG?=
 =?us-ascii?Q?82UTXlCcWAyS8BwSCJ4/MFbJOiUkmY4aINHxiCD57FyIpJOIJ+ZJ1e90+o0k?=
 =?us-ascii?Q?p7gBXeuRqfHLKZsq8rdO4F7SiAeKgLShymyyJ4DWxaSLcHMtZ1h15+PWH0qF?=
 =?us-ascii?Q?pIsMdQxMeb7Yp9pEwnzqMNyOPuFoiilvsNA11HQn3/4lZ7L3PvyvU97dfG2A?=
 =?us-ascii?Q?W+XzHoidvQFdXTW5YhAAQ0WeGX7qdbmKf/g6CjpZdAxGSTFI9ZMn1DfwAY4p?=
 =?us-ascii?Q?kWdZek3WJKuhtjCCE0imAVkPAe+Uaz5XUoUkjE+NC5A2WNDiM4jZayvH0mVY?=
 =?us-ascii?Q?6lZuPUr3W9ZkZtY4roIeeW4dF0BgLfpuCJPh/JAXo3c/gtk/MlMmtl4UngEj?=
 =?us-ascii?Q?LLsDuyeDiRmgJRizf4yq3Ezk0L9H4khvGr3Hrr7j6RP7rv3kpIAPrzPqPRXh?=
 =?us-ascii?Q?Vw=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c13ec7be-91ac-4144-b4a8-08dd5b2ef959
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB1836.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 15:12:26.9265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1i84pOEgX1u+dX+PoI1y7ZyJgn5++I/DTArAFsfX594Xf7J5/o9n+EGAg7g5szd0gUZsvE7Ry10OIyOwOEaFZ/BKCyqFs3dRdz7XzWYITI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0672

tarang.raval (2):
  media: i2c: imx219: Enable runtime PM before sub-device registration
  media: i2c: imx219: Use enable/disable_streams callbacks

 drivers/media/i2c/imx219.c | 62 ++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 32 deletions(-)

-- 
2.34.1


