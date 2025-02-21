Return-Path: <linux-media+bounces-26548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C09A3EEAE
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 09:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6991F70248A
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 08:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3501E47C2;
	Fri, 21 Feb 2025 08:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="LsANHNdy"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022110.outbound.protection.outlook.com [40.107.43.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BC61FBCBA;
	Fri, 21 Feb 2025 08:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740126566; cv=fail; b=kUfylQ7cSBq3zzA3xnMCGOdx6NLUa4j3mvY9YcGuJr3HzUNUAf8ispHflIt+fegBjY58G5sWaMJmwLnyXEiAwNSJtX+7yP2KnI6rYXJsFBolU3aA7sbURq5g+kGBakDlF6kfyKSe5CCStSuLRSkxqHyBNTLo9DEW3f6l/rZ2Qbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740126566; c=relaxed/simple;
	bh=2bZJwedjQgE2NNggHhSpQZVqRcEsvI8xEqcvPRJ/xGE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eYkcm1YICqQbwIn6baoQ7ascH6juVMvYijV7YMJlCYTxi1oOdP6F/H3c7VIKesxYYDzZ+9K+35D21vblxrWbW4G8SMjZQpcSEvA8uBjyBz1poqhueM2GjhHy0TnorB7wo8eTYzSQ2uFS1CPGbK147KXkwVeMeWd+fJxdtz5w1h8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=LsANHNdy; arc=fail smtp.client-ip=40.107.43.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CT4BOTbmMOinbyAKd6uLGjWPRe29ToiXFNNieA3+j+AMlwuDs02UwHWhON2JEuZq+gMxYQ0U+66KyqJTvCwwlJAGlx68dCv9HWX6nvpnotP17ue1QEo/p2mwKQu2eHu5wQfvRwFsB8hvbQG97w8mW23Zl1vpaoCFzs9wiFfAe298S5iFbxILKADxa0StwI0PmVmh+V91pVH9wM7cyvjrF7Ma7V6VtU1O9mZke+t0Gai6LwveJrgbaRLffjNq3zrhl7b0oOxbzwoplcbixGWafaegWB3IifTjM+RmBLlt2zyS83kC+bJM0wH5ZTezM/T13/F+aTQTPIPpfS4+K5b9Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0hIdEcCYfO8g0nUNziKahOHGSIZ8jJFkuA3+TmTQZY=;
 b=cTL3PkZh5Gh7OPs9i4uxp9XNkk6nawDY1uAUtLSIxBeF2m/6tDz2VZJhIXzDcp6z6Xra9lbyyYdEw8lOkRmrXxsXGDzKV1kNtzHKALfpnMwRxZ9ZUDx+yGByJgGT9I21lTL74RGBOb2NqA7IhvX02JzgBFL+nYEzFKopCltO8lmVcM/wf8Ygm8dItu/1s+5tTjI3W5vzP9zkrFVVbYeESt5BXBy0NP+OIZRM1BnE+OGhSNd7kar39J6Zm1chVDFIQCEcjxphA2FtMMCsyzrvZBfZ7OBBUp0KPvMMpFqQ/dcjq+C7CVJuK0vtJyJpLEJ0C8/TOxL9gbZU7vekDAL96w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0hIdEcCYfO8g0nUNziKahOHGSIZ8jJFkuA3+TmTQZY=;
 b=LsANHNdyMSkNChEKBU0YTUNn2LS6pqJVjxGhvwchlEj1rW/8HKrxJwi+pfnvoID5gCKfAOKd8vhdGrH3P45Q6SzYVviR5cBz3MteullMLa582taqit3GONRMwGE0FAnAfhar062cS5Kl0vWRFXuvxHXIh+UjYF71CHlI2hqpFsY=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SL2P216MB2846.KORP216.PROD.OUTLOOK.COM (2603:1096:101:285::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.17; Fri, 21 Feb 2025 08:29:20 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 08:29:20 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec device
Thread-Topic: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Index:
 AQHbe5s5kWTieORPDUe+7mHQ8+wHLrNAy9aAgAPWD6CAAE9gAIABLNMwgAh/LgCAAS48QIAAIR+AgAGKFtA=
Date: Fri, 21 Feb 2025 08:29:20 +0000
Message-ID:
 <SL2P216MB1246BDC4807D45DD877D5751FBC72@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210090725.4580-4-nas.chung@chipsnmedia.com>
 <cb7937f5-2045-4903-825c-71ed70097efb@kernel.org>
 <SL2P216MB12460EDF6265459D11E2A5A9FBFF2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <20250213-imaginary-shrimp-of-merriment-6ccb6f@krzk-bin>
 <SE1P216MB1242EBEEAA36BE73AD466FB6FBFA2@SE1P216MB1242.KORP216.PROD.OUTLOOK.COM>
 <ec58d467-baa3-4630-bfb0-f09d366a9be9@kernel.org>
 <SL2P216MB1246F270DDE8CC8E21EA1DDCFBC42@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <e3403885-ca21-4e67-b117-f40a7a65418b@kernel.org>
In-Reply-To: <e3403885-ca21-4e67-b117-f40a7a65418b@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SL2P216MB2846:EE_
x-ms-office365-filtering-correlation-id: 599d507e-89fa-4dc3-653d-08dd5251d6e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?HFlb/Qy+gc746dIqYOvtN+g3mAOqFBCXX9Q1QglZG742RQ66twEVxlbloCyi?=
 =?us-ascii?Q?k2G/BkXU25zMmkOmZJ7u9FtE0C+MhAa/qYaLqLUsfnAmxdk35UBy9+v7qyaQ?=
 =?us-ascii?Q?cmW+Kq5wE6KFK45sz53ex1v7usBYepZcxIJ9w3SaDIOVRorVChAEvVO4b6c3?=
 =?us-ascii?Q?wzdAa2TwEAopGQvtmBKhi4kkw2WKL6y7Hh+R0j/S22Urav9Chfw/+G6vlgBv?=
 =?us-ascii?Q?DdaBS4SnRbLMUNzXHgtcsLZn71aN/ts4JHdM32qXn8y/MWia9tenbbvnUh0i?=
 =?us-ascii?Q?Wipr+KzHvU7HUQVLVXRrxgpH7EaLDYqdyshqNjCewo/zLdGKOEUs5o342s5s?=
 =?us-ascii?Q?ykoy06UNX2P+jQhamu8K2PodLgAs7MZZNtVvUDgULd1tHqj6bB+pSly8mNWi?=
 =?us-ascii?Q?NogReRJ2zbaJYH8s3QV2OYPayVNpj3tEuEcrqDFahX2ZkgJMQYGCJZQqzTX6?=
 =?us-ascii?Q?izwxiiZDYNQAuX6lMRKTQJ/uHAZN5Wkt3Jcvm3AtxQZ6g1a3JXRrfqNHbryM?=
 =?us-ascii?Q?F5fT4R7fa7YF8sqj3TCUTy2Vt7/DgFkgUo4R9IbY3+CVjrhEcX8ok7UEzwkf?=
 =?us-ascii?Q?RLDBmrpRFOqjVSiPc8tHoltSC0U+K2e4irRIGPIQU6Xu5ZMyj/McKCmswHwp?=
 =?us-ascii?Q?g1sIvgzr0uaE+wcWK+mU1mxZAbkV4wYh9LRXKt4p1hNMz5LFSkVzrlXqvT2s?=
 =?us-ascii?Q?voH3AuiwPDiRnHasagHSoeUx+SboI4qmHR6sJH6pBzdi3EyUODA3fqQ31rIc?=
 =?us-ascii?Q?z1hTcT3nODVJUfgjbs7aMmNmRuhqj/epwd96EL2fguUjZoDtJFylY1NzAFOo?=
 =?us-ascii?Q?hpRALjLh/1oPpQHha0Ger9FV2hPRpgh7ayGjTYJFGgA28tJw0nkiBeZ6yBgB?=
 =?us-ascii?Q?tHcmp6XISDJSRLcn/MimBPSUbThnEjSHBpbbptIlXO8ffWx9YzCeoksUfF5M?=
 =?us-ascii?Q?jy76rvMjvscZnnJpsuA6spjngDXac3gQL+/PKruMXZYTGuf8+uMUf7xt6QPR?=
 =?us-ascii?Q?dj6MzAAVXFXEOq/A0WNThN2r4r5+YB9XnuV1O3PY8l6Zc82+NCrcfQ2gcX+d?=
 =?us-ascii?Q?POVTuSSpBsRSHYiOgEd6dn5/BcUAi3kzrnrEkZNp1hrWIhZvVndxQWEvuIy6?=
 =?us-ascii?Q?RcTeet800HthS08SY07wnPOYLMVCc5sFcBekCqYUhbfOXj+RuAZoOgniEW5D?=
 =?us-ascii?Q?/S9ijSS8iZhXzppgHtJv9l23LbbsrIb5Q/LmUqLpEMaFrb5s0uhuzTCNwX7/?=
 =?us-ascii?Q?pVJ8ZGBbctuok6mfu26yb4uNYNEZSN9klbwfan/F4sWZ2Ats2UeqPj51N27z?=
 =?us-ascii?Q?Grqj9du7Pc0qBZrZgLeJKuJUQJn5NH+UQOGqfbQuVvWSIDB/+YSED3A2/2aC?=
 =?us-ascii?Q?wWJ5WQylJIr91rR3K1q8Mz8SDxPSYrErR72+tlCi2MJTG3gAgz3WiAbeInkF?=
 =?us-ascii?Q?dBceVSPPjYd5H10r0oL7rPRspI2mZfuG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5BZbmAQa82m7my4x2jHNAx0hqg/RwBnIW0S3vSKj25lTKCt2mwmFvubw/JGX?=
 =?us-ascii?Q?OhTcV/2xsbaJriul7EXVh7s6Pkav/E8aeXtAPgwX+G6LkSr4SV/D+fM73PGh?=
 =?us-ascii?Q?FmNorcwrGEGBk8fMSSTv98XwXrxdlvXW7eJIQkS2WDg1wTWnhU0+tI7yx87K?=
 =?us-ascii?Q?21OGqqgQT+N1RCXsDT31VaWzGBbKp/S2yJ3i5ox/sjyJOfFy4duMEpu09nkV?=
 =?us-ascii?Q?ct/fS+h06mUc5oGNajKvHVctHhCIN3hfNYskuUNUxP5s3nY0WPS+0KcmyLhb?=
 =?us-ascii?Q?jbwekhwBbwQBI40Z3GmPDbOYwB0xcfc3kTfogaDW984bMxO3ycJCZGpCSDzD?=
 =?us-ascii?Q?Vzbf8Ezu2QNpdkZ+vLlH9vTw1WpEGYCWUL0BQAIfxMblJ1MVSPMNHkDKkTb3?=
 =?us-ascii?Q?QGwrfrihkyWp42+96gykRokjcU9zgj7yatjgDflUh2BBUNwRVBcVCIRaeaJ1?=
 =?us-ascii?Q?6KpQCY6GIN9NT9/PZs9RIjutfD0hbOVOegcK0fnzZ9v4DgEB+WKB2534UAd1?=
 =?us-ascii?Q?gFT/I1A18Swfj34bPN8F56z+zBOARKBreCOlzMGFHJLJWp7n8PgHp8qIhl6o?=
 =?us-ascii?Q?g9lXPH9ndUskyRngeQBGyqhF3s1ZubGqKG6CSmrdpSzVIKlaTd092eGZySK0?=
 =?us-ascii?Q?Qe3KSNsL+IiXGQMTAbxpvfSd5iS75Ox55Oe84Fjhf+NBQPIDpTJcF10ryQsx?=
 =?us-ascii?Q?f92+FRjshFoamUehFiEmK+CEQxWRgsqPqFFzEkOZqEWrQcEGEK27sJYkXAuz?=
 =?us-ascii?Q?BKDMlSjoJPOcsMWNzR43cpcRloVfKkMBpr8Yppku2nvoVs/2JK24XdDSLbeK?=
 =?us-ascii?Q?yEoLi28aimBbd6sWkbkvImwbp76pSwd5T8QnaEU1g9vXX0VYKDvJSaWTWKNV?=
 =?us-ascii?Q?q4LMEX4C0vPRo+qfQpCkxvhVjSx0PUywW+B1sGkD/87+oaLdLw97dmBCT/XP?=
 =?us-ascii?Q?CiT9q392SZHgR9hDSaqv0mpY17jSRG89vGacHSgzcPdn31kn31h9nhWVJ8VU?=
 =?us-ascii?Q?s1rsj3yuIlgAWKDDp4vuLoGy7hNeWitFiZj/rTO3wf9tsbgmvZMK3W2mV3zV?=
 =?us-ascii?Q?cZBwV+aYsY8xibk/D3vO0qbZ77k/0ty9ofP988wuNBs3Ep1m4ctpe01jql6w?=
 =?us-ascii?Q?L4CXdORP0k+aqIYBVboUCx6Pqwl+pXQpfIf8Bg7g6lr3CASuBz+rNex/Dbpq?=
 =?us-ascii?Q?n6jzm2JE3biCiZjSkJQbPYP1BrMyke1oGLD1/SrZpgSB91d86zG08PVdmYjk?=
 =?us-ascii?Q?nzmx52SPMQ28fe8+i0wzJ3XwSLpfnKWCTFNqLPjM88ixIVEmdvg2XLw/kvPG?=
 =?us-ascii?Q?A2m7G8JYQ+fe6eLVvjpKWf9yp63kz/MK+8NOLW6p+NGrNeKUyR7UJUrsA5Bt?=
 =?us-ascii?Q?i/0ZFae7TI1d3rPCqviXXCf3wp2tFlsV+t2r11Y7LlV7HcICk0ax1oOyjEr9?=
 =?us-ascii?Q?3wN25/Yx9RWL4Zogz3RnMfLnzcZHjr3vhsuUEGESB+3mYtM8RzOxoeAvwNQ2?=
 =?us-ascii?Q?GOZgbavEnPURyUTIDtbYgP9NQSboBpnuMRxFS2C7aWFRyQmAFiHTB/FsnB1M?=
 =?us-ascii?Q?ka9yHbUjAQ8h84hQIEUz03d+NBE4wEj+Mw/JLtIT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 599d507e-89fa-4dc3-653d-08dd5251d6e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 08:29:20.7613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4HFxjlHvWGpC1yU8FkG0raGQVnU4Xc5z/0I27RC+DgCaK4f/ziSVT/+QiluJ4CW3+OiPKFAvzrKUjDYeLnYuJhspH930I2XH91rydpZ/ZEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2846

Hi, Krzysztof.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Thursday, February 20, 2025 5:32 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl; sebastian.fricke@collabora.com=
;
>robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; linux-
>media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec
>device
>
>On 20/02/2025 08:35, Nas Chung wrote:
>> Hi, Krzysztof.
>>
>>> -----Original Message-----
>>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>> Sent: Wednesday, February 19, 2025 9:32 PM
>>> To: Nas Chung <nas.chung@chipsnmedia.com>
>>> Cc: mchehab@kernel.org; hverkuil@xs4all.nl;
>sebastian.fricke@collabora.com;
>>> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; linux-
>>> media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>>> kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>>> kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>>> lafley.kim <lafley.kim@chipsnmedia.com>
>>> Subject: Re: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec
>>> device
>>>
>>> On 18/02/2025 10:21, Nas Chung wrote:
>>>> For example:
>>>> vpu: video-codec@4c480000 {
>>>>         compatible =3D "nxp,imx95-vpu";
>>>>         reg =3D <0x0 0x4c480000 0x0 0x50000>;
>>>> 	ranges =3D <0x0 0x0 0x4c480000 0x50000>;
>>>>
>>>>         vpuctrl: vpu-ctrl@40000 {
>>>>           compatible =3D "nxp,imx95-vpu-ctrl";
>>>> 	  reg =3D <0x40000 0x10000>;
>>>>         };
>>>>
>>>>         vpucore0: vpu-core@00000 {
>>>>           compatible =3D "nxp,imx95-vpu-core";
>>>>           reg =3D <0x00000 0x10000>;
>>>>         };
>>>>
>>>>         vpucore1: vpu-core@10000 {
>>>>           compatible =3D "nxp,imx95-vpu-core";
>>>>           reg =3D <0x10000 0x10000>;
>>>>         };
>>>>
>>>>         vpucore2: vpu-core@20000 {
>>>>           compatible =3D "nxp,imx95-vpu-core";
>>>>           reg =3D <0x20000 0x10000>;
>>>>         };
>>>>
>>>>         vpucore3: vpu-core@30000 {
>>>>           compatible =3D "nxp,imx95-vpu-core";
>>>
>>> Why do you need compatible here? Could it be anything else?
>>
>> I will update the driver based on the final DT.
>>
>>>
>>>>           reg =3D <0x30000 0x10000>;
>>>
>>> Where is the rest of resources? You created children only for one
>>> resource - address space?
>>
>> Sorry for the confusion.
>> I believe the final example looks like the one below.
>>
>> vpu: video-codec@4c480000 {
>>         compatible =3D "nxp,imx95-vpu";
>>         reg =3D <0x0 0x4c480000 0x0 0x50000>;
>>         ranges =3D <0x0 0x0 0x4c480000 0x50000>;
>>
>>         vpuctrl: vpu-ctrl@40000 {
>>           compatible =3D "nxp,imx95-vpu-ctrl";
>>           reg =3D <0x40000 0x10000>;
>>           clocks =3D <&scmi_clk 115>,
>>                   <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>>           clock-names =3D "vpu", "vpublk_wave";
>>           power-domains =3D <&scmi_devpd 21>, <&scmi_perf 10>;
>>           power-domain-names =3D "vpumix", "vpuperf";
>>           memory-region =3D <&vpu_boot>;
>>           #cooling-cells =3D <2>;
>>           sram =3D <&sram1>;
>>         };
>>
>>         vpucore0: vpu-core@00000 {
>>           compatible =3D "nxp,imx95-vpu-core";
>>           reg =3D <0x00000 0x10000>;
>>           interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
>>           clocks =3D <&scmi_clk 115>,
>>                   <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>
>
>These are the same resources for every block so for entire device. Why
>they are no in top level node?
>
>>           clock-names =3D "vpu", "vpublk_wave";
>>           power-domains =3D <&scmi_devpd 21>;
>
>Same here
>
>Everything else also looks duplicated... All my previous comments - from
>first email - stand. Don't design DT to match your Linu driver structure.

I agree with you. Thanks again for your feedback.

I've moved the shared resources to the parent node while keeping the
independent resources within their respective child nodes, as shown below.

vpu: video-codec@4c480000 {
        compatible =3D "nxp,imx95-vpu";
        reg =3D <0x0 0x4c480000 0x0 0x50000>;
        ranges =3D <0x0 0x0 0x4c480000 0x50000>;
        clocks =3D <&scmi_clk IMX95_CLK_VPU>,
                  <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
        clock-names =3D "vpu", "vpublk_wave";
        power-domains =3D <&scmi_devpd IMX95_PD_VPU>;

        vpucore0: vpu-core@00000 {
          compatible =3D "nxp,imx95-vpu-core";
          reg =3D <0x00000 0x10000>;
          interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
        };

        vpucore1: vpu-core@10000 {
          compatible =3D "nxp,imx95-vpu-core";
          reg =3D <0x10000 0x10000>;
          interrupts =3D <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
        };

        vpucore2: vpu-core@20000 {
          compatible =3D "nxp,imx95-vpu-core";
          reg =3D <0x20000 0x10000>;
          interrupts =3D <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
        };

        vpucore3: vpu-core@30000 {
          compatible =3D "nxp,imx95-vpu-core";
          reg =3D <0x30000 0x10000>;
          interrupts =3D <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
        };

        vpuctrl: vpu-ctrl@40000 {
          compatible =3D "nxp,imx95-vpu-ctrl";
          reg =3D <0x40000 0x10000>;
          power-domains =3D <&scmi_perf IMX95_PERF_VPU>;
          memory-region =3D <&vpu_boot>;
          #cooling-cells =3D <2>;
          sram =3D <&sram1>;
        };
      };

Thanks.
Nas.

>
>Best regards,
>Krzysztof

