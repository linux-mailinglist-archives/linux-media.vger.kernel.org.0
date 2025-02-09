Return-Path: <linux-media+bounces-25850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8791A2DF52
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 18:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D94831886503
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 17:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C89B1DFDB3;
	Sun,  9 Feb 2025 17:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jC8OxK2h"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012003.outbound.protection.outlook.com [52.101.66.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9C1EAC6
	for <linux-media@vger.kernel.org>; Sun,  9 Feb 2025 17:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739121799; cv=fail; b=Zf+ghxr7c4tfWvek2iDA6paDJbeh9HSZ2BX+fyWG2TUOH2wTOwcQT9cFD5RxSWaRsrIbQc4LZf4sPAYpOICsO5Dn8zztf6q36GJJxF87Ak4MsGW1Qd00sfBiGouW50Ezuoz1pWtnZrh/9IJm4YvTNSIu3HJr49zltYeARfDWnPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739121799; c=relaxed/simple;
	bh=ODwsa92RFbmtqxRXUYP72PjEtXCXZDRe2WAKzF5xGhI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZDt6fzmGdKEruJlaLOABRH8EMyulKAz6RUNsjwNUHqGdGTPXJtwuMuuYJK/tsvwMySVt7oVQgbohbpgn1umflV/oEe75Cl0WO0/ZgRSQ6o2ODs77qrLeNz4874BfvCHaDjDE42IspT/9N3eIeQm7f/6icvrOA9yce9gQQ9YA8hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jC8OxK2h; arc=fail smtp.client-ip=52.101.66.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9xfeSRFkbliHBMbMwyCyek2+qJeDOgX2FXsEN6bFVx5kJlbNror9dgaHxwLJE3YURRrrOJ6p+Oa3uiLF8fSjikfWAmsL3r0vxSCHybLGt2f4E5TIziDRWIPKk5xXEduo9gnqlhknKw6xJYxmEckdJKZNzGU+y0DavbMSrAX+PWPmh4Tgl1r75rHofzRDF/K1KKZatbCqDtY3Gbdlwv9H0+/6LUes2YyVpiKyK5VQ+eDHjum3LnFVORyjJ2+zJiYuvQHb53m4xqhO+vtg85fkLmkjJ0m5OdLKttYfNHLWSNNa3IQcCjN6pIh5OeSOQciUdz0g0Hnow63o4fn3zdy4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAKLRPejL5wO0nYd/oWAUkNpDvufdcVFxZ0vZA4iVHM=;
 b=mBhh7WaTz2LHrKTFWxL4KvCc1/in0J2tpRNAqpqm3iyU7CgZmG8oxiz2i2/Pxpw+M2UfBVN8Q6SHzCQGYwjN2otFBbixCGJDGDpmhNipzg/GYmIV+hJK8kDr39AzkibKdkZFbAPfAWExGpdSP7S1exUykJh7evdzeBJzqG2YF4R4eLd1sKGfbfw3qyv4s295NIvChEdRUVSqL6ZApEdXIRouwwQ9uMOc1/BbZ5INQnEuS2O5SvvF74DkbsidmgV2YJrQ2sn8l4Yho26D1qwu1MO9AMz1DoY1c2aH3CAz1kIZ1ekOWnRGBEpnqyPnrcTFlufbm9gwoua4p0hmxAX6kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAKLRPejL5wO0nYd/oWAUkNpDvufdcVFxZ0vZA4iVHM=;
 b=jC8OxK2hZduYwAoGUEEDGeCNP7av2OoqsISbs3C8WaSyvp/C9ktYXcOgZ59xrr0I2qbiAe5OiO8jQ/fXp3xTqzg8d0yLNazoriUkv2+L0Ta2F07a/mbfLp9xeVMZgogGhDYtBv35eKE2A1PotsDXZWx52p6ocIs5BOmhDOGRHKdCdLoUzvpoknVhd7Uj5MvYotBt0TP988wsS0ZRkFopti6moz5mXuz+zB4O0PM3XfgHOTdEU1W8Fq69dG70gHA39H1THoYmzDUZ8YxdKuMBXl9H+HC/RiBsGpS81h2SOygp/Ir8bUCbbg+u3x1bKgbnLGc+4ZL0Gkkkn3py0agdyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DU4PR04MB10499.eurprd04.prod.outlook.com (2603:10a6:10:568::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Sun, 9 Feb
 2025 17:23:13 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8422.012; Sun, 9 Feb 2025
 17:23:13 +0000
Message-ID: <e82b0079-bf52-4b04-b33b-4f3495fffa75@nxp.com>
Date: Sun, 9 Feb 2025 19:23:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 10/15] media: v4l: uapi: Add a control for colour pattern
 flipping effect
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
 <20250203085853.1361401-11-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250203085853.1361401-11-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0157.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::26) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DU4PR04MB10499:EE_
