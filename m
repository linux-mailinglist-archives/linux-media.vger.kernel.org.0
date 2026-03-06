Return-Path: <linux-media+bounces-54755-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JyrCsPJqmlWXAEAu9opvQ
	(envelope-from <linux-media+bounces-54755-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:34:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C164B220B4F
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A4E63014A0B
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 12:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4C022D792;
	Fri,  6 Mar 2026 12:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="WXWL9oFr"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021110.outbound.protection.outlook.com [40.107.57.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB9E2236FA;
	Fri,  6 Mar 2026 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800448; cv=fail; b=godnRj0g7Ca5FLs0OO14qk4ozIk7xG+Y3zHaYavl8S/3Z0MI9JELXr5XrHW8Pg6iB9yjCpoqV2pSiBamsNNRY00Twj7JlRSOyIJTiBZScGYyl7InQMhE+qj4Bdiwg8/bgmT6VDF1gb38mIoewjVD2e43w6lCYsX4YcEGD/aT+fQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800448; c=relaxed/simple;
	bh=j487d20LzsiCx/dx1n6YsS+JuGGlgtgMjxJCngDXOYI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jpJ7RcSP5TFre2vyegyAt1MZ1yaQEj0aYdR18jh4ZoMaCFBQLhbsG7U17uBDyWZEfbFvXLIbevntM4Og5Pen+y0YAQYAC4d1XdYqPWokpIM3NNcTTIzf3zX+/vnMmY98z+vHnTq3Ut2b9skTTazos6E2JK5bWQ61+JFe7lmDK5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=WXWL9oFr; arc=fail smtp.client-ip=40.107.57.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNhe/rbDas5TtEP4Nm4v4kdVArE55yUoJOyJbaWJa50AN40eKDzSDvis5I0T1jeXXuXMBftTSvNGFIkoxPacfzKyNeAdy1kvXuQAP9rBCvBRNdr3CaHlKmCzrGZwY/9NqGzwPD86pK9e3taKQD8wm6MetLej1BxOxWvWDTS2NI+PhLdATTM+bxygGtUdZIJuYxqzU4WfYsYeYH+HOzcruMMUmW29KGHxn6ib/d7F3iRlzIvSWLpKzTKygkl7Tt3OaIrLShavfxNGw/ys7HB8QGWl4p/VFC2UxOVMZd+SSdFjkYKQqL3oxlfE4Pz/cNat9Vn9Dft7gQ4ckdUtjuz47Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfT1FTWH07/GhM1HnVYZesFAMZixZd7vBbWVj2SjaJ4=;
 b=deSJsY4/QL1KC+7aTWMEtTL56E8HpSAkqnIGDk3bggkdLbYTXubuIEro2BgPorKWZrmCYSXEVVTbSQB0+EpwYCWBQJZUdkKZlY0V6MUt1HKLFusayLWNKpxR+XQRBHqkCUWAQ/fN/FJkIzSEGdUq28tY++Z9FkC1Q5fOdYwjpJMZ6+TqN5CMv83C2kxThbtjz47e9kqKNTojlR9z8/hb931OeKrvALl3MNtWSsI0COqAQOlfgOoPJy39NcLJIe1ncgiZwOobbh+ydE9C4thNUlkMDBLLFoYefuqDqfQO1YHAMwYv5JD8b6zfzvGskTzfFPVudKiOKsXAyTjSJUxIUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfT1FTWH07/GhM1HnVYZesFAMZixZd7vBbWVj2SjaJ4=;
 b=WXWL9oFrxHJXdX5gUF7W57ujiy+LXNaLKumfhVuzIH5vT3BzvX3Zcb4IpV49dNAXk+kxP40JOqeArpWoH7DGAQT6qoraCqziOBqQV6EMT+50wWHrUpi8KZvOiNNlbFtAa624gBvH91550mzZkv9G0GMw6ERxVKeurhLxxOEy5rbQoptqGqo1oncwEpTSu6fIf1sS6TevYvw2tzbBPkY2UYuMiV8ZPHKxysLuCtNMX6LLxZzGZ+4JHhg8KCZ6wxw1xs1q1M+qZxA6/q29jjgZj2tq8SrVsBpsnHnJEs2qg22iNkkqNdvQSoUPOfX1EHXE+PaoK28iGE3lHPY1SyuHZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB4150.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:28f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 12:34:06 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 12:34:06 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: mehdi.djait@linux.intel.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/13] media: i2c: os05b10: drop unused group-hold programming
Date: Fri,  6 Mar 2026 18:02:51 +0530
Message-Id: <20260306123304.76722-2-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNYP287MB4150:EE_
X-MS-Office365-Filtering-Correlation-Id: 49914508-e6bd-4f3c-80a8-08de7b7ca7fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	9fqeJ31nS4iNBNASVFhIleUqJGAcJV+Olx+gv51Y92Vj1lL8kGxoWS/fZdlCr162qMkyRhKiKpue25NSII+/rAVq5jcYg9arqNzm1LJm7yrarZctxQUnW1ncue4vehHJyx0mzumyKInsl67J0cL12GEuC/awCbsdTF0uwYzh5fmE2H4DhEX/+j4fN4Lm/B5xN2wsAXXiy2gjUc4mRrIGc/eRlRA8Or7XSo+uFieR9//qU9Z9gXoFcWwIqhmHi/ShPHazg98jVv0Jm9ZDvTI0/s8UnJ/4pxCcJ6dV4pXElnvPzGkxUsad65uqP8EJFpgfItslhqdyqDyCWxHaDVaonTI5altL4upakcN/FwR+u9ksytR3NT8dWCtbrftZz3shz2bJltRFfC3v/PFPMXQUfprwdFVRr0VKJeu7cP77U7zkygTxV2eKHjeVSt1S9j2104B6jnT1u3FJ/Uvq2XEYTDIqIBQD64Uex+S5r7wUZe8ufvdg31LQLdgV42FagQhXCv8xn/2FUGh38IJsUeqX3Hfr9yj1cyqiTMUMR6KlAtZ6tCCn3R4KoIabZSvd089cBI85u5PuOOatiHE4dGIZt6F2dPg6RR01BDcT1sbH6DpkcYAG368DJZpd7kOo3daM9eu+JDYHpJ6XmQYp3MF8XKtYD93wvLDseO/UevMfozaCBQKkADG3U2TTaT6YanQ/G/xBeeAtr80Jvdxr424qbVVhcDjtW+V9n1bv+DoOzji+bOFRRttFjgieFVCKkObgZAhV6UgiyxXvByHIBDiy3R2tllwcoUEjoqvrWwlvI8s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QB2Jwwggw8Gsd45fixiRPYnLBeDXrL7aCsbfrbp0Uf8KeiuqKU5D4HN4J0sI?=
 =?us-ascii?Q?gVhRxp+qMluOiTDNg0z8veN8sSxcFqL5Acd9YsNa97uxGFKIY6B+8qN5FZqr?=
 =?us-ascii?Q?OnPjAPOsqLuY+mabp2EOy9y1OYDtOQS47e2IFDPBBOPu/KzsAZa0b1kCD523?=
 =?us-ascii?Q?8d0p4n9Avu0ZHADhWUenTjetUW8PxOJJdFr8xwr3MFl9OX6xM6Zk4W7O1J42?=
 =?us-ascii?Q?CMu2eKwjDaYEOgbTqNvhOlqr1cWNK7fjpfJ0D14ZXOGzKhG+J5ct2SPGBhwR?=
 =?us-ascii?Q?Gf+Cfhh+0D+JbFMOzgfW80AWIg6pyG0zM+9N3hYWee+37lFlkyaam7zL5jDh?=
 =?us-ascii?Q?sl2IFozefdCjoHfUXvBEd2r3DMALW8FatXoIROLvL8hknaJpGDwLhzS6fIoC?=
 =?us-ascii?Q?QEnsN4mEo1A9IZjCxbuJQJ+ntnegHia4B1VZN05TRNOLJMbMB0RvBzdJjriH?=
 =?us-ascii?Q?rZRzh6xF4n7t89f+klbUJCiyneSDWn/rDwNI9LEAhGEFJoZTC/VNTIRP0Hhm?=
 =?us-ascii?Q?Pz864kCNkt/vl5X1jZkr98/HYJBW6nTzWVd9PGmv3QS1o0qgC42OKtvZc/Bl?=
 =?us-ascii?Q?2XESVHGQ5bK/T3r2nreToCM6Tgln+psIgv/j3A2PHsomUmYykZu2qWUqj2y+?=
 =?us-ascii?Q?3E51ngUwk4SzJoalEPqnNzl4yTMIDOWc01xcliqcsC3n9ou50ajjtNB1fK+n?=
 =?us-ascii?Q?wHTYmih1joj3+RrvAQJxSWBAwqgvtz1dW8EjivGZH9PQ36YowOBiusScsucS?=
 =?us-ascii?Q?ISewT2G38EK0RgZ6bcNHV6sHhW6zHceG3kHpcoa4a7nRdpvR5E5Q9PZ5qnuE?=
 =?us-ascii?Q?p51mwy4/kVwV6ZWIoWOOjXlTypKhr1uxrlU/LQgn3BMqjewmaIetXoWEevZq?=
 =?us-ascii?Q?nu3+WJ0RuU5C0kKehQ6Ci+XSHxZCMZIP+twHus0fDqhwgbHP9N0mOWERF3HI?=
 =?us-ascii?Q?h/3VnKTEdeMAmuzIs42c4PMa74P4wpJA/bQSgN9qehemQKvJXTD2Q4ySbCWi?=
 =?us-ascii?Q?BWb6vBq6axS3ZG9WhCFvma2UBe4FoipEWI3SDuf00lwrEHaCfTsCXHiami6h?=
 =?us-ascii?Q?D824oDTaGYJJQ/Jw0DLXSlg4Ct/0M0lu/0A5BbtF6niL35Szxgihdg375q3s?=
 =?us-ascii?Q?RPVebfPDYcEHI5BPD6CV1TejrFfAs+9ZXcw1van5fdXnyKXWe/dJAt1Tutxv?=
 =?us-ascii?Q?9uMdumaJcqsjbjGcnnLBO4GjxOi2whHsOsWsxjTfOLCRPLKm/U9+M9zxE+Eh?=
 =?us-ascii?Q?eL5vrxzfpUawoCmXzSSqF2aqpzx16uZU3EB458ENB648VquxArW/l/KoVNJw?=
 =?us-ascii?Q?Mq/7AddPxW1egcJT4rLVwdry2kenDJGF45CQtMP6I1sjD7dt6Tl0aFJDEKqo?=
 =?us-ascii?Q?RDfTqvgn1Nyn8AYAsvHUTzSQ20BoTERVWxMTLVEFpC40Ks8fkEuoaYoECDq+?=
 =?us-ascii?Q?1OVhq9/Suhuqirk1KhzKOmC0qMQAhiNFm3z0sPPYHau5JHmTkK++5ncklvp3?=
 =?us-ascii?Q?mlzssS29dscaXIa7xSJRLq8lKMD/Rgf3ZY2FdiEQ65E4J8J5NRZtGZtTfmh6?=
 =?us-ascii?Q?AV2CMQC+z6RkLJLCoqoXwirIkW01PMzstv5DbKtVX17J3UVln0YRNFGWMImj?=
 =?us-ascii?Q?YNKg7AQvjYBTdVA8oeNPykyp6lqdiuZMtGBD4hMdIQSVhDCAhDafPxdx1jgy?=
 =?us-ascii?Q?AG3ka7kriU4z3eMJwYzeoGGa9uD/5Y69a3nIEhTLdnQSMZnXLvp2UhKWc4zt?=
 =?us-ascii?Q?IL4WTLloEtsbNYigT+PSvJXU2XkbUAU=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 49914508-e6bd-4f3c-80a8-08de7b7ca7fb
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:34:05.9526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4/iakg5RB++GCAYaz40tlX+CRePkunPb2pG6rC0pOtl7UbHNtgzahq7ceK2io9WCuP3o33XoufOZHFVQvICUCu8PE7kVyDCCSZEcDUVzLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB4150
X-Rspamd-Queue-Id: C164B220B4F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54755-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid]
X-Rspamd-Action: no action

