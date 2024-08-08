Return-Path: <linux-media+bounces-15961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6233594B50D
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 04:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDBD31F21F76
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 02:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D8210A1E;
	Thu,  8 Aug 2024 02:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="c9OHfVOu"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1120.securemx.jp [210.130.202.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4041ED502;
	Thu,  8 Aug 2024 02:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723084061; cv=fail; b=cq6+FGXdWlxxW+dhAGGfRBHCqr4EcmJlKfYjYuGcEe6uv7SbuHSCTBfJn23lgVFKPqUNbtCFLquNOnOJ8sBH/aVoBNQMYpF90JlrMOTGm65RXG2qIeD6iRWcEtoYrnKL7IqTOZQwyrzt4KlaAadk9BskZbIILzJTCkEzhjjCDfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723084061; c=relaxed/simple;
	bh=0rTKFirCHva2iSYABEiJR1Z3zZzRak3mO3p+Ou3wRE8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UkDFO2VgDr9QWPD0gb/el0qbLIQ/A6E1DOXtZorUaiueO3djqSP2ynHjJhBuCyTFiZ5gWsDGAae2cN673vlozwFIM0/vcDq7yxVwl2kDBcCDA1T7sUDfGqZx34GTnPvUjpWPOEHOjyMKeUKBeyr/fGvL0J5mBODP29tyWHCJpKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=c9OHfVOu; arc=fail smtp.client-ip=210.130.202.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1120) id 4780miwX4074329; Thu, 8 Aug 2024 09:48:44 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=yuji2.ishikawa@toshiba.co.jp;s=
	key2.smx;t=1723078074;x=1724287674;bh=0rTKFirCHva2iSYABEiJR1Z3zZzRak3mO3p+Ou3
	wRE8=;b=c9OHfVOuWEwPZ7YLfTyZqdSSrCrUhkAZwxYl2zH65z+Tm4/6Mb6Fn9x/CwzJmrGtVNvpJ
	ruFTUlGsFt3QohWJix0xSk8sKdZf3XRvadf56bI36fs9a+cgqEtc8sckw229o8BYATkMX+MjVfl8O
	uYISUg4eW8yV/wkZvpFDHGqtpLud4n51DcOC1NT9e6B6t7YbI7M3Kdrz5zsobLSDtthPrxPBAlOwf
	uS+uVMnyBuyjZUgfWet+O73l+tA8P+7URAHA0Br1uEQrGh32yWe1fTf8Fi9v6O+YSzsJgBU6COx/8
	OtxvDWfRQPaFVgFaiq89TLfI3nD2wtkA7rV/ynkxvg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1122) id 4780lrR41052315; Thu, 8 Aug 2024 09:47:54 +0900
X-Iguazu-Qid: 2rWgrVoe2dvnIEEnsz
X-Iguazu-QSIG: v=2; s=0; t=1723078073; q=2rWgrVoe2dvnIEEnsz; m=3S6l4PTRChYxsRv1yTbksQ6josUy2z7HCRMcJuEdnWg=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1120) id 4780lohg1609513
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 09:47:51 +0900
X-SA-MID: 26334565
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASLRbGsuXoeJI7Vz361bYXWNDSVGBcdq3epBHTCAw9t+Zp4O7BsKuJqopuuvsPNzvRO/FlQGugbcbfB/Ul2HbzheShapp6mXQHk3TibJt9lne/InDs4xSaStxzgq+qWLOekgf5mS81ME0bdwtMdJbN24J/P6MjRuAvlexRTGHhUXK7hHkqPn0YvOYHWOx3y2G/WFedWA6pE74nGWBVTf1AjOmLu/PmR9w33xElc37YIgySJhOblYh0m/kYDq6JGjxC7z7evcAXvpcsw3WNdu1ejhF/ohx6ybUlLyEoJEJyW5+URqnoTUAwbNoxjB8Tjn69KKx8Y3c7QeX6FP0yQRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rTKFirCHva2iSYABEiJR1Z3zZzRak3mO3p+Ou3wRE8=;
 b=TTC5qXeoGMa4ktOANc4SsvWCr7CJ+0nr8MNSAEP4/bOeqp/jNQA3Vdmwr5T/EdkkoHHZJ56ymLvjnykc3QMhW+GatSDn9OhcUCOodhsW9qAiDIC04DPSDPBTd1jSO+ys9y9pw7bmwy1iuzLCEt1r6o9jWAJwbt9Tj5nKDl3y+wkwiFREea+FJIULml/mCzZNR35Ogav6hR/aK0FVW8ArXVyNVUAkHFXAw5W+eds4MvL208kFdZkIOD2N7bTk1GGMUAxNPoSA4QPv6v5At5nhu3lEmSm9RFTtSF84POsJzq5gFXUPULZIPGfzOiEC/PwEu6HaTMTRIMpyrjtOPwKyBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <laurent.pinchart@ideasonboard.com>