X-MS-Office365-Filtering-Correlation-Id: 414facb1-63c0-489d-bcca-08dd492e6efc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?aVlCaktROXBDVzc4cnA2MjlqRVJqWFdVWThOVm40TnZ4U2ZTL25zQUJyYjIv?=
 =?utf-8?B?Tm9wdElKS2E2QnBrVGZkbDR0Y0dNdkt6RXByUzIxSWdxQUV2VzFHQTFDbGl5?=
 =?utf-8?B?Z0hJLysvTEZ3bFNTLy9TS0RaSmJiUzVWbU5MeEtzV2JrTC83bW1jNnhqdjF6?=
 =?utf-8?B?c3RxRjdabTMrMFlsUlc4ZTJmMmNMVmJzcVQ4NnNVU3RhUDZwa21tUEMySXN5?=
 =?utf-8?B?VWlVVEIxWDBJOGx3MjExcHg0bTVaMnlzVVNlaXpReHVTdDU2TEZZQlhDRXM0?=
 =?utf-8?B?OE5MaVBnYkc2RVZBd2lGNmRyd3hMcFI3TzNiYzkyVlJLdE8vTFAvZzQwZUlZ?=
 =?utf-8?B?aEMwbTIyNUx3WktxUUZKSDRMNE1zWmc0RjlpOUNyL3JkeE1sb1RmampqdDVz?=
 =?utf-8?B?UDBWQ0JwYTdFdy80UVJJR0FoMGpTeG8zcDBMQVNaWDRNQWJKZkM2dFI0Vk8v?=
 =?utf-8?B?VjlkTisxREN0UGMwSkRrcElJTllwMjJmbzdEc2x2eU5WUG43VERhNFVweU1z?=
 =?utf-8?B?akJYWUh6WHNhNFM1U2JEQTdQUkxHUGRuVjFvQjRvaVFTZXVJSHF4dUhpYXBX?=
 =?utf-8?B?SDlXUm1SOHZrcWJ3eWMvUFJMQWFldTRDd1k4eHI1S1NWYnF4dVowVUJQV2p3?=
 =?utf-8?B?UjJGR1ZUWkpLakxuT2JINldpWEdpWU41YndOUW1oU2lhTFZGYWhVazlZalkz?=
 =?utf-8?B?QXMveHA1Zm9jUGU4RXZhSEFCR3lpdURrM3N0LzBlZlI2NnA4U1ZzWUVLT3h5?=
 =?utf-8?B?RWFtOUFkTzJiNnFEUUR5NDNxR2RURk9jZ3QyM2FhZ1BNTG05dTY3ZmQwelRX?=
 =?utf-8?B?Sm90K1hSTTZLbEJYS0lIeTQvaGFRODBTYVJUSWVpRGxXd2JyN3hzVUsrUVZN?=
 =?utf-8?B?Slp1a3E5aHlXbDNoQk1vMklnS0Z2Q3k4SEN6SlpJZzE3U0xOblJxMjJ1WUQ2?=
 =?utf-8?B?NGxjNnBVTHdxN1FLaTBjV0cvdUgxbXpQd1JsUUptZ1R5TU5jc1ZWdVRHVWc5?=
 =?utf-8?B?RS9OUExjeWFVaHduL3YvUUdzYkk0ZFBKekUyTHNBSitpVGVuRWs5cGhneFpR?=
 =?utf-8?B?aWhaVkYvTVZzcVVUekExcU9QNkZ2Tlp5M2VRRFdKTmppUEVsWGZrMmFRcWNK?=
 =?utf-8?B?elFXblVXd0VES0dOeWZhcDBqTVVad3lIWnlVbjR6bGo4eitFdFNkRzVqMHRU?=
 =?utf-8?B?cG5tZ2JGY2x6MEpvbEptZ2xQUkRoVFhiK1ZValg1cXg0a1ZXZHN2ME1ZdFdS?=
 =?utf-8?B?bDlyS1hQcXpmR2RxMm5DOTVmSkZiT244TXh2bGlqUW9uYnM5ejc3ei8zYTIv?=
 =?utf-8?B?dk5HWCtJZkRnWExMK083RHZFYmNURXdMclZJK0RqbW1XeVNud0Nwd1kxSmlr?=
 =?utf-8?B?OXB5bFdNMDFiR21CWDNQVkxuTm0zRFlNaVpDd3Zmb01KdWJTdStsWjVXaGNT?=
 =?utf-8?B?aDRxQUl4S0dhVWczVjBuYW92M2dZYjkrMllOK25QWFFxOUZnbGYySW43b2Vu?=
 =?utf-8?B?eC9ZT2RFdjIwditZWjJsOFN5eFZtQnpCK3ZveStUMHpCaHBnc0JZRWl0K2sw?=
 =?utf-8?B?dU93K0NydFhTQnc5QVh3d2hEckk5KzUrWi9wcG9DcUlZRGEvWnZFemlKQlcr?=
 =?utf-8?B?ZHRQQjJmQ0kzajJnMkxVOXk2RFREak0ra0VyL0NaZnBiQmRtcmJialI2OEcw?=
 =?utf-8?B?N1NnMUxmR2VMNkdoQ0FRSWpQTSt2R0VqenJwK1IyS3BpNjVZTnF0R05QN1RQ?=
 =?utf-8?B?eVFFdCt2b0pmY1REMHBFM0pDay9PU090L1AvenU0enlnbFMyUVZpRUNmaUNm?=
 =?utf-8?B?VVZUOEk4MjdWV3VKOG1nMTlxN0tyV2dBRzdLSWRaUWJXYW5sSktMeC9mNllw?=
 =?utf-8?Q?1AozO1imY1Buz?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?a3FONmNoa2J0MFhpYXVrU09takVIejdRN1FWWUx2YkRvY2ZuR3FlNWNXbzFT?=
 =?utf-8?B?dmd2SnphTks5cFpvcEdWSjJuU1FoVjF2OERBU2dkWW52RC90WkE4bnhWa3lE?=
 =?utf-8?B?MEE3K1p0RlNUeGw3TmtWdTJteUloVzRKdGU0ZGlLZ0g4N2diLy9zc1cvV3RQ?=
 =?utf-8?B?VFVJVlJJUE1qMmtVUlFaUGRTQVNaV2VCbmd2UHRraks1SG96MEFuLzI0ZjFP?=
 =?utf-8?B?YTRSM0ZvOEtDUmJ5Mmh0UG55bEFYelhMOStCSzhQcGZLSklhdU1RbklMck5I?=
 =?utf-8?B?eDQzOFFDVVFLakE0eUlZM2ROazVwZzZqcHFjeU93VTBnaTV0UTZxTnRLczBW?=
 =?utf-8?B?c3BMWGhWczZRN0diU2lyQ0FCOUpzcHJjVjUwWXdoQmFaY0V4VldicXRXSU5Q?=
 =?utf-8?B?ck5CMEpZb05kb2FYNEhPQUZoVnU3ZTI2ZnJ3dWpEVStldUZLejNQUjhlQitB?=
 =?utf-8?B?cC9iVlJleGRRSjRkOGVHNHdnRHM3TnRtc250dExHSXZJVHhnTnVBZEJmTXE3?=
 =?utf-8?B?NUJpL3BVeTJHOHJyUkNVOGlyMFJaYTFpMGFFOUVyNjI2T2pGNXhHU29tR3o2?=
 =?utf-8?B?NjhLN2JDY1BDRG5wb0szWmVXb3NJcTNEVFNHVm0vR1ZnYWtWWGVJdTh3U1Uz?=
 =?utf-8?B?Vmx5aE4wUWdnc3o3cXV3cGlwcVZadmJ1aHgzVVhvRENid2pIdzN5V2JRUGZ2?=
 =?utf-8?B?a2V3OVFsM1dLTkRGMDJPS3hSdDBuT1kyWlhFVkxVc2JSMGNkdUJ1T3pDMWVD?=
 =?utf-8?B?TE5NUUExenpWYmY2dXg0V2pYTjgzWGJRUzFmWkoxV2x1VnZFV1ZmY3IxRWN0?=
 =?utf-8?B?VUtVVGpUeVRlZWJ2TEFnTGxXZkc5eXpRUUN4cm44cDM3VDZXTWRNNlNPekNH?=
 =?utf-8?B?Y1YybWMxVHMxWXoraHloNllUTWFsL1NPTzRmR3lPdFluQURuaUdwYjJRY25B?=
 =?utf-8?B?Z1plMUYvWnVsL0dSNEhFcmRnc3FzYmxpOUdxemFKNzFXdHZBNkR6VVhPMzIw?=
 =?utf-8?B?QUdkV1E1cFIzdU01Ky9WTGhra3lubUdEcUYrL21MYmZ2dEtjSUo1VFJDM1hX?=
 =?utf-8?B?aThlV1JvTWp4VjNtR1UyMzlyeGg4c0x0Q2NYUXdwMFNmR3NUYzVxQVgvRDMz?=
 =?utf-8?B?NkN2V3BSdDEwZWRmRXBxWmlMQzZ4clVwMHJYMjlFTGd6Q3BLUEZVUytpMk1F?=
 =?utf-8?B?am40WUYwdlIrSldNR2xGUU1zSHk2WkltcitVWC9taFlRTFdpeTUrU0FMc05w?=
 =?utf-8?B?RlVhSVlTUW5QVng0MEZjWFdKL09YaGJSLzN6NjBKMHlIME90ei90SUZjemdG?=
 =?utf-8?B?RTVaQ1hXbTJ4ZGEvS0pzVWtOWmkzaGtidlpCMmRuUVI4NkJLK2VRV0lWSmMy?=
 =?utf-8?B?REhRVWtvWEFJUy9EOVJhWC9GWDIvY2dtclVQcTJ3a3VabmZ3eHNySUNSTkNF?=
 =?utf-8?B?NXNMNTRhelRlMkwxd2szZkQ3SzBhWUVnZzk2cHI4M1p6WVNHZnVBUUUzTGxr?=
 =?utf-8?B?UllGYnM1cWFzdDF1QVdRaHlpRUhRZ3djd21vU2N6V3pUOVBUdk83OHE0M1lm?=
 =?utf-8?B?NTlLeHZjcmtXRXZzM0ZoZHMxMlBaSURlL0tSL0tiZmZGeFo1RUd3eHBmWHpJ?=
 =?utf-8?B?ZUl5OWRLRUE1Z1IrWmFhdzVsRlppVzNybEpLUldJN1Vhbk9DM2VCdUJCUkEw?=
 =?utf-8?B?WEpsbWxRbjlZRlBTUDJtQUpvVDM4dXB2ajExVk5LQ05DNHFZL1UyaGZ1RWta?=
 =?utf-8?B?ZjVPS0RGdCt2K0s1MUtrUU5EU0dUdEZqcnZxdHkybkVJcVFkM1VhV1hNQ3ha?=
 =?utf-8?B?emJ2Tm1lV3ArS1Vya1B6TVRNS2ZUT2JlM3NTMTJnUkFCNjNQWktRUEJPMEJy?=
 =?utf-8?B?UjRzZ3djUVRqc0I1ZjUyTGJMbkk0T3lFR2FkdGFNUmt4cVgrN0NsMHhvUmtj?=
 =?utf-8?B?U01PcFFwbTFVUS9paU5QczVpNEN4enlGL0VWMVVDVlkxQlAzbnMvR052eVQ5?=
 =?utf-8?B?QmhRbW5neDZacWVYZXRmb2E3cU9KYnJ2MUhIR04xN2lYUmJFUU5sNkhtWTFH?=
 =?utf-8?B?ZVVyNnlPazNUQkFSUDdmZGVJVHJKOXVxMWZ0SzlsRi8ybVJBVU5xSXlBRnZl?=
 =?utf-8?Q?E2HpSoV4KhgLu3+8Rq29i7Jhb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414facb1-63c0-489d-bcca-08dd492e6efc
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2025 17:23:13.6951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sqbhFKyr7Cga1mwAyyJelaqOAEpgtPdLhlXIJI5N5yl2NoIEidLVLNA8Fq8uAD5Z0xR7m3I2SBCTrOfUa570TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10499

