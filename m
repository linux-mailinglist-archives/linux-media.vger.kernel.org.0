Return-Path: <linux-media+bounces-58851-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCB0LPGE4GmmiwAAu9opvQ
	(envelope-from <linux-media+bounces-58851-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 08:42:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C3840ABB7
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 08:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4DC330DA58D
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 06:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483EA37B030;
	Thu, 16 Apr 2026 06:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b="JhwoWQ+d"
X-Original-To: linux-media@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022116.outbound.protection.outlook.com [40.107.75.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F87F379996;
	Thu, 16 Apr 2026 06:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776321745; cv=fail; b=XPG3n27QRgtq5mdLUxR5J2CwhRccqBo3zpvL/qJHaCzP4qB/JkRdgYOr50RwoS16DgGFxL74aWY0g/ertzSCJasw9OXlUz0MD6IzlkiCQW7DHuAkrFksCEKdKp1zwvYf5+DZe04lLZBbVOCCQdAyE6ciwHNV82jfX1KrQIk1uYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776321745; c=relaxed/simple;
	bh=W90DjUrlXOgmSxnTwxGzNtN8Fa5pft1vxRxC40IVW/M=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CMSakc0WEJCNJOLwY9GK8BJELb3mUhIQdCc/8wWXF6dLTyYg1uDlMsctX1cPEiWmz3tOD1Kr4EprMDaPAGFIXLdgL8TVVgiWdveybxEtzhP2DHn7MUv+Tt/27wJJ9JNZHfJCndjCvhDEAyW3g6qWEh632DG+Yk0szfm0OVXnzvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg; spf=pass smtp.mailfrom=smu.edu.sg; dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b=JhwoWQ+d; arc=fail smtp.client-ip=40.107.75.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smu.edu.sg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTrICWsK2uljuvY9W4GAYOovPb/4vnIDFkB3o48ZyJgPi9/g0lcbRliir720pnnRJ6pusxozXYFNizvj/EyB21Q5p+j3YAMkR61M+VLsb2jU1pUYFgo0wRjUHXII/WPGu+h1f2s18tN5A++3gQ0y++vATwWk0BVbTwFhrebdQ4EdSXymmjWcr0Yn41uecjPyeJNuKNB1VVvEXqq35wYeNAqjocw0qqBeRnhT7QrJzxudvYP8bAhvlBU5jdS4r9awtSVZTjMQMV5oG+EglrZJ5KQZVURX0OFD+F5dvveos2ETZfcyJ/FyA7SeOVZJjacqFBpsKtbdqxnYsfiElVfPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgDjqMWIrTrPGHU35q4qFN5BMoSKKTGHb/rhYpFsVsg=;
 b=HlLH2Zcz4EIbjSMxNjhkLBTCIh3CjxOx26Pjm24fPe3ZTn4G6gteaZDQlTcvXNJCl9QLcACTS97aNWicqR1iDU+FdqN0isI/T85p8dlo1YEtXMqESfnWohaLLP28eb+UP72+SqYMhxbcsJcXcSRL6/7JyrGKiLtpV8WZutYeAT/InaS5oKBRcFKLMcipsDXIqrnCZf5Xqz5VWDHVDhGA0Do40zgvQ+2TULR1mIGb45lt40LOT/+Ga/1PeiZTr5H0pY1HeVHHuD8KUROAw3MTPygHk0ACK2nBquOA4I1gzuLX1sa5mbu6O4wTHN1dW1nrtLIW4bCHuP+rFyF4YZUi8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smu.edu.sg; dmarc=pass action=none header.from=smu.edu.sg;
 dkim=pass header.d=smu.edu.sg; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smu.edu.sg;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgDjqMWIrTrPGHU35q4qFN5BMoSKKTGHb/rhYpFsVsg=;
 b=JhwoWQ+dSjFas4DEshfUnDDujfZWgXVwD/Wibb9yDc0vJ0ygicQXIeh3uz1Skkb1ChR0/dQmhK12WfgaXIkovcyBAUHzMhrFFUv1OkuIqOJhdI9Uy03GoUXomDZSU5wQqZN8OK/llaKOm92hpuolCff5IYd2XWJWAGNxn/HKZzM0PFjUA7HvJG0cwlTOa+ufjcNu0sYxDYyWmAQXlVM2Z2A+ORHnsL/o4BW9BJZBRfdGbHInveWefyUNq5R9ztc63HUmELJ2Lcln1RpQ2vUIwztWC7H4y3v5NJWHa9UtA3l/aHSUJDECxLZoSIldZd/6KBIdmEYVS2GkmuY9EYpq+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smu.edu.sg;
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9) by KUZPR01MB7890.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:57::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 06:42:17 +0000
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595]) by KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595%5]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 06:42:17 +0000
From: Huihui Huang <hhhuang@smu.edu.sg>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Huihui Huang <hhhuang@smu.edu.sg>
Subject: [PATCH] staging: media: atomisp: fix memory leak of dvs2_coeff
Date: Thu, 16 Apr 2026 14:41:52 +0800
Message-ID: <20260416064152.2482461-1-hhhuang@smu.edu.sg>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0166.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::22) To KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUXPR01MB7791:EE_|KUZPR01MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c06cf6-7190-4984-c678-08de9b834d3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|786006|366016|52116014|376014|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wiznsxhapv8ED6wKtsjhcJs7++wTIi+WQCROg/LYzCJoNIZND4khNDP8fD5hA0NQIAimua2KaDTUXDrepTVWzyCYFmqMRC+9f79yFbh/qiNSXehoQuVGnFYs6aMH4jysiNmhfzNQGHrb/4lxhAkBRGVyGc9SrpHWoWWtBLVuuUz3LEscO+hIBKR2CbIJb++DkH7gHgP1RMP5I1f9ukJ3v+XRYRHgU5KUpXpn52JgPdV24v0vokOXxiherVGp3cappgYz9OS+0zjFtX8ekNOaMVMQSxGiW+AWwiBUo1qV1Ba+MI6X9bj/KsXPe/T/cDxEbH8/3VmVx81e9s5F7kHDW7x5X1mdcpC+4qgsA1rH3kR4hQrmug/PCRjNkszTBBFFDBEXcheU+9Oxptidq55QSZJTnRIIcnI/Yv0Z/oHU7nKFo4OsMPxMXgKcYaryGnpVGoC4SOToO4hmlxuSPpV0JrhmpwzBU+D0f8araJkRVHWeN7Fd7p72KoOXgS3rt008Ie+djnI/EdRmNIBkdSR5eeqsN4ZLmzQy1qAF5L08/JXTWibG1YkBgoyzNnzo2yT3I108OoOdidXFlEQIxtC7kJSAJLj9Lg496BY3BLruB2GJSVRMsGF0myoL6+IrKAwdrXuGdV68udv23MPGEK55IZzGqv4DdtpJ3q9/2oXVrukSD2XNzcrxEM52Ec/z4c+2gFIyz6kaEQS761Ci96BSaKpH4EB4Vodixi+yTYZC5iEawCMFAXbb62s67G68s7vG7t9SBIosV7DL+oQ5uDILI/g7h89/LstWtTiYVpXdHp4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR01MB7791.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(786006)(366016)(52116014)(376014)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PcPEpM+xUgpf92zTyRJjZQTPp8ixw8SpZb2olC5vlqQBDhGqo1nKNA2duNhC?=
 =?us-ascii?Q?gSSz3XRmj+eKod2IqlpKB5RqqGAZ8LPope6ZnPTZo3hc6oy5a8RKqkrD1vQ9?=
 =?us-ascii?Q?fFVWs21EExRLLOU370zk1M3/9hASYXixV4GirpgjmkvSIBkCJa+zCbQbwT5g?=
 =?us-ascii?Q?nmsAhNSyQmhuAGF1m9Q5438kchzeMot0KWvCxyi9lvmtUnRPJDBdbGTwuEGl?=
 =?us-ascii?Q?HgheeSuY0LQSpSBWvDhd3p0KrA7R3wZzX7zpeyS0meHEHGX7J6LI2ap7iLdA?=
 =?us-ascii?Q?Ixw7QiVARWiEaib3HynkgwHUrBL2k9tuEzUJMWW9nW4vVZUfhmR0daX3sQSY?=
 =?us-ascii?Q?pX+hH/AatvI8A2v7NPN3+F1osb3FgRZbwCNCPIohflXUh0SMjen2kQHNJ8xH?=
 =?us-ascii?Q?AV37dZiIusbD5Sv1lyLqGKKvoFWfF2wIMT9F0iv0jW9Dp/yHWkVLaDdDIwvK?=
 =?us-ascii?Q?Gbt8BEp50MD2woDAAfnl3IfDRUupK5FUsSsbn1kjcVKGgj7FJMgWGf5a9ZFz?=
 =?us-ascii?Q?kAh8RT8MuOlgj0YtdVpFfIWB6DmUxZprzrcx0/2Qu7NXy8K8VoPIP6B9tCbZ?=
 =?us-ascii?Q?8CtXXfhBY7qOXzG56YBu92/+hiUg7Acb5cTQHqsMMeYwf4MviXLgQuWXxci9?=
 =?us-ascii?Q?htM5TK6KXraSW/CkBai0DWn1K5nOm2+13qZwfEsNDGP5nFUhh8PPImEvYOJ2?=
 =?us-ascii?Q?1zjRJYiLp/6Gv/CgyhyJNkc7YtwhLWwLMNkYjjpdcnU+lPX1rUxroH6yiZXT?=
 =?us-ascii?Q?Kujxa9sfulhR1fXYakff2E/aWz+mXu+vAFM5ZxQ6/vOgUYnNeKtsYhCpqft4?=
 =?us-ascii?Q?w2L4gca/GFsgn9POWh5/YS1pAkYhsV3f9ZYAPqFzS9q4WfzSrZ9YWJ6Avshf?=
 =?us-ascii?Q?7MzVQZg1sMYvzfbOj3xz1XTD8zk0dp5TrXrFPS97PmO1TmuJccZp1TEPuBIC?=
 =?us-ascii?Q?Z1GQ3NjT9uhnLa8/FniT0Zn2eUnA90Af5HnXmq6nnD0IhshRD11ypNuM7fZZ?=
 =?us-ascii?Q?hxLAMPP17eJIJzBRpks9cAsYvsCjUEKKhc0C3piv5gv/GbspCLibV5hu0HyF?=
 =?us-ascii?Q?YSqOr642tw15YZ7DZ+tMaRX0YzgfKi/mmv+MoEXYSAAhzPaLdcgD5qeFEWP0?=
 =?us-ascii?Q?yvoFyRg7qzSVDQRtRfv9gmRlpDPSu8feNJW5VaPmqz3VKfdqiEVRct7o7oZg?=
 =?us-ascii?Q?R1S7a3LkfhudFtiQGNIy++4nRAAtui2aDVZk4h1J5prhPSNjwK3eRiB7hTDp?=
 =?us-ascii?Q?auy6NbDOe9DtC2PGcCmjqgIovLEeVxobhqo/dsA3j+F3ULOpqsM5PfETnPrt?=
 =?us-ascii?Q?Kz5MiBfYxr+Go/UL1q3RpVBa1wiFydjSmxbUTgpqjxcqhfnvYhlgRdCRITno?=
 =?us-ascii?Q?gdirapc86AXj4k5h4PtbUVQIEhfByyM1fJWw5yFhqkrZSUMycocHOd7ssZxt?=
 =?us-ascii?Q?hhILr4MJaMEeHalxKlTl5OMhemHAUTsxbpcrHSJO+lbqTodrAB24kKjsRflm?=
 =?us-ascii?Q?jx0wDjYgXyohc1mE7ur2kaNw86wXA+voOqjFxbcBx+jdOm3tgdiKZKRZPp+3?=
 =?us-ascii?Q?QeJZQJzxiaATSPzKu3A8lh/EckIiZ7slJttWhiqBNG5QgapISQntENDboGt0?=
 =?us-ascii?Q?3szhyPxN0v7JRsdoEx8l6qF0Y8AEvk4W6e7sVt23YIj2uK7aEjVQNyLTrvKi?=
 =?us-ascii?Q?LRtwleegWCc1TzDHyd/GqMl1Q35azEo4Q6RMYoHSFVst4O1IbUap9N4Qrzn5?=
 =?us-ascii?Q?pQr6abvDmw=3D=3D?=
