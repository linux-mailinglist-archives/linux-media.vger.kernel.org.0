Return-Path: <linux-media+bounces-42174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2B8B51350
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 11:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 603A93BBC89
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 09:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A206E3164A0;
	Wed, 10 Sep 2025 09:55:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021137.outbound.protection.outlook.com [40.107.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9438D30DEC8;
	Wed, 10 Sep 2025 09:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757498136; cv=fail; b=ePvLwxD0YJzgri/kTEIQkyMeidaDOMCPnBqp6eX+EW2dg4SDmpFavWor1O7LMuA5iacQb6zjFJxxzTPURI5r+ENVzZ/Fg7bzmtb4KWIHIanbyHJujqJ2dg2ZEUJaQ60+e8xcNaCc9Pxj0P7odN03JiEPwi69fZQgTYzrvspg/R4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757498136; c=relaxed/simple;
	bh=GMSWRQf3YWHibD8zJhlbUOtkeQuHFh2ujAiPA+sYIkI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o9iMn/4BtXnoRfb+hkZwKXLscn8nByaAUtXn+UuGXja8fTOE3oCwGHmegj9PZHm1HQ4yXc9m8queWN4cS4oa/NlDJsG9bLCZdDVStm1Can6LKe2VJfKYM9ychSuQrCkCHsFgZw8y33qezLe2BCA2OjzScS7mbuI1Skgn+Os5ygY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVb/e8Z9Vi8kouUz9rylN3o0pZPoaFI9/YZ7qUK1lyDbri/SfQSr48zAYC/Vv3AKQhE/eAfnC1Ic8b+/t4oRCJpBFhkNUV0GTsRcN+zpdr3/101iYf1epsyba/ngJICGFoFMXIl8gZdSpEmbPa6YyxXXBwMrB+sYKPzci2D44WqLIH/dEd7V5Nq0Y0Et1WWHHaQj7hK9ES11qhicK7+povVZCxBkyFZ9YKc2sbHYXYyt6p1h0W3xDcjVP2sS7HFXlEzy+yyhTwUtq5u9bJ5W8hWEjKkxteQy4EFNiRJSSZP6IytmC0c1yqusQFBh1yGQcJHfDrvrox61RviFyBeBEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMSWRQf3YWHibD8zJhlbUOtkeQuHFh2ujAiPA+sYIkI=;
 b=mm/hbbmpF0adaLfXxnSIBViBiTmbYkAu+EZ0LkujIU2WJrTfspfTnnT6SzK4VmhXoiD3ut9WXSCe5xibohPZbX5qkq/Cei9JCxGUjpoKGhx9zOFjYynoBkLguNUGfaDYuZIdCMRK52Uk7b7RSs420ri7bEihc5NXPSDFDSGCWxAacRjde1aZydru3Pwz/eZNbLqLdK8YLfXvFLtbFMG9PgK6R02/6g0GHH2GwDvJKdfGUOCCev1AhPlDQlg7GPKcwlfAXCwHWvESsuuCzBSqaddvFjFnVHs90989TNn/7gNaZ7PeWexGqqUYmTxKZp0Vf3ejIHrAxyqPlPbdgB/IqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAUP287MB5057.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 09:55:30 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 09:55:30 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
CC: Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: rkisp1: Fix enum_framesizes accepting invalid
 pixel formats
Thread-Topic: [PATCH] media: rkisp1: Fix enum_framesizes accepting invalid
 pixel formats
Thread-Index: AQHcGM29WMPsfr2GPEm67fUHmC8L7bSMPp6l
Date: Wed, 10 Sep 2025 09:55:30 +0000
Message-ID:
 <PN3P287MB1829144172D3779F960206278B0EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250829101425.95442-1-tarang.raval@siliconsignals.io>
In-Reply-To: <20250829101425.95442-1-tarang.raval@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAUP287MB5057:EE_
x-ms-office365-filtering-correlation-id: 6c783e9b-c2a8-4045-e113-08ddf0502d29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8iDABL9ZJVQJNtY5yZSC09lLCRvIMSHWx782gScUX1qRmSGqBBjoC3ERw3?=
 =?iso-8859-1?Q?BSNenRX4IyKu6BoZ/hFgvT9iWiIK+yeASn1AjmaIvdXMCrWMKaNL32IEOf?=
 =?iso-8859-1?Q?7ssM+mK4Lwyysz0UgZUm8VFyNZNyzNR51fcG5BmpRFPc7KZmBYJGxKhv3w?=
 =?iso-8859-1?Q?GQS3x8poK1VB1a6npQ7xEQzBwt9G+vL9gx2vjx3z3ixTtTFKLBVbAYvGMN?=
 =?iso-8859-1?Q?RToNzZSodtMZJGVMt3np8oab3IunSVm+Yc5orgb+6FwhD8VkGRiBeeAtuC?=
 =?iso-8859-1?Q?cdX0tbzs6LlAGa3pD5w3Elmb7TosS4fLp++iPZc3DSgDZNJ++8y1Rs16Zm?=
 =?iso-8859-1?Q?aUwEt9Eg31Dk8hV8nKeS9V4TXJ32W/mMTaVUqhcAr3BcGq/SUXqPLgbwmm?=
 =?iso-8859-1?Q?XJmVDziH/yMz2mPrM72KQELnq4oQHJM4RpmYW7MzBW4NaeI6DmW7CFRUwI?=
 =?iso-8859-1?Q?ZE+7AdIctUuoM1FFP1owP1i2q2eq15B4HEEPzwGqJRUOocW+T5tPpf6eZV?=
 =?iso-8859-1?Q?5kpc41n3fwAvq9PTKRtVn/QqHYXDe11Sq5LlUCRQR8KavLazNWiaPMy17L?=
 =?iso-8859-1?Q?eDmEyKqURD0sEt907B1klb5HrKHlhgJ8rZ9UEPTrgofG0W8wx8g7QyW0/J?=
 =?iso-8859-1?Q?+G7EaBv3Q61PL4Mn50rOt17+Rik7ZiXwjD76woUYnCYMKuF6CsmcNn7kr8?=
 =?iso-8859-1?Q?hI1YlFQgSA3dSkPl2WWIPeoT0IzDqbKkdgTZYQ1fc9GOcG8YS98TspY7jW?=
 =?iso-8859-1?Q?DNeJPtLKL+lCOG+XUYBGOFRoGOClGNZL6icjBbN/kF21F/nuF+OilGKVfJ?=
 =?iso-8859-1?Q?n2pRTVIrDBv7383Xl3O6x0BLhRZyw/69dn3hUG8NCn3AIdZwywmmrvkici?=
 =?iso-8859-1?Q?ZIu7hTqLkqg57R7EL3qHwWgG2fH5bMJhMCnumnaJIBo5wt+ilp/kYf3oLG?=
 =?iso-8859-1?Q?EeD+m4wYUJQfpOIBELVl+q890J/WxI7AY+BsXMYXPdPpJ6+QUEKd8+GHgX?=
 =?iso-8859-1?Q?L3U80/1UyUur14f/lkVURvl68OFnbyEkjQynDwP4Fo4Xa/mzB84sw1o5ne?=
 =?iso-8859-1?Q?8htOmhdBCfVYEUSnqCrqYxYn6Aq+2YE8jpuKhUKjaNpPlxbBKdVApr4HnI?=
 =?iso-8859-1?Q?JMAAui2uR2hvHnXfSqSodC1ne0kszH9tjTJcUT2t+Ez3EHl0h1v8k24mZu?=
 =?iso-8859-1?Q?ibp4IwushZgIety9j/W5kq0LANpfHfU8pkeNxZv0JNj428X3sQkpwF8Y6K?=
 =?iso-8859-1?Q?1qrT6yCSp0oW2tlqP9ekA3+mZrKLRTg0IgdAr7q9gJ+d/LXU1vZGtH7+IR?=
 =?iso-8859-1?Q?iPvRIUJajuNhn8dIERJEhNYvnBlSsdM2UPEsZzhOmEIepfn45aB3GBepJt?=
 =?iso-8859-1?Q?o2xZ58s/lMUy13kVD2+97sYySGld1dBl8DKFwOTDxoWSPOEUQA11H72SNm?=
 =?iso-8859-1?Q?QjX8T8yHokkkniV1YNes561B6pIZQ4vR2G/pzQosp7BM3JjEbAfSZUnyqG?=
 =?iso-8859-1?Q?hPJ2jFhha0/SBDz8lWx463ZY4X2C2bQWGl49p2QGDSmOgf3YGmmQCZMIfv?=
 =?iso-8859-1?Q?CimbQZ4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Lz43i9oc15Fr8SshQJLJL2sicb/bclMApKpehbOTZWvZfLFGq1CkPblPAJ?=
 =?iso-8859-1?Q?zbhWRkSYYzFCZ9wq7gjzQA4AHTdqiS8BF5rBLDl6RzxZ7tF2Ln74T0PSkT?=
 =?iso-8859-1?Q?YwLxhHV5O30YDr9Jg3GH0rUr2YIA3cmE6FtWVROE5RPn2YpzsC+46CwFM2?=
 =?iso-8859-1?Q?BS2wzMhNNVz8RisoFvFIEgMkJoQGCCWDyTeZxE3tvYnXvZ7qhZGBRj2yi0?=
 =?iso-8859-1?Q?2dX5VZdovc3tBoQbc9mh1up0u95LPrG+WD1hJTC6rnn8egMkZ1WVvLdaoc?=
 =?iso-8859-1?Q?LCOkhlL7jSUnYI2dfRV3+0GS9Hn75bn6DGNQCwoRfSJHA3Ko6LpCgiyF3m?=
 =?iso-8859-1?Q?mFcWLzrcwNXGwP4HD2bpDpYQxsQuoLNs0M843VBsZWvRx8G08IsXrs1lC2?=
 =?iso-8859-1?Q?idubp+jVGnt5Hv4Cm/OYoHoSbZa31cEqQoeDCu5JjpLZ27pvmk+gyHcV/4?=
 =?iso-8859-1?Q?3I13WNkQXLB4V6PwubfJZudCOM3edIv/KszJfNFuoB8A9apPGdL1qDhqih?=
 =?iso-8859-1?Q?9oNLV74peRqB+DfPah1QpDLqcdY5B+UFXHQXhxcKY9V/H5/rbE6hfJqoZg?=
 =?iso-8859-1?Q?HaxDGfdtRps/L07pZ2c6qNVCy1OTwZRGBNVtS63WlaGGQDCwQwH5LnBx7Q?=
 =?iso-8859-1?Q?bYRGVe3XuXnhMeukXfMPUBtlT8W65uNBj08hE84aLBQfg8qYvfkRK7o1he?=
 =?iso-8859-1?Q?j65DkdfcBA70a2Y/4yOdzsuCiYx/N+z1767tmH8OBOyLeaw+WQ2T9RBP2W?=
 =?iso-8859-1?Q?GooK6ttzA+gQoNvC5zRnU1yiGn587tgK7w6GyrzjOi2w7ewCNEF4Y6JF8L?=
 =?iso-8859-1?Q?Zmnq17ma/gfbA9/EYdpG3uG6zMxkImaSu422JrWOcK/4qvqfJB8iSejhNl?=
 =?iso-8859-1?Q?N7LUEFKg6oAHLUlIb0uUy5TcjZcNhlrioFBnpbvOcIak+2jweatYEeOSz0?=
 =?iso-8859-1?Q?3Bqv/td8MuE4WsciydkCHNbTfwI+waWlBq26U5r4dHxp3ktpNV5k4Q3gkN?=
 =?iso-8859-1?Q?N6VOfyXuYZDcSZjpu7mW3yY/F3IyGM+qOVP+EnztVVnsOJMzwob2h6kwK8?=
 =?iso-8859-1?Q?C/xOwlFMdzetQRkihsLUv/wt3GUUich6Pkc7zP2oQ+EL14iO2Cyui28rAH?=
 =?iso-8859-1?Q?riLZD8UkiN1UFMT6ekx2XGKdRbYzpiBCgBASulzKtRStJmDxs6uLq+1cdP?=
 =?iso-8859-1?Q?SBhMnT3ZKuIsVi/3e8Cobi1aXhReZyuyiJ2misllMdIXU08R8vaD2+Fi7b?=
 =?iso-8859-1?Q?bhPEg8ItRvlRhjEpE7EVaayb5XA6OXqSR/ZPOohcHRvmxNUsK+mROAlsZD?=
 =?iso-8859-1?Q?JLAl4me+9CJdR2qI4wDecmK8D7NFDfgW67/1pO1jkbxuRR/iMF2HgBZgK5?=
 =?iso-8859-1?Q?naf016HJkuiLol852g1JEGqJI4DCGbdjlOb11hPR4bvrciuuorv3Ys+csm?=
 =?iso-8859-1?Q?Z1kg9MQNKZ5zh3jVG1oEPNZ5R1zfAyqxHC14Z0yGjOCMYE/acb9jSFfcRR?=
 =?iso-8859-1?Q?aUHNhIi4BTFPX3MPCmACcA93xTQj+6Z6Y6BTFNKEMsu3tA5odNfGg4tEYm?=
 =?iso-8859-1?Q?eLLYmT6Dlzqo9q/rKjOn6pppHWytDBZiXHx5In4YxUNqHLhOwo/PbptB+A?=
 =?iso-8859-1?Q?l2K09Z4cXJCShQT20jZtu7QglEwY6+iscaatkEMl5Cnu8igP3lwWCRWQ?=
 =?iso-8859-1?Q?=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c783e9b-c2a8-4045-e113-08ddf0502d29
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 09:55:30.2216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oLEi5LW/So7ifHgsDKTXPtoe3Qqu3r+KsJozLqJpNNKuhPZKcoyXuqDuEQFcO3xIhe65PVSF2A+eUUbVTlHSyLBEJCJ+aOkPMKpccEy0OxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5057

Hi Laurent,=0A=
=A0=0A=
> Reject unsupported pixel formats in rkisp1_enum_framesizes() to=0A=
> fix v4l2-compliance failure.=0A=
>=A0=0A=
> v4l2-compliance test failure:=0A=
>=A0=0A=
> fail: ../utils/v4l2-compliance/v4l2-test-formats.cpp(403): Accepted frame=
size for invalid format=0A=
> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: FAIL=0A=
>=A0=0A=
> Tested on: Debix i.MX8MP Model A=0A=
> Kernel version: v6.17-rc3=0A=
> v4l2-compliance: 1.31.0-5387=0A=
=0A=
Could you please consider picking this for v6.18?=0A=
=0A=
Best Regards,=0A=
Tarang=

