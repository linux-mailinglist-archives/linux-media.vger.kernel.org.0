Return-Path: <linux-media+bounces-24971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49986A16D47
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A3983A1BF0
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944E51E0DD0;
	Mon, 20 Jan 2025 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="EE11+Tuw"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11021079.outbound.protection.outlook.com [52.101.65.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F9B154433;
	Mon, 20 Jan 2025 13:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737379182; cv=fail; b=qihpTssMyKtq8l2QuZdjqJoxE4HpGnhob1Ndx8J+/6jJ+S/pH/JrC/Hk5IPEk14tgYvJrdYUR7uI0XbFCXup1AlEP51OedaE9nKpXMapngkXd8+emwYnMgwAjAnvZDs05ycnyP1bRpH9HquiGA+Fk/CA08OvhJDnbb8JqbrWNZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737379182; c=relaxed/simple;
	bh=hyoy2uv//7IpeyrYauR8awX583409LNNTixDTihhxHo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hxsHTAOvKJp2nJ8+Tx34f1O8rwCpanjysqx3qQf6Crxg2i986mfFIIXn5iO+gwyGyYL0LGRsCmczLgIPa+ocf9Us/7dQVbJe7On/Hqt05zj4tFbNWO4RYwhwVRuJI/KDK8cW2T8fGIcBkXSPlr0/w8tKI1MbuokXClj1Y5SHFno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=EE11+Tuw; arc=fail smtp.client-ip=52.101.65.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GE9SeEiVyTXm/XkuQmDvLzdFVxdP9QyKGDQWM1twYzUkcdjOwn8GBTx1hY1WPyn+0ubAa5Tp08JsiAg9yswOw8LwsAU8Bh9I58ApHwAv5TkzL2v0Cj50TwMy/8fRrtkgxOL5FWb+QUSWL21IRF1FpV9wJqTGD9sNf1dQa+8FNfeWhoK7DZ7iUmtGael5S1wzUh6hQNjy68jLTFqJMUJt5ZOfSr4jPFa329MXtfaliSX2D3Y/8M/ZjZouIk9TeTS0fpGxnbV7OResWxxvyUzXFIelNLJXLutx6RSaUWr4FnYSppuKH2bigTagyBVylH0m1C0BWY6VYTOpPER931j3mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdJJrUxQPRNnFZoLv3pbF0sli8NFy4ZUonVGS3qGXAs=;
 b=ZDcyDkdm/tgsifRS1tOE5iRXDB9iP+3/l7IBjism4FSl437qZ3lF0ciRQQDDcZ9LipOnkJhIRTHhl7xn5VpuT6wnoH3OgYN11WYTv5sUHJu+9EA5D726CZoOkG5RzEUjoMkd8CE9GT33urzCTAAr1LVQ7ssYxE1uMkdwutHZERYk4vWOfix5rtRNfPLPjYtGCBbEU6WZaRLpQ1YoFCO4jW6fa0AQ2O98id6k96qE70s3KSW9Anp6S/Hw5zM7JigH1Nf20JkgWf8y11udv0RHVedpcH+6Zkx3BRv8gfKE1ka16QzjkMFn3I3PmU5zd92xy0bpU4uKYU+JStIYUNJywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdJJrUxQPRNnFZoLv3pbF0sli8NFy4ZUonVGS3qGXAs=;
 b=EE11+Tuwn/IaOxGzl94FKNItWBurSOcSQhyuHludfuLdVn8b1JizhqQGRvQuu/8ziIxWwRljd3Ex4ULgsvN9esWYEmzUoMCgZtdLnTFt53QFnWzzhEqC0hYX+rgO1CVCSnGUVJpVPdOF9BIu+KdMI2veAinyvtYnF2ep7SgD0do=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by FRZPR08MB10999.eurprd08.prod.outlook.com (2603:10a6:d10:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 13:19:36 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 13:19:36 +0000
Message-ID: <e7786653-ecb9-435a-b3e5-c4129b3c8736@wolfvision.net>
Date: Mon, 20 Jan 2025 14:19:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] media: imx415: Improvements for framerate and link
 frequency control
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Gerald Loacker <Gerald.Loacker@wolfvision.net>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250116-media-imx415-v2-0-735263f04652@raspberrypi.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20250116-media-imx415-v2-0-735263f04652@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0040.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::17) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|FRZPR08MB10999:EE_
X-MS-Office365-Filtering-Correlation-Id: a701d2c0-201c-4b0a-d7d4-08dd395515f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0c3MkkyWlo4U2ZvVHhDenpZamhYRkdzMjdka0NaR1lNTWlkb1RHK05QYkRx?=
 =?utf-8?B?Mk5ZeW5ndGd0Mlk1ZEowQ21qZXZIR0JueDJ6UklyNmY2MEl1eUZRWDNNWVNN?=
 =?utf-8?B?Z3I2cVVaZWJzdEFQYlhiWUpTc3B0dTQ2eURDOFVvcU9valJERXBwcWtGUTZi?=
 =?utf-8?B?Q1BMS012cElGZS9SRG8rSDdMZUxvdDQ5aHVqQ0luaFIxYldLWm81cGtTRkNJ?=
 =?utf-8?B?WHByeWtUN1l6amdUNXNYbmZGalZYakZhWUJCcXNNaERFemJUNUlIalpIRWVh?=
 =?utf-8?B?Ynh4dmxGdytZaGUrUmFLUTVuSXlUZmlyZXlzcDR5U3JiUHd2UWdBcENzd1Zn?=
 =?utf-8?B?clVqV29OWTBaMms2ZzUxYVZsTzZqZEZYUTVoaEp3dnNPdjUwd240Vyt4Smt5?=
 =?utf-8?B?eFpwZVVVREljMnlaeTRiS3VJaStYNWVObTRaN29GcEQrT0dGODlqUUhTc3VT?=
 =?utf-8?B?NEg5NmdCQWFoTi9zQmJuK1RLODcxYnNRdUdWUFhwUm9WT0VMQjJIZ3Y0WDJR?=
 =?utf-8?B?bk8xRHkyakRrMEJIOUl5eXlqdk9EZGR2VjRxY1FXdEYrT25TaHFsUDBUSUxR?=
 =?utf-8?B?ZjJYdGpycy9ZWUdUZkhLa08yUzBKaFRMVVRGT2hGVjYxS2poOG9hTHdUQ2F6?=
 =?utf-8?B?QitYSmJKWXVVWlV0blF6VlhuenR3QlVpRy9xTGNuR3h6eFZtUUNqS3pjRFFI?=
 =?utf-8?B?WS9HUHNpZ0ZTVTZVRVRUcGNxaUZ4RkZyNUlrcEY1cENoRndRSEFHaVBhNTZD?=
 =?utf-8?B?RzQySFpIYUhtbkNOWm9uSk9ZZTRlSURDUkZ2dDdZdXJaaVBBZk9rRjNXRlRC?=
 =?utf-8?B?Mm9KUHIvNFpsZmgreFg1c0dRYWsvMmVNbktjQk5BSXdtQmg5QlpiSDhsUU5B?=
 =?utf-8?B?ZnN4ZVErMmhFcHl0T0ZSTXBMOERuMGRUNW5QK3R1cTJIUXZWK1EzbXFzcWZX?=
 =?utf-8?B?RStvK0JNa1dRUjllZkVkdmJ6TmY5VzlmZ09Ga2xvSDJZbVkxeGFTdndFdzRr?=
 =?utf-8?B?Yks1cE9TSHI4ZzJhb1psZjFNNnRHYkJXSTdMSkN0bXpkV1M0V08zY0l6UjRv?=
 =?utf-8?B?OGxrVldxL0JnVWtpZXk1TVljS0hRVm1CYnU1SUNaN0E4OGp1ZWg4bU1ITEEz?=
 =?utf-8?B?MGduS0ZoRU9ZTStKMjNTWnh4QXZPalhzTFB0ZWwyY1pmMHVGUk5uT2hQV0VY?=
 =?utf-8?B?WTlqZW1KbTJ5bnFiZXQ4WWJkakdtbzRPdm5nT0FEdlpYVTVhS2dqNnh4WHBm?=
 =?utf-8?B?eWkxM1E3RHVpblpuS0VzVHlMV0d0SDE1NGlkcTAvTXVlU2x3N05LaFpQYXlD?=
 =?utf-8?B?TE1xV2RaSm9CR0svdUZydXozeTVjdm8rWGlicmNpZk9oS3dZUWtsSTFuNEI0?=
 =?utf-8?B?cFl3TGhsdkFsbVhQNi96WmNXVFAvZVI3b1VIYnJzd0NaVFB0YjY1ODBYdFl0?=
 =?utf-8?B?a2ZrMnZTdER2eXUxeGQ1ZHhkZTNJdDlKTitZdmpUZy9mNm1KNUtPaVpTQ3V5?=
 =?utf-8?B?VXhhRUFna21HamE1RVAwNVhuaVQ0NDA2MnFvOUkwQUZ0TVNKRDBEU0FEdHVy?=
 =?utf-8?B?ekV3QWN6L2cyWlIzazJ0aGxXbkhRbmJrYmEwdlpuelpXampGVHFHc3Y3bkVN?=
 =?utf-8?B?N3p1YjFUMjhUYUdaanZMaCs0dGtWdzVZRCs3WkhLcGoyL3h1RHNiWDJGNTZv?=
 =?utf-8?B?TE5DVjZjN0VIUUppcERKZlZDR0FRM1pqSzliaDlLVzZpaXEwZDcxcDRDVjhI?=
 =?utf-8?B?alptZjB0NlNSSHRXcXcvVStnb3VmTldsMk1ONDEwNjY5VTNDNUZxMHZNMnRD?=
 =?utf-8?B?eXp3UVpXSXpvSmMyck9vTDNmeloyeWc3cjB0eGFwZitWRzArVVREUjlMalRQ?=
 =?utf-8?Q?09DASdyC5IHQe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDZHblZ3ZjZscEQ2TzNLc2pyZTVjOFZGK2o3dGt5bTI2WFc5NlFWYTRiWVFI?=
 =?utf-8?B?bzNWMThWL0xCcFdNeHM2TEJqMlhlZ20rRU5wTmZ5YllCWk9peHZ5aG5DN3Bw?=
 =?utf-8?B?M212MkpMQWs2LzZKdnU0S2hyNlBMUStpaGNObnJycFRGZUlKNWpTelNUQmt1?=
 =?utf-8?B?QWQ0dHJ6cEpJU2ZuV3BBRlhpVFdxNEhTVy9mM0pBUlBZbllhR0VVMXVYcGxG?=
 =?utf-8?B?dWNhVlFuSGhHblZ1VUlZUjN0czhLTkVRS0xrd0VPQ0NWVHZSaE5EYXBOODF2?=
 =?utf-8?B?UDZ5SFZ2MzFNODNna2FlcUVuRzlqMXVZRnBkWDJ5bE9SYmw5VHJudVBHTUEy?=
 =?utf-8?B?NE5PZk5PZDRDNnRIbnZWM3BRdEtJRkFYalc3ZTFrc1h2OWVKVnl6WnNaZEQ2?=
 =?utf-8?B?a0R6NC9seVRkTzZxTEZVVE9hTks3enE1V0phYWdKUTFtZEN6cFZFMjVoeTJq?=
 =?utf-8?B?RlFEdjFFQjFSNkV5dTlqTUE5RGZ0eEFBY1ZsUXlFcGpkT1RqZVlvczQ4T3hP?=
 =?utf-8?B?czhOTUFuRnFYM3ZCSUdsS2V6VkFyb2pCWldpUDAwekhSMDhMd1pPcEdTWWRx?=
 =?utf-8?B?Z2laK1VBYWQ4Vjc4R1Z5V2hteVFaZ1pxK3dFbnErNGRybENuNmh3Q29kamkr?=
 =?utf-8?B?Z1pKdnpNYkJaS3p0bENCU1NueVpoWGZ5NVhpVWc5cHRKcUxzN2oxV1ZxNGdw?=
 =?utf-8?B?WGhnWnFteUNhVUxMaUlRZGg4aVF5TGhLOTF3V0dsNTlYUlJiTDlOQXd5STQz?=
 =?utf-8?B?Yk0xZzlFQWdJU3BieEJMWDNhWEIxM3hyOEJqT2hPUENXKzBaVEV6YmtLektC?=
 =?utf-8?B?MmdFVVMyU0hPc0daV0JEZHZOb2NnUWRLWCtndjZML2s4MUZZN0wzSzlhT2F3?=
 =?utf-8?B?c3FQcGo5UnpXTjNmQWJYaEhqa21hSDhlZnZTVmpUYWMzNVgwRW9XNG56ZEpU?=
 =?utf-8?B?cFFPamJ1THFabW0yd3ZtZkoxa2piQlRUL2l5YUs4OWo3WWdpMmZlelhvWjhC?=
 =?utf-8?B?NGZNMFBSUEpkVXZaMHF0OXkyc25sN0ZjNkhrbjBzdGVvbjMxQ01QRnZzQkZm?=
 =?utf-8?B?Y29scnVqZllPdER5a2pqTFV5SnNEUmNrS2ZsUlFwa0w4c0xJaUJRWnZDYWRN?=
 =?utf-8?B?L2VUeUM2dW1KWGVxaU5zaHhTbXpGTndtek5XZUdFekJhdXoyeTFzNjMwTVFh?=
 =?utf-8?B?K2h1TnJFVEpKV0hUY2JLaEFaaGZEa0lBbVpQUnBIMTNEb3E0SEZudHhBN1Q0?=
 =?utf-8?B?dmthMFF3cm5zSTlwek5RMjBZYlVRT2gxRFhjTWZ5UFhqTmlKbDRsVXZOMzhh?=
 =?utf-8?B?LytPVVNSODhYc3hVM1VFNDdZdVlTa2RKQVd3elFSQXFwU0VxcDlNRG5KbjhH?=
 =?utf-8?B?d3RHM0wvbjBxbUxwL1JGaFFxWVdVbmlBZURlMzlCM1lpVkxTeURUMm8zVXRh?=
 =?utf-8?B?bHRzYWtwUDgwYzgvL0ZYeDh3T24ra1VWSzNhYko3V0hKYWdjZ2RpRTE0SFo3?=
 =?utf-8?B?U2tMYllkWTdYdUd1ZWlZWldSYVBXNDA4aHJ4VklrazNveHpoWmp0RmdLaGY0?=
 =?utf-8?B?dzZaVmJ6Nlp5MjBjTkNLREZiQUlsemxWc0hDZ0c3V3JRZUtENTRVY1RFVWp0?=
 =?utf-8?B?R2NkL1ZVc2lPNlB4aW9MY0pNU1dzbzFTejhrWjJBSnVsMlpsNTR5TFRKTU94?=
 =?utf-8?B?S2dDY0k1V3ppTnhGcHREbnZOSURZcS9XV0xQMnBPZFhjWGdueHZjdm9qNnhS?=
 =?utf-8?B?ZEVWNXNFQmNPRXlUT29VMWlDWFdVU3kvVTI0MEZRUE00RHpLTlRnOFdtOWlv?=
 =?utf-8?B?TEFoSmFmOVAyOUZCTURDSFJZejV5TTJTeGVWU1dKa3hEYjdCZHVRWHdkTWFR?=
 =?utf-8?B?eFRUY0NMcm9lQjhnaG5YS3YvdFVUbDAybWJTQ3ROUlBqT1pheXdIRU4yQlJE?=
 =?utf-8?B?VEE5U2p4ZXJlZTdqSGx6aDl2aHdmUURROXRwM0ZpVVo2Ums2am0rV0lPZFNQ?=
 =?utf-8?B?V2RwZlZKaFFEekZtS2VrRUE5eFJIcXZ4UndpU0FDeGI2RXZLdmM3VHZ3cDBv?=
 =?utf-8?B?WFdaSjBIakszaGlrSjZhYm9EU2pBNkxOc0lVSXhkQ3NxVWZRbWJkYW01cTF3?=
 =?utf-8?B?cjNUalN5ZGVGRFBrY2ZoNzc1bWhCU1duSXFsNjlVMEpUUXJxcGpSV0JRRjRU?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a701d2c0-201c-4b0a-d7d4-08dd395515f2
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 13:19:36.1537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wvzd9v5srobslXHyY7k9HNcHS5iM/lpzLi5UCuGBr3Cu0k98RdCpCu9P+0eTBS4cGjy5986GJzw6uO9baJK3zDhJUzHSZNsY5PVk0upQ+Tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10999

