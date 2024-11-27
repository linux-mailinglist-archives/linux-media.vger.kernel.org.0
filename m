Return-Path: <linux-media+bounces-22118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D48A49DA03B
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 02:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B471B2393F
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 01:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014308F5C;
	Wed, 27 Nov 2024 01:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Psz/HwRe"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020126.outbound.protection.outlook.com [52.101.156.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7F3C2C8;
	Wed, 27 Nov 2024 01:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732670493; cv=fail; b=kSC6sEmfveGPeE5NW18hLA4ep4ms2f/Z+LENBvtDW2ke1ojJMP5tHhvKhJ9GHb7PXFa6kDVb3j8p/oHbyMB6C1kTpoChbm6xelPejUZJ25K/MwUmijXRIANj9lEM167y9SSf0OW2R7BD1pwOw75C50rYFgcEcSS69JYF8LNO6jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732670493; c=relaxed/simple;
	bh=gH+lSiD0okWo2X+R6uYQbvhzChAW8Kqod8sA1IvmJSU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kYz4tL9XF+RbkuHmj1YVh51zZ3C3dhf2sfqK/VjBP9ZuJiA4fzupNdOflSPs1lrNKamd9q6+U7YYWOEuANpC9tKasKoObCpdvwEL4NIP4GJzDs3RnvjyiQoO1wcH79KAxIqvA3iVQiAmhzP8GSE+2WVjovQAuATMp0Bxi/pgTpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Psz/HwRe; arc=fail smtp.client-ip=52.101.156.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Je21ddj+PbgGo0Q4Q04bLQsdBVLPNh+EVrHfqNfbwT374YMsl4InZy7Kyra94bw/yX6z9ELCiPNjP157pgiiVBZfo5P6rnozy5eL2H3EdzfMW4diSe/ig32f1K7Qs1nst0zVIc6GX7lbdncuHLWOc4+CcqnIfYR3HfNSH7YDJUCepDS8npfjsw/f90uim0mHZiNfZ/OkYwnbQw0xuBfD0InYgBw8c/spfkwGZGoGlzWLeCOJoN131n6bYEoOdZckdzimLanCFayWYbT0QyOXWZeb+wNrZOLPgQnFGnQXrWcdv1jmP+7IhmJKV4pzgBPCOOu5GWzkEobFRJejtolA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gH+lSiD0okWo2X+R6uYQbvhzChAW8Kqod8sA1IvmJSU=;
 b=TJKy6k6HxXkBlpkPIhclWM79JWMAnLGlQd1PdsWXVIE7AkW3LVQbA3oWt1oDEg/DopBBEEXWiMhSWTZiGqFTpQxPLjG/eQq3w/XPSFlKvdtfyIX/mCNlH1UqLpjQVR0PyfbEu+9R54C7OAeuyM3IobReJUAU6FxBvCPyBgs5zgBXe3KEMydro3QaYLRR0/DuXS684SSEdy7RER76T/4WHN/no/Q5Sl5LJCVC0eQ0m3qve/XAWWTUcoBZK0l1IbMO0FH1AwbuHjIbaXDaycJCojDEhLS6ot4ezojcmUBpjZhIr1pkm1b1DA7a40VvDaNlVyfFcCmrUVsKCWdfSUl8DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gH+lSiD0okWo2X+R6uYQbvhzChAW8Kqod8sA1IvmJSU=;
 b=Psz/HwReG/1qWIRkt+HuHWkXEE53refuuXKdQy0l87GZw1WSo0E/9HbbmGxz9ZCPoKCpsGJ058O97RYn88JokYncNSd2JFVvtxlEstYtPcpryWlWyaob43qeSQLrpyprM8iccePKXJlr/UOoEgxG6f1moXg9gKQzYAa+UEIafpw=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB2128.KORP216.PROD.OUTLOOK.COM (2603:1096:301:12d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.13; Wed, 27 Nov 2024 01:21:26 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 01:21:26 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "nicolas@ndufresne.ca"
	<nicolas@ndufresne.ca>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	Nas Chung <nas.chung@chipsnmedia.com>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>
Subject: RE: [PATCH v0 0/6] Improve decoder performance and fix critical bugs
Thread-Topic: [PATCH v0 0/6] Improve decoder performance and fix critical bugs
Thread-Index: AQHbNKi8Lzt8dczWOE+sJokbk7rijbLCuwhAgAaQnACAASBGoA==
Date: Wed, 27 Nov 2024 01:21:26 +0000
Message-ID:
 <SE1P216MB13034044048816599775DCFCED282@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20241112021517.121-1-jackson.lee@chipsnmedia.com>
 <SE1P216MB1303E8E288DCBD1DCA6C07A0ED232@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <20241126080914.o3oidppg4x7rkmgw@basti-XPS-13-9310>
In-Reply-To: <20241126080914.o3oidppg4x7rkmgw@basti-XPS-13-9310>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|PU4P216MB2128:EE_
x-ms-office365-filtering-correlation-id: cbaad653-56ef-49d0-af49-08dd0e81d065
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eGJLUFA3U29iRmxIcE5OWnJQcGtCbzk0T0lOd3FkWTF3bWxXaVM1aHhrcHo2?=
 =?utf-8?B?M0c1KzNRNzZiTFZxcUw5NENrNjZld0t5M2NBWFAxeGxWVzUwTnNoRjY1MzdL?=
 =?utf-8?B?K25ZSkdWZ1ZVR0QzVE5rYm9NdmlmLzF0bXFuSGN6ZWhzSHl0aktVZ0Zjanly?=
 =?utf-8?B?eWZZdkx3QzVKa2NmV1RMQ2NkNmpRVktyOXIzakl4ZWpqOUlXNjRwdDU0a2xv?=
 =?utf-8?B?d25WNzNMU09Ta0MvaSt1OGYwNVVvSVhJZVR3aHNPRkJJSU10MHZoL0VKOThV?=
 =?utf-8?B?b21yTFpmWmJuZVVCS21RK1Y5dUorOUViU2ZBTm5KcVBnQUJOb0EzUHpMa2xF?=
 =?utf-8?B?TWx4bEYvNFRNQlJwWXAycFpLNkV5UDhUaHgxSCtMWXVJU3B2RVZ5WTB4eEZh?=
 =?utf-8?B?QWRVeXBwQ1FnYjh2Yms2cU1iVytaNmE0R244Yk5pV1FmeXVsamRaSU1yY2R1?=
 =?utf-8?B?VFR5cWFlT0tPOEM4UlhOTjAwNEMyVHIxVFZxaFdteTZ2cWNNa3hzRExpOEdk?=
 =?utf-8?B?MGM4RDJQOTN2VjFRTnhZVmtEanNwRnRVRHFqUS9YZ213eGZjNlR0ZWlseDMx?=
 =?utf-8?B?cFVCSjVMdkticHhXdUx1cko4WTlaVllrVVZGYSt0Tm5mamZ2VVc0aDgxSlRB?=
 =?utf-8?B?L280WXhrc2JtOVVvbk03L2RiYW50aWw1Sk03KzdORjc2YU9nb3hpczgzZUV0?=
 =?utf-8?B?b1NrUStjZ1ZjTVRZVkluR1FKT3VPbUdMVjFwQzVwZFVCcjFqVXNybzlxdlpx?=
 =?utf-8?B?ZUx6QUJmRStIam5sMEIwTXFDdDhjdFdkWFlHb3pZaEl4K2dyNkswWlllS25I?=
 =?utf-8?B?VDFMekRlWnc4NmF1RWhWT0RKZ1R6U2toVVR0TFVKQk1SQjFFV29FWEJ5eE9T?=
 =?utf-8?B?dFEwRXYweGtIeDhUcGcxYXhvK3R0MWhjT3VSek04U0I4V1RVNGVIU1lWeDMx?=
 =?utf-8?B?YVZETTFXL1JsaUlVVjdrcEdZYWVIRHZmSnRqSE15MWVqQkVzVTZlcmk2WHVP?=
 =?utf-8?B?c09LaCtmMXdVVnhqcFU5aUw3TWRMZFNPTDJlK0ZIRHlBME9jQWRhS0tFYzRk?=
 =?utf-8?B?bGY3SUlwSE9lL2pjSmRzMU1XWkh5WXBlTjFob1BNQ21KYVB6YVFFWEJsK1VJ?=
 =?utf-8?B?UG10RWpJTzVySXh2RUI5VE5OUnE2SVltQXo2ZGJxdUswYkJyaHI5anhybWFz?=
 =?utf-8?B?MVRVM0hhY09lV216bzZMZjVUaE90bFZRT2VNOVpadGkxUjZtbkVBOVYxZC9B?=
 =?utf-8?B?K1VDL2ZMczJxWTRGSHIrczNhQlY0OVo3V2s2T0tPSGppUzFuZmM4UHpUWTZ2?=
 =?utf-8?B?eDE5SDZrU1VvRjZycVhRSHo4QkcyK3ovaThzcmtUVTRHak5paHEzNEd0YkNi?=
 =?utf-8?B?UkRIWlVnN1g4ZnBxUldVdThNMUJaeitoVzNYaVVETVlORUIwQmpZZFI2QXJp?=
 =?utf-8?B?Z3VzQ1pPMDNuMFN3bUFYUkZQRHkxR0tTczdZVHU1V21CeUZMTi8wbWs2VzBC?=
 =?utf-8?B?d1htbEpzNW9MZ0Rqd3doTWZXcUhyRVY2a0hHVVNQbVBVTG1sTXFvVkRmWS9h?=
 =?utf-8?B?cE5NdnRaUmF3bWtmZExtVGdxb2VzSmwyL3VabFJUcUlhV2tpQWUxTkhORlJQ?=
 =?utf-8?B?RTQ1SVFBT3FZQ1BGMld4SkFkbFZiUXJ4M0dhQ2xWUEhrL015T2Q5Y081emt6?=
 =?utf-8?B?d3o4YzJMOWhTNklJb1Z2RVZSazd1aGJLalc5WUJzWVdZR3JGeEd4djQ5OS95?=
 =?utf-8?B?dTNjMWNyemRZclpaOXZ1TjU3MmtwZE5vSDA1cDE0UCtwWmt0Qld3MWM1N00v?=
 =?utf-8?B?Z3NDYjB2QWdxb0ZqTFRuUngxVnZ0TlVjeGpLN3RhT0pkZnpyTFgxSk80aUUw?=
 =?utf-8?B?aVRrWnJadzhNWnF0WjJjZXNxbE9ta2dLUzNqL0ZRZ1lYZHc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TGlEUXI3SXFETmlPY0Q1NHpYWnZQVDNqSWRpNUFTUHZCczZNby9ya0N5VWVq?=
 =?utf-8?B?YTJYYkQxdXdoakdsN0RqcElJMmVUMWxuRTkrZndyZkJZa3YwT0pPa2daaU5H?=
 =?utf-8?B?WEVYekcyYk9YVUpNS1VJRVNFZDZQdmlhNnJic2hiVENlU25EZ0NZMk15cmk5?=
 =?utf-8?B?bzNpTVNZQmhNNVVNTjJEcGRUL3VrNHFyZiswdklpcmxUUVNMUFhBb01GaHVE?=
 =?utf-8?B?YWROSlArMUJhcFBIV29RNlFGaityQ3F5Z0FnMmZUSnplS0ZPMEZhL3YzelBH?=
 =?utf-8?B?NkJiZDhSdlhrTWN5TnM1YUxUZVlnblpJTzkrQ0p0eEQ3UG1FYXA4eXlLTG16?=
 =?utf-8?B?eHhJUTYyTWFrVmZGd3REaXUzeGtoZ1ZySUw0V01Jdit2ek43UFVSVzViaU1x?=
 =?utf-8?B?QmdSYlQ4eEE5cmFqTkhldGdBelJ2QlIyNE1CU1QrSlk3dUhvbWRuWitiR25C?=
 =?utf-8?B?NkMvV3J5Yk5SNGVVT3dxNWxhRWhKT2R2Z1RZUnpTdHU2TGRyMWNMZ0FKQU1K?=
 =?utf-8?B?WVhzYnpyejh1aHV4dTBSWDZsLzFRRXNscThuY1J6VVdXSU15K2t4eDVDeHBu?=
 =?utf-8?B?SGJoaUw4VmEza0NrbmdUZEd0Tk9aL01YU0UzTEhybFZ4Nk1uOStnck4yNmRn?=
 =?utf-8?B?KzhtY29wSzVNQzRtYS95WHRKNWp0b2RYTTRmelF5RW8wOHBSZElHb2tpcHBr?=
 =?utf-8?B?cWFWT3FOMm9YZkQ5WkNEWElFSmVORmNSU2VhTVIvSnE5Sncxdm9MT2ZIK2Zt?=
 =?utf-8?B?YmFwQ1dHaytVOExxc0tIQzFQRCtQUEczVnRSYW1jbWVXVXFjeG1laE1vQUpV?=
 =?utf-8?B?N2JWR0N6Z1JiYTZjdk9CTzV6VmlkSmJ4RWtHa0I2aGd5MzgvU0FtZktGU1ll?=
 =?utf-8?B?cUhIWmROTUhxRU9xYWJRQU80OWlFQkZTZjd4L1JWSng2NnVEMDNiSjB1cWZ0?=
 =?utf-8?B?ZXJrODlxVGpscFVoR3I5VGF0UEhFa1pBT2UyNlhkRGd0N3RwVFloS09jOTZi?=
 =?utf-8?B?M0lLODVobStwMzZCRkVHVlRlMEM1YjNXNEozbG5ZMEVOZ3lsWDJhRzQ0Yko3?=
 =?utf-8?B?cGdlcmYxQldldHFpWENhcHlYNGlUaXJ3SVdtRlJqbk1nQ0xCN0M2NUMxMkFL?=
 =?utf-8?B?bnhzTEtxQ1JPNnp5R1dFZHdqTEc0ejRMcWlra0lIRUo2WnZlNGhIcDdmRmc1?=
 =?utf-8?B?UmJiNWpsSjMwSmYzMFhzZlZUSE05VVVxbHJJY1E5Ym0ybHpuNjV6V1p3bHo3?=
 =?utf-8?B?S2dTUWxTYWRxVkFRdi8zMXQ3Sk1XSEw4NmlyeXpQZ3BqV0NTZU82MVA5NUhH?=
 =?utf-8?B?aXNISmlXRUhqblNNazlnK1FHUlRsaGd0VE41dHNXamxmYWFXZzVheXlOY0dU?=
 =?utf-8?B?dE5lOWpQNEtwUlFnWG8rRThGNDV4dDVLcTB2UE9vdFZLY0dJdkZKRDNpY21I?=
 =?utf-8?B?c0lQaVpUZnFld3U5aFdPSm90azM5U1VvcVRNdjZoWUhLalZDMi9tYURBd2Va?=
 =?utf-8?B?L0w5ZjVJZ2hCVE1icFlETmc2U1J5b1ljK0kwUGZxRkhYSFpXU1Q0dHluVWFT?=
 =?utf-8?B?UEIxM2dEdmQ5K2x1bDJad3JmZ2JLdXJqVDBrSlpWV2N5OU41c280WlhKUmRj?=
 =?utf-8?B?eU5NNURsTjlmM0o1cUU0aGltVTF2em01OHpGN0ZwOHB6QlVLUnpNWHhQNjNO?=
 =?utf-8?B?b216R1g3QnYwaFNBZWZEcWVydHRVMm9XSElMbWJVVHNXb1B3SXNmUjRDM0Fm?=
 =?utf-8?B?Yzh5RFV0SWxXTGZmNUc4TWFJUVlUSzVrU1F1SWM1bFdBSG9LbE1yQ3QxZFlo?=
 =?utf-8?B?MGtqVUZ1anB1b3FQUTE3aXJHWklMWm5EcktnaEFhd2ZpeFhCWk9FQmFyVEZ1?=
 =?utf-8?B?TXpUcGNGZ1lLeGRRWCtBTWg0VWx3R2JERjV0NWI1SE9ZellKUHh1UmowbzVx?=
 =?utf-8?B?b0E4UktQTkFRVWRGcFRzWFp2eVArMnNaV0NVbDdhV1BPejdYM1RSUXkxZHla?=
 =?utf-8?B?eDArdlVBOUN1bkRXcGZKZE50UHJWTmhLZ29ZcEhjV1lTT0ZuNkF2K0J6VXd0?=
 =?utf-8?B?cUx5RnpZSHRSNjlESzkra3hRY0EvbHNSbzBxTXNlaVNjMjdUOW9OMys2NWRF?=
 =?utf-8?B?TllFaVN3NllveWQyQjljL2ZMMk9ybEhmZGJJam9NaVZhVCtWYlVaWG5aZllZ?=
 =?utf-8?B?QWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cbaad653-56ef-49d0-af49-08dd0e81d065
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 01:21:26.6112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zi9npB1w82EMG/4jyLDA7iCynOMBTAwvPm6qFg1QkkgfolV+aiAVn8lQ1STv7JtniBVa87cRqYCAI8/5yGkEh0evpzSR+3khVWOW7+B7EW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2128

VGhhbmtzLCBTZWJhc3RpYW4NCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IHNlYmFzdGlhbi5mcmlja2VAY29sbGFib3JhLmNvbSA8c2ViYXN0aWFuLmZyaWNrZUBjb2xs
YWJvcmEuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAyNiwgMjAyNCA1OjA5IFBNDQo+
IFRvOiBqYWNrc29uLmxlZSA8amFja3Nvbi5sZWVAY2hpcHNubWVkaWEuY29tPg0KPiBDYzogbWNo
ZWhhYkBrZXJuZWwub3JnOyBuaWNvbGFzQG5kdWZyZXNuZS5jYTsgbGludXgtbWVkaWFAdmdlci5r
ZXJuZWwub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBodmVya3VpbEB4czRh
bGwubmw7IE5hcyBDaHVuZw0KPiA8bmFzLmNodW5nQGNoaXBzbm1lZGlhLmNvbT47IGxhZmxleS5r
aW0gPGxhZmxleS5raW1AY2hpcHNubWVkaWEuY29tPjsgYi0NCj4gYnJuaWNoQHRpLmNvbQ0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYwIDAvNl0gSW1wcm92ZSBkZWNvZGVyIHBlcmZvcm1hbmNlIGFu
ZCBmaXggY3JpdGljYWwNCj4gYnVncw0KPiANCj4gSGV5IEphY2tzb24sDQo+IA0KPiBPbiAyMi4x
MS4yMDI0IDAzOjU0LCBqYWNrc29uLmxlZSB3cm90ZToNCj4gPkhlbGxvIFNlYmFzdGlhbiBhbmQg
Tmljb2xhcw0KPiA+DQo+ID5DYW4geW91IHJldmlldyB0aGUgZm9sbG93aW5nIHBhdGNoID8NCj4g
DQo+IEN1cnJlbnRseSBvbiB0aGF0IEknbGwgdHJ5IHRvIGdpdmUgeW91IGFub3RoZXIgdXBkYXRl
IGJ5IHRoZSBlbmQgb2YgdGhlDQo+IHdlZWsuDQo+IA0KPiA+DQo+ID5UaGFua3MNCj4gPkphY2tz
b24NCj4gDQo+IFJlZ2FyZHMsDQo+IFNlYmFzdGlhbg0KPiANCj4gPg0KPiA+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBqYWNrc29uLmxlZQ0KPiA+PiBTZW50OiBUdWVz
ZGF5LCBOb3ZlbWJlciAxMiwgMjAyNCAxMToxNSBBTQ0KPiA+PiBUbzogbWNoZWhhYkBrZXJuZWwu
b3JnOyBuaWNvbGFzQG5kdWZyZXNuZS5jYTsNCj4gPj4gc2ViYXN0aWFuLmZyaWNrZUBjb2xsYWJv
cmEuY29tDQo+ID4+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4+IGh2ZXJrdWlsQHhzNGFsbC5ubDsgTmFzIENodW5nIDxu
YXMuY2h1bmdAY2hpcHNubWVkaWEuY29tPjsgbGFmbGV5LmtpbQ0KPiA+PiA8bGFmbGV5LmtpbUBj
aGlwc25tZWRpYS5jb20+OyBiLWJybmljaEB0aS5jb207IGphY2tzb24ubGVlDQo+ID4+IDxqYWNr
c29uLmxlZUBjaGlwc25tZWRpYS5jb20+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCB2MCAwLzZdIElt
cHJvdmUgZGVjb2RlciBwZXJmb3JtYW5jZSBhbmQgZml4IGNyaXRpY2FsDQo+ID4+IGJ1Z3MNCj4g
Pj4NCj4gPj4gVGhlIHdhdmU1IGNvZGVjIGRyaXZlciBpcyBhIHN0YXRlZnVsIGVuY29kZXIvZGVj
b2Rlci4NCj4gPj4gVGhlIGZvbGxvd2luZyBwYXRjaGVzIGlzIGZvciBpbXByb3ZpbmcgZGVjb2Rl
ciBwZXJmb3JtYW5jZSBhbmQgZml4DQo+ID4+IGNyaXRpY2FsIGJ1Z3MNCj4gPj4NCj4gPj4gdjRs
Mi1jb21wbGlhbmNlIHJlc3VsdHM6DQo+ID4+ID09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+
Pg0KPiA+PiB2NGwyLWNvbXBsaWFuY2UgMS4yNi4xLTUxNDIsIDY0IGJpdHMsIDY0LWJpdCB0aW1l
X3QNCj4gPj4NCj4gPj4gQnVmZmVyIGlvY3RsczoNCj4gPj4gICAgICAgICAgICAgICAgIHdhcm46
IHY0bDItdGVzdC1idWZmZXJzLmNwcCg2OTMpOiBWSURJT0NfQ1JFQVRFX0JVRlMNCj4gPj4gbm90
IHN1cHBvcnRlZA0KPiA+PiAgICAgICAgICAgICAgICAgd2FybjogdjRsMi10ZXN0LWJ1ZmZlcnMu
Y3BwKDY5Myk6IFZJRElPQ19DUkVBVEVfQlVGUw0KPiA+PiBub3Qgc3VwcG9ydGVkDQo+ID4+ICAg
ICAgICAgdGVzdCBWSURJT0NfUkVRQlVGUy9DUkVBVEVfQlVGUy9RVUVSWUJVRjogT0sNCj4gPj4g
ICAgICAgICB0ZXN0IENSRUFURV9CVUZTIG1heGltdW0gYnVmZmVyczogT0sNCj4gPj4gICAgICAg
ICB0ZXN0IFZJRElPQ19FWFBCVUY6IE9LDQo+ID4+ICAgICAgICAgdGVzdCBSZXF1ZXN0czogT0sg
KE5vdCBTdXBwb3J0ZWQpDQo+ID4+DQo+ID4+IFRvdGFsIGZvciB3YXZlNS1kZWMgZGV2aWNlIC9k
ZXYvdmlkZW8wOiA0NiwgU3VjY2VlZGVkOiA0NiwgRmFpbGVkOiAwLA0KPiA+PiBXYXJuaW5nczog
MiBUb3RhbCBmb3Igd2F2ZTUtZW5jIGRldmljZSAvZGV2L3ZpZGVvMTogNDYsIFN1Y2NlZWRlZDoN
Cj4gPj4gNDYsDQo+ID4+IEZhaWxlZDogMCwgV2FybmluZ3M6IDANCj4gPj4NCj4gPj4gRmx1c3Rl
ciB0ZXN0IHJlc3VsdHM6DQo+ID4+ID09PT09PT09PT09PT09PT09PT09PQ0KPiA+Pg0KPiA+PiBS
dW5uaW5nIHRlc3Qgc3VpdGUgSkNULVZDLUhFVkNfVjEgd2l0aCBkZWNvZGVyDQo+ID4+IEdTdHJl
YW1lci1ILjI2NS1WNEwyLUdzdDEuMCBVc2luZyAxIHBhcmFsbGVsIGpvYihzKQ0KPiA+PiBSYW4g
MTMyLzE0NyB0ZXN0cyBzdWNjZXNzZnVsbHkgICAgICAgICAgICAgICBpbiA2Ny4yMjAgc2Vjcw0K
PiA+Pg0KPiA+PiAoMSB0ZXN0IGZhaWxzIGJlY2F1c2Ugb2Ygbm90IHN1cHBvcnRpbmcgdG8gcGFy
c2UgbXVsdGkgZnJhbWVzLCAxIHRlc3QNCj4gPj4gZmFpbHMgYmVjYXVzZSBvZiBhIG1pc3Npbmcg
ZnJhbWUgYW5kIHNsaWdodCBjb3JydXB0aW9uLA0KPiA+PiAgMiB0ZXN0cyBmYWlsIGJlY2F1c2Ug
b2Ygc2l6ZXMgd2hpY2ggYXJlIGluY29tcGF0aWJsZSB3aXRoIHRoZSBJUCwgMTENCj4gPj4gdGVz
dHMgZmFpbCBiZWNhdXNlIG9mIHVuc3VwcG9ydGVkIDEwIGJpdCBmb3JtYXQpDQo+ID4+DQo+ID4+
IFJ1bm5pbmcgdGVzdCBzdWl0ZSBKVlQtQVZDX1YxIHdpdGggZGVjb2Rlcg0KPiA+PiBHU3RyZWFt
ZXItSC4yNjQtVjRMMi1Hc3QxLjAgVXNpbmcgMSBwYXJhbGxlbCBqb2IocykNCj4gPj4gUmFuIDc4
LzEzNSB0ZXN0cyBzdWNjZXNzZnVsbHkgICAgICAgICAgICAgICBpbiAzMS44MDggc2Vjcw0KPiA+
Pg0KPiA+PiAoNTcgZmFpbCBiZWNhdXNlIHRoZSBoYXJkd2FyZSBpcyB1bmFibGUgdG8gZGVjb2Rl
ICBNQkFGRiAvIEZNTyAvDQo+ID4+IEZpZWxkIC8gRXh0ZW5kZWQgcHJvZmlsZSBzdHJlYW1zLikN
Cj4gPj4NCj4gPj4NCj4gPj4gSmFja3Nvbi5sZWUgKDYpOg0KPiA+PiAgIG1lZGlhOiBjaGlwcy1t
ZWRpYTogd2F2ZTU6IEZpeCB0byBkaXNwbGF5IGdyYXkgY29sb3Igb24gc2NyZWVuDQo+ID4+ICAg
bWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogQXZvaWQgcmFjZSBjb25kaXRpb24gZm9yIGludGVy
cnVwdA0KPiBoYW5kbGluZw0KPiA+PiAgIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IEltcHJv
dmUgcGVyZm9ybWFuY2Ugb2YgZGVjb2Rlcg0KPiA+PiAgIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2
ZTU6IEZpeCBNdWx0aXN0cmVhbSBEZWNvZGUgSGFuZyB3aXRoIG5vIElSUQ0KPiA+PiAgICAgUHJl
c2VudA0KPiA+PiAgIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IEZpeCBoYW5nIGFmdGVyIHNl
ZWtpbmcNCj4gPj4gICBtZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1OiBGaXggdGltZW91dCB3aGls
ZSB0ZXN0aW5nIDEwYml0IGhldmMNCj4gPj4gICAgIGZsdXN0ZXINCj4gPj4NCj4gPj4gIC4uLi9w
bGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS1oZWxwZXIuYyB8ICAgNiArDQo+ID4+ICAu
Li4vcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtaHcuYyAgICAgfCAgIDIgKy0NCj4g
Pj4gIC4uLi9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHUtZGVjLmMgICAgICAgICB8IDQxMCAr
KysrKysrKysrKy0tLS0tLS0NCj4gPj4gIC4uLi9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93
YXZlNS12cHUuYyAgICB8ICAyMyArLQ0KPiA+PiAgLi4uL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dh
dmU1L3dhdmU1LXZwdWFwaS5jIHwgIDExICsNCj4gPj4gIC4uLi9wbGF0Zm9ybS9jaGlwcy1tZWRp
YS93YXZlNS93YXZlNS12cHVhcGkuaCB8ICAgNiArDQo+ID4+ICA2IGZpbGVzIGNoYW5nZWQsIDMw
NSBpbnNlcnRpb25zKCspLCAxNTMgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IC0tDQo+ID4+IDIu
NDMuMA0KPiA+DQo+ID4NCg==

