Return-Path: <linux-media+bounces-16766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F38995EBA2
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 10:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 270C22811DA
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 08:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283CF13B792;
	Mon, 26 Aug 2024 08:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="EiNiMYrz"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2116.outbound.protection.outlook.com [40.107.249.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFE213A250;
	Mon, 26 Aug 2024 08:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724660356; cv=fail; b=NQkW/oFZ1HnlAcCblltquot2oVQexDVwrx3eqoAsQESN910ESLWjgl8ymkFjZXBjzs6HJR6AJMWP6fv4aM/r67CWwdx9Z/Zc/kahJuv11QUZfWVU161QgZPslOApt88uHK+NtejhPE3j+2UZoGHIUXgs0zXgbh2smzl7my+983s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724660356; c=relaxed/simple;
	bh=SP3rup1PpOg0UaUfywMrjEVgXu3fB8nCjdZPKW0ctbw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IJtbuPU4iC5tK4jJ8/wo5ndaK3Eo4IZzAls2/hnxUNn88dA5cSYRWkDiqLNz7mA1g2ritnMt4nlMLcbD0h9ZsR6Ety9VyxLrvQ+qkH99Y977e4lo2qgWelNOcm3kUrkqPi61fgV0BA54RVB+2XWqivITfdGWHZhfrtOJ+JUBt28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=EiNiMYrz; arc=fail smtp.client-ip=40.107.249.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vohaknNAZ3vm3P49l/DC3AiNVihfCdRDlcfZBFqcFtokoLubr3jaJumNdKz9ohrykO0ZBKcfhOxGO9Pd+I/u5ITdPTjbO7c0r/PivsXrmCy4gjji3nMHF3Gc5CYwpOAqyoTkj6EUG393T6+bBCXm4HX2Z3oTnhEMpcx96ojaXQ/7ZG0eYpG613zIkL3LZwg7JWKsYSTSu/RP+VnnxxmwC+OyO3avpxXwTR/DbrR8IRWDi40qISlEP8aR5QgIbtSEqqDnyF9MF/Y4BLUSFj0WnOCM8hnbHIQFT3T4Py+4g4cXxvvvnD+DEEEexR1zToxMdy7Z8Yb79ovupVJJ5O2Zxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmR/ZQR6vuw6/ni709UpzzhB/mUS6BOHASGTcZv9W3g=;
 b=P02lsD0Bb9Va1WXUm74DJTh1PzdTUC5l1XojLIpKK4lzdH5l8qfPlnuGvMkR+8JplnF8BZ1LAWeqGXWNAj4TBPREciDhkwqxBYHxBI+BOJOb1OiARmbopgFSCrJQI8KAc0shZDzB7n6bfKDQ/sZXVXYPQ3sEbTtLZamoHq0ZudCm4II6W6H32wjUC3J8l1D4Rq/ZwrkwM2bvVSS252YEWV4cVPeBqzF0zj1cXJDFNs6ZXnUH872ujJT1peiXYFRj68ZLmv03QL8fnssCNx0nHoVBdsqe3fEWaxed1vURbdbOGCQ9Mxos8YfvfM+NdfQcpCVWRMEF0m8lnoMt0P8fVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmR/ZQR6vuw6/ni709UpzzhB/mUS6BOHASGTcZv9W3g=;
 b=EiNiMYrznwbJk2lGfXbMH0pQw9W8rBqhiW5BHy2HGxPS25QYQLHQhpCq2OGAcs1GUsc+hCQrBiYALqK5mYwTd6AfYpDNYsqW+WhvPZqFVVHvmvWQz2fBw25LzW5GSoXi3vNBbfvsdEdD39I0OFoFjJsfYV2a/loFLfdtFpycE/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS1PR08MB7539.eurprd08.prod.outlook.com (2603:10a6:20b:483::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Mon, 26 Aug
 2024 08:19:10 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%4]) with mapi id 15.20.7918.012; Mon, 26 Aug 2024
 08:19:10 +0000
