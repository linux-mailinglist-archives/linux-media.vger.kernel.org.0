Return-Path: <linux-media+bounces-30772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91177A98070
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 09:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56CCB19412B3
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 07:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF5E26869D;
	Wed, 23 Apr 2025 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nmDgQdHQ"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2052.outbound.protection.outlook.com [40.107.249.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF43819ABDE;
	Wed, 23 Apr 2025 07:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392801; cv=fail; b=bl2TKcPZk434QXkAto74JDBeC83+FrnhcVuSB2/9TU0SX8HsBL1jvHXCUqUCiK5MMQU8uGJsWviXRNSZCIQgjJ0phGR294LGZTAu1N13Qng5g4z6yjR+gW8ZDEZUjku78ywuXuTbgqWDiIsAvD+ITZqsTZfvCl5rvLnxGJgNKOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392801; c=relaxed/simple;
	bh=KN4no3XC6SC/4fOuDKGyZi//UpOxR8+/GlTDOOAzv8g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XeqEovjwdBzG1+8dkVyyI4rcPMTuBkKEcIzQenzJlryksFFXp5FTlC9m6z65RlvkFwO+GINHJv2lmWry5gFP28TInkotY83GuZx2G7dSpGZNLRu/SdzLcX4t4e+jHYzSSCcCtK7k3PQecVN8PhrOidjgc3nk6u3xCBXjWA9iLvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nmDgQdHQ; arc=fail smtp.client-ip=40.107.249.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DumzIGl19tYWzgIL0Fd6L1ncibb8582mxIzSBj0uzaF7YqiT2j2ACoA3Wnn1z1g9m9hOZ6nInCkqrPzc+V3AkFddGXOHmoAnhB+fUQqEa+5u/VrTQvLp62xoF2awKE2vv+CfTpzMJUdZMAC8ad81n2hj/yHAqXUVH9PIyB7fl8V35fi/RhJH9lK88bYpXtQ/8vm055v+AlgEPwLEmynJ+W/SLRsV/QKeCCqM2AG6uQFacdflUOaHrn5pBopDyvRmZH6/uXx6YTZ8IkNpgLGYSMCu9Os3jp3IeucOuK1W7bU3JBPezeBreQwWNDPABuU+PRs1CeghdXXZu3TV4wSQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KN4no3XC6SC/4fOuDKGyZi//UpOxR8+/GlTDOOAzv8g=;
 b=jdzaBGoM5j0wZRGRywvcswRUhOkUus+CqAx9rebw/O7Wbmz3M6qNd7epY4kB2fcSwG4CDyNReEOAKoa6X2jCIDh+ARsL2NubpOwTcKP7sgA9+tTdKZF4SyaHLv/u09j1MaKDwnochyGChFJnfbsTWt3ky6KiHwbKaFJHLyq6KrYbA8GSYuudEt1zE4D2qOXqcrbyPUM0AW1l4lDG4dT+zplRDZlxbViZduyZdj5bxUz681TyQ1k8t16fsHibjqAuAVNWLtSe5WFmJ1mUjzIINTwUUo7gHjO43iVWb92d2Mb2eqfuYfn6RY7ztQJ+horsliBFkOXyNzFRCaWsOgp1+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KN4no3XC6SC/4fOuDKGyZi//UpOxR8+/GlTDOOAzv8g=;
 b=nmDgQdHQe5BO4jOKYmJQQ4XQR34E4yZU7TIcL0qgHqieVom/VvS5gudlfwOyHWcX4srornosrbBSkiE6kx7igV8OevJhbxOF5x8X5cA4Gj1Dyf54vFeXorhKd9gJ+JjcAzP8sTd1eddvglJlWrtufNabjJD6p7ZRLUDOH3i51NRI4ojbbNzbi5OFynHUAYDbzeqEXinOJmsVnKdijKSe21F643Lu20k2D+JJkDhg2KqbXjTuzDg+UGSZyIxV8b3OVzIe3FJ3aOkawTI1+4ghfNB7jcykzIp1O9r6HTgLw6KcyMey+UNcoP6J1STC4tfdV5xRwaUy7GY5dNQJrCLBkw==
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PR3PR04MB7386.eurprd04.prod.outlook.com (2603:10a6:102:85::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 07:19:55 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 07:19:55 +0000
From: Ming Qian <ming.qian@nxp.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Chenyuan Yang
	<chenyuan0y@gmail.com>, Eagle Zhou <eagle.zhou@nxp.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "shijie.qin@nxp.com" <shijie.qin@nxp.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH] media: amphion: fix potential NULL deref in
 vpu_core_parse_dt()
