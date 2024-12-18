Return-Path: <linux-media+bounces-23681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9C79F5D26
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 03:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73BE67A29F1
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 02:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E6F130A73;
	Wed, 18 Dec 2024 02:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="WGvP/k5N"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020076.outbound.protection.outlook.com [52.101.156.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375E642048;
	Wed, 18 Dec 2024 02:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734490699; cv=fail; b=gaBtjZp75wBHN5MGNFJi9LDrA4Sb3SRlLlay0R95AqMiyN/NCT6hVWkQ9UTJyPb66prn5VebCSESWdQqtqyEO3OMpSD6O3D7M0rIKR23TBv2PhZK/GBn3i5e8vd6jhn+n29V2bZgssGeibadD6oYFBdwSpFsBpFXnUnlHvDDk5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734490699; c=relaxed/simple;
	bh=dQ1jsdykswfQVOSeBQT7YwDxfBYrNEefOj68BUcP0AM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gh1CjUe1KjeW7SL9JxBnsuNYYrIYRUpNmXMomm/p+vFuqaaa/m2baMahMgnE3dF//ypoMKr6A5M7L+LRrxEUvCpL3CsVJ+bT6eIsgp+vMlo1XLRUSXx4jVEFnSzxb316LegHs7Tp13r59PGiWgPupvEwS3e5X74uSDYfx5E9qhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=WGvP/k5N; arc=fail smtp.client-ip=52.101.156.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTH+2usyLGUvSFHzEzX7Z39TqrFl82zxcDj53PBgudW1TjqNCdmcemrgGwWKJVbok1RHDS1thAWiYj+Pm1zgPu8C4WAwDtA3VvL5TlQabF/TLfCI1xzScbWP0eufgjKlbWpfvB6ynM8LphvMJbKNIf1aaKMvT+CLauVZxfOmQg4aX1ghFWfSlod6xGRoS/VXp6wUcfL9LP8CyrBUJ3CwyeXFP29zZvkzMRBN3QQAyfR+8H9GkqVzYgcjKrxA8ugKjDIUVa+NIphsq3m1/UrpRYHCUhKzpXqOUp9dfFELDRFuRzG/sXAeV0eOfTN4W2vLhnxYPU/1G7zstSMvH95O0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQ1jsdykswfQVOSeBQT7YwDxfBYrNEefOj68BUcP0AM=;
 b=ZBMxyxNRgCha8niwrmq/O/O2hI76xEKA+r3I90EAGIeTqjwrosK2/b7qdMzs4TfTOzwbl2uPg3JpnUG9BCFNwEGypW0r6YxmLuJ8B6e0rMBjkmLGGU3oz3i2mu8ELAcpopb8ucLMh5Vo4IjlhlvPUkKXPkVGHqKc+R9Tpc7kaeb6GNIwd/xpm0sdH64Edaav8Rc2ozzmsStXR6cNWTUYqMcs8LCGlU2uYtXlxtm88bdhh4mg2zxVuzzqk09hYGqD6objtAk4o3TkL5fyZFPisXCwQIPGa3ppxHgfzCn36EyiGLY7tTrSuB9gxkr/vTGNp161ctZvwq8SScNXYSdSig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQ1jsdykswfQVOSeBQT7YwDxfBYrNEefOj68BUcP0AM=;
 b=WGvP/k5NvIBzCh62lOYUdHP549S2qjslFSO/9wJLOeU1queZQiescN7Kvd2Z3MzheW1nzUE+VWEBzVsAksELdGRhtVETIqA0tO1vdqlPyyq2vFXy+KpTg3gG33WedIYo6li57k271LzEojLZLsmVi7jbFeN7aygtm9qW07Ifr5A=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SEWP216MB3049.KORP216.PROD.OUTLOOK.COM (2603:1096:101:293::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.13; Wed, 18 Dec 2024 02:58:12 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%3]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 02:58:12 +0000
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
Subject: RE: [PATCH v2 1/4] media: chips-media: wave5: Fix to display gray
 color on screen
Thread-Topic: [PATCH v2 1/4] media: chips-media: wave5: Fix to display gray
 color on screen
Thread-Index: AQHbUD9a2nP9qekCM02TH9W2fDyHprLqeIqAgADXpKA=
Date: Wed, 18 Dec 2024 02:58:12 +0000
Message-ID:
 <SE1P216MB13035D21B3AF59CA5B347DDAED052@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20241217045125.58-1-jackson.lee@chipsnmedia.com>
	 <20241217045125.58-2-jackson.lee@chipsnmedia.com>
 <49ca2e9fa8f057c3ec4d88f147713f1164aec2a4.camel@collabora.com>
In-Reply-To: <49ca2e9fa8f057c3ec4d88f147713f1164aec2a4.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SEWP216MB3049:EE_
x-ms-office365-filtering-correlation-id: 3ca1682d-311f-491d-2d34-08dd1f0fcfc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eFdjL1ZsQllJM1QvZjVVRG9USm42b1g4WUtVOUhQZlM1UFNBaUxOWHRmQjY1?=
 =?utf-8?B?RmRzNGQ5Y1N2Rzg5Rnh4c1NhZTBtUzI1cW9xcHhRZjNtOENjOW5HVGFpcm5Z?=
 =?utf-8?B?QWx0N0ROb0xjUElNMDVXQURCZUYzaXRoWktYbmcvTlVMbnBjS09nNWdRa2ZW?=
 =?utf-8?B?WXlwQlVwKy9ob1daOGh3L2ZrOHQzZEoxU3ZQRmFzRWlWUEhCbk8rRUxCczFB?=
 =?utf-8?B?THpFRDlwYStBdm93QzlpUENCdldoaUowWGpSQ2xnWDk3YmxIV3IrQlV6N0Zi?=
 =?utf-8?B?aGZmalVSSmhBZ1g3djdlcmdvWW1hV3JvSWRHRkx3ZDdNSjIxckZEcGFtRjRy?=
 =?utf-8?B?ZlRKM3pGK1IveHlkV1RZM1lJSGp3QTZPWFRrclpCUnFxcTBmQXlBUUhjK3RO?=
 =?utf-8?B?NnRhclA4YnoxRWQreS9aMkh1Wm9JeXU4R21ybzlHTkN3dWtTZE1VQStCUEdL?=
 =?utf-8?B?QWd2RnJhaWd6bzBPZ213MVlnU3Uxc2dzSUhmeVZZNUV1Rkw4TzBwRTZWTW5m?=
 =?utf-8?B?Sm92T1I4cGxFaFdvRWlJcmg0aDJCSml1czlrMk5BUy9Gc20zWWllWG56OVlq?=
 =?utf-8?B?SEJaL09Id2xMTEVYbWppLzhYUnZpVCtlTnZVcldmNDFLMjl3VUdxSEcrazRX?=
 =?utf-8?B?UTRYVkJzOVhaQXc1Q0ZYQStWQ1BoOGNaNEQrSTNleFFTRStScUorWjZrT2JJ?=
 =?utf-8?B?bVQ3Y1Y4U0JFYmtUdlBwWnE3TmJsQjFOdlkweWRHM0liRUVMUk94KzAzWCtS?=
 =?utf-8?B?dHMrQ2RIaEdGWVIwUmlCbnVNMWlOd29sVWZxY3NkdG9ZZWRaU2ZFQXVJT2hv?=
 =?utf-8?B?cHVBUklHeStLQkFtTkRTbFN3OVdlSGl4QWJqSGN0KzljWnZxdVdvWmZOWVh4?=
 =?utf-8?B?NzJnNUt3OXRQY2JTNHJ3bTFOQmJhMFRPTEZDQW5IVlZwWitRSjZwTExJcjZZ?=
 =?utf-8?B?Zno4THBGSVpLQ1p2akxsT2ZVUXhpMGo0MFhtRjdNYXNsbW5iTExRWCtVTjI2?=
 =?utf-8?B?RCs2SzhsZ2xFRktOVmllcFlMbU8yYUYrdWlMSW9VbTlNZ01VVno2aEdJVURq?=
 =?utf-8?B?VTZ3bUlCaFV4MEN4dU1rSzJKT3pEbkdyTEZmTk00eGJUWEI4RHZ3MlhoS2Rr?=
 =?utf-8?B?MVFBRk0xSWVEVWl3MElscklacEx2bUxGbGtDQytUZVZzNjh0UC9jNVluOUVx?=
 =?utf-8?B?citMa1RaUk8zejI1QUhKTzlMd1VPdVlTSzlCNkZxYUF0YkJhaldKNDVjOVk3?=
 =?utf-8?B?eGJKN1NGcXVqNnhDa0xMamJ5NGdHYkVEZ0RHMlduMS9QK1RMQVk1TWdJNSt3?=
 =?utf-8?B?YisvUCt6YkRobFFUZDJWeC8veHpmaDhNNm41UU1XMXlvODZlMzNpY3F4WW56?=
 =?utf-8?B?NmNOaXpPVlVObHI3RW1TNklFazVHVHRsZHFSRit4WStlM3dGWDhTL1FCY0xK?=
 =?utf-8?B?R3hTTC9NblpkRHMrQXZsdER2VnhZNUJ0dlVqVno4YXZqOUlGVGVZVkc0L0lY?=
 =?utf-8?B?cEFidFdiK1RvVFRZQkhKbGlEV2dMYmg2Zmp1bXFGazQ4dEVKQ0dFTFZEVkor?=
 =?utf-8?B?U3B6RXYxbTk5ODhjcS9MZ09iZ2I2dC9hTVFMUm9Ra1lPZVczNStnWndIK0xs?=
 =?utf-8?B?ZUZKa1BWYmpGV3VLazBESTJrb3BjM1VFQjk3TlhhdzNJR0N6bUs0S1A3cEdW?=
 =?utf-8?B?Z1M0MGlGRFAyN0FyMmNtdjFGcXNicEg1bmlnYi9GcEJhNWhFMmVWWEZwWGhB?=
 =?utf-8?B?dTRSbUFCMS82d2tVWlpXZzlRbDlvd0l4Y0Q2QS8ydGFZTElpRmZaUnVPWHJS?=
 =?utf-8?B?V0E1ZzViM0ZNekhqUURBN0NOaFFyQnYwdGNHdVp5eXI5T3duWmVDN3FSTmNo?=
 =?utf-8?B?TFFYVWtDUG1HaWRIaEY5R0U3a1NFc3lVaFpZNUV3bWw4U3djL3pkOEJMeEN5?=
 =?utf-8?Q?NXhSvRThce7DKh3lyKVuTOSk/y92MNuv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWtDR3lYTDVLMmVzY0ZvSGFUV2FwalhoZklpc0k3YXdHa3dxdTlGM0Rtemtt?=
 =?utf-8?B?Rkp3V0hPYnlUdlBOZjNTUllZaUpXWWlxL3Q4Y2Q3NFM3VmhBRFdJRTJDSlht?=
 =?utf-8?B?YWdPWDJMamRybTlQUTdMRU1pMGk1Rkt5eGFnZEhXL3JlZ2VheW9GdHE1VDNB?=
 =?utf-8?B?RFpHckJGc3hNV0s0RTV5OUUxVjVEWk5GUWNjMlR6WGtmUDVSRVp0RkplNjRJ?=
 =?utf-8?B?SjJPNVR4MExoQzN1aDMwVVgrMWpVQzVZY2c3WVlXV1RxVHdjeDlYdlFWMVF3?=
 =?utf-8?B?WXVTdTlUQ3VUa3AranJoaGQ1Z1hKeHFNbnRWK251SzY3MVRxS1FmM3Q1Y1JF?=
 =?utf-8?B?UVJPWVA2Qk80K21lMW1wbTVwUlNjeFkzcTExOUg2a2Z5aThPakNpVGZBK1pZ?=
 =?utf-8?B?S1RsU2hlT2hZdlpRTnM0eUVWK2lTbmlyZnhjbmp2bGZXUkg2WUQ5RnlZWm1t?=
 =?utf-8?B?Uld3RlpJc0k5b3QwQjl6UEhNS0dUQzFwVmJjTEkycWlyZy9LREZFTUZOeXFs?=
 =?utf-8?B?clJyVWZTdFlQeVNQRGFGbU41YThBRmtnSlBkN0ZRM3dsb0grRXhNVkJxakVq?=
 =?utf-8?B?WHZjcnlFd0s2eW1WOUJubE55aTNwejJmTXRwdGdJUjAxRXZONEw1SUptc3JN?=
 =?utf-8?B?LzUvYmZLWEphS0dDRGFHV29RRkt0Qi9uNU5XTmR0NS9PNWFRRnhuNXU1cXJO?=
 =?utf-8?B?YUhVejNPTmRrVlFOVktPLzVrZk5nNzdmV2xsZjFkZ1JQZHdJVTBPc0NQZW53?=
 =?utf-8?B?YTlvSVdxUkR4WXBLS3FCczcvbUhzZmllUGx6dFNEQWcyczZJM2lJZzRPN0Z2?=
 =?utf-8?B?VTJsRS9aQm9zd0pOb2QvRER6Q2dMYmJFU25wWVU4SzFwTURJR2lIS293b09L?=
 =?utf-8?B?YVdiKzN3aVoxMk9BbSt5S3psUzg0QUlDTHIyaHlIelRNc0w2RkFvSVFwaG9H?=
 =?utf-8?B?b3JnbkdJakRyQXZxYWQ3UmFncHU1bmcwYjlXVUZqcXc0YlYzUy8walc3OHhp?=
 =?utf-8?B?dHcwWXdEblJla1dlZ3lnV3hoUW9VWW5LRmdxRGdPZGhPV0pKV3JXeHhmdE9j?=
 =?utf-8?B?NVRhZU1kbzZZMXN3V0tCSW9GWlV6TGRvQjRlQUJ5N0VwR05xUllMNkd2bkpQ?=
 =?utf-8?B?QWlFd1pyRlpiRGFMVngzdmpGejZHOVJSc3lUUzFVNWtjMW5Eb3lrZS96SGM0?=
 =?utf-8?B?Ym94azZ6SzFBd1Mvb0JFWGZaMkRCTkNiTEdHYWRaaGhZZTNKQmVCQ2JPZVpz?=
 =?utf-8?B?Wm5WWHI3UWY4ZjczcU8yQTV4WGRmblZoV3pBaHF1YWx5a3EzNURySHBJWHRC?=
 =?utf-8?B?djFPNVRKenBQZXVXQ0llM1U0T1ZNL0JTTU0ySEIrYXpibnkycThSYzUvcTF5?=
 =?utf-8?B?bzA2QzBPVWlkYWhIbEFCQjFIZ1Z6WWNQWS9hck03QWp5UUhWQmVXWFlDVXJN?=
 =?utf-8?B?Y2liN1dLU2FGRVBkNExRajMvZnVCSitNWC81T2lEUktKbUNCczZBb2ZOWk5B?=
 =?utf-8?B?ZDZlLzV0ei9Db3pzclpkQm1nUURQL0dxNVdIQW9FUHhDYmowdjRQdUYzZ1NK?=
 =?utf-8?B?alhSWE92NUQrU2JWUVlNMXlDV2d3cTdTWndleENTNGZKa0xSTGhScDVkNjcy?=
 =?utf-8?B?SjlIWVNuTzhXREhHMXNaK1VmTEhzdmpJNWVpTFlibDlxeHk3TU5ZdVFZM1ZD?=
 =?utf-8?B?VWRqRy9MZnV6VUpScFo0WENDREhLSmtORTN5c2R5TW5MQXlRM3ppZzdSZzdm?=
 =?utf-8?B?ZGNkY1ZBdEp4MHh0SDJUSUx2cjFRUVJSZWJOcjVDL0t3MTZTNFlaQ1Z0V2xH?=
 =?utf-8?B?ZU9qRjA1eG0waEdGRER6RU9pNExMbXROdlA0TkFuK3pEMnA1alNaNkZNWW5Y?=
 =?utf-8?B?Vy8zdENVSFZyQUFtcmo3MlpJTnFTaHh0bVVDcXFkZWNvVTA1N21FWVU1U01v?=
 =?utf-8?B?ZGFwMW4rRTlFVWp2eFlKem5MTVJ1cDlMUWxMNDh0VkdUc3RQRVpEaGYxWit5?=
 =?utf-8?B?eEg5SGtoR2I5VEVseHk1TlpZeDNEbWVsQVl4R2o4WXo4MUhsT2RaNDFvSWZr?=
 =?utf-8?B?eVpsWml0d2JEdktzcmR5cXhOWjFoRXZCSm9pRjVQdDBtSGFiaTg1aTNmalVp?=
 =?utf-8?Q?5JS4EiGcsoQVXxa/VUTaN/IiG?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca1682d-311f-491d-2d34-08dd1f0fcfc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 02:58:12.7075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QG8QCMbNY+XAuUl3eDWaHmoNg1wxRWVLce5LCJEniZoDYHoiBetZX6wauqlLYScvI2fXiFYA3VFc47BEQhYRNM8tAmg/Sj36JMWSMi3hucQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB3049

SGkgTmljb2xhcw0KDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBO
aWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1ZnJlc25lQGNvbGxhYm9yYS5jb20+DQo+IFNlbnQ6
IFR1ZXNkYXksIERlY2VtYmVyIDE3LCAyMDI0IDExOjA0IFBNDQo+IFRvOiBqYWNrc29uLmxlZSA8
amFja3Nvbi5sZWVAY2hpcHNubWVkaWEuY29tPjsgbWNoZWhhYkBrZXJuZWwub3JnOw0KPiBodmVy
a3VpbC1jaXNjb0B4czRhbGwubmw7IHNlYmFzdGlhbi5mcmlja2VAY29sbGFib3JhLmNvbTsNCj4g
Ym9iLmJlY2tldHRAY29sbGFib3JhLmNvbTsgZGFmbmEuaGlyc2NoZmVsZEBjb2xsYWJvcmEuY29t
DQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGxhZmxleS5raW0NCj4gPGxhZmxleS5raW1AY2hpcHNubWVkaWEuY29tPjsgYi1i
cm5pY2hAdGkuY29tOyBodmVya3VpbEB4czRhbGwubmw7IE5hcw0KPiBDaHVuZyA8bmFzLmNodW5n
QGNoaXBzbm1lZGlhLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzRdIG1lZGlhOiBj
aGlwcy1tZWRpYTogd2F2ZTU6IEZpeCB0byBkaXNwbGF5IGdyYXkNCj4gY29sb3Igb24gc2NyZWVu
DQo+IA0KPiBIaSwNCj4gDQo+IExlIG1hcmRpIDE3IGTDqWNlbWJyZSAyMDI0IMOgIDEzOjUxICsw
OTAwLCBKYWNrc29uLmxlZSBhIMOpY3JpdMKgOg0KPiA+IFdoZW4gYSBkZWNvZGVyIGluc3RhbmNl
IGlzIGNyZWF0ZWQsIFc1X0NNRF9FUlJfQ09OQ0VBTCByZWdpc3RlciBzaG91bGQNCj4gPiBiZSBp
bml0aWFsaXplZCB0byAwLiBJZiBub3Qgc2V0IHRvIDAsIGdyYXkgY29sb3IgY2FuIG9jY2FzaW9u
YWxseSBiZQ0KPiA+IGRpc3BsYXllZCBvbiBzY3JlZW4gd2hpbGUgZGVjb2RpbmcuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBKYWNrc29uLmxlZSA8amFja3Nvbi5sZWVAY2hpcHNubWVkaWEuY29t
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IE5hcyBDaHVuZyA8bmFzLmNodW5nQGNoaXBzbm1lZGlhLmNv
bT4NCj4gPiBSZXZpZXdlZC1ieTogTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBj
b2xsYWJvcmEuY29tPg0KPiANCj4gWW91IGZvcmdvdCB0byBhZGQgRml4ZXM6IHRhZ3MsIGNhbiB5
b3UgZmluZCBiYWNrIHdoaWNoIGNvbW1pdCB5b3UgZml4LCBhbmQNCj4gc2VuZCB1cyB0aGUgY29y
cmVjdGx5IGZvcm1hdHRlZCB0YWcgPyBUaGlzIHdpbGwgYXZvaWQgdGhlIG5lZWQgb2YgYSByZXNl
bmQuDQo+IA0KPiBOaWNvbGFzDQoNCg0KVGhhbmtzIGZvciB5b3VyIGFkdmljZS4NCg0KDQpGaXhl
czogNDVkMWEyYjkzMjc3ICgibWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogQWRkIHZwdWFwaSBs
YXllciIpDQoNCg0KDQpUaGFua3MNCg0KDQo+IA0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LWh3LmMgfCAyICstDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtaHcu
Yw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS1o
dy5jDQo+ID4gaW5kZXggYzhhOTA1OTk0MTA5Li5kOTRjZjg0YzNlZTUgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS1ody5jDQo+
ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS1o
dy5jDQo+ID4gQEAgLTU4NSw3ICs1ODUsNyBAQCBpbnQgd2F2ZTVfdnB1X2J1aWxkX3VwX2RlY19w
YXJhbShzdHJ1Y3QgdnB1X2luc3RhbmNlDQo+ICppbnN0LA0KPiA+ICAJCXZwdV93cml0ZV9yZWco
aW5zdC0+ZGV2LCBXNV9DTURfTlVNX0NRX0RFUFRIX00xLA0KPiA+ICAJCQkgICAgICBXQVZFNTIx
X0NPTU1BTkRfUVVFVUVfREVQVEggLSAxKTsNCj4gPiAgCX0NCj4gPiAtDQo+ID4gKwl2cHVfd3Jp
dGVfcmVnKGluc3QtPmRldiwgVzVfQ01EX0VSUl9DT05DRUFMLCAwKTsNCj4gPiAgCXJldCA9IHNl
bmRfZmlybXdhcmVfY29tbWFuZChpbnN0LCBXNV9DUkVBVEVfSU5TVEFOQ0UsIHRydWUsIE5VTEws
DQo+IE5VTEwpOw0KPiA+ICAJaWYgKHJldCkgew0KPiA+ICAJCXdhdmU1X3ZkaV9mcmVlX2RtYV9t
ZW1vcnkodnB1X2RldiwgJnBfZGVjX2luZm8tPnZiX3dvcmspOw0KDQo=

