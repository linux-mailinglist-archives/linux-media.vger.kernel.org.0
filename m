Return-Path: <linux-media+bounces-54757-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKOQIPDKqmlWXAEAu9opvQ
	(envelope-from <linux-media+bounces-54757-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:39:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8378220C84
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D597F313B75A
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 12:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317A8243376;
	Fri,  6 Mar 2026 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="aYajRy1X"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021086.outbound.protection.outlook.com [40.107.51.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E5A2264DC;
	Fri,  6 Mar 2026 12:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800457; cv=fail; b=OdHYO25Gbo4tsyH0/pkAVxlQ1feHFIK3ZG/YninVpGcZ2N+IZe9NWw/65lTSpYjiDoYHUjN4uENAiAghv1PdqnXin5FgZPwcOtp9Tp9QdekRvxrucGvW6L0KDemZQ8NX+CJfhAI3+wuW7l3vHphY7k8FfImOD3vl+F4LaUC9fU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800457; c=relaxed/simple;
	bh=fwdlHQgGpzJd8qdYRVnTWNlFUfgbrkvqFPgVET2ARAE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jZ/Pd3oQU/FvhMTgkQbcxPuURduDS4RynPokBlKum2+FiQ/CMPwcLWzmRjWKPhW+RwYWu/mIYSt+kV4/heJ3nFnCmdTgTfOviMJUQ70kpl3ycCZDmIIFuXqz0ZunNOKKQhHSVYLay02iRSzyx3DIRb5PPhvcj6tcskeFipWDv7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=aYajRy1X; arc=fail smtp.client-ip=40.107.51.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbcBWZnGBjwhj0atTksN6QH952N6LQ4Ggm/q0e0sgwWikJxRBeIadACiqisu7fx1XRls+NHo7/ToEuE2gDePkrW8rQuCrbw6U7ANdFQIggDbsubA1LnVrhTcpLZHZ+ieohZfSAo+/ksWUY6S4KNIf56Jpt//nM/GcWOb2FlN6L3/Dt7TZno+F06pH6ZLHWcbhtv7ZMRV1bPrEhpb8cTOt9IRIVJwJYf+J+CUt/ygOX++KBG3wXoYCgM8hL68JWK93DhoVXAo8cuc0OLOwnS11gr0+QvBOUiFy2ueIv3XkAj/oHxR0EbY+wWAgo8SHwsPe+B+yZ1IV75qhtGfB9HXFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHkWPMnKM0x5p+lioiRbQkQ0krv1WZMGAkFOTB8UGUY=;
 b=vdXE6smSVbdEb/Dd48t61DxPwWzM8SN4rZ9etEimutqO8cgb3yJNrBIZNnoA3CXckaYsFWyww5J+Y06zgObeIQNRTct+upFUHahNvrpSHWxVbAGumDpicTRQ/NtHmlehOfy8I3NxGFSCE4VQm8u7G4KreM163jZLwOr8OCgsRkbSSvtHbDNMJA4KN0KBNeq3hCSL4kDHYEY6j2MCxw9iWUWe97qaT3W6pTCG3dpWzChDlb2uLKtEfNN4Juf6XRET0K4yQWBMGS5almXEoP9QN9GLHo97de1D46UUh/3Sh0CZ9m8YucJzvt55PlU7f1dy3PnkP8mEcIGeuSYr5vkE/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHkWPMnKM0x5p+lioiRbQkQ0krv1WZMGAkFOTB8UGUY=;
 b=aYajRy1Xv74PuH55cJKqY4XZggJhayVu4zWPSJnQw8+yB6Tg1QrU3whAxqZEW1dKVK5eOYvcTbsoR7lfEqt/esL6kIQII9ZFGCYNcPFsyWNqq/MxEccMFL5LlU5pFDLpY3fgahQW9r2wVFt4A4g7GZQHp7rMzEFGA8oLLXnCc9prXGr7K+FCUtoWIhvJXf+h43IHdsWau+tcOwId6keNPPH8wjgakmLsJSi76/TV9l+ZRz3dCcIE9Q0sBuoDM/Dv8319vgs/bJXk/NTjD5LDpWqOG3AnDCkQewwrZZM7SM7LKJo1rXvUPciM5g2yqyeoD5tmeijzVJqQcB2Wzt49pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB5365.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:30b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 12:34:13 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 12:34:13 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: mehdi.djait@linux.intel.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/13] media: i2c: os05b10: split common and mode-specific init registers
Date: Fri,  6 Mar 2026 18:02:53 +0530
Message-Id: <20260306123304.76722-4-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306123304.76722-1-tarang.raval@siliconsignals.io>
References: <20260306123304.76722-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::17) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNYP287MB5365:EE_
X-MS-Office365-Filtering-Correlation-Id: 1050c43e-213a-46a4-de27-08de7b7cac57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	l3ib90Wdkr1bWCy1nWZXs0bsKz+ejiwJOey0kZjxn9uI/mxH0VHxwf1kiI38vj+NZ3zgr2x7cALuZ1yR6SNioRGPqBlI8EwVpralsnTXxKD7fx3SshAAL3v/aOgQtBf7EXusdz5mkE5BhvDdDFts3P4wc2DY0ALgespnkkhEu3+8V8whOFDZLreq3wiueoJ3VxMGCQ3Yp2b6NMEe3eu3axnkaucdSBW2VQc9/WNpTjJeBy7uz0/MRZQbHWcktMvXuYwRcpVNPIYME3RxUqnrJUvR7mfit4v0/CUNxNuSbT5OJhLYJdxI5661s+0kYcdW6IRH4qSoZPsJY9x8em5nOZtD2Q/32m3gUeFi2eJNMS3muw60mU4auO+MDRmJgWub5/8jtpZZWpzRM1P7XGQo4ziB9plvBgoI+f+Oq6LfkybnMdJHyctaWJQ0EYotlRXpdlJHtHXjGUiDdNOcJa4ShhI7b5IFLBViSfOY9Sj1Pe5DkA051HtRU1Pod4Xra/BFMxc6XMGe/wAJSf9WcJFmusAV/GDU4sOPNc+t4a/vnEW80oc8ECZKPEAqpzE7CT57NgVJYvSBbHwqIM6Uyg+S4+2rXb/1rOsbu9U++iluVAUmz6h1HF2WPOrXUFoT4Hs8y9z4SHhH82EgaOlhIc9rDelCuyoJtDDmz5dGTW4Hupqrqxlu6uwcoEEK/H1O92dYE/zMK8UH8MIsHH4QSkEJRbVzQnnaSuLLa5/06HEoH3xcDXjoYeKAJyo3qp+bYJStOZi1f1+JAS7jUs61PHpbeaJ1hy45j8oGrbEVAj0BLwg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C7HxadRLfI1hmx0fweAiWXXeAPoGP4tqMuEC5B6WN/89xIhkRCIEZ4OrGkEL?=
 =?us-ascii?Q?XdcBIeIzXLIZccmPEUVPgv+fLEYSDkJbamNiy/QY2yPoENaLiwkfq9AXZpe6?=
 =?us-ascii?Q?P7UG45VPcuIyM/1TgPOoXv7oc9Dpne4dVMHBP0DwGuesMLcc5upM098XjF+V?=
 =?us-ascii?Q?J9vtDKc5mPcWhSiqyYDzliL4x0sJsT1v7CclzD3PFYvjyS/qQZ01nOwmP0U4?=
 =?us-ascii?Q?0kI/hxtzFE80MYHOo3x4gNplJUaC9wvunF7AYVCNuGMbCoU3CsJ1Gh1enNcS?=
 =?us-ascii?Q?GG11oClFmwUuPGOnuWXgM2W8S88RfOmJXskE2m1OsGSCRtKFV3L7cDJik29W?=
 =?us-ascii?Q?YNXxTVWxwfi0TECqSwpvGtVKf6QjBm1wig2L4r6J4em5tkoM/iXIVk1/rhZp?=
 =?us-ascii?Q?xpKAW+HzYOKz8t1iRT4VxL8ZxA6OrgMTXhUyGiwV2twk98uLk81tRz3NjQXJ?=
 =?us-ascii?Q?TiEmR0gs4w0B3j3XRRt1CB3sR5KWXJHh0SfDCS1Yz8tI8SjyBlkONhe9Ia3r?=
 =?us-ascii?Q?8uI7zGH5GbPCD0vhzooQtu/NC4G2GBCK5jyhutcHrY6pxyjnhXynenrPlFi9?=
 =?us-ascii?Q?pEf5x2jtGMIdhpjtG9/aNcxtk7jkovWYt99c35Jj+p5wMiXTV/i9wgTHZ9yw?=
 =?us-ascii?Q?SxjzwzskQ8xIV++5guO4tTD7jb8QxDaYac4t1gZTEs9FfeK3n/WTjAi/H8cP?=
 =?us-ascii?Q?r3RJ+bEvFAmj+3I75AwdQGcXOWbC6OWPjdIE/nyihwMLcTYQbvBFFM4jczEZ?=
 =?us-ascii?Q?WZZ7Y7z+Q5rwAraZadoLnn2WDb/e/qIJgjn2M+VpgUk2UELldhohVKwD2G7a?=
 =?us-ascii?Q?Nc0ir2CF/GCE+KDGRgNsrA5NWW0LZskJ2aynyOAZLjqdmUGmuiK2GH++LWnT?=
 =?us-ascii?Q?b4SvZALPR7JeXn/u/K5AKsHCuZO7LftTjgp/bTN4Tj89bAM8pyXVFQMV3Jyg?=
 =?us-ascii?Q?px9QqBFkgRvOnP7myTZ99KcjEUf8ZYiAROlcV3YjUYjdwAPwx7RfTFMggLpB?=
 =?us-ascii?Q?yRHkbi2qHt+SW436rSS4KyPXZES+vwlc/QKcGP+iYE7IOhyzPmBFUbgZaenK?=
 =?us-ascii?Q?O2c6Eg/xkhTrqC695M0i5g2CnhtZXS6DVfUzJ59cniXseJ5p1FZKjzQVtBWL?=
 =?us-ascii?Q?JiEQhecFuHdgys3tsHjQkBawCgjJJN0AkXqaYy8BcmGY/CqeZ5s6ta7rFUB2?=
 =?us-ascii?Q?NiEXIMGOFQMZp3AOqN9KBqqJQVxGYuqQ360otbU/RNikUMcWyp0a3P9XCcyb?=
 =?us-ascii?Q?XmYR6vLqMVRJPbsqstkljsSKcJVXpwXTL1vLnPJDGYxTB5tKOSiLc6GZkrel?=
 =?us-ascii?Q?jz3u7qUSp0JXuWS8sS47uSmgJ23oA4htMBFn5tFr1hr0Gv+2dFeXdirtIvMp?=
 =?us-ascii?Q?hCvKW5ijRQmL4VXmsdKZXyYqNMJvMkjocolSItG3i9aXR4S+KlIVi9EP/WzD?=
 =?us-ascii?Q?h5M0TczlXw3U2MzxDcH1xDOWswkZaUOzsrfSm4xbrq72/4xOF5dCFU5mZPt8?=
 =?us-ascii?Q?7OTRu/TcXoxqlKgccDnUpEVYWzzusfTLcSbriwuT5/tYfv944pDWEPRMDtkS?=
 =?us-ascii?Q?a4TMVowz4gHNM1+CcXF9phH0PpEtP0PMM69ZfwRnEm+D2gu8yi2nd7jgjMZJ?=
 =?us-ascii?Q?p0L4qxTIwM3DTyHHxOGdDq+xz7QiDnabvgwnZAagf1hHtCvSacXgq4fHY8Ka?=
 =?us-ascii?Q?D9RPo+NJz00/vlEda3yM5HJvjcOWYMNIXcpJtLrhDqcJ4odL5Ps1KmHtAQH5?=
 =?us-ascii?Q?gEfdptERytUY332S4QxM+7TZyzNR2JQ=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 1050c43e-213a-46a4-de27-08de7b7cac57
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:34:13.2644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o09c9TFw5Upx521uINu/MntNDv8lASN09p+Orix+ZvhRoeFMM706wcErpeqyrbMBxyOsr5lyAihTzN9un1PSfbWe62YknN/1qeW/sBZGPC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB5365
X-Rspamd-Queue-Id: D8378220C84
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54757-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Separate common initialization registers from mode-specific settings.
Move resolution-dependent registers into a per-mode register list and
program them during stream enable.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 118 ++++++++++++++++++++++--------------
 1 file changed, 74 insertions(+), 44 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 89a564f70818..b1d9eaa473e4 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -122,37 +122,34 @@ static const char * const os05b10_supply_name[] = {
 };
 
 static const struct cci_reg_sequence os05b10_common_regs[] = {
-	{ OS05B10_REG_PLL_CTRL_01, 0x44 },
-	{ OS05B10_REG_PLL_CTRL_03, 0x02 },
-	{ OS05B10_REG_PLL_CTRL_05, 0x32 },
-	{ OS05B10_REG_PLL_CTRL_06, 0x00 },
-	{ OS05B10_REG_PLL_CTRL_25, 0x3b },
+	{ OS05B10_REG_PLL_CTRL_01, 		0x44 },
+	{ OS05B10_REG_PLL_CTRL_03, 		0x02 },
+	{ OS05B10_REG_PLL_CTRL_05, 		0x32 },
+	{ OS05B10_REG_PLL_CTRL_06, 		0x00 },
+	{ OS05B10_REG_PLL_CTRL_25, 		0x3b },
+	{ OS05B10_REG_MIPI_SC_CTRL, 		0x72 },
+	{ OS05B10_REG_MIPI_SC_CTRL_1, 		0x01 },
+	{ OS05B10_REG_DIGITAL_GAIN, 		0x0400 },
+	{ OS05B10_REG_ANALOG_GAIN_SHORT, 	0x0080 },
+	{ OS05B10_REG_DIGITAL_GAIN_SHORT, 	0x0400 },
+	{ OS05B10_REG_EXPOSURE_SHORT, 		0x000020 },
 	{ CCI_REG8(0x3002), 0x21 },
-	{ OS05B10_REG_MIPI_SC_CTRL, 0x72 },
 	{ CCI_REG8(0x301e), 0xb4 },
 	{ CCI_REG8(0x301f), 0xd0 },
 	{ CCI_REG8(0x3021), 0x03 },
-	{ OS05B10_REG_MIPI_SC_CTRL_1, 0x01 },
 	{ CCI_REG8(0x3107), 0xa1 },
 	{ CCI_REG8(0x3108), 0x7d },
 	{ CCI_REG8(0x3109), 0xfc },
 	{ CCI_REG8(0x3503), 0x88 },
-	{ OS05B10_REG_DIGITAL_GAIN, 0x0400 },
-	{ OS05B10_REG_ANALOG_GAIN_SHORT, 0x0080 },
-	{ OS05B10_REG_DIGITAL_GAIN_SHORT, 0x0400 },
-	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
 	{ CCI_REG8(0x3600), 0x4d },
 	{ CCI_REG8(0x3601), 0x08 },
-	{ CCI_REG8(0x3610), 0x87 },
 	{ CCI_REG8(0x3611), 0x24 },
 	{ CCI_REG8(0x3614), 0x4c },
-	{ CCI_REG8(0x3620), 0x0c },
 	{ CCI_REG8(0x3632), 0x80 },
 	{ CCI_REG8(0x3633), 0x00 },
 	{ CCI_REG8(0x3636), 0xcc },
 	{ CCI_REG8(0x3637), 0x27 },
 	{ CCI_REG8(0x3660), 0x00 },
-	{ CCI_REG8(0x3662), 0x10 },
 	{ CCI_REG8(0x3665), 0x00 },
 	{ CCI_REG8(0x3666), 0x00 },
 	{ CCI_REG8(0x366a), 0x14 },
@@ -236,7 +233,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x370f), 0x1c },
 	{ CCI_REG8(0x3710), 0x00 },
 	{ CCI_REG8(0x3713), 0x00 },
