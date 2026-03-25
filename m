Return-Path: <linux-media+bounces-57007-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEIuJ43Pw2nuuAQAu9opvQ
	(envelope-from <linux-media+bounces-57007-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:05:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6803246A1
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D0AE3008638
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B383CFF57;
	Wed, 25 Mar 2026 11:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="VHTjmnEb"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021112.outbound.protection.outlook.com [40.107.57.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808513CF682;
	Wed, 25 Mar 2026 11:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439265; cv=fail; b=ifgvpQm0Ug0YkuAVKd+4nfJt+wsmT99WfIsYWwtTB7qT180aiZIEKzYBTlh9BVEo37u/qQ4F4P+wU8bUxhzbJKmuGOliGQ74k0jdE2wuSkY0lOQ3/qshEcR4Sb+P5wyr8cn51T9tZRbr3Aj/8s3t62iGJFPWwZULlgc8vP7t6c4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439265; c=relaxed/simple;
	bh=/h4HLe/SeIhtzdAOaXTqjUZiOoRFeiV7uJBGik8VLao=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GOCuuDk/eaEB01/xSseU0LgXFy7cAzvbs8XZeidAWl15DlbFQ+Y3rRtCyb6Esr8aOrk1PTwVtHNcrT99Phlczj0LU9wb02Wkw3/ISnI5ygxfJ/2f5E0rqzPZqdT1Y4l6eEVeEXiMKfk43piICiPK5oY3nejVyEEPi8IJ68bbuqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=VHTjmnEb; arc=fail smtp.client-ip=40.107.57.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qL5ITMD/0sHu1Jg6JqMgnhtiA64CtI/6ImFYAq+cShYn1mjWkRWFd9uq5i4T9WdTZPULFS/H7JIkjISmHvMUVFuaTMe9f6au5wGX7mcfxwMdGkDIjzmm1ftvX06Gr9YiA+DqwINLR+CSstt+EBsRq2XUJ/ekvJXEWwyLGarwkBnuqjnzGonOJPzV3nErKBCGH2v01w7V8po1h9dkozZDyLPH13l6xpruDBV88UrDaOD4Bj4sgFw8qbO3hfzi7IrxYi2rmodE+7TyEYuyEu/Hi/5Bd6PlQXPFcnOTiYh5yCwptMcW38qUrXXY5S25R0H9r+5+Rv0ZgumADkqoNstTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDolXAS5oqHRyeMBLRQ+fO0fXod4B6OneODG49BEcIs=;
 b=bcgvEljncygdXmqmL0+wEUPU5dASnRiLSxY+SFQNdEINTyRa4aP8asqG/gpadwggF+fbnJ7doWrReqy4e+RDeUXFwluJmR+whZBEixHWxJRnovufrFwo/MRS1D+638dBay0mzeCZ1yum1cBz/8Dm2uRTbtHZnMHYd5B+B/tPSQkf0VH/51G+F019umMN+cogFMUBEz++bLs6r7IDH4E6mI+DYMH7wDusBaqJVA1ET2SQt4ZcOOs0OT/GDtuU2bJ/BwR5w2CBGsAFu3GX+3Rdv+DfedRsFIcUXgoFAbal1ZqValIAgxzDzcugkHs3N7Nc2sOfaV63/yQ2ScI2VEQRGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDolXAS5oqHRyeMBLRQ+fO0fXod4B6OneODG49BEcIs=;
 b=VHTjmnEbXwNgTZKAYkYekmgpPMiHnuifrngp+JHC9BjBdQJLbMMyIC2k33ODtR7MA0GSsApfJ/wDPBAHb1EaLTidNDcMqJOsQCYrFSHteHPDQc8QszTgBR+DjjxFJElQN12gDFlWo8khYgs5EpNgV3cIiHV3Lya49ltXcliyYnVS4mSXJldLMGOf8P8MZCiJmdxk6p0v6XFf9ccT9Zq1FV9TqN8GD5PEfKRvuxRY1hUdEl+EFoArKj9MnE2ORQ2Cnmj93FhIHk/pUH22jKKhGN8ZzMb0Y9PlDwsc2xHIs6SNNCAk+LFVF1s7gdcpFxdVgpuSJ4xCGSWCbizfdzgRyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN4P287MB4294.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 11:47:39 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:47:39 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/15] media: i2c: os05b10: Add H/V flip support
Date: Wed, 25 Mar 2026 17:13:52 +0530
Message-Id: <20260325114404.95188-7-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::13) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN4P287MB4294:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d1a511-f472-43ca-23c1-08de8a6450ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aUOA78dfY3qcoK/EFjy7mmcy8lj0dV2yG8oqe3pWfW4VAijTmXVqIz0uEE6jsA0zRDFkL0JtnynpWKzQHhZ6UTwR6o/YE2ukcQiwE9lyZ+BAcAj3DihECqWrYWBhA0UM2FwBwaSiBHttWXhcpdyAuyf/unBk9IiTx7Gb8yqHtekgnaYoXLeyDp752qxCWfnl5cf8hBw3pc9Kf2lWO26qkow2xkLHlK49LEiv7nHKgU4csLd5Do7tfCxjYVvEQFrRrS5TPE5hp34fMlW92ePATNgPnKoX0E7KBQuK39cIrPSPL0ySm8XElJuq0F0RzQjZkrJe8HnOlBVcGY4Lmq78O/bBy3C5zKKehcs6rq8z4GeRCAswpRg0duZhm/Z40fTCOQ566ZBIR6riHfelaWjvcvfJpBEANQ309U+8aK8a+ioSowwEbHdjFklhkNhEa8BeRMc6nxSRNJUavahnCTpZoSHcdMxGKA9WvFpzcuqKscw+pmiJGAiomPkBt8DaU93aaiX/nrai2CvuFYWvRHEh0Kv2jjP7wy2SgM/Ay6vtWRefkmSGYE8idYT2l0F50UEpTJwx+JMeeB8W/dFiBG0XlHIsLg5AWoSUdnS0f6p+uyW9aI8ibEjf5tbGWcaNnsyQbnu+ZJjIsB0hj5i95vtN0y+4nQAbdb3uCbazOltAY0Agt+/iQMcECvr5dYgxcoWOLzyDtU2djO1LnJO9SnoXxVXE3JPc3l5QZthcIiLOSfRsdmw778A88M5lK+W4rzDA1mge45OFRma5A1cwdHfEKMfQGU4pJbH0v2Bi0XEYzqo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ig/VR5UHVEBKl7m3k20KtqdtBz9b+rdGlz2hLDtm6LzSx33SqSSIaPIBk9aZ?=
 =?us-ascii?Q?cOKZrEI9UmGIXuUkW25GtpKZVMn4zocQ+7gsOXWYY5UU29ehfzbN9+4s5o/q?=
 =?us-ascii?Q?Dl/byAEh2lQHFC2WOv5UtXi0b+Doa3JaxZuRx6aigMZWKwyF9cZDFDQk1Rkb?=
 =?us-ascii?Q?6wX9JxiXvsclCp/QG0kIkmdpf6hECSUJx1iDrBDyyYAmfeRypf98iP2YMqbA?=
 =?us-ascii?Q?3Gwh6M54Rl56/hMjDrXZadhmosCgOZGWmNwP1kP1+agMsGrPFYz8PSIInTgA?=
 =?us-ascii?Q?O0ppWTrIPMnZPwIBV/2ZlShbeymYjDyGu3FnCX+JA01/gDibP4t3NVIc5dRI?=
 =?us-ascii?Q?P9vuRgc95oIV1GC4v1+DPr+ggDxMH/6aN7mXUHd6hxwcJpCfcEidrFODzmAZ?=
 =?us-ascii?Q?3QsYVHuLfrWgvhGZIiJl8eG48iob+sTTJ4EX19x7YgbDkq0FVn0SbV12Qt1M?=
 =?us-ascii?Q?Im2qH4b/XN2E7oBsyYV8Rqs6P4jUUxstmIfcE+tIFXY7iWXP97LW9vNdbiOo?=
 =?us-ascii?Q?kj+jhGJ3+8JMsmNkZrQcgb0WxPHC8ivUp6DSioWYUq6Gw75UMS+F7RUUtlyX?=
 =?us-ascii?Q?4+2JaU4PauGxQEkwRe5pKRwHJLSmRHqRLKLBk07Ez2b6JIkTY+/08Ifx+e0d?=
 =?us-ascii?Q?jQX7imDcG01wcu9wpwgdHPZwFEOZrw/u9YaLfDZyXXOQPdAcDWERvTia+KcX?=
 =?us-ascii?Q?o5yPlvloy8wg/myU1ypGYJTTSknpColQmgricv81TbrhqaAnsvEc/yL0kYul?=
 =?us-ascii?Q?rRnaEqCWn5CH4yLABYZj1/Xz2Cc83IZn6OrV0qe4NlN/6mmQPMDGOKvO0eaA?=
 =?us-ascii?Q?ab+GhW8jm1Q+bSYk3oFRK4ksPql9jXoIG4ZxfMi9AQyFs6Wueb8VOj1hJThS?=
 =?us-ascii?Q?ZLGLtOpwotJgkj8GFgjG5zfWrH/jvQHyngbw3IhVyNmyx5kZSJuhPgHhy2b0?=
 =?us-ascii?Q?H6FEU8BHyP7O+ekhasRWjt9Mex016w+XlV2ucFH3MqoQhQfrjO8RNz0q7Epr?=
 =?us-ascii?Q?9/hetRLUXKNCvwcPTKRzgcnESXSaXTfzSEfYUSgiRy8ZnrJNy06eUC0EqNNX?=
 =?us-ascii?Q?oinSaHgIAB/P5E5gif9Lpoa4CglDs3WR+3yt1wblsX0EGVMa8ZFvXelW6s/L?=
 =?us-ascii?Q?MHzjZEh5dWkvnwhmsve5xMVykTMv/8WwUdh44Vgapv7SpXrtOtE2de+nN6BH?=
 =?us-ascii?Q?QDhxwh9jkSRsHAz2Tyl6syNtaPKnb3+FV80Fj+5xPxHpw5mbg6ldDh9mDXUa?=
 =?us-ascii?Q?D6bRcFJlL41UKF0+Qnahvg8PCqtlk3D915Tx9uCB9UWaAIMhaIgHuU48I2n9?=
 =?us-ascii?Q?votQjrPiqG1ecFSQYhR/fY+LNgJL4ZxY/dOJHU5GuMMlthYwdMMs+YcU9bho?=
 =?us-ascii?Q?RSnGkWajrdLigj+pmJS8C5i5mzUhg9PL+ouVD3uMKzHmYrU4Uy0c7A990OMA?=
 =?us-ascii?Q?RmKMkEnItrbye8xVhXybKG8wrE4MZcLnk6+uUCToKggNsGSMsE2aA5F9Asjq?=
 =?us-ascii?Q?+aAgiOIt7cC/xYqPPN+A6HDxmkzNdAeXvZaWvfkm7wxoQP4eKvrEHw3SZmgk?=
 =?us-ascii?Q?9Vq/YHRsbbfmuwhzeZx7/X0CG8f/wqAuOy4zwkN7dYwDmEY7cO8aSGHfAyM0?=
 =?us-ascii?Q?8hSE0vg9XDzHDZWpxlxSD3pqU1jjYl3iZypivCCBl6m4vGd+1HTerxlGR5AR?=
 =?us-ascii?Q?Xze3vc3PA0WxYvI1BWkYUZgqIhDB8b0KsSEYkuZ11iTIX8K2QvIg+einKN3Q?=
 =?us-ascii?Q?4jXS3EjeVdf2pNaqEVwajJM5qvOsmk8=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d1a511-f472-43ca-23c1-08de8a6450ee
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:47:39.3398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6447qB2SxpOrmmiFxQI0wSMStquBnSxjp78WxHn+lijai1pcDLK+esSHj5AGBzoEIaM38cQALKuQRyJBx4lhfJp02ILaQi5AVURveyq5xi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4294
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57007-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid]
X-Rspamd-Queue-Id: 9E6803246A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add HFLIP and VFLIP controls, lock them while streaming,
and update the reported Bayer format based on the flip state.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 59 ++++++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 2f47b02149b7..bf848eb9ba52 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -96,6 +96,10 @@
 #define OS05B10_MIRROR			BIT(3)
 #define OS05B10_FLIP			GENMASK(5, 4)
 
