Return-Path: <linux-media+bounces-58801-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFV7Cotb32n1RwAAu9opvQ
	(envelope-from <linux-media+bounces-58801-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:34:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9C9402A09
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1ADC30FD8B8
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC603368A4;
	Wed, 15 Apr 2026 09:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="ATT5Pp+H"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021138.outbound.protection.outlook.com [40.107.42.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF89330649;
	Wed, 15 Apr 2026 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776245149; cv=fail; b=SmT4xbIVAr/pyEwhFZmEW5T+YyBHgdeaxsPqYwMIma4qCNFuQkZz2J7fcSXCqLqo+QOQm0ZiOndYs5oz5MdrOOaCUZPaos2zFGLX4qT/H0piVKZtP7NA7gokF4oURHVKWjlXbN2tA/dKueJI2JoI192GzHlOl2xxrqz8/8zL6aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776245149; c=relaxed/simple;
	bh=PqMj+YiTQ0hdUIII6/djgnWRCBHpoUp9u+/0UldIsRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=isEOXJAgvS+hvi40sUxO+FWuEgAXpbiaZA2LtufQuuIBtqPukPEt+sqR5cZpQGrb+QoYj1UIML/5KH8evIALAv2Q4W6al65oiYI+BDwsazIuAr+r4LYju4VLLQaZpKqKvAQ1FZvAXsL3sm2zwExogKPcZeAnUwYZgl+tZ2QyCvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=ATT5Pp+H; arc=fail smtp.client-ip=40.107.42.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClpdO369Mz6ANZscJkGNBVTPpWduxf4DUuIoevI7x9EFED50H/abCPMv3hivBv2oenSeuZzpwQI19MmtMEhgIJNAACIb4AiUkKBvHAXoxC+XyzRin3bxoVK6Y+UfPF8sUyxLtXNSbJY/593XwHeFE0LuwHDEiDpEUaoT7Tn9OaEDCrZm38tWuktPX1rSJ+Bn5UNpd8l1mCx0eE/q4VLXRs7cq1QR7a5Y+ZCHDuKoKV+/jJxAXxTkKed+0AGPa+azMw0ZiWNLWvNQ4OzoQgh3sFk7yRkZrrFuT7IfaYzpogX7MZFLQg8bnAO5v/WkBs1ZXcjTXYpK9pD0h6R9Y0ilZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ArWwPmW4Ev5BLIQFRrw9zX4AGUYJ0E2/pe61Z/I0o0=;
 b=A9XUYq6b5wTLe4lPRazF/Ikl0bVQezC5KpUS21SL/1vWCpj2bMMWHpRgpYX2s7yhNS0YSmAktQcJwNathEgoQRO9QSmgG7VDvp0VwD9NPlclH6qB4KSZzxjhRqg9p9xjVSAzi97OrTduVQgdZgBgh9Fjv+NggRilZB7xm3FpW/PpSAvqcIoDoR5KScUFFfhDzr5WvX1KlYJQuCmV8LFk5CQGa4rLPeXLQuRcW5Fiabmv37rEhcDn0+BH+bZ7oAuvyTvoo10SYrBMQ5d4jmnK7Z+g/wi6yfNBn1jRhNNVYE07kbv0qQZ96WAHqrLRyINbEtB8MxY3gvwlBJc2as7IGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ArWwPmW4Ev5BLIQFRrw9zX4AGUYJ0E2/pe61Z/I0o0=;
 b=ATT5Pp+HUQ968Ebk60fBF+NZ7UveH+B9H1WVbWRTTqJqyLudr7PywP2v58ODx4zPeCQz/9UWa4FU5HBC9ueaEWDA1BM4SkczbT42loSdPWKIqMFzmhiIkgA3TAUesK8hjnKBNSNlAqZ3Y9PcamTAd9F03HwiJHRz8nf60JYcfFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SL2P216MB2830.KORP216.PROD.OUTLOOK.COM (2603:1096:101:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 09:25:43 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 09:25:43 +0000
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
	Nas Chung <nas.chung@chipsnmedia.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [RFC PATCH v5 1/9] media: v4l2-common: Add YUV24 format info
Date: Wed, 15 Apr 2026 18:25:21 +0900
Message-Id: <20260415092529.577-2-nas.chung@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 25b054de-6369-4ed0-0ec6-08de9ad0f7f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AoMw/MQyvme9/QTd9ptIwpE4WhKX1y4UiL6/GaVVh60IzlFu0a1YZC8FLu716gwEh1yzQLoed0SCbayKqAp1v+DvNHcVO/0C3yOqQS8YXxluew663+b84PPrJHXMcNZRBKO1B8F42HQDjfKtuVhIDcy/a8XqrjErgVARs5k8FuOZZtNU0PxGfbD0+TYKbbPMRVJr2IPinE16l9ysTBoSO+4ZII8qGtCqQ9IW+Wt69ht+HbOZWXkqR+Cdzk2mu6qm9/77QFL07RC03hEnSKO5kM6Mz77ZJHYu+uhIPh61XeC7+sjGG2daPLGrIHeu6Z/UrcH6k+GOGaa2Sb445F/5Ys2c2B35Sj6epEJo2GxKLK+tkstJkVGQhLzN/YUFrn1NHF5ZDa7XIlt/NPQbH2zNkJsqR8jdel563BA/kPMUJcbkbKAiXaTVMw6zKppUd0AetGOukX2Q/ZwU7MmrVWdv+VQtIEiSDI7QlyjJFe9lJHniO+IqjoBfSD87CJ1zNS6RsVnkdA27J1CB6JjWaf+YmCnAQjBsYcEIBl9HxKRGzFppVoRuw9e+0zz+Ov1E1ts5IlfHE34fqfyStCTzt4ZBjRp8FRO9un5D9p12d5sw2oBic2u8h/4aADSfZ2EdOVSEh0nSl1Ag7tVf23Qx3hxlyaD8FdDoRXdsPTUGbyRwM/u0HnWzM1/s/97XU7FsXuDr3vrDicRN7FAVfCgIIQEFfHpThnoLvUfYmHRUh1S+GeWMGlUaBfjtS40wYe00MzkhmKs1iT5O6O1/ilCuAzj7eViOf2IG10RopVlzQC6yHEw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uFXBbBiNdv5ZK4eLMl3jmCDEgkWEfLf2Z4Tvr4MRrGCzbE+KaChW+JSIZ4az?=
 =?us-ascii?Q?W+PvfxSTWANUvvc8KHbettNFwvImxOcizt0azcGyta3ECpbzmWqG6rBFAB/F?=
 =?us-ascii?Q?R9C2tp7Xa0AK6MFO/6pc7DzJH2Ju5KJ2t1pjScFgqvpL728JmgKpLdyGVsjQ?=
 =?us-ascii?Q?lcox/7Hfc+tdJwXVXRucfj1YMPK4XFmhuEYHSCbUECd9Z+1rkCdZ6FHLW6Ir?=
 =?us-ascii?Q?JINi3SsyCb+q2X9f8nKGnnb1M1Qkvg1qUhc0pgOpOgbVOCh3RVI1lTP2RYIj?=
 =?us-ascii?Q?bHZvQzaHf7PL6eK7TxwrfYxdkDmGvFZv0fyGmnygkf0MMhB19OtCuQo3/vt3?=
 =?us-ascii?Q?0vQrRprFbUcmAONS1wKv/QyLDyPWeMTAi5WisBI/nixR7shHd6LmIcaOePWN?=
 =?us-ascii?Q?lTGaalzm4O8WaSBnTIO0iOKmlGr3IkAQzVE/YqIEeKPG+YX6S/5Wc1r98hkU?=
 =?us-ascii?Q?tZiUBcPO/IHJnJ7bO/QhodV34//9iMkcAxE4Wqx+ZFVyQqlR3h675FZaiTnJ?=
 =?us-ascii?Q?PB9VVUq1A5kwkvUyKGmUiIOEnGpMB3e9t6VyMAQhvhE6snCWTPWy5g87lRd6?=
 =?us-ascii?Q?bizudiHKKmTRxs4d9WRZ9IjsVcXOnEFT9tTRusFrjBAZhWWv1dMkdjYrzLAf?=
 =?us-ascii?Q?osR0wsVnByUtcu20ssN2aEz0uIdGO0yvKVqBl0Hn6LCDjrGu1fE399hhcXMa?=
 =?us-ascii?Q?IEiYgUDdrj6NmTcKNziQFn+yNlGc+J3UhoHCeP3z+BIw3Nc+E1CE5B22h3n5?=
 =?us-ascii?Q?SQeaOzTfGiITJL9kXS+7OWOMc0CzxupF+Il9KZ+H+XUb7kxckqJ1hsuMp4I/?=
 =?us-ascii?Q?CnLQErbHQKnT6FUSzmfd6tlsWT9j6pBOxU7X9iR19kN/HkSK5gaxRSDurjzf?=
 =?us-ascii?Q?s3GOKZGGsOfVd8mTrQ+S58ctT++Tt/+n1I9HE3Xfj0+Ca7kSj+dvL1bMKX6T?=
 =?us-ascii?Q?s4fXYKetRF0ByDRxMJOd1MR6UBjwt7CaaFUnnfYr6F9TWDcLeYkM7+YuqGq1?=
 =?us-ascii?Q?3bwKxHWaMMyYJUNtTFdzijP+1lgVmO5esIiNfaxpiry2/zTOlTL9VyzYBzV6?=
 =?us-ascii?Q?uMRu55y5swHdAQNWWkKh3bPvRj/zxRqTVRULaP33hqvKsQP6NaAZiIZMpKJf?=
 =?us-ascii?Q?XHYnBsKYzujbydnRB2g28l+3hHNzMou8BqT/q7uuLkGoINNhzSEPkmQ81lYw?=
 =?us-ascii?Q?8k9bKlzjpTFVENZcDWRZtx6fqE9qFMp0Ps46bKO+r3/z+zjILG7OzR84I6Bp?=
 =?us-ascii?Q?8n/pEaETTS83l39/sk914k3nM3ToOouA1V2vsD5ml6xA6D4yRpWANq7oMVq4?=
 =?us-ascii?Q?4cL5p88VnA68sxacYvelNAOzKPPb+EAylxRLSJ+NrsNxorh1q8QhrsoA7T8J?=
 =?us-ascii?Q?NtG9pATx2orPmH/Zz4SfAPhI+HeZ1gF53WTxgvUyWM1ariYm4HcGcqCPZpGB?=
 =?us-ascii?Q?1RFOLkZrNKpyKQw6hsm5MLXu1d0j5dEN+34akULzkVBJ5ZRE8cz8TIjdMO3c?=
 =?us-ascii?Q?ERpNLB2IZzuistZsrBZFjGLFtLeuEaF++cGIji9IFzaUK8itjK1dXzBm5DRH?=
 =?us-ascii?Q?avK6kT8G9TaIoSrhDKzn10CEfik6lRCr3tPAXCJlvAAZEt8JV9yGj1PlugIN?=
 =?us-ascii?Q?FVRPEPNYxvqObNEAXscIz3UfyREydgqL2rkfQL+OeVPFsnqnyiU3zWFqmVan?=
 =?us-ascii?Q?XTeB/LFADGpoBfG6nZFyck4hGH4PG0dh7fXBvDjzjOgEmX01izZwu16I7qX9?=
 =?us-ascii?Q?co99voqMU79O9cwr0NiM1eNqdeSeCQs=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b054de-6369-4ed0-0ec6-08de9ad0f7f7
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 09:25:43.8250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X1OTaMHLlyHNWlMR9BQCQatPm+zS0GbACT8CQD+f+KchWwjgi5Pvs4unhRaBUr0JBunX3zMfTdfzFsxEKu1cuWKHh5Ve/fbztF9pca9d7M0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2830
X-Spamd-Result: default: False [3.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58801-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,chipsnmedia.com:email,chipsnmedia.com:dkim,chipsnmedia.com:mid]
X-Rspamd-Queue-Id: 7D9C9402A09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The YUV24 format is missing an entry in the v4l2_format_info().
The YUV24 format is the packed YUV 4:4:4 formats with 8 bits
per component.

Fixes: 0376a51fbe5e ("media: v4l: Add packed YUV444 24bpp pixel format")
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 554c591e1113..55bcd5975d9f 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -281,6 +281,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_Y212,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_Y216,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_YUV48_12, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_YUV24,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_MT2110T, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
 		  .block_w = { 16, 8, 0, 0 }, .block_h = { 32, 16, 0, 0 }},
 		{ .format = V4L2_PIX_FMT_MT2110R, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
-- 
2.31.1