CC: <hverkuil@xs4all.nl>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <broonie@kernel.org>,
        <sakari.ailus@linux.intel.com>, <nobuhiro1.iwamatsu@toshiba.co.jp>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v11 5/6] documentation: media: add documentation for
 Toshiba Visconti Video Input Interface driver
Thread-Topic: [PATCH v11 5/6] documentation: media: add documentation for
 Toshiba Visconti Video Input Interface driver
Thread-Index: AQHa0ZRMFclAB6fhDECpIwHmO3NdrLIDH5OAgA8l+FCAAHDBAIAJ/cHQ
Date: Thu, 8 Aug 2024 00:42:42 +0000
X-TSB-HOP2: ON
Message-ID: 
 <OSZPR01MB94279164656C002E31C4DAFF92B92@OSZPR01MB9427.jpnprd01.prod.outlook.com>
References: <20240709000848.1108788-1-yuji2.ishikawa@toshiba.co.jp>
 <20240709000848.1108788-6-yuji2.ishikawa@toshiba.co.jp>
 <20240722180251.GP13497@pendragon.ideasonboard.com>
 <OSZPR01MB942787AD2A406D91BB08B0EC92B22@OSZPR01MB9427.jpnprd01.prod.outlook.com>
 <20240801160612.GA18732@pendragon.ideasonboard.com>
