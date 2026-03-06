Return-Path: <linux-media+bounces-54758-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kB0zOOjJqmlWXAEAu9opvQ
	(envelope-from <linux-media+bounces-54758-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:34:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A66D2220B94
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9EE75301511B
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 12:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B276279DC2;
	Fri,  6 Mar 2026 12:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="a/UoLawk"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021120.outbound.protection.outlook.com [40.107.51.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6579626FA60;
	Fri,  6 Mar 2026 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800463; cv=fail; b=oGyPEN9/uHcLSP60APTXVK0abrMMpsV4bSHRz8VeVIMQbKyPi9zX2lBSdG7ETSBeAw0FKRxHHvqHPlpbsV6JjoqRtZ65KTkmowJ0gMsQsce5xNE0b4Jqr/EewFMGCMxMH8q4UfCs109Lgg7gMWxj+xXsiT+Cr2JbpE36tejMuqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800463; c=relaxed/simple;
	bh=jAbmwCMBAJphxclgn7oy7HbNz1vximIBCh4zsBiy+O0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O4Z7IeoHzHkIQMmhoSe5BaeUrWr6gDZKd+Um4PM3DcT2hJ5gtMg+XBmit0wrCQnFMdJGboatjhWMcCaM3Qhlknu/dIj3MMfBNXCqVR2CF/eAxxH+UUWyU1iNDqKaKfAB2AUMGv1PPPYhywKu6w832POHvJE8ABVHsW+zlGpKI4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=a/UoLawk; arc=fail smtp.client-ip=40.107.51.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgbJM8ocqaJMSnhimIFppAlIVwjlwXapQduAZynep+IHeRKKm8G/zW0WL4somQsNx0FF9ZsQR6CsfKJpzLeWS7FPJHeR9tmdEQbDTsFFLQ1j3V1P8PQvHVGTUxlFR8KKdHuilt+DVumzZNXT3noFQ6ENCm4UiDMV3VsPXqdpjWqhwQV1e3C2hjfL6mnNSgo+cIiCmrxQr78qrpj37urBavTrz/G2E6LNs0Z/6UxlEub+q3HM3CpwxQhSEcA2MoUNw9PD46ot+Hx3YLEHIbdYG1mYB8DZ5d+psN6jI36M9r6JVCT1WV45hThieeJ4ddrbTPyXMaKqCz7ry1dP7k8ZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CipjDsgnS6DRNSBDxe97Imcr+CU04ME9sfvZN3zWwI=;
 b=RzdTwtbm+fVEH/ox4JO4zGKNlBknmBUlZerCetUWEo6JKx6H8HUUuGU1kH2WWSDnRWLXqHXc4Td3HNjUXIO54L9xAWAnyH5xSuRigYKvDdYdTy+MsyWJ1GQvQxpTLnU4ZmoGZsztolSf1KzWi96rpWrQ0pNzY7hTJJTIW/JbDpwT6ICg3PlSRBjFEcRpYTX+bAgQ8Mi/+RbqBwHTkp3aqhFEcU9aFTezb9kRBpROAnIz5O5V9Lf7AgMpOdexW+k2ReNdsRgfeEwjI43OblXOqI50cmbxJnBRJvyezlC5Hqg8zDCRMtRON9IxanPYYd3zRPVnNKYhIeZbY4t+w6pq3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CipjDsgnS6DRNSBDxe97Imcr+CU04ME9sfvZN3zWwI=;
 b=a/UoLawkdVQ5hqOoh8AgC1NxuFkvwJCaUROcJCtBTw9TRtba/MMSpO5jRPgez3a/plGg5Y7TFDNmX1VWuoO8qVSpPM+m1H619WVDL63SUYpD76hpguGNtm3T6SbDAVFmxXbScvGx+Mb0Ahuh5pL9iwMSdmRyqzK+ZtXJoOPLGeRR4jGtQd7aslk72lQx2gDY9f4mTnqSYkmdL7IhmlpvJ3aBQFPUZNZdJk5YV4uHJrhT+5gJFLtCeqLz+QFXjpJdPRjLh9NmbtaAw8aj2+pGd3IlKrcNiM4gQH5SoArrex+9RM26hozFDouYZ6b9JGn8ukyNCmND6d4ICLb8gVDV2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB5365.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:30b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 12:34:17 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 12:34:17 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: mehdi.djait@linux.intel.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] media: i2c: os05b10: add V4L2 digital gain control
Date: Fri,  6 Mar 2026 18:02:54 +0530
Message-Id: <20260306123304.76722-5-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 3caa8edf-4c9f-4333-ec0b-08de7b7caea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	9edv6ys0Yy7JLY9Zvtu3v/jHRMTDfTUn607wlxsUS3BPklfI/5F0qxqYJQd73hZ9pvZDEHYy4+Ir2h+29RxwSZDnITGXvxxjW6aXnHBMGgTjbsW1uFmmktHiF2pW3C9U6azSYdieWo2Wuus1h0poGqRZlOw64+XJgk2NhQlUTpsJGY3ZaCHWAo+hulwyrpK7E22UgRHJqYC/pr0Ia21S3Ce6VDjjBTvKL6NyxBc4ICs8a/kDmUnU1tUaDcac7WmGgASSnqZeVmsi6lflhJG7U/pWx5+pcfWCHr13ZRdzubj6iyHuOfkhbVsVRB3IHKZB6iUzCN3pX/httiJrvIZGqjhNrziKby1DGXsDWq4fiWaxvqIULKeeXFXBNf39Z/u1TGa0gIsByIfZHf4OpvvUnfjFmWpyHVkzskPppZFTZJ7UV3DaIYlCXJgyQo6xWj3OHxzVQq9CB3QEaPG5/CGsB2fPEZhVJk999rCj2cQJRRknakPE5HiF4dN/241Ua2eFcQm2Uw4FHZMuePcgwOCLa00+cKk7ugaqs+t5xu3x0y1kILdGGkVk/pXdwPADCP0q1z5Yr2xAuWK+HhtiEkx95m8HpkA2nVdQVFJVLAjBj73AvEhdbA9wZEUjsrvNbdk88klP7We3Y5Pmj7u7y2Ri4t9Z5Mjour8lcciGSoT5LAS8NYTO9x0mO0lR4iZRCjpGBNqHSUHZrcKCUQYllrXNMoFPhPF0NAitCxGD2+fo6e0+bnASLcozy1sRoJVoaIfo5IT6DzTKp9oCCs5dZCLkkl7PbKvEFhtSYO2Jyu2B298=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lN3dR4ZZO4Jm2uqx+ehVZOVtv1mwO3dZzG1XNIR74DxqdRSvRK3rxqx9II28?=
 =?us-ascii?Q?mFWCObX2j2Qq/GphksRwlsPzaXMrl02atFdbwXhQ62Blu0xCTdIODG9yctzD?=
 =?us-ascii?Q?QfKHrwUenQ/KQrVONqM470i5yw+IJ9RsMVfXfgIaS9Z7Q2wNQeEIuwsuK8se?=
 =?us-ascii?Q?ZE+S5q7b3TQZfYY6ErO9LLoZjsq5PbjYTsXFBgviFuW4+Rhv3zMhDoQDqwCP?=
 =?us-ascii?Q?UNu2izLUYImTj48E/TW4paKbmQkmJxwC5MkzSnQE7n9Pjdx9RF/evKXJpoeL?=
 =?us-ascii?Q?MljhylQC+Tcgg2btRcIfMxjonC39JIJM76D4sPXJiDgC8SdAJNJ17OcDLnVe?=
 =?us-ascii?Q?YdJpd/IXr76M+pIqA/l3YI99I4YfPLWf1CTOJuw1QUf0meEAkc7mUAyCQSbv?=
 =?us-ascii?Q?tvr0sjp5FVVkTRNg9mv32StobF9oBxOSQhBLma3753EjmifbP5KgNOhdy4M8?=
 =?us-ascii?Q?35nOktv3RGB/PKZxGE3VDo/Yd3JHFUPimddNR2Eu5CD6+3CHpQDoiG03l3WX?=
 =?us-ascii?Q?tZAvKUr0mhE9T0PsFW5BtDUprfy2F01hRAm9FSr8XBYZbBBC8WT9Gkw40yiE?=
 =?us-ascii?Q?peUxDxGhaCI++H4IgCSBEbVgCh0lPF60olnrtUxNLpGibw0HRhfCe9GSsBNk?=
 =?us-ascii?Q?e8BcEYaCpLY8RGW2yNRtuplQwrtMIxyIVhlQzj1tqhrc0KRciF4pe5H9FpeV?=
 =?us-ascii?Q?+ObTva7TkGZufxAmoOHhuwiji0V8MXELm0ZKZiWq/p1WnVB1RKhG5md6EQ8o?=
 =?us-ascii?Q?/G/lRJMqzlnsCGYJ3uOCXPxpqd0Kz54yI2kbNH2eoUIqcX021jcZscZW5oPQ?=
 =?us-ascii?Q?txDeSsVCNJKWAocsLK+0sycOdS92UYkI05fBv2G2Qh2uWUg2RvzjSI+LSOC6?=
 =?us-ascii?Q?n1lafvmCr4iU/mqn86xspt0EZTN0DlM//TomCSIq7vRHFAtzteAF1tUphgDO?=
 =?us-ascii?Q?QHmTwNrfTdXcFUJ0MUP1upxdgF8Mnrn9PWCnlOCZUs2MGgwYis16xT8oxG8V?=
 =?us-ascii?Q?YNjrUMmXnI24Oi2ODYzqa+l30dufjEXKmVN5t/+T53p1VMW6+LMD0cEDMath?=
 =?us-ascii?Q?iy1K0LdoQbYNkQHIDJN8LwFRqyAREo+J7oYzBO6gzvzGNKgzuw3A3lYa5x1V?=
 =?us-ascii?Q?qaBWhkd/jwJKhzi42oHkTsko44XrUTbUyKOGMPYQidHQeJvCNKlaTGjnrMA6?=
 =?us-ascii?Q?OWXbZDYSgWZFqPkmKQdSkWaF/xyqk4w/gBW2vzxlP4f4yc42goFh4TuMkjvN?=
 =?us-ascii?Q?vaGAJtiKHifxeUfsgm60iXEIUh1l2uwAYVDseLdKF5ZDA3cZVPfi/A+iATvC?=
 =?us-ascii?Q?JwtVPUEZhpXcxuzSGQXN37Aup9kx1YH5oFDgwMqGIjVYVCtjcQwR4aH8rcQa?=
 =?us-ascii?Q?yYq5IdGce2kPL9oBYR/WkRWFQLeteXRGlFFwMcmRsqBUDOlOg3Rw1EGhb09e?=
 =?us-ascii?Q?70bGpxTjB422uRUviCqdpxfXZLGhRaiQjrPtL7acxOFZKV2JrledjCC84QUo?=
 =?us-ascii?Q?RC/jRwi7XQYH5XE3lPz6JgtOfse6msdHaA8e6sTkfaZAmaH7E8OepIdfsCk1?=
 =?us-ascii?Q?zHq0oiSNfyO1OAV600tN5ZTWkORY/kBnCzwGCkk5a3HDuen+qHnLuSwLXnbn?=
 =?us-ascii?Q?Jpy5UZEKD98UmsnQ3gEh5kUiRw2TRTUYk86uVkMVJZbMzr3apzpz1j1oFXil?=
 =?us-ascii?Q?BPfYVbWDMDwTKodfpj1lsnH2emZF5/0mXcjF/WSNqJJy4Iuo7y7ZTHSxcfaW?=
 =?us-ascii?Q?cpNVrgJjYoQU+vpdDTcZYee0F3wCfN4=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 3caa8edf-4c9f-4333-ec0b-08de7b7caea8
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:34:17.1339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6msrNxoeG6hHs9F0k3SMBtX527ozY7FNbVtJ59HnfkAdYrSCa8vRlB90x92RcLX13Korvcr026awm/fmHjZpaoA8ehuQVfWnv4JCazZCEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB5365
X-Rspamd-Queue-Id: A66D2220B94
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
	TAGGED_FROM(0.00)[bounces-54758-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Stop programming digital gain in the common register sequence and expose it as
a V4L2_CID_DIGITAL_GAIN control. Initialize the new control and handle writes
in the ctrl callback.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index b1d9eaa473e4..a9a8000a8154 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -129,7 +129,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ OS05B10_REG_PLL_CTRL_25, 		0x3b },
 	{ OS05B10_REG_MIPI_SC_CTRL, 		0x72 },
 	{ OS05B10_REG_MIPI_SC_CTRL_1, 		0x01 },
-	{ OS05B10_REG_DIGITAL_GAIN, 		0x0400 },
 	{ OS05B10_REG_ANALOG_GAIN_SHORT, 	0x0080 },
 	{ OS05B10_REG_DIGITAL_GAIN_SHORT, 	0x0400 },
 	{ OS05B10_REG_EXPOSURE_SHORT, 		0x000020 },
@@ -550,6 +549,10 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(os05b10->cci, OS05B10_REG_ANALOG_GAIN,
 				ctrl->val, NULL);
 		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		ret = cci_write(os05b10->cci, OS05B10_REG_DIGITAL_GAIN,
+				ctrl->val, NULL);
+		break;
 	case V4L2_CID_EXPOSURE:
 		ret = cci_write(os05b10->cci, OS05B10_REG_EXPOSURE,
 				ctrl->val, NULL);
@@ -926,7 +929,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	int ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -968,6 +971,10 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 					  OS05B10_ANALOG_GAIN_STEP,
 					  OS05B10_ANALOG_GAIN_DEFAULT);
 
+	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+			  OS05B10_DIGITAL_GAIN_MIN, OS05B10_DIGITAL_GAIN_MAX,
+			  OS05B10_DIGITAL_GAIN_STEP,OS05B10_DIGITAL_GAIN_DEFAULT);
+
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
 		dev_err(os05b10->dev, "control init failed (%d)\n", ret);
-- 
2.34.1