Register table included group-hold (0x3208) sequences for
groups 6/7/8/9 that only stage alternative tuning values in SRAM but are
never launched by the driver. Remove these group-hold blocks.

Also remove a duplicate register entry for 0x37bf.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index e0453c988e4a..7f32e3b1e7bd 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -250,7 +250,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37ab), 0x0e },
 	{ CCI_REG8(0x37ac), 0xa0 },
 	{ CCI_REG8(0x37be), 0x0a },
-	{ CCI_REG8(0x37bf), 0x05 },
 	{ CCI_REG8(0x37bb), 0x02 },
 	{ CCI_REG8(0x37bf), 0x05 },
 	{ CCI_REG8(0x37c2), 0x04 },
@@ -415,42 +414,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x5820), 0x00 },
 	{ CCI_REG8(0x5821), 0x00 },
 	{ CCI_REG8(0x3222), 0x03 },
-	{ CCI_REG8(0x3208), 0x06 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x01 },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x1c },
-	{ CCI_REG8(0x3610), 0x37 },
-	{ CCI_REG8(0x3208), 0x16 },
-	{ CCI_REG8(0x3208), 0x07 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x17 },
-	{ CCI_REG8(0x3208), 0x08 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x18 },
-	{ CCI_REG8(0x3208), 0x09 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x28 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x63 },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x19 },
 };
 
 struct os05b10 {
-- 
2.34.1