Thread-Topic: [EXT] Re: [PATCH] media: amphion: fix potential NULL deref in
 vpu_core_parse_dt()
Thread-Index: AQHbqyeORd2xcX0G9ky8nH8yp9kKLrOwQIuAgACpEzA=
Date: Wed, 23 Apr 2025 07:19:55 +0000
Message-ID:
 <PAXPR04MB8254E671EFA3C2C4264C548FE7BA2@PAXPR04MB8254.eurprd04.prod.outlook.com>
References: <20250411184356.2910366-1-chenyuan0y@gmail.com>
	 <77ed36f63ec02156d480efebafb80f3af3ea50f0.camel@ndufresne.ca>
 <6a8b96daac4dd37dbe51cdc52052a9af26236de2.camel@ndufresne.ca>
In-Reply-To: <6a8b96daac4dd37dbe51cdc52052a9af26236de2.camel@ndufresne.ca>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8254:EE_|PR3PR04MB7386:EE_
x-ms-office365-filtering-correlation-id: 5b470b45-1438-43fc-e87c-08dd82373f8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VnRxSUJpTVRUdU9TS2RrRjl6dm5DZE5ndXQ1MUIyYzVZVTdhNzZLY1FEd3ZZ?=
 =?utf-8?B?RU5HMUhpNnVCZ211UFlyeURyUEFWUkpvYnlJanFwTmdCd1RmaFhxNzB1MkMy?=
 =?utf-8?B?SlZmbFVFeGtWUzhXcmZGbGJvNUdGTzFvdGdRaXFrYzBZZ1FHMUxSVU85OVFT?=
 =?utf-8?B?MzlyOFRkN1kreTVCTUhIemZ4U1ZtNDZ0S2x5bmVUdGFiTUc5aFVWWHh5SkpQ?=
 =?utf-8?B?WU8wNDg3QmFhdGFCcXZzNDFkWlVzM2xEYTNjRC84L3VVWDVrM1NLbzB2d2tv?=
 =?utf-8?B?QWZpanQ2czd0c1J4QjZ4cjRKaFNRYUl4YW5yQm9yeVVCVUVwMHZuZTZzVVNU?=
 =?utf-8?B?RnBIaGNqT0ZoWnNEVDFYY25pNGl2QUt3TSt5V0ZjUlVXTGZVYlpGdjBEbXJQ?=
 =?utf-8?B?MGZxK3owWWJyMlJIeE5QUS9QWXREQWdnb2k1K255MjRja3R3aDFxK3o4ZEFu?=
 =?utf-8?B?SEw1OE5nb3JPMjZ5V0g5QjNGQ2hNT1dWRDVNVWVPUzdJSnlvNTh1SjBCRC9y?=
 =?utf-8?B?elkva05ob1EwYXZWekdvODI5V3ZoZ1FKbklXUnpMcUNyOXlrdmd4bnA3cWFB?=
 =?utf-8?B?b3RjM1JENFVqcnNiSy9scHR2bFJ0SjIrdGs3TExqaStYMEc2ajFSZzRTL1Qx?=
 =?utf-8?B?aCtiYW56dm42aTlSN0VEMVpKRytGWGVjVHN0MVJhYzAzN3JhZEZ1b2tmbndq?=
 =?utf-8?B?SVhVWXB6bXpRWDNaN21kMFZzUHpwK1pTenhYOFVvT2VJbnh3SU1COVhCdW14?=
 =?utf-8?B?dkxOV05ZSE9Heko3OUg3OGE4R1BwSlR0VmhlS3dCTGg1SUZndjk4dm8yeEtI?=
 =?utf-8?B?TW9DMUtDaDN0czBzSGxSY0QxQWlTeEtTTmpEaHpBajRFS0NiQllZbGc2UjBX?=
 =?utf-8?B?UEloSUJ5V09zNmZRTmFRQmlXbmwxWGtCMExyWkE1K0FSbjBnZGUxNlV3VWFr?=
 =?utf-8?B?MS9XODNGWnp5bDhmbjF3MGpXbFRUc05kYjBjTW5Ja0lZVzNjVVdxbURrMFBL?=
 =?utf-8?B?TCtkMUZOMWJ1d3NUNkc0cC9nVTB2RzBtWFpMQ1lqWnBWUW1ZRVJyYTJPOXJq?=
 =?utf-8?B?Q3R4TUZ5Y2t5dUwwVFdGTG91SnQxUGRlZlpEUDF6RklJRVIzQjNQNi81N1Fw?=
 =?utf-8?B?MENKSHZVcENDdUZTZGs5K3hWTUpYbVRXTnc4N2M0Nkc4ZklNaTIrZHRKK0tN?=
 =?utf-8?B?bmhzNitUTVpBbjhqaSszMzJQZGFqYWw1SEVFWlZPcGR0V2pQc216VDd0c1hn?=
 =?utf-8?B?dGNIcFgzblMzNGF3V0VXR2FvOSs4VTF2R3ZQa2tibmsrS1Axb3RGVGpvT2lt?=
 =?utf-8?B?K2V1ek0xcURyVVgxWW56U1FyNVNoS01UajRUSVZaV1kyQlNDcDNBLzBQcDRl?=
 =?utf-8?B?dDl5OVlGSWpjZElIY3pORGRWWTFUYThHZnlDeHBTb2kzT3pLVlN5NTFwMmN6?=
 =?utf-8?B?YkEvVW51WVVOMWhqMytzNytHRXhsMVp0ZUgwdmJCMEhFbUNvY2xtTEVKN2xx?=
 =?utf-8?B?ZHMzNHd1Q2ZPUHZHVVE1a3B3azY0dm5acG52VXR2WE1SS2thY1ZzVGxXUlR5?=
 =?utf-8?B?TFozT3dEMTZuVFlaWHl2TjNJU3lZczdEdVJSekZZZjJ0emtnYzdtbGppby9m?=
 =?utf-8?B?UGQxQStkOWhJK21WaVZ0ZjBOT1hBZTladkZYR2JiR3NMUUdWandwREx0dDRn?=
 =?utf-8?B?NFJWcnlycFpHYVhsZWxuWC9mYTk1VHNjL1hKb2tzYTNLUjE5b0s1SERXZ0Mz?=
 =?utf-8?B?SFIxcjAxbGRQQTM2Q2tRWHZOUlJrTUY0L05mR1QzdUp0R2lMbWh5cjVKQ09M?=
 =?utf-8?B?RkJuMnN1SitneU1LSWRqODFBamRsQkhaenViMWluNWV3eFBtcm1sUEY0USt1?=
 =?utf-8?B?UDNpWWtiUXZPSzYzUkNEeXNyVjV2SjR2dVREN3VuOFdLdUtXTCs1QUxsWGpi?=
 =?utf-8?B?RGwwYjNXdnIxMFpIaFFyQk9Ub0FuMGx5REJNazRPNTI3NUNNOWhzY0hDTzYy?=
 =?utf-8?Q?i9uGyXXPpsW2ITmG57KaBgjoVD2Dsk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aTVLWGRFYWFCSCtwakVaYkwxY0FzZEVReG1kamk1Z0tGRGU3SWlxR3FVOWJx?=
 =?utf-8?B?UHgyMjRVR0NWRHBhanA3dU1lL2kzdW0wYjBCelFLNzVENE5KNXlCVnp2cUVw?=
 =?utf-8?B?am9jK29BbU1DWG8vbURqQ3F0SmZBV0t5K2JHZ1pzSUxpNnI2eEdMTjFSc0hC?=
 =?utf-8?B?eitqK1EzYTFKUUIzZldrRDdyVzdPaDZhSlg5MmZpK092bXkvenN6WUxTcEZW?=
 =?utf-8?B?bU9xOHM2UlptKzlVYzBXNGkvMTlZN28xNkNjK3ZRK2kxeS9lZldIaEFFS1lj?=
 =?utf-8?B?b0Y0WG12djhaWkZRbUxWVmlnd1BLdENBZVlKdnpHYVRzZWFoQ29wMDBNV0g1?=
 =?utf-8?B?TnFWUE5HOXl1RWJ4dHJCeWtUWkRKNlJiaE9SdGxtYlN6WUtvY1J6OERZVDdL?=
 =?utf-8?B?anhlNFkvVXBNeUdWbmw3TCtpd3BobXhONmJ3Wm1JQ2tqQVhnM3Y3Tk1Od2dv?=
 =?utf-8?B?SWt4Q3VXcCtEbzkrNTdSUUV0eTBjeHZ2KzEwWmVhazQwa1ljei9FQW5iZTN3?=
 =?utf-8?B?em85SFByeExxd3lsMkRNY3BmMUpXNi8xNkdQY1ppNFVORjJvQVFFdmJOME1j?=
 =?utf-8?B?REFRTzhmU3ZEZE0zTzJON1RyazUyUXFaeXRQUVNvUW91c2d4QjBKbWtHZ0x4?=
 =?utf-8?B?RS9USThncUFrUVVvL2NQTXk0ZlFBVGxoUjE1Tkp6WTkydk1BbVBEYVJkUlVT?=
 =?utf-8?B?cTV5UnlBU2gxYkRoYzZWK0lXSWNtNGcxY0Q4OTdjemhqV2J5VjNkOTNLcDV3?=
 =?utf-8?B?TWVmN3hLeDkzYXI3MmlzRmNjODI3MmhVcVhVUS9iUGVGZjNxY0ZBNm1NUlcx?=
 =?utf-8?B?VEVYejdNRnVlb3dROThFSC9BdEFFTndFYS9YTXQ5cVMveVk5c0g3UlVJVEhz?=
 =?utf-8?B?YXBpNlRqcGR0R1JVV0ViQmxiYjJkZWFaUktpZkFySFgwU0MyMms2c2pMemdR?=
 =?utf-8?B?c3MyenFMMmJmZE9oWmRwZ0dyTktqb3hxeHV3UktWNUNGY0I1c21ranFkWUNW?=
 =?utf-8?B?MGl5QnNsYjgzMllJbmlvVUI4dDRBYUFDRlZha3BVTmhWN2svUHpzVXpHdyt6?=
 =?utf-8?B?QWd4by9SQW5xcXd4Y29EZHBNZ0NyS0hFWGRlNFhtVVZFWXBjamZEaXRKaG4w?=
 =?utf-8?B?cmRYQUV1VVlYcFkxenpMdVRrS0kybGhIcXJxUk51MThGczA0Q3pycCsycDlw?=
 =?utf-8?B?eE4zQlhWbGZ5ZHFDZU9nNGFMcW9DeUV1N3g3MDlLMVVhRi9iREpaL2dkWmtY?=
 =?utf-8?B?MEc1REd2ZG9RWjAxa0JYWG5WbG5nbDFHZGVnalVQVkRiNHNkQjRVM0p0d0J4?=
 =?utf-8?B?VEZtVXJiRHhUWEZodHZzWStaVjhteXhrVEhJRmN5RXR3Uk1IUmpROUt4OUJP?=
 =?utf-8?B?d1FSK1lIL3pOYU0vdnRnSC9LTFFVZldNa2FQMk1NZ0lrNENPRFRMVXRtSnk3?=
 =?utf-8?B?eEtVRUh5RHFOcVhKU3FKNmFydUlMeVZyeHRqWlcxaHVRUzdWQ29FN1NsTUhs?=
 =?utf-8?B?L0ZYdU1wMG1Pa1ZoWGQ3aWlGK3lNRDFxLzdEcGczQ2ZtQVp4emNOSHhOYi83?=
 =?utf-8?B?TUNUUXpvWGx3dlZFT29lNU1QeDRmMi9MZkRLLzB3TFdTRVZYNVUvZVhBblFp?=
 =?utf-8?B?OGFwQkpkK1JENzhzREF6cllmWDEvZ0pzRld6aXN5bmhSWG9kaFRuMGowT1JV?=
 =?utf-8?B?NUlacEs0Ulk4dmo2TVF2TzlDaVppUWhPa0VUOWZJOUE4QStYclJ6U1VDVWor?=
 =?utf-8?B?MnZjVlZEUVpzOFB4amZJdCtzS1NXb0JFTVhLRWNLWjhubkhLNWM0NElvaFBp?=
 =?utf-8?B?aDZtd1Y1NlhPUDZ6OFV4R2tmQmZzalQ1UFFCbFVYMGluVENMNldlcTNLSVNF?=
 =?utf-8?B?bjg1YW5EcHJ0dlJ3OE5qZHFzSDBjbUtkdVNaUWJUQyt3N3RMS2kzMWVoZG9u?=
 =?utf-8?B?TFlwazk3bDNGYUpXekRaM1dXL0hQSGtGbVNRZzUybUZLTFUrVzAzY2VybkJI?=
 =?utf-8?B?UkJ3ZEpIcEdNdzFvbURQTVlLZytOR3JrWURBUTNrWm9MMmpGT25NRmZCbzJi?=
 =?utf-8?B?VHhBQ2oxTytGOUF4S0ZTVjhGdHpkL2ZaazJsK1VVU0RWZ3RtS3dDQldLWmlO?=
 =?utf-8?Q?/MZo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b470b45-1438-43fc-e87c-08dd82373f8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 07:19:55.7183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2/30zfUdKigxNAT0ODe+9RXkMHG9LEG+AGoXoMrPLNx0whhPQVfTbRUmGHvjTwCEsR0BgLZIBeO71UDgglgUKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7386

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE5pY29sYXMgRHVmcmVzbmUg
PG5pY29sYXNAbmR1ZnJlc25lLmNhPg0KPlNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMjMsIDIwMjUg
NToxNCBBTQ0KPlRvOiBDaGVueXVhbiBZYW5nIDxjaGVueXVhbjB5QGdtYWlsLmNvbT47IE1pbmcg
UWlhbg0KPjxtaW5nLnFpYW5AbnhwLmNvbT47IEVhZ2xlIFpob3UgPGVhZ2xlLnpob3VAbnhwLmNv
bT47DQo+bWNoZWhhYkBrZXJuZWwub3JnOyBzaGlqaWUucWluQG54cC5jb207IGh2ZXJrdWlsQHhz
NGFsbC5ubA0KPkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcNCj5TdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIXSBtZWRpYTogYW1waGlv
bjogZml4IHBvdGVudGlhbCBOVUxMIGRlcmVmIGluDQo+dnB1X2NvcmVfcGFyc2VfZHQoKQ0KPg0K
PkNhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hl
biBjbGlja2luZyBsaW5rcyBvcg0KPm9wZW5pbmcgYXR0YWNobWVudHMuIFdoZW4gaW4gZG91YnQs
IHJlcG9ydCB0aGUgbWVzc2FnZSB1c2luZyB0aGUgJ1JlcG9ydA0KPnRoaXMgZW1haWwnIGJ1dHRv
bg0KPg0KPg0KPkxlIHZlbmRyZWRpIDExIGF2cmlsIDIwMjUgw6AgMTc6MjAgLTA0MDAsIE5pY29s
YXMgRHVmcmVzbmUgYSDDqWNyaXQgOg0KPj4gSGksDQo+Pg0KPj4gTGUgdmVuZHJlZGkgMTEgYXZy
aWwgMjAyNSDDoCAxMzo0MyAtMDUwMCwgQ2hlbnl1YW4gWWFuZyBhIMOpY3JpdCA6DQo+PiA+IFRo
ZSByZXN1bHQgb2YgbWVtcmVtYXAoKSBtYXkgYmUgTlVMTCBvbiBmYWlsdXJlLCBsZWFkaW5nIHRv
IGEgbnVsbA0KPj4gPiBkZXJlZmVyZW5jZSBpbiB0aGUgc3Vic2VxdWVudCBtZW1zZXQoKS4gQWRk
IGV4cGxpY2l0IGNoZWNrcyBhZnRlcg0KPj4gPiBlYWNoIG1lbXJlbWFwKCkgY2FsbDogaWYgdGhl
IGZpcm13YXJlIHJlZ2lvbiBmYWlscyB0byBtYXAsIHJldHVybg0KPj4gPiBpbW1lZGlhdGVseTsg
aWYgdGhlIFJQQyByZWdpb24gZmFpbHMsIHVubWFwIHRoZSBmaXJtd2FyZSB3aW5kb3cNCj4+ID4g
YmVmb3JlIHJldHVybmluZy4NCj4+DQo+PiBJdHMgaGFyZCB0byBiZWxpZXZlIHRoYXQgaXRzIGEg
Y29pbmNpZGVuY2UgdGhhdCBzb21lb25lIGVsc2Ugc2VudCBhDQo+PiBwYXRjaCBmb3IgdGhpcy4g
QSBjb2xsZWFndWUsIHRoZSBzYW1lIHBlcnNvbiA/DQo+Pg0KPj4gSSBkbyBwcmVmZXIgdGhpcyB2
ZXJzaW9uIHRob3VnaCwgdGhlIGNvbW1pdHMgbWVzc2FnZSBpcyBiZXR0ZXIsIHRoZQ0KPj4gY29k
ZSBpcyBuaWNlci4gSWYgaXRzIHlvdSwgYWRkaW5nIGEgW1BBVENIIHYyXSwgb3IganVzdCBhZGRp
bmcgYQ0KPj4gY29tbWVudCB0aGF0IGl0cyBhIGJldHRlciB2ZXJzaW9uIHdvdWxkIGJlIG5pY2Uu
DQo+DQo+VG8gTWluZyBRaWFuLCB0aGlzIGlzIHRoZSB0eXBlIG9mIHBhdGNoIHRoYXQgSSBleHBl
Y3QgYW4gQWNrZWQtYnkgZnJvbSB0aGUNCj5tYWludGFpbmVyLg0KPg0KPk1lYW53aGlsZSwgdG8g
Q2hlbnl1YW4sIHlvdSBzaG91bGQgZm9sbG93dXAgd2hlbiByZXF1ZXN0ZWQuIE1hcmtpbmcgdGhp
cw0KPnBhdGNoIGFzIGNoYW5nZSByZXF1ZXN0ZWQsIGxvb2tpbmcgZm9yd2FyZCBhIHYyLg0KPg0K
Pk5pY29sYXMNCj4NCj4+DQo+PiA+DQo+PiA+IFRoaXMgaXMgc2ltaWxhciB0byB0aGUgY29tbWl0
IDk2NmQ0N2UxZjI3Yw0KPj4gPiAoImVmaTogZml4IHBvdGVudGlhbCBOVUxMIGRlcmVmIGluIGVm
aV9tZW1fcmVzZXJ2ZV9wZXJzaXN0ZW50IikuDQo+PiA+DQo+PiA+IFRoaXMgaXMgZm91bmQgYnkg
b3VyIHN0YXRpYyBhbmFseXNpcyB0b29sIEtOaWdodGVyLg0KPj4gPg0KPj4gPiBTaWduZWQtb2Zm
LWJ5OiBDaGVueXVhbiBZYW5nIDxjaGVueXVhbjB5QGdtYWlsLmNvbT4NCj4+ID4gRml4ZXM6IDlm
NTk5ZjM1MWU4NiAoIm1lZGlhOiBhbXBoaW9uOiBhZGQgdnB1IGNvcmUgZHJpdmVyIikNCg0KUmV2
aWV3ZWQtYnk6IE1pbmcgUWlhbiA8bWluZy5xaWFuQG9zcy5ueHAuY29tPg0KDQo+PiA+IC0tLQ0K
Pj4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbXBoaW9uL3ZwdV9jb3JlLmMgfCAxMSArKysr
KysrKysrKw0KPj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4+ID4NCj4+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYW1waGlvbi92cHVfY29yZS5j
DQo+PiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbXBoaW9uL3ZwdV9jb3JlLmMNCj4+ID4g
aW5kZXggOGRmODVjMTRhYjNmLi4yNjU2ODk4NzU4NmQgMTAwNjQ0DQo+PiA+IC0tLSBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vYW1waGlvbi92cHVfY29yZS5jDQo+PiA+ICsrKyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vYW1waGlvbi92cHVfY29yZS5jDQo+PiA+IEBAIC01ODYsNyArNTg2LDE4
IEBAIHN0YXRpYyBpbnQgdnB1X2NvcmVfcGFyc2VfZHQoc3RydWN0IHZwdV9jb3JlDQo+KmNvcmUs
IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApDQo+PiA+ICAgICB9DQo+PiA+DQo+PiA+ICAgICBjb3Jl
LT5mdy52aXJ0ID0gbWVtcmVtYXAoY29yZS0+ZncucGh5cywgY29yZS0+ZncubGVuZ3RoLA0KPj4g
PiBNRU1SRU1BUF9XQyk7DQo+PiA+ICsgICBpZiAoIWNvcmUtPmZ3LnZpcnQpIHsNCj4+ID4gKyAg
ICAgICAgICAgZGV2X2Vycihjb3JlLT5kZXYsICJmYWlsZWQgdG8gcmVtYXAgZncgcmVnaW9uXG4i
KTsNCj4+ID4gKyAgICAgICAgICAgb2Zfbm9kZV9wdXQobm9kZSk7DQo+Pg0KPj4gbml0OiBub2Rl
IGFuZCByZXMgYXJlIG5vIGxvbmdlciB1c2VkIHBhc3NlZCBsaW5lIDU3OS4gTWVhbmluZyB5b3UN
Cj4+IGNvdWxkIHVucmVmIHRoZSBub2RlIGVhcmxpZXIsIGFuZCByZW1vdmUgdGhlIHJlcGVhdGVk
DQo+PiBvZl9ub2RlX3B1dChub2RlKSBjYWxsIGluIHRoZSBlcnJvciBjb25kaXRpb25zLg0KPj4N
Cj4+ID4gKyAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+PiA+ICsgICB9DQo+PiA+ICAgICBj
b3JlLT5ycGMudmlydCA9IG1lbXJlbWFwKGNvcmUtPnJwYy5waHlzLCBjb3JlLT5ycGMubGVuZ3Ro
LA0KPj4gPiBNRU1SRU1BUF9XQyk7DQo+Pg0KPj4gSSByZWFsbHkgZW5qb3kgYmxhbmsgbGluZXMg
YWZ0ZXIgY2xvc2luZyBzY29wZSwgZXZlbiB0aG91Z2ggaXRzIG5vdCBhDQo+PiBzdHJpY3QgY29k
aW5nIHN0YW5kYXJkLg0KPj4NCj4+ID4gKyAgIGlmICghY29yZS0+cnBjLnZpcnQpIHsNCj4+ID4g
KyAgICAgICAgICAgZGV2X2Vycihjb3JlLT5kZXYsICJmYWlsZWQgdG8gcmVtYXAgcnBjIHJlZ2lv
blxuIik7DQo+PiA+ICsgICAgICAgICAgIG1lbXVubWFwKGNvcmUtPmZ3LnZpcnQpOw0KPj4NCj4+
IEl0cyBpbnRlcmVzdGluZyB0aGF0IHlvdSB0aG91Z2h0IG9mIGNsZWFuaW5nIHRoYXQgdXAgaGVy
ZSwgc2luY2UgaXRzDQo+PiBub3QgYmVpbmcgY2xlYW51cCBpbiB0aGUgZXJyb3IgY2FzZSBvZiAi
aWYgKHJldCAhPQ0KPj4gVlBVX0NPUkVfTUVNT1JZX1VOQ0FDSEVEKSIuICBBbmQgaXRzIGFsc28g
bm90IGJlaW5nIGNsZWFudXAgaWYgdGhlDQo+PiBwcm9iZSBmYWlscyBsYXRlciBmb3Igb3RoZXIg
cmVhc29ucy4gUGVyaGFwcyB5b3VyIGNoYW5jZSB0byBhZGQgbW9yZQ0KPj4gZml4ZXMgdG8gdGhp
cyBkcml2ZXIuDQo+Pg0KPj4gPiArICAgICAgICAgICBvZl9ub2RlX3B1dChub2RlKTsNCj4+ID4g
KyAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+PiA+ICsgICB9DQo+PiA+ICAgICBtZW1zZXQo
Y29yZS0+cnBjLnZpcnQsIDAsIGNvcmUtPnJwYy5sZW5ndGgpOw0KPj4NCj4+IFNhbWUsIEkgbGlr
ZSBibGFuayBsaW5lcyAoYnV0IHlvdSBhcmUgZnJlZSB0byBpZ25vcmUgbWUgaWYgTWluZyBkb2Vz
DQo+PiBub3QgY2FyZSkuDQo+Pg0KPj4gPg0KPj4gPiAgICAgcmV0ID0gdnB1X2lmYWNlX2NoZWNr
X21lbW9yeV9yZWdpb24oY29yZSwgY29yZS0+cnBjLnBoeXMsDQo+PiA+IGNvcmUtPnJwYy5sZW5n
dGgpOw0KPj4NCj4+IHJlZ2FyZHMsDQo+PiBOaWNvbGFzDQo=

