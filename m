Return-Path: <linux-media+bounces-40182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90860B2AD98
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 18:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB5F218A5B88
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 15:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD18933A009;
	Mon, 18 Aug 2025 15:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EgN/0kdu"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013033.outbound.protection.outlook.com [40.107.159.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466043375A7;
	Mon, 18 Aug 2025 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532719; cv=fail; b=IGfDvSxq900T/WyUiWsnNqBv7C3ClXjttmJFyTrsWbHSeKTl8dhqx4k0ODTn32qEtLGtAwTpUXawODjF1X1ZtgKYXBOfZrZti0nP4darz3OVQ7uQD4aXQ8iykRpFyLHpjoRxeJ9GnbgBUiwvKNQ0A5J9sSBrw3pIEg3O0jolpDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532719; c=relaxed/simple;
	bh=PHVg7YDloTRdtlb/n5GleyKS6rJ9797U7BPYk3dLaOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bynWaIeXYZFRtYE+4kynrMZc1SIt86531gwLRl9jMJ3nAVJ00nhpU70PDGEumeTGO7X1GEOc4xumANTF1dXHyX116+WwXL69NGAr2cAb/mbrrgU+ecQ2SRMAXE6prWB7FVBf/Gegic2/Nal8mBx8tPxjz13KF9XkhNKRL9D8qS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EgN/0kdu; arc=fail smtp.client-ip=40.107.159.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZ24K9Kj3V3VnBpEEDCnRWQFeVsmDLq0XvYEIBviLBX7bWicuXwbrS9Sq8eh2BRz6CGeS7GvcqoDd081g4iOI25JkwioVuiFukbKbWFGhu28/EvTNHG78N9uwVrtUYn8GdDKctl0J1mS2/rEld1vsHIFgfX5RqE//SgcBdG1hzSeIqKMQAY45JADzt7BhNANtv4/vHE6kgM5gJEiG9yx1J3RYqWL4Whur3d/pYmZqvzoVwWyVEBAwNdxI0Y/1Vs/Fx/IWdsLulejbxhvotSYF+8TFh5k1eVIWsnc64O9j6XLh1FBdTTXhiEb63EnPa0GI2zeneR4543zgzARj/j75Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+G6gmO9vpu5cn7zFjW+eMCDWqeSBXLIZnddwGzN1LLU=;
 b=cRe81Id9fHO7MoT57d+ryl+LnXbfKZVdroX6LEZCFelepM7BGTFOEeo2/JU14pnb98Oi9IyC0T6RMBh3J5Q9exAb0mv/gWz0vOSck9bHdxPtPZV4LNNgJkUN/0BTSJU9oDJ0X9m977crmlZlZ1c8K2d+d5Tg2s74hdXr5rVj2Pa6x0WZ0gH/+8DNspq59EIt6qpuTfaS2YX/xuN2UUU87daZ2DokTXXmEz1LIOR8/4sG+j4KYNEV74b+o+VHapxDajNP84ekF37q2mDytRg9HziLBKu3o/rlkCbxjdeUkz3OiIwjiZ4E93+K82aNQV26yUP9h6tswKqcyTxrl6wtxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+G6gmO9vpu5cn7zFjW+eMCDWqeSBXLIZnddwGzN1LLU=;
 b=EgN/0kdua9JpwsA8L8aSh/0QMJ0v315EHIQuS/KvACoIFFW5zQpWw9xSR5T4tfEUj1Gqt2YVbj8FIIy7nYE9t9aYvkNTeS6KciPaukXwYgapv40bwlyC8RvVNqxp73jvAT+DM3X4XznkM9w7H+FieDheQK+LsL1+OuNro/SabPa/pLiV9HdmmrexKce8VRMf1eRdw7DI2NH+jJKTiXnFtIgDhaOJpPBPMYgwC2PTysALPC0yM/ZdWlAK9wZ3JtdiTp+xUrLOvwy92x1lgHPmXhuX0BDqv1A+0DQIA3N3ywZzuKmCFNKchYG8wSBkofcJt6bKniH5d+drfFYEBw9Y5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by GV4PR04MB11305.eurprd04.prod.outlook.com (2603:10a6:150:297::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 15:58:30 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 15:58:30 +0000
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
Subject: [RFC v2 4/5] media: v4l2-ctrls: Use the single-capture control helpers in v4l2 core
Date: Mon, 18 Aug 2025 18:58:08 +0300
Message-ID: <20250818155809.469479-5-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818155809.469479-1-mirela.rabulea@nxp.com>
References: <20250818155809.469479-1-mirela.rabulea@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|GV4PR04MB11305:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e17a3c-e7da-45cd-27f5-08ddde701387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wDK3PKayVTgZoAnf7RaygAy/JHrDgrQc+zpTjXL5lcsV0K2N3/h0rTX5oaqh?=
 =?us-ascii?Q?Fw0uhW1yzxaFGuc943/OMUDjlqXUDPUFebm2NeqBPwcpTGJp0T/pKD/hyDBO?=
 =?us-ascii?Q?TOi/K+/FkRRBGupZktIyz5LbEIH7Tl0/MSzNNoWkTXoiKlGeH689xC74FmxI?=
 =?us-ascii?Q?1pqO6xzLF4Ez+X9r1rdxKSqYZlDjqeFynkjrDu3EsmjGrcRFNzj7wR8jLyly?=
 =?us-ascii?Q?soXsn6Y7op7l+N7AoipEMTyIX6VDklWtxcTMeba9UBXdxW54qlRehKQCOUv1?=
 =?us-ascii?Q?NkC1VIW25hq6MwGR0pX+7jUd0NcOyZGJfCKKSdwEGF21m6WZLfCKj/m8k5VC?=
 =?us-ascii?Q?3Vn/pOQtfMbEjZQYi2MmIOi2e1soTymgnmvbx5CRF504lQf0VK2/A8kNZIMI?=
 =?us-ascii?Q?SyTY77YdjYPJc4sNguLSoTYD17rtmn1zZEJjyrpk/e7WBCnrUne0BUUz8u+7?=
 =?us-ascii?Q?jtqHKyPN7Gsfquqfm16dW8VheRJsxFETB+SIkH3csRWirfo2/ft4JHsnXT6s?=
 =?us-ascii?Q?39hvJW6OU9wiIvtdjbC5Jc0hYpdzC3hMl7bDO4LQelxbzs8d3M+xOukfztzU?=
 =?us-ascii?Q?zsYR316JcrKqwlob5Asjx3hQAgj6vIUvSC9HEFOnBolw+b7WZbemm2Ne7upr?=
 =?us-ascii?Q?L7nPQtnpzwN+zyJMrH+q90z7YQIzC8SQ/AeQbzRGFkDS8nixtYAtbQl25wPL?=
 =?us-ascii?Q?aD7f3D2/7/pNzpJdKc69p2xkMiIBxbLj6jBBYnjxbBQ+Pq7v/W7HOkaLmtBB?=
 =?us-ascii?Q?HeopnGmcJDoboAlRjZvysiTjGwulCwfJIe/TttjX7X3v7GDKm7lKNLR+wfvK?=
 =?us-ascii?Q?1K/qi2lCIDfkc3fWSuppP4KkyEUtCvP9TUhm2pY/ss9MyrADYTYcwx9Miph+?=
 =?us-ascii?Q?Dd5Lh4ClO1EDdd7rMPGBbSQhq8tj4TgEV3nvv/z4qPPEyvJJDkpYadWbv+pD?=
 =?us-ascii?Q?5w39U/RLe7HT/YVBLyB7pnc61XXVcC5QPQvQ5NYSVUd2HoVwWjLgtttnZShs?=
 =?us-ascii?Q?luKnOv6OX2+eWAkV0fp1dFZ0AZYl69/P8n2p1euRBQmTxusmZuukWmNPRCIa?=
 =?us-ascii?Q?r3mW8o3K8N3xOLQXUrgDLFEP7UYqcd0d4kWXdGdjdy86tqrHvdCt5XfIdNAZ?=
 =?us-ascii?Q?GKNZWYf1UPdjyVdC9vWb8nme0d5bk0xTYkcoePUnLucyb7bVilJx+ADN8tEn?=
 =?us-ascii?Q?ssaeb2eSmOn1rgziO01EhomhgdTVKOLBBNoD+8bUjg5hhaHznw8/bkUb9Y7t?=
 =?us-ascii?Q?0ALg2Vex3D4MQIHFHiTkgbfmW8+ug5XidFS7hqdmoiw0bRiz6cUgzCKE4zvG?=
 =?us-ascii?Q?EDqyWh7Rd2o+Cj49yQ3nqBjKVTFi2LaVgCpz8MqEDX44yoQFSHPVbO5L8YwC?=
 =?us-ascii?Q?P6/rgneOfy6uDDbTBs7a+eY7VlLUI3HRIy85cXxTQprnu+EAwykciN1ch/b5?=
 =?us-ascii?Q?7OB/jSHEYJvEM7kFJhztYighgSuIFY0z2B2Tun2ONvxVVrYpNROSSg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lbwVk6Xx0Q9OapLyVfDYqM68zIZ0NAYXxGqUDrnMGaoU6CSxPCrLOG/DY/Px?=
 =?us-ascii?Q?1SCzxRZYf4DpH/ruzzWiypEpJcIEbU0qnxEzLA/Z8C/QUNLgIoPkJ9RhbZwU?=
 =?us-ascii?Q?3zKlgdeo6Z0ymVXbDPLufbalRNl68hjwepXxAJUz407tOSc2FmiX836GOeN9?=
 =?us-ascii?Q?wJjNrXr4bO91x6Ljih9q7QwXb5NQLAf+u+vWmEZeghWBVfpsiEPo0cCEaK8w?=
 =?us-ascii?Q?+2ZrYA+woHVL17BuawUhsJplAdQpSeOfp8AYsgjDExQyVoGrpPL2Hr70X+Qx?=
 =?us-ascii?Q?C6E9GvHUops9EmusU1SlyqCPBrVloFdJPrCXsa5RSlmNlntLdCrjIytGQpwW?=
 =?us-ascii?Q?PgFY4Btk1y3xdXgy1frTa3WzWpwU2s5/k02Xwyx+Su/WpKZJse47MnTEwqVu?=
 =?us-ascii?Q?OSPmmJb9LN0nm8cI9P42n4AXNQeapW96Upg3ZLuoXrAdKG1HVjZUupRYMpON?=
 =?us-ascii?Q?5Sfm3x90SidoSTk9JWGl/9dIJ15hazbucFmdXKfCYG0S3Lpa3PB+wkoAt5Rx?=
 =?us-ascii?Q?IPpLnuPUioofwWL/9O9gnhCz1az+DYPlMBvJiqY+q8vOX6Ic8TwuKRTH8Ux0?=
 =?us-ascii?Q?YpQIRDwnxYyzBvGA+jJKJKaWvUyqX7eqqrIdeaJPmcnxzFtsuBZ1hy++8maC?=
 =?us-ascii?Q?A7XiqwmMdi5wK6JhcKp6lrr8AI5rIfjGw+yU5rIzC6liLMjiuYxNlS8p9hJi?=
 =?us-ascii?Q?xTqBV2qBNq+9njfZhlaZf64GQzIBRB659zbjUsE07OrQAuhi2kBdfCl9Osuh?=
 =?us-ascii?Q?pL5wyuP8oBjMKE0sIID+WxZ3JTvQ4LZmLWo2dke5/keg2ODrioy4mFydfF9B?=
 =?us-ascii?Q?3IQE5qr0x0zDrqXmdDhNNfO/LnNz//bXEVm69UidGF8RmFaWasAcneyZhImn?=
 =?us-ascii?Q?wOB6nnKg6GrEsL6i5HDv8Fewg9CUeFmAV6kB/IqA/IU6tTLSrjz3Wdru8EcY?=
 =?us-ascii?Q?J1S425k9eQ5GJmpWK2c2rnDdyZSurmkhpPIWsf5TjjfBx9+J407fCcO6oD/o?=
 =?us-ascii?Q?vzMHbnWZHw6dDniaY8vgrhb9ZGrx/xmxNv7w+qGatG5Hl7zfPCPdBf4vw81G?=
 =?us-ascii?Q?CwpGafGypPb2d/YI/VSAre+1w0UupeIPzgHjGJvtma486lezbibOcF1EFPZb?=
 =?us-ascii?Q?WxuCfMleyTtCrTUnxT5jEpSmqkkPLX3Y1m8xTyR3B2pADzeC6GExPf4rBhC+?=
 =?us-ascii?Q?U5Q4jAWIowTdEcyYLbesbZnx31dLHB6G5Jt22yFTAtba3iRz1wFGfLOvsAQN?=
 =?us-ascii?Q?o+F9nu2dJfQLrOfwRahlh1cfH2PDCRcUQEQi8mp/8s5EtMX6Hr8d3w2hVBMf?=
 =?us-ascii?Q?8ZAlY+Z+WiSWy9fvJMp2ai8Z02jvQq06RKXi9tpmOhbgxXNza9R1McAkh4zh?=
 =?us-ascii?Q?RjjD6O1eqi+TGVBhaPfWSrwJoeLN1XT2wWp8E6q5vkBxnuOVhaolFXdaRHME?=
 =?us-ascii?Q?tOtoIRtIdzTabcG9WzBYJSQay1jr4+RnUKKdJPChA7C96RIv3D8LBnVGiY2c?=
 =?us-ascii?Q?1jAuFG+ABfLMJe6N36HuliqCHP+Zdu4Ky1JNkV443VYREoF8+XLub7xRoQBx?=
 =?us-ascii?Q?0LhZUK3E2AllqqhRaWOTf/su4anzbULDM4Fg/Z0GCbzJQeJfOLwoEP6USt+o?=
 =?us-ascii?Q?pw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e17a3c-e7da-45cd-27f5-08ddde701387
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 15:58:30.4659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +knGgv3HgTXzRznDbGw8xvfvPDOTmG/xh3ESmm00NT9e/VSfPt3yDOFqbLNI6CtBBQEMRJ+0lkalf3CXrS8LRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11305

Use the following v4l2 helpers to support backward compatibility
with single-capture controls, such that new drivers that only
implement explicitly the multi-capture control won't have to
worry about keeping them in sync with old single capture controls:

__v4l2_get_multi_ctrl
	Used by the v2l2 core in try_or_set_cluster and
	__v4l2_ctrl_handler_setup to redirect s_ctrl towards the multi controls
	instead of single controls, so that the new sensor drivers do not need
	to implement the single-capture controls in s_ctrl.
__v4l2_get_single_ctrl
	Used by the v2l2 core in __v4l2_ctrl_modify_range, to modify also the
	range of single-capture control when multi-capture control range
	changes, so drivers won't have to worry about it.
__v4l2_s_ctrl_multi_to_single
	Used by the v2l2 core in __v4l2_ctrl_s_ctrl_compound, to transparently
	keep the value of single-capture control in sync with the value of the
	multi-capture control, so drivers won't have to worry about it. The
	__v4l2_ctrl_s_ctrl_compound() and __v4l2_ctrl_modify_range() are
	usually called during sensor mode change to update the exposure
	according to the current mode, the sensor driver only needs to update
	the multi-controls, and the v4l2-core will update the single-controls.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---

Changes in v2:
	New patch
	We need to choose either this patch (do as much as we can in the v4l2 core
	for backward compatibility for old userspace apps using single-capture controls)
	or patch #5 (let the new drivers still implement s_ctrl for single-capture controls,
	but using the helpers, also driver needs to take care to keep ranges and values 
	in sync)

 drivers/media/v4l2-core/v4l2-ctrls-api.c  | 28 ++++++++++++++++++++---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 23 +++++++++++++++++--
 2 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 49a5c7538a09..4f4cb53b8fb0 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -947,6 +947,8 @@ EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_string);
 int __v4l2_ctrl_s_ctrl_compound(struct v4l2_ctrl *ctrl,
 				enum v4l2_ctrl_type type, const void *p)
 {
+	int ret;
+
 	lockdep_assert_held(ctrl->handler->lock);
 
 	/* It's a driver bug if this happens. */
@@ -956,7 +958,14 @@ int __v4l2_ctrl_s_ctrl_compound(struct v4l2_ctrl *ctrl,
 	if (WARN_ON(ctrl->is_dyn_array))
 		return -EINVAL;
 	memcpy(ctrl->p_new.p, p, ctrl->elems * ctrl->elem_size);
-	return set_ctrl(NULL, ctrl, 0);
+	ret = set_ctrl(NULL, ctrl, 0);
+	if (!ret)
+		return ret;
+	/*
+	 * this can be removed when backward compatibility with legacy
+	 * single exposure and gain controls is no longer needed
+	 */
+	return __v4l2_s_ctrl_multi_to_single(ctrl);
 }
 EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_compound);
 
