Return-Path: <linux-media+bounces-37873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BA4B07733
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 15:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27A451889B69
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 13:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E0B1D8E10;
	Wed, 16 Jul 2025 13:44:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021085.outbound.protection.outlook.com [40.107.57.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365AD1C5D55;
	Wed, 16 Jul 2025 13:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752673497; cv=fail; b=hw/+ptQLAunx6l9tERhDYVPabqKjXchTAV3bBFw3KP+kx3x583PbKEKhgL+CXfTtzSrGftNF0WqSyFp8Olaex2iogaLXyUjSdFfd77A/MEUUU52/q1D8AClidQjTqyyU2BNoa2y1M9fUixhq4fDkvDUE9NBq0mZrVr2RB+mx2qk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752673497; c=relaxed/simple;
	bh=x3J3DD7z69Tnm5GLtyHEsb8hSmQdF1sfMqXQz3KcUfc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=SfM4OJEVTqhjs8FXlvyKo0G6mKONTKm5XumI5GNtowRfMkZ4fVIX6q5UE2ovXefk9kkAvBfz1OksySoiTqm+8oyDtrLLuEErnhqFhcmr5W3edycOnZo+gDFmpdwccMuSW26C207bq270CoXe5hiG8guuufKr+gBM4Dqz2Dd4Ngg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYje/HclXW5DNxNcFXJqbhhhWK7MusKtjePXjp9nXRq0K7i5ob0+VDk2cD9+Zvg/x0f1ODzaGt5XzoW+y99Jd7aN8+G9oAtbiBGbYvk3sn0T1xP9/eW/P2SIBMb7A/rN6HwQuj52g4q6LgKEfpb9GGNhaMLkj8gey7FPZh77b97Q78ivwtVtOO9tKXWQKy2HURDkU2SwH5mE8QnyNNx3+hR3q0iqrCSpx8KxG4gJfkT35KRdnsB5bWPhfbysiI0dnPwd8Xj6FTv/xrvIV5Gl236XOTARC8v3B9zds9GN1zBPyrFbeUH4pVZH2upl9azo7edwMIyCNYpvqY6Qs2rWVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xn2VYvThGKWHSXkyBgeXAMxTX7gi25gyPRA7HezLh8=;
 b=dmF5vPUxFk+V8lS/3rQkcohMsNFw5R7p/sA8xDAOv4Vn+1bkcFTFW4790jWFW++RZCXouUFFvg2Ofe7GHLJD05orUB4ZSZuLKI0I/g2KnpSfyPw4uogoJdEAQ5mnrVnqoYDtaLS6GYc2Ufa9/4PN7ayVSqVBADumW8/98dIcCL7zyQsTGKnXG8gs3DqAZiENEZNzB4Ph1OddTk99lntEH6IJATlhbkiQrKOFr8A7CdaNJfKOSv47boGwW2DXPLvDSImaVed31zNt+XocDYvdJBmyI1dYk6lzOHXruBmXmcnWhknUaYnwJAoHGciBGHoUD8Xq8jo4wPwtD5HYtlNhAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN3P287MB2058.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 13:44:51 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 13:44:50 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	krzk+dt@kernel.org
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Hans de Goede <hansg@kernel.org>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Matthias Fend <matthias.fend@emfend.at>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] media: i2c: Add ov2735 camera sensor driver
Date: Wed, 16 Jul 2025 19:14:15 +0530
Message-Id: <20250716134426.8348-1-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::35) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|PN3P287MB2058:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c4e3fca-730d-4c98-ffb5-08ddc46eef60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FjxZy//KXazdLH/dYL+WLek1ntmuZPrJ/DutdYe92NAxXsoR5uUYLZ68QD6V?=
 =?us-ascii?Q?KKD3sj8YfJ3PxImLQwPygOJc3Zh3s5c0SrjGBVzXHKUn42px015Adp3IJzkP?=
 =?us-ascii?Q?peJV2ayl/aHXHoaUgVytYCofywilREpaREk2ezMGAX3OwXxZi4DgEZxKLp39?=
 =?us-ascii?Q?BZUyNTli55Fpi/AL+2Mq6yKef6xVohGBGhs2mhhgKMpzJwSJPlGMahTdNnjM?=
 =?us-ascii?Q?ArNKkhTgut0fdSGOgywihh+vV9UPl1zffdZIjzE06TujVhkVIjGKPJKkZhlj?=
 =?us-ascii?Q?OMBbcqNjQZZGCzjLB7C03PbAFLzvMOShJyAVfP42Y2ykek+zdblga9gYWvdW?=
 =?us-ascii?Q?ZtykmKGIcQP7UbUAaJQKQi5rAwPkCSW6eRbckKidoKGy6VvD/mLFbX7NVou+?=
 =?us-ascii?Q?XTb1KUE2E76lSLVCI7gPHZ5ad8f6e19fG8+WniVs9PmHsCiymJ+Jubq7yw8k?=
 =?us-ascii?Q?Dylx4oJAwUVW0tQTAx6M7z/DEmrUlFcDJeUBZp0dOG3lUUUN3VGcPJ6A7pcf?=
 =?us-ascii?Q?Lt6Hh8fjywo8IvU9TZ+3i4eO0tPueUyWvGNg/8u0NoxbmpXkBFXcMnmOmqoB?=
 =?us-ascii?Q?gcQU928RTU+LbQAIljMoV6eesa4wrYY/CYW/Wr9SWMhJEigO/sBeiheuSv4V?=
 =?us-ascii?Q?QeHjANYLbnOJyfDVlJ68O95qtCYS2w4NkhBdCywODuo7Z9E8vgWptAYCDvMs?=
 =?us-ascii?Q?0PtvEzLnEQBeDFW3IgrQ6HM9wGJJ+IBxg0NYus5zS6OtnE/W2bCNkjqSqtAV?=
 =?us-ascii?Q?NzKWy+DCDbP89WNNVpnGkxJm3Sb+vFROMICWMT94a1WlhDVWE9ISB/MoEXck?=
 =?us-ascii?Q?zPzLvbe0Q3zlJwwET8Mwsv0rLEtLvdnzGao8kNMYx9Cz5n3Um2ne3ULWaEjZ?=
 =?us-ascii?Q?V1CqC1YQVsUDTPneQzMBHpbMFOPXpv3/yAfqkKsxCeSsFtJLoCGBtWcFBtzG?=
 =?us-ascii?Q?jLypQjhUs9RT0vOmhs0FnlN0Y/ORC3xJFtVo0wrwXrUScDdQg21S4GfHq/59?=
 =?us-ascii?Q?A3SDFB1OVKoSWKzWRMhfBy2kAyIOOSzkBBraVCELHdvImYz7FCEbkz/+oHN3?=
 =?us-ascii?Q?p7KRoRcZa/8C0XrMV61h4L4+cLHnvJC6Xj/RDXgXhObu7zDVt7m41LqKeyVC?=
 =?us-ascii?Q?XkACrOwOABzWyWlcm4wnB5X1SX2BROK85tf9h1ayFOD5F75bv+XZFmFAtV9P?=
 =?us-ascii?Q?7Zm0ClBd2wZHy0R0Arwl5HCuUm5i6r32Bn4Z3kEBAWjQs5zNwZ8ymYLrTvDM?=
 =?us-ascii?Q?8SgFUuw/BO7dXBCGHmnts46i92HCLs9cRsGYLrVPG6siXhVbFV1Zsa9cWt+q?=
 =?us-ascii?Q?Lqm7HZ0uZplHX7mhv5MYOUyr7svaKLpYjsQZ62lVtPTLxhUsrX3HQfwL8+Ix?=
 =?us-ascii?Q?upbxzukha5ZJtzKpyOS6TRpz5vdKrhgSsKxN/bHwRVR+tQ+NrWSFytQHART9?=
 =?us-ascii?Q?ArpK2H+FJTAVWlMtcqRF49dPnf6qB2IhSfgayiPcNjzHt3gt6YZTNA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YS5M2kwi5TlKQ78oOgWgQcbKzioG3Dcx6VBUTEs6UzOumydwkD7CM9DNIFM9?=
 =?us-ascii?Q?yIhrKwi29JtT0GdZAEJ5Xi6+iVUU3QHrGLlxuqzWIEulLZzjsOOrgZ/7XFyQ?=
 =?us-ascii?Q?E906mzRfra0F1dbKFA21FRKxPL7Smw+R8Sg86cwdaIFoHdkQcMdVUmlwA4FN?=
 =?us-ascii?Q?lViegkgSps7QNypb3vA+Q+0TyGH3ovGzdIKmAmxip5ctv3IiVRCSuDbsUkxP?=
 =?us-ascii?Q?bXPUiIiwKTj8W8mu2a9Af2dtdXTU5OiJbJNGqHq7sX5BpSIILUQHJTt1iP8y?=
 =?us-ascii?Q?ej7G/ibJTY7WnjyloPmcSi1dMkOn+Rcu6OhkHbfi2Y5Rhtkchf1YgysQQQd1?=
 =?us-ascii?Q?gWLXtM9rNSkURhHl1hpVgf4B50FJF85N1AR7rIsclKtdd950xGC3OaJkfLNg?=
 =?us-ascii?Q?V1s2HQSAvzDeAJi5FngdshMYEsRL091I0v9UOsCVrTAy4W/uLjmAu/kObuY5?=
 =?us-ascii?Q?q3XKYmaCfCycf6+Hesc9257QNZnxSQwsIyjdU4+VSw9qpMc+3ML7Ra7nfyjd?=
 =?us-ascii?Q?lHYcc2ReSaKHajbFkO2QsEtxe+lX9By0hUlihDYvK0wmw9ivdVeGLuFZIYwa?=
 =?us-ascii?Q?KT5PzvTWapI8+1hjU0jacWipqxsjcYXJusDe8lgSk3K/39+HVYh0jzH8TYlV?=
 =?us-ascii?Q?S3d4xnv6fWk0K18pTlcvquE4l3FxpE2gzZWeInicYM+jrVZN+CVQ/rYwq1hH?=
 =?us-ascii?Q?ZDWYo1fCZINcJeuGiqkHpuy1OubNcof6ExPy1QkzkRGtJQ98sRbP81cs5NU6?=
 =?us-ascii?Q?ufukM51u94f5VJl+cVa57kweOxGFcgA/gwR1cAmeI7eERphEeKXXDPtMYSVA?=
 =?us-ascii?Q?OfE0C2VQsLmABPCXi1/YJ1GyCkkFbso8a57lJcDtJPmN1d6x5xKkFI7kPRHO?=
 =?us-ascii?Q?b2YxhDwo1kTD6WWSnR/SesblyO9u+Tf8ANPoT3ThCl4kz0gbBa+iweaNndpA?=
 =?us-ascii?Q?/Romj1ftCA2+DUJhkU2eJS7XZmc7h62AQwkFELIOqN34yFcdsGlCgIVpIxsi?=
 =?us-ascii?Q?7DobnM9l3P3UgoD/utmNuyT0akA+pw/Fr0f76Spd7vYUIsvglHPj7qGKKIRI?=
 =?us-ascii?Q?eHo0YyGsP06OCziDhzm0tTPD1yYZpx0kZqy0070AGkPGSk1g/1SXVKEuBfy1?=
 =?us-ascii?Q?M4hl7h1vFhQuNfYz6ogPW9fzRq45ppGCHqxp9X5TE4HpFN8U5OQB4U/UB6Bs?=
 =?us-ascii?Q?+V7fFQ9pIGXz60PQdSZA2a66IMUS/MWD8h3pfgX2OjwLZfrWj7q7ZbDobh6C?=
 =?us-ascii?Q?9ER9PvSffqewe8dSfCKPV+h7SsIYQVd6BgIJ7cvv+fGe+LpKBxUqRLJd0x2U?=
 =?us-ascii?Q?VmOzpWupip5R1t8FEZOuowpEJc7onRAdC+EA4pPBDzbAzuwS2W/TA9OdzWWQ?=
 =?us-ascii?Q?O0of5bo+L2veToULhUPk9W6HHfGN3Pd1Wa82fdO14EKb6bk1OUmcJtyRHAlY?=
 =?us-ascii?Q?yEMdrgoaCEVmx5PhM9gZEFGypXI/oTaztcCh6MSve/pFtm76/KX1GG+FkH26?=
 =?us-ascii?Q?oHCM+4NzuBFDbesmR3m4xXNEnsVpDCLhZAMbSFTdwSBQFd53Ntvjk6IUKTgl?=
 =?us-ascii?Q?oX/eTKBDipB5IY5yiYMnox/5gnYkknKLXlnmkoSe6SKG3DuyHJQhNJUWFmxm?=
 =?us-ascii?Q?KUw/tdP6glpaMAxfXF8pqCQ=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4e3fca-730d-4c98-ffb5-08ddc46eef60
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 13:44:50.2476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bn1wnwsU0ocay9eB9gYMOr9q4/f+1hZw8NSjvltZAreeEkjRpMVWAXISy2svc2swO/PdZ2ENhV7/X1XZjmlynXIr7wDnGmR1htmqEXXi66bliWXANNAFPc38dF45m3R0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB2058

Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.

The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
active array size of 1920 x 1080.

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- Test pattern support control.
- Supported resolution: 1920 x 1080 @ 30fps (SGRBG10).

The driver is tested on mainline branch v6.14-rc6 on IMX8MP Debix Model a.

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
 drivers/media/i2c/ov2735.c                    | 1067 +++++++++++++++++
 5 files changed, 1196 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
 create mode 100644 drivers/media/i2c/ov2735.c

-- 
2.34.1


