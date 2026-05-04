Return-Path: <linux-media+bounces-60321-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N+XFp/r+Gmi3AIAu9opvQ
	(envelope-from <linux-media+bounces-60321-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 20:55:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3B74C2CEE
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 20:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7611302E405
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 18:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB2D3E7171;
	Mon,  4 May 2026 18:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hs2p6eGs"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013067.outbound.protection.outlook.com [40.107.159.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1E13E4C79;
	Mon,  4 May 2026 18:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777920891; cv=fail; b=A3umSPwsPO5AtRwBO+d0odGi+UNEYERxVtTbm3XR+J0NSL7NQB5Btmi2vLWallJNlwoA4FPgmqg8MY80l7yIf6ENS+LkPJcQhFoDbYhZ3f8ddnHNStiWA9BdhKZPXsGLAIFVRYiVQiIT2csZ7BYIR3r7cw42gOsF+8mBQwgdVmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777920891; c=relaxed/simple;
	bh=iPUtgk3di2U03HJuYoV4xUTvVHaYa1D1yx6+qDBy4bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FDeaSReaEZnGgDZuO5jr3446xa8RCojPXjZ/al50tkFt+zhC3J3F5AqeMYPZnrDs2gqzblfBQAg4oG2mfistT6j/sxQk1chopR65zGRza5r/vhVJyw+Slt6cS9Fd27LEHXOf/a3pqKpKkT4Vh6Xh0CglgfWJdoe8nfWldjEpDp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hs2p6eGs; arc=fail smtp.client-ip=40.107.159.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3IpRj4h/+RirdcuYl9I80COywXMfZvlGffICeCwMv8TDfznc7eUJVaEweqGbT27Yoz+n2ilTYHhgxz294zdXKSa2mMUFK7zB2HAsXBzGv55zyPehlVXxbwW8dzmjMezJIiaKRCwLa7sLS5jGqUpSi2M91VDDKxjNyfjx72W/Ate1PuqwXDrDSmT8IZHV/qLvcFYHiV+yTOp7TvKoKIJPEhvWpvly/n4qc8SARHQxHAX1P3CW8VLzmk6Yq9FUb59rz12riUKakE+nC3CX7KpywWZpjBNBTc3u4xsnp2qT9ocPrAYXNWE95V69hPjL6h+nqD5+yLFBk08Zj6oNw4AJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPUtgk3di2U03HJuYoV4xUTvVHaYa1D1yx6+qDBy4bw=;
 b=l7mU7TqMjMfJoaQCEKE2B6Wi8/1GyxzPjkp4aTWPbEsO6XdiQ/3kJTv3YuvmNM5trHaRgub7S/FJ0OfQe51tHm5s9HmlMk59A9+CS1uquBT3R8ZHFVM/FN/9OW/NU53cVwo+6Za0qDwr1YqbU4iPwLjVTfQ63cCnMBPiKqZjNUzsTsV4XCuIie5GAIyXPK693HZfG6nXL1B2gzxlOx5U2p5eRg/u7BH6eMrFoUnzi5yLTcR8nWRKeHGOve4joHyIv8wyfE8ckvD8itq8wg+LGjdLt/SHqgFUXBDBdbg9kxtN3sKf41q+x5gcwkQSklwASttWpJYAK/CXbiVok90OKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPUtgk3di2U03HJuYoV4xUTvVHaYa1D1yx6+qDBy4bw=;
 b=hs2p6eGs7WSmsMq4FDMmTT00h+jKMXBtWv38+ow4e+5Basfohe3rUElwcOW/0KXETmlhFfLyul3Uad6Gms2gNw1/uExOBzeSfBP+WFWYm7XFzcY94mme9VV8i2j6Qysvo5PUFhhptFjlcmFiu3JGUr5oVe+g9vvqVVV+c4iVtluL83y+mBFmQe5vvD7FwJZPXAa6MRSatwKQ7fuxjNR4Rg3Y+PigGzJ8ZOZmpEBK4EVnKX9vHleQrcWFZRYjCjCsS5xHmJax6dNIYOTWkauW9+QteM7iCxJCpLQEmNqKExeUgwnra/IUGrCDGS8fTxkC6B5hv9M/r3y4cqPlAyfaCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AMBPR04MB11809.eurprd04.prod.outlook.com (2603:10a6:20b:6ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 18:54:47 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 18:54:47 +0000
From: Frank Li <Frank.Li@nxp.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	s.hauer@pengutronix.de,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: imx: remove unnecessary out-of-memory error message
Date: Mon,  4 May 2026 14:54:30 -0400
Message-ID: <177792080564.2076697.16843652511911590180.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260503150027.107173-1-shyamsunderreddypadira@gmail.com>
References: <20260503150027.107173-1-shyamsunderreddypadira@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AMBPR04MB11809:EE_
X-MS-Office365-Filtering-Correlation-Id: 9533969e-5230-4164-1f2e-08deaa0e9cc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	HDL0RtO9TZRoqUE8i6kFe7GwrCUEz/4mbFE0TQcz9wCcZLKvVWSnGec73SAeaW2vPjYmaNuQdFBtWetnyZ7J7nuOqPDlClb9t64pUU+BhT7GaveHCYmDdlUkZMoIy0U+AOb2E+EOJSBEbXnS5jxY4KtGn0I3uf//F4jw25wEyLO+/d/+TrMIaT/Rf6S4O8qGEMGYF/vs3aT371KQ3zfcUBeSbANJHPJHs2+ZHYZHz0bpuvW598Wr+jSNuif0JVgwi7QwKL0FjADv7MpXohq3Ocm4VUgT1Glq2+3v1CMXd0lH6jHHd3ofh6MtwJttOf8BJRVl7ifzwNfHdLpDBJx6nyGWXOE/n8dsy1gETCGW5o1vaXV1+zI9VMpl41aNLCtDQeXbNpF+udrp8G0TTsKxp/5nYx/U/9Y0wFFH6gjpitX1Yshnpd6KFN1CVqI9FlK88Xa+O9cjJMhHjp3WEm7eSt2d8CUepz1xqbF7ypIuhq52ULExhPjBnU+r8W6rtWqKF9GNO9bb+ll1qNiNs7U9MSQw5HYnxxLzMWVUqos106T8hIW7yi2xwmX7dASYpLpWfgLl9GqOhkoQVt8IMWUs7nU6vl2rqUs7queD+sbFaLPZ8DEKnaTnIqClG5GrZkWetsOpTR8tFNL5sN6ctuSisBtGGycP4QHMi0SaO35s3R0D/floaQsti+mEeAPnkmMzc928E0WbaCpM79IgFwD7kU1lIVEmq3xPUQbSPtfDJ6lIawVAgmUyWHgo9wXDSwYh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmdrSWluK29mMG0vQis2OUp0YjZCL1Q3dlIzclVIaTNJVjRYRkg0cXN1MUVM?=
 =?utf-8?B?QVF0WWhDczMzU0pYQ1RMaGcyWkJLbUt2c1RWcDFORUQxZUtTcWdtZW9YRExy?=
 =?utf-8?B?dFRzQXk5RDhvdzhQNERRYXhROVpnZHA1NE9WemtFdzdIcFVzeFlGM2k0V09P?=
 =?utf-8?B?dGFRSGFFUU90OHdGZmk1WHZ5aFB1d0taNnk4eHNDL2Z3TmRpaFp1NDJCVGla?=
 =?utf-8?B?ZXU0TXdtU0NhcFlkR2M5a2FML080ZHp5Rm9yTER4RUVSMlBQVVNXeU1QMEJv?=
 =?utf-8?B?V1VDNzk4aGNUdGQwRlpTMDlZSEtoWjU1eFJHMTlJUkxqUkJIYlFUbjRJVWxo?=
 =?utf-8?B?SXVOeGRhWDFNbWU0eTA0ZDJpSTBiTWtmZG5BRzBYZW1WR2Q0eHdsd2gwaWVw?=
 =?utf-8?B?TmRiYUxPdG5oNnRKeUViUVJod2lqMytSUTFJbDlrNzVDb1RUYXI0WHVhQU9Q?=
 =?utf-8?B?OFRUemhRbXVMcXlwTGhxeWJuc2tMckh3OUl5eVEyUWZnZWgxQ2VFdkFWSHNB?=
 =?utf-8?B?VFJtcm5JVFJJOTh1OE5JeTIwTjNJSngzR1lsdmN6ZnUwTEM5Vjg1cnF3RXlH?=
 =?utf-8?B?LzFyQ0F4MldmUUY5ZjlFYjQwZ21FNW1aWXV5OExCaGd2bFg1QXRVNDhNY2Vo?=
 =?utf-8?B?MFFVV0hxcytGcmNqZjNkSkFpMU9ONHFVNXRoTm9UUXg1S25VU2RDR2NXdWZ4?=
 =?utf-8?B?dnBXMnBqU2UwUnZiR3RpMGhwWjNqNEEzSFE4YjJ2YkNJd1d1TnMxYmJlYi9J?=
 =?utf-8?B?cC9FRE16a2l6blZJbG1ReFNXQ0l4ekhVZHVJV1VqVjZOUDl1TFRzTHhuUmhS?=
 =?utf-8?B?Zm8wdmF0R2dyMmNCNzZuenpIcmYycnR5RHlnVTl4cGtzOEVGK2lwZGR6TlRX?=
 =?utf-8?B?Z1VvRnRXNW9EekJVNW5FZElweUZ1cmhMeXd3MUxhekFMWjlrL3hiazZtR3lU?=
 =?utf-8?B?SHBzaVVoeStQYnRhME9BeERWZ25xWFQ2UkRXMnljYks4Z3VCZm1Id2c4bkZq?=
 =?utf-8?B?OXZFWkZWclNGM3lSSnhpVXJlT1drZm5RVUlLTjRrclpuSHhzNDdHRUhvbUtq?=
 =?utf-8?B?YUZVNWpJOHZZRWVaVkZ2QjlkTzd3NTFzcERGejQzaHAwanMrelhxcEE1VjRL?=
 =?utf-8?B?NG1RdnNuY3BtT1dmMm9DczZGTGMvRElGa2g1RTJvV3RIV1F1Zk84U0dJYzN3?=
 =?utf-8?B?NGJUT1kwb1B3WVc3WW14eUZuUWtISEFUQ0NCYVlBVW5id3NET1RuTElSU1FH?=
 =?utf-8?B?NVFDVEQrU2lBS0VzL2hEeEFySEFkSnpPT0kvUk1obkhWbmk2OGIwdVEwS0N1?=
 =?utf-8?B?UFA0Q0E4VlFoZkJzaXYyVkNVUDBpaDBaVGttN3Bqb09yS0hRQW8xUXpIc096?=
 =?utf-8?B?N2dqR2FnQTRkdUc3Q0FQbTZHWWdISXF1NFR5dVFoamx4Z3JEVXNsbi9nWVcr?=
 =?utf-8?B?RUNJbjJNQjRkUVE0RWRKL3ZiRG96ZCtZcTMyZHY5R3JXT3Q3T1B0VTFMNFQw?=
 =?utf-8?B?QzU1eFFsRjF1QzAvRDViOUpmZXQybThaMDFibWFYUkFsQ3ljR3hxbWdJUFV5?=
 =?utf-8?B?SE5DTGlyazJxWWhGaDJvVlRZc2pnTncxRjhyMWZZNVNRdHIxTHVQVlNUY1c4?=
 =?utf-8?B?RUNzL1ZSYjNZSVhLbE5NdVc1NW8rdGl3MmZRdUcxdC9DdVcwRURjNy8rZ25F?=
 =?utf-8?B?NmRDUDB3SmcxMlFueVdMalhFU0o0ZDNmS0g4cW9hM0llMFNHVUNKK1FnQk5V?=
 =?utf-8?B?YUx4a01VeXl3V2lRR3N5bWVPSlhucEUwSzg4QUJZMnNGZ215di9udVAvU3dm?=
 =?utf-8?B?bE5mV1M3bVRKTytLdDRDVTFXd1RyREs1SGxqbGZUM1RVYXhSWmJaYlA0ekRl?=
 =?utf-8?B?M0JNckpGUjJ2dHhLWEhYRURUdXlQMHlpakxHY1lCcmI3bHNhaXRjMlAwU0sy?=
 =?utf-8?B?ZThwUXk0WGZtVGl6cHNBL1cyWlFOL3BqdHprZENqZGVibkVUTzhRa1c1Y3dn?=
 =?utf-8?B?UU1LRXF3dm9JSUQ3SUhhRDRiam5oNUJrd1I0ZHRyd1g5NVFRemZLbUFwOUNi?=
 =?utf-8?B?QXl6N1h1Q295b09IS0NUK2VWOUx5SWZjVU50RENacHpFcER0ZWU4WG9NNWx5?=
 =?utf-8?B?OEZ3S1MwVkttUG44NG9MOVNxYlNMMnA4anRPd3MySytQKy9JcGFuMHhqV2dD?=
 =?utf-8?B?WDF5REJKVUFhSVdsSGVoV3N5Ykt3ZU5GN2xlNlpIK3QyNko0Q1lDa2dnRXhu?=
 =?utf-8?B?aTExcHE1T3lhK1g4S3pSSVF4RU1PRDJDSUVGeXhnS1g0WUdrbUI2dGtwL0U0?=
 =?utf-8?Q?lB1Y9J7lsiaP6i280B?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9533969e-5230-4164-1f2e-08deaa0e9cc9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 18:54:47.3122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUlh0lOZqJjGXEbPphcVKWuxG+dR3P2i+Rc3kgyRX22xyKEIjJhlQW5sf6LAGqn0fijnM9l/NYm6TfRulkxrxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11809
X-Rspamd-Queue-Id: CD3B74C2CEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60321-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,pengutronix.de,kernel.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]


On Sun, 03 May 2026 20:30:26 +0530, Shyam Sunder Reddy Padira wrote:
> Remove dev_err() call after dma_alloc_coherent() failure.
>
> checkpatch.pl reports this as an unnecessary out-of-memory
> message because failure is already conveyed by returning
> -ENOMEM, and the current message does not provide additional
> useful debugging information.
>
> [...]

Applied, thanks! switch stageing and media tags in subject to keep
consistent.

[1/1] staging: media: imx: remove unnecessary out-of-memory error message

Best regards,
--
Frank Li <Frank.Li@nxp.com>

