Return-Path: <linux-media+bounces-29569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6CFA7F2EB
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 05:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 219D73B671F
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 02:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FC225F7AD;
	Tue,  8 Apr 2025 02:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="giZhAjmy"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013066.outbound.protection.outlook.com [52.101.72.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217D225F790;
	Tue,  8 Apr 2025 02:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744081117; cv=fail; b=DrIqEdBilJXZ4xyWvQuR5J/GoDR5ngTa5EngEUVpzH+rXeM49tireunjnotbF+zfggyov8l0L207bdrfGhlcmohepxylgr+qQGdENOTZBxyNLnN5mSyXTyBTU9u5q7EZ+Sn79WfrTEZDJkLtkF8FL3fLn45QsJPxAB1xZOf+PCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744081117; c=relaxed/simple;
	bh=X0bqTX3J4yZ2vmT92MEjA1dQJSH4FDfGgk+juC0Prpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aGlgG99Y2cZGdJ/0MOiToVbu5BCYDNPmqFiVlBsWHZuvgDQ/WMLUi6Ez6rwZ/uj6NNF52PugjeZsV5tM4S/8P+rPW05nNNsyBUmRkQPCKiYX8vLkEoPLTWg9jJTCvO6gvPa0S7UFYnnKnolu6L3AikGau0n7cc94+MbiuZCcD4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=giZhAjmy; arc=fail smtp.client-ip=52.101.72.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZv72Z3u4RBRJakKDDa4w1YmifO4OGPAWmiW9U3cPv68nyZTdH7/Iq6nliw01/J++veYLT6YdGoESHsWNU7wGCEgr5kuRz2bGhyIaHu8u+BaYM8wlHNudWD615ybpKI/y8QCp2OC+Ep5umI1cMrifJDHGoxS3qwrrfE8hdtgnF4aPauZJmohhGhRz1uVKwS0vhVUhl0N616z3/uXJxbzN8q9o9UpoMqNlPclq6Zc84iL8oLDH5I2N2EyWS22VE+UqxZlWphi5YviS+ZxKWdscu8ftcY5UHF7FKVNe7cnzx0GqXaqkzmAA0AwCo+evcp28CW8iA8qPNZOU3lMvSw8Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84aNYvgmNEoDC/iKgGv/7Y0P+wErvEPnSmSSfmVRKpk=;
 b=DHHIDpARLCtds+gKFAgO+hIz4a6WU8yV0jct7ulbR1fznIwBzejK3OjPK5BMoe0Tae9h/0j8/VHn414AT18OysAeuqdpUIAHc+vB1N1vOO5ejiirgz/OFzxQI6GDyllBjioNFJQKDyWu7yeVkE0yk0FguLW5HHaAtL6pghqmAh0NIGwf5KlvB5NVEfEdGPx6JZELmlbW1dIfRs4ZsXy95XrrP/Fz04OoSDKASY8ckMv66TzbLBeOoIh0LftPuEvjHvl4zAMarLXEjgYxJdnmkZEx8yIlF/N+hxahBb5bRKrTa3yGqqkL5jk33yxN1/96f3UuvW2F7yZm/XZZiqo7+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84aNYvgmNEoDC/iKgGv/7Y0P+wErvEPnSmSSfmVRKpk=;
 b=giZhAjmyovJ08LHBV0hzinjJTYTTiAaA6IDZI3L0uKRyaAaYepE26p3UAdvBum2eDj6Luqp679US9SLmafXZb2z1TuyQIuFFZa0jNqxQJy4/jvSLQXaA6bvsrC2s4ZQGL5Hdqi20FG9+dOrrXRA7mF6njuQ8adRpnk2VlmIL6B9WfOjEkiVPQ/uX9DT03EeYUVUduOxsv6gThVKFA9Uj5oST5aRW/MH+BJXdBDgQsV9pcqeoBUG68f1Q1qY4VFO/xSj43yKKkWx7aPvWIzhRhv5pjWTCrMIk5ruFM/aoC2SSPckeS/4vTyVn4fIbRzaSuJK1HfBzCRHPjAmhqmuyAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI1PR04MB6944.eurprd04.prod.outlook.com (2603:10a6:803:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 02:58:32 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 02:58:32 +0000
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
Subject: [PATCH v3 4/4] media: imx-jpeg: Check decoding is ongoing for motion-jpeg
Date: Tue,  8 Apr 2025 10:57:20 +0800
Message-ID: <20250408025725.1244-5-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250408025725.1244-1-ming.qian@oss.nxp.com>
References: <20250408025725.1244-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI1PR04MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d38531-3f7b-443e-f3ed-08dd76493f1f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?owxMwVgnlOmDc6w91vMe8MT12tMCf/zQTkr6Clx7lO+YE1mado637r++mDz2?=
 =?us-ascii?Q?7RSsH6XSEfkNo46zzcwSkz4f8wZ1S2+YCXnHI9h0c8ZkMATKaWIs/52JrRvG?=
 =?us-ascii?Q?Dgxb9oD47iUudHNESRCBwxS2f/ShD3rIM9cbUPTIQEJlDGQV7sWu/ysuS4MD?=
 =?us-ascii?Q?J1pl3Oxq/XSryCptl2KcJHPTqzULIstRJa2IHSihOzCx1E9ekKSisyY9/DnR?=
 =?us-ascii?Q?VuaYBKl/NRWdqnDFJ62/l/SIZhAjn4EyVVpHPMvEa1ZO5/noj3k6ekcbG+m0?=
 =?us-ascii?Q?FNjHoIG6N7gwdAAJjgkPyZv+jZ3NFwzx5+7ShhcxfpkSlfBBtOnUCgA9xq5i?=
 =?us-ascii?Q?I1a0J5Ji5j3H2PXvlYrv6V4cXlhNDlLKCWk7CwQy2w4J89mEhEJyW4A9yroB?=
 =?us-ascii?Q?2FNne9QY61F/Pt9Y42PzQSFncP7xeIpLTCYSj7hGhVsW5/QrRnShsDNTbMHa?=
 =?us-ascii?Q?n3seFxBlEiQSiJH/qayVT55kUSvVa0cjzW2MzG1iamH1U5pzdbltmKrpD7fQ?=
 =?us-ascii?Q?PZqyL8JjUZJ55XCnLx5vj0oz31J5+tDLFtcHUIT+Gi9V/Ws1Z7G/anNtN1u5?=
 =?us-ascii?Q?Yru19T+/b9YumMrdcpUWGc2i5dpVDmrED7hiXS3iEJU4MMTo6BeCQdSuQQcf?=
 =?us-ascii?Q?2LpY4BT3E5vIPWDAvMMnqczY3S/HnYX2de3xqFHUSNQMY+uHMbPIo7LqVn/a?=
 =?us-ascii?Q?HMPF8tf/vJk+b/ypXoAIOdcKjYMKcBS8DZGp6eG9COIpYHNK29H3xV6xGqoL?=
 =?us-ascii?Q?2h7PNXxtHcQQWQAOgA4aI3ry9KqoTU0FYc+ulhUbVHT4naziDX5HWnU2Yf1a?=
 =?us-ascii?Q?O05inM9R16gNt5aoY/35/2gpvUK753ita1zAIEKfvNbdUQvarRoVt7s52aD2?=
 =?us-ascii?Q?YIFPvTgAlSmjYDM6S52U9+54wwvgCeeFSLe9I+JrNt6YF218psF5bfTzdyQy?=
 =?us-ascii?Q?2/aYElofV4p8b5Z5xuoRzWMbb/lttBJdjp9Z3uAiw0RKlTXkBBpuTnBOiq11?=
 =?us-ascii?Q?PNjBZ1T+2oAFZXjpM7U6nIBFEadS7gXM3G+FqWvp1C+8x+oyQrz399KQIEK7?=
 =?us-ascii?Q?JqWDsufLBj4aYF2NSnFANUj+68wHXNbrMgERE3Fa+YKJYyoQEaAWpipJ1xkv?=
 =?us-ascii?Q?yFrOrpfuetwnqtZOJBZE19f1PiVoq/ShV6+3ytMBZ1QOPdEpdROs+2ROuhLl?=
 =?us-ascii?Q?GYuEvtAd6Ej28H2y9f3kAwa2b1s3cZMf7cH9MDYL4+DShown2AQblNDDFgDo?=
 =?us-ascii?Q?G7CQrLGllTNXx76hcsxhSjV2Fn+Plg2VGVpJZjK+d2sq06Zpwc26AGX48t4Y?=
 =?us-ascii?Q?mj+864/vDq01K6/r+xzqoVo1H5qdCyLcplzJ0si1sWFDh+aMzL3O7SJ27Y4L?=
 =?us-ascii?Q?oW7KfK0UXibiHbqvjFzs3cenPAerodCy4Bm9OTkxxavSsbXvYe5EMSMZgR/0?=
 =?us-ascii?Q?CP4FOArZv7i0TEVsobhOs/LCMT5LoEHy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pbOiQa7n6dsNk4O9YXjiKRpl5rq4v2T2X/QkZgnonmlansXbSjxpKPMjFMa9?=
 =?us-ascii?Q?tPz7f5d5XqtinrsX48iBjxhVHptlRJQ3RJQU3JOi+CW0NUGAKyL6KjtXfOIm?=
 =?us-ascii?Q?ohKEVCYk3m1qZhYaOGwCSeREwDUV+rX7B+DFcqSvOumJkASzGuku046nqMJe?=
 =?us-ascii?Q?K5r9k3Psq0cYbHll4wn6y9/bU+uz35lZOEjdl94V1GL4N9fqX5jr+S5fYG80?=
 =?us-ascii?Q?ZoQlnRDS9OxW6fi9k1ABiObLmi+qMyP567gEswFCzYZDieeStAaaiHIhtdkJ?=
 =?us-ascii?Q?KjdKbrzPPSmdEORXW2pacuAXj/DYBDGJNflTTgLxNWwqLPOfd2AkVYn0CG9k?=
 =?us-ascii?Q?+wm0ugHfKqI3GVF34gEAsHaLCW6zfPi/U2aTxoCqPdv7VepzgtVtf7J38Zea?=
 =?us-ascii?Q?hw9BzUGdkPO7a8BPyzBBYW5v/B/ATYYo66WFwC9vf+QrCJN80w21TMy9SIin?=
 =?us-ascii?Q?llgmj9Q+gE1yUd4cTsr0Qi/o77MbI3CNaQ1GCA4cmMQITGGS1mj7i7x6J/aa?=
 =?us-ascii?Q?wXwowVSlikkr8feaPhreXU1ybkzKUxuALsllOBPm4GXE1xo6LeuFpqtRVC41?=
 =?us-ascii?Q?CtugcgQLtxhdAD7XzdUwdP7kIuxePq6UQtjnd5fKmH9t30EYvRoKITFhlX/g?=
 =?us-ascii?Q?RG/cnOCtwjhPOjFVLxtrCNCRVDD2IPnxeCLs2rK0meBuZdTlaE22xPm8DVdp?=
 =?us-ascii?Q?DvDLZvGscSPRDIqqV+hOJDG6lOgh2+BEK7xpsEmIKMHEX5XX48+/aqBGyzB2?=
 =?us-ascii?Q?PqHJxE36Fsw0n0ucAdqQNv4C3EzbJyNFUXZ/a3Nlwa8EUYuod6a98nwdlrlR?=
 =?us-ascii?Q?Qpjmq3fQ0dIRRosxrSDUsFH4/qwxOZQlC7806IEBfYEjA78SmRkKB10dBIQ+?=
 =?us-ascii?Q?gouNiFPddTdHmAnrA+dLZ3lRf1+3QlF9sZNPD5ExYf8riTgGthZyIDTTa0c+?=
 =?us-ascii?Q?CfP1ga1dnQD8yMZP03eAl2bVz7e8zMLw40rEMS5K97LyL4jy4P40czSEzTU2?=
 =?us-ascii?Q?f6lV6QBQgvOtNcKEHQ1+uCUZojC9ZlAl3InWa1BN3Q4c9ZXgQb/62BlZMmqn?=
 =?us-ascii?Q?rFDaALxDXNXx88MUUBr4kNTMARgSaT6hAsszwoHhH8McLVwx1OPR37jQf1vh?=
 =?us-ascii?Q?tmE2Sa0swn+LtE6pykHkMFU3WaoYZkBwYxMseznXnCVW9EIPgXCXB8carvYr?=
 =?us-ascii?Q?EHcQHFOK0OPngdREySwuQvra8HesduhtgvE17lHJjNEOTC3qta7xHUjKdmRJ?=
 =?us-ascii?Q?JS2kU1fKgKwwQUWU4ATMDL+jkPMAvY/HXbgeiLfrceEUa9abNy8UY8mBrLL/?=
 =?us-ascii?Q?PnzLHPBErJpAFHOsZ4lgn5VaiB2CiNfByehM52CUdWl033ssvmY9jhiQaSdA?=
 =?us-ascii?Q?IQgGX/JJ+BQcqPklR3qaUK811ieFglgaHfjgnIC3xpTgkr539VP1BSg+WMvb?=
 =?us-ascii?Q?d2WBMjrV/DsvbP7rjx9rLn/iGIwi7PE/wPMI4h7GCTs3fUhSUMpvRiu1KydL?=
 =?us-ascii?Q?ZNUZZnq6Xt6KPJROyTH8ic/OY7ibZZqHMJSiWDIt61Ckfle/eECHNSmhJnv7?=
 =?us-ascii?Q?NBLrIF2UAfjBBtOOx9stlborPAzKQOqVnVO3KLFt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d38531-3f7b-443e-f3ed-08dd76493f1f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 02:58:32.3173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nz7bARx61YRafSytWtVnF7J+5Jw148o2+LH0UqL9COKCJ0GO2mm87FsumocnzlLaQvTzHlrFhF9VL560eALiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6944

From: Ming Qian <ming.qian@oss.nxp.com>

As the first frame in "repeat-mode" is the pattern, the first interrupt
is ignored by the driver. With small resolution bitstreams, the
interrupts might fire too quickly and thus the driver might miss the
second interrupt from the first actual frame.

In order to avoid the driver wait for the missed second interrupt,
driver will check the curr_desc and slot_status registers to figure out
if the decoding of actual frame is finished or not.

Firstly we check the curr_desc register,
if it is still pointing to the pattern descripor, the second actual
frame is not started, we can wait for its frame-doen interrupt.
if the curr_desc has pointed to the frame descriptor, then we check the
ongoing bit of slot_status register.
if the ongoing bit is set to 1, the decoding of the actual frame is not
finished, we can wait for its frame-doen interrupt.
if the ongoing bit is set to 0, the decoding of the actual frame is
finished, we can't wait for the second interrupt, but mark it as done.

But there is still a small problem, that the curr_desc and slot_status
registers are not synchronous. curr_desc is updated when the
next_descpt_ptr is loaded, but the ongoing bit of slot_status is set
after the 32 bytes descriptor is loaded, there will be a short time
interval in between, which may cause fake false. Reading slot_status
twice can basically reduce the probability of fake false to 0.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v3
- Read the slot_status register twice
- Improve commit message

 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 30 ++++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

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
index 45705c606769..85795ac4cc71 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -910,6 +910,33 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
 	return size;
 }
 
+static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	u32 curr_desc;
+	u32 slot_status;
+
+	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
+	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
+		return true;
+
+	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
+	if (slot_status & SLOT_STATUS_ONGOING)
+		return true;
+
+	/*
+	 * The curr_desc register is updated when next_descpt_ptr is loaded,
+	 * the ongoing bit of slot_status is set when the 32 bytes descriptor is loaded.
+	 * So there will be a short time interval in between, which may cause fake false.
+	 * Reading slot_status twice can basically reduce the probability of fake false to 0.
+	 */
+	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
+	if (slot_status & SLOT_STATUS_ONGOING)
+		return true;
+
+	return false;
+}
+
 static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 {
 	struct mxc_jpeg_dev *jpeg = priv;
@@ -979,7 +1006,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
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


