Return-Path: <linux-media+bounces-58959-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ONKMwnf4WklzQAAu9opvQ
	(envelope-from <linux-media+bounces-58959-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:19:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FCA417D7A
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C17C03109130
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 07:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FA4337699;
	Fri, 17 Apr 2026 07:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b="WhKHbRUp"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022120.outbound.protection.outlook.com [52.101.126.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9528814E2F2;
	Fri, 17 Apr 2026 07:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409302; cv=fail; b=VNt1alfzFPMEzVwl+J7MSl+Myr9hpPIbxQ1FNQPkvnDY+ys39YngGRspMss7we+OL5Au7mMk/S+2y2w0fwuWophUsNncTsb6yh/HZN8WeFJCxKdd7PgmmjWSF9GScBAE1GVcdhNhYA54w10e2YYhY66WSIr97a6smW1eY98bEp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409302; c=relaxed/simple;
	bh=ogAnZ+UD4uyUphm196GHyREBxJGk3+6VBLL4si9BQec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kWji0JNdQ7cBmvL0kId0yXBrgeQutnDs2xjEDvuaTxLbGlTcH5d+wb8/X5FNHaaQCjSsg24bG++a1H3GC1qRfM0F8R/siCqjUPkaz7x9U7Gtup8Hg1ruPAaUJQZkRM5TZV3jqE3OEwwMW2M6MGqi3P3VHNKXvxRyy3S8+D8EDZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg; spf=pass smtp.mailfrom=smu.edu.sg; dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b=WhKHbRUp; arc=fail smtp.client-ip=52.101.126.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smu.edu.sg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OL+FDfZkTJMingwGuAlm6rA3QxZ4mYrG62XfSgdsiebn9ht98q2DnF9ASkmQPFGndVDxIz+iReSdOB9bn2RLHN+K8RXaJziLxHdZ2c35/WDPtJWwe0nQYbFx8ORdzCq7tp3Y9eNmjfpsK7qpadC7sk2YEbeXImIrNmv/rixn1j8JxLhe67FXTUBNXH5XzHaHHp1xUiSdCYuDDhWT7L4JfyK+/gvaUJpxoYUpgR6Az8Vilk3Z5XuSIMkYUjww5AUhWE8NnB9nsKhUAVlj8N/g6c6kXfz9CiHkXmpZvnsFB/pt8uInrc12FC5VXHNtf25ZFepcWQanxnudOCz9kUgqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4fZzSp6UM7zf1e2xYwMk++QV9daMnJJj2wAG/i83Hk=;
 b=rDPXgjLAMN1/IZj/wlczBDGu9znrvRULNN7w3ao0mT8NEni6mAMvFXufuomBv9sW8OqJrgkHr+2ImdWiCYNdx8ZqRNXlGwy7TzpzAx3dadfCtfK5ng2lE7eIWcc6cIiBCvz6W7NmXHaEs6CZASHQwpN4dGNYU0p/c+f9YDI1IyqYekZFlnD7QloX8FAyHtuBTi2ghPSvhijHzFJptWS6vDPfDdimwege9+/Wvt3p0TM/CGQzmI5VBThnL7Fyf3pJa4UDr+4pDh3XrmwMBrjvWcm/5zm/C9l5x4JIFFlm7SAzL9KRP34GxsUUllS55q5G7yikj05lsi6XaIObX1SLRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smu.edu.sg; dmarc=pass action=none header.from=smu.edu.sg;
 dkim=pass header.d=smu.edu.sg; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smu.edu.sg;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4fZzSp6UM7zf1e2xYwMk++QV9daMnJJj2wAG/i83Hk=;
 b=WhKHbRUparb/di1yZ90gznO72S1pa73IvmhOtPKdEZkWvwR6lg5kfu8Diezcc7gkLLm1FXwlYQJ/QnEdZg9xZfwoT8GPq7gkrtrXDbKerb5qKqveZe1phgIQNbw1orxr4HWQ1evTjOIMmPc/VnW6HdlOW7DxFazLSTaXNCGr2tntrSZY0nhsX3ixa5DE8ShuSkrxMNIvyz8Ey8Y4eMvtLnXkDDefLTmflfxLjO6Z47WMXjAEZoegCsGnHsYT7udiA/hXokNzFZWPRNes8j+oNPgke8g7xCwQMG0VYiHNdx73+QYSdacyEjY8FrH07+4aVumwoXTJKH6TlA0McpJUCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smu.edu.sg;
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9) by TY2PPF193787BBC.apcprd01.prod.exchangelabs.com
 (2603:1096:408::38b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Fri, 17 Apr
 2026 07:01:34 +0000
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595]) by KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 07:01:34 +0000
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
Subject: [PATCH v3] staging: media: atomisp: fix memory leak of dvs2_coeff
Date: Fri, 17 Apr 2026 15:01:24 +0800
Message-ID: <20260417070124.2677399-1-hhhuang@smu.edu.sg>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <V2_MESSAGE_ID>
References: <V2_MESSAGE_ID>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUXPR01MB7791:EE_|TY2PPF193787BBC:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be76155-e948-49f8-ce3a-08de9c4f2901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|786006|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	W9IlMTNH8VXW2TCyEKwjynbylwiRWmy5zeqi609kQul7M2rJjWAR34bRTNoJ/HiTXyOXQn7CV7H9DrrS6saEvsOwQ51aGLn6yQ7jRVLhUIUoTCECsOwFEbV4+6rfxJqKj41rVhdPx6MHZXWYQnJAub9fpAYAN2pDKMDZt6jLsWDvbVmrqPi+I8wLdQ7wGb0Uo2ytgWom1QT4JFqoUfVBgZk5u530L8PvTMjofCq/2nn7ngNtfqQ3BlDiWzOMjqOItTYMj0EhxiQf5o6ynruaCVJTo7qoC+XyAKI+a9xJ64uwJBvE+k0L1ZUiyK9+XMO2CJlRKtm/wmd8pyROe7FpHbsamO520yCJH4DAOrvlVEi2ZjLVYgKSbx270VW3TouHN3GTzO822lXaIGVplhx7/UkZ+lnJPRSM77asGYRIzvCznpzw3rsxzIcvS0UtbYbqaRwVz1Y1x6yRb5nO+d6fOM+8MCH7wAA6pdVxeaBJLeFIIrsofBnJfcMjgoQ9AZRKQM1Ia1ko17W0I69/QqJLwBKDr1stO16wNZKJXP7gVtmVkpOe1w8xB98peOpbYIcKhXDIsusd9S8SHBBN9lhkdPPITZ3OzktraleBTC9WdPjxadd6WSGrLG2RWNcjWExiKf2R25L7iTePS6ZtdACkdtuUvejOtMp2x/8zwvP3/VJSgD8YZ/lEJdmJxQni3LOwCsEqW13WfplV0L5oWTC2rVnKVKlZs4hMYBXFf9IZUknw4YkYKtzRKYnCnQ0FyllK6FrEu1aYpJEFEhTauEG8hqKriX0MacmN2mN8LFph8d8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR01MB7791.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(786006)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dheBgo2Zjnxs/9ZltUaRCJ6gfNRE8eJPT8zbWWOv5XWk5zNNY3oi6zBNLiBp?=
 =?us-ascii?Q?PeQ98dUlskIyvs+O6kEGDfQ2rWpI4ndwLZe1d269EnKZpg0EHrQ/5aARq/8M?=
 =?us-ascii?Q?6NqB+ZLbejhkSb0bcYz7vCIWnQtOluHXtO4BUFPmWVvAu6k+hXZNbkWpH1Zh?=
 =?us-ascii?Q?JfbmfM/CAgGow6d+IhPH4io4c/WHkXCS+dIqns5if/Og7B2g7VB18Kd+E99Z?=
 =?us-ascii?Q?ClzWnQ/HFh1e+4PEzI2Mc4JM+cVICOp1GdGGD32kRAaf0bo5MSaphIrkpive?=
 =?us-ascii?Q?nebEJbOxsPibU1So4qebCGdsbZC+lNTzCYiAdwgryzZY/skEmUydNuSv0zVt?=
 =?us-ascii?Q?kAJ7A7cXnmIs5h+07iGTWj3EWOKZcAKDbrQaYie+OkVnktVIad2KBbRAQOj2?=
 =?us-ascii?Q?hV7jx4ZZmD7OtSNY8KZmsixiDPzcFrzpMGgneDTtL0KfrZECalJJFf8d2kS/?=
 =?us-ascii?Q?4JlSXxkt+uIBmPLLs4KpYTuAZLCPuAY8SH4K6WPSbUKN5E6EIJVTno+bEGj4?=
 =?us-ascii?Q?QRhUvXZMP5LvpRS63Vx0PumXc4boi5ZwZ1c9l9MwxMqXVTTHJVv8eTA8TTIU?=
 =?us-ascii?Q?oMFwZWiBn84sPBK/vYKafhqmV5ZNbMtZCx7Ft7j/SIuQWLB5qSQbkUcYqP65?=
 =?us-ascii?Q?CUm73JYoeM+443yuEnIb8uBN4eiGe4npe6Be0mOgPpQ1mwyQDKWehFsdznvW?=
 =?us-ascii?Q?yF34gdgIatfeS5D8M2flzuBfQsV9FgTqAF8LgbFtPLccbUsrz0FX4u3bdcV7?=
 =?us-ascii?Q?ASBpOC605ChuS9XbXraZIb8LqQN09wqWJ1YQxgt+2/MD1faj3UfxvAOLw7XH?=
 =?us-ascii?Q?5XKKHkrVDV1jbUYJREZfCOf3PtT2FPpdZAKgJiOSffTp1hLHE/fBId5DCqHp?=
 =?us-ascii?Q?AGtdesZZNXMpe8BYGuWyY+r0j2d1mc9piOO4PSMFAQgX37mJRDFMe2rDqJ6K?=
 =?us-ascii?Q?gQrqHlST5x5nR1HRvapLWKrNltftNR1Y9UdgR8FUjM3RHk/43zElwXqV11en?=
 =?us-ascii?Q?wxSN99PSqKsX2nhf6XUDAgPRgvKhGwHDy/h3G+rmdzb09+BzuKev9a2p+1F5?=
 =?us-ascii?Q?D+xxif1Kby2xVIyObyyZSJijOYx7PzBlI4qlyTd0KSxLvlXP8CzFeaR0zfJ+?=
 =?us-ascii?Q?W0va0K6zw4Si04sLrJi47SWsQ7XYFoNZXX2BWbzUBDXvlvXDbm6dq810VifO?=
 =?us-ascii?Q?5/vilwX6aPjbPwjC6iBFqQXrfwsz4Kl/ixmpM45mhsF/fvHPYUXPgQzpHj8U?=
 =?us-ascii?Q?jMGs2c1ZCs5IE1k6AdANmPIE7N6Pek0eX8xcyqyrtSsdzBbdWPT5vqF+e/Qf?=
 =?us-ascii?Q?Vcciq56pPeoV3xX557aLsxoPG87ROcn82ft4TouA9Yg1LOM0ZWt38xO/2jJc?=
 =?us-ascii?Q?Gb+ZtgdU9zLMBGLwesPda6L/6ZSa6zMqFZOA2fqS13WeXY2G6n39kMN6HVda?=
 =?us-ascii?Q?dFqoTBFmsIMV9o1gyhwNb34S5G/N4mNB1S3dQDyJyxYOZRHdMflIvTu5nrsi?=
 =?us-ascii?Q?tSKesY3zw66vB63NqDmUKMxXeTMdf5jWyUS4T3sZw9KMkC2C5qa+MopwKEVL?=
 =?us-ascii?Q?xYXmk6ZfGrkeZyMazCOZ+LDR/7x04zsrEqy5bACfz2jfP/l6RcXlv3FajWtu?=
 =?us-ascii?Q?6+B/3JYi80RvpKAHYLhjIFNLTlkR77YO8hx7UEC14bNZTaVHliXSd3UoOPmf?=
 =?us-ascii?Q?gCypqN6tY4LcAsThuiPoRVDLB6EoiRYB1Gw2mbJnVkqfbjfn27KqntDBNoRc?=
 =?us-ascii?Q?NlgGoEytmA=3D=3D?=
