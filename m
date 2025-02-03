Return-Path: <linux-media+bounces-25527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA77CA25379
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 815513A30ED
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 08:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EFA1FA178;
	Mon,  3 Feb 2025 08:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OCNwNC2i"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2044.outbound.protection.outlook.com [40.107.104.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D003594E;
	Mon,  3 Feb 2025 08:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738569746; cv=fail; b=Ah3F9TVx32BxdFdipDK2BK1L4kYqArZa28b2d8rx1D0lrWf5Y5MnSk/MoPbNApfNNWEsytSR1Z2N8DS/T1EIJvoEvEyCD1ho2RaolGERhGGtgPacurY2293K3tCNc/DebpD+UyacVHH00A7gOtunKvmdcIykfwiRPfsKlhiPw84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738569746; c=relaxed/simple;
	bh=qGCAp359g1n0tN2TX39goKAZKA3JxjyDuy8CKtEQhZY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Qcwf1qJzJOl9cg6OAn5Jmnx0GML0xO60OUiOlpqNgChAvEcOX83v1pX84eoZxYEMg/bD+rcsv62526GrCKNS6hq+wkR5Smz8DA5WjzDQ1yLcSJD7GttnoA2hqSQRJm/FhFxLs54gC0aHwtP49ufUhiJ6wfBK3nC21Fc14L40xZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OCNwNC2i; arc=fail smtp.client-ip=40.107.104.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPrBMhzbUFME6IUUUagUIHVfu4llYki6ucOT4xq8HkDmI0gCWCDHxvXMqAOXDr4RfJlAFEAyjcgOHPcGqqz3Me/FP2iVuum5naGa0G8s6lwbkhiZs1nloFr8SpYN6AW+fxvz8OqYjNCYaQv6wJRjy/wIpreRU+5h7S2w0Llmz6aGSxU/4pT5Wsd/h8UUqT99T8cci16+VlSqFOM7Swc3mLHlWvv4ED9w5Vlj+nVmj5TYXfPx9egfKQewR8OWsRUGWbEzu3mAl/qgvURc2p+bamxDWWtdtQRUFstLzt06COVFJ91Bow/x9WP/sYdCugvVA0LyLFWTKd6fTaI50lFaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQP9hBRhuj1s/01wKQzynlXeui/rVw3MDSxW4897yRc=;
 b=qn9uxrjD1bM9ekWBdV9TFsbsja09JlxmG0yObIpVqjBOEi9GExPgzYW8iaTuN0QusY7ebg4sc219YiIwKJGZOMk1nW1nmILCUcnsY26azLufgidP69/Hg8By3xY/grhPpzpnaVLTlFiAtLDTOdgUWS1cZAeSfKFnI6VW27MJGJmGtaPybhyWe5gXqnmcD6VH6Uw5Sy59X9/Jf2CeLpx4Rwt12RnONW1S6bYiawtlXr8X8bCFaNflZ+iPJX1UYU4xsn6lrNvZw906NYr8ptMOi30wiA9FAemXqmGYAsCHuxGQxxxOJgv8KTZnnJWY/eAA5N+nU9kZoq8alhiOm6IpqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQP9hBRhuj1s/01wKQzynlXeui/rVw3MDSxW4897yRc=;
 b=OCNwNC2iysCcextDNcGAGLHf83dJmGIGe892AAAO0FUbJ8nlnkJTcAfbl+M6zc/ZkQ0pX6rxOxJXALkgrnVto3DXp5HHuSEDJPMUaaOYA7BKj6STP3DEV+Rp+iDykdmPsyg28tzwXqsWSdImbJSSJrbTeP0kSFi5xDj56pSMlFKpz5WhOjma46TVEzNVxrvMU8awRQ0PKyTf+rFG2etvMi4hYuxXJ7sAFxajWhlOkw+PMprmbVUAR6p3WI3HAggqO8ITFE7XSOqKITZ0JyPY/GETy0p1wqvug3MRr6kT4xAQB8amO83Fbc3GsbyAhG3jIcc6JQGwn770ERi96yAMfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DUZPR04MB9784.eurprd04.prod.outlook.com (2603:10a6:10:4e0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 08:02:19 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 08:02:17 +0000
Message-ID: <371a6b6f-6018-4b4a-a5b9-318d372768ed@nxp.com>
Date: Mon, 3 Feb 2025 10:02:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH v2 2/4] media: ox05b1s: Add omnivision OX05B1S raw
 sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, robh@kernel.org, krzk+dt@kernel.org,
 bryan.odonoghue@linaro.org, laurentiu.palcu@nxp.com, robert.chiras@nxp.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
 kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
 dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
 alain.volmat@foss.st.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 alexander.stein@ew.tq-group.com, umang.jain@ideasonboard.com,
 zhi.mao@mediatek.com, festevam@denx.de, julien.vuillaumier@nxp.com,
 alice.yuan@nxp.com
