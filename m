Return-Path: <linux-media+bounces-33424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA430AC475A
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 07:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 703303B8416
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 05:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432181DC9B8;
	Tue, 27 May 2025 05:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="VLyONaUv"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021088.outbound.protection.outlook.com [40.107.42.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87221AAE28;
	Tue, 27 May 2025 05:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748322254; cv=fail; b=A8zXlEP94Mw3Nv6bBXUox5FwH/wb3aZk3SJk6HEQL6TsB50F8A85ylKbiS72ueZI2+0B+UjB9prmgpxg9t6hhseOgoP7KrJvDcYkpWKi3mhFAuXAtGT7lROSF1I11/wLy9PnobWXyq0t3NzpfFnpCoWBjeQzAmi4vcD4sUYZK+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748322254; c=relaxed/simple;
	bh=fKFwNGFWhnG2/8I2yCux78YROvRim7mJZIcglj07dJA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RbJ6aCCzHNuHMO2RSI1blpP9m50PkfXkF0xlZtpRqisAJQx6X2era+R9LQ/9+ISILdaUFX3wOENn37M8IEfaClBTo47yYp21UAAyQF/MaMhIZe/a0teid8OQLbhz7Y2GcILFOeuhhIniW5zYFMdEPXi0uzoyCnlcB9AcG+HpkKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=VLyONaUv; arc=fail smtp.client-ip=40.107.42.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEUbUfZ97l0bzZ6ZiiVaaG/9uv3ls+GvDi6Tv8wGeW5kLUJe++VqVED6uMBh4xMKS1bCd4zL1n/ll1oA8iIoxTNk9kU8ltCrMoHjb8Udet88WOC2CJp7qxGsxybF/dC32S/OLEpaQqgRcEL7ipO6KGXYmWIr/EDcs6eeyzNqaA4YNQ6QXek/prusgjK+Tz3jh2Ki92Z0QwalR3RfAYEhJU/Hk2ddgTcyjA8pMXuPzC1Jx/esFT93ObLhDI4qIWzipuZofg1exOHxL5rTDJXAxkoLnOf79/NxtphEOjn0UWq27TDr52/CKlITBWggUKGDaPbYb1HP5Dk7b5TnjrT/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKFwNGFWhnG2/8I2yCux78YROvRim7mJZIcglj07dJA=;
 b=QGnV6QJAJ7+ejzLYYRvCYqUHhwuS6GCSuqwEc2tKc9GakbMuoi9yrhN0y794wVG4x3nYyExxLlbNHaRMgdop5+wM8pjHr1cKyiiXUtfZppxKemPzr86BzMJWII2G2P/RNd3pUuJTKjwfr/iotjlfVILgJ7SHMlwLwGOfYB8d9MnY2DNoS64BCcR1oMsi3DrxQL2A24xofI4as4mXC3c1XopicSg7+R/2XaPdqWnOR/+ojq9pTXkqC2HyY1s6n2Ypb/KZaojLO3Rj8S360V2yoxZosBRyvp5KRnY8PwFwz7yZa+jrhq8+Znw1den7AAb/3PA74v0ibx3WAwX7g9MH0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKFwNGFWhnG2/8I2yCux78YROvRim7mJZIcglj07dJA=;
 b=VLyONaUvxityJ9FeagPqgMuXL3cTGSQ/+e2StKdgVthcOM7V1Wc+JMEue0ADleKYKh6XcLabj67b1x8y+3OSO3/PRkst/goBhNlirSte7Huar1fdUMHcB0MJqhFaLhCkGApvpQ0/exqtbD3/76kjPvf+mGLBGL94nL8amqxOKxo=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB1981.KORP216.PROD.OUTLOOK.COM (2603:1096:101:fd::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.27; Tue, 27 May 2025 05:04:10 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 05:04:10 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>,
	"dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v2 5/7] media: chips-media: wave5: Fix not to free
 resources normally when instance was destroyed
Thread-Topic: [PATCH v2 5/7] media: chips-media: wave5: Fix not to free
 resources normally when instance was destroyed
Thread-Index: AQHbyurOtkktyaYpWkKy+OKGIs6ipbPgfioAgAV1TYA=
Date: Tue, 27 May 2025 05:04:10 +0000
Message-ID:
 <SE1P216MB1303342A1994DEA4DF0F0280ED64A@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
	 <20250522072606.51-6-jackson.lee@chipsnmedia.com>
 <ab06cbe0d1c30e8fde725eabbc504932a9512692.camel@collabora.com>
In-Reply-To: <ab06cbe0d1c30e8fde725eabbc504932a9512692.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SL2P216MB1981:EE_
x-ms-office365-filtering-correlation-id: f4e93690-5f8d-4c1e-0cec-08dd9cdbeaa8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eERSTkl1MkR3MFd5a2FUZllXK21pcWl3VHRZRDVsbmtkY1dZQ29qUnU4Y1hm?=
 =?utf-8?B?L2N1aGkzL0RidDlCQXp3akI5cmNIRGNKOHJFbGpYT0lDVU1FV1ZPTGxIMUFK?=
 =?utf-8?B?bVRqZUdWMGxlS05UOEJONGxMeXFZK2FVM1hYYlk4WittQUgrcU1aKzIzSzl0?=
 =?utf-8?B?U0g5ZDRRMjhYMFNzRGFHQUlNd3VkVEU0akFwM3pLU0dqNHJuaFNDam5lWWpV?=
 =?utf-8?B?dnBXUGMvN3JDNStPRldOR0pZSGo5bkFNZE93ZmV1RDVFSElkQytRUUo4OHBV?=
 =?utf-8?B?eC9aeE4xZW45ekJnSStmM0t2aDFEOWpOdmJSU3ljSmdjM0ZtY1FCQmFRaHZS?=
 =?utf-8?B?RTg4MWVmaXlLWVpvWmZIZXdpZjZXMHluRmtQdjdPdk10Nmw3WXNGRnYzaHo2?=
 =?utf-8?B?UnJrZTVoTXh1Si9UTU9hWTBvZGhtRU5RSXZrZEtnWFQ5SUZBVUJ3R0RmTEdD?=
 =?utf-8?B?TUFIdTVLZmUzcSszeE90VmtXcC9keDQ2SFhpQUlJMHdLeGRnbDdWMUVSRURi?=
 =?utf-8?B?WnRKTjRyeUVOV1FQNlE2azh2NFUyVzRkcWJmdEtKUVQyUnkzTU92VGcvQnR4?=
 =?utf-8?B?Z05ZYnZIY1pzOVcxbElUUEl3TW0wN1JHVlpHMG1sdk96VXZHekczU1lDQUdY?=
 =?utf-8?B?MlRWSzRFRTcxZTZYaUVCOFdKUVdLQWhwL28ybWpLNHl1TjFETjVFcnUzTnlP?=
 =?utf-8?B?aFYzVHRNZnR5UW9aVXArQnlQcUR2aHRDdkdaMEVXWnMrVFRYWXRXdS9CeWxk?=
 =?utf-8?B?OG83UlFXTThJajZFckJLNUFja2VoWEV5T2xYNmxEcFFlbWdpbzVSaXVJWWlW?=
 =?utf-8?B?ampGM3NtNFJxOXUzQ3dwMXpIa0RORXlVMEVEYkx6WXR3elduTTdaRXl6R2dq?=
 =?utf-8?B?SjIvUW5SZDJJNnlSRHhmVEJFclhuQ3JkU1hoU1BoVUxaUy9jWnlUVUxOK3Z6?=
 =?utf-8?B?OEhMNWdhbkdtL0FuS2ZyRUg3SVdDUWxhRE5WTXY0SUFveFZHQUVnTTIrS1FS?=
 =?utf-8?B?TDd1VkduS0pnWEVsdmorMnhSZE1HK1l3MG05dlNKZEpCUWpqV3E2NTZaL0Ex?=
 =?utf-8?B?OTc4R05uOVhpdW9WQ0ZXQ3IrVllYMUl2YkUxcEZDME82TWJ2aTdYSEQrd0hP?=
 =?utf-8?B?QkhMVkp5N1JNYUQ3Q1F5dnhzaWVzNlN3aXd0Zk44K2xia09DeE9hb1pyVkl0?=
 =?utf-8?B?c2pUT1c5SlVQeldQQVBxaGJEa001WmxZT3VrQk5RY1pQTGp1YmRRaFpVU21U?=
 =?utf-8?B?MEdZTXJwTFNiVWR1bmRqeWJSbU40T3h6di9jWXUzY1lZNktVNkU0RTFqeUpT?=
 =?utf-8?B?RkFmRE9zR3hFUWVMVjRobjRvdi9JTHJWTWZVNWQwZ1huSGNRVElrUkxQZ1Mw?=
 =?utf-8?B?N3h3V2pLQW5kMGpjKzZLYTgyNGcwMHNkK3RFUy83RE12M2tiaVB0Vkhoa0sx?=
 =?utf-8?B?MXYyNVF4VlJnSnNzUmVkRTY3aS9oWXhsYlEwN1hLZlNRRW9KWlM0ZGZOQzM3?=
 =?utf-8?B?UnNWcHhSSzk1TGh4azhxK0NtV1dDcS94Q1QyWkZUVVRXcHIxbDNvdytsclN3?=
 =?utf-8?B?THlCcG1BZUZLNEdMZXdJaGU2RnhIVTVmSkp3a2srWStsTkw4bWhjVjBaK0lq?=
 =?utf-8?B?a0dWVFZ5YVF2TmRJcEQrWjZ6V0YvMFpvdVprTTFBR1FZMi9XSGl2Qmg5YWdD?=
 =?utf-8?B?dzRKZkJVNzVFUkVPeGhRQlFRSXJNUnR2NDVuaGtnL3R6RFo0ZmdLeklCdWN0?=
 =?utf-8?B?LzUrR3Q3UExFdVk0VStpV2VNSWRYOEkxYXp2SURMQ29rMzMra002bytvY1F6?=
 =?utf-8?B?Qk1yWXJ2NnpvZFpMQTFaUE5KTnZnV1dDZ0NWVEpSOERmc1pieUZ3NWFjZ0s4?=
 =?utf-8?B?eHJMckFESmpLcnlSajlLMUdrSjlpa1ZscHhsWWZUVGVrWUpEb2EwYk1PUVds?=
 =?utf-8?B?VGdvMWFndVNOMWZWR1RXTURtZ0FJYjhlOHVSKzRLendZZDdVcGFqa1BEVHVG?=
 =?utf-8?Q?9GTAq6p6POaN2cnpRZKDNKJXifu8Ps=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0ZHdW5YeUZQbjlKdjUxL1FzREJGelN6N05aRHpWN0t0azFFSk5yNkU4aGl3?=
 =?utf-8?B?YU9oU0ovN1BMU1pkTEtmT29seWlpdVhmUks5MGFodTRSRkZpc2tPb0xwQjBs?=
 =?utf-8?B?d0lHQ0I0bGtUTklTbmRzM3VXcFA0RkhlZEdqYnkwQ1NEV2NHbkxqR3FjbDI2?=
 =?utf-8?B?ZFQ1bDhodmxMd0RTMXZkY21lSStGSUV3anNYRlN1MFNZUGpPNGozUlVwd2JH?=
 =?utf-8?B?aE42Tnc3TmZEMVI5Mkl3SDhGMWorUEx0RnJ6WUtyT1FBaVoycmRzM29RQ0dZ?=
 =?utf-8?B?cHFuempVRk1JTVF4YWJFUDdDeWc0MDg1VTZEVzRhbklXNmlJR25RODFDOWdG?=
 =?utf-8?B?UHhTdktZa1I1MWRoeHdVZ0Zpbks1N1FkMTRZd2ppdnZxZG1qTEpCbHhHRFMv?=
 =?utf-8?B?NHJMU3VtdTBTaWJ5dzd5QVpqaXh0U3pYTVhheEJJOU42eFo2aXdDRERpVmpo?=
 =?utf-8?B?aUFEMFk5SEY2SW80cXRtNGJmUkJDcXVVUThZQzdVWHB2R2p4WE5Ba0ZWZGVy?=
 =?utf-8?B?alBrNGFDdGNiMmYzVmMrRHBZKzFLb1IyUnJINS9IU1V6YWNRODFMckIrbUsv?=
 =?utf-8?B?U2ZMcTBrT3JrWWN5aFBFME1yRWVCam5BUVFtMW5FOVl6S3JxR3RqUFNDeWFX?=
 =?utf-8?B?QkZ1enMvMUVYazVoeDlESk0yU3gxWXJzaUtQRmFCYzUwQ2cxQkxrNU1GYmZV?=
 =?utf-8?B?YTBOM3U5eXBpc1NJTkM3UnhuYW9SVHcwYlhTVmFuTkU3QllqakFOSDhaaVow?=
 =?utf-8?B?SFUyL1Y0MndLZmF4ekN3RG1vTjROa1h3Y0RzbDBoMDI2dEtTOSt3ZzJzbmJT?=
 =?utf-8?B?cjRaRUU4dHF1OHF3TU5ySFJlbG9vS2JIdlgyVVFBQmhmQlVMZTNod0RqbExW?=
 =?utf-8?B?ZHRwcElsMkNTeE0xNER5cElGSzQ3VGpES3VKZ1BmbHlGSlhHZDFFb2wydG1L?=
 =?utf-8?B?N0x0YXhtcEcrMVBFdHVReUpnV1JDMWFlSXVHSFEwRm1IOU5OM0tSRGd0NEFQ?=
 =?utf-8?B?eVNHc21hZUJiVktjaUluR05EViszYkJJNFZxY1dhSmdFQ0djeEY0RHM5OFZv?=
 =?utf-8?B?UGpJdjcwR093Y3ZEbGhJY3A3ZThsZ3lzQUgwWFA4U2t4SHNBVFAxK29XaG5K?=
 =?utf-8?B?MWpaTUFjTlRxdTF6Smd4c3ZuRUNRQ1FpK2tWSGw0Y1VZZ2RQRjg5b09xaHFD?=
 =?utf-8?B?MzU1RkFTZkxEc0pkcnFoekNzazN3eDVTNVlsWi9jOE1sUk9ObnFoaEQyVW5O?=
 =?utf-8?B?ZXFaaktrQWlCMWsxR1UwZmNhL1o2Mno0K1FtWm02aUJCS0poa0tYVWp3SjJC?=
 =?utf-8?B?VlEzWkp0bEdUQ0owT1JwMkZvcGQwVFNFa05kdkZYclNHRzR1ZkxrY2FEckpi?=
 =?utf-8?B?K3M5MVhKRjRWS3h6b0NPeHdqVlVWcVpuSi9MbkFtU0ltOWp5Z3M1dGx4MjlD?=
 =?utf-8?B?MzV4bVE0OTkzN0RRSjlsaHJPc0lUZm53Y3pKaGRuNWNwZWFEd3kwc0ZDOERC?=
 =?utf-8?B?OUJwRnk2dmhhdzVwR3V0NFdPeHAvc0VBUFdLZFNqWWd1QlFYQVJCOFZTNTVa?=
 =?utf-8?B?T1FRRy93MWtnNHlxVlNHRXoxOCtnY3lzTkpaS3J0ZWVwKzhJbVlEQ2RkalFX?=
 =?utf-8?B?bENSM01DNC9tenE5S3Z4NVJoa3BtOEFnQmpRYUNKZS9TdURiT2RFQ1o0aWZs?=
 =?utf-8?B?TG5pMlc0azNFQUxCeGErMjlnYnJ3NmNOS3JybDhPRnFCQjd0YXJPaU95c250?=
 =?utf-8?B?OC9IZnVObG13TEpyS2orTEVJa2txY1VPZXdtalhsaEZqcDJxZHdIaUdPU0Zr?=
 =?utf-8?B?WHJRWnNtNTl2WVFjK0dlU1A4UnA1bjJ3bEhVUktULzR3NGM5TWphWVdESmV2?=
 =?utf-8?B?ekFBWElyYTlDZTZZbE13L3R3V1JnTytad0N3NzN4MHZlWS9sVERxNVNTVzBN?=
 =?utf-8?B?RU5aNjJoR1RvVU1PZStTM2tXcExpdVo4ajRyL0lXY1Nhc1d3eHZHQ0V3QXRJ?=
 =?utf-8?B?MjBkZU12NGFWWGNOM2Q1dVdhN2tpWU9oeEdLY3kyOHUvTnpuTGVVWGdZQ045?=
 =?utf-8?B?NVN1YlRoL0wxM3U5NmJXQVgzRWhOTWZUdWplSTBTTzF2WWRkczVybE8zNWcv?=
 =?utf-8?B?Z1VVQUpYMFpJaXZYN1I4RGVSNFZWYTdJcVhlSFlKQTNsQmpBVmRHNlYxbjgv?=
 =?utf-8?B?SVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e93690-5f8d-4c1e-0cec-08dd9cdbeaa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 05:04:10.4643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DM6lP8f7Fnoc1UxHk2bNycCYg3GxuHXbVirgYURF6shNp0X2EQqH0QCq8UPRWZBQdzSdenJ27TZJ6GloKNOCETX6Xy+v7jh9PAP0SdVEv7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1981

SGkgTmljb2xhcw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5pY29s
YXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4NCj4gU2VudDogU2F0
dXJkYXksIE1heSAyNCwgMjAyNSAyOjQyIEFNDQo+IFRvOiBqYWNrc29uLmxlZSA8amFja3Nvbi5s
ZWVAY2hpcHNubWVkaWEuY29tPjsgbWNoZWhhYkBrZXJuZWwub3JnOw0KPiBodmVya3VpbC1jaXNj
b0B4czRhbGwubmw7IHNlYmFzdGlhbi5mcmlja2VAY29sbGFib3JhLmNvbTsNCj4gYm9iLmJlY2tl
dHRAY29sbGFib3JhLmNvbTsgZGFmbmEuaGlyc2NoZmVsZEBjb2xsYWJvcmEuY29tDQo+IENjOiBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IGxhZmxleS5raW0NCj4gPGxhZmxleS5raW1AY2hpcHNubWVkaWEuY29tPjsgYi1icm5pY2hAdGku
Y29tOyBodmVya3VpbEB4czRhbGwubmw7IE5hcw0KPiBDaHVuZyA8bmFzLmNodW5nQGNoaXBzbm1l
ZGlhLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA1LzddIG1lZGlhOiBjaGlwcy1tZWRp
YTogd2F2ZTU6IEZpeCBub3QgdG8gZnJlZQ0KPiByZXNvdXJjZXMgbm9ybWFsbHkgd2hlbiBpbnN0
YW5jZSB3YXMgZGVzdHJveWVkDQo+IA0KPiBMZSBqZXVkaSAyMiBtYWkgMjAyNSDDoCAxNjoyNiAr
MDkwMCwgSmFja3Nvbi5sZWUgYSDDqWNyaXTCoDoNCj4gPiBGcm9tOiBKYWNrc29uIExlZSA8amFj
a3Nvbi5sZWVAY2hpcHNubWVkaWEuY29tPg0KPiA+DQo+ID4gU2luY2UgYXBwbHlpbmcgcGVyZm9y
bWFuY2UgcGF0Y2gsIHRoZXJlIHdhcyBhIHByb2JsZW0gbm90IHRvIGZyZWUNCj4gPiByZXNvdXJj
ZXMsIHRoZSByb290IGNhdXNlIHdhcyB0aGF0IHRpbWVvdXQgc29tZXRpbWVzIGhhcHBlbmVkIGFm
dGVyDQo+ID4gY2FsbGluZyB0aGUgd2F2ZTVfdnB1X2RlY19maW5pc2hfc2VxKCkgd2hlbiBhcHBs
aWNhdGlvbiB3YXMgY2xvc2VkDQo+ID4gZm9yY2libHksc28gaWYgZmFpbHVyZSByZWFzb24gaXMg
V0FWRTVfU1lTRVJSX1ZQVV9TVElMTF9SVU5OSU5HLCB0aGUNCj4gPiB3YXZlNV92cHVfZGVjX2dl
dF9vdXRwdXRfaW5mbygpIHNob3VsZCBiZSBjYWxsZWQgdG8gZmx1c2ggdmlkZW9zDQo+ID4gZGVj
b2RlZCBiZWZvcmUgY2xvc2VkLg0KPiANCj4gRWl0aGVyIHNxdWFzaCwgb3IgdHJ5IHRvIGJyaW5n
IGJlZm9yZSB0b28uDQo+IA0KDQpJIHdpbGwgc3F1YXNoIHRoaXMgcGF0Y2ggdG8gdGhlIHBlcmZv
cm1hbmNlIHBhdGNoLg0KDQpUaGFua3MNCkphY2tzb24NCg0KPiBOaWNvbGFzDQo+IA0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogSmFja3NvbiBMZWUgPGphY2tzb24ubGVlQGNoaXBzbm1lZGlhLmNv
bT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBOYXMgQ2h1bmcgPG5hcy5jaHVuZ0BjaGlwc25tZWRpYS5j
b20+DQo+ID4gLS0tDQo+ID4gwqAuLi4vcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUt
dnB1YXBpLmMgfCAyMA0KPiA+ICsrKysrKysrKysrKysrKysrLS0NCj4gPiDCoDEgZmlsZSBjaGFu
Z2VkLCAxOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1YXBp
LmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUt
DQo+ID4gdnB1YXBpLmMNCj4gPiBpbmRleCA2OGQ4NjYyNTUzOGYuLmQ3MzE4ZDU5NmI3MyAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dh
dmU1LXZwdWFwaS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRp
YS93YXZlNS93YXZlNS12cHVhcGkuYw0KPiA+IEBAIC0yMDksNiArMjA5LDcgQEAgaW50IHdhdmU1
X3ZwdV9kZWNfY2xvc2Uoc3RydWN0IHZwdV9pbnN0YW5jZSAqaW5zdCwNCj4gdTMyICpmYWlsX3Jl
cykNCj4gPiDCoAlpbnQgaTsNCj4gPiDCoAlpbnQgaW5zdF9jb3VudCA9IDA7DQo+ID4gwqAJc3Ry
dWN0IHZwdV9pbnN0YW5jZSAqaW5zdF9lbG07DQo+ID4gKwlzdHJ1Y3QgZGVjX291dHB1dF9pbmZv
IGRlY19pbmZvOw0KPiA+DQo+ID4gwqAJKmZhaWxfcmVzID0gMDsNCj4gPiDCoAlpZiAoIWluc3Qt
PmNvZGVjX2luZm8pDQo+ID4gQEAgLTIyOSwxMSArMjMwLDI2IEBAIGludCB3YXZlNV92cHVfZGVj
X2Nsb3NlKHN0cnVjdCB2cHVfaW5zdGFuY2UgKmluc3QsDQo+IHUzMiAqZmFpbF9yZXMpDQo+ID4g
wqAJCQlnb3RvIHVubG9ja19hbmRfcmV0dXJuOw0KPiA+IMKgCQl9DQo+ID4NCj4gPiAtCQlpZiAo
KmZhaWxfcmVzID09IFdBVkU1X1NZU0VSUl9WUFVfU1RJTExfUlVOTklORyAmJg0KPiA+IC0JCcKg
wqDCoCByZXRyeSsrID49IE1BWF9GSVJNV0FSRV9DQUxMX1JFVFJZKSB7DQo+ID4gKwkJaWYgKHJl
dCA9PSAwKQ0KPiA+ICsJCQlicmVhazsNCj4gPiArDQo+ID4gKwkJaWYgKCpmYWlsX3JlcyAhPSBX
QVZFNV9TWVNFUlJfVlBVX1NUSUxMX1JVTk5JTkcpIHsNCj4gPiArCQkJZGV2X3dhcm4oaW5zdC0+
ZGV2LT5kZXYsICJkZWNfZmluaXNoX3NlcSB0aW1lZCBvdXRcbiIpOw0KPiA+ICsJCQlnb3RvIHVu
bG9ja19hbmRfcmV0dXJuOw0KPiA+ICsJCX0NCj4gPiArDQo+ID4gKwkJaWYgKHJldHJ5KysgPj0g
TUFYX0ZJUk1XQVJFX0NBTExfUkVUUlkpIHsNCj4gPiDCoAkJCXJldCA9IC1FVElNRURPVVQ7DQo+
ID4gwqAJCQlnb3RvIHVubG9ja19hbmRfcmV0dXJuOw0KPiA+IMKgCQl9DQo+ID4gKw0KPiA+ICsJ
CW11dGV4X3VubG9jaygmdnB1X2Rldi0+aHdfbG9jayk7DQo+ID4gKwkJd2F2ZTVfdnB1X2RlY19n
ZXRfb3V0cHV0X2luZm8oaW5zdCwgJmRlY19pbmZvKTsNCj4gPiArCQlyZXQgPSBtdXRleF9sb2Nr
X2ludGVycnVwdGlibGUoJnZwdV9kZXYtPmh3X2xvY2spOw0KPiA+ICsJCWlmIChyZXQpIHsNCj4g
PiArCQkJcG1fcnVudGltZV9wdXRfc3luYyhpbnN0LT5kZXYtPmRldik7DQo+ID4gKwkJCXJldHVy
biByZXQ7DQo+ID4gKwkJfQ0KPiA+IMKgCX0gd2hpbGUgKHJldCAhPSAwKTsNCj4gPg0KPiA+IMKg
CWRldl9kYmcoaW5zdC0+ZGV2LT5kZXYsICIlczogZGVjX2ZpbmlzaF9zZXEgY29tcGxldGVcbiIs
IF9fZnVuY19fKTsNCg==

