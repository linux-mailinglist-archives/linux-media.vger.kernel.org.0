Return-Path: <linux-media+bounces-27534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84084A4F483
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 03:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 958E5188FE9E
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 02:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FF85103F;
	Wed,  5 Mar 2025 02:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iVVJu22h"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2056.outbound.protection.outlook.com [40.107.249.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E39DF5C;
	Wed,  5 Mar 2025 02:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741140987; cv=fail; b=FvXauvIXBWuiuD8ksrxff/bTFnE1iYAr6bmfqHtjpvJBkcg7TMi4lsqBD7uWh/PLBntalxSEPhy2GQwALxZKABHuW85wI0oqS4XKL3j3fVsB3A17yBr1SFNAgxmUPhpUM4lBu/LJ72yVh9KsuCM92Y1Pk8z96WOTux7x32F2UBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741140987; c=relaxed/simple;
	bh=E/FsSLMJWZ13cW1bFjVA+NBfZ9MyY/o08St0LeSCPLc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=IdPf+TcsJbH9BquZ+j/W8fLYvM8jnFSUamntpD8yScFTm1EU+AC4pphAJ6jqVNJGCOkApVf4oC8MG91az931EIu1GQqYfxD1kmXVZ/ypJYo1Wsh92dXZZeSCnTDJwvfvSvN3QjDPcFd8Y06pIMMpYyFPRFw7Eoeeok4Vp9U4T+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iVVJu22h; arc=fail smtp.client-ip=40.107.249.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVDrDXN02HYvEkO7gnjWzMicziwW6nKSnU0ktAnXOH4pTS1qfMex9osw+WxmPnznhPSIjlOBBVTLKnuh4ADn8wEaIBX1PkHw4yugY9M30Nqre9MyyH5w/A+gpvhhVHD4bFp4YOXIjzeZiCMDaFnRurrWYJ/07EcL90aSsznoq3p30ukC9yVGofiiCLRoyu1GeKCXhlQgH5rs0R/Kwx37Abp4SsWgBZ71ffOH8Kj4rxtE5ET8udfs36guoe/vrowbGkwu7eOcWfbkOAOvPkewH0w4Dc9rhKCECpR7dR6hvBd+W4ZBMWK8FuiQ0ELSNfOeirnQIBpnDlBio0OYimBeXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ty6FIwPnWv4kTM/WXZKYTxqdU6oj8CVv0kYT4MwcSQ4=;
 b=B5wSt0CoavQ6L4caXRNJnYmEyoB5tU8JN+Ko5pi2I7qQlKVtY/yUlAdWy840GV7pn42f4rkgR6hYUGctvgmy89KWq3dlFgkomdTDY2wKTBsJaHqcWaQ8UZcNGjqcKYbg1WgaophOQQSeVddzq+B8GQEJ9jyuah7VN7EV2wYTFh5Ihwlv34LH1Ddr0SQqyL5jCd3IspwBFfEGXN/0+3ophmgUScUzB17DtI18Aa98/GlK4ddmi2GKdOxg43668XKqEgZ/NGQD3ZA6Mc+zWQM4upfWgHDRSRHpSceKkgZYYwNv5k6EHsw5MzxIKcO+9AgWxdZyxpHQfKEyE+Ak8ym5WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ty6FIwPnWv4kTM/WXZKYTxqdU6oj8CVv0kYT4MwcSQ4=;
 b=iVVJu22hdjM4is8OevkxeO88HNZWNGHqu1zWGfuVSAh206UK27Asd7IUE6jXzIh00lew/3QlIpwzBMimsIU1RUfF28wFXG8TuDrE95I4u1huV3L4RSQE92Dct14jwYqEcbPE4afeXyQPooqH0YhzwIIieKiy3mfhdVDC5pCHh9bSBWFWPbOzMqHMqohsbteF65qlnUkhqN3T4dfrUk2PjBnXp+uNE7UncC3C05xaCDSoef86wYBkdWsawuHRv+bS18BjpSAEYa9Qv4VoPsOCJEQTTZy65YqrEjy2QP0CbSK1MFJbD9gcv39xa/emMgZjJiF6swldINB7PgvcrQrkUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS1PR04MB9479.eurprd04.prod.outlook.com (2603:10a6:20b:4d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.26; Wed, 5 Mar
 2025 02:16:21 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 02:16:21 +0000
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
Subject: [PATCH] media: imx-jpeg: Drop the first error frames
Date: Wed,  5 Mar 2025 10:25:13 +0800
Message-Id: <20250305022513.2312731-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:3:17::22) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS1PR04MB9479:EE_
X-MS-Office365-Filtering-Correlation-Id: de0922b1-32d5-480d-323c-08dd5b8bb8be
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eZVins9kumVB/J+BWgywQlupRND1zQAjAZytp2f3E6R2gC3qHrpuVqlU9U6h?=
 =?us-ascii?Q?cwQzRoQVOGRIgUsG3Q/x5Ou6LAkeSdfi3uLMRtLrNnntawD5IkCacewUlMQJ?=
 =?us-ascii?Q?oDqriLLdLjYHpE0zB3PPETZog9H0c/CtR4WRxdOGEApKhskJVbltQGMebYOw?=
 =?us-ascii?Q?GBULcw+EldGAeRcVfPZEUJIskjLoL061gj6yXq6JqZZrVDV8/jLAk37oiNDI?=
 =?us-ascii?Q?fdJtQOZ4hS4Kakl8qWuvEiThrAH1K03FHRVqRQOcpM6NVZjj2RBKB6PHMWGA?=
 =?us-ascii?Q?WSGuxZUZv/IZjMn+GB94aU2gZeNnIoc1tWFEvhze7pifhgY7S+KnTmY03Fr3?=
 =?us-ascii?Q?aPz1LewwcPwUIWdHLisZkTgmZ9GI2pbj3fK8oRL5jvRm1XwONzf4SHXW3L8b?=
 =?us-ascii?Q?+1vvaUfneWAMrnSJ4l+9MCUSdQxzh8XS508oC77r/B2hatze3gK6guvMMg64?=
 =?us-ascii?Q?vWICd1/k5KZLOqtKvY7rwm+DDZZRsUHHVo1DY3cRzT8acYshRY4ABTh/vpvS?=
 =?us-ascii?Q?BgZlSFQlSJKJcUWV2BqZWU5md93EAky9bSY9qnGEn4BpmcS3Y6/DXtcNWLKX?=
 =?us-ascii?Q?Ke3w7LaPKwASuE8Ma1rA2u8xx3B5EhJsVgSkbK04cWuCNLFHm3uxzs/CBl/b?=
 =?us-ascii?Q?kPxce+M9gxMLelAi4zpvLTYMJv7f9T4fOsPE6yYv5Hi1n1SFRTqdQIsa9B7k?=
 =?us-ascii?Q?Ca46TpQd22p64yfAfPR5q8VLkgVKsd4N+sGl2a1Wfya9+OmeMBtUt8zIYYDK?=
 =?us-ascii?Q?r3NfADmDFs4WFxJCvhb8MhVALeNdc5U5yxzJK6tAec7tg1unIurayREID75e?=
 =?us-ascii?Q?W6R6gryKtmM7IYy4mh1I+N4wP3ZaMoUdu0UG9TMRWIzisetsOxh/b6uPYP3H?=
 =?us-ascii?Q?QjqDbRW4N0NWjo484QTeKaM5Jg7bkdo5rQkkOlZSbV69P9Fr6YLZswq+W9O0?=
 =?us-ascii?Q?qAujii8wzt7sfVVjmn1SBW8ojkLTwCRiX7ylaY1kPdCLGql+Sux7Y4fioUM6?=
 =?us-ascii?Q?lmYM8OrM4WIeSRY6YAewf3DoAuw3FicC0q5TKN9ErkSiGVXFHbnGUeAe0hxl?=
 =?us-ascii?Q?4eVkM45H91bMWidr3kxLzjCp5oRM7jYQ49LpxsiVPfyXwwWA1eFCE4Ov4OEF?=
 =?us-ascii?Q?bKPnro4WmndsgxhFfv/fPqojxGVME9ae+i+KkCkzhbAzbALvHzKVgHn6Lj0R?=
 =?us-ascii?Q?nFN9WuFnEvrQSJ1gKwS8BR/CGWEMAEIWccDEIgyFUAfWtnNVKq8BfP5Gaqdh?=
 =?us-ascii?Q?jdB3su8a3O6NfKXbDV2twBR3QHEaLUkPyGmTfasyk5FM2BWc6MKDHQ9xZAun?=
 =?us-ascii?Q?1kOJs9A3KlXNXzo9EjeTIS3fK5O1TkHBS7RiCto7+B5u1gyrMsChRqwgXy6D?=
 =?us-ascii?Q?IM/uTph+qfZMHtVx6IuAz0REmWhrAAJdJz88cIZ6J/J7k0oh71gVgn0wLF79?=
 =?us-ascii?Q?zSuCH6suzy413jOp0VlU8Ra/BpQD9XZP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gOFkT1KmGTGPNB904luYBmeoAddqJ7P7o24TCGt0ifTXC0ILAFCCxiPlmlzJ?=
 =?us-ascii?Q?kUX90nQjDjdmmNgu6C8xuPNY495+lwPSYVlpPCyJoRaXomtwCUMW6j7LuzMv?=
 =?us-ascii?Q?A/GdQoCXK5rT/QfkLAMgXZqD6qhB/t7eGI1M5wBwPUMbodf3XNN3V2i1Hcit?=
 =?us-ascii?Q?WahSS0SyMeZRzIc3R1DBBwIPv3M0ziaObv9LTjUzOpQ4WzzpaSjAY2d8lB9F?=
 =?us-ascii?Q?e3JMK6FZ8a0sL518kl2XnQPUmoSpXhCHAzroAEt4S2n/eiyTs0pRjOY7+tM/?=
 =?us-ascii?Q?27zG0mU6U99cKPbQwV6SEz6u2Hid2LVLARRU8XMItDdMjK3UhtQRuNSRiKAC?=
 =?us-ascii?Q?WoPQU/9XlXc6cBVEf74s3eTDBmO2pFWVATrODXO1FT8NlLu0OE+dKfM6ejFL?=
 =?us-ascii?Q?CWoLeVKVEDnt4RkO6Ddur5UrOw2yRiFnZUvAgaOazRL2qn0WITVSlgNIiNcU?=
 =?us-ascii?Q?nfi6qTYHX+Jaicab0zjySeOSao7ghI+aX4S2oA7ySr8vkhZis6qMw9CLNbqr?=
 =?us-ascii?Q?noX+Zpcl3tbV/c+aAwizQNknEyXwKg/yNC1a9NAngLj2zkHwp/D+n2N2f1V8?=
 =?us-ascii?Q?mmFpzB1XQAS9Sd5UM4jcYTILFk2c7hlTLznaeanVIMfR3jbwqCQ3++AdDjF8?=
 =?us-ascii?Q?xn6KO54Z/eJJijWC1r2/WpdYi2cl3LGbrVrwF8/g4rhZZZfGlbv4ad0UrTPa?=
 =?us-ascii?Q?DwjUHjBv73bazXAQ1bJjCog6/LemWOr8qXpO2m7/l/O2ajVD3BpC8v9W4KQw?=
 =?us-ascii?Q?id81ijNO2g7h9tq+Zu8FICbRrgCFj0BeMZvJmgQlC5KgGoezcTbVJ5mCHRHP?=
 =?us-ascii?Q?vCYtRqV29d92N4oq8i0u5pYTXUUAUUoi8ssd6/Ge70bb9uD4TVFUsrRS1ZLI?=
 =?us-ascii?Q?95YvTvHpPB/Xt6Q2stlUriQ+HyvqExf7OA83tIaNy/9k7mzWLEfwsholhBQR?=
 =?us-ascii?Q?vVy0HJUMcOU7ZmbL7klvbPGuX0IYYOsGqzmAWPvCGNjUmbngEt9Yn402YL0D?=
 =?us-ascii?Q?JWaTbMNKxtOBqTgmsLAxejc/cu2zpLhYC3mdFhlGUrZUKwoTfYLOtC+OepiL?=
 =?us-ascii?Q?FJbMVNTob8lCGCZPHJbnojsfuhDkv6JR4pH1fcdJD3uSPNF6qLodBqd48Dfx?=
 =?us-ascii?Q?qhG2m9RBT6YjYDnTScmK4j4fe5uv8mxjdZ97ZEKH7KyMaNxUjFgAP/d4+v7E?=
 =?us-ascii?Q?astq3i9Dbmadr3IAlm64KJOnFiYChm5Fjw+7jTvkJmlFhXb0keh0WiQfLOiO?=
 =?us-ascii?Q?d5NVf6QBb2g7i79H/xEXnRUMVkDqd/lk37x2fA8OPTMI4SRqga61s9N/VAOL?=
 =?us-ascii?Q?1G23OXMuC2NjblZqn+y2Kz/M2McWAdnc+7FI4rmq71HLguqDwOyb2xG/MIoc?=
 =?us-ascii?Q?pPzZBe4LJBX8e1UMBtOiDfon7rO7fI2HKLKaxwjpHKCRf0BsWIizxLTei9PX?=
 =?us-ascii?Q?m5qu8PduYByB1Ir34JCNS3YJ+QPlB+zDBfGCQRygSkblRVhFUYrK10jAa4GZ?=
 =?us-ascii?Q?HuCd4h7/MAiB/s14RoPnbHgfA/l1YCtP+SzB790TKF0izAmlKuytGsHzJ+NF?=
 =?us-ascii?Q?hkH03PMCR/9XlFqlISogXKwsYO6YPvIKoQsAdSpx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de0922b1-32d5-480d-323c-08dd5b8bb8be
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 02:16:21.6395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bf1t9JLScLhCf9iKDuOzb+sA3s4MMkxTRPyRqPg5TXJXiqfMzSBWAKEMwqUJn1KQdS5NRdsDBfY1GsKVx9hZqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9479

From: Ming Qian <ming.qian@oss.nxp.com>

When an output buffer contains error frame header,
v4l2_jpeg_parse_header() will return error, then driver will mark this
buffer and a capture buffer done with error flag in device_run().

But if the error occurs in the first frames, before setup the capture
queue, there is no chance to schedule device_run(), and there may be no
capture to mark error.

So we need to drop this buffer with error flag, and make the decoding
can continue.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 1221b309a916..0e6ee997284b 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1921,6 +1921,15 @@ static void mxc_jpeg_buf_queue(struct vb2_buffer *vb)
 	if (ret)
 		jpeg_src_buf->jpeg_parse_error = true;
 
+	/*
+	 * if the capture queue is not setup, the device_run() won't be scheduled,
+	 * need to drop the error buffer, so that the decoding can continue
+	 */
+	if (jpeg_src_buf->jpeg_parse_error &&
+	    !vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx))) {
+		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+		return;
+	}
 end:
 	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
 }
-- 
2.43.0-rc1