+#define OS05B10_REG_ANALOG_FLIP         CCI_REG8(0x3716)
+#define OS05B10_FLIP_ENABLE             0x04
+#define OS05B10_FLIP_DISABLE            0x24
+
 #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
 #define OS05B10_HDR_ENABLE		0x04
 
@@ -232,7 +236,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x370f), 0x1c },
 	{ CCI_REG8(0x3710), 0x00 },
 	{ CCI_REG8(0x3713), 0x00 },
-	{ CCI_REG8(0x3716), 0x24 },
 	{ CCI_REG8(0x371a), 0x1e },
 	{ CCI_REG8(0x3724), 0x09 },
 	{ CCI_REG8(0x3725), 0xb2 },
@@ -466,6 +469,8 @@ struct os05b10 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *gain;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *hflip;
 
 	u32 link_freq_index;
 	u32 data_lanes;
@@ -514,6 +519,18 @@ static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 	return container_of_const(sd, struct os05b10, sd);
 };
 
+static u32 os05b10_get_format_code(struct os05b10 *os05b10)
+{
+	static const u32 codes[2][2] = {
+		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
+		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
+	};
+
+	u32 code = codes[os05b10->vflip->val][os05b10->hflip->val];
+
+	return code;
+}
+
 static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
@@ -557,6 +574,21 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(os05b10->cci, OS05B10_REG_EXPOSURE,
 				ctrl->val, NULL);
 		break;
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+		ret = cci_update_bits(os05b10->cci, OS05B10_REG_FORMAT1,
+				      GENMASK(5, 3),
+				      (!os05b10->hflip->val) << 3 |
+				      os05b10->vflip->val << 5 |
+				      os05b10->vflip->val << 4, NULL);
+		if (ret)
+			return ret;
+
+		ret = cci_write(os05b10->cci, OS05B10_REG_ANALOG_FLIP,
+				(os05b10->vflip->val == 1) ?
+				OS05B10_FLIP_ENABLE : OS05B10_FLIP_DISABLE,
+				NULL);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -571,10 +603,12 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
+	struct os05b10 *os05b10 = to_os05b10(sd);
+
 	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
 		return -EINVAL;
 
