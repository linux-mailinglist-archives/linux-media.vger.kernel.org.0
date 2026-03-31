Return-Path: <linux-media+bounces-57727-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFdNJ1p3y2k3HwYAu9opvQ
	(envelope-from <linux-media+bounces-57727-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:27:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 428C436527E
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76B10303645A
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C903CAE85;
	Tue, 31 Mar 2026 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X314vo+M"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0763C9EE9;
	Tue, 31 Mar 2026 07:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941937; cv=fail; b=ppbbzb5Ftb6fvFrEuAGkivktytgl8+mqkhI09Xllu7OSSXUz1CJ5E2NKOsa5MevogLtW2/nvhIVp3YSptR/g8MlZPL/5qYlmqwaA+hpm2/Pdr3RPyutOCyuYl6moIeTLTGekSFe19IqvpgcVB6SbwLcRAqKmhdZChcXS/ZK0FBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941937; c=relaxed/simple;
	bh=hyjHgFYz4g4Tts+FO9A10B/8++UcK4bAnQYXrS6T0V0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=djNyngIVHcEz/pXW3kpwn8+NSQjn01JpXn/apjPm86KO3gaKUMjiWCpx1mswXDm4i3fHlN6d7bN8EgIPz9cKEZmguMfCIALnTc2kbfMGaJek4EAnQbyKiJuXEulN3JqMlzx/XKc5gr51Z53dn2m2xG+5GBRI7Q2gO9hK3c/LJHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X314vo+M; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRf1dlwIpGKupFo+yp4MO3JSiAYnDR7YSHCxWJ1IEzLG0epC9p9DVG2/cqwHLfb1MY5VsTivd1FJffeCS4aweNDzRFsDa4+I8BOF8p+KnBzX+kwUGa4+6kRq2D0Re/o0RsponUS8aj4Fia1D1pJkv+cHmlWzFxCDF8kq10Q8UoRSFiAiEuIW9fc9zW/pZOEx+QqV0EWt9Pa6xOOFcS9sTgljmwvPbZe2v51V/zuBpbv6jrBWh8utAVbbNCmxibZZsNbOlL3z+dG3pWvHmS3SlXYQ45C/qVuASLirE4HQUI0ag9aX3Qtzx0qCMsGMBy7fKYHtn9DuJZE7Q9byvCnnng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSmMA6CxOe35pS1xTxqWPZQEA03CZ+m6U7Fnq0IYiU0=;
 b=kqszYMT76AgomhflKLa07s4XnT/ADETWd+QB1TsqlrbJchleom2pQ+RanDPgmcEvcn2E/5M2N+AKQbq+M7aZW04GU3ecNF5/IWqZ30yTF+bgtpuCnm+aKTyrDFOx5UJwAlq/tGlw1Nth9M9wTUQcnYahP1h37P+w6sIZ+NewO+yvD/kCy4PSJFFSio9f9cFii0JVdX3qpCu72IQQCfqV7pYQBTOXCwUPL7mOGOM9axafFxjjsh32oQlgsrRyhmvI0STGWm1aEIOifiuJfgUB9jfouVX8Fmtv19vlWoKgcVM1+fxl9BMQtzQg5I6Fe+E5qS+v0c/VZvXUv+kmPK3rGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSmMA6CxOe35pS1xTxqWPZQEA03CZ+m6U7Fnq0IYiU0=;
 b=X314vo+MVKR9NGO1Qx7sU2ApIfjB45fs4j2XnHWjyRF3CXdUpLcfBOe0DJEUccAjd17zJwMtGhH1LXWmvlx5tWla26JF9EEyyr4YuBA2TlgwP+C9xFvWM41lC+owyWB1JIj+krLZLLzWI4iRNS8D7zNtc7YMCALMlfAyX9pUONgaqnMpq2WOfQkNktGfnAWSJxx83Z0/L1SJgOU756ULcuBgc7VIFxIm5vLArjaRAdPJ+frWr0TfE6vKP+q08feR6t8LY9IotsIEUg0WxCiYdUQL/OZXFsx6THbtEaiqTg7ebSeu9LIhmTHvr+GL2CWL6rr/xEkrm33yLgHl0rhDzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com (2603:10a6:20b:8::21)
 by AM9PR04MB8131.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 07:25:31 +0000
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc]) by AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc%5]) with mapi id 15.20.9632.017; Tue, 31 Mar 2026
 07:25:31 +0000
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
Subject: [RFC PATCH 6/7] media: videobuf2: Add memory tracking support
Date: Tue, 31 Mar 2026 15:23:16 +0800
Message-ID: <20260331072347.253-7-ming.qian@oss.nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM6PR04MB5110:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c809752-f823-4705-7e6b-08de8ef6b0b8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	V9qGS+0TA93l3Ft8HBMCtP0ycDNob1fKT7C/zpwDHXcKCxhxpd5r9/Y3tJa9sX80i0jod6sFTpfGh3a9yWBm376y59cAM7rWFfJukGAZKrOw7NiCnDtvGphmC8D2oiFgyT5B/zHSR1F9Sg54If7GRNSkxhSj3t+0h/m6nD6c3sQ/wI1M3uPdQDhQlH8VGeP7LdJ0i8+AcHhwm0PTHKQoF7UxdORvRsDJUf6mZcqbBrlBcBgye/eSC0d+EM7Kxhk5BTSTDveQEVQmqibxvg+pBx98mB7NA6cfWBYrPt4TLVh2V3ALAJ1Dtw+6EoD9vVRwe7i2GQplXTbu8ZWwcwDOb4rBvbqQBh/yyPkMdIzoNIKCE13P4QaTjJgGmGHxcHStwTuCWWNCLUKA195z9QOPLCchfpF7/oBp9+IvZ/9aafRYqUBpYo9pOVo2QohaX/ZWNtmWZIsPIQWi2YBrwBvtbwwkqzhYhjMPrzP5v7hHM4SDgX2BezexUNNJlt7Ez3fEE/s6YzGyJcHPFmqSMKXPl9hM2QtomfRmyvM/0YBYAntQOlIaCAWJY4opKi98Za3MTvkRaoTAyqOU6FaZXrWUq/Y0X4kt0OcKp2NiAzXwLh1gEu7vbsrtsZHWunN+/HGp4GfLeCoiH0JbQEdHvHa8eJdZfBp0BE5TP1KOinHw2mSDNrHVdXHnoveibqr4Mh+dKgkt9kiov86pmABgFe+rG+neiPWL2UATKHv9qACV0+iONHDWKtHmmTnZIrICzu2RbvnYvjqzoiPjkqF+ZGj0zPkOxehVhjo7e2/x6/3Dn+w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5110.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wRZDL5kH+2sWA2IgWHuOoMQTy7vXmlJrrC4tdVA/J5rYgKVroJ1rtyFBCifN?=
 =?us-ascii?Q?57Dko+Zc9cJRT7deHjRjom/CNrGbR6yhJknWR5QBIIXgtQjZL+yweQoxPXdK?=
 =?us-ascii?Q?ocMGhttrJ1r00Ec+AM7MQGDcX6qnGo+zjf9FcAQ9Wx24pPuJsbyi0eOCyV2K?=
 =?us-ascii?Q?yEeiBd6UG+/Y+v+NncFr/ULd0XdTZhL2qVlGRSPdq/91T2n9PMNzeup61CD5?=
 =?us-ascii?Q?7gBwDX1DVkHUcSW1pkRC2l7beSs8eBCGF4VXtFc6LkLJgapkWoAl6YfKuZep?=
 =?us-ascii?Q?vqFc1wkXh8OQYHNtoFN8u5NtrunfPtNChXXjK1MEOV4+Hd2KRjGNMRVlOFC5?=
 =?us-ascii?Q?qROrWrxQsvj2jMRyIjVn9WECsXsOe7e2f85BkZ4FjkCBTliOUnR++CX4w9c8?=
 =?us-ascii?Q?+ag/YGm1ckWMw8KJXZQlhXyCB+sfoNcPrRRVM0l0cLBY1p/cX+r/vDY0HPlW?=
 =?us-ascii?Q?EUAWngxmwfZA/KI+gAFH9DNIU9EHIHRKmlnR2lsJUxDFcMe8gSuDjmF2pvW6?=
 =?us-ascii?Q?Y1wbV0ySoP7yyaY3NDgVtYLWo9jDozW9GplnRnu5XQchHQwB2mZuO4uDWkby?=
 =?us-ascii?Q?ywejoscCOEQ0lUt5Jn5YXVjqJ3ctb/zpW0fOrOPtaLTq4KhfCF0BUmtor2zm?=
 =?us-ascii?Q?0IykzYKSZaoqLE/4/hZh93CBMrnXwo1q2tTgYeoTLiwPT0aYt8bEG5+58QSk?=
 =?us-ascii?Q?ODPYBrzSk9w6XnhQgL4WUX6lcOJYRmAmHkMi4Udso1w61tbWKP8s1WA+Uc1Y?=
 =?us-ascii?Q?jJiWvP596FHdIIUo2H+w++mtEiafq7k1nhzkGhVD4kBbSyezCn2vGNFa57dE?=
 =?us-ascii?Q?PulqNz4GrolLjgz313ditflvl7fn6+WDgRPBDV98qErGVci7+/1DfxKkHvTz?=
 =?us-ascii?Q?RTUDRW4Hizz/sVhzWjxm+gPr4G6xaROibstLDiFjVuaT01HbmdQTfRFJhZWT?=
 =?us-ascii?Q?iuC+V1shWCCLA+5h+AWfHL0Ekvt0v8uIY7u7GMEgxPLV4g9WqbAI2VTpJZ/k?=
 =?us-ascii?Q?AWs89b0klFNxxZmS39RxqKm2L/n8zKxEXGdxB8q/3GXYFuLWYSnBbbaWDdO1?=
 =?us-ascii?Q?Oma58PjtUHCktM/VHPDMOQIRYCDQivxQzaQIks84/4zhKJmwNvbX1XXFlmwh?=
 =?us-ascii?Q?a6VeZM/8cc8Wa41q8DayrxlfwlD4l56mPAc+WooGftGZuiMUbTinI8FBEYn2?=
 =?us-ascii?Q?t0TkZ30eJz031kYUT9fnDCxJKWwKPdo/6Gq2BJ0xpjBMTCUdm+3UNromsxJS?=
 =?us-ascii?Q?oh/KdVaLc45zug8JQ6l+rFMiq0IoDmv+K83JMmR3gnHTEwZYw/+f/UbWCb5n?=
 =?us-ascii?Q?/mSWOzoKQe0xrrWTpjSqTxOP4ygl0ecfngrFZ/rweDQk0nUozEi+sTULmRWN?=
 =?us-ascii?Q?F4L9rygu0f4EeE6TBVfULs7ywRcjPTEY7LjY/KBV3yFWR3+6Za2h4cOTmh64?=
 =?us-ascii?Q?sToLSv237arrVLf8YyRA2l8JmxsRM7e1z6elcm1L/HdhBGZTE/1+isMXRAo/?=
 =?us-ascii?Q?i9Vs38ocULeQfm0GQh+jSKDtI+Fikh3wievTc64xjHA2OnuS7NdNx13jwGpl?=
 =?us-ascii?Q?dP0A000u47fvINTUOaioZiDYV2aFUJtC5p3c8qum4+TCpqzSQdhmU1SWR9Q9?=
 =?us-ascii?Q?eRMwl14balTaFV4Ebnb23uik4+VcR6CSn2Fk08Q/xLuN+spM2ytnc/o0t4oY?=
 =?us-ascii?Q?/vv+YFRE2nVhnzhiK4Lk+VkPVB+g5ziypN1UlH74bxvhEAIxSd8nc/B45w/7?=
 =?us-ascii?Q?xj2ZG46uyw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c809752-f823-4705-7e6b-08de8ef6b0b8
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5110.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 07:25:31.3449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1knV13YRa0dIU8CboH1zoqUEvLveLgIkezwfaBHpE5LNp3ANugNGIC8DzDQLG+xhRxrGhtNh8oMyKs1AVBE8qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,ndufresne.ca,collabora.com,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57727-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 428C436527E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ming Qian <ming.qian@oss.nxp.com>

