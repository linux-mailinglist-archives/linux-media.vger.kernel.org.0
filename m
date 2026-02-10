Return-Path: <linux-media+bounces-52547-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCQQOG+mi2lOXwAAu9opvQ
	(envelope-from <linux-media+bounces-52547-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 22:43:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A05911F7A0
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 22:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61719305F6F9
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 21:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0187A33858F;
	Tue, 10 Feb 2026 21:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UluWfPtv"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B5633890B;
	Tue, 10 Feb 2026 21:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770759772; cv=fail; b=Jw24B1CnAv9UGscD5ptxzNvcUt+rSav8y6P8uWgxfhObPu4REJyxFQ/n1NBY9W4+ItlEs6Xhya7X/YrK6kYXy59RxO9pzDwjXQAQozwxQUCt9p8pintJLrMzAELGa0LPIS2UQEt5Vj+jRbC07/YjcnKieNmUs9M3EiOZBMEHJdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770759772; c=relaxed/simple;
	bh=EXdNqBhlLe/Lqrx2rdgUF6C6KpjdFbVWonup0MiHgqs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=B3s2HAVy4ufxLb4pUBCEVqIN9qaGBFX5nrdlh1ZK3cuuQjBIfy8MvmevyWwOLRxBfZt2dAiAKwqXWQ//wn2SVGpXA2aqPUhkuV7zACIBp6RgbiplzJavfuqfb8qVRZQLDE2AqG3xWn3RL4NUXwyERvvMDSjiEVECLkPMkvz56zQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UluWfPtv; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOkkK0geK2ONIeOSjFP/6S9jYL7sclu8fKegVvEvFzNjwThM3zOUFzTE1cv/GzQ7OQOjLvcsyA8JYg//7ogBarTtBATLc2AITJbWVddq/S3BXT86nLHlRCYB4sWPPXE3IIU89zpnuDztnNb8W2H4oWot5N+SybR0JHXrX4bKLnFDpg4YFoEfWAqOmnGU8eif0yC8uOvwPzo1pjsp837kSz65eEkd0CgJ6NAE8oQ7+zW+gLeglxyEP0npG1QAIjN9uD4LLVVS2mRLv5NzP7eugUS3wEO4URjeXFef9W51QxwvohZ2Q/NGg5+lJKoaIWJOzaMnJdkKVbCZl7+NAFRvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywofYGLq1VoiIbilkta5oAVp3Q+3XsdevTOhEHtnLYg=;
 b=CwiPqv79854SklZoqlw45eD9aZq+UCurcMzoxeAfL0MKkhC5uou4URf52YoDWJNiW4rpUQda7RSZBUnc/MtZraEAmTI03INu+bk+jMkXAx4GZt+ddkKim3ci6JA+igumJXcoJ+k3cfwd02P1uR4CLc7alMMekBaVsJ7JEHja/bsLVQwk/Cja0QnUug6o822QVwyhOm6ax/TztlaKouBgCKOWk10RWjiwVcSJqs24eC17qafLAtNUo9LT0he4fSKAAkAc5+CH1iphegUncVM08TD7dUgITG+4VFpKSvFKcIAIL/ywQezSvMjLMy+oDkRxZEr3D8B7k87TjMKowJk/7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywofYGLq1VoiIbilkta5oAVp3Q+3XsdevTOhEHtnLYg=;
 b=UluWfPtvLR3CZlPB4oFXg5Bza3/YmkTLGJ1R1+mq38oJvKHwH3BkLM4IHLm8hDX4HTThjcbaqzmEnXA/nFg1mWmGwZTE+5Kg+DlSZQjbUga/NM3bm96JtrFOTMH9/4oaH6/2aRTZCqca2yMH6lEHdYga8TuMySGJ8Su26St8ppoEdGECsL4oYN63vnO+ToRKD19YYqRxgq84jsf4GOz9SBtMyiTf3ye5ngXF12iX97qQp12KwPgijQkpk+wCJ2NANQUNfCdJ5MquRAIxaTuBuT3+IankaqfTEbMFdaGLunUp3+2B+D46L2qKVNpefhwmuM6OGDq5l8hgXdK/9iAlSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV4PR04MB11401.eurprd04.prod.outlook.com (2603:10a6:150:29c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 21:42:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 21:42:44 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 10 Feb 2026 16:42:23 -0500
Subject: [PATCH 3/3] media: cadence: cdns-csi2rx: Use
 v4l2_async_pad_init_and_register_subdev() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-v4l2_init_register-v1-3-8fe43f7d349f@nxp.com>
References: <20260210-v4l2_init_register-v1-0-8fe43f7d349f@nxp.com>
In-Reply-To: <20260210-v4l2_init_register-v1-0-8fe43f7d349f@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770759754; l=1918;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=EXdNqBhlLe/Lqrx2rdgUF6C6KpjdFbVWonup0MiHgqs=;
 b=rlS4k+VTZWWzgzj+PqgQPh85nTATsklQte1M6wxPW3oEX7SlxUr4MGQU1/M95s/6xmrXeSB8f
 emOeSD3g1N9Dfw/AkoVCxW2vMHcm3S1Dn1Ufn9AxIe3cGaT64dZyBW2
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0206.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV4PR04MB11401:EE_
X-MS-Office365-Filtering-Correlation-Id: b89c1217-b68c-4a90-f37f-08de68ed5301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckk1SlEwelE0aUZoV0UxMGZzSEQ0MkdJWmlMME0wRkFQNFVCZjdHdWRZU2FX?=
 =?utf-8?B?MWNySmlNQjBNeDY2WjBaaXpTVm0vTzFyS2k2dk9KUEU3WEVXMk5nbHNWNHlY?=
 =?utf-8?B?S3R1blA3MDB3ZjJtUzZlK2wrei9QMHA5UElzeW92MEJvRW9idkRtWHZhb28r?=
 =?utf-8?B?VE00QjhLUURpY3JRY2hyLzhjazM4V1lsT0lUbUlqVFF0ankyZFJqSjdNRnFp?=
 =?utf-8?B?cUdKR0NQOWh1c1ZMZUFWR0ZkOVY3UDljalR6clQ1dlZPdytJanJmTjJGQ29y?=
 =?utf-8?B?UXl0SkJoRFEvdkpsQ0M1WUxFdzZVN2xQWnVPK0FwaXpHQkt5Q3BMeVRQSUlk?=
 =?utf-8?B?RTZFOEY1emUyMk0rVnFzWU9TUTdYMmF4WTZmQmtrb0E3Ky9aU0pFcG5jUEd4?=
 =?utf-8?B?bWtBT09KRldPdVNaVjg0eThUTEt1dTAwT2xyNHhmRWV3MDFscGZxMTJNK2dz?=
 =?utf-8?B?aUNDMElna3BZRmlSc253dmtzN2Z3UjhzaUNPWFdJMFRtY0tOaDBWYnBHVEtM?=
 =?utf-8?B?bTB3ZjI3eDlEMlByL0NSKzlTMFZScEsySWxiYzBWdDkxWkQxSmxJYlBzWTZO?=
 =?utf-8?B?OFJyV1lWeWU3a1Y4bEwzY0FRSnVLRzRrS2JZYnZVcnpiams2aEFrcDJVL0tt?=
 =?utf-8?B?c015TU5KK1hXSXd0Wi9DZkI2YlE3RE8wWnVuK0RnaUViZ1dXeVBtSFlXcDNZ?=
 =?utf-8?B?N3J2QXhNMEJkeE05ZWNHeVlYMDVZTnJYc0N2dm5VbTZTL2IvdFhXU1pKUTB4?=
 =?utf-8?B?Y0FtR1Q0VTQyTGtEbENyVE9icVNRaEVWdmpKaTJ6dkRwUXBCZ3dXRkJvOTRl?=
 =?utf-8?B?UDhYWTZCTHZyU1ExVzlQY1h0TUsrMEpYdXl6RFYvNkxmUE8ybmFoTGdXTkxC?=
 =?utf-8?B?Z1RVWlVZUmRibVBESFg0UDBlaHVuSXVkN2dXTXBCaFVmR1J5aklxQlVxeGtM?=
 =?utf-8?B?TDQ0Z1drVytvbUVTcThycGlJRnNJSWk2WGxkcGV0WjM4K3k5d0Rkb1ptL2NN?=
 =?utf-8?B?bGJOcUVHRVFaeVZtS1I2VEdqOGhhQ2t0dnZXZUlpMkFDNmMvVWpZbUFrZ1ZH?=
 =?utf-8?B?d2lOQ2Y3cmVCbHF5b2NXQmlBZ2JGNk41SXAzU0JWSTdkVEpEYXcrZWZObERM?=
 =?utf-8?B?eWl1RmhxYXFmU0VhWFJRZU9GakdhaTI3ekpvMlJDM1dOOGNXY25MWEtsYVB1?=
 =?utf-8?B?MXpSVzhPOThZUEY4UmgyTkdoWkNRR2hqQTdWTE1XZnE3Um9ZUGpPL1MwOVk2?=
 =?utf-8?B?M3RtQjNtWU8vN29rQjhyMFVJcEE0OVJqdWJJZlk0empUcUU4M21FMzVxWnhn?=
 =?utf-8?B?R0RGcTFnZWRHZURpNDh5MDQ5Q1ZLcDY5L1NlaklLOG5hNWVuNzVMOXJqbUNm?=
 =?utf-8?B?S3doS1RJdWJGMVlOYmtucDF1b0Y0YW1xSXZaN0FtQ0lzenpxYS94cTQ4cTY5?=
 =?utf-8?B?dmF0T3U4VHBVSGFzZTRRSDA3R3lGY1QvZytkNk05TGV2b2VXbzEwbFpjczVW?=
 =?utf-8?B?TjQ0WWxTR0JZVW11dDNKd2RQdUE1ZVNwUEpMTnNTQmhoaVlZWW1mSENNazhq?=
 =?utf-8?B?WWtTWm5xYnNxc0FLQS9qWGk2V3BSNmhsb1RJZjROVmd0U3F6V0Q1WjlTOXpP?=
 =?utf-8?B?RTZ0dGxGWWFvakx0a3RXM0dveW1hSGZHQVdmWWRnUmpNY0lpM2ZKVkZzVlg2?=
 =?utf-8?B?NzA4LytNdTZXV1BBZ1VoalhGOFBXdy9janVTYStMK085RFJ4TFJoa2k0ZEtI?=
 =?utf-8?B?emUxQWtuWGhCdzJGOHE2YVVBMmpXY2J2N0RxdFkrSXpCUnRoSmFSTVpsV09M?=
 =?utf-8?B?eCtqMk1tS3ZWSkQwTXptZHdLdFZ3ejdmTWZYc3E3ZnM3VGtQMVhEcHRNSVNM?=
 =?utf-8?B?cWVjc0tiQUtOMkJqSXpoQWF4Q3F5ZVRaQm1iVnAwQmdXQjZnZFBlM1JTa1JV?=
 =?utf-8?B?R1F1N0JJOU5QN3IyVkxiTWJaTjNGZlpYQU13ZGdCOVVTM3ZTMTlVSFBtOU9T?=
 =?utf-8?B?UXRWL1ZKd3dQcmtDbzNlM0dmUU5raXdxbjJZc2FCbUZIeGs2NXlIRnRhdmZC?=
 =?utf-8?B?VW9XcUhPOWNtRU1VUWsrT0krb0tlR2N3ZUxDQkoyVVdTWjBSZEQycGV2ODlk?=
 =?utf-8?B?UnFQT0QxN01UaDJQbnA5NDdVcVFTdFhyZCtUNjdIamc5ZzdUU0JxUUQwQVl3?=
 =?utf-8?Q?tAuLRV3vRjBy90yCu5ATCTI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wms3SjZIUWlmRThlNmNDeHROWHRGTEEyd1hCTDJsZ1BBKzg0NDBQRUFGNC9w?=
 =?utf-8?B?RnlpTVVDclhJZUJJT29uSTM1aHlRM0tKSHUyb1VBZWl5Q1RMYVAxcVFDQ1Bx?=
 =?utf-8?B?REw3YWpIL1hlQksydkRLbzkzaWh5TkYreXg2U25KTkY0N3NMMlFjM1BCSDlk?=
 =?utf-8?B?QjdkQU9PSUZkUDh5UU5BdW1QOXBhWlkyUlF6UmNteHJwZ2FaSXFJWW01SmRo?=
 =?utf-8?B?VXN6OFM2RVBMSllEbE82bDJzQ2poQXB6blJjQ2JreDJHeVhkSnNRZWs3L1JE?=
 =?utf-8?B?MWhvV0EzcWdDRlN3VkU4N2JKckphVW0zWXhmbWt3YVhQWW8zWHhDbkVXTWs2?=
 =?utf-8?B?ZlRFYTVSVkdBcnU1YWdXOUptQ2wwcG5QcEd3Tk41M3N1Y2JTc1hjVWZQWlRp?=
 =?utf-8?B?czlKcktWcnFmTmowRkFpWFJOMmRvM09YR0JldjdIRGdDNmhZc2YzcWxtN3dl?=
 =?utf-8?B?SzZWQTNDb3FpRnhVblZBOVJWaHc3VDRhNjdYdmlISE5oR1JibzJkSFYxWUZ4?=
 =?utf-8?B?V1krb0VSVUpIVGVITE05OHEzendwVTMwTGh3SDA0MWVXZnJIWE5VcjdNemg1?=
 =?utf-8?B?QlA4c1lFcDFmR0pKcWVCWTZ5QzdpUHBidHZZQUhJdURjUVFybmsvc0F3bFZm?=
 =?utf-8?B?d3A4SnN0RldCOWZnbGtGcXhMdUlRVys2WjlhcHNUWk4wSDhneWo1eUFieDhH?=
 =?utf-8?B?QUNEZ3lwQWFGOWhMOHkvZG5zS3dCVW1QajNpNmZSOS8wcm1qcTA1VURFbjZp?=
 =?utf-8?B?T1NrNk9QWmdQK2JJb2NDSG5HZG1tdWovOVAvNE9KdUJFR1lVNGZaVXhmZFg2?=
 =?utf-8?B?N21yTkMvdmFGcEFsYWIvSjMwb0VmQVhza2VZNStGSS84M0J6eGtxOXBwQVl5?=
 =?utf-8?B?OFJ6WVJzbHhJaUc3YldjM3RaMTcyYy9XdS9TV1Vkbm41enpHOGpxNkk2c0pq?=
 =?utf-8?B?TFljNTg1WTM3SjdMc1Bqa29yL2J1SDBwMVBZY2pDQnR3ZEtJeFpxYjlKZHpl?=
 =?utf-8?B?UDZNRmhva1IvSW94YTZNUVNLaUl6WDF0Rm9selR1a2FnV29CQXRIVlE1NllJ?=
 =?utf-8?B?RlZIbW5leFUwNzh4MVgvUVRpWHAreEhmQlpJQ090aFNIN0ZsVjRPbHhpakt6?=
 =?utf-8?B?b3pNbDA1WUcrMnZVOXZNSUhNNUxOcmI5ZnZXck90RURSd1M5L0dCc0R2cTNH?=
 =?utf-8?B?dkNvL0FMOENOMVFOeG1JK0dNMm4xL1d4a0tnVndiYjFHRnZlVXd2c2pqWG00?=
 =?utf-8?B?Q1V1TTA4b0xTSkxsYVZVMGVRb2c4M0JIWXZyWmY3d2E3MjRob29YMlcvTjF0?=
 =?utf-8?B?NzkwRGdtK3dNWVRTVUZqZ1FuUUk1MEdBMndBZHFnY1ZDekJyRjNoampyQ3h0?=
 =?utf-8?B?WkRXMmdGT1pUNDZSUm9kS3JERTZYN1IxUVFvVHRUcTlkVUg4bXVwV3ZjYlEw?=
 =?utf-8?B?TUtHYzJHV3VhVmlkdUl6Y1FTVElXa2JySGFUY1JlRmsvVEJrV3JWNmttMGxS?=
 =?utf-8?B?eTdOTUlLaTZDcFVzK1VzcGRjVGp1RzUzWi9ydzlPcFVrdzVDNEl1SFlmK2N0?=
 =?utf-8?B?S2xEVGtjelQ4SXdldlBSTDg3UnZTTS9zd3o0d1pDWWFmK1pqcC9zU3ZyR2kv?=
 =?utf-8?B?dGI5V0t4M1lLQTdnRGNHTE05ZWx3NDRSaUlnaTJ4SmZnVUY2WVowVjJLaENw?=
 =?utf-8?B?VkhmZmpFdXh6Z1VCaFBpVUhKNjBTRUtaWkd3dHFpaU1hUzdOSUh1dmhOY0RJ?=
 =?utf-8?B?WkJPRlEwWFhjREJISWUxTHNXN1g1enY3NSsxUWVCaFlZM3R6b0pLbnY0UXQ4?=
 =?utf-8?B?Kzg4N3hsNzcvZ0Z1NWRqM0UzUHdNYllLUGNLcDNVUDdRMVNOOUVuaDRQYTQx?=
 =?utf-8?B?eVkrak04YkYwdGNGNk1QVE5hRGsydjNCNVJETHpqR25xK0lkNllrYXVtd0pT?=
 =?utf-8?B?NTJUQWhYYlN0S2ExR205QXI5OGpVaGc4aDlMYlJISXg4YzZ4UmZJVWozY3lR?=
 =?utf-8?B?QmN5ZWYyZENDUnVhWVVCbWk3a0xRbzdnR1YzN1FNK2xjTkc3dlNsTEdVYXYv?=
 =?utf-8?B?dHhLNWM0MmpteHgzbjg3Qnp1UCtqYnl0a053Ni9hS2s5ajZTYTNRc29kZjc3?=
 =?utf-8?B?cmw0aXJ3ZmE5cFBjazgySmNFa1RMcjQ3TVBKSDJtV0FVUkpUYms5eWhKNWJo?=
 =?utf-8?B?TU0vRjlkTVU5T3VabXYwOWM1bjdjdzcza2Qza1EyajBDWkNDandtbzFzWEg3?=
 =?utf-8?B?dnl6MlQ3QUJLUGppWmVJUWxyT1RURjFlKzFEZlJibzREZnVmWXViUnJkem4r?=
 =?utf-8?Q?U9XOzBynrvRtGS2O18?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b89c1217-b68c-4a90-f37f-08de68ed5301
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 21:42:44.4014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtz2HrtQphD7snl/FpFLc+1+DU4N/s+JExtAmi7v52u2gLkYzOX9DZNrzidqPGMQSM/lLmetlLtd97sPoDRNTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11401
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_FROM(0.00)[bounces-52547-lists,linux-media=lfdr.de];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+]
X-Rspamd-Queue-Id: 6A05911F7A0
X-Rspamd-Action: no action

Use v4l2_async_pad_init_and_register_subdev() to simplify the code.

No functional changes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
build test only
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 8c19f125da3e50f55a0ae280b05e7918ce115101..1a18a9d0ea602c91c07a4bf4573ec0346edc7650 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -855,11 +855,6 @@ static int csi2rx_probe(struct platform_device *pdev)
 	csi2rx->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	csi2rx->subdev.entity.ops = &csi2rx_media_ops;
 
-	ret = media_entity_pads_init(&csi2rx->subdev.entity, CSI2RX_PAD_MAX,
-				     csi2rx->pads);
-	if (ret)
-		goto err_cleanup;
-
 	csi2rx->error_irq = platform_get_irq_byname_optional(pdev, "error_irq");
 
 	if (csi2rx->error_irq < 0) {
@@ -875,13 +870,11 @@ static int csi2rx_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = v4l2_subdev_init_finalize(&csi2rx->subdev);
-	if (ret)
-		goto err_cleanup;
-
-	ret = v4l2_async_register_subdev(&csi2rx->subdev);
+	ret = v4l2_async_pad_init_and_register_subdev(&csi2rx->subdev,
+						      CSI2RX_PAD_MAX,
+						      csi2rx->pads);
 	if (ret < 0)
-		goto err_free_state;
+		goto err_cleanup;
 
 	dev_info(&pdev->dev,
 		 "Probed CSI2RX with %u/%u lanes, %u streams, %s D-PHY\n",
@@ -891,12 +884,9 @@ static int csi2rx_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_free_state:
-	v4l2_subdev_cleanup(&csi2rx->subdev);
 err_cleanup:
 	v4l2_async_nf_unregister(&csi2rx->notifier);
 	v4l2_async_nf_cleanup(&csi2rx->notifier);
-	media_entity_cleanup(&csi2rx->subdev.entity);
 err_free_priv:
 	kfree(csi2rx);
 	return ret;

-- 
2.43.0


