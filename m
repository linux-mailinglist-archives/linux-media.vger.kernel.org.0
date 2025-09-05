Return-Path: <linux-media+bounces-41824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 781ACB45436
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 12:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD0FFA433C1
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 10:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C96C2C158A;
	Fri,  5 Sep 2025 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dr3Kstq3"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807402C08D1;
	Fri,  5 Sep 2025 10:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757067196; cv=fail; b=hmkc+fPiEFR6xGpHeV5Lrk+8HA1ecA5xAtfYvtDFlL0L2uk8DhUg6CJ6gFqC6wVJOMyVfS6W0i4NhlidvGiGK25ps+VtHKE/8J67Ryp+49+PiIUZCqlQteaeyTODzL2ZPYpdaM3Aei/K2jKPRU0o5aDlyIVyXOJHNR5WkXIp8Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757067196; c=relaxed/simple;
	bh=Jo+dz8XGjQitTrM3Zwmqk/JkYj1aQM7l2MGT5v3X0E4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aNMZhNPfqPFrXBA/AOi/s/L7pYQvBeUg/qVbdaeiWTO1GngasH//CHWZDEiRxIzhms0EYo6v+gd9nIRWPRyXUw7GG7V377bVVJpFuOSuko10mO11kq1nbcv0XzSqmpukN7HKI1TJmuD/Xakr8hRTBoSFxN4QCyuCtF8Ko6c9KTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dr3Kstq3; arc=fail smtp.client-ip=52.101.66.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StFrScNET/HDRq+5bw/TBvOODdd2YYECn0Me8szfqO6Qb3JB4d9AN6xhN6mVK/tOJLMuxUC/5oQjHwCi/PiCRWYAxdGUv28arnyn3NCwF/mkMXPWUHT4mKV7bLmRVxuQs+dxXhLjK3NZue9gbV5TlUTjMCzNxF9RrIOa1DOAhZBga+9N5HSkl02LNo9spe49Rw+nSqVznZbMd+PPmtHEPMyjTXsh4OOfdbHBYscCcnuiOOGTi4Srkk6j1iiJyizGCg1Hh8rfzT3/hUuv93wAheLvcQwEKlv6wlRI04M+cxHoXJHEEN1uNlzmyZRRMiZfmbi9N65JT6ybCRxheFYUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oh1UbORXdxkrJnAUL9gnYXvoWExm8I7545lMJKxAXnE=;
 b=IFkqbp8Pz9ylUFze9Lkfhbysl6JBiM5/ybgPRmEAhE4iYQLOz6qW78YoxYpOETr5001nP4ib59cR8JPaJAEnXq94PaO2EiE9dAgTDeS7UtlJux6RtBg7PI1zpdE+NXM8nxG5nrMhHx8gxgkrH4SAGHVIgO58pT2kFHjd/3Ui4aXdoAGj9dbTEUWYAhhgadjVapMALc0bexJpgF5HfcJK03c8On7cuxeVYjjNTIWuCnJU/nc/+aFOOXLGhhL4wTUfxWtWA/THUyZgNly2ZO0NOHFGKKNxJdJnecd7hPL4RCFq8SDepYN5hdmLRyY3lURKbP+xZERVxioBdJcovash+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oh1UbORXdxkrJnAUL9gnYXvoWExm8I7545lMJKxAXnE=;
 b=dr3Kstq3LmqK5Ld9W6cxGvzTvj85vUVz47hzSJ2JtOEKvFTldDzh2JOFuv3oVrjK2VscH1E/zmT8cp7MvJ6O9S9n/4PkHSuQ1LHQXCY8wPZrMJwAnU7CALZxZIjkvKRWNBeft9zBvnqI8YTcTWcz/znPjmBRfZcBqntxXUoAn27GXtGrVcVvykCSw5pJCON9SnjJVR12eAaK44itUUImzGNHlnGv0ZcgA42iTfGcomsF8GN7CirerTWdISyChcvm4EveX1iwn46huMOz0YYruJQ/Re2zXfDnrKzstefb/8cF+GcK2RuUyNTpNQAQX30BJCxNC2qoa2MU8SLh5COQgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB9831.eurprd04.prod.outlook.com (2603:10a6:150:11c::8)
 by AS8PR04MB8980.eurprd04.prod.outlook.com (2603:10a6:20b:42f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 10:13:11 +0000
Received: from GVXPR04MB9831.eurprd04.prod.outlook.com
 ([fe80::4634:3d9c:c4a:641a]) by GVXPR04MB9831.eurprd04.prod.outlook.com
 ([fe80::4634:3d9c:c4a:641a%6]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 10:13:10 +0000
Message-ID: <784dcb9e-4e72-44ca-975e-4eb1b0eed5cf@nxp.com>
Date: Fri, 5 Sep 2025 12:14:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] media: Introduce V4L2 extensible parameters
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250820-extensible-parameters-validation-v4-0-30fe5a99cb1f@ideasonboard.com>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <20250820-extensible-parameters-validation-v4-0-30fe5a99cb1f@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0025.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::30) To GVXPR04MB9831.eurprd04.prod.outlook.com
 (2603:10a6:150:11c::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB9831:EE_|AS8PR04MB8980:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f17a434-a803-4ffd-05ab-08ddec64d11f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bU1tSDdobWxSWm5uNzRGcWE5ZDBmZG1FT3dVRmFWRzJZYkZhZkR1QnhxdlFI?=
 =?utf-8?B?TzE4L1hjdzQ2MzJ0UXYzN09jK3UzWHBUSDcyQ1A2M0dKelRvUElIU2w4djJm?=
 =?utf-8?B?dER1WGtxZ3ZieDIxTUtKdlZDTE1SR05Ed3YvK28wK1Urb0J4U0hWQU1CemRv?=
 =?utf-8?B?U3N2SjJRdEFWczkvV1VIcHlkL2JpaXdKdzN5K2pQMFU2eXdIVWI5NnZYdDdi?=
 =?utf-8?B?Wm41cExiNktERUV6OCt5Ym1nL0lSdXMzTElCYStLQ2V5NTZWblMzSHJlQkFL?=
 =?utf-8?B?RDRDaVZnTHE5QjlVR2wzLzZtTFA5RnlEd0dVM0h1YzFQenM2b0I0azhNTXpU?=
 =?utf-8?B?eTB2cjJFY0xIbmtHNENwVGtrRkE3VS9KRmhPYVgwaFQ1YnJTZEZISVZRSkQ4?=
 =?utf-8?B?WWsreDNsUUZ3NWcxclZXU0JOZzRWeDJ1Qi9GaHNWQ3lZVXJhcUdNQ1VDbDV2?=
 =?utf-8?B?UHNrZ3hFTUxPdHBVUmttam5MWlM4d1BvOXczSWg2YWJZVVduREgzOWNVWVQ5?=
 =?utf-8?B?ZjVuZjc1eWR0OWhHRWUwZ2NtRGM0cTNmWUkwUDdNRTQrUW9ZTGVkM0dXV1BB?=
 =?utf-8?B?V2FUNU15SWxsbU5RQmR2VFpJMldtSmE0V2w2TGdqTlVZdmJzbVZwRmdTVGN5?=
 =?utf-8?B?UjBZZ201ZGRHSGY2UnIyQ1ZMTVFlUWRvVVUxWElkd3lQZTA4OWM1MDE4cE1J?=
 =?utf-8?B?cG5ROXg2S0hjTnU1cU9ZR0lMQ2lxamxvYXl3alZWZWpzTmJweE9NdnhEUGpF?=
 =?utf-8?B?bmtZam5zMWFzMzRDOW1TTHlBd2NoREdNTWdibU1NV3pidjhZSm9LcVV0T25a?=
 =?utf-8?B?MGFiTGRiTW5mVUY2dU4vSWRxSFJJN3J1QzdWR2ZKSlJRWGNFdTFFZHcvV0Vl?=
 =?utf-8?B?aHdUYUcyYkVGTm1SZ1o2ajZUSE1qbVVNLzh3MDVQQ1hhUyt1MS91UVZhVzdk?=
 =?utf-8?B?aGVyZlozQXJRR3NyZHk5cVZVSlhqaU1qZjhMcGdSaHVKNkdLajJtcEEycGUz?=
 =?utf-8?B?VmZXaiswOHR0N1hUTHFMemE0NHc0ODBQWTlTVXk3dmNwYTNnK2FxS29XTDJZ?=
 =?utf-8?B?SjFLOHc4amVlRGx5VDg4bU1RVXMrMm1ka1BPYmdIKzZ4dFUrc1ZtTTVoK2pV?=
 =?utf-8?B?bWY3Zi9aMEtKVEhPanluL3hvYVQ3TE5rUmdPaDJDcnRGdDlGU2NNRmpua0JQ?=
 =?utf-8?B?N3JZT1Z3WW1kdDcyNFNXSjIrZUQ1U1hjdTFpN3V3ZGRqTmw4cUR1bTdkRXJB?=
 =?utf-8?B?c29FN3dTYTkyUnR2dEpGWHpZUDdOOWZwY0plWjY1RnZwQS9hdTRKNjVMMVBW?=
 =?utf-8?B?RDRNVzc4c1pGK3NGZkdHNnF4a1MrRDN0amxPUzliblB1WGFNVkFOa0c4dnJr?=
 =?utf-8?B?dUxNWTBUK1dvbVZyUEdmSEo1RXhlbnFXNmtNUjNieXMxUjlWdGxqZ2srOGln?=
 =?utf-8?B?Z0pFRXBQaU1zVjAxWVZxZTU4U1J1VVJJYjh5Zjd5ZTlBTFkzbTJ3MG4ySkRK?=
 =?utf-8?B?blpNUkJkU2p6MXFnN25xaFRySm5jWlpiMW1GRlVPdkJnU3pDOExQbjRpOGc4?=
 =?utf-8?B?bWhiUmtwVVpaVEJyRFZiRmxaNTJPNFVjQUw0bUMrVEJEalFSRDBjajRkakg4?=
 =?utf-8?B?Y0UvdzR0WkhtRXVtT1hRdGFyVEgxcUFwUDh6b0pnc0VrZ1gzUm5BZDlaRkk0?=
 =?utf-8?B?SmRKYkgvQXU0cjdRUjVxNGNuY2NjSTJmV3lQb3NpK1ZqM05CVVpaaU5EaTNw?=
 =?utf-8?B?NXlvbzB5V25iYjFPOFUrSWRxdGhyaGxMaFY3MFpvZXFDK040QjNES24rZklH?=
 =?utf-8?B?N0I1RDNVdVAxM3dHV0Z4OWxsbC9UN202ZDFuaUVGbW5aK3FQNytCLytSayto?=
 =?utf-8?Q?evCL4wBg+SqSR?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB9831.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZmY2M1ZuZGYzL1JRb05KUlIzdnZjS3pzanBUTC9hc1gwU1kxYmhndEFzN0Zv?=
 =?utf-8?B?bFRuK25KRFBMVE9lcitCS0tvVldndnlZZmVWbjlPbVQzMFdqT1Q0eTNQSENa?=
 =?utf-8?B?T2VPelJ3Q1JzNVlGMlpJQkc2UGUzZGt6WnNwQlZRL1dITnZqQTZCZTVCbXlw?=
 =?utf-8?B?aDlDNGo1Y2VBNFE1OGFiVWJ2RkxucXArZWk4YkJWRkNhSC8ySkJRQUlkWGtX?=
 =?utf-8?B?dzJBSDR6WklyclpQbVMxSFlIS0l2eUl2UFpXMzJKckhEOGdjaHdLczFJNER0?=
 =?utf-8?B?TG92UzBueHlaT05LblpXK2xScTF1aVV3Tlh0ZlBKRVE3N0E0OStFZS94TC84?=
 =?utf-8?B?and3M0JvNVRCbUZIcmRhODh1Nml3b0ZIcEVwOEY1Sm5XVTk5TVFkUUR5QXIy?=
 =?utf-8?B?aTI2a3BwNmgxN0dHMkVSbmczNHRFWG5TeVhsMmZPbjdVRllnV1dTY2xCeUQ4?=
 =?utf-8?B?TDdtZGYzS0FCSlgwQnBYRzNWVGp2SjBhZXdiWlJIL1o0VmpRem1iVHFDcGpw?=
 =?utf-8?B?KzFWdDBzUTFIcGJ3Z0xiKzBWTzdhUVdERHJWNVp6NUNDdkZtNG9sYUFabllZ?=
 =?utf-8?B?U1FYaWJINTdmZUYxTFQ0WC9SMjdwemp5YXFWdW9ZeVM2cWpUMDlCQmJkUjE0?=
 =?utf-8?B?V0VPRE9EMlFWMXBBbDZJdkcvNzkrc2MrTTZ0S20wcUp2OXl3Mm1sM1IvN1Qx?=
 =?utf-8?B?VmxhMjdpbGI4S2tXbXF0M3RHbjFsVG5LMWd1MEtBRXBjd2NtbThUa0VwVURv?=
 =?utf-8?B?ZUxwYUx2NUpsK3dOVUVaYnNTbUNRZVJneGdyUXZRc1poWVZ5Z2xXTHpYQXVt?=
 =?utf-8?B?aXNBTi9nNENZbTdOaXV2NTdJSU92RzNuRUlETGtZSXY3ZDV4SXdZQmRJZVdl?=
 =?utf-8?B?azRLUEhCMzgxYlQzbldZcW1veElQNzBjTm1CNkF6aHBkdDVZa2xOTmlIanFp?=
 =?utf-8?B?dHJwZkN1VjVPYndkajQ3cFJPNFlLUE5XRmNXRXZPdkRTNTEvc1hIdE1RWmk3?=
 =?utf-8?B?ZDdBK0tUd3R4Qit0cG1oaEpiNlByZ25hZnRrU3hZQmd2blRsRWNQOHNTWFBQ?=
 =?utf-8?B?QW5WYmNTbkpUcEhIanFIc2N1YTFHWENoKy85YWFMZVBNL1N1WnBhdHpFMlF1?=
 =?utf-8?B?clBPaDE3djFURC82Tjk4MWx3QTk5eTlZaWVmMlF3eWtzQWpkemg2cEJ3MXlU?=
 =?utf-8?B?N1YyL0VxMHBYOTlEVmpnS1hiVTIxZm1LdFl1aTBTZEQvYjRiRldGd09ldkJw?=
 =?utf-8?B?WjVUQzFQY2J0Q0lWWUZ0bDhFbUM3T2RSNUVhZVpHNE5aYU1FejdKL0pnNlh1?=
 =?utf-8?B?SGtMTXUxUVBqRVV4Rk1tWFE4VjIxLytra1J5UlA3aEg0eUhTZmIyMi9aRDZF?=
 =?utf-8?B?Mk1EdUQ2YmNOUlVtMXNPeGJjL3M3QUg0REJDcGZpTlN6N2V1TlNaV29TZUVB?=
 =?utf-8?B?K2ZJc1krQ2kwRzA0clFPMlpRTUs2dC9TOTZwd0VYR3lHaWM0TmtndzBTN21z?=
 =?utf-8?B?ZXNDV3hlOWVKZVVVd0V3bWEwQzEzemNELzBMQmdOUFBGbWdUQk5nOGpEMzJv?=
 =?utf-8?B?NGtkM2tNMEYzRzA0UHFSYTZUVGw4SFpXZ29pSEZIbFJ3SW1nUlNpRE81bWQv?=
 =?utf-8?B?MEVGblpIZFNRVnRnWm5MVzN5UnRTNEQrNFpYYkNiVEtSU3JXTEE1Tk1XRWV3?=
 =?utf-8?B?MHlONmlGdEFES1FsWnlpKzU0OWdJbzQzTDZNNmExZnZMZ1U3S2xlNVZkUFMy?=
 =?utf-8?B?djVacGo2QWNhSitndkdsQlB2R3p6aE9Iby9ONkVMaThsQlBoTUJ3RFBWbStz?=
 =?utf-8?B?V1VZQTlCaGlwMjJ4VXZKKyt0WjBtMi9WbGQxYmZFSmI5WnluSXByaVd4NlBM?=
 =?utf-8?B?UkZJc0p1Z0VCQ3AzQ2d6NGY1MVA0Q0w4ME12N0toN0hoRldHeHhHTFZPSExu?=
 =?utf-8?B?cCtuTW5TQW5BbHgzVnZWOFRZWE5pUUphQndmUGJyYU5aelMyVGZCcU5HYkxY?=
 =?utf-8?B?bzErU3RSSWxrektORXQrUkhrWXYxbzg0bjFybEhlK1oveXIzbFdhTnVwZXRk?=
 =?utf-8?B?Wk5QUTc0bHdFRm44TDhYblBTTy80OVNGRmE5bzdqVFcrM09OTkZNcTFXZmpy?=
 =?utf-8?B?UkVPZ3VRZCtWVVlUbUo3M3BwckFzMW1RdWZuQTlUY1BRWVhrWjhueTRJWXJl?=
 =?utf-8?B?UlE9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f17a434-a803-4ffd-05ab-08ddec64d11f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB9831.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 10:13:10.7898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8fxteiFWlwdlVwOjn9c6WwpmY4kBe1SmEIjck0pdtH6qVpyfQbGgP+yjaA5oW6DoK7pzICSp/x6/qxFNG4hCug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8980

Hi Jacopo

On 20/08/2025 14:58, Jacopo Mondi wrote:
> Extensible parameters meta formats have been introduced in the Linux
> kernel v6.12 initially to support different revision of the RkISP1 ISP
> implemented in different SoC. In order to avoid breaking userspace
> everytime an ISP configuration block is added or modified in the uAPI
> these new formats, which are versionated and extensible by their
> definition have been introduced.
> 
> See for reference:
> e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params format")
> 6c53a7b68c5d ("media: rkisp1: Implement extensible params support")
> 
> The Amlogic C3 ISP driver followed shortly, introducing an extensible
> format for the ISP configuration:
> 
> 6d406187ebc0 ("media: uapi: Add stats info and parameters buffer for C3 ISP")
> 
> with a very similar, if not identical, implementation of the routines to
> validate and handle the ISP configuration in the ISP driver in the
> c3-isp-params.c file.
> 
> fb2e135208f3 ("media: platform: Add C3 ISP driver")
> 
> With the recent upstreaming attempt of the Mali C55 ISP driver from Dan,
> a third user of extensible parameters is going to be itroduced in the
> kernel, duplicating again in the driver the procedure for validating and
> handling the ISP configuration blocks
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20250624-c55-v10-15-54f3d4196990@ideasonboard.com/
> 
> To avoid duplicating again the validation routines and common types
> definition, this series introduces v4l2-params.c/.h for the kAPI
> and v4l2-extensible-params.h for the uAPI and re-organize the RkISP1
> and Amlogic C3 drivers to use the common types and the helper validation
> routines.
> 

I'm currently working on another ISP driver: NXP neo, and also use 
extended params so as RkISP1.

Using common types looks like really interesting approach. However, only 
params are taken into account, while NXP neo also provides statistics. 
I'm currently testing extended approach for both params AND statistics. 
But v4l2-params only applies to .. params, as stated in the name.

Is there any plan to apply the same to statistics ?

> If the here proposed approach is accepted, I propose to rebase the Mali
> C55 driver on top of this series, to use the new common types and
> helpers.
> 
> I have been able to test this on RkISP1 but not on C3.

Also tested on NXP neo locally.

Best regards
Antoine

> 
> Thanks
>    j
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> Changes in v4:
> - Fix the definition of V4L2_PARAMS_FL_PLATFORM_FLAGS
> - Add __counted_by() attribute to the data[] flexible-array member of
>    v4l2_params_buffer
> - Minor style change
> - Link to v3: https://lore.kernel.org/r/20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com
> 
> Changes in v3:
> - Rebased on latest media-committers/next
> - Take in Dan's suggestion in block size validation
> - Documentation minor spelling fixes
> - Link to v2: https://lore.kernel.org/r/20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com
> 
> Changes in v2:
> - Make v4l2_params_buffer directly usable
> - Centralize ENABLE/DISABLE flags definition and validation
> - Take in Dan's v4l2_params_buffer_size()
> - Allow blocks to only contain the header if they're going to be
>    disabled
> - Documentation fixes as reported by Nicolas
> - Link to v1: https://lore.kernel.org/r/20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com
> 
> ---
> Jacopo Mondi (8):
>        media: uapi: Introduce V4L2 extensible params
>        media: uapi: Convert RkISP1 to V4L2 extensible params
>        media: uapi: Convert Amlogic C3 to V4L2 extensible params
>        media: Documentation: uapi: Add V4L2 extensible parameters
>        media: v4l2-core: Introduce v4l2-params.c
>        media: rkisp1: Use v4l2-params for validation
>        media: amlogic-c3: Use v4l2-params for validation
>        media: Documentation: kapi: Add v4l2 extensible parameters
> 
>   Documentation/driver-api/media/v4l2-core.rst       |   1 +
>   Documentation/driver-api/media/v4l2-params.rst     |   5 +
>   .../media/v4l/extensible-parameters.rst            |  89 ++++++
>   .../userspace-api/media/v4l/meta-formats.rst       |   1 +
>   MAINTAINERS                                        |  10 +
>   .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 263 ++++++----------
>   .../media/platform/rockchip/rkisp1/rkisp1-params.c | 349 +++++++++------------
>   drivers/media/v4l2-core/Makefile                   |   3 +-
>   drivers/media/v4l2-core/v4l2-params.c              | 126 ++++++++
>   include/media/v4l2-params.h                        | 164 ++++++++++
>   include/uapi/linux/media/amlogic/c3-isp-config.h   |  48 +--
>   include/uapi/linux/media/v4l2-extensible-params.h  | 146 +++++++++
>   include/uapi/linux/rkisp1-config.h                 |  67 ++--
>   13 files changed, 817 insertions(+), 455 deletions(-)
> ---
> base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
> change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b
> 
> Best regards,