Hi Sakari,

On 03.02.2025 10:58, Sakari Ailus wrote:
> Add a bitmask control (V4L2_CID_COLOUR_PATTERN_FLIP) to tell whether
> flipping results in a change in the sensor's colour pattern, separately
> horizontally and vertically. The information is essential for raw formats
> when using generic raw mbus codes.

Is this control really necessary? Are there cases when V4L2_CID_HFLIP 
or/and V4L2_CID_VFLIP is enabled and the CFA pattern does not change?

Could a raw sensor driver be capable of reporting the 
V4L2_CID_COLOUR_PATTERN based on current values of the HFLIP/VFLIP? I'm 
not sure I understood all the aspects of patch #7 (V4L2_CID_COLOUR_PATTERN).

Regards,

Mirela

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../media/v4l/ext-ctrls-image-source.rst          |  8 ++++++++
>   drivers/media/v4l2-core/v4l2-ctrls-defs.c         |  2 ++
>   include/uapi/linux/v4l2-controls.h                | 15 +++++++++++++++
>   3 files changed, 25 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index fca729512b6f..ecfa38c118e3 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -102,3 +102,11 @@ Image Source Control IDs
>       This control may only be used on a V4L2 sub-device.
>
>       This is a read-only control.
> +
> +``V4L2_CID_COLOUR_PATTERN_FLIP (bitmask)``
> +    Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
> +    V4L2_CID_VFLIP) have an effect on the pixel order of the output colour
> +    pattern. Macros ``V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL`` and
> +    ``V4L2_COLOUR_PATTERN_FLIP_VERTICAL`` define bitmasks for both bits. If
> +    either horizontal or vertical bit is set, the readout pattern order is that
> +    of the reversed readout.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 5b6a4a94f18f..3f0704a982b8 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1156,6 +1156,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>          case V4L2_CID_TEST_PATTERN_GREENB:      return "Green (Blue) Pixel Value";
>          case V4L2_CID_NOTIFY_GAINS:             return "Notify Gains";
>          case V4L2_CID_COLOUR_PATTERN:           return "Colour Pattern";
> +       case V4L2_CID_COLOUR_PATTERN_FLIP:      return "Colour Pattern Flip";
>
>          /* Image processing controls */
>          /* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1474,6 +1475,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>                  *max = 0xffff;
>                  break;
>          case V4L2_CID_FLASH_FAULT:
> +       case V4L2_CID_COLOUR_PATTERN_FLIP:
>          case V4L2_CID_JPEG_ACTIVE_MARKER:
>          case V4L2_CID_3A_LOCK:
>          case V4L2_CID_AUTO_FOCUS_STATUS:
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 8e761c38b995..fd6465e9a743 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1215,11 +1215,26 @@ enum v4l2_jpeg_chroma_subsampling {
>   #define V4L2_CID_NOTIFY_GAINS                  (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
>
>   #define V4L2_CID_COLOUR_PATTERN                        (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
> +/*
> + * CFA pattern start shall be aligned with the number of patterns for colour
> + * components. Patterns shall be calculable based on flipping when it affects
> + * the pattern the following way:
> + *
> + * flipped_pattern = native_pattern ^
> + *     ((hflip ? V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL : 0) |
> + *      (vflip ? V4L2_COLOUR_PATTERN_FLIP_VERTICAL : 0))
> + *
> + * where hflip and vflip are the values of V4L2_CID_HFLIP and V4L2_CID_VFLIP
> + * controls, respectively.
> + */
>   #define V4L2_COLOUR_PATTERN_GRBG               0
>   #define V4L2_COLOUR_PATTERN_RGGB               1
>   #define V4L2_COLOUR_PATTERN_BGGR               2
>   #define V4L2_COLOUR_PATTERN_GBRG               3
>
> +#define V4L2_CID_COLOUR_PATTERN_FLIP           (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
> +#define V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL    (1U << 0)
> +#define V4L2_COLOUR_PATTERN_FLIP_VERTICAL      (1U << 1)
>
>   /* Image processing controls */
>
> --
> 2.39.5
>

