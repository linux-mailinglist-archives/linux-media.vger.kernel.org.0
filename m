Return-Path: <linux-media+bounces-38369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49297B1080A
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 12:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BA855A3A92
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 10:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC4E26A0BD;
	Thu, 24 Jul 2025 10:47:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020102.outbound.protection.outlook.com [52.101.227.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32EC1339A4;
	Thu, 24 Jul 2025 10:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753354072; cv=fail; b=X4Lf6T+VnMoun4WEYdK8ytGTbOczolWtLix9HezZXWn8MCRb5Au2XIDQAdyRgbtOXbetfcOUAr22P8EfKZKK6asOaDknJNevsZi3WQighzxzQ4LKwsLw10+yW/JbdDm29UfclNgV2mS6rYSZC+N5QpSA63UbXlZ4kLiAEsQtczA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753354072; c=relaxed/simple;
	bh=kE4ez8xE0p46i9SWCW9fvBjmgEo9H4+VixHnYTwwUo4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ECLXr1ljBMliQOwsXYWS0imJTQQp5GLYL4UfFwWb7X1BIe9nyp9TlXlo5m98Od461EqfIZMtgTYoEEeeSRABU+0VzIyVvvKd99BHZmGWNrDuIEifqn6cdMXzs3cllFrQe/4skkgtQP6/nx30ArwN7GiUUCHWVEISv6KKRiZHlfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJkw+vxVUFe8m9Z3Vr/0eKhofMmArrr+08Rf51AhjHDGsnebm0gvx0rBlExSX3mBAygR0koCuuDpIt9wmBkv1XwoBEDWX+8Z4Doz+kEIe+F72Hb2A2NKOiOLXazrJ8EK2E9ak+FcfK+//kHToFWw53/HcYwxoihSEv/QtGmcu5AZKZft/mtuS1yHc+jOYXNBm2NSI2SCXP3MShHnzZstCX9ZI9JkzGxeJZoNVHxgrCVr+h87bO76ld0yYf1mwW+T9mlf3MC3dWN3Fe2saA8mMRM6Oth9C2CFeeFwWjlH1zp9MDe1MndIi7fZjJ4/xmYqF503xfOJntXKiKTMZmSAmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7L9aojLkwzc9u/eZA0xyuu5qI54ymDDCj6aNqCdmQQI=;
 b=pm39KW0mrj/mPw+8aNsVWzeL453XIQkmd3JplMPqHihmq+cfIe2kxFiJ8cC0M8a1hYRimVVMWHAz6tvFtFvlHm70g0e45lCCapGT/nphwvP6Fs5SfWw3qD8YKVQTuncMqcnq6aL9E/L+dPZOr6o9nqBUMaoubiluThJmeMyt8RGXg9RsrD0Z4Skh/0av6hcppPqHzs4g2H3Q9Uy3jdvQiyJrDbeLBfi5XKtltNWcxr6zwWb2TDKobaHnQTvMikW6GpzNaoXDndLV//+ziDiEDj7cZLW0DDGjNRMySn6hNJ69yZptBH45BeMbAtdkt9kWaVpBvAB0NtwEH8DATuD3qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN0P287MB1634.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:186::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 10:47:46 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 10:47:46 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Jim Lai <jim.lai@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] media: i2c: Add ov2735 camera sensor driver
Date: Thu, 24 Jul 2025 16:17:03 +0530
Message-Id: <20250724104711.18764-1-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::10) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|PN0P287MB1634:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cfbf4f7-bc9d-4021-1846-08ddca9f868d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h2jNDu/3K9lkDL11fl7pvP6KySItu4RAuTLHvmoi2MinlPQGfUo+EVQf7CDW?=
 =?us-ascii?Q?Y0d+cBhLRCDDvjw69AMCg+9/dl3q+XVGfAGyZLP3G41zFU4S7G67aTl/vxJe?=
 =?us-ascii?Q?NvwzgNsMZFq9ltMM1sFlm21RDvmeWGOC7JPWUe/VGUs/6naDel5AGunmrQFc?=
 =?us-ascii?Q?aaOLBe0lb6D4cVdHgXLYCl5csrMdLTersXyQcxCu7fZsnH0rxSIuH2uku0NR?=
 =?us-ascii?Q?gLLIxCLOQzxoBlMo86vkWf2YjzQA/M4ZONTE7A8PMqsQsV/cQ9qq9JoxPmNN?=
 =?us-ascii?Q?qhYKLaZHxpNOG/H2QMsk/DV5XKt3hL0oDIp/pk43JDpyrZY09bhGJDtP9LoR?=
 =?us-ascii?Q?+con2zvEKXyhNkyhDRXd2vvO+cZnU5oxghHlI2QFOXetzfF746/ywE/40Ccq?=
 =?us-ascii?Q?SjsWXrGPKxsmkEYsbxMSKN+pSidh4aCpn/vqcTFdyLlkuya3MxSS93wrl4c/?=
 =?us-ascii?Q?ODVUigaL9nBXlB09Qz4UrU823plFDFGAvCmPzxnfBTLTkykXv+OyY4HclGXi?=
 =?us-ascii?Q?3B4BuQDPnRroqShkPQwi5J618fa+seVe3ttd8MLGQ6EXTJ3/IZngwY6Y2CAT?=
 =?us-ascii?Q?88xtahbw1igkQeMMXwg+cqtba7BVAFKPuSGKM1nO6xQbLANLRTKzEwg+71OB?=
 =?us-ascii?Q?g5vbQHZ8vfMQ6V/sgueeStITo8QKgPhjC2CDURDBkXpD26QhAJjVpJk56zUH?=
 =?us-ascii?Q?vEoyeCg3wDx1b34oKuFCWLrWiCvP35MiTN6NrCEE/nDJtyVOMxZw2720Xs0v?=
 =?us-ascii?Q?D4X28J7R8vebR8rGLcz8imGE9iEdZ6uUCPlB84WppIG3f8ffMqxp+KjDkdyo?=
 =?us-ascii?Q?fRfEPEGpuna1533GmIrGq4G/M8b0qQ76ue0gbE1GMPKqZ5Y/l+/e2CU9VtcZ?=
 =?us-ascii?Q?EhoEZTOIOVt5ZSgYt2WI3L3XlwQLw53/NbmCVS8GQpMvr8l1Vku8Ij9TOjmK?=
 =?us-ascii?Q?OMBe9QiReFcsa7XaFc618M01zRt0b0DZUWUkOJGA0cDrQPS4LFjVN1zrL5KN?=
 =?us-ascii?Q?Ts3RlooKFNFNdtARmHck/h7ZO5n5bH9wxb3QRxYkyw1YuKe06/Kys3Ga863q?=
 =?us-ascii?Q?JkULt6ZpUuOrwwU1fRl1FokhgBinCgxjuVIA+tEAOHyEyWe4wbtgjyzQ6Mvf?=
 =?us-ascii?Q?c11hE6vphu/bmDhvfF5Me8+Aajz8NiKPXWCNpYoJfctShzYj3mG6yAVM77oY?=
 =?us-ascii?Q?JwitQHLjJnq2oXfI4GxqqfukAJkqQ6MI9kZRFklxZbUOCOq+CzeASQ8uOu2f?=
 =?us-ascii?Q?RizYdv7XEt5oYr3M4Ai3daMNp0d5120MrAe1OyYzFqqF21JYhOiqDi+zdbCz?=
 =?us-ascii?Q?o84p9rlNtbSuFhjlOdBcPBXDsqIYSEbDlRm8ZAiOvcNWJQJACO/FiGa5NHY9?=
 =?us-ascii?Q?ywDr/6hxd6rgty1H/krZ8oTdD60cLIoSxUz1/1t1Qh7BOyRp7RWY+YJrzaXk?=
 =?us-ascii?Q?RQpfad4fgJ2hZP8bzQxwQRXzviUGtndmZkKhd81s0JNDn+X/ydgmmw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1P56jAoaKJYw4uHE3Er07bJ8XUDJM4hOyIjN+mP4wz2dgqaZis4/LsYnrUty?=
 =?us-ascii?Q?ntRBzws3yl2fgUVjFFBDd/RN0WkE9tfkevkDNHuGKDgu9MFArRnNl5VaTRme?=
 =?us-ascii?Q?Ik2ApwIxHSYYOaWgTpAz9h0NQIM3luRAtMEhpieZmP8WO+ADqe/Q+VyR8O0C?=
 =?us-ascii?Q?pI10Fz7Gbl8l6gBB+8uKOF4mM68HkeNvSBaBiKmJgllqiXQjl4s7etFqBypu?=
 =?us-ascii?Q?xbEQR6ciwnCUA2xMsicyrvh7nLYzMpaQFQEPgGs+7vNh0RYivZkHgTkUrZpG?=
 =?us-ascii?Q?j8nDI6UWBA6TnhRZlU2Qw1i7SNcExeQ+etTgHueD8VIwUicjsaBc5Nhgphxr?=
 =?us-ascii?Q?WyI3ewGzzX3ouo1ITVL/jJ9RzF52fgKaqycpc2w2QzXPAxAeMUcjJ5381gR0?=
 =?us-ascii?Q?yfwCmY5XzNyGSiArp3LjpBsnMWrJ7RfW4Jy9M2mJKRCv1Ehq8MUbm/L7M0h9?=
 =?us-ascii?Q?axfOXNMzZMK52v1QqWh4eVxeRUMjh/z/fhQJDqdftg6w9E9dR6I+l1YcboF/?=
 =?us-ascii?Q?53QId9cbjupklwIA97XGzy0LitffYuH1lidks0v/4GbcXPgBFxfKqR48XpJJ?=
 =?us-ascii?Q?SepAiLOblctTpGu6DEI3XESY53JkEklGQa7TINLyGqiTvHgbA3IFMWT1Elt3?=
 =?us-ascii?Q?ID7cDhNRe+rta3kwDqQWpj0GW/TJBEEX4jc+wFX8mFvST9ghGIPPQErAZfJA?=
 =?us-ascii?Q?/O/OMNKG7PkVMaqEkAHLyS34LOrtL5TKaF66I4ERcNbhbjFuPzt73GFAdaoV?=
 =?us-ascii?Q?6yePYFGOR/YMtvoy0GjSDRtsWfUwd9U6kSFY3hxNidEzg40maQ4ilhC/KNmz?=
 =?us-ascii?Q?aD9lCATLe0PNnXcBaTQyzSdx4Ore9cUzULsJ/vUEUhYpfkLJdmVDXU9pHYbh?=
 =?us-ascii?Q?xYDuzSZSnyEsLfkKYBZU7akb0tjCX+hOqtFnE3d+7Ro8tnS8RiKCiE+N+rDn?=
 =?us-ascii?Q?XVJZZWhORgator7RG6zL59whhqb9A41wvouhhpdfb4wv7Ala85aYzlCc3+sm?=
 =?us-ascii?Q?U9AWPx0p7qmsKQk6b4SQ9GHQ9A/+lLRDFOyRI9yrF4/obSMIqqAGNhkD73wT?=
 =?us-ascii?Q?sp7eOvVukYBlyjGsFl6IrhleDGTEJHPY2AsJ4j6wfUBnrTqnX7GKM6NG2spP?=
 =?us-ascii?Q?KIHb1QE/8ipcB4VOSHdXgzLx/vlhIvllzsRyKoPHqzXMDeiq95ou7J4jV/VT?=
 =?us-ascii?Q?9sq1QjN/Hg0MwrH0LPkwGtYprrSbzE9jBNf1CL9N0bMlrPGTshApbP2L/vdW?=
 =?us-ascii?Q?yMkULS7QkIIfFoJXTXqQfvX8R8jR4IKVYiygX3CYvurQDlPRRx9VHYNEjvT5?=
 =?us-ascii?Q?mQVtbNZhadqR+lrhOUCKDlzK9J27jbe9GhsyaH2AVWdanJNhcCXb9TvCEIQ7?=
 =?us-ascii?Q?4QYpLdz2c2g0O+e1TPjBgdUPBg2xV6tcb8jI5Y63bvCaOX00UTZDwb3ISYZO?=
 =?us-ascii?Q?TIywps5Z8sUjkbM/56Com2rrwjzhRTmfjwTqU/7pxEmodWGTUHiBo97BSHfb?=
 =?us-ascii?Q?MhVlUY0NgiO8tHRKEu0a1dWbPyUdHbgWHOb2GJQy+jZhPn7QlVRQQ38iBl/R?=
 =?us-ascii?Q?0D4Fi9jW2KdiIQenbwnwq1DwZtjAZt+fTmhyCtxVcPcqYvIvPdRjKJrFqApV?=
 =?us-ascii?Q?S3khXVp4wIwdrTgft9mGQMs=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfbf4f7-bc9d-4021-1846-08ddca9f868d
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 10:47:46.4704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyFLBfV3N1wNvl/hWwWSwzGdwYtetlcG0kEBtyOj/vBdhVaurag8funcmn5lZuzF8oA0S1cGn1zbjGECgaZ1S2NqJlNsZnVaPTB6nn+Csaj6WP169emRfj7VxYtHF7si
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1634

