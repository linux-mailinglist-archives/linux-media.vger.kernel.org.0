Return-Path: <linux-media+bounces-66294-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f0AhNM8eRmo4KQsAu9opvQ
	(envelope-from <linux-media+bounces-66294-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 10:18:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E43E6F4B1A
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 10:18:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=eAOr47jS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66294-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66294-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D0E8304653C
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 07:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608593909BF;
	Thu,  2 Jul 2026 07:25:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021116.outbound.protection.outlook.com [40.107.57.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2002A38D412;
	Thu,  2 Jul 2026 07:25:29 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977131; cv=fail; b=iHT6aOFz2vH6ggF006pUCf0GhgGAAsVQcaeW7jgfwl4KoOWbicR+pcQaVEa2KW3+0U7+o1VMLmNXQQoP4VYNIGaaorjBuQiwrGoOdIrPCD13c8p+TiM3RSEKqQOaMd64+slMcZ+kmzHxK94mhuG4zK8jSRsnMcxYjqLypmf1A4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977131; c=relaxed/simple;
	bh=Tvw4lJFhNRom08G8P1TW9z7g9AhMvtWX6azEdRXzO7k=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=j5G9MIi1BSkPhxVS/lZDGhOdyVXuOMLHH8Ungre+gpvWA7DyRrv64g3mB4zxGFnDNNiOLYwwYEBBboA3I1L/Xe8SvAfNKBqrAPH4prCx1FsXFcWCkZtq0jeeeVTJyaUiK8W+kDgyYqBw1n5Mr126ToxkjySfk8XTnGl8QScAdsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=eAOr47jS reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.116
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbdXeAhSfU00v7K+sKtDI8fuIhImGUs1JbQMe7gebdYg4NQDJRSDJH82T2oTMQ+KW7RAbS5fDdH8qDAEURuRy0GiKs4SAX0sBsuOWSbHz0gtkhWTXBjzqwy6KpR3uV/uMMdhnOh9f42jVL6+U2pKNQMWaVGYTEIGeyzy6HTv2Sl+g5ofcJ97mrpYUscY8SUOtPJUeNFPxRQoAExu9/bdLV4Nfygiyt/9qJOW1GkBKGcFdqbTEBcJTj3T5R7RA/ntGBYZWpLaD3WR6ZL8f2YvTiDjvpLw73+XV52oh/iuYIRabruzqgie3l/jFhkdRmFo6jls9/TI69KnjSD57u76lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pBIlMyB02NLP8AV1vxv9irujmeJA8WBGSdOAIQLIMo=;
 b=CXVh7q8NDunGO25leqAbTk1WKJVmNdvxS4EMW5aJZAAmum7K1rzuuAubyZRbxwecS//JX2/Pgg8Yb7uY84STfIRPiTKBWfPtYGaDgX2/XoAyANUZMZoVRt+GExagk9T6sV6BE9Bj0Jnx84CD3VbGoEsm+2UjvlCHmBVbS9eC325Nd5V1vGf9ZDiDeuxNAlnVb8ZnwQUzvTbA3raEatt2Zsf4NWYDxZIO5q1WP0vq8mt1yXRNMrCsULHGNDkAjXh8ZEQcYM8iKtl+xBaFnwJHLh/TI082UdJh4/BQeM5Bk19DSQ701rWdDZRv6DLtYCz7qQMV1uyLC6l5ZeZfA3GILg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pBIlMyB02NLP8AV1vxv9irujmeJA8WBGSdOAIQLIMo=;
 b=eAOr47jSu8YzGxxwmQPF6aef2Z4efb6FJsda2hvk7O7SRs2LVFPdiXiDAxkwbyRWKIRVCNzUQm0f7JlZNKFubQKov679Bs8aX50JIrup4gWJtRoAzLAhOwt3jIGgY5h8GXsygPrxl+TmbibKq7VdMULqZQq0FcfUFxx52GO/pUL9vobpTlZESNLPfFlrrXD12MFz6kdo0oAy4pmFxP6qbt5rnagHZJBXJ6KlO79UFOIRGIYH0iOC+g4+/0QUC2t4NynMNXKxpdzoKYZNxom4sOl7ACEczMrwHPll/F/Jk6yu9Ntkt/AJSmY+t/MOigxJnOvg6iONrtJFa9Sgs44hkw==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PNWP287MB6008.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:335::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 07:25:26 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%6]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 07:25:26 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	vladimir.zapolskiy@linaro.org,
	laurent.pinchart@ideasonboard.com
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Kate Hsuan <hpa@redhat.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] media: i2c: Add os02g10 camera sensor driver
Date: Thu,  2 Jul 2026 12:54:51 +0530
Message-Id: <20260702072502.7907-1-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0036.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::11) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|PNWP287MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: b940b11a-0978-4c9d-9207-08ded80b163e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|7416014|52116014|1800799024|38350700014|18002099003|5023799004|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ckL2o8WS6EXggiUSC/gckZyHjuXMRtfgU+IzbIK8eDwQUil4N79IxdxXkK+FNcDoIoHYqCfigVuu3X/TKWfTW6qD+N2YyNoFXKTA6VlX4rXL+gSBVccfK5xB3nq8erfUFJHqx5ppWmlOq4I0oUXRt6NYg03RkxeaRifFHnsVgB4aivPnRPx7n5PMM/cSAl1M21RIImsNvlWTjBWQGFp102Xf8l/mv0MFNfHsbJyEpXp+a5pjAy0EyU1g79WewegZCGMIrvDd/iVvbY1Y+7Ly46tWj050/ojShrY9pMuMQb7Zr7gq994fWzoR0HxON9S9Kw7NhM0PNUtp6wBUQO/jp/vY7yOwuWYdkDREDcFwBT0iErVxrUD4SzUy0G3EBrqxv/wKxC599DlFIkHhfYDDZ8TRp0rciknPpt7AIBcTZNb4rnt8kDssACaRsWK2Fc+yH9/MRW6/IodzSTy3vxJSuqsRt1jMz/3JKVwnOxOuGsYWQxfRaspVBjGEpLYyrxG0vTI9lGv0vKw23XMsUZBLMeJOPwfgScZLGwJoNKiELfpXXtrwHNxqYmmT8t44iiQl90j8n3d7ssVu81n/SeI5AmEfGg7dpMYvXKcADUOGH/EI2JzN2J1L0C61Y+uHjKug4CDg8nwDMzrYbpR/RGXHgjelkz75krbeWaqAA+HUKyy1drx+xVslbLVlntWv/4ZSagJCJafM8aNskxhm/VJlyzARxtRNBPA/1c6cSGy0lFs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(7416014)(52116014)(1800799024)(38350700014)(18002099003)(5023799004)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2jwEXes1NSZEdLFvhXoJ6DkmUZngdrLQv3WyEhA70Qbs9G+UhA8+QttJplha?=
 =?us-ascii?Q?VdQgKh8Qfd8veoQ1vOi5AFETdcVxsM5xwlODse2uu9X5phIHwu3+RSyPNlTo?=
 =?us-ascii?Q?Xwmq1GC8p1F8fm4xIh1jY0r8PG6EFHOB1d2YEMFVaw+Kx6qqRrUgZ5m5t+9W?=
 =?us-ascii?Q?ZtM1L0YWwES8k4zfD2v8xbzgBi01EbRw7NcPTrVmxZtonRdIoy2r+ZynzouB?=
 =?us-ascii?Q?aG1fEhawVs6/A9U3l2qg6OHqbJZd6xz+p3UBckuq6pOTg+oAEy+pOJrP2EGC?=
 =?us-ascii?Q?NE0sei0o4jReXeDSGz7dtnwxTDq0zeRogw+bcDJVqyf74jTFUkfgOIiDl9F/?=
 =?us-ascii?Q?tw5CMIV3boG08rb1vyMOXJwTkr7rB+a54rIzu15SCW8bz7cCJH+vPsJHEIfk?=
 =?us-ascii?Q?9nlG9cDcf0P3xJg9kuqu+rjOB+jH4dEK9Ahhph/QVX9lq5tGDluewKWdAYwr?=
 =?us-ascii?Q?wPTTv1OxgXRzJsXDZtQhixD1Vo71wJ80idCMj5mEgOSYbs6Vg2sWdqcV1BYm?=
 =?us-ascii?Q?EGVNjBm0xUA/qmovttGwXuAZ7LphHrzLc7tJfvf+42CPve03i9BnM94tchd9?=
 =?us-ascii?Q?Ko3mEMqN7gGkTEGvVKNe7Vh2maTzxPol0o11I6NU/aavgDOd4ZcUF6/j+9UG?=
 =?us-ascii?Q?ZrLPHDNTCrwd+1C6/yv0njYS2MmVYJQNHWS7ZsMzwYdUQ4DpdbuS+LBMjzds?=
 =?us-ascii?Q?vN+jyRS/RpzlbbpjGgDYbHlE5y4JfOGYL5CGW8BrCYJQ+iFsDgsME7dj/Vuy?=
 =?us-ascii?Q?7er+q1K/heYblqaWM0Sy+Q0ST9OFCSnI7NOcdHW97n76jCMMpyAKOBcTWA4d?=
 =?us-ascii?Q?6GebT48A1oMDRgG9CdF8HutL/aRTQYmNA/8jCcxBabSO50RUZhUdshhucHAy?=
 =?us-ascii?Q?7HYl17v8mJcZOmLDHiwxKRj9KzhpI34YDrMWngnuvs0vkgt0JfXFk2U7g2ia?=
 =?us-ascii?Q?sx8a5bv06QkIAmG3LtOKUP1nKAR5RBmTQK2rSk05c+7iakx69HfeLvZLzYV7?=
 =?us-ascii?Q?n5bWL8bK3zH9f3hUAKbZOqaYtYfhRTpLaJmibi+WqqhwYeuth2hqMYQGDQr0?=
 =?us-ascii?Q?7aHUZZi0Lu4d0yLQLwFPy4vV51rojQrnalmfAOJ69Rt2aYy2WpQ2XeG2mBFW?=
 =?us-ascii?Q?XysWPZTG7IMhrfpj7maDKmN3k6nwSidXqK3tlSoEvevCYQRWmLfjJNEdcaG0?=
 =?us-ascii?Q?h4vWE+cTJOop5K5Qbrxe8vshKypo4waLAm4yx6RPdB7/Gjy0fFvkcHsoW4EK?=
 =?us-ascii?Q?Gs/jX4LRvd26rIAA6nIzOeasoc4nF37z9SgjluRZme2J7Wnvn2TPntjBLj1T?=
 =?us-ascii?Q?lwG/AbGVMmTKXVbqvj3h7aeCkuFMGzWUrcojVtC6PJ9xOWdLalIlw2VaSTho?=
 =?us-ascii?Q?ZafdP7PgEEOIiTusHQajnsgSN4kZ4a14DrWtRQ/HyhC3onuV6l+35A/LPeKL?=
 =?us-ascii?Q?KCNAwdYFHNxOezYiuC7komgTf3jT0gznDjH9j9B12XKUZBPpleWUZ37w/A9t?=
 =?us-ascii?Q?r/AiKpavrudVwegY2TeaLIYRjqHPfzQaOZh1gQLWGFIvK4+Gdbjn91O5pPzS?=
 =?us-ascii?Q?ov7Hji5FAD9T3UvMPdZrD/L02tO9HE7d8m8bBLoZQwvKDFa0K3rdFtkoBnUf?=
 =?us-ascii?Q?YONRVCjzBIMK7S5bZlasRyVatpuOH+6cBqYcoPrn7xKelk8AAGpEUAOJ0ZdZ?=
 =?us-ascii?Q?MYTSJRENbGO5rzt8rlutvcEaDg7YYEHfZR7OtDvI1ZET3bSIseKYalbBp1Tg?=
 =?us-ascii?Q?BImqDjvLrSiCB2bUylw84kevOrRUqkI=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: b940b11a-0978-4c9d-9207-08ded80b163e
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 07:25:26.4638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O++lNQizntJmqL0rqn4PmwioM6t1B4uh0/6jFDGveF9xhPx7/2SvniGnD6oZNSeH5/RKqsTpXm2OCwFO7ZH298OOVUWzxsSwXmG0MTX2GuLNELeKEn02pGvB5ZH9Z5iM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNWP287MB6008
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66294-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:vladimir.zapolskiy@linaro.org,m:laurent.pinchart@ideasonboard.com,m:elgin.perumbilly@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:himanshu.bhavani@siliconsignals.io,m:xiaolei.wang@windriver.com,m:contact@schnwalter.eu,m:hpa@redhat.com,m:y-abhilashchandra@ti.com,m:hardevsinh.palaniya@siliconsignals.io,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,windriver.com,schnwalter.eu,redhat.com,ti.com,gmail.com,vger.kernel.org];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,siliconsignals.io:mid,siliconsignals.io:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E43E6F4B1A

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- vflip/hflip control support
- Test pattern control support.
- mode support 1920 x 1080 @ 30 fps, SBGGR10

