Return-Path: <linux-media+bounces-36085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3D0AEB450
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 12:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E43697B992E
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 10:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D41A29898E;
	Fri, 27 Jun 2025 10:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kHugIP0A"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4CB2676C2;
	Fri, 27 Jun 2025 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019432; cv=fail; b=LnZi5w5aziMovEUk9t6RThQ6aDQBt7e43S1/qo0O/vXfnM7ypBKIaGy1wjjDauRAhxyyyD3napX36lmqF5QrG9UlHKm3dzVkeC0wtHshV3dFzR7xDpsJgOU4Jsh1qMMZN8Y3LtCMic84jUCovcPe8J28hzHIU2bGFeDpyleiHNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019432; c=relaxed/simple;
	bh=YPcoHvihEHCq8U/Xd28gbJDV1SHUdEjKI+sb3Fdg6Ts=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GmVsBxbWzn9c09+kd/uMe/Wad2Lwlmuzvi7a4tf3F+rfBE1vEewJzQNbtupYYHEsntkawMMYmiYbtQX8TB62HwcfPSgWdtXrmg44Z3iDMm56bc09V9+04gxTkF9NK+n+1GeMdBVyv5xn9vD3H38XxcyS3ykD4B7DJ+l5WHFfQMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kHugIP0A; arc=fail smtp.client-ip=40.107.130.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dRJeNEsh1Vc6ZxSjBN/TOOLZUPBn3uGFJrelc7f4XI/BhC18MZYhEI/jyEjnOB4CkRHm0wPXmJT6cSy4FGLdEhI/MqxffrOJ7enkFtd0v2hvAvqK/VEqTpCqumNJQizz2kJ748dGkGfYEoN4PMxupV8ZBQ8NaLqyxRgIc6fikLmL7CSeOpt/I0NKMmWjwlb1V+v+GhLROdR7fa1cUlDOEJlOe0cuInpIPMsbwA18Xk7BigDv7Z2PD3ipv5ZMYe3zMLseyu1WfUlr43bPOY56SB3A59rimc4UBFWraCmc/v0yU88Yw04WI609Oe2kobfoTcQHwYFSYmd+G42TIbyMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIjFefcUe2ho3fxOS5Z93lb3ANvTShsoQA/4XnsddwM=;
 b=A+8e7e+SNsU5vyQgbpPhgQJwDQJhOLzhoO4q22web2PCW7L8VJmRrZ9Xep98IkVuLbucR+SJonEqHlnBWTuOtutyejJ9bvQapGWKWLEZNaq2tnSre+SYSfS9MgSjEnq9NYwOLkf9CGJvCsVbOfbZDg0tQd3pSUSq7uZtiBl6JMdl+s+0ukLBz8i7dhOoA9t0hvu/WSEwoE5xfrHK0/7O0QICSQr6XkT6bdKo3Bi2KG4xqWVpxdyZN2ddX9EY7m5G6yW3UMoUUfXCaCP9dGFRvcEXpSa3ut/lgre7cyqir3GM6aKmBI2y1bzayZ47p7dVttqX2IqG4BgjZEe/aQC5IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIjFefcUe2ho3fxOS5Z93lb3ANvTShsoQA/4XnsddwM=;
 b=kHugIP0Az3nlkdvT50xypoKoXf39xL0cFIvmzKn0ajykF+Lm2j5Q5p/RC5vlfGGemT61m8Q3ioRXXa7JNr0KXizazXPPA9x3Ed8QdVlnHAdGIHPBQmn4RKqePCeI9gzhsCmn2LKkoJRwlRkpONU7LEDsxNXv6zjn5DJGyaALBJ9Rhvt33gFfL2fpyd07Y6nLP2Poa5IlPQNb3UsvhkLIyWv0eqVmCHwYy0V/tU4yrNmK6T/TS4USEw3jOzm2JCFN8ZMb4leWcmlgTdJswsNCr7RyfU5QnS+a98h+IctKoI8HopS/mLrKqSRXdsi5fsvDM/eQdYrPIwOfNJsEm/+C1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PA4PR04MB9461.eurprd04.prod.outlook.com (2603:10a6:102:2a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 10:17:07 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 10:17:07 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	gregkh@linuxfoundation.org,
	xu.yang_2@nxp.com,
	mingo@kernel.org,
	tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com,
	viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2 0/3] add dma noncoherent API
