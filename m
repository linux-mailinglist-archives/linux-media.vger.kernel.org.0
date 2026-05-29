Return-Path: <linux-media+bounces-63003-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMfyAYszGWqDsggAu9opvQ
	(envelope-from <linux-media+bounces-63003-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 08:34:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 923695FDF8B
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 08:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5F5C3045AA5
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 06:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D77B3AA1A6;
	Fri, 29 May 2026 06:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Z80QxDCV"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8933A3E88;
	Fri, 29 May 2026 06:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780036486; cv=fail; b=eQh9eknuXbcGUTiFZYwzLU6ExmqeIcmLnzr3KPxcL055Oao8pyCeoAxbastM4/U86KIYAJGLvzLvSvqhBcgELy6FfiLQ4JawlA+8aM5If9pFWpCkksUXy8TzTQhzpG+lOl5Ne6ONTObYzc+6kBq1JG0KnJqpUZSQr0f++9AgtM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780036486; c=relaxed/simple;
	bh=Fu6AVnqfiiS8wYCSssoKKN6IYqtlCM82WblVihNNoUk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=heRIxVJdjGq8tlZCuPoIJ1WGEG0MZPPxrvVMaVGbivXXev86SdWyH6N0Zl5d+gJiVWx+Y4FY8LikdxMj00JttI9GWKVC9CIeEaWoI4W54Fg8Qu/Jj3OhO9+7ZLTJc0zP0Ltl0/m3yI2x02RbMJSpQn79gXTwW23SFxpG6iuwUYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Z80QxDCV; arc=fail smtp.client-ip=40.93.194.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhFjnNPaC8Oo5Tqu+d+nOB7FcXCvZeYaTraRItpREnJa5rhUYg7Q4Pwc1hbHzmSi81rsdpNnycsXZ/D6z+mdrosNDG6Xo6+9+NWzti1Ttv4DbUKdT43YrQ55V9yuW03NkzfUmTMfJt6HdjU9JAJvykFUlZ334FFjSl/qadCmYDezvotK2BdSWz48VOjxsNoyUu2RTNZUCYnv3yQRTb2rrPvyCMhwHc+J7gGoT8QMwxR/xeUAw8ALu4T8M5liKDm6jB9m5e1sLANkM4lQtTgj5ZeaDI6PwXRZB+V5Z2sTUN1JH7V/8o8XWMoXj4fXQoXrwOu5JNpQ/lLozRmkTaZkRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu6AVnqfiiS8wYCSssoKKN6IYqtlCM82WblVihNNoUk=;
 b=bsNI6pXNARfhTSFcDDAjZ5nihdHjLlWmsub1dRD6uE/dcXJOkfBMh8Qs/KviW4dHkU/dEcOnpdPYUiS3j2tnNIwraD5S8zdBUOFHbhejZEQMklgnktTR7PF9LvgRVkzydTT39U9pMDXJf8JhFiQfz6gsB9PNibRlfoiuXrWbEDNH0a+M1kIvNGP/CByPnPOPeBfJeMMcniaZIM3DrKnyJkjWJj/ck8DZBxFhx5h689dx9gvdxsUDpyNtiJf5thfHTToOFSFACHxotvF9aiqawYsiEm1OXiJ4w3TEM2cxhNIkwQvpnGeRxjNrJIBv0Hv5EIWICulMXAod9GKTskEgMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu6AVnqfiiS8wYCSssoKKN6IYqtlCM82WblVihNNoUk=;
 b=Z80QxDCVuaoLzQt+kj5WY2k0D85DV/vYbwU0JemKa+botHrWVJDcukPQgKPmSL1fnFfskNKDz2Q7M2vl+D8DA4sJc8PPHy2oSpL8LEvPx/C8XP9b7XDk0sN+yy6AgyseUwkP7aDcwcyFMEo2UdvoTmj7ezxBAe2+Kf4dnHq9+ZNyecNPyxkGkmNw/YLAT4yWKpZ/rQa4UeLergA6XP/EYBDkKPONduaYr5alAoX5zG9WmDoShcP3Qr5KRkeoGPiA4WPMICldLZhnj9AODCc5a60zsAuprNE7v7UpFMWei0M6ybyQ33M3ZmB1ZSoIBMcXd5mB7dc2/amzm76AqUQsiQ==
Received: from SJ0PR11MB4910.namprd11.prod.outlook.com (2603:10b6:a03:2d7::7)
 by SA1PR11MB8254.namprd11.prod.outlook.com (2603:10b6:806:251::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 06:34:41 +0000
Received: from SJ0PR11MB4910.namprd11.prod.outlook.com
 ([fe80::7af:4219:9135:f1a5]) by SJ0PR11MB4910.namprd11.prod.outlook.com
 ([fe80::7af:4219:9135:f1a5%5]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 06:34:41 +0000
From: <Balakrishnan.S@microchip.com>
To: <ehristev@kernel.org>, <mchehab@kernel.org>, <hverkuil@kernel.org>
CC: <laurent.pinchart@ideasonboard.com>, <kieran.bingham@ideasonboard.com>,
	<sakari.ailus@linux.intel.com>, <Balamanikandan.Gunasundar@microchip.com>,
	<stable@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 11/12] media: microchip-isc: smooth AWB gains with EMA
 filter
Thread-Topic: [PATCH v5 11/12] media: microchip-isc: smooth AWB gains with EMA
 filter
Thread-Index: AQHc7ckeWslZ5BiNpUCnIKfbqvtxGrYj4zYAgACrrIA=
Date: Fri, 29 May 2026 06:34:41 +0000
Message-ID: <ebf04a71-5486-4cd4-bb6d-ebe461e6c600@microchip.com>
References: <20260527-microchip-isc-fixes-v5-0-b0ec1bb954be@microchip.com>
 <20260527-microchip-isc-fixes-v5-11-b0ec1bb954be@microchip.com>
 <0431e778-cc48-4053-a96e-21222aab8551@kernel.org>
In-Reply-To: <0431e778-cc48-4053-a96e-21222aab8551@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB4910:EE_|SA1PR11MB8254:EE_
x-ms-office365-filtering-correlation-id: 305062a8-d2f4-49c1-1326-08debd4c5d7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|11063799006|56012099006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 xIgl9OpwBXPWfX1pqp5pEBnq+nVhQWHv19OwQXdC1ZU3hm8FkJTm1PPR11jzC/yVLndzXdgGGHzBd501LmW2qUvvmeJL8/MqzgJ1mbQEDE0GIYy7OK3cnjS2xcdp6ryjXa8FN5ni7Z9FzZOgYpi5ajcshKl47ouTyW0XdZR/2FVvmBI9/SlymveYIdh+mGgH+QMMnOF2Wpno5ycU237TU+K5w3RnS53LONUa4aaiD2ouez1eCalMnDXkx29MJiTXGzLm3Ih3vBqG96mQeGZeN9BQuu2LnzcKwH0Ou8wJ/1qlLWU4qIEKNMARykEXgfPYaF8IBxo0DfLJ3Jz5yb8Zmy2nDQ3YGIwl0acM7Vv3R88VppnqGiqzDdn8zu17gH8y65/pFEGTotyGm4zNZkbVbMHu1M4WyE4nQK+Ga5z+cCnkcA4QrPiM/7HZt1cFayS7xNbadMMFiiQJaTvYgohTHesbbcdSOs7Q/ZCVZdC35XoNjyXHoVYdhAyngdSwP6S8mlofBAyi91iKVzEzJOqifhjbb+7l4sORqp9FJ1DORXhvm4r+19zO448biYZ3ZuCNlL8ztFcZW56BG+rtjG4Zjro9JX3UngLbX7jmsKuB0yMtj7F6H/xQSux45veBqUSJYpi2WfRa0gPZQJHxyvwoB+VGWf9OrWkvnHiM0+qIxFDZe2LPlBOPyx8xsZ2DRdDi9p4SnTin9IZC9u1cIPyIwSVodPQiO8iHUPdOV3v5tXRhmI6X/8nR60aLUBIZRh/l
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4910.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TDBKOHd2YkpOb2hkRkRiUENDd2VqMGE5c2k2aGJCdzVCeVNsVEw4Y3V4Q1Jz?=
 =?utf-8?B?U3FxOWVvN2V4U3cwYTc4ellGV2Exa3ZwUHZuQmsrZVMyVWI4dkhlaWxucUxU?=
 =?utf-8?B?V1NMUHB5NDFDNk8zK0tEQmlyMlh2YUpwN3BHN1hhbzZsaWZZNjBmVXVTMnZk?=
 =?utf-8?B?OWVrQnVIYU5NQkxSRnc5TjNjTkJzVitPWk1oQ01GdVAxRHlDMHJJUjFwdUM3?=
 =?utf-8?B?QlA1TnIwR2k5cU9QUzN5MVNFWnFMc0R5L1BvejgzMER3cjJqNUZBcUxBVmpY?=
 =?utf-8?B?SDhYSGF1VEE2Q2x6T2ZqQXJtM21kSElLUi9EamVaWVMzTlNpNnlLZlg0VlhM?=
 =?utf-8?B?Y0xMb1N4K2lCMTYzWjJ3cVFTTXJMMG1hQWFrZktrN2dMS3RBYVRacVc2a1ND?=
 =?utf-8?B?eFNkR1FGTEk5RGxkaHFzSkpqdGY2RFFETGt4Z0xMeThYN3oxYjhSUGxSRGk5?=
 =?utf-8?B?eUxLbkc1ajNLY0ZCdjhiTUJIQ3pQQStnRzBkQzJzWUFROTR4OGlZQWsrMnVP?=
 =?utf-8?B?cEtneGd0aDFVUk1SclRIUVMyNDl0aXRjVHVmUHFoeXprYitPZnVpejBzWGVt?=
 =?utf-8?B?bGdRS3RrUEJxbjhlSU03NE1PLzBXSERyM0FVUG5OY3hIU01ZSmRKSWsrYmp3?=
 =?utf-8?B?dm5xM1dhU2Rxc1RMUDJIYXBMV0dpSjF3elg3RVc3S01QUUg2dVFyUHNlS2Y1?=
 =?utf-8?B?M1JqeGRxanQ5KzYrTFdlczI1NkpJUm4xMlk4d3BJeVBDNWNtOUpLdVgvS2ls?=
 =?utf-8?B?UGh4T3ZkellvZDlGcXBpenFkWWw1aFE2VG5rVnhSanFocXg0THlUdjhYdndj?=
 =?utf-8?B?MEF3R0hnN1Bta21lZEtDMk9BY2ZyVis2SzhhcVNVY1MrK2J1TXF2eENPUVlz?=
 =?utf-8?B?Z0ZoWEZnYXFrS1JSTTBKUXFhQVVOM0dlMnhoZlZ3em02RVphYXMrZ2p6WDNr?=
 =?utf-8?B?OG82ckZKVHYrcXNyWDg2ZzF5WU40MEhQd2E1YytudEdPZTdWV0xFT08zWml3?=
 =?utf-8?B?bkFlVlFMSVdwZzdTbjY4a2tnMDQ5UG5neFk0Q1dja0FERWRtQUtCVmQzTnQr?=
 =?utf-8?B?SGZYVVJqdDZQZEJNV3NjNjNRMTVvaE5XdUYzcDkwelQyNERvdzVJYjBpYTI5?=
 =?utf-8?B?YnpWYzFmUVlhQ0V3L3dYb2tyVXkzWGZyV01IeU5lS0FmSnBqR3JMNGFKVEpH?=
 =?utf-8?B?TzdKNHZyQWxrME40Tnh6aTRvZ3F2cUQya1l6cU8vU1ZzZnZyb0hxalNOMEpE?=
 =?utf-8?B?MXRkTXFaclZqS1AxVEVtSkx4NGQ0RUgwRTQ1Z3FRNHl4ZCthQVRzL3EzeGVp?=
 =?utf-8?B?TWltcitPczU5cENZWXF5R0JDTExidFNqYXNYQWJBSFlDajI0aWgrck5ZUUxT?=
 =?utf-8?B?YWtYcU16c24rU2w0L1NCNzFXdTBWcnBEQ21HRkw0RjhmVkg2Vnc5WDVQSmRm?=
 =?utf-8?B?L3hFZmsvZ0c3TVc0UFlJTE50NSs2TWlYaWw4b3RmRWVZUTVBL3lvd1VaWDlq?=
 =?utf-8?B?VXhzVzRES1poUmFZdWZqSHBRTFFvT2RtZzhnRGZvUkRFV0d4NlVwSW90ZUFV?=
 =?utf-8?B?eWU5ZWpNRS90cWFhQnhRZFBLTUVFOXFOWmtucnoyZU5iblRmZnBVejc5SFZY?=
 =?utf-8?B?SkhqUFowQ054bmovZ3A4OHIvRHpadkxOQzcvb1dVdUdONnJtREVwMC82U012?=
 =?utf-8?B?Ui92VXV6bEtHKzVjZk5TcytNVlBpT1lOMy9NdVFnTVZLL3V2ZmFUQloyZlRm?=
 =?utf-8?B?aEg2QzB4UXF6N1BycVZLNTBPRkx5QUxpdU5WMGhtTFRBVEpsblo0ZWptd0pD?=
 =?utf-8?B?Slo5ekRJdTZ0Y04raHBPd0tEOURUUVNMMFMySllVSjVzMjV6WkR4TUNPVkRD?=
 =?utf-8?B?czRRNFpQYks0VHBKTUFnUEdQNzFGT0VNMENrTTQ5L0Z2NHV6K3FXOGRQU3NP?=
 =?utf-8?B?QVJhdFdnMVQ1d2Nocmh1MXhrVC8rMmp2OWpEeFF5VWpEREEwOStMQlBidmVo?=
 =?utf-8?B?a2lsRW9mVmRSSXJPaWtBUFRkNis5Zm9KNVJ3TGZhQkpCQzl6UWxIVWpPRzZC?=
 =?utf-8?B?MGIvbHZibHJxZ1UzcGE1TlBCaXVkaDFqZDk0anRkK0dPdVRHMmNqOHhFQ3Zj?=
 =?utf-8?B?MVMvNmtIUkEvMm5pK3lpVlBNOUZSUks2aVdiZWZMWjM2NDZ3T2FJTm9GQ3NE?=
 =?utf-8?B?TUFEajFVeFpIMDI5NnpNWHhjVEZCdC93YnF6c0hUSGdjeFM2NXNJWTZvYzZM?=
 =?utf-8?B?SWtKU3hTVW53azQ1bys5V1E3VFhUWDdBaWZLc2JxalZSV3dlTklsN1hUd1J0?=
 =?utf-8?B?cFhvNnMrRFVUY3drV245bk1xR0VhcFFsNEJuUUgrWUhrUVJFTWlHQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0106EBA82EE0B24D91177F1C621123D9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4910.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 305062a8-d2f4-49c1-1326-08debd4c5d7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 06:34:41.6087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /VhuyC4I+WRU5D0KbfY4g2bso5/4LuzeFbI62mvi8QaVaBSBJZd3n0Q+HqoSaxgCBwx0dn/jxCvp919bI9EMYmEpYeidwXwPO+nwD9Btr3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8254
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63003-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Balakrishnan.S@microchip.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[microchip.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Queue-Id: 923695FDF8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgRXVnZW4sDQoNCk9uIDI5LzA1LzI2IDE6NTAgYW0sIEV1Z2VuIEhyaXN0ZXYgd3JvdGU6DQo+
IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gNS8yNy8yNiAxNDow
NywgQmFsYWtyaXNobmFuIFNhbWJhdGggd3JvdGU6DQo+PiBBcHBseSBleHBvbmVudGlhbCBtb3Zp
bmcgYXZlcmFnZSAoYWxwaGE9MC4yNSkgdG8gcmVkdWNlIHBlci1mcmFtZQ0KPj4gZmxpY2tlciBm
cm9tIHNlbnNvciBub2lzZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBCYWxha3Jpc2huYW4gU2Ft
YmF0aCA8YmFsYWtyaXNobmFuLnNAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL21pY3JvY2hpcC9taWNyb2NoaXAtaXNjLWJhc2UuYyB8IDE5ICsrKysr
KysrKysrKysrKystLS0NCj4+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9taWNyb2NoaXAvbWlj
cm9jaGlwLWlzYy5oICAgICAgfCAgMSArDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9taWNyb2NoaXAvbWljcm9jaGlwLWlzYy1iYXNlLmMgYi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL21pY3JvY2hpcC9taWNyb2NoaXAtaXNjLWJhc2UuYw0KPj4gaW5kZXggYTI3MTk4
MzBkMzliLi5kMDdlYTJmYTMzYzYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL21pY3JvY2hpcC9taWNyb2NoaXAtaXNjLWJhc2UuYw0KPj4gKysrIGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9taWNyb2NoaXAvbWljcm9jaGlwLWlzYy1iYXNlLmMNCj4+IEBAIC05NCw2ICs5
NCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBpc2NfcmVzZXRfYXdiX2N0cmxzKHN0cnVjdCBpc2Nf
ZGV2aWNlICppc2MpDQo+PiAgICAgICAgZm9yIChjID0gSVNDX0hJU19DRkdfTU9ERV9HUjsgYyA8
PSBJU0NfSElTX0NGR19NT0RFX0I7IGMrKykgew0KPj4gICAgICAgICAgICAgICAgLyogZ2FpbnMg
aGF2ZSBhIGZpeGVkIHBvaW50IGF0IDkgZGVjaW1hbHMgKi8NCj4+ICAgICAgICAgICAgICAgIGN0
cmxzLT5nYWluW2NdID0gMSA8PCA5Ow0KPj4gKyAgICAgICAgICAgICBjdHJscy0+Z2Fpbl9zbW9v
dGhbY10gPSAxIDw8IDk7DQo+PiAgICAgICAgICAgICAgICAvKiBvZmZzZXRzIGFyZSBpbiAyJ3Mg
Y29tcGxlbWVudHMgKi8NCj4+ICAgICAgICAgICAgICAgIGN0cmxzLT5vZmZzZXRbY10gPSAwOw0K
Pj4gICAgICAgIH0NCj4+IEBAIC0xNDc3LDExICsxNDc4LDIzIEBAIHN0YXRpYyB2b2lkIGlzY193
Yl91cGRhdGUoc3RydWN0IGlzY19jdHJscyAqY3RybHMpDQo+PiAgICAgICAgICAgICAgICAvKiBD
b21iaW5lIHN0cmV0Y2ggYW5kIGdyZXktd29ybGQgZ2FpbnM7IHJlc3VsdCBzdGF5cyBpbiBROS4g
Ki8NCj4+ICAgICAgICAgICAgICAgIGdhaW4gPSAoc19nYWluICogZ3dfZ2FpbikgPj4gOTsNCj4+
DQo+PiAtICAgICAgICAgICAgIGN0cmxzLT5nYWluW2NdID0gY2xhbXBfdmFsKGdhaW4sIDAsIEdF
Tk1BU0soMTIsIDApKTsNCj4+ICsgICAgICAgICAgICAgLyoNCj4+ICsgICAgICAgICAgICAgICog
U21vb3RoIGdhaW4gdXBkYXRlcyB3aXRoIGFuIGV4cG9uZW50aWFsIHdlaWdodGVkIGF2ZXJhZ2UN
Cj4+ICsgICAgICAgICAgICAgICogdG8gc3VwcHJlc3MgcGVyLWZyYW1lIGZsaWNrZXI6DQo+PiAr
ICAgICAgICAgICAgICAqICAgc21vb3RoW25dID0gKDMgKiBzbW9vdGhbbi0xXSArIGdhaW4pIC8g
NA0KPj4gKyAgICAgICAgICAgICAgKiBDbGFtcCB0byB0aGUgaGFyZHdhcmUgcmVnaXN0ZXIgd2lk
dGggdG8gcHJldmVudCB1bmJvdW5kZWQNCj4+ICsgICAgICAgICAgICAgICogYWNjdW11bGF0aW9u
IHVuZGVyIGRlZ2VuZXJhdGUgKG5lYXItZW1wdHkgaGlzdG9ncmFtKSBpbnB1dHMuDQo+PiArICAg
ICAgICAgICAgICAqLw0KPj4gKyAgICAgICAgICAgICBjdHJscy0+Z2Fpbl9zbW9vdGhbY10gPSAo
MyAqIGN0cmxzLT5nYWluX3Ntb290aFtjXSArIGdhaW4pIC8gNDsNCj4+ICsgICAgICAgICAgICAg
Y3RybHMtPmdhaW5fc21vb3RoW2NdID0gbWluX3QodTMyLCBjdHJscy0+Z2Fpbl9zbW9vdGhbY10s
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdFTk1BU0so
MTIsIDApKTsNCj4+ICsNCj4+ICsgICAgICAgICAgICAgY3RybHMtPmdhaW5bY10gPSBjdHJscy0+
Z2Fpbl9zbW9vdGhbY107DQo+IA0KPiBJZiBub3cgJ2dhaW4nIGJlY29tZXMgJ2dhaW5fc21vb3Ro
JyAsIHdoYXQgaXMgdGhlIHB1cnBvc2Ugb2Ygc3RpbGwNCj4gaGF2aW5nICdnYWluJyBhdCBhbGwg
Pw0KPiBEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8ganVzdCByZWNvbXB1dGUgZ2FpbiBpbiB0aGUgbmV3
IHdheSA/DQoNCkkgaGFkIGtlcHQgZ2Fpbl9zbW9vdGhbXSBzZXBhcmF0ZSBzbyB0aGF0IGlzY19z
X2F3Yl9jdHJsLCB3aGljaA0KYWxzbyB3cml0ZXMgY3RybHMtPmdhaW5bXSwgd291bGQgbm90IHRv
dWNoIHRoZSBFTUEgc3RhdGUuDQoNCkdvaW5nIGJhY2sgdGhyb3VnaCB0aGUgY2x1c3RlciBzZXR1
cCwgdjRsMl9jdHJsX2F1dG9fY2x1c3RlcigpDQpncmFicyB0aGUgc2xhdmUgZ2FpbiBjb250cm9s
cyB3aGlsZSBBV0IgaXMgaW4gQVVUTyBtb2RlLiBUaGUNCnY0bDIgZnJhbWV3b3JrIGFjdHVhbGx5
IHJlamVjdHMgdXNlciB3cml0ZXMgdG8gdGhvc2Ugc2xhdmVzIGJlZm9yZSB0aGV5DQpyZWFjaCBp
c2Nfc19hd2JfY3RybCB3aGljaCBJIG92ZXJsb29rZWQsIHNvIHRoZSBjYXNlIEkgaGFkIGluIG1p
bmQgDQpjYW5ub3QgaGFwcGVuLg0KDQpUaGFua3MgZm9yIHRoZSB2YWx1YWJsZSBpbnNpZ2h0Lg0K
DQpXaWxsIGNvbGxhcHNlIGdhaW5fc21vb3RoW10gaW50byBnYWluW10gaW4gdjY6DQoNCiAgICAg
Y3RybHMtPmdhaW5bY10gPSAoMyAqIGN0cmxzLT5nYWluW2NdICsgZ2FpbikgLyA0Ow0KICAgICBj
dHJscy0+Z2FpbltjXSA9IG1pbl90KHUzMiwgY3RybHMtPmdhaW5bY10sIEdFTk1BU0soMTIsIDAp
KTsNCg0KQmVzdCBSZWdhcmRzLA0KQmFsYWtyaXNobmFuDQoNCj4gDQo+IA0KPj4NCj4+ICAgICAg
ICAgICAgICAgIGRldl9kYmcoaXNjLT5kZXYsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgImlz
YyB3YjogYz0ldSBibGFjaz0ldSBhdmc9JXUgc19nYWluPSV1IGd3X2dhaW49JXUgZ2Fpbj0ldSIs
DQo+PiAtICAgICAgICAgICAgICAgICAgICAgYywgaGlzdF9taW4sIGNoYW5uZWxfYXZnLCBzX2dh
aW4sIGd3X2dhaW4sIGdhaW4pOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICJpc2Mgd2I6IGM9
JXUgYmxhY2s9JXUgYXZnPSV1IHNfZ2Fpbj0ldSBnd19nYWluPSV1IGdhaW49JXUgc21vb3RoPSV1
XG4iLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGMsIGhpc3RfbWluLCBjaGFubmVsX2F2Zywg
c19nYWluLCBnd19nYWluLCBnYWluLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGN0cmxzLT5n
YWluX3Ntb290aFtjXSk7DQo+PiAgICAgICAgfQ0KPj4gICB9DQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWljcm9jaGlwL21pY3JvY2hpcC1pc2MuaCBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbWljcm9jaGlwL21pY3JvY2hpcC1pc2MuaA0KPj4gaW5kZXggNDUx
NjhjNjJlM2JjLi4wYWU5YjRlOGYzMmQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21pY3JvY2hpcC9taWNyb2NoaXAtaXNjLmgNCj4+ICsrKyBiL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbWljcm9jaGlwL21pY3JvY2hpcC1pc2MuaA0KPj4gQEAgLTE0OSw2ICsxNDksNyBA
QCBzdHJ1Y3QgaXNjX2N0cmxzIHsNCj4+DQo+PiAgICAgICAgLyogb25lIGZvciBlYWNoIGNvbXBv
bmVudCA6IEdSLCBSLCBHQiwgQiAqLw0KPj4gICAgICAgIHUzMiBnYWluW0hJU1RfQkFZRVJdOw0K
Pj4gKyAgICAgdTMyIGdhaW5fc21vb3RoW0hJU1RfQkFZRVJdOw0KPj4gICAgICAgIHMzMiBvZmZz
ZXRbSElTVF9CQVlFUl07DQo+Pg0KPj4gICAgICAgIHUzMiBoaXN0X2VudHJ5W0hJU1RfRU5UUklF
U107DQo+Pg0KPiANCg0K

