Return-Path: <linux-media+bounces-45202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F1FBFAAD4
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3868A420736
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 07:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06239301473;
	Wed, 22 Oct 2025 07:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="QRqD9+VN"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021119.outbound.protection.outlook.com [40.107.42.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0402FE593;
	Wed, 22 Oct 2025 07:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119261; cv=fail; b=KHAKnK/uR7ONZu7st6VkgAD5V6HMHGJT2E+GxcTQ0qNtZv3e5r5BeQlD7L+zRT8VnM/yYxtJbnhhPSjJC8Tqu6uTEwVXQVCFnX39WRSo0+WZ9LMoY2oPENujnvsPu6GC69QR+kxbWx0BBLxqNlZ1wd8n+d00DLRyRM3oSR7afLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119261; c=relaxed/simple;
	bh=gP7/5j26ahdI126Y7CHWft9lg5q4pbRnqBo1kclC4Y8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EwXVJJHGO0ESc4c/QRpW6KkvL5VomW6rdfiX8AXTI8O2CI+UExHINU4H1epY2T7RzDO3s4vwutaYz4uG3ZJ5v6qz6nRenIXP0T5b86PHdMWcV37C2IWyheAAx8L9nmrzOBv7UPg3wlS00RUWgsqYOTPyjjpGFT6VEKSPgXDGBfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=QRqD9+VN; arc=fail smtp.client-ip=40.107.42.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmgjI3E6LlaY8QZYcR2UxoICHyx1q0np+tkPi7/OzKBP1BlIenC/DczOeSk4reNYZinnsTeqmqK8l8yQ8Iyz8cI+OAKu9lWaoZ0XCqWsMcUQZHSrEF5qvN8cYltFbmtF+6RNeY+LI7R8vyPfvQrdK15WEq/LzgUbhl8yfZIldl3WuEB/6q3oJ/nAKyxwMo/EEJYgYCLbq8ScfR3U6sDJl3Qrm9cZcAqrhNVtPe0nqayK9+WUJExJ6gKi2+o8Zzqr7gpsWzBDHj1CYcOc90tZ67e3E+vv39hFO8LAJEtWNY4NZ+fH/gF+6qEVLXbD+HYwxKYsh0RSum7anngJsm6KXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIljePh52zHAHCC2Dnm0PPHf51GVMtQwQUdM9dOuve4=;
 b=Z+dRQL5bgxltSv9NQbvWfdiufFtm9sqnrkGqC3j4OJIsvwVpImVj2xbC6P+pGeUxLss2MVs3/wkkMZ2PilbLaiVCmAl07aL+cGF+D81ELolGtBDhlwLJZvo5M35EdI2CyZjK6erfNWijVWOgwxy+S7ozN9s8qAZoYUUvJk3/yvi6O0g7R7oo4se2JzgH9lu7MXsDGC0hCL/FQr3hf9zvqh3hTp5z3E2gDmm7Se6TyM679vmP8j8A1JZ06mIxupinv3QvlyEwhJpPR/rm1NcMs8WdnY2z06vEBMY1W5eGVNR9H0nCVqKrxDiE7ens1NmvtQQ6Reijw3kFNJaQQ8U+3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIljePh52zHAHCC2Dnm0PPHf51GVMtQwQUdM9dOuve4=;
 b=QRqD9+VNMPifg66DwLHzZe6ZhY3wkAvo19KFvGG84o14yXRr1p02W4fwFCSvQjHmHY2leYews51fjEXxkjkgDthqJIV0S4xTlEabuu7UyUwyCrbM1kOlD137ZnfxOSdkdAUeHC2kwkwPFo9MhZU/emXwuXDnJNkspxitEDIdWSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PUYP216MB2918.KORP216.PROD.OUTLOOK.COM (2603:1096:301:159::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Wed, 22 Oct 2025 07:47:28 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9228.009; Wed, 22 Oct 2025
 07:47:28 +0000
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
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: [PATCH v4 8/9] media: chips-media: wave6: Add Wave6 control driver
Date: Wed, 22 Oct 2025 16:47:09 +0900
Message-Id: <20251022074710.575-9-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251022074710.575-1-nas.chung@chipsnmedia.com>
References: <20251022074710.575-1-nas.chung@chipsnmedia.com>
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
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|PUYP216MB2918:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e3cf03-323d-4dce-6336-08de113f3f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JW8dfb6gf2y8lRgQeGyHBwH6/jfrCjOlLDRM0AWPzC4aY8YjUgRg+tpMGm+L?=
 =?us-ascii?Q?d9U2GLLG+lf6wmx3zdD9+sQvIR57Cul2FIs1bLGYt3gCVKpN69a14QU/evq9?=
 =?us-ascii?Q?FAMrXKgeJhdC6ogqFWWBPAEieGhy5dHsWaSb+GUDkgKLgF540ABa1jAjEuJY?=
 =?us-ascii?Q?IIb/K7LgA/UfJKE48MQiwcgKByA2Kk17BrfUPrdyHtf2AqNawFwA/wMKkB/a?=
 =?us-ascii?Q?eg2C1ho0xBw99+dYQ1AhBcCZFVoROxz5c/+M/Vh1N252hS5hzZayekvXrFUf?=
 =?us-ascii?Q?pt0bgeksjtg0FIwFo3vXWIAJ1BbD9opvs7FgaC1RvmlXEWvFgKkyZ91wNpR1?=
 =?us-ascii?Q?xtFWmUf20XzUKDv0iOLHgmo1KkRs4iGANBxkpAdCKczbuTJVDXc32giTVHNE?=
 =?us-ascii?Q?B3pFltzMW5GLon+R2L1G425HD+jS0Izn1KvKGmOdrGLCBnP0Qe7QTT8caZvi?=
 =?us-ascii?Q?YgEZNCOddMKOMuSn1V1MVVQGYimaj4XqNocZzDUwC+YQZx2IgDfXbWwAy6q3?=
 =?us-ascii?Q?LySKTaiId4jURqIDWWnia3A2iWgZZpfmXVfhyyBD+V61OltfQn4KSSeKN7nF?=
 =?us-ascii?Q?D7kmOntyawsUimF3ezfEa5KvE2OHMwc3J2ow16C26FFprHyoRWCqqUl/ldTX?=
 =?us-ascii?Q?ZrSxTGJd8VrUq5/Nki3mD3aBXtt7kVNk8ZDtO0DT2ckDbnn/aXbu2m8BW7QN?=
 =?us-ascii?Q?n3NfTbIPCGBlp7Imla/ZwwPrMXZEof6LS9zOXlflObc906H6xvyb4mNGJlag?=
 =?us-ascii?Q?jUs3BN2T7ibyBezoHS1ERdFr5r7kmlCgimdUorf4MJ+KfPQVuPMHhQslnLnA?=
 =?us-ascii?Q?RgsaKyhFzXdXG+ErTL1GU7wOR+x1+RqQvdjVSAWxaFIlPR4KOf6eGjWU7RBx?=
 =?us-ascii?Q?wTkpRg6+WJ44PxALc4pH7tnEQ5U44zLfDk+lRe/mSiTXIDoK9AlENDB6URpC?=
 =?us-ascii?Q?3bFzM+mblK5zUDoQFr6IYAxXjuT2aB6WDvqMNIFgzl9X1XumRWADPu3+A/67?=
 =?us-ascii?Q?XGzMbwfkLQYd6Z7ufVShtw5NueGs4u0N1kPBWmJnMexa2/1DvVQUoKB+khmV?=
 =?us-ascii?Q?wRW+kRKGHb6ajuzZpOBwiarsfBYFsuo9iH5UUkWJh69/iVD2b6AnXy5zDj9A?=
 =?us-ascii?Q?DxEQFbD0h+NDKTUdjo9Zy6NAKGCtokHfj1Inu/rsKgWK8UOixi9sLMqDmgQ6?=
 =?us-ascii?Q?sFn//8bPs01Ajfka7qhfM+Qdm7Ou2Ks6zQVzZxSOJYEgkaA84CU0M/CPo5RW?=
 =?us-ascii?Q?CP37MWLdUMQXgfki2GofB3UCKarXanxQpbwdsjCLy51xFCWfUtis4TxsNRy+?=
 =?us-ascii?Q?y+7PZJC5N1hg5nNdtGOdHxUa3YRyUWQlKUU3VqlRzQy/JIVjS7hcvMUB5dbQ?=
 =?us-ascii?Q?ZrxPddPuJStXqaVRauDPwaO7GZEtYyJCkpKR+SNUdpmkGxB22/huoe/Fw1mZ?=
 =?us-ascii?Q?N0KUhLCBQkHoWJGlgurtLG3StmOQfOsmv+eiHuew4uGaJVvTFMukyMH/jshx?=
 =?us-ascii?Q?w35cL23/qCZ7hm7saPSSTC6mCkZkUjJs71VA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ye0rMeDNgIbGQ5Z6l+JIAHarGJbU6CEiCtzn32en4sqSZbWKNaA552vKw+XD?=
 =?us-ascii?Q?ueoGdpLW5rtxUY3KLTfEl2KLgJHkjGKZRpVR5VR+ot2uFSVD5xsIVa5DGwRA?=
 =?us-ascii?Q?8Eidmsy91cdHyKbRjGE7Ww3QI4EifLQNVdKrr4ebMyH2dtiK0XMhM7OKSC0s?=
 =?us-ascii?Q?MT5hYCrUDrvEnr5cLZYnIBpeX1dtqRHs4tKQMzsifx/fbEzxgV0RTCUloi7J?=
 =?us-ascii?Q?wbs+WJmTLkHfcMsMmh9VeOLb5ErYxDHEv97+QKfY4Xg3kh3j4wBH0u1Audpi?=
 =?us-ascii?Q?/tP7KJ2NIYXOZf+fMsqwSc5TCvZK8hkgp+bxc5/9jl7APl/RLnY4Pj7kGLXD?=
 =?us-ascii?Q?GxWguQXrBQ7Tw/Z0Bvl91xnRD/kEUpd4EYc2pgzPZ1lt4FMiGGPOrOlm2DAH?=
 =?us-ascii?Q?vIBxA4hkVS3KypboIAhyx+KTw0EaRjW4k4JXRT/hdMSF05Wp6VeQNwAHWkOd?=
 =?us-ascii?Q?B8B7oTeJvlmpccXpybt5d/NQ0TwXzJI0cXFs70uOYNT1EvT6Rn83VpN15ATz?=
 =?us-ascii?Q?6SdbfqFXPPVhkeX1cmrEk10LZ80oZOU+8nRdkNTl+KGMT0Uy+6Cd61bGoIBr?=
 =?us-ascii?Q?UIYQJmZj+KFjcP2YVGSjWkhnbKRuzvPbY6YmRO5KAE5ZqZo3fTHiArMQGgAj?=
 =?us-ascii?Q?ozTUZ1UJ5J029d4FAeKIZ2jx4AcvxaD+dv6efJEOneOG+TT55bsyr+Pj30OC?=
 =?us-ascii?Q?J6obffr1isuaB9+0B5IJVceVAWKPkefEaEis2Okhpkt7p71uoHgHCpalRV2w?=
 =?us-ascii?Q?bAvtYVkd1irGcmaEq5be6sDpoS3HfbSmTFwm64Wsz1nFXBkyUngR4QncRxcE?=
 =?us-ascii?Q?K8mwM5bN+xmaqVqdu9eRZzA5+2YR0di/2PkbtfucVaxJYW20aPwQ+1Jf7KE9?=
 =?us-ascii?Q?9Z9rupeNnswd6y2AQbBgF0APMnHDjOblBnRkLS41DslSYT2sB6gduaHugH1W?=
 =?us-ascii?Q?ETKvkLB2jjrCe5Rn/ihskcRKYdGw1JKK3ZoeLgouAcNHmzGQmcpF6o2HbBIN?=
 =?us-ascii?Q?gTx0sCJb+0NohdOaTw1zaDU0m9Fs67J7pVL82FFGsnMtG4gvt5DUHA7+fj9n?=
 =?us-ascii?Q?0Cs7AZP58J3JXZyapKyVYISX7X78a7ijCLV6wB2VNM4zACQ5Id4GLM1J/v15?=
 =?us-ascii?Q?o5dDPLq0yGBd0J5agfXWE0bDFSzTbJN30MYYpPlrdVmbLFXt+3icHDnGSUka?=
 =?us-ascii?Q?RKJ6ISIMYvnVPvkfT8WB029yWwogNOePrJUNx5jWvVrmFxLRbUDt46cxgVMB?=
 =?us-ascii?Q?fRPr3DTmX0lI+4bTkXxhMmIVOmhLmZ8DPqoTwkwB+J5LxkWBQI+6XADDBOOj?=
 =?us-ascii?Q?7N5275vWwxzTLeD6cOfBXwFsR+8ayIF5DVa+7Kb4fh/QR3MqQVSmdP4+eVVd?=
 =?us-ascii?Q?aO7NFtbCtvNRKxkgR/O18Rs5sCpgBrQ1l9NOtyRsggusK9Xy1rIHOBMwNczv?=
 =?us-ascii?Q?AoJoeEfziUKjdKjrcUS0rVMBJ5VR/DlFQ0bNun5b2hrjxmGW6SeqcRoeSd1u?=
 =?us-ascii?Q?Kns+8RPc8IGhTcpP1qPHlBi89zN6nnT7NMRqOMCAvH6rH7zfCN+MxAV0woXU?=
 =?us-ascii?Q?WIGc2HsexKNC2rj5ddBLy/2IYJ+j+iE62U8afmsshyo/X9wROB2OeV7cSx66?=
 =?us-ascii?Q?9A=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e3cf03-323d-4dce-6336-08de113f3f4b
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 07:47:27.7047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yioEArzMYVyG64GbV65af4XNBn4d6rHLfY0kp6svGmSLtZzVH+g8ChxKa+i0aPI1+eYtYx0oTX5er2kWiIvzT+BZ9YR6bS0gKZlD7cMdKIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2918

Add the control driver for the Chips&Media Wave6 video codec IP.

On NXP i.MX platforms, the Wave6 consists of two functional regions:
a control region responsible for firmware and shared resources,
and a core region for encoding and decoding.

The control driver manages shared resources such as firmware loading,
firmware memory allocation, and synchronization required by the core.

It also binds the `wave6-core` sub-device and coordinates with it
for firmware and power state management.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
---
 drivers/media/platform/chips-media/Kconfig    |   1 +
 drivers/media/platform/chips-media/Makefile   |   1 +
 .../media/platform/chips-media/wave6/Kconfig  |  17 +
 .../media/platform/chips-media/wave6/Makefile |  17 +
 .../platform/chips-media/wave6/wave6-vpu.c    | 667 ++++++++++++++++++
 .../platform/chips-media/wave6/wave6-vpu.h    | 121 ++++
 6 files changed, 824 insertions(+)
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
index 000000000000..daf2e92c1fae
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
@@ -0,0 +1,667 @@
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
+static void wave6_vpu_release(struct wave6_vpu_device *vpu)
+{
+	guard(mutex)(&vpu->lock);
+
+	vpu->fw_available = false;
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
+	of_platform_populate(vpu->dev->of_node, NULL, NULL, vpu->dev);
+
+exit:
+	release_firmware(fw);
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
+	vpu->thermal.dev = &pdev->dev;
+	ret = wave6_vpu_cooling_init(&vpu->thermal);
+	if (ret)
+		dev_err(&pdev->dev, "failed to initialize thermal cooling, ret = %d\n", ret);
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
+	wave6_vpu_release(vpu);
+	wave6_vpu_cooling_remove(&vpu->thermal);
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static void wave6_vpu_remove(struct platform_device *pdev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(&pdev->dev);
+
+	wave6_vpu_release(vpu);
+	wave6_vpu_cooling_remove(&vpu->thermal);
+	of_platform_depopulate(vpu->dev);
+	pm_runtime_disable(vpu->dev);
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
index 000000000000..5e3a78f0ec45
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
@@ -0,0 +1,121 @@
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
+};
+
+#endif /* __WAVE6_VPU_H__ */
-- 
2.31.1