Add optional memtrack field to vb2_queue for tracking MMAP buffer
memory usage. When a driver sets q->memtrack, the core automatically
tracks allocations via v4l2_memtrack_add/sub calls.

Only MMAP type buffers are tracked since DMABUF memory is allocated
externally by userspace.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 13 +++++++++++++
 include/media/videobuf2-core.h                  |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index adf668b213c2..e42fdf829b22 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -28,6 +28,7 @@
 
 #include <media/videobuf2-core.h>
 #include <media/v4l2-mc.h>
+#include <media/v4l2-memtrack.h>
 
 #include <trace/events/vb2.h>
 
@@ -251,12 +252,19 @@ static int __vb2_buf_mem_alloc(struct vb2_buffer *vb)
 
 		/* Associate allocator private data with this plane */
 		vb->planes[plane].mem_priv = mem_priv;
+
+		if (q->memtrack)
+			v4l2_memtrack_add(q->memtrack, size, NULL);
 	}
 
 	return 0;
 free:
 	/* Free already allocated memory if one of the allocations failed */
 	for (; plane > 0; --plane) {
+		unsigned long size = PAGE_ALIGN(vb->planes[plane - 1].length);
+
+		if (q->memtrack)
+			v4l2_memtrack_sub(q->memtrack, size, NULL);
 		call_void_memop(vb, put, vb->planes[plane - 1].mem_priv);
 		vb->planes[plane - 1].mem_priv = NULL;
 	}
