Return-Path: <linux-media+bounces-25489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61469A240F4
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A9513ABDE3
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 16:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF951E0E18;
	Fri, 31 Jan 2025 16:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="p+Ma7rMY"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013049.outbound.protection.outlook.com [40.107.162.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6D51F4279;
	Fri, 31 Jan 2025 16:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341333; cv=fail; b=LqV6R2DKf7H/2gbFckz4KmiG+yEYg7oswdO6y7wMhS643OhTKb+OHebJuPcm6c4suaeLUxUDRfYh3UUAubev16XFqIb9gyaQRXkwW4up2BAHKNIA8uUX5ycI8Laf5fgvAxae0IM3nPBe0QNCzh7kVo0At8VGNve+IFvyX6yzKbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341333; c=relaxed/simple;
	bh=nNlTq79HvT1PULImcohpknc0qTS7kfvufS0+4ZrLP3s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uhxBimCYpRUtB8X2/6UzvL9VPA/ECweBv7F8xOn/eXFPhqMkilKkTdUMSEn72/AAHGBOy4xleC8wNcJM1LlnB6rPEnfLbkJUoxb9E8hSV/PPSfNJvA+6/K2YaNkIDsQyzo8TV9QJsevgJSaxq0Xgt1JZGXVprAyRmWVhfUVuUkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=p+Ma7rMY; arc=fail smtp.client-ip=40.107.162.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/JQ3zmRUhFR/Jvzxnyz0uNK0KCueMIrtH3ecLZo3ucY/WH5jhajG5xFhCn/cbCdO3mShro+s7fs5CiIusMCp5IEGSEyDPMwIYOqGlpfj6WUjINSaHOqV56mrwGHEv3y3fvWox62fr+lqyypo6+QfWRj+1XQIhC3yewNrPt89aR0iIUP5lduZJit7AP5TDAIYg6JBT5Ooj1uuqcGqEWGL7frAgrPxbv42Hxm8QvKAXX3WFA4sZv9qzluNF/cnxCUfo6VbNEPEoJPrKDN3bQ5yicJMI1HjW9eJaeA4T3zF13E1M+5DZxZlR13uUouURekg7XzihjQTOFdjOn8lGDbnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYQ4SI3WwCA6esk9QGlp6Vu/8j+T4S4bwrhZk/DP4hY=;
 b=oTDopISdvis7ry19JoM7w6F63lKlYxIEV5AR5M0ulnTGDrUJ6FIMqNZ3F+Pcf5qWzFB8D4JsNRwMWrUvyl/Hq2FqQW4tGhg2ae2ukDxBcMQ1b+nUehaWvPtZ8yuN6/lfgI0x5H3rum+nPCjwiITVl94L8X99qi0fuc0we7Dg4DQPhUOOF1+A8VIO/hNoRkkxWOoYr69In1vEFbrKj1hiKaZW1OlS5m55e2ew34LUSt1X5F7+W8tzC8S93tyCD97y36y3a/ErQGoefpYGHAufG/8yT8ac29FwT+gSay7dTfOTS0YzJOa6S25KHdyt0Kh5ibvhCSwHQJbHSo9pfCDpLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYQ4SI3WwCA6esk9QGlp6Vu/8j+T4S4bwrhZk/DP4hY=;
 b=p+Ma7rMYYsy1RQpoRjeBAXQ29FxpWLLBDr14V/aBwt5VUqtEbFDRny2hAIdfCkcUUE5IwY4aCfwYa6Mm57J3HmPxnYYNn/F5HO8+6RqTMT7f+yeGnMOYNPBwcBMGvZMFvNJjVGnthTCCZJwoRuNM7NP4mNYDBXQoS/tN2uRvzkGu3jkuHlrQQU7VV7HBbtjeq0eZQ1ardab8eITfFyNwtJbbXJPKKrTMkVcukqe6bdGIMkRykorXGMxBHWJO6o+KJCNU+W8CI/gB4CvMvDY8/A7wvi+FFMgIdrXArx9NEgZBblnbHENUNt88+rVtNKXtFMaYjJAGAIMlPa8Y2YcJJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB8529.eurprd04.prod.outlook.com (2603:10a6:20b:420::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 16:34:55 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 16:34:55 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC 12/12] staging: media: max96712: allow streaming from connected sensors
Date: Fri, 31 Jan 2025 18:34:06 +0200
Message-Id: <20250131163408.2019144-13-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::28) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: dd82e91c-be5b-48c5-5cf4-08dd4215319e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUIyTm0rallvNXpYUC9YejhZRHFYNytXZjM2bzVOVG5lTTdNRzJOZnlMcnFI?=
 =?utf-8?B?WDhjN2tXcTB2c3VBWXdaSWZ2TzJHMWk1bVplN0JVNGJmVXhPckJwa0hFTVIv?=
 =?utf-8?B?bWN6amlHWU5tTnExTUZQMis0N2xYQkt6M09HNnNNdGpQTURHNG44RXU3dC9U?=
 =?utf-8?B?bE1YWEQzWmczamtFV1J1QWNJM3VBZHJlZk1wRm1zcnVkTXlGOEdrODltTzRY?=
 =?utf-8?B?MHFMZWJGRFlVTnVibytVampLbFZxZDV3YTFuZTNyeDNRaEhYaHgxbEJHbU1u?=
 =?utf-8?B?SFRaYmdkTlNDdmRQeWxhNDNSeHcvK2V4WTNaSVV5ZmNoLzFJUkVjdWtUMHNv?=
 =?utf-8?B?WU1CQzVva1I2SkpsSGhIakxnMHdOSTRUeFpPRTNkSVZMUnZ5SVhmblhOMndK?=
 =?utf-8?B?eTEyS0E1cnYxRWh0dmNMQno2Nm9FR0o2emE1end0M0hVWFI2UEcxcUdpOFpP?=
 =?utf-8?B?NFl4WTdiR3F4Yy92T1VveUxkVFZ6QlhxL0hLZTIrUlNicGw4Q1JncU9OVzdi?=
 =?utf-8?B?L0xyWlJOSjlST2RkSDdldGhnSkpmQ0w3YlV4UmNNNUh5SlNxMlp0bmU4SDhM?=
 =?utf-8?B?ZE05dTFlRFZ3bC9ITTdRdFJXZ05xSVBidUw3c1ZzVFVxT2l2RVk0QkE5NWYz?=
 =?utf-8?B?aWY1SEcrVW9nVVZZZnhRWHR0WlhvK29EZ0IwL0NVUkNWWVpmeUI0QTVBMDZP?=
 =?utf-8?B?cURPaTZmYTVPeXdlejBiVHlybk1JUVB6bGZzOE85MnJ4ZWh3SW1TYlVKTlNa?=
 =?utf-8?B?YXRiWlVaN1MrN01PcHBxeEFlNHU0TVdldENmTUhMSjc3OGN3eVlia2hpOWFR?=
 =?utf-8?B?U09iZXlFTGVIbTgwMU9IV0V6aWFmZXRzMjZyRFllRFV4TUF0UHpHODJ6dlVx?=
 =?utf-8?B?UjFBaEQrTitVUlR1NkJlWDlvUnYzcXdkUDJQa0xsTC9hVkgzMVVBS0hnVUVi?=
 =?utf-8?B?cml2Zys0OHUwOE1jamhzR3Fla1VjR1Q3YmhnVHVSaXFqWjRxaVMwWHpJcnVS?=
 =?utf-8?B?d0tVK0xZbmdPRDlZOEtRby9pR3pPYWxrWjA3NXhxcFgzUG1sUGdkNDQ1QWVI?=
 =?utf-8?B?cUs5SUlreldJSEhNR0dPVTF4TWl3dEJQeDZOL1lhdjk0L3MrYmZ6SlFPQ0d4?=
 =?utf-8?B?YUdwemgwNkV5aVJ5RmZDaWJxNG9EWUM1YndrcnFEVWRrcVFjRHBubk9La3Vt?=
 =?utf-8?B?YVNzMCsrbnNWV0NMTFRDczVPQU5ya2FFL05zV0xHc2lNSWNsMEZqM0thaHht?=
 =?utf-8?B?cHlaV2xYdlRiOWtwY05nb244RVhwdzc5YU9tMmVTeG9aQ2JFNzVWVW5rZXJW?=
 =?utf-8?B?b2hZemZRb1pNbHRpeGJFR2NRaDhMNjdpcjZvVXhhOC9xanh5RlljdTMzUGpU?=
 =?utf-8?B?NnN1S2lTVnMxK001aklhS3Fwek5pcUNZbTB0N0JwSWc2dnZUYjAybVJ4Rkdr?=
 =?utf-8?B?OHRPL0pIdytrakpzUUNMdTFld080bE9yRytET1BydHpWb0FZM1VMK2l0YkRl?=
 =?utf-8?B?QytoNFdTUWplZ09OOFhSZm13RWNlVVc2SDBnODhoWk1CLzl6bjV1dE1iMExG?=
 =?utf-8?B?LzN1MVUrVDFMS3VHUEo5TmZCYklpUVRVV3NmRUQvdzlYenZQc0JvcWNJQVFT?=
 =?utf-8?B?TEkxUnkwQVFGem9YSzRHamR3WFZnSFk5VVNYa3E0TlhISldUTHpPY3hESzM2?=
 =?utf-8?B?bkloUU03ZW50U1JvV0hic1NMZ1BLVFliRGhhUWhlMGMrRXlrcm1xSC9MWnFW?=
 =?utf-8?B?SnZsL2Rra3JLQ2RLQkN4YllndlJHUDBsS1VaeW1rSzlGVzNUNGR1ZTB0aUZ4?=
 =?utf-8?B?d3RtL2ZSTlJYMWxGbzUvVWpjNHBQL29CSG9qSVZOWDAyaFVXbFhCczdWSndz?=
 =?utf-8?Q?Ai5uTAlH7UOov?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clI2SkhINDRWcXJQeUp3RkJCT3JHejdYSFRoL3h4YWFkS3IwMjF2VlR4SEhR?=
 =?utf-8?B?SkZPUGllV29rUjBmZThtY3hmdTB4eHpWdGI0UjVFYkpISXdiUzZlcEI2Qjhr?=
 =?utf-8?B?Vi8rT1I0UGRFbCtSaTF1aUVLV2l0Z1J1RUJvbis4Y1BjbTBQVXNnY2VsSS9j?=
 =?utf-8?B?YXFVN2RDZjJ0U1ZlUjNlQjcxN3Z4SHRVcm5COEt6SWJMQkRBZzFWMlJpdnRo?=
 =?utf-8?B?WHZJclpvWUFFSW80QmNjWEFtWXdVeTJocGltbDB4YW9ZcitKa1RHWmdLU2pU?=
 =?utf-8?B?REp4OXcydXBMTHdXQk5KajRIaC9ZV2FBOTExQ3dzQUdkeFJLNmFFVS8zZ3Zl?=
 =?utf-8?B?ekViKzZmSllHTzZQa3NEK0NQYTF2bGlRWU16Vk9SYVR1TkRPK0k4V2RkZ1Rn?=
 =?utf-8?B?VU05UlNuVWYwYXp4ZU5MZmZicFJGU2tNam4weW9DditPNkZKcFZPMHIxbmZo?=
 =?utf-8?B?cE5oaGU0Q1ArYVpodHNWWk5nb21FSmNtWm9jV2NLTlZXT0Z6Ti8wemowOHUr?=
 =?utf-8?B?bHQ3SXhTVXg5SlJPTWdieTZ2UkEyNHdkbWtsdnFDMlFpam8xc0FmN3UwUDVs?=
 =?utf-8?B?SWt1bm5WYnlpOWZXUnNuWjBlbVhUKzlibzUrM2pLbFFWRUdmR2htTDBSblFG?=
 =?utf-8?B?eTk3OFJ3dWZqL2RtZmpMdW8rbDloVTFQQU5BK0dwVTVpNmo5Nm9UU0tyTEd3?=
 =?utf-8?B?NnIvQmpPdVRhcFFwTEN6UVNmckVsUjFra0FxaXJmZlpqZit5ZFQ5YWtSSnlI?=
 =?utf-8?B?SHVFdnFsVGhCWW5aNTRBVDV2VmhTaGg1cDBrU3IwTUJ2WnRIUFpwL3hHVUpL?=
 =?utf-8?B?WFdxVXR6SlM5Rm9VS0J2SDhpMFZocXVuSStRWUFZTW16NlRjVFNKa0VuQ1h3?=
 =?utf-8?B?SUljT2hkZWVQYVZtZjJucUVnK0dXUUhGZ0Q3RWVJR1o1WVdzRGR0K0E3TTNN?=
 =?utf-8?B?OW9oZVpTMEFwVEt3NmpqRFhMODdKT3h0aTI1UkhmNWZoNnkxY0tRdEJ1Y2pq?=
 =?utf-8?B?cWFDZ0tYMGs1SDFhdWx0ZE42RjhuRi92azFwbXc5c0pOTFJEUFlJRDE0c1pU?=
 =?utf-8?B?dzdLSDlzcE9TV0djNktBZUQxM0ZaVzBoOXNuQWRmcm1tUVlmWE1xWHlNb3Bn?=
 =?utf-8?B?OEVzR0p5RE1NSXhxazNpNEpKcTR0dVh3WHR5TmM0UFBnS3F0MzdnUS9ZcHdG?=
 =?utf-8?B?a3ZKQzBhalpHM0tDSll2ZVAvNVJ4M1huZHBuK0RuZE1BVVVNcGVBTXJkcGVu?=
 =?utf-8?B?R2pkOFFiTE1VRlcxOUhzQ3BZMFBPc2ttTU5RQTNKSjJkbFUrZFVaczAwcGp5?=
 =?utf-8?B?OVZZSVp4Qzh6MzkyTkZNb082a2MwNk9mMHJLSnJvM3FwaXNVTE00eUpJWlJ1?=
 =?utf-8?B?N2dEUUc1Yit4U3RyWndLUkVsVnpBWkNvcWdTR3FSR1Z5UUtYcDlLc1dPTmNQ?=
 =?utf-8?B?d05IdW1MSWFXNEpxQTRxUmtEMThOTnFOdGtrd0pFeXhadjJ6ME9ORGJuZE0x?=
 =?utf-8?B?RllCWFpPVmNVZ2VZK0JQSHNBa1NQWlQvbGUyemNHdTI5MGVlOTBNb2lNUTlE?=
 =?utf-8?B?Qko0NW4vV0ZxYjdOcENaSDMrUWI0SEpuekZvV09ZLzNjcHFYRm1mZ25ISllZ?=
 =?utf-8?B?WGk4S094Q2p3STRUWFBFMjQvVGMyY1JKeTVHbytKc0wwOWtXN1RyQXI0QkZQ?=
 =?utf-8?B?TGVBQ05YYUkyTTFiMTNlT0d6MjhtalRBbVpDRDREb3QrYXpqdGZjSnpFSmo1?=
 =?utf-8?B?b0tUVkJkbm9tZFI5Wk5DL3dhOFRXK2dmQzFGRndCT1NERjd2aGJqUzA3dlRr?=
 =?utf-8?B?TEx2RmdMdU0vb29LWitNZTFKUmY0QmIvMEd4cE9rV0pzZzVuWm82SVVQNXVT?=
 =?utf-8?B?Umw3c3FXZ1lzNitUQ2cvMTJ2OFQvTHJuS2k5eVN6bk53SUVjMlFTL2pFUjRP?=
 =?utf-8?B?Z1FLd2RyYXZnR3llWDdJMmpSSm8yWkNIYW1mUldUQ2hrZFczelh1cGZJNFRS?=
 =?utf-8?B?WWw1RVhkQXVRK0FzSFVNejJxbVZDNWluMzRmWXNNc2tsSmZyNEt1MGYwZVdp?=
 =?utf-8?B?a0lBUEhmVlg2eUZrTmVVamttRGRHSmRCdndxUWY2Y2lsRVZYUm9weFptbTkw?=
 =?utf-8?B?RWVsdzRrV3V4WHN1Wmo0YitWdzkyNDZGV1RsWU9BWHVYaHBod0FMVzRwT3du?=
 =?utf-8?B?eUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd82e91c-be5b-48c5-5cf4-08dd4215319e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:34:55.2604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Czk4OBp2I3w6DnzkuuacWj3ZY8tSnSRz3dKf5Q6/ANIIVv5tv+LH2tKzqlSIif9quVM/oNnGeFpdL4VjvoW0mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8529

