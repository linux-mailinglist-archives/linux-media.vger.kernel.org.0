Return-Path: <linux-media+bounces-24956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE6EA16BF8
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F331161FFB
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 12:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB721DF996;
	Mon, 20 Jan 2025 12:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="IDcux3h0"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11021105.outbound.protection.outlook.com [52.101.65.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35EB1B87F4;
	Mon, 20 Jan 2025 12:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737374667; cv=fail; b=po7OSFSsJwmxgYVoAO3Q1Ea35d277gmU+xyRE8DKF51Bm/FeDidnQzSQm73e5ZDstEIRpHPtZU2X9w0Udhu170ATe+brY68VjN1bde/wAo1aCI4upfhq877aKANnX+8nk7rYmgDNS8qtqzAbZHLgnM0Yu5Lfis1jjf9EaKB7RZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737374667; c=relaxed/simple;
	bh=vEKAWcuGFvrQRfN/P6GRYP3sHBO6GVE6NMZi4NsVfT8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Mu2y7Q3VNoDhZL2vReqQ/pk93WZAX+kPei9lCnXRK4wkwt/u+fBnKg5jBoWzciyXjscUjVoEmDHs+QtZiJfBpbGjifZWR+H96cggdh6EYbVC4Xo/Ldt+zES9xzRkqSI/i6GTxHGgHvke17JZmbKgOXjoDro7lmEnoO5+HBG174o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=IDcux3h0; arc=fail smtp.client-ip=52.101.65.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3TDWgpjtG4+5iu0ZgSiJ3jiEDLs8ncXg7Oxjlpp8r45E/vazH9tIutcsQNRFwgihik/LxkgDjrg/ECN5owWu0xWqUv9cs52mN81vHUaFBP/LEJ0EJUOXXx3KtWJ1eWIvbJPNsxjFvcqyEWapLyvkzk/18Tt+mUEe89OvbI4Yce0HZb1FJlnFZJhNLRYccPtilsAVED+hJeap3JGxf16F6nfUqs8NH8anD+6/kbt0NclbEwgB8U937CeKfYlTrWypVojryd6LCmGXMsYruZqlJRE9v5Tp4mIDvxWdMk8MO+oKJQittEcF/zIdebQXLxO4Ygqp5Wq5/tTQal1iFSzaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEKAWcuGFvrQRfN/P6GRYP3sHBO6GVE6NMZi4NsVfT8=;
 b=LBHzfGFQ/T+sMt7O9C8X3G4KLocCLRENuVhvA2Qlw+AIdWU7yUScIhsqIs8xIpMqLh8XyR+ilBpuflTTflTuVsKVlgd4/Og1xbX/lSjqegBiOnpuyUngHXQtSd32T3RisNLDE87QD2a5JQO6ZLVNy/b1fHsqrDyrAnP9lVcQ34WFQ3ndHuocGT+i+vwdHY0rxrJa0kaH9aQ1Q1fuiYLb6zcf0VzmktL2Xw1D/EGbEivAnJvK21t9QKiRTbOQ1ZC9pp5urBvR9ra85MpGLci/sdJw4gERXe7uW33nioHQT3uN4BfFM1zzKxAbqn8mJwiBh5ZXY63JT/X758xhpKusjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEKAWcuGFvrQRfN/P6GRYP3sHBO6GVE6NMZi4NsVfT8=;
 b=IDcux3h0tmrs8vRGqCn8deaMDiBdeOq9Q0N9dwU5+gyCeNKOrWG3QCusnwpa655o5tgicG6UNIZpZ/EAQr2+2z/o2eAajlLX+t3Pfhb1Geq2N4u53U9K7aygLf0/qEt0X4Y566RbhEgNxCdb9ZbmF8fS5cljaTHsl6d6bImTXI8=
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com (2603:10a6:20b:512::15)
 by DBBPR08MB6185.eurprd08.prod.outlook.com (2603:10a6:10:207::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 12:04:23 +0000
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726]) by AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726%6]) with mapi id 15.20.8356.017; Mon, 20 Jan 2025
 12:04:23 +0000
From: Gerald Loacker <Gerald.Loacker@wolfvision.net>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Michael Riesch
	<Michael.Riesch@wolfvision.net>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH v2 3/3] media: i2c: imx415: Link frequencies are not
 exclusive to num lanes
Thread-Topic: [PATCH v2 3/3] media: i2c: imx415: Link frequencies are not
 exclusive to num lanes