-	{ CCI_REG8(0x3714), 0x24 },
 	{ CCI_REG8(0x3716), 0x24 },
 	{ CCI_REG8(0x371a), 0x1e },
 	{ CCI_REG8(0x3724), 0x09 },
@@ -245,7 +241,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3730), 0xe1 },
 	{ CCI_REG8(0x3735), 0x80 },
 	{ CCI_REG8(0x3739), 0x10 },
-	{ CCI_REG8(0x373f), 0xb0 },
 	{ CCI_REG8(0x3740), 0x28 },
 	{ CCI_REG8(0x3741), 0x21 },
 	{ CCI_REG8(0x3742), 0x21 },
@@ -291,8 +286,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37ac), 0xa0 },
 	{ CCI_REG8(0x37be), 0x0a },
 	{ CCI_REG8(0x37bb), 0x02 },
-	{ CCI_REG8(0x37bf), 0x05 },
-	{ CCI_REG8(0x37c2), 0x04 },
 	{ CCI_REG8(0x37c4), 0x11 },
 	{ CCI_REG8(0x37c5), 0x80 },
 	{ CCI_REG8(0x37c6), 0x14 },
@@ -301,7 +294,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37cd), 0x17 },
 	{ CCI_REG8(0x37ce), 0x01 },
 	{ CCI_REG8(0x37d8), 0x02 },
