Return-Path: <linux-media+bounces-38681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 371D6B16BDE
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 08:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66C1A564E32
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 06:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C45242914;
	Thu, 31 Jul 2025 06:10:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021136.outbound.protection.outlook.com [40.107.57.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199A923B622;
	Thu, 31 Jul 2025 06:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753942235; cv=fail; b=YlhMJ1B1oU9I/0daIeLxywhEhDUDgNZvZ2vHat2FU+DtsXrOOvueQQDeLpPgYW2xhavs/GUV/q5+txIJmmSrLuDAsTu+GC+m8BFGLvG77RpVop06UIqtUrVPn3aUo5vxT9DxmjEL6H+IvUH0MIJT6D6KLWhFT1X10rSsWKECiGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753942235; c=relaxed/simple;
	bh=odwK9Vr5BLIWFOjebHHr9DRLKNDtfTUr08IKnaetW/o=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lvY/OTIcaC56VGhdkrXWEOzt/u+DurfAGwJ21Cruq0ruQWO2wUVaPyZrhbCPOtKJsHxuTKlQkLtOz6LvPE4+UNHV0Vw6pE4PrJbHGKYDgh8vp7SRqs/+V99GJBvCrivHs10aN+Nj3nfXo2mSKvO38w+Ybc2bSYhKi01vXDyNaAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRcsoHPsFD2I3qBTl+n/DVASQtV5Y6u3YBb2Y1rB6RbpWgSEJTuIu7ki/Ewxe/Hfq7Rpbo4QQvTz/LjjVWSemXz+he2Cwu+vP2eFhBvZ43Tu3qrcNqvCxr/E0o/vFAfW40oUsN1h64dspNthNnkkEp4IxiGFknD/PtGm52Pgcuzw6qZn4mYMRT0gZK+1wnUajN6C/XJb0/J+LpVO0KD6glH8QHuciDf1UZVF4yalPT0/Lr7aQI47FTOpl+kAQn5iskACk/sEohV7y2z2AJdkA+DLw3LSGapL1hJ4O48PqqeNU9DsUlXG+AOFMMHwL7h+P7/VggfWP+B6NxV/Y6dw2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZD/NzNK1DAKSmU6VDOj/w5lSRzYKmnQIzytO5HGB5U=;
 b=JIJQCLRj/ZswjGpzApW7aFP5d/vRWVwAny5FoiVGTNFA80rdiUIHSPZRoEZ0co4ZecEDeBzUtFVZUIjF3qMniEeZu4q918OvjToqJXPUQeVF7NcT9luXPX6cgiOlYmpE7vxBIP5EAbw7aA+HGjZgsTKhC6ugSysaPAG5z1YSu5mVVHvmVXjOOwyP5X7D/MmwcB0XDInsveVVgHfcVXV2ATXAqpPdVcOGpnEzvxaHA04Md6TELG2RMhlxeUePXDxF9uJolpQM5UllafeMVXxEOcxAkF/a4F3x3e+lxxme+YPMs0jClwYIPQcHIou/Hr3sQtIXkDFIKks4ZuZVrV7LJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by MAYP287MB3886.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:14d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Thu, 31 Jul
 2025 06:10:29 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 06:10:29 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Arnd Bergmann <arnd@arndb.de>,
	Jim Lai <jim.lai@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] media: i2c: Add ov2735 camera sensor driver