Thread-Index: AQHbaD4l2NVn+2+gH06wvgGvdActabMflPOw
Date: Mon, 20 Jan 2025 12:04:22 +0000
Message-ID:
 <AS4PR08MB773567215E0E11B1B08D68E1F7E72@AS4PR08MB7735.eurprd08.prod.outlook.com>
References: <20250116-media-imx415-v2-0-735263f04652@raspberrypi.com>
 <20250116-media-imx415-v2-3-735263f04652@raspberrypi.com>
In-Reply-To: <20250116-media-imx415-v2-3-735263f04652@raspberrypi.com>
Accept-Language: de-AT, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR08MB7735:EE_|DBBPR08MB6185:EE_
x-ms-office365-filtering-correlation-id: 5878ce98-3572-42c4-3b54-08dd394a9406
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QVJuMy9WWFpyN0UwMkl0NFRxWVRmck5ndndtNnVjUS9RMW95elVZcmd0K3Qv?=
 =?utf-8?B?aGo1OE85SDJxVEhZbVRzVzlWOE5tNkwrYmlVWnJEdUcyaVd6WUF5eTh3TUpk?=
 =?utf-8?B?VUZsdXRKMHV1d2poOXlKeEVDWTJGMCsyREFia2lVODdwc1lleEZFbWVsT0RU?=
 =?utf-8?B?dEQxMkJBRENQTHJ5TmJ3MnRoaGpCVXQ3bWlyWnhEUkFBMW9kcG5KQUpPNElt?=
 =?utf-8?B?ek1zdEVTOVN0dmhHWTJ4ZDNhamI2NzVIZGFjMUpUb3l6amtmbC9wK1Ixb0VT?=
 =?utf-8?B?MzQvaVd3UWdHWm9ZeXFMZG50MkVqWjZDRkxBZFdyUVBucXZJREFhQ21MOEFG?=
 =?utf-8?B?VEJ3TXltYkUxblRzZDdDVENGb1Jmd0syOTd3NzZUd2pYKzhwaExoN3IvZDVN?=
 =?utf-8?B?bGxaTENwUG9ybkZybHg5QTIzKy8zVFFBMUswNmtPT3AwdmozZ1F3aUhRd3Z3?=
 =?utf-8?B?dHg5eUR2QVI4TXRoT3IvVGhyc3ZKbXp2NHBvVHA3TDNNTFE1V1E4Wi9rc1pi?=
 =?utf-8?B?d1REK3hhYjMyV3E4MHd0QkxxKzU2VVdDNTBxWWdnYkxtVjBSUFJNcTAwQkxi?=
 =?utf-8?B?Sy9YWVhTZUJOUW5BY2U2Z250bndzb0NnSW4rWjFjaW5zVXVPN2pZenV2aStU?=
 =?utf-8?B?R1E0VG1BVisvbnduallBY3R4anRwZVY5NzRCbUxXd1NsZmJ1Q1FMczFvMXJy?=
 =?utf-8?B?SlB2MUk3dkxyL3dvOTliSTNKSWhkTStIVFdBWE4wVzJqK1l3TEdGSHBoU1BH?=
 =?utf-8?B?SmZVUjVLWEo1dDVmS3JDSUsrdjZjRWk0NE9yTFR5aHpBc0lia0hxbCs5ZlR6?=
 =?utf-8?B?UDBuYjdPemE1TFhGak8wMVNydmtROFJMbms3clprZEtkWHE4V20xbXhsbVNw?=
 =?utf-8?B?QUNUbkswUFJzOFQ4MVRveCszMTRxZlRuWFIvNTk2TlZQcTVIRjQ2b3J3Mm9x?=
 =?utf-8?B?UW9GL1BEZGNDUVArK2JmUWtOcTJqMEV6L1U3SzU0YmV4dnVWRnVHb0luaFpx?=
 =?utf-8?B?QnY2Rm0wTGQ4bG5uaVhJc1FKQVd1NTIzd2h2d25yL0VHMk9kQ3F1RHUwYTd2?=
 =?utf-8?B?c3JlTmdMclRQVTlMYkk3NUxqSEtZekwvbVpzYVBaY0xwek5hK1ZMV1RuRWta?=
 =?utf-8?B?eGF0UkhWQ0ErQ3dCQ3YvQU02SnE5ZWhyTiszRExNYWpUalJ2SmRGcGpVZDlW?=
 =?utf-8?B?bksxdXdjL2JoeTNCM2Jwbk84TTBPZExmZ0IzbzcvbE54dlAyeEFUaFBKVHBy?=
 =?utf-8?B?bUQ3ai9oUEJ4UHIzWVhjNjlOVmpsTHdLa3M1ZERPcjhVT2duWEZpRmpSWGdR?=
 =?utf-8?B?aWQvT0ZoZTd1S0tpZnpzSEcrYnp3bFhGMmZXZkNOT2p2SW5TTGN0dkR5WnFa?=
 =?utf-8?B?Vjd3RGczOXRicHEzSWlTaGtLUkdrL25ndVUyNGpDa1RxTUxTSjhPU29GaFBm?=
 =?utf-8?B?TTdmYUV0MDRMbFlraFZBUGRrc0JuVmN3MmlobXJNd1BCOFFWMjZmSnYzSDUx?=
 =?utf-8?B?T0l6MHJ5aFVKUVZIbWpFaHprQWxlbXBlYll2c0llRkFrbDVHU20wbTc4REVl?=
 =?utf-8?B?MXlLSnMyRlZVRDV4YU9NMFd5OXltMDdjc3I5NlVzeW9pU09BdU1MZVdHQmJl?=
 =?utf-8?B?Tk13UTZXeXVnY25xdzQ0cHRWTEtXTzFnMlpVVjY2dEQxMzFyMnQwaXZRa3RG?=
 =?utf-8?B?ME9RNnU4NmRYUWZycEFyeWF1NnVVMDRnK1dSQ1BraW5veENpcUFIU3hSK3d2?=
 =?utf-8?B?UWlVdFlxZzBBbUJpWTQ1TzhxOUZkeGZPZU85cTZIcVJxbnpEdGlkV0ZFV3Fx?=
 =?utf-8?B?WkJ6UkNjY1piTmFBUWt5L1hJelFiQS9GUlE1Nm04VEl0a0pueUlpVGJYUmRy?=
 =?utf-8?B?QkpnZWlXSkNmNlJTYlJIc2pXMlg0Zmp4ZkVSUDc5UUc3b0pUVklNemV0MThT?=
 =?utf-8?Q?4EcD5hAzQu84atdp43GPC3lzvY2QQj2m?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7735.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VnFLSGJkaERnQ013b3RQdEpHWFlpcUU3OHBpcEF1TmVXV0NodWhNSlowWXV6?=
 =?utf-8?B?Z3I3VHAzc3I2WHJjZmJtVlZTNzVKb2VLOEtYcDJoN21JYmxEMDJUS2RNSjhx?=
 =?utf-8?B?MlBmQlJNV0RlcUlqMWRCN2ZaTVQ3aGdSWW91SDlZajQ4SjBGekxoWG9yQ21j?=
 =?utf-8?B?emlya2pJSzUyWFl1dGw3NmdKNkY3bHE3VGNRTE1SdXVtUTZmNzBWQ2JiSkQy?=
 =?utf-8?B?SjQ3SDdVdVFIWWVYQWNISGhJOTZCTW5VMnF2VDRERm9Udmh2NHlXL3U2N2wr?=
 =?utf-8?B?WGRjT3lkWnNzakgrMXUrbzRvdnZWdVIzekljdjBObVBoemp1UTRQSTdGVmc2?=
 =?utf-8?B?RVFvQzJWNUdMZzZYK1dyK1FFME83Z2RFYTJoVUUxZWMzbWhQbndxZEx4SSt3?=
 =?utf-8?B?TGJkSmQrUXBGUnI2ZWhnTXkyb1Q0ci9yd296SXZXTm4xYUUxSnd2TGlldmgy?=
 =?utf-8?B?VGtadXBmbG9LNmtWMzVyb0drQ3B1VUJTc3h4clo5Y3FjdDEwSEVNRmVKTits?=
 =?utf-8?B?SnRZNEZGZE9sVTBtaE5INDdLZXIrbDVLdFpYZnR3eFVnd21wc053YnFGQzUz?=
 =?utf-8?B?ZVF6K1NmMi9UUnRWU0kydGFMMSticGpsNUV4N3cwRGJPYWZpNE9TYmhZNUxU?=
 =?utf-8?B?QWNpUW40Wm1Ed0JpZjZTS2hBdk9veEgxb2NDV25VOVoyenRGN0F2R0c4ZWhZ?=
 =?utf-8?B?V2xDZVJJSGdqdkVUNy9OZmRyN2RQWURTUFBUNDBYWm15R2U1YWUzaGxEdk1p?=
 =?utf-8?B?ZEdoSFUwYjJEQXBQMjIyVG02Wk9uL2JZSGU0clYyWERaWFozRG81L2NuZUll?=
 =?utf-8?B?ZTBnRUp4akQvcTkxZWdaVkFvUXpwVU1nMnpzNHorZUJvRUpOa1FCMXVtN2VC?=
 =?utf-8?B?TWRLRTdnQmYwejRZaitzdFdXV0o3K0gwdncyc0dzV2dzcW9oOWs5QjIrNWlH?=
 =?utf-8?B?cGVGajIzaS83VUZRUXdZOWQ4dTRDS0srbmxpaC8yQ0dNbGFJbHlwWms3NGxT?=
 =?utf-8?B?OVY4L3F6OElQeXBrN3ZXK0dCSlFKYWM5eWRXOHVMSGlGWXkzSkFXaGVRZnha?=
 =?utf-8?B?d3FnRHkwVDh5SUVCK2JUZHptRjhJUkNGTWxMMk9mTmJGalNkNk1pZ2tOb0Ew?=
 =?utf-8?B?MVZGUVIrZW9tdktpRHhTRWg0S2hQcW1CK2NTY0ZPeTZuVVVEeC9wUjJTRkNB?=
 =?utf-8?B?MXpzN05IRTFCWHRCK3NLZEJ3V2tKZ2NUVkVaYTI0cDhzc1RzaUNaSHJNWHpr?=
 =?utf-8?B?d2RBUi9MVm92MDQycjRTdVhRa1N3WGljMHdlVjZpM3ptdi95WGszU0JzTUJF?=
 =?utf-8?B?R1VyU3YvVlRBOHluYnhTQ3FaTXV1dVNDK0V3Zzd5c2hnVjhKeFVTc1RONnFB?=
 =?utf-8?B?Qk4rMHVsekVqY2JYc0twU0djTktzU0hNcW5ndjdOcUVNUm1LcC81S1M3Q2pa?=
 =?utf-8?B?QndvZkxKczB0YTY5RUY5SC84eVVwek82eTcxL2lhSG12WXF6TTZ2c1VXTlRO?=
 =?utf-8?B?aDBsRVU5dksrYTNaYlBiWG9uMUNGR0Q0aWJ6dW9uRVZQUHh2cDNBR2w1OWJm?=
 =?utf-8?B?cm1ScnVMcFlnd2thWXo0RUdQTVVTbEdzT1RxOHBGZmw1ZFJhY001aTVBL3ha?=
 =?utf-8?B?NFBRekpJbHZhSHowVTQ0WUxpa28vMG0vMk5pVUVUSXdHdkZvVVB3K1lONm10?=
 =?utf-8?B?TkRKOTc5c1lsNEkrV3drblZ6L2RXNnRGZlg0Z2xCZnVOMW1EQ1UrK2NFWDhB?=
 =?utf-8?B?MERmMktQWHpSOE9TRTVaWTFXL0pnTk1lZkZKbkFqUXVScVpzMTFtV21QL3hy?=
 =?utf-8?B?M2hMWWcxQkhPMUlJT1BMam45ZzNaaE9uM0Naandsbm92VjA0QnZWaEF3RXVr?=
 =?utf-8?B?SlVhRzZ4MmZUSC83Vk1BMFZLbHRsUlpTeWFhV3FGMEtMbnFUdVJ2aTBIa0ZP?=
 =?utf-8?B?VVF1dUsxRkpQVXhzL0MydWZpZ0lHNHJUcEhTc2QxUVZrdnAyOVFLZUNwK2c4?=
 =?utf-8?B?R2pRb0x0dTRWV1ZrN0gxVFpoQnQ0UVJ0U090MWpjMk42VXhxV3dMZ3FWYzJy?=
 =?utf-8?B?TmxZZmdGV1JwbkxNNWxrSHNXNVdXelA5OTljaks2cFNtTGp0SjJIMVZpMHo5?=
 =?utf-8?B?ZGRsQTFHa0JHWUIrMTZ0SzJtdGNEUmw1Qzhyd29rUEVpMDQ2K3NLazVWNXVW?=
 =?utf-8?B?S2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7735.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5878ce98-3572-42c4-3b54-08dd394a9406
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 12:04:23.0071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JiYNNy6Anwkul30MxgEiWBhFoV80l1c3Qqlh/eJR1aC/L6tqOvYjmg1Qcpd3JLNnuurLhCB47uub+tDDst1A9EkOEUYpIuhTJmFOCeJVzKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6185

