Return-Path: <linux-media+bounces-11600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3128E8C864E
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 14:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F88B1F22EFF
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 12:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E799B47F41;
	Fri, 17 May 2024 12:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="hHNxq0jc"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11020002.outbound.protection.outlook.com [52.101.154.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733211EA6E;
	Fri, 17 May 2024 12:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715949186; cv=fail; b=KjwlQoW0YDqe2vGc5g85hbkspRmdwqH491Y9ZFEWHE/aM12PKnGDh49Wp1C8HFfj4nOfMDEghox5ey6noOI0TY6yEI+0mXrXvpi0KeGlnyOJWiU7FUnK1a5JMlr1YG27tribIlDvRDXqQPCzRXoz97D/9hlRuyFTOXyTVcV6Bro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715949186; c=relaxed/simple;
	bh=QJnLxtEJpDY+VK4xTFI9dpwNkWyHHz4friYomV1/yJg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BTNWgtztz2NyPbv1YLYXSxQQ7K9VEePPEI7Hwweptq32iqsXAWI84WaeJ4nMyQDJs/Rda2XmtDvOTO4ZA+F0biBGynOiP87UeUT4NmkT4HdWHU5/qiui6YH8adGjrNvgw2onyWhv/jqVisYIg0ZCicWzoInpzpvRjq4Ll9SwCsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=hHNxq0jc; arc=fail smtp.client-ip=52.101.154.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mi7Obt4c9c5449CA0Jtztd8pv3cvEt2fDenIoxNxPfhvwow1zkE9IvkSQN2F1N2Mx0penygm5EeyteYB00m/r0aW63ED0kZbUFQKSGrcpkTphNjszGlQ4uBqz21XPKZJwqliBhMuYLtQ9JJIpxPXkH5Ap/er4xUZyg9+MIJC6aktPSFWTnEfNH2DbFDlHLXjI1q5PVIQD8GXO27r81Sud7gFDXAcu17WIXYw4Mqc0IJIxy4yUoVBdQJGLNrSH9SCuYYvwhxo6TN8ZbXHrGnaSg5X98TKCkaTeHA+6hpCiDXuQz911dxx8tI0nZVXDA7fQkKYwu7XOJLfgIFuqmUt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJnLxtEJpDY+VK4xTFI9dpwNkWyHHz4friYomV1/yJg=;
 b=H7eBJA1sJxIITdfTjKDQWxtYYB7vLuTcwmmyPDs0ajjf42QFL4+JVylVfcs0ajisBRf8XKjePueSziGSUJXvsACTdZsNhri3SAAHKxEaCe12ltZ4hSGqHM2Up3w2PspzT/SmLnp4AvAsdKNmRsH/vupUcH2GO3nWmgDwIeugFa906FARzKcHwvV8keeoicFgNg1P8BJOeuxIby5rabVSTepaFUYKZoBuBybCN9Si0OXdWF3FmGYizUSQfQr99Xb7ZonNFFIKihHuJ5ucgj7DSXIKYcbqgMWuyVAibtHROY2mwlbvHfAdreQk9aTZ0XpZTjIoaoY4VW8sdrYguPehZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJnLxtEJpDY+VK4xTFI9dpwNkWyHHz4friYomV1/yJg=;
 b=hHNxq0jcgXWDaMFh1tbMFLeId52ian+qWDR6680pv/FzCNIQzG+3bLsYsIZNO9tH2QDYsdWqQ9z2jWOJEoAvDQYbsFVSEFV45ALWv+HynPqsjWLHVZykxsptK0ej6d59ZDIEmBEgV9D2HM8y7Ug74okbHXIdxs9+sZ1IOXFWttg=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1353.KORP216.PROD.OUTLOOK.COM (2603:1096:301:ab::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.30; Fri, 17 May 2024 12:33:00 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::8bac:533d:dbe5:ba28]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::8bac:533d:dbe5:ba28%7]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 12:33:00 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE condition
