Return-Path: <linux-media+bounces-45195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C212BFAA87
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 039D44EB6E8
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 07:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C54F2FD1C6;
	Wed, 22 Oct 2025 07:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="kLgu8n1j"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020102.outbound.protection.outlook.com [52.101.156.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34472F39BC;
	Wed, 22 Oct 2025 07:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119247; cv=fail; b=JFVs3kb8LrstfuYjLa/NfZGc/fp1LP7OgpJkc6FUrZaxPHtZuPTir0dehUEc7pDgR4YfZPhG/XItTAY2I3lND1rJtK+aDfJFH/PDuooHZUlbfMeYgM3Y1ewrB+RS/6JREnLEmvh4xclXThfc0so8C9bPaI/oh3kvYRHrfNZ0LeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119247; c=relaxed/simple;
	bh=iAXtOMoqYljPMsUUbUyBWPR/2gESgTEcSYynmmF1Ouo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=loODlkEVj1gC30/BjIfTNauyra252HmS48+44sN06ZwM/0jZvDbmeS8jjLSGRa3tD08JlIeSw+fJjusJ1wJuLr16q4z/xgvzfMgjw0eLuf8QstY/S6Pxbjwmxy4fczOK4/xso7hk241dLKCk8bXeVDxvebDzJ3qt+jygpTQLXNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=kLgu8n1j; arc=fail smtp.client-ip=52.101.156.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dg57ajlw4NKDS/YhD0Zfja8SJMDtbBj/tXm/23dguJ9VnAeCriX3AY5m2VJmd/yJZUeR20rEM59Iva/kL6B5FRKSNgWFyB89Tp1rnjhGGuZ6wpb59/Vo1EhiWUSqXffjti6zK2hWwYwAIQPD+dxf52rU2pyPAXR5V/ji0W3xK+mtxEUhqq5KIUSlOq/+kPZ7n7EiwgmBci2sDX8stFqZMLNbqJ7UrmqWup3uXW6JzjcGxjeZSkJGOLRJu//WcaCc7cyQ4QiW3zBe4FEprRlU1B6+0EJRP1z5MDWqts1c0ewsBtnTTk4Q6NDarxeeur1YjoXdHnW7KMgH3uBGWeIdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRv1Tk5ebtomgbXRM5EeOQe6471x7tW5iNL2ASR3PJw=;
 b=PauxxGg944kQ0zeo91tpAFOhsm+dSIY/gvc6HDcHvM605igiuWDeTOJi5JDOOl/3dp/3yWgL+wQTkS2t5ZyPVVL/tIYStrGfj5ZUvrwiJdESYIK0+KaZ+clZSBeTH3LiqViFzzMqASujyftLku7Tcnj1Kel718VWeYVasjuUzVts2dmgEeLNN/8Mhta0d2806LNxAbKSNt8bhdBhRHgl2GxcKidCCepUwptXHrOY1LapVA1myW0ed0kOzotAGbAAoHFA4Vpe45rWOakFqxqIhSlxDTH8MtML544OX7w5Ag1DZiSIuk0zPPJFciJAAQpZHaQOWtqOJrYgn+08UdVi2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRv1Tk5ebtomgbXRM5EeOQe6471x7tW5iNL2ASR3PJw=;
 b=kLgu8n1jJK+XYFb0rIN8tWNC4+Vt4APcL39Xiu83/iPygGhp/Q1DcCdngjU4SqjLC/1r5ZJ0wPvZ1XogdyovEPUc5B9WqSSAmL0OYuVp+l67FCXs/yF/eAViOdB3eW2zI7iyuXwWhlV8i11ojcuM6ZF3LQKCwynrH9mi9Xv3hMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB3135.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Wed, 22 Oct 2025 07:47:20 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9228.009; Wed, 22 Oct 2025
 07:47:20 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v4 0/9] Add support for Wave6 video codec driver
