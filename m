Return-Path: <linux-media+bounces-34083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70286ACE90A
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 06:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57FB8188F0A2
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 04:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAAF1C8612;
	Thu,  5 Jun 2025 04:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="WNV7AIfE"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021125.outbound.protection.outlook.com [40.107.42.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A00023B0;
	Thu,  5 Jun 2025 04:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749099036; cv=fail; b=E8pxjc4D07UkBJNJ9IEpc+WePNyA3IpfqNaXwQju02XvM3F18HG5l1dMXJNrP6iZ2qL3kEiNdU7Hz3YCvI4Jtv28M/L66JgqMUDyzriTpb324kRK5djJdAhghVqzUgwM1eKDV8LZxB66akbMN3TRThh58b7DaR40lK+UPL854L8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749099036; c=relaxed/simple;
	bh=C+ab7UW1TweY5/fdRz6M3HGeIfpCOJubMYkhsn0+Dh0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IKXPZ+8gJkv+RYQ9vB8WQCJLqSYjDdQwTFHM0NO585Dd3ArykjHWGUax/XCz7AJtnMFFGIeeS6ENu/5JKeZh5SKuxUIl+XOXsX86qRftCUPeRyBayaaOIjmn7ICYjz7NM4Wlu1ZYer8kUL12GEmhM4ao6OTWcmIMtuNGYEwTdlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=WNV7AIfE; arc=fail smtp.client-ip=40.107.42.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3x5iM9XqYPhdc5K1W1VbaAO8uYz0xe3rlu/a0iBFIOjUoTMuIOrIz9gb2BI0kkALX+Aav3JCaSx3iQSS7KChdWZd6Qdjd0+ioDiHWzp1u+lSZ/QWO7MESbu2yUxNyWmLP4yF/6Mehm4yVBwnJ5vUnQOXZoVo2OmUr9nF62JJJn+H7fXJrScVOMPsihiNEZ+nREBZWiEbxGXW7CqVXXwOkc8j1wadKvq7t8gYJG4HZjLOyGVyrC6xm3bO98lJu7F2fXtYKP8oaPBwXJ1Gi3Pn9dOkZkhm7KC9YOKSKiEsulWjP0wkrGADOwSFLXvXs+QDxhMbLhOVe9LG+EWVuAasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+ab7UW1TweY5/fdRz6M3HGeIfpCOJubMYkhsn0+Dh0=;
 b=oY1dcBuUwbwPGJHoxa9MtVUOqxSh9Tzi8X+SzC/d/+XTWvl9nrWVOXM48OXiCq2JXMwi5RrALd97L+pN06yr6bDMWZwK/igvlTeJEen/nsP4RqzAmjrChGbgzWpMbOBg3DLeZUHHGfg517nzuuYbMq7V/+VRxLwRPQW18Sw0PuLXkUZT6iZJs4QoK5vLBJxQWem9zVqYTA/Z2nK/aGYHKvjnfzVeyh70ULLIuH1UxJfiiwNLn4Tmu6QkNmYtHF6ViVvGXBNpzLqUw/6cmWqL/PpvK60sp25VEDA7dH3OGfvT82PMSwzQBYIyD1bXWcGzdYE90no1eWLqre9ZnNallA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+ab7UW1TweY5/fdRz6M3HGeIfpCOJubMYkhsn0+Dh0=;
 b=WNV7AIfE28j5/bYyjLURVGFlQZ5WVVFoBeO1XG3sotHfB42fv4Zp4gCiH4tJW/RV7gsoGvQaYgFPe41ubXH3+7ZQovGVJbOBmBzO0V0pfjQmLlxu9rzhG68WTmQAv8HT235np23S2GMDv8UcdpAK9n03uHbAtPF/WMdwYsCCZQ0=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB2061.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.21; Thu, 5 Jun 2025 04:50:30 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%5]) with mapi id 15.20.8813.020; Thu, 5 Jun 2025
 04:50:30 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v2 2/7] media: chips-media: wave5: Improve performance of
 decoder
Thread-Topic: [PATCH v2 2/7] media: chips-media: wave5: Improve performance of
 decoder