Message-ID: <cf8c1764-7721-4a5a-8012-b62ead4e2e57@wolfvision.net>
Date: Mon, 26 Aug 2024 10:19:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: media: Document bindings for HDMI RX
 Controller
To: Shreeya Patel <shreeya.patel@collabora.com>, heiko@sntech.de,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <20240719124032.26852-3-shreeya.patel@collabora.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20240719124032.26852-3-shreeya.patel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0218.eurprd08.prod.outlook.com
 (2603:10a6:802:15::27) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS1PR08MB7539:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9dda3c-621a-4415-70a7-08dcc5a7c331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlZBUFdOeW5VWEFNVSsydWcxcEJaQncwRUxTU2ExSnQ3bWxhZXN5aWFvbW4x?=
 =?utf-8?B?YVFrTUIzMHFMSm1pUnRsZy9ZcWE3cUN1ZGJNVExXYi9qUUo3WUUvWUt6YzBD?=
 =?utf-8?B?eDBOQ25pOGxhUVI1dVloeEljYVpWbWZEZ1k0QTgzaWFaODZ2ZlRJVHR0OE95?=
 =?utf-8?B?RnY1T2ZZMkMxNmhKd2VxQU8rRERaK3c5WUFYL2xnWnJXSjZiTSt2K1Bwell5?=
 =?utf-8?B?QTJDb0Y5VHJpZlNwWjlYTHlzbXJiNzVpWDVCVGdGVWplUzhSNmJGV0pHcksy?=
 =?utf-8?B?ajlqS3llTzFLRi9Zbi9jN0NyM3RaM2NGTUpCeURBQnQ0djJab3orS2NOaFVr?=
 =?utf-8?B?L1JOSTE4RkI3T3owbGpmZkhzMnhEa3JyUVBKWnlzbFUydGhhbSs0OHQrclBh?=
 =?utf-8?B?dmx3MXc5bWtVdTVlakpyeXNMTnVqS0VFcUtpU0U1T1lOZlJGeHhGRVBJOGhJ?=
 =?utf-8?B?eDNLNzhmNGR4U2wwSUVTbGdBdWpybXhjQ2ErY0htNmtpRkpPM1AveGVSZ3BM?=
 =?utf-8?B?RFYvM2lKdlFnNHdMdmdQWnc5Z0dpVnNNWE5OcE9ySVpwWDZRaUZGS25RQmRT?=
 =?utf-8?B?M2FWTmszV3A0WXhReEhjRHZyK3BQQzBlZFJDL1IvMGt4eEJOdW9MOWNXZzdo?=
 =?utf-8?B?UzVpS0ZMa3QwcS8xZEVzV2RrOWI2UktXUWRlUUViYkdmeWtVaXh3RXVZSFFm?=
 =?utf-8?B?TGw3ZjdZNHEvNCtLcEQveDU4UzhYWnEyVmI1UDhCYjJ6N3hiOW9tQUdSNTQw?=
 =?utf-8?B?bGRkMHJ1anVEaVBqRUtaaUszZ0xkdjBRQjd3M0FjWXp3ZW5sRmpheEZWV2VO?=
 =?utf-8?B?N21mS0RYZUlIV3BFNi9SRDJQSDExV3B4WENTWGtRM2ROV2lnWG9FSHBjeXpZ?=
 =?utf-8?B?VkhFdDU5QnRRRFVFV295LzJrbjVQN3VHV2lSTXlEMU9OSEh1NWVtcU1BeFhH?=
 =?utf-8?B?bDllckcwTWF0SXhnVVlDZFlWUHhYNlBCdVZ5SUtkeVBRR0ZWR3kxUUFibHZG?=
 =?utf-8?B?M2s4R3pKa1gvMU1jWHRWVEUyOGFBeDJKWGZTWVIxTjJ3NE94ejc0dzRIR3pm?=
 =?utf-8?B?WEtkTjkydjFPNDUwNXhtVGlGUkN5dnZwUkxaVk9DQ1lueHdaZXQ4SlNVaXhJ?=
 =?utf-8?B?WmVwK2R1Rko0bi8zeDhvRWJpdk0rNmVZak9qRUxDdlhqNWQ1UDM5VW9PSjI5?=
 =?utf-8?B?QTA0R1I4Y1BDR1lKYnl0Z1A0M3ArN1U4ZTNITlltVWg5WUZHQmFWaFVYT0JN?=
 =?utf-8?B?MjNyUXowZTJlSEVOdlZvZEM0aEFKMFhKYTYxaFpXS0pjbVhDb2dpMjlJd3cr?=
 =?utf-8?B?aGYyYTJhNkdIcGpOa1NVUFFQUGZwZzRyYkpWN2pWd2ZTbTZaaUd5bXluc2pt?=
 =?utf-8?B?b3h1VGRuVHpValNBVmdySXh6K2I0aGxTYTJtMElkQlgwVzE5Qi9mMXZLLzkx?=
 =?utf-8?B?SkRma1hocEYyelpzNVJZdHU3aXF4NTk1RHNjYWR1NHl6NlY3OXVOdE5GYjE5?=
 =?utf-8?B?VFA0Z1M3TERYWWUxTnF6blRvWmJTMGVzVS9ub1NleXpZUERIa1I3dDNobGJz?=
 =?utf-8?B?bjQyWnNDSm10cXNTaDdqMGIxMjg1TlFPTnZMRStFeXRYUFZwTTN0ZG5yeWQ3?=
 =?utf-8?B?M3BRSVBzSUE4Q1ZxZEp5bXEyd2YrNk53U1ZpS3ZOK3p4NnQ3Z0FCMStwUVJP?=
 =?utf-8?B?TVgybUVTNEg2UlE5L1JnUFhuZTZYRkZXREJIeVNtbVNWU1dJb2ErU0xEcHRK?=
 =?utf-8?B?VW9RcnZ3SDhMT0NpRUZmdHNoeGZZZDh6dDF3SXlEWTFKdkN5c0Iycy9Qb0lU?=
 =?utf-8?B?YXNMazhoT3UzTlpwVU11WDBHY3Rpcjh6RnVkRENaZE5uY1NKVG5FUnFMbTVi?=
 =?utf-8?Q?AHxsjt8S6m0RZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3Y0QmRSeXByNlhLeUVtTWxhdzdraVA1WUg3b25iRjVPMDlGV2U5TllNNW1K?=
 =?utf-8?B?bUpSZzdTTkZoMG9xUnZpTlBCbWJ6ZmdEaEVUcmlvQmhyaVFDVFFxVW1TcmF0?=
 =?utf-8?B?c2pWbmNKTUFuaXBBeVlCakhLUGh0dGt2Q01qSlplMWZvdHJPYUdFVWxPS1c5?=
 =?utf-8?B?YXdJMkVBbGFJMkVFRkk1Q0NuWTJJdERKL2xXNVoxOWkvYXpoSHZuMHp0bFhm?=
 =?utf-8?B?QlhrdGg3QlA4dHo2eFpxY1dUdFJubVZrQkU0amxYR0RRelNQVW81RFVrYWZ2?=
 =?utf-8?B?SUNkSHpldExESXFJSmo0QUZFWnVwc1oveCtIWVFYQUJnaWdEbnZ2Snc0N1Fj?=
 =?utf-8?B?NDVVL2dDQkI5N090a3YvM1krVWo3WndoYjEwR0VjV1pwUk9OcEl6TU9zWmJQ?=
 =?utf-8?B?TFhvckRkMitoZjVCa0RBd3ZQdytWdlZhYkR2T1ZGRCsybSt3UmlwdjJPYmpo?=
 =?utf-8?B?U2VEZU1XQ3drVDljNGRkQzQzVC9vbThaQXQwbkZVN2FUWW4rN1FlaDdlVVpQ?=
 =?utf-8?B?clRjM1lZZUdrYlBLZEN2cUE5WWhCaWZQS0FJd3hyREtHWnNaZ0g3TmVyeDRh?=
 =?utf-8?B?QjE2aGVtSzBMMUI0WGZMTG93akxiNGY3c0JOald5Q21ZdkhWVERCZ3JvTlhj?=
 =?utf-8?B?QTRaMHJ2aSswRmNMNDdKWVNHR3l4SUE4aTRKbFptU1pZekE5YmpBbHo0eGZO?=
 =?utf-8?B?U0oyVGUvSkJOSE9HSU53SURiSUZOMW1lY0RZNVB3RFRXZ2dxYkRJSnVhdDI4?=
 =?utf-8?B?ZGdXcWJvMEg2eE1VWURtVk56YmpFY3BWSlNKTmRtdW4vcFFodVpzSVZmRSt0?=
 =?utf-8?B?TU4zakdmNGdBakpXeXpVVkhDRHZEdTd5T3lYYi9vT1BUUzlGWGIwVEd5bWpH?=
 =?utf-8?B?RTIveHh0ckxocmtuZUtDM0hFZUQ2MGNjTGJuRVQ0TEUyd25tOW84L0pIcCtD?=
 =?utf-8?B?QTJYakpRMUNWbG91eUdPYTZZRjhWN2hEaGpjcjJrT1Y1aEVqSWtUT2VkbCtu?=
 =?utf-8?B?eDZtdys0SElIWWc3VWcwbjRBSlVoZXpjb1dSd2ZlMDMweEdtYjdZdDh5WVV0?=
 =?utf-8?B?RWMzc2hBZDFmRVNXSytkMFVlY1dOMlU2eWlsS2Fsejc3K2ZVU3l2VWZ5clBD?=
 =?utf-8?B?U1FRdEg5d1R1eXNqa2NYUTNFZkJNVmVhVFlKQWpXVlBDRE10czRBZzF4a0Ny?=
 =?utf-8?B?ZG0vMmxlOERQS2ozQkc4TjlUbG1UVjgwenlDeEhwYkpJVU1WTWxab3VKNmxy?=
 =?utf-8?B?dU1yYi9KT1ppNmU4SzlKQk5kdWp4dzFoSDd6WUk5ZGZiSHlpSVFZTTlaSStr?=
 =?utf-8?B?NWhDaGxrSjl1MFh0K3FOdXVrK1JvYUpiaDNjKzg4WHdhRUNDYjVjSWpvdGhZ?=
 =?utf-8?B?MzlTYWZhREtyUk5taW1abG8vZnBhNmRiTzM3SXc2TWpmZHhsbXR3aXhRNGpC?=
 =?utf-8?B?bWQxZDJzOVlheVBNRFAvNllIZU9SMTFweml5bzlndkk5a3RibWU2dGNCcGIw?=
 =?utf-8?B?ejZqaUIrNDhiZWRLcTBRaWl6OCszdE1pWkliVU1MbHV0UG9KdmUxdkRuUEww?=
 =?utf-8?B?SGlZYS82SWJYVnZOU3NtMmUyWmtvRDhxSzlleUsrbUFLdGxjSndVN2M4WlZD?=
 =?utf-8?B?ckxGaTZxc0M4Tm40MFFDWURhT01PSHBmUk40V0xCcExwcUFUZ1ZXbTV6K3Ra?=
 =?utf-8?B?dFllZldwa3hTdDVBMFhKNlNrWFg1NkZCZThuVnpwWVFEaHl6VCt1SmFvV0J1?=
 =?utf-8?B?ZEt5OVMyTUNwU0JId2ZaL1Q5WU1TSEw2RTI2Sm1rMEhCTlMwNHRrTlV3Rlpj?=
 =?utf-8?B?aHUwZzZNUVdJMytHbTJIWFA3ZTRJOVhsc0IvNFRjTnRmMkNxTDgxR1F0ck1i?=
 =?utf-8?B?eHJlM0ZtckdMSWt6MklwTHhWTGlGMjlIRktTTng1UHJOdllSMGt5OUM1Rk83?=
 =?utf-8?B?akVkZ1VTNHZGSWtEQmlBUVJkdXNIOWE1ZjJxRW9xWXZLWVBuR1VBdzlseDk2?=
 =?utf-8?B?Rm5HWGs0L08rRGlmRGVDQ090QzJ2cnVHZjNNWlB0SGpFUkQrK24yUjVERGgy?=
 =?utf-8?B?T2llbkVOVmFOZ2JROEJYT1JpQjJXdUlzRXd4cWtOWDdBeWxKZUhGNDJ3UUt5?=
 =?utf-8?B?Z08vVW91R0NCK2xWblRlZVFpYTdKdW9Wb0RiOEZVa3pGaFZQZ0JZejdhVlZk?=
 =?utf-8?B?ZFE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9dda3c-621a-4415-70a7-08dcc5a7c331
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 08:19:10.6002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+BIdfm0cghn56MAmHn7ksi0JYaCF8bvsA7h8dHKDICHqpIRi19RRgXns5xiUYIvkzC4xSb5N8uviGoLBIeubgpXe3ODFTxzBP5bxGMurBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7539

