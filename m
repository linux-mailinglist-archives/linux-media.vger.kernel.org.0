Return-Path: <linux-media+bounces-65685-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sO9NJM/UPWqw6wgAu9opvQ
	(envelope-from <linux-media+bounces-65685-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 03:24:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C4D6C96B8
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 03:24:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=DIzrw8Yo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65685-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65685-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D5AB3098759
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 01:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514AA2FD7C3;
	Fri, 26 Jun 2026 01:22:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020078.outbound.protection.outlook.com [52.101.156.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5542E738B;
	Fri, 26 Jun 2026 01:22:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782436972; cv=fail; b=FY8aQ/MiwCweTXDHlKJ1W7GyFYP6mSYQIjquNQ2Y4QHpY+6GFnqHkLMfLdsD2dy5enuzxfwkuGW6O92chQ1RqxI8UfC/fjfiD9qW15UQzM7LX5+C5ClZYFXRSu5iYtw7ZVvJD2hioDQ4ZYoS8sTWkwq/Lsc2WwwU0NgO6wMRTyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782436972; c=relaxed/simple;
	bh=zcPvfiRcYqz3kJVOhLlXIzomKp15ysn1IshX1c1OZq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hiwdh4GcEAA6j3ZckERkTbwvvlNbr++ZMiI3/guGH2yDdSEcHRmk2nCwX8xRDI/NqZrw9kiQ1QVDa8862UYMPNmjU2OHzsH2ozqxoMsuHBYwTLSowovDZH9aGgU3KhaGOygOOez5kzHXwce0MPYba8Db280RIOvg8Sc0JKSp1Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=DIzrw8Yo; arc=fail smtp.client-ip=52.101.156.78
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jr2PYiR7kc2Y0S4FmFn3Oj/cS4slp13bZ2Dx4XtY5/shrl8VzlXcD3ktjUYo1zfmWBrIf8wZuKtwhSdkWcKnIqj1cX2kDy1Br4YSEMKNW052+WaotCPNsA2sJHN3SsTX/wGjqOVBtRfq4te7Zy+vuLGqMkkuVC6cRmIoTrpdLV6Yz+VgrXOa9AxHjLCj1M3uRml1uDRMalIXvPBFGZI3k34hJo4Qv8iC95vrEVat0POg6TbgMy70UldfswKOsiMBYhUXob0YTyjKV3cfDTcykNjoifNCqm2aP16Fl/TVB8+0PbA3lmGl1tkbqUy5GpHKcybHCkaXbEmm1ypBPpmEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xo6+lmL1NcNGXYM2WZtWU4HhIvAPLCRMTpr/Zolt3xY=;
 b=bOkS7SupFgnIfnIL+MLKj+uYXwdUDXGXCiVGyepKHzgMOdI9Mk3SP5aHuuu1/9n4YuLpKRD4gNKMY+rkvbXQDYs1+6CxxUxm0qqwxr9SsxGLkMPV68EpwKUY3xjFRlRoYi7m7F8ramWdrC3hlY2chlMnvYWJdojb47SjaHl46iOxk0OzwSwvSIyIEBXgMyp+NN/TTw3da0reu6974VqxUN5WM7Ba3X+U9wbjEASrK8ewOh7pf1nbWNeo21sSc9zXOK5gYJ6PFUsBHqvCzRT5j424UBOeEToJEUvEBPU4NG/hUWGvW+FTywwZgWwaCOZ/0wSlGHHUbKx7DbzN8Mla1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xo6+lmL1NcNGXYM2WZtWU4HhIvAPLCRMTpr/Zolt3xY=;
 b=DIzrw8YoY7lc5Oqv36QW4WCc937Hdn5MApYi0NwS2XgzG5sIYTJyewQ8UGhvYloGFyKWSK0LBOwRp/rNM8BkK6y4iBdINAyy62LV1nrlkaHKV1teJ8ny/KFyqP7w3eKqBMWOOzakdgsjnItPw7xyudNKsniOgy0NkK09n7newQU=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SEWP216MB2955.KORP216.PROD.OUTLOOK.COM (2603:1096:101:295::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.17; Fri, 26 Jun 2026 01:22:43 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 01:22:42 +0000
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
	nas.chung@chipsnmedia.com,
	stable@vger.kernel.org
Subject: [PATCH v1 2/7] media: chips-media: wave5: Set inst->std during default format initialization
Date: Fri, 26 Jun 2026 10:22:27 +0900
Message-Id: <20260626012232.111-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626012232.111-1-jackson.lee@chipsnmedia.com>
References: <20260626012232.111-1-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::9) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SEWP216MB2955:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e6a88b8-9768-403d-9284-08ded3216b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|22082099003|18002099003|56012099006|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info:
	jR4/C+/taEJisaEd1itYHmfHXaFDX6DR2jrpcct1RvZt4apQnwB9jBMY4wnG90KywvWXqbqvxSzvx33+pAtOXUrMfcp72E/kukOtzkEsbnJYozc75A0vMPg6Fo78FpHtr3AYXWtXaVDjvniXqpxqZjuWfxTVHP3DPVOJxPjczxXhn+5iJYG7yGpBWtbQmhamn7z5n8/j+Wiuzg0yv4kl8NhoUdTTx1xhzeIHI1cqBYrrujP8xwn4n6zH1mMGzLWUWK3EylAR1sZFkbCxwirk5QVdE4IdPwuQrKLdbj439qEZvAEsFPyuYnkT2AUZiHUYftXCp/h60hUOsh5DioqGCteQTODmy0s8t8shIeC0uYpWaM89vvff0bkDCwzvWtF9L3Eceyi49fSVpMbfNmIkVsf+WeVNNrcHFF3UBgf2SSiezhWJKKthnnmftGhra4tYGvA3dGYyUuRSjvYwxDVecYPry4If227LUC3ujCWIo0mQU5TTgEymK8HTbYk/WzIIuJ396rreWCcq1cvFAikVXYO3EY/Zk9dz6a0P0dRS+tssw7II2fbNoMPoKcvTZefD4ZW6R6vZHlw7nB0NXHg2SolXBMc1nMsFwJIStLEr/6c+zsg7yuSISDQOVF9SQEKOCoZpiTbCEbOIvNBAKHWNrMMBpN7dEInat6sXwgCvcJq1SuYeqiE1qzKCBsE564Q3gh+G1YjRHB6VbO0kQbgZKHRYy2yz4DmoC3YhrXmIDD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(22082099003)(18002099003)(56012099006)(6133799003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWFBUTNzWFdwM2xNV05qbUEvdVJNZlE4di8wT2VMRjhFUHpYeUp4ZUxqemNG?=
 =?utf-8?B?TzkxUVcyWXlMN0hpMWZqa2EzcFJLRUdFcUhmeWdEZGw2cEtqWWFNeStMNlZu?=
 =?utf-8?B?NVN6cU9oSElHY3lMZmxTU2t6M2c5UWhkbFh2SW00bVgvSVR1NDZ3ZmZRUitx?=
 =?utf-8?B?eFp4aW9JQWZqUW95cjNKRHliNmpYRlFSWVVLUWN3QlRqWVlCa1VrTW0wUkxz?=
 =?utf-8?B?L25XSEN2Q1A1QnBoQUxxVWJHeEU2eFlDRFJxN0F5ZE5kMmphTUFiUXA5SGJy?=
 =?utf-8?B?Qi9pQzBqa0RRTUpIcXpqMEx1dkFZK01aRmhkbVppOUdXQUovaW56SVdlVmRm?=
 =?utf-8?B?RWdHZUZkWTVEdHN3L3Y4b1NsbWluem0wOElhdWxpM3FqQnhRK1o3WjhmeDNK?=
 =?utf-8?B?MDR1RkQwbUVPSWUwKy84amdtK0xPWlpRL2lTVXIxV3hHZ1QvQWFaYWhydlZn?=
 =?utf-8?B?c3BpSXBvemdQendwcnlnNkZhZGlyWEJZdVR3OGY4THA2UWt3M2hoU2wrcXg0?=
 =?utf-8?B?d1oycGZVNEg0Umx4R0YvSHp2L2J3RzZEOTNTaVVaOUNlNHN3QlJKaDJldi83?=
 =?utf-8?B?MXZGWlpBSTJiSFNCUUpOYnI3QmNCbDNMSnY5cUU2Um5pR0dhZ2hHNGs4c0hP?=
 =?utf-8?B?WnFWaHYxS05MMVRCR1RNSkRXRERFQ1FxclBwMi9GRDAxYUFiR2ozYnBzbHJl?=
 =?utf-8?B?YWxsYVVNcTZuVUdySjhvUEc5R1JnNm9JOURJZ2pLRHR0L2c4RG11dHFHRndz?=
 =?utf-8?B?akpaU1NmSHZFVDlNWUhwV1g3c1hjNHdpc1g3YXRBcjNLL3l1Z1hvdEtVYzda?=
 =?utf-8?B?ekJ3SDd3NWo4c0pBVGZOVEZkNTJwV3Zycll5Q3gwMTdKN3ozSmNUMjJaWEo0?=
 =?utf-8?B?L0VnYUVyemVpT3QwaStVaE9VNUxMRVdsOEc1NDA3QTFaaTJLRVQ2MzJHV1BY?=
 =?utf-8?B?YXpZZzFBeTRCUzF2Z1lSb3dLRTd0OFU3SThBUjBPYlNKQlcxMGdxdGdYMElT?=
 =?utf-8?B?UFg2QytWVURRZXltbC95U05jb0tiWHFkeTM3L1JEWFBRemhOYnJXWTlSWTVt?=
 =?utf-8?B?ZXNZYkJ1ek0vZW9EaHd5TU5nekROSzlBVExjeXcvZlMyaTVmNWZZVzNGQSsv?=
 =?utf-8?B?NlpqTDRURzErSFk0dkZSZEU1eHZ1ZCtjc01uWG1iOS9JR1FibU1rOHdQQk1C?=
 =?utf-8?B?Z1lKemgva3VzU29BNzlrS0lQa3lsZWtXOEhBbTFBTGxPeEtFMmtQRFJhRDZa?=
 =?utf-8?B?Z2RhUlR5Wkp5U3VTMTJGZ1VPS0tVa1JpQ3IyMGQ3WVU0ZndmUkhqYnlFSWM5?=
 =?utf-8?B?VitUZEpJa0FxRVlpVzMrdGhERU02OGRPZVUyVExNZHVRNWhJVmJvdmtuSlBx?=
 =?utf-8?B?Wi9ZeE1LVllEUDltOWI3bFlFUkljTGlMZC9VTHVqYk0vVGR0dGVaSk1qSGZM?=
 =?utf-8?B?Yms1ZHFaV25hdDVlTFE0ZHdqZ3ZORk1KYkNHeFZEU1I3ZVJQWEpuVndJNmdE?=
 =?utf-8?B?cGFHUUd3THRqNlpzd0twOXF5V25ja1JJRTErb0QvQlpIOHl6cDhuNU5McURq?=
 =?utf-8?B?NE8xeXBSWlFVNTR3TWFvVzZuQ1lrU2dHcDdJNytCdmxhVnRGM09xT0RLcWcy?=
 =?utf-8?B?dnhRTm9UY1FsZWNweWtGWlJmeEd2d29MZ1JzbVdQVHJ0RzFPNlBVb0RLcGxr?=
 =?utf-8?B?eGF2VEpkWUdENUlGR2I3MzlHRTFGT0JYb0VTc1pGYXpFVTh2MElHMVlsSXhh?=
 =?utf-8?B?QmR5WWNrVHFXdmVEdW9UR2lueGFIWmd3cEhBMlhpL0RwNlBTV2p0b1NEUklC?=
 =?utf-8?B?b1JKeTVLbXNlVmlmWUthRzlGVGQ3emlMMXY4dFZheTB6aWNaekVmZjUrLzB2?=
 =?utf-8?B?MnlkQ0hwdEVTQUc0Zmx2QkEzUnVVWjNrK3grZFNocDZ0eXc2alBlZkorOGtN?=
 =?utf-8?B?b25rK1lvQXF2dEdNNXNpN0xscXowRlYzc2o0cTlXVGd3dDQyYjgwYThUVmdB?=
 =?utf-8?B?Vy9RaTZJM2VWNFhNL2ZFTE9jd3lvTkxwUk5rRWFZcmprZUZzUXZZSmlJVUNE?=
 =?utf-8?B?SjdxRExsM1Jnbk0xNjYvaTFmSDVMMEtQV2FSMmx5aWo5aGdKUEYxcW1JbkI2?=
 =?utf-8?B?TTVXUTFuWVF6R2wwNG5vdU1nUVlzdmxvZlJUZFEzT1N6UW41L1dDS1BJWit3?=
 =?utf-8?B?TTJQQU1hZ3U0UkRjRXdzdU9rVGY0bmk0cWJLRndhUTlMdDM4a1M0SnVlbjZJ?=
 =?utf-8?B?dm9YSTlQNGEyNldDdnM2Vy9QaHBBYmg0UkxIVXlkTXMvYnFzVXZRUW0yaWFv?=
 =?utf-8?B?MFN3bzFhZnMwdk9mUUI0Sm1aSjVlY25pWVYrSk0xN0NJOHR2Z0xNZDRzYzZK?=
 =?utf-8?Q?PHZ5sD1FknppIOko=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6a88b8-9768-403d-9284-08ded3216b09
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 01:22:41.7328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvkGnHknQsTMx4v+iQQ6niKmMJ/VEYUM65gmybBWNA6RZDjWYOSo49TnjiwM/5KWKCc4DE/1lFqxNDvgsV8YqGmmn56btbErR26KHahF4Us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2955
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-65685-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil-cisco@xs4all.nl,m:nicolas.dufresne@collabora.com,m:bob.beckett@collabora.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:b-brnich@ti.com,m:hverkuil@xs4all.nl,m:nas.chung@chipsnmedia.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[chipsnmedia.com];
	FORGED_SENDER(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,collabora.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,chipsnmedia.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50C4D6C96B8

From: Jackson Lee <jackson.lee@chipsnmedia.com>

When the encoder is opened, wave5_set_default_format() sets up the
default capture format (e.g. H.264) but does not initialize inst->std.
As a result, inst->std remains zero, which does not match any valid
encoder codec.

If STREAMON is called before the user explicitly calls S_FMT on the
capture queue — as v4l2-compliance does in testBlockingDQBuf — the
codec/product check in wave5_vpu_enc_init_seq() fails with
"Unsupported encoder-codec & product combination" because inst->std
is neither W_HEVC_ENC nor W_AVC_ENC, returning -EOPNOTSUPP.

Fix this by setting inst->std via wave5_to_vpu_std() in
wave5_set_default_format(), so that the codec type is always consistent
with the default capture pixel format from the moment the instance is
opened.

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Cc: stable@vger.kernel.org
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index e6c94b6f2671..f9fcdf4c224b 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1494,7 +1494,8 @@ static const struct vb2_ops wave5_vpu_enc_vb2_ops = {
 	.stop_streaming = wave5_vpu_enc_stop_streaming,
 };
 
-static void wave5_set_default_format(struct v4l2_pix_format_mplane *src_fmt,
+static void wave5_set_default_format(struct vpu_instance *inst,
+				     struct v4l2_pix_format_mplane *src_fmt,
 				     struct v4l2_pix_format_mplane *dst_fmt)
 {
 	src_fmt->pixelformat = enc_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
@@ -1506,6 +1507,7 @@ static void wave5_set_default_format(struct v4l2_pix_format_mplane *src_fmt,
 	wave5_update_pix_fmt(dst_fmt, VPU_FMT_TYPE_CODEC,
 			     W5_DEF_ENC_PIC_WIDTH, W5_DEF_ENC_PIC_HEIGHT,
 			     &enc_frmsize[VPU_FMT_TYPE_CODEC]);
+	inst->std = wave5_to_vpu_std(dst_fmt->pixelformat, inst->type);
 }
 
 static int wave5_vpu_enc_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
@@ -1770,7 +1772,7 @@ static int wave5_vpu_open_enc(struct file *filp)
 	inst->v4l2_fh.ctrl_handler = v4l2_ctrl_hdl;
 	v4l2_ctrl_handler_setup(v4l2_ctrl_hdl);
 
-	wave5_set_default_format(&inst->src_fmt, &inst->dst_fmt);
+	wave5_set_default_format(inst, &inst->src_fmt, &inst->dst_fmt);
 	inst->conf_win.width = inst->dst_fmt.width;
 	inst->conf_win.height = inst->dst_fmt.height;
 	inst->colorspace = V4L2_COLORSPACE_REC709;
-- 
2.43.0