This adds support for starting/stopping streaming from connected
sensors as well. The user can also switch over to testing the test
pattern by configuring the routes accordingly.

Use the 'maxim,operation-mode' DT setting to allow the user to select
which operation mode the deserializer should run in, though only
tunneling mode is supported currently.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/staging/media/max96712/max96712.c | 426 +++++++++++++++++++++-
 1 file changed, 418 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 0112052171b06..b4c3d1d3c9539 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2021 Renesas Electronics Corporation
  * Copyright (C) 2021 Niklas Söderlund
+ * Copyright 2025 NXP
  */
 
 #include <linux/delay.h>
@@ -30,6 +31,12 @@
 #define   DIS_REM_CC_C_SHIFT				4
 #define   DIS_REM_CC_D_MASK				GENMASK(7, 6)
 #define   DIS_REM_CC_D_SHIFT				6
+#define MAX96712_DEV_CTRL12				CCI_REG8(0x000a)
+#define   LOCKED_B					BIT(3)
+#define MAX96712_DEV_CTRL13				CCI_REG8(0x000b)
+#define   LOCKED_C					BIT(3)
+#define MAX96712_DEV_CTRL14				CCI_REG8(0x000c)
+#define   LOCKED_D					BIT(3)
 
 /* TOP_CTRL */
 #define MAX96712_DEBUG_EXTRA_REG			CCI_REG8(0x0009)
