Return-Path: <linux-media+bounces-53642-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC72HXrPoGmTmwQAu9opvQ
	(envelope-from <linux-media+bounces-53642-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 23:55:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5771B0A17
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 23:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA7FD302F411
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 22:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B553451052;
	Thu, 26 Feb 2026 22:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oPN+W0RK"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC7530B50B;
	Thu, 26 Feb 2026 22:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772146550; cv=fail; b=lPV3r9/qHHtxnDvkJTWcHEz+UvnAZO3XEgQAYpaJPdpJ1KiSYSIJelypG5RliUO8aMJrbNBuRtnCl7pSFqCw04a0q6vsb46+3NsUlHyRPz0XqmyUmDYkhFtf0BRq5q1eULxnzjn6WiXtknF9KPP8BjpOmQEp1AwZFW8rzX3Aw/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772146550; c=relaxed/simple;
	bh=h3bgxDx1KYCdhCZqHlGkJAosnkpiZiR22kEzhAanjO8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=mgZXfOdjRbic9sNTUIzw9ZPaMnEpoOpKIlYNXThVe0X+WrPhJuKNN/STQlc2K9d9Nhnm0qIF+lovXVlVh5Hxyi3qcSZAm4b2RlG/A6QvLPJrnpeykDGEPNQYLaG/uzKqLxe79IqP3mW0Cd27oGa6dyIu7//J3Mhqn26lNzbkhCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oPN+W0RK; arc=fail smtp.client-ip=52.101.70.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1DXo7kAhX6kQch9tIrrMBv0SD28niG27zP1wmkYTr2G0J7lHhLfpl8vDQj6xiIxZDQWTJY5wH7koJYi1/ey0gjZwbRFyXqWgO67amLL2a685C4Oggw2kwbYvaoWJGMRu/q5AwvAt4GSI+ZO0VeWF1tu5CwpOtlXSUEYsf8MD2yvu448bnaIbRBe2U3uubDjZAH8QQu58vq9sIz3KK3lwE+tCfwG0EHzd9Tf6ZZnOpH8kqlcmh7emtaEQheMyomxGbDpZPQcdSeBnxHyVKxEe64ztkzFJ+Md5UMqeRXF498cBgt3Aoeba0AhEHRTDG3yosfN3HuvNaSZi5CsdNq2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/Jy9QZ8feGzgR/ndiUI1mIjd84VgVslpU35awyma48=;
 b=tRkIe4NXzy80pjscOhHdku59/SAaDU4+a2ZSBkvcK8wSGLYvyuDnjb1DNh3XXuIfg4SyN6Cnn2AJgULKhtjqS2AHLnL/tdk57WZHnnIF2HFOtbDmggvSsG3srUe03WqaGUvo6LVtjPRLqbWqk8GuVl0403gyUeVXWD9DLhcpKYvmNHzBb+8C1ZWZQjFC37id2eU90qJig9WuzxXZZPWg582zErcmLqWuwV3IhZVCJ85YQlsvSHovLTcOiHKKnVMalsz2Nb+EO5HWnvYspeG0luacg90Dajd9jfi5ycF6CgqVKlgzTt2xjTJaAgAkYGHsoBsBk2ITMC/jPusQejzI9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/Jy9QZ8feGzgR/ndiUI1mIjd84VgVslpU35awyma48=;
 b=oPN+W0RKYR/Nje/qn9P92MROpN9NuiEmMpT9g4LGyPKNMRyOcznASHenCdbRUhwPvClqZbWMt2kCKb5+Q8V6HIbqMTZt0fkdaKBcCwnBYU5qW3zpRZorBACpFqSxcJvWMT+sF7+9ic963Rkv59cvEEaaM4RdqswBYLA5hM/tz5sLo1Yw0T5UydkLizFru8DPt4MJTJyhwAfodZ00vOMy3yRnYanBw15lzkdprzljoNPPRvA8yC2snhlYPYGzzZtwpQ/m8YSZ8ZGX49mBJI9AUndEF/cyzFroNrchdz4MDdpuzxIAuSArBoSFPrBEX+fs/ia75JlqRbUDGKuPeVoH2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB12143.eurprd04.prod.outlook.com (2603:10a6:20b:744::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 22:55:46 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 22:55:46 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 0/3] media: v4l: async: add helper API
 v4l2_async_pad_init_and_register_subdev()
Date: Thu, 26 Feb 2026 17:55:25 -0500
Message-Id: <20260226-v4l2_init_register-v2-0-902d7140f9fa@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF7PoGkC/32NXQrDIBCErxL2uRbdSPrz1HuUEETXZKE1QYOkB
 O9emwP08RtmvtkhUWRKcG92iJQ58Rwq4KkBO5kwkmBXGVBiJ1FJkfULBw68DpFGTitFIalz0jj
 rDSqowyWS5+2QPvvKU63N8XN8ZPVL/+qyElJcPenWX1yrb/4RtuVs5zf0pZQvbP5JCLIAAAA=
X-Change-ID: 20260210-v4l2_init_register-0e6d0adcfa21
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772146544; l=1401;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=h3bgxDx1KYCdhCZqHlGkJAosnkpiZiR22kEzhAanjO8=;
 b=vPgwEoz/Xmk3XWhgpOPX9hQeuCO2TIPZYsvPg8wi5voe/cVXQXhklv1NRnjn0l91m1sbguTWQ
 43777LR2ky6AIxgoSIPY/r7HnNxieRaVMn332v5XzuamSQAO5J+xe0q
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BYAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::38) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB12143:EE_
X-MS-Office365-Filtering-Correlation-Id: 561304fd-a087-4fbd-0da1-08de758a2d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	RXJlL+zTRG44h+tra/Hsg7ZSKcE+A29HrfnViX6YLs7V/aImKjTTt2MmXY49pzmHyKvBi90Xon54k9wtkw14H4KyNAoUMJxo6m6emHjbu9RXUS8rUfW1oG0ULAJQhFoseHSh0qHYz3FKRdvw+GjxWgN3HnIdYe18L+2E6YRh6b17pJcYDcZkJrrlLCTs247jbPzJyvfOHPuJrYDcxwXzBRflaGj06xxjWMz/i0oEidfeBllHjhy9c0ccDlWa8gKFhZu8C+w2s44cmOuFxB393jJ2jtDMpoo67wq6j7/+DpWMdohstcLzznNOulxOyecdhWdUImucZiqTP/Wxj/l24fZuXS31zQiYpAqjn1DS06iI1myvQ4cyM8Wwz2ADXwwnDX9WgI7vh69BGy2a4zHlwM2rc72/psDfp0J9Yg8ZEj6jM7jE9sKZql4NQ7rID8xZYzFSE1CdcH1gGpsp8FgSJwjyUAktpt5NujBY6I+Dqpt+zryVYhCckocRMXlN5QD2w1Q84zQuI/clWPrpgT2Krki1WOaayrFzYhXAyYYrljIuvwzb8UU5pL2EAlsoFMMwphiQaEKZNfH+qGmFT18TqAS14r5hM3g2tPXnJL9Cxf/Fi0v9+6CrGvA83xntva4MRq0OB6uowSnRWRYqH4Qi3wJW0Y8NKbT09I1RINRhB16hsXbsKxPsTMtjFsQAAtSa2ryIO5KAQ2Z2JUBJpevkiSjprx2ngSoCq4lnytbpAVYU4Cy91iTktM1kqnx9y+sD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anVySHU1U0FuYXp4VVE2cUwrNk9XMnQ4T21qK2I4VlZyaG5raUp0Y3Ywd29h?=
 =?utf-8?B?N2ZaOFhDcFV1VmpldlpVeGhkUWtGLzUraEdxK0ttWUFCbTdwZy8veW5LZU1D?=
 =?utf-8?B?ZFp4V25mSHVQNFJIb2tZYmQvUU5CSFNxbkRaM09mbmw3RVNlNlZGSTl2Y05a?=
 =?utf-8?B?cEdxSGZzMkhGa2xXWTF3emJEWUh1RVMrcUFWTzlCWWZOY0dqTENoZWxSTklj?=
 =?utf-8?B?WXdReU83NUhRb2NEemRrQ0hvQUxYRnRZei9nNzdpNU1Rem5XcnY5Qis1UHdo?=
 =?utf-8?B?bk5QQWV3dElBZ2NiV2ZTTnZ1Y1dyUWJ5UlpPM09nYmd1RlRIVlVhWmk0b2Jp?=
 =?utf-8?B?TmFIandNOE1xN0FXZitudjJ4SFZPYlZBUVVGM3pBMENYQUh2d1I1UjlkK0Fp?=
 =?utf-8?B?UVFZdTU2S21wNWxmSnRNcFFKelp4eEt0WFBMelE3R1ByOGlCVjNFVVFwdkNM?=
 =?utf-8?B?RFdJMng2KzBMOUd6eXErVE5OeDl0VDBuZ1RNRlF4U2ZSeHlmN0V6a3lFcjF0?=
 =?utf-8?B?ejNTL09tRlM0ck9DU0JCTCs4STRLUVNrMlAzMXdVSGUyU2hGOUsxYm9ESnhR?=
 =?utf-8?B?aXREOHRwSjlvdCtNak5WM01qM1ZtbmJuRWlGRlR4R0lLYlY3V0pIdCtKbDFl?=
 =?utf-8?B?SjN3MERZeDAya2RaNjh6d09lQ2ZzeG0rM21TOUJ1ZWg0WU9HN2dVdHpBRExn?=
 =?utf-8?B?Wk5ta3hyZURJZXNuZjNESnladitJTFIzeHV1dVpXdnVibjNvdW5ENzFFOWU0?=
 =?utf-8?B?T3piYUFmeHhCZkZlRzZSZnJtajdwMWZNR1ZORytsRExMR0VJNmdLeEpmM3Jj?=
 =?utf-8?B?dmU2WjlydTZNcUtqT1BXODdISUxaQkh0N09iSXo1NjE3d1cyKzF0WnB5V012?=
 =?utf-8?B?cjgreTVGSytvYTNkckFFc05IclIyV3YwYm5iZHg1RDVQL0Zrd0tXYzRSSUpu?=
 =?utf-8?B?Vkd6clIyNVpVcGVobmxqWDhSeEI3U3p6cERaOWFkL0NKY2xjNi83L3d1eEVx?=
 =?utf-8?B?TmNpSk9Ubm9CZENYN0xGcXdHSlJBemZvR3FvcmM5cmxaendLRHdEc1hEUy9E?=
 =?utf-8?B?SnhYZElVYS8wdWgzc0JqdEh1NHQxT0d1ZTg2SUlzcy9UYjhmRTBoc080bnR6?=
 =?utf-8?B?MWZRVk1qUDl1VlluUXZKTUlteC9qVWs1NUd3TmRwV2xnWHF2dHZRb2tIV1l6?=
 =?utf-8?B?WjB1V1ZwaVh0cHFMZHJrak5wUXNyUUNQWllqSWhneU9uU01LbXB3bVByTUdi?=
 =?utf-8?B?NGg2U0ZESndBcit3L25HVkJ4N0FTQWVKUS9aelhvZnZYaXhheVM2TDJKK0VI?=
 =?utf-8?B?dnorZUs0Qjk4c1lOcVIyQkhaT09UUUs0T0FGVkJRRDhtM0M5eVVHckpIc1Y4?=
 =?utf-8?B?czRDcHh5WmhwSTFTYXZXL3ZaVjQ5dkkvQ1IxNjl6QmEraG5jZTdqc0FTQ2JR?=
 =?utf-8?B?M0VKbjZ1VnFKb0pBUXZoeHpqZyt5aFVQTGt0L3AzT0lhTVMyL3Z5SFJDckx0?=
 =?utf-8?B?a2dXRnJxYWFMdlpmQlBIZHlCV0RpeHJKTXczSEVWa2h5MWIrQzNwRUxMUEQ1?=
 =?utf-8?B?MDN6YjVnL2p1RmRjWXpiU3FlQjAzNEMzenNDN2ZWaWJWVmM5aFQ3UElHTVFU?=
 =?utf-8?B?RVU3YzZVUzhWcXpORnB2WFFFZHR0SXRjYjRiUVNEamNqczNqc1BVSktmNWJz?=
 =?utf-8?B?QWo2NDZLZGhCdExObDcyMTNObjV6MHJGWFAxdU5WdkpZWExTb2RXT2J1Rlhm?=
 =?utf-8?B?c2RMYUZQODBTK1dMNEpKeDlvMUJ1U2QwOTRLakhZN0VwbEp3RzVmaVBsUUta?=
 =?utf-8?B?SUpUZEhSSjlnYmpOV0FjckI1cmJFaEZ4TFdMRGxKTTNYS2hpOFBYWjVpWUlH?=
 =?utf-8?B?bmZ0ZC84eDRtS1A0UStMU05EaHN6aWRDNG56RHorTEh1OExodzZlU254ZEQ0?=
 =?utf-8?B?aGYxeS94dkVQSy95THFLQmJ4eFd6M2Q2aVhsdzB6V1BNUFo2Smw2dndITG8r?=
 =?utf-8?B?T3lhL0pNUG5HUmdIbkVHUEtsa01PNmIrTWU4WFZ3eEk3R2RZazFMU1h2OGkw?=
 =?utf-8?B?T3Q3UFZxbXdSUnJBOXNKM0hIdHk3Rm5yTmRINWhGek0vd28xVElpcUQ1V2ZR?=
 =?utf-8?B?OERBZ1l0TWNhdlgwMzFUNmJIZ25YcUpvSUtxM1ROY3ZrY0Nkb2I0TCt4aVF5?=
 =?utf-8?B?U21KbW9UK1ZEby9ySlY4Ulc2MHhHM2hwNUk4UUdLblpJOCt5eGxBVk1SZ0Fl?=
 =?utf-8?B?WVVQTGg5MXNwa1Y4NDY0VkcyWkNaUTVlYmJDeEJiaHN3QUhMYUpJNVB0RHpD?=
 =?utf-8?B?bG9PWE94NmcyU0FJQnkyc1hUY3dSbWcrTFhPc29JYy9Zb1lRS2dtQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 561304fd-a087-4fbd-0da1-08de758a2d89
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 22:55:46.5174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rfFRjQwBpiBe2UM8r39I4lwNZxuIV1YMIDo3GfshsYQOQ6cAACD3jtuCwEkCWU4rYC7FL5uWF7VmtdUPJQqGxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12143
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53642-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EB5771B0A17
X-Rspamd-Action: no action

