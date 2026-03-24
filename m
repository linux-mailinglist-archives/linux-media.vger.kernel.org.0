Return-Path: <linux-media+bounces-56800-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKBjIG4bwmlvZgQAu9opvQ
	(envelope-from <linux-media+bounces-56800-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 06:04:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4513021EB
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 06:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 353203084E5E
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 05:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D5A282F33;
	Tue, 24 Mar 2026 05:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="JycKoaOm"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021134.outbound.protection.outlook.com [40.107.42.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5236F12D1F1;
	Tue, 24 Mar 2026 05:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774328653; cv=fail; b=Oj7OfWCFYccsdhxZ9sAFSgp9f5Kf8MXkWLsFhaNJoJhVbXpvoZv2pbztExi9omTffdhxt45f4EW9jN2jfMpCV72QIJ8CQ6yPUnvBUjjBRuw8AxefQ4ZyCPLYAJUDRTJutTDgG3XsRUJ1kV0iTtEqRCjX2YYpobuFtlnnuYjyIFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774328653; c=relaxed/simple;
	bh=5o0cGTXTOt21U/ugxzN3wSL6baKm3sMeOYFP3y5rKeU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=iad3EnhOad1rbE01UvtAnpMWLA+SCqHSpJoGlwDrjEOpX7/X8qSLAmPixEkA6W/NMqGJ8uRoopGqBuLuh2iqXi2onkBnHwxISGpkY5pHKWvGyogcIk+auZ0Tc6hLkLmteayAdpdBfvQN6crkN8shgysPwr/PBFq+1AengyyTev4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=JycKoaOm; arc=fail smtp.client-ip=40.107.42.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBbVwVqBmpSLXXD2cxKX5/uSsTjeTq7LNnW8jzSACF3RlxAElbyKL9e29PEkuaiEQNDyK2vMkSp1cF9xq7bnS5F7kLJUTagL0BdjD9F95XPlICE3LTM+Ih5Owb3pA3q7Yx2GujtOHPgv7UrwRU2hhwpkAC17cv3oj9xCJ5Sb3xXuxu4SvUzRempZOKys1KylOdD7wStcTKis8moqOCYKrdcvg2FrWiQftUHVXxUt9BuHo/LMSDEnbaTRdXr35LG0ZSVmHEQcvHtjDGl5SaexWLpcVN3kSDJpN/TlUIrylR6Nf4jcdxvn19OdRWQkrGUfBPkK/9yYI0JufWCMv6qjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QN9awaDKQeraR3EVtLX+rQnHgDPwZOqRuzhJs8V/C4o=;
 b=ZfkaFOeFC/4CrExfLNkvO2HPxb658bB+XGM4IlLtb2GPClVliQXt4y2wCxOtXz7kETwM3e/JKEM3RoLbQcXpsSRUldbLklHj4Kb8Ev+d4YITc/P/rkeM0OdbLTZchqtMiH1IvcJq4Io/0mXnStFsO1ws9CC7tzYt0ebUN1ouiFrr0TBOGVyrMh9O3iRZ1/2/KmrslC5KxGfiYR9gcWGJD9/RvBuXMjD6OurjqiTfKUnIMT84VYTzMUfauQTnb+IJ8poPxJ67bpg0DmC4HI0UR8eBvBu4hMfsW0v0p7PzSyTrIx9nl6FmjRDVixzLSkFQ3nAw4cYPxJVi0lUGXLMeOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QN9awaDKQeraR3EVtLX+rQnHgDPwZOqRuzhJs8V/C4o=;
 b=JycKoaOm2Aztwy9pSuQlhYaQzgRwjyWdRA1QqrIMzoPROU4th6Qpo7xOxJ6NEoBLAn7prWwpZwf9mBC1WGn+3p3LUC21GQDm/2o+4rCVTCXLxMCEtFKC/gyQV71+lftpp+Z6W8fj2MeSV1xM14pHkreYHtHfURUKsAVQnwctbCk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE5P216MB3232.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fb::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.31; Tue, 24 Mar 2026 05:04:08 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 05:04:08 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com
Subject: [PATCH v1 0/4] Add encoder features
Date: Tue, 24 Mar 2026 14:03:56 +0900
Message-Id: <20260324050400.218-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0003.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::6) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE5P216MB3232:EE_
X-MS-Office365-Filtering-Correlation-Id: fca83398-98c0-4bd4-b47f-08de8962c771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PQwotko+u8mb+a8ZODd2kVoXT2tD6v1ycJp26ZTok/aIAVNljFAU4N6i1zEC0gC4cQB0WuCDuhCcAcNpMLtvTtbylBcFcjzOqwTP19Cb6o11U9dCgpmjd4Ymlnk909BgpIkv71viad292zo1uJ54DIxPKKTDWF9SCKqdvxOb1401gpA0cFbuWR3kalrF6RjGT0K19kNrYYrcsM/b/DfIcI2Up9vqt6J21y+I9V8YrWb+jYqdkYaPR4oWf41X5aZXeNKAJY5aUbtTXyM4nnJp/ISXhD2i6VNMVORIInfv//fskPLJ10U2FFOPh9VujbGeh1kd9L45hxTYu5pru3hYDyODBSFX0N0BobR7/+zYYYFgefXBelfn/e5Q1ps2XahyxUD4MPhxvmc8X39Asbi1Ziu0o/sJecPtX3OJItDP5ArPCTe8bIvOqy6C8WWUUBjH21V58OIH+44LuGfwxyxpicmqSebzVm96BxaR9AXWZbmztfJaNU/2GvO07uVKfLC/4E0v2cg//zyHBxdht7IDzJ4/keP6vow1BFVkrSMwJcuvi0mtSYK232cOP1To1tRkyhEavqtubyljIfWngxSA1nxGf7rxoKYCN/iXk/X3fvYekUS/l/zN9buGMA8FU+D90KQA1d5nX4t6KN90gyBtnTjHVct1MRnWB37/X6IGa9usg3B3mK51D9uOQWjYjhhlmYThl9hh7HQ7774OiLPYsVTqJI4W1ITzT+lrmX0DCcMeS97P/cGA7M7Fy/MQMLJk3lx0wISWCFhddF2jzNxyoE7Uht7GRoszHCnqnWFsTaU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GeAAol1H5pW3flQKwRhamO0AEi7495Xu6uQVGX3cpm16wURXE//+iA892Tz1?=
 =?us-ascii?Q?kLn6qYVLakR3IbO21z36GYvh4gL/4GVVG0FzOaUiIfDyk5v5b1DerA1H/Ffl?=
 =?us-ascii?Q?igllNzp89Pxco4mT/o1XdioRm9oHNgEORyWJxNR6lsO3J1YChy8RBNdiBhlN?=
 =?us-ascii?Q?XhoZp1OcBnrZdfcoxpPdrObWqQE3i/1GwxIcnvOD3LHNWIwsbRKkArXqP/wX?=
 =?us-ascii?Q?+eiaWsK5s82paqH5Tx4PTxixG9AwTGBOeV+dO+m5FskyfzIK6zKRqped1iDU?=
 =?us-ascii?Q?6gPE2/YWrXC5SsMwAuyjSxeIM2s1eKn8W7eXdk79ai8u3fE6m7+ZIieZWNuf?=
 =?us-ascii?Q?KUGDsvs7tB+zJsxgMPiDt7TJ0QmsSagum73dWFkPAJy3pcJYNVbzZls8o33n?=
 =?us-ascii?Q?JBIgfeRP7SWt7kKjKQs5/QpDx6r1fvqTDpQokx7ECa8cW4ftmlrRLTimyY7X?=
 =?us-ascii?Q?PKYsc0iPLROUwwcuINoZ3McGJiVDL+WKhcEr3gVIyZBrB/Q1EPJmN4WqcqUT?=
 =?us-ascii?Q?1Xl5SsB3UOQy5JMKAl478l8iF7Q9DzuyMTNusZjUOzF4nPnLtAY6QqiAWiwm?=
 =?us-ascii?Q?/1icONe8yYE+KTrRYC1wvgo48FRmSHkAlgKYksseeZPNSIvaoa0e588rsgHf?=
 =?us-ascii?Q?GycPGHhE2btzAczkbS2EsdPztCRdL+KRBL2yb8/NQ1pp3B3MszFLk5DSnrjC?=
 =?us-ascii?Q?ij4QBXVdch+VPihIJAlb+TCltUrA/qU+acAvOPPROaXut986tdXMr7qaHTdj?=
 =?us-ascii?Q?wGK1/mFyc7i+LgrTgQ+eYrShtcQl57iomPV1FgKE0foAH6WihoAPuG0UV+/e?=
 =?us-ascii?Q?+5oME/xru69zN1N7eA3Gfg/1kkZK9doWWjxyGjTT1gFGKdeiEH7Y1O2M/qLY?=
 =?us-ascii?Q?lbmyJVyEgSQG37egspiUNx3kATE4eoLM8+mEIR7JnX4wpLmemeuhxdeenqJe?=
 =?us-ascii?Q?JkRWEBs8ZlWwUiTlzy51/RtiMe58Qx7PAl0Xv6rYJOCeDpiGYMsmH622XooG?=
 =?us-ascii?Q?ykE9ZOSo/2O8wbUzd5+sMH4x9NoSwfjXQD+p+yY6htXvVzFoc7Jx2bziyxbu?=
 =?us-ascii?Q?NNniOusRVr1LyKIQ46Sgk+fqQTIA7hNxi8scR5dAqoaD1n5kF3sxxzK8gjHA?=
 =?us-ascii?Q?2Clu8hSg15dCLn4M3G1Xivu1qblDk+Rw6z80Ym32ISpFwaMdaGgiLE07Fz6H?=
 =?us-ascii?Q?BNboCPqlhRkCuYhIwvSt5vtN2P2fxfPMGM2AlOJ5T8gytEpxxj2c9lCEdQ22?=
 =?us-ascii?Q?/2pney6echU9DMJpVhJhc7Zcq0lbZAUtV+lqTnmzKqhKQimH3DBy1mJK0hb8?=
 =?us-ascii?Q?q65mmK6Sw1lZLN3/6GZNCsfunNPvncCX59RyJ3Ht08jhrDnvBUPUzW3wJcmX?=
 =?us-ascii?Q?xC20LDn0KYzzot2SdaySiYuHfU4PF1OJ6q1ZiKa8NCRzuPDuaES6TIryp9Th?=
 =?us-ascii?Q?YHpuehwcMCGXNoA9X0PWNzI2Oz8DwAw529xpAdnvBjjtORnsonBOniKlKIMQ?=
 =?us-ascii?Q?FCXCTbdf8RX8/mvTEJuz4qjmvot8AkAIJiTrA63EeFGjdE16qcLLRs5PkiN5?=
 =?us-ascii?Q?SN2mnCJBrPvsjfQfHPb0yisxHQVbf32InwWDLX23YrYmtuzB9utTJHit1/Ox?=
 =?us-ascii?Q?iXnUw2Qm1NshhEOEzQPZdKT4OxQWo1AbSulDWviH0oOebcO9WxJVger/f6MQ?=
 =?us-ascii?Q?t7HR/r1AVEHxC00l5lNHozlccoBLJANqAt57zXtFuM+nEzNRwS5afb3Y5kti?=
 =?us-ascii?Q?aDPPSrkXOedd7/IFT9sAQO6YVPKLBss=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca83398-98c0-4bd4-b47f-08de8962c771
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 05:04:08.0182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7Zn80Uvusx+rOkeHrFWpRs7UsB8ewVnEEbQ3bhvgjC07Y+1jGnEy2DfzqBWX17Ed8ncaeVugVQlUZrTDOWaUJf2PsIx1y/Q4vJsv6cs1ks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3232
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-56800-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,xs4all.nl,chipsnmedia.com,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DC4513021EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jackson Lee <jackson.lee@chipsnmedia.com>

This series adds several encoder-side enhancements for the Wave5 driver.

The following features are introduced:
- Background detection support via V4L2 controls
- CBP profile support
- Support for packed YUV422 formats

Background detection allows the encoder to differentiate between
foreground and background regions, potentially improving compression
efficiency depending on the use case.

CBP profile support extends compatibility with additional encoding
profiles.

Support for packed YUV422 formats enables handling of commonly used
input formats such as YUYV and YVYU.

The changes include updates to control definitions, documentation,
and driver implementation.

Tested on Wave5 encoder pipeline with GStreamer.

Change since v0:
* For [PATCH v1 1/4] media: v4l2-controls: Add control
      for background detection
 - Added spaces around '+' in CID macro definition per CI suggestion

* For [PATCH v1 2/4] media: chips-media: wave5: Add support 
      for background detection
 - Split into two patches: API addition and driver implementation

* For [PATCH v1 3/4] media: chips-media: wave5: Support CBP profile
 - Added Fixed tag
 - Added braces to all branches in the else-if/else block

* For [PATCH v1 4/4] media: chips-media: wave5: Add Support
       for Packed YUV422 Formats
 - Added Reviewed-by tag

Jackson Lee (4):
  media: v4l2-controls: Add control for background detection
  media: chips-media: wave5: Add support for background detection
  media: chips-media: wave5: Support CBP profile
  media: chips-media: wave5: Add Support for Packed YUV422 Formats

 .../media/v4l/ext-ctrls-codec.rst             |  6 +++
 .../platform/chips-media/wave5/wave5-helper.h |  2 +-
 .../platform/chips-media/wave5/wave5-hw.c     |  7 ++-
 .../chips-media/wave5/wave5-vpu-enc.c         | 45 ++++++++++++++++++-
 .../platform/chips-media/wave5/wave5-vpuapi.h |  2 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 +
 include/uapi/linux/v4l2-controls.h            |  2 +
 7 files changed, 63 insertions(+), 3 deletions(-)

-- 
2.43.0