Date: Fri, 27 Jun 2025 18:19:36 +0800
Message-Id: <20250627101939.3649295-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PA4PR04MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: 617b9bc1-9ac0-4867-d87e-08ddb563c512
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?kdYDXmfU8/+YmJKoPtaCtiCAj4b5ywVpDErd8pP0YeTZYQ7pSQ354iTZQqfd?=
 =?us-ascii?Q?ZUgeT4sD9ZywVuhmoiTVFe1sB6HumEzXa0rwqkfLj30pMsotGLKmXb8xFgPH?=
 =?us-ascii?Q?FXrOIM467ELq1nxp3vRQ8RGJGW/MVlRXfocjYxdcC4hSyQq8d8pn2FoguGMS?=
 =?us-ascii?Q?oH4v0pBz3l4AWrc6Mz7+6TMxRPqcbSvmHPSN1XEj2eMohL6v4H8ZDR1Kvj+o?=
 =?us-ascii?Q?lxsuVKhQTqQuOshrrnjg0Wvw2aUEli9b9QSLq96SjabgP+sBAKFtyEkNlsg/?=
 =?us-ascii?Q?Ut2DBLpm858O+YPRvG+EQdtR+zxWhsI+4c9tiSGmWSn2POpj25xxafgHCO7y?=
 =?us-ascii?Q?tCkdyZIpbyQ5DCCjtuwhoGPpmdcY1nQrDAl8Lp52TEFHwgi/iwQNXyvoLb89?=
 =?us-ascii?Q?u2vsI/NzkDIHyUhrjm9C97fRUj4m6xY6igmx+jnNTVD0K9F3OD0CxGbG4bUS?=
 =?us-ascii?Q?ECzMTGqPKCzJOt8jdAxOgkq982Zx4faBsj5NmOAhTGyF3cKXD0LYODMlzOSl?=
 =?us-ascii?Q?cDaB2r/9S7GvBPXpPyZdzTSntvg60yg1SFousKv7u8XD4rioOJz2ONOu2Z65?=
 =?us-ascii?Q?I0zeXlOiIW/DqtAlgnrK2FGeJvFF5vU+0Ug4OU0jydUjfj4mEfEXyxQ5Qt4a?=
 =?us-ascii?Q?f8agrxi05AI11w9u9VvbhXqHg1Pg6DPK3XPSOtv3UvBSnOatdR5pZCqFRHhX?=
 =?us-ascii?Q?hS3U7JwH0ng0ijoo6lKGdJcVreHTbLV+vSNPSDEctOBpGnLtlSbO3zzGwwp9?=
 =?us-ascii?Q?ZMEi3LBMgbqj2/TnsvAXIu50mzEETQP1x+vnuNccdJeAQNoXFZYUlnVx1vke?=
 =?us-ascii?Q?aqw209fpfN+ybOf9a3hbMSJrvajNusNI89K/e+y/pGQDh/sml6gYdk47Csyy?=
 =?us-ascii?Q?oy7jt9kvXv+kkdkvBWa5zwM37cj3HzMjTH1FHQZJ/3Eb9ytaM8+gxZ5Qm0mB?=
 =?us-ascii?Q?Xuk1om8vphndIOGwWE9fpRMDcSYTILYTwM84thm2DHC98mWhVhbfpbC4HUTQ?=
 =?us-ascii?Q?LLHNJ59d83LgZl4pr+AfmcYvi55Be4WmzMllJojWaDrkYoMDtqNe3j0ryqrD?=
 =?us-ascii?Q?1boUJarnKLzzi1KB2A90trZ/38Fx+eDkgRsvIaMxh1w5rrbT32dO35FjMTgt?=
 =?us-ascii?Q?XvUQTcWo6aD+iVDECkLiilmuFK+4JNIAsxrIGtUKo8lTUTh7MWWpPjeZ2JfV?=
 =?us-ascii?Q?iEmFJW9JwI3+IO2D6Nny8Q+LF36w5pJlfYo28IUxEc+UiIMpznYTaTpNgR+N?=
 =?us-ascii?Q?35K3/1l0+sNDszJ6TtCyAa4I59b7O47swA9Zyo3nMHRFIWb/yqxv/Tnp6Tbf?=
 =?us-ascii?Q?Xzrb/uzMO/As6eFIDpbJGuYGX+hjLeLDL/ntTc+PZ6oQML7uQlaxGO1+N4pw?=
 =?us-ascii?Q?0kcWk/UKWVmh9xNcyGGtADAsPnK+AZsIX3XOuXmB5/VplBlf3WFh8oXKGZFU?=
 =?us-ascii?Q?musIH7CHNHQZCDJ++EHnoQNz/qFzDloNGWoc6c2YQ/ZZ5dVF+6Drpu28tpAK?=
 =?us-ascii?Q?2YUxOcI83st1UJGa5p5rY0Ujfyd2yo2FzMK7?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?g4g7ZNrUz5uGuKdBCqkAriumseu47NdR+pujckJxxtD1elvUKCKKuCv8+8g7?=
 =?us-ascii?Q?WWJxAJ8TE0f/jFtTH9/RNg8b6ac1OR3OTk+n5TRNZ7AB1vCz/lW5yTZfbN6I?=
 =?us-ascii?Q?tH3O7+ImVrBVr0YSSy4TomGOyjDqWHXbdlgswfykHARAX1pYfTyGOgdRf4BL?=
 =?us-ascii?Q?XZc0X7R9OTWLnYqOVRjJRvfwRwgAXDvpa7xL+wZXYMlNjC/7ATVT8C3fVw3B?=
 =?us-ascii?Q?fucwMHzNa4vMMccnpUyeGwpIfg+cceyP+yZFNMcML5sNUPRkPHzI65nMLVIx?=
 =?us-ascii?Q?lJU3Myf2dwA9ouTwtlrBrWETkzbwYXTIZQUNg4dZQFCTWz105XfqcOguYZvR?=
 =?us-ascii?Q?3DtaaD4Cak3MwHFASy3R/TXSFm3jIx2MI4cB6yzOwi1hVPNkfM7fzo0vNgGH?=
 =?us-ascii?Q?IM/OwIigEIBCDurKAparYOEClqwnX5pO2OajifSYPXKyIJfj9GDmcfF4tTui?=
 =?us-ascii?Q?iulzZkQBnmPiQOPD4JxTGDLojb/DaIjvYnjM8dZJ9sOU6MD0Pir3sK3UQzTd?=
 =?us-ascii?Q?RGC+e3STaRyLKEvbup5NcBBou96N1/Rhw/Jl4epGkwAi0jTYDGoT3xEFFJmM?=
 =?us-ascii?Q?PiooAzAd8hWyPDSzMplIzNthYtB8eN9BXF8ObqefOBXFXxc3UMTfZUi1Jo++?=
 =?us-ascii?Q?sI1TMZvif667Z919YMC/ccvpXFPeOQYvu3qB8l6uXM5Yb99W9XQySNq1VlWf?=
 =?us-ascii?Q?AI6vE6KX0hVUkTSgxcHCtqJ5k0k8CyHTvSfg/sHOiGA26YEYtnUhjI26FpYk?=
 =?us-ascii?Q?0ceCmUQmkA+GL+IeXQ0s0T2uzsKJXGT+xNEdA/+WW58J4xebVm3HNzrejtY/?=
 =?us-ascii?Q?JfgRhseHRby1GPeo+3b1E4EmUcu6xrj2evqdWNMfPW6ygUqZt8eXBsZQwBsQ?=
 =?us-ascii?Q?TuBtVppXQZC1woZwXfBHkEi5WQDgfxoEss2phU1PkaePEq08xRJPmcg2aPuy?=
 =?us-ascii?Q?uZDKTpgL2AaMv+4ddSFZP+ruw6g3mIl0r3XDf2FOCO5GIsblnnL2aLXELR+y?=
 =?us-ascii?Q?YXKrOv+B4kUKjzNRcMeMHGpuxJqQ40hVIT0m6jzfoFfYH0du8eEPGxKAlCh2?=
 =?us-ascii?Q?N7TuK3R+G7B00ljKeWRFshgqrwUwhtTw3gPSZHBfmaDWewnQITpoWtOsyHrY?=
 =?us-ascii?Q?mnl0ZkSLLEfeZd8Ot4eWw/DpPOMoVnfLY7IJOiUehL2kHwjcIHeAp1XJg3d9?=
 =?us-ascii?Q?0R628qx3zwYA0HipBe5UBGpBOVpHU8cd1cQkFtQ/RmW/2IuKzaGC+c9Xs8Qp?=
 =?us-ascii?Q?LNoZ/ouHZfjcSDQV2oX1Zj82qcj6+BHpISZVOFUKrbm7vBfK4hUOJxZ1s6aJ?=
 =?us-ascii?Q?5VTB4P5E5T1WQxbJsUZLeAhCYVQH8IOdnSPFf762CDgPC0fxQoiJxuzAXlXn?=
 =?us-ascii?Q?LCitjqjIjHi9B/A7Lqhxgb049IYVl09TsDpjmPp/vCP4INCSRIMQRj27zVjK?=
 =?us-ascii?Q?kLB2+h8XeaqOcAoipSQTc3d4LFwR5leAI/Ej65zaftaZ/NUplZcsnUKtefDZ?=
 =?us-ascii?Q?ijp0m8JrIzUF6Cyx0lzKtFgyo241SJdbG0LtVVR2XAecVFW3wUQM1f5ZvPkN?=
 =?us-ascii?Q?7Q90SJAj95MQLHef6oxwWgvlJqGKOvVsF8sGHodY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 617b9bc1-9ac0-4867-d87e-08ddb563c512
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 10:17:07.2342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUHUXRfGVmCcvP79wgWLfBifvGMlhy6dtRsNw4r/4CDlM3s2A8wrt2cisQlPxeGdpmA1UmOHtyxcUhLqM2Xz7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9461