@@ -37,6 +44,11 @@
 #define   DEBUG_EXTRA_PCLK_75MHZ			0x01
 #define MAX96724_TOP_CTRL_PWR1				CCI_REG8(0x0013)
 #define   RESET_ALL					BIT(6)
+#define MAX96712_TOP_CTRL_CTRL3				CCI_REG8(0x001a)
+#define   LOCK_PIN					BIT(0)
+#define   CMU_LOCKED					BIT(1)
+#define   ERROR						BIT(2)
+#define   LOCKED_A					BIT(3)
 
 /* BACKTOP0 */
 #define MAX96712_BACKTOP0_12				CCI_REG8(0x040b)
@@ -110,6 +122,15 @@
 #define   T_T3_PREP_86_7NS				3
 #define   T_T3_POST_MASK				GENMASK(6, 2)
 #define   T_T3_POST_SHIFT				2
+#define MAX96712_MIPI_PHY_MIPI_CTRL_SEL			CCI_REG8(0x08ca)
+#define   MIPI_CTRL_SEL_0_MASK				GENMASK(1, 0)
+#define   MIPI_CTRL_SEL_0_SHIFT				0
+#define   MIPI_CTRL_SEL_1_MASK				GENMASK(3, 2)
+#define   MIPI_CTRL_SEL_1_SHIFT				2
+#define   MIPI_CTRL_SEL_2_MASK				GENMASK(5, 4)
+#define   MIPI_CTRL_SEL_2_SHIFT				4
+#define   MIPI_CTRL_SEL_3_MASK				GENMASK(7, 6)
+#define   MIPI_CTRL_SEL_3_SHIFT				6
 
 /* MIPI_TX: 0 <= phy < 4 */
 #define MAX96712_MIPI_TX_DESKEW_INIT(phy)		CCI_REG8(0x0903 + (phy) * 0x40)
