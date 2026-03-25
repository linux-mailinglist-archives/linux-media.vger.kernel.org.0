Return-Path: <linux-media+bounces-56961-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPXXEk+mw2lssQQAu9opvQ
	(envelope-from <linux-media+bounces-56961-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:09:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A45DB321E83
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E50D830692C0
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 09:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55458336893;
	Wed, 25 Mar 2026 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Mh9ZE3M1"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020111.outbound.protection.outlook.com [52.101.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E2530EF95;
	Wed, 25 Mar 2026 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429509; cv=fail; b=kA7fvPMr0Gs/RtO7/a1cCfDtJkf3ogZSBZ8OFyZL4s5y46nSF1ow5OE+k6Yabp0oZ6y3XvjI4XoPpb8dWNS1XBsU/nDRnh/nSGmC6o1dVr5yczidk+ngFlk2mA5OJRRCF0zil3Ko3j6bqEeQ/ewwPAkQeZ9s5/BQ/Fciar8iiR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429509; c=relaxed/simple;
	bh=JJlgaH53mSBhBzDnI+ItwqBGpEQQKZBjTyS2XQlbyGg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MTGqk6EC55MQojbrgzisqy4vAAo07NTqRxGFjYc0/cJYf+wKSaT/KUDZaXf3h88pUyfdoGfrfW9uvLvX1IBlsns0gW7zLuiTGAZuxmlhoo08MDV4f7AHrKNOeDe9FzxIrTaL/QG+yBghtioD4SGpEljTg55x2uvYurLZkoS6XBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Mh9ZE3M1; arc=fail smtp.client-ip=52.101.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRLEIAf6zu7a3WvvZ+K3Nld3uE15qCTYpGPKRS+OV9OdDnB9winlCa2XvfCXGQftc89fnGPFcM8K1BUpHB4pgtcQs43yZRbUV+dOo3/GGPXd/xY+V2eWVLAqBS3w7WfrrqY0NkC//3gjALHdpeVh5INMrntD5sJX2q4gHnqbm3UrZVbbzPRhiec1R61auh5Dt7jHxU6S9PLmY8ibFKkpFMSAniv82ppputKgzoUd3zP9tkcAdkAEifACAgTw9Tcqc1n7FevygRHgS8tfRaLh5xddf9xH7CqUKNH4keTAXVEg1ql7t6Bc/XEKSBc8qF0kO8hIvyNmeXqgn8FVU6dIjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJlgaH53mSBhBzDnI+ItwqBGpEQQKZBjTyS2XQlbyGg=;
 b=Bxoj7M8U0kKst4BiQOT/UGVKMbOY2LTL+sadrNfMS/5IbdnMGybLVYxOlRbqBAsPbBOrd+Up8IufhipsF+8Q3ZOsW6tELxxa4LugN4M/JPoqVlvVkgq6zhP2UEusZd98QBeopEX/X/ZM7Jm64umox5T2fNo6+kVoOV3/7ynhmRWXU9Br14SMnmF6jhM9A22zA1NTQ0M+Z7qvKeIQ1rIkLObXZuElMW8RqdvPg6xr3fVgoKuD1Uo57P0EpQtd8dX1Bx2RimnvATa4jQvk+o/K8WBX+INlfei7+zPYpBTFaW2pnOjpGggXYCJH6fZxzxRqJBhO770Qh7Ypaz28Ui4aBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJlgaH53mSBhBzDnI+ItwqBGpEQQKZBjTyS2XQlbyGg=;
 b=Mh9ZE3M1eRzRN92e/CGW0s0EBl8yJ/whNocxXnjSvwpVFhsHnoKMh/Zl0iHztqA+AckLg2KAdC8CfXVuiQeG3uSXL5P2rIEFjjey7N+lr2skwK8VSsfWisxeXQAHzv2cC6X+SUemMsoZBsil6oEgBXrwBLcSKRdghAsIAMt6gyIVg4TAkXFn84OTQxluztLiHIOl8KUJdmM496mLKaB5o4oQ5JqEdjsWUu79d1u3H1hIPP7ePpgNF3crwsXZ7mSAmcA+u8hDRKknmiBQIlMkb1cT9WwPwDBa+/l6dQ+toeO1PTaOax0VpmuW5TjKhtBYXOonBfvyeI2d89bP/s4bIQ==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAYP287MB3676.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:149::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 09:05:04 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 09:05:03 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: "mehdi.djait@linux.intel.com" <mehdi.djait@linux.intel.com>, Himanshu
 Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/13] media: i2c: os05b10: Update active format before
 adjusting framing controls
