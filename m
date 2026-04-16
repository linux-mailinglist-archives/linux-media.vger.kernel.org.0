Return-Path: <linux-media+bounces-58853-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN2sHIiP4Gl6jwAAu9opvQ
	(envelope-from <linux-media+bounces-58853-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 09:28:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF57F40B06A
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 09:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2A8F308EF00
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 07:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8293A38AC62;
	Thu, 16 Apr 2026 07:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b="iwnrgp/P"
X-Original-To: linux-media@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022114.outbound.protection.outlook.com [40.107.75.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F383324B23;
	Thu, 16 Apr 2026 07:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776324477; cv=fail; b=nhJet6kuoKQsv6hPL4t2j22beDotD48l6mu6SHgS3qr+frz8nsm2o6nCS223W6TIFjXI3gfPRpqFo8/kOVHVh26YBfv4+i7YOODqWl757yxgZ4BOX59yTTvRyXRfeAJjOCTegezPOcyvBDc+dhMLKhKO7opZ8+HjMcCQWqzq9C4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776324477; c=relaxed/simple;
	bh=AkAX3P7mJO5x6LAezosEPZ9Hcukda8+XFtcWIRqFWgc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fbAkt0R1vrHeMU4e2br72crHlqFyl09DQC3xxpVwgpZCQDCdoQyrz+xsT50waV4sC5+PmanaEOBQDkcNPuFC941dggOCoMRcAk4rWQLuYjgozJoz3advwnqRlXW8yBbrXCAebdwpAR4eacu56YRAYHDBzjS5wIUn+kH9ivMlAHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg; spf=pass smtp.mailfrom=smu.edu.sg; dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b=iwnrgp/P; arc=fail smtp.client-ip=40.107.75.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smu.edu.sg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrmM7FgsuF+wQ7Az8LDB+2ZrbBMaTJllBFfsHVVyiX6fPMi9QCiTGT4Sey/vzYeF33JqfLyQUWYtplu2fUdUa80VPoX0fc7riDVYBy5TZFJwAGoE8AVjD3PCUls7zX/FuBJLmCnV7BgwtyIMcwn00StdYbNv7OOdiiD3ZfNfPBUS/tYNrVixoL5TNzTo2e0QPs8x9W17uWXrQIr6ku7egvycEyDWWrasXLZSmecI3hedbNKCQHNLp409B9Wvc/mntKDcpEQ5U/bDLH5ZK0Qp4+YDO7GmgW31B+deGj1/H+DBLcKrhDFA/DR6V5sIEltXXtWxMaO0t9y+gCEgR6riTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2YjnS1xLstN3/zh5SiSy7awO4FoIfJt8fk2BZuoxBk=;
 b=u/kYgLmo/RKVVQAZbUSonJe+onlB28Qkpum/FN8xDnuR68Hq3JDwgC9UZgzTktX9W9qAXYu5MP/t4uCy0kBxzIJ4PhRcUJYDlAyTIrvdhdr0dLw/2/hAtGhucq5Pv4raLWTrFtRxo9EJgaPss4E1/Vz4hnAKQpQC1d/1chX27bg6ZBfZ3Ie1D9f3SKLzfZ8bzTNJWo/8g1Tcj8dP6MM9aDesVNowLuQqDgfBfKHp2LQOa3pBSJsdL6tvQ0Ex0z7ZHp+ny8gZ+zr0tJQNzMSkESbZwyFjFdl9G7IBKf96Nqneu6tKvQncZXF50qcu6dkCfcSJt2SjsKk5Z+SiAyZy+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smu.edu.sg; dmarc=pass action=none header.from=smu.edu.sg;
 dkim=pass header.d=smu.edu.sg; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smu.edu.sg;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2YjnS1xLstN3/zh5SiSy7awO4FoIfJt8fk2BZuoxBk=;
 b=iwnrgp/PkhCryzqpvZrPaMgX9w7c2ygcBLunQfdgDK2mGaAzyMA6rhaRilEjkiFQylfGHFoTpuPzsr5KaXBxiaO9igBd1S3iiEsRZ4F2fQTd03y4OLkv+rwZU2u00U2q9RztDqRIt6M67xbCjk8XdG1Fg0wph+wPpw8JbUvcAkiTh4wKr2CSMlgjW6PthgY0PIgXLDaOiiMJ+cRB0GHfqYpNuOQdkmi353bacrh0TnNZ4WpmGHr2XGMlxX8t/1cfFMot2FvmfkW/cdaPzKMV5reF0YjWYAphNP8sDrryS+kk9oAt2ksShdG2GLaO0+vqmbAql9PTDOYafzL+KmjTQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smu.edu.sg;
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9) by TY1PPFD994F6709.apcprd01.prod.exchangelabs.com
 (2603:1096:408::355) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 07:27:46 +0000
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595]) by KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595%5]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 07:27:45 +0000
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
Subject: [PATCH] staging: media: atomisp: fix map and vmap leaks in stat buffer allocation
Date: Thu, 16 Apr 2026 15:27:31 +0800
Message-ID: <20260416072731.2489513-1-hhhuang@smu.edu.sg>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0204.apcprd04.prod.outlook.com
 (2603:1096:4:187::16) To KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUXPR01MB7791:EE_|TY1PPFD994F6709:EE_
