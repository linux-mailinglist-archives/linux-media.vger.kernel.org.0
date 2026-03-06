Return-Path: <linux-media+bounces-54761-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB0BCUzKqmlWXAEAu9opvQ
	(envelope-from <linux-media+bounces-54761-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:36:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 623D3220BD7
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28848302E1E6
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 12:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B802328725F;
	Fri,  6 Mar 2026 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="ZUM9jTBz"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021105.outbound.protection.outlook.com [40.107.51.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0AC257845;
	Fri,  6 Mar 2026 12:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800476; cv=fail; b=Z40rVv22DPNj7yBFba2ZzqqPxjWtv8F/f9Shav4MdNhJQDexnX9kehUXZ3Fm3G4IKESyi6B6yorIldfbjPENXL4CxPNeNrzJXea2myP50wOxrQmEfqvGbELDwjpHDChJ4ubrm511btMG1lVn1aJQ8DpaaCxPdLwhcX0Lew2MyDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800476; c=relaxed/simple;
	bh=/Pv/+7QlGge5YTSovO2InzgRYHuctrPXq1/IWTwfFm4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=opJgIWHu3TRp41tbRtEjKAcHZvI7xKKoD6+iIAOrY4AxDP6mBUnFg6aZxJIVbtkfrwYNp+U0H1zsLvjrqqT973jdy6gGc3VhyRsOGH+dcu4Iw5qZ7Zu+A1GSRo9vwx1D5+1eO0KREr8oT+n9W47dAooZfK1C6VrWZIRbHFr4DFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=ZUM9jTBz; arc=fail smtp.client-ip=40.107.51.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auJmnwm8UfdqIK4epnxfXqgL0PLIFSLmTeiiT7w3Q+Fyhmos7FXbM+UZfN4BFSLMVgfzPbuhI/xWwPGql0qdO+HStJTA1TVPNeqEQxm5PIaPJrJ4CoRdrJsvWjrcEgrvfqB5abRJT87i2pRVQGGYjjwQvH7ToPRaFeNDR0pTcVXl8VOwvfsH5F0JBCN148q/uB7DsZ+5dFPIalRBMttOTPl/CcN/reTgbo7H0mCgGAYEJ2dY1cMEOgf75fwyOOpKYifqV59U3s6rPc9w16VRK4WBSV72wVMOp/yKUgqLOwn8weWADgvWBTR2ST0hual1M+ijOylwuOEdl/QtScDMOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/te+pYpqskJAfmFO5hVBf6JsmHy/zpu/x/+4H2K3JQ=;
 b=qTm94a7TBf1QPa93UYETpcVHcVqDZqnJWn8dTJOhL+uDlpczcioOvc8p1JroyPskf18wUp0nLJZY3TlxSQAe9tzOrbyg1HBLCT9EfZpQHDLl0xQTj+iQeYM87bMmyhGpII1KCp8Fto/mbkSHJuCz6sRTMNSczaoBJlA6l4ofLwOYckhaICC/X5H6L/SDc4KDnxgG0ZZT/FmbUTtrAGFNhtmxY+LK85uB3z1BmPDjCNwBFFO34eeD3RKUMYoRPSzBs1YhPspHsyA3gTHXfUoewOYg9zsC3aNSuoJrj2/hBh/jTVs9gbRfJg6dR+ItQvPclPyqmgGgr5FP0082oGBaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/te+pYpqskJAfmFO5hVBf6JsmHy/zpu/x/+4H2K3JQ=;
 b=ZUM9jTBzoVki8q7jfx0o81vkhURCXQobRNPB9o3uyLdGRYCa/zaZxhuxnTCgoCDW+jA3o2AVDONtZDL6xHPMKE1LDHq5gibl1FUeLaipSkBQtGgbXoa8crOQRjVUj/uH7Vx7CLlpR+8RVesvQI++CR0F0j6cuwolBEYHm4OyYTLCfhIEJ/BHe1hKy5Pgvs0lTh0fMosOgCW9OWB4t6oGEMUqqLsogOdnMjiM2Pso7V9ZN4dJnNFl9q8/A6F1w1wClnKYtWMPKuRI4+VuLk4vhV98g7hMdtJOBUvgFXehPZA1L6leBrSrGr1MnddcWnBtTPCtB12ar+Evlm3gi5vOPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB5365.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:30b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 12:34:28 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 12:34:28 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: mehdi.djait@linux.intel.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/13] media: i2c: os05b10: add 12-bit RAW mode support
Date: Fri,  6 Mar 2026 18:02:57 +0530
Message-Id: <20260306123304.76722-8-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 36623072-009e-4b71-e752-08de7b7cb541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	CMTeglj11gexBG58GiJkFpR4zD4Wn/SKyQ+z8SF84NTWKXAeIJQKYMKUAfvGzen4lGYXg0T+LkyyE2hDYbN+W4+nWHTbVSSHuRiBszLMA0IT223OMgcvhQnL8MfkIW/ME1hpp8NNIs3Hu28SNauq7PhiGzTaaZKtKxl8bzzXwT82m/9q0b1zlcf5/PpwJmicZM2lHE1BKHPVXyhuUUOLGJ9v1NUhZHZMahbHFa60Ua6fjUsDaxkYBnalCcJgW3A3QYSlbxyhSj7cTjv1EE1gDnc8HbfEA2WfZVFL/mkXkHC1bJssdxMBJgMNw5xLD3S8szZBX//M5+zduEjbwqJ5t6837OrFXTpIWiPRu0NT0T1oVHR3fXw5SoAjvPOLIc6YYpqxGB9LRfOVf5hvCP4NJvgHjlpxqe6VsH+m5gJmhdaMNv4LKCIcKn1ukWGoH9+HC+B76cWdWiQ9DQxIlosk1G44ryuLYfzEoeHkvYnUGxUU18abfHNxZcQpkgJOKzOcWlg/zbTFHJlWSNWGZhiYulPmbnvTnd6uOIHkEhAogXExy+q20RsMfkEZU115/GVxxHfgRvzRq/KJtcgupIwCtnl2LwpxOHgSUByhxHTCcIoW0c3cPg7+YIPa0iyEEOjHwCL9cKzqU0L3IBvmae/ZWrZTp4ITDxTN+VfR9DohzGk5sPUKds4/elPVsRh17Q1HSQu1P49yacM5PsrM0HupRwbGXz0Gr9GGFlL7dw52RiqDvaNIdKYhEoyBxk9zRZH+m7D+S+YlxsNbqEXW99bG9/37eCekX5tzGSWH33N1BFY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wuZbSEUBYBtPGiijsvbdV9vnq63m7ZuggbXNwE3T4zIzsRfE6bUijwTpHThl?=
 =?us-ascii?Q?lFvt0oWyHqLJPO6EDJYFIr00pTwKEC7Z5wDoGkV7+j13yAV8O7hAKYeICGXx?=
 =?us-ascii?Q?Y0Mh+4uiz3WPURaNz715TR8hciX3NGhJnMka6iwiaU4U6c2iYHf5WEdduN3C?=
 =?us-ascii?Q?x5pxBu3TDPObPU4L6gCaW8QPe0BNUKVihELwGFgUAQ9B2P30s6AA6tizEW8g?=
 =?us-ascii?Q?7zVP8tvhqzjF6W7HqsidOpPCHW9eXXfUPwrAi7wcxImqOYJInrpWXJnddQ8B?=
 =?us-ascii?Q?Jzp4e+npdWNg2WPw0+MO/wYWIG+JIS45ZLgSr66a9Nt+yP2LiaUBlsrmS9fL?=
 =?us-ascii?Q?XrIj95x3NRprRXoiXTpfRdhiI1jklk7vlKeQEzhj3/jXvyPTezadppwx85rY?=
 =?us-ascii?Q?T7LrlbBdlLUrnRU93912F/LoKCV6v76+m7s0nsyUsK5Zk06hKza1SiO7nZYB?=
 =?us-ascii?Q?R4GbprdCZ1eMNEhOcIQ9qDkOjyg20T0FXphsz6m7HDn9f2DuUozoSSBUGxSV?=
 =?us-ascii?Q?LnLLFt7uJ/2e7JVGUCBgpEl1ea+DNNP+7BSPtfaPnWDJDzdLqBVkT4ETCZ0d?=
 =?us-ascii?Q?9fSicybebHPhOzLfwZuRFMi0KzL3UgIx+044QYpacBwVXCpsImQAM4DccF6D?=
 =?us-ascii?Q?31XCgu4clfUWDawO7I+MuKWEQEM8BB6d9L4oX3THmD0wfClD90WFev5HdKJm?=
 =?us-ascii?Q?F1zadbGBnnwGvDBSr2Br2IHjfkKOX5LfiJiOvhJP/BnpF1hax+9jB3SX0/rA?=
 =?us-ascii?Q?QkWwbZMpjX9nbNE6HsTbaTpASNd8AG8YE4deL8AC3gnfR59DhcdsYlQ7h/pd?=
 =?us-ascii?Q?y/bBsQlnqNg+qrak9CXQ4v13dEQMbav4++A0yU8K6HyDi3RY9nDbpTCBj4Ta?=
 =?us-ascii?Q?juxxrDR4K8tc8EUfE9dudsXSYtHa/d/eIR4KNCH2IsptR+4MYnKG9wkh+3Nv?=
 =?us-ascii?Q?xJEEFtiSE695T2252PZHFcyHqEKA7FXq4iiK2e9vWGC+UKnp/ZhwwxsMuF0J?=
 =?us-ascii?Q?Y1yo+pDl7iIk4zbWiRN1lOdc9/8e2tX5Z+pocpNnWCy9FTe0zMGoLx995vp0?=
 =?us-ascii?Q?DUlOOtET48IGMpcqIA0+QBGw2LrawG4q8gCjzMQESzl/IMuPoVOxe1gok4ye?=
 =?us-ascii?Q?Zg40UJ5L8LvwceSKI0LJdRByRT9LE5SI3UHrqTqZLBQ/Tn2BDBq+gOrKVNhh?=
 =?us-ascii?Q?RVy6q7LnR3V6Xgq13Swjq6DuKayfE5ocq5NZXuuT9kn7S/0kEMkq/ynoEz2g?=
 =?us-ascii?Q?l6RkZ5nXPqh3cb+7gSQRbAgsKiEFLOZD/X4GT321xrqABUMdS9sNUyaSHZdv?=
 =?us-ascii?Q?pO8suwkBVJd4riVa3krossRlRd4G5KvdcLJRjS7M//YCd7EUS9EMzTEC/TsW?=
 =?us-ascii?Q?quO23Cg8XKtt5Oe/pfBIBEGaQCnNx61gGb7qwUAqAn5IFR8A9cevV6fSwT6v?=
 =?us-ascii?Q?takMFdOUdBclt1j97Sc3XZgKqPz/7OBv++sKXXl/SpsnpG2Sm6YEmhKCY/ro?=
 =?us-ascii?Q?PSWZNnIZj/lQgUpzurJOBwr9k1DsBJsC+WDf49Ju5Ql9oVN8FJ251Pa67FWQ?=
 =?us-ascii?Q?UxAe4gep10Edqke/GygrA/t047HdwdRUdfBUycRrdZEnmAKrOptZxlrob1C1?=
 =?us-ascii?Q?ewtdD0038nJ1SSILuRGahhmv9f7J8Uvb/3kAzGTkz1/th48dD0X7SWSYAA9Q?=
 =?us-ascii?Q?Nc66Qq99gjsJ5JBytQwTEcRlkJsPk/EFzDG4wsjeONFUfiU4YZKXdFI+sxRY?=
 =?us-ascii?Q?TDKh8Q9Vk7LK5z9H9hjv7L2N8f9yvO8=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 36623072-009e-4b71-e752-08de7b7cb541
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:34:28.2086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWj+y+Qom8Szr+UlcD4CXIF7DvfFTAFCoiKOyFYldatE13gNFpwJcQ5ZckKKPIAg+XgHCSEVb2ScqzEaQD4Shkt7NuZ4GydjEEB+slS9TCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB5365
X-Rspamd-Queue-Id: 623D3220BD7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54761-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Expose a 12-bit Bayer output option in the OS05B10 V4L2 sub-device driver.

Add a 12-bit mode table alongside the existing 10-bit mode, extend the
enumerated mbus codes to include RAW12, and select the correct mode table
based on the requested mbus format in enum_frame_size and stream enable.

Also move OS05B10_REG_MIPI_SC_CTRL_1 programming out of the common register
list and program it at stream-on depending on the selected mode bpp (10/12).

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 97 +++++++++++++++++++++++++++++++------
 1 file changed, 81 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index fbc191e1d505..d51b7d18d28a 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -143,7 +143,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ OS05B10_REG_PLL_CTRL_06, 		0x00 },
 	{ OS05B10_REG_PLL_CTRL_25, 		0x3b },
 	{ OS05B10_REG_MIPI_SC_CTRL, 		0x72 },
