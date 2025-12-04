Return-Path: <linux-media+bounces-48213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3901CA30D3
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 10:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C463630202FC
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 09:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18143334374;
	Thu,  4 Dec 2025 09:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="X2gTYuQo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E28331A41;
	Thu,  4 Dec 2025 09:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764841352; cv=fail; b=HU2RtCg7bzVbqCi4fAIkg9QOjxOIZ8C8DiVBgL61Cu0eY+bR2njehBkremNLM8hhlDpt66d/w8ngN6RudPWuzTjW+cwBb7b7Fa2hXCfQN3w/itu/rLZIce5TNz7FwcZDyB30EnqP0aMnfAmQf23RRB6VNxprQWd4vBZbyeo44IA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764841352; c=relaxed/simple;
	bh=5bGLDBPYwvPdquXTczxCweiM2tmyjCE8mNbK06VZZn4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j4VXvoiSIBZVCqGYVyzmU2fTw5Cg51ySB7DPoAW6tr8WGANVTWuFIkPf5iPdInCwTcw6cnaZW4lhbKD8cMaWXLHZWw13BKxHkuAXWmYtBOWEpuQ0bmTqYTdbpLKxENrQ4YBcgYI8PDle/UiUekb8lu/P5FpY/RQYXcijdR3rO1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=X2gTYuQo; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B47HFSU930165;
	Thu, 4 Dec 2025 09:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=44R9tloCFOtnw8dJ3F4gTiXfLszUNAGZO3utCNrQ0z8=; b=
	X2gTYuQoi5g05cHlI63yd05hxn7Xkn3ytI8zIkRRd/1Tx3KQB3gu63Si56S8ldy6
	ROEeyGtIYr5wpq/jHYZL3ojzSfRdQL43c01RNIQcUQCt/GG0ZEBj+mQBGN2Vy52e
	Ilo6u5XAAWwSg6yWX9daixQ0iRagtvzZMcHQxd0TKXCbM+aTZwGOAz3nVSexkatG
	3bJ+MbZo7cuXNsXe4ulk3Ev+0IDFviSoLYUZDIu2xdqmUgZn3BlXevVeNQHft5sX
	2YX0M8iOLNPMQDJ6RpZU+BGgg5h8lBX3tjIIcqv715Y8MYDokOsr0WvxSGMtcLok
	tZfur472v85Jcv531akxQg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010029.outbound.protection.outlook.com [40.93.198.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt6e6n5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 09:42:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zL1bE7cAxRf4wCEySnADtke4xEjBznUNLAypWZVsyUVYDgV24sXx3v+aSudlj++aDBeMPI4f4Pojsom+zFvYsLc1QvXS4I2rERrAZzA59lScXo4IMpj1MyjJMkBFf2VcCKOBJfbkyC0BmO1Daa9RcqI0DRuYUu1eSvVyr21ZFFVlvTmQFa51ZAF12ytYtWHVtGcrfDeAZSn9I3DOW7fR74q7V6SHOclExyORYxhYCC83uCQJOiSUfVfBv/vgQNP8PlQUIN+3v7O4SSOnv78hzYa/24ed1aLkj+nG3BThfJVOMkZban0MON9keu4fgefx6UZHIcfgTllF0Wv4jUHlkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44R9tloCFOtnw8dJ3F4gTiXfLszUNAGZO3utCNrQ0z8=;
 b=o99cgCvB6EUsWJ2EkbGYJm0mpl5DEmyBaNMJwmNZ2V+Ed1aAftTaenbucYlSGmk52qfBL4z2w2c5ObXrHq7vB7FZa32F2jGniBjoSySB650NbEFUOzuwP0gFyb/e09eOJL2u2VMeRdHpdjSCkBbBTkMjAEjld6TJZxPaq43oCjlL8R4HUZvuJ6Cn6l3UVe9P7PomL5bfdGXUO5/r0M3rZpnikqHQY2oUkTnqMk4gFmPQMUBwmYoSiOq+igZ9U6HUnuXZfsA8LUEP6d+psIC3+YYAOM+VUbA7VOJiw0CzpqTYCshwAAHdn1xNPYnV9+agdO4OPmAberTyFbUqN03NMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) by
 BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Thu, 4 Dec 2025 09:42:11 +0000