-	{ CCI_REG8(0x37d9), 0x08 },
 	{ CCI_REG8(0x37dc), 0x01 },
 	{ CCI_REG8(0x37e0), 0x0c },
 	{ CCI_REG8(0x37e1), 0x20 },
@@ -314,25 +306,10 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37f5), 0x00 },
 	{ CCI_REG8(0x37f6), 0x00 },
 	{ CCI_REG8(0x37f7), 0x00 },
-	{ OS05B10_REG_X_ADDR_START, 0x0130 },
-	{ OS05B10_REG_Y_ADDR_START, 0x0000 },
-	{ OS05B10_REG_X_ADDR_END, 0x0b5f },
-	{ OS05B10_REG_Y_ADDR_END, 0x07a7 },
-	{ OS05B10_REG_X_OUTPUT_SIZE, 0x0a20 },
-	{ OS05B10_REG_Y_OUTPUT_SIZE, 0x0798 },
-	{ OS05B10_REG_HTS, 0x06d0 },
-	{ OS05B10_REG_ISP_X_WIN, 0x0008 },
-	{ OS05B10_REG_ISP_Y_WIN, 0x0008 },
-	{ OS05B10_REG_X_INC_ODD, 0x01 },
-	{ OS05B10_REG_X_INC_EVEN, 0x01 },
-	{ OS05B10_REG_Y_INC_ODD, 0x01 },
-	{ OS05B10_REG_Y_INC_EVEN, 0x01 },
 	{ CCI_REG8(0x3818), 0x00 },
 	{ CCI_REG8(0x3819), 0x00 },
 	{ CCI_REG8(0x381a), 0x00 },
 	{ CCI_REG8(0x381b), 0x01 },
