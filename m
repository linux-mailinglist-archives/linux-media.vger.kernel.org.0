Return-Path: <linux-media+bounces-27920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A368FA58CA5
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 08:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 206EE188CCD5
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 07:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71351D5ADB;
	Mon, 10 Mar 2025 07:20:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021129.outbound.protection.outlook.com [40.107.51.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38371B4153;
	Mon, 10 Mar 2025 07:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741591201; cv=fail; b=WZ0cs8sb/tUgYVK2iS36cXj5nzdLfR0iqFMEz5LmV5PZ1frBi1qqOTks1aXv6d4UHdMRlvYn9rkhxhXOQfkeQLWKZsO6ZewMGNOIkfRIOCHgEcYcYgUofkbR4sgQpV6T6CXZWqn3O8QA2sqwCwAZEM3BXIPX6QnrgFqmsx7zzSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741591201; c=relaxed/simple;
	bh=zgmTzPQdIJjiZshVlPnzuejteZQ3P0SvyKC01s5ZK3M=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=guwvDWfbUmEdhdmyUasxpbKaMmE6ftAhkb7pFGn1njwAg921g7lCy5NRtrgJGMrd8uFFir38TM+fN290dA35FvZDmC3NYJrShTqevbGqxjSZRLaIEL0RtDHOWagb4+LzQ3en++IP9HKDm5YHw/Rx2ZK/qnpxNnf7OygqUZl+SsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJDa4M6aXnKLgcQLQLKRnt45htWCW7Pdg0HYZBj3It5qdpKSF7QXe9BlVLr9aVnUdTAwlrtsxkWZOpjMQ7n72qppqXWO2xZmcJmi/mVWSf11TYCEv+K+Y/2YCUtj5nSxNWH2vTASF74+XtGHEgK8b3LBMvivoXKAEHAVFS1qAJ1kH2rivYGp54soDLdpsJUYE8KeEYsmpCbu3yAy3IlpioLotDVMFAfqj4o8xTXdIXsK75GU21aVqZYOXHC/FjzmrGGtyQcJV3Tw+t5hAsbatCVhYyxEMTmdRWN+8N4ei3nv+7GyB+vBz9hQG376EWOyUP2MFNp4t0pdZRmHVJHhxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVsvu80LkeTpMDhpo7K7FYAPL418m4qoZiJpiT30Wzk=;
 b=qHM6SrJGSVOVF1Ad4x6KkDMikQSBDXBjpDSrfKwB6NUUwiL+hnZFyQ0lu+gIJoOQsAiKqrcpoJUr6oHi1aY59SHzM4XsPAbhEjlO9HPwcdrySG8/JWKFybkwhqL/cyS1xHMijbxNSmHj/l9UlxjeIHQ9N1DKV4tkv1fr2hQJI7IjYRHHxFN+9ccf5EIBZlGDqcqjWfJd1YHHuPO58PFCvCMfRbjbiiKKtKnNE0kN95MrIcX25nyLnzMOkVjYqNrvi3zEVG5p4Yv0h+74UREe32G6W+7ldHESZc7UTA01rN1bREllZRqu7XZVU6DiPPzUB2CBu/JDSlyXOr7lODPy3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB1385.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 07:19:54 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 07:19:54 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	kieran.bingham@ideasonboard.com
Cc: Shravan.Chippa@microchip.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] media: i2c: imx334: Miscellaneous cleanups and improvements
Date: Mon, 10 Mar 2025 12:47:42 +0530
Message-Id: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PEPF00000180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::50) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MA0P287MB1385:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a1da4f-a777-474a-b4fe-08dd5fa3f414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3dMMwNAlh/kF3Z67QzdJ9sFWUAjz1Qs4bcVfqxqaUHk3H2BnR/Sq67WtymCw?=
 =?us-ascii?Q?OXZ9+Y6uOJWK/s1UlC+vEcottNB6e8XSr189+YFfak5/hunwsXG+6U7KYyOL?=
 =?us-ascii?Q?U5tm3/b+bgiLKdansvfuAPz0WPL3alU9bfEX46GfNxASv3WnNdAVOBzFvEMO?=
 =?us-ascii?Q?Y306yJiqY7K/zmDG/xdXisufmcl0+iu0e1vlmvzjCBuR/JqD0pBmV98K2ddE?=
 =?us-ascii?Q?vDGtGAsG4b57Ki8opvrgVtxaAonpdpI9HjhauLxYFPGmtDbnTlNNqVKC83qr?=
 =?us-ascii?Q?DGk0bsVzKkZ3GaBhUu/GB0Kh8clx5/ZkBiVvjx6QVLrTuQoRV8iJaZzbeeqE?=
 =?us-ascii?Q?Pxai1QyzOIbqfffMCnI50RopmRIskgM3N7Rl5UrCJ5y5dlFUIDb6zaP7GDaH?=
 =?us-ascii?Q?FYFoikR8qehW6hc5yzaKWJBCM5116saVaC4YPgZQaSYUl1bDYBJPjoRTEx+k?=
 =?us-ascii?Q?+j+7d+VxCP/X6znr9d9qcbPJ1M5/RxT/6UNOJnCFQEW/aZKyR2rb2Aby7iSV?=
 =?us-ascii?Q?CITZW5tjnpS6Zmx0KriWo8FQLzK3av81ob/qV+yM6BI5bHpisCx56HsPUG+a?=
 =?us-ascii?Q?IiHS3fse32tpxPEj6OZtO1p/WSwzuFuv/s4Y8GXsXM3ny5kDpke3OEdUsjJe?=
 =?us-ascii?Q?pIFmTR2zrRjiWxlq1To/zD4zXwb6NvYzDZ/RMOqkknjShGjBimgGH/A0gvy0?=
 =?us-ascii?Q?qTuOFlBx947pu4qQUuLMqZNuRgedBmpOjxyWIZgLnOEQMdtm6/vBBIQrnOFv?=
 =?us-ascii?Q?YlfIfiUbP2Bj9VPYD+jQ77YJ3K9QD9ys+b7hGxz0JV3K9xaGLMSgcQ9LO2FM?=
 =?us-ascii?Q?zuyfEMTPCSR7X/gr96TsTzgK6NQeRruHm7xWMNCu3z04gp3E7VsVoRG9hxi7?=
 =?us-ascii?Q?Fn3zq8O+TMKmwB6xXvjiRWZSkEPzhCo8MpMBGFO6QJOkANSZIf4/a8Xdt4dz?=
 =?us-ascii?Q?hjUtwHK6Tnt4zBkavYk1cfiJ70JPXbVSPHF2UH4lIdEeOdXtbbKAvEFPyyE0?=
 =?us-ascii?Q?BcC8s7yNvopjTQYSyyIXt0JniEAq3IOnJT4Zc3kQVuH/QxvO0+SmKGbHlKiZ?=
 =?us-ascii?Q?hCKIQ06BCgTNjQnf8iN4FpcU4Y5V/Kj1Hr3ZxrchsyFe9jcwVm5mJQHeNppy?=
 =?us-ascii?Q?zHsOrvRIGhWN1y4sd+K8XYhM71s+KKtPAfn9Jg3rNArESiqdWOmimclzdCOw?=
 =?us-ascii?Q?TPyKL5/4TagK42DgJX/kiI64g0F0KZNVKg97s0UwzTELMpjrrcjIRzw22M4K?=
 =?us-ascii?Q?EAbFvPMFLopgO6Y3Li5uCxd63Cz1N3ooL5yzrxJsf1hmAFK2rQOKx9PkX5iF?=
 =?us-ascii?Q?ndOXCYLE0sO6mZOIXST4Rve84X64MKhzAh0VqhUipNygxiyzjhqk/+nYd3P5?=
 =?us-ascii?Q?fw63lII39gqo/li6Dv3kx7UmwT+r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U+eMUKh40+Uxoi/AlC19zt0DuRE5W15asht9rojGWSTI+psFGwbPmh7ngK7q?=
 =?us-ascii?Q?AACiMCQCUsYjb54h+/RDw0Ad2aJCdgzZ0kWLe/D59HsH1jSVWACTth7sujuS?=
 =?us-ascii?Q?lNE4FuIhucbfL8I41InPRQiL3TnV5S3vBkGeR+BucE18z1i5fAOv6W+mGDKe?=
 =?us-ascii?Q?Fsxp3tgvQo5vF8KMerHLIqGddiSOch8DpavHJwWeIxj3/Q5t7SGJg+j2/l3J?=
 =?us-ascii?Q?UjIbiWj7oupO5k3FmGjrpS6L0XaCd6i9rFROsvvc8mofeFXx/qmOP4Mg6YTx?=
 =?us-ascii?Q?vXK17c9lQyBlKkb/l8WYsStP8W/nMsYMmuqY8wH1BAdnKUH3IDidA8SfS65N?=
 =?us-ascii?Q?ZJf4Ixt43cm0PAx5J6O9tnBKznDgHgdH1POP+jNe7BmZz9HaELUbEMUMBarR?=
 =?us-ascii?Q?BCjPuJXYhzEpc8MwLHUk5R2/0sKOrR/k5z/k4L2bweDK9DBiE61UAndNIcWg?=
 =?us-ascii?Q?wk8TcO2Kt+IN4lwuqrqsEnjKHhuHvaohINM30lae9Otbo+Igyve2lKbpKCDB?=
 =?us-ascii?Q?Ztw3+Y+O/VeXROEBgx/CY1ARx3dsB8ATHfEVVa64XA7D6b/8kcwv5ZG+uU3U?=
 =?us-ascii?Q?8bedj+bLRwG7cU0PRsgur+RrawKLjwo4NrpLjRYjjxzk/IBaZlvs+RseVTiu?=
 =?us-ascii?Q?Yck1I2V6ueIEdEDixjWsA92aNS/tm4DO0opnH+mNZs0Qk/HQnZ/lmyf5UOuc?=
 =?us-ascii?Q?rRwZP2nQr6GfaHkkMYI3UpXE7LXaZy7CFFyQWd+Hbdih6G5pp00tb7KVjn8g?=
 =?us-ascii?Q?7txOCQw1wMevd/4ghXCZhdKulfkAKRgGl4KDKFZ81lugxskg5ly9PBYVuzlp?=
 =?us-ascii?Q?IXRJNvAce6YwiX+L1xwEIRfkgYhyFiEiTTmDoWmDme9sqqxZ+jsAQBi3QxXD?=
 =?us-ascii?Q?7S5Mt2IegZTLD3IamJV1EPUgGoG6ohWUCv16/py7ln2zuUKNUI4lRCYlPebA?=
 =?us-ascii?Q?DuW6TYdTuPfXmqQz2YlPH6wkSq8y7fe9i/Yt3UF1+dJPX1r53zxz37oGEdN+?=
 =?us-ascii?Q?DUslASQ3S17zY7dqhyrzhSCkdgf8Y+sq4qMiCrf2ixvDDLZfUg16M7RmbMnE?=
 =?us-ascii?Q?ggNS/fSAFuLsdjIcPpzinDC1I680PBre/5e5pIc4MRu09fhl1rmiL6Qflrp8?=
 =?us-ascii?Q?SUog0tC8wZpebxTajx+S3VsyovZTVzCAm1EmWKPAEYaX0pH6wq1pz/t+r5Ka?=
 =?us-ascii?Q?k/JKltBqn7uuVIj0SwHnpz0qCeywmgwbqxDgIu3fLGVBz03GxKjHAPgGATUW?=
 =?us-ascii?Q?MbwhJBZ8TASbzee0+ceUdnuIin3wCstpjhio9Yyy9qZehOWOW77LA07ImZ+y?=
 =?us-ascii?Q?Sy6CAwOcwQ6jm9nuPVWbTDZkwkNe6/aoCqkO+Swn0hsRrlr7BEyqTzPNRcl0?=
 =?us-ascii?Q?YneffpyLk3z5iZYJIVqoBiQsyxk9TJCMezKyNYUog5sb5ZP2CRwOkgN+pCGm?=
 =?us-ascii?Q?7WK5EXV7X23e1YGzD4HfWlmf9EdWLwJgBqQIqI4mLPqzax+bG61XQcfOFtyO?=
 =?us-ascii?Q?hpYrzufb0JeKh3Q/M9v70qge14dPDpHU1M3r7LrHk1uPZUAGgLRFPCrQU65C?=
 =?us-ascii?Q?tk7EVWJXB3XqgTcZKRwA3gS7LYeS+m7aQb9UmQJjcPd04ZZB0vq1hoWXOO68?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a1da4f-a777-474a-b4fe-08dd5fa3f414
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 07:19:53.9232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icfMvUThU1xbcbweIYEw2HKd6PIKzJVhQT9G/UCmuMA2pofQQpHM86uetJCd0SIErktRNyIpzur4kkFX8NcXTOAQhtyPTJI28xo5FEDamUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1385

This patch series is a collection of miscellaneous cleanups and
improvements to the imx334 driver.                             
                                                               
The changes simplify error handling, optimize register access, 
enhance power management, and add support for different lane   
configurations.                                                

This series is on top of Shravan's patches [1]                                  
(media: i2c: imx334: Add support for 1280x720 & 640x480 resolutions)            
                                                                                
Link [1]: https://lore.kernel.org/linux-media/20250305051442.3716817-1-shravan.chippa@microchip.com/T/#t

Tarang Raval (6):
  media: i2c: imx334: Simplify with dev_err_probe()
  media: i2c: imx334: Convert to CCI register access helpers
  media: i2c: imx334: Remove redundant register entries
  media: i2c: imx334: Support 4 or 8 lane operation modes
  media: i2c: imx334: Fix power management and control handling
  media: i2c: imx334: Enable runtime PM before sub-device registration

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx334.c | 800 ++++++++++++++++---------------------
 2 files changed, 353 insertions(+), 448 deletions(-)

-- 
2.34.1


