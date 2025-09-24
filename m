Return-Path: <linux-media+bounces-43004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E48DB97FB4
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 03:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C58061896243
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 01:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4567F1F416A;
	Wed, 24 Sep 2025 01:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="C758YiUK"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022104.outbound.protection.outlook.com [40.107.43.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CD81A23AF;
	Wed, 24 Sep 2025 01:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758676492; cv=fail; b=joGGlvyc6oI8EBXXtyAQ5sUSqPSVbMaj0cgOjlPyo3vb3BQFj8JjGkr5eRj88bvOpczVuVSupuxkFMcusS0/8wVDh2/gZP3aMZYxuAMsQM7PaezVSHkZl+4lkpuc5TUfkstnFA89Cl1FLlahDZJ+f+uow6YPj1BuZVyfo3WpEgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758676492; c=relaxed/simple;
	bh=1/nZb37bPnVei//2pVbkGjmPDsIpvN76fh8h757S0w4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bCts01z9W+InzfhSnCTgE4BBnD5h83qWURizl9118rLiscS7DmGMil4wxVrK/+TTjttWPkMsL59bI4rOWoxrFRjhitAoSRfv4wzH0mjkQJJlNl/B1zb9WmZoW4t1tysEpAlIAsBYzQJM5pdy6IrGpkl3ovn2aV7tPgoQmj0Pfys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=C758YiUK; arc=fail smtp.client-ip=40.107.43.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWGqiK4x5W7dBpcaw7cohqFhE78twzyX20MlrkyZy/cuJdxfEA6umTR/8tOpk4OexZdKzSxv1/FDG2s8d41FazYRHBpMEMZCKlQOK+4pdxZc+CUZnyPAIxH9WpkqM5idowXIL+2/XI8vcndcqWAhTMuBayWJ9iTcoC9JpDIjasO0lE4xmZMzpDRQydD7b8gtsIODInMeWHYTKWywFDXJ0Zg4Baw+E/93XJS9nq14A6H+8NsvZ1bOYyCui8/rttb1HbupP0/mOeqXNgKhSGtEtE/7Jcbz/JjFZvqMG4rYKnGLzmD/AW9HVoH+HinoehXgnk/Oi8BpZD69yGyY9gvnkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/nZb37bPnVei//2pVbkGjmPDsIpvN76fh8h757S0w4=;
 b=DQQffKuI/xB19zvMFKZKY8vw4SDC9iwmp79ioupU5puRmnpvjQdoGnbQP79R+q9tE4+iZ9f0f/HZ6CZaYa7Go0X6/NpPPWNW/y/lv1iwxhVBJMHk94QMb8/+jqYGaeTX4INskSx/2tJ6dLCpb7Xu7dUdOEp6eOF/LUADwFxSQRefWaBX6bJw6QInSvXLKQih+h+g2RyyWFgrGVd4KoeuSuRppK5ZUzA0muf2zWIJXqD78QRBztkYhnuDmNECZOZ1bu0V5x4406QRJiXJ50n+f0KZKYNPk26rIoC2L+aai5iLkEHuaS6O2Y/5+o7CRt59juhdkqqSwYspZfLR3HzN5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/nZb37bPnVei//2pVbkGjmPDsIpvN76fh8h757S0w4=;
 b=C758YiUKulzvcOwz+x8uojDyMsreeN/6AG6Ed+0r8MjlP8r6lkQNwCV2ReE+qtpHxHrIGAbLUy+gCReAsRFSgeAD7527MqUHz3LY4jHuAaOLKcyC8kp8JdLtj0z3f0kRKh0fzL2gQmOWc2/QYuXaakAU7WfWML2IlefjNr0E5vE=
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::14)
 by SE2P216MB1812.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 01:14:44 +0000
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d]) by PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 01:14:44 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Brandon Brnich
	<b-brnich@ti.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas
 Chung <nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v5 4/4] media: chips-media: wave5: Improve performance of
 decoder
Thread-Topic: [PATCH v5 4/4] media: chips-media: wave5: Improve performance of
 decoder
Thread-Index: AQHcK4Ur0ADySHlKAUOY/TE8pBFINbSfdqcAgAAHuwCAAguCMA==
Date: Wed, 24 Sep 2025 01:14:43 +0000
Message-ID:
 <PU4P216MB114923D47D5AD77D5D32D56FED1CA@PU4P216MB1149.KORP216.PROD.OUTLOOK.COM>