-	{ OS05B10_REG_FORMAT1, 0x88 },
-	{ OS05B10_REG_FORMAT2, 0x00 },
 	{ CCI_REG8(0x3822), 0x12 },
 	{ CCI_REG8(0x3823), 0x08 },
 	{ CCI_REG8(0x3824), 0x00 },
@@ -342,7 +319,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3829), 0x03 },
 	{ CCI_REG8(0x382a), 0x00 },
 	{ CCI_REG8(0x382b), 0x00 },
-	{ CCI_REG8(0x3832), 0x08 },
 	{ CCI_REG8(0x3838), 0x00 },
 	{ CCI_REG8(0x3839), 0x00 },
 	{ CCI_REG8(0x383a), 0x00 },
@@ -363,26 +339,19 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x38a7), 0x04 },
 	{ CCI_REG8(0x38b8), 0x02 },
 	{ CCI_REG8(0x3c80), 0x3e },
-	{ CCI_REG8(0x3c86), 0x01 },
 	{ CCI_REG8(0x3c87), 0x02 },
 	{ CCI_REG8(0x389c), 0x00 },
 	{ CCI_REG8(0x3ca2), 0x0c },
 	{ CCI_REG8(0x3d85), 0x1b },
-	{ CCI_REG8(0x3d8c), 0x01 },
 	{ CCI_REG8(0x3d8d), 0xe2 },
 	{ CCI_REG8(0x3f00), 0xcb },