In-Reply-To: <20240801160612.GA18732@pendragon.ideasonboard.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB9427:EE_|TY1PR01MB10675:EE_
x-ms-office365-filtering-correlation-id: 9726e94f-6d4e-4ed7-5968-08dcb7430332
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?OXJSb2FsclVoamxjZ21IcGowd0RQZE1MMFQwY3JtRURkaFA0bVNBZGV0RUlu?=
 =?utf-8?B?UDNRY1hIVDl2bERCVTVtbEJHeVBLd3pQTE43N29QNmVzVWVTaU1MSGY1L3VJ?=
 =?utf-8?B?ZzJjaHN2ei92QytVcnhmZkx0bVUxUVBJQzB3bkV4ZjVpVnk3Y2VuaUhXeDAz?=
 =?utf-8?B?d3N3dGVXekN1R0x3SExnNmpJREErQ0JwbW5Ca01QZkpMa3pTUWc0d3hiUFBG?=
 =?utf-8?B?RjRvQlRtdHFEQUhnSURHZnRqMTJyTkJwL0ZtK0xMM2dJM1l3UjdqVGdHU2tH?=
 =?utf-8?B?WVdyWkp5c01Jek8zWDF5NWlaQW03UTlaNWFjUUpiK1dkd1NRM3FrWUhBKzU3?=
 =?utf-8?B?anVENUVxbTFjMFZob3o0QStHS0M3WDdkbEZtMEpqK2xDZ3N5M0JkbmlaUGpn?=
 =?utf-8?B?eFowaDJVckRYdVk3NGt6U2xaOHBWRGp4QWwwbmQ0YkU1cS9rVUVWb2lDdVAw?=
 =?utf-8?B?cTFZS201YjBvV29lUEtqd2N6aVJ6NzdJUEF1TXRZN1ArNUpOZjVYREVPaG81?=
 =?utf-8?B?TW5zWUNIUFpQNHNVWmhJZldWcWE1VnQyTWhOK2kxL1FFTU5KaEFKc2xxRE9B?=
 =?utf-8?B?aC9XVlNQNnhNNEJpc1IrNmZBalFsbDFwTG9yUWZJc0lWVHpuMXRoYVF3NUp6?=
 =?utf-8?B?aUt4SW9xbmpqTmc5SURMZnlPbU9Dck1wTHVLR1Bhbjh1R0RLZU5rUWdvb3dx?=
 =?utf-8?B?YnBRZFFuMWZwMXh1VzhyZXRDVldFS3RwbXliMFBlSzc1R3RoUkRuTjZzcDJI?=
 =?utf-8?B?Y2hSTUxUKzJ1VFh4VE1IS0lzRWhoeXg1Q0ppR1VWaGlYUEhzQ2traWdqNDk1?=
 =?utf-8?B?NjZxS1JPUWVYazdJdzRTOUtZY21hTmJYV1N1U2pIMzdPV2JETnZLVVN3b0k3?=
 =?utf-8?B?Yi81ZHVMK2cyZ0tmS0hwbXN0MkZQVVdOY3pyU2pjSTl3T2daRy9HNUFMR3NT?=
 =?utf-8?B?d3hZQW45WDUvV0h3N2REdEpSRzFkZEZDYkhGMjN1TEJtdkdMNVVzR2I2U2M4?=
 =?utf-8?B?cmQwUVduaGE0VVV0QW9USmE5eGRQN3NhWGpvd3FicjcyTW1YZWpOa3ZtdTN1?=
 =?utf-8?B?L0xZbkNhZ0JCU0w3VHZ2Q0ZDeExvSXB4Vkx4UHhkNVFkbzRPV3dxMzBsNmpM?=
 =?utf-8?B?Vm96bVlTRWlLTzBNTGI2L3lXWVl6R0R0TmtGSW5iT2lVWkNFWmlMVXYyWXJs?=
 =?utf-8?B?Ymc0S2dtSjhERG1YZnZSVW1lSWNmdDFZam9nV3l3Lzd3QWVMUEIxdDE0amRX?=
 =?utf-8?B?WS9vZUVrYXpJSGZwVjZWTmh1aVRGKzZyRWZ5SUNpN2R2cW4xWVBwQlY2bFZR?=
 =?utf-8?B?RzFhSWhLd2hpaDR4NmN5K1JLVHhKRDI1VFQzd2VudThldDVFVnRkdU8wZ0s5?=
 =?utf-8?B?YUYzQktYeS9JWHRZNERFeS9VT2RPTEVtQy9WLzVzUGhIQVlhQ3VRa1k0YmZK?=
 =?utf-8?B?dkFEMHdGN2pZRTlPME9vWnpYYzVEL1E2ZU9vTjBXdHNXeEhEN1ZpclQxREg0?=
 =?utf-8?B?L3dPQTQybzhhcEh5US9qcVpCOG1rTlcwOGxPWVk3TmJ3MXVPdlhkUUdxZ2dY?=
 =?utf-8?B?TVlxL3BIaHVQajBRaDFnSnNuaDRvNkNIZzV4bitQQkU0VkZETEdFdm9LamNF?=
 =?utf-8?B?WEZ3RmJOWDBJUWZHU2MrWllNd1NQTHBqU05PVlU2SGh2N2xybWduV3NlQmhJ?=
 =?utf-8?B?RWx6SC9rWDQvWmc2UlAyaWJnZHZxZldXTmd6cmpUNDhqU1RneCtzV1ZtUHZV?=
 =?utf-8?B?emtXQ05JREp0aE1OS1gwZnJ6bjVUT2Y4WFU3c1JNNHNXcEZOMEw5aGRaM1BW?=
 =?utf-8?B?MmtqRWpkTC9KZmpmRm1FZVBWT3o2WWZuazIzcERNb2h3VEp6MWU5d24xUTVG?=
 =?utf-8?B?M3p3N2VremhTSkcwRHcwV0UrUU05SHdPRXZMVS84RDFsb3c9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB9427.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZjhRM3QzUEFkQVRZa1FaakVFWDIvd1l2QSsrNWl3ODdRUVBUTXVPUUkzVnlU?=
 =?utf-8?B?UzlEL1V0cytWMFVBTUVjcGhYUkRXbjdidW4xYTI2VlRUcURDUFlKZHkvK1Zm?=
 =?utf-8?B?dDVxMElIRUFycjkxTk9CWGwwSGNmNHlKRFU2cnFCSE5Ba0hpWkRCbUFranZq?=
 =?utf-8?B?NndrbmV2azNkMlpDc1F5ZHNPWkJGbTZHN2xCaUdMbnB1ZWlybmdES08yZDkv?=
 =?utf-8?B?VktLNi9seGFESTU5TGdpRERGQlIzemZPK1ltMVhjem5nQmUzMTZOeSttanZZ?=
 =?utf-8?B?YzZBUUlVNkNkMlBkQXVhSFJCVWNKVVFqQldzMG56cldRV1k2dkRNUGJHWlRF?=
 =?utf-8?B?TVMybVlOMXlHWjRJTGd5aWhyaDNGQ0ZtTC9RZjBNcThndUpXSTZub295ZXJH?=
 =?utf-8?B?aW9uNHRsbk5ZUk00dlNhZmk1SDEwUmpWQjA5SFRNL2JFT2xHcFJmL0U4OEVV?=
 =?utf-8?B?TkZOczZJZVMySDNTSmtoTlRRYW1jdzR3VnhPVWI3Y3ZacW5YQlhiNVpLYktF?=
 =?utf-8?B?dGRLWk1vN1hoRVZEZXczcHJySjhjMkVHd0QzSWUrWmQ2dU83akx6Y3c3Smgx?=
 =?utf-8?B?bmRLcmhXcHowdVFLZ0JqUFZYZW02UkNWUmU5eVJLUVlqYjFHTXlmcVB0VUpt?=
 =?utf-8?B?K0U4UzNPRFNDYVBxRFhVQ3VMSk5mMDExWjNJRUFvcHphMy9QRTVNU1Uydnll?=
 =?utf-8?B?RXRXZkVwZXdseFp1UjF4TUFDbW9sdE1NeWp5WnJrbTF0S2tiZXVMaVVibVdP?=
 =?utf-8?B?N0hyU3dSZFN5WDRMM3RCTGNncVFTZG94S0FaU1F5WXlyMG1wV0ZkdS9FNlN2?=
 =?utf-8?B?S3FWZzNuNTBjYlFZRnJaQm14N0w2SEJFOWpJQ2U3TDd4dDlkamRxWmVjdkdn?=
 =?utf-8?B?MzlINTVBNEV2MHRjcEdrZEVqY0J2MUJTdTV3RzB3cTBHVEtuWUQzUGJoLzhw?=
 =?utf-8?B?OWxXMWo1V0dYZzZYWmtraUYxRXJic0Z4YUd3ZUY5SFZ1dVpwek1nOUhRVlZ1?=
 =?utf-8?B?UFc3RmZicjVQN3lJdnE4VFFnVTBYTHkwd2Y1RU1wTDRCNlBsdXVUQ0dFY2J0?=
 =?utf-8?B?K2NoS0NmNXdwT0V4Q2pLOENRWHZkaU0vaUJHd3FlQ2ltMXNYaG0yekE2bDNV?=
 =?utf-8?B?Q0pTaXZBNzE0OGQrQmpoQlJOYTBWajRxengrTmF0eThhM1JjRUVvcS9QTzRh?=
 =?utf-8?B?UWt5M2QvazhHSlh4a2RmT0UvNUcvMVdxVDlUQmNqOTBtQ28yYlM4aVROVzIx?=
 =?utf-8?B?RnYvbUwxeWwwaFRtS2xKcUw1V3BDeGR3a2JmdEVJdlZNTG5BYkVuc3BVVFJI?=
 =?utf-8?B?Q01KdS9qM3lrcDdsdU41dDFGMVhSV0ltTHBTSC91MkJaVkQzUEtRWWh1dkUx?=
 =?utf-8?B?MDJ5Ny8zMjBKVmJ4cHdFOUY2SVpBVU5teGwxMVpXdFExQnZkZ1UxelRXbEhK?=
 =?utf-8?B?aEdrZDg4UzdYenB3cW5nbnpjRnNhbnZSbHdHU1JqRklJM3JCT1U5V0RFeVlz?=
 =?utf-8?B?VzlHRjNUZXB5TW1qZW8rN3ZIQWwyWE10VUJjTGtjb2pTczkram5KclRRSFQ5?=
 =?utf-8?B?NkhETmszWHdLL1VSU01UYSs3ZGp3ZnVPUmdFbDFJWGN5bEczSERPMXhQcWxZ?=
 =?utf-8?B?K0Nqdi9hSGxjSzJoaGNMa2xNSjlxRXNlSTAram1reGVWUU5WOFZ5VHF5MWpZ?=
 =?utf-8?B?dWcyWUpIbnNKY2crV2I2YkxUMTZUSUpBYWgrQnJhaFliZjdXYVo5TkVLTkVT?=
 =?utf-8?B?aEp4MEljQWxLVXY4cE9oM2RzQ2xxN1QvSGtRZUdkWVhTYldIa2dqSzB5bnNL?=
 =?utf-8?B?bFA4Z2thWHRjekE5STdkS0ZTSWtMOG1Od1QvcWRjQnp5WDhXUTZoQ0dTZldR?=
 =?utf-8?B?cldQVDZuOExyY29rQ0pzQk1XNmNkalE2V2ZpNkhsMGRraGtCb1JNN0tkWGVE?=
 =?utf-8?B?Z0F1NlJ5T2E3ZEZIREtseEJ3emRNZHVucGNQYzdOeFlnVVllaFJ4bGtWSThk?=
 =?utf-8?B?cmZrY3JXcFVjd2NUOVVjOTNyOEdSWENaeFdKYUtyOGxVY3Z2ZXYzVmgvQk0x?=
 =?utf-8?B?aWpvaU10OXAzd2k3Y3RTUU5SQnhZbE9HVE8wVFk4Y0d1MUZ4Q21yT0JxQk5l?=
 =?utf-8?B?QkxDK1I2aE44S09wV25wQjZrUUQxL3FwZkcva1UreDRHNHp1QThnNk01S2l5?=
 =?utf-8?B?U2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB9427.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9726e94f-6d4e-4ed7-5968-08dcb7430332
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 00:42:42.3952
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H1zIwBIb0odftNJ2dYPIci4iJ2WkwE2Oa8TYT3OhK5dkij+AuWQdTIfGT85gCGqRMv8+mTwfkRbzPINNbeFnr1uzqFiqHo4gcvNLuVpi6UE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10675

