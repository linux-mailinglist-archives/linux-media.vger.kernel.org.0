Return-Path: <linux-media+bounces-57722-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJq3HgF4y2k3HwYAu9opvQ
	(envelope-from <linux-media+bounces-57722-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:30:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A097536530D
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 544473022D77
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2283D3BFE44;
	Tue, 31 Mar 2026 07:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="llldHKDD"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013063.outbound.protection.outlook.com [52.101.83.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422263BFE2F;
	Tue, 31 Mar 2026 07:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941906; cv=fail; b=jLOszq948zMhSNzDbb4gQ3o2eZk8qYMfWtrt36OCefUEcpcrtqCbk4WhwkYW2LDymKELbkFp8bps526exeFu7dSGFHC0kEdA9CKTeruJow5QAWYp6wuSl+OeOaEfJBlCqtrAR/tuMKi0tWKCmyzDFOc8xRdXG8Y2/Bz2zOwLUoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941906; c=relaxed/simple;
	bh=dxqwC4iZox6/8g7y9TIXO2niVHVRP5fhMYEMPdNOZGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZdDyioepu77x19dyFWkIfEnuOv4+9Cwpdw9UOY4kz/hpnIDLR2ZWSBn2azYAnytpC+gMnxpZZ1336fJloXV3i12MLEWsgxcZvdPf/TGRKTL5HSNPYCMqNV3BV/+mEbjKtGJN/5R8HaWaKWO7ubhG5j9wJC6YUH77jx6rd/r+SSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=llldHKDD; arc=fail smtp.client-ip=52.101.83.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyhllBTYsxhpr9Czm0LYiaRJndZTb+iBFEHXEwKMJzijma7tcJ7vA5L0XENMlF8sKvKTbQOpgoeltSeJEswL41iCqNqy1UerDYTo7iv95PnPQQbVSXvuQWod4zzF7reWRbTlco2et7IUTVXOr9jiUZ3qPpJ2cdQwPpqsXjqJROR//Ag7zx9N9pU2FLTdm/PLbcZwJq9FFO8H9QoA8wqH2pnxvAJ16OgfkrGKScJSTip5zelbMToHZSlee92GDF7I0DdnhTzdn8kBy4MAlEx3lMc7ZvuCUJNKgXyqPtYXVWfEAycaJjG7gczM8t5d8MTGz7VUKKqwoHb+5Mxfbv3gng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWzVJ63pGh3vNJoRsqFe5lreamznhZFozyFzoLtLHWw=;
 b=aPMcVuYGztUkHD8ChkssuT6mJugS5wSVvrdk2Kj0vtkMVSh3h58vFjhbBIpGfydjb2V5JWbIXPgRn+ml/UL5rnl2+PMwSVySbFSdKGzFcf7SLn8KIVr3WYJk7aPlSjY5fxeVkUkdbTNJqG+TBxFz75gB1UlKQPhNcGLSo+9KB9yPXQhpDg+F9IVkP2szXnrxrX8v3cpOaDMTMbhJi7xbkijN40M85VlaeKB2oR+5a4vBx+Ij51tuaZisWd5gi17rSsn3+9rvPP4wgxIrc4RR6l/vGk1TAZB+u9VcetATadTFISigDcadOf52iZyfAsypElc6CTqt1w7EcIDVxHSYaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWzVJ63pGh3vNJoRsqFe5lreamznhZFozyFzoLtLHWw=;
 b=llldHKDDsfZ1m0qiRUtE42M5bi8HM87N4yQ/JafpQVegJunTStqzRkHmObaTEULLUGSG8G28mbfivlLbuPZTvkNucLaaaX+jKXTM0WHNeK2ryEKgOjfPANWmY7mGPBVgeM4/TYAEE3Ybp+JwMSVAJ4JEzOEGaO55Ua3PJCMNh6EfInKl0e3vwAmSuoJRvTK9jlvZlbG+3lca7vG2KJ8a3fvp1HP6YInvajynaivwsxGfyoFD0CR6KB+//iCrDCHviZ9Tlz4MwYSfX51qlWo64R4N2Qkr9GVK27uC3qC43Ka1zMzcMO7tukvkSU7KwixVodf9ph5OgpGG0WiJex3oBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com (2603:10a6:20b:8::21)
 by DUZPR04MB9968.eurprd04.prod.outlook.com (2603:10a6:10:4d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 07:25:02 +0000
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc]) by AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc%5]) with mapi id 15.20.9632.017; Tue, 31 Mar 2026
 07:25:01 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 1/7] media: v4l2-ctrls: Add V4L2_CID_MEMORY_USAGE control
