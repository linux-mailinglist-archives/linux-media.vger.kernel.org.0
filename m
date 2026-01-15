Return-Path: <linux-media+bounces-50759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB7BD23B2C
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 10:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B238D301C369
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 09:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF7235F8B3;
	Thu, 15 Jan 2026 09:49:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2138.outbound.protection.partner.outlook.cn [139.219.146.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685A435EDC8;
	Thu, 15 Jan 2026 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768470566; cv=fail; b=GSZYB7GjhpXj+EDjq9GT96tRWNSL3rkP39AcLbPiOVUP8OL1fPaEujIm+y+S0FTHZKtTl3geEotg9RLJ8AAJ1U14YoMLLqEh/0LjmP2mIkyF6Ed+EqEcnARUvoPUPVUnW7bpfBKp6Pq7AJal4YrHhMOboVhFILRPa//MyYI1kcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768470566; c=relaxed/simple;
	bh=RQD/j+IeJRuBYYgqy/oEiuqxDLA5jsZQvesQ/n1CV7c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FBwBsOqfcIBRdfsigKj2NHxwONh+3ru5P42hg9EDT3ay/fTVnudcgvbTOsj3DIIOMDq4qYH2rQOsBcaNl1v6S3aOzc634GcycBDbMWlUFd1oy+TUvU8GnsXHPEYrhwpsPOno3LFXd0WkHoU7N5EiRHzkZNxOct0Pc2vkeePvrtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4SNLyH4ChGC42XmQipeN3DdNkFSPjVIOCtj0szYTpzJvu+1ElDmiHfJCgs5juoh9Hfl+r3qoObZocXnzRT+u68vh8oT8VPVpqrPosP9QIWbIzFl8WzDik8VHnQ7ubWVW0oClvH6ygcO6abL+FPAyYaZvmHuOQ6h6CWoii8eY1/J9MS2ldcgnR9HNKOQiwT42If8fmqQikFml7zfEiUOw4nURcDL7VLYPYwLk02BhkUJeiNI7iMCXuRTt0FuLGjt5xZKYtpdZzVuJ0TjjctqB8L1xO6yq9Z1x6DN4yB5gZgJUEuo6//pMy63fGFplVjrHaSbQ9C71w0fOEXIPKp8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQD/j+IeJRuBYYgqy/oEiuqxDLA5jsZQvesQ/n1CV7c=;
 b=DRQ4LaI1j3Nhz+RL9G9ypHWyhwj+MV+5feY7pk36wMzmlBGjSftVE4lVI/g3mluSIf3rPK4zzz2sEkS3unAHLs0OscVPi1FqQYYCmhayeaD/5NPpIgKVxGyW0L/YhPARVGWCkGrqnMQYW3zYx/9le22fAQFHpEkiHov4IA6eStaJCs62qDNT39b6/bhugHoLvOs1mBhk7kVT4KrbviUOmFS524t6+K37u8Q/AC2vdy1XiX5KU71Xqh5EosSU5zKKaEOi6Yey47R5/Vt6FL5+RQdAf43L7TLNVIqGereQw138PcL81tRgmRhbW9ADcaMKmGyl9tfjMuO7KQa7PxfVTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1154.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.20; Thu, 15 Jan
 2026 08:16:19 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::678:a5f4:7eeb:cf5]) by ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::678:a5f4:7eeb:cf5%6]) with mapi id 15.20.9456.017; Thu, 15 Jan 2026
 08:16:19 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rishikesh Donadkar
	<r-donadkar@ti.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: [PATCH 2/2] media: staging: Drop starfive-camss from staging
Thread-Topic: [PATCH 2/2] media: staging: Drop starfive-camss from staging
Thread-Index: AQHche5X/8ov95Mu+UKHiRe0cLj4mLVS4pTQ
Date: Thu, 15 Jan 2026 08:16:19 +0000
Message-ID:
 <ZQ4PR01MB1202BC2C6FF3E6EC418820E5F28C2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260115-drop-starfive-camss-v1-0-27550e7a9815@ideasonboard.com>
 <20260115-drop-starfive-camss-v1-2-27550e7a9815@ideasonboard.com>
