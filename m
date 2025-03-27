Return-Path: <linux-media+bounces-28808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFCFA728CB
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 03:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0FFD1891C10
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 02:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FF116C684;
	Thu, 27 Mar 2025 02:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rUOq7qNh"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3494C1586C8;
	Thu, 27 Mar 2025 02:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743043103; cv=fail; b=B4BIo5Oes2Ju8PGUsjb/Zl8NVG91bZUNFhko2NfQXcpvUalzO/ugPZ2WEOYfZDJHn56peLQfXKxuUOSq3G4xcof9ZMon0S+jPrQSB+UpNh1aMpz/MN/Qc/SENJqkchu4xx0swmN/Smox0sQxw7YpRvEJmx1dz6De7zxDGyPVK2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743043103; c=relaxed/simple;
	bh=VGEWYcgTcF2cQbOJQZ6jijJY0kfH4cxylKMnzClo0Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RQC7bg1Q2p0p3Y9LfTC1i8BczZ4MQTBD8GjxtOJA6ayyHajKv/EU7ZUuGDvP3DJdLFj4nnXKtL1kIdKS0034RFwt7iLnoUdVK2uddOY2af6L9Ke9FwjLnwsL1Flz48oEDUnrOD2oOWYiWUIFlYjR4sXhRsnlgXwu468mwTWbxlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rUOq7qNh; arc=fail smtp.client-ip=40.107.20.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5owzELwn0kYWSrrXgtux32mB7wXWeU56S/9DZFpSnYi59SUN3cJqciF3DxRZZTf0dQvR93hKggZHb+ErO99u9mevTUSPO2ToMLPtrDR076HK60r0ij+VP3Gfo8458R3OMjCUcARceJNVnvBPfBfD0gl9VTwno/xP7VWDQqU0bqT9jdUFSaMcvJ0+cqXcqvRXO8JOJrrXP42lqRRC4YESW2zND/L642FKXe+W6c2m2t+PoCESesAPHyQ3yaleunUcBaB1o/hWIxTG/erB/xtOzRyw4t31r5YREB0mKOZcd2xYC6PFmVYEE5T2XOGDbUu8NK4XlNgbeqXETy65rbPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlIm9Ns91uaRTs1fpfsxeOVCssUaEeDGGG2Xv4okbOA=;
 b=ppENKlnnvepUCEOGMJMk2wG+CK4jJdD531NyKXLoxJsv8Ypqp1GaezMP+o90c/0QweX0r0aT/3Zk2VCaBQpHb58EmAQpUr+odoiYfwEIrlPrWimLDybjFYHwDkOVHy74YNCQXYs0MjtUO6m9qXef47OUu2o2D1lVxE+amn6Go3VYpyHTGbGbqTBjmC0rZ3C1SdOf3Ee8t4BJLSHwCIt8iYutSRS2obX9/7GpnuxLZBV1ue0oe+MEqKMBUfqSYh9q8yR26qWCQ4gudBSA5hH43PSzNUjshG7U1E4pesF61NRQfi6veyqFkqWDcxI3wus0onhGTXi6ToEO547e0e3xzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlIm9Ns91uaRTs1fpfsxeOVCssUaEeDGGG2Xv4okbOA=;
 b=rUOq7qNhPR7twIo/SC7Bj2M8x4cZbBYH/dgQvaSp80pOVWxDa4oQa6rhgq37maWNROASFdKOSFJa2o42OoMuDEe/cfgC3Chugfck7cqyBtmovZXtQGnENPXBuaU1WpgVjjE7SWBt55mcYXbq8vY1iSE/mxL7ErPATnSVk/5DYPvTygE3g8phn6limx+wC3i92ogF/uRfAoyZUVZLVPkTKxcYMPvzDuTLkhJDa4Ubh8K8ZDAzt1NydVyOe2fJvbUpQGYxqNtH3S+8xoeqHwPgS9qDQsM95OKNLcQuLNSuUOTSLtJQbWT9j5FYYA0fPPaRooX9wGEsvK2zIw/kIkLHGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM8PR04MB7988.eurprd04.prod.outlook.com (2603:10a6:20b:24e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 02:38:18 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 02:38:18 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] media: imx-jpeg: Check decoding is ongoing for motion-jpeg