Date: Tue, 31 Mar 2026 15:23:11 +0800
Message-ID: <20260331072347.253-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20260331072347.253-1-ming.qian@oss.nxp.com>
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To AM6PR04MB5110.eurprd04.prod.outlook.com
 (2603:10a6:20b:8::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5110:EE_|DUZPR04MB9968:EE_
X-MS-Office365-Filtering-Correlation-Id: 2776bf93-6e35-4634-ccb2-08de8ef69f1a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	lGUT0afL/7F/Rh7iabA9zqOS7Rf5GQ/9VsK6UzN4BARpPeYecsDlVaNN9yZ9FzDdSnzTTF/+kmvMrm9hte9AQrHsdIpsY+55YvpPDSV/nFTOJAHL8mpDNtaXNuygl5ZKKI+ighwk5w3LiwmDh8oQ73Ll8oLVuMo65BvngOxPtzTm3QC6XVsTZWZUUkgOcji3nJGrYbVBuSm2Y+leHpytXo/j412FcHYDDYVEReIiJNPd5GB+FKDQtLK7TB4J8T9Sz8D2TIlcV/hKNrbe1yF5gV27Fy9KoPh5kWkMfTs4sgm3sITskP+Omh07RtcyNdKBV+pOPsKRZ/NgR1TNxzc29CIs06il6B+pfRWGyKPSr8vs/TL3jIhnsNSou5AiZ/zxO8bmtT5rYZ3175EBpdoLU+xZm/7+NwWR24zunJv/kie+/Yj/kbKWpJw5o1h9bPjLwcuXgX0uRPS/e6fjI05K23kXmN2zeULypdG6rXeVFGH30dBnp000/xccWRnYBeN9xxc4LG3ryJTTubx8IFaTlJuMVkrtYonWEMAL7aXYIomx9axTdPUuDd+v4mGmBEfG8eXx0FpU6Iwfi4fHfWMjGqUW9iN1kwqnRqC6nLKxH4G6S+nayfHQCIOR54u8wiMHRXBw3v/R9VB7ptNQ3xkgJmbV+Kndr0A0etGeToqOJCMrYLoKvh7ryMeRRAmznL4/VddbHgHmKw4CzsENQ9d7uHuR7rEl7httMhgu3WszXh7r+jayg2AbWUfKL52DTzFYpIIf1mJA/oBp2QGsrMODYDvuHkGxpDw2LfyKBtXiGoA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5110.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jxserZ1NssyFoUg3bVnxjg7fBOAJwwa8fTRi4cA/ohkW2uJBidRFxa7Cm/Hj?=
 =?us-ascii?Q?KcQPUz/6rQUoI3rS1fLUwzxXoAuNStDViT9WufqoBXPn6SZISaAg/+99WazS?=
 =?us-ascii?Q?TY8Iw/rU3a9Y9osKBVgkUeNCtNfz60Z7oWyPNq/8/dtgfsoSnP2/S5FyXBf0?=
 =?us-ascii?Q?tQZ/E7/3MapD9tM/ZeitS+G5QJrSKaTAVuP1UdXl6QGlc3u8iSauUHuVY317?=
 =?us-ascii?Q?mkFJXYtFd8WZF1VosCMUgtDHA+6bdvmhRnHe3vspnfDZPbh2FR3JIlCDQHSi?=
 =?us-ascii?Q?nNc92BF4F8mtp1dwgJKgr9CXpn2ZB4J2ybHbPc+hxmLc/dihgqAcdtFy2alL?=
 =?us-ascii?Q?QNCOQGxX9dsicP47/x6WJJPGltNHGdqxDwutbuKSpNAnBkDRK7itSWRKvmQQ?=
 =?us-ascii?Q?9fXsfPmKLLlBYEZ4yZWPfIuKMdHQU0FnxLG0D37zB3KZ2F094REIVNZORlrQ?=
 =?us-ascii?Q?2juloSKxugjem07+Ij7G9BaIUGrIsFc9FHSmqOzEyI9nk5Jp5JWXkYk6G4Vz?=
 =?us-ascii?Q?JxMOLk6Kg5TAo+kybGytqOtOSeG7kLeOFHKry6AtS29rqeA45QqRukyc4yEo?=
 =?us-ascii?Q?1hzdC/WkipmHuuZlJbbht079bwATpRHjsKvzkZuXYkHtBKUlAONtJN+o+FcK?=
 =?us-ascii?Q?1XEE1EEKa2JUA/obFeGCPKnnDO7rmMqEwCpmFPzhRtEWx/WNRBvhaRnT0MkK?=
 =?us-ascii?Q?nIWKghGZDN0zKNwBuYdvkWPMGdgPFGe5lupacTOAOevQzQBCjbWNP+kESsR7?=
 =?us-ascii?Q?9i3ZeMS0SYA5PevjGXZfGF1kqycwIU67bI/7b6PMzTKNIQmMuUJQHS7Lj5/1?=
 =?us-ascii?Q?8JRzBRv9eDdYZVTaJHdfKlDHEBzTtXpPdV1/raKnZd5vvKIk+SjgzR1MNqAE?=
 =?us-ascii?Q?R/HvkyEH5bgzr6sMRI7hVZPMPD6auAZuzltjlbjaRlcHOtkRGvZX56HJPv4T?=
 =?us-ascii?Q?DGQQQKFB2y12uxstk1mey+9P0Zr0qwtJ1lSoDn/4KITf9Plu2Kdjq+bAFZ+F?=
 =?us-ascii?Q?IQZxWOrXgszz8vV+D4942P3kWhrOzlmhbCUEqBfc81Q8nyDH/X2m8yn16g68?=
 =?us-ascii?Q?dlarDJnqy7QzKbzV4K2PauJmvuAPHWyS+4jn3zZFL+gY9PiDvNOKgj0WArMA?=
 =?us-ascii?Q?vslWGpFa8o2kCIIUqRXMbMXcR4w2QKnzLUNpfPk1IFguPWdQtwaDJmn5xyYk?=
 =?us-ascii?Q?Gq3qUa4tQ+RwWCx0oiW2aliJxaI/jdMxQwWIfbzZKkZUiO6pcXryaqND3nNt?=
 =?us-ascii?Q?TgByF1NKhT36oYGzp5qi6W+w5eCoOIEVwIVMLkFgJEAzE41Mv2ePYXACxLgr?=
 =?us-ascii?Q?VKtBDDYtmsHy9qM+1uyi/Mb8829eL6xl7CpnOmKB8SvC2McqQc5MH6nKC0Mz?=
 =?us-ascii?Q?kQ3tYhOU5h0ShOzkTDTP9sJbFmANm9MhvmZYrfZaMpfoSUlTP+Yrj6NENXHU?=
 =?us-ascii?Q?b4kxcWFMNb0QbDKyTbCaxPMC2RrrDcu2OWWpKX9Ks/LgF/r4ygtZDv9S79O0?=
 =?us-ascii?Q?PxwPrKaIw6Md/ndw2HbIuK8fg3m+YrAqCJ31NqxN0/CNg1Brc3V7BwNiGMfv?=
 =?us-ascii?Q?VNUSVNxcL5ru9kH52+rcAL0mDv9uc0gLR2DUenPfeBny6nLjV8RXdyEmCfyR?=
 =?us-ascii?Q?2VtY/xNQdTQ4WlHDELVE8nZZAZWViDRfNI+BnXvNBuOwk3thq+1wBYsVcDyS?=
 =?us-ascii?Q?zm9/f6WshFNC6xjdQ4s3lBxKLlm+yGGaXVfte8ayrDzqqWMJw7Q4qkgohI9B?=
 =?us-ascii?Q?084weQnWSA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2776bf93-6e35-4634-ccb2-08de8ef69f1a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5110.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 07:25:01.8554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IO+rA0r2u3qm46Fq1o6j+RHNoMpWDDxKoj0/0R0Q+uC0MDXrFS6Q4h9zE8y94NvddtHaqUgsVkyXgjqatFvRWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9968
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,ndufresne.ca,collabora.com,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57722-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: A097536530D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ming Qian <ming.qian@oss.nxp.com>

Add a new read-only control V4L2_CID_MEMORY_USAGE that allows
applications to query the total amount of memory currently used
by a device instance.

This control reports the memory consumption in bytes, including
internal buffers, intermediate processing data, and other
driver-managed allocations. Applications can use this information
for debugging, resource monitoring, or making informed decisions
about buffer allocation strategies.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 8 ++++++++
 include/uapi/linux/v4l2-controls.h        | 4 +++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 551426c4cd01..053db78ff661 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -831,6 +831,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
 	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
 	case V4L2_CID_COLORFX_RGB:              return "Color Effects, RGB";
+	case V4L2_CID_MEMORY_USAGE:		return "Memory Usage";
 
 	/*
 	 * Codec controls
@@ -1476,6 +1477,13 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*min = 0;
 		*max = 0xffff;
 		break;
+	case V4L2_CID_MEMORY_USAGE:
+		*type = V4L2_CTRL_TYPE_INTEGER64;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		*min = 0;
+		*max = S64_MAX;
+		*step = 1;
+		break;
 	case V4L2_CID_FLASH_FAULT:
 	case V4L2_CID_JPEG_ACTIVE_MARKER:
 	case V4L2_CID_3A_LOCK:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 68dd0c4e47b2..02c6f960d38e 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -110,8 +110,10 @@ enum v4l2_colorfx {
 #define V4L2_CID_COLORFX_CBCR			(V4L2_CID_BASE+42)
 #define V4L2_CID_COLORFX_RGB			(V4L2_CID_BASE+43)
 
+#define V4L2_CID_MEMORY_USAGE			(V4L2_CID_BASE+44)
+
 /* last CID + 1 */
-#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
+#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+45)
 
 /* USER-class private control IDs */
 
-- 
2.53.0