Thread-Index:
 AQHbyurOkmkh1DQff0CeTO0j+fdx8bPgfWOAgAVz/yCAAiaxgIAKXsPwgAChxwCAAPwu8A==
Date: Thu, 5 Jun 2025 04:50:30 +0000
Message-ID:
 <SE1P216MB1303F7ADAC83F6CE312C5CA3ED6FA@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
			 <20250522072606.51-3-jackson.lee@chipsnmedia.com>
		 <3afbd0253fabcf9f8795ab2231107e2e9da012cc.camel@collabora.com>
		 <SE1P216MB1303C1D1C2A9FA165A01B71AED64A@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <03a87e1c9e8f77887c2457b9c3fcbf0c6a6cf287.camel@collabora.com>
	 <SE1P216MB13033207BDFE2A6BCC48999EED6CA@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <1318bd68f2d60b9d44cb22bd90b92399311f0b00.camel@collabora.com>
In-Reply-To: <1318bd68f2d60b9d44cb22bd90b92399311f0b00.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SL2P216MB2061:EE_
x-ms-office365-filtering-correlation-id: 9210c953-a18c-446e-4b74-08dda3ec7f85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Nm41cmtHQ3lLeC9UL1ViU2x4K0ZwaHkvYVJoRms1dkRDM3crY1VnNnB1UUxO?=
 =?utf-8?B?UEVuVTFYZUtCYWE1czRRRHNUU1FiZkNZOE16clVDZVJaOUxmZUpEc2ZaS0Zr?=
 =?utf-8?B?ZkIvSG5KdW43Z2ZZWnYwdllRRElIZFAwMXBBOVNqMUFuMW85N0dNWFgxVlla?=
 =?utf-8?B?ZW90Q05lM0JyQ3NpSHFZKzNaRWNiRHUrU0hTMHZueURsc2lOUVhoT2xDRnJi?=
 =?utf-8?B?NjQxTUpIRmRsV1JpTGJtVGtUOVV0MndjMGtRWTQ1NFVWeGtNSHdYcXBiRm1I?=
 =?utf-8?B?WWorUkVDNVJieURCTHBkNEpubVlZaFN4MEljMzc3SzZITGRDZVo0b3ZqWEdG?=
 =?utf-8?B?MnU4QVhoNC91Y0FiTDFLbExiS3d2bjVnTkdnNzN5REFrbU1iUWdoU01VNDM0?=
 =?utf-8?B?OEs0NjVGSG1TN2xMeTA1OURJRFBGdDBjM3hrSXc1U1VMakltT2crUjNmWE9O?=
 =?utf-8?B?YVJUUXdrY3BpTlJ4QTdQVkoyR0NqbHB6dzNHeDZ6L3E1YjBrUDBwbTlNT01L?=
 =?utf-8?B?dk5DdTE3SUZnYlJULzFJT0dtV1RVRWVUWGYyZkMzSjQxUnVyQk5QTjN3VVBV?=
 =?utf-8?B?S3BHSTJCY2JvaHFRZEdzd3FXdFZsRFBSOEE0M0dhRGZOS09QdWRKalhqSHZJ?=
 =?utf-8?B?SktKTHY2cnVuOGtKZTdXUERLNzQ0YjdWem9Bam5QN1libFBJUlVyOW9PQnRE?=
 =?utf-8?B?V29XWHJrVFJuQ1g4NjdyNWNCaTRObE40V2k3Wk43NGxQbkxPcjNYaStsRUJy?=
 =?utf-8?B?SktNWjAvSzNNMno5ZCtQZDVuZmFsL3dIUE5ETzA1UmZhLytja3cwR01DODhL?=
 =?utf-8?B?YzA5S21tMHdMUmJ2Y0ZIc3VSVFFMOHU5KzRXODVlazdHaTFQMkpHVlAzeC9P?=
 =?utf-8?B?TUliMlJCL3kzejMxRkd2T1ljRHJUMjhsU25pQzg0UlVhTHN5ZE5KTGRVQmVq?=
 =?utf-8?B?bTFPQ1VGYklOMEl1L0gxUTBQTmNkSjdVMjVHbkc3UytVM2p2eHVDVnVjVTR0?=
 =?utf-8?B?YmRJaERUQWNpbVFLc25IdUFFTFlhZ0MxMVZiTDZQZzlIY2JQZm5yNmZCcS9t?=
 =?utf-8?B?Ny9wangycUxTSEkvWE9kVk5HQ21KMFh1amN6U2dvc3R6T0JaZ0hURFUrTmpm?=
 =?utf-8?B?WVNSNGRCNFgyS3I1Z1NWNFlSMFgzTklvdU1pRzBBZ2QrdjI5NW1YT1Zmcktm?=
 =?utf-8?B?RkkyaTNqMy9ZTE85YlQyajdoekZSTkYrY2lwUnNYbmV2TVlGL3kwNFlRUDlu?=
 =?utf-8?B?NXRmaFZ2d1lCeFpVUUdFWDA0bmEzcWhabUorRU5rU0FTUExuMmRkZ0lDZXlM?=
 =?utf-8?B?alJtYXZiZkJVckN4cFh1RDdmbmVtRGRESUN3TW9qOEJEZVBETzJKemg4RzB6?=
 =?utf-8?B?d0sxckpvTlpmVWRQaFMxQWpVZmRtNThYN1d2Y2EwV1lMZ0FOWWN5UFRrZ291?=
 =?utf-8?B?a1EvQUlEQ2orR2Yxa3hiakdrUTB5RGxhZWFuRE1SMmhMQ2dxWkJlbVpzdjBw?=
 =?utf-8?B?ejFZZStpSlIzY1phajFTUE9ialdNbjNtMVVpYjlWQ2lKWDI1SndBYXJiL0Z6?=
 =?utf-8?B?QU9VOTRKaGxCM0wvUGNJZzhiOVNFemhYQlFkVGMzZzZwZW5WY1JMVEFsQ2ov?=
 =?utf-8?B?UUZUdUM4SXBvZ3RqYzREUUdQZjB4TnZ4aVBBWVZNU2V2dE9KTGlYamg0ZlVv?=
 =?utf-8?B?K1BMQ3V6STU4Z1V2b3czSGQrQlFLTjdaMjlYUDltQTZvSm5mZ2VzY0FqazFk?=
 =?utf-8?B?TFQ2aFFQdGVCVFJuME5OenhIYllURW5USS9iWDJRbnBHR2J3L0JTaXRNbmZM?=
 =?utf-8?B?blB3M0VkUW5sVWU2UEZacmt6bjgybnh4Nlc2VitxY1VRdHBvZkp4Q3NuUUpN?=
 =?utf-8?B?NkRnOUpmeDdZN2htNVEzQkY2VGRWWTg0RzJEOFRZdG1zY3BienYwK0ZZeHNG?=
 =?utf-8?B?MUhTMnBINzgxQVlpYitNelhJaWNoVlJMZXl2cDhTd0gzQ1FUTldxalNON2Rh?=
 =?utf-8?Q?y+Cw7eSTLGkCQNjOw8SVBCPAhh2IT8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WlpUVi94V1NQY0ozSEFPV2E0dEc1bjVCYWY0Wm5nVURxZ1J5dEtFQk0rZG5a?=
 =?utf-8?B?bllVRktkQTJ6SWQrVW5XRFQ4Y3BYZ3NJblVYSGFObHc0UUFSeXd5b0lYTDlL?=
 =?utf-8?B?UmhqbVZZZWk4cGFpUFoyMDJuOFg0b0RuanhNYWNrT1FhKzRwVUpOcE0vUnJy?=
 =?utf-8?B?cDZ6NkFNeHBja25rMW9ZQVJseU5GYWRlOHBqR1dkTEljS0dmcGJZbUVKU3Bk?=
 =?utf-8?B?THErZG9uTGVISTdiL2JlZDdUcWtQZ1VtL0p0eS9MYmEyQklFL2FZRGYwc202?=
 =?utf-8?B?RG1Ja0dnVGJleFptZ3ppNEdCbTR2T1Z5RFU5VDRwb0lieVBuOHRNVktHSUpI?=
 =?utf-8?B?eWhRR1kwS0owSmRVMjhNSWVmL1lkdHQ2YnVFQTlQYnNWTWpQVmVUWmdhTkZl?=
 =?utf-8?B?UXNBTk9WOXlvL1hEV2l4OEFBdXQ2bUdtSkNreGUwMThJSG5hQnVxL1dMTkZR?=
 =?utf-8?B?MDhOcGxNQVVaQm13aitKRVFUUzJHeWVLMEIzU01LdDV4RkpnejQzQlU1KzhL?=
 =?utf-8?B?UVY0R0tlaXpVOGl3L1U4N2plSFo4SDJ0aVNFN2tzZ1dZU1ZNRDFWdDR4Wmph?=
 =?utf-8?B?Ykp5R1BkbHFjUFNmTUlxcDhySVJScTVSOHZ0ZEZ6S0JvTlM2UVF6blNvMG9w?=
 =?utf-8?B?dnNicXE3WEQ0clB4V1BtMmhrMHVnMFg1R0hGdTNNNkJoVHUxK1FTVkNEdkN2?=
 =?utf-8?B?VzEyWlo4WnZUTU9qaTl6b0pNTVpuUncrdmFuOWRIbFNOTnI3Z3ZFd1B3eG9Q?=
 =?utf-8?B?RVZlQldMdk9EWDJvSytBbGZvY09vdVNFMm9obngxdlNldHhLa0xIQ2pUWG5m?=
 =?utf-8?B?SlVWTlJKbzlQWXl3aHpVRVo5elRSOHdXVVpDSzNUdUFKSUhLL3RCdk5KUGhJ?=
 =?utf-8?B?dW5NMGhBUEt6cnVINmdXUm0rMG9Eb1V0U3dRWUtzTWNqTjQwNmNvVUg1WU1w?=
 =?utf-8?B?YzhRSlhEdUh2TlhyeVY5eEFSa3VKSmhIME5adlVzc1ZtUnJHT29nNFdGUFdn?=
 =?utf-8?B?UVBnMmozc0Jkc3d1SkNodGt5MDNibWs0MkFBNG1uaFNNU3U3WXp0bHpOM2xU?=
 =?utf-8?B?S29abklYOStsbC9VazRrNDVmTTN1SlB4Q0J0ZkZmbVl5YmNiT2lNZHowUzgz?=
 =?utf-8?B?Z1dUWXQvL0h1LzNIcER2R2hsS2tWYUtOTmQ1T2pqMlltKzFacm9ZWXNWMTJr?=
 =?utf-8?B?OVlGZk1CSFNpTGdBVHJlOWJ5VVhKdS9QaVRyM0xaOHlGQ0pkT25CRGQrVmxD?=
 =?utf-8?B?WURwSEF6VFlBRis4QytOTldRTS9iK2VQRnVSQkdPcnZxL1laTWpwNmJhaHlR?=
 =?utf-8?B?dUJLcHk4R01UVVlSTUcwNGt3VW43alQwSVZ6ZVdFWU9PY0M0UjF1eWJRbU8v?=
 =?utf-8?B?bm0xOG9Ua0tPU0VnQ1J1MkI3VnkwTzhQajMvam5hajZSRWhKYmYrWmNRTk1O?=
 =?utf-8?B?Vy9ZUU44MjdUNmtXNC80cWJ0cXczMCthemlLK2MzTzZZblV0b3dmMFBCWXNn?=
 =?utf-8?B?aHZDN0FKdE5KTHYzdTZ2ZVI5TCsxT1RNM0RLeG45Vy9nSU5CMFk1M2lONUJy?=
 =?utf-8?B?QkJqNHh5dmVmZ3dhWldWdGd4M1pRUXU0d1cwY1ZzMVZSTDNEbzRveDYzdm56?=
 =?utf-8?B?US9YSnlheXZpUktlSVFZWWs3QmpDYUdNL2xrODExYTFZTHpKbUxrN3JlT3NP?=
 =?utf-8?B?cFNBV1V1Sm8wTnQ3WnRsdnU5RDBlelNYeUdYVXJUTHRGQm90TEtTMkVLQm5o?=
 =?utf-8?B?V2wvaWk3VUowQlJWUU1xQVhYYkFTemtnakFrY2lQVmkya2tBZ0U2ZDdCZzlU?=
 =?utf-8?B?V2dYeWdSTnJLeHVabm5WV1RKK0dhQWpjSGtTcHhnVUxBbmduMXJYSkplU0NM?=
 =?utf-8?B?R2NDUUphVi9nMjFUR2VUMWtvenJ4WXlBOHhpdDROclZBbXNzV2J2bmJrOURG?=
 =?utf-8?B?S0VxWnVEZWh3K0Y0b0k0UitXSU40MHJPOUtZZGtJT21JZWNSbXZkM3orK2c2?=
 =?utf-8?B?Rll1U0hhclp2TnZiMUZUSHV6NFVOU0ovS3RSNGRtK2tmcUR0aGhsMW1YSTIr?=
 =?utf-8?B?czZnd2JGZjhMVWliZ1d6ZTM2S1FHWVQvNGdmUVRMSmw0akVhcGhmSmJ6MS9j?=
 =?utf-8?B?NFpGckw0OWNKUFZidHQ3MjRCcEhOSXo4bzBxREozVHUxeWlzcENxY2kzS28z?=
 =?utf-8?B?TXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9210c953-a18c-446e-4b74-08dda3ec7f85
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 04:50:30.3304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iZcARVnuIoZ8JaBNhMpWHjbjgS9GBBb4n9A0d9EiZSqMqyX10ojl8hTeL9lzFjwduG4sMhIuhbMQ4kgIJdoIgt8se0y/jIZipfweSAueu4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2061