@@ -968,6 +977,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 {
 	bool value_changed;
 	bool range_changed = false;
+	struct v4l2_ctrl *ctrl_single = NULL;
 	int ret;
 
 	lockdep_assert_held(ctrl->handler->lock);
@@ -982,8 +992,11 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 	case V4L2_CTRL_TYPE_U8:
 	case V4L2_CTRL_TYPE_U16:
 	case V4L2_CTRL_TYPE_U32:
-		if (ctrl->is_array)
-			return -EINVAL;
+		if (ctrl->is_array) {
+			ctrl_single = __v4l2_get_single_ctrl(ctrl);
+			if (!ctrl_single)
+				return -EINVAL;
+		}
 		ret = check_range(ctrl->type, min, max, step, def);
 		if (ret)
 			return ret;
@@ -1015,6 +1028,15 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 		ret = set_ctrl(NULL, ctrl, V4L2_EVENT_CTRL_CH_RANGE);
 	else if (range_changed)
 		send_event(NULL, ctrl, V4L2_EVENT_CTRL_CH_RANGE);
+	if (ret)
+		return ret;
+	/*
+	 * this can be removed when backward compatibility with legacy
+	 * single exposure and gain controls is no longer needed
+	 */
+	if (ctrl_single)
+		ret = __v4l2_ctrl_modify_range(ctrl_single, min, max, step, def);
+
 	return ret;
 }
 EXPORT_SYMBOL(__v4l2_ctrl_modify_range);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 41f307e3afa6..8d706070c041 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -2478,6 +2478,7 @@ int try_or_set_cluster(struct v4l2_fh *fh, struct v4l2_ctrl *master,
 	bool update_flag;
 	int ret;
 	int i;
+	struct v4l2_ctrl *master_multi = NULL;
 
 	/*
 	 * Go through the cluster and either validate the new value or
@@ -2508,7 +2509,16 @@ int try_or_set_cluster(struct v4l2_fh *fh, struct v4l2_ctrl *master,
 	/* Don't set if there is no change */
 	if (ret || !set || !cluster_changed(master))
 		return ret;
-	ret = call_op(master, s_ctrl);
+
+	/*
+	 * for sensor drivers that no longer handle single-capture controls in
+	 * s_ctrl, set the corresponding multi-capture control instead
+	 */
+	master_multi = __v4l2_get_multi_ctrl(master);
+	if (master_multi)
+		ret = call_op(master_multi, s_ctrl);
+	else
+		ret = call_op(master, s_ctrl);
 	if (ret)
 		return ret;
 
@@ -2590,6 +2600,7 @@ int __v4l2_ctrl_handler_setup(struct v4l2_ctrl_handler *hdl)
 
 	list_for_each_entry(ctrl, &hdl->ctrls, node) {
 		struct v4l2_ctrl *master = ctrl->cluster[0];
+		struct v4l2_ctrl *master_multi = __v4l2_get_multi_ctrl(master);
 		int i;
 
 		/* Skip if this control was already handled by a cluster. */
@@ -2605,7 +2616,15 @@ int __v4l2_ctrl_handler_setup(struct v4l2_ctrl_handler *hdl)
 				master->cluster[i]->done = true;
 			}
 		}
-		ret = call_op(master, s_ctrl);
+		/*
+		 * for sensor drivers that no longer handle single-capture
+		 * controls in s_ctrl, set the corresponding multi-capture
+		 * control instead
+		 */
+		if (master_multi)
+			ret = call_op(master_multi, s_ctrl);
+		else
+			ret = call_op(master, s_ctrl);
 		if (ret)
 			break;
 	}
-- 
2.43.0