Add the helper API v4l2_async_pad_init_and_register_subdev(), which
combines media_entity_pads_init(), v4l2_subdev_init_finalize(), and
v4l2_async_register_subdev() into a single call.

Reduce code duplication and simplify error handling in drivers.

Only change dwc and cdns. If agree add API, more driver can be simplified.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- Change API name to media_async_register_subdev()
- pass down __v4l2_async_register_subdev() as argument to extend more
support in future.
- Link to v1: https://lore.kernel.org/r/20260210-v4l2_init_register-v1-0-8fe43f7d349f@nxp.com

---
Frank Li (3):
      media: v4l: async: add helper API media_async_register_subdev()
      media: synopsys: Use media_async_register_subdev() to simplify code
      media: cadence: cdns-csi2rx: Use media_async_register_subdev() to simplify code

 drivers/media/platform/cadence/cdns-csi2rx.c     | 17 +++---------
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 13 +---------
 drivers/media/v4l2-core/v4l2-async.c             | 33 ++++++++++++++++++++++++
 include/media/v4l2-async.h                       | 22 ++++++++++++++++
 4 files changed, 59 insertions(+), 26 deletions(-)
---
base-commit: bc0bfce7d0f8204e0bbadcee72e87ad9ec105c73
change-id: 20260210-v4l2_init_register-0e6d0adcfa21

Best regards,
--
Frank Li <Frank.Li@nxp.com>


