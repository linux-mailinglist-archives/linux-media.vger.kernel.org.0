Return-Path: <linux-media+bounces-41306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B11B3B635
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 10:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AA731C85ACE
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 08:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCF729D292;
	Fri, 29 Aug 2025 08:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="R6haULnm"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020136.outbound.protection.outlook.com [52.101.156.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99000207A20;
	Fri, 29 Aug 2025 08:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756457248; cv=fail; b=OkCg2pIAwUmWACytJ5j3wdRnwX2pR4KiCK7UELXgVzYHHPD7Avt8hq83O3TpJ/U/9eMA5+ntMe7ghGV8QaSZxr9bsO7mBpLfEoNL2Ena9tQaJ0LeamLvjpKdx2iL4kfj9Jnt/+98eY7dqYcjSHt/YXqW4VYXS7UN1bPPKrJVrR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756457248; c=relaxed/simple;
	bh=0R03dHjZw8hxX1H+zMpRjQUSlvZD80gVRNIoC1vQz7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W/xvKgEViL3Tj1u7HDaFUhBEnTTykYZ5ebTrPcwbHwJT+EulNAtTwtXW7YbTomVo9fq7jgmTHFCQfhQSO3w29Y9kiYMbc660IaVnffnLpfV74ijt3xHf9qZ3uCHB7BhYB2nzQRZ6FIVP4nmAk6c3IZpFszEA8qA4yna8KnAUqxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=R6haULnm; arc=fail smtp.client-ip=52.101.156.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgD+6sRrcepW8TfTAM2AKtMofEPzEQ8gJSGu13uf6REkamVFXFoWJpl3VxgoAkz6ALPuFeuO7RxoS2O+W/q/3w0FA+U74yrdpU0Nved4i/N9/D4xirbA4SbTari0WWAyFNMYtJK7o1ojvZtxJbyaVvBK0XAgwEAoUjioD75brxKrwuV12U7i6Ym4fqQ9akvZRp5V2U1qsfrTODVfgJ8AtH7T6YYdP+8c0LcKjUbF5aYrMBruvag7ds4p1Y/bOtzssfpV34dYq2CKezVKoPaSzSl6bQVuuXwAbFiACbV48zwbMZsRA9/K2k5ZP68p06ky+5KYWQaZ9kDiHRtSuLYMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTJBtdaLl1Gq6RO6988FksLOV2GYeNVZpZJLYFJGcos=;
 b=YJmS5CDb/51VZdT/A6VUGvJkVeRtzyh6IT91jFoaiJF19omP4hpE15wpQbmKYnr5QuVYl+ErTsHAKm1nyxid8xtsSAlYrIOLTLrtYMNvq9175k0DYlDJ4chOtTGouTFbQHKUHkqmB7k5hJ3IJ+wmpBAfyq1Xyk2ucjIcPMlL0vut4ClwA8rCygQ0J5bKp/3+WTJ667AALqTe27VaPoQdJ/6tyzT1gozXuiN93fqBjEfOF8ZBM9QT56fNVyjudwqvzLBF0c25dj++VlQKBkcDP7HyIXnRBbbrZa9Dqsl6s6zZHI6TVmuq5ZfVfZ3FJ2BKRj4OJcv+pskUj1sGTzm2mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTJBtdaLl1Gq6RO6988FksLOV2GYeNVZpZJLYFJGcos=;
 b=R6haULnmVvcJAfopG3s5XQaYogv27MgUQgOWYWqspxj6IuhKxBeLtbx4PbhjH4aRTSyvd6NWTYfk7bm2fWU6V+qFjOTlHm6QzL5MNcFtXLvwicdYyfJ3Smefvq3DZfEkNfvsE1jMMSpd5jjEZPPjTy2lHtxyA87okWqzSL9MqVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SL2P216MB1418.KORP216.PROD.OUTLOOK.COM (2603:1096:101:33::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.13; Fri, 29 Aug 2025 08:47:22 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9052.011; Fri, 29 Aug 2025
 08:47:22 +0000
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
	Nas Chung <nas.chung@chipsnmedia.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v3 1/9] media: v4l2-common: Add YUV24 format info
Date: Fri, 29 Aug 2025 17:46:41 +0900
Message-Id: <20250829084649.359-2-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250829084649.359-1-nas.chung@chipsnmedia.com>
References: <20250829084649.359-1-nas.chung@chipsnmedia.com>
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
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SL2P216MB1418:EE_
X-MS-Office365-Filtering-Correlation-Id: 7370a504-e8a6-40f0-15c8-08dde6d8abb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ecaIFdd/Q+wVgMvcbGIYITCfx+dcy/Nz8KAC2USD1H8Nwg2/vgwGrdm36Z6k?=
 =?us-ascii?Q?bWReCCUu3GwddDEj/hWYXW88NVErep3B6WJUhatPfWUfplJ6adwQ9t/scGzn?=
 =?us-ascii?Q?3JxH22rMB5XqKG9VO7NDtMTQIb0KTdYuCLSLrKpgUeUg6XDg/md9GPFZYyet?=
 =?us-ascii?Q?oeWGCMdiB/6g8MM0/cGsKn2OoiQJ5Tdxrtczxp3KtRLYsYlTKMc9nTPxeESG?=
 =?us-ascii?Q?kLmSLKF/vuThUo1jrgf6uVOO5xJaKDdGJuUz8dq5pNH1fWSZ+J/yGbH5xwdE?=
 =?us-ascii?Q?zLze40vA7Aox0yzejKmnO37Q7dJp8BBQyfMgIN3UVrxgkGIvOom/9uKO/fjL?=
 =?us-ascii?Q?YtPvJ0AtUr8WOL3U7e6AFdMtU37mQyNsRDSnrRCcXg9Wnm94HHErU5q51bUl?=
 =?us-ascii?Q?YDTVkzNafPBF0h+bgApygkv53vxOiO8rQGx9+GdstMMhEoOIsgLcZL1qlmFl?=
 =?us-ascii?Q?eUNB1g0Iqv2EsFRW7cpqiw6XUQmx2zWM6lmK1weKUlf7WZba+bRNkzoTHCOO?=
 =?us-ascii?Q?ymJg9Y6TBw6FQX0wcJQdcInD9Lfx46UCnpmb6dhHrEJ7ehJj4nyrIOPiawdr?=
 =?us-ascii?Q?vP5bSLowETzrAOClGGg/LwPt2Iz3lEilc5vFpU2uSz5MGtjtjrBGU2stmbqI?=
 =?us-ascii?Q?jWRK+gse0MFS46pWiWUnw3U91qQIdR88hzUfyYBQdba2OjPsRAXhV4HXsJc9?=
 =?us-ascii?Q?TVyOP+PQaOkMo9GwrLQ7MEueDIU9KuDyn8fMJWjzlg3eqBXg7O1wBEqYjmhX?=
 =?us-ascii?Q?q+PZBmP1YoDp+nwkLYejTAj1tdmcEinMI49Us4zzEn6RfbDIlVvRSuaOmI18?=
 =?us-ascii?Q?51ivex0NwhQanUNEAaxE0HSH+UtBuj7qXITRjhwP9z/3kEZBLPCKHw0szqcX?=
 =?us-ascii?Q?Z7lTT1yJrrNa5C9rdDBxbvWCHYX4WskoPMvAOyDlNtAhWiB7YdfMP4KPXdOl?=
 =?us-ascii?Q?40X/LaeMt1oAaQQ1b5oWZLKtCff+P8YMpmekTzx8lVODqfT5Jq0+9acnTIXW?=
 =?us-ascii?Q?/TjAnd2jF0stb3utztAgytOTO9Fdm/PtYLJrGPxeJlbWrAvLheynXLLt/cUY?=
 =?us-ascii?Q?xMqq9WoQMdPP2CBx7yuEhsCOdMD72mLNSgKLjM2H8Ch91/P4Z1rpBWxXEogk?=
 =?us-ascii?Q?IfHr0d8Mb/y/vEAk0oCUPCPHv1CUyIeEjn3f5zM/H0JnRQ1NU16YCO9vU/uT?=
 =?us-ascii?Q?WAT6SDrQxFmP0AHxvsY2zvGkBCiuZ0Mi3r7L19qsxAcFb3h7mvWaLLSeOn3b?=
 =?us-ascii?Q?Kmn0kWvCz74RhhqAHw3bPsUfx10kNl0+rVOaB0OkJHenl2GJ8zrGBhUKXqqn?=
 =?us-ascii?Q?i4cFMyAl8D2xpI9VDdOPDYyxALgnnCmL6Fq/VNeKVVaA1/mGJVPaN+yuX1WJ?=
 =?us-ascii?Q?a4/gYUjncRFPLacRdlQ39UvSQazZ7lJsBwXDT9uQzy+M/2FDu/vzwOkIqbC7?=
 =?us-ascii?Q?ilqp+XqHeVmEQF9jMRyUKTvtDXIBb5PAGYgB+LdXNMNOrnpzxxnmMA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?21ODpTc2gdLe0tEc3VEpDRY761U9TLiyjBffUh0e3/mjp230WjRg4aYUIGRm?=
 =?us-ascii?Q?xXHUCv9+qQBTHdN5Fh+q+x035bhlXYpYoALGJZ7PtCRzZrbdrmRC15LZwsu8?=
 =?us-ascii?Q?Q8K6WATisylNzXv/d2TJKxHWldwWOT1FfR+iIdk0WbPY/z0sIKZqtO7fJmhR?=
 =?us-ascii?Q?FdeMoW1iae4IyU1a39arE+CXyEJa5Ow8R0bs3Cu+t+SqiC5tHURbAEnwvMcI?=
 =?us-ascii?Q?4iH3nobmpfqodH9P1AH5H1nSomEiz/nsuYPtkBsN9few0DBoGssRq3exdY8L?=
 =?us-ascii?Q?+unDmZeykwD3OWkHNlOGmO1f2HzGInOKVrDkXkCwTmVlcqjTcSHO/Y5KzV8B?=
 =?us-ascii?Q?3PejQazO7WQe7Ak3a/4O5KA7uFoEjpJFlD3frj7UgfQH7UB6SRRKfNm6PZ7l?=
 =?us-ascii?Q?+IK9Irsr+1l+1ek6fmEz+WV2rkgwQl4fFNkbcz6ptm10Dv8ap3Lx95dy6zW+?=
 =?us-ascii?Q?6KHI2zvmKYIuQ1v3dSVGPekrnHB/KcTGG+dKbQ+y4nXnH8fPUe4bVZsvzlFy?=
 =?us-ascii?Q?kH338YQIf7xmCBl00MrJPube2WWcZHGzR9UK734P6H0PNgBB1vRozc3yMbJp?=
 =?us-ascii?Q?LzZ7Ut8OuUwUQjbBCyrYt4arEUEdyvtdKaBA5LdNjIzYdcoB6R04bAh7zJuy?=
 =?us-ascii?Q?bcaGvlinjLo9bGFpPWeptKgXuDNs//tfaqFL/Uz8j3kVNMJThdJzlXJGgthX?=
 =?us-ascii?Q?O+/WR/ODuyD2HZYPN+tF9kED8SjzGJKU7Z72RVkxkitQju2mFbqNk5Dh0ybA?=
 =?us-ascii?Q?3nLXVtxM2wyFvsVCfFaOInN0arRl4XUebkSMgntU8jnbF8Ef6wXj97U9aqQU?=
 =?us-ascii?Q?psdlA1dJCtNE7uySHaUZsGcGbhxOOI6Pd3HYF5jh5N4nQUc1Qfh61vA3Jx+Z?=
 =?us-ascii?Q?xQWuGbIiG+EG1POICyQX10APSLSoLOeHLYywwSeen6iPANVow1iEOvHLDWLz?=
 =?us-ascii?Q?RdJ6EIsSU9adVfAe6ncgWHTZDGwAyf5TQL8mo1y4VR9JsLsvTe2XxnVLwdSX?=
 =?us-ascii?Q?tPe9Iw3sk/yzQvE4Fi1yvrM7kDQuEe3xDYAqwPWXz8D3163xvYlSNp9KwWaR?=
 =?us-ascii?Q?mlbNTmx3hWbSiCAWLxow/KBZFq6ajakPCboPiyPg+piyDSY60BXGBVOG6A9t?=
 =?us-ascii?Q?hIUMcgBnCXLPerTvKJhXeHmO9eKfMReIPg+lMacDcfcqdZLHfYZu/QlD2zqU?=
 =?us-ascii?Q?VsN+200hFIwINgOGyWUQ0Wo+1V6RT5azNWOrg2j/geWWYO7KuaNSCaT8lPol?=
 =?us-ascii?Q?phZjVh0pgsxix1JtP65OrXf7r6n9g2xgdBfmuAAI8cZuZmglm4YFm4qF0Vkg?=
 =?us-ascii?Q?CQ8Ld3oDlyCKNJ7B/7VpGTmF5hFpCBaV/UW4Gn73HFdAT4a0I18NSqkJP8Oz?=
 =?us-ascii?Q?FzYgTScb88VzbbupZVNJa+AJVCnBZgvQaYLk7OpUKap/dy0Uf/QwmvLfwvW2?=
 =?us-ascii?Q?UDs26u6yQZMPlNPuYpued1OwNZuLxsoGGnFM6uamo5Tb0Wpwj8W8R7dftIiT?=
 =?us-ascii?Q?Qr0AzeubibZWrfouyFn9t/5Cor2As3NHDS77lUk0fi+Tem4uQMpcWOF8M+FS?=
 =?us-ascii?Q?Lcz88k9e3k597BGPc+wu4Dt+YDts3F74D7tnXRKRBDMR0OcKvEi43SdgJMOO?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7370a504-e8a6-40f0-15c8-08dde6d8abb0
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 08:47:22.6595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r70h0IH0Qnt32wsGsmvfsygvgAPw2oZMblijD+ELYsHE8rvtVTou3eMxTL+7XXiBKWsdVvStbSZXhMegy6RxRQg5N/PiE/fbbUoqKGfWwqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1418

The YUV24 format is missing an entry in the v4l2_format_info().
The YUV24 format is the packed YUV 4:4:4 formats with 8 bits
per component.

Fixes: 0376a51fbe5e ("media: v4l: Add packed YUV444 24bpp pixel format")
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 0574f5d685f8..8733a8ed5b2a 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -281,6 +281,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_Y212,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_Y216,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_YUV48_12, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_YUV24,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_MT2110T, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
 		  .block_w = { 16, 8, 0, 0 }, .block_h = { 32, 16, 0, 0 }},
 		{ .format = V4L2_PIX_FMT_MT2110R, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
-- 
2.31.1