-	code->code = os05b10_mbus_codes[code->index];
+	code->code = os05b10_get_format_code(os05b10);
 
 	return 0;
 }
@@ -713,6 +747,9 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto err_rpm_put;
 
+	__v4l2_ctrl_grab(os05b10->vflip, true);
+	__v4l2_ctrl_grab(os05b10->hflip, true);
+
 	return 0;
 
 err_rpm_put:
@@ -733,6 +770,9 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(os05b10->dev, "failed to set stream off\n");
 
+	__v4l2_ctrl_grab(os05b10->vflip, false);
+	__v4l2_ctrl_grab(os05b10->hflip, false);
+
 	pm_runtime_put(os05b10->dev);
 
 	return 0;
@@ -741,6 +781,7 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
 static int os05b10_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state)
 {
+	struct os05b10 *os05b10 = to_os05b10(sd);
 	struct v4l2_mbus_framefmt *format;
 	const struct os05b10_mode *mode;
 
@@ -748,7 +789,7 @@ static int os05b10_init_state(struct v4l2_subdev *sd,
 	format = v4l2_subdev_state_get_format(state, 0);
 
 	mode = &supported_modes_10bit[0];
-	format->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	format->code = os05b10_get_format_code(os05b10);
 
 	/* Update image pad formate */
 	format->width = mode->width;
@@ -929,7 +970,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	int ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -975,6 +1016,16 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 			  OS05B10_DIGITAL_GAIN_MIN, OS05B10_DIGITAL_GAIN_MAX,
 			  OS05B10_DIGITAL_GAIN_STEP, OS05B10_DIGITAL_GAIN_DEFAULT);
 
+	os05b10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					   V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (os05b10->hflip)
+		os05b10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	os05b10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					   V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (os05b10->vflip)
+		os05b10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
 		dev_err(os05b10->dev, "control init failed (%d)\n", ret);
-- 
2.34.1