Date: Wed, 22 Oct 2025 16:47:01 +0900
Message-Id: <20251022074710.575-1-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SE2P216MB3135:EE_
X-MS-Office365-Filtering-Correlation-Id: f01bea26-2e32-4847-b97e-08de113f3b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pAVVzLH/0CGMZcgvNm1Uykrr/i2TdD2rbUjXYrgERCBBoZi9zWvbc4GudrgS?=
 =?us-ascii?Q?CwZT2VanJnYvkTXh6GQrDyVNgvKU6FCdOKIDOnvO047Fydezv+2N4hsk10D1?=
 =?us-ascii?Q?Bm64c7vadHC2gGIIlDidNLt+7QEeuOo50uOf5Sy0z4Jod5f1XJoUIBtyDSvR?=
 =?us-ascii?Q?dgCuzSDyOXM9kuI/BihAp2dq5zSIm24nKxhiNE80+6QN4bZldSOMq4JXTSvn?=
 =?us-ascii?Q?SRZBD40b/GywVWFmXPMiOK21jIb58S2TyvEsxAHJ1lBw9kIvX+2m8H8t0b0k?=
 =?us-ascii?Q?g0fJkirz35D+6McfpkWXQZyraTxjUT8Q8/SV/A7f7GYPctrPbubysCxlFCB4?=
 =?us-ascii?Q?gqmLU397R7t+yIs2U6KJxbgn5VoXA3UglVL485gMO3nUjhHxZOdbbe4nGD7f?=
 =?us-ascii?Q?/2STjTDlWN0MlTuwxFb9QM6EqBe5xE6iKih3FNMPxfp8bAG0lT/mdMxfkjyQ?=
 =?us-ascii?Q?8ZPA704vF00lL192J/GdznCja34Yo119UpLxz8OZb39XCUhvBiDmOE+zUQD0?=
 =?us-ascii?Q?YAo4dG9t6tGcRExKzRSfsTBFM0nSDEa3X5TOZtR5jPvjzvonSemNScsOVUX+?=
 =?us-ascii?Q?LVuxUz59/PmPGrAA9tmHRnsD3WhD7pBrppRE5XmtajdAEv9DZ8sCSSNRwN+w?=
 =?us-ascii?Q?V2rrl17DHHJDUlCiv5IfGzj7QTz0cPpupupv4Q/lAzb5lS/slwXavvK+C+Hg?=
 =?us-ascii?Q?wvSVbWE+R4Tm4vl5jQYHcol5YbeQR32uHPWm+yW1ZyqHU1H3Aqw7Cd5nuJhl?=
 =?us-ascii?Q?ThQ43sqSD4BLz5LmMBTG/QFBib97PvQL+O9bjXl7knlLUCAzzqdOcVk+DcpD?=
 =?us-ascii?Q?1OSQ1wJ/YRM07DZ+p8Cvt8wTb44wxJuEzA67cYIwQ+PSFxHpvmx0fJs51wuf?=
 =?us-ascii?Q?WsM/Gpyfiei2KxYxhE8SdxdFkicfSSY6qGkg3pUGHp7fXPvVv22b/WwgvZhM?=
 =?us-ascii?Q?6Aq5atx1mWI2GOl3Xfks2WQ8WStl3Dj0MEfXwgAXFiUBoOpzWyQhd1952nOP?=
 =?us-ascii?Q?Qnlrn4+Qkt0+Hx3GWqbw7+QeNvi5WgqPbucCKd+I9lQiDM7E1KVPACotlTdi?=
 =?us-ascii?Q?Ej4fwc71jPgJAT0dwPuqVz+fpbjFQwKyx9Eeiu6yJ1G5C2hWELXsYjWBzGkx?=
 =?us-ascii?Q?eiU/7SBeefEpbjHtFzXNwWtbzYKlJqD/k21m6h2jKRWOrPa8lI1cJfWfSD2F?=
 =?us-ascii?Q?ZpiArPJeE2fqM0gnCa0AjIYag5dBdIuyXTFwof15A26l8YJvil3bz58z/1Qf?=
 =?us-ascii?Q?HZpUn2nH3Ere+3RIdYgmx4FK00hy1XJCm4Mvjv+rsMoARONKB5+JxGWMVeSA?=
 =?us-ascii?Q?kud8i2t/W6afvOGkawzu3eIePmLO+9uG7ieKVajVkhFNfDDI6MUzDn7V6ozA?=
 =?us-ascii?Q?8AARHYcnpDC/3TmEY5fnZ1BIOk/h60RBy0QXdguXG7+lTE+WbluuwTODf/we?=
 =?us-ascii?Q?+/33weDfhAuHtF9qY4bQiwhxbS1HU8KQp1WcJGcDZfr8y5ZFqbAAhnAJGseb?=
 =?us-ascii?Q?YfKZDHcTYmfZleLWme6aePGiz4DK3fu2c8gI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qRwbWD6MWLsLeHzyUMClIliQV+nPe2wTXTMOkv7lNl8F22A/CxArhOU2YiF/?=
 =?us-ascii?Q?SUI7qUkz/YUUJzX2p7D3T6AjtDFGYw+zbqrQ6M2BQW+NCgYk0hN06LJzhQG2?=
 =?us-ascii?Q?8PGCmiYi/ggWcseTXIORfTbgVUKUdU3VqRRf0AKoan/Zn9l1BZwY6FfkBpVx?=
 =?us-ascii?Q?EJT4xs7yf4D11Spe8gKk6lTvv7Ttg/qXFXZxyDDzEdv3IuzqSdDnh1odmcF7?=
 =?us-ascii?Q?EiM0m1udOQ45ScjgwPpqzmZ7p4B1zjhO9NbjMz7HfvHxXOQ7tJUkdUHQ4zxO?=
 =?us-ascii?Q?KfaJIi4I28eOWEQ8QmKKxo1eD6xD73j+LjWj4bzIImjVlUl0jqZhfYEHJzpd?=
 =?us-ascii?Q?VxaRlkcVsRXR/B0vzr7c55dmK6A4phD8XTfejEm8Tl3BszgyokqSgCJQz7ut?=
 =?us-ascii?Q?kLhPkZx2Ak6hx0rR9izCeMjgxvJy06+YzuBi+ottHu18m/9JSVlZKGVmUIQV?=
 =?us-ascii?Q?XF/RN16OjGy2Gh29uwG4obWP+t5+e1WGfBny8Alt31Lok43XraL36XV57CGw?=
 =?us-ascii?Q?Lip4wO8nGbXKSaC2d5FCrZycNOFfGuEjXS4djV6Scj1p/m3YgQnSH926Vo8+?=
 =?us-ascii?Q?vpfd8+2kQPNtRgSCYhClyJl9sbj8fsT4UhY3b5UVOpx5HDu9gWsUIiQ0I2WQ?=
 =?us-ascii?Q?pwV3HYU0JOvveYSiKcD8/7TPDn7wJEJcoiYLn09tJlx9QwOkRQjkEQ1Ix80R?=
 =?us-ascii?Q?hP3BvYIRnfTWhV14T9VlAoE86gYE+qYkGgsqybrvhHvuYFRyijyvEgL3N4Ql?=
 =?us-ascii?Q?/mZNWqPKzJs0jiw0nFILu14wIuVjArBfBj4lHNIzeQwQPl+Ecw/sE1EPGSDc?=
 =?us-ascii?Q?dlwE1CVd+1xOZCMMrbPbehGSI8/RiTbbo78PAQ0XgeN0JsMWANE9i20R+Yxb?=
 =?us-ascii?Q?O+d1IuuQHvudHWNzFj7ZvmSv1uQBCDaAJqFeSBYjvYjw/CxnPqSz7BS5iHbc?=
 =?us-ascii?Q?+XLxZgi/LnO4epfkH2fTCfc5y8okDxmWwdLahxvnpdMLQ8PuLaX6ucMDJb4p?=
 =?us-ascii?Q?J9VsaDmcikX0bJ0plWpG+ptQPLvH1uh1rHnpxe2ug9Ny9gRvSuxupMtdGjBL?=
 =?us-ascii?Q?s7bjxk0Z2l3uEYOy31JeXxf6QAF2I5bWDZl9ab0YdWTmeGYUZXpWT6KOjf83?=
 =?us-ascii?Q?ZNxpkowFv6wEECK8SETPLRq/XWpZBe70oz4cT8iS/iShtOBa/s3hkMUJJrOo?=
 =?us-ascii?Q?2TufYexr4q+ZVSSjoA9RZ8a1nBCqfumdm8Ct9FmAymcV+pA0Yd/MUhzyMOW6?=
 =?us-ascii?Q?hfETbsMnVJysrYmbP2gCTi5s+wcDPEKx+WoK21id/GhCEBv3y+x2QOF4XmZv?=
 =?us-ascii?Q?dElhGfU+mZ9l1pSMUTBJEcoljl2UqnzWNc6nqnRKBqM96NdUkiOYlPHvyrZ/?=
 =?us-ascii?Q?URrYeMoWtIMx2FQCKEE+wzybPHZ79kV1n4Usoymv7HDkce8NjLi9ILPxJkJ+?=
 =?us-ascii?Q?aSY44I18vb2n5g/eEvDxGbicvT/hx28ho60E/C1MpxqlUfS/IXB8bddmB8Xt?=
 =?us-ascii?Q?8/i11g0Li/ZXQz+p9Wap7fdX5+JclNk4pCuuBYHwQTxK9bCigvMLUwS5DV+y?=
 =?us-ascii?Q?pS/fJhD/AFGDG5V50Q5HF1npppD8pluAmu+WldsIPD/2qHSMLWRv9qyt0jHy?=
 =?us-ascii?Q?dg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01bea26-2e32-4847-b97e-08de113f3b2a
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 07:47:20.7669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pARpTCCjWxFubl56hjtdoIelnbRrBD+3fNwa5hFCpcXLexA3pxXIlDFEjUzjGpxXbVIrVrU3Z9RN/NlpqPm406GNa80cp9MmTm8LMHfX6lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB3135