SGkgRGF2ZSwNCg0KPiAtLS0tLVVyc3Byw7xuZ2xpY2hlIE5hY2hyaWNodC0tLS0tDQo+IFZvbjog
RGF2ZSBTdGV2ZW5zb24gPGRhdmUuc3RldmVuc29uQHJhc3BiZXJyeXBpLmNvbT4NCj4gR2VzZW5k
ZXQ6IERvbm5lcnN0YWcsIDE2LiBKYW51YXIgMjAyNSAxODo0Mw0KPiBBbjogU2FrYXJpIEFpbHVz
IDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPjsgTWljaGFlbCBSaWVzY2gNCj4gPE1pY2hh
ZWwuUmllc2NoQHdvbGZ2aXNpb24ubmV0PjsgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiDQo+IDxtY2hl
aGFiQGtlcm5lbC5vcmc+DQo+IENjOiBHZXJhbGQgTG9hY2tlciA8R2VyYWxkLkxvYWNrZXJAd29s
ZnZpc2lvbi5uZXQ+OyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IERhdmUgU3RldmVuc29uDQo+IDxkYXZlLnN0ZXZlbnNvbkByYXNw
YmVycnlwaS5jb20+DQo+IEJldHJlZmY6IFtQQVRDSCB2MiAzLzNdIG1lZGlhOiBpMmM6IGlteDQx
NTogTGluayBmcmVxdWVuY2llcyBhcmUgbm90IGV4Y2x1c2l2ZSB0bw0KPiBudW0gbGFuZXMNCj4g
DQo+IFRoZSBsaW5rIGZyZXF1ZW5jaWVzIGFyZSBlcXVhbGx5IHZhbGlkIGluIDIgb3IgNCBsYW5l
IG1vZGVzLCBidXQNCj4gdGhleSBjaGFuZ2UgdGhlIGhtYXhfbWluIHZhbHVlIGZvciB0aGUgbW9k
ZSBhcyB0aGUgTUlQSSBibG9jaw0KPiBoYXMgdG8gaGF2ZSBzdWZmaWNpZW50IHRpbWUgdG8gc2Vu
ZCB0aGUgcGl4ZWwgZGF0YSBmb3IgZWFjaCBsaW5lLg0KPiANCj4gUmVtb3ZlIHRoZSBhc3NvY2lh
dGlvbiB3aXRoIG51bWJlciBvZiBsYW5lcywgYW5kIGFkZCBobWF4X21pbg0KPiBjb25maWd1cmF0
aW9uIGZvciBib3RoIGxhbmUgb3B0aW9ucy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhdmUgU3Rl
dmVuc29uIDxkYXZlLnN0ZXZlbnNvbkByYXNwYmVycnlwaS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9tZWRpYS9pMmMvaW14NDE1LmMgfCA1MyArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyks
IDI4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL2lt
eDQxNS5jIGIvZHJpdmVycy9tZWRpYS9pMmMvaW14NDE1LmMNCj4gaW5kZXggMjQ2MzNkMTdjYjA5
Li41NzI5ZWRmMDZhZGQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL2lteDQxNS5j
DQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvaTJjL2lteDQxNS5jDQo+IEBAIC00NTIsOSArNDUyLDgg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbXg0MTVfY2xrX3BhcmFtcw0KPiBpbXg0MTVfY2xrX3Bh
cmFtc1tdID0gew0KPiAgCX0sDQo+ICB9Ow0KPiANCj4gLS8qIGFsbC1waXhlbCAyLWxhbmUgNzIw
IE1icHMgMTUuNzQgSHogbW9kZSAqLw0KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBjY2lfcmVnX3Nl
cXVlbmNlIGlteDQxNV9tb2RlXzJfNzIwW10gPSB7DQo+IC0JeyBJTVg0MTVfTEFORU1PREUsIElN
WDQxNV9MQU5FTU9ERV8yIH0sDQo+ICsvKiA3MjAgTWJwcyBDU0kgY29uZmlndXJhdGlvbiAqLw0K
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBjY2lfcmVnX3NlcXVlbmNlIGlteDQxNV9saW5rcmF0ZV83
MjBtYnBzW10gPSB7DQo+ICAJeyBJTVg0MTVfVENMS1BPU1QsIDB4MDA2RiB9LA0KPiAgCXsgSU1Y
NDE1X1RDTEtQUkVQQVJFLCAweDAwMkYgfSwNCj4gIAl7IElNWDQxNV9UQ0xLVFJBSUwsIDB4MDAy
RiB9LA0KPiBAQCAtNDY2LDkgKzQ2NSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2NpX3JlZ19z
ZXF1ZW5jZQ0KPiBpbXg0MTVfbW9kZV8yXzcyMFtdID0gew0KPiAgCXsgSU1YNDE1X1RMUFgsIDB4
MDAyNyB9LA0KPiAgfTsNCj4gDQo+IC0vKiBhbGwtcGl4ZWwgMi1sYW5lIDE0NDAgTWJwcyAzMC4w
MSBIeiBtb2RlICovDQo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGNjaV9yZWdfc2VxdWVuY2UgaW14
NDE1X21vZGVfMl8xNDQwW10gPSB7DQo+IC0JeyBJTVg0MTVfTEFORU1PREUsIElNWDQxNV9MQU5F
TU9ERV8yIH0sDQo+ICsvKiAxNDQwIE1icHMgQ1NJIGNvbmZpZ3VyYXRpb24gKi8NCj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgY2NpX3JlZ19zZXF1ZW5jZSBpbXg0MTVfbGlua3JhdGVfMTQ0MG1icHNb
XSA9IHsNCj4gIAl7IElNWDQxNV9UQ0xLUE9TVCwgMHgwMDlGIH0sDQo+ICAJeyBJTVg0MTVfVENM
S1BSRVBBUkUsIDB4MDA1NyB9LA0KPiAgCXsgSU1YNDE1X1RDTEtUUkFJTCwgMHgwMDU3IH0sDQo+
IEBAIC00ODAsOSArNDc4LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjY2lfcmVnX3NlcXVlbmNl
DQo+IGlteDQxNV9tb2RlXzJfMTQ0MFtdID0gew0KPiAgCXsgSU1YNDE1X1RMUFgsIDB4MDA0RiB9
LA0KPiAgfTsNCj4gDQo+IC0vKiBhbGwtcGl4ZWwgNC1sYW5lIDg5MSBNYnBzIDMwIEh6IG1vZGUg
Ki8NCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgY2NpX3JlZ19zZXF1ZW5jZSBpbXg0MTVfbW9kZV80
Xzg5MVtdID0gew0KPiAtCXsgSU1YNDE1X0xBTkVNT0RFLCBJTVg0MTVfTEFORU1PREVfNCB9LA0K
PiArLyogODkxIE1icHMgQ1NJIGNvbmZpZ3VyYXRpb24gKi8NCj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgY2NpX3JlZ19zZXF1ZW5jZSBpbXg0MTVfbGlua3JhdGVfODkxbWJwc1tdID0gew0KPiAgCXsg
SU1YNDE1X1RDTEtQT1NULCAweDAwN0YgfSwNCj4gIAl7IElNWDQxNV9UQ0xLUFJFUEFSRSwgMHgw
MDM3IH0sDQo+ICAJeyBJTVg0MTVfVENMS1RSQUlMLCAweDAwMzcgfSwNCj4gQEAgLTUwMSw4ICs0
OTgsNyBAQCBzdHJ1Y3QgaW14NDE1X21vZGVfcmVnX2xpc3Qgew0KPiANCj4gIHN0cnVjdCBpbXg0
MTVfbW9kZSB7DQo+ICAJdTY0IGxhbmVfcmF0ZTsNCj4gLQl1MzIgbGFuZXM7DQo+IC0JdTMyIGht
YXhfbWluOw0KPiArCXUzMiBobWF4X21pblsyXTsNCj4gIAlzdHJ1Y3QgaW14NDE1X21vZGVfcmVn
X2xpc3QgcmVnX2xpc3Q7DQo+ICB9Ow0KPiANCj4gQEAgLTUxMCwyOSArNTA2LDI2IEBAIHN0cnVj
dCBpbXg0MTVfbW9kZSB7DQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGlteDQxNV9tb2RlIHN1cHBv
cnRlZF9tb2Rlc1tdID0gew0KPiAgCXsNCj4gIAkJLmxhbmVfcmF0ZSA9IDcyMDAwMDAwMCwNCj4g
LQkJLmxhbmVzID0gMiwNCj4gLQkJLmhtYXhfbWluID0gMjAzMiwNCj4gKwkJLmhtYXhfbWluID0g
eyAyMDMyLCAxMDY2IH0sDQo+ICAJCS5yZWdfbGlzdCA9IHsNCj4gLQkJCS5udW1fb2ZfcmVncyA9
IEFSUkFZX1NJWkUoaW14NDE1X21vZGVfMl83MjApLA0KPiAtCQkJLnJlZ3MgPSBpbXg0MTVfbW9k
ZV8yXzcyMCwNCj4gKwkJCS5udW1fb2ZfcmVncyA9IEFSUkFZX1NJWkUoaW14NDE1X2xpbmtyYXRl
XzcyMG1icHMpLA0KPiArCQkJLnJlZ3MgPSBpbXg0MTVfbGlua3JhdGVfNzIwbWJwcywNCj4gIAkJ
fSwNCj4gIAl9LA0KPiAgCXsNCj4gIAkJLmxhbmVfcmF0ZSA9IDE0NDAwMDAwMDAsDQo+IC0JCS5s
YW5lcyA9IDIsDQo+IC0JCS5obWF4X21pbiA9IDEwNjYsDQo+ICsJCS5obWF4X21pbiA9IHsgMTA2
NiwgNTMzIH0sDQo+ICAJCS5yZWdfbGlzdCA9IHsNCj4gLQkJCS5udW1fb2ZfcmVncyA9IEFSUkFZ
X1NJWkUoaW14NDE1X21vZGVfMl8xNDQwKSwNCj4gLQkJCS5yZWdzID0gaW14NDE1X21vZGVfMl8x
NDQwLA0KPiArCQkJLm51bV9vZl9yZWdzID0gQVJSQVlfU0laRShpbXg0MTVfbGlua3JhdGVfMTQ0
MG1icHMpLA0KPiArCQkJLnJlZ3MgPSBpbXg0MTVfbGlua3JhdGVfMTQ0MG1icHMsDQo+ICAJCX0s
DQo+ICAJfSwNCj4gIAl7DQo+ICAJCS5sYW5lX3JhdGUgPSA4OTEwMDAwMDAsDQo+IC0JCS5sYW5l
cyA9IDQsDQo+IC0JCS5obWF4X21pbiA9IDExMDAsDQo+ICsJCS5obWF4X21pbiA9IHsgMjIwMCwg
MTEwMCB9LA0KPiAgCQkucmVnX2xpc3QgPSB7DQo+IC0JCQkubnVtX29mX3JlZ3MgPSBBUlJBWV9T
SVpFKGlteDQxNV9tb2RlXzRfODkxKSwNCj4gLQkJCS5yZWdzID0gaW14NDE1X21vZGVfNF84OTEs
DQo+ICsJCQkubnVtX29mX3JlZ3MgPSBBUlJBWV9TSVpFKGlteDQxNV9saW5rcmF0ZV84OTFtYnBz
KSwNCj4gKwkJCS5yZWdzID0gaW14NDE1X2xpbmtyYXRlXzg5MW1icHMsDQo+ICAJCX0sDQo+ICAJ
fSwNCj4gIH07DQoNClRoYW5rcyBmb3IgdGhlIHYyLCBub3cgaXQgd29ya3Mgd2VsbC4NCg0KUmV2
aWV3ZWQtYnk6IEdlcmFsZCBMb2Fja2VyIDxnZXJhbGQubG9hY2tlckB3b2xmdmlzaW9uLm5ldD4N
Cg0KPiBAQCAtNzgzLDcgKzc3Niw4IEBAIHN0YXRpYyBpbnQgaW14NDE1X2N0cmxzX2luaXQoc3Ry
dWN0IGlteDQxNSAqc2Vuc29yKQ0KPiAgew0KPiAgCXN0cnVjdCB2NGwyX2Z3bm9kZV9kZXZpY2Vf
cHJvcGVydGllcyBwcm9wczsNCj4gIAlzdHJ1Y3QgdjRsMl9jdHJsICpjdHJsOw0KPiAtCXU2NCBs
YW5lX3JhdGUgPSBzdXBwb3J0ZWRfbW9kZXNbc2Vuc29yLT5jdXJfbW9kZV0ubGFuZV9yYXRlOw0K
PiArCWNvbnN0IHN0cnVjdCBpbXg0MTVfbW9kZSAqY3VyX21vZGUgPSAmc3VwcG9ydGVkX21vZGVz
W3NlbnNvci0NCj4gPmN1cl9tb2RlXTsNCj4gKwl1NjQgbGFuZV9yYXRlID0gY3VyX21vZGUtPmxh
bmVfcmF0ZTsNCj4gIAl1MzIgZXhwb3N1cmVfbWF4ID0gSU1YNDE1X1BJWEVMX0FSUkFZX0hFSUdI
VCArDQo+ICAJCQkgICBJTVg0MTVfUElYRUxfQVJSQVlfVkJMQU5LIC0NCj4gIAkJCSAgIElNWDQx
NV9FWFBPU1VSRV9PRkZTRVQ7DQo+IEBAIC04MjQsNyArODE4LDcgQEAgc3RhdGljIGludCBpbXg0
MTVfY3RybHNfaW5pdChzdHJ1Y3QgaW14NDE1ICpzZW5zb3IpDQo+ICAJCQkgIElNWDQxNV9BR0FJ
Tl9NQVgsIElNWDQxNV9BR0FJTl9TVEVQLA0KPiAgCQkJICBJTVg0MTVfQUdBSU5fTUlOKTsNCj4g
DQo+IC0JaGJsYW5rX21pbiA9IChzdXBwb3J0ZWRfbW9kZXNbc2Vuc29yLT5jdXJfbW9kZV0uaG1h
eF9taW4gKg0KPiArCWhibGFua19taW4gPSAoY3VyX21vZGUtPmhtYXhfbWluW3NlbnNvci0+bnVt
X2RhdGFfbGFuZXMgPT0gMiA/IDAgOg0KPiAxXSAqDQo+ICAJCSAgICAgIElNWDQxNV9ITUFYX01V
TFRJUExJRVIpIC0gSU1YNDE1X1BJWEVMX0FSUkFZX1dJRFRIOw0KPiAgCWhibGFua19tYXggPSAo
SU1YNDE1X0hNQVhfTUFYICogSU1YNDE1X0hNQVhfTVVMVElQTElFUikgLQ0KPiAgCQkgICAgIElN
WDQxNV9QSVhFTF9BUlJBWV9XSURUSDsNCj4gQEAgLTg4Niw3ICs4ODAsMTIgQEAgc3RhdGljIGlu
dCBpbXg0MTVfc2V0X21vZGUoc3RydWN0IGlteDQxNSAqc2Vuc29yLCBpbnQNCj4gbW9kZSkNCj4g
IAkJCSAgICBJTVg0MTVfTlVNX0NMS19QQVJBTV9SRUdTLA0KPiAgCQkJICAgICZyZXQpOw0KPiAN
Cj4gLQlyZXR1cm4gMDsNCj4gKwlyZXQgPSBjY2lfd3JpdGUoc2Vuc29yLT5yZWdtYXAsIElNWDQx
NV9MQU5FTU9ERSwNCj4gKwkJCXNlbnNvci0+bnVtX2RhdGFfbGFuZXMgPT0gMiA/IElNWDQxNV9M
QU5FTU9ERV8yIDoNCj4gKwkJCQkJCSAgICAgIElNWDQxNV9MQU5FTU9ERV80LA0KPiArCQkJTlVM
TCk7DQo+ICsNCj4gKwlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiANCj4gIHN0YXRpYyBpbnQgaW14NDE1
X3NldHVwKHN0cnVjdCBpbXg0MTUgKnNlbnNvciwgc3RydWN0IHY0bDJfc3ViZGV2X3N0YXRlICpz
dGF0ZSkNCj4gQEAgLTEyOTcsOCArMTI5Niw2IEBAIHN0YXRpYyBpbnQgaW14NDE1X3BhcnNlX2h3
X2NvbmZpZyhzdHJ1Y3QgaW14NDE1DQo+ICpzZW5zb3IpDQo+ICAJCX0NCj4gDQo+ICAJCWZvciAo
aiA9IDA7IGogPCBBUlJBWV9TSVpFKHN1cHBvcnRlZF9tb2Rlcyk7ICsraikgew0KPiAtCQkJaWYg
KHNlbnNvci0+bnVtX2RhdGFfbGFuZXMgIT0gc3VwcG9ydGVkX21vZGVzW2pdLmxhbmVzKQ0KPiAt
CQkJCWNvbnRpbnVlOw0KPiAgCQkJaWYgKGJ1c19jZmcubGlua19mcmVxdWVuY2llc1tpXSAqIDIg
IT0NCj4gIAkJCSAgICBzdXBwb3J0ZWRfbW9kZXNbal0ubGFuZV9yYXRlKQ0KPiAgCQkJCWNvbnRp
bnVlOw0KPiANCj4gLS0NCj4gMi4zNC4xDQoNCg==