References: <20241126155100.1263946-1-mirela.rabulea@nxp.com>
 <20241126155100.1263946-3-mirela.rabulea@nxp.com>
 <20241127092400.GD31095@pendragon.ideasonboard.com>
 <ab1049db-67db-44e1-998e-dfd93444bb5e@nxp.com>
 <20250125002237.GB19927@pendragon.ideasonboard.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250125002237.GB19927@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR01CA0139.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::44) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DUZPR04MB9784:EE_
X-MS-Office365-Filtering-Correlation-Id: f5f0fb05-bcb1-4c77-21cb-08dd4429140d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?WVdFMFI2OXlqOG5VREtXVjFqRHVubFlQK2N1M0d6QmRHZVRZd21jZzNueHNz?=
 =?utf-8?B?cEdZVHJHZDZieGlXM2QwYTJ1QWlsRDhUT3VnWVBiVXg0ZGNWS2srSThvY2lQ?=
 =?utf-8?B?ZGVGY0JRV1lkQ2NHRzl5enA4ck1ZVmxsR3NSOUw2cERRekVtTHhlN2IzYkJC?=
 =?utf-8?B?UlVGdUdZMjJpaTlnaU0xOGFUK21SR2FndnltQWVBMm16bVJpdERsZVlPVXBl?=
 =?utf-8?B?Uzc1SUQ4TVBxVkFkNzZaWjBnMzIreFJsa1NONHNlSzliOWF5MVdCN1liSXlq?=
 =?utf-8?B?d092dnRvcjdINSs5NVBBUlNLcUxUeW55Rmk4RXlRb3hNcW5KSm16NTBEZ0JB?=
 =?utf-8?B?QVVtUUlmUjZwaWsyWkVGVHRFNjFVK1h4dSt2ZjVCcnlzUHJYanYzTFhtcDZW?=
 =?utf-8?B?bFpLZkI2R2tHdE1xSkJzUkFvWXc2dS9KWFVPb3lIajRTYW05d3RNazZSU1No?=
 =?utf-8?B?eEVFc21JbG5PZmY5RWYrZWd2aytmaVpSRGdnN2tDUjdoNEVNdFBFVFgzbVVU?=
 =?utf-8?B?Y0RPbkRvSHM0VlVTaGpBRlpRQVVxUkI2RGx2QVZ6eGVNMFFiR3h6V1AxdE1r?=
 =?utf-8?B?RzU1dFhwaXY2WVYva3hxbDgvU29jaStHT0NUQWVhNjBsOVA5SXdaS0szTkl1?=
 =?utf-8?B?L0htdXBFOTVNRkV0alJEWk42dW5OZzdMSlMzWjlBSUYvNVo3REtOeHN3Yitr?=
 =?utf-8?B?Q28rVTVwRlFpSS8wL2NXS3p2aFBkcGtUOE5SdEZ6ZEtySTdlNVFHSWhZdDY1?=
 =?utf-8?B?UTAweUdrdlB6cFBTdENvc3BlWkEvQjl1YlFmLzZZb1NZV24wbkVESldyc2pV?=
 =?utf-8?B?cFduV2w2MVBqVHdlZXlNUTNjOGU0NjF5cFlMU0hDMDZLWWtVVGVqbDhqOVp4?=
 =?utf-8?B?SHBQM1diZHdMT2NhVzErNHVERzdNNHRDL3pTRmtBK2ZISUlGekJIZmFPVXY4?=
 =?utf-8?B?aE1Rb2YyWjlqdG13dXErN1EyN2hlZExnaFlHMmw1aTcyRkRFVkdieUdOTExu?=
 =?utf-8?B?cUg3ek9mNE5hdVJTYWFqa3dvU1hyZXU1UGhPQkUvL0RXTmljRzN4VnpGWlZH?=
 =?utf-8?B?UFNZTEhuVm4vam53UFd2dEZEei9wa3l1MVBTUU9tcFJoZXM3MnBIOE5oZ25Y?=
 =?utf-8?B?aWFiQ2NWdWpDNXArZnNSaXlJTnVDNWY2SEZRbmd2QzZudytabmtDZlYwREgy?=
 =?utf-8?B?V29jMmtrUHp5U0hvWitMZjhSV3pVcHBNUFU5S1JkMHVHM0xvUXdlb25sandO?=
 =?utf-8?B?Q0lkanZjcUFTT0hrTkZTb0JXNExuR2tmS0lpZGVaeGVRZXZpQ3YzS3FwUGtW?=
 =?utf-8?B?TStRRnJ5RTgwYnJhSXdkUExTRFJiMm83UGttdUZ0Y3lNYnpJMHVDNVJvRmJo?=
 =?utf-8?B?ZUdKR3EvcEhnWjBMY25Rdi9oYVRhYUp6QlVjZTF6d2Jia2hCdG5JYjIvSlNi?=
 =?utf-8?B?dE42My9ENldFcjVaUEloNHp3STVsUEw2RWQ0UVdBZS91MzlPSGorQjZEMkJE?=
 =?utf-8?B?Nms1ZzdGUVFoSEc0TzREK1FKekpHb3g3K2ttYnBXdnZiWlhyL1BINzk1MHZv?=
 =?utf-8?B?RG1aRHUzL1Q1TWhEUFRKVW5yMlpQMjhmZVZUdU9pOHBKdW83UE5ueXhRS0hv?=
 =?utf-8?B?SEU3cjY3cGt1Ykd1djNCb1ZMcHhlOHZ1WHl6OEx4WXU3ZzlvRDVRU0FabG9Z?=
 =?utf-8?B?aXBxV3JxWjhvTzc0WWFiU21uenlIbGRGbVNmc0Y1MHhHWnJrS0pvWG82TFhD?=
 =?utf-8?B?Rmdzbi9ZRXhaTEpOZUdxZjRSZTZ1WjRuRmxIZmJCRWVVNE5kYWEycHJWd3N0?=
 =?utf-8?B?RDVEeEF1cWViN1BDQUZsNTBOa214eU0vMGptL1BUVEZTRnd3U1JOZ2FKdlFo?=
 =?utf-8?Q?fm0UN8ssM2EOa?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WHJ4L294c2ozditxb3JVUEVJTFNmYmc4Um9wN2x1NXB5SzAzS2hkaU93TVFy?=
 =?utf-8?B?NkQrV3VSZEd2NjIrTGJrK3JacGFZakthS0VDdlBHZmhNSEgvSTlsc3pGcUpx?=
 =?utf-8?B?Ukdyd2s0UllIVEd4UGdOQ0V6MXlrRElOa2xFcHphYWxweThOQzNGWmk2cG96?=
 =?utf-8?B?eVovdG53WERySTM2aXJHQUtZZjZ0UGdvNk9ycm9Bb0RNUG85ZUkra1RrcUVC?=
 =?utf-8?B?d1VncnpOOG5MYlJESXl3clYzUXEyWGYxQWhEV291SUJ5dmkveGxKRFRtV2lE?=
 =?utf-8?B?OVhOVGNIbnh4d0NIdkY0ZktNbmN5UGtoMFRwVXlNNnAxajlqb1E2eXcxRzZV?=
 =?utf-8?B?U0t3YnFxcjhMdEJ2aDhScmpKSEdnZEJNaW5IUzZmVm1pb3hYb1VjckNwZnM3?=
 =?utf-8?B?bjdlVTFrK0JnREQyWklFaVVXVkFCM0x6QXlyRTZ5ODlCeTFVTE9qN1JFWTh3?=
 =?utf-8?B?NEhUTzJsS0hLL0pDNUFhYllhUlRkeG4rZ3RSaS94SGtFNmNTQkJNdk9lYWxj?=
 =?utf-8?B?QzhnWGF3TUFRRWk1ZnFBd1FFR05hemF4MGk1MExDZncwN0RmZUlQNjR2VFdt?=
 =?utf-8?B?UC9kM2xpMW9TRG1tZGtnZGM5N3hYaWptZ1Q3aHIzQjFzM0tjTlIrdHdUVm5K?=
 =?utf-8?B?elBHclpaNEJaSzNGMm5ScE5qUlhlcG1JY2xOU2NzR1c1eUdZbUZWRFlJdkhX?=
 =?utf-8?B?QytiT3NaN2Y0SnFRaVJwckVydE1rUEdPbVNTclNtdFVxQXJyLzA0cGp3Ulhv?=
 =?utf-8?B?eG5RZXZ2d3NrWDdEY20zcWNidTIzdjhLRm9WTlBBVnVIbmx2MlhVanNobGlS?=
 =?utf-8?B?dlRTcjBNSk1yeFlSeEpRYjcwUGZjMWRKRkxSV1RYdUNILzd0RmZIRitQSW5h?=
 =?utf-8?B?NFE4WkoyNXFrZlZaQjFUbFMrK1hDN1NpWVkvUjBGNzl2bTcyVW1Ha3BOY2No?=
 =?utf-8?B?a1lBbU5KekVXQzF2TlhMaVYzUjIyUUgrSTRYaW9pZktOMVk4MGl0TURQRHFw?=
 =?utf-8?B?cVA3MnBrb0YvUHBvb3pacTdSNytVUjduUk13RXFvd3lWeGZNMi83aFJ0dXJB?=
 =?utf-8?B?bDVSeU51bTl1MHFzSnI3Qkk4WWpoR3V6dHVUZTEveURac21HbHN6amJKWWFW?=
 =?utf-8?B?RHJRY2lnQmlGSG9tTS9XTGpmbnh1YTFTSUtjSTNoTXNuT0djK0VnemE5bDdo?=
 =?utf-8?B?R2VLY2U3RTRhL1JMNm5pVldwOWdOWEZVMnJTcm5DMlJMaVpMdVVkdGZTS0NJ?=
 =?utf-8?B?eHJGV3ZsU0ZZY3BKRnIvd3pwdllhalNZQ0hNTGtFQWN2bTRwalZRYjcxNkt1?=
 =?utf-8?B?aDJoQnp2N1lLemZrRGhQbTFHZDV0bVFiZlZhbENmQWhJbUVpR0Y5Y1FIWjNE?=
 =?utf-8?B?WUZaVE5FY0VzS1Z0QUtSMHlLL09LNmNtMG5Oa0FCTllNejN4K3VJVndQSFIx?=
 =?utf-8?B?K2NpbFRVRFQweHV0RVFtNXBSNm1NRnlhWDc0RDdGZ2Ywd3lyTGMycnJkQ1Vh?=
 =?utf-8?B?b2ZvUGZKQ2pzZFJ3MmxZNGE2ZVhSUG81VERGNFZRUW9uSVhncVJBeUVUQkow?=
 =?utf-8?B?ZVVRaUtHaCt3bTNGNnl4OHJPVnRqQlk5eGtER1E5dmJDdGh2WStydFhMRG9J?=
 =?utf-8?B?bk83TTlrYWxoZUZWMjRxcTJUZ28zbis1My8vSXFRdks0WCtFUjRNaGE5QXhs?=
 =?utf-8?B?OTZCWHpacmo0N3FyOUM4UzZVYXcydTVValdFalZOK29lK2w4NzZqcWRUUCtw?=
 =?utf-8?B?ZUdDblNkTjErUUpzS3RMek1EcHRTb2ZlajM3SllHOWxOVmQzYmF5ZXJORTE5?=
 =?utf-8?B?TzRXdnlhalBvd21LaXFGcjU4VzBrZVIxRlVqa3NwaVVOU0ZzMVFYcEIydER4?=
 =?utf-8?B?RGZiSDVydW81MjBXUEZUL08vS2htZzdOaFF4WFIvZHFiSFNDTXdkYmd0Zzlk?=
 =?utf-8?B?TmZxdVlQNklwcmEzQmZVdHdCSEhiQkhHdUFMeEU1aEVMdUNlQWpQeHNmUEE5?=
 =?utf-8?B?SlZsajl3b0N6dHhZU0J5c2hRZHIvYjhZNzB0bUV5bDdkNkZCS21XK1ZwQ2pj?=
 =?utf-8?B?TnhKeEppeDJwWFFNYUJDWVYyUjBROFdydzRnTnFlOFZsSnZhUS9HNVV2aVZL?=
 =?utf-8?Q?QBh9mwZbu1LrFH3OWe4844CJp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f0fb05-bcb1-4c77-21cb-08dd4429140d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 08:02:17.9164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hR3ozfa92M0XzA1qh7C0Qai83SCJodvL3HO5bVLiIi85edCZM3ae4PyyusjM2acfXNzgCPIUQzogL8ae2WQR0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9784

