Return-Path: <linux-media+bounces-28842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F14A72DC4
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 11:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13C4017731E
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 10:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC6C20F09E;
	Thu, 27 Mar 2025 10:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WTNfXFeB"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD05B20E03B;
	Thu, 27 Mar 2025 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071354; cv=fail; b=P6GLc039/ud6ZRBQ3X0iB6z7PLJPsI77PlilUx5NuH/fNs+o5wUkycE/A1wTAUNjUdm3l2JOdgQOOUdvi60/AXeDXYoBaesyVBrxt9ba5hc3b2E58H9Bsw+ThwDJSH9iy2lbnLzCtO6HjVUNRNIRP+mDlDSqaMC+LXQ9EmYI56s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071354; c=relaxed/simple;
	bh=8N9JmLenAzYDreGSp5erP0dUkwQWO+90zau7NZvNBr4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lGFUaaHd16eK2ZIZo82rSvYD3ZqEA2vxMZPYGF+hAiD+HfIEjegO0E3OQWM7Osw7t8jrV0gmfnkyP+FPoJk4z7KS6g40WlWjJtUz2dG3eEPydmwCpLCLJ60pxYmT2d426xsQ/L1RSE9iceB5hxnThmHjl/RZwMWsmXt7gj4AR64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WTNfXFeB; arc=fail smtp.client-ip=40.107.74.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dC2Hbm4g4Xl3WnJRrw1OS6FxkjJE1kMe/ChWFfyRoNCSa0tO2j/56gPnr13LFoZdoHXAYchj96hcwf+qIkBJJXcfwqu1Wu698ytZLXL6t1BAgiA0RsoTL4H3yidr0WMqCCzOFYClGNEO+FwDrFSP0i4Dw7wgO+ZLgHM/rI1IIlNkP22e9GSzT2zU139MbLpnge61It3d6zrEw5YbLIIzS0YrFcYbRYiVZ1wtDdl3RJv3EfjuIB3iBUTP1LTXYNIi7VdP7s5vpMO9lBnu9nEIwKp+x5OfzvH+t1N6m3IrAIJWNDieWDCw+y275uafxx0Xn6bSKGDT3J/mcegrw9XC8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8N9JmLenAzYDreGSp5erP0dUkwQWO+90zau7NZvNBr4=;
 b=lBU3B8WWSa0ZI5glOgO6vhSO//d1ixgHmdTcoBBjk2eEFazwBu7ifzb1kJHtlfq2amWduQWyM8dWa9usn7PX++qtXLk2ckxiUuLL7cECTJx9jPZfuRAUdGw+Kv4nfDSUpYH0hAbw+KXX1N3OkMpklgjnt/I3t/rcOe948lU2hdH36OCGbJ7Cx7X9AVeZce/TMHp0mcMlYJCMxNtRUy2yWet5UCzP2N0Rbt9T/L0HdZAvgNVzReoHhbfSAHnOpMTghH2sGlPZ8gbOzmxJxL/Bza4OV4OvqUg50yX8tTWSCFV+huOITDztvkzDkE3N8j58pkGs5lryjzJ/8cejYvaO3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8N9JmLenAzYDreGSp5erP0dUkwQWO+90zau7NZvNBr4=;
 b=WTNfXFeB3jVqLCRiD+YU4wE/oqbRmurM3UxEZ12KbnrgRHfIxT6E2R/FOYLuvauOMk+NLwivP0/ghns/3YDEE6JgGFDAa49+V2tejhOyBqh++NwcIEglFvi56NgnihfObFFzKaX37rbgKuvaX1a1m9O5KiyfDonWEaWDwKtZink=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYXPR01MB15340.jpnprd01.prod.outlook.com (2603:1096:405:277::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 10:29:06 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 10:29:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
CC: Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Hans Verkuil
	<hverkuil@xs4all.nl>, =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?=
	<u.kleine-koenig@baylibre.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 11/17] media: rzg2l-cru: Add register mapping support
Thread-Topic: [PATCH v4 11/17] media: rzg2l-cru: Add register mapping support
Thread-Index: AQHbjFbPYso18q5X+UKLXO3xAvHo/LNvjghQgAF4kwCAFeMpAIAAAQ+A
Date: Thu, 27 Mar 2025 10:29:06 +0000
Message-ID:
 <TY3PR01MB11346B76B957547A350BDED6E86A12@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
 <20250303160834.3493507-12-tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB113467D4C0BE9691A6E4630C786D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <Z9LJFCBbqbdlDP8k@tom-desktop>
 <20250327101554.GA18306@pendragon.ideasonboard.com>