@@ -123,6 +144,22 @@
 #define   CSI2_CPHY_EN					BIT(5)
 #define   CSI2_LANE_CNT_MASK				GENMASK(7, 6)
 #define   CSI2_LANE_CNT_SHIFT				6
+#define MAX96712_MIPI_TX_54(phy)			CCI_REG8(0x0936 + (phy) * 0x40)
+#define   TUN_EN					BIT(0)
+#define   DESKEW_TUN_SRC_MASK				GENMASK(2, 1)
+#define   DESKEW_TUN_SRC_SHIFT				1
+#define   TUN_SER_LANE_NUM_MASK				GENMASK(4, 3)
+#define   TUN_SER_LANE_NUM_SHIFT			3
+#define   DESKEW_TUN_MASK				GENMASK(6, 5)
+#define   DESKEW_TUN_SHIFT				5
+#define   TUN_NO_CORR					BIT(7)
+#define MAX96712_MIPI_TX_57(phy)			CCI_REG8(0x0939 + (phy) * 0x40)
+#define   TUN_DPHY_TO_CPHY_CONV_OVRD			BIT(1)
+#define   TUN_DPHY_TO_CPHY_CONV				BIT(2)
+#define   TUN_DEST_MASK					GENMASK(5, 4)
+#define   TUN_DEST_SHIFT				4
+#define   DIS_AUTO_TUN_DET				BIT(6)
+#define   DIS_AUTO_SER_LANE_DET				BIT(7)
 
 /* GPIO_A: 0 <= gpio < 11 */
 #define MAX96712_GPIO_A_A(gpio)				CCI_REG8(0x0300 + (gpio) * 0x03)