X-OriginatorOrg: smu.edu.sg
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c06cf6-7190-4984-c678-08de9b834d3a
X-MS-Exchange-CrossTenant-AuthSource: KUXPR01MB7791.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 06:42:17.2998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c98a79ca-5a9a-4791-a243-f06afd67464d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZKsQvVSk+jCto98HTwXf+kqqnqltqmHglOr+G0rtdh84+a9Gw52xl+ehHqz68bJtF8c3+le6493BqVtU5KSgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR01MB7890
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[smu.edu.sg,quarantine];
	R_DKIM_ALLOW(-0.20)[smu.edu.sg:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:server fail];
	TAGGED_FROM(0.00)[bounces-58851-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hhhuang@smu.edu.sg,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[smu.edu.sg:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smu.edu.sg:email,smu.edu.sg:dkim,smu.edu.sg:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 92C3840ABB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Our code analyzer reported a memory leak in
drivers/staging/media/atomisp/pci/atomisp_compat_css20.c.

In atomisp_alloc_dis_coef_buf(), dvs2_coeff is allocated by
ia_css_dvs2_coefficients_allocate() and stored in
asd->params.css_param.dvs2_coeff. If the subsequent
ia_css_dvs2_statistics_allocate() for dvs_stat fails, the function
returns -ENOMEM without freeing the previously allocated dvs2_coeff.

My patch adds the missing ia_css_dvs2_coefficients_free() call and
sets the pointer to NULL before returning on the error path.

Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a..d3dc84e14 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1363,8 +1363,11 @@ int atomisp_alloc_dis_coef_buf(struct atomisp_sub_device *asd)
 	/* DIS projections. */
 	asd->params.dis_proj_data_valid = false;
 	asd->params.dvs_stat = ia_css_dvs2_statistics_allocate(dvs_grid);
-	if (!asd->params.dvs_stat)
+	if (!asd->params.dvs_stat) {
+		ia_css_dvs2_coefficients_free(asd->params.css_param.dvs2_coeff);
+		asd->params.css_param.dvs2_coeff = NULL;
 		return -ENOMEM;
+	}
 
 	asd->params.dvs_hor_proj_bytes =
 	    dvs_grid->aligned_height * dvs_grid->aligned_width *
-- 
2.50.1


