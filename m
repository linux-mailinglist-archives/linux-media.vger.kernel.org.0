Return-Path: <linux-media+bounces-48625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C7ECB590B
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 11:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2EF53025A7C
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 10:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF80F306B2C;
	Thu, 11 Dec 2025 10:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="N5bLSDXF"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020101.outbound.protection.outlook.com [52.101.225.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB85D286D73;
	Thu, 11 Dec 2025 10:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765450493; cv=fail; b=ozdb56Yv4SyQKpKXewulN5FbhkkqZvQMtM9aRYWOqWzus0HoRkMhOR3+suKUmKFFqmjHPuoO7rDhFUEaPhNqDtcOy/71MwC97FsNPGpzAYY6tf7DoaLcMZ0r07qRi+VJwDRidvpmLoPAEPCMmTNYcPivE5H7LIbPlEaoMP0PV90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765450493; c=relaxed/simple;
	bh=SkZxdTlVoa1+Zf2bjr4GwmXQ9C3q6dWWJE9pSyh+T7o=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AFYAMhaIIYmzEnaZVwUrF+pDWndxS5L3AutuqqqM0aNwxCMaOuWzgABV48sLP2ZKIdSp3veGHSTpusEqeUS2TF0bguBmAyM+HIIKtzzWcWP8pbYPLfGrumKZ/MFik0KdfNYyFYDraRdp8FEOp0e6OvEs7LRh1Hf1AEqYQ6NNgAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=N5bLSDXF; arc=fail smtp.client-ip=52.101.225.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNw79A6+Nu6lvKhgpfMV9DuLn8SVHS2JLEAjaxtlctcMFocARdjgZxNG29+9Xx/MliDboYCkK5GLkNSq12yH3bS6U/z0gVNrkbObPBEa4566p+Y73rGgJLq47EP1wtv7URUa8TMF1pdajsp8uHTDNSvBGSsuQ0GpjNqUhhKPHek2KlDbr5GjTKYg0VWGB621mrQXFGt78L8ke/pQ6kwGFSZTEFL5cS68Trf1BjyuQL6s93/6UpxhXEdFnyMA9aGe4ov7UZG3NTnJFMOocaiawmq6wdU+eXVDjDf77OMzXeQ6ecPXwSVV7PkTnP75BwNGWWv9Ov3+ouXZeVbu/bX2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLVuiy3bDuN4MS5yVe32hqVtd9spkAK2Upd6Chn5VBA=;
 b=ICl36reta4refghkjAnVEnmFfx5l0vpSgkeoDo55hOu2J4SelRz/yHSOUxvbPoVauvqXW7/AF/tvAb8DrUSgysxF8CzJYsfbqsAm/2sCNVjxrDF+GgUGkoO4BYxgVlwufTg0uBNPVtEM6euyUOHftGv2uT8SY54Z9ElErjAVSZj/Hl2VH2HtbYYdnrx6p0qJwpOF+/cwpbwYqDv2jLrJrKGbFEY5oUoFuDUg4wf724UKiwA4zcNoap+uiFoOgAWNI+mfjMOQK6GU4Ie2FFe8f1WV57eUs6XjXTeB9cXvzciBeY/WgRVkddwwgctK6nLQNZP5MCguiV55rsIaYhralA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLVuiy3bDuN4MS5yVe32hqVtd9spkAK2Upd6Chn5VBA=;
 b=N5bLSDXFjhT49hBPPP53K+cpSBFBWFu9mWHyhovKK9tqtxbOfbbIzFZph9X2BLWHAxKAfG7hlxLI6XSWiWYwyv4W0d4EAGPdU0BOf6iHm8SmeTSWIqNM0ism9cOSmvFlZ4WmiTFjj3IvNYFYj6Sc90UvQwkuiv+V+k/LiaUEv8UvIkZbwFc/h5e2/e2Ef0NdYjXZ4APPPvpzcH5K0fij5eWhC8dQM2zPfQv2bpkmdAq5qfq+xmFc0AlhN53TuBKQRnbIj7nEmxfFV1zzU7LdDsveyA5oADc5dnfujC+2BmuyjItNAeLHKKPeKtE6V2CONhLouFU7VY6FMCLcfp6PVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MAYP287MB3833.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:14c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 10:54:45 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 10:54:44 +0000
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
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] media: i2c: Add os05b10 camera sensor driver
Date: Thu, 11 Dec 2025 16:24:05 +0530
Message-Id: <20251211105427.22374-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0116.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b0::8) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MAYP287MB3833:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e55255-d7a6-48aa-02c3-08de38a3b1d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pKTYAPUY9bCCNXgw84tNjwcDRuFMF2CenpdG98iLVmzRlcq7ZYLFUIFPyqfJ?=
 =?us-ascii?Q?wgHrtVd/yvc2Bp9CuvD/R8YOg1z7oGpLMzvNTVlbxI/yTwbpuVhnEvALLdzi?=
 =?us-ascii?Q?g97Egbj13MmSKOOgvXsSIh4dA/Z7B+atzqqxqvxCCMAW68YAO8nLXplpoRoW?=
 =?us-ascii?Q?yEZs/gAXrm+6bqQr31kskr5bcU1Oh6Ui1z7feujuWf+WZMn0x8HR1z4tjaUv?=
 =?us-ascii?Q?M9Tqwq+hOTZsuwNN9IZN0QG3qyEF5GWDvtZmoIY7OZmrFb8zSZaDZ+t89ocu?=
 =?us-ascii?Q?7ZBMkkM5xUZi1fSYD9plsV2/egd2mXj3MyWPBUtC/1wlaeWWD5Yv9pr99JLJ?=
 =?us-ascii?Q?N2UGA3tOorV+XD65LBRExGlHt5xyQm11wXRD+tOxIbLldLXLxF0gUpyVjcWP?=
 =?us-ascii?Q?TOU928MKe60/5yGyN+jOxC8ZDYytHEBh/l3I7ZMLxj0aJiOuxPeOer+OmNj4?=
 =?us-ascii?Q?6Mg0tf74iRpqC5b+C3SlmxdxNodusvjJnmj0qY2DpGv0/IjZymE0FV/0FjhR?=
 =?us-ascii?Q?yOFbyQSlWpPI3JPRfkjWlRdhgTPeVn/cZDz7p6UPD4oTRIxoUwxF1FPvKlu9?=
 =?us-ascii?Q?pvUPMpbszLw0spzdPlSGDwHrMVksPQvAQOoyA7/HYh7F3RGOVbpREKL06FaF?=
 =?us-ascii?Q?EqHy6kPVPPoKPqKeDXKm8rKdm1w3ANoaWdgyhJsVDx2+qfpNmMKsbz0AkfJf?=
 =?us-ascii?Q?MyzAqXZndN26ZA+j1CmkCugBVz1Z+NyUFQS0YOMCUqjhQ0YmaqdbwZ+pS4s5?=
 =?us-ascii?Q?lmYLUfB/MbXyOaI1RVTMNrZs6/DQCgMnk7sHXBycZylfIjYJfWgU2kL8tGeS?=
 =?us-ascii?Q?u18Lm3pwzJlxlDes/0IPuPH8xgvL/nAsVFLzAAFdNgYiDZTrdRjxmi5D5BaF?=
 =?us-ascii?Q?v7k52p2gUFbW/O9FgjgUj4tZ4fWybI3Gd3QM7SWnO3C9v0iM/P+9Ml+8D0b3?=
 =?us-ascii?Q?z4tjx8juDd/JjGwHX55Td0N4SEyNwgOomsyXKFWlIr/LmkUyEhqBU2TxlW1T?=
 =?us-ascii?Q?eWePL1eULKdg7Y0jp4WrdLy4jgYVoQtA1liuLkmrvs8PqxHYSz5P9ugCxaxr?=
 =?us-ascii?Q?9FMQCFcNxUd5rIYVylNkHP9pFLpgb5DHv6DHZJbULyZsl6lWD61/rhc6qwwt?=
 =?us-ascii?Q?ypt0ZDMMVMAb5NrUtkMtNv6mJi2RBK9MomppVFdpQfgnW1FonAVtt2H4kfPS?=
 =?us-ascii?Q?2QJ8jwuAGdpvSC57o5UNwaS2fuZ9/1fPTWye8+Kxv0VFLU9JpGJ1Sqr0fb7h?=
 =?us-ascii?Q?vS2kfqL5W855lwnujaSv4bu60UDPCoSge+9dkBKSVbEX9oSItPbqIRtYmwaG?=
 =?us-ascii?Q?itHFJY/eGweb7eVKhXD8VGVedFPQeGl3lgCnuvvIQ43hF1lNPQmp+ZPm2Rij?=
 =?us-ascii?Q?9Pr6lVvismFQ35DNcZ0jAAth6Z1sIDSqCfGQwnuBwJJ0WfnxjEbxQ6K1r77i?=
 =?us-ascii?Q?oChARsI3CuD8dZ8QhK0sIIN+cPD9X2yLdbkxFevI+fAhmMYYNEIvhHN44XyD?=
 =?us-ascii?Q?Vow8gWScvdXzkgAVbcaQIdDZ3qHXJzlddEGR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v9/DgkQzXcQkNuWdY/Gfu+yHIpuy3rz06swLCz95EZZJmpm97sB35WcIrlsd?=
 =?us-ascii?Q?X0FGSM6jEUoLnPrdEjxYk0xStyB5xDVUyvWMlpPsitt+pz0SOP/3NoE1JC8Y?=
 =?us-ascii?Q?5CVyQDQU04jBrfCRRCiPz9zxBanKAPGtMYHCXITndcXGxWdNIm2RaLVmhODn?=
 =?us-ascii?Q?0dbgoucxqKnvK6aKngWqW8sWnwRwloUzmNJ/liSnDMVLFDdkTbx2eUovdFAq?=
 =?us-ascii?Q?aoauJGmuHbBCoMIOOFV6+IPxiGVD6mUVQWKA+btxpxupehqZgcLEVwpWVzC0?=
 =?us-ascii?Q?BLicYV/RVW/zpNRfQ9mk4wpgwLk3jH9pe/mtPQtGNuKHOtX0cGk957Its8gG?=
 =?us-ascii?Q?vVqWK7mS168wOLpsORRZIovWfc/5XCnQxyXS6kXIK7GfIrGomDgA2kqWCeam?=
 =?us-ascii?Q?7/qJXM5KyOndwz6UnYbkLunM9PJ6RmTi2qUURc2yytdELJHb4fD+qKXC0n1U?=
 =?us-ascii?Q?jBYd9P6+3WI4FJk6gGAuB+ZLWzqM6G6V0TxVShulWluGybISyA41Mri5opai?=
 =?us-ascii?Q?GX2f++GR1Dw1ujopzj3k0anT8eUvovW8Kcw6uslPghjYGE9BLOGaJZHWYW19?=
 =?us-ascii?Q?Kk/O4BhV/3kHcRz9i4O86pSenun6UOrs6sRhsEAr463BaqxHSaX2ACXb/fAj?=
 =?us-ascii?Q?IZ90wDrEwQxQwN2xqbsAhvtO+yw8BVm2MS6AYhXtjhVbAfX4gEU9ASRJ19b2?=
 =?us-ascii?Q?1lJaDE8Hyp+HPvpFnwI4rgStjOnjJhTpEBAtvSbJgkrb3OxzqwasoP+9yTVI?=
 =?us-ascii?Q?Ubyyxrj5Q5RkljknnThiyy7Eqox6HFtGtFqaV9EZrkWYP2yq71006IUeBZ0p?=
 =?us-ascii?Q?jxzxjVNg3T9N6OdrBKn0AqE9UwLN/stQO5BGs+4+/r7OHNW/vilnjwUPd4QM?=
 =?us-ascii?Q?bqvMq3fnwBSD0Df+vMqtW2om/xpdDYOxJSgyF1QdDr2/4fvGCDFr/p2YOHEc?=
 =?us-ascii?Q?Ak8AH1+hLCc5/g4PFwsnClHd4kyuQFBInWfiFGwuGwfOfF/fNViaPqCY1Yyi?=
 =?us-ascii?Q?JRjUzrLCDLKSsP20kJQdhNYTWnERKFlihYXV6vGdP4QAdZxyGUsKxa6LliXX?=
 =?us-ascii?Q?G2crJfSOFL3wfnK5ICoXSrV83eINKdqV3mX0NP/JLwcaQoEaUFp2wJppnIoh?=
 =?us-ascii?Q?tTV3xcyL5c26aqFeSZwJZiq4CDaQKOsxmoGM/CPzztWOw6lo604ApKvrtlSc?=
 =?us-ascii?Q?vqpoB1fuqrEZhlKCDZwTd/qolj5ILoATQ+gkMWhTj3r+vcL1TK6dinArkRSK?=
 =?us-ascii?Q?X7cCQ9iZ1/IxRhvtzpgQB0/Phaj0fyias8Mq9UR0JwkN13nsF/fVsBdogIz2?=
 =?us-ascii?Q?LRCUchi0w0qY5WSZbo6qSWe+lUPfZ+qGNq7a1vhQuGlf/dkeyIP/fOutcbLC?=
 =?us-ascii?Q?JpscuG1trZGFL35R5E7YD0cfQ82Rl5GUvjoF3qNn57edpgF52BjILLQeYlAw?=
 =?us-ascii?Q?yTfM/jWKvrEk8gMiExrwYlzLbKN6apary+ca++JCKJ4bL0V6ubVix23l4V31?=
 =?us-ascii?Q?R+sOgSmMIf17wmHQqUCWQyb3v8oY2KN3PTocNw5stGwjAWj39v/qcGjIeqCu?=
 =?us-ascii?Q?OG5749Ay70dayZixp+ImIQCBUzZB5NZgFvnOgF67vSc6sDydhRMfNJZoDJth?=
 =?us-ascii?Q?LPMPSDCgaBbQXiULaQ45pLs=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e55255-d7a6-48aa-02c3-08de38a3b1d6
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 10:54:44.8784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bl3Gr9Nm72VEk/Q1+IHM4fy8J41tCF1x9s8PvJ6Typxq54Enp1pkRKxWMMWegobhIE+I+cKR3EEnJF6VEbM8r+y5xG90T3qpEzpDSYFSpZqeG2t0b9twtpsd5dygitG1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3833

From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>

The Omnivision OS05B10 is a 1/2.78-Inch CMOS image sensor with an
active array size of 2592 x 1944.

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- Supported resolution: 2592 x 1944 @ 60fps (SBGGR10).

The driver is tested on mainline branch v6.17 on IMX8MP Verdin Toradex.

v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev3:

Driver Info:
        Driver version   : 6.17.0
        Capabilities     : 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev3 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 9 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev3: 44, Succeeded: 44, Failed: 0, Warnings: 0

v1 -> v2

In Patch 1/2:
- Fixed indentation.

In Patch 2/2:
- Fix kernel test robot warnings

Elgin Perumbilly (1):
  dt-bindings: media: i2c: Add os05b10 sensor

Himanshu Bhavani (1):
  media: i2c: add os05b10 image sensor driver

 .../bindings/media/i2c/ovti,os05b10.yaml      |  103 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/os05b10.c                   | 1119 +++++++++++++++++
 5 files changed, 1241 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
 create mode 100644 drivers/media/i2c/os05b10.c

--
2.34.1