@@ -241,6 +278,16 @@ struct max96712_rx_port {
 	struct fwnode_handle *fwnode;
 };
 
+struct max96712_asc {
+	struct v4l2_async_connection base;
+	struct max96712_rx_port *rx_port;
+};
+
+enum max96712_operation_mode {
+	MAX96712_TUNNEL_MODE,
+	MAX96712_PIXEL_MODE,
+};
+
 struct max96712_priv {
 	struct i2c_client *client;
 	struct regmap *regmap;
@@ -253,6 +300,8 @@ struct max96712_priv {
 
 	const struct max96712_info *info;
 
+	enum max96712_operation_mode operation_mode;
+
 	bool cphy;
 	struct v4l2_mbus_config_mipi_csi2 mipi;
 	s64 link_freq;
@@ -260,12 +309,15 @@ struct max96712_priv {
 	struct v4l2_subdev sd;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct media_pad pads[MAX96712_MAX_PORTS];
+	struct v4l2_async_notifier notifier;
+	u32 enabled_streams;
 
 	struct max96712_rx_port rx_ports[MAX96712_MAX_RX_PORTS];
 	unsigned int rx_port_mask;
 	unsigned int n_rx_ports;
 
 	enum max96712_pattern pattern;
+	bool vpg_started;
 
 	struct max96712_fsync fsync;
 	struct v4l2_fract interval;
@@ -382,6 +434,17 @@ static inline bool max96712_pad_is_source(u32 pad)
 	return pad >= MAX96712_FIRST_SOURCE_PAD && pad < MAX96712_VPG_PAD;
 }
 
+static int max96712_read(struct max96712_priv *priv, unsigned int reg, u64 *val)
+{
+	int ret;
+
+	ret = cci_read(priv->regmap, reg, val, NULL);
+	if (ret)
+		dev_err(&priv->client->dev, "read 0x%04x failed\n", reg);
+
+	return ret;
+}
+
 static int max96712_write(struct max96712_priv *priv, unsigned int reg, u64 val)
 {
 	int ret;
@@ -422,6 +485,14 @@ static void max96712_mipi_enable(struct max96712_priv *priv, bool enable)
 	}
 }
 
+static void max96712_tunneling_enable(struct max96712_priv *priv, bool enable)
+{
+	int i;
+
+	for (i = 0; i < 4; i++)
+		max96712_update_bits(priv, MAX96712_MIPI_TX_54(i), TUN_EN, enable ? TUN_EN : 0);
+}
+
 static void max96712_mipi_configure(struct max96712_priv *priv)
 {
 	unsigned int i;
@@ -485,14 +556,26 @@ static void max96712_mipi_configure(struct max96712_priv *priv)
 				     PERIODIC_DESKEW_CALIBRATION_EN, auto_deskew_calib_en);
 	}
 
+	if (priv->operation_mode == MAX96712_TUNNEL_MODE) {
+		int i;
+		/*
+		 * Disable tunnel auto-detection for all phys, will enable tunnelling
+		 * explicitly when needed.
+		 */
+		for (i = 0; i < 4; i++)
+			max96712_update_bits(priv, MAX96712_MIPI_TX_57(i),
+					     DIS_AUTO_TUN_DET, DIS_AUTO_TUN_DET);
+	}
+
 	/* Enable PHY0 and PHY1 */
 	max96712_update_bits(priv, MAX96712_MIPI_PHY_2, PHY_STDBY_N_MASK, PHY0_EN | PHY1_EN);
 }
 