SGVsbG8gTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBM
YXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNl
bnQ6IEZyaWRheSwgQXVndXN0IDIsIDIwMjQgMTowNiBBTQ0KPiBUbzogaXNoaWthd2EgeXVqaSjn
n7Plt50g5oKg5Y+4IOKXi++8su+8pO+8o+KWoe+8oe+8qe+8tO+8o+KXi++8pe+8oemWiykNCj4g
PHl1amkyLmlzaGlrYXdhQHRvc2hpYmEuY28uanA+DQo+IENjOiBodmVya3VpbEB4czRhbGwubmw7
IG1jaGVoYWJAa2VybmVsLm9yZzsgcm9iaEBrZXJuZWwub3JnOw0KPiBrcnprK2R0QGtlcm5lbC5v
cmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7IGJyb29uaWVAa2VybmVsLm9yZzsNCj4gc2FrYXJpLmFp
bHVzQGxpbnV4LmludGVsLmNvbTsgaXdhbWF0c3Ugbm9idWhpcm8o5bKp5p2+IOS/oea0iyDil4vv
vKTvvKnvvLTvvKPilqHvvKTvvKkNCj4g77y04peL77yv77yz77y0KSA8bm9idWhpcm8xLml3YW1h
dHN1QHRvc2hpYmEuY28uanA+Ow0KPiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MTEgNS82XSBkb2N1bWVudGF0aW9uOiBtZWRpYTogYWRkIGRvY3VtZW50YXRpb24gZm9yDQo+
IFRvc2hpYmEgVmlzY29udGkgVmlkZW8gSW5wdXQgSW50ZXJmYWNlIGRyaXZlcg0KPiANCj4gSGVs
bG8gSXNoaWthd2Etc2FuLA0KPiANCj4gT24gVGh1LCBBdWcgMDEsIDIwMjQgYXQgMDk6MjM6NDNB
TSArMDAwMCwgeXVqaTIuaXNoaWthd2FAdG9zaGliYS5jby5qcA0KPiB3cm90ZToNCj4gPiBPbiBU
dWVzZGF5LCBKdWx5IDIzLCAyMDI0IDM6MDMgQU0sIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+
ID4gPiBPbiBUdWUsIEp1bCAwOSwgMjAyNCBhdCAwOTowODo0N0FNICswOTAwLCBZdWppIElzaGlr
YXdhIHdyb3RlOg0KPiA+ID4gPiBBZGRlZCBkZXNjcmlwdGlvbiBvZiBWaWRlbyBJbnB1dCBJbnRl
cmZhY2UgZHJpdmVyIG9mIFRvc2hpYmENCj4gPiA+ID4gVmlzY29udGkgYXJjaGl0ZWN0dXJlLg0K
PiA+ID4gPiBJdCBpbmNsdWRlcyBoYXJkd2FyZSBvcmdhbml6YXRpb24sIHN0cnVjdHVyZSBvZiB0
aGUgZHJpdmVyIGFuZA0KPiA+ID4gPiBtZXRhZGF0YSBmb3JtYXQgZm9yIGVtYmVkZGVkIGltYWdl
IHNpZ25hbCBwcm9jZXNzb3IuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1amkg
SXNoaWthd2EgPHl1amkyLmlzaGlrYXdhQHRvc2hpYmEuY28uanA+DQo+ID4gPiA+IC0tLQ0KPiA+
ID4gPiBDaGFuZ2Vsb2cgdjM6DQo+ID4gPiA+IC0gTmV3bHkgYWRkIGRvY3VtZW50YXRpb24gdG8g
ZGVzY3JpYmUgU1cgYW5kIEhXDQo+ID4gPiA+DQo+ID4gPiA+IENoYW5nZWxvZyB2NDoNCj4gPiA+
ID4gLSBubyBjaGFuZ2UNCj4gPiA+ID4NCj4gPiA+ID4gQ2hhbmdlbG9nIHY1Og0KPiA+ID4gPiAt
IG5vIGNoYW5nZQ0KPiA+ID4gPg0KPiA+ID4gPiBDaGFuZ2Vsb2cgdjY6DQo+ID4gPiA+IC0gYWRk
IGRlc2NyaXB0aW9uIG9mIENTSTJSWCBzdWJkZXZpY2UNCj4gPiA+ID4gLSBhZGQgb3JkZXJpbmcg
b2YgaW9jdGwoU19GTVQpIGFuZCBpb2N0bChTX0VYVF9DVFJMUykNCj4gPiA+ID4NCj4gPiA+ID4g
Q2hhbmdlbG9nIHY3Og0KPiA+ID4gPiAtIG5vIGNoYW5nZQ0KPiA+ID4gPg0KPiA+ID4gPiBDaGFu
Z2Vsb2cgdjg6DQo+ID4gPiA+IC0gYWRkIHVzYWdlIG9mIFY0TDJfQ1RSTF9UWVBFX1ZJU0NPTlRJ
X0lTUA0KPiA+ID4gPg0KPiA+ID4gPiBDaGFuZ2Vsb2cgdjk6DQo+ID4gPiA+IC0gZml4IHdhcm5p
bmc6IHNldCByZWZlcmVuY2UgdGFyZ2V0IGZvciBrZXl3b3JkDQo+ID4gPiA+IFY0TDJfQ1RSTF9U
WVBFX1ZJU0NPTlRJX0lTUA0KPiA+ID4gPg0KPiA+ID4gPiBDaGFuZ2Vsb2cgdjEwOg0KPiA+ID4g
PiAtIHVzZSBwYXJhbWV0ZXIgYnVmZmVycyBpbnN0ZWFkIG9mIGNvbXBvdW5kIGNvbnRyb2wNCj4g
PiA+ID4gICAtIHJlbW92ZWQgZGVzY3JpcHRpb24gb2YgdmVuZG9yIHNwZWNpZmljIGNvbXBvdW5k
IGNvbnRyb2wNCj4gPiA+ID4gICAtIGFkZCBkZXNjcmlwdGlvbiBvZiBwYXJhbWV0ZXIgYnVmZmVy
cyBmb3IgSVNQIGNvbnRyb2wNCj4gPiA+ID4gLSB1cGRhdGUgZGlyZWN0b3J5IHN0cnVjdHVyZQ0K
PiA+ID4gPiAgIC0gcmVtb3ZlIGRvY3VtZW50cyB1bmRlciBkcml2ZXItYXBpDQo+ID4gPiA+ICAg
LSBhZGQgZG9jdW1lbnRzIHRvIGFkbWluLWd1aWRlLCB1c2Vyc3BhY2UtYXBpDQo+ID4gPiA+DQo+
ID4gPiA+IENoYW5nZWxvZyB2MTE6DQo+ID4gPiA+IC0gdXBkYXRlIHVzYWdlIG9mIHRoZSBkcml2
ZXINCj4gPiA+ID4NCj4gPiA+ID4gIC4uLi9hZG1pbi1ndWlkZS9tZWRpYS92NGwtZHJpdmVycy5y
c3QgICAgICAgICB8ICAgMSArDQo+ID4gPiA+ICAuLi4vYWRtaW4tZ3VpZGUvbWVkaWEvdmlzY29u
dGktdmlpZi5kb3QgICAgICAgfCAgMTggKysNCj4gPiA+ID4gIC4uLi9hZG1pbi1ndWlkZS9tZWRp
YS92aXNjb250aS12aWlmLnJzdCAgICAgICB8IDI1NQ0KPiArKysrKysrKysrKysrKysrKysNCj4g
PiA+ID4gIC4uLi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC9tZXRhLWZvcm1hdHMucnN0ICB8ICAg
MSArDQo+ID4gPiA+ICAuLi4vbWVkaWEvdjRsL21ldGFmbXQtdmlzY29udGktdmlpZi5yc3QgICAg
ICAgfCAgNDggKysrKw0KPiA+ID4gPiAgNSBmaWxlcyBjaGFuZ2VkLCAzMjMgaW5zZXJ0aW9ucygr
KSAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+IERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUv
bWVkaWEvdmlzY29udGktdmlpZi5kb3QNCj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+
ID4gPiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL21lZGlhL3Zpc2NvbnRpLXZpaWYucnN0DQo+
ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiA+ID4gRG9jdW1lbnRhdGlvbi91c2Vyc3Bh
Y2UtYXBpL21lZGlhL3Y0bC9tZXRhZm10LXZpc2NvbnRpLXZpaWYucnN0DQo+IA0KPiBbc25pcF0N
Cj4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL21lZGlh
L3Zpc2NvbnRpLXZpaWYucnN0DQo+ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9t
ZWRpYS92aXNjb250aS12aWlmLnJzdA0KPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+
ID4gPiBpbmRleCAwMDAwMDAwMDAwLi40ZWY2NzY3NTRjDQo+ID4gPiA+IC0tLSAvZGV2L251bGwN
Cj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9tZWRpYS92aXNjb250aS12
aWlmLnJzdA0KPiA+ID4gPiBAQCAtMCwwICsxLDI1NSBAQA0KPiANCj4gW3NuaXBdDQo+IA0KPiA+
ID4gPiArdmlpZl9jYXB0dXJlX3N1YiAtIFJhdyBJbWFnZSBDYXB0dXJlIFZpZGVvIE5vZGUNCj4g
PiA+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
ID4gPiA+ICsNCj4gPiA+ID4gK1RoaXMgdmlkZW8gbm9kZSBpcyB1c2VkIGZvciBjYXB0dXJpbmcg
YmF5ZXIgaW1hZ2UgZnJvbSB0aGUgc2Vuc29yLg0KPiA+ID4gPiArVGhlIG91dHB1dCBwaWN0dXJl
IGhhcyBleGFjdGx5IHRoZSBzYW1lIHJlc29sdXRpb24gYW5kIGZvcm1hdCBhcyB0aGUNCj4gc2Vu
c29yIGlucHV0Lg0KPiA+ID4gPiArVGhlIGZvbGxvd2luZyBkZXB0aCBvZiBiYXllciBmb3JtYXQg
aXMgc3VwcG9ydGVkOg0KPiA+ID4gPiArDQo+ID4gPiA+ICstIDhiaXQNCj4gPiA+ID4gKy0gMTBi
aXQNCj4gPiA+ID4gKy0gMTJiaXQNCj4gPiA+ID4gKy0gMTRiaXQNCj4gPiA+DQo+ID4gPiBEb2Vz
IHRoZSBoYXJkd2FyZSBzdXBwb3J0IGNhcHR1cmluZyBlbWJlZGRlZCBkYXRhIGZyb20gdGhlIHNl
bnNvciA/DQo+ID4NCj4gPiBUaGUgaGFyZHdhcmUgc3VwcG9ydHMgY2FwdHVyaW5nIGVtYmRkZWQg
ZGF0YSwgaG93ZXZlciB0aGUgc29mdHdhcmUgaXMNCj4gPiBub3QgZnVsbHkgdGVzdGVkIGZvciB0
aGF0IGZlYXR1cmUuDQo+IA0KPiBPSy4gU3VwcG9ydCBmb3IgdGhpcyBjYW4gYmUgYWRkZWQgbGF0
ZXIuIEkgcmVjb21tZW5kIGFscmVhZHkgY2hlY2tpbmcgd2hhdCBpdA0KPiB3b3VsZCBpbXBseSBp
biB0ZXJtcyBvZiBjaGFuZ2VzIHRvIHRoZSBtZWRpYSBncmFwaC4gQ2hhbmdpbmcgdGhlIG1lZGlh
IGdyYXBoDQo+IGxhdGVyIGluIGEgd2F5IHRoYXQgY291bGQgYnJlYWsgdXNlcnNwYWNlIHdvbid0
IGJlIGFsbG93ZWQsIHNvIGl0J3Mgd29ydGggaXQNCj4gcHJlcGFyaW5nIGZvciBlbWJlZGRlZCBk
YXRhIHN1cHBvcnQgaW4gdGhlIG1lZGlhIGdyYXBoIGRlc2lnbiBhbHJlYWR5Lg0KPiBBZGRpbmcg
bmV3IHBhZHMgdG8gZXhpc3RpbmcgZW50aXRpZXMgYW5kIGFkZGluZyBuZXcgZW50aXRpZXMgbGF0
ZXIgYXJlIGZpbmUsIGJ1dA0KPiByZW51bWJlcmluZyBleGlzdGluZyBwYWRzIG9yIGluc2VydGlu
ZyBuZXcgZW50aXRpZXMgYmV0d2VlbiB0d28gZXhpc3RpbmcNCj4gZW50aXRpZXMgY291bGQgYnJl
YWsgdXNlcnNwYWNlLg0KDQpUaGFuayB5b3UgZm9yIHRoZSBhZHZpY2UuIEkgd2lsbCBiZSBjYXJl
ZnVsIG5vdCB0byBicmVhayB0aGUgdXNlcnNwYWNlIGluIGZ1dHVyZSByZWxlYXNlcy4NCg0KPiAN
Cj4gW3NuaXBdDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K
DQpSZWdhcmRzLA0KWXVqaSBJc2hpa2F3YQ0K