X-OriginatorOrg: smu.edu.sg
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be76155-e948-49f8-ce3a-08de9c4f2901
X-MS-Exchange-CrossTenant-AuthSource: KUXPR01MB7791.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 07:01:33.9605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c98a79ca-5a9a-4791-a243-f06afd67464d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUd+pQL44X7EiFIqqvDKMQ2cvL8dBAEObIcA7O0vQKKfUb9quwV7acJjh+opML46bjPovp9W+IYF7lAEA+DJyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF193787BBC
X-Spamd-Result: default: False [5.84 / 15.00];
	SEM_URIBL(3.50)[smu.edu.sg:dkim,smu.edu.sg:email];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58959-lists,linux-media=lfdr.de];
	R_DKIM_ALLOW(0.00)[smu.edu.sg:s=selector1];
	GREYLIST(0.00)[pass,body];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[smu.edu.sg,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hhhuang@smu.edu.sg,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[smu.edu.sg:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_SPAM(0.00)[0.121];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 65FCA417D7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is a memory leak in
drivers/staging/media/atomisp/pci/atomisp_compat_css20.c.

In atomisp_alloc_dis_coef_buf(), dvs2_coeff is allocated by
ia_css_dvs2_coefficients_allocate() and stored in
asd->params.css_param.dvs2_coeff. If the subsequent
ia_css_dvs2_statistics_allocate() for dvs_stat fails, the function
returns -ENOMEM without freeing the previously allocated dvs2_coeff.

Add the missing ia_css_dvs2_coefficients_free() call before returning
on the error path.

Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
---
v3: Remove unnecessary NULL assignment per review feedback.
v2: Reword commit message per review feedback (no code change).
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..d6e135c42e2f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1363,8 +1363,10 @@ int atomisp_alloc_dis_coef_buf(struct atomisp_sub_device *asd)
 	/* DIS projections. */
 	asd->params.dis_proj_data_valid = false;
 	asd->params.dvs_stat = ia_css_dvs2_statistics_allocate(dvs_grid);
-	if (!asd->params.dvs_stat)
+	if (!asd->params.dvs_stat) {
+		ia_css_dvs2_coefficients_free(asd->params.css_param.dvs2_coeff);
 		return -ENOMEM;
+	}
 
 	asd->params.dvs_hor_proj_bytes =
 	    dvs_grid->aligned_height * dvs_grid->aligned_width *
-- 
2.50.1


