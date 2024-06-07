Return-Path: <linux-media+bounces-12697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A38C28FF98D
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 03:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DC7D1F23A98
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 01:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE586DF51;
	Fri,  7 Jun 2024 01:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="jwVZae8T"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020108.outbound.protection.outlook.com [52.101.156.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D357D846F;
	Fri,  7 Jun 2024 01:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717723680; cv=fail; b=ttPu1+gqX1no8pcfwSpuQ7YMHcjyZZXbqMm0N5uu0vrijReHJCePlGdX+QMKyl70bp/TtaJ5B27UMTGR72V2Pkkh+UhZm08yhp4khsmo2JjDYhcZobX+x+V1/CAxVrvo0/ZxWPVUqfXaFSabIueh2UMnOoq9GbIqBpHrtSAcroQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717723680; c=relaxed/simple;
	bh=ZDSXjGKy4Wq0tXxbJUK1mJkGsbuigrouIdlrtLJQzHo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dSezYJuLpoi37b5jCd9AFyAOhN++xa5vSWWKpt1fHZaC3nYYQJoh/TtBEXbASo+VZfM1vnbyhCa9ySRAypDPhp/J+yxzzIf1cHky/QTa5yXRDd0jvxnOB7+73BXn9kcTnAqPWFR6i16Y7CBXKaPRbBISuWOrFDrOaD+pmya0LfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=jwVZae8T; arc=fail smtp.client-ip=52.101.156.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6S44SntoBgUQfnvq5lGTzrsd+lSMQUi9y/w/vfyHBURLLPYamp8Ra9dTWriIwa8pkZVA2Q5uqZ2cMrjPHJot+eD+/R8HFFK2QrSXrGocW0we6JKHKLZ0RTnwA5+OC+bQx2rqxuv0KeICGzCAE22LN1IcNrIgT3mXHD1izkIRNrmlHksdIFRPMgn7cS6P4cK/qZlkmfllbiaUtxu+BHX0drTlmXowMMEXoOdsmuVvpHxDfQOjBkDOzPHP5txd2A4OQ5y0xKXIycR8SQy97C1R9tTYPkd60LKuzin9FpGw1ylZsYhjz7OJPT/gy3oTZ2WLeHFDCHd8uT9TkiVpsfccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDSXjGKy4Wq0tXxbJUK1mJkGsbuigrouIdlrtLJQzHo=;
 b=SKEIs7WEoGTQFxMG5NhN2wHoXzLMmMhSmkGaUYvDAbmzUfL0Ns/kzg+/avBEDV0DYI+4/XTN+CcZQ82PLXhMaPnR31QR1qGFpBHk7RJjPxOxgcx4LliJG+B1KvH19eAYIJO1AH42nrcGMKj8pItEvhG41vGUdL2w5/B1XAhwknckI2gopIPujBsPLV0fraTeArdizjq+I1aW6925yOpHUOFanO8/kpeltdk4d6rVJaH+uXUwSDzSCYZyPgctxjAYhXwyygY6tRopqsE5n/QCcSECQbt6I4Y2fntM/L073CKFRC27NNIw54RtzeCVyK+p0mEJhmrMnV1ewIJIPJyH7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDSXjGKy4Wq0tXxbJUK1mJkGsbuigrouIdlrtLJQzHo=;
 b=jwVZae8TvFTzLU8ipTg4J7STKyIFDLHk86N+2MlTL3B37oX6dpdEi+/oU+c34xjyUafXLRiPdzyBOo/TJKp7Yttv8XKiEjz06mJi9oDbb9NvNL4ki9BYcVYVJm/IPGRTEY1o0i7t6vuBfru0SqK4/vxH1qlCuGBVbxQG+6wJMP8=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE1P216MB1863.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f7::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.34; Fri, 7 Jun 2024 01:27:53 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 01:27:53 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "nicolas@ndufresne.ca"
	<nicolas@ndufresne.ca>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	Nas Chung <nas.chung@chipsnmedia.com>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>
Subject: RE: [RESEND PATCH v4 0/4] Add features to an existing driver
Thread-Topic: [RESEND PATCH v4 0/4] Add features to an existing driver
Thread-Index: AQHaosxrJnIsmYodQEuWO9RJve6Fu7GfaNLQgBtv5ICAANVHIA==
Date: Fri, 7 Jun 2024 01:27:53 +0000
Message-ID:
 <SE1P216MB1303B0A1747B0E236C3BB8BAEDFB2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240510112252.800-1-jackson.lee@chipsnmedia.com>
 <SE1P216MB13031A560625CE8C7614D5F6EDE92@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <20240606124339.i5l25wwo6fca2ne2@basti-XPS-13-9310>
In-Reply-To: <20240606124339.i5l25wwo6fca2ne2@basti-XPS-13-9310>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SE1P216MB1863:EE_
x-ms-office365-filtering-correlation-id: 6362fc1c-c1f9-4146-a272-08dc86910da0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?V0dTWVFVUTRobDZNQWdWbXozV1djclBzaUdCMzVxUXVEVkQvaEhjTW9Nc1Jv?=
 =?utf-8?B?b21ZU09IT2VEd3VCM2dTdTJFVHpYWTRnNnl4MWlUaC91bzVXL0dUQVRIbEo4?=
 =?utf-8?B?MmlmeThHTHJMYXFWcy82c1lRUmJ6UFptMFlJSVNYMXBzZzl1UlEvVDZWWnlD?=
 =?utf-8?B?QTRvSlVOeGszWkpPV3FraHk0TWNYRStPSXNtWVdaR2ZZTUxKd01UZS91akdM?=
 =?utf-8?B?Tmt5bEk2U09uYlgyNGRaMlkydzVqYzUwZUdrZFBZWUE1cS85dGgwQ0hjRXlC?=
 =?utf-8?B?a2RqTnNtVWlJODJvME9OOFROVCs2dUwySlNlSlpzOFRzQm84R1UrMG4rYTNC?=
 =?utf-8?B?bjdmMUtldkg0QmoyakNMMGRSbWdIWnBzVS90ZEJmNXJlWU91RG5QQmNuS3ZI?=
 =?utf-8?B?Qm52YlhLTTVESUJTdTZkZi9vUkRPdU9GbFdWYnZKUEtoUUFjY0RBTHFpbGtB?=
 =?utf-8?B?M3lJRFRVbDdhdlllWGpuUjlZSWhBNjFZZTNidyttY0JHd0NnL2YvZ09DbGd2?=
 =?utf-8?B?MkVpeFFNNXVMSUs5TFZPcExPTjVTRnlNUkhkOWZXL0EvNkZ6RlVOMmZNbDB5?=
 =?utf-8?B?SWpMWWVPOVhhRDFwQndGZjc1Yk1tWVVHS3JnaWN0UTNVM2JCZHdBZG9CM3Ja?=
 =?utf-8?B?anNoWEZiNG9OMU1Rdm96YVJRRWZ6MjVRTjZQSS8xTEtXRVVlSVlWeGQyUjZr?=
 =?utf-8?B?dWdMT2pLOHNBcitMdGY5UlpvOGdpcWFtU2hMbE9lOTF1c3lQTEZ5dGJieE9U?=
 =?utf-8?B?K2tPVlJvOEFMZTV4WkRDa0tXQWhWdHZ2aDlZUEpobTFub1VKblZIL2RMVndw?=
 =?utf-8?B?QzBLaHJ1THVoWTRoRDdZTGE5TVhhYVpKNVo1TVd4Wi9Oa05RMDcrc3EzNXlN?=
 =?utf-8?B?RGNTUW5jZlozL3FjeFR4emY2cDh0NDJmQXIvUGZZbHBYSE02SDE5d1pyWkpI?=
 =?utf-8?B?VkI1QmFybU5nNk51eDhvM29KYUJSR1c2V0RyTEhEMEhqUVlHSmp1UUZvSHRa?=
 =?utf-8?B?RXlhbzJ5V3c1ZXdNNDZEZTJTVEhqMGY0ai9oZ2NJSVdnQmUxbDREUDRWVm56?=
 =?utf-8?B?TkFLRVBKWktRRjZYUkNDMnB5V0h2ODUzczJkZUplQnlCRmtvYlFpOFNJUjlq?=
 =?utf-8?B?M3JJRndSRUtGbGh0clBYUlQ2UVdzTE1XOTI2RWluZzYrOEQycjZ1ZkkzMVhS?=
 =?utf-8?B?aDBNWFpKSDV5M09UOGxQZlozTzRwT1Ixdm5weS9ra3EzalZyWW1QTnRZZ2lO?=
 =?utf-8?B?NHJhbGYzVGNUeFhrbmxMd0ZXZ2JhaDhuams4cnROWUxHa3M3OExJR1MwVzRY?=
 =?utf-8?B?RENhNXVMV3BCcnhNVXlzUEQ2Y05wSGFrS3Jxd25lc0I1L0Fodk13UExGYnMv?=
 =?utf-8?B?ZGY3d2tZZ2g0ZFlEbUpyMG1kTXltUXorVWZkQnBBU3paK0N4UjZnTnJ3eWxt?=
 =?utf-8?B?OHh6eVNhRWJuNFhjY0VxV2dwSk1VNHYwUE5NeStpRXJmSGsxQ25BWFNCVWRZ?=
 =?utf-8?B?aUlMckRNUkgvUU1kc2M5aHI1YWRCRTQ5UHNNVGJ4c1ZXb1lITkJiSzVnS1Jk?=
 =?utf-8?B?OEhHVXpOMmNaQW1zRVZuV2FFMjIvOEh3MUZLS2Frc09lQ0FHQjdwQlV1MzNk?=
 =?utf-8?B?bFE4VmgvWC9hWnhvWTVsVFV3a2wvYnhPdU41S1BOeHdFMDBxcDF2enRjU0RJ?=
 =?utf-8?B?eDRPaCtwd0dpYTdGeXplL2lNR2N3cW92VWpPVndwN1FteXNqSUE4Qi9Nc21q?=
 =?utf-8?Q?HRhZ1xTDCMWrIF6RsKPCWmOrrF1+ojOlYnkMZ9h?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXBmalBZeVJHa214WGIyeUZxZDMrT1VVNnpSQUltU0V0WWpJczIvMktsN0lm?=
 =?utf-8?B?SU9CUEFrbUdxWlZvRzh3eVRwT3RSUzJLczkzOFQzdnRPV1pYa3F0cm03OGY4?=
 =?utf-8?B?NXFVR1lGcWlPODlJekZFcTBNSEJUSWZJTjlGdHltNzhTMTVUenJXYVluMnIw?=
 =?utf-8?B?QkVaZXNpZFpTTENOTFRsOTlvRnc3RHJmTkZ5dWFmbU1sY2lncjQ0TmliM1lN?=
 =?utf-8?B?S0NCTzFVMUxQWlNqc1JjNG9sZ0tIVFNLT3ZaNGVQWGVPQTVFTkMrdzYrZ285?=
 =?utf-8?B?ell6anBhLy9pNDYxeThXdGpUeisxNmRzVkNFUEVsTWJxMUVqeHdhT1VzRm5t?=
 =?utf-8?B?VnVvTXd6RVNUR3NqRXZ4T2lmOVJiYWtvNjgxU1VtR3NtcCsrZ0N3OXhreVRG?=
 =?utf-8?B?Tlcrb2RYQ2N3dm5TMHBDQUIvcHQ3dnc5UVRXenNNSVlGVU5UOUFFTjJ5eFZ4?=
 =?utf-8?B?eUxXd0pWeDRtb0wveDdwMDNiMEN2TWFHRlFnWCtDSzlCVks3cjE5L1phZ3V3?=
 =?utf-8?B?aW5QWVpFMG5pMHlpTm8rUlMra0xKODVJN0ltdDNQcTltSy9FbS9aOGtCWHFh?=
 =?utf-8?B?dHU0aGFhdHM1SGFkczFDdGQ4Vmc2N25XemRKVTlRQUN2SXB5a2syL0RQT0VR?=
 =?utf-8?B?Yms4M0pYTzZaQ0lXNEl6UTNxdlRSeDQ3L1QzYTNLZUFPb0ZIV21EZnVLYkhE?=
 =?utf-8?B?aVRkVDU2ZEZZMkxsbUhQd2lHWXNQWktSZytwek1VQmE4MkZFeW5ERndmMDY5?=
 =?utf-8?B?dGdoRFNoRDkvZVU1cXVNWFRLMmVXVWRGVjVibjl2VlhpVE9FdjEyWnB5bFRl?=
 =?utf-8?B?dE40SlFISzhXMGdJbjVmWjRzc2tzdXgxbldqS0x5bGN6ZkpOUEl6T2Fxa3Ry?=
 =?utf-8?B?K0szM2lUZUJuZG9mRHNQeElXbFF0RmlmTThjRnl0YU83QlR2Q1k4c1dCMUVH?=
 =?utf-8?B?SDRjTEVHMUVLMURzdVFiQ041TEI4Q2hTd0pNT3krMll6R3N5N0JxMU9MSGRp?=
 =?utf-8?B?WFlRaGFoMFpMSy9aUU1ad2NqY2pyZnFOQVVJYTRreG9NNDNBbWFnaHVtY3RJ?=
 =?utf-8?B?T3VHVnJkRkNzR0VPTlhMTDRGUXBTVWJLc1FkaytqcEYvVkdPNTRpSVJnazhv?=
 =?utf-8?B?OG5GNktjNkFOU1I4YjZzYUNlS1BJM21YajhzNXB2NElyV3FvaTc4SUdyYnhZ?=
 =?utf-8?B?NU9Ib2ZaWkpHeFZDWUlNaWxDU3Via29ySnZSdThBQ3FwRS9TcDl2Y09EL25H?=
 =?utf-8?B?RzdrMHkzWlRmVm44Z0NUOEl4Z2tkeFFxcS9ReEJNOElGREZPSDB6TFZVUmtk?=
 =?utf-8?B?RC84cGwzYUpIVzlHSjVnRDJrSmEzdHhOV0V2SzRXc3oyeUNkS3ZJQUR0SkZW?=
 =?utf-8?B?U2hKTENFdFZ3MXJITkFhTHd4VnljL3JtWUVuK2QwKzJ5V0hKQ1FOVGRldVZZ?=
 =?utf-8?B?ck1hZlRxQWtuZUVWQnM0MDZXc3MyMXFzRGtIL1AvSnRUTis5SE4zdDFXTlg4?=
 =?utf-8?B?MDRWTHAxOThWQ29ONEdZNlVtU04rU1EzVzZvYTBHZEh3MjZzVnd6T1lIbGZ0?=
 =?utf-8?B?OW9JZkxpaWg4RUcyY1dzOXc1b3JOQjVjeithTWptT0lWN1NzRWF6WEVtU0g2?=
 =?utf-8?B?K01PMGFiUjZDSURRenBPbjFJV3VRd3Y1aUhJM2oxbVNSVENQbTBjVDY0REFR?=
 =?utf-8?B?dDk3QkRmUVhBakluMmNyaFFmRDU2UmtGL1VSeXdiTFJnOGNMd2E0WnBVeDBX?=
 =?utf-8?B?Qm5WS0tHS0tIT2lMMnl4TFZQZitwWTEydE1MZmd1WGhBWEFxM1NBZXpkODdm?=
 =?utf-8?B?S21qbC85eTZNbEFYZENCSjV1MkRxVmhIS1R6U3VYemRkN3ZFWW80bFVzSkt5?=
 =?utf-8?B?MzZQQ2ZLb1ZuZTRNaG5IZnJJMndFZTJyalFLQVRmcENsTmxndGRpTUpxeEd0?=
 =?utf-8?B?RW5laXA4bnZaOGhVbXBucTdqVnRpOEFNdC91UFRlbXJYM29NbEd2cllVRWs5?=
 =?utf-8?B?UXZmY1ZxdlNpTEg3dmwzR0lvV08wWG15M1FPVmVNOTNQd0tmLzNxc3huRDE4?=
 =?utf-8?B?UGlDZEQ1bGhOU3RsNmtTQjFibk1aMmt6TGxweXRtS0x5ZUZ0UngyUE5tYkRE?=
 =?utf-8?B?Kzg3WW1WeCtrWmRPWUg0cTIxQnJVN1p1TXN6UTVaWmp2WjlIVDRBbEd6K1N3?=
 =?utf-8?B?Wnc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6362fc1c-c1f9-4146-a272-08dc86910da0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 01:27:53.6579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WbRc0Ec5QoZ8+pZ4HrSWlFEvHh+rO1T0g3l/X5OmPn9eTdBr2hmwm0MRw9+3TFc2ts4Lgh+LNSxp254Fe0bbj7d6rJD0xWo+AcLpgalzehQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1863

SGkgU2ViYXN0aWFuDQoNClRoYW5rcyBmb3IgdGhlIHVwZGF0ZS4NCldlIHdpbGwgY2hlY2sgdGhl
bS4NCg0KVGhhbmtzDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBz
ZWJhc3RpYW4uZnJpY2tlQGNvbGxhYm9yYS5jb20gPHNlYmFzdGlhbi5mcmlja2VAY29sbGFib3Jh
LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEp1bmUgNiwgMjAyNCA5OjQ0IFBNDQo+IFRvOiBqYWNr
c29uLmxlZSA8amFja3Nvbi5sZWVAY2hpcHNubWVkaWEuY29tPg0KPiBDYzogbWNoZWhhYkBrZXJu
ZWwub3JnOyBuaWNvbGFzQG5kdWZyZXNuZS5jYTsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3Jn
Ow0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBodmVya3VpbEB4czRhbGwubmw7IE5h
cyBDaHVuZw0KPiA8bmFzLmNodW5nQGNoaXBzbm1lZGlhLmNvbT47IGxhZmxleS5raW0gPGxhZmxl
eS5raW1AY2hpcHNubWVkaWEuY29tPjsgYi0NCj4gYnJuaWNoQHRpLmNvbQ0KPiBTdWJqZWN0OiBS
ZTogW1JFU0VORCBQQVRDSCB2NCAwLzRdIEFkZCBmZWF0dXJlcyB0byBhbiBleGlzdGluZyBkcml2
ZXINCj4gDQo+IEhleSBKYWNrc29uLA0KPiANCj4gT24gMjAuMDUuMjAyNCAwMTo0NSwgamFja3Nv
bi5sZWUgd3JvdGU6DQo+ID5IaSBzZWJhc3RpYW4gYW5kIE5pY29sYXMNCj4gPg0KPiA+SSBzZW50
IHRoZSB2NCBwYXRjaC4gQ2FuIHlvdSBwbGVhc2UgcmV2aWV3IHRoZW0gPw0KPiANCj4gc28gb3Zl
cmFsbCB0aGlzIGxvb2tzIGdvb2Qgbm93LCBidXQgdGhlcmUgYXJlIHN0aWxsIGEgZmV3IHdhcm5p
bmdzOg0KPiBodHRwczovL2xpbnV4LW1lZGlhLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy8tL3VzZXJz
L3NlYmFzdGlhbmZyaWNrZS8tDQo+IC9qb2JzLzU5NTU5OTYzL2FydGlmYWN0cy9yZXBvcnQuaHRt
DQo+IA0KPiBDb3VsZCB5b3UgcGxlYXNlIGxvb2sgaW50byB0aG9zZT8gKFBsZWFzZSB0ZWxsIG1l
IGlmIHlvdSBjYW4ndCBhY2Nlc3MgdGhlDQo+IGxpbmspDQo+IA0KPiA+DQo+ID5odHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDI0MDUxMDExMjI1Mi44MDAtMS1qYWNrc29uLmxl
ZUBjaA0KPiA+aXBzbm1lZGlhLmNvbS8NCj4gPg0KPiA+DQo+ID50aGFua3MNCj4gPkphY2tzb24N
Cj4gDQo+IFJlZ2FyZHMsDQo+IFNlYmFzdGlhbg0KPiANCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBqYWNrc29uLmxlZSA8amFja3Nvbi5sZWVAY2hpcHNu
bWVkaWEuY29tPg0KPiA+PiBTZW50OiBGcmlkYXksIE1heSAxMCwgMjAyNCA4OjIzIFBNDQo+ID4+
IFRvOiBtY2hlaGFiQGtlcm5lbC5vcmc7IG5pY29sYXNAbmR1ZnJlc25lLmNhOw0KPiA+PiBzZWJh
c3RpYW4uZnJpY2tlQGNvbGxhYm9yYS5jb20NCj4gPj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gPj4gaHZlcmt1aWxAeHM0
YWxsLm5sOyBOYXMgQ2h1bmcgPG5hcy5jaHVuZ0BjaGlwc25tZWRpYS5jb20+OyBsYWZsZXkua2lt
DQo+ID4+IDxsYWZsZXkua2ltQGNoaXBzbm1lZGlhLmNvbT47IGItYnJuaWNoQHRpLmNvbTsgamFj
a3Nvbi5sZWUNCj4gPj4gPGphY2tzb24ubGVlQGNoaXBzbm1lZGlhLmNvbT4NCj4gPj4gU3ViamVj
dDogW1JFU0VORCBQQVRDSCB2NCAwLzRdIEFkZCBmZWF0dXJlcyB0byBhbiBleGlzdGluZyBkcml2
ZXINCj4gPj4NCj4gPj4gRnJvbTogIkphY2tzb24ubGVlIiA8amFja3Nvbi5sZWVAY2hpcHNubWVk
aWEuY29tPg0KPiA+Pg0KPiA+PiBUaGUgd2F2ZTUgY29kZWMgZHJpdmVyIGlzIGEgc3RhdGVmdWwg
ZW5jb2Rlci9kZWNvZGVyLg0KPiA+PiBUaGUgZm9sbG93aW5nIHBhdGNoZXMgaXMgZm9yIHN1cHBv
cnRpbmcgeXV2NDIyIGlucHV5IGZvcm1hdCwNCj4gPj4gc3VwcG9ydGluZyBydW50aW1lIHN1c3Bl
bmQvcmVzdW1lIGZlYXR1cmUgYW5kIGV4dHJhIHRoaW5ncy4NCj4gPj4NCj4gPj4gdjRsMi1jb21w
bGlhbmNlIHJlc3VsdHM6DQo+ID4+ID09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+Pg0KPiA+
PiB2NGwyLWNvbXBsaWFuY2UgMS4yNC4xLCA2NCBiaXRzLCA2NC1iaXQgdGltZV90DQo+ID4+DQo+
ID4+IEJ1ZmZlciBpb2N0bHM6DQo+ID4+ICAgICAgICAgICAgIHdhcm46IHY0bDItdGVzdC1idWZm
ZXJzLmNwcCg2OTMpOiBWSURJT0NfQ1JFQVRFX0JVRlMgbm90DQo+IHN1cHBvcnRlZA0KPiA+PiAg
ICAgICAgICAgICB3YXJuOiB2NGwyLXRlc3QtYnVmZmVycy5jcHAoNjkzKTogVklESU9DX0NSRUFU
RV9CVUZTIG5vdA0KPiBzdXBwb3J0ZWQNCj4gPj4gICAgIHRlc3QgVklESU9DX1JFUUJVRlMvQ1JF
QVRFX0JVRlMvUVVFUllCVUY6IE9LDQo+ID4+ICAgICB0ZXN0IFZJRElPQ19FWFBCVUY6IE9LDQo+
ID4+ICAgICB0ZXN0IFJlcXVlc3RzOiBPSyAoTm90IFN1cHBvcnRlZCkNCj4gPj4NCj4gPj4gVG90
YWwgZm9yIHdhdmU1LWRlYyBkZXZpY2UgL2Rldi92aWRlbzA6IDQ1LCBTdWNjZWVkZWQ6IDQ1LCBG
YWlsZWQ6IDAsDQo+ID4+IFdhcm5pbmdzOiAyIFRvdGFsIGZvciB3YXZlNS1lbmMgZGV2aWNlIC9k
ZXYvdmlkZW8xOiA0NSwgU3VjY2VlZGVkOiA0NSwNCj4gRmFpbGVkOg0KPiA+PiAwLCBXYXJuaW5n
czogMA0KPiA+Pg0KPiA+PiBGbHVzdGVyIHRlc3QgcmVzdWx0czoNCj4gPj4gPT09PT09PT09PT09
PT09PT09PT09DQo+ID4+DQo+ID4+IFJ1bm5pbmcgdGVzdCBzdWl0ZSBKQ1QtVkMtSEVWQ19WMSB3
aXRoIGRlY29kZXINCj4gPj4gR1N0cmVhbWVyLUguMjY1LVY0TDItR3N0MS4wIFVzaW5nIDEgcGFy
YWxsZWwgam9iKHMpDQo+ID4+IFJhbiAxMzIvMTQ3IHRlc3RzIHN1Y2Nlc3NmdWxseSAgICAgICAg
ICAgICAgIGluIDk3LjQyMSBzZWNzDQo+ID4+DQo+ID4+ICgxIHRlc3QgZmFpbHMgYmVjYXVzZSBv
ZiBub3Qgc3VwcG9ydGluZyB0byBwYXJzZSBtdWx0aSBmcmFtZXMsIDEgdGVzdA0KPiA+PiBmYWls
cyBiZWNhdXNlIG9mIGEgbWlzc2luZyBmcmFtZSBhbmQgc2xpZ2h0IGNvcnJ1cHRpb24sDQo+ID4+
ICAyIHRlc3RzIGZhaWwgYmVjYXVzZSBvZiBzaXplcyB3aGljaCBhcmUgaW5jb21wYXRpYmxlIHdp
dGggdGhlIElQLCAxMQ0KPiA+PiB0ZXN0cyBmYWlsIGJlY2F1c2Ugb2YgdW5zdXBwb3J0ZWQgMTAg
Yml0IGZvcm1hdCkNCj4gPj4NCj4gPj4gUnVubmluZyB0ZXN0IHN1aXRlIEpWVC1BVkNfVjEgd2l0
aCBkZWNvZGVyDQo+ID4+IEdTdHJlYW1lci1ILjI2NC1WNEwyLUdzdDEuMCBVc2luZw0KPiA+PiAx
IHBhcmFsbGVsIGpvYihzKQ0KPiA+PiBSYW4gNzcvMTM1IHRlc3RzIHN1Y2Nlc3NmdWxseSAgICAg
ICAgICAgICAgIGluIDM3LjIzMyBzZWNzDQo+ID4+DQo+ID4+ICg1OCBmYWlsIGJlY2F1c2UgdGhl
IGhhcmR3YXJlIGlzIHVuYWJsZSB0byBkZWNvZGUgIE1CQUZGIC8gRk1PIC8NCj4gPj4gRmllbGQg
LyBFeHRlbmRlZCBwcm9maWxlIHN0cmVhbXMuKQ0KPiA+Pg0KPiA+PiBDaGFuZ2Ugc2luY2UgdjM6
DQo+ID4+ID09PT09PT09PT09PT09PT09DQo+ID4+DQo+ID4+ICogRm9yIFtQQVRDSCB2NCAxLzRd
IG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IFN1cHBvcnQgU1BTL1BQUw0KPiA+PiBnZW5lcmF0
aW9uIGZvciBlYWNoIElEUg0KPiA+PiAgLSBhZGQgUmV2aWV3ZWQtQnkgdGFnDQo+ID4+DQo+ID4+
ICogRm9yIFtQQVRDSCB2NCAyLzRdIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IFN1cHBvcnQg
cnVudGltZQ0KPiA+PiBzdXNwZW5kL3Jlc3VtZQ0KPiA+PiAgLSBhZGQgUmV2aWV3ZWQtQnkgdGFn
DQo+ID4+DQo+ID4+ICogRm9yIFtQQVRDSCB2NCAzLzRdIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2
ZTU6IFVzZSBoZWxwZXJzIHRvDQo+ID4+IGNhbGN1bGF0ZSBieXRlc3BlcmxpbmUgYW5kIHNpemVp
bWFnZS4NCj4gPj4gIC0gbW9kaWZ5IHRoZSBjb21taXQgbWVzc2FnZQ0KPiA+PiAgLSBkZWZpbmUg
dGhyZWUgZnJhbWVzaXplIHN0cnVjdHVyZXMgZm9yIGRlY29kZXINCj4gPj4NCj4gPj4gKiBGb3Ig
W1BBVENIIHY0IDQvNF0gbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogU3VwcG9ydCBZVVY0MjIg
cmF3DQo+ID4+IHBpeGVsLSBmb3JtYXRzIG9uIHRoZSBlbmNvZGVyDQo+ID4+ICAtIG1vZGlmeSB0
aGUgY29tbWl0IG1lc3NhZ2UNCj4gPj4gIC0gdXNlIHRoZSB2NGwyX2Zvcm1hdF9pbmZvIHRvIGNh
bGN1bGF0ZSBsdW1hLCBjaHJvbWEgc2l6ZQ0KPiA+Pg0KPiA+PiBDaGFuZ2Ugc2luY2UgdjI6DQo+
ID4+ID09PT09PT09PT09PT09PT09DQo+ID4+DQo+ID4+ICogRm9yIFtQQVRDSCB2MyAwLzRdIG1l
ZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IFN1cHBvcnQgU1BTL1BQUw0KPiA+PiBnZW5lcmF0aW9u
IGZvciBlYWNoIElEUg0KPiA+PiAgLSBhZGQgdGhlIHN1Z2dlc3RlZCBfU0hJRlQgc3VmZml4DQo+
ID4+DQo+ID4+ICogRm9yIFtQQVRDSCB2MyAxLzRdIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6
IFN1cHBvcnQgcnVudGltZQ0KPiA+PiBzdXNwZW5kL3Jlc3VtZQ0KPiA+PiAgLSBjaGFuZ2UgYSBj
b21taXQgbWVzc2FnZQ0KPiA+Pg0KPiA+PiAqIEZvciBbUEFUQ0ggdjMgMi80XSBtZWRpYTogY2hp
cHMtbWVkaWE6IHdhdmU1OiBVc2UgaGVscGVycyB0bw0KPiA+PiBjYWxjdWxhdGUgYnl0ZXNwZXJs
aW5lIGFuZCBzaXplaW1hZ2UNCj4gPj4gIC0gYWRkIHBpeF9mbXRfdHlwZSBwYXJhbWV0ZXIgaW50
byB3YXZlNV91cGRhdGVfcGl4X2ZtdCBmdW5jdGlvbg0KPiA+PiAgLSBhZGQgbWluL21heCB3aWR0
aC9oZWlnaHQgdmFsdWVzIGludG8gZGVjX2ZtdF9saXN0DQo+ID4+DQo+ID4+IENoYW5nZSBzaW5j
ZSB2MToNCj4gPj4gPT09PT09PT09PT09PT09PT0NCj4gPj4NCj4gPj4gKiBGb3IgW1BBVENIIHYy
IDAvNF0gbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogU3VwcG9ydCBTUFMvUFBTDQo+ID4+IGdl
bmVyYXRpb24gZm9yIGVhY2ggSURSDQo+ID4+ICAtIGRlZmluZSBhIG1hY3JvIGZvciByZWdpc3Rl
ciBhZGRyZXNzZXMNCj4gPj4NCj4gPj4gKiBGb3IgW1BBVENIIHYyIDEvNF0gbWVkaWE6IGNoaXBz
LW1lZGlhOiB3YXZlNTogU3VwcG9ydCBydW50aW1lDQo+ID4+IHN1c3BlbmQvcmVzdW1lDQo+ID4+
ICAtIGFkZCBhdXRvIHN1c3BlbmQvcmVzdW1lDQo+ID4+DQo+ID4+ICogRm9yIFtQQVRDSCB2MiAy
LzRdIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IFVzZSBoZWxwZXJzIHRvDQo+ID4+IGNhbGN1
bGF0ZSBieXRlc3BlcmxpbmUgYW5kIHNpemVpbWFnZQ0KPiA+PiAgLSB1c2UgaGVscGVyIGZ1bmN0
aW9ucyB0byBjYWxjdWxhdGUgYnl0ZXNwZXJsaW5lIGFuZCBzaXplaW1hZ2UNCj4gPj4NCj4gPj4g
KiBGb3IgW1BBVENIIHYyIDMvNF0gbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogU3VwcG9ydCBZ
VVY0MjIgcmF3DQo+ID4+IHBpeGVsLSBmb3JtYXRzIG9uIHRoZSBlbmNvZGVyDQo+ID4+ICAtIHJl
bW92ZSB1bm5lY2Vzc2FyeSBjb2Rlcw0KPiA+Pg0KPiA+PiBDaGFuZ2Ugc2luY2UgdjA6DQo+ID4+
ID09PT09PT09PT09PT09PT09DQo+ID4+IFRoZSBERUZBVUxUX1NSQ19TSVpFIG1hY3JvIHdhcyBk
ZWZpbmVkIHVzaW5nIG11bHRpcGxlIGxpbmVzLCBUbyBtYWtlDQo+ID4+IGEgc2ltcGxlIGRlZmlu
ZSwgdGFiIGFuZCBtdWx0aXBsZSBsaW5lcyBoYXMgYmVlbiByZW1vdmVkLCBUaGUgbWFjcm8NCj4g
Pj4gaXMgZGVmaW5lZCB1c2luZyBvbmUgbGluZS4NCj4gPj4NCj4gPj4gSmFja3Nvbi5sZWUgKDQp
Og0KPiA+PiAgIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IFN1cHBvcnQgU1BTL1BQUyBnZW5l
cmF0aW9uIGZvciBlYWNoIElEUg0KPiA+PiAgIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IFN1
cHBvcnQgcnVudGltZSBzdXNwZW5kL3Jlc3VtZQ0KPiA+PiAgIG1lZGlhOiBjaGlwcy1tZWRpYTog
d2F2ZTU6IFVzZSBoZWxwZXJzIHRvIGNhbGN1bGF0ZSBieXRlc3BlcmxpbmUgYW5kDQo+ID4+ICAg
ICBzaXplaW1hZ2UuDQo+ID4+ICAgbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogU3VwcG9ydCBZ
VVY0MjIgcmF3IHBpeGVsLWZvcm1hdHMgb24gdGhlDQo+ID4+ICAgICBlbmNvZGVyLg0KPiA+Pg0K
PiA+PiAgLi4uL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LWhlbHBlci5jIHwgIDI0
ICsrDQo+ID4+ICAuLi4vcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtaGVscGVyLmgg
fCAgIDUgKw0KPiA+PiAgLi4uL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LWh3LmMg
ICAgIHwgIDIzICstDQo+ID4+ICAuLi4vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1LWRlYy5j
ICAgICAgICAgfCAzMTIgKysrKysrKy0tLS0tLS0tLS0tDQo+ID4+ICAuLi4vY2hpcHMtbWVkaWEv
d2F2ZTUvd2F2ZTUtdnB1LWVuYy5jICAgICAgICAgfCAzMDAgKysrKysrKysrLS0tLS0tLS0NCj4g
Pj4gIC4uLi9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHUuYyAgICB8ICA0MyAr
KysNCj4gPj4gIC4uLi9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHUuaCAgICB8
ICAgNSArLQ0KPiA+PiAgLi4uL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZwdWFw
aS5jIHwgIDE0ICstDQo+ID4+ICAuLi4vcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUt
dnB1YXBpLmggfCAgIDEgKw0KPiA+PiAgLi4uL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZwdWNv
bmZpZy5oICAgICAgIHwgIDI3ICstDQo+ID4+ICAuLi4vbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVk
aWEvd2F2ZTUvd2F2ZTUuaCAgfCAgIDMgKw0KPiA+PiAgMTEgZmlsZXMgY2hhbmdlZCwgNDE0IGlu
c2VydGlvbnMoKyksIDM0MyBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gLS0NCj4gPj4gMi40My4w
DQo+ID4NCg==

