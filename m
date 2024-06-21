Return-Path: <linux-media+bounces-13934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E81939125EF
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 14:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69E461F22BF0
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 12:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08168154C01;
	Fri, 21 Jun 2024 12:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="IV0HDiAr"
X-Original-To: linux-media@vger.kernel.org
Received: from KOR01-PU4-obe.outbound.protection.outlook.com (mail-eopbgr860107.outbound.protection.outlook.com [40.107.86.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6577B15444C;
	Fri, 21 Jun 2024 12:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.86.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718973950; cv=fail; b=ZaVsOuL7g7xJtEV/nPJIAc40c/6M3PPYlUvDqyNqGWDpBB3qp/6TrHvFfHS/EiMMjgrAYN9IJMyHcWt/xSqBKaUTlerGahUY5cEhnB8YD3B0XiMZOAOeoxD/Ejj+g2aM5Lw9Ahac5zmqReQkAOciOfntwTT/OYbgZpU/vcQ4b0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718973950; c=relaxed/simple;
	bh=w7MFkTvGtQl6Hk1JCZ6IjZiQ1HdSixgigvIMzGRTCgQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XRO5396Do/Kmz5o7v4oaAgZugLal3cgkVeLXUZOak3XbRmYn8CUv2qFhQNVtJxh6t68MjTLrXBUKtuFhJ4jUONd+z7tzYewrLqHMMlSgaTAMwzJk3wfb+EEom8PiJw/cnFclx6q7FL9Nef2Ev3GwSTT3vaPyheH0rViwy2aokJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=IV0HDiAr; arc=fail smtp.client-ip=40.107.86.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnVxiT84DBx+QCgujqE+uMyxBlCV350A0D3PMWJVg0SRsIvUbIdU2PmROlf+eMm/S1s9i9OhPJwMI7meqv8r2/O0WaaYVLg3Gk88cGqtlRNntZJW6lWzZUNor80QGsSwOApEZxq+fmbACg72c64JMfDBSSEr+3VbRFq91Y3g7Migu8qmi49BesGSntxVsE+bN8o2utZyn8gxlg8ja1a071HO3FOb3+RghVuja2flC+iTrs+qLatQAdNQez/zIPi6NJccivon3kW6xF6bo38ftUWl7NA5ZJlMD7uteDEqLIplzTTP6DyE0Jt0hUDOwZCoJe8MexJu4YxD1GqE9l9Qbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7MFkTvGtQl6Hk1JCZ6IjZiQ1HdSixgigvIMzGRTCgQ=;
 b=Kt/XvMTt59YHvZzkhsLOB94VhTYbgpcu6pKzKSOh4BB+780BC6HETN84RiHSFXiU7ENzopUusy2bnwjDyfs1WCPxlLIrwrpbuia99sprLa/fPAjx6yKfdz+vLrIo0+BsurZnPLx+GWHof1v035ts/VYgIZ2yOE6m6kHvq1OE3ln80js7SAkgdrLv6d1WeG9HSyMaqFYUJspmanMAReq30BqVY36XhRr4N06xCQxctZlR8ieeY+LrI77ppso5bvLLfRKdeiOI+RR35qIGsjb1T5x/t+xnEd5D/KQlVPkvqBt9xkUv4cePLzfMkJHaUfxFaXscf9HqdkD78PXltU327w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7MFkTvGtQl6Hk1JCZ6IjZiQ1HdSixgigvIMzGRTCgQ=;
 b=IV0HDiArsCTQ9RqleIwNq0vwT53bfllPsnLV/xC/vBwF4D4U/K1sf+FYQvy2WeD9TvkRzNf3iPYvItSkY6/swbV/xhTGH8m4OSjMkxbwhYW0C51wmqQX4F9AMTmLWFGL2TUyPxivq2Y9Xx/3obm/Rikg5QYaoL3xgv4ocJPs6S8=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB3019.KORP216.PROD.OUTLOOK.COM (2603:1096:101:284::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.19; Fri, 21 Jun 2024 12:45:44 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 12:45:44 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Devarsh Thakkar <devarsht@ti.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>,
	"b-brnich@ti.com" <b-brnich@ti.com>, "Luthra, Jai" <j-luthra@ti.com>, Vibhore
	<vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>, Aradhya <a-bhatia1@ti.com>,
	"Raghavendra, Vignesh" <vigneshr@ti.com>
Subject: RE: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Thread-Topic: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Thread-Index:
 AQHawKPhLOcR91s1hkK9DSaFUGSwxrHPD/CAgAC0SbCAAATQUIAAoAiAgABLagCAAAQsAIAANdIAgAB0nSCAAL9rgIAADNDg
Date: Fri, 21 Jun 2024 12:45:44 +0000
Message-ID:
 <SE1P216MB13034CDE58672FEE1358AF2FEDC92@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <SE1P216MB130382374B76CD8BC9FFCFE5EDC82@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <881dcea1-a592-4506-083a-9d5f3c6a8781@ti.com>
 <b2f7552d37075538e22640f7b42838d29d3f8b3e.camel@collabora.com>
 <e901967f-59df-f4b0-de51-61e542c04161@ti.com>
 <07d56a690d5fed16082e73c5565b67777e31494a.camel@collabora.com>
 <SE1P216MB13033A129DF3DF878ECD4F85EDC92@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <98e52732-36fa-3e76-cd2c-fde9181bdeb7@ti.com>
In-Reply-To: <98e52732-36fa-3e76-cd2c-fde9181bdeb7@ti.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SL2P216MB3019:EE_
x-ms-office365-filtering-correlation-id: 8f09ecac-02fd-4379-0136-08dc91f0110e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|366013|376011|7416011|1800799021|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?c1d1WXBtUWlHbWswcWhhdXhIMEZraTZqM0VINEMvOWtiWndmVHRuQ0d2YmhH?=
 =?utf-8?B?OW9jVDZNSW12ZkxIRkQweU1hU2ZWQ3JxeU9XajBybllYakJZSkt2QWhKWHlG?=
 =?utf-8?B?SmkrU09YSTJsaDI2UFd0SW1LMTVmQ0pVaHJ6aWVqMHgwNjI1dHl4azV0UWxV?=
 =?utf-8?B?ZS84L1p6bE9nbHBTeVVyTUlUYmhZaGxycFFQZy8zWm5VaDJXaXpNd3ltbkFY?=
 =?utf-8?B?L0hYUFJlRm1CZnJDQ2pRWit6TDhoaVBLVjh3QjM5anJ3UHhBSlB4OTkrR3Nx?=
 =?utf-8?B?cW1hcjNweHBHbytYRktmRmRWVHhSSlZLU1p4M2VFZlY1WklNNFZFZjZCWUlv?=
 =?utf-8?B?WGhHQ2d1NFFxSFFodlcrTlZJMEJ4TUg2Sm1xd1JQSnBXK09IQlpmSzRLK0R1?=
 =?utf-8?B?QmRZU1c1YnZwZ0dQL0p5N1QxZXVxM3kvZldXZUhtL0orZ2FEUGp5L29UVnFs?=
 =?utf-8?B?TG14TVoyY0JWRUNBS2didThseCtaR3hiN3EvclI2QzNIQ3piWWZrM3JYV3ZT?=
 =?utf-8?B?bkNWMTM2VnlFRU1EOTlLeFBLNDZ3ZVFGRzYyaS9WMU1xWndpelBJb3pWaFND?=
 =?utf-8?B?MDhZQTIzTzhVMjBOWUxWR0tGSVMzR01HRCtxdktwazlhb0dDa05lcG9LZEpx?=
 =?utf-8?B?djVESm9TclpwSkwvVUdvV3BqOTBCVVBEOFl2dFVhWUJ5WHpkQUFKemVzaFFG?=
 =?utf-8?B?UWN1bWxWdDhWcyt4VEJhRDRyL1N1bWNYU2ZMNk12Q21sRXZtelY2M2FrbHZy?=
 =?utf-8?B?Q2M0K1lRYVVTRm0yQXZHUXpiWGdMUm4xK3FMakNhRzVyNFRKK2g0MGpLaWRD?=
 =?utf-8?B?N3I5Qit2MUlyZ2llR3lCa3JOMExpT28rT045Q1MrY3FVSzFyaHhzR1NGdnYr?=
 =?utf-8?B?TGx0YnpGSWVsNnNpckYrY0x5NlRPTjc0K2FBWmJ6encvQWJ5N1dtMWFiVVNu?=
 =?utf-8?B?bEJSNlFCdXo2NUdDdWtiR1RqYVN3VFN5U2JrcEdrZHdtMHlkaEIrYUhtTGE0?=
 =?utf-8?B?QndveEpJa1hsM0ticG8zYkRISERzeUtObzg4Y0Ztekl6UlRpZ1JkbkI3SENW?=
 =?utf-8?B?cTVmMlJFcU9GcXY0b0VzdGdoOWN2QmE0cTVvSnZ2MjVoWXdHRFgvaVh3WG5x?=
 =?utf-8?B?MVFibWVlM3ZJQVVVaExpQkNLTno4ZGM3UjlNY09vRURJTHdhL0dUa29wM2lD?=
 =?utf-8?B?c0ROZFpmTnFNbHg3REJacWJJaGxmeXF3SEdobWlMTndPRXJGd3J3TTYrUHpZ?=
 =?utf-8?B?Ti9QT0V3WGREREJ1MG4xUGpZb2txNTNVMkJqeUFZSWdiU29Fd2d4MmJLNWdk?=
 =?utf-8?B?c0k5RGgrMmtwQjlPVklhNE92S3BTbERPRndRUEhpU2lVTXR2cCt0akpYNXY0?=
 =?utf-8?B?TFJrdENPN1lmaW1RT2lQS283RzcySXR0L2thcnQrSTZRTUhYQ2RCVm9WOFc2?=
 =?utf-8?B?UGxoc3I4ODI2NnJSWitQUE9lYWhEQkRWWWs0d0R0d3diUUt4ZGdhc3JoRjNV?=
 =?utf-8?B?MmxteC9kZWd2dnpBcDB2eHlNakVGL011Z1ZRZG9ZVXE2TkxCNlQwR1dpZnc2?=
 =?utf-8?B?VkpDTlZ3M3AvUlBReVAyL2svdnVpWkl5cncyRHkrSjZ1ZmxuUmhFYkxJK1hl?=
 =?utf-8?B?OGh6eGVwTjk4cE42bjhEc0FTMHlnN0lITXpETjE0Z2RqK2s1TS9HdUlva3Rx?=
 =?utf-8?B?VXBiYkdFbUlTWkdmdWtpci95Y3NCNXR0dGlxTXhIMTByK2FlZEZLWWJlbHlQ?=
 =?utf-8?B?OFNLekh2bWpOb1ZUUzJ0OUJNbCtpalBLQXl3SjVFUldnSE9ZUzMralhaNitr?=
 =?utf-8?Q?at1NKsFITWBMu3RLgak7Tl1RNTXOmk4aYnwc4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(7416011)(1800799021)(38070700015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L2Y2TmhibFlYMVhEYVBkMkdneDVBdnFZNDh5b0JmVTVxR0FzNkFzamZ5ejNI?=
 =?utf-8?B?Zkk3ZU9KQ2hFYW0yWmhEYVVrd1FoWUZ4T3B0VE9KalZZYmh5TjdXd2VXRzNH?=
 =?utf-8?B?L1JQTWtHNElKeUMwYlFwS0FVMy9TaWZ5Y0s2NHd4RHBONXZ0SysySVMwakRw?=
 =?utf-8?B?ZHZSS2grQVV1cGtYTEJPazZsZEN2SDVINTZXUW1iYmRqQU42NjNIeHpqVVc1?=
 =?utf-8?B?UnJFd2UvMGp0cWZLZUNwRTlab1gzdHhGbTJkSndrMzl6WE8zaEpTaE9LckVC?=
 =?utf-8?B?MWcrVGNpMldGd050bEhiWGV3d0JQQ3k3OXJHUlE0WmkxMEJmNWNOc1NnQzd0?=
 =?utf-8?B?UXIzbGl5bFh1NmpLOVljdkRPWUw0KzBzVUlRQjdBY0dSU0VLK2VFenJ1OWJx?=
 =?utf-8?B?S0w3clpUak5QNG5vTWtWQ3gxZkVsRE5qbTBqY1NFT25HMHFqYXhvVi8vY2xM?=
 =?utf-8?B?eUk3RjFsc3RPbDZ5dHNvR3FuaE00Q1F2TlBPN3VjQjJ5cEx6Uk83Q3NKNkcy?=
 =?utf-8?B?TktUU21zNkhsM1YrZndVYjMwUG9hMWhHT24weVU1a3AwdmtocU1uejJ3QlNi?=
 =?utf-8?B?dGg4YzZ1NDRBMlpTaTZGNS9RMTFYVCt3bDRDQTFQMDVacXh6YVBTRkE2ZE1X?=
 =?utf-8?B?TUVNUnJTWWFidEQ3N1F4KytaT0YyVmNTRG9SelFyaGl4TUVoZStZYTVNNjFv?=
 =?utf-8?B?NVpJYzBHamR4SWhIdlkwNkI2a0VvOXdLNVlHSWZhUTlHaUthdDJpcjF6Yk1E?=
 =?utf-8?B?ayt1K3dnOXFrWmJwMUJ3QnJkOFBGZlZDTUs1bUF1QnVicnVNcTlJbGF6cmlW?=
 =?utf-8?B?VjBYMTFXRVk4OXlmTUFHZm5jUFdzcXhtbnBKZkFZYnJzdjVpR25VZlZkcnZB?=
 =?utf-8?B?dGlIUDBuTXVGamppSzRlUWFVS3dVOXZ6V0JZU24wZnJNRnVRbmZoWTdkQnFo?=
 =?utf-8?B?Y1Q1VXNuZmRpOU0wSzYxN3hhNUdHdUpsOHdHNG1mMWZtVUp6RDRUV0RESnBj?=
 =?utf-8?B?M0JGWkwwdnFRdTBVejFIWWhET3Y5VHJLRzNsZ0J0dkI5bTEzS2dkQkJCOGxG?=
 =?utf-8?B?UldydDNpUkpGTTB5eWRBMmhieVRmMXlMME5oMGgvSmFGTFFhNXNrVkJZaVF2?=
 =?utf-8?B?ZHhHdy9mcFRxaFhyWndFZHg5eWYvZmlTOGUvYnlEQnE5eFpCN0JQRERGbmdX?=
 =?utf-8?B?OHdYM1BxT09YRnF3MitwOWFBOTF6cVBKeHNYVHk3MkErOGlZMUovOFBKWWlU?=
 =?utf-8?B?SEZpM0p4cFlHR3ByWmFtWHZyVmJyRkpscnFaRHNIdVJEeWZUN1lUMGRtNGE0?=
 =?utf-8?B?aFFJd2F1ZVNzdEZXNGg5dWlmYy9ub0tLYkZsZ2IzbWFxVm42akUwd2tVdzUy?=
 =?utf-8?B?Z0JXdnlRazFXamlUSUJQT3JWWGNQcURyS3Fua1psQjNkVFY0cWpybFNJek5O?=
 =?utf-8?B?WmEvQkM2RENVRjFqdXZML1MyN2RNYm5oYzZ3U2xoU0ZHcXZLZTVTUHhFN0dp?=
 =?utf-8?B?T29hdDRzYmVFM1A1ald3bHlkaGZXSDBSRFVoRU8zc0wxakZKdENxdkc4SnVv?=
 =?utf-8?B?RGdCOUc3MnhEYzFzbUN4bnVSTWpxQlNOZ2NLNzV4bWZqeDNma0taMmNhOEl1?=
 =?utf-8?B?M2lRWEVqS0xCdDhURk5TRVBrZGVjMllDYWhSUFIwSVhsWXMwRVNzMTNkOEIz?=
 =?utf-8?B?MEc4MjNtRnBuT3dXVGFoQjcvZFRIazJoQ1VxMDg1cVFpZFNFNFZnd2xwbWFs?=
 =?utf-8?B?enFlVU8vRG00WHIwcG14SnlUdjQzUlpmQ0tOSGl6OW1vZjRUd25oQjlZU2I1?=
 =?utf-8?B?cG1FTE00b2NpeTBVUXhQSC9aMlNEZ2ZtNDhnTkVjT1ZHOG1YaGlKaHIvcTZj?=
 =?utf-8?B?MnQzbkpiak9lR25QZDA3SVQxRnFHZVEyY1NsV3g1Z0xDSHBVS09OcVh4V2Zi?=
 =?utf-8?B?eDEvc0psVjdOemRpenlBWEhNVmd4UFR6Z1hoVUY4cGhQaVpjS1V4TjIrOWx3?=
 =?utf-8?B?QnRiOTIyU29NRFl0N3FiVm83OUhGNGNuclU2REg2dU9sNFFJekRlVTNIWHRF?=
 =?utf-8?B?ZDJwNE9zNy9jNm1OWm1CVGVtaEdRREgwSFVLbHlQS1JhK3ZVbE9rd01vUVFM?=
 =?utf-8?B?K1lQVTJoREM1bzZ5NDNPU3pPdTNzNGFaT1pSRmE3KytUazBSbVdhazl2dnZj?=
 =?utf-8?B?RVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f09ecac-02fd-4379-0136-08dc91f0110e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 12:45:44.3621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: av46GrvZvXzFYrHakpCbCnp849dTP8H//75e4+gIlC7zk+ufpLroKjajyRgcHHXnvjj3Be+smj7UnE8ttRf73W/UE421I03ji5nZeGZizwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB3019

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGV2YXJzaCBUaGFra2Fy
IDxkZXZhcnNodEB0aS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgSnVuZSAyMSwgMjAyNCA4OjU1IFBN
DQo+IFRvOiBqYWNrc29uLmxlZSA8amFja3Nvbi5sZWVAY2hpcHNubWVkaWEuY29tPjsgTmljb2xh
cyBEdWZyZXNuZQ0KPiA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPjsgbWNoZWhhYkBr
ZXJuZWwub3JnOw0KPiBzZWJhc3RpYW4uZnJpY2tlQGNvbGxhYm9yYS5jb20NCj4gQ2M6IGxpbnV4
LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4g
aHZlcmt1aWxAeHM0YWxsLm5sOyBOYXMgQ2h1bmcgPG5hcy5jaHVuZ0BjaGlwc25tZWRpYS5jb20+
OyBsYWZsZXkua2ltDQo+IDxsYWZsZXkua2ltQGNoaXBzbm1lZGlhLmNvbT47IGItYnJuaWNoQHRp
LmNvbTsgTHV0aHJhLCBKYWkgPGotbHV0aHJhQHRpLmNvbT47DQo+IFZpYmhvcmUgPHZpYmhvcmVA
dGkuY29tPjsgRGhydXZhIEdvbGUgPGQtZ29sZUB0aS5jb20+OyBBcmFkaHlhIDxhLQ0KPiBiaGF0
aWExQHRpLmNvbT47IFJhZ2hhdmVuZHJhLCBWaWduZXNoIDx2aWduZXNockB0aS5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUkVTRU5EIFBBVENIIHY2IDIvNF0gbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZl
NTogU3VwcG9ydCBydW50aW1lDQo+IHN1c3BlbmQvcmVzdW1lDQo+IA0KPiBIaSBKYWNrc29uLA0K
PiANCj4gT24gMjEvMDYvMjQgMDY6MDAsIGphY2tzb24ubGVlIHdyb3RlOg0KPiA+IEhpIE5pY29s
YXMgLyBEZXZhcnNoDQo+ID4NCj4gPg0KPiA+IFRoZXJlIGFyZSBsb3RzIG9mIG1haWwgdGhyZWFk
IGluIHRoZSBsb29wLCBJIGhhdmUgY29uZnVzaW9uLg0KPiA+IEknZCBsaWtlIHRvIG1ha2UgY2hl
Y2stdXAgbGlzdCBmb3IgdGhlICJTdXBwb3J0IHJ1bnRpbWUgc3VzcGVuZC9yZXN1bWUiDQo+IHBh
dGNoLg0KPiA+DQo+ID4gMS4gUHJvZmlsaW5nIHJlc3VtZSBsYXRlbmN5DQo+ID4gMi4gYWZ0ZXIg
dGhhdCwgYWRqdXN0aW5nIHRoZSB0aW1lLg0KPiA+DQo+IA0KPiBCZXlvbmQgYWJvdmUgdHdvIHBv
aW50cywNCj4gDQoNCkhpIEJyYW5kb24NCg0KQWNjb3JkaW5nIHRvIHRvZGF5IG1lZXRpbmcsIHNo
b3VsZCB3ZSB0YWtlIGNhcmUgb2YgdGhpcyA/DQoNCj4gMy4gSSB0aGluayB0aGlzIHBhdGNoc2V0
IGFsc28gYnJlYWtzIGhydGltZXIgcG9sbGluZyBhbmQgc28gdGhlIFZQVSBvcGVyYXRpb24NCj4g
b24gQU02MkEgd2hpY2ggY29tcGxldGVseSByZWxpZXMgb24gcG9sbGluZywgeW91IGNhbiB0ZXN0
IHdpdGggcmVtb3ZpbmcgdGhlDQo+IGludGVycnVwdCBwcm9wZXJ0eSBmcm9tIHlvdXIgZHRzIGZp
bGUgYmVmb3JlL2FmdGVyIHRoaXMgcGF0Y2gtc2V0LiBXaXRoIHRoZQ0KPiBwb2xsaW5nIGl0IG5l
ZWRzIHRvIGJlIHRha2VuIGNhcmUgdGhhdCBwb2xsaW5nIGlzIHN0YXJ0ZWQgb25seSBhZnRlciBk
ZXZpY2UNCj4gaXMgb24gcG93ZXItb24gc3RhdGUgYW5kIGlzIHN0b3BwZWQgYmVmb3JlIGRldmlj
ZSBnZXRzIHN1c3BlbmRlZC4NCj4gDQoNCkhpIERldmFyc2gNCg0KSSBoYXZlIGFscmVhZHkgc2Vu
dCBzb21lIGNoYW5nZXMgdG8gZml4IHRoaXMgaW4gdGhlIHByZXZpb3VzIGUtbWFpbC4gUGxlYXNl
IHJlZmVyIHRvIHRoZSBlLW1haWwuDQoNCj4gNC4gVGhlcmUgaXMgc29tZSBkaXNjdXNzaW9uIGdv
aW5nIG9uIGJldHdlZW4gbWUgYW5kIE5pY2hvbGFzIG9uIHdoZXRoZXINCj4gZGVsYXllZCBzdXNw
ZW5kIGlzIHJlYWxseSByZXF1aXJlZCBhZnRlciBsYXN0IGluc3RhbmNlIGNsb3NlIG9yIG5vdC4g
TXkNCj4gdGhvdWdodCB3YXMgdGhhdCB3ZSBzaG91bGQgc3VzcGVuZCBpbW1lZGlhdGVseSBhZnRl
ciBsYXN0IGluc3RhbmNlIGNsb3NlLCBidXQNCj4gTmljb2xhcyBtZW50aW9uZWQgc29tZSBjb25j
ZXJucyB3LnIudCB1c2UtY2FzZXMgc3VjaCBhcyBnYXBsZXNzIHBsYXliYWNrIHNvIEkNCj4gYW0g
Zm9sbG93aW5nIHVwIHdpdGggaGltLg0KPiANCj4gUmVnYXJkcw0KPiBEZXZhcnNoDQo=