Thread-Topic: [PATCH] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE condition
Thread-Index: AQHaqD+OBWQuNlhl8EqlSzXRSkJlr7GbNF2AgAAdGIA=
Date: Fri, 17 May 2024 12:33:00 +0000
Message-ID:
 <SL2P216MB12466F44DD7777E65B4F7CD3FBEE2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20240517094940.1169-1-nas.chung@chipsnmedia.com>
 <20240517101023.5hy7kp4j2dmitpav@basti-XPS-13-9310>
In-Reply-To: <20240517101023.5hy7kp4j2dmitpav@basti-XPS-13-9310>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|PU4P216MB1353:EE_
x-ms-office365-filtering-correlation-id: e4ad0a69-88ee-420f-286c-08dc766d7d40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?YThlY3BpS2x2R0lVOHZ4S1lKL1F6ZGhPZmFmYjlOUDZuNWxwT3JtNm1zYlZR?=
 =?utf-8?B?NkY4TGxGdGxvdGN0am9SdGRHcmwzcGMxV0I0eVkyQWFLVnNPazB6UHMwUVhF?=
 =?utf-8?B?enZIc1QzeWZGRy81TDZXYVNQeGtqQTNyaHZKTmJYN2t6VklsSWhvaEMrdmt1?=
 =?utf-8?B?RFR6Si9FOHc4SE5TS1NmclIzcStMTXEwRStPS2l4WndOKzlXNWpvbTBIZUM1?=
 =?utf-8?B?QTFqR2p1ejZRY2JDVDlQRVFIemhwRk1BY0xTczNoTXAxY3EwaFBoeklSd2g4?=
 =?utf-8?B?ejVLbEl1SU1oSmpxd2hSZ1JWNjRvYk5aSmxtN2xCdUw2SkdIc2V6SlF2ZGNF?=
 =?utf-8?B?cGl5SUVSUkpuUENHdlZkSmZ3QTlnSzd2eDNqOUxmT2lnMUJBSjgzVFhudy9W?=
 =?utf-8?B?RGtZd1Q3QXcvMHh5OXg0MDNCdkhNT0kzeXVlZ000aElLK0dOQ1ZBQUttNkRF?=
 =?utf-8?B?ZUJwNGJabk55WG4zZFBRYnFuTE5aeGh3RHZ1Z2M1d1Q2Mnh1U21pa0F3c2k5?=
 =?utf-8?B?cE9ic1Y5S0NTR3JhdVQ0SUY2V01MQUhEK0RkbHRyalFIbTFFR3JuOHFoYnlm?=
 =?utf-8?B?eEVVckRSUG1MUGNjWGtIUjEwS3hiRmVlR0NFSSt5NTBLMnRuMEFmU1RrNUNw?=
 =?utf-8?B?emNTdEV5VlF5T2tXUDFoVU9pTWVUbmEvbFV0MVBDWUlWU2NBZ081dG9YUTFV?=
 =?utf-8?B?MHpYaUk1eDBsTDFzWEVDdytFUU1weDMzTzdZeCt2ZWl5M2VaTUk1alJwL0Ft?=
 =?utf-8?B?NjVDVG44dG5Pc09hcFhRMDlEYVp4V0FseUs0WFpYQnQ0QXBhVnR0dG1SMGZ6?=
 =?utf-8?B?anQ3YzNoQXdtRGcyZCtGZmlXS1huOCt0S293ZGZxdmJmejdmbEVJT090KzN5?=
 =?utf-8?B?a1RyU3Zoc1QzZDRmZnBicmhWQ2hCYVVpVWV4anNEV1R3TXc5ZGt0YXA2YWtE?=
 =?utf-8?B?VWpQYk9idStBU01lVkRwejhZVG5yQy91cnBBak91aUUzVXlqMm1iUGphRndl?=
 =?utf-8?B?TEY1dE5kcjY1ZFBQVS9IekVhdDI1WlJLS2UvTDNMQkhMQjZMZ2NzeitLVkdF?=
 =?utf-8?B?Vko1QmdKNlRlMm43aHhJLzhEWTNhYkU3MXFoUi9ydlZwbjRvQ1pzejg3dCtC?=
 =?utf-8?B?blBYWWVZSXgvS3NCV2pKNi92VzY5TUtpN2ZrVW5DMjNOckp4TTkyekhBLzVS?=
 =?utf-8?B?cnVRZG5FeFpvMDZpbHFTVzI0aXA4cEFMRTJ5L2hlbGUxMzlwVWdKdzJuQ3Zm?=
 =?utf-8?B?dTIzYmMxbnk0RzNxQ2J0d09OM2RIc3Z0bHZ6bVRINzg5dUVRMFZOUXFkVzI3?=
 =?utf-8?B?U21Lb25Lc2FaMlIzdE5VbGg4cGxvbzduTzJxNjk4VDNSYmo0ZWtTN3N1SFBU?=
 =?utf-8?B?OW5Ldyt0UnZ4eVRJeEtjcFIremVod0lWRGpxV3NnZFBEYTRETmp5UXI0SVRL?=
 =?utf-8?B?Uk5kSjJJZ1BwdmNieE4wRkFNNlZzZE5qUnEvanRCSGVnVWc2NFdnamgrOWM5?=
 =?utf-8?B?dHdZN1U3SGpxNnRCNDFkMGFOczBGUDh0OXpPeWVqU25JMTdCVDQ0MG1zYjBx?=
 =?utf-8?B?WS9RZFdPQWNOZmR2OHJKWGxnLzdYMEhsNGZoaHAxREZBRDQ2NVJrZ2c2ZzFO?=
 =?utf-8?B?clNkYnh0VmtoWTRKQXpPbkF5L1QwR2FiUzEyWW1rdENzenZlcFU2VG1TR1Fy?=
 =?utf-8?B?Unh1Vmo2ZFlmbk9GMldwckRlbUdERGU5VG5sc2NYV3YyL05xR1J3ZWIvbHlW?=
 =?utf-8?B?cVZ6ZVh6MHhFV01iRnNqTit5Z1VEeDBBaTFMMEprVDZ4Z0paN1Z0Wk5wT1Bz?=
 =?utf-8?B?aCswK0Z0NmlneHJjeXFVZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a0hzU1hyMjdKMmFNQXJKdWpYbGQzOWhpTG9YVDVybkJLNWtyV0NmcTBmcThr?=
 =?utf-8?B?WE5tMGg3VG0zdlo1MkdYWnkrMllDNjVwNmZ3ekEzb1ErczdTZWZYRTRxSG8x?=
 =?utf-8?B?Tk5pdDVBL3dZSWFyZnNUT3lHMEozVjU4UUhoNTBYWnFvRjNLV0pGVy94bUhx?=
 =?utf-8?B?VW9ROWQwTDZBUlU5Smg5KzlhOU13bmpLUzBJWEF2aUpUUStwTDdFNnd3b1hG?=
 =?utf-8?B?MkxNamZHN0FtRHBrazlzVlJoNm42S1lqK3ZLdTQvNXlVVWwwK3l2T2NxNXJs?=
 =?utf-8?B?MDZJVkhPRXRvMFZHdFZJRTRrZ0lyRVMrRWF0NmpoOXFKa0svbW5vbG5YdkxC?=
 =?utf-8?B?ZDVOTGNxanVNQytTRk1HeWE0VW5XWHpjdFlpYnhwZ1ZTL1F0S3h3aUFvTStq?=
 =?utf-8?B?ZnBweTNqekg5N2IrVzZUNm9rVkQ2OWtRRUV6QXpkWmt4dUJhNldqVDFUbTNu?=
 =?utf-8?B?cUMyZC9BOWtlbUhHbWZuMm4zMWJYK2xIWTZwS1IrRUdUY1pqbzVjTCtza01X?=
 =?utf-8?B?aWp1M3IvYVc2d0E0eGVURENQWWxvNVljeG4yNXBKcHplUnRDcnlNMzUxVDJn?=
 =?utf-8?B?SG0rNFVSNS9VcUl5VXN3ajhsb09QOU1TQ2h3VzJzT2lNYXl0Um9VKzZOYzVK?=
 =?utf-8?B?N2g5ZWpiT3Z6R2hQeXRnZTVJOVpKSXRZVnVRdXp1NEwzQlMzODE2d2wxeCtC?=
 =?utf-8?B?cWRZMjkwSXI0cnU5MTJnR3luZDNYZ3RIL3dDNGhJWFMwUWNIdFVmaWtPLy8v?=
 =?utf-8?B?dk5HQnBISzgwODdOTEFIQXdNamFpT0lIN2NGYzNxMkZuSE1MNGxrRlNON1FQ?=
 =?utf-8?B?bUlYZ3l5VFRuR2YvSlE5UlVzRTdienEvaXhrVDlVZVNWcWUvWStlbEYwK3Vn?=
 =?utf-8?B?Q2UrVXkxUmFlMG9xaGU2UUR5RnlIcmJ0S1BXKzUrekhwL2xrZ0ErU0tBZ2VH?=
 =?utf-8?B?VGQ2OUJTZTR2M3ZlalBwZmVDckFJU3ZCTkR1bXlRa1JMVkNaMUR4aHpCZzgy?=
 =?utf-8?B?NERNbXFqY2VWOE1wK1VtZUMrOHFNZWpHS25xM0R6a1cySHVqSjQ0TTh2VDhR?=
 =?utf-8?B?eHE5K1NrcjUyQUVidkFiSElJalBXNi9IcHk4ODlMS1c3Sm5jTUFhY2xYTXUv?=
 =?utf-8?B?RG41c2d6T3JTclBzWW1EeDJkQ1liNEV0bmlOUmlyWE5sbHU2Y3V5d2Rhcjkw?=
 =?utf-8?B?M0xqYWVzZzBrM2t0djdueFZuYmVETGJRaHBiR1FYbDM5S21yN09ZSVI0QmMv?=
 =?utf-8?B?ZHgxUjFPcUgyZk5RMnJoYzBKaXhoeGhjaHcwQnJ2UWUzaFFyalRyRWg1TDI3?=
 =?utf-8?B?YTlOZDVXZHhKeWZ6K0dnNVYvYll4SG1aeXM3TXVMWlA3UXg1YklnKzMxQ202?=
 =?utf-8?B?MHYwMXlXaUp0bG96dFBHbUFEZStocVFqSGw2d09sZ2wvMW9BWXZDbUY1ZFVV?=
 =?utf-8?B?djlkeDlyQWNlR1dvRVNHSytaS0pJRTRpS0h0dGhGVHR5aFIrSHZpTWMzRFow?=
 =?utf-8?B?TUNNZ3g1c2ZSOUJyTXE0UVROU1ZmRFFCR2phRTF5Q0lTUm1Kdk9xc1dBZXd5?=
 =?utf-8?B?ODVieDhhOE0vcjZFK3RQRTNhaHVVck9PSzNkNkRCTFRlQnZnYTFHMTlpSEYy?=
 =?utf-8?B?OUhCeCtYUU5XYldMOGdWZktXY0N1YmtlR3JwQ3liNDdsSGFVNGZmaEhKTWox?=
 =?utf-8?B?WnVtR1hmL3duZklWQURNMkRsWEljSlNPQUhCcE5PaEJ3V25QMzRHZGFRdHBp?=
 =?utf-8?B?UWIzYmVwWVc0NUd1M1BoRWlWQzRwUnJ4UmxmNCtWRFoxRXUxYzA4UlRjQ0E3?=
 =?utf-8?B?N3FLN1c2bXpQVVpvVHNxUnJIVTNTampJMjVwMEdrakE1a2NVYUNnbTBWRVkv?=
 =?utf-8?B?UDh5dXJ2ckFDV3pDM0cxMERNMmxvTjcyNzFGaUN5U2RBYllsRG15cmFrTzBS?=
 =?utf-8?B?V09kTE8wYTdMTmdJSHJYamZEQ3FQNVBqekYvdWVnWSt5ZjhYdkVYQXZmY0NM?=
 =?utf-8?B?YmVFYkxGUGE5SG5SZ2p4M2N0L1hFaTNDU1Z6cjBiQ1NXanljYXU4RFpySDMy?=
 =?utf-8?B?L3RRSWFGMmhvc3kyMUZSK3RZVTF5VW56c1pER2hSYWVsRWphbVBSZEl6N3pH?=
 =?utf-8?Q?g+AA5ZKVciohdpa0xU7Nc++4U?=
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
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ad0a69-88ee-420f-286c-08dc766d7d40
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 12:33:00.4324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IQQtliPEVGHDl8QumnAILvVEiW83Klj+usw0KmWzXKgQTUdKRztVukZnprQ/RfzQOX+bZ8JT9j4jH0bzm759Z5WYY4adoyyO2Pq4F3howWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1353

