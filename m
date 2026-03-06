Return-Path: <linux-media+bounces-54702-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GlLEcB7qmkqSQEAu9opvQ
	(envelope-from <linux-media+bounces-54702-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 08:01:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E058B21C3CC
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 08:01:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52FE5301BDD8
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 07:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A9C2FCBF5;
	Fri,  6 Mar 2026 07:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YtbCp9Zb"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013049.outbound.protection.outlook.com [52.101.72.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA4816A395;
	Fri,  6 Mar 2026 07:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780474; cv=fail; b=BtY4ERKO/hWRThnIiEWXvT7KYPCZxxBfn7RSkgOa46F2++ARyL8npugGxJwxBiH2Z5yep1Cy1fc39izHfO2Zjdb6Ur6Sdvrqm56N9btA8rjJZsQWTBAozc8wmB3xVhW7Wo/zyCRaZkX21llk6FpJ8HCgP6ZEud3CV/e0vLZUgYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780474; c=relaxed/simple;
	bh=j7zK3/N/GMuFmJojR4n4iZMQ4jeL7lyHFTAQpzPDC5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aqjisoAFwHJHxkNFjPWEq8u2C3FbwTuRdXsCYC8+0dxaUn80yCPorTvHKseP3v1JgRgy/s3ydnpSPzGcRYRUzmJEeCIwb2sf2eeqiuNKzS3tS/vIAtplZY9K6sm2PpBOQu3Gup4rvCbmj6xyH3YiUHc8R9dvNTfEzf+PPLkeqfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YtbCp9Zb; arc=fail smtp.client-ip=52.101.72.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYIJUpoMykOm3f4HK4R0C/OP0aFF9yHBPdtPV1KvGvdpaORHeeW1qEjq1a/0VcphYExRo/wj7nUvV/t9NapJRdjtJ14RxCDGs/MQlqCdkRYiHT3MBsV4AFirP9PGF9DWOU4NBGnOuP1zpWy9xT8WN4PvkdssmDOxpVPQoaoIWYTozHH80u8lTny7kYswtYvclj2D/W7AygW5OqivA92iQzNmJjBvS1AlUjOD1wvypOvTV6sO++W9/grhJoZovlsKBWiHFnpKVSf0JfqsJC4qBGenL0KhmSTJpzfgNeeFw3/dULhJxxAd6vAZ+eDFwXaYkL5Gi2spw8e2ZaGq9NUhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWSEPIAcJ9Qaj5B2pLWTsD+DAe2yzx5ApoAcg92byBY=;
 b=KfxSlk+ze0RTw5/5Ad6MFxJyaQHyW2NSigDttvfsgPIIsWZVWPyhzdw+S+3X16qKVGEsiyFTPYDSId6O9YpLrfKIQsaZ8YSgjAh1Di/zhevgCIGh5FKjPpplDhmhtU70nhXnCx4/fN6O9auAECB5ODGvTQQNQYhmG+MGvm+IG+RkLnRpbGUZmc6YV7riP//cVPZLaoDjEZFcoFeLax2M+YR5g4Btc3MeZW1tIZYeulyo8blrSeTehiJMEmXC7YeK4x1aUCeUCzQu22wibXOYjMk1vBsZXD8AGp22+rr5KGEasyGj736w4o33ZtIPIfG2idNNUiA6dd4Azmg0bdjy4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWSEPIAcJ9Qaj5B2pLWTsD+DAe2yzx5ApoAcg92byBY=;
 b=YtbCp9ZbZfMxz+eNrYSNCtH05c+XSUfmUmdMKF7iznAs6nfLhmhK0ZeD5noYmGd0GgfQE7RtzjmW57vetD0JX5XbXBf5WS+rzXtvRWUg1P4FaGbD78HtHRlQq3oiNbuHeyuKUU7/WESm7LXuNJNt/UbWntBxBW91gQD6Ihv4KjMHzxGXQ43RfGycrrNvWoYUCaiqwlxg7ue9DptouQQZtUqeTrNAxJpvfZ9SwnuLxR9GPVybQtTdNjRKj0cBwlCg/MdAW4wRm1ZZD1LN2uFT0ZiVh/rbRq40ffdsXOCeU4aqS4zIwMqgpZ64CIkYob6I+19eVL9ugCgVAAkHpPftUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS5PR04MB11441.eurprd04.prod.outlook.com (2603:10a6:20b:6c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 07:00:51 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 07:00:51 +0000
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
Subject: [PATCH] media: amphion: Fix race between m2m job_abort and device_run
Date: Fri,  6 Mar 2026 14:59:50 +0800
Message-ID: <20260306065951.837-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:195::8) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS5PR04MB11441:EE_
X-MS-Office365-Filtering-Correlation-Id: 808e0ea0-2929-41da-5cd4-08de7b4e1a25
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	WYrDx06wSt8p9F73tOUO9eZZs4X+zpis/wJIJ/x2iM9T52sht9x3q61o0u1XEQnoUrv3K8LTtZGvEcXNPUzdXNKCUFCe563kAv9PfnWP/KzhGw/tOAIIZzmxd4MAQrq4tSbtU/wQJQH1sVue2H3x5aNFiruL++qreUm2KTF1qpNvDtkPy5MVEGmVGq7fmfG6jjxxlkwvWgrSEbHu90PE14274tyWaL6p8zQdc8kFKexonGyoeZDKF5YnPInisg+ATUKfF4RSAuhjIrQei0O5jVbVnPtD69Uk46upQZrp14mcLZ3ds5KhN3jmU0zc8+aK3XcbVAcYuBDtvhapbhCqsi+jjxIx0VPz/ANUuoZiBTjIPWLIGJVCGQSEc+JM5hIh+0ru6Uh1pCy/VIgbTk0LCd9CYKxwdbXYRiDDXQRK8mFPA6j4tqFW9g4KSuT57dXkMILNQO/e1O5hf6Pm1TwFYZNQH7Do5tajxQY4GCyblyVlIl6ZaCvIHyRRDTXTnyfyI2d/9q+3g/pWvQto2X28wSMrIYsHqXbKTTxe/cBrlxyBf+9ZFNz6Nq1TupUMUYNXr0WWMWIwk2hxlk+DXsM2pmIU5S14uK+Xk86p3U8Od4VJPLrjaJAkr7XCy8mo4loAGj6RMGg9D6xmM7rvswIG1ch3/Wd+s+QJ1NO2OU5g4U9Dy+nLz+7dW1MhTnjgYTUSHkykWc3NrgzhP+wbvCiOPzW1d7y4g8k2dL/dkyQt1TNvTT+00fEKrWVNoekrn/UHhkvbkv8/ye1e1k1oWCCt+JmvvaLtdWZs4oNH6Ch1p+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MXFfpJ1NRYXk6XmPs4oP5W+i6yJ/N5avKnkvTRxn20xx7ecO/keLX88lPsnd?=
 =?us-ascii?Q?mCIJmR4RqeIDhwv3CyWN2TA831z/5vJTU6f4r9Q3NennA/kauXePzTjZtRhI?=
 =?us-ascii?Q?3j8agEXyw24XWlZakvw5pBSjWtABKJ+iFrrNXu+tD39BbnuR5wOr4v/qwn7E?=
 =?us-ascii?Q?yM4ZKBegcAZXEwQOH1DZviWsIdgQ6u3KYTp4yt+Alt3Pk3YDsFFq2dmEE8pG?=
 =?us-ascii?Q?M5RUHrBhMKlWrtxCedx/EqFQjlAFutWxaRUhhQi3mdd3n4pyVJfwov5pFd7s?=
 =?us-ascii?Q?IoDc+Za9eozhSkRwJLkEe0xJDDIZ0RXDb0my6t/6CHX4W65Pzr/2pgDTE0N9?=
 =?us-ascii?Q?/iBFRsM8EqEOSS3A+Mm5L8YOqj6gSnD4e3lFUY5mRo6R9aJfS8+mSLrVA5pp?=
 =?us-ascii?Q?Wmi9OvPohohnzKpU+jNciUMkVnJXAdKLRfb/WeEJb0UulotNnDieZd6SdK6V?=
 =?us-ascii?Q?t7h6JS9Lv9ShUNSCW2aOP4nJXeIq8H6c/GXu5vZmsxw4f6rFRzqKWNuJZl3v?=
 =?us-ascii?Q?julzFs0plkCqhnr0alVKmzpeWj+ihuFB8m9VKMFBJYjpCfBQNjdgmrC2pJhg?=
 =?us-ascii?Q?bZQTsWgDTVPUNDBNPEnF+FspM441Ityk8tB4+uGjXnUZ6A9pXAZGU5D68BPs?=
 =?us-ascii?Q?5wyf4xafXSiZOXxcV2VKA3tRQ4+0LfJ4H5Po3wRVfucVbIYkhvuXGJfPT9Xb?=
 =?us-ascii?Q?bvsIqFXRuDx831mrraTmOE6MjbUV+KP8nhY7czV3D7/iUa/JTeZcziDQ0ISl?=
 =?us-ascii?Q?EcetOn9YzdxKzqMwflIy7XQE3z7bH07cQ09p8mmCZbwCpAwelIv/7iHKlsEB?=
 =?us-ascii?Q?JokZOmoa96L3d0y9jHNMjEL6Z+uMm6qUMkDI8vGu8ijoq231UysqbsyF5Ioh?=
 =?us-ascii?Q?NqKKzo4Wec5UmUV1sF8C9rWFnxOyA6ctqwsgtuB/EfUye/rgnKV+LwBe4PH4?=
 =?us-ascii?Q?nXUmeyPSVLH94n/frb1+IK2IRLdx7ydJhbZZGVEs0ru7xBR+Jv7639MtfJUn?=
 =?us-ascii?Q?0TR9uOoYQlipqlrYC9NIoSSDzPJHO4NtkMGHDNYYDRr5b/Kj/0BR5lReiZgK?=
 =?us-ascii?Q?HB7L9c7Vpw3V88Uh/kHCd0EEsGwRJ+vjnxub5eyFF5ggMCjjRoT/5ndOLige?=
 =?us-ascii?Q?s0JIReZFaFovp1Z7otH6OQ2L05M2aC0Dmg4sn3TDA7wTQjCJo6p0PoJys0Yk?=
 =?us-ascii?Q?1ycFRUU+DJk5RE032D4ulJB+ez2YLUwLP60xBSB93/PeZ1A/K11/4dhDrYCj?=
 =?us-ascii?Q?fbaMZxwI82Qa25gJ2L2UU+xmvAJnytOSxLrIYwR+vRL6kvwEqYPiFXvjbzNn?=
 =?us-ascii?Q?x3fIWpTW5nRVQQJqqwesyLRATA2V9Y1Csr/vZjFRHzMZwFhqAr2V8+cyjxdJ?=
 =?us-ascii?Q?Q4S9BoRR3fgtGdNHhq9OInlVvmgxcRtgufMmVQqtM+cP9fRRgvRWRGkcI6FH?=
 =?us-ascii?Q?mKT5yR21ALQkvIxxbKuFRF84F9QvH507QQyn//B54kaEmqpdvxXXfUsPe0T3?=
 =?us-ascii?Q?buzlVw3DwQESagRolAZa9hmxG6f0IfAj9KXLZvxtYrVCIs2we3IAVCsEaHo0?=
 =?us-ascii?Q?VBCO+OjglGkgFR7BKmXpbZa2gGs/GKsdj0T90zwvHrZg7kDSNzOLjW67Fco/?=
 =?us-ascii?Q?NAVN2VLadA5bJJLXO/z5nbxpkPDoDKD9aEqCqrHbVVONxlIttF+1x04uWJbQ?=
 =?us-ascii?Q?5RHYB4IneIfKyBMrvIfR8l0Oi1Qv4rfn6xEtjjCUJtSeS7RwnPn/JIFAd6TW?=
 =?us-ascii?Q?NKSzlMMaGw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808e0ea0-2929-41da-5cd4-08de7b4e1a25
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:00:51.4914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3Qxxh4hVJuqk4jbLBKyx4hly+mOF+avYx5gs0sIvfsK2DsmnFLy9Dp6EaDMuHdETs0R5jdRdQiBKYfhDzN8JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11441
X-Rspamd-Queue-Id: E058B21C3CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,ndufresne.ca,collabora.com,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54702-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:email,oss.nxp.com:mid]
X-Rspamd-Action: no action