Date: Thu, 27 Mar 2025 10:37:07 +0800
Message-ID: <20250327023710.549-4-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250327023710.549-1-ming.qian@oss.nxp.com>
References: <20250327023710.549-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM8PR04MB7988:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d7a4dd-a02d-427a-780b-08dd6cd86ead
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LEPgnHUf8zc7oVwLo9qgEAGsmU084UkMigSKE0bHzARVkX/5a4nGZGnWxIkX?=
 =?us-ascii?Q?K1FkrvjUC2KR1fdCdKpnBT/jhg2fGfz0QP5IztcjiwuLv4mSzs4RBINAI6T7?=
 =?us-ascii?Q?4THe7quoMTYOcrKr5Th0zg6MT50Dt2+duSfJub0Ll37MGM9iiyZFxhM2P9mV?=
 =?us-ascii?Q?E2vR7NgJFjxGFIHrGtdzE/Jc02qgP017J1xzLsetFafCgFnxSEFZ3hmnpcdt?=
 =?us-ascii?Q?wd46aQvKINi+d6yp1UDMgbDdMkJbd7doI8ygCLS9XiVGBl1qcHChOSA6n+9V?=
 =?us-ascii?Q?xIoO+8GvnIT1f/Nm6iPmppfE5Lz19dFdz/7JgOrjk47VS+hna2GDHEkDSxV8?=
 =?us-ascii?Q?22eFR2taLZcIlBhNPBFIdJYlSV3lJqf37X2FFVo1JLPyvdgaEYGyJ8Z5LtJn?=
 =?us-ascii?Q?e9Rz2YG8Rn4wKX0kEoqumoNDGoNicvkMUis0vy5CDdicIC8uZ90lGL/JAU6j?=
 =?us-ascii?Q?yBalWiNnmgh5+gknlIqPfn0Bj3jY1fuAc2JmxbJqC5o9d14ux/Ve0qbB9c6S?=
 =?us-ascii?Q?PR3t+D0D11CgwzN5lzczy3S03dDAsj+o1J930UTDN98T3fECoZZ2GwmjiiyO?=
 =?us-ascii?Q?+TUDkoZiouIvB49tMpw6VsUlKfDDs0TQoPBWk4iQdUblGq8vC3SH+GDf2N5I?=
 =?us-ascii?Q?SWexb3JeHgiMUkubF3/GuUJALLQSjRy2Z2mgU7MxoWBq5HxQkv3LU6l73ER4?=
 =?us-ascii?Q?90WnRA1ZzCczyIzGK6ISKLugRtq9ech1PcXVVxgawTEpfzGtm3J/FBi40giQ?=
 =?us-ascii?Q?cMH8l6wF7WpqWHKIeEzv4q3iIkJgUQDZoMwN7+X4KTWCP8/ZbbFXw/iyDEeW?=
 =?us-ascii?Q?DwW7tfdTBhmvkyS/SvqTyzC2YGPc2a+4R4h+a5HqDi8idEL6CaX3o1h9iboS?=
 =?us-ascii?Q?ngmWln2azeHjEzCNRVvH2KKqDD1iogR5eUOf1gv5vbsaZZhIG12uOkI6x6co?=
 =?us-ascii?Q?42WZ3ny4nWfUAdVLEK+6yS8Jv9fe92GW07EzWQX/MLNwYctzW4b7pbCp0B18?=
 =?us-ascii?Q?+y5f0Qhz6yQ6G2HOwdI7rAonAfU9Tk4b9o4g7PdKAYv/7a853UVn3szQ+8M1?=
 =?us-ascii?Q?hzxHtSt6vST21Ab4VKxBBMeC+jRQyveOB35i9FDoUvMKhvhbyffj40WR//J/?=
 =?us-ascii?Q?sdj9fCTdmh9l5kuMO+gzb7Xt/o1gUCQQYjz4oc1x2LzEELx0W6ajsftSuF+C?=
 =?us-ascii?Q?bKhU2myNLy8NrGxGc4UFZT3axATdbWJa+RFWO64M6mRFxtrdRCBYaRsELXeR?=
 =?us-ascii?Q?/Q+cr/pVWS4zRpYMVTfOm8Cu8CI/Rzb7TShWJxZwfWyy+wel1qY0KqHsD0rt?=
 =?us-ascii?Q?R+2NQnPKjJTONutfdIVY1dB3HeTB6SM0vLBijuvJoVuMs11Kasg2a7/G85K8?=
 =?us-ascii?Q?BAPnutfdXX7gkudSEgS9wFrvupupIMLGr8JEvOQyRWxvj79xz+uFchs3h80c?=
 =?us-ascii?Q?vNJl61Fa+BUI6o53/VrEmsquzGPLk+eO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MJEUZsfnGIMvHhcySPOyvndZ3IEbfeB4EUUG/bnOkATbDdIYLyfB/N+HWsel?=
 =?us-ascii?Q?hEtIlkp3bZgJ3rwmDGqNxLjiR0siVorAY9xjXAx6W/w0BXDSliPalN15kWSi?=
 =?us-ascii?Q?C3U7yHPzFxPrJzP39zQcxu1AQ50jClO2rBW0RqQQ7bND4g3anDnsJdrvaiNL?=
 =?us-ascii?Q?dNRxcIwHFyNbvQskOnb4NrekM7LSWPFd4AXkpBkmxMRJMeZB11RfP1PVVtz0?=
 =?us-ascii?Q?ezccXAc6+5tZ4o9KiKPEPzF47QxfccxW/VboHEw1DUWoDOLOkh2ucpPw5YzO?=
 =?us-ascii?Q?KkzyXseajHnJdefq/WvXtQ3J+xD3ChXLbdlvJInxcsBIKerP2yINk/1lgZAJ?=
 =?us-ascii?Q?7xa157PnDqbNan9Hx6hVAZ1Vl36BC6SR0fby0KHr5SnlcZ1gRZuAtOD++KAg?=
 =?us-ascii?Q?g+Jy+KR5fkepPNuUAD8/qnR8rIbgbaMZQClMau4MAq2Gv4vuxsPizfedr2RJ?=
 =?us-ascii?Q?iPtLouAlfh/IKAuOI7OCvIvzj/zg6+i53AAHJ5RQeAmsVF1mQsdFzY3M3fdf?=
 =?us-ascii?Q?d1Pbv2H4wRRywkuQq2rGw+ccLzah8ftEyqGnizTVwouABwcezNtqtW1NBj+j?=
 =?us-ascii?Q?Ei7kCU8JdSaHIrsvG4Tv2yiAT5zhy6OtvWBH/hWr6/8/xl1Vc2EaQk+HwWAU?=
 =?us-ascii?Q?S+nAN6l9KAd+mp9bUuf+Cgkqu+096gYAzM696bEsydwLO2nhto48pkvdQxtR?=
 =?us-ascii?Q?PEPNmNG8gil8tpRKyS+On5b+m6o3H+qmif0jNxJvjNk+K7RfCRKDSapXDxRq?=
 =?us-ascii?Q?cf4aTI4zi1aJadiHbi31dMfKLiub608GnqMjaFQBA7ucrtOVum4y8OUxKCZ9?=
 =?us-ascii?Q?RE30PmPYj9MuJ9B4SR+aQhlMRK2kw4RNA3817i8/+pK7dgcqVcDgsYJsKYTl?=
 =?us-ascii?Q?DsbVxLAV8zJvtg7uvb3W2CYI/t0kSFbyTIdMs7lN3x9JxV4rjCYhCrLsNdsn?=
 =?us-ascii?Q?A6aEpdUyIoxbe3/3T1bPNP2NxK+4ypCGhFyYAyRvNR8p60A2Vju6snYiahNX?=
 =?us-ascii?Q?/N0j4VjB1Ekcz69kfaYplzSwNZCrT16dTUFyqGGKWx1q2yIQw53XkfMU2xqi?=
 =?us-ascii?Q?lUyKKW62UK2PKHFOM5pm12AIiC5yw4cTFN/Wyll4tYzK/VpraOxvK6iOzuzQ?=
 =?us-ascii?Q?camG08WoJGMOl8/ft8C/EfQ4o4dgJ+lXimSRiZZhV3O3ncrshtUB/ZrF6L6V?=
 =?us-ascii?Q?8XmWFVDYyRQ8EcTaAto52Gjw6hv5pPh6nPMeR26VgV2D4okvG0dp1SySTsQs?=
 =?us-ascii?Q?6reOr/9HhAbkHfokYKkbxO6amCFfVxdld/17XUoU3Nl1ul6FVNAHxWEouKpo?=
 =?us-ascii?Q?jj57zBA0e2jMtxE0slp3L5iWxKEPx2jq1COR8FDUR/WOUoo3j0Kr3c9W+Vec?=
 =?us-ascii?Q?DKjD8GuPBLDXVc4x4Xrw/5KGkChcMh3lVPm4BeaUIzwO0NcBvT+kxRCspfFT?=
 =?us-ascii?Q?C1/ywetJ3Ywbeo+nzW/b6/LfDHva5xsFA3rea25jeQ5NRv2kqG/SJGU57NGq?=
 =?us-ascii?Q?yeTZ+/9G+rCx/UkN+vCgQESxp3f/VEnBw5up2a91ck+r6KdBYoY4DKGK+3kL?=
 =?us-ascii?Q?u1tA1tblc/07BS2jEjuBBBxnEMtIfP8iypB4R6oT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d7a4dd-a02d-427a-780b-08dd6cd86ead
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 02:38:18.5722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+bpDnc3OhAvg3n9qqxCPK4rWI5FjgNf1aPXcHvtO/OPxRTEWR/palQLwfe5HCNwfflYtLWVbLZUErkov+E1EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7988