Date: Thu, 31 Jul 2025 11:39:56 +0530
Message-Id: <20250731061004.5447-1-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0235.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::13) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|MAYP287MB3886:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ed8fb89-17b7-430b-20fc-08ddcff8f2f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DITOK5NGNazXMbSTewGUQMdBOiwW2Rpux4yBoPy6u6WOJPIr71t2+m4ee1QO?=
 =?us-ascii?Q?tgCWKfhmbmLAcshyi34pM1iICSWfOQkvggavMX4RmJTpsPRS1jGz34As5tb+?=
 =?us-ascii?Q?Pt8cXORa3310nTaIWNT4TjvApMS0kaZ23qK4PWWECa4oMsez33/ovV8fFavu?=
 =?us-ascii?Q?gabB7KVUwEAl1P0MmB+ueiv7pUv+dsjAOqsMD+e1zsoOG7hJnmg59B3/CEtB?=
 =?us-ascii?Q?qH9XQ9nEHKaoi796yxhz2UAaeDjZlvN9uPsBvMpCfL7ZOFAXRQed3Nkv9c1h?=
 =?us-ascii?Q?SkWuDQ0uqFzeyHLUESWOBD/J5nMq9AcohPXbeNT8QhQq79M47vyxASYMMpkG?=
 =?us-ascii?Q?n4LugVSTISESpot0uf7ggU4bhVyHsu1XD3zWBvMu+XBSRrEYs0jjoMWhZce0?=
 =?us-ascii?Q?1YflkK3c9Hog8Q+OY/b8XwWnefgz9c+utpXgfUXiQZhxH/34kuT7gjCVWukA?=
 =?us-ascii?Q?Zmvn066MmgkDKr5ISQ7BjqFhQXCQ/6RGtXg5ydeB+vEYjt2sLVIPyHAu4mYx?=
 =?us-ascii?Q?MOrA5/NdeSEOHOrb3e1+MkcqehmTi5YZ9ASH748PXDO1zMzP22gzinxnUuDO?=
 =?us-ascii?Q?J1OhDtH3Cvh+giVZMUgfvKkuOI+HavllxbFWo3l/O8womkqBSMRvueFd4CSY?=
 =?us-ascii?Q?D8ctsiU9B5ta40TQEnfW2KRK3svwBCBLmNajQfRb9O3L+BPRyXTYe7/0a+7l?=
 =?us-ascii?Q?e0J2zEk40qAfawyU55m6w08HH5gsKubjgBcoSbXIZo2Ul3/CLR65lY94j43e?=
 =?us-ascii?Q?E4LcQ2O8xlQsHKGfPHccrO9H7uCaI65Z70VF4F/CeSxoFa9HQWuz01FRNSZ+?=
 =?us-ascii?Q?wVa3G8Og0d+aEmUoB7C/iy8e21z7PCo7OkREwd4h9SQH/Kdos42Rh5j3u/Sq?=
 =?us-ascii?Q?fZh3Gte+rfjd+eeuG1ibsGF7a1s11be3c9XA4l6xoMk+6HljJ2hbO949YmTP?=
 =?us-ascii?Q?hGws22j+NssrzV1EbA8LmUiGR5TygzjyDxrf2AOV7bW0ilItGh0Yl1qiiJLP?=
 =?us-ascii?Q?mxtDLzmSwSbpbCwGRpE5XD25beURoKJUEmvuqL99r5Vq8wTbJdvGAKeR9wgX?=
 =?us-ascii?Q?zeeYe81qKanM8WUOO76e0dLihmF6NlICu+rPWnP20JqegyM7IHpgbyrHDWF8?=
 =?us-ascii?Q?CgQwRL7FHEOPajZnxqHlC9VjvZCiq0sy5qZIFSOdnVu0SkTDwCjma/h+8sYC?=
 =?us-ascii?Q?xR4URoTZ3spkbhoMDIp11r9/cyXKsDEZ36OOjrKa10Qv2UJ7WBd7cogQNch0?=
 =?us-ascii?Q?dkDvMFMDzKW8Zi9+x2uqkI3rVM4zmyfUDlceArtokUNduNCxDkh8653dncL5?=
 =?us-ascii?Q?nP8zAb0YFFPsZiMdyiWeqkJTdH0EIoh4a+GbsAVyOO9DGLXF2J5uEw8Ie7tw?=
 =?us-ascii?Q?VTZmRZ0uVAX/O07fqimmaiArr7sVY/HWThk67aA3LUr1TigkvJIbkIemv/ky?=
 =?us-ascii?Q?fP2bsuoKJkyHdMy5HOveGo6druAHY1UFf6Q7GVzrObeYUSiWd5LgjQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3IGRMu2Ff9bVsXFvyVKjy8lw7j3rY10a+xAiqNTzJ6tk28PjLC6Di221SQaL?=
 =?us-ascii?Q?Fmjiy76gieAEz+9m5JaTKsbVT2cMxXjo2uSfpGTXvpntchCsYasnk5/YfFMd?=
 =?us-ascii?Q?GQTUrSgU2lzQiTNwop/3QmpX19pJPpIS1Da9ZXylwRwZCz6uEZsiKEkYC/BU?=
 =?us-ascii?Q?QEtdWDEspA/Oqu2rMdQPOkk39c2/FxSPrGIKm4waYkgyVZRisnskp6ATJFt3?=
 =?us-ascii?Q?3xzmXBZfg6VGRU1J8/SdoYkglUkPZuHAl+0sKoKGZw0t3QNCwx9cjjz6XEYL?=
 =?us-ascii?Q?lBJucL7lu0YSghS1Vnlc6710bIfu0ixNnTRlOPg3U6AfxcpxJU1EMoxZsJnl?=
 =?us-ascii?Q?66m5Lf7HT2RimtRprPSL9af25EqNn66snB4SM3qdyuk7NvyiYb9Arl3YtogX?=
 =?us-ascii?Q?Tc5KkwUCUlrF3y4ha069rmIE8GgC573l46EXXRAgNVQ3ahcZEDQ9zoJ+tS2/?=
 =?us-ascii?Q?qERoNt1D7U/AwCmA3ag14mq60C69noMZ4XkQrV1xJsuZ7z51ZsUaXVDDMJSj?=
 =?us-ascii?Q?fy5x7wmq7hhMVQKzt5cvYs2cUHcXrHmDdR1pFw7RINGdQzlWKHPcWY/3lRme?=
 =?us-ascii?Q?7Kkcf2OOsWZmh/0bi13B+HGgQlR1giLwFFtl4rjtTa56VV0GtYBMlO7BpKAH?=
 =?us-ascii?Q?nd7HfXpkcglXgx6UFtXH8XY6LyKiYEjtZ9be4wKrSuCqZvr25FCesbnBTJ8t?=
 =?us-ascii?Q?n9HD4YkGnxpFVAbRGjgIE3L/o5m0R4wDoM0GTTCAGOcaSJpkuiCwaNjvxH4w?=
 =?us-ascii?Q?cX58ltehV8ELvaE1+vXb35EUbJPEmVEi74yIe8miE8aUu0gmj2omuvmZnEFp?=
 =?us-ascii?Q?Hh6PsBw07XCsIvGArhO06vXh9T0qYWU5cGxVxhku0nAQnns/e1q7dQWPpJRj?=
 =?us-ascii?Q?w7ySCRFgn2zF2BA4+J4q/jVEl7RP7m+gel8vUBDJu2wSBYqCv1eZvqyde4u8?=
 =?us-ascii?Q?KUH1O0EIB0fOzki60SQxsGBAgZq/Acl9sQ8Yzxi0y2gLVycuzWCn2mZivceM?=
 =?us-ascii?Q?8rLLhKam6pUe28521QImI5SAOfPCSUFcmy/2rockJyPColKw1ATeaO2O5QLX?=
 =?us-ascii?Q?k+BMGeqQp/KW0WAE0AJKXUlSvZsvSapTju0BtjLHE+Thb2X+jYo7kQUN1+6U?=
 =?us-ascii?Q?ThgIy/9pqytzlrcnhNgjB8bc5ZLmKPCQGu/gFANvjfA9U6W/C2cYD1/6KM83?=
 =?us-ascii?Q?krtOx8TKQbqNg5vMiLENQeUYU104OB1nmPi4LNXLFZP4hd7V5S2oGeKNrsNH?=
 =?us-ascii?Q?YLmLTfKTYKGaK1/5As1Wah3C7DED5ygeLEztOrwh61UXwp6Yaj/DCeqeuvPg?=
 =?us-ascii?Q?xRlYuOZzcQFCkwP4mvmt2OeGW0LiXXdENQ3G+/oiTdgtJQr1XngmEQSX/ZPR?=
 =?us-ascii?Q?cREjYSNbMWnkJ+50y5crz7m4SCy2uNUyTjSN7hCcsb6hrolGRFozgOermS7f?=
 =?us-ascii?Q?iy5BPQubIgyYDBaijNKbYQ66H8MfC+xnfqVjkO2VLh2QS7Y95cj9erqpQXtd?=
 =?us-ascii?Q?WgiiLK05JuujgPwhUK3EUBIZS0JCkNZcxQg8WZ+i3Lemp33MCBV6vHBdr1be?=
 =?us-ascii?Q?8lLltlI6MpOWUFGRhfiBaIqvuMndAVZf8PBmB/uwLKOUNrpAIoY14E0OyvC4?=
 =?us-ascii?Q?iwC7kO2D3vHLush7N1ExQBA=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed8fb89-17b7-430b-20fc-08ddcff8f2f0
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 06:10:29.3786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZnAgSgaJRyVHGF2+DP4nOXoRcGvpZJw0WqHLMZG/N6t91R4m9HUkI6FmLXhEb3ZtpT3PEY+6l6j9FLbgRSdf+3iZOwaLvKuR2nDZVNIlzvOVE8Qo5SRIa3TE+NtrER2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3886

The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
active array size of 1920 x 1080.

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- Test pattern support control.
- Supported resolution: 1920 x 1080 @ 30fps (SGRBG10).

The driver is tested on mainline branch v6.14-rc6 on IMX8MP Debix Model a.

v5 -> v6

In Patch 1/2:
- Add MAINTAINERS entry

In Patch 2/2:
- Add Required headers
- Change ov2735_page_access prototype to remove casting
- Add error check for devm_pm_runtime*
- Remove unused variable from stream_enable (Media CI robot detected)

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
 drivers/media/i2c/ov2735.c                    | 1071 +++++++++++++++++
 5 files changed, 1200 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
 create mode 100644 drivers/media/i2c/ov2735.c

-- 
2.34.1