Hi Shreeya, hi all,

First of all thank you very much for your efforts and patches!

I have got more of a general question that came up during my recent work
on a HDMI RX companion chip driver. It may or may not be out of scope of
this initial submission for the Synopsys HDMI RX IP core, but anyway I
feel like I should ask it now:

On 7/19/24 14:40, Shreeya Patel wrote:
> [...]
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +    hdmi_receiver: hdmi-receiver@fdee0000 {
> +      compatible = "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-rx";
> +      reg = <0xfdee0000 0x6000>;
> +      interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>,
> +                   <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH 0>,
> +                   <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>;
> +      interrupt-names = "cec", "hdmi", "dma";
> +      clocks = <&cru ACLK_HDMIRX>,
> +               <&cru CLK_HDMIRX_AUD>,
> +               <&cru CLK_CR_PARA>,
> +               <&cru PCLK_HDMIRX>,
> +               <&cru CLK_HDMIRX_REF>,
> +               <&cru PCLK_S_HDMIRX>,
> +               <&cru HCLK_VO1>;
> +      clock-names = "aclk",
> +                    "audio",
> +                    "cr_para",
> +                    "pclk",
> +                    "ref",
> +                    "hclk_s_hdmirx",
> +                    "hclk_vo1";
> +      power-domains = <&power RK3588_PD_VO1>;
> +      resets = <&cru SRST_A_HDMIRX>, <&cru SRST_P_HDMIRX>,
> +               <&cru SRST_HDMIRX_REF>, <&cru SRST_A_HDMIRX_BIU>;
> +      reset-names = "axi", "apb", "ref", "biu";
> +      memory-region = <&hdmi_receiver_cma>;
> +      pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_5v_detection>;
> +      pinctrl-names = "default";
> +      hpd-gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
> +    };

Should HDMI RX connectors be described in the device tree?

It seems that V4L2 features support for svidio and composite connectors,
but newer standards such as HDMI never made it to e.g,
drivers/media/v4l2-core/v4l2-fwnode.c. The name of the corresponding DT
binding
Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml
somewhat confirms that only analog connectors are in the scope there.
This means that some initial discussion and effort on the framework
would be required.

However, this would enable some nice (although not exactly killer)
features: describing label, orientation, and connector (sub)type on DT
level, thus eliminating the need to know the HW description in the
higher SW layers.

If the notion of HDMI RX (or, in general, digital video input)
connectors in DT sounds reasonable to you all, there may be the chance
to rework the submission at hand accordingly to avoid any compatibility
issues with older/newer device trees. This is why I am bringing this up
right now.

What do you all think?

Best regards,
Michael