This patch series introduces support for the Chips&Media Wave6 video
codec IP, a completely different hardware architecture compared to Wave5.

The wave6 driver is a M2M stateful encoder/decoder driver.
It supports various video formats, including H.264 and H.265,
for both encoding and decoding.
While other versions of the Wave6 IP may support VP9 decoding and
AV1 decoding and encoding those formats are not implemented or validated
in this driver at this time.

On NXP i.MX SoCs, the Wave6 IP functionality is split between two regions:
VPU Control region, Manages shared resources such as firmware memory.
VPU Core region, Provides encoding and decoding capabilities.
The VPU core cannot operate independently without the VPU control region.

The firmware tested by this driver has been upstreamed in linux-firmware:
- Path: cnm/wave633c_imx9_codec_fw.bin

This driver has been tested with GStreamer on:
- NXP i.MX95 board
- pre-silicon FPGA environment

Test results for decoder fluster with -j2 option:
- JVT-AVC_V1, Ran 77/135 tests successfully              in 24.180 secs
- JVT-FR-EXT, Ran 25/69 tests successfully               in 11.157 secs
- JCT-VC-HEVC_V1, Ran 132/147 tests successfully         in 45.534 secs
- All failures are due to unsupported hardware features:
-- 10bit, Resolutions higher than 4K, FMO, MBAFF
-- Extended profile, Field encoding and High422 sreams.