SGkgTmljb2xhcw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5pY29s
YXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4NCj4gU2VudDogV2Vk
bmVzZGF5LCBKdW5lIDQsIDIwMjUgMTA6NDggUE0NCj4gVG86IGphY2tzb24ubGVlIDxqYWNrc29u
LmxlZUBjaGlwc25tZWRpYS5jb20+OyBtY2hlaGFiQGtlcm5lbC5vcmc7DQo+IGh2ZXJrdWlsLWNp
c2NvQHhzNGFsbC5ubDsgYm9iLmJlY2tldHRAY29sbGFib3JhLmNvbQ0KPiBDYzogbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsYWZsZXku
a2ltDQo+IDxsYWZsZXkua2ltQGNoaXBzbm1lZGlhLmNvbT47IGItYnJuaWNoQHRpLmNvbTsgaHZl
cmt1aWxAeHM0YWxsLm5sOyBOYXMNCj4gQ2h1bmcgPG5hcy5jaHVuZ0BjaGlwc25tZWRpYS5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi83XSBtZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1
OiBJbXByb3ZlIHBlcmZvcm1hbmNlDQo+IG9mIGRlY29kZXINCj4gDQo+IExlIG1lcmNyZWRpIDA0
IGp1aW4gMjAyNSDDoCAwNDowOSArMDAwMCwgamFja3Nvbi5sZWUgYSDDqWNyaXQgOg0KPiA+ID4g
UnVubmluZyBpbiBsb29wIGFueXRoaW5nIGlzIG5ldmVyIHRoZSByaWdodCBhcHByb2FjaC4gVGhl
DQo+ID4gPiBkZXZpY2VfcnVuKCkgc2hvdWxkIGJlIHJ1biB3aGVuIGEgdXNlZnVsIGV2ZW50IG9j
Y3VyIGFuZCBmaWx0ZXJlZCBieQ0KPiA+ID4gdGhlIGpvYl9yZWFkeSgpIG9wcy4gSSBiZWxpZXZl
IEknbSBwcm9wb3Npbmcgc29tZSBoaW50IGhvdyB0byBzb2x2ZQ0KPiA+ID4gdGhpcyBkZXNpZ24g
aXNzdWUuIFRoZSBpc3N1ZSBpcyBxdWl0ZSBjbGVhciB3aXRoIHRoZSBmb2xsb3cgdXAgcGF0Y2gN
Cj4gPiA+IHRyeWluZyB0byByZWR1Y2UgdGhlIENQVSB1c2FnZSBkdWUgdG8gc3Bpbm5pbmcuDQo+
ID4NCj4gPg0KPiA+DQo+ID4gVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLg0KPiA+IEJ1dCB0aGVy
ZSBpcyBvbmUgdGhpbmcgdG8gc2F5IHRvIHlvdS4NCj4gPiBBZnRlciByZWNlaXZpbmcgRU9TIGZy
b20gYXBwbGljYXRpb24sIHdlIGhhdmUgdG8gcGVyaW9kaWNhbGx5IHJ1biB0aGUNCj4gPiBkZXZp
Y2VfcnVuIHRvIHNlbmQgdGhlIERFQ19QSUMgY29tbWFuZCBzbyB0aGF0IFZQVSBjYW4gdHJpZ2dl
cg0KPiA+IGludGVycnVwdCAgdW50aWwgZ2V0dGluZyBhbGwgZGVjb2RlZCBmcmFtZXMgYW5kIEVP
UyBmcm9tIEdldF9SZXN1bHQNCj4gY29tbWFuZC4NCj4gPiBTbyBldmVuIGlmIHdlIHNlbnQgRU9T
IHRvIFZQVSBvbmNlLCB3ZSBzaG91bGQgcnVuIHRoZSBkZXZpY2VfcnVuDQo+ID4gZnVuY3Rpb24g
Y29udGludW91c2x5LCB0aGUgYWJvdmUgY29kZSB3YXMgYWRkZWQuIElmIHRoZSBqb2JfcmVhZHkN
Cj4gPiByZXR1cm5zIGZhbHNlIHRvIHByZXZlbnQgcnVubmluZyB0aGUgZGV2aWNlX3J1biBhZnRl
ciBzZW5kaW5nIEVPUyB0bw0KPiA+IFZQVSwgdGhlbiBHU3RyZWFtZXIgcGlwZWxpbmUgd2lsbCBu
b3QgYmUgdGVybWluYXRlZCBub3JtYWxseSBiZWNhdXNlIG9mDQo+IG5vdCByZWNlaXZpbmcgYWxs
IGRlY29kZWQgZnJhbWVzLg0KPiANCj4gVGhpcywgaW4gbXkgb3BpbmlvbiwgYm9pbHMgZG93biB0
byBhIHNtYWxsIGZsYXcsIGVpdGhlciBpbiB0aGUgZmlybXdhcmUgb3INCj4gdGhlIGRyaXZlci4N
Cj4gVGhpcyBpcyB3aHkgdGhlcmUgd2FzIHRoaXMgY29kZToNCj4gDQo+IC0NCj4gLQkvKg0KPiAt
CSAqIER1cmluZyBhIHJlc29sdXRpb24gY2hhbmdlIGFuZCB3aGlsZSBkcmFpbmluZywgdGhlIGZp
cm13YXJlIG1heQ0KPiBmbHVzaA0KPiAtCSAqIHRoZSByZW9yZGVyIHF1ZXVlIHJlZ2FyZGxlc3Mg
b2YgaGF2aW5nIGEgbWF0Y2hpbmcgZGVjb2RpbmcNCj4gb3BlcmF0aW9uDQo+IC0JICogcGVuZGlu
Zy4gT25seSB0ZXJtaW5hdGUgdGhlIGpvYiBpZiB0aGVyZSBhcmUgbm8gbW9yZSBJUlEgY29taW5n
Lg0KPiAtCSAqLw0KPiAtCXdhdmU1X3ZwdV9kZWNfZ2l2ZV9jb21tYW5kKGluc3QsIERFQ19HRVRf
UVVFVUVfU1RBVFVTLCAmcV9zdGF0dXMpOw0KPiAtCWlmIChxX3N0YXR1cy5yZXBvcnRfcXVldWVf
Y291bnQgPT0gMCAmJg0KPiAtCSAgICAocV9zdGF0dXMuaW5zdGFuY2VfcXVldWVfY291bnQgPT0g
MCB8fA0KPiBkZWNfaW5mby5zZXF1ZW5jZV9jaGFuZ2VkKSkgew0KPiAtCQlkZXZfZGJnKGluc3Qt
PmRldi0+ZGV2LCAiJXM6IGZpbmlzaGluZyBqb2IuXG4iLCBfX2Z1bmNfXyk7DQo+IC0JCXBtX3J1
bnRpbWVfbWFya19sYXN0X2J1c3koaW5zdC0+ZGV2LT5kZXYpOw0KPiAtCQlwbV9ydW50aW1lX3B1
dF9hdXRvc3VzcGVuZChpbnN0LT5kZXYtPmRldik7DQo+IC0JCXY0bDJfbTJtX2pvYl9maW5pc2go
aW5zdC0+djRsMl9tMm1fZGV2LCBtMm1fY3R4KTsNCj4gLQl9DQo+IA0KPiBXaGljaCB5b3UgcmVt
b3ZlZCBpbiB0aGlzIHBhdGNoLCBhcyBpdCBtYWtlcyBpdCBpbXBvc3NpYmxlIHRvIHV0aWxpc2Ug
dGhlDQo+IEhXIHF1ZXVlcy4NCj4gSW4gdGhlIHNwZWNpZmljIGNhc2UgeW91IGRlc2NyaWJlZCwg
aWYgbXkgbWVtb3J5IGlzIHJpZ2h0LCB0aGUgQ01EX1NUT1ANCj4gKEVPUyBpbiB5b3VyDQo+IHRl
cm1zKSBjb21lcyBpbiByYWNlIHdpdGggdGhlIHF1ZXVlIGJlaW5nIGNvbnN1bWVkLCBsZWFkaW5n
IHRvIHBvc3NpYmx5DQo+IGhhdmluZyBubyBldmVudCB0byBmaWd1cmUtb3V0IHdoZW4gd2UgYXJl
IGRvbmUgd2l0aCB0aGF0IHNlcXVlbmVjZS4NCj4gDQo+IFY0TDIgTTJNIGlzIGFsbCBldmVudCBi
YXNlZCwgYW5kIHY0bDJfbTJtX2pvYl9maW5pc2goKSBpcyBvbmUgb2YgdGhvc2UuDQo+IEJ1dCBp
biB0aGUgbmV3IGltcGxlbWVudGF0aW9uLCB0aGlzIGV2ZW50IG5vIGxvbmdlciBjb3JyZWxhdGUg
d2l0aCB0aGUgSFcNCj4gYmVpbmcgaWRsZS4NCj4gVGhpcyBpcyBmaW5lLCBkb24ndCByZWFkIG1l
IHdyb25nLiBJdCBub3cgbWF0Y2hlcyB0aGUgZHJpdmVyIGJlaW5nIHJlYWR5DQo+IHRvIHRyeSBh
bmQgcXVldWUgbW9yZSB3b3JrLg0KPiANCj4gU28gbXkgcXVlc3Rpb24gaXMsIGlzIHRoZXJlIGEg
d2F5IHRvIGtub3csIGF0IENNRF9TVE9QIGNhbGwsIHRoYXQgdGhlIEhXDQo+IGhhcyBnb25lIGlk
bGUsIGFuZCB0aGF0IG5vIG1vcmUgZXZlbnRzIHdpbGwgYWxsb3cgaGFuZGxpbmcgdGhlIEVPUyBj
YXNlPw0KPiANCj4gTmljb2xhcw0KDQoNClRoYW5rcyBmb3IgeW91ciByZXBseS4JDQoNCk5vdyB0
aGVyZSBpcyBvbmx5IG9uZSB0aGluZyB0byBrbm93IGlmIHRoZXJlIGlzIG1vcmUgZXZlbnRzIG9y
IG5vdCB0byBoYW5kbGUgdGhlIEVPUyBjYXNlLg0KSXQgaXMgdGhhdCBkcml2ZXIgc2VuZHMgREVD
X1BJQyBjb21tYW5kIHRvIFZQVSBjb250aW51b3VzbHkgdW50aWwgZGlzcGxheSBpbmRleCBpcyAt
MihpdCBtZWFucyBFT1MpIGZyb20gVlBVLg0KVlBVIHNob3VsZCB0cmlnZ2VyIGludGVycnVwdHMg
dG8gZ2V0IGRpc3BsYXkgaW5kZXggZnJvbSB0aGUgZmluaXNoX2RlY29kZSBmdW5jdGlvbi4NClNv
IHdlIGhhdmUgdG8gcnVuIGRldmljZV9ydW4gdG8gc2VuZCBERUNfUElDIGNvbW1hbmQuDQoNClRo
YW5rcw0KSmFja3Nvbg0K

