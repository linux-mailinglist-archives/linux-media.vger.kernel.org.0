Return-Path: <linux-media+bounces-39415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8777B20278
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 10:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6B601890711
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549592DCC13;
	Mon, 11 Aug 2025 08:58:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021080.outbound.protection.outlook.com [40.107.51.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDFB2C326B;
	Mon, 11 Aug 2025 08:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754902735; cv=fail; b=MXByshYlWd58mCT7rsbO0sLTgMvialMKHsgU8XoDAli0hUkAqrot92ykucGyOkbqxNq04NvVDVOE4R2pA8pYJcnhSZVxQnBPzxm1qgl/z3kKVczq7F8OU9DG+zE+1BmnZpcQskif5nvVh4pbC56cY168e1AjoMFBH7JStWSrTCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754902735; c=relaxed/simple;
	bh=srPFmQ+At02W013wMQuMs/YXzBFrF4q4O+UAwJvnvBg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=sgu9/ZTUu2ptbydeeDZmgYRRg9qNQE7OmwVBJE+HG3Q3ytI7uO9xoLF7wPr0G7lOkhDhSpsrqLUu+/wzON2mxxtXqnlfg4+I6LrbNWD0tYZ0t8J1EYxTivxArC49fgubRlrNZT6wxRBn1W0M8ell20SrpT4Hy6ty6MJOfqxZAsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MT9KJQZu8Uz25NEHrnRFBTZe8erRcaP7L1Ts4mDjd4MdLnY/MirQy1FUT53uNZ+ED4lvrMF0HcfBOcezdooJNWUQsaEYfl3hzQ4MEvJ4LG5kBi+js6EafD1qHi29xDRKXVMR1WLy/w/CtOmGpjd25iMqCYtAOShvnHhcxWP9pXba4pDFzf5EWv+5h5sF++oFSDQbN9iNcTBqtE9WTrwWIMcy9yWFo65JFUfpK9KdFBS65oKeJ+GQpfhSAP7TxkxzN4VajCtwerBJqPWQ1CW61glOLSO+SDBe00BBqUZL8zy63pRQu+UHhulhE493ayL0We0RpexPAYYpN4CjVszoAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMPhAqyGEw+qB1olG9sn/iKhPm9QTUGzk/VWUgH20ak=;
 b=T7F/iLhTRb6LVGzeHOd68BX3ececHUnoNLRaMfwIhsBpSUmehgk9NjZiF4IwlpggCtErm8EGmMcfJXIxoOMVBGEsJ+qgqUP+KwCL6fOR2Mhtz3vQImhZ+Gg4SegiGHBdUidPMcCUkoMAQln6DOy6ZTKWFFtR9Sl74PS/izSt/m3ENIvttr0xDUsWN+Ue0pPWmhDt1RlUyCd8O6HDnBdg7Y045AUIRnXYyiXqEAojjD9oXJ4P7wlIZZ9/PAsHgTnCDf5SIDCvCXWgt9fXAky/Zy0X5DCmW2PQ6cmKgH/I/rl7t/HynOEWgGtoF3lgtGJcmIGl8FPyyE88JYe/8YcL5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN3P287MB0212.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 08:58:47 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 08:58:47 +0000
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
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] media: i2c: Add ov2735 camera sensor driver
Date: Mon, 11 Aug 2025 14:28:03 +0530
Message-Id: <20250811085814.111073-1-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2af::11) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|PN3P287MB0212:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f647fa-42ca-4d36-8a03-08ddd8b54841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6KDvS26ESRZktv+sMgdq2ITyL5IW1ShIr6LjWNmVlA+Hn95ISk4KLPCPoE84?=
 =?us-ascii?Q?kJiIxB1RVq9Ed8G7EbYpsIJfoGxmDnHzhzDetiv5zAM0+iDD4b06ODxa/ZRM?=
 =?us-ascii?Q?weIJ1dBR+Yh+2g0OH5opYQ1YJlMYdqxC3TYA1OQr9cTOEpvfYJHjhHs9NffT?=
 =?us-ascii?Q?rtizZb6FpcJRt6jijnvp9NKcCacJI6+65iOblmuihF869HjRf9iNpUAhlzDh?=
 =?us-ascii?Q?0IPnvJmpu3MGYCUBm9FOVA2UZZgZCfouH7OgDvpKaX4psw5W14PqkSP9kLL8?=
 =?us-ascii?Q?5CBdZnG/1f7PalhtfvMBKkv04bVc5kCUtJzVvru6A7J9ZKkaRQHN0PStnzCA?=
 =?us-ascii?Q?Nd1lNYQgrcSpiSrH59eiDL/gi7L6ugJfrtC066IgZ/bBqqLqrOLZntIZ8UFg?=
 =?us-ascii?Q?YN0eXfbwuUqqt/latZGd1u/IEjowVKGpg02T9nQrs/vJPmZt6CFFUSMfxdgc?=
 =?us-ascii?Q?usDwBIudlUz14lajSy1tiD5pBRE6XKhhlBC/kCyn7aFTSyRqoWsDg/NviOab?=
 =?us-ascii?Q?7kub8D1vjzA0lNnVHegoSeCTmA6P8nIIWCrk7T4AkFlwTXg3ghutmZONY8MU?=
 =?us-ascii?Q?/uv21rUrpm9PpSG6wsCMQ1cfP1Sb8Rpw7L+230gTMd/fJsqsMCUxPqjND+d2?=
 =?us-ascii?Q?qEqO1d3eWYzsgcnLrbNfrYVD3V7llofE4LskjWlxOn0VJNFVifmkCE7flCNB?=
 =?us-ascii?Q?M3RuVUOZkgBu37tpAGKn1GTcq5pRNumOOqAybrlgV2Za1uzLS9K/wXlUgGBn?=
 =?us-ascii?Q?MNmLGKFJEkbU1Oib+8r8RkxhFq8TItAeKU+MGxVKoPvqFbpKf1nK8YY3aZLq?=
 =?us-ascii?Q?fxxZEqk2YJniDiyU023SuLoK3vsyZNxeh9jXsMiZIS1igo42njPYraoU7ibC?=
 =?us-ascii?Q?XDPa0tuo7Ph8p14XI9qb6YLoXuXmKVIvqR2Ez6YCVVwdbGWMCgayltvJXY/j?=
 =?us-ascii?Q?IQkyhg7jV9CKWlzs+PK/w+phqcH6nL7kdeIFOfvZdyRr0GkjpgNYdGPbIGdv?=
 =?us-ascii?Q?WbUbWtYlAUmlTV0rwbBY/ntF05yxqPFnywBdmJn4HYlFHVCEWMvwVj3SBIky?=
 =?us-ascii?Q?NhQYBvgXeyoe9IXJX0egd4nh6KLcAZe547nYYNih2do6QcvrFgQUtmfhR60m?=
 =?us-ascii?Q?Wx9jzmc8QBXWpdD5IZvhsFSrBP14jcmLS7dv2FR7PvQVLJG87IIzwPPcFD7r?=
 =?us-ascii?Q?qNojNngPQzXzDQa8NBF6dd4hsKDqm++b4GGcmmfHKmyD3HElDEpcyyRmjzbN?=
 =?us-ascii?Q?gX0otW3gk/FjWL4FaMROCWQ5MHjScWwt/AKIcEpiQhpIKvz3YlFfIMO/xH0U?=
 =?us-ascii?Q?dEzTBaQbHKI/rcWiHBABSY7CEXX+ErmnkxDkJrIjHfQVDxu5Ins0oTTxCY/m?=
 =?us-ascii?Q?eOgZhNgr+sjIwsWjWlYP41OFKHDu5JStn8wgMu7ERXueG54XEmBxicLMUPOt?=
 =?us-ascii?Q?OYk8M6+NXpJw4Pyy5jqQUiw6S+hRRyFB395fUQwfLY39/5QJjsPGLA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZYPL7TJh4fUmfpPEGoODkdmRb64FXibkqkGKo4cIPGwDudSEA4nKd2gUbjmK?=
 =?us-ascii?Q?ZfFNK9NyA43PyK9uqRsxqNVl6GRdcLu2yGwxuZP0jz0d1qk112hKySzilUrq?=
 =?us-ascii?Q?6bbf6BETc++mrxBdkKIgiWl4Qv+NHbd77fVpWJtXZ8W3sz1wPPHqu4WmIu2b?=
 =?us-ascii?Q?7eV3vJOBY1FhSlzvP46WSE+wwY7x6BaE2J/LVRgEWfz1NPu10ZMdsvztBaOA?=
 =?us-ascii?Q?OA19MEWMEh9c1E83cihzRi6pBgXxXruIB/tTN79BhFaZ3GIlFvf9hOcATeyR?=
 =?us-ascii?Q?vQ9JN+wLI8K4YK21qS9iqzPelKuG6bB5sQzVMR8ZQFhmQkBHkBnX+oAfyUHc?=
 =?us-ascii?Q?owgA50qpllVAEO6rFpeN+Tj1CqY6bEHbdcERHu8HClV3Nnk9lW1fIiD5+3T9?=
 =?us-ascii?Q?gjGNrnkFvFWsBiwhPbarvCebFdKybhrLr9nq3DMOLgq+BSNa5daIy9UUud6b?=
 =?us-ascii?Q?a5zxdr3uGBoP06pRPY+T4W34ZLtgj7CXgGGT7/93yLCuuymjQOVeiy7r9hRU?=
 =?us-ascii?Q?1lriV6EzK3NRc0jbIyEtiaKJb44fq+ONhKbkvNYFukcF/t2m/EdFYc6zifaJ?=
 =?us-ascii?Q?PsG7J0oKHbpyRlFKh19FutlEgjOVvZ3RQmx7dW9LY8hsnY7DCpWGVRbkaYef?=
 =?us-ascii?Q?1XSjY3oU0aLIkhvE6aLGUvMQLF3tEoVreaBcRoaZVC8/f04SkKmd5bXarA4M?=
 =?us-ascii?Q?0ZUytyPIuKfANGSYH0PmmJzXPqM9x3cv+ZQ+9UqS6yYgm0+xvNb9kKiy0CRZ?=
 =?us-ascii?Q?nKkAmT++1kgdpyQenEO02NNNJV3/zOd4vT97qLASQTIBXGl6e+KRLGOfi/Kl?=
 =?us-ascii?Q?+utBp1qe2NAPWxlZNaEKBCAyzWq+fRFTowNY1lEd+WDGIi1D8ndF9Kx0XJla?=
 =?us-ascii?Q?84u6aiBCFDmCP2FVOjlnl5oIp9dzxq5y1K1ePIEITU0mvy4B+NEWkA90a9oA?=
 =?us-ascii?Q?m1JvdezsqS1cX4wTvSy7ogPNNzBGGDG7H8pYf8bdhuYqGpTsmLX0cEe+odr/?=
 =?us-ascii?Q?f57E8g+pRvM7AThcJM8I5tUnfvXWvgogdyMUeTjbPmpNUI58oSRjnHUoKhqr?=
 =?us-ascii?Q?gZGpdOAuM7lsPxIO/+mdqf63EIaGG4ee9+GIMA9Vrv0/fDoAp18EYqWg1PIy?=
 =?us-ascii?Q?ogH34rNbZkI8UX1aZISWBwHVJWT65lcCkYoO+ZRdbfO4Fst1/FjTSFobehhh?=
 =?us-ascii?Q?7fN+qQSt6Q0537dYS7b/bQtOBbCqd4QkuTG2qw2bObTrcef91cL++MrLhz3w?=
 =?us-ascii?Q?mPvulOszPU2HdbDm0/uWsNfNK6jRfRH9XN53KENhWnx68+vrDKRFuiHqSgBE?=
 =?us-ascii?Q?4Fvy3KC0024xzndmJK9VuyTkkcTxwrMbCvZp41nZvXqsCblgZb6vlBfKIO+9?=
 =?us-ascii?Q?xYOqaL/DspIij51VLbdyIWr/Rq8fC5dyFEdolGfefDQqdkWCb3Wt2WoDtVbS?=
 =?us-ascii?Q?MgmLPF85D39e/AN1whF3IUC77OUB5mZzmj9mONf7Qv4WyS7vARpLzDkMQpb9?=
 =?us-ascii?Q?j8wQVjAFDGT5pjFWqEkHPasQRuDs0mANImolu57NrlgOTfgdmUBVSGDqcxgv?=
 =?us-ascii?Q?ROdNlTwVWBNhmh1aEWd1Djhw18FxlVVEe+U4gVW0cDVznu30LYsWs2I5O+ij?=
 =?us-ascii?Q?YMQkDTPkl9FqhSwAdqKs0BA=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f647fa-42ca-4d36-8a03-08ddd8b54841
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 08:58:47.1650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkhoB3u4cNdM6rMbyIw2zTHOiC0kF7qNLrf5xGiwul/F6PolcldqEZsUIki4J3AeyXPK9T2X9R7tP4lUSFPUXdxnUuomNHZEyyElnvJ1PRXntCyWZHYwNSRLCpReAmZc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0212

The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
active array size of 1920 x 1080.

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- Test pattern support control.
- Supported resolution: 1920 x 1080 @ 30fps (SGRBG10).

The driver is tested on mainline branch v6.14-rc6 on IMX8MP Debix Model a.

v6 -> v7

In Patch 1/2:
- Remove 'link-frequencies' property (already present)

In Patch 2/2:
- Add mutex guard
- Correct pll_ctrl_enable macro name
- Add error check for '__v4l2_ctrl_modify_range'
- Remove unnecessary comments

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

 .../bindings/media/i2c/ovti,ov2735.yaml       |  108 ++
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov2735.c                    | 1073 +++++++++++++++++
 5 files changed, 1201 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
 create mode 100644 drivers/media/i2c/ov2735.c

-- 
2.34.1