-static void max96712_pattern_enable(struct max96712_priv *priv, struct v4l2_subdev_state *state,
-				    bool enable)
+static int max96712_pattern_enable(struct max96712_priv *priv, struct v4l2_subdev_state *state,
+				   bool enable)
 {
 	struct v4l2_mbus_framefmt *fmt = v4l2_subdev_state_get_format(state, MAX96712_VPG_PAD);
+	struct device *dev = &priv->client->dev;
 
 	const u32 h_active = fmt->width;
 	const u32 h_fp = 88;
@@ -506,9 +589,16 @@ static void max96712_pattern_enable(struct max96712_priv *priv, struct v4l2_subd
 	const u32 v_bp = 36;
 	const u32 v_tot = v_active + v_fp + v_sw + v_bp;
 
+	priv->vpg_started = enable;
+
 	if (!enable) {
 		max96712_write(priv, MAX96712_VRX_PATGEN_1, 0x00);
-		return;
+		return 0;
+	}
+
+	if (priv->enabled_streams) {
+		dev_err(dev, "Cannot enable VPG when other streams are enabled.\n");
+		return -EINVAL;
 	}
 
 	max96712_write(priv, MAX96712_DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
@@ -553,14 +643,44 @@ static void max96712_pattern_enable(struct max96712_priv *priv, struct v4l2_subd
 		/* Generate gradient pattern. */
 		max96712_write(priv, MAX96712_VRX_PATGEN_1, PATGEN_MODE_GRADIENT);
 	}
+
+	return 0;
+}
+
+static u8 max96712_get_link_status(struct max96712_priv *priv)
+{
+	u32 link_lock_addr[4] = {
+		MAX96712_TOP_CTRL_CTRL3,
+		MAX96712_DEV_CTRL12,
+		MAX96712_DEV_CTRL13,
+		MAX96712_DEV_CTRL14
+	};
+	int nport;
+	u8 link_status_mask = 0;
+
+	for (nport = 0; nport < MAX96712_MAX_RX_PORTS; nport++) {
+		u64 reg_val = 0;
+
+		max96712_read(priv, link_lock_addr[nport], &reg_val);
+
+		link_status_mask |= reg_val & BIT(3) ? (1 << nport) : 0;
+	}
+
+	return link_status_mask;
 }
 
-static int __maybe_unused max96712_fsync_set(struct max96712_priv *priv)
+static int max96712_fsync_enable(struct max96712_priv *priv, bool enable)
 {
 	u32 fsync;
 	int ret;
 	u8 mode_map[4] = {3, 0, 1, 2};
 
+	if (!enable) {
+		max96712_update_bits(priv, MAX96712_FSYNC_0,
+				     FSYNC_MODE_MASK, 0x3 << FSYNC_MODE_SHIFT);
+		return 0;
+	}
+
 	if (priv->fsync.mode == MAX96712_FSYNC_OFF)
 		return 0;
 
@@ -739,14 +859,117 @@ static int max96712_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	return ret;
 }
 
+static struct v4l2_subdev *max96712_xlate_streams(struct max96712_priv *priv,
+						  struct v4l2_subdev_state *state, u32 src_pad,
+						  u64 src_streams, u32 sink_pad, u64 *sink_streams,
+						  u32 *remote_pad)
+{
+	struct device *dev = &priv->client->dev;
+	u64 streams;
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *pad;
+
+	streams = v4l2_subdev_state_xlate_streams(state, src_pad, sink_pad, &src_streams);
+	if (!streams)
+		dev_dbg(dev, "no streams found on sink pad\n");
+
+	pad = media_pad_remote_pad_first(&priv->pads[sink_pad]);
+	if (!pad) {
+		dev_dbg(dev, "no remote pad found for sink pad\n");
+		return ERR_PTR(-EPIPE);
+	}
+
+	remote_sd = media_entity_to_v4l2_subdev(pad->entity);
+	if (!remote_sd) {
+		dev_dbg(dev, "no entity connected to CSI2 input\n");
+		return ERR_PTR(-EPIPE);
+	}
+
+	*sink_streams = streams;
+	*remote_pad = pad->index;
+
+	return remote_sd;
+}
+
+static int max96712_enable_remote_stream(struct max96712_priv *priv,
+					 struct v4l2_subdev_state *state,
+					 u32 source_pad, u32 stream, u32 sink_pad,
+					 bool enable)
+{
+	struct device *dev = &priv->client->dev;
+	struct v4l2_subdev *remote_sd;
+	u64 sink_streams = 0;
+	u32 remote_pad = 0;
+	int ret = 0;
+
+	if (enable && priv->vpg_started) {
+		dev_err(dev, "Cannot enable remote streams while VPG is enabled.\n");
+		return -EINVAL;
+	}
+
+	remote_sd = max96712_xlate_streams(priv, state, source_pad, BIT(stream), sink_pad,
+					   &sink_streams, &remote_pad);
+	if (IS_ERR(remote_sd))
+		return PTR_ERR(remote_sd);
+
+	ret = enable ? v4l2_subdev_enable_streams(remote_sd, remote_pad, 0x1) :
+		       v4l2_subdev_disable_streams(remote_sd, remote_pad, 0x1);
+
+	if (ret)
+		dev_err(&priv->client->dev, "failed to %s streams 0x%llx on '%s':%u: %d\n",
+			enable ? "enable" : "disable",
+			sink_streams, remote_sd->name, remote_pad, ret);
+
+	return ret;
+}
+
 static int max96712_enable_streams(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *state,
 				   u32 source_pad, u64 streams_mask)
 {
 	struct max96712_priv *priv = v4l2_get_subdevdata(sd);
+	u64 sources_mask = streams_mask;
+	u32 sink_pad, sink_stream;
+	int ret = 0;
+
+	if (!priv->enabled_streams)
+		max96712_mipi_enable(priv, true);
+
+	while (true) {
+		int pos = ffs(sources_mask) - 1;
 
-	max96712_pattern_enable(priv, state, true);
-	max96712_mipi_enable(priv, true);
+		if (pos == -1)
+			break;
+
+		ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
+							    source_pad, pos,
+							    &sink_pad, &sink_stream);
+		if (ret)
+			return ret;
+
+		if (sink_pad == MAX96712_VPG_PAD && sink_stream == 0) {
+			/* need to have tunneling disabled for VPG to work */
+			max96712_tunneling_enable(priv, false);
+
+			ret = max96712_pattern_enable(priv, state, true);
+		} else {
+			if (!priv->enabled_streams) {
+				max96712_fsync_enable(priv, true);
+				if (priv->operation_mode == MAX96712_TUNNEL_MODE)
+					max96712_tunneling_enable(priv, true);
+			}
+
+			ret = max96712_enable_remote_stream(priv, state, source_pad, pos,
+							    sink_pad, true);
+		}
+
+		if (ret)
+			return ret;
+
+		sources_mask &= ~BIT(pos);
+	}
+
+	priv->enabled_streams |= streams_mask;
 
 	return 0;
 }
@@ -756,9 +979,42 @@ static int max96712_disable_streams(struct v4l2_subdev *sd,
 				    u32 source_pad, u64 streams_mask)
 {
 	struct max96712_priv *priv = v4l2_get_subdevdata(sd);
+	u64 sources_mask = streams_mask;
+	u32 sink_pad, sink_stream;
+	int ret = 0;
 
-	max96712_mipi_enable(priv, false);
-	max96712_pattern_enable(priv, state, false);
+	while (true) {
+		int pos = ffs(sources_mask) - 1;
+
+		if (pos == -1)
+			break;
+
+		ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
+							    source_pad, pos,
+							    &sink_pad, &sink_stream);
+		if (ret)
+			return ret;
+
+		max96712_update_bits(priv, MAX96712_MIPI_PHY_0, FORCE_CSI_OUT_EN, 0x00);
+
+		if (sink_pad == MAX96712_VPG_PAD && sink_stream == 0)
+			ret = max96712_pattern_enable(priv, state, false);
+		else
+			ret = max96712_enable_remote_stream(priv, state, source_pad, pos,
+							    sink_pad, false);
+
+		if (ret)
+			return ret;
+
+		sources_mask &= ~BIT(pos);
+	}
+
+	priv->enabled_streams &= ~streams_mask;
+
+	if (!priv->enabled_streams) {
+		max96712_fsync_enable(priv, false);
+		max96712_mipi_enable(priv, false);
+	}
 
 	return 0;
 }
