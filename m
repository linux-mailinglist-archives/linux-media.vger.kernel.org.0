Return-Path: <linux-media+bounces-54754-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHlnLd3JqmlWXAEAu9opvQ
	(envelope-from <linux-media+bounces-54754-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:34:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E49220B76
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 471AE304A542
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 12:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898B6221F1F;
	Fri,  6 Mar 2026 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="hJwhqGa4"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021110.outbound.protection.outlook.com [40.107.57.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7458C35975;
	Fri,  6 Mar 2026 12:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800446; cv=fail; b=V3fjHOUhsyIESbwF6lzTXUHLPUvXQDO4KYRnuT0iL3ZDX4n+HGdc2HCXvnNitdjTJhJyP6YpnLnOMIEP1M5eUYUQcJy7StunwJnRZU7oTzLuIZPA9MpRsdVN4h+J20AcIgJGmqDxLNYxlU0P5mbjcmH0cHPACUmkyVXLtdxqRCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800446; c=relaxed/simple;
	bh=rjzb01qYYcYkS9TziYmipBEsmS6hLCWcLw7wFDr++dQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=uUl550tV0eM8nXfH0sRGcpUh5uL5j4YsZtvadYOhW94CPkgWqK6jG7bAQg+ShX8RqMuzISsT+8PBm8a74LkivHSxkN81lBo3jUOSxbt+7BK0ej2GzGX+YTUeBzttg3DggFQYVqufYH/kOpJHtDkQC5HVQWMCe+ennZoJHbSXLms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=hJwhqGa4; arc=fail smtp.client-ip=40.107.57.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2bV4joTAOANDSSFFrkBCVsjwj7VJtPMpNx1zBEEatmhlz9DjdJLZIYoArvE6ofxSLZAuRr1thOIegk25nKCWcTjOhD8TBay0v8m4Sn4qDCsNIDCH+chcs0QjmK9le96kNZYGT/H2H8wlOGk7smJyuQ9UrEGDdrk2QnZUGAg8dtOei8OVkfpcZhTOlYhyoHuMBiTew+j5UG2TiN6NgoylB14nb9oHOKqaLH6ThEbmxgEIcjrgjYhucggoUWoh8hzoUUZgcDheIFYiVwmGheTsvziwcG52Gw9jMUxUZJzREk1v+p+T+vM5QCPHde2xvcwhrDwI29HZKG8FcXV4naPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMLORNEJEdA2dRS9dbLMGuKjLqd1luNABpQIPbm81uk=;
 b=CQgymaa1q3cDT+tkOEFgil9DpeUaIpra/7H7UBZnthV2ndvGaKe8qlMYoGw9oIEWk/5QSOPmEfpkRxVobod4kH5LlEXBJkjp7xwc2KvvM9qXy/zE/+MIiFH9PFKzu4hLy7VGHXV9UBVaOOBnQfhYQvbFkktePf7QYkENSM4e1kl6cvDmQILb1NA1ZJ9ehrnwdnPtC+ROcaOJFDQFtkCGJb8GE4t6nhU9zDrEENltf7f7DHyA26+ArqmixxKDNjM1i53HegQsQLUOMpbP+bSDDB/bv3L0TC+hPLUl5z+/+W76Tubd5GtwElKWdE6kvOJ5hLb5pv0kUdIWAYRWmEqxQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMLORNEJEdA2dRS9dbLMGuKjLqd1luNABpQIPbm81uk=;
 b=hJwhqGa4dNEwffWw3rgue3QQlLmbv4n/OFDhfB4YHb/ov79ANGnarrd9q3C8oUOIzaN4fn9qwW3pHvlTdZ3yTEoyq7T/aUQjyFvyTNfpmBybete4aha1mvH8zWjhgC+h74jUO6QyI0/QPlbZrKWMNGXvH1CGyTEfiKfhN+6DMI93KGFUXmeIlDfWd+IfffzAyexS3eij7Iac7PcflOaGNPikmk/eMu1ED2K8KgHSUzzr6ps0/ng6AcFidoHqdm6XMbE5mBd07wrIFXqHH6/IZRxZyhicZDmBjkUCE7m4zQ0Usif5k4q8ogH8kTtA7PIIV2c6FVeZhIW2TAtNvFuYTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB4150.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:28f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 12:34:01 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 12:34:01 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: mehdi.djait@linux.intel.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/13] media: i2c: os05b10: Refactor driver and Add new features
Date: Fri,  6 Mar 2026 18:02:50 +0530
Message-Id: <20260306123304.76722-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-MS-Office365-Filtering-Correlation-Id: 81b18e16-03b7-4635-9340-08de7b7ca54a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	R5xEdU5SiJaR06NfO/5+NL8aoVL34c3cAhdNWQdz/GURaOqoLd7MdMlK5X5l83ExiC+uYKi08Nr8SQXoh30BnqOTsqKUIrpbdj+6PD76qPPOG9G9vFZ6G8xaPBHXBojHMmEwlKTJnQ1yyuFFrjGuMvyLKTprRPhgNlNUfYk9JFyRDWjrQOmrh3IbiMS6E4X/Vv1nBXbzHzByZ7T3E06IgBRQFuWDqlsh9Qnc1MgtZIlKm0WpFBu6FhsEITSWctRRuETmU4p4rRQwo0t9LSxgX+MS2UNB0qF/QsCkCoPpDS7QSv1SnfSCzmniICP6OJfsQWhDYAfM2LKqCczkRNvcxEaSXaDBgWj3BL4dQs6T9vsEbCMl+g4WbycBg+0UEK/J4Tz6dMh23Ui1BKGdRtwGuuHMFZdT7armU4hzqz2lXjLwHyRv1q/dkrKTgLEy/9JlugLpqcxjULspqir1HwsY7BjaO+6WjelYziRGRmAXubbKc+5rUy8/T/uB7FnyA0SEKcxEW6dDUNEVqnPqKmH4Q0xuXZ300XvHm00dphipRTNNwY4BWQYzh1bBWmOT1dFSUC4D5q2pvZEJhYOgHiei1bF+jAhnLzAce39ekw1exnWiNAYZwyp052mlu6lnfT6bnzpXMgQ34fx+X7LUGPjwfQST+6DtFNxEEkpJd9dKbnzv68YiSvUAOT3+E3AIUvnHiQmpIrNPnNXSmiTaomaQq0yluuvp75jvFwr89RG9fArDWZvelybT50hY4DWo4TI+tBzqB14mL2eJRUmYGNkg0SkivHDSe4MbL0D7nRckgmQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkxoN0ZDc1kzTFVZenFMMFpLWGp2NFZ4UWxKbi95UXVDOHRXTGhwMTFoTmln?=
 =?utf-8?B?R1pVaEk5YlJhZFhac3NsM2YyQ00rWE0zNVZJN0h3VTcxZzdsdkdocGNMZjR4?=
 =?utf-8?B?VTBINWU2MzZNSU53Tk13RTBpdU1zMVNEcjVncDFsUE04d09GUG1tOXY2ZTF2?=
 =?utf-8?B?UEZhdStoaytKdUFCREZ6Y3RTOU42K3lLWTZta3pNR3NBYjlWMUFoZ0RRUjZy?=
 =?utf-8?B?NTRnMUJvSjNVM0RiNzFKUDZlaUVWekh5dzZVb2p4dXFDTEYvVS81UHEva3F4?=
 =?utf-8?B?dzNRWXY1UWRXM1dhdFZTN2MxNHVIc3ZrcXVOTWFiMHd4b2YzV2kxZmZpQkdR?=
 =?utf-8?B?eG9RQzI0ekNaRWUxc0xIeW9rSCthOG5DMDhGdGdJQjc3RzVzaXJZOXdLSVhU?=
 =?utf-8?B?eWJKVDdNdElYWG9XTStESTkwZHhjc3Zrd2JNMGlwbmNHa0lyNkRiM2xOa0Nw?=
 =?utf-8?B?U2pwNEZDYzl3MFIyMWlXNzBwQnZ1VUxuRWJwd1pvQ0lGbUxOYzBKak1rTnhF?=
 =?utf-8?B?UGQ2UDRTRXhibVQxdFptL0xmcURxNTV4ZlhFOHphbm9YZ3BWTmtHeklsL0c3?=
 =?utf-8?B?MFZGZ3hJVEhKSk5hZUxHZDFLcGlVZzh2blcrQzNFU0hUZFFMZ2lZRk9jdEhH?=
 =?utf-8?B?SkcraENQazhEK2c3djlvbWZaQUFoR2t5SXF2ODdsVDNFTWRGVWwyTWtEL1pW?=
 =?utf-8?B?bk8vdEhRRU91MUxlczBvMDFJNnhuTW02WFRlbTNkLzRBNW05K1ZmeW5aMFY2?=
 =?utf-8?B?QzVaWFpKbWIraUQ4VEt3VnF4YitmZUlLdmZoRWoxWVdRcE1KaUo2Y0FBenJm?=
 =?utf-8?B?ZnI4Tyt3ZnVnSlhsUnBIc2lUWkZmSmRJcUJpUE9hU0haK3REc3F3cW1jLzA3?=
 =?utf-8?B?UEJIWk9mRnlJMHU5U3FRemdGV1FHN3lLdjFVZ1VOS0wxVkUwQi9lWnRIOFo2?=
 =?utf-8?B?RjNDUkZqLzhzZThXNVVOS3pKTjZwNTFNN1gzaWpESGtPRVBqNUNKWHM2aGNY?=
 =?utf-8?B?bk12Ty9QblAzaGlFMFlzREdnVUE2cmVpaWtjTFl2ZWM3bVI0SFA1SWxVMXlB?=
 =?utf-8?B?c2pmVlRUSXVaRVlld0JHeG9ENDAzSlJ0dUJrMENlYnFhWDlZRU5DanA1d0pK?=
 =?utf-8?B?SmJiR1VzVXQzWFZDV0NSK052d1cvTjdWSzd2M1lpWTZWMExXUnovQ3QwSUMw?=
 =?utf-8?B?VDVPSVhjSExHR2w4UHpxeXlFVzhJV25QSUJnSkZ4TFRVY1VZUXduK0VEU3dk?=
 =?utf-8?B?cERPNkVDcFJja1I4STNjVGI3QU1MUVRUWEtsQXgwWE8xUVBqTnRURkdqN3l3?=
 =?utf-8?B?L0pONXAxaktEUFBJT1ZvQmpKRUh1VjM2VTFpWWdDaEwwSEd5YmlwYTlsOXhE?=
 =?utf-8?B?ZHFHNDF0TXc5ektidS9UcndKOUNTdmx6cy9XQVpXT0U3SEFuS2JsclBOODZL?=
 =?utf-8?B?U2N4OHBTUUdWR0MwRSswV3JqbXFReU5wN2g3eExMOVFnUG1hU0J6d2lXVy9k?=
 =?utf-8?B?OStmTU01cmdaUTVOd0tUL0w2QzV6NEVITW95cFBtTnlIT1pYKzJKN1llY0ZF?=
 =?utf-8?B?cFlaaithbUNWQmpSWHBpYWlmQmRDS0hIbDlWK1V5ZmJwRksrN094bWxvRC9x?=
 =?utf-8?B?NlB4N3M4a2t0T0xLUzZsS05DMUVFeWkrRGFibjZvblhvanVvdmZORThJcXlM?=
 =?utf-8?B?aFpEdkN2eWt4c1Fmdk5sWHhLSFFBMU1iaWVYZE9wTmtnRWxhZy9oRlVORGtr?=
 =?utf-8?B?bWlHdHdaUUtGUDg5OVk5cnlOVTIyYjVJUnJhTFhzSHJOVnBBUy9HVFplT1dw?=
 =?utf-8?B?NWpxc1pGZmluWlVkVHdIbU5BRHNQSUlYbGZhd1Z2K25WcGdqZ1ZjVklxNDBz?=
 =?utf-8?B?NWRJQ2ZhZWJSR1pRNnd5RTVYMXN0WkhiTVo2WVRCTFphaHFvSk9XRU0zSXJN?=
 =?utf-8?B?d1UvcVZ6b0lnSksyWTdFQzFRakZ4aDFBK1NqaEo0eXpmZ3pwSU8vRlZ1TC9P?=
 =?utf-8?B?eXNKOVFZYXVvbG9zejhMY3ErQmNTcUVVZit3WEhkRjZvTkY5NURQR1NvTjhJ?=
 =?utf-8?B?VndYbjJTNncyZ1FTb2poaHhIeS9VQVBxUTYrK0xSNDExNjVtcjloVnhtTkhW?=
 =?utf-8?B?VkhuR1pTNWdiTG9ER0pTZzIrK2hTMDgxNU1tN0tkRi9lV0h2enlCWVhaMktN?=
 =?utf-8?B?dVhSRkJEckpic2k1U21mVStrTU5NYWxod1dLTmNkcHlWMG4rd3NEc0J1NERM?=
 =?utf-8?B?U0tkZkxFQjVKMktpYks3NndESTcvTkJaMUloNWtEd01uT2RIYmJwUzRGdVJN?=
 =?utf-8?B?K2lBT01iODFZZmdlVENtNTNIRFhMK3RKWXZ4TUlZUmZGcDFFKzc1bklDcXFS?=
 =?utf-8?Q?7Imqkf73fSv6ARwE=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b18e16-03b7-4635-9340-08de7b7ca54a
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:34:01.4839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08H5hMjMDykfUE0iV9rWsUrgPW8MedmTty9lyquGJ0qdczuUhgDuGuKH5om08InmkEXWtTm9ijnIeZ/izeJxTgB0WGpTeisCar7PWSrgJgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB4150
X-Rspamd-Queue-Id: 39E49220B76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54754-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

This series improves the OS05B10 sensor driver with cleanup,
refactoring, additional controls, and support for new modes.

Patches 1–3 perform initial cleanup and refactoring. Unused
group-hold programming is removed, register definitions are
introduced, and the initialization tables are reorganized by
splitting common and mode-specific registers.

Patches 4–6 add additional V4L2 controls including digital gain,
horizontal/vertical flip, and test pattern support.

Patches 7–9 extend the driver with 12-bit RAW support, update
pixel rate handling when switching between 10-bit and 12-bit
modes, and add new operating modes including 1080p and 2x2
binned 720p.

Patches 10–12 improve control handling and internal logic by
keeping vblank and exposure in sync on mode changes, updating
the active format before adjusting framing controls, and
renaming the vmax variable used by the VBLANK control.

Patch 13 adds support for 2-lane MIPI CSI-2 operation.

All patches were tested on the Debix Model A board running
Linux kernel v7.0-rc2.

Tarang Raval (13):
  media: i2c: os05b10: drop unused group-hold programming
  media: i2c: os05b10: add register definitions and use them in init
    table
  media: i2c: os05b10: split common and mode-specific init registers
  media: i2c: os05b10: add V4L2 digital gain control
  media: i2c: os05b10: Add H/V flip support
  media: i2c: os05b10: Add test pattern options
  media: i2c: os05b10: add 12-bit RAW mode support
  media: i2c: os05b10: update pixel rate on 10/12-bit mode switch
  media: i2c: os05b10: Add 1080p and 2x2 binning 720p modes
  media: i2c: os05b10: keep vblank/exposure in sync on mode switch
  media: i2c: os05b10: Update active format before adjusting framing
    controls
  media: i2c: os05b10: Rename vmax variable in VBLANK control
  media: i2c: os05b10: add 2-lane support

 drivers/media/i2c/os05b10.c | 676 ++++++++++++++++++++++++++++--------
 1 file changed, 531 insertions(+), 145 deletions(-)

--
2.34.1


