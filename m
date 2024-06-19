Return-Path: <linux-media+bounces-13763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 820C390F9E0
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 01:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7DE328128A
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 23:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D20015B56D;
	Wed, 19 Jun 2024 23:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="cRJXjJuO"
X-Original-To: linux-media@vger.kernel.org
Received: from KOR01-PU4-obe.outbound.protection.outlook.com (mail-eopbgr860132.outbound.protection.outlook.com [40.107.86.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB101E515;
	Wed, 19 Jun 2024 23:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.86.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718841417; cv=fail; b=QxFgipbkeH7HwNVtwODZ16o/X7diwPsIpaF7UCNsNl3Wfa46A7Y0BoI29i9nDlSeac8/dyl1Iyh1golmc5gC/KKcIeRUhtKuyur4HkuinqREZCTBIHojwrGWAWlrmr1xtvJoKCPqj7G4AwvYduxuKlgMQOv/md3iESpJxDVcPVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718841417; c=relaxed/simple;
	bh=DrK0ouYiVebzBeTPjF4QtT/50MN86amkijB/x23IY/I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gUgG1zdgOJ+sp9vCSbUbN2mYZ0Ko8Z03CfYofqtW01D2+gIUZXk9fIFIaWgLbuTfFGhjyK6d7kYAyf/2e1A9MSVU6xlv44lwuKLKvC3Hyg5pu2jRCo1fnukNEd1vICA/KzwvR49bCDBFj/7V2qgr5vqon30+ld120brdR2Q0b3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=cRJXjJuO; arc=fail smtp.client-ip=40.107.86.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1PJdnbKxnq6ldHTapjH7sMev/5JWWhVsz6b0PM7CkMm92h2ZI0kxw3AeXpFHeOKjowuyTM0bsjFU6ycrFN6y9I8QhpFP+bGhg3Ut/yyJhBSiDcH12cr6xr4jTrO1MGmdtoPvfPA7k4bcMQ0sB+A5oMi+7iBh86pyQTdYQvNvp3df2GenNdGNy4RX1F2q4i7v4d2a3WqA7+om18+23Uxs/3/fy+Bn3QZBda3IiTp3A3/HyCQ4nrbmrDF6ZmQqmaZARRUApPqCaDfFppeOo5piiI5fkFR8lGesAsqO01y45OeI4kdviBh2w7MFr4XJmT92HATWkzJM0aEWbQnuCogXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrK0ouYiVebzBeTPjF4QtT/50MN86amkijB/x23IY/I=;
 b=QfPkk8YACJIzF+uIEm36v0Of6DX0dfCkVY4h8abqZIvposkCPoSaVd3MUaYufTQwgNk64l/rEIqZZkpy1wAiMo5QAuu1DOKeGtFLoGfXIHHkVGhpQzPWriiShIDJ0PQxwdbw2BBMlte9XgoeSKHrVrhuJPp7Pm/8jGwMBMF0dauAhlDrhGEwo7K+Oimb++U3//hsziMPOUvHC9WKmcGEJg+3dIZp1gOMF92zIc8rff6Dxv1RtdmEM145noQm2cM3OADxzMaLy2jBVBXxYeDMANj2x4hgXYWZ6aPkTVeZ7ebtWVG6cTx59OS5BsVq1HiHjTkPw54kiPmjE4Rq7h6uFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrK0ouYiVebzBeTPjF4QtT/50MN86amkijB/x23IY/I=;
 b=cRJXjJuOnJjyEyv1KFJwWxH9bT07FZnwh0SC9YbgsnVe1+DX0jJBmNxGCXMjjVcY/qw4IzTgni+e5uupWQMJ8hJEHPT6aMOpfm07O0y6gadP8y11YFS88HlWC8mDRWx1pMTq0bENQB7tdTYLFCk+gL6PHhAdXblpRHC+N7mBqwE=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB2316.KORP216.PROD.OUTLOOK.COM (2603:1096:101:10f::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.21; Wed, 19 Jun 2024 23:56:51 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7698.020; Wed, 19 Jun 2024
 23:56:51 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Devarsh Thakkar <devarsht@ti.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>,
	"b-brnich@ti.com" <b-brnich@ti.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>
Subject: RE: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Thread-Topic: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Thread-Index: AQHawKPhLOcR91s1hkK9DSaFUGSwxrHPD/CAgAC0SbA=
Date: Wed, 19 Jun 2024 23:56:51 +0000
Message-ID:
 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
In-Reply-To: <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SE2P216MB2316:EE_
x-ms-office365-filtering-correlation-id: 29bd4673-d900-40d7-d9bd-08dc90bb7d33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|1800799021|366013|376011|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?bnFEUW5WK3VLWm1ENDIwdmVMRmlVVWV1bTVjS1A5b2YyOEhYV2RPUE1ZVUVY?=
 =?utf-8?B?WHozbG1MQ3hidXFCUjBwZHl2aDd5dlIwVjdSZHo3WTV0bTJDUnkxYUxOSjV5?=
 =?utf-8?B?Y1Qwa0JML2gvMGdtMnRYLzErS0FLMFY1blZrU0luYTNvZTlHK2R3cFptZ1dq?=
 =?utf-8?B?aUpLWVJoQUh1Y3BlTUtvblNSMDJvd2lVWTlicmUxTlo2OE1pMFc4MGNFcFg4?=
 =?utf-8?B?MUVFa1ZLTDF0c1V2UWxaTWtDMlIrZ2dTSEU4SGV3cDRVWTBJL0IyRkREbHY1?=
 =?utf-8?B?REV0MWdaSUtoRDRuSVE5VGdyVGIvajk4dXRvVVVRb3o2aWU5UlZORFFQZjFn?=
 =?utf-8?B?VzN5UjZiL2NXRVdvZjFHUDF0aDRlOEwzMkhrdlZhL202UmFkMEVCS0JmUmti?=
 =?utf-8?B?dnVNZjhWZThLTHVUMG5TRmkwL1JlTUJpMUZTNGwvWlZ5S3o5V0tXWENFQ1Zx?=
 =?utf-8?B?UnFUaXRvTXZlNC9DWjNIZFZTaVhSOHczVkpTRWFmaEgwaG9Qbjdkc05EcnBj?=
 =?utf-8?B?ckFFNlJPZ2UwaE11NzJJcC8raEwrWjl1VUwrU0hrYXZMeEdYek9vM0ZDVTJZ?=
 =?utf-8?B?M0p5bzYyY1N1aGJEOE9YcmczMnJGRWF0cXN6MDl3dkhySDFldVEvbGRuZ0M0?=
 =?utf-8?B?UXF1OTZqUU44bExYVXlGSTM4c2NMKzBNblB1V3B3REZFdlNVODFFdnp0S3lD?=
 =?utf-8?B?YzVKQ0RRNFlRKzRORnhiWHhCeFVBZEJJaENoSHljd0Jka0JVc3BvT2FXajNn?=
 =?utf-8?B?QnM4eDQyYWZqSUgzcHR4N0srWVZCK09PRmRDeUpPb2dpektrcDVUdGpOOVJw?=
 =?utf-8?B?bkEvK2l5TExJNEcyQTVqd3BsaThZNWxXY2g4SnlpS3JXUGRQbkdrVHBHdlBp?=
 =?utf-8?B?czR1aWpyQmM5Q2lla25XY2dVa2dlV2l6RHJ0T1dwczkxZ1NTbDU1U1dCYURB?=
 =?utf-8?B?SlFiYUh2S3V1c2RjQy9pRHhNN0Frbm9iN1NRTGtuc3JCangwN1pLRDIzTC9S?=
 =?utf-8?B?N0JYV1o2ZXA1L1owcTFoUm5hazkzcXIyK2d5b3ZGL0phUlpqbUZvVXNaREM5?=
 =?utf-8?B?L2dYMGhPeEJVOXI1K3FpM09BcVZjL04yKzVBNzR4R255NTA3bjAyeEZRNGFh?=
 =?utf-8?B?SklaMCs5dy9Bb0FUSnhBQ0o5MFgyeC9sL1dPZFdyVE9YR1Vzc2ZLVTg5Z25T?=
 =?utf-8?B?d0NDQ281akRaWHY0SEptdE9CV0xBNndTWWxkSFBWd1ZiSmtxQTJNZ2g4clUy?=
 =?utf-8?B?QjUwYWh2cHdnV0l4SGFYa3F1MnByWi9kUzlUcE5pVEtUOElXSm9QRnpva3pl?=
 =?utf-8?B?RVhNeFFVK3E5S29ISzhRTWdqeE4zY283c1NNdE5xK1lQbEh1cDhNbVdML0Iz?=
 =?utf-8?B?RTBFUjNwZ2Y0bkZPMzJYUW04SmYwWTNiMEhsWmJwbEFPam9Lb2pQZkVBOS9J?=
 =?utf-8?B?Y0ZPekZJb3FrYTBieElrZ2tXS1kvMWpiR0R4K3lJaDhqbWFoWFB6SFJrVTFl?=
 =?utf-8?B?UmVGK0xZRUFLa04yU0lzZlFabjRYQXVrL1E2QUFYSzZoQ253S2hrM0xHb0I1?=
 =?utf-8?B?MGlqbzl0LzF0QnlsTzBFbDQ1eDZCRXVWdzdlYW1hVjIwZWp0THdZc1cvYjVx?=
 =?utf-8?B?NDVzSm93Yk1Cd0Jjc0IwQ3VUYVhKUUNSbTZLcmFqakxGc2UvaCsvTXdZWTFy?=
 =?utf-8?B?YjZ1a3FzS2M3R2prbVRuYWg5dEtKbkM2MDFXS2E1TmQzTmVlV0dLL3lNNWNB?=
 =?utf-8?B?WXBYaHdET3RYenk4Yk9qNGJ2akVPTFFtYVNNNzlHcHBPUmI0VlZGWTA0OGU2?=
 =?utf-8?Q?S6XzuHijzhC6YvW92L8zBp3mzVkAeOGyFfrjQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011)(38070700015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K3AyT2ppd0VUOEdWaEM1VjkwQlczZEVSTDYxU3lpeWVNYjl1ZUh6eTRnQzVX?=
 =?utf-8?B?YWxHYTF1aTljNHZLTFN4R3dCVGZvUGs3UnZtUmViQUtlOU5TbkIvcXY1SnlQ?=
 =?utf-8?B?RGtZeUJOZ2Q1NDAzeW1CR2hCcU9UWURqWDRENVNIb1NFTzM5eWF5SUsvWjRx?=
 =?utf-8?B?NnowdkxHVmtCTUw5YlE4TXp5SE5UVDVqMnVCL1VwVTZNbjhnQzdmZG9vSlZr?=
 =?utf-8?B?QWRuK0RaQU9maFcySi8wOTZJd2JBRWFndXJLT09aUG9EWW5MV3FyNTY2RTE1?=
 =?utf-8?B?eFB1SVAxTXFDd0xEVy9wNC9LSTRqMk9ORHp4ekJVOVpwTDRJc2RmalBDcWhU?=
 =?utf-8?B?Ry9HZnVsc00rOFRoNVNmOU9WVlo4K05QWUpwYlJpVEw3QmY3UjQ3cy9McTU4?=
 =?utf-8?B?aG5wQkQ5VGc5cnBkZDBodHY5Zmp4dGdxUzg2M1B5K2FnaXJOeUVuL25XMjJy?=
 =?utf-8?B?UTBrdmNraVNiQmZybWtFL1NLRkk0ZzFQcUNMUUNUQk5qd1ZWRXlmWDhYUk8v?=
 =?utf-8?B?TG9pS0JGbHNhaUdHWXYva2tocVlieG83U1diSHFkNGlWWCtYT0VLVGRZKzM3?=
 =?utf-8?B?clRlRkZ6aTg0dXYvcEhQQVh6djZ5Q2pRcWFCYXpJQUMrb3h3eXpyWjBjZ3JR?=
 =?utf-8?B?VHhPWW9pRWhJR3lRVDl3bHpXNkZPTU1NUmhYWnJpWk5zVi9SWHkzTmNLTlZw?=
 =?utf-8?B?dHlBUzltbTVSK2M1aXUyNHV6ZFlzaHRieCs5VTd0Qm9qOGd2NkoyVGFkWDQ1?=
 =?utf-8?B?SFhuTzV4amZERGxnSlVmVVYrdENMUVpBS1VEZFp3b0RER291eFc3YUJPbG53?=
 =?utf-8?B?LytRTUlta0VwVGFZWWxoVGkzcnB1YkttQTVBNzZwTWdIUUlJV21QOXozOE83?=
 =?utf-8?B?OHNIa2Fia25JK0U1eVViRmpTUHc0OXJUM1RJM0xjdUFwdHJFSWVqY1lscjRM?=
 =?utf-8?B?cVJxL1NGS3ZSckNUNTRkOVloVzhmaG1TM09pUFRRdTNUNlNwNldhKzl5Sm5V?=
 =?utf-8?B?RnN5bEt2VUVvQ01WUy9oc2s1YnFCakJvd2VwdGsxUlgvdEF1eTVML1E5RzJE?=
 =?utf-8?B?R08yM0xqdWpVNXBJMmVGeGlEblZKL1hFN3FMV1doSHNHLzVDR2xwQ0Fvdllq?=
 =?utf-8?B?cUc2cFZEdHlUNjFCZm9WREFFaDg4b3VKdm5SZDdFMUJ5Y1MveXJZQysrUXlv?=
 =?utf-8?B?M0JVc3hFWFhIc3pDSWxzS2U0bmYyWkY3RDdlQkFCQk45NHpaNlBMK0M2dHNL?=
 =?utf-8?B?WjlVa0ltS1BLKzV0dE5mMDA2eHlVRVRyWHlYZ0Z6enByVXJKREtrWWdOUVU0?=
 =?utf-8?B?N1pLbEJXTERCcEUybjM0a1NRVU9kd2d3MmJ6bFVoNGhpTjV2NERheDZVZXlJ?=
 =?utf-8?B?UmxoM2RrNENsRC9iaTdXN1V5VE9LWC9xc2F2MFNCSnZzUEQydEw1KzByQW41?=
 =?utf-8?B?KzJZeTU0aE1EbnA0K2xnVkJSRVR1T3ZuMlhMWmo1V1l3d3hUbGYyVWlyVlRi?=
 =?utf-8?B?bHEybzRjczRBSjYrbzc4WDM0bC9PZjhKSVVKanZEaG5jWjFQSnJSNld2N3Ra?=
 =?utf-8?B?R0liRWwrdk9SRVpjbGphRk1Ic0hwajNUVlpXUEtPUm1QOXVSVE1IYUROSFhP?=
 =?utf-8?B?Q3RoeFo1cEZLSGIzYmQvaklnaWxYa21jUUZFUFNxRFBEUzZPRndzQWtxTWQz?=
 =?utf-8?B?dlpmNXNDN1RySUJHSEs0Vk5OaG51bkZpanM1Ukg1d1JTYzlnaEwvWFgvTTRk?=
 =?utf-8?B?cFE4cWhKRzBQNUpxTllqcTVCTVBNdUp3SHgvRzNoRHB2ejFNQXpXQnJWWHRP?=
 =?utf-8?B?VFZFVkg5bHhrUTUvZmI1ZEN3S09TaWs2blhEc1RiYitNNGtMb2lsSVVDeFRZ?=
 =?utf-8?B?YWpWNzdzbktERTVJbkR2SE5JR3NhSVd5MW1xUzYyZDZNU0lJTmtpdTRDNVJl?=
 =?utf-8?B?VGYxZlRDbkN2SnVXRHdNUk1xY1JOVXlWelZ5U0ZvaFEyWjNyMlN4dDA2a0JU?=
 =?utf-8?B?eWhuTlFCWUpiQnRoaEREUE9TZU93aE11dEQrdS84VjlPTmdBQXRlL1YwK2ky?=
 =?utf-8?B?STdudDdOaFppNisvUkNUeXFIVy8xN3lYUXlIeCtRaUg5ZklZUEVhMHBRZEhF?=
 =?utf-8?Q?zq9+evZxGIee2cLbLAO0xv1eX?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 29bd4673-d900-40d7-d9bd-08dc90bb7d33
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 23:56:51.3068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6gFyvq9okotxIdGNuBuZjT7HqNaqCjYrykLrF8nH9Ehyt8+RAcl9GysapcgkjCbAyNqo6CshwiW+7hlMn0so9PwngUjZOUc1KrCvPe2MXhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2316

SGkgRGV2YXJzaA0KDQpJZiB0aGVyZSBpcyBubyBmZWVkaW5nIGJpdHN0cmVhbXMgZHVyaW5nIGVu
Y29kaW5nIGFuZCBkZWNvZGluZyBmcmFtZXMsIHRoZW4gZHJpdmVyJ3Mgc3RhdHVzIGlzIHN3aXRj
aGVkIHRvIHN1c3BlbmRlZCBhdXRvbWF0aWNhbGx5IGJ5IGF1dG9zdXNwZW5kLg0KQW5kIGlmIHdl
IGRvbuKAmXQgdXNlIGF1dG9zdXNwZW5kLCBpdCBpcyB2ZXJ5IGRpZmZpY3VsdCBmb3IgdXMgdG8g
Y2F0Y2ggaWYgdGhlcmUgaXMgZmVlZGluZyBvciBub3Qgd2hpbGUgd29ya2luZyBhIHBpcGVsaW5l
Lg0KU28gaXQgaXMgdmVyeSBlZmZpY2llbnQgZm9yIG1hbmFnaW5nIHBvd2VyIHN0YXR1cy4NCg0K
SWYgdGhlIGRlbGF5IGlzIHZlcnkgZ3JlYXQgdmFsdWUsIHdlIGNhbiBhZGp1c3QgaXQuDQoNClRo
YW5rcw0KSmFja3Nvbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERl
dmFyc2ggVGhha2thciA8ZGV2YXJzaHRAdGkuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUg
MTksIDIwMjQgMTA6MDAgUE0NCj4gVG86IGphY2tzb24ubGVlIDxqYWNrc29uLmxlZUBjaGlwc25t
ZWRpYS5jb20+OyBtY2hlaGFiQGtlcm5lbC5vcmc7DQo+IG5pY29sYXNAbmR1ZnJlc25lLmNhOyBz
ZWJhc3RpYW4uZnJpY2tlQGNvbGxhYm9yYS5jb20NCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gaHZlcmt1aWxAeHM0YWxs
Lm5sOyBOYXMgQ2h1bmcgPG5hcy5jaHVuZ0BjaGlwc25tZWRpYS5jb20+OyBsYWZsZXkua2ltDQo+
IDxsYWZsZXkua2ltQGNoaXBzbm1lZGlhLmNvbT47IGItYnJuaWNoQHRpLmNvbTsgTmljb2xhcyBE
dWZyZXNuZQ0KPiA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1JFU0VORCBQQVRDSCB2NiAyLzRdIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IFN1cHBv
cnQgcnVudGltZQ0KPiBzdXNwZW5kL3Jlc3VtZQ0KPiANCj4gSGkgSmFja3NvbiwNCj4gDQo+IFRo
YW5rcyBmb3IgdGhlIHBhdGNoLg0KPiBPbiAxNy8wNi8yNCAxNjoxOCwgSmFja3Nvbi5sZWUgd3Jv
dGU6DQo+ID4gRnJvbTogImphY2tzb24ubGVlIiA8amFja3Nvbi5sZWVAY2hpcHNubWVkaWEuY29t
Pg0KPiA+DQo+ID4gQWRkIHN1cHBvcnQgZm9yIHJ1bnRpbWUgc3VzcGVuZC9yZXN1bWUgaW4gdGhl
IGVuY29kZXIgYW5kIGRlY29kZXIuDQo+ID4gVGhpcyBpcyBhY2hpZXZlZCBieSBzYXZpbmcgdGhl
IFZQVSBzdGF0ZSBhbmQgcG93ZXJpbmcgaXQgb2ZmIHdoaWxlIHRoZSBWUFUNCj4gaWRsZS4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphY2tzb24ubGVlIDxqYWNrc29uLmxlZUBjaGlwc25tZWRp
YS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogTmFzIENodW5nIDxuYXMuY2h1bmdAY2hpcHNubWVk
aWEuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1ZnJl
c25lQGNvbGxhYm9yYS5jb20+DQo+IA0KPiBbLi5dDQo+ID4gIHN0YXRpYyBpbnQgd2F2ZTVfdnB1
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpICB7DQo+ID4gIAlpbnQgcmV0Ow0K
PiA+IEBAIC0yNjgsNiArMzAxLDEyIEBAIHN0YXRpYyBpbnQgd2F2ZTVfdnB1X3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ID4gIAkJIChtYXRjaF9kYXRhLT5mbGFncyAm
IFdBVkU1X0lTX0RFQykgPyAiJ0RFQ09ERSciIDogIiIpOw0KPiA+ICAJZGV2X2luZm8oJnBkZXYt
PmRldiwgIlByb2R1Y3QgQ29kZTogICAgICAweCV4XG4iLCBkZXYtPnByb2R1Y3RfY29kZSk7DQo+
ID4gIAlkZXZfaW5mbygmcGRldi0+ZGV2LCAiRmlybXdhcmUgUmV2aXNpb246ICV1XG4iLCBmd19y
ZXZpc2lvbik7DQo+ID4gKw0KPiA+ICsJcG1fcnVudGltZV9zZXRfYXV0b3N1c3BlbmRfZGVsYXko
JnBkZXYtPmRldiwgNTAwMCk7DQo+IA0KPiBXaHkgYXJlIHdlIHB1dHRpbmcgNXMgZGVsYXkgZm9y
IGF1dG9zdXNwZW5kID8gV2l0aG91dCB1c2luZyBhdXRvLXN1c3BlbmQNCj4gZGVsYXkgdG9vLCB3
ZSBjYW4gZGlyZWN0bHkgZ28gdG8gc3VzcGVuZGVkIHN0YXRlIHdoZW4gbGFzdCBpbnN0YW5jZSBp
cyBjbG9zZWQNCj4gYW5kIHJlc3VtZSBiYWNrIHdoZW4gZmlyc3QgaW5zdGFuY2UgaXMgb3Blbi4N
Cj4gDQo+IEkgZG9uJ3QgdGhpbmsgaGF2aW5nIGFuIGF1dG9zdXNwZW5kIGRlbGF5IChlc3BlY2lh
bGx5IG9mIDVzKSBib2RlcyB3ZWxsIHdpdGgNCj4gbG93IHBvd2VyLWNlbnRyaWMgZGV2aWNlcyBz
dWNoIGFzIEFNNjJBIHdoZXJlIHdlIHdvdWxkIHByZWZlciB0byBnbyB0bw0KPiBzdXNwZW5kIHN0
YXRlIGFzIHNvb24gYXMgcG9zc2libGUgd2hlbiB0aGUgbGFzdCBpbnN0YW5jZSBpcyBjbG9zZWQu
DQo+IA0KPiBBbHNvIGFwb2xvZ2llcyBmb3IgdGhlIGRlbGF5IGluIHJldmlldywgdGhpcyBkaWRu
J3QgY2F1Z2h0IG15IGV5ZSBlYXJsaWVyIGFzDQo+IGNvbW1pdCBtZXNzYWdlIGRpZCBub3QgbWVu
dGlvbiBpdCBlaXRoZXIuDQo+IA0KPiBSZWdhcmRzDQo+IERldmFyc2gNCg==