Hi Dave,

Thanks for your patches!

On 1/16/25 18:43, Dave Stevenson wrote:
> The driver was using reverse engineered pixel rates, and had different
> values for different link frequencies.
> In common with the other Starvis sensors (eg imx290), this isn't
> actually the situation, and the pixel array runs off a different
> PLL to the MIPI block, and there is a FIFO between the two.
> 
> It's not quite so simple as HMAX is said to be in units of INCK,
> not pixel clocks. Working through the various modes that appears that
> even that is slightly wrong as it is units of a scaled INCK of
> either 72MHz (for INCK = 24 or 72MHz) or 74.25MHz (for INCK = 27,
> 37.125, or 74.25MHz).
> 
> Rework the configuration so that the pixel rate is fixed, with the
> different link frequencies adjusting the minimum hmax value so that
> the FIFO doesn't overflow.
> 
> Switching between 2 and 4 data lanes also only changes the MIPI data
> rate, so also can be handled by altering the minimum HMAX.
> 
> Once you've got HMAX / V4L2_CID_HBLANK represented sensibly, then
> frame rate control through V4L2_CID_HBLANK and V4L2_CID_VBLANK is
> trivial, so add in frame rate control too.
> Exposure is set in lines (as usual), so amending VBLANK changes the
> range for the exposure control.
> 
> This has been tested on a Pi5 with Waveshare "IMX415-98 IR-CUT Camera"
> module (SKU 28524). That uses a 24MHz clock, so only the 360MHz and
> 720MHz link frequencies have been tested (other frequencies require
> a 27, 37.125, or 74.25MHz clock input.
> 
> It'd be nice to add support for 12bit readout and windowed mode readout,
> but those are a job for another day.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>

Regards,
Michael

> ---
> Changes in v2:
> - Fixed VBLANK fall-through for setting the exposure correctly
> - Sorted the checkpatch complaint over using fallthrough; vs commenting
>   why we're falling through.
> - Corrected HMAX for 891Mbit/s mode. I now have a module with 37.125MHz
>   clock, and have validated that.
> - Link to v1: https://lore.kernel.org/r/20250109-media-imx415-v1-0-366ba6a234ab@raspberrypi.com
> 
> ---
> Dave Stevenson (3):
>       media: i2c: imx415: Add read/write control of VBLANK
>       media: i2c: imx415: Make HBLANK controllable and in consistent units
>       media: i2c: imx415: Link frequencies are not exclusive to num lanes
> 
>  drivers/media/i2c/imx415.c | 182 +++++++++++++++++++++++----------------------
>  1 file changed, 93 insertions(+), 89 deletions(-)
> ---
> base-commit: 94794b5ce4d90ab134b0b101a02fddf6e74c437d
> change-id: 20250107-media-imx415-2df67ae21107
> 
> Best regards,