From: Ming Qian <ming.qian@oss.nxp.com>

To support decoding motion-jpeg without DHT, driver will try to decode a
pattern jpeg before actual jpeg frame by use of linked descriptors
(This is called "repeat mode"), then the DHT in the pattern jpeg can be
used for decoding the motion-jpeg.

In other words, 2 frame done interrupts will be triggered, driver will
ignore the first interrupt, and wait for the second interrupt.
If the resolution is small, and the 2 interrupts may be too close,
when driver is handling the first interrupt, two frames are done, then
driver will fail to wait for the second interrupt.

In such case, driver can check whether the decoding is still ongoing,
if not, just done the current decoding.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 20 ++++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
index d579c804b047..adb93e977be9 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
@@ -89,6 +89,7 @@
 /* SLOT_STATUS fields for slots 0..3 */
 #define SLOT_STATUS_FRMDONE			(0x1 << 3)
 #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
+#define SLOT_STATUS_ONGOING			(0x1 << 31)
 
 /* SLOT_IRQ_EN fields TBD */
 
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 45705c606769..e6bb45633a19 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -910,6 +910,23 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
 	return size;
 }
 
+static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	u32 curr_desc;
+	u32 slot_status;
+
+	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
+	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
+
+	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
+		return true;
+	if (slot_status & SLOT_STATUS_ONGOING)
+		return true;
+
+	return false;
+}
+
 static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 {
 	struct mxc_jpeg_dev *jpeg = priv;
@@ -979,7 +996,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
 		goto job_unlock;
 	}
-	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
+	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
+	    mxc_dec_is_ongoing(ctx)) {
 		jpeg_src_buf->dht_needed = false;
 		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
 		goto job_unlock;
-- 
2.43.0-rc1