-	{ CCI_REG8(0x3f03), 0x08 },
 	{ CCI_REG8(0x3f9e), 0x07 },
 	{ CCI_REG8(0x3f9f), 0x04 },
 	{ CCI_REG8(0x4000), 0xf3 },
 	{ CCI_REG8(0x4002), 0x00 },
 	{ CCI_REG8(0x4003), 0x40 },
-	{ CCI_REG8(0x4008), 0x02 },
-	{ CCI_REG8(0x4009), 0x0d },
-	{ CCI_REG8(0x400a), 0x01 },
 	{ CCI_REG8(0x400b), 0x00 },
 	{ CCI_REG8(0x4040), 0x00 },
-	{ CCI_REG8(0x4041), 0x07 },
 	{ CCI_REG8(0x4090), 0x14 },
 	{ CCI_REG8(0x40b0), 0x01 },
 	{ CCI_REG8(0x40b1), 0x01 },
@@ -402,7 +371,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x4305), 0x83 },
 	{ CCI_REG8(0x4306), 0x21 },
 	{ CCI_REG8(0x430d), 0x00 },
-	{ CCI_REG8(0x4505), 0xc4 },
 	{ CCI_REG8(0x4506), 0x00 },
 	{ CCI_REG8(0x4507), 0x60 },
 	{ CCI_REG8(0x4803), 0x00 },