-	{ OS05B10_REG_MIPI_SC_CTRL_1, 		0x01 },
 	{ OS05B10_REG_ANALOG_GAIN_SHORT, 	0x0080 },
 	{ OS05B10_REG_DIGITAL_GAIN_SHORT, 	0x0400 },
 	{ OS05B10_REG_EXPOSURE_SHORT, 		0x000020 },
@@ -501,6 +500,21 @@ struct os05b10_mode {
 	struct os05b10_reg_list reg_list;
 };
 
+static const struct os05b10_mode supported_modes_12bit[] = {
+	{
+		.width = 2592,
+		.height = 1944,
+		.vts = 2007,
+		.hts = 1744,
+		.exp = 1900,
+		.bpp = 12,
+		.reg_list = {
+		        .num_of_regs = ARRAY_SIZE(mode_2592_1944_regs),
+		        .regs = mode_2592_1944_regs,
+		},
+	},
+};
+
 static const struct os05b10_mode supported_modes_10bit[] = {
 	{
 		.width = 2592,
@@ -522,6 +536,7 @@ static const s64 link_frequencies[] = {
 
 static const u32 os05b10_mbus_codes[] = {
 	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SBGGR12_1X12,
 };
 
 static const char * const os05b10_test_pattern_menu[] = {
@@ -553,12 +568,19 @@ static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 	return container_of_const(sd, struct os05b10, sd);
 };
 
-static u32 os05b10_get_format_code(struct os05b10 *os05b10)
+static u32 os05b10_get_format_code(struct os05b10 *os05b10, u8 bpp)
 {
-        static const u32 codes[2][2] = {
-                { MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
-                { MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
-        };
+	static const u32 codes_12[2][2] = {
+		{ MEDIA_BUS_FMT_SBGGR12_1X12, MEDIA_BUS_FMT_SGBRG12_1X12, },
+		{ MEDIA_BUS_FMT_SGRBG12_1X12, MEDIA_BUS_FMT_SRGGB12_1X12, },
+	};
+
+	static const u32 codes_10[2][2] = {
+		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
+		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
+	};
+
+	const u32 (*codes)[2] = (bpp == 12) ? codes_12 : codes_10;
 
 	u32 code = codes[os05b10->vflip->val][os05b10->hflip->val];
 
@@ -653,8 +675,8 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
 		return -EINVAL;
 
-	code->code = os05b10_get_format_code(os05b10);
-
+	code->code = os05b10_get_format_code(os05b10,
+					     (code->index == 1) ? 12 : 10);
 	return 0;
 }
 
@@ -683,15 +705,42 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 					OS05B10_EXPOSURE_STEP, mode->exp);
 }
 
+static inline void get_mode_table(unsigned int code,
+                                  const struct os05b10_mode **mode_list,
+                                  unsigned int *num_modes)
+{
+        switch (code) {
+        case MEDIA_BUS_FMT_SBGGR12_1X12:
+                *mode_list = supported_modes_12bit;
+                *num_modes = ARRAY_SIZE(supported_modes_12bit);
+                break;
+
+        case MEDIA_BUS_FMT_SBGGR10_1X10:
+                *mode_list = supported_modes_10bit;
+                *num_modes = ARRAY_SIZE(supported_modes_10bit);
+                break;
+        default:
+                *mode_list = NULL;
+                *num_modes = 0;
+                break;
+        }
+}
+
 static int os05b10_set_pad_format(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
 {
-	const struct os05b10_mode *mode = &supported_modes_10bit[0];
 	struct os05b10 *os05b10 = to_os05b10(sd);
+	const struct os05b10_mode *mode_list;
 	struct v4l2_mbus_framefmt *format;
+	const struct os05b10_mode *mode;
+	unsigned int num_modes;
 	int ret;
 
+	get_mode_table(fmt->format.code, &mode_list, &num_modes);
+	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
+				      fmt->format.width, fmt->format.height);
+
 	fmt->format.width = mode->width;
 	fmt->format.height = mode->height;
 	fmt->format.field = V4L2_FIELD_NONE;
@@ -730,16 +779,22 @@ static int os05b10_get_selection(struct v4l2_subdev *sd,
 	}
 }
 
+
 static int os05b10_enum_frame_size(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >= ARRAY_SIZE(supported_modes_10bit))
+	const struct os05b10_mode *mode_list;
+	unsigned int num_modes;
+
+	get_mode_table(fse->code, &mode_list, &num_modes);
+
+	if (fse->index >= num_modes)
 		return -EINVAL;
 
-	fse->min_width = supported_modes_10bit[fse->index].width;
+	fse->min_width = mode_list[fse->index].width;
 	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes_10bit[fse->index].height;
+	fse->min_height = mode_list[fse->index].height;
 	fse->max_height = fse->min_height;
 
 	return 0;
@@ -752,13 +807,15 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	struct os05b10 *os05b10 = to_os05b10(sd);
 	const struct os05b10_reg_list *reg_list;
 	const struct v4l2_mbus_framefmt *fmt;
+	const struct os05b10_mode *mode_list;
 	const struct os05b10_mode *mode;
+	unsigned int num_modes;
 	int ret;
 
 	fmt = v4l2_subdev_state_get_format(state, 0);
-	mode = v4l2_find_nearest_size(supported_modes_10bit,
-				      ARRAY_SIZE(supported_modes_10bit), width,
-				      height, fmt->width, fmt->height);
+	get_mode_table(fmt->code, &mode_list, &num_modes);
+	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
+				      fmt->width, fmt->height);
 
 	ret = pm_runtime_resume_and_get(os05b10->dev);
 	if (ret < 0)
@@ -772,6 +829,14 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	ret = cci_write(os05b10->cci, OS05B10_REG_MIPI_SC_CTRL_1,
+			(mode->bpp == 12) ? OS05B10_12BIT_MODE :
+			OS05B10_10BIT_MODE, NULL);
+	if (ret) {
+		dev_err(os05b10->dev, "failed to write pixel bit registers\n");
+		goto err_rpm_put;
+	}
+
 	/* Write sensor mode registers */
 	reg_list = &mode->reg_list;
 	ret = cci_multi_reg_write(os05b10->cci, reg_list->regs,
@@ -834,7 +899,7 @@ static int os05b10_init_state(struct v4l2_subdev *sd,
 	format = v4l2_subdev_state_get_format(state, 0);
 
 	mode = &supported_modes_10bit[0];
-	format->code = os05b10_get_format_code(os05b10);
+	format->code = os05b10_get_format_code(os05b10, 10);
 
 	/* Update image pad formate */
 	format->width = mode->width;
-- 
2.34.1