X-MS-Office365-Filtering-Correlation-Id: 89b7e022-3391-498d-09e0-08de9b89a75b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|786006|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
	GKk+EIPLD5YEiaObRiFIdaEzTEAT8fqaldK7Zs+7ME0Ui6joPidy7JcZNIqZ7SlVXaUV5v9M/0uS9OMc3HK20tNFJTYvYwWcghjSjycVK1SchZ+IA1IBTVr4k8ZjJKlokcKkqnIWLC6IhlqyahN0XtGpQTy6cQBkRYhCoL2o1/O/PWjB51ImZqHL0PtSpDyKHJes1nHxQ8IsVppLVM5gAJm069uRaT0OUZMgnxtP2MtpKLpRg93DfZAlU1PcWcuqIftMXHbNxhRWBWJH5Y+b0Isv7r0Upy8JHVIUgNI+490iHH40qISBcihsIiGLf35seWbVZkfamfgs+L+8WX1CNMu/QKFwD1nKMAUoyUvL+DdADNYm24MY4SV5vzqKBD0u4dP+lgOXyLdFHY56Ub2XG4oTwt8HR76hdx9RcS6U1/7j9FA5qAhZHkP61Y44O705ZXBS104L3LG95uHccxl/l+wjMJCk/fNWEvcKKWNAbKa65tqnIQNDGp7moQYrdI6YII3/+1bwe4nAeHQS0UUi8zzCJ/yjXowSyNOCvM4yCtWmZPGs0a5JFE/cpozL/hDZbjRrDr4UJVKZvRoQ/w1Wrde1wD+FpNAIaNHzYwylwKGsM/y114oSITmPHUekkhRVY3cS7qvvgazRCLyygWPd8amlLVqpJ8fK5UYJq9DTyhFu54g74psDz+N3XV19Juk3jq/jfCGAVf6kqNq5v+RyDbciqlgERscgTVP7L6qSI5s/y4b2Vr8rw/8XjH7qllw1eyt+ddwlzKSNbRsq/kCPKZZXLW0oSAisoOjNHuB1BUk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR01MB7791.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(786006)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ULEKUaPwaPwnHd8+KrUHr21ZeI5uwUshUZJ3n/UKHiavctYqQ+CYyRIoxccG?=
 =?us-ascii?Q?ynBRniWkbsApDFjWux/yBFOjKnfT7XIBXyACxD5U3b1u5/Yauncr2KoIkWE6?=
 =?us-ascii?Q?fEir94hQYjybzmN+gNaVlEasDhzpFE1e61nJRzAfN4U4IlcBVAJ0dJJOAu2I?=
 =?us-ascii?Q?WzCLxGCiSoM4hL+x1POX1nZHtNYmhid/82IiERFN/OdefciYinBXyhYw5MDS?=
 =?us-ascii?Q?N/4B0xFg5pYxeAhMyJY6YowVFLJfWza01YOTmDTGa+v2rgftc8T2M2o9KFXr?=
 =?us-ascii?Q?C7XfS/6jW7YjyUT5LYXbElaEKXAV4fW+9g2cfux3aw1nTY4/x/E5FfZ6RrU6?=
 =?us-ascii?Q?2I1n7ehxHhGaon9jT9DanVjv7H/RTKDgcfpPubS8HXLM1uqAwkHn/4IrjDwP?=
 =?us-ascii?Q?9R9IUpw33Q4OdQf9In51efA6FQ+FW+aCpMeyRZGQR/sDCmZeUwnQ3wbbEMuV?=
 =?us-ascii?Q?Wjf37yj/gNFUvtEHcFM6RnCoPNdhFIz2UIFgtbFt1NY5OwaWJPaetTAjYKi3?=
 =?us-ascii?Q?+Z7ZtMzHJD6rzuwRp5ak2tjF/+B58sfwt5DN3TD57EyNnRC2jE9FyqT0VOxH?=
 =?us-ascii?Q?Th4X0ImGVaDGauABv/Ozt+WHPnWLo4jNw2PvvoN8a0aD6kWIMT9Qk8vA3dIc?=
 =?us-ascii?Q?xeU7J6UwsScbCDa3u4LhtcRGZIBGpjPTa1lCEqqgVcHN7WCo98vetIbbOaoo?=
 =?us-ascii?Q?3n2WsYloB46+ax6z1yS0+NXxGck7F/0+2fFy4ULRJx7i3LO/BG9l94ubKHRi?=
 =?us-ascii?Q?IK3KxH4SUh6XG04qE2GL1K7kWzCZRfuNHolp0kZziIg1cG+xMrDioDpQi611?=
 =?us-ascii?Q?nYlcryRHaDM1FnLOAwOr+TU6uAxGDHQmnc9+WgZ1E0BQOrozqwcKtOEv6AQY?=
 =?us-ascii?Q?gkXH9YSPU4Bgd0fS/8mKVOdW4vZT8R8uvwJUgOKFD67udk1rj7lbaLpBTVP6?=
 =?us-ascii?Q?ULCxcx3aVTARGk8+s6a34fy7qm3tS036PvNrejWWYWoO7Y2a72fiE/7uIMyh?=
 =?us-ascii?Q?ENtJLxZoiVjuMSmx1aQ5TcjTrXBiKn73Z73SCSs746A27Wl1KI1BPcLRiJvL?=
 =?us-ascii?Q?E0LItJ9dVDvZwVrZR63M958vqhRIdnwcIeNzHdRijhMp+T1JJhf6/vdZLnVa?=
 =?us-ascii?Q?39uUD6xD1/R4gEsw70juF44hQFzNQjjqpEUYC9KM2xaix/DMAbbX3OUlfSZv?=
 =?us-ascii?Q?sNlcAkIhZIYZuIl2rNjr8quX6hYl9mPnKq9BamuZeAQIxUg5cg4H7BneyPcU?=
 =?us-ascii?Q?I9pHEJAIxlr6dVff7yOXdS1gqAZfJBD0d5U3gKlzhf/3fmJghkmtbw5QbeJs?=
 =?us-ascii?Q?xB9mYWKGTK2uzEIqF5bZhjiof7xYDvUGH7mRbMjVZBggBEOuvvNEMoLZBUiJ?=
 =?us-ascii?Q?wNry5caS0AP9CeC4tOTJJfsONS/vIAPZc/lfeoxHHFIoJxChHtudTJybT3Tl?=
 =?us-ascii?Q?jIuWOOKdSufiScv507MI7XDc5LWqWnANWkLa6FbUg0QduWocBUe/PGgHi4Ro?=
 =?us-ascii?Q?wgQqyD9V0Di4Wt6M6eKlSDkfC7DCycXGljIESYFHADu4OJJW8z0y3BskvcGS?=
 =?us-ascii?Q?hXY/rFrOvc+5ROJpXjdzcjoraIY8RcqdhQYmcVFzG5kG5tAjnNTtKg5M/NWV?=
 =?us-ascii?Q?hOzOHLpbW0dTp4Wb6ChNDIVmYtPHR/8cw7ppkjVb1k6fLmAS+EET1nAs8cFX?=
 =?us-ascii?Q?N6qOXquYqwY0fx5gnXdj5T6eUxepWHae8gL+A01PPv6TlhZN6zMrVdh8ZCKk?=
 =?us-ascii?Q?crmwGPeY5A=3D=3D?=