Thread-Topic: [PATCH 11/13] media: i2c: os05b10: Update active format before
 adjusting framing controls
Thread-Index: AQHcrWWbBCA5F4vFtEy8NDemy3uU2rW9+iaEgAEVkYCAAAC0dw==
Date: Wed, 25 Mar 2026 09:05:03 +0000
Message-ID:
 <PN3P287MB18297E74EB5699A22ED0389A8B49A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260306123304.76722-1-tarang.raval@siliconsignals.io>
 <20260306123304.76722-12-tarang.raval@siliconsignals.io>
 <PN3P287MB1829E89506AAA47318D694EB8B48A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <acOjN4KiSTXwwciM@kekkonen.localdomain>
In-Reply-To: <acOjN4KiSTXwwciM@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAYP287MB3676:EE_
x-ms-office365-filtering-correlation-id: 348e9f3a-3e35-4472-5523-08de8a4d9a3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 3DXHS850+6sRJOhGei/qssgDZWVYvll+FGJ6XB6cOR93Ge+2EBipMuddDnegRL/kVFnccm1mlRBmCxGSlYCf3J6vNvWotaTjxMOw78+riWPvlQikc5ulT6WGUP6DFf742FAt5vq4iADkT4XjBK5r8Qu7sfyf0aQj9zdPF0NUi6smt6MHapb0e0jbY09ce3kSwiHIzwZo9SnwsNTufmiNnHgEdtBWcC7tKKc2LtJjLeiCS6XZneMkU4V1Lz0xXnwKbBlVkNw0p0ZwHmdWvyfxfQeXjaGRH0sbDqYph8cyS2OD/s18gAqTFSHVQd5t+BLbpAQP/X5iLg+QM/uNUoaKqqyKbYtw/3GHI5LcAVcteG9b2zmKYdojBBl9lZiiNDkAW5ViHdZsQXfcFfbFbCHxHfFX+BlQy/+pRNE+cTxfweIKH2mvN8jG5zbUg0rT5blOZ/umfqDQR2Q7jnpGd7mbhi31aA0OFyivg7iA9YSwEVwK80DK7l3+XSYBlWZ+5rDzbAOqjwn8GkOtr8buTNlFTu9kkMbr5IwqwrOz8AFMnvO0xIQdX0UvNnR2JVZczHNCCQybSMwH5nRwdBT5tBeT5QtKE6S22IfN3XK58b0d/qDbGsu3/V5QgQuOTL35G+xTudrbNHLe4emsvMKyfvcNiOUbY0NePwxlNJuPMJPQVbQA1woXj2dY9SGGXFRwyLY6pFD8k5lUGoYtdHTetARbytjrouFcg4qlF2GiU+1VIkgJ20wSnJeEHDGnUl2I4JPl+a7qSvJ9eP1Ux4TFrTSBDD6ZLZSvnho8MBRV/ZHMOQk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vgi+dVrHxzm+9pRSUMCmghMb50vfvsRkCCMcT/3dS46OGHKhyJn4O+nc0u?=
 =?iso-8859-1?Q?RdmHu5TMFU8T7L9kaSmP+bAAgHvRtuOY4Scbg6P29j8XkctXQmi64r1SQp?=
 =?iso-8859-1?Q?mp1nJwYBnkpkkX90/1KZTRYs/H6Xc6pAZe8BPILAu7UMR9Sd5tiy2CzEiB?=
 =?iso-8859-1?Q?gmJ/h5E1g2jUMiDCpTkf9UuGUejD2CDOcIxzf5NIf1VWiiV88zmHviLfaw?=
 =?iso-8859-1?Q?1b0xO+woYBJVlG/WBo9MviPiZvuaPLHW0I36rmqOWuQS5gYbmHLxyfDSR5?=
 =?iso-8859-1?Q?UrP7wutVuQKY4DOoel9NqRDZJqXP1+BuG65lXNJqvLG9/gUJmry/l6Uxqi?=
 =?iso-8859-1?Q?C2zWiNHIUOoqG7fB6F2s/MUGX5WQCrWcL8fIgNUrJr4ruX0Mt5DUSEKEx/?=
 =?iso-8859-1?Q?IC/hgUPRGQXfxXVjPg3pVY0fPhBd4uUVFOHtUn0XOp2Z8TFVyj1l8ijU2s?=
 =?iso-8859-1?Q?RHyhnND3L+ONsgCcaXnZtCMq1FR8t0rNZs1oJr68VIYTLkdydvbIiAa2I8?=
 =?iso-8859-1?Q?hVxx3XOlfzaXxHXxWt5y2bpNJHPdbEQDHkwug/cTKoW3p/jHjnzKjMOI+x?=
 =?iso-8859-1?Q?tCOx5FfGXcsDLkR209JyGxMdmDzt69Wldo4uuU5smPe5JBpRqdcmyNn+Nq?=
 =?iso-8859-1?Q?/otrt2WPJC63qxdk86Altfrl+j55hvnT2SLBETqxgEBsXPRb4jaicOs3Ra?=
 =?iso-8859-1?Q?tNr+WD2rXqyipxu5LG7fXtm3nSjQ+mKh5y8aq75Wo2T0ByKwcv12uIkT8P?=
 =?iso-8859-1?Q?xPHcZHqoeLTOicQkuoDsdS12qi8BUkth+79jsxmPMTUW/5SajQJExfHHgA?=
 =?iso-8859-1?Q?0gCRcHbl1LNcG3hEcJnMZD/i64Rd+KlROHNRW0875AYwAwEIPeKSYGZ4vc?=
 =?iso-8859-1?Q?FJ4y55M87CLOlDaZByAIHq5ABBbg8Yh+WNcTt9s4JIb53//O2JU+xPiXcA?=
 =?iso-8859-1?Q?2yYmg+lCMeYPfV0I7hPKLgXFlssZOKKDVk5ggpr2OAbQC4dkTP5EhkBg8Y?=
 =?iso-8859-1?Q?P+yLdH0DWY0iass4/TbzESN5Tqe2/f8P46VRG9+b+fhaRMbuJ6VGW+a/wG?=
 =?iso-8859-1?Q?93a6UbL6HOGTqmbG7cjhH7n8kOtOEW3m8jOnNBlcnaww2S0pBOIm+X/GHf?=
 =?iso-8859-1?Q?ORrjrHixTaSMAEnmS/NRbkiLZrxEhQrGbGr0D7Z1GjvSLv2zh4a6ejOj1D?=
 =?iso-8859-1?Q?/yT22Koqo1rDaRkMl301ffGzHy5Xl3mubjxS43ya4fdhXI6RqzxntrNrr+?=
 =?iso-8859-1?Q?Gu6zNG6WNDkCto2kFijFDnnxStEz8//H/MdmUOTJeHzosv+hwS/xHa/qZJ?=
 =?iso-8859-1?Q?YmQsqCKjcIa3bFbegtEiRA+6zmapIs1rKJLhO8e5OsIYkAnfqFrW1XG9Hl?=
 =?iso-8859-1?Q?Cysqe0zQ8P5bFNqQNu+cWeUxxYrxjeWEONSLuMbZVhPyzc8R3XHpDUm73B?=
 =?iso-8859-1?Q?rIUEjcH4mD/TNdXi7N3nF4gXoYON7CV6RluVCwAJPSuWjJ315uml8Qheym?=
 =?iso-8859-1?Q?XnGD/2C+JmIp/s604QIgfpFd+O4A+3E0mQ8aHbUoptcztbg/KHg+q3uZGO?=
 =?iso-8859-1?Q?WPjtRhLKA8IBsmcja0Hh9c1tiWdfqlS4jfvfSN7rMS6HHxMKKtJLHo3NW6?=
 =?iso-8859-1?Q?judVZgb1W5dBgZMIpRBrCMNPXJlOxHp8OkgKZMljo5+VniTIb3K9PKz17t?=
 =?iso-8859-1?Q?dKNr0LUkIhi18lLnP1TH7TOt64vzphKsCD4CG6krTtv3ZlB72umjxcaPF9?=
 =?iso-8859-1?Q?zCjKDf6b0hrWX2oMv5gHxaUIHQwfIH4d6CWAKUF5Ebb9UfK9k/VRUU4S8l?=
 =?iso-8859-1?Q?KFkA/SB4jA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 348e9f3a-3e35-4472-5523-08de8a4d9a3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 09:05:03.7594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /I3VkJnZAiaaEqUPT83j4vHYbougfUFPy1XfriNJl0HpJh2ria1sGUrr7svaaMta4POd/GtpzKW106JcY76W6tFRitqq8+Q8L+xLBBK0fRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3676
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56961-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: A45DB321E83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,=0A=
=0A=
> On Tue, Mar 24, 2026 at 04:31:02PM +0000, Tarang Raval wrote:=0A=
> >=0A=
> > Hi Sakari,=0A=
> >=0A=
> > > os05b10_set_pad_format() calls os05b10_set_framing_limits() before up=
dating=0A=
> > > the ACTIVE format. As a result, the VBLANK control handler uses the o=
ld=0A=
> > > height when recalculating exposure limits, causing -ERANGE when switc=
hing=0A=
> > > to a larger resolution.=0A=
> > >=0A=
> > > Update the ACTIVE format before adjusting framing controls so control=
=0A=
> > > callbacks use the correct dimensions.=0A=
> > >=0A=
> > > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > > ---=0A=
> > >=A0 drivers/media/i2c/os05b10.c | 4 ++--=0A=
> > >=A0 1 file changed, 2 insertions(+), 2 deletions(-)=0A=
> > >=0A=
> > > diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.=
c=0A=
> > > index 4601e33b7e8f..476dbcb49351 100644=0A=
> > > --- a/drivers/media/i2c/os05b10.c=0A=
> > > +++ b/drivers/media/i2c/os05b10.c=0A=
> > > @@ -902,14 +902,14 @@ static int os05b10_set_pad_format(struct v4l2_s=
ubdev *sd,=0A=
> > >=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0 format =3D v4l2_subdev_state_get_format(sd=
_state, 0);=0A=
> > >=0A=
> > > +=A0=A0=A0=A0=A0=A0 *format =3D fmt->format;=0A=
> > > +=0A=
> >=0A=
> > This is the final analysis without this patch.=0A=
> >=0A=
> > Please check the logs in the attached file.=0A=
> >=0A=
> > When switching the resolution from 1280x720 to 2592x1944, the logs show=
 that=0A=
> > while configuring the 1280 mode from the 2592 mode, the maximum exposur=
e value=0A=
> > is calculated as 2219 (fmt->height + ctrl->val - exposure margin).=0A=
> >=0A=
> > However, after switching to the 2592 mode, the maximum exposure value i=
s 774.=0A=
> >=0A=
> > From both cases, it is evident that fmt->height is being calculated inc=
orrectly=0A=
> > It is still using the previous height instead of updating to the new re=
solution.=0A=
> >=0A=
> > Please share your thoughts. Am I heading in the right direction?=0A=
>=0A=
> I think the patch is reasonable. It'd be still nice to get reviews from=
=0A=
> others before merging this.=0A=
=0A=
Yes, I will send a V2 of this series shortly. You can review that version.=
=0A=
=0A=
Best Regards,=0A=
Tarang=