The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
active array size of 1920 x 1080.

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- Test pattern support control.
- Supported resolution: 1920 x 1080 @ 30fps (SGRBG10).

The driver is tested on mainline branch v6.14-rc6 on IMX8MP Debix Model a.

v4 -> v5

In Patch 1/2:
- Add Krzysztof's Review tag.

In Patch 2/2:
- Remove redundant if (ret && err) check in ov2735_page_access()
- Address coding style issues (indentation, format specifier, combined declaration)
- Replace hardcoded values with USEC_PER_MSEC where appropriate
- removing unused "ov2735->client = client"
 
v3 -> v4

In Patch 1/2:
- Removed the clock-names property from the device tree binding.
- Added link-frequencies property to the port node.
- Cleaned up the example by removing unnecessary entries.

In Patch 2/2:
- Removed the cci_ prefix from read/write functions and custom page macros.
- Corrected error handling in the ov2735_page_access() function.
- Calculated PLL parameters dynamically based on the specified link frequency.
- Set resolution registers from format and crop instead of hardcoding.
- Fixed a memory leak in ov2735_parse_endpoint().
- Switched to devm_pm_runtime_*() functions for runtime PM handling.
- Added documentation for the use of msleep() in the power_on() function.
- Corrected GPIO polarity handling in the power_off() function.

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

 .../bindings/media/i2c/ovti,ov2735.yaml       |  109 ++
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov2735.c                    | 1060 +++++++++++++++++
 5 files changed, 1189 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
 create mode 100644 drivers/media/i2c/ov2735.c

-- 
2.34.1