On architectures where there is no coherent caching such as ARM it's
proved that using dma_alloc_noncontiguous API and handling manually
the cache flushing will significantly improve performance.

Refer to:
commit 20e1dbf2bbe2 ("media: uvcvideo: Use dma_alloc_noncontiguous API")
commit 68d0c3311ec1 ("media: stk1160: use dma_alloc_noncontiguous API")

However, it's obvious that there is significant code duplication between
these two commits. Beside, a potential user USB Monitor may read outdated
data before the driver do dma sync for cpu which will make the data
unreliable.

To reduce code duplication and avoid USB Monitor result unreliable, this
series will introduce dma noncoherent API to usb core. And the USB core
layer will manage synchronization itself.

Then the last 2 patches have used the API.

I have tested uvcvideo driver. But I haven't tested stk1160 driver as I
don't have such boards. @Ezequiel Garcia, @Dafna Hirschfeld do you have
time to test it? Your support on this would be greatly appreciated.

Changes in v2:
 - handle it in USB core

v1:
 - https://lore.kernel.org/linux-usb/20250614132446.251218-1-xu.yang_2@nxp.com/

Xu Yang (3):
  usb: core: add dma-noncoherent buffer alloc and free API
  media: uvcvideo: use usb_alloc_noncoherent/usb_free_noncoherent()
  media: stk1160: use usb_alloc_noncoherent/usb_free_noncoherent()

 drivers/media/usb/stk1160/stk1160-v4l.c   |  4 --
 drivers/media/usb/stk1160/stk1160-video.c | 43 ++++--------
 drivers/media/usb/stk1160/stk1160.h       |  7 --
 drivers/media/usb/uvc/uvc_video.c         | 56 ++++------------
 drivers/usb/core/hcd.c                    | 30 +++++++++
 drivers/usb/core/usb.c                    | 80 +++++++++++++++++++++++
 include/linux/usb.h                       |  9 +++
 7 files changed, 144 insertions(+), 85 deletions(-)

-- 
2.34.1