@@ -414,7 +382,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x481f), 0x30 },
 	{ CCI_REG8(0x4825), 0x34 },
 	{ CCI_REG8(0x4829), 0x64 },
-	{ CCI_REG8(0x4837), 0x12 },
 	{ CCI_REG8(0x484b), 0x07 },
 	{ CCI_REG8(0x4883), 0x36 },
 	{ CCI_REG8(0x4885), 0x03 },
@@ -447,6 +414,42 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3222), 0x03 },
 };
 
+static const struct cci_reg_sequence mode_2592_1944_regs[] = {
+	{ OS05B10_REG_X_ADDR_START, 	0x0130 },
+	{ OS05B10_REG_Y_ADDR_START, 	0x0000 },
+	{ OS05B10_REG_X_ADDR_END, 	0x0b5f },
+	{ OS05B10_REG_Y_ADDR_END, 	0x07a7 },
+	{ OS05B10_REG_X_OUTPUT_SIZE, 	0x0a20 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE, 	0x0798 },
+	{ OS05B10_REG_HTS, 		0x06d0 },
+	{ OS05B10_REG_ISP_X_WIN, 	0x0008 },
+	{ OS05B10_REG_ISP_Y_WIN, 	0x0008 },
+	{ OS05B10_REG_X_INC_ODD, 	0x01 },
+	{ OS05B10_REG_X_INC_EVEN, 	0x01 },
+	{ OS05B10_REG_Y_INC_ODD, 	0x01 },
+	{ OS05B10_REG_Y_INC_EVEN, 	0x01 },
+	{ OS05B10_REG_FORMAT1,		0x88 },
+	{ OS05B10_REG_FORMAT2,		0x00 },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3620), 0x0c },
+	{ CCI_REG8(0x3662), 0x10 },
+	{ CCI_REG8(0x3714), 0x24 },
+	{ CCI_REG8(0x373f), 0xb0 },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37c2), 0x04 },
+	{ CCI_REG8(0x37d9), 0x08 },
+	{ CCI_REG8(0x3832), 0x08 },
+	{ CCI_REG8(0x3c86), 0x01 },
+	{ CCI_REG8(0x3d8c), 0x01 },
+	{ CCI_REG8(0x3f03), 0x08 },
+	{ CCI_REG8(0x4008), 0x02 },
+	{ CCI_REG8(0x4009), 0x0d },
+	{ CCI_REG8(0x400a), 0x01 },
+	{ CCI_REG8(0x4041), 0x07 },
+	{ CCI_REG8(0x4505), 0xc4 },
+	{ CCI_REG8(0x4837), 0x12 },
+};
+
 struct os05b10 {
 	struct device *dev;
 	struct regmap *cci;
@@ -469,6 +472,11 @@ struct os05b10 {
 	u32 data_lanes;
 };
 
+struct os05b10_reg_list {
+        u32 num_of_regs;
+        const struct cci_reg_sequence *regs;
+};
+
 struct os05b10_mode {
 	u32 width;
 	u32 height;
@@ -476,6 +484,7 @@ struct os05b10_mode {
 	u32 hts;
 	u32 exp;
 	u8 bpp;
+	struct os05b10_reg_list reg_list;
 };
 
 static const struct os05b10_mode supported_modes_10bit[] = {
@@ -486,6 +495,10 @@ static const struct os05b10_mode supported_modes_10bit[] = {
 		.hts = 1744,
 		.exp = 1944,
 		.bpp = 10,
+		.reg_list = {
+		        .num_of_regs = ARRAY_SIZE(mode_2592_1944_regs),
+		        .regs = mode_2592_1944_regs,
+		},
 	},
 };
 
@@ -655,8 +668,16 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 				  u32 pad, u64 streams_mask)
 {
 	struct os05b10 *os05b10 = to_os05b10(sd);
+	const struct os05b10_reg_list *reg_list;
+	const struct v4l2_mbus_framefmt *fmt;
+	const struct os05b10_mode *mode;
 	int ret;
 
+	fmt = v4l2_subdev_state_get_format(state, 0);
+	mode = v4l2_find_nearest_size(supported_modes_10bit,
+				      ARRAY_SIZE(supported_modes_10bit), width,
+				      height, fmt->width, fmt->height);
+
 	ret = pm_runtime_resume_and_get(os05b10->dev);
 	if (ret < 0)
 		return ret;
@@ -669,6 +690,15 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	/* Write sensor mode registers */
+	reg_list = &mode->reg_list;
+	ret = cci_multi_reg_write(os05b10->cci, reg_list->regs,
+	                          reg_list->num_of_regs, NULL);
+	if (ret) {
+	        dev_err(os05b10->dev, "fail to write initial registers\n");
+	        goto err_rpm_put;
+	}
+
 	/* Apply customized user controls */
 	ret = __v4l2_ctrl_handler_setup(os05b10->sd.ctrl_handler);
 	if (ret)
-- 
2.34.1