The driver is tested on mainline branch v7.0-rc2 on IMX8MP Debix Model a.

v4l2-compliance 1.31.0-5387, 64 bits, 64-bit time_t
v4l2-compliance SHA: 5508bc4301ac 2025-08-25 08:14:22

Compliance test for device /dev/v4l-subdev3:

Driver Info:
        Driver version   : 7.0.0
        Capabilities     : 0x00000000
        Client Capabilities: 0x0000000000000002
interval-uses-which
Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev3 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)
        test blocking wait: OK (Not Supported)

Total for device /dev/v4l-subdev3: 46, Succeeded: 46, Failed: 0, Warnings: 0

V3 -> V4

Patch 1/3:
- Add the required endpoint.
- Carry Vladimir's Reviewed-by tag.

Patch 2/3:
- Address small review comments from Vladimir and Sakari.
- Drop Patch 3/3 as suggested by Sakari.


V2 -> V3

Patch 1/3:
- Drop the fixed data-lanes property, as the sensor supports only a 2-lane MIPI interface.

Patch 2/3:
- Use regmap paging features for page selection.
- Use sd instead of _sd.
- Remove an extra blank line.
- Remove hblank control, as it is not used to set hblank on this sensor.
- Remove an unnecessary error check.
- Reduce the scope of the ret variable in os02g10_set_pad_format().
- Rely on the control value for link_freq_index.
- Call os02g10_parse_endpoint() before initializing regulators, GPIOs, and the clock in probe().

Add new Patch 3/3:
- Add dynamic mode configuration instead of using a hardcoded specific mode, as suggested by Laurent.

V1 -> V2

patch 1/2:
- Corrected $id to ovti,os02g10.yaml
- Fixed data-lanes property structure to use proper items format

patch 2/2:
- Mode-specific register writes handled dynamically.
- Moved page 2 registers into a dedicated page 2 block.
- Used pm_runtime_get_if_active() in set_ctrls.
- Resolved negative hblank issue.
- Improved error messages in disable_stream.
- Updated V4L2_SEL_TGT_CROP and V4L2_SEL_TGT_CROP_BOUNDS.
- Added my name to the author list.

Elgin Perumbilly (2):
  dt-bindings: media: i2c: Add os02g10 sensor
  media: i2c: add os02g10 image sensor driver

 .../bindings/media/i2c/ovti,os02g10.yaml      |  94 ++
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/os02g10.c                   | 945 ++++++++++++++++++
 5 files changed, 1058 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
 create mode 100644 drivers/media/i2c/os02g10.c

--
2.34.1

