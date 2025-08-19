Return-Path: <linux-media+bounces-40213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFF7B2B5BC
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 03:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 302B519611C5
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 01:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD9C3AC3B;
	Tue, 19 Aug 2025 01:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="PACfcu4z"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021135.outbound.protection.outlook.com [40.107.42.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294862F32
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 01:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755566039; cv=fail; b=gOALef0eH0Sui9/lWnTqiT7oNWJrWu+OJuZ046DbnKGoqZozMyfQxuWFevHvXX52qzvQlVusi/H3udeaDpk+3R22B6qgwAvKHb+tB8ajSh8i88ICcdWlLnZNc1eZ5808xjYWx/+J7T8prsSN8HYlkfgqqm382Ssl29AO0jwM9Ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755566039; c=relaxed/simple;
	bh=h3dcE0U3Ja27jHrIIrIjiy4emOngH7zEZ8d2N3riebc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PMy149pB8ghNkmHLryJ5kHRlMrjyxK7Jq6ltEU48lvB0A0fcI6NwJephr+2drNX0jJSEuG2OJFLXhpofWmImOt8cW6jg5ov3+XDxAvcn98MqYHe2OiQXIamxAxaNzb/6+Dk8Xg662cg+FpICIc1NGNyBriFDK1Ayd4tobICi/uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=PACfcu4z; arc=fail smtp.client-ip=40.107.42.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEFnKcskdTWbZ40xboAOZ/l3ZaonPaLKss0eBjHOSbTQqJr5UUIpYhU9adPQUJexVVMFhpi6ZVtGMvmIo6CqNdnVkhU5iA5s7yZUVwEjw6UxvO/Z1y3Ang5ym7c++PZIsRP7ZV+OpvViTjuGxTahJr1TiuowGyAl2hz6ry853JKOT6Li5ORlgUFc0e2MVUAOb5FAs/hsjDFVFiY/3xgrA7hJsStyfjyLNHTPS7AH883nNCfvxxvwFP32rs/Xly6baCZQPyQzAbQQNwpgkmK1VKI3ttreWREASDTUXb2BcQU1FsQi6GTGmbcXlk0icl7UB2vSPOVMwjbhfPvOUxG2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3dcE0U3Ja27jHrIIrIjiy4emOngH7zEZ8d2N3riebc=;
 b=TLpJidNaNGOOV3D3+JprvZEp1qK9eQ1pyJWuE2nMlQ++xeiZ15dMDN9oubCVawn/+IeLyBWQ78HUhnjiJpValdcSUUNY8Ojy3hGoB2zacbP2V/ie7To7bzrt3CFbQNPYRpjkWq6bU2OrdKV3nqHCkfpcZ4N6vLC1hyP05bLZszK7pHNFaJf+El4TpOFEkJuKOhyP2uXb04CPfKOTPcWTuRcXcxOgNRRuaoBnNTRFWkhU2A/H/beYMrK7QDVSJoyFWusRY1nZAwXRN3Osc0/AaXK0UL8m/HEwRUat/+yLDyrMStA9UAi1m27SzeH3L1CsROQHZ7YGneNO5kvRDY8cPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3dcE0U3Ja27jHrIIrIjiy4emOngH7zEZ8d2N3riebc=;
 b=PACfcu4zzfo8QYmkSz7pBorbaY/sLkOMFEDZYSpalYASyP+M5TXemLBRvNxqWhGfcBsFX32xLY125PFVx14Dz5NqWOITb4fgoVDYDXDOgE8qP2x6Jy7DXwJGtAo2ByPFQ3tqX8QnInxs+2IxUsm5E8Og3F+CXEk+LBzjIaCaSW0=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SL2P216MB2109.KORP216.PROD.OUTLOOK.COM (2603:1096:101:155::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.12; Tue, 19 Aug 2025 01:13:51 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%6]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 01:13:51 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Linux Media Mailing List
	<linux-media@vger.kernel.org>
Subject: RE: How to construct a Gstreamer pipeline using crop feature for v4l2
Thread-Topic: How to construct a Gstreamer pipeline using crop feature for
 v4l2
Thread-Index: AdwQCgSqymWIBYFATUywBFGjDVfkrgAVfrqAABGceeA=
Date: Tue, 19 Aug 2025 01:13:51 +0000
Message-ID:
 <SLXP216MB114886627DF685983B23CD92ED30A@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References:
 <SLXP216MB1148BE257D9FDA62BA7680EFED31A@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
 <2cd17949c94940377b1e2cd9879f88150fb798db.camel@ndufresne.ca>
In-Reply-To: <2cd17949c94940377b1e2cd9879f88150fb798db.camel@ndufresne.ca>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|SL2P216MB2109:EE_
x-ms-office365-filtering-correlation-id: 6967e721-9d90-4a63-510c-08dddebda87f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dE5WVm0xTUMvL3F5UkFNUjVSQUFIS1FRNUN1RWg5RmJnSUoybUJIejlFZ1lY?=
 =?utf-8?B?azlNUSs3Y0pjTW80M2NZdkFMMi9HV1VBTTR5RHRrY1VNU1JFbVMrS1hISStu?=
 =?utf-8?B?VlRjMUNJdU15L0FMQUZYNjZ6SDdRc2h1bitRNzU1eUtySTJkcFE2cGRwT3VM?=
 =?utf-8?B?eEdZRWE3T2trWkx1QXFUbjVOL29rTjNIK1o1WnE4NmhnM3B1dGhFZDE4bTVl?=
 =?utf-8?B?bUNDcUVvSkZJUGQ4TUxodFJkYUNZQWp4K1FYckprSGVoWVdPcVp6L0QyaE1H?=
 =?utf-8?B?M2RQYmtTQURqRUpoVFlzallPOWxEOWMwUVJ4ZVliVlJVSHUzcVdCdkF1NWRy?=
 =?utf-8?B?RVVjRGJjZUpFZVZoUXY2VkUxU0hUZS83QUthWDlmYWZkdVhQTFcwN3UzTnFT?=
 =?utf-8?B?YTE4dWc0SWhXdlFBd09RSUttTE5iT0NWU0VjaTZQU1FQWlRvbHNLSXhEYmxs?=
 =?utf-8?B?VVRHOVhmR1lCWHBCVzc5QVI3ZDhlZlMxaGJIbk1ndHVNOFFjZVBmK1NEOHdx?=
 =?utf-8?B?b2dMZmVreXFZRjVWd2Qxc05Zd1FVeXBVcXRobEJHYWFwQ1VnYmFZai9qMEx0?=
 =?utf-8?B?TVI2YVZJdlZwRUllRExZQ0U2MlFucnBBOXBXMWpIV3hYRW5aUE9EbVkrVk1x?=
 =?utf-8?B?UXcyQVI2Z1B3L2JPbElXMjlMNTJJS0FSRk9iWVhzOEdDQUI5SjhQN3JJRmhI?=
 =?utf-8?B?cW0wWVAvaUtoTktlbXdlaE9vRDFVSWs2V1oyclpjc01nS3ByZ1FCaHNvQVBR?=
 =?utf-8?B?Qm5UbU5WTmJwTUpRVUhHYnFDZTdQL2FpT0lBeklBMlcxR0o3VXlMdFNEMTFY?=
 =?utf-8?B?Q3RFWjlCeGFLdDllaW1WNTlIMlpoTjZCazM4dGVVdEtNckRUMHpyLzRBRkFn?=
 =?utf-8?B?NTNPV0ZqWjc0NHd3UEtheWxpMGhMbExGRWEwVmFGeis4WlpzK0oxRTJKcTRO?=
 =?utf-8?B?QmRaRDJLcnhQd1ZMRFMzYW1jK3ZQdXlvRWZPeWZycndSamZtZDNxSEx2NkI3?=
 =?utf-8?B?MzZ5ZGlxeS85N1RHUkFOVWg1RnhKYjhOY000QitCRzBHaEpBVW90bk5KSy9G?=
 =?utf-8?B?RTRwZkVaelltbVRKKzBLNjlPa1FrTEU0YnVDSllXMFcxTUFXcFUwYnY2d0dZ?=
 =?utf-8?B?dDYrMFY5TlpRRW1OUFNwWnpjNVNxZjJJOU8wVlRhME0zZGR3a2xWbzhyTE80?=
 =?utf-8?B?RHQybytldjVwc1ljOGYxaHhWSVJzQ3JCTElNcFlzVjcyRUhobjdUUjIwNjVL?=
 =?utf-8?B?OXB4M29pT2p1bXQ2ZzF4SkVKbjI2VUpIOUM3R2ZJYm1LRzNOQ29EeHZGMDVM?=
 =?utf-8?B?bWxkNUdaOTlNSnl6R2xxN2ZTTzdYbi9STmRGUkxwQUVLZmw0QVpVSHY4Mm9j?=
 =?utf-8?B?dXl4eTFYSTZTRXRHakswUE5wYkVGNWpRcUZMV3pYd0ZRckZuUDUwajFDQXFM?=
 =?utf-8?B?K2JNVFIvOCtadHBXbXdYOFprQno3azh1ZmpEKytEbTg3WTJYQ3k0UWpjWWFT?=
 =?utf-8?B?L3lSOW9EbmFCRnJFV3AwdVZsM3NmRzdDa1NUNVdaQUc4SnhPa1JIT0tTZlpF?=
 =?utf-8?B?MkYzNjV3Znl4UXRBL1NoTW5PTEgxeXpwVlZTbko5bUY4NDJxVE9kdlEyTkVJ?=
 =?utf-8?B?UnVoOWtLTG94cmoyekNZenYrbmxBVkhNYUlEU2QvU1JiTzlROFIwZlFZclZi?=
 =?utf-8?B?dVFSdC80djk1Q3FrV3hQNzJvWUNOMWtjb1Zid0xUTUFsK3VtWGdDYTVERTBj?=
 =?utf-8?B?M2VDekRPMjFEZmU4RXhUbXlMUXBrZHFmWGxwbVJKTFMzNFFzM3NrZFovUnBE?=
 =?utf-8?B?MFhENXpCWVI4OW5MSUdFcloyZkhSclI5M0xWcTdCUUpjZUJJWnd0NmlZWita?=
 =?utf-8?B?S3lMRUpxNFFaOWJib2IrTFNwNWZHUm5vV1VpZ1dCd3dodnNRMDJyWFNTYVdD?=
 =?utf-8?B?K2lHekpGOVhIYjhlL05kYjZ0QW12Q2JDVnN2WUoyR211b3QxZDAvWiszWFpB?=
 =?utf-8?B?bkNYTHRUaWdRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vk1naEFadS9ibmY2TEhXRDdmWjJnYVFmdXIxYy95SzJrdGYyNVdScE9WMGNI?=
 =?utf-8?B?MkZsck9INS9UQllsN1RmNm5pRGkzRmhLYUVWdkFDR3Q2STBmdEMwZWYxTnN5?=
 =?utf-8?B?TXVjcVNkVTY2cGZaRGEraFlQQ052OWwxT1VMZHNoTGdEL21ucFI2d05TU3Iz?=
 =?utf-8?B?TlJvakZvcWp6UDc4Q3NleDNweVlJbjlSVDYwS2dZYzBqWXcwT1ltVG9teG1v?=
 =?utf-8?B?dmM5d3JSRGhwcElld1loNGdNMWp2Rm15NklqZFZ4VGpLSjNPS053U2lHSnpC?=
 =?utf-8?B?OG9SL2VCMXh2MS9vYTh1akU5MFJRcy9CQUFIMTZVQVFmU3I4N0VWZDRrVkhZ?=
 =?utf-8?B?aXdCYmh2UjlDdXdMSDN4U3JqTW9BVDN0TTcwYk1SVGhsa2dHZlA4bDdTMmdm?=
 =?utf-8?B?SG54SndEWU5mUk5CRi82Y1d2QndEa2NIRENTQ0ZDMFhRVVM2emtIQ05CZjN1?=
 =?utf-8?B?cE9WMlViQ09CTDVnRmliUWFWMENWUzBmbzJ2Z2R0OVJQZ0JaL25LTEhReVRB?=
 =?utf-8?B?bmZCdUF3UmZpMjdvcGhYeU5RQ3dPa0JPekViWWxFcmFpaHB4YnowTHdrQWh2?=
 =?utf-8?B?ZnJ2RUF2c1ducnlGclhpd2xRbXBGd1NhR2NHbHNCZ1hmQ0lKb1lrWmNXTU1l?=
 =?utf-8?B?R2pKTU55a3l3TXozZ05sKzRoU00vMXQzQnc3amp3OWw0UDBHcVVaeUVHNXdo?=
 =?utf-8?B?bWlnaUdXNXZNeldzckFGUjRpWFo4WDYzMkw3TlVnWFYyRmpWaXFpVlRBekZY?=
 =?utf-8?B?My9QK2ZLVFNmT0htM2hDcWVCYmxhVHpqMXRKOTJuWVFoOUpST1dLTFlWVDdC?=
 =?utf-8?B?aEhXRW1ZRkJvZkdhZXZTUStHaldRZ3kyeFZ4SW5RaU5ocHBIR1dYc21vbVlF?=
 =?utf-8?B?WFRzK0dTWGltZWpvc0o0a2drVlNoNS9xeWRFTE5yaDVPSm1rRlN0Z0tpdjA1?=
 =?utf-8?B?ZWEwVkh2OUZ2T1pjWHFqOG84MGxLZjVFVjBWQ2ZLTHdCTzZwNy90RVhMemUy?=
 =?utf-8?B?SnhhUXRTNjdhTjN5a1R1S0hqdklWWTBDSXU4aXN6a0g4bkJvQVNhbkxBMGZ2?=
 =?utf-8?B?aFA5QS9UZDVjbUZEZDlyRmhDdW9pWnY0WUhERmRlY2tnVkdGbFFYUUZPZ2x3?=
 =?utf-8?B?NldIeWozWFM3UnhzWERUVmVvQUd2UDZHMGpVa2p3Yk9VdG9RZHNZcndUa0xC?=
 =?utf-8?B?blVPbUlURkE0REpPSDNLTTVUWXJIMTFoRERXMVM0K3JjSmcrWnNsS2JwMS9h?=
 =?utf-8?B?WVVZSExjOHpkZDZ5Y2RsMEY0azdBdFJjUjBPRnVWWENzSmZrUjk3ODJEV0lN?=
 =?utf-8?B?ZFlONTBmNHVnN0tTcnRHaWY2eFU5dHhxM2Y0YWZiYkR5MTYrd3JsVVhDN1Iy?=
 =?utf-8?B?STNnMmUrL3lFRE5VMTFWcytXOTljSTVzWFpZcFVYbWFGWVZ4L1FpNGtpREFm?=
 =?utf-8?B?ak1MZ0pkUFhpRGpjZGZBL2ZBZHB4QzIyckZxY0Rxek1GZkdxTnA5Z01maWxq?=
 =?utf-8?B?WmpZTEhVSGp1WkU4Wk04M21kOHNhYUhVQk5VL0VQajhxemhwWTZwaVZ2VzYv?=
 =?utf-8?B?dldtTDBqWXF5WDhRbkNCMzNhM3hFK29DbFcrVGtVU1c3MTQ3bHhEdU0rOU01?=
 =?utf-8?B?NmNvQ2ZWbUVJUTBqUHNFcnBkU25VZXVHc0xtZEpyZXl4d3hmbldXU2tvSXRY?=
 =?utf-8?B?QzJXWXpOVGZNeldmUzNybmxCMWwzTmhmNWVjZGhlcEJnK0Y5dTF6WVVzSjNB?=
 =?utf-8?B?UGlrZitGUU9mVmtTWmlNcWwvZzNrcmFBRnBmVXRiWGx0dHhQUTBVM0hOcVZr?=
 =?utf-8?B?RGgxNnl5aWN2ZGZoTmViSk1xYkUzeUE4Nk4yL0llRjEyZjlySnlvaU12Vk1s?=
 =?utf-8?B?a2hBYkNGRGtMVkJuTU5tb2ZBMHIwQTV4dnd6Uk52YXBCZy90TXZvOEtCclFP?=
 =?utf-8?B?VThkL1FNejNETmMxOVVISFRVZ0xuNVpmdEw4UmNzWDZaTTZ1LzBNbE5tWjg4?=
 =?utf-8?B?UGIzbWhQTUliWHAxYWtaMTFDT2l0Wjg2emVaNUl5ZS91V0wzQXBnNjMwUVBl?=
 =?utf-8?B?TmZqenoybDBnOUg3c0tUa1h5SlpsQ3doVUh6WHUvWW15TWtRcW1DbUNvZnBN?=
 =?utf-8?B?OFRZd2ljV0R0NHNMYWV6Y01VSDNLQ2NoUXEzZGtCR1ppMWFHSStVdG96MHR5?=
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
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6967e721-9d90-4a63-510c-08dddebda87f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 01:13:51.3487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X85tIR1WDdU68QLXk2M0lBlS8QrhqLbRoRjr31h7+2d1tgYz6CSZycUxLcb0NWbFHhlDQwrCssnLhgixIwAswlxZ3jbi2cJ+HdxA6AQTOwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2109

VGhhbmsgeW91IHNvIG11Y2ggZm9yIHlvdXIgcmVwbHkuDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzQG5kdWZyZXNuZS5j
YT4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDE5LCAyMDI1IDE6NDkgQU0NCj4gVG86IGphY2tz
b24ubGVlIDxqYWNrc29uLmxlZUBjaGlwc25tZWRpYS5jb20+OyBMaW51eCBNZWRpYSBNYWlsaW5n
IExpc3QNCj4gPGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4NCj4gU3ViamVjdDogUmU6IEhv
dyB0byBjb25zdHJ1Y3QgYSBHc3RyZWFtZXIgcGlwZWxpbmUgdXNpbmcgY3JvcCBmZWF0dXJlIGZv
cg0KPiB2NGwyDQo+IA0KPiBIaSBKYWNrc29uLA0KPiANCj4gTGUgbHVuZGkgMTggYW/Du3QgMjAy
NSDDoCAwNjozMyArMDAwMCwgamFja3Nvbi5sZWUgYSDDqWNyaXTCoDoNCj4gPiBIZWxsbyBBbGwN
Cj4gPg0KPiA+IEkgYW0gZGV2ZWxvcGluZyBhIFY0TDIgZHJpdmVyIHRoYXQgdXNlcyBoYXJkd2Fy
ZSBhY2NlbGVyYXRpb24gZm9yIENTQywNCj4gPiBzY2FsaW5nLCBhbmQgY3JvcC4gSSBhbSB1c2lu
ZyB0aGUgdjRsMmNvbnZlcnQgcGx1Z2luIGluIEdTdHJlYW1lciBmb3INCj4gdGVzdGluZy4NCj4g
Pg0KPiA+IEkgd2FzIGFibGUgdG8gdGVzdCBDU0MgYW5kIHNjYWxpbmcgd2l0aCB2NGwyY29udmVy
dCB1c2luZyBhIEdTdHJlYW1lcg0KPiA+IHBpcGVsaW5lIGxpa2UgdGhlIG9uZSBiZWxvdzoNCj4g
Pg0KPiA+IGdzdC1sYXVuY2gtMS4wIGZpbGVzcmMgbG9jYXRpb249QmFza2V0YmFsbFBhc3NfNDE2
eDI0MF81MF9udjEyLnl1diAhDQo+ID4gcmF3dmlkZW9wYXJzZSB3aWR0aD00MTYgaGVpZ2h0PTI0
MCBmb3JtYXQ9bnYxMiBmcmFtZXJhdGU9MzAvMQ0KPiA+IGNvbG9yaW1ldHJ5PWJ0NjAxICEgdjRs
MmNvbnZlcnQgIQ0KPiA+IHZpZGVvL3gtcmF3LGZvcm1hdD1OVjI0LHdpZHRoPTQxNixoZWlnaHQ9
MjQwDQo+ID4gISBmaWxlc2luayBsb2NhdGlvbj1OVjI0Lnl1dg0KPiA+DQo+ID4gSG93ZXZlciwg
d2hlbiBJIHRyeSB0byB0ZXN0IHRoZSBjcm9wIGZ1bmN0aW9uYWxpdHksIGl0IHNlZW1zIHRoYXQg
dGhlDQo+ID4gdjRsMmNvbnZlcnQgcGx1Z2luIGRvZXMgbm90IHN1cHBvcnQgaXQgZGlyZWN0bHku
IEhvdyBjYW4gSSBjb25zdHJ1Y3QgYQ0KPiA+IEdTdHJlYW1lciBwaXBlbGluZSB0byB0ZXN0IHRo
aXM/DQo+IA0KPiBUaGUgc3VwcG9ydCBmb3IgY3JvcHBpbmcsIGVpdGhlciB0aGUgc291cmNlIG9y
IHRvIHRoZSBkZXN0aW5hdGlvbiBpcyBvbmx5DQo+IHBhcnRpYWxseSBpbXBsZW1lbnRlZCBpbiB2
NGwyY29udmVydCBlbGVtZW50IGNvZGUgKC4vc3VicHJvamVjdHMvZ3N0LQ0KPiBwbHVnaW5zLSBn
b29kL3N5cy92NGwyL2dzdHY0bDJ0cmFuc2Zvcm0uYykuIEN1cnJlbnRseSwgaXRzIG9ubHkgdXNl
ZCB0bw0KPiBoYW5kbGUgcGFkZGluZyBkdWUgdG8gYWxpZ25tZW50LiBUbyB0ZXN0IHRoaXMgZmVh
dHVyZSB3aXRoIEdTdHJlYW1lciwgeW91DQo+IHdvdWxkIGhhdmUgdG8gaW1wbGVtZW50IHNvdXJj
ZSBjcm9wICh1c3VhbGx5IGRvbmUgdGhyb3VnaCBHc3RWaWRlb0Nyb3BNZXRhDQo+IHN1cHBvcnQp
IGFuZCBkZXN0aW5hdGlvbiBjcm9wICh1c3VhbGx5IGRvbmUgd2l0aCBwcm9wZXJ0aWVzKS4NCj4g
DQo+IFRoZXJlIG1pZ2h0IGJlIGEgd2F5IHRvIHRlc3QgdXNpbmcgdjRsMi1jdGwsIGJ1dCBJIGRp
ZG4ndCBmaW5kIG91dCBteXNlbGYNCj4geWV0Lg0KPiANCj4gcmVnYXJkcywNCj4gDQo+IE5pY29s
YXMNCg==