Received: from DM4PR11MB6550.namprd11.prod.outlook.com
 ([fe80::9185:ad7f:4c65:a41e]) by DM4PR11MB6550.namprd11.prod.outlook.com
 ([fe80::9185:ad7f:4c65:a41e%3]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 09:42:11 +0000
From: Xulin Sun <xulin.sun@windriver.com>
To: nas.chung@chipsnmedia.com, jackson.lee@chipsnmedia.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        nicolas.dufresne@collabora.com, hverkuil@kernel.org,
        dafna.hirschfeld@collabora.com, xulin.sun@windriver.com
Subject: [PATCH v2 1/3] media: wave5: Fix PM runtime usage count underflow
Date: Thu,  4 Dec 2025 17:41:51 +0800
Message-Id: <20251204094153.1530331-2-xulin.sun@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251204094153.1530331-1-xulin.sun@windriver.com>
References: <20251204094153.1530331-1-xulin.sun@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KUZPR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:34::15) To DM4PR11MB6550.namprd11.prod.outlook.com
 (2603:10b6:8:b4::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6550:EE_|BL3PR11MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: ccbeaa09-3441-428c-3576-08de33196601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vuu8bAQjA+D5c0YBP+ZYzPcWibYEu9LHtAxt7sOuAkRJiJ2aOPYIrdoOMiIf?=
 =?us-ascii?Q?dFYkcdf8AEw2TEI3iHeVapoC414p78mWSeEnA0fi3zpDS3Cy/GUZE+Sh9ydG?=
 =?us-ascii?Q?gbsnWtGsdisLrpAib6luyMV4FrzL2ALAvv5Q+qdfR2ObCyuR+givfWnjqLep?=
 =?us-ascii?Q?vmMZc2Zn7PAuPM29N0x4DTRwvbN2Cf2g8dzfLKxIi7YMqXaIp/oMuZ58gTCE?=
 =?us-ascii?Q?XmlwnM3Mdt1+IL4B+acRPXjmtQByIAA/fMubNgziO5Evk29zcRLFkbk/D2V5?=
 =?us-ascii?Q?N2jpySNdzFbteo6JmA2Ack6pVRgQZJbnjlSibFDw8BefI7OcZejXd36jg1T7?=
 =?us-ascii?Q?zMHxNsovFCQqfPgc+1x+u9ee+o3ejDlzgL5Ld/AwYlre49hkiHNRXmTyCDB6?=
 =?us-ascii?Q?hea9zRyLIKgoYYRtwlZ9aefUha+lePl0Z7x4irtrQVP5ltZZJcrn10qjv0B3?=
 =?us-ascii?Q?5/6ivWDm6NrcukOa8ChDcliitLQC+NTSqP1oPO6/DJ02EbITjmThUQDf/oeE?=
 =?us-ascii?Q?3z0bshZ0S6c7ifRnxoLFDiHNA6CckdP4FtbKCCGyeG/ZPLAPG7YDXCVvpNMp?=
 =?us-ascii?Q?K0cWTNtytOVjr/kNZRflYZs3k9BsmZnnP9PXaXZj7VCybm/uTp6h23/IpFLe?=
 =?us-ascii?Q?Dj/OaiKYzCeAg01N1biElrTv2Jkeb9ymKcbU6CMsssXwpiKhqd3Y8DVbZM/Z?=
 =?us-ascii?Q?Wz4ItJ8QsVMNTY6dhYQEM7/FhCBILcH/nj+X5TUowIHijq0ROTwFaaTjK/lb?=
 =?us-ascii?Q?sWXU1EKvyOOtKQCOPjVGxsO1n5ttNbppYDcfI+YrRKzXMA583qthI9amWXUF?=
 =?us-ascii?Q?nXvGNgLoQVYXgOskQcy1Shs8kFDmAARN8ujAWB5lC+rnDWNfCTRha76VQewS?=
 =?us-ascii?Q?PybpnmSJ4Gq+1pbWDljnQio2LDoeYkm4p8JM4AK0KhQjueLBbqGnyViEF5Ao?=
 =?us-ascii?Q?a9POxzAbxir8K6zVwrNjQHYofczjVAociNjtKBUDWKnwsFO3O3oq6GG6OM9u?=
 =?us-ascii?Q?MglaIMls++d8ttzjKkP/kLlXNUnl9zCqvD88qcsknwtihZogCrPEeoNCgeGc?=
 =?us-ascii?Q?WFgwVW+V9wkx6BBta1mOyVqCujDzc3tmKLaI13zXyRcWqlHf1mPFRbKx5SfW?=
 =?us-ascii?Q?f5fU4pRWW+VAnbFlb4D13RT3snpPtn948LVoGq0bLQ3RxyUrNbtVQ5I4+DQG?=
 =?us-ascii?Q?S1xapoRx9GUaXNDgkwFMVwuUKCgrExLm5hr3ob+w3M2xYYiTHL7fBdkqPSiq?=
 =?us-ascii?Q?5A2UUuiGp3vkf598F/hnT+twq6hvXP3PRyerp4JmhYX2JVZ6+MJGGxkaAx2L?=
 =?us-ascii?Q?Xsset5gwOiMbRg5KhTY4RHX9Rf9B3G2OjiowKQVWbEj++ur6nBaobBhC4E/+?=
 =?us-ascii?Q?KgqnQCKZ7eF1Ini8VP7oO3e26MYkEnHTqq/D2JcBIIC0nvJuwKuvtqGpJcHs?=
 =?us-ascii?Q?g3n5Q/xOzTAaIuZLktDVIhe4IJlTI7TzxJ36nvptwWOyAD4ic6twJ0vosg0I?=
 =?us-ascii?Q?+hhuJnwU5EssRrqYHAFQK9TL45va8HbzZneF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tZXsZHx8FoWPsAyTdmt1QexaLnIA26CpNjo0/jZmswVVS7lN1BDEgzZLBJbR?=
 =?us-ascii?Q?U9nImjpumsDTLLTtSWS6zHfgm6jyrQ2XLLZ5DNRXAUidRxjeCLBGo8VWOHxy?=
 =?us-ascii?Q?js4M5K8EJR87AtS2dIG/BhwmHpojnpJxy7GxynQcs8lnWVTdAQLZiN/L1oo5?=
 =?us-ascii?Q?frUG1aXI3ge6dj/H+QHL45xytdlGfi8Yfvqu+ThmS8gRLaqZaR/Pujmrqo5c?=
 =?us-ascii?Q?JNFTkj0U74q9+u1dfJaHsMT+wSaHrOXXKOf6n8yzfU2E85+1CSltXnyNoncg?=
 =?us-ascii?Q?RU8xltxHR/lrEQMGSs6Qae995F469TMWx57MKia8e7gMWOFq8o7i/uQb+fom?=
 =?us-ascii?Q?Y6J5jhJssLIzAbU57+AfPvXXom1al+B/iJUIQzJeXlCJQ50HhHhhwK0xqsgC?=
 =?us-ascii?Q?jGctjBz1emxg1EZCv5nLFjIgwddvbejQc88ZzHRb2IZZlpH9+xDyW46zlajX?=
 =?us-ascii?Q?oyuiXQVfFzi4GB3HaYpoeTJYAablQv/bvLYGRidUwbtokv3heHjtaC/unktp?=
 =?us-ascii?Q?q5fkspIg3Ou8G3EkxeJbtdpmLCO5KrMUvUiE5bMaPmpT08oSWzewWM4SSB3K?=
 =?us-ascii?Q?w5jPEcK8GlG4dJI/IBhTEeg8v07fbdHooIOCsugXBE32ckC68w1i0fK18pYn?=
 =?us-ascii?Q?TznMiDUUsA9KmLLYqGqqnId+ClnTRFyFmK2BXXNmqaBVPZ5GxwNvfHk91vg5?=
 =?us-ascii?Q?uAsSaukDkZR/a7VBu+3CWx/vurpr46xEMDGICqqlKqaD+DgI/QgYSjb/hsul?=
 =?us-ascii?Q?/+mJ9uv2HZjE+cf+iaBPaQrvVyxiwsoifiyuECQDrZn+GHldo0fJOq+PPWQn?=
 =?us-ascii?Q?CplyoiMaavt5k4+H0k6SJCCEascrBqL+cIpgINIlRam7KzejICQB2kaIh9RW?=
 =?us-ascii?Q?8OBJSRYH/1h8xnzkIl6YEhS0uLtb/2J9E1i9+fY+jNXUoH5kP3kLaPZImSgb?=
 =?us-ascii?Q?jNA0ynGeWusWzB6WbZx1Qdc7gm08c/8r+VzkI8BNj5V7/Xc76sFivdCnYqyM?=
 =?us-ascii?Q?KQ98nw3PydeygR5tbxrms7AaIl97uHmeKVTISMLBJ0EoYJW84pVJVHbGhNoe?=
 =?us-ascii?Q?4wk3BgcaIfTuNJHBld5nTCDLrv7+Y4wtqdbBtiLdxih9kLsWGljuqyTEwj3O?=
 =?us-ascii?Q?icZUx1e816q9r/kQwPQeq8BBfzbxfO1RWiNsG8KB6n99FOneIj1HskAUz5/B?=
 =?us-ascii?Q?EL2DW4w3PxY3TD4GQrWUqZEiZX8udQev7M54Pi/AYJ/UuPvBqwQ4yYGl9CrJ?=
 =?us-ascii?Q?sOvoN80b1WHyLawCcTilR1Le9dFYXHQfDaYj7sobe0vxiPVI7mJIEH2hi6OI?=
 =?us-ascii?Q?g+cE8CCzbRewT1QA48f9O4hqnOOp+UfH9kdzUKo+wPRGTDFHaHI4MD2PrfG/?=
 =?us-ascii?Q?cdQpRm6L7Erwl6LF5BiOeavJUA/y3tOfZUHOoh9qwV96a8qLrXFDwG2CccLv?=
 =?us-ascii?Q?c/eKnkRPjU2KHQnYayQmNsHWnGKI2h2if3PTA1xxO2CAPpYPYneZzHvkMTP+?=
 =?us-ascii?Q?G6OMJuNjYyL5PCgMg+vCu5CFe110VIUckcZMox9HmU+rlkjnlOIpLI4LB3yV?=
 =?us-ascii?Q?DVsxCSedxzgVuPXZvrNwOqe7S9GGsbpiVWIRPL//WHasGUEw6FGBqiywGMye?=
 =?us-ascii?Q?ow=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccbeaa09-3441-428c-3576-08de33196601
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 09:42:11.3335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4v4wsPNwigb/PEYPlO0DJy5V8Lmz1q/Otq0Zm5p9Pb1pZ+uUnrfTwI++K1TDYvNhiUAAFS/H0KhYYViulbsLmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6532
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3OCBTYWx0ZWRfX86hzk7/z1h9p
 vRfOTr1Ilco4qNHELzvTSbXl20hIEVkAU7Py+0KXOlv1RMA62XzYZ6b+Wand/UC6L3tB9r6LxZz
 lYX7wgyK5IYS4Q+dz/qGbtsPgU/K4RNkIVPQi58qo2J0/Ou5yPLi7lFo5dDZdQWwtRD8/y9RCWP
 81Nx9VVuppJ5SIVzyo1PZmF804zXmz/Xb9R//Be2lc2O8dUc5tCdS3QpXYKg7BAuFJzRabu6o3u
 YYWWscNdm9dFQYhlei2Syed82GUUsnpBJy4vM3Gu+FNRS3iCOmXYCqOwMfBDrhXbalBJQFGqDXC
 Qvp7IMBfGQ/4sr5ySKtzrNejWUFTTePZV4Kj8HrD+h+HPBkbRQe/nYuApgDBPeM617jkMj0pxFR
 qCXedXxvKYL5iGj6NmRqhtWrYryn/g==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=69315775 cx=c_pps
 a=KMP5/9L46olBb+slh8+hsQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=QX4gbG5DAAAA:8 a=7HQsZtMFZjd_7bt7GncA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: -ItpYf0bp1VmmiG0NeKKXC8GXrgvr2b4
X-Proofpoint-GUID: -ItpYf0bp1VmmiG0NeKKXC8GXrgvr2b4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040078

Replace pm_runtime_put_sync() with pm_runtime_dont_use_autosuspend() in
the remove path to properly pair with pm_runtime_use_autosuspend() from
probe. This allows pm_runtime_disable() to handle reference count cleanup
correctly regardless of current suspend state.

The driver calls pm_runtime_put_sync() unconditionally in remove, but the
device may already be suspended due to autosuspend configured in probe.
When autosuspend has already suspended the device, the usage count is 0,
and pm_runtime_put_sync() decrements it to -1.

This causes the following warning on module unload:

  ------------[ cut here ]------------
  WARNING: CPU: 1 PID: 963 at kernel/kthread.c:1430
    kthread_destroy_worker+0x84/0x98
  ...
  vdec 30210000.video-codec: Runtime PM usage count underflow!

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index e1715d3f43b0..23aa3ab51a0e 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -356,7 +356,7 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 		hrtimer_cancel(&dev->hrtimer);
 	}
 
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	mutex_destroy(&dev->dev_lock);
-- 
2.49.1