In-Reply-To: <20250327101554.GA18306@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYXPR01MB15340:EE_
x-ms-office365-filtering-correlation-id: 58c3724a-8174-4195-def1-08dd6d1a33d3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dk9KOWVOeWlDblVQOXhVL3QyL2lFK1g0S09FR3Q2T0JSbm9sWGNySW5MRS9v?=
 =?utf-8?B?RXN1UXZKV0cycHZQdHJDWElpMGFicTVpZWp4MFQxSmk5NjlBT1FxdUJ0TG5p?=
 =?utf-8?B?QUZQWksxMXlXdmU2bXc3aWkwTS9ZUGNoT2FZdXBlVngxN08xVUU1SVlyZUNj?=
 =?utf-8?B?L09hc0VQNEI1U3BNUzVKVEVkbWhCdzdWN1dIcUo3T0ZvUEZtMS81SjFJaTln?=
 =?utf-8?B?L2ZvdmZzeVlxV1kzNXR3OTEvc0cvQWg1djdRY1A4bGJBOVlzWlJ5NkRBM1M3?=
 =?utf-8?B?UlVOMHF5Kzk3d1B4cFUxMDltcTlsSk04aVJ0UisxbW1KWnEreXFxYUVnRTh2?=
 =?utf-8?B?aU9CNGFpdnl5a0ZHVFd3YWp6SUJnclJNSVRUSUJBcHZ3akFyMzE5Y2t4OU54?=
 =?utf-8?B?aGZXWFV4bkVFTjI1OXRuWGF2NjNCdEdxdWVmVHFVQTZiTXd0WTVrYTl0ZHh4?=
 =?utf-8?B?NDdoT3NLU3c3Yy83N0RPcDMrQXJ4dUhQMjdiYWZLM1F1RlhacGpwV0VHM1pu?=
 =?utf-8?B?ZXY2ajdTK0VuOVU4bWxwWEZjakorL0F5MkpnbEs3U2lnaUxPSTVOdWlQa21p?=
 =?utf-8?B?bHZTVXlSdzg2Y2Z1ay9jdWVVVHZJRkJNVXd6eENXc3BRc1JraERPNUtEQWM1?=
 =?utf-8?B?cUV5QVN6Um50cFkxaEsxL3lvek9zQWhCTWQ4NlRSN3NRUlFzdzVvTmswV2ph?=
 =?utf-8?B?WElRa25MeFJ6aWhTNUgrNm1ZSWEyUWhNM0pUYnBLNUdWZnV6dFp3ZGVWdGw0?=
 =?utf-8?B?ZzZjRnhHYlVEaGpkQVkrcnIvQW9TM2JKZzhGaGxKK3l6ZWJ0RE9VcWtWelox?=
 =?utf-8?B?anpWRVVmOE5YWFEyTTJNRFAxcXdTbXhkbGx1Ymp5S1J4SkpNek5nK1ZpS0ZT?=
 =?utf-8?B?bEgxMi9OTlI3VVI2dWxEbjNhb1JNWDcxS3NnYW52T0RNdElza3A5eldvTEFs?=
 =?utf-8?B?cXJoMHFKWURCYXFuNTBidWJSa0ZTZm5aaWdlNE8vWkNSUXo0TlVvMzFlQjlC?=
 =?utf-8?B?Snh5eFFTNW5BdEhUcU5nTnlZYjhxSUZGSnlUN1JTRmNiOFVxVGtMSENTQVdS?=
 =?utf-8?B?YXNJRWJ0dWZjQlNocnJzL2xyR1Vhd2dzVFo2UnlnUXJwZWg1SXUxc1p2NVMz?=
 =?utf-8?B?a04zNTZRa0RBWkR0MTZ4NWVhcXRCV09VMFVhbkk0UmtnWUJGVW9qeitNam55?=
 =?utf-8?B?VnF3Uk56T2JEZFRHcVhrSFVJZHpKSXhSWkNISjR6NDBoWno1eXMyQmgzTFpu?=
 =?utf-8?B?Qmh0UnpYNlFoT09RQ21Edjh6LzhlaEJHV2pueU5vZU0vRE1mMFJNNHhZZkZv?=
 =?utf-8?B?SVBZSk9Vd3dSNmFxQmY1R29EOWxsd25JanpCQjlqcGlyYytBczduNzcvaUda?=
 =?utf-8?B?Yk1hN010ZWNxOFF1dTk5YXJIbDlLU2htOVFhNisrYldxNnpndXBLNmpqQXg3?=
 =?utf-8?B?TUx5VGdtMnhUY28zaDRUZ0Q1czlDOVJ5c3JrQ2Rsb28zNXIwbWdwSzVHUFlK?=
 =?utf-8?B?bE1nbVBBT3kvd1hkRUp5OWNJYndaVXZQSFdWaFRKc1g5eHhYdXRXbnNrb3l6?=
 =?utf-8?B?WXA0eXFZL2NpVkpFR01teHUxL04rWnlMT0RHVE1Kb0V3cVZBbllwakpidzdJ?=
 =?utf-8?B?TDFPTUZTZWtzdmlXYUN4NGwzVTJtbkRFQ014VVczWk9ZNUwrclJKYnNpM0RI?=
 =?utf-8?B?bFBHSjRlaFJSZytkcUowU1ZRNHMyb1RleU93dmwxS1dKclQwUUhid2xGWlFE?=
 =?utf-8?B?YXozK1FqT1hsblFiR2VpTDhzaFV2S3pSREFsZHNSYnZXQzR3OW82V3ZKYjND?=
 =?utf-8?B?Zk4ydlNNbVFWVmpLYTczWE9BaW41TlRpRVhRVkM2dURpMU13QzgyQTg1OXZD?=
 =?utf-8?B?eEtlRkxoc1VrM2JGWUY0RG5SS2ppbjVVaUVuVEJ4dURtNUZ3b25mUG1ZQXlS?=
 =?utf-8?Q?pw7RwzdVzmjGOI0h4ybdkFWasBmQnkOE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N0FoNEtrMVNQYnJYZDJmQXhYejRrSEtTSnhpWDRxY3lTWVRnaDFmVUkvYlF2?=
 =?utf-8?B?ajdnV2JHTjU4NG5DQkVHbWRWOC9BeHpzL2NXOHhtVHNkTU50REl5Z3JYemJB?=
 =?utf-8?B?M1IrOGxQd3Y0UVJYRjhlY2ovYzdXTzQ5Vng0RFMwaUhxdG0yNTAra0RST0NM?=
 =?utf-8?B?bCtCV3lKV2k1Q1hnWUNScjEzazNoUldYOVFiMkdIeE1LMENIeWdMN2RFOC9I?=
 =?utf-8?B?YWc5aG5PeTZLR1FFUW1USjFlbFBsWEg4aHNhT29DVGxYd01hYlVCK21jR1Y5?=
 =?utf-8?B?OGxJZk5DTkwreFBGV2tpNWFWWTEzUDU5bDFQS2VUams5bzlsRkJiWFQ0cThS?=
 =?utf-8?B?cHZWRnA4UXhXTVZhUFpGM0xHa3QycFZ0RSs1a2JzQjN6VmtwckMvc0NmK3Nh?=
 =?utf-8?B?NnJicE1IMkh6UTFaMXJtcnJpeFNrbFFaWmFNajhWVWNmOUN5RU9QMktlV1NS?=
 =?utf-8?B?NnVWbDJKa0ZZVEhJUmtURWtJZUJCVkdxTjNOaTd2R2k1MDl5cG1Eb0kzMnBo?=
 =?utf-8?B?MU5QR01sMzA1d3hUdWE2MnpxREFIU1hjWFk1UE54QytjQThKa1VuVHJnRXpk?=
 =?utf-8?B?b29NVUhFVVhlOEcxT2RZdFZBdk8rTTEzMnhCYlRaMWNxcjUxT05sMHFtUlN5?=
 =?utf-8?B?cHk5c0xIU0RRMFdaWnNQQXpZTE5Ec3NZdE1teEF3YzVVQ1BMZkhxMDdlMldV?=
 =?utf-8?B?RDhFdTI0bkVmU0REd1N6Mi9vcG8wa2hsaDYxK2k4Wkd1bmVQM1NvaW5JZkhp?=
 =?utf-8?B?Nk92aS9DWERId2YvYXpyU0pvZ2lHVWFXWkxiSFBLNWtzbCtOcGs4NnhacTBj?=
 =?utf-8?B?MDV0aFRMbStsaWRZb3g5YzZWWlE5UkxoZEZNdENwYVRpTk1rb2YzZjBoU0JL?=
 =?utf-8?B?emdIMHIrbnRyaFl5bEI2SGFwU29FUU4zVS9FL1NxQlU1Rlo4ZXZob2NpS0NH?=
 =?utf-8?B?ZGppL3kxeEpiZ2lxcWRVazRLZDBmazEvQ2N3TXZ0WDNpeDJLVWVjNkIrdjZL?=
 =?utf-8?B?ZVlmdnZFb2lyQXRFWXZvQ1VhaEduTk5PeFdyMzRJTmI5OWU1MG5nQU03Z0Vp?=
 =?utf-8?B?RlRGRlJ5SjMvUGJiTC9SVk5Bb3h5M1h3VldzSDRONkU4dUxrT2xFaUV4ZmU4?=
 =?utf-8?B?SHBjSzh3TVA3N3FSMFloSjdkbWFqZkVGaDVLeTFSY2xMRnJlWkM4SmZxYU4r?=
 =?utf-8?B?UW9OQjMrNWwyc0xpNk1adTV1Y3RscUJ5ZEx5bTBhRHZXLzNVN3BBUnpXdi9o?=
 =?utf-8?B?SjMyUUVSSGxlNWFsRWZsUW5WZG1ZOEk1QnVRTDZYb04rWlRSUW9WWlc5Mlp4?=
 =?utf-8?B?NHZHQVEvbkFublBXSk55RnF4aUt3RzI0TFJ6b0o0SVJvUjk1SWdkOTM3ZGZX?=
 =?utf-8?B?d1NMWlVxV2FOUUk5YWFkNnlzRXcvdy9FSitmTWRkWGlzVjY3S0xPMzhnb3pt?=
 =?utf-8?B?UzhnYURvdmhGT21yZlp2RzAyT2FwNitoVnh3T1liNDVETTZPbFg5eXBhRUZD?=
 =?utf-8?B?cm80bk9jQU5WWlg1MFJNZ0JkOUpBbFpsbjJ4T0hMNDhxT0ozY2FxSEZ4MUd6?=
 =?utf-8?B?TlplK0h1WU1KWXY2V0dwTXdza3JCQmRsNURxOXBzb0YzYWZER0tDb1pYNUYw?=
 =?utf-8?B?TFBoTStidjd3SWRpMDliWGl6Y3pMY1RubXkxc0lISUZHVzZrZkE4MjNPV0Vw?=
 =?utf-8?B?MmEvS0NpOGdKWlIveDNlNVJ0TTZGQWVCbFFMbS9NWUZzb1c2SWRpdCtMWlow?=
 =?utf-8?B?VkFPdW9QQXpZcE1rcDRJUWVtTU95Q0NaSnB6ZVpWVlFEK3NTZ3RsY1NvWmMv?=
 =?utf-8?B?YmhJNkkzck5UbGNkbjlpWGJubDhDREZPMDArUWNtWWFCd3FrSmlyUFpzbnF1?=
 =?utf-8?B?U21JM2o2K2NyMmZyNTl5b3JtTjR3OVdOS1c1SDJiZGc3UklOSjVPMTdRV1Fl?=
 =?utf-8?B?SFVmNElVVnl5SzlTaVV3QzRIMVk4YkhKRjBTZnRTb1plZTZSOGxCdkptTURq?=
 =?utf-8?B?MDhOUE05Tm1taGI5LzE3S0xJWDY1VHFmTmxZUmNLTnlGRlNsVTBFV3VmaEU1?=
 =?utf-8?B?bTJJYnV2cEpwOUs1bU9BcVY1MEdKSHBUSjhEcmhlbEFZamEybEZpSlpVOUdp?=
 =?utf-8?B?d0I5R0hqWHBGczZuR2pSQWxOaDNVODk4Z092VE9meEIzQVc4aU8vYk04QWhF?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c3724a-8174-4195-def1-08dd6d1a33d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 10:29:06.2134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fJQyq5ONtTx2yciMucLTp1Em9OCP8mHsg1Ec1lV4cnnFmAQlnIRpD1wKSpXA/Jrq2p30LksrfGSQ+k0kbbpcvJfAKKxyo9Pm2s2is7pB80A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB15340

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiAyNyBNYXJjaCAyMDI1IDEwOjE2DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjQgMTEvMTddIG1lZGlhOiByemcybC1jcnU6IEFkZCByZWdpc3RlciBt
YXBwaW5nIHN1cHBvcnQNCj4gDQo+IEhpIFRvbW1hc28sDQo+IA0KPiBUaGFua3MgZm9yIGJlaW5n
IHBhdGllbnQgKGFuZCByZW1pbmRpbmcgbWUgYWJvdXQgdGhpcykuIEFwcGFyZW50bHksIEVtYmVk
ZGVkIFdvcmxkIGlzIGJhZCBmb3IgZS1tYWlsDQo+IGJhY2tsb2dzLg0KPiANCj4gT24gVGh1LCBN
YXIgMTMsIDIwMjUgYXQgMDE6MDE6MjRQTSArMDEwMCwgVG9tbWFzbyBNZXJjaWFpIHdyb3RlOg0K
PiA+IE9uIFdlZCwgTWFyIDEyLCAyMDI1IGF0IDAxOjM3OjI1UE0gKzAwMDAsIEJpanUgRGFzIHdy
b3RlOg0KPiA+ID4gT24gMDMgTWFyY2ggMjAyNSAxNjowOCwgVG9tbWFzbyBNZXJjaWFpIHdyb3Rl
Og0KPiA+ID4gPg0KPiA+ID4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRl
di1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+DQo+ID4gPiA+IFByZXBhcmUgZm9yIGFk
ZGluZyBzdXBwb3J0IGZvciBSWi9HM0UgYW5kIFJaL1YySFAgU29Dcywgd2hpY2ggaGF2ZQ0KPiA+
ID4gPiBhIENSVS1JUCB0aGF0IGlzIG1vc3RseSBpZGVudGljYWwgdG8gUlovRzJMIGJ1dCB3aXRo
IGRpZmZlcmVudA0KPiA+ID4gPiByZWdpc3RlciBvZmZzZXRzIGFuZCBhZGRpdGlvbmFsIHJlZ2lz
dGVycy4gSW50cm9kdWNlIGEgZmxleGlibGUgcmVnaXN0ZXIgbWFwcGluZyBtZWNoYW5pc20gdG8N
Cj4gaGFuZGxlIHRoZXNlIHZhcmlhdGlvbnMuDQo+ID4gPiA+DQo+ID4gPiA+IERlZmluZSB0aGUg
YHJ6ZzJsX2NydV9pbmZvYCBzdHJ1Y3R1cmUgdG8gc3RvcmUgcmVnaXN0ZXIgbWFwcGluZ3MNCj4g
PiA+ID4gYW5kIHBhc3MgaXQgYXMgcGFydCBvZiB0aGUgT0YgbWF0Y2ggZGF0YS4gVXBkYXRlIHRo
ZSByZWFkL3dyaXRlDQo+ID4gPiA+IGZ1bmN0aW9ucyB0byBjaGVjayBvdXQtb2YtYm91bmQgYWNj
ZXNzZXMgYW5kIHVzZSBpbmRleGVkIHJlZ2lzdGVyIG9mZnNldHMgZnJvbSBgcnpnMmxfY3J1X2lu
Zm9gLA0KPiBlbnN1cmluZyBjb21wYXRpYmlsaXR5IGFjcm9zcyBkaWZmZXJlbnQgU29DIHZhcmlh
bnRzLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyDQo+ID4g
PiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IFRvbW1hc28gTWVyY2lhaSA8dG9tbWFzby5tZXJjaWFpLnhyQGJwLnJlbmVz
YXMuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gQ2hhbmdlcyBzaW5jZSB2MjoNCj4gPiA+ID4g
IC0gSW1wbGVtZW50ZWQgbmV3IHJ6ZzJsX2NydV93cml0ZS9yZWFkKCkgdGhhdCBub3cgYXJlIGNo
ZWNraW5nIG91dC1vZi1ib3VuZA0KPiA+ID4gPiAgICBhY2Nlc3NlcyBhcyBzdWdnZXN0ZWQgYnkg
TFBpbmNoYXJ0Lg0KPiA+ID4gPiAgLSBGaXhlZCBBTW5NQnhBRERSTCgpIGFuZCBBTW5NQnhBRERS
SCgpIGFzIHN1Z2dlc3RlZCBieSBMUGluY2hhcnQuDQo+ID4gPiA+ICAtIFVwZGF0ZSBjb21taXQg
Ym9keQ0KPiA+ID4gPg0KPiA+ID4gPiAgLi4uL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6
ZzJsLWNvcmUuYyAgIHwgNDYgKysrKysrKysrKysrLQ0KPiA+ID4gPiAgLi4uL3JlbmVzYXMvcnpn
MmwtY3J1L3J6ZzJsLWNydS1yZWdzLmggICAgICAgIHwgNjYgKysrKysrKysrKy0tLS0tLS0tLQ0K
PiA+ID4gPiAgLi4uL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNydS5oICAgIHwg
IDQgKysNCj4gPiA+ID4gIC4uLi9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC12aWRl
by5jICB8IDU4DQo+ID4gPiA+ICsrKysrKysrKysrKysrLS0NCj4gPiA+ID4gIDQgZmlsZXMgY2hh
bmdlZCwgMTM5IGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQ0KPiA+ID4gPg0KPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9y
emcybC1jb3JlLmMNCj4gPiA+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpn
MmwtY3J1L3J6ZzJsLWNvcmUuYw0KPiA+ID4gPiBpbmRleCBlZWQ5ZDJiZDA4NDEuLmFiYzJhOTc5
ODMzYSAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2Fz
L3J6ZzJsLWNydS9yemcybC1jb3JlLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC1jb3JlLmMNCj4gPiA+ID4gQEAgLTIyLDYgKzIy
LDcgQEANCj4gPiA+ID4gICNpbmNsdWRlIDxtZWRpYS92NGwyLW1jLmg+DQo+ID4gPiA+DQo+ID4g
PiA+ICAjaW5jbHVkZSAicnpnMmwtY3J1LmgiDQo+ID4gPiA+ICsjaW5jbHVkZSAicnpnMmwtY3J1
LXJlZ3MuaCINCj4gPiA+ID4NCj4gPiA+ID4gIHN0YXRpYyBpbmxpbmUgc3RydWN0IHJ6ZzJsX2Ny
dV9kZXYgKm5vdGlmaWVyX3RvX2NydShzdHJ1Y3QNCj4gPiA+ID4gdjRsMl9hc3luY19ub3RpZmll
ciAqbikgIHsgQEAgLTI2OSw2DQo+ID4gPiA+ICsyNzAsOSBAQCBzdGF0aWMgaW50IHJ6ZzJsX2Ny
dV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ID4gPg0KPiA+ID4gPiAg
CWNydS0+ZGV2ID0gZGV2Ow0KPiA+ID4gPiAgCWNydS0+aW5mbyA9IG9mX2RldmljZV9nZXRfbWF0
Y2hfZGF0YShkZXYpOw0KPiA+ID4gPiArCWlmICghY3J1LT5pbmZvKQ0KPiA+ID4gPiArCQlyZXR1
cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1FSU5WQUwsDQo+ID4gPiA+ICsJCQkJICAgICAiRmFpbGVk
IHRvIGdldCBPRiBtYXRjaCBkYXRhXG4iKTsNCj4gPiA+ID4NCj4gPiA+ID4gIAlpcnEgPSBwbGF0
Zm9ybV9nZXRfaXJxKHBkZXYsIDApOw0KPiA+ID4gPiAgCWlmIChpcnEgPCAwKQ0KPiA+ID4gPiBA
QCAtMzE3LDggKzMyMSw0OCBAQCBzdGF0aWMgdm9pZCByemcybF9jcnVfcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gPiA+ICAJcnpnMmxfY3J1X2RtYV91bnJlZ2lzdGVy
KGNydSk7DQo+ID4gPiA+ICB9DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IC1zdGF0aWMgdTMy
IHJ6ZzJsX2NydV9yZWFkKHN0cnVjdCByemcybF9jcnVfZGV2ICpjcnUsIHUzMiBvZmZzZXQpDQo+
ID4gPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQNCj4gPiA+ID4gK19fcnpnMmxfY3J1X3dyaXRlX2Nv
bnN0YW50KHN0cnVjdCByemcybF9jcnVfZGV2ICpjcnUsIHUzMiBvZmZzZXQsDQo+ID4gPiA+ICt1
MzIgdmFsdWUpDQo+ID4gPiA+ICB7DQo+ID4gPiA+IC0JcmV0dXJuIGlvcmVhZDMyKGNydS0+YmFz
ZSArIG9mZnNldCk7DQo+ID4gPiA+ICsJY29uc3QgdTE2ICpyZWdzID0gY3J1LT5pbmZvLT5yZWdz
Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsJQlVJTERfQlVHX09OKG9mZnNldCA+PSBSWkcyTF9DUlVf
TUFYX1JFRyk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwlpb3dyaXRlMzIodmFsdWUsIGNydS0+YmFz
ZSArIHJlZ3Nbb2Zmc2V0XSk7DQo+ID4gPg0KPiA+ID4gRG8geW91IG5lZWQgdGhpcyBjb2RlIGFz
IHRoZSBwdXJwb3NlIGlzIHRvIHRlc3QgY29tcGlsZSB0aW1lDQo+ID4gPiBjb25zdGFudCBhbmQg
SXQgd29uJ3QgZXhlY3V0ZSBhdCBydW4gdGltZT8NCj4gDQo+IEJpanUsIEknbSBub3Qgc3VyZSB0
byB1bmRlcnN0YW4gdGhpcyBjb21tZW50Lg0KPiBfX3J6ZzJsX2NydV93cml0ZV9jb25zdGFudCgp
IGlzIGNhbGxlZCBhdCBydW50aW1lLCB3aXRoIGEgY29tcGlsZS10aW1lIGNvbnN0YW50IG9mZnNl
dC4gVGhlDQo+IEJVSUxEX0JVR19PTigpIHZlcmlmaWVzIGF0IGNvbXBpbGUgdGltZSB0aGF0IHRo
ZSBvZmZzZXQgaXMgdmFsaWQsIGNhdXNpbmcgY29tcGlsYXRpb24gZXJyb3JzIGlmIGl0DQo+IGlz
bid0Lg0KDQpUaGFua3MgZm9yIGV4cGxhbmF0aW9uLiBOb3cgZ290IGl0LiBJIGRvbid0IHNlZSBh
bnkgZHJpdmVycyB1c2luZyB0aGlzIHdheS4gSGVuY2UgdGhlIGNvbmZ1c2lvbi4NCg0KPiANCj4g
X19yemcybF9jcnVfd3JpdGUoKSwgb24gdGhlIG90aGVyIGhhbmQsIGlzIGNhbGxlZCB3aGVuIHRo
ZSBvZmZzZXQgaXMgbm90IGtub3duIGF0IGNvbXBpbGUgdGltZSwNCj4gYmVjYXVzZSBpdCdzIGNv
bXB1dGVkIGR5bmFtaWNhbGx5LiBUaGF0J3MgYSBzbWFsbCBzdWJzZXQgb2YgdGhlIGNhbGxzLiBJ
dCBuZWVkcyB0byBjaGVjayB0aGUgb2Zmc2V0IGF0DQo+IHJ1bnRpbWUgZm9yIG92ZXJmbG93cy4N
Cg0KT0suDQoNCj4gDQo+IFdoYXQgZG8geW91IG1lYW4gYnkgIndvbid0IGV4ZWN1dGUgYXQgcnVu
dGltZSIsIGFuZCB3aGF0IGNvZGUgZG8geW91IHRoaW5rIGlzIG5vdCBuZWVkZWQgPw0KDQpJIGdv
dCBjb25mdXNlZCB3aXRoIEJVSUxEX0JVR19PTigpIG9uIGEgZnJlcXVlbnRseSBjYWxsZWQgZnVu
Y3Rpb24gYW5kIHRoZSBvbmUgd2l0aG91dCBfX3J6ZzJsX2NydV93cml0ZSgpDQoNCkNoZWVycywN
CkJpanUNCg==