From: Ming Qian <ming.qian@oss.nxp.com>

Fix kernel panic caused by race condition where v4l2_m2m_ctx_release()
frees m2m_ctx while v4l2_m2m_try_run() is about to call device_run
with the same context.

Race sequence:
  v4l2_m2m_try_run():           v4l2_m2m_ctx_release():
    lock/unlock                   v4l2_m2m_cancel_job()
                                    job_abort()
                                      v4l2_m2m_job_finish()
                                  kfree(m2m_ctx)  <- frees ctx
    device_run()  <- use-after-free crash at 0x538

Crash trace:
  Unable to handle kernel read from unreadable memory at virtual address
  0000000000000538
  v4l2_m2m_try_run+0x78/0x138
  v4l2_m2m_device_run_work+0x14/0x20

The amphion vpu driver does not rely on the m2m framework's device_run
callback to perform encode/decode operations.

Fix the race by preventing m2m framework job scheduling entirely:
- Add job_ready callback returning 0 (no jobs ready for m2m framework)
- Remove job_abort callback to avoid the race condition

Fixes: 3cd084519c6f ("media: amphion: add vpu v4l2 m2m support")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vpu_v4l2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 64fc88d89ccc..7cccc994fc50 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -447,17 +447,14 @@ static void vpu_m2m_device_run(void *priv)
 {
 }
 
-static void vpu_m2m_job_abort(void *priv)
+static int vpu_m2m_job_ready(void *priv)
 {
-	struct vpu_inst *inst = priv;
-	struct v4l2_m2m_ctx *m2m_ctx = inst->fh.m2m_ctx;
-
-	v4l2_m2m_job_finish(m2m_ctx->m2m_dev, m2m_ctx);
+	return 0;
 }
 
 static const struct v4l2_m2m_ops vpu_m2m_ops = {
 	.device_run = vpu_m2m_device_run,
-	.job_abort = vpu_m2m_job_abort
+	.job_ready = vpu_m2m_job_ready,
 };
 
 static int vpu_vb2_queue_setup(struct vb2_queue *vq,

base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.52.0


