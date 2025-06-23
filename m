Return-Path: <linux-media+bounces-35559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA606AE3314
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 02:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 111BD3AE077
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 00:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83D4487A5;
	Mon, 23 Jun 2025 00:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="QTq+jN+N"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021109.outbound.protection.outlook.com [40.107.42.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1041DFF0;
	Mon, 23 Jun 2025 00:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750638136; cv=fail; b=J5YzXEIrOMy2PIkW1xwWYF38q6uaDLpuvuIKmQ9W6APf5XhoanhBYLpX0P6BrYn/WPzj51r8uHJBQCzcke3bW4TDAH6/ELr1c83Bu03uEZ4dLcSAZglRU5/duzSbB/tVg4XScsh/A+lynzHMfHOLmAevX9YA8TPJvX9JEbCnmtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750638136; c=relaxed/simple;
	bh=Lzqg7uZUNn+Qj2S3SM+e+g8uFlbp+1nKYoAHHoGhKVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CEPnhDpjuL0yNCBfjhWsL8/pGfFskrW2iQ4EHOKgIF63gzNNDDLLTTNl+tRM3RT3fz5F+1kaS0K4UO56gMoDkgYlsyB9ix5J79C7N8+eMIie1rEl6iWU+RXpS4cGgaW9Ct1gUXgU2tp94ARlhRuMUY/6M5bNLsXSqtz4zPECEK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=QTq+jN+N; arc=fail smtp.client-ip=40.107.42.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmdQqaq7FF5vdqP242wc6/U8Ja4y8gnuqlRvEGkhV1xRpEmgixp2tTnd+UMlBXJ4PwjNxppVQlIfFhvZen6emn1CcDukXRsrB0zbUJhk2seexXgalNzrWsOlypJX61UC7cJ9HbCAG2MB7zoLFHjB83YW1WV1/jrvqlie/16/OsZ+h3nH4fQ/zn9bIWMJ/IBZKJIc27UZcQYG3toop9Pq74Q/nXEoDrghwNtjcZIQJfQpIkPBhEd3LX6pvwbP/5IyiSPRbqWqhvGSId808ec3mLDjM+nbXMB9Z1qjxiGykh+3zp3awzu5HBzc+igiDvwL9dOF/fmWR1WR5XPPDFeDyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3Z+0J66cPBTME4zBx/bIYYZp+zXltO4ejM03ZUTDCE=;
 b=ceyIaQpWykwc2D9x9QLySczpwVi+j4erW6HXHkHC1RIGjx3UyWkYNMhEgDQfDVAXXiojKFnto6scp+Qy90MRPak9rSOWK05DBqhqXoCmxpY0/spzxEC/Ttwpp75SHenxsCyltrAX2nGP/olDmtT6s/xsLqo8bOYZTRZNp89UWiCSH1oinsT/h/7rVyTsrbStJMGDZqdo/58e1ga4VPNVc+Et465zfad1AhHqxdsdg9Elr6hNWcun3YHt3sQ22IlumCQOBC3ttVmCZMGrLHOzV+vuKCxczhshCDwyiINlJHmzFQgKI9ydC9trI5rLwRvOxEfYPqh1XDXUl9VJoq/y2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3Z+0J66cPBTME4zBx/bIYYZp+zXltO4ejM03ZUTDCE=;
 b=QTq+jN+NpWb4gQVzuLTAyV3C2U950S7bEmy1Rr7Eu3e2fVsqwAy0je6/GJGM1dF/0VleiwXfP0EqRT7LcoDSplxIIhaencO2BmSxnZ+BN87gLgl6EorhAAxrTbmFDf6OBO2KqiJQenhMyl1mxA7Ml46WkMahjtTnqGWcZJjBlDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 PUYP216MB3126.KORP216.PROD.OUTLOOK.COM (2603:1096:301:152::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.29; Mon, 23 Jun 2025 00:22:06 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 00:22:05 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v3 3/4] media: chips-media: wave5: Add WARN_ON to check if dec_output_info is NULL
Date: Mon, 23 Jun 2025 09:21:52 +0900
Message-Id: <20250623002153.51-4-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
References: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0150.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::16) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|PUYP216MB3126:EE_
X-MS-Office365-Filtering-Correlation-Id: 02300a51-8800-433e-0b29-08ddb1ebfba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5bV4xeD7vYomx+vQg/vZMaDzB+qUfvHmNSn9CjzdCJ8MZDW/PORQFoEz78mt?=
 =?us-ascii?Q?eK9vjIq+XmPZ0MYJVO2AL0N3K9b2zq1cJ1+IYOphTU4yFD2jOYqXDU3V/NX4?=
 =?us-ascii?Q?JVOVfhPnhGt35RxRVayTba7cXL+clj2aPE5Ax900N+xXDYZfOUwNEVqMQkiC?=
 =?us-ascii?Q?3Jo4duBys4G1amLmg1hI8L0ymEFA+boaUFRtVA/OFgECbHJGUXo9zx+xzzA8?=
 =?us-ascii?Q?tcpQkUO9oAP3+/EpPvZ+JjIS+i9OPtHng9T4POaQRGpJZ3udpctjho4Z6uRH?=
 =?us-ascii?Q?d2n9W8HOxfJSUAAxXTpHShskBOeAD4bKSAyb4h9lnOH5IoPO3BxKvl9uvsr5?=
 =?us-ascii?Q?czZWjT0NFaMOBwcPuOqJ0p2EAlNk1bWxKfybtSdbQqGfCbPM/jY+rIWsNirO?=
 =?us-ascii?Q?eQ30IfqnZ251v8/c3OvUSf1mNUE5cGP0jm+fcsQ9y/OjHPXc2Nh5BbH3rUyl?=
 =?us-ascii?Q?mc3Sv7/nnsCQ8zJB/KGpA3TM3aa/Lrz5oZjHjfwxzIQDaAzEBMyR6NnpiRmN?=
 =?us-ascii?Q?RAGwIFKVvjp6rtLQXUA3e7ir+rNTA7hj/EdjvkX1MAeGt9MQQ3VgXhEqKRxk?=
 =?us-ascii?Q?mAorpQK77ToXcLakhdeKyKSCokwqiwKhs19tix4875C6uj0nyuc7jQUxxU9z?=
 =?us-ascii?Q?x4t2Djt06XWmgBpQz9drCyMxwbVFCY0RRXzw2xjPGECx05I0ynwOlc+tTiEs?=
 =?us-ascii?Q?KhBjrgnSmxuLeFmOgwRqAZQEq+ZAUc472luJVzy5yS6NQTVfLuUjvdAU7Tg8?=
 =?us-ascii?Q?fhhuG1imHUz35kCVg0TsU+3BYpIe7EILsUykPYDAA9cvF/5QrW+l7dzM1xCC?=
 =?us-ascii?Q?ZUngU1Hf5ZiJlH6Ax+kHtHxdUsAbrtAIWeIIQtT4D2gN8fsOwBZnuXhQdhmL?=
 =?us-ascii?Q?oaGHhvI20LnqEcszpkTU8ukyNFBCNRUmybP/Rl4DaEY0AUy9zql0wWquPClg?=
 =?us-ascii?Q?x8gVCi5yOB9XoMvieEiJpqDYyFVt0LvJl08UZbCk/xO3GfVeTQNzNdwtUAAT?=
 =?us-ascii?Q?VmO5P9YIzIFNL1JtmZ+lcaN1nmiFVP9pgMUywR25FhyrvkCD8kb2Su5Wux32?=
 =?us-ascii?Q?ztFABEEHZ+EQkSih8sohwsYNpZyZAd/d96lc5pk6yi3oBBf1G9RwYjv7moz6?=
 =?us-ascii?Q?0zWhZRTgH5jO47rGTZNJoQvYNhJarvLpsZHbCjxb3e1h6NWj1GQCzaLPxgAk?=
 =?us-ascii?Q?cCykMGHJq2jq9DEVp2Ho7PCAPGDUG3i5DS4j++CoD39ZMvgvrl6YNoYuHeoy?=
 =?us-ascii?Q?EFYpqna64m2HTkgQVApclDbZxtWWE4Kv0H5Tn4iR/WbmgohtR4TgQKEqXRkg?=
 =?us-ascii?Q?5mgwhY+aGJrkf+A161pMr407jtFawwyR6WtMf5hVZJGJfQAzb0jHpmxyud/E?=
 =?us-ascii?Q?oAAsljpEYSsaJutz3ACkx6gnYpiaevRWXiIs2y7fLx+QD6thOaTI9OoTvo2a?=
 =?us-ascii?Q?kDwtX27NgdQK7q/aah2iSjde6QrPVWl5KywYW8Whff16QfD+Lwujug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VDWPywww+DaC3lY9l0em5+CTz0PzKy20MOiPhhze3tOjuvwRIf/k98ywjkBK?=
 =?us-ascii?Q?L7ewhE7+TCrmpgfda3IyIj9PekGhQas3FHB6h/JmOo1ljvchUTm+iCQmGUfL?=
 =?us-ascii?Q?BiSiU3lhBMyKU7DbVVzGRo9Vo2qPo9d4R7k7h/YbBWvIOyIuiHuIk0OVNKW3?=
 =?us-ascii?Q?HqJI0e3sE19+rC6tRMxfs8r2TZQ/oHGtn07jWI7OZ19nrEvcc+u2B+ys3N8P?=
 =?us-ascii?Q?eA9sSFJbOiMcmBYBE78C4qXug+zk3cEogj3yCqAVB2RF4ry5up2Wq6KrlHw0?=
 =?us-ascii?Q?2GoTzCL6JF5ur0UHZ6rTEkAzpb+kgGQwtifdYNJli1WYtwXmPYvAnu0ZsoiJ?=
 =?us-ascii?Q?XHQKegmo8F8jam58r8Z09MJvvMJs3wjlGbPcSw5ZpOkCGLeI8HIp2yVOG5NZ?=
 =?us-ascii?Q?iQCYbhMQDfkLKnyXY0LhU1F3tACgGK5ytF99gOQTxAEjelwD+6mlQSEAnHxR?=
 =?us-ascii?Q?S7cQnw03ixv1ne5IpT7oYYOVqWmzBf3jBW95bMow1PFGHnkdkbx2C/kW00FB?=
 =?us-ascii?Q?S1fmfPnAW8vP1tACTHdl8qHEwBlEB6oxUKk6LuQSFp4/scS8HUtwRmnADpeL?=
 =?us-ascii?Q?Pd18dVnCHxcRcR7ooa8oJ6XfmuJ+6B6unSA0ShMyDB5kfgsEtLcwLaLkotcZ?=
 =?us-ascii?Q?7YkI2fir41mfWoEyx2NXDGy7cVS4L+I6kT9aU4Bt/aV7kdMOxxKheOQS7vyf?=
 =?us-ascii?Q?s8uiqdTpx/SbN1FV+2bNjr/94ZpHGeNz+u5Z5f+afdk6oX70aHfMSPJiyhwb?=
 =?us-ascii?Q?RH+H+CnN2lpZMxOrHjdOyXXBDAR6m80ouhQzD501s9QqqpKZYnGsDol8SlHm?=
 =?us-ascii?Q?N48nQprV0gra9KeRC0xSpzjnHEl07+yCK0TVrlGiDpw4Wqx0mHGyzku55JYz?=
 =?us-ascii?Q?lg6zkcUo8PaaDWIi5yyd0HSM7hlWKdHeoeEvct7758ocn5kbjs1wIdLeyRQk?=
 =?us-ascii?Q?5LN989C0vJRa+Mw+MFR72MOvMKxrzZ6pGeAQ0esdmGU7CJtPi7nng2112UHW?=
 =?us-ascii?Q?bPAVG6YmXbFl98WnVDspHxsXSOyDULWTg76H9Ab5gvviOwBCpG+DdcFRRNkv?=
 =?us-ascii?Q?8zYLv0WO5Cdv2ij7SSreKIgcDGfU62zRUAaavmP5hbLIRxl1xia64T8tS/M8?=
 =?us-ascii?Q?ZqIDf7wKdb/ZvjhF0ZR/wwhQgSoM2t3E34RiykIRkm93vbOERt4/q/4CLIiB?=
 =?us-ascii?Q?pT3maFAcqCIChGmi9g+mFi5hmaSWRn52+7Lzk5aqwzfIYqioaILGhpo5qDTz?=
 =?us-ascii?Q?TQYEhURW9/KDwXNgFFAVx7FW/K5xDO8T4YJyFjCdnGibfb0UL21RAMYrmTC8?=
 =?us-ascii?Q?b6bXBs6DTIIQQFWi/jPx/ZGdzpPQSWqa/sbp/MbJBeWnjlfZwlxNPT+rQsW3?=
 =?us-ascii?Q?ha8/5ZAdtQwPHFoQRRtBApIElmLSIYWjaX8Z6oKQZXEk0MwUv2XVLvcYmBCk?=
 =?us-ascii?Q?Dels73wwO5as7xGoVWtXdl1o5pbjbAqB9sChhIqZChbhkesKNizfPWY5eVAn?=
 =?us-ascii?Q?czow+W/i74/iFTx1EmDDxfTZJXRh2poi3aL89afUtrrTixL/GmBzkONbSuOh?=
 =?us-ascii?Q?gTHQesPuY4/Yfub9/HItzlsuuF3ycI11J04akRNg+jlT4Okta12bmncvcI5U?=
 =?us-ascii?Q?bA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02300a51-8800-433e-0b29-08ddb1ebfba7
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 00:22:05.9044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcQme8dcf9oan1Bg2wuwfnTEBnlW05etJWTlL7tWAd0wxRgQhCw7DJw79MMFBbYZzGvirA2sVZ6snJGVYA9s65eLV0Fund7V8cKk/5TGM34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB3126

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The dec_output_info could be a null pointer, so WARN_ON around it
was added.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index e94d6ebc9f81..5b10f9f49b9f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -485,7 +485,7 @@ int wave5_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_i
 	struct vpu_device *vpu_dev = inst->dev;
 	struct dec_output_info *disp_info;
 
-	if (!info)
+	if (WARN_ON(!info))
 		return -EINVAL;
 
 	p_dec_info = &inst->codec_info->dec_info;
-- 
2.43.0