Hi Laurent,

...
>>>> +
>>>> +struct ox05b1s_mode {
>>>> +     u32 index;
>>>> +     u32 width;
>>>> +     u32 height;
>>>> +     u32 code;
>>>> +     u32 bpp;
>>>> +     u32 vts; /* default VTS */
>>>> +     u32 hts; /* default HTS */
>>>> +     u32 exp; /* max exposure */
>>>> +     bool h_bin; /* horizontal binning */
>>>> +     u32 fps;
>>>> +     struct ox05b1s_reglist *reg_data;
>>>> +};
>>>> +
...
>>>> +
>>>> +static struct ox05b1s_mode ox05b1s_supported_modes[] = {
>>>> +     {
>>>> +             .index          = 0,
>>>> +             .width          = 2592,
>>>> +             .height         = 1944,
>>>> +             .code           = MEDIA_BUS_FMT_SGRBG10_1X10,
>>>> +             .bpp            = 10,
>>>> +             .vts            = 0x850,
>>>> +             .hts            = 0x2f0,
>>>> +             .exp            = 0x850 - 8,
>>>> +             .h_bin          = false,
>>>> +             .fps            = 30,
>>>> +             .reg_data       = ox05b1s_reglist_2592x1944,
>>>> +     }, {
>>>> +             /* sentinel */
>>>> +     }
>>>> +};
>>>> +
...
>>>> +
>>>> +static int ox05b1s_set_vts(struct ox05b1s *sensor, u32 vts)
>>>> +{
>>>> +     u8 values[2] = { (u8)(vts >> 8) & 0xff, (u8)(vts & 0xff) };
>>>> +
>>>> +     return regmap_bulk_write(sensor->regmap, OX05B1S_REG_TIMING_VTS_H, values, 2);
>>>> +}
>>>> +
...
>>>> +
>>>> +static int ox05b1s_s_ctrl(struct v4l2_ctrl *ctrl)
>>>> +{
>>>> +     struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
>>>> +     struct i2c_client *client = v4l2_get_subdevdata(sd);
>>>> +     struct ox05b1s *sensor = client_to_ox05b1s(client);
>>>> +     u32 w = sensor->mode->width;
>>>> +     u32 h = sensor->mode->height;
>>>> +     int ret = 0;
>>>> +
>>>> +     /* apply V4L2 controls values only if power is already up */
>>>> +     if (!pm_runtime_get_if_in_use(&client->dev))
>>>> +             return 0;
>>>> +
>>>> +     /* s_ctrl holds sensor lock */
>>>> +     switch (ctrl->id) {
>>>> +     case V4L2_CID_VBLANK:
>>>> +             ret = ox05b1s_set_vts(sensor, h + ctrl->val);
>>>> +             break;
>>>> +     case V4L2_CID_HBLANK:
>>>> +             if (sensor->mode->h_bin)
>>>> +                     ret = ox05b1s_set_hts(sensor, w + ctrl->val);
>>>> +             else
>>>> +                     ret = ox05b1s_set_hts(sensor, (w + ctrl->val) / 2);
>>>> +             break;
>>>> +     case V4L2_CID_PIXEL_RATE:
>>>> +             /* Read-only, but we adjust it based on mode. */
>>>> +             break;
>>>> +     case V4L2_CID_ANALOGUE_GAIN:
>>>> +             ret = ox05b1s_set_analog_gain(sensor, ctrl->val);
>>>> +             break;
>>>> +     case V4L2_CID_EXPOSURE:
>>>> +             ret = ox05b1s_set_exp(sensor, ctrl->val);
>>>> +             break;
>>>> +     default:
>>>> +             ret = -EINVAL;
>>>> +             break;
>>>> +     }
>>>> +
>>>> +     pm_runtime_put(&client->dev);
>>>> +
>>>> +     return ret;
>>>> +}
>>>> +
...
>>>> +
>>>> +/* Update control ranges based on current streaming mode, needs sensor lock */
>>>> +static int ox05b1s_update_controls(struct ox05b1s *sensor)
>>>> +{
>>>> +     int ret;
>>>> +     struct device *dev = &sensor->i2c_client->dev;
>>>> +     u32 hts = sensor->mode->hts;
>>>> +     u32 hblank;
>>>> +     u32 vts = sensor->mode->vts;
>>>> +     u32 vblank = vts - sensor->mode->height;
>>>> +     u32 fps = sensor->mode->fps;
>>>> +     u64 pixel_rate = (sensor->mode->h_bin) ? hts * vts * fps : 2 * hts * vts * fps;
>>> Unless the sensor adjusts the pixel rate when you write the blanking
>>> registers, this doesn't seem correct.
>> I'm not sure I understand.
>>
>> The pixel_rate value calculated here is fixed per mode, as the
>> hts,vts,fps are the default values per mode.
>>
>> The hblank is basically read-only (min=max value). If vblank is changed
>> by user, the frame rate will change, but the pixel_rate value will
>> remain the same.
> Yes, the frame rate will change, but the fps variable above won't. It
> will still be set to the default fps for the mode, while the actual
> frame rate produced by the sensor will differ. The pixel rate
> calculation here will therefore give an incorrect value.

Yes, the real frame rate produced  by the sensor is different than the 
value that is hold in the fps field of the mode structure (that is the 
default fps, I can add a comment to clarify that, or change the names of 
those fields to def_fps, def_hts, def_vts). But that only happens as a 
result of the actual vts change, and the actual vts is not used in the 
pixel_rate calculation above, the calculation only uses the default 
values from the mode structure. The real vts is written into the sensor 
register when V4L2_CID_VBLANK control is changed, but the vts field in 
the mode structure remains a default value.

Or, I could add a pixel_rate field in the ox05b1s_mode, and use that 
instead of a formula, maybe it would be more straightforward.

Let me know what you think.

...
>>>> +     {0x0100, 0x00},
>>> Please use register macros for the registers that are documented.
>> Do you mean to add a define for all register numbers in the init list,
>> or just use the define in the init list, in case it was defined already
>> for other usages elsewhere in the code?
> The latter, using OX05B1S_REG_SW_STB here. I'd like a macro for each
> register in the init list, but macros such as OX05B1S_REG_0107 are
> useless. Registers that are documented in the datasheet should be named
> with macros, registers that are not can use numerical addresses and
> values.
Thanks, I'll add macros for the documented registers.


Thanks,

Mirela


