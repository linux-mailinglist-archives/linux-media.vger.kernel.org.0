Return-Path: <linux-media+bounces-40178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25612B2AD8E
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 17:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DDB5189F305
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 15:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9183375B6;
	Mon, 18 Aug 2025 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MfDBFtmH"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013057.outbound.protection.outlook.com [40.107.159.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4253375B2;
	Mon, 18 Aug 2025 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532708; cv=fail; b=GuUguPoE2JQsdzuEqfMCSyvyw9KL693VKm3Gyr9aY4WPJtlKLsxCohFST9/kfIfL062JMiXl9i3SQXaw9mS7X0Ws5qEZPwGLeKHlPHnkbK0FUzJeR1/Hwtthay8VauhXc/+SLtm17PWlTM7uDtaMs68ig/PpgmwRhf2CnEQYcdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532708; c=relaxed/simple;
	bh=EcRc4kWkd9C1aVKIw+P+epvf7ZLJFx2nBjHDkH62Q8A=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DtsvU8es52DOKPmWXBx8vlxbnkKBAQOdgjFhRnNVYLrqDl+Tdv/5ltR3RNAtFm/RHSIy30FALRPCGM7Zu6ET7s4/p19YhiJ77P2ptPhtwwdZ2nAjEDNgzK7/76++SLmoqKU4qe/rjVLU3d8Xp8pdQF7DOM3B7dM/9dgi0bhixC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MfDBFtmH; arc=fail smtp.client-ip=40.107.159.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqSoqGsVX47JXdg/5+TukoxCgzcHx62o0PuJ9q+l7tuyGmi4JX8iidEaLhwBTJkUcQweZJKvUIWm6ejUCRfxuEBOzZoB8CxDHzM+iTh1ijEvhkw4/pjlFZZLS2MvW1DSFdXQcpM4dl1fjyCW5lHfFx5yOq55VPdn0YF4Q7lkQPv1xhVsutqPxnoDKVD6kc39HUtUwakk5SHoJmSzbjYOoIG7cjZ5DluWyDGt1lusF/siXUVbPMcFJJqDRiCJ7cvFgHkOTbyEm7FQVPAn74+gsLG8HFGpDGbn6PiFEuOe+YTOCU+eZPDP+f5lavrrxQi7gZ3I6VEAW4nKtBnNw/uvtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KuTmezmfNoTdgil6mwM1WF/yhbalJWo7liAZq73mXc=;
 b=kesKaGf+q4kSFjTzxTmi2lDQkj3EyvPYEL2IisdqyD/TkYr4jiLwi397E7k6JpBj/Yb5W3DF1osdkZtJbp5lrnnpdybR3cr5b5LyNN/BWXO2omUmKP4fIb5lea75yvo3Ck9ep62oxMv6kMjUsHkO+iJFzPu6+gBtgBdUtyhMY/rEmlHGzlEZfMxIcpuTw1rt5YybDO0Tyzbx1wVpXJ67b8eeVH7oOvd9HjSF0xF2dNs3AunQxeIADPdmx4U8qYtgcy0LLKGHgzXEjL+2u4RiRJImTEw9RKE3SFkBERdmh+VF3F6U6DbnnzDqPDI2klKBm6PsEDXhzHHWtlWXnTeeQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KuTmezmfNoTdgil6mwM1WF/yhbalJWo7liAZq73mXc=;
 b=MfDBFtmH7kJkc6cTa3nJxBbevkhNdkd57bXtNH4RoLqEBzjcyqcHu7ma3g019Pac0TcQCkm16nSP+57ac02yZFPL+WUXm/rATkxbKOZqy3UiG3ueJlnHOEMC2RYLeQP9YR/JhjuxfHclXapeWxFrjfYhw6B7O5f3+zNYXhJxB0M+stIM6VqTmRxqCfDA2Bsv+9UWriYVIF62INrN/BC5lxsmnw+WRmtIb2WXtsm4Ui8KotEtKAC8sKtJNz3wgAJgOARqBBUkM1gAioPJUHT915oUSAj78CKtSfWw+BZLwGDbWUmJwdZ3QURfjlOc3Le+bMN07nJHcMEAkbOo4OSYVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DU2PR04MB8694.eurprd04.prod.outlook.com (2603:10a6:10:2dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 15:58:23 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 15:58:23 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	ribalda@chromium.org,
	jai.luthra@ideasonboard.com,
	laurentiu.palcu@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	julien.vuillaumier@nxp.com,
	celine.laurencin@nxp.com
Subject: [RFC v2 0/5] Add standard exposure and gain controls for multiple captures
Date: Mon, 18 Aug 2025 18:58:04 +0300
Message-ID: <20250818155809.469479-1-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0256.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::19) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DU2PR04MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: 480da01b-8b61-4145-9694-08ddde700f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L8cDcpVoL5kVXSCp8syMtK3pTtYb547x6xSsCfEVNFpuUjBr8WI2rxEGnJz2?=
 =?us-ascii?Q?9/brVHPerC/4P/wOUKYeRRNh3v4OWTN2QixxgKTneq3WL+c+NkSLGauRc3wI?=
 =?us-ascii?Q?QrF0gASS8UDtQ+XcJ63mrleqeIo1c94eFGjd6qyzms46hzP29jPkbEVDs7qc?=
 =?us-ascii?Q?pFiofpKErddIKFseIs8EoF2gPqDzGHHsCyZODbqXL+DypEQrX9gzQLzKECG5?=
 =?us-ascii?Q?6NVlT46SpkHYGdH5L53y7f2hX8XZWMGRWB5HW3rS6cAkmz1OLBRsB71LisVB?=
 =?us-ascii?Q?jsCGxfRMha2t2zNiiEjXxW/YA2ZKPcmNVRymCCPAVPp0w7BQkG3Lzs6FZOfE?=
 =?us-ascii?Q?TyoNZGFmIHTWwoRQhPaVWt9hOpT3PRmM9ET6mF2UY4QuUZgl59RqRQcOOFsu?=
 =?us-ascii?Q?xVTqTDNNw9+ekAqLpPzHU65MzaivDvMdt/cqNLwYab7tb4RTnyWhCpJ9PS5R?=
 =?us-ascii?Q?BfsQMvzFCZvoAtEJJiCymniO6bFO2WxCBT2MpJpXldzWXenhuizpbRW8xSQ2?=
 =?us-ascii?Q?mYJEbSTrQfD8oIwi+DqoLizTdiid4FrAirBRXbV443uUK99VV8a5/OuAlWrf?=
 =?us-ascii?Q?fgcbkCWWKqj7KkTKehp8bCMpSVvDUzQgWcHnJgSe7/QI0oCSFycOhNesmufM?=
 =?us-ascii?Q?b1MNIZCZlMkZNL5P7JOgIQ9y81OfW1HEGENC4grVdte4wS+JGzivJYOmgPSX?=
 =?us-ascii?Q?4vRVbS4/0F5iztnzoPApxt0D3IZ2Ber2LXqW2y8Rkw1RAVpolC1HINi0sw2W?=
 =?us-ascii?Q?3gNxvwHqMRr9O+mFaZ70Z2eA//og/BJCoRgNUBRg5FD/KjkjCoT968ncJ/WC?=
 =?us-ascii?Q?go7GTnJM5LE0abgEbuvpSjd2FVP36psBbUa71KCRmtxvrjnzYHbfea4nL9Y3?=
 =?us-ascii?Q?vqsiHSFk+gOSRQ85uwM5NHcdXc7hndeLmZW9LRlGNI55PWETUJYUeI5UeQII?=
 =?us-ascii?Q?0YOZa8RH9TMelcW2sHmOuJanf/VCz1aJLrsuKvyIFvqvJfGb+l7t+fdOWDE3?=
 =?us-ascii?Q?fRwi4IarMi6o3thtJfzukp39GDykuyaxD0cP59jYepaJiSF00630/KqyRrC9?=
 =?us-ascii?Q?vBMQAFkCjkW14jNPQXiUDq4pkcABtOmpBD7hFwlUw4tSx3NT0Vaq0CrgnaSG?=
 =?us-ascii?Q?onzGF7u/C1N8qz/gWLsEE8RWo72oetC/WXS1u3XeyFur/lm4PDTiKYf4heV5?=
 =?us-ascii?Q?b8uAj7jtZY2s4pAGo19Qxdu/dA3K1hANNfqHJh3bZ4Wv5H/AFFKPuNFpmuW1?=
 =?us-ascii?Q?lGHIV0lThdnvN79Irhf560Y0o2sxRw93oteh8MeHwBwdUp3LElKRUN+y287w?=
 =?us-ascii?Q?dlyg12tb4AeZJmWSK/kA0caEbvB8DJBDMNOGmDufLBS/K00vFO9xCg95Fp/a?=
 =?us-ascii?Q?g3whrR1GfLkY2Ou7GNZYcO2TERP8IPf2Wv8defc2/Ne/6/i1nwko2huunmwL?=
 =?us-ascii?Q?mthy2uQPwbe+2XFKU+NnZm1VUlTOptXuSSoAFMJW2/j5Lx6620Azvg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j2WeOthmPRiIC4kj+kJnIvloppGanD5OZ4zCbCYim8YzZIyzxKXZO8K6orBr?=
 =?us-ascii?Q?hglNX3eXcM7OLHbzVeQHr3NU8xZNjUolLX5LoaE9PK85Ij5vG13yqLbwujE8?=
 =?us-ascii?Q?9Fgrafedbn7ISlp2M2PjbQLSQ0z1jw9oMQ1HjxDx7udRpouw8HD8Q4q+qsj8?=
 =?us-ascii?Q?/97D0IXjBaGkD44xvYdsVbKUmWETm97v5LKVEkaqgDgYLNxtiXTy9nJaRWNW?=
 =?us-ascii?Q?t71FIFbSghpG7tFQLiqSs8HTnlOUckk5zGsqVAPFPu/oDqXBzZgCXvBTfdyf?=
 =?us-ascii?Q?QrbGap7uaJJJ/R2ZJN0R/G0YajQTmx4t+tJFh+kkSRvhsmDvcFmcj8Ab5wt5?=
 =?us-ascii?Q?UBCLuUKS2WuAXX234FDw2k5JpveTr2HJtshz/cc11WowsQDuUnlb43HT/dSl?=
 =?us-ascii?Q?vamfvMnIZvjBjUPdoMXzESsUo6CzKFLoBYHDV7mNfn1ebR/ziEPWoxA5oR6p?=
 =?us-ascii?Q?r1c1ZrlAmNBgEPTE7A7tiSoenQI1aIQHXrM3FCFJzN2DTNjr5Lbqx/qE3fNS?=
 =?us-ascii?Q?noQ6UTk8Odrga/mMiSX2hFvbgRNNw6DpvkJFmgvRoqiMO3Mh76bbSDLlLdif?=
 =?us-ascii?Q?zTQr/k8lGDnRqVZxucYh+8zjLq0P/dcLQ8KHdr138GNOgjwo1NSqXVOoFb16?=
 =?us-ascii?Q?xl0hDqjGRRb5vEySzHhOSPt1he35cuctolo7ac1XvQ59hKxDrxy6D6A1O7pM?=
 =?us-ascii?Q?327Pf47hak9BkDBgmq+bQZ7gWCpyjvV2oT5q1Bx9fsZbw1FyRAINr2vCf0e2?=
 =?us-ascii?Q?XP4pZAaYab0MatQ6kHo+RJsndS3KVyisXJgtZesOkhE0wH36WQUumme6UjDs?=
 =?us-ascii?Q?htGkX3H5geRqGMQ9CE2Yih5XIZIy5TVhZwtzXUDpX6sIUxwM8pGf1ijU/s56?=
 =?us-ascii?Q?bjzqbEk1IsasjkU/FFik6bAmn5Yc7WFGhMKY9TycT9U9D10nWzQ57nGe+jMC?=
 =?us-ascii?Q?QAvdiOOaC/N/TvN2vsvjCV+cTKBF2/WH8wKZkaDDAQFQqbTTMiIS6qPjTDN0?=
 =?us-ascii?Q?Rl4Me5UTRw17a6+k49HN+jptterZ292io18/6QlPmdiibrVBx4JDMY68PSO1?=
 =?us-ascii?Q?TQTMGpTCO52uDXz4M6plO5PgLR5Tl3gbq7wufUTRn3rWRKikuGzkFsM7yI3W?=
 =?us-ascii?Q?zNV8BieJWaJ3TSca/nQtHP6bqIpBB+FQSwVoIjwtmFa2HM2LvL25EPn/A4Bs?=
 =?us-ascii?Q?yaE683xDtrWszrksA9NKD+mpQqmIR2hZfDX7KG+y2Wi6gDSLhQxQ09dMawQC?=
 =?us-ascii?Q?JFdF4erhuF0zvikoE3hFzSpX0G+Iljvk4zSGPoMMZmzcAefR9Zd40wjZciF+?=
 =?us-ascii?Q?riof3WMkGBez0r2tzF5EOHr6sxv3Y+vT9JAA8jc29EXzrzEuHo+wfpHABiyA?=
 =?us-ascii?Q?ACpptdcale+C9JpQdMxTG+g8LQu+bz9qoqKOy2RNZC5XmUGtZLwWR7ZEgTDt?=
 =?us-ascii?Q?h27iujZbSYYtQhK7Tb1dZFREJ7aod+ere7HPCC3u3TF4XC9NLZWU0LFYUNvC?=
 =?us-ascii?Q?p5lTjVlDQSyEZm/nEznkZYYNKM0ifKrW5BEcLrR6ZHveVmb/2JKB/Y0r5HHz?=
 =?us-ascii?Q?dDOeVjPFYbMaReqPXX+8V86iZSFqdow7ALSWnQtEw+uJEpJwhCOp1B0kAWTv?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 480da01b-8b61-4145-9694-08ddde700f4b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 15:58:23.3924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kx24deGzRZU10CI/BWN1tT9x8DwR2y3/j08qbo/BjmqLz0o5iPxK1faMd8BgUFICYtmokCTXBtFtF5XcWmLSDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8694