References: <20250922055255.116-1-jackson.lee@chipsnmedia.com>
	 <20250922055255.116-5-jackson.lee@chipsnmedia.com>
	 <1f59f00d-eff7-4c65-a504-227df0de75d2@ti.com>
 <d4b7cc51f1bd7fcf88066e8510f950ec90cfb5aa.camel@collabora.com>
In-Reply-To: <d4b7cc51f1bd7fcf88066e8510f950ec90cfb5aa.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU4P216MB1149:EE_|SE2P216MB1812:EE_
x-ms-office365-filtering-correlation-id: 57152287-1660-4166-e40a-08ddfb07bedd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WkVLOEhBZlpiV2FjL0Y4Wm44OFlKWjhTdHNIQ1hvWWRLR092eHVNL2VmR21w?=
 =?utf-8?B?dTNZTjRUSVVCcFdNSGJTcG95WlFMS3NrRHM1TU5hbHVoclY0bHdHMHFXZDJR?=
 =?utf-8?B?Y2tYVldFZWVtWDcrb3VyUjdtMTBpZFB4NEVKMlA4aGpaQUhkaDlmMFdSakhn?=
 =?utf-8?B?U1NXbWhTUnhjZU1MbDA5LzlwYnNNaVl5WjlYcVh1cjVWOEdOcXVaMExGSjRN?=
 =?utf-8?B?c2dmSERKcTB5Rm1QbUhKbGdNY081VGdjWU1OM0hWVDRqT1llcjRnZHJOSkpR?=
 =?utf-8?B?a3kra2dSTW5WZjN0NytkV3BDZkg5RVNRZDhpMjNLcVV1bFRYTFNlL0gyRTlW?=
 =?utf-8?B?Mzl2VGlCMzkwMkREcy93OE1XYkdITHVzV1R4WFpXQnI2bG55bEpmT3FKQVRD?=
 =?utf-8?B?NnVxRTR2d0NDdXJUVytJR0JrUjFGUkFCZUJ4aXFaYzQ1WDI5UUxjbnpRekc2?=
 =?utf-8?B?NHUyYVZ1b1NKblBZZm8rL2NPRG5ndTlubDZBYXFYdmVveTlBazB6WndQTERT?=
 =?utf-8?B?Z1MwaXpVK0FHSllub0JMR3VPQ2hEQWdvWEw3RTk1aDg3endWaHhMTWRlbHl3?=
 =?utf-8?B?bUR3STVKU0VrNmpPWjk1THlEZDY0OFBFb2xXQ0J2eUROY0dLdHVKOXBDcXBG?=
 =?utf-8?B?ek1oQjhyaFpTZ2FCZ1dLTzVQdUN4NTZYaDYvM2gzUTljZ21oaGpNTDNJd1F2?=
 =?utf-8?B?VDBaa0NpZCtYRnJGNFhNKzhSYVFWQ1Z2L2dhc1FYZ3BPVjNiNURHZ2RWdTJX?=
 =?utf-8?B?ZitDS1pRYjMzbUVGUFpnTHZ4L2JNWmMvRzBmbUdVbnNjbnVTNFA0YkoxUzVQ?=
 =?utf-8?B?UUVkdUdVOXgzeGlZUFB3WVFmYkdpTkZpU0JyZnh6NnA5M09uc0lIUmtEWURU?=
 =?utf-8?B?WHQzWjA5OXJITk9CTWJ3c3dPenhFWGFidlpxVkZOTjVSYTJEeW4yYVlwS1ZJ?=
 =?utf-8?B?ZUk2R1c3cmNNa3dvUHFEbTk3UVREU0YvKzhsaFNUZTZkN2E1bXZUMlRCdmwx?=
 =?utf-8?B?d1VYdlJyV1NjUVRHcHNsdkVzZTZxS2lERmRoQlZhSitxRUZyS3JUMHRPVXVi?=
 =?utf-8?B?WkQxY2Rua0VNeG1lY3lCMWhnenZOTWwydyt1eWltbWpvcUoxM1gyUFhSVnhS?=
 =?utf-8?B?VSthU3dWaUVPR21MbGl1bmhkaFVNNHhJM3pyYUlaTW5FWkUzaEpvdzV3UE9r?=
 =?utf-8?B?Y1hNNEl3NTFRZVQyQS9XaDFQTFpoaVlhT0hTODNpU3F6aFJXZkNzQjRUbHh1?=
 =?utf-8?B?aE9UY3lESWV3c2MzTVdsQ09YZ1pxRzBVUFQ1VVpOLzlGeG9DVVFvVWk3aGJ1?=
 =?utf-8?B?QzUvc2hPZ3JWZGhJRXY5S3FTR0FFc0toblNac0xNdDh2dDAxVm12aDJnWlp3?=
 =?utf-8?B?REl5SEVtVFdUb1dNamlUSVBWeDRjVmZqdlQrampnbVlTMStUUkVLNi8zbFFD?=
 =?utf-8?B?dlhFMHkwb2E5QXpaMHllVFNhVW02eE1qM2FBQUdaM0ozRC9yblBaWE1qOHV1?=
 =?utf-8?B?TkdJclNjU1J2NEhjSVNZT2VZb1FqMXpNTEcveVJPa3JML1l2SERNdUVVQ1pZ?=
 =?utf-8?B?UmpiTkdwc3FGck9OL2ZQVUNZV084eFF3UmlxTDJkVXVKSm9VMnc1UjAvY2M5?=
 =?utf-8?B?SVVQSlBJYWdWRHVsVDR1TUlKcGR1d1dRZklSWitYYWpwK2NCbTBCUk9zNHFJ?=
 =?utf-8?B?Q083VWhrazBnR3BGcGZhWHR2bjhxZHl4Ylh6QWZOSTlWaWlocG9qVlVNNE1u?=
 =?utf-8?B?QW1TREM1WVMreXpieWxxZTJ4bHBoTFpVSkc2YnJmTi85RW9pMlhVN1B5RnNB?=
 =?utf-8?B?WVprRmplNjhZeFFOTHVkMHBSSEFjN1RBdTQ3VndobDBWeWxhSjQ1a1VydEhj?=
 =?utf-8?B?bEhtYnNTRklDNUkvSk9UeVRBL2t6NXM0QWxHMDFwYXd1OUtNcmlON2U2VnJV?=
 =?utf-8?B?enZSakJKVWsrV0w4aDBaWDIydFpMNHllK0pzemxuTkFCWjBTTlE0U0hiM1Ft?=
 =?utf-8?B?cEE3bjRHZDd3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1149.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1oxY2RIbVhVbVVTWkZ5c1Vza2Y1OGh3ZS9LSUxNTVVMdEJyWGd2MllETVky?=
 =?utf-8?B?dTBKTFJIZVdUNS9LMUh4R1p3TXU4KzE3ZkdnRERxRngrcGg3NEY2Wjl6WmJo?=
 =?utf-8?B?NHRkT3ZwVVRRUUtHaWYrdmZrbHJ1UnNVMk5sRTJ2TS9jUll5cDNKTE5xMUZ3?=
 =?utf-8?B?MTRnZFRBWkNhWWxEV2d4SVlIYVUwbEsrNzg1b2lkQ2srNmFmU2JzWk10TVhX?=
 =?utf-8?B?NS9vRzhydzRGME1ZV3lmRkx6THJIZkFuejlJVWswajZoQjNPSE9QYnVXMUps?=
 =?utf-8?B?aCt0V3p4Y2diRHNCcmJLTHIyelRPOEhrUEJPWWJaZU1OcWZGSE9UMzFuZHUz?=
 =?utf-8?B?U0NhZjVhejVNUVRsZjRvaC8yWnJJN1lVaUhZZ3Bhb3QvTFdxWkJjeTdJaDNt?=
 =?utf-8?B?SmVHaVFiUHNuWXFHc09sbnJucTRtckhTam9Rc216V1NuMktTWU14ZWJJVW9w?=
 =?utf-8?B?bjErdjFCemtGZTYrSFFVYk1WSWVYaHZRaitSV2EyOGVpaXhyaTkvMmxUUGJS?=
 =?utf-8?B?aFEwRnJST0tTQjBlMmZRYXVkcDVhbGx6czFXcFRpR1J2ZTdvUDUvbFFvRDl3?=
 =?utf-8?B?eWlZT3ByamZkZElsK3RWS0UrajY1MzczbFZKSk0yTnJuYlJyRjd3NE5KMVJs?=
 =?utf-8?B?TUU5YnhuSFV2R0lDWExsTkdoTW1LNWE0R3BSMjQrTGdZek9WN1lSMG9EV204?=
 =?utf-8?B?Rko1dzEyaVRLdHROUitLZlpWbHdadEhlVUVydklXbmM4RElxOHJDQitJVDRQ?=
 =?utf-8?B?RjVXdW9FU2U0NUJMWjlXMXZBY25GYlJZSzYzd2lzQjY2ak1pT0xKc2tTbXhm?=
 =?utf-8?B?UFZacmgxN3VqdER2cVBRNzNWY2Ivc2U1YzJrZnNha01vUWJNRGZicGVYc1Fs?=
 =?utf-8?B?V2VNMUlrZjl5UjdHdXQ2MW1iQm9sM3F0Sk8yMlBWMGxkUlNVcVg1aFBlUGl1?=
 =?utf-8?B?Q0wvS2xTa0hxTnBTTFYwbFJKSkN6b3M0ME82SXBRZ3lQR2FTbForNHZMdlE4?=
 =?utf-8?B?SjhORFp2ckxMVEQ3eUZtVlZ1MW5HYWxEanVEOTJNWDFHbXJLVVYyY215cFBZ?=
 =?utf-8?B?N1pyMzNTb3NMOWpscThFWFJ0TERvMm1kdUVQaDRpTXhCbXdidEhZR3BXM21l?=
 =?utf-8?B?bysvSUpVZUdSVk8xYkVWZmFIdVlibW43cnQzaU5VM1dXUmorbDgzVUhZaTdl?=
 =?utf-8?B?S04xVS8yM2Q2RVYrRENLMHM3d1l5TmZtTW04ZjVOZDFNb0VSM0RCcE9IczBa?=
 =?utf-8?B?M0psMGtBZnA2ZGRaTXVnamF2Z2hOLzNuendxcjF1YTJVWnoybXlxNzdjVHNT?=
 =?utf-8?B?YXRMMXJvOGxtRGRRM3FJSmd4T3Q3TU9LUWxNMVpEdHRJRStsdjVvWnpmVmpm?=
 =?utf-8?B?WXI4RURUaFh0MlZ3N0lQQldiY0MzbkwxKy92V1NOcTBvTSs2ZkRIYU9LWkVE?=
 =?utf-8?B?NW5HbTdtdzM5VjJMYVZ1OE41MnBRTVZSdXhFQzU2QUdxQ000YXVEc0VrVTg2?=
 =?utf-8?B?eHVia3ZNRWIxMk9tbU5JRnZEV09ZVUdlaVM2SEs5RSswMGZkWmVNbnJLeHNs?=
 =?utf-8?B?YkFQNXcyQzJFVE5yZlE5Q3ZlK0hzSHBhclRGV05wMk5HSy96TXVaYzJRUTBn?=
 =?utf-8?B?cS9rRkF4aDAxNFBHUlI2YWVIQ0NyV0h0dGFUaEdHRlUxUERyZFpRb0htRkdI?=
 =?utf-8?B?ZU9ldlA2aG1IejhXME0wUlNxM1BtSnRKTGR0c2dOaFlmb0cwZEQxZEF6Wmgr?=
 =?utf-8?B?NnNQUUp2K0hSNWw5K1hhSWlwclcrM3FTZjBBTjNpbUwwYWVXMlBkb3ptdmJt?=
 =?utf-8?B?blA5ZS9USW5sK1ExWVlMTVBTWWo3cmhqNnpydDN0cGw2ZGVzbFIxelV5REsw?=
 =?utf-8?B?OXdva1J4U0ZLUDZ1aTVkUGo4ZkZxNVVyakxsKy9jb3ZPcXlhRkw2RUdWb0tB?=
 =?utf-8?B?SXZqaGhzNmdoQ25zd3BFbjRkbVRJcVorMDczZVdWdGhQWmh3ckwxdXdHcy9G?=
 =?utf-8?B?d3NQQWNUMUkrN3pGTldjc2wzOENkQkpxK2c3b1o5UW85U0ozSlllYVlGRHBw?=
 =?utf-8?B?OFRmL2tLSGtWZm1UM1Q2UWZJSmlIU3BsTmpwNnpiZUkyWmY1RXpQOGQzVmF6?=
 =?utf-8?Q?OP1+ijEjdbvSotCLoidAwN/+X?=
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
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 57152287-1660-4166-e40a-08ddfb07bedd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 01:14:44.1861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kna276u5k46QIpN4J7u3SPzOA4HvyS3glgzbbw5/bNh8+ML26zAttuwFBpsfX+zXYNdwMHWcxc+9uEUAx16tFOn7aFOFqP4cg6i7Rmc0C8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1812