@@ -269,9 +277,14 @@ static int __vb2_buf_mem_alloc(struct vb2_buffer *vb)
  */
 static void __vb2_buf_mem_free(struct vb2_buffer *vb)
 {
+	struct vb2_queue *q = vb->vb2_queue;
 	unsigned int plane;
 
 	for (plane = 0; plane < vb->num_planes; ++plane) {
+		unsigned long size = PAGE_ALIGN(vb->planes[plane].length);
+
+		if (q->memtrack)
+			v4l2_memtrack_sub(q->memtrack, size, NULL);
 		call_void_memop(vb, put, vb->planes[plane].mem_priv);
 		vb->planes[plane].mem_priv = NULL;
 		dprintk(vb->vb2_queue, 3, "freed plane %d of buffer %d\n",
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4424d481d7f7..7cb6ff2fc892 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -47,6 +47,7 @@ enum vb2_memory {
 struct vb2_fileio_data;
 struct vb2_threadio_data;
 struct vb2_buffer;
+struct v4l2_memtrack_node;
 
 /**
  * struct vb2_mem_ops - memory handling/memory allocator operations.
@@ -558,6 +559,7 @@ struct vb2_buf_ops {
  *		driver implements the V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
  *		control.
  * @alloc_devs:	&struct device memory type/allocator-specific per-plane device
+ * @memtrack:   optional memory tracking node for debugging and monitoring.
  */
 /*
  * Private elements (won't appear at the uAPI book):
@@ -632,6 +634,8 @@ struct vb2_queue {
 
 	struct device			*alloc_devs[VB2_MAX_PLANES];
 
+	struct v4l2_memtrack_node	*memtrack;
+
 	/* private: internal use only */
 	struct mutex			mmap_lock;
 	unsigned int			memory;
-- 
2.53.0


