Return-Path: <linux-media+bounces-56871-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HknIFGBwmlneQQAu9opvQ
	(envelope-from <linux-media+bounces-56871-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:19:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDA23080E4
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 086173140C58
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 12:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98F93EE1E8;
	Tue, 24 Mar 2026 12:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HWMJ3rqq"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011006.outbound.protection.outlook.com [40.107.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDAB3EDACE;
	Tue, 24 Mar 2026 12:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354362; cv=fail; b=PLZniiP1Idq81vjwH3SGOCJ7C29CsyELu8CluOB6nOPtM3GGHPKAPzaIM4cwqeXSRj7lZy/Kblwt1ty1E6Jfb9Zvb3SLPM7eliiR2r7WnuNNK4OU3jvzMo9LwJ9aiUx6WTVTY2oVd3lUbM+J2hVAG0JKwpBBxfmsblTBB9V0grE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354362; c=relaxed/simple;
	bh=Atv6eFwtRL59T3YyFqDJ/Mz+hcKewi4QE9chuAuE2KY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EGF1Ex3+QDPvS9AaV5qXq5NMZmYV+qt9N2P+39GD808WkCGfXmZLSi8vpXCz3ygeqwPMi7xkFWGnMXD238kleP4l1QNgzf3C901pwV5BoyBlwplaau/dtw4UEI9I7JW0PBvZ9XmVDRzrSJwxZfVknjrm8P1yLYyypQFDpfZBvTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HWMJ3rqq; arc=fail smtp.client-ip=40.107.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdCFMEoaF/WGYW11XZ96/Adt/yKUwjAYj7dh4DP5mfX8DvmRmxEmh1ePAyCMlatr+wM6E2Aa16c7Xa1KCDvRBnYkKL/zQOYV94IdKTHLxMpA0cvbnserY5fAvrR3hRmleBli3BkH1kyBb9d+4pTsZZRYg8asTzekOqzgGiGvGPm7EAjRNrzE5vVmJC+g45VoiXG0zuF5FWJuA6YBOsJaJqEd8qLfBq2VCWIm+YNU7ehWDjAOosWLa+D9PDzbntRgL9PMUiioxjpQpOODbUUnS9YKqJ+21KLLDv7tWEJQ6vaD2LRgdOX2Xk3mfQTJ8+QmH9npcOrtidtZmNJWdAUoog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Atv6eFwtRL59T3YyFqDJ/Mz+hcKewi4QE9chuAuE2KY=;
 b=MCQ0apNQLVgPOS/Q2XMvS/nyjpzDwxiHhcWm6sbOfgDw8XBylwTt0kyqqqbQuqXlMqVZC9BJkdFRIC3HVsu/mNZJV0SLD55jULEr6LB02GnZ8ixRV88/0ObRKyqv16rz/JrNiVB2ny2OFYwwNsY1hQ4DFNw+qIbeUBAi13sAwz4iHnrbFpsS1UAK7xbIOxeB4xtHQBAcByZuQjujiaF1O4/9340oOrGZC8G+1uHlGKGyGBgACC8Ch4v9li7nipsUF+mZ0xag74wZsnxsQQT4uLEoG1CgWzf3oJlYUpwLFhMK7dHOyirbpa5PVkvAYSgrrzyG13N90EpEgCGQsR4R8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Atv6eFwtRL59T3YyFqDJ/Mz+hcKewi4QE9chuAuE2KY=;
 b=HWMJ3rqqhV/gwM/xqe/lO4wp9qdvSL7QtuUbwZXYzB/b7z2mtnEyF0t1PAq3BX3s9puVONHvhd4B/ecLXmbRbQmCWEH8rR2/9O9S+BNpCFh0fOe/Nbth6Qls7hMolpo2O/kUJ/+8tAzhswaijK0frPJ5UrqGvRxk60wqKsIGm8zyZHbUCkQPStUt7FE9KwvB4Yoom4iNhLqFmZfCaZs72S+C086AJ3h4bQdjJyi14cYL2nTx9/khNZKRBCSyxIMllVgQwKUtV3FNpoj37z9YKSwJMsMaKWc89EG9WDvugyWU7i4raByhz7f8Hu2i3Kju+5EhUBz7KQIKC1zRMAJ7Ug==
Received: from PAXPR04MB9424.eurprd04.prod.outlook.com (2603:10a6:102:2b2::13)
 by DB9PR04MB8267.eurprd04.prod.outlook.com (2603:10a6:10:24b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:12:35 +0000
Received: from PAXPR04MB9424.eurprd04.prod.outlook.com
 ([fe80::671d:216f:d493:44ce]) by PAXPR04MB9424.eurprd04.prod.outlook.com
 ([fe80::671d:216f:d493:44ce%4]) with mapi id 15.20.9723.022; Tue, 24 Mar 2026
 12:12:24 +0000
From: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
CC: Oded Gabbay <ogabbay@kernel.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<frank.li@nxp.com>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
	<christian.koenig@amd.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, Jiwei Fu <jiwei.fu@nxp.com>, Forrest Shi
	<xuelin.shi@nxp.com>, Alexandru Iulian Taran <alexandru.taran@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: RE: [PATCH v2 0/9] accel: New driver for NXP's Neutron NPU
Thread-Topic: [PATCH v2 0/9] accel: New driver for NXP's Neutron NPU
Thread-Index: AQHcrW0Sx9bFLIZMFE+2EPv3Y6VaP7W5UsoAgARg2/A=
Date: Tue, 24 Mar 2026 12:12:24 +0000
Message-ID:
 <PAXPR04MB9424214A1AA43BD0C36653E89448A@PAXPR04MB9424.eurprd04.prod.outlook.com>
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
 <CAAObsKDAzfib86rXqt9FjXV68yRkBzmijcyR+x=1MsPYd=MQWQ@mail.gmail.com>
In-Reply-To:
 <CAAObsKDAzfib86rXqt9FjXV68yRkBzmijcyR+x=1MsPYd=MQWQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9424:EE_|DB9PR04MB8267:EE_
x-ms-office365-filtering-correlation-id: 0b8b8777-2521-4749-7e9b-08de899e9baf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 MeoCeGcUI+8N228ZTzCCUFPXt+4t71FTQPcfBXhsthma3csc8q1JDpc5Ck24qFhM7/+OQEUmrOVWI/Omuys2LRlkOYqKGgqmB/ypD9SCO0eFgtAs2zD7EmDxDb19QL7g+PTkwQpJ9Trtc6XtQetzBsz2npM7Zd2aqnmZjbOzbConYD7LEM2IOm6tjh/4M46ImafHYrTesn1oXo4+o/h3CFOMysHFovhSOPceq+YC4m2zDjSzWnUOnqxmDyCUhf1b9Aw/+njM+/ZdnikqmMM7CEfzH/zGgSDDlwKdkk0nMFXTD4oYrkDLZnlJgnrlbULPagwQ3eZQRaMEju2o4S0fzDbrPEgnzTsudd/GQMBXICb/0BtXzzjE8zC9eAW/sfhxerxOf1zR1IUS93oSge4Ismt0O0wNSN74V6tmVenppnXQ52u1mgkiy8tleXMkkYs+dwlXxYa5NnWMK3bdKALCzAwh9RVkCPjvjvlTGJ9Pdbs+RMTDc2Tn7IT5XScan2f1R8Jos9HzolXaSf784TgqfsZwFaEZKETfmv2rr+Q7Y+3c22UIPZKRfF7wbUaffQOJrxuerYYdJTEwtMOvlbUIbNf7JgKXiI9h1KsbC4fIK7K24P4ozJl6+9RTBUmjrWJ1j0g2oqGfY0TZ/o1+TViCQGEJb65h14MD/Pi4f6I/iQuDph7/HlThEHY/zaaJiyTqB6Zgy2X//2ty3ze9YEwNs4r7bTiDqSzOmn98swfPoSoD19HT6ZGzolUBIMoegJNLBIvZHlstSzEl33CE6lXoIeNxxTanQpbsdSlIF9ecGzak5mtDAtG0ICsHhXmt6wH+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9424.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M2l0UTNHVGo1dFVTMVoveGdjTmwzVWFDZit5RlgyRysvbnpMS21EUWttZHJz?=
 =?utf-8?B?a2RFUlhSNUQreG5kN1ZxVWxuaVpMOVplb0c3amVQNDZKZktkbWpLTnNRd050?=
 =?utf-8?B?NFdIbDhTMjZPaG4wT1R6S1pmallRc1k2dVZTWW0vOFhCdS8yM3FTWHNUR040?=
 =?utf-8?B?RzlyMXh1eGs3NG1udkh4KzlKcWdKZmR4eDVFOE9xNUg3RXY2SHBxbW14ckdK?=
 =?utf-8?B?Wm9QRGFsK0ZPY2E3UDJvNktrQlZDOVplWDZCWDhsVnMvM0hQdmZYS05XeXUz?=
 =?utf-8?B?SkRHNjE2T3lJb2FSekRucVdRRWc3bmFBUTUwd3NYNjFsK1NCaXNLdnQ4bk42?=
 =?utf-8?B?S280eVl1ckFXcGtpZ0haWFRFYytCS1Y5Vlo2VWdTZFo2aUY3ZmtHaFhZMFky?=
 =?utf-8?B?QTdoTURKMDVGV2Z1a3pkc2FKU1Z6TmdPY0hPZUkwMU4vOEdxRjFaK1ZvTnFJ?=
 =?utf-8?B?aG84TGp1M00rVmUxY0VvT2pmRmtsbWpXV2JGbThoNTkvWnZpOEl5ZzNFbmY5?=
 =?utf-8?B?Vys5aUVxYkZGcE1Pdk52TkhRbHJ5RXBVMmNHZEJaL0ozRDRkYVpoaGFQbUxN?=
 =?utf-8?B?TThidmt4c3F5ZE45ekM2bklSV1diQTZxeStTUCtHME1GMFhQUFlIUlp1Z2c4?=
 =?utf-8?B?RzRZeUxQRTRPdzFHalEwa2UxbmIwdWNzTVRKRW9wNHlRRjBIUWgrMWMxSlUv?=
 =?utf-8?B?dWFjQmFaRUFhZzFQM2MzRFYrWkJBSG9jZnNIaDIzY1VMQ09ER3E2a1h1YVU4?=
 =?utf-8?B?UlNZUVRLTkpPclpzSVBYa0F0VXpBc1MydEtCY3lYRFBPMzJQUEZYZ1VHWjkw?=
 =?utf-8?B?QkJIa2xpcHpqVlRTbWd4NU11NlZGVFo1WDB0NFowYkNzdEdXdW5UVEJYbWh5?=
 =?utf-8?B?TWV2Vi9MY2dIVGJ0bWsxZEpDNE11dTNmZzdFQ3NZTyt2N3g0SmxiTS9rWU5Z?=
 =?utf-8?B?dVJXVjVhS2NUWWZMcFZ0REF5c3FlTWhpRmt3RCs5Yy81T2xNWWlyVEdvOEky?=
 =?utf-8?B?cVBZNitFS1dGYkxyQjh6ZThVZU82a1BNQ08zcVpLQUs5dEY2aXBNZXdPWFhz?=
 =?utf-8?B?eVBNN0JPOXI4VkNJNzZIanlrUXpzVXBCQ3Jkc1NVTWdiYyt5UVo4di80L245?=
 =?utf-8?B?RlQyTFlZU1paQTMrK01tVjI0NHo0bW54WFp2UFZHaUkrRW80SE96VEQ0OURn?=
 =?utf-8?B?bXVnY0VNeW1YSmtXa2U0MlVMN1I0THRBNkFpOUdOS25rVEUzT3E5Y0FEK0h5?=
 =?utf-8?B?cHFYU1hiZThVRjhLU0duOUxlYU5Eai9mL1AwNjA5c1EwVnk0enZHeHZuZkhy?=
 =?utf-8?B?RUE3RVFyWVFCOE4zUGFvNlV4aUNLNzNvUGY1SlFNWkcrcG5rU2c3ek1RUTQ1?=
 =?utf-8?B?QUpSQnpaOWZEMExPMHNOaVBveHhKTnhJcHRyTE9XbHFWaXJNQWE5MS9kMXNZ?=
 =?utf-8?B?dkNNODNtVGtReHhxbXZEV2lLcWorT2h4ZnZYdzJ0UXhnRkF2d0F4V21QZG9L?=
 =?utf-8?B?WGRXaVlwdkVMQjhqQlFWcVF3aklObEp5eE5zTm5KOS8wSFVIQXg1TXFvWFVy?=
 =?utf-8?B?RmVWSlhQZlNCSjRzWnNRVWVEZ295OW84WnZoU3NhR1REaWxlV282RFE1dUNO?=
 =?utf-8?B?Vzd6NkE0MWFvRmM5K2NFUGdoT1diWFY0QWthTmxpclAwdGUyV2xKTEtOdjgr?=
 =?utf-8?B?VmsxWXJQN3F1bUE5dythRUJ0ZTJOcGFVTnR2aUdZQzFGd1k2Nm1ld2lWaGhT?=
 =?utf-8?B?c1kwT3lRZFIwTWdUQ0VFTmtWSXlxRDRiUUZpSXRCREs0ZmJKbUFKeEMvVzBX?=
 =?utf-8?B?a2NYMXgyeE9xSnozVFFpVW5mM0l0SDdnSXk1d1lLSk81RjlRUjRuYTh4RUFQ?=
 =?utf-8?B?NnVjSnZvSEcwRGh4UFBHRlQ3RjhNR2Z0N0FjeGlSSzVQd3hFNTF1K0JFRmNi?=
 =?utf-8?B?bHhad0FPVE9uWTlBdVNvVGpmSUpydkMyRk9pNFNwMG5CRjA3aXg2UGJQT1JE?=
 =?utf-8?B?MFYvMkZHSUVNUURpb0o3MlIrVmtBRlhDRmNlUXhEL004RUllNGNleXhoRHRv?=
 =?utf-8?B?Sk5tYVpIaHRmSFlZSDk0R1BKRTFkRUR0a2pLbVVMbTFBQzZwV3pwSEI4aDZw?=
 =?utf-8?B?QVlJU0E5Z01Nb3BxcnJLYWZSZmtiVnVIcDNlbWlkbllWdXA5OWkwVTZwNVVH?=
 =?utf-8?B?QmZTRnMyV0NtcTZhcWh3QTFBNlNYV0JkM1U2dytuajNFdHdrWDNzV1F6OXdO?=
 =?utf-8?B?SlcyMjN3S2NyTENLTWtXc1h6UHJPenNHSjVYdWx2aXNTbk5tYnpmbGE3QU1Z?=
 =?utf-8?B?ZWdheitJTS9KZUppaHFQeEpTQjdZSzJpQnR0bktZekNWZGkrVCs5dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9424.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8b8777-2521-4749-7e9b-08de899e9baf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 12:12:24.2609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kRZmFoANN0zv4jQ+23Umzy3FvUnpxEdbJyAvDqcrsE2+Gy5pt0s1s9612ruBBVAKi8VhXjm5fGvARkYyG2qepRddKMcU0Snxtyr5pMFPlns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8267
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56871-lists,linux-media=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.984];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 1FDA23080E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU2F0dXJkYXksIE1hcmNoIDIxLCAyMDI2IGF0IDc6MTkgUE0sIFRvbWV1IFZpem9zbyB3cm90
ZToNCj4gDQo+IEhpIElvYW5hLA0KPiANCj4gTG9va3MgbGlrZSB0aGUgdXNlcnNwYWNlIHBvcnRp
b24gb2YgdGhlIGRyaXZlciBpcyBjbG9zZWQgc291cmNlIA0KPiAobGliTmV1dHJvbkRyaXZlci5z
byk/DQo+IA0KPiBodHRwczovL2dpdGh1Yi5jb20vbnhwLWlteC90ZmxpdGUtbmV1dHJvbi1kZWxl
Z2F0ZS9ibG9iL2xmLTYuMTIuNDlfMi4yDQo+IC4wL0NNYWtlTGlzdHMudHh0DQoNCkhpIFRvbWV1
LA0KDQpZZXMsIGl0J3MgY2xvc2VkIGZvciBub3cuIFdlIGRvIHBsYW4gdG8gcHVibGlzaCB0aGUg
c291cmNlIGNvZGUNCm9uIGdpdGh1YiwgYnV0IEkgYmVsaWV2ZSB0aGF0J3Mgc3RpbGwgYSBmZXcg
bW9udGhzIGF3YXkuDQoNClRoYW5rcywNCklvYW5hDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBU
b21ldQ0KPiANCj4gT24gRnJpLCBNYXIgNiwgMjAyNiBhdCAyOjI34oCvUE0gSW9hbmEgQ2lvY29p
LVJhZHVsZXNjdQ0KPiA8cnV4YW5kcmEucmFkdWxlc2N1QG54cC5jb20+IHdyb3RlOg0KPiA+DQo+
ID4gSW50cm9kdWNlIGEgbmV3IGFjY2VsIGRyaXZlciBmb3IgdGhlIE5ldXRyb24gTmV1cmFsIFBy
b2Nlc3NpbmcgVW5pdA0KPiA+IChOUFUpLCBhbG9uZyB3aXRoIGFzc29jaWF0ZWQgZHQtYmluZGlu
Z3MgYW5kIERUUyBub2RlLg0KPiA+DQo+ID4gVGhlIGZpcnN0IHBhdGNoIGV4dGVuZHMgdGhlIEdF
TSBETUEgaGVscGVyIEFQSXMgdG8gYWxsb3cgYmlkaXJlY3Rpb25hbA0KPiA+IG1hcHBpbmcgb2Yg
bm9uLWNvaGVyZW50IERNQSBidWZmZXJzLiBXaGlsZSBub3QgcGFydCBvZiB0aGUgTmV1dHJvbg0K
PiA+IGRyaXZlciwgaXQncyBhIHByZXJlcXVpc2l0ZSBhbGxvd2luZyB1cyB0byB1c2UgdGhlIEdF
TSBETUEgaGVscGVyLg0KPiA+DQo+ID4gTmV1dHJvbiBpcyBhIE5ldXJhbCBQcm9jZXNzaW5nIFVu
aXQgZnJvbSBOWFAsIHByb3ZpZGluZyBtYWNoaW5lDQo+ID4gbGVhcm5pbmcgKE1MKSBhY2NlbGVy
YXRpb24gZm9yIGVkZ2UgQUkgYXBwbGljYXRpb25zLiBOZXV0cm9uIGlzDQo+ID4gaW50ZWdyYXRl
ZCBvbiBOWFAgU29DcyBzdWNoIGFzIHRoZSBpLk1YOTUuDQo+ID4NCj4gPiBUaGUgTlBVIGNvbnNp
c3RzIG9mIHRoZSBmb2xsb3dpbmc6DQo+ID4gLSBSSVNDLVYgY29yZSBydW5uaW5nIGEgcHJvcHJp
ZXRhcnkgZmlybXdhcmUNCj4gPiAtIE9uZSBvciBtb3JlIE5ldXRyb24gY29yZXMsIHJlcHJlc2Vu
dGluZyB0aGUgbWFpbiBjb21wdXRhdGlvbg0KPiA+ICAgZW5naW5lIHBlcmZvcm1pbmcgTUwgb3Bl
cmF0aW9ucw0KPiA+IC0gRGVkaWNhdGVkIGZhc3QgbWVtb3J5IChUQ00pDQo+ID4gLSBETUEgZW5n
aW5lIHRoYXQgaGFuZGxlcyBkYXRhIHRyYW5zZmVycyBiZXR3ZWVuIEREUiBhbmQgVENNDQo+ID4N
Cj4gPiBUaGUgZmlybXdhcmUgaXMgY2xvc2VkIHNvdXJjZSBhbmQgZGlzdHJpYnV0ZWQgYXMgYSBi
aW5hcnkgaGVyZSBbMV0uDQo+ID4NCj4gPiBUaGUgTmV1dHJvbiBzb2Z0d2FyZSBzdGFjayBhbHNv
IGNvbnRhaW5zIGEgdXNlcnNwYWNlIGxpYnJhcnkgWzFdIGFuZCBhDQo+ID4gTGl0ZVJUIGN1c3Rv
bSBkZWxlZ2F0ZSBbMl0gdGhhdCBhbGxvdyBpbnRlZ3JhdGlvbiB3aXRoIHN0YW5kYXJkIExpdGVS
VA0KPiA+IHRvb2xzLg0KPiA+DQo+ID4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9ueHAtdXBzdHJl
YW0vbmV1dHJvbi90cmVlL3Vwc3RyZWFtDQo+ID4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9ueHAt
aW14L3RmbGl0ZS1uZXV0cm9uLWRlbGVnYXRlDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBJb2Fu
YSBDaW9jb2ktUmFkdWxlc2N1IDxydXhhbmRyYS5yYWR1bGVzY3VAbnhwLmNvbT4NCj4gPiAtLS0N
Cj4gPiBDaGFuZ2VzIGluIHYyOg0KPiA+IC0gcmViYXNlIG9uIG5ld2VyIGRybS1taXNjLW5leHQN
Cj4gPiAtIGR0IGJpbmRpbmdzOiBjbG9jayBmaXhlcyBhbmQgcmVuYW1lcw0KPiA+IC0gdXBkYXRl
IERUUyB0byBtYXRjaCBuZXcgbmFtZXMNCj4gPiAtIHJlbW92ZSB1bm5lY2Vzc2FyeSBmaWVsZHMg
ZnJvbSBuZXV0cm9uX2pvYiBzdHJ1Y3R1cmUNCj4gPiAtIGZpeCB1c2Ugb2YgdW5pbml0aWFsaXpl
ZCB2YXJpYWJsZQ0KPiA+DQo+ID4gLSBMaW5rIHRvIHYxOg0KPiA+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyNjAyMjYtbmV1dHJvbi12MS0wLTQ2ZWNjYjNiYjUwYUBueHAuY29tDQo+ID4N
Cj4gPiAtLS0NCj4gPiBJb2FuYSBDaW9jb2ktUmFkdWxlc2N1ICg5KToNCj4gPiAgICAgICBkcm0v
Z2VtLWRtYTogQWRkIGZsYWcgZm9yIGJpZGlyZWN0aW9uYWwgbWFwcGluZyBvZiBub24tY29oZXJl
bnQgR0VNDQo+IERNQSBidWZmZXJzDQo+ID4gICAgICAgYWNjZWwvbmV1dHJvbjogQWRkIGRvY3Vt
ZW50YXRpb24gZm9yIE5YUCBOZXV0cm9uIGFjY2VsZXJhdG9yIGRyaXZlcg0KPiA+ICAgICAgIGR0
LWJpbmRpbmdzOiBucHU6IEFkZCBOWFAgTmV1dHJvbg0KPiA+ICAgICAgIGFjY2VsL25ldXRyb246
IEFkZCBkcml2ZXIgZm9yIE5YUCBOZXV0cm9uIE5QVQ0KPiA+ICAgICAgIGFjY2VsL25ldXRyb246
IEFkZCBHRU0gYnVmZmVyIG9iamVjdCBzdXBwb3J0DQo+ID4gICAgICAgYWNjZWwvbmV1dHJvbjog
QWRkIG1haWxib3ggc3VwcG9ydA0KPiA+ICAgICAgIGFjY2VsL25ldXRyb246IEFkZCBqb2Igc3Vi
bWlzc2lvbiBJT0NUTA0KPiA+ICAgICAgIGFjY2VsL25ldXRyb246IEFkZCBsb2dnaW5nIHN1cHBv
cnQNCj4gPiAgICAgICBhcm02NDogZHRzOiBpbXg5NTogQWRkIE5ldXRyb24gbm9kZQ0KPiA+DQo+
ID4gIERvY3VtZW50YXRpb24vYWNjZWwvaW5kZXgucnN0ICAgICAgICAgICAgICAgICAgICAgIHwg
ICAxICsNCj4gPiAgRG9jdW1lbnRhdGlvbi9hY2NlbC9uZXV0cm9uL2luZGV4LnJzdCAgICAgICAg
ICAgICAgfCAgMTIgKw0KPiA+ICBEb2N1bWVudGF0aW9uL2FjY2VsL25ldXRyb24vbmV1dHJvbi5y
c3QgICAgICAgICAgICB8IDEzMSArKysrKysrKw0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9ucHUvbnhwLGlteDk1LW5ldXRyb24ueWFtbCB8ICA5NiArKysrKysNCj4gPiAgTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTAgKw0KPiA+ICBh
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5NS5kdHNpICAgICAgICAgICB8ICAyOCAr
Kw0KPiA+ICBkcml2ZXJzL2FjY2VsL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArDQo+ID4gIGRyaXZlcnMvYWNjZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAzICstDQo+ID4gIGRyaXZlcnMvYWNjZWwvbmV1dHJvbi9LY29uZmlnICAg
ICAgICAgICAgICAgICAgICAgIHwgIDE2ICsNCj4gPiAgZHJpdmVycy9hY2NlbC9uZXV0cm9uL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgMTIgKw0KPiA+ICBkcml2ZXJzL2FjY2VsL25l
dXRyb24vbmV1dHJvbl9kZWJ1Z2ZzLmMgICAgICAgICAgICB8ICAzNCArKw0KPiA+ICBkcml2ZXJz
L2FjY2VsL25ldXRyb24vbmV1dHJvbl9kZWJ1Z2ZzLmggICAgICAgICAgICB8ICAxNSArDQo+ID4g
IGRyaXZlcnMvYWNjZWwvbmV1dHJvbi9uZXV0cm9uX2RldmljZS5jICAgICAgICAgICAgIHwgMjM5
ICsrKysrKysrKysrKysNCj4gPiAgZHJpdmVycy9hY2NlbC9uZXV0cm9uL25ldXRyb25fZGV2aWNl
LmggICAgICAgICAgICAgfCAxNTUgKysrKysrKysrDQo+ID4gIGRyaXZlcnMvYWNjZWwvbmV1dHJv
bi9uZXV0cm9uX2RyaXZlci5jICAgICAgICAgICAgIHwgMjYyICsrKysrKysrKysrKysrKw0KPiA+
ICBkcml2ZXJzL2FjY2VsL25ldXRyb24vbmV1dHJvbl9kcml2ZXIuaCAgICAgICAgICAgICB8ICAx
NiArDQo+ID4gIGRyaXZlcnMvYWNjZWwvbmV1dHJvbi9uZXV0cm9uX2dlbS5jICAgICAgICAgICAg
ICAgIHwgMTE2ICsrKysrKysNCj4gPiAgZHJpdmVycy9hY2NlbC9uZXV0cm9uL25ldXRyb25fZ2Vt
LmggICAgICAgICAgICAgICAgfCAgMTQgKw0KPiA+ICBkcml2ZXJzL2FjY2VsL25ldXRyb24vbmV1
dHJvbl9qb2IuYyAgICAgICAgICAgICAgICB8IDM3Mg0KPiArKysrKysrKysrKysrKysrKysrKysN
Cj4gPiAgZHJpdmVycy9hY2NlbC9uZXV0cm9uL25ldXRyb25fam9iLmggICAgICAgICAgICAgICAg
fCAgNDMgKysrDQo+ID4gIGRyaXZlcnMvYWNjZWwvbmV1dHJvbi9uZXV0cm9uX21haWxib3guYyAg
ICAgICAgICAgIHwgIDQ3ICsrKw0KPiA+ICBkcml2ZXJzL2FjY2VsL25ldXRyb24vbmV1dHJvbl9t
YWlsYm94LmggICAgICAgICAgICB8ICA0MiArKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW1fZG1hX2hlbHBlci5jICAgICAgICAgICAgICAgfCAgIDYgKy0NCj4gPiAgaW5jbHVkZS9kcm0v
ZHJtX2dlbV9kbWFfaGVscGVyLmggICAgICAgICAgICAgICAgICAgfCAgIDMgKw0KPiA+ICBpbmNs
dWRlL3VhcGkvZHJtL25ldXRyb25fYWNjZWwuaCAgICAgICAgICAgICAgICAgICB8IDEzMCArKysr
KysrDQo+ID4gIDI1IGZpbGVzIGNoYW5nZWQsIDE4MDEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkNCj4gPiAtLS0NCj4gPiBiYXNlLWNvbW1pdDogNjcxNjEwMWFlNDI5NDllOThhZDRiOWU3
MWVlYmEwOGMwNTViZTQxMA0KPiA+IGNoYW5nZS1pZDogMjAyNjAyMjYtbmV1dHJvbi1jNDM1ZTM5
ZDE2N2YNCj4gPg0KPiA+IEJlc3QgcmVnYXJkcywNCj4gPiAtLQ0KPiA+IElvYW5hIENpb2NvaS1S
YWR1bGVzY3UgPHJ1eGFuZHJhLnJhZHVsZXNjdUBueHAuY29tPg0KPiA+DQo=