Test results for v4l2-compliance:
v4l2-compliance 1.31.0-5386, 64 bits, 64-bit time_t
v4l2-compliance SHA: 48316b8a20aa 2025-08-12 12:44:56

Compliance test for wave6-dec device /dev/video0:
                fail: v4l2-test-controls.cpp(1204): !have_source_change || !have_eos
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
Total for wave6-dec device /dev/video0: 48, Succeeded: 47, Failed: 1, Warnings: 0

Compliance test for wave6-enc device /dev/video1:
                fail: v4l2-test-controls.cpp(1193): node->codec_mask & STATEFUL_ENCODER
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
Total for wave6-enc device /dev/video1: 48, Succeeded: 47, Failed: 1, Warnings: 0

Note: the failures are all related with the eos event.

Changelog:

v4:
- Fixed build issues reported by CI tools
- Updated commit messages to use imperative mood
- Avoided using the same name for both nodes and labels in devicetree
- Removed unused labels from YAML examples
- Added description for child(vpu-core) node
- Added iommus property to both parent(vpu) and child(vpu-core) nodes
- Updated probe() functions to use dev_err_probe() when returning -EPROBE_DEFER
- Added wave6_vpu prefix to trace functions
- Updated HEVC decoder profile control to report MAIN_STILL profile
- Fixed bug in multiple instance creation by pre-allocating work buffer
- Fixed interrupt handling by checking INSTANCE_INFO register and instance list