All controls are in the same class.
They can be set atomically via VIDIOC_S_EXT_CTRLS, this could turn out
to be useful in case of sensors with context switching.

Each element of the array will hold an u32 value (exposure or gain)
for one capture. The size of the array is up to the sensor driver which
will implement the controls and initialize them via v4l2_ctrl_new_custom().
With this approach, the user-space will have to set valid values
for all the captures represented in the array. The order of elements inside
the array is from the longest to the shortest exposure.

The v4l2-core only supports one scalar min/max/step value for the
entire array, and each element is validated and adjusted to be within
these bounds in v4l2_ctrl_type_op_validate(). The significance for the
maximum value for the exposure control could be "the max value for the
long exposure" or "the max value for the sum of all exposures". If none
of these is ok, the sensor driver can adjust the values as supported and
the user space can use the TRY operation to query the sensor for the
minimum or maximum values.

Changes in v2:
	- Update documentation according to review comments
	- Patch #3 adds v4l2 helpers for backward compatibility with single-capture controls
	- Patch #4 uses those helpers in the v4l2 core functions, 
	  to aleviate the backward compatibility task from new drivers implementing
	  only multi-capture controls
	- Patch #5 is a less aggresive alternative to patch #4, without v4l2 core
	  changes, but which requires more actions in the drivers, including a s_ctrl
	  implementation for single-capture controls, but using the helpers
	- We will have to pick either patch #4 or patch #5
	

Mirela Rabulea (2):
  media: Add exposure and gain controls for multiple captures
  Documentation: media: Describe exposure and gain controls for multiple
    captures
  media: v4l2-ctrls: Add v4l2 helper functions for single-capture
    controls
  media: v4l2-ctrls: Use the single-capture control helpers in v4l2 core
  media: v4l2-ctrls: Add __v4l2_s_ctrl_single_to_multi helper function

 .../media/v4l/ext-ctrls-image-source.rst      |  21 +++
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  28 +++-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 120 +++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   8 ++
 include/media/v4l2-ctrls.h                    |  93 ++++++++++++++
 include/uapi/linux/v4l2-controls.h            |   3 +
 6 files changed, 268 insertions(+), 5 deletions(-)

-- 
2.43.0