SGksIFNlYmFzdGlhbi4NCg0KVGhhbmtzIGZvciB0aGUgcHJvbXB0IHJlcGx5Lg0KDQo+LS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBTZWJhc3RpYW4gRnJpY2tlIDxzZWJhc3RpYW4u
ZnJpY2tlQGNvbGxhYm9yYS5jb20+DQo+U2VudDogRnJpZGF5LCBNYXkgMTcsIDIwMjQgNzoxMCBQ
TQ0KPlRvOiBOYXMgQ2h1bmcgPG5hcy5jaHVuZ0BjaGlwc25tZWRpYS5jb20+DQo+Q2M6IG1jaGVo
YWJAa2VybmVsLm9yZzsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj5rZXJu
ZWxAdmdlci5rZXJuZWwub3JnDQo+U3ViamVjdDogUmU6IFtQQVRDSF0gbWVkaWE6IHVhcGk6IHY0
bDogQ2hhbmdlIFY0TDJfVFlQRV9JU19DQVBUVVJFDQo+Y29uZGl0aW9uDQo+DQo+SGV5IE5hcywN
Cj4NCj50aGFua3MgZm9yIHRoZSBwYXRjaCwgSSB0aGluayBtYWtpbmcgdGhlIG1hY3JvIG1vcmUg
ZXhwbGljaXQgaXMNCj5nZW5lcmFsbHkgYSBnb29kIGlkZWEsIGJ1dCBpbiB0aGlzIGNhc2UgYWxs
ICFPVVRQVVQgYXJlIGFjdHVhbGx5IENBUFRVUkUNCj50eXBlcyAoYmVzaWRlcyB0aGUgb25lIGRl
cHJlY2F0ZWQgdHlwZSkgYW5kIHdoZW4gSSBsb29rIGF0IHRoZQ0KPmRlZmluaXRpb25zIG9mIHNv
bWUgb2YgdGhlIHNldCBjb21tYW5kcyBsaWtlIFNfRk1ULCBJIGNhbiBzZWUgdGhhdCB0aGV5DQo+
cmVxdWlyZSBhIHR5cGUgYXMgcGFyYW1ldGVyLg0KPlNvLCBjb3VsZCB5b3UgZXhwbGFpbiBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UsIGhvdyBpdCBjYW4gaGFwcGVuIHRoYXQgdGhlDQo+YnVmX3R5cGUg
aXMgdW5kZWZpbmVkPyBBbmQgaWYgc28gbWF5YmUgdGhhdCBjYXNlIHNob3VsZCBiZSBmaXhlZA0K
Pmluc3RlYWQ/DQoNCnY0bDItY29tcGxpYW5jZSB0ZXN0IEdfU0VMRUNUSU9OIGlvY3RsIHdpdGgg
aW52YWxpZCBidWZmZXIgdHlwZS4NCnRlc3RCYXNpY1NlbGVjdGlvbigpDQp7DQoJLy8gQ2hlY2sg
aGFuZGxpbmcgb2YgaW52YWxpZCB0eXBlLg0KCXNlbC50eXBlID0gMHhmZjsNCglmYWlsX29uX3Rl
c3QoZG9pb2N0bChub2RlLCBWSURJT0NfR19TRUxFQ1RJT04sICZzZWwpICE9IEVJTlZBTCk7DQoJ
Ly8gQ2hlY2sgaGFuZGxpbmcgb2YgaW52YWxpZCB0YXJnZXQuDQp9DQoNCkluIHY0bDIgZHJpdmVy
LCBJJ20gdHJ5aW5nIHRvIHJlcGxhY2UgSUYgY2xhdXNlIGZvciBidWZmZXIgdHlwZSBjaGVja2lu
ZyB0byBoZWxwZXIgbWFjcm8uDQpCdXQsIElmIEkgdXNlIFY0TDJfVFlQRV9JU19DQVBUVVJFIGlu
IGdfc2VsZWN0aW9uKCkgaW9jdGxfb3BzIGZ1bmN0aW9uLA0KSXQgY2Fubm90IHBhc3MgdGhlIGFi
b3ZlIHRlc3QgY2FzZS4NCg0KQW5kLCBCdWZmZXIgdHlwZSBpcyBzZXQgYnkgaG9zdC4gV2UgY2Fu
bm90IGVuc3VyZSBob3N0IGFsd2F5cyBzZXQgdmFsaWQgYnVmZmVyIHR5cGUuDQoNClNvLCBJIHRo
aW5rIHdlIGNhbiBwcmV2ZW50IGFueSBwb3RlbnRpYWwgYnVncy4NCk9yIGNoZWNraW5nIHZhbGlk
IGJ1ZmZlciB0eXBlIGluIHY0bF9nX3NlbGVjdGlvbigpIGlzIGFub3RoZXIgb3B0aW9uLg0KDQo+
SSBoYXZlIGltcHJvdmVkIHlvdXIgY29tbWl0IG1lc3NhZ2UgYmVsb3csIGJ1dCBwbGVhc2UgZXhw
bGFpbiB3aHkgdGhpcw0KPmlzIG5lZWRlZCwgZS5nLiB3aGljaCBjYXNlIGRpZCB5b3UgaGl0IHdo
ZXJlIHlvdSBmb3VuZCBhbiB1bmRlZmluZWQNCj5idWZmZXIuDQo+DQo+T24gMTcuMDUuMjAyNCAx
ODo0OSwgTmFzIENodW5nIHdyb3RlOg0KPj5XZSBleHBlY3QgVjRMMl9UWVBFX0lTX0NBUFRVUkUo
KSBtYWNybyBhbGxvdyBvbmx5IENBUFRVUkUgdHlwZS4NCj4+QnV0LCBJbnZlcnRpbmcgT1VUUFVU
IHR5cGUgY2FuIGFsbG93IHVuZGVmaW5lZCB2NGwyX2J1Zl90eXBlLg0KPj5DaGVjayBDQVBUVVJF
IHR5cGUgZGlyZWN0bHkgaW5zdGVhZCBvZiBpbnZlcnRpbmcgT1VUUFVUIHR5cGUuDQo+DQo+TXkg
c3VnZ2VzdGlvbiBmb3IgdGhpcyBjb21taXQgbWVzc2FnZToNCj4NCj4iIiINCj5FeHBsaWNpdGx5
IGNvbXBhcmUgdGhlIHR5cGUgb2YgdGhlIGJ1ZmZlciB3aXRoIHRoZSBhdmFpbGFibGUgQ0FQVFVS
RQ0KPmJ1ZmZlciB0eXBlcywgdG8gYXZvaWQgbWF0Y2hpbmcgYSBidWZmZXIgdHlwZSBvdXRzaWRl
IG9mIHRoZSB2YWxpZA0KPmJ1ZmZlciB0eXBlIHNldC4NCj4iIiINCg0KTXVjaCBiZXR0ZXIhIFRo
YW5rcy4NCg0KVGhhbmtzLg0KTmFzLg0KDQo+DQo+QmFzaWNhbGx5IGZpeGluZyB0aGUgc2VudGVu
Y2Ugc3RydWN0dXJlIGFuZCBncmFtbWFyIGFuZCBmb2N1c2luZyBtb3JlIG9uDQo+dGhlIHJlYXNv
biBvZiB5b3VyIGFjdGlvbiBpbnN0ZWFkIG9mIGRlc2NyaWJpbmcgd2hhdCB0aGUgY29kZSBkb2Vz
DQo+KHdoaWNoIHNob3VsZCBob3BlZnVsbHkgYmUgb2J2aW91cyBpbiBtb3N0IGNhc2VzKQ0KPg0K
PkkgaG9wZSB0aGF0IGhlbHBzIDopDQo+DQo+UmVnYXJkcywNCj5TZWJhc3RpYW4NCj4NCj4+DQo+
PlNpZ25lZC1vZmYtYnk6IE5hcyBDaHVuZyA8bmFzLmNodW5nQGNoaXBzbm1lZGlhLmNvbT4NCj4+
LS0tDQo+PiBpbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmggfCA4ICsrKysrKystDQo+PiAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj5kaWZm
IC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZpZGVvZGV2Mi5oDQo+Yi9pbmNsdWRlL3VhcGkv
bGludXgvdmlkZW9kZXYyLmgNCj4+aW5kZXggZmU2YjY3ZTgzNzUxLi4zMmIxMGUyYjc2OTUgMTAw
NjQ0DQo+Pi0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaA0KPj4rKysgYi9pbmNs
dWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmgNCj4+QEAgLTE3MSw3ICsxNzEsMTMgQEAgZW51bSB2
NGwyX2J1Zl90eXBlIHsNCj4+IAkgfHwgKHR5cGUpID09IFY0TDJfQlVGX1RZUEVfU0RSX09VVFBV
VAkJCVwNCj4+IAkgfHwgKHR5cGUpID09IFY0TDJfQlVGX1RZUEVfTUVUQV9PVVRQVVQpDQo+Pg0K
Pj4tI2RlZmluZSBWNEwyX1RZUEVfSVNfQ0FQVFVSRSh0eXBlKSAoIVY0TDJfVFlQRV9JU19PVVRQ
VVQodHlwZSkpDQo+PisjZGVmaW5lIFY0TDJfVFlQRV9JU19DQVBUVVJFKHR5cGUpCQkJCVwNCj4+
KwkoKHR5cGUpID09IFY0TDJfQlVGX1RZUEVfVklERU9fQ0FQVFVSRQkJCVwNCj4+KwkgfHwgKHR5
cGUpID09IFY0TDJfQlVGX1RZUEVfVklERU9fQ0FQVFVSRV9NUExBTkUJXA0KPj4rCSB8fCAodHlw
ZSkgPT0gVjRMMl9CVUZfVFlQRV9WQklfQ0FQVFVSRQkJCVwNCj4+KwkgfHwgKHR5cGUpID09IFY0
TDJfQlVGX1RZUEVfU0xJQ0VEX1ZCSV9DQVBUVVJFCQlcDQo+PisJIHx8ICh0eXBlKSA9PSBWNEwy
X0JVRl9UWVBFX1NEUl9DQVBUVVJFCQkJXA0KPj4rCSB8fCAodHlwZSkgPT0gVjRMMl9CVUZfVFlQ
RV9NRVRBX0NBUFRVUkUpDQo+Pg0KPj4gZW51bSB2NGwyX3R1bmVyX3R5cGUgew0KPj4gCVY0TDJf
VFVORVJfUkFESU8JICAgICA9IDEsDQo+Pi0tDQo+PjIuMjUuMQ0KPj4NCj4+DQo=