v3:
- Removed ambiguous SUPPORT_FOLLOWER feature
- Used WARN_ON() for unexpected programming errors
- Split thermal device code into wave6-vpu-thermal.c/h
- Dropped wave6_cooling_disable module parameter
- Replaced mutex_lock() with guard()
- Added lockdep_assert_held() to clarify locking regions
- Removed exported function due to dual-license and used function pointer
- Added documentation and validation for state transitions
- Added documentation for device structures
- Added patch to enable VPU device in imx95 DTS
- Updated DT bindings and driver to align with parent(vpu) and child(vpu-core)
- Replaced magic numbers with mask and offset macros when accessing registers
- Placed goto statements after an empty line
- Printed HW info (e.g. product_code) via dev_dbg() for debugging
- Replaced wave6_vpu_dec_give_command() with dedicated functions

v2:
- Refined DT bindings to better represent the hardware
- Reworked driver to align with the parent(VPU) and child(CTRL, CORE)
- Fixed build issues reported by CI tools (Smatch, Sparse, TRACE)
- Improved commit messages with clearer descriptions
- Added kernel-doc for exported functions
- Removed redundant print statements and unused code
- Reordered patches to prevent build failures

Nas Chung (9):
  media: v4l2-common: Add YUV24 format info
  dt-bindings: media: nxp: Add Wave6 video codec device
  media: chips-media: wave6: Add Wave6 VPU interface
  media: chips-media: wave6: Add v4l2 m2m driver support
  media: chips-media: wave6: Add Wave6 core driver
  media: chips-media: wave6: Improve debugging capabilities
  media: chips-media: wave6: Add Wave6 thermal cooling device
  media: chips-media: wave6: Add Wave6 control driver
  arm64: dts: freescale: imx95: Add video codec node

 .../bindings/media/nxp,imx95-vpu.yaml         |  162 +
 MAINTAINERS                                   |    8 +
 .../boot/dts/freescale/imx95-15x15-evk.dts    |    7 +-
 .../boot/dts/freescale/imx95-19x19-evk.dts    |   10 +
 .../dts/freescale/imx95-phycore-fpsc.dtsi     |   10 +
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi  |    7 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi      |   43 +
 drivers/media/platform/chips-media/Kconfig    |    1 +
 drivers/media/platform/chips-media/Makefile   |    1 +
 .../media/platform/chips-media/wave6/Kconfig  |   17 +
 .../media/platform/chips-media/wave6/Makefile |   17 +
 .../platform/chips-media/wave6/wave6-hw.c     | 2929 +++++++++++++++++
 .../platform/chips-media/wave6/wave6-hw.h     |   73 +
 .../chips-media/wave6/wave6-regdefine.h       |  641 ++++
 .../platform/chips-media/wave6/wave6-trace.h  |  289 ++
 .../platform/chips-media/wave6/wave6-vdi.h    |   92 +
 .../chips-media/wave6/wave6-vpu-core.c        |  410 +++
 .../chips-media/wave6/wave6-vpu-core.h        |  133 +
 .../chips-media/wave6/wave6-vpu-dbg.c         |  225 ++
 .../chips-media/wave6/wave6-vpu-dbg.h         |   14 +
 .../chips-media/wave6/wave6-vpu-dec.c         | 1869 +++++++++++
 .../chips-media/wave6/wave6-vpu-enc.c         | 2693 +++++++++++++++
 .../chips-media/wave6/wave6-vpu-thermal.c     |  137 +
 .../chips-media/wave6/wave6-vpu-thermal.h     |   25 +
 .../chips-media/wave6/wave6-vpu-v4l2.c        |  507 +++
 .../platform/chips-media/wave6/wave6-vpu.c    |  667 ++++
 .../platform/chips-media/wave6/wave6-vpu.h    |  121 +
 .../platform/chips-media/wave6/wave6-vpuapi.c |  725 ++++
 .../platform/chips-media/wave6/wave6-vpuapi.h | 1026 ++++++
 .../chips-media/wave6/wave6-vpuconfig.h       |   71 +
 .../chips-media/wave6/wave6-vpuerror.h        |  262 ++
 drivers/media/v4l2-core/v4l2-common.c         |    1 +
 32 files changed, 13191 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
 create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
 create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-regdefine.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuerror.h

-- 
2.31.1