X-OriginatorOrg: smu.edu.sg
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b7e022-3391-498d-09e0-08de9b89a75b
X-MS-Exchange-CrossTenant-AuthSource: KUXPR01MB7791.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 07:27:45.5701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c98a79ca-5a9a-4791-a243-f06afd67464d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CHyamzObRJ2bh6SZFOsswBJirXDBgb7kkblIPzqLU4ZhA36JgILlQIABuLl6V7W0YBY0fLZZsVfuJ/qhrbp9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFD994F6709
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[smu.edu.sg,quarantine];
	R_DKIM_ALLOW(-0.20)[smu.edu.sg:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.c.6.3.0.1.0.0.e.4.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	TAGGED_FROM(0.00)[bounces-58853-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hhhuang@smu.edu.sg,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[smu.edu.sg:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CF57F40B06A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Our code analyzer reported memory leaks in
drivers/staging/media/atomisp/pci/atomisp_compat_css20.c.

In atomisp_css_allocate_stat_buffers(), s3a_map is allocated by
ia_css_isp_3a_statistics_map_allocate() and its backing memory is
mapped via hmm_vmap(). When dis_buf allocation fails, the error path
frees s3a_data but does not unmap or free s3a_map. Similarly, when
md_buf allocation fails, neither s3a_map nor dvs_map (and their hmm
vmaps) are freed.

My patch adds the missing hmm_vunmap() and map free calls on both
error paths, matching the cleanup order used in
atomisp_css_free_3a_buffer() and atomisp_css_free_dis_buffer().

Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
---
 .../media/atomisp/pci/atomisp_compat_css20.c   | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a..bfc845468 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1116,8 +1116,12 @@ int atomisp_css_allocate_stat_buffers(struct atomisp_sub_device   *asd,
 					dvs_grid_info);
 		if (!dis_buf->dis_data) {
 			dev_err(isp->dev, "dvs buf allocation failed.\n");
-			if (s3a_buf)
+			if (s3a_buf) {
+				hmm_vunmap(s3a_buf->s3a_data->data_ptr);
+				ia_css_isp_3a_statistics_map_free(s3a_buf->s3a_map);
+				s3a_buf->s3a_map = NULL;
 				ia_css_isp_3a_statistics_free(s3a_buf->s3a_data);
+			}
 			return -EINVAL;
 		}
 
@@ -1131,10 +1135,18 @@ int atomisp_css_allocate_stat_buffers(struct atomisp_sub_device   *asd,
 		md_buf->metadata = ia_css_metadata_allocate(
 				       &asd->stream_env[stream_id].stream_info.metadata_info);
 		if (!md_buf->metadata) {
-			if (s3a_buf)
+			if (s3a_buf) {
+				hmm_vunmap(s3a_buf->s3a_data->data_ptr);
+				ia_css_isp_3a_statistics_map_free(s3a_buf->s3a_map);
+				s3a_buf->s3a_map = NULL;
 				ia_css_isp_3a_statistics_free(s3a_buf->s3a_data);
-			if (dis_buf)
+			}
+			if (dis_buf) {
+				hmm_vunmap(dis_buf->dis_data->data_ptr);
+				ia_css_isp_dvs_statistics_map_free(dis_buf->dvs_map);
+				dis_buf->dvs_map = NULL;
 				ia_css_isp_dvs2_statistics_free(dis_buf->dis_data);
+			}
 			dev_err(isp->dev, "metadata buf allocation failed.\n");
 			return -EINVAL;
 		}
-- 
2.50.1


