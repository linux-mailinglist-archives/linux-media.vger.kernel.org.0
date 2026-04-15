Return-Path: <linux-media+bounces-58810-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BFPOM9a32n1RwAAu9opvQ
	(envelope-from <linux-media+bounces-58810-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:30:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4DB402998
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D6D6E3072C7B
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C02344DB5;
	Wed, 15 Apr 2026 09:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="bGN/inVn"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021081.outbound.protection.outlook.com [40.107.42.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B018E3382F1;
	Wed, 15 Apr 2026 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776245169; cv=fail; b=f0822KFqG2I1srTqX+0r0TQN29pvxjDerVqUzVlnwakL8oXBzrVGYbg5uAh63dSjUeZyh9neOdISNY5kTsozC2JmdpMoi5HLMtFdLr9snMyPcHEN9PDtbFcpgAP70IlOzyu78GNTTukfocPR8Wzzte8VUUpzQbEvSHVl6oJ73Cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776245169; c=relaxed/simple;
	bh=CSrj1ZnABZ2uV+3JNSRI9KOjPbQszKCslWpZRswYwtA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TaP4JvSxB7n0CndcAcMLGQQqyaQYgj71dmrfS9Cin8Za1koPgaRyF+amEh0G1XXAhzVddA5SXZ4tL1XeI5PD/7kRf59iN+cjLCauYIuTjKnNQPIkTnYY2ILuPbCSR2Fubi6DCtSD8J1P/ceXtIXCHVlJwUWIOH5iSGZlWZxn21g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=bGN/inVn; arc=fail smtp.client-ip=40.107.42.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oG5C3WFLf8eNgL9EFwKXhMjEae/RnaijhJfnKUPG44SbUGeoGeKzIxXtG0hIjuuBmpGsaeZVVIpnZPInMJMi5ANaeoSIVF1BVI+82cnrYmqGLcSpFl60JqErZPje3DTy6QLoAjadzOFDCeoGqWRcqXQGg5L7ceLO2OWYVAKePsZyuUB/8ENZOKKCVgw7ghWMjnRqj3lHa26xHwCMt0rbALKe/bciCkLcnZZ1+yzvujZIi9U4rTuts0aNPODL+Cemhb9TCR17zGP7QLvctog2DQxxWICRWRI0z+1eCMJ6cdxl9toKIqvRRWurBUqL1O2KSRzWpui9Rsz/8MhSBwAb+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ab9QDhOseNW/TJVDQFhkYwneFHTIqGko9Inr/hrr34=;
 b=YmfGW5c4DBPf2XQBbCbmf8CIrPaSR71kHP22XGzkFB+APJY8mPYLyf/Ay415etinabwfugwcOlJSYMt5R2GWh6yPO6LQ2I9gGR7wuxpPGn/qnqz3xe+XzXS7/qArLAVPpq+KrBGDugc1BwhZw07GpU7xgx2nzUMOFXXXbaQmwNBD4f7j5S/bn4h9rRJaDdeig7osUV/SL2M/wyoN7j9/AGAVSjPtCDOULfL/I7kBgHlbWybfVX8lmiZaW5UQHAjxNNtYafs3LN9Kt+0GKYakGw7VpG29sSGZ5fnIohGWaykpXa+N75q8loDEbteOlqbAYZjVCyxcJNLO+Y3pQ1WAcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ab9QDhOseNW/TJVDQFhkYwneFHTIqGko9Inr/hrr34=;
 b=bGN/inVnwzkZs5nzv8Vg1CtVQDzWZv1W5sXIegyduXs4fCC+pPOIoK0vhHj0D9NOuMQ86HTwMr1d9wkhM5fSiIlv/ZlpCUL/6mfQGynBS+emwc36lo5Ir0nJezKlk2q8/8XMS5JOLFP6OK0mV4fHL8TNbirro5QOdEHDTeo68EI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SL2P216MB2830.KORP216.PROD.OUTLOOK.COM (2603:1096:101:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 09:25:48 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 09:25:48 +0000
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
	marek.vasut@mailbox.org,
	ming.qian@oss.nxp.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [RFC PATCH v5 8/9] media: chips-media: wave6: Add Wave6 control driver
Date: Wed, 15 Apr 2026 18:25:28 +0900
Message-Id: <20260415092529.577-9-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260415092529.577-1-nas.chung@chipsnmedia.com>
References: <20260415092529.577-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0163.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::11) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SL2P216MB2830:EE_
X-MS-Office365-Filtering-Correlation-Id: c1235186-c649-4cde-2198-08de9ad0fab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EdudsjupYrgbwM7FyEcBLeTQw2o5ZCW01BJFIHiH0bdn6/n3DOpjbZd0Us2v1ddhF3vQ/gBsf77cxHVQsLVckQ0F/K2pTuCQQAop6su839sfPqWQclGtZ41xD7gJHJ0uf43UhrfpOhqn5+8V17XvD2TJt8EZuiyH3vnbKv8weKNKxWdYAVvbKsgS153eCS8fgw1TEUhEN/zdpoPQIItbHvRgJMNkJtfK/saBIQquB8V5VpYrpbE+iK62ytY/2nYn7xDoxExhzZQgq09Aj3Yp+Ui1z/GxwOf9w+X4TVMLIlBGhy+/wGM6ZZv2y/UgRLRMvOqrR0jNi4IiVO43fuSm2HxNjneqba3Cb3eV7YBUXamy0Y4cSAPnqfQgIifMtfUvQq2ZNIDU9dQSfDX/CToOEulqoktVscqlhOE/B6zRWKRtkyk09WEdqcRqI7S5cVHEYbfSPCA/J58FhyIReKI64g+63PeRAEF3aTXld7xa8CkW6Xmbn2xU41G02BS6JYf0spdRgoILeoYgXR49eur26Pm+AzY2ZtbCq2DLTEjAkvpf+VWIRBR7RsXB8CCWcHVo5QGVcec1U1MKPKtJ21YZdzq0o7e70jHWeJqH81ceevl4E+9qx1Buvl7A/ceBltxG88iz/zaS0JkIuERN4UayHBmqlYSMUiB0DB0bJYbo4LHJEVNksEb26Ieo7MHW9edItAQBlsCpe323PDn9ab/fwuzVORzjBrkv5iPLhJgIPB7ls/tjrL6uKHNwzNvP70rfW3Lj3vzkgTbau+9RcJ8gyDORs2tnB+AWLfAQeTGwPgA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?whWA2iQe+4EureCr/I9WZed+lxVz+5HxgufuLpsNQ/wrNiZARbnC/fs470uj?=
 =?us-ascii?Q?F50SUBpgwPyHsLRQugFZNUcsOeA1mlbR8RI+LoxUekBVt5VP22IennE/Lh5o?=
 =?us-ascii?Q?9d64/imyLO1jz5/f6mKC5iK6Lo/+FQo1i6qbYeox5W5sUSmoiT59V5d6BWrj?=
 =?us-ascii?Q?raD7BH3AtxgUyqlrXMfrmuPck38A+aBZQrxQZOzThkKCxO4LZE+txMMupbZQ?=
 =?us-ascii?Q?ez7LLF+3ayYn7Wya4e8YnNQMbnl+djm08/EI55jfV/o7l9A1mury9F1aGFI2?=
 =?us-ascii?Q?URpwZKxRX9yx+IPYe4nh5dqaUMjDr/fXDannKSvE7mRrI/rBFJuJzBXphxVt?=
 =?us-ascii?Q?AXMvndY7d+Ud238YUNcIIqmgZiJBeeIzOP1ixsQkhgiBCy3TOWNPP/Z6DSxq?=
 =?us-ascii?Q?s6nNwWzZ4Q0SZfMxdqJVH3dKbdXthDw3d+shKfQvm2qOiR2MT7as9VcTiyS/?=
 =?us-ascii?Q?2izK1MrQcbjpbZTtFX7dgY2vsx7wMuKpFnPLpumxHmKX1JKPaRbwxILK/YYP?=
 =?us-ascii?Q?++PTQcd/E30XXtB2FawWs7z6xuMcNyhdPCT4h3t+ekT7qUr9XNhXI7WemoFb?=
 =?us-ascii?Q?qw5RgJH6yDSLVPQ8j86kyIS88s+RV+/XjX5KWMK3AGdnUspYB1OEVMx/oeXw?=
 =?us-ascii?Q?wfD0ujwa8EBpEWqthzIfssCfMoMPdW0FTyHTKyJW60ANeCjQbbvn64S+Y6wM?=
 =?us-ascii?Q?24ATh7R7Rj5Nmaph1oBi6BtMsLeH6zhD0Yxg6Rj29NfFiFzYA4BpfHvmEEfN?=
 =?us-ascii?Q?XoHFPUpbXmZXNgYe9jyjE69ygtUY4vJIkdzZnTa0eOu8sxfJwykLuFmX16Nk?=
 =?us-ascii?Q?Yr66jLsh2CZG9FGbCT05lHhbMAOhO96C5jlEhNYEgQ8xlWy1yO/S/9KZ2j2u?=
 =?us-ascii?Q?x1AojpbfGJ5R/gTLS1plHoU1g/9rUe0bg9C7Pz/HRg7PbnQebKB6aiYfYHF1?=
 =?us-ascii?Q?g3ijBn3P6SB4qpX6it+oyGwtFzRvUjSaesXm9iHs5JFJn2LmiAQBUfn7KTHz?=
 =?us-ascii?Q?408PRhYpKVWyxPrRzshu0gzQASUlrxKoTR7xrf8XZRlQsy4gg8iFktf2ZxqL?=
 =?us-ascii?Q?Fr7+e6xfiokRpiod9Y+TYk3x71gSHWepjX20BBzcWfw9Di0SHCLz35RcC8XT?=
 =?us-ascii?Q?ui6NR5gAnsSazOd087Jnfjq9CzygNZdTZWtL4Er46PjEjAMrGCFVixvJPgET?=
 =?us-ascii?Q?2yIOcXtaTJSsC9nVWOUO6itk1VGlx//Cu89FKTMBx9OidCAvKB6bO4uMaIGX?=
 =?us-ascii?Q?/RXbKhl7cniHkJqzoPryZwKrnuqgZYtYz9kU6wghGWvvuxBfHvIjHmucfA44?=
 =?us-ascii?Q?wDRBZaekuUO//te5RGFLulAD8Q8xukGMLcqW7YRo96ocdySpSONZSAUpV+h+?=
 =?us-ascii?Q?Za/mBdMBDcOOFL2hjN2AL7/Iy0SQnZ1TjV6MgXcNAS8TsXNg81SInv6RagiS?=
 =?us-ascii?Q?C3ko4+nQR9o8b5iNrI0ngmehvO47HLxZ2jCiF5k3I7FhN4iW6WeyU5tdQ8Cc?=
 =?us-ascii?Q?v9eCc8hv+MncrfuEoBjM0wulCntYA/1VIYfBc6ilev1Vax2rH9yK6pDKfWKt?=
 =?us-ascii?Q?BR0VHlRLOeYjmSIUjxGFhIww4HHMPLM6WmR9K1EhxZU6hoFg+M4IBwl5qwF+?=
 =?us-ascii?Q?JqcaNYmEJ51qOdEHFRvd/lcIr/+kBRD5BiCGPBO5O28b87Jik1GhnwucKFsM?=
 =?us-ascii?Q?8QxkUwXlZ3kKafwbZ1DShxFE5HwKdxUj1YK4cVXLr+h3PhAACwwoKnxyPWF+?=
 =?us-ascii?Q?lS/RPzjKm7Ljb03mUcHFK+5BS5SNkUc=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1235186-c649-4cde-2198-08de9ad0fab9
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 09:25:48.4514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddXzuc70tg97evwEJdqKo0Azqmp8yI6jV2tKrGt5U5znLNyS3LXInwsBBRKqgZIn5xwu95/+7HCqhTha8GdijcGnleaVBo/ozlYardfJ8nE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2830
X-Spamd-Result: default: False [3.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58810-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,pengutronix.de];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:email,chipsnmedia.com:dkim,chipsnmedia.com:mid,mailbox.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,info.data:url,info.id:url,nxp.com:email]
X-Rspamd-Queue-Id: DD4DB402998
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the control driver for the Chips&Media Wave6 video codec IP.

The hardware contains one control register region and four interface
register regions for a shared video processing engine.

This driver handles the control region and manages shared resources such
as firmware loading, firmware memory allocation, and coordination required
by the interface register regions.

It also instantiates and coordinates with the `wave6-core` child devices
for firmware and power state management.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
---
 drivers/media/platform/chips-media/Kconfig    |   1 +
 drivers/media/platform/chips-media/Makefile   |   1 +
 .../media/platform/chips-media/wave6/Kconfig  |  17 +
 .../media/platform/chips-media/wave6/Makefile |  17 +
 .../platform/chips-media/wave6/wave6-vpu.c    | 816 ++++++++++++++++++
 .../platform/chips-media/wave6/wave6-vpu.h    | 143 +++
 6 files changed, 995 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
 create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h

diff --git a/drivers/media/platform/chips-media/Kconfig b/drivers/media/platform/chips-media/Kconfig
index ad350eb6b1fc..8ef7fc8029a4 100644
--- a/drivers/media/platform/chips-media/Kconfig
+++ b/drivers/media/platform/chips-media/Kconfig
@@ -4,3 +4,4 @@ comment "Chips&Media media platform drivers"
 
 source "drivers/media/platform/chips-media/coda/Kconfig"
 source "drivers/media/platform/chips-media/wave5/Kconfig"
+source "drivers/media/platform/chips-media/wave6/Kconfig"
diff --git a/drivers/media/platform/chips-media/Makefile b/drivers/media/platform/chips-media/Makefile
index 6b5d99de8b54..b9a07a91c9d6 100644
--- a/drivers/media/platform/chips-media/Makefile
+++ b/drivers/media/platform/chips-media/Makefile
@@ -2,3 +2,4 @@
 
 obj-y += coda/
 obj-y += wave5/
+obj-y += wave6/
diff --git a/drivers/media/platform/chips-media/wave6/Kconfig b/drivers/media/platform/chips-media/wave6/Kconfig
new file mode 100644
index 000000000000..63d79c56c7fc
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config VIDEO_WAVE6_VPU
+	tristate "Chips&Media Wave6 Codec Driver"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV && OF
+	depends on ARCH_MXC || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	select GENERIC_ALLOCATOR
+	help
+	  Chips&Media Wave6 stateful codec driver.
+	  The wave6 driver manages shared resources such as firmware memory.
+	  The wave6-core driver provides encoding and decoding capabilities
+	  for H.264, HEVC, and other video formats.
+	  To compile this driver as modules, choose M here: the
+	  modules will be called wave6 and wave6-core.
diff --git a/drivers/media/platform/chips-media/wave6/Makefile b/drivers/media/platform/chips-media/wave6/Makefile
new file mode 100644
index 000000000000..06f8ac9bef14
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/Makefile
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# tell define_trace.h where to find the trace header
+CFLAGS_wave6-vpu-core.o := -I$(src)
+
+wave6-objs += wave6-vpu.o \
+	      wave6-vpu-thermal.o
+obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6.o
+
+wave6-core-objs += wave6-vpu-core.o \
+		   wave6-vpu-v4l2.o \
+		   wave6-vpu-dbg.o \
+		   wave6-vpuapi.o \
+		   wave6-vpu-dec.o \
+		   wave6-vpu-enc.o \
+		   wave6-hw.o
+obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6-core.o
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.c b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
new file mode 100644
index 000000000000..ca8dded9bf86
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
@@ -0,0 +1,816 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_domain.h>
+#include <linux/dma-mapping.h>
+#include <linux/iopoll.h>
+#include <linux/genalloc.h>
+
+#include "wave6-vpuconfig.h"
+#include "wave6-regdefine.h"
+#include "wave6-vpu.h"
+
+static const struct wave6_vpu_resource wave633c_data = {
+	.fw_name = "cnm/wave633c_imx9_codec_fw.bin",
+	/* For HEVC, AVC, 4096x4096, 8bit */
+	.sram_size = 0x14800,
+};
+
+static const struct wave6_vpu_core_resource wave633c_core_data = {
+	.codec_types = WAVE633_CODEC_TYPE,
+	.compatible_fw_version = WAVE633_COMPATIBLE_FW_VERSION,
+};
+
+static const char *wave6_vpu_state_name(enum wave6_vpu_state state)
+{
+	switch (state) {
+	case WAVE6_VPU_STATE_OFF:
+		return "off";
+	case WAVE6_VPU_STATE_PREPARE:
+		return "prepare";
+	case WAVE6_VPU_STATE_ON:
+		return "on";
+	case WAVE6_VPU_STATE_SLEEP:
+		return "sleep";
+	default:
+		return "unknown";
+	}
+}
+
+static bool wave6_vpu_valid_transition(struct wave6_vpu_device *vpu,
+				       enum wave6_vpu_state next)
+{
+	switch (vpu->state) {
+	case WAVE6_VPU_STATE_OFF:
+		/* to PREPARE: first boot attempt */
+		/* to ON: already booted before, skipping boot */
+		if (next == WAVE6_VPU_STATE_PREPARE ||
+		    next == WAVE6_VPU_STATE_ON)
+			return true;
+		break;
+	case WAVE6_VPU_STATE_PREPARE:
+		/* to OFF: boot failed */
+		/* to ON: boot successful */
+		if (next == WAVE6_VPU_STATE_OFF ||
+		    next == WAVE6_VPU_STATE_ON)
+			return true;
+		break;
+	case WAVE6_VPU_STATE_ON:
+		/* to OFF: sleep failed */
+		/* to SLEEP: sleep successful */
+		if (next == WAVE6_VPU_STATE_OFF ||
+		    next == WAVE6_VPU_STATE_SLEEP)
+			return true;
+		break;
+	case WAVE6_VPU_STATE_SLEEP:
+		/* to OFF: resume failed */
+		/* to ON: resume successful */
+		if (next == WAVE6_VPU_STATE_OFF ||
+		    next == WAVE6_VPU_STATE_ON)
+			return true;
+		break;
+	}
+
+	dev_err(vpu->dev, "invalid transition: %s -> %s\n",
+		wave6_vpu_state_name(vpu->state), wave6_vpu_state_name(next));
+
+	return false;
+}
+
+static void wave6_vpu_set_state(struct wave6_vpu_device *vpu,
+				enum wave6_vpu_state state)
+{
+	if (!wave6_vpu_valid_transition(vpu, state))
+		return;
+
+	dev_dbg(vpu->dev, "set state: %s -> %s\n",
+		wave6_vpu_state_name(vpu->state), wave6_vpu_state_name(state));
+
+	vpu->state = state;
+}
+
+static int wave6_vpu_wait_busy(struct vpu_core_device *core)
+{
+	u32 val;
+
+	return read_poll_timeout(wave6_vdi_readl, val, !val,
+				 W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
+				 false, core->reg_base, W6_VPU_BUSY_STATUS);
+}
+
+static int wave6_vpu_check_result(struct vpu_core_device *core)
+{
+	if (wave6_vdi_readl(core->reg_base, W6_RET_SUCCESS))
+		return 0;
+
+	return wave6_vdi_readl(core->reg_base, W6_RET_FAIL_REASON);
+}
+
+static u32 wave6_vpu_get_code_buf_size(struct wave6_vpu_device *vpu)
+{
+	return min_t(u32, vpu->code_buf.size, W6_MAX_CODE_BUF_SIZE);
+}
+
+static void wave6_vpu_remap_code_buf(struct wave6_vpu_device *vpu)
+{
+	dma_addr_t code_base = vpu->code_buf.dma_addr;
+	u32 i, reg_val;
+
+	for (i = 0; i < wave6_vpu_get_code_buf_size(vpu) / W6_MAX_REMAP_PAGE_SIZE; i++) {
+		reg_val = REMAP_CTRL_ON |
+			  REMAP_CTRL_INDEX(i) |
+			  REMAP_CTRL_PAGE_SIZE_ON |
+			  REMAP_CTRL_PAGE_SIZE(W6_MAX_REMAP_PAGE_SIZE);
+		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CTRL_GB, reg_val);
+		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_VADDR_GB,
+				 i * W6_MAX_REMAP_PAGE_SIZE);
+		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_PADDR_GB,
+				 code_base + i * W6_MAX_REMAP_PAGE_SIZE);
+	}
+}
+
+static void wave6_vpu_init_code_buf(struct wave6_vpu_device *vpu)
+{
+	if (vpu->code_buf.size < W6_CODE_BUF_SIZE) {
+		dev_warn(vpu->dev,
+			 "code buf size (%zu) is too small\n", vpu->code_buf.size);
+		vpu->code_buf.phys_addr = 0;
+		vpu->code_buf.size = 0;
+		memset(&vpu->code_buf, 0, sizeof(vpu->code_buf));
+		return;
+	}
+
+	vpu->code_buf.vaddr = devm_memremap(vpu->dev,
+					    vpu->code_buf.phys_addr,
+					    vpu->code_buf.size,
+					    MEMREMAP_WC);
+	if (!vpu->code_buf.vaddr) {
+		memset(&vpu->code_buf, 0, sizeof(vpu->code_buf));
+		return;
+	}
+
+	vpu->code_buf.dma_addr = dma_map_resource(vpu->dev,
+						  vpu->code_buf.phys_addr,
+						  vpu->code_buf.size,
+						  DMA_BIDIRECTIONAL,
+						  0);
+	if (!vpu->code_buf.dma_addr) {
+		memset(&vpu->code_buf, 0, sizeof(vpu->code_buf));
+		return;
+	}
+}
+
+static void wave6_vpu_allocate_work_buffers(struct wave6_vpu_device *vpu)
+{
+	struct vpu_buf *buf;
+	int i;
+
+	for (i = 0; i < MAX_NUM_INSTANCE; i++) {
+		buf = &vpu->work_buffers[i];
+		buf->size = W637DEC_WORKBUF_SIZE_FOR_CQ;
+
+		if (wave6_vdi_alloc_dma(vpu->dev, buf)) {
+			dev_warn(vpu->dev, "Failed to allocate work_buffers\n");
+			return;
+		}
+
+		vpu->work_buffers_alloc++;
+	}
+}
+
+static void wave6_vpu_free_work_buffers(struct wave6_vpu_device *vpu)
+{
+	int i;
+
+	for (i = 0; i < vpu->work_buffers_alloc; i++)
+		wave6_vdi_free_dma(&vpu->work_buffers[i]);
+
+	vpu->work_buffers_alloc = 0;
+	vpu->work_buffers_avail = 0;
+}
+
+static void wave6_vpu_init_work_buf(struct wave6_vpu_device *vpu,
+				    struct vpu_core_device *core)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core->reg_base, W6_COMMAND, W6_CMD_INIT_WORK_BUF);
+	wave6_vdi_writel(core->reg_base, W6_VPU_HOST_INT_REQ, HOST_INT_REQ_ON);
+
+	ret = wave6_vpu_wait_busy(core);
+	if (ret) {
+		dev_err(vpu->dev, "init work buf failed\n");
+		return;
+	}
+
+	ret = wave6_vpu_check_result(core);
+	if (ret) {
+		dev_err(vpu->dev, "init work buf failed, reason 0x%x\n", ret);
+		return;
+	}
+
+	vpu->work_buffers_avail = vpu->work_buffers_alloc;
+}
+
+static int wave6_vpu_init_vpu(struct wave6_vpu_device *vpu,
+			      struct vpu_core_device *core)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	/* try init directly as firmware is running */
+	if (wave6_vdi_readl(core->reg_base, W6_VPU_VCPU_CUR_PC))
+		goto init_done;
+
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_PREPARE);
+
+	wave6_vpu_remap_code_buf(vpu);
+
+	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
+			 vpu->sram_buf.dma_addr);
+	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
+			 vpu->sram_buf.size);
+	wave6_vdi_writel(vpu->reg_base, W6_COMMAND_GB, W6_CMD_INIT_VPU);
+	wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CORE_START_GB,
+			 REMAP_CORE_START_ON);
+
+	ret = wave6_vpu_wait_busy(core);
+	if (ret) {
+		dev_err(vpu->dev, "init vpu timeout\n");
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_check_result(core);
+	if (ret) {
+		dev_err(vpu->dev, "init vpu fail, reason 0x%x\n", ret);
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EIO;
+	}
+
+init_done:
+	wave6_vpu_init_work_buf(vpu, core);
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_ON);
+
+	return 0;
+}
+
+static int wave6_vpu_sleep(struct wave6_vpu_device *vpu,
+			   struct vpu_core_device *core)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	if (!wave6_vdi_readl(core->reg_base, W6_VPU_VCPU_CUR_PC)) {
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return 0;
+	}
+
+	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core->reg_base, W6_COMMAND, W6_CMD_SLEEP_VPU);
+	wave6_vdi_writel(core->reg_base, W6_VPU_HOST_INT_REQ, HOST_INT_REQ_ON);
+
+	ret = wave6_vpu_wait_busy(core);
+	if (ret) {
+		dev_err(vpu->dev, "sleep vpu timeout\n");
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_check_result(core);
+	if (ret) {
+		dev_err(vpu->dev, "sleep vpu fail, reason 0x%x\n", ret);
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EIO;
+	}
+
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_SLEEP);
+
+	return 0;
+}
+
+static int wave6_vpu_wakeup(struct wave6_vpu_device *vpu,
+			    struct vpu_core_device *core)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	/* try wakeup directly as firmware is running */
+	if (wave6_vdi_readl(core->reg_base, W6_VPU_VCPU_CUR_PC))
+		goto wakeup_done;
+
+	wave6_vpu_remap_code_buf(vpu);
+
+	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
+			 vpu->sram_buf.dma_addr);
+	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
+			 vpu->sram_buf.size);
+	wave6_vdi_writel(vpu->reg_base, W6_COMMAND_GB, W6_CMD_WAKEUP_VPU);
+	wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CORE_START_GB,
+			 REMAP_CORE_START_ON);
+
+	ret = wave6_vpu_wait_busy(core);
+	if (ret) {
+		dev_err(vpu->dev, "wakeup vpu timeout\n");
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_check_result(core);
+	if (ret) {
+		dev_err(vpu->dev, "wakeup vpu fail, reason 0x%x\n", ret);
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EIO;
+	}
+
+wakeup_done:
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_ON);
+
+	return 0;
+}
+
+static int wave6_vpu_try_boot(struct wave6_vpu_device *vpu,
+			      struct vpu_core_device *core)
+{
+	u32 product_code;
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	if (vpu->state != WAVE6_VPU_STATE_OFF && vpu->state != WAVE6_VPU_STATE_SLEEP)
+		return 0;
+
+	product_code = wave6_vdi_readl(core->reg_base, W6_VPU_RET_PRODUCT_CODE);
+	if (!PRODUCT_CODE_W_SERIES(product_code)) {
+		dev_err(vpu->dev, "unknown product : %08x\n", product_code);
+		return -EINVAL;
+	}
+
+	if (vpu->state == WAVE6_VPU_STATE_SLEEP) {
+		ret = wave6_vpu_wakeup(vpu, core);
+		return ret;
+	}
+
+	ret = wave6_vpu_init_vpu(vpu, core);
+
+	return ret;
+}
+
+static int wave6_vpu_get(struct wave6_vpu_device *vpu,
+			 struct vpu_core_device *core)
+{
+	int ret;
+
+	if (WARN_ON(!vpu || !core))
+		return -EINVAL;
+
+	guard(mutex)(&vpu->lock);
+
+	if (!vpu->fw_available)
+		return -EINVAL;
+
+	/* Only the first core executes boot; others return */
+	if (atomic_inc_return(&vpu->core_count) > 1)
+		return 0;
+
+	ret = pm_runtime_resume_and_get(vpu->dev);
+	if (ret)
+		goto error_pm;
+
+	ret = wave6_vpu_try_boot(vpu, core);
+	if (ret)
+		goto error_boot;
+
+	return 0;
+
+error_boot:
+	pm_runtime_put_sync(vpu->dev);
+error_pm:
+	atomic_dec(&vpu->core_count);
+
+	return ret;
+}
+
+static void wave6_vpu_put(struct wave6_vpu_device *vpu,
+			  struct vpu_core_device *core)
+{
+	if (WARN_ON(!vpu || !core))
+		return;
+
+	guard(mutex)(&vpu->lock);
+
+	if (!vpu->fw_available)
+		return;
+
+	/* Only the last core executes sleep; others return */
+	if (atomic_dec_return(&vpu->core_count) > 0)
+		return;
+
+	wave6_vpu_sleep(vpu, core);
+
+	if (!pm_runtime_suspended(vpu->dev))
+		pm_runtime_put_sync(vpu->dev);
+}
+
+static void wave6_vpu_require_work_buffer(struct wave6_vpu_device *vpu,
+					  struct vpu_core_device *core)
+{
+	struct vpu_buf *vb;
+	u32 size;
+
+	if (WARN_ON(!vpu || !core))
+		return;
+
+	size = wave6_vdi_readl(core->reg_base, W6_CMD_SET_WORK_BUF_SIZE);
+	if (!size)
+		return;
+
+	if (WARN_ON(size > W637DEC_WORKBUF_SIZE_FOR_CQ))
+		goto exit;
+
+	if (WARN_ON(vpu->work_buffers_avail <= 0))
+		goto exit;
+
+	vpu->work_buffers_avail--;
+	vb = &vpu->work_buffers[vpu->work_buffers_avail];
+
+	wave6_vdi_writel(core->reg_base, W6_CMD_SET_WORK_BUF_ADDR, vb->daddr);
+
+exit:
+	wave6_vdi_writel(core->reg_base, W6_CMD_SET_WORK_BUF_SIZE, SET_WORK_BUF_SIZE_ACK);
+}
+
+static int wave6_vpu_create_cores(struct wave6_vpu_device *vpu)
+{
+	struct device_node *child;
+	int num_cores = 0;
+
+	for_each_available_child_of_node(vpu->dev->of_node, child) {
+		struct platform_device_info info = {};
+		struct platform_device *pdev;
+		struct resource res[2];
+		int irq;
+
+		if (num_cores >= W6_VPU_MAX_NUM_CORE) {
+			of_node_put(child);
+			break;
+		}
+
+		if (of_address_to_resource(child, 0, &res[0])) {
+			dev_warn(vpu->dev, "%pOF: missing reg property\n", child);
+			continue;
+		}
+
+		irq = of_irq_get(child, 0);
+		if (irq < 0) {
+			dev_warn(vpu->dev, "%pOF: missing interrupts property\n", child);
+			continue;
+		}
+		res[1] = DEFINE_RES_IRQ(irq);
+
+		info.fwnode = of_fwnode_handle(child);
+		info.parent = vpu->dev;
+		info.name = WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME;
+		info.id = num_cores;
+		info.dma_mask = DMA_BIT_MASK(32);
+		info.res = res;
+		info.num_res = ARRAY_SIZE(res);
+		info.data = &wave633c_core_data;
+		info.size_data = sizeof(wave633c_core_data);
+
+		pdev = platform_device_register_full(&info);
+		if (IS_ERR(pdev)) {
+			dev_err(vpu->dev, "Failed to register core %d: %ld\n",
+				num_cores, PTR_ERR(pdev));
+			continue;
+		}
+
+		vpu->core_pdevs[num_cores] = pdev;
+		num_cores++;
+	}
+
+	return num_cores;
+}
+
+static void wave6_vpu_destroy_cores(struct wave6_vpu_device *vpu)
+{
+	int i;
+
+	for (i = 0; i < W6_VPU_MAX_NUM_CORE; i++) {
+		struct platform_device *pdev = vpu->core_pdevs[i];
+
+		if (!pdev)
+			continue;
+
+		platform_device_unregister(pdev);
+		vpu->core_pdevs[i] = NULL;
+	}
+}
+
+static void wave6_vpu_release(struct wave6_vpu_device *vpu)
+{
+	guard(mutex)(&vpu->lock);
+
+	vpu->fw_available = false;
+	wave6_vpu_destroy_cores(vpu);
+	wave6_vpu_free_work_buffers(vpu);
+	if (vpu->sram_pool && vpu->sram_buf.vaddr) {
+		dma_unmap_resource(vpu->dev,
+				   vpu->sram_buf.dma_addr,
+				   vpu->sram_buf.size,
+				   DMA_BIDIRECTIONAL,
+				   0);
+		gen_pool_free(vpu->sram_pool,
+			      (unsigned long)vpu->sram_buf.vaddr,
+			      vpu->sram_buf.size);
+	}
+	if (vpu->code_buf.dma_addr)
+		dma_unmap_resource(vpu->dev,
+				   vpu->code_buf.dma_addr,
+				   vpu->code_buf.size,
+				   DMA_BIDIRECTIONAL,
+				   0);
+}
+
+static void wave6_vpu_load_firmware(const struct firmware *fw, void *context)
+{
+	struct wave6_vpu_device *vpu = context;
+
+	guard(mutex)(&vpu->lock);
+
+	if (!fw || !fw->data) {
+		dev_err(vpu->dev, "No firmware.\n");
+		return;
+	}
+
+	if (!vpu->fw_available)
+		goto exit;
+
+	if (fw->size + W6_EXTRA_CODE_BUF_SIZE > wave6_vpu_get_code_buf_size(vpu)) {
+		dev_err(vpu->dev, "firmware size (%zd > %zd) is too big\n",
+			fw->size, vpu->code_buf.size);
+		vpu->fw_available = false;
+		goto exit;
+	}
+
+	memcpy(vpu->code_buf.vaddr, fw->data, fw->size);
+
+	vpu->get_vpu = wave6_vpu_get;
+	vpu->put_vpu = wave6_vpu_put;
+	vpu->req_work_buffer = wave6_vpu_require_work_buffer;
+	request_module("platform:%s", WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME);
+	if (!wave6_vpu_create_cores(vpu)) {
+		dev_err(vpu->dev, "Failed to create VPU cores\n");
+		vpu->fw_available = false;
+	}
+
+exit:
+	release_firmware(fw);
+}
+
+static void wave6_vpu_detach_pm_domains(struct wave6_vpu_device *vpu)
+{
+	if (!vpu->num_pm_domains)
+		return;
+
+	for (int i = 0; i < vpu->num_pm_domains; i++) {
+		struct device *pd_dev = vpu->pd_list->pd_devs[i];
+
+		if (!IS_ERR_OR_NULL(pd_dev) && !pm_runtime_suspended(pd_dev))
+			pm_runtime_force_suspend(pd_dev);
+	}
+
+	dev_pm_domain_detach_list(vpu->pd_list);
+	vpu->pd_list = NULL;
+	vpu->num_pm_domains = 0;
+}
+
+static int wave6_vpu_attach_pm_domains(struct wave6_vpu_device *vpu)
+{
+	int ret;
+
+	vpu->num_pm_domains = of_count_phandle_with_args(vpu->dev->of_node,
+							 "power-domains",
+							 "#power-domain-cells");
+	if (vpu->num_pm_domains < 0) {
+		dev_err(vpu->dev, "No power domains defined for vpu node\n");
+		return vpu->num_pm_domains;
+	}
+
+	if (vpu->num_pm_domains == 1) {
+		/* genpd_dev_pm_attach() attach automatically if count is 1 */
+		vpu->num_pm_domains = 0;
+		return 0;
+	}
+
+	ret = dev_pm_domain_attach_list(vpu->dev, NULL, &vpu->pd_list);
+	if (ret < 0) {
+		dev_err(vpu->dev, "Can't attach pm domains, ret = %d\n", ret);
+		return ret;
+	}
+
+	vpu->num_pm_domains = ret;
+
+	return 0;
+}
+
+static struct device *wave6_vpu_get_performance_dev(struct wave6_vpu_device *vpu)
+{
+	int index;
+
+	if (!vpu->num_pm_domains)
+		return vpu->dev;
+
+	index = of_property_match_string(vpu->dev->of_node,
+					 "power-domain-names", "perf");
+	if (index < 0 || index >= vpu->num_pm_domains)
+		return NULL;
+
+	return vpu->pd_list->pd_devs[index];
+}
+
+static int wave6_vpu_probe(struct platform_device *pdev)
+{
+	struct device_node *np;
+	struct wave6_vpu_device *vpu;
+	const struct wave6_vpu_resource *res;
+	int ret;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", ret);
+		return ret;
+	}
+
+	res = of_device_get_match_data(&pdev->dev);
+	if (!res)
+		return -ENODEV;
+
+	vpu = devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
+	if (!vpu)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(&pdev->dev, &vpu->lock);
+	if (ret)
+		return ret;
+
+	atomic_set(&vpu->core_count, 0);
+	dev_set_drvdata(&pdev->dev, vpu);
+	vpu->dev = &pdev->dev;
+	vpu->res = res;
+	vpu->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vpu->reg_base))
+		return PTR_ERR(vpu->reg_base);
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &vpu->clks);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to get clocks\n");
+
+	vpu->num_clks = ret;
+
+	ret = wave6_vpu_attach_pm_domains(vpu);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to attach pm domains\n");
+
+	np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
+	if (np) {
+		struct resource mem;
+
+		ret = of_address_to_resource(np, 0, &mem);
+		of_node_put(np);
+		if (!ret) {
+			vpu->code_buf.phys_addr = mem.start;
+			vpu->code_buf.size = resource_size(&mem);
+			wave6_vpu_init_code_buf(vpu);
+		} else {
+			dev_warn(&pdev->dev, "memory-region is not available.\n");
+		}
+	}
+
+	vpu->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
+	if (vpu->sram_pool) {
+		vpu->sram_buf.size = vpu->res->sram_size;
+		vpu->sram_buf.vaddr = gen_pool_dma_alloc(vpu->sram_pool,
+							 vpu->sram_buf.size,
+							 &vpu->sram_buf.phys_addr);
+		if (!vpu->sram_buf.vaddr)
+			vpu->sram_buf.size = 0;
+		else
+			vpu->sram_buf.dma_addr = dma_map_resource(&pdev->dev,
+								  vpu->sram_buf.phys_addr,
+								  vpu->sram_buf.size,
+								  DMA_BIDIRECTIONAL,
+								  0);
+	}
+
+	vpu->thermal.dev = wave6_vpu_get_performance_dev(vpu);
+	vpu->thermal.of_node = vpu->dev->of_node;
+	if (vpu->thermal.dev) {
+		ret = wave6_vpu_cooling_init(&vpu->thermal);
+		if (ret)
+			dev_err(&pdev->dev, "failed to initialize thermal cooling, %d\n", ret);
+	}
+
+	wave6_vpu_allocate_work_buffers(vpu);
+
+	pm_runtime_enable(&pdev->dev);
+	vpu->fw_available = true;
+
+	ret = firmware_request_nowait_nowarn(THIS_MODULE,
+					     vpu->res->fw_name,
+					     &pdev->dev,
+					     GFP_KERNEL,
+					     vpu,
+					     wave6_vpu_load_firmware);
+	if (ret) {
+		dev_err(&pdev->dev, "request firmware fail, ret = %d\n", ret);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	pm_runtime_disable(&pdev->dev);
+	if (vpu->thermal.dev)
+		wave6_vpu_cooling_remove(&vpu->thermal);
+	wave6_vpu_release(vpu);
+	wave6_vpu_detach_pm_domains(vpu);
+
+	return ret;
+}
+
+static void wave6_vpu_remove(struct platform_device *pdev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(&pdev->dev);
+
+	pm_runtime_disable(vpu->dev);
+	if (vpu->thermal.dev)
+		wave6_vpu_cooling_remove(&vpu->thermal);
+	wave6_vpu_release(vpu);
+	wave6_vpu_detach_pm_domains(vpu);
+}
+
+static int __maybe_unused wave6_vpu_runtime_suspend(struct device *dev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(vpu->num_clks, vpu->clks);
+
+	return 0;
+}
+
+static int __maybe_unused wave6_vpu_runtime_resume(struct device *dev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(vpu->num_clks, vpu->clks);
+}
+
+static const struct dev_pm_ops wave6_vpu_pm_ops = {
+	SET_RUNTIME_PM_OPS(wave6_vpu_runtime_suspend,
+			   wave6_vpu_runtime_resume, NULL)
+};
+
+static const struct of_device_id wave6_vpu_ids[] = {
+	{ .compatible = "nxp,imx95-vpu", .data = &wave633c_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, wave6_vpu_ids);
+
+static struct platform_driver wave6_vpu_driver = {
+	.driver = {
+		.name = WAVE6_VPU_PLATFORM_DRIVER_NAME,
+		.of_match_table = wave6_vpu_ids,
+		.pm = &wave6_vpu_pm_ops,
+	},
+	.probe = wave6_vpu_probe,
+	.remove = wave6_vpu_remove,
+};
+
+module_platform_driver(wave6_vpu_driver);
+MODULE_DESCRIPTION("chips&media Wave6 VPU driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.h b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
new file mode 100644
index 000000000000..ec3c9299526b
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPU_H__
+#define __WAVE6_VPU_H__
+
+#include <linux/device.h>
+#include "wave6-vpu-thermal.h"
+#include "wave6-vdi.h"
+#include "wave6-vpuapi.h"
+
+#define WAVE6_VPU_PLATFORM_DRIVER_NAME "wave6-vpu"
+#define WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME "wave6-vpu-core"
+
+struct wave6_vpu_device;
+struct vpu_core_device;
+
+/**
+ * enum wave6_vpu_state - VPU states
+ * @WAVE6_VPU_STATE_OFF:	VPU is powered off
+ * @WAVE6_VPU_STATE_PREPARE:	VPU is booting
+ * @WAVE6_VPU_STATE_ON:		VPU is running
+ * @WAVE6_VPU_STATE_SLEEP:	VPU is in a sleep mode
+ */
+enum wave6_vpu_state {
+	WAVE6_VPU_STATE_OFF,
+	WAVE6_VPU_STATE_PREPARE,
+	WAVE6_VPU_STATE_ON,
+	WAVE6_VPU_STATE_SLEEP
+};
+
+/**
+ * struct wave6_vpu_dma_buf - VPU buffer from reserved memory or gen_pool
+ * @size:	Buffer size
+ * @dma_addr:	Mapped address for device access
+ * @vaddr:	Kernel virtual address
+ * @phys_addr:	Physical address of the reserved memory region or gen_pool
+ *
+ * Represents a buffer allocated from pre-reserved device memory regions or
+ * SRAM via gen_pool_dma_alloc(). Used for code and SRAM buffers only.
+ * Managed by the VPU device.
+ */
+struct wave6_vpu_dma_buf {
+	size_t size;
+	dma_addr_t dma_addr;
+	void *vaddr;
+	phys_addr_t phys_addr;
+};
+
+/**
+ * struct wave6_vpu_resource - VPU device compatible data
+ * @fw_name:	Firmware name for the device
+ * @sram_size:	Required SRAM size
+ */
+struct wave6_vpu_resource {
+	const char *fw_name;
+	u32 sram_size;
+};
+
+#define WAVE6_IS_ENC				BIT(0)
+#define WAVE6_IS_DEC				BIT(1)
+
+#define WAVE633_CODEC_TYPE			(WAVE6_IS_ENC | WAVE6_IS_DEC)
+#define WAVE633_COMPATIBLE_FW_VERSION		0x2010000
+
+/**
+ * struct wave6_vpu_core_resource - VPU CORE device compatible data
+ * @codec_types:		Bitmask of supported codec types
+ * @compatible_fw_version:	Firmware version compatible with driver
+ */
+struct wave6_vpu_core_resource {
+	int codec_types;
+	u32 compatible_fw_version;
+};
+
+/**
+ * struct wave6_vpu_device - VPU driver structure
+ * @get_vpu:		Function pointer, boot or wake the device
+ * @put_vpu:		Function pointer, power off or suspend the device
+ * @req_work_buffer:	Function pointer, request allocation of a work buffer
+ * @dev:		Platform device pointer
+ * @reg_base:		Base address of MMIO registers
+ * @clks:		Array of clock handles
+ * @num_clks:		Number of entries in @clks
+ * @state:		Device state
+ * @lock:		Mutex protecting device data, register access
+ * @fw_available:	Firmware availability flag
+ * @res:		Device compatible data
+ * @sram_pool:		Genalloc pool for SRAM allocations
+ * @sram_buf:		Optional SRAM buffer
+ * @code_buf:		Firmware code buffer
+ * @work_buffers:	Array of work buffers
+ * @work_buffers_alloc:	Number of allocated work buffers
+ * @work_buffers_avail:	Number of available work buffers
+ * @thermal:		Thermal cooling device
+ * @core_count:		Number of available VPU core devices
+ *
+ * @get_vpu, @put_vpu, @req_work_buffer are called by VPU core devices.
+ *
+ * Buffers such as @sram_buf, @code_buf, and @work_buffers are managed
+ * by the VPU device and accessed exclusively by the firmware.
+ */
+struct wave6_vpu_device {
+	int (*get_vpu)(struct wave6_vpu_device *vpu,
+		       struct vpu_core_device *core);
+	void (*put_vpu)(struct wave6_vpu_device *vpu,
+			struct vpu_core_device *core);
+	void (*req_work_buffer)(struct wave6_vpu_device *vpu,
+				struct vpu_core_device *core);
+	struct device *dev;
+	void __iomem *reg_base;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	enum wave6_vpu_state state;
+	struct mutex lock; /* Protects device data, register access */
+
+	/* Prevents boot or sleep sequence if firmware is unavailable. */
+	bool fw_available;
+
+	const struct wave6_vpu_resource *res;
+	struct gen_pool *sram_pool;
+	struct wave6_vpu_dma_buf sram_buf;
+	struct wave6_vpu_dma_buf code_buf;
+
+	/* Allocates per-instance, used for storing instance-specific data. */
+	struct vpu_buf work_buffers[MAX_NUM_INSTANCE];
+	u32 work_buffers_alloc;
+	u32 work_buffers_avail;
+
+	struct vpu_thermal_cooling thermal;
+	atomic_t core_count;
+
+	int num_pm_domains;
+	struct dev_pm_domain_list *pd_list;
+
+	struct platform_device *core_pdevs[W6_VPU_MAX_NUM_CORE];
+};
+
+#endif /* __WAVE6_VPU_H__ */
-- 
2.31.1