@@ -842,6 +1098,104 @@ static int max96712_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+#define to_index(priv, rx_port) ((rx_port) - &(priv)->rx_ports[0])
+
+static int max96712_notify_bound(struct v4l2_async_notifier *notifier,
+				 struct v4l2_subdev *subdev,
+				 struct v4l2_async_connection *asc)
+{
+	struct max96712_priv *priv = container_of(notifier->sd, struct max96712_priv, sd);
+	struct max96712_asc *async_conn = container_of(asc, struct max96712_asc, base);
+	struct max96712_rx_port *rx_port = async_conn->rx_port;
+	unsigned int index = to_index(priv, rx_port);
+	struct device *dev = &priv->client->dev;
+	unsigned int src_pad;
+	int ret;
+
+	ret = media_entity_get_fwnode_pad(&subdev->entity, rx_port->fwnode, MEDIA_PAD_FL_SOURCE);
+	if (ret < 0) {
+		dev_err(dev, "Failed to find pad for %s\n", subdev->name);
+		return ret;
+	}
+
+	rx_port->sd = subdev;
+	src_pad = ret;
+
+	ret = media_create_pad_link(&rx_port->sd->entity, src_pad, &priv->sd.entity, index, 0);
+	if (ret) {
+		dev_err(dev, "Unable to link %s:%u -> %s:%u\n",
+			rx_port->sd->name, src_pad, priv->sd.name, index);
+		return ret;
+	}
+
+	dev_dbg(dev, "Bound %s pad: %u on index %u\n", subdev->name, src_pad, index);
+
+	return 0;
+}
+
+static void max96712_notify_unbind(struct v4l2_async_notifier *notifier,
+				   struct v4l2_subdev *subdev,
+				   struct v4l2_async_connection *asc)
+{
+	struct max96712_asc *async_conn = container_of(asc, struct max96712_asc, base);
+	struct max96712_rx_port *rx_port = async_conn->rx_port;
+
+	rx_port->sd = NULL;
+}
+
+static const struct v4l2_async_notifier_operations max96724_notify_ops = {
+	.bound = max96712_notify_bound,
+	.unbind = max96712_notify_unbind,
+};
+
+static int max96712_v4l2_notifier_register(struct max96712_priv *priv)
+{
+	int i, ret;
+	struct device *dev = &priv->client->dev;
+	struct max96712_rx_port *rx_port = NULL;
+	u32 rx_port_mask = priv->rx_port_mask;
+
+	if (!priv->n_rx_ports)
+		return 0;
+
+	v4l2_async_subdev_nf_init(&priv->notifier, &priv->sd);
+
+	while (true) {
+		int pos = ffs(rx_port_mask) - 1;
+		struct max96712_asc *asc;
+
+		if (pos == -1)
+			break;
+
+		rx_port = &priv->rx_ports[pos];
+		rx_port_mask &= ~BIT(pos);
+
+		if (!rx_port->fwnode)
+			continue;
+
+		asc = v4l2_async_nf_add_fwnode(&priv->notifier, rx_port->fwnode,
+					       struct max96712_asc);
+		if (IS_ERR(asc)) {
+			dev_err(dev, "Failed to add subdev for source %u: %ld", i, PTR_ERR(asc));
+			v4l2_async_nf_cleanup(&priv->notifier);
+			return PTR_ERR(asc);
+		}
+
+		asc->rx_port = rx_port;
+	}
+
+	priv->notifier.ops = &max96724_notify_ops;
+
+	ret = v4l2_async_nf_register(&priv->notifier);
+	if (ret) {
+		dev_err(dev, "Failed to register subdev_notifier");
+		v4l2_async_nf_cleanup(&priv->notifier);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int max96712_init_state(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *state)
 {
@@ -862,6 +1216,37 @@ static int max96712_init_state(struct v4l2_subdev *sd,
 	return _max96712_set_routing(sd, state, &routing);
 }
 
+static int max96712_log_status(struct v4l2_subdev *sd)
+{
+	struct max96712_priv *priv = container_of(sd, struct max96712_priv, sd);
+	struct device *dev = &priv->client->dev;
+	u8 gmsl_link_status_mask;
+	char hdr[64];
+	int nport;
+
+	gmsl_link_status_mask = max96712_get_link_status(priv);
+
+	dev_info(dev, "Deserializer status:\n");
+
+	dev_info(dev, "RX ports:\n");
+
+	for (nport = 0; nport < MAX96712_MAX_RX_PORTS; nport++) {
+		struct max96712_rx_port *rx_port = &priv->rx_ports[nport];
+
+		sprintf(hdr, "\t* RX %d:", nport);
+
+		if (!rx_port->fwnode) {
+			dev_info(dev, "%s Not Configured\n", hdr);
+			continue;
+		}
+
+		dev_info(dev, "%s Link %s\n", hdr,
+			 gmsl_link_status_mask & BIT(nport) ? "locked" : "not locked");
+	}
+
+	return 0;
+}
+
 static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
 	.init_state = max96712_init_state,
 };
@@ -878,8 +1263,13 @@ static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
 	.set_frame_interval	= max96712_set_frame_interval,
 };
 
+static const struct v4l2_subdev_core_ops max96712_subdev_core_ops = {
+	.log_status = max96712_log_status,
+};
+
 static const struct v4l2_subdev_ops max96712_subdev_ops = {
 	.video = &max96712_video_ops,
+	.core = &max96712_subdev_core_ops,
 	.pad = &max96712_pad_ops,
 };
 
@@ -907,6 +1297,10 @@ static const struct v4l2_ctrl_ops max96712_ctrl_ops = {
 	.s_ctrl = max96712_s_ctrl,
 };
 
+static const struct media_entity_operations max96712_v4l2_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
 static int max96712_v4l2_register(struct max96712_priv *priv)
 {
 	struct v4l2_ctrl *link_freq_ctrl;
@@ -917,6 +1311,7 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96712_subdev_ops);
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	priv->sd.entity.ops = &max96712_v4l2_media_ops;
 
 	v4l2_ctrl_handler_init(&priv->ctrl_handler, 2);
 
@@ -953,6 +1348,12 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
 	if (ret)
 		goto error;
 
+	ret = max96712_v4l2_notifier_register(priv);
+	if (ret) {
+		dev_err(&priv->client->dev, "Unable to register v4l2 async notifiers\n");
+		goto error;
+	}
+
 	ret = v4l2_async_register_subdev(&priv->sd);
 	if (ret < 0) {
 		dev_err(&priv->client->dev, "Unable to register subdevice\n");
@@ -960,6 +1361,7 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
 	}
 
 	return 0;
+
 error:
 	v4l2_ctrl_handler_free(&priv->ctrl_handler);
 
@@ -1223,6 +1625,14 @@ static int max96712_parse_dt(struct max96712_priv *priv)
 	int ret = 0, count;
 	u32 dt_val[3];
 
+	if (!fwnode_property_read_u32(dev_fwnode(dev), "maxim,operation-mode", &dt_val[0]))
+		priv->operation_mode = dt_val[0];
+
+	if (priv->operation_mode != MAX96712_TUNNEL_MODE) {
+		dev_err(dev, "Unsupported mode, only tunneling mode is supported currently.\n");
+		return -EINVAL;
+	}
+
 	count = fwnode_property_count_u32(dev_fwnode(dev), "maxim,fsync-config");
 	if (count > 0) {
 		ret = fwnode_property_read_u32_array(dev_fwnode(dev), "maxim,fsync-config",
-- 
2.44.1