In-Reply-To: <20260115-drop-starfive-camss-v1-2-27550e7a9815@ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1154:EE_
x-ms-office365-filtering-correlation-id: 2660c66a-d71c-41d0-2558-08de540e5cb3
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|7416014|38070700021;
x-microsoft-antispam-message-info:
 E6PXp/oxEnKk4O3pgvNbz8g+4joHK9CTxUAv6Y+rsoihp9j6g4jguZArb4PgcxriHPjGbX2k0eAXohLUE02i2y59nqSQXJ0bTRERt/1EMdd3IMtAHO278DtdtVmtL8zxkXmAou/4DBqPdKnS+ODwcvKPbNT0le3hkLCDfBWJLVpTmjallkaVQqFh0292g1960CXbo5/M2gg/asbsMx9/rbeJC+l+vMqLO4JqX2LVOL2pvuRPvQ35bwLVcCcxVv/ysayGFAHtWmFVOoZoNJuS0AOdXr5F1HrMhC6Ozu5U4q7vLF82jq2DwXohJkdpKe/KWgVqE3loTi1zLTOq0OoppAxJQczGAWRz4Mh2doX2mllPj9zwc0t8p70dphDiuJPL9T+/Yisu4IxJqQRVPnbTiPIOyUHH6JLXNAjzn/7J9MKH8m0EbVYjFq6ZJ2daz6jQyVoByXJ9wAQKI1Y/A6YQhGMdQK25OBTkZCgLuQJDZ8C19IHe3mV5PQK5MFiWmUilr3wRzRAe7CvTis0CsY6xhfMZYG9rD/6cqPBsTic+HCRfTwzeVJd2ZiWHaf6ek9pQEmwgrnjdU8C48lh7/CLLGYrhWU4XdBBf9OGUUmznCoA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(7416014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RnBxdXRncXFpeTV6N3ZxZWY1NFZQYXJlYmJvcEF0dmMzNS82NVAzOS9yb2ZF?=
 =?utf-8?B?ZGR0a20wM3IzaTVNVk9qNG5MVCtvUVpJQ0hEeVVLa09TWmdPSnNLaXRpL24v?=
 =?utf-8?B?dkorUkF6WXRQNVlaZlBrTlF1MkNPdjhjb1I2SUlyL1N6aERzVkNOblVZVERr?=
 =?utf-8?B?RFl2bDM3YmhrZmF4NkJhdjhHVEd4MXZwNFJwbVpDU0pxelhzNEQ4RDUwTEQx?=
 =?utf-8?B?ZHA0WldLakZWaFNvd1ZnVUNlcVZ2dy8zRnpaR1BpUCtDS1VvaDYzZXBGSmpp?=
 =?utf-8?B?YU16WUh3L3hNY1orQ0JWbnRmRTQzdnpjZ3Z4RDVIVlkya0M5VUJNbTExb0xt?=
 =?utf-8?B?UzFTQWRuRENocVN5Y2lUSEZCS0tZbk9rb3RqQnpua3NlY2tVUjR3V1ltWGo0?=
 =?utf-8?B?cDlFYzcyUGlSZ3RjR1M0QjRNdzBQaStyeGR4bzY2RlppcVVzMk9iNmM5UHYy?=
 =?utf-8?B?RkhyWEFzNHRnSDR1ZkNKbXpHSTBGT2dFdEVrZVZocFp0YUxVSmFZS3NNRzMx?=
 =?utf-8?B?Lzc4MmFpdHIrdXFkSERBbUc3OW9CeGdyVnJPRUIyRDE4OXlXa2ZRcVlWQUpz?=
 =?utf-8?B?djhNZnZuNmtkRHBqd1Z6K2N2NlllN0RDeWtGRXNDTks5a2YzYnp6TUlrcTlI?=
 =?utf-8?B?czNrSWJKMXdsRWh4TW5GR2YxUFBxaW95MHd0Nkx5eWJQdXdvVjlvcDIzTm0y?=
 =?utf-8?B?YTYrSGFsQ2xuRGtpZEdCcURyYmh6YkpzUnYxS0wrN1hBNDJrZkMyNUpiK05F?=
 =?utf-8?B?RTEwSlR5TTBZcG1XQWhyNENNQTFpZGx1TGxNd0hpaEJjYzM2UHFyYkJZanZO?=
 =?utf-8?B?bGs2NjRrbTVzdW1GajdtbXRHbHlJTEZFZHRlb2JPekd0WFZUNk9URmlKaTgr?=
 =?utf-8?B?aEpXSkhWS2JUbjVzcVZLdjJZWGxtNjdJbHJBOWZLZjNSVFMvSWx4SThOQkxQ?=
 =?utf-8?B?Qys2U3lKb3V5TWN2cXF6Y0RraXIxSTVjM202UEFBTFRFek5vYWJkR1RCbkRX?=
 =?utf-8?B?cmNrS3RBRVp6K2RPaDJBVDQxdzZzZkRKMjFCTkJJTWRPTlY0YmN5SThFOXRm?=
 =?utf-8?B?WlVNQnhkbWZKOUV6dXhyYWc2SnM2azFkekZ5L000RitHTEJuZFBlczA2N21q?=
 =?utf-8?B?M29vdDhlTGRJY1VqVlNkS3BXVjdpT3NZQURFbmxlSDdYeGRwa0tPYUtXYS8z?=
 =?utf-8?B?enZJcUIzZTdPYjFNRGFKcU8zRHhvVFI2YmRvUEF1VEFDNG1QWk50YnJNMmlq?=
 =?utf-8?B?SlhhbVVqL0VzYm16TmxPKzY4dTgreEorWGY3dTBTTDJvRTI0aHFlVFQwM1o3?=
 =?utf-8?B?azVUeXVReTRndGNHTFFYNmoxcVJjLzV5U2dFbTY0aW5mMUxnMUcrWnJnVHVt?=
 =?utf-8?B?WFZUbUMwdEtzMk5xL1JiSncxMElqanB4T1JmSVh4QnNGbnFQVFhvWkdWOVhr?=
 =?utf-8?B?NGVqSTV5eCtJQ1VhWklwTDlOTldBY0pVUTk4eHhaK082NWthL1pkUmRGekEx?=
 =?utf-8?B?YVVrdTlHUlRmMk9kbmZEVnIrSUhzcXljVnFORGcrNjRSTk8wYVhMeml5RDUx?=
 =?utf-8?B?enZKZUpNMGo1UGFJNjZYKzFLaitKMThRV1dDNnlaYzY1dlU0MkNwTEhFNGZO?=
 =?utf-8?B?VGtMaUQ4R01NMHFlR2NWdHB4dG80eE1NUThMRnNOY0Zqd3ZnWGp6cG00czdj?=
 =?utf-8?B?MGVyZjduWUUyRkIyM0hhOUhFV1g5TGlkMnpSVlFicHY4NCtFNVp1cjVVSEhI?=
 =?utf-8?B?WG0wbFFpZGVqSWwrSStvZE0vNXhWTU52QUdUL3YrSHorWGlwUC8wS2w1aVJh?=
 =?utf-8?B?elg2azRqZ3daTmJLSUpXM05uRTAzYTFWTktGdGc1OTBENytVR1VDR1djdE5Y?=
 =?utf-8?B?azc3TjJTRzQ0cncza2VEdkg5dE01NFYrNktsNzRXOGVnZGdyTUIvQzdGY21C?=
 =?utf-8?B?ZEl5ejRkOEpZaTgyeit0MTRWR2lETUllbFE4dGFZYWlOWDAvMlFhcTNYWFFJ?=
 =?utf-8?B?ZE1pUUJYcWoyUWxOa0RSTHVad0tWS2ZvVDNRODg4ckx0OUpoRmM1b2ZCK1Zv?=
 =?utf-8?B?VXFoeDF4QlY0SkJaSlJZYkJkdkVJV3BQTHpsTVVnbWdxRmMyZnprMnd2UEo5?=
 =?utf-8?B?S1RDY2cwaXBFN0t2QkpWWFJqTDM5VjhGZGF1TjJOQytQV0pONzA1RkFBSjFk?=
 =?utf-8?Q?S79Sty35KbNhmjBGdLvTgBw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 2660c66a-d71c-41d0-2558-08de540e5cb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 08:16:19.4120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gv6A5QNPRlMbJfzOz5mgTKf+BHf8lYwaIsEMxertNXDISWltNnn5U30gg30f7KsLFQIsoPkApdtnLzWeN7uRjjlScO9M+DAfyOTEOUNePJ3V8lFnFhGZBrzRngkt7K6Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1154

SGksIEphaQ0KDQpUaGFua3MgZm9yIHlvdXIgcGF0Y2guDQoNCj4gVGhlIHN0YXJmaXZlLWNhbXNz
IGRyaXZlciBpcyBubyBsb25nZXIgYmVpbmcgd29ya2VkIHVwb24gZm9yIGRlc3RhZ2luZywNCj4g
YXMgY29uZmlybWVkIGJ5IHRoZSBtYWludGFpbmVyLCBzbyBkcm9wIGl0Lg0KPiANCj4gTGluazoN
Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1pRMFBSMDFNQjEzMDI0QTkyOTI2QzQxNUMx
ODdEMkMxOEYyOUYyDQo+IEBaUTBQUjAxTUIxMzAyLkNITlBSMDEucHJvZC5wYXJ0bmVyLm91dGxv
b2suY24vDQo+IFNpZ25lZC1vZmYtYnk6IEphaSBMdXRocmEgPGphaS5sdXRocmFAaWRlYXNvbmJv
YXJkLmNvbT4NCj4gLS0tDQo+ICBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL21lZGlhL3N0YXJm
aXZlX2NhbXNzLnJzdCB8ICA3MiAtLS0NCj4gIC4uLi9hZG1pbi1ndWlkZS9tZWRpYS9zdGFyZml2
ZV9jYW1zc19ncmFwaC5kb3QgICAgIHwgIDEyIC0NCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA4IC0NCj4gIGRyaXZlcnMvc3RhZ2luZy9t
ZWRpYS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgICAyIC0NCj4gIGRyaXZlcnMvc3Rh
Z2luZy9tZWRpYS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgICAxIC0NCj4gIGRyaXZl
cnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9LY29uZmlnICAgICAgICAgICAgIHwgICA1IC0NCj4g
IGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9NYWtlZmlsZSAgICAgICAgICAgIHwgICAy
IC0NCj4gIGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9jYW1zcy9LY29uZmlnICAgICAg
IHwgIDE4IC0NCj4gIGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9jYW1zcy9NYWtlZmls
ZSAgICAgIHwgIDEzIC0NCj4gIGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9jYW1zcy9U
T0RPLnR4dCAgICAgIHwgICA0IC0NCj4gIGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9j
YW1zcy9zdGYtY2Ftc3MuYyAgIHwgNDM4IC0tLS0tLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9zdGFn
aW5nL21lZGlhL3N0YXJmaXZlL2NhbXNzL3N0Zi1jYW1zcy5oICAgfCAxMzQgLS0tLS0NCj4gIGRy
aXZlcnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9jYW1zcy9zdGYtY2FwdHVyZS5jIHwgNjA1IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9zdGFnaW5nL21lZGlhL3N0YXJmaXZlL2Nh
bXNzL3N0Zi1jYXB0dXJlLmggfCAgODYgLS0tDQo+ICAuLi4vc3RhZ2luZy9tZWRpYS9zdGFyZml2
ZS9jYW1zcy9zdGYtaXNwLWh3LW9wcy5jICB8IDQ0NSAtLS0tLS0tLS0tLS0tLS0NCj4gIGRyaXZl
cnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9jYW1zcy9zdGYtaXNwLmMgICAgIHwgMzc5IC0tLS0t
LS0tLS0tLS0NCj4gIGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9jYW1zcy9zdGYtaXNw
LmggICAgIHwgNDI4IC0tLS0tLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9zdGFnaW5nL21lZGlhL3N0
YXJmaXZlL2NhbXNzL3N0Zi12aWRlby5jICAgfCA1NzAgLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAg
ZHJpdmVycy9zdGFnaW5nL21lZGlhL3N0YXJmaXZlL2NhbXNzL3N0Zi12aWRlby5oICAgfCAxMDAg
LS0tLQ0KPiAgMTkgZmlsZXMgY2hhbmdlZCwgMzMyMiBkZWxldGlvbnMoLSkNCg0KaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0Lmdp
dC9kaWZmL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvbWVkaWEvdjRsLWRyaXZlcnMucnN0P2g9
bmV4dC0yMDI2MDExNSZpZD1mNzJmODA1NTBkMDEwNjBhOWRkYThkMGExYzNhN2FiYmYzMzNiYzc3
DQoNCllvdSBhbHNvIG5lZWQgdG8gcmVjb3ZlciB0aGlzIGZpbGUuDQoNCkJlc3QgcmVnYXJkcywN
CkNoYW5naHVhbmcNCg0K