SGkgTmljb2xhcw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5pY29s
YXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4NCj4gU2VudDogVHVl
c2RheSwgU2VwdGVtYmVyIDIzLCAyMDI1IDM6MDAgQU0NCj4gVG86IEJyYW5kb24gQnJuaWNoIDxi
LWJybmljaEB0aS5jb20+OyBqYWNrc29uLmxlZQ0KPiA8amFja3Nvbi5sZWVAY2hpcHNubWVkaWEu
Y29tPjsgbWNoZWhhYkBrZXJuZWwub3JnOyBodmVya3VpbC0NCj4gY2lzY29AeHM0YWxsLm5sOyBi
b2IuYmVja2V0dEBjb2xsYWJvcmEuY29tDQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxhZmxleS5raW0NCj4gPGxhZmxleS5r
aW1AY2hpcHNubWVkaWEuY29tPjsgaHZlcmt1aWxAeHM0YWxsLm5sOyBOYXMgQ2h1bmcNCj4gPG5h
cy5jaHVuZ0BjaGlwc25tZWRpYS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgNC80XSBt
ZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1OiBJbXByb3ZlIHBlcmZvcm1hbmNlDQo+IG9mIGRlY29k
ZXINCj4gDQo+IEhpIEJyYW5kb24sDQo+IA0KPiBMZSBsdW5kaSAyMiBzZXB0ZW1icmUgMjAyNSDD
oCAxMjozMiAtMDUwMCwgQnJhbmRvbiBCcm5pY2ggYSDDqWNyaXTCoDoNCj4gPiA+IC0JLyoNCj4g
PiA+IC0JICogRHVyaW5nIGEgcmVzb2x1dGlvbiBjaGFuZ2UgYW5kIHdoaWxlIGRyYWluaW5nLCB0
aGUgZmlybXdhcmUgbWF5DQo+ID4gPiBmbHVzaA0KPiA+ID4gLQkgKiB0aGUgcmVvcmRlciBxdWV1
ZSByZWdhcmRsZXNzIG9mIGhhdmluZyBhIG1hdGNoaW5nIGRlY29kaW5nDQo+ID4gPiBvcGVyYXRp
b24NCj4gPiA+IC0JICogcGVuZGluZy4gT25seSB0ZXJtaW5hdGUgdGhlIGpvYiBpZiB0aGVyZSBh
cmUgbm8gbW9yZSBJUlEgY29taW5nLg0KPiA+ID4gLQkgKi8NCj4gPiA+IC0Jd2F2ZTVfdnB1X2Rl
Y19naXZlX2NvbW1hbmQoaW5zdCwgREVDX0dFVF9RVUVVRV9TVEFUVVMsICZxX3N0YXR1cyk7DQo+
ID4gPiAtCWlmIChxX3N0YXR1cy5yZXBvcnRfcXVldWVfY291bnQgPT0gMCAmJg0KPiA+ID4gLQnC
oMKgwqAgKHFfc3RhdHVzLmluc3RhbmNlX3F1ZXVlX2NvdW50ID09IDAgfHwNCj4gPiA+IGRlY19p
bmZvLnNlcXVlbmNlX2NoYW5nZWQpKSB7DQo+ID4gPiAtCQlkZXZfZGJnKGluc3QtPmRldi0+ZGV2
LCAiJXM6IGZpbmlzaGluZyBqb2IuXG4iLCBfX2Z1bmNfXyk7DQo+ID4gPiAtCQlwbV9ydW50aW1l
X21hcmtfbGFzdF9idXN5KGluc3QtPmRldi0+ZGV2KTsNCj4gPg0KPiA+IFBhdGNoIGlzIGZhaWxp
bmcgdG8gYXBwbHkgaGVyZSB0byBsaW51eC1uZXh0IGJlY2F1c2UgdGhlc2UgcmVkdW5kYW50DQo+
ID4gY2FsbHMgaGF2ZSBhbHJlYWR5IGJlZW4gcmVtb3ZlZFswXS4NCj4gDQo+IFdoaWNoIGhhdmUg
bm90IGJlZW4gbWVyZ2VkIGJhY2sgZnJvbSB0aGUgUkMgaW50byBtZWRpYS1jb21taXR0ZXJzL25l
eHQsDQo+IGZvcmNpbmcgdG8gc2tpcCBhIGN5Y2xlLiBKYWNrc29uLCBmZWVsIGZyZWUgdG8gcmVi
YXNlIG9uIGxpbnV4LW5leHQgbGlrZQ0KPiBCcmFuZG9uIHN1Z2dlc3QuDQoNClRoZW4gc2hvdWxk
IEkgbWFrZSB2NiBwYXRjaCBzZXJpZXMgYmFzZWQgb24gTGludXgtbmV4dCA/DQoNClRoYW5rcw0K
SmFja3Nvbg0KDQo+IA0KPiByZWdhcmRzLA0KDQo+IE5pY29sYXMNCg==

