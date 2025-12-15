Return-Path: <linux-media+bounces-48816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C71F0CBEAF3
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 16:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7ED61301EFE2
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 15:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FEC9336ED8;
	Mon, 15 Dec 2025 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="KmmOWIoZ"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021139.outbound.protection.outlook.com [40.107.57.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70B4308F1D;
	Mon, 15 Dec 2025 15:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765812863; cv=fail; b=Y0uOxYbjj5sTI+iwCq/Heu3Louy8lAVIJRotRz+7w7P4NLUsOAAQzQEB9FyfCkJPIw5rkyVV9wCtSaCPj+ma2CkyxJzeu2jbqfPexWw4bq2Mx11bio6Y5nt89XPzaRJkYEGiiqVdmkXPWMrIOTmu/Pv0Sh7Ly6ugZXXxSfB7rUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765812863; c=relaxed/simple;
	bh=AbFNt/iOU9YfJeE9eLKUjijfEYMzsUamoJKpTTlL6LY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kKc8G0hQQ+1dyJPrR5ATpVajdyQ5UbFayDXn31i5jnsrF43lptqjJlVceM/wsSmaGuGS9ArtUP34ekPaDAvG7+rfEKkc5vxhrtrkxSfag0jSKIZQyVuvA61/aRctZNSyu+CyPBsH6F2zpL2dlquEhRyLk3VUde+/7rOlW2aUbhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=KmmOWIoZ; arc=fail smtp.client-ip=40.107.57.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZgQLy+zND9EhHUlaUUY3Ifkb5RHLdbhYIvrkL0OzGqJ+/UBL0azY6/SlApFyKvnkEfJCfJwY8cxxOQkUVHEtfLau7ehCzxAyyq3VnwZL6tXJ/mADrT0ptsFJ/mr1pg5NQptSmE5x1xCVtEnPgB0vSYJ6bE4EU59WvlXMT4Reths2rjV/2JK27SRroancIaJkZ8GUhlZ5Z+SjMJgW1XnBln0Rd7H2yQ3/V53y/b5xy6v/LCOROrMujUDOFeIiiLZaAVCqO4ZKkaYwLObg/bWw2olRz8HVApM7qbEul50r2ep6vFZrswcGiCzNbgMdUnpKOT6TGQdINW7hZfSbq/VBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbFNt/iOU9YfJeE9eLKUjijfEYMzsUamoJKpTTlL6LY=;
 b=j+xky5t5dBYPvJm2atw3FBLNXKkasDnlXUbvvbd5es9W1TcBQ+HusJbpAgagkgFpZmok3viWkB0APenwhBndvGNCRj1sOYzUVovAqB6WnC3YUrxdjyCZDMhXugsIR3dmNamy8srMPO86WLkTz3RMGlQjV0Sq9U7z7FCtY5ICNJTTCpoDBFnhWn7wMx4TkLBMOyO9tFnpWuOHgYa5A/4ADJYqYl6GbWULbLuaWtzqfSeLj/aBrVqBN1Y+Vw+CHSi4J7MZGkxy2DiP5IpttlyaSLyAncASobEvgUXu2FyNqLuGVXyWvGqcBmiXoci4qg8m8/rHtMDoV17Lrdz8kBSGPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbFNt/iOU9YfJeE9eLKUjijfEYMzsUamoJKpTTlL6LY=;
 b=KmmOWIoZLYDse0jfhKvd/xaD2FYnOBF0omccdBOQwdYBzvb7Vo3RCNZRnSt8+153P3/qTVh9DHDpSSynd17hBhBN6oWQxlRoPS4w9L+5SEKy7nrPsYzLYQfTrbk7nreLJW5LXUqjAhQh7HVxwvou4uS4DCDG9y1pvf/eS8PwbiE917uGg28kkQTznxEco7PlcfcN9A3p5WfafqgejrzpzClNqrfGHD9kxPttcQM5nX1XcxIM8z3RH2RzuO/+8reH4FFTjMmql8h8V5VdYiNMbueBUUz/YMNRYXjwHlOYcqOw7MGQO+N0TjBPLCukjheawAEjpyYSMDGMKaKNNDI64g==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN0P287MB1315.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:189::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:34:11 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 15:34:10 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>, Mehdi Djait
	<mehdi.djait@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>,
	=?iso-8859-1?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, Jingjing Xiong <jingjing.xiong@intel.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] media: i2c: add os05b10 image sensor driver
Thread-Topic: [PATCH v3 2/2] media: i2c: add os05b10 image sensor driver
Thread-Index: AQHca0ZVS6AN0mPTTkaXcdN4GC+v07UeEoMAgATFPf4=
Date: Mon, 15 Dec 2025 15:34:10 +0000
Message-ID:
 <PN0P287MB2019A74DDE19F52E8526A7879AADA@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20251212090358.44989-1-himanshu.bhavani@siliconsignals.io>
 <20251212090358.44989-3-himanshu.bhavani@siliconsignals.io>
 <3987b3fa-efd0-4ff3-9739-86a5cff6b4a4@linaro.org>
In-Reply-To: <3987b3fa-efd0-4ff3-9739-86a5cff6b4a4@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|PN0P287MB1315:EE_
x-ms-office365-filtering-correlation-id: 744f6e19-3841-4874-3382-08de3bef64e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?jL7pDJYkESbWRT4IqwSuoJ4ARLCVhC4VksF+52ApTNeiBuRmFpfyQ5NH98?=
 =?iso-8859-1?Q?flsUj0EzUD2YBu+kXReC0DcK4z4sEG9L6fWbsIBYk6bllUUdsyniGsymBw?=
 =?iso-8859-1?Q?K3wAtZtC0VhCaAhYWq+1SI09Z8hLiz6x0gieyvHCz/ISt4r5r7efuaA4b4?=
 =?iso-8859-1?Q?+xBAk+pzGBHFWkYstCWMRX1TqrLJSx7NJO1KhwWTpdjmoHs685Azs5MJ1i?=
 =?iso-8859-1?Q?CJ2mH46Q65q23viCffX5pQX92A14P/1iixX8RBUJn1b72M2HP24EUKbcDp?=
 =?iso-8859-1?Q?Fxiu/qH9uC2iiHBGQJfLYH0f7rp5/isAPPmm4c7/cvboVdZJ1Jiyl9dqZY?=
 =?iso-8859-1?Q?YVLrAQtiVKl9w5QaTtNRO1J3eyDaI5IQUTk5Gnrx2k6ro5chgyjS4hG/hW?=
 =?iso-8859-1?Q?Tiw8FtrN+fRtMMMMpek8P4xOSf6OWjtk5LIDGsa4V8LDLu57TsupgPnUDc?=
 =?iso-8859-1?Q?Z/1j0W5XisLuvtk+OiZoaWMDfpshsQPN7mXfH2LiZh2qHKy/hZCCwuKJCu?=
 =?iso-8859-1?Q?jtNihwOZMaIy1YFNJa3jbEwNt53LAIyrXt8wXPMLNoHUIhn7Q0I9+YAtVE?=
 =?iso-8859-1?Q?sRK4cnlsddb+fXvm3hvNvk7iNuTdq4IhhzW/A2N/h0O6LkcAG1Aq1buKss?=
 =?iso-8859-1?Q?mMZLUVHnu2iOBaPIvE+707G3A1xawfn1kNcpB6pu9pkQ9v/8KhSua/1z6P?=
 =?iso-8859-1?Q?6pEgdk914JvMUmOL6DluiwkGo+fyuUTW7eR0EOGkJJSx/J0/urHyyo2sjV?=
 =?iso-8859-1?Q?qfywnvOsarep5HGJ+wlmgZ5nFzCoMIQpvs/tJrhwlJudQSqtzBbj1XgEr5?=
 =?iso-8859-1?Q?bdZ34b7uAsrJUtxUBiis/ag/OFWUXhSjg4fhxzRugLl31ITUh0QSdZIxxF?=
 =?iso-8859-1?Q?yOsaiO/rBNfICpLS/AdQevzicAghSW8fRG65Tdq/avSft9R5isxza4oPLR?=
 =?iso-8859-1?Q?X36y1wskJTMyqXTyq4lCIEqr2ax+HCK38DEyT7xW5FubX9xSctBX0tHdJv?=
 =?iso-8859-1?Q?cLcRiaJYRwz66gMJsgc7aO8qp4pN/SlmoXWtth6LE0X3q0JVh5jo3pcXM5?=
 =?iso-8859-1?Q?AzX+K5MDa4yAEJZIoA8rOtsCuwR3J0czLouyYHHaQM76veAztsnp/2pJKy?=
 =?iso-8859-1?Q?8skmg9aEbO1o+WNdsyfip8LIteMJT1kyXUEuUO5jItAHtbdtxl891FdF6r?=
 =?iso-8859-1?Q?8uwLMHVr6ZHKcU/s/d4OJQ4izsMZnijnrdQJq+ocAxSE08LtqCWNRm13tR?=
 =?iso-8859-1?Q?CvHAdt7TTvsIVZvuZ304ip4hHd+JXoiFZKy7bCg/OxeiQV16Pw00zUV7ia?=
 =?iso-8859-1?Q?I0OphOaCLul0Ds2NKPliYrD3zSMFwSHhVyf5xEpDw9Xzy50gkgqORxMrwi?=
 =?iso-8859-1?Q?OAfTlmffNQKV0OCA24SUX4xlXz3qc++OhC79RgWqj6m3aSusqqFnFLrfFh?=
 =?iso-8859-1?Q?ffgD/0o9MBpgpxI/8oG1jw7/GND62N2/iJOdy0qWRSmlB+O/aaho1/tBc0?=
 =?iso-8859-1?Q?2dsDzp2SuypEbVmYzS6FuKKdkCCPwuxwjXwJpcX1QhcmUVYq7L9r2ZToNm?=
 =?iso-8859-1?Q?A/pxIJe0tiugE7THXbvpVxUE5j5z?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?d45Fk1wsOLxI0XpyMucxfBX8dwCrYatFq8OurAc3SoD2Yz6phVSTWnYxMB?=
 =?iso-8859-1?Q?6gj66oAcs74E7iRHg9D92d+Y7CMDwiKTZt8PAsOZwPRI2zPhb2j+EsnFB2?=
 =?iso-8859-1?Q?ig78QR361UTiPkM3MLEZPUxSF5kX1F/owLjBkm/+paVJld2/7PElLSCHLu?=
 =?iso-8859-1?Q?szbmtxvldyhnHnj5xbFW+vMqA58qVAJQ8lrxlOUfGGcwM3BabRPABzVH4h?=
 =?iso-8859-1?Q?CddoeGAS6X2K7Tc7+KdJo7pYYh2RcfFeM8d60u/tDORp0dDyXHNGt1gYw5?=
 =?iso-8859-1?Q?c/T2n8vkYuJ9kWHIBRDGUvjpG+D4fBMu072KE2wRrPEQqDjwSz18s9yRry?=
 =?iso-8859-1?Q?2igB42iiqCGcO//tvB587QpnfhDMATL2sU7kxgdpxBkbvAHwX9WbPr0IXm?=
 =?iso-8859-1?Q?gWaGKRQ4OUKFO5GK17R1T7LwBadRNvc5/v3+/nnLNxQh2Y2JOg+8Qq0ga4?=
 =?iso-8859-1?Q?ukGDLOdLKmg1HPc8p9mk/agarG2lVasjlXsrUSD0/iBqdJVoJEH0sPlBTA?=
 =?iso-8859-1?Q?4SGoMa8Xeby9i0vzZH3mg0WHIcYGXi/siOf3g8UwjKuZQpuVpI+DDjwzqc?=
 =?iso-8859-1?Q?dvtQQuJUhXOHnZrq5Ea0Cy9J6jNwziTpyQ51Jdc/x3HLFpiy3wFhoJ8jiX?=
 =?iso-8859-1?Q?esO1AqAD9HcnrrMTm03bZqczjwmhHZg+oUmd6I16EpBz3s9DxvBjxx5Uhn?=
 =?iso-8859-1?Q?EJ4dY50vg+jrOEViDTMgjWeXMbvbfTL9XW1ExYBSIKFCQogaJS+tVFMfXE?=
 =?iso-8859-1?Q?akmMCiPHQafyFGzNDKgMEpkBD/sW2oq+21VDRI9bVbRoM/qsJf+Oc6Ndu7?=
 =?iso-8859-1?Q?pgF4sSIbYwrmtkaHTlrkA0v9f43dgVOHh6+GSJIL0/htpt3D6BnuS5PzxI?=
 =?iso-8859-1?Q?8irEizjMxx9PUzihYmtns933MlfZD4nXoNLNpLC0EPAq5jCcsT4u0o9Lr0?=
 =?iso-8859-1?Q?WFb5BVVQZ7ttSCTihreA7L3TnOx8yguJG/kcV4lsk1cXom803Su4dJjN5I?=
 =?iso-8859-1?Q?+fH18fLONI97jf2hj25GseoDgUXfVFux+2EeLybLkpAQ78zy7SVLDz5mtB?=
 =?iso-8859-1?Q?BD33DYVOlQ6iEBx/FjiRUrmon9sxs2+FkJpzbjtx6LlZ3+F+jy2SzytFW0?=
 =?iso-8859-1?Q?BK/z/2bCD5qcZlGzSKOlwHG6xpIZsxeas4D7Q5bTfP3DN1iS06QVUXT5zI?=
 =?iso-8859-1?Q?/FWDiAf9hYm2eQ7IHrvWXdFgTHOoSIUHDrgud/+ULvayUvIpesyuDNIwdL?=
 =?iso-8859-1?Q?Wntk2d2xkxARq4L2h2jRzo4pWskPI5yTPlHeq+iLmUIoO6r2UYmgRwam0H?=
 =?iso-8859-1?Q?AI2DxfWYQHTkkjkuu8lQhcoZFdcdvjGiFZKwJDWG3nm0uVDoZUH+8NAqFn?=
 =?iso-8859-1?Q?2lYHQFaSAUZ2yuJz7ui//UqE3/9CrT8/wWrE8u8tgWxgBe1iLyXrN98/tl?=
 =?iso-8859-1?Q?xUxoE6uj3uFMnSVuWVQrFRu80uFe2gMN74bWKzKj6pZ0827hKCo6zlGBqJ?=
 =?iso-8859-1?Q?zMz1N1+7SGyICkWRI5tik3JUqSQ7nUKBY3wF/d4GgS6+VP6hvWhBJHbaBj?=
 =?iso-8859-1?Q?SKukpmtupV9TP49XVvKERzwaIsajpUH9+0Dzi160w6x+4w3dH597kg2zrF?=
 =?iso-8859-1?Q?4/oN8tsFVnmRuGjwKY63v+rLiOw3n8NLzkuTkOy46eJHUIBKOr+0X5KA?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 744f6e19-3841-4874-3382-08de3bef64e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2025 15:34:10.8999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Moce/1CbwVJg+0Z8GMaiKZLaVGgRzdksl0xu6EVxhquQq4n9h1nOpx2fhwWNzAFGArRCe0Zv6f5UmOIg5pVn9Llv7jsoGpHYi7k2iJx3+0uhYQf64enTJ8yKLofdVrf0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1315

Hi Vladimir,=0A=
=0A=
>On 12/12/25 11:03, Himanshu Bhavani wrote:=0A=
>> Add a v4l2 subdevice driver for the Omnivision OS05B10 sensor.=0A=
>>=0A=
>> The Omnivision OS05B10 image sensor with an active=0A=
>> array size of 2592 x 1944.=0A=
>>=0A=
>> The following features are supported:=0A=
>> - Manual exposure an gain control support=0A=
>> - vblank/hblank control support=0A=
>> - Supported resolution: 2592 x 1944 @ 60fps (SBGGR10)=0A=
>>=0A=
>> Co-developed-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=
=0A=
>> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=0A=
>> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
>> ---=0A=
>>=A0=A0 MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0=A0 1 +=0A=
>>=A0=A0 drivers/media/i2c/Kconfig=A0=A0 |=A0=A0 10 +=0A=
>>=A0=A0 drivers/media/i2c/Makefile=A0 |=A0=A0=A0 1 +=0A=
>>=A0=A0 drivers/media/i2c/os05b10.c | 1115 +++++++++++++++++++++++++++++++=
++++=0A=
>>=A0=A0 4 files changed, 1127 insertions(+)=0A=
>>=A0=A0 create mode 100644 drivers/media/i2c/os05b10.c=0A=
>>=0A=
>> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
>> index c85915d5d20e..c48d04ca38d1 100644=0A=
>> --- a/MAINTAINERS=0A=
>> +++ b/MAINTAINERS=0A=
>> @@ -19240,6 +19240,7 @@ M:=A0=A0=A0 Elgin Perumbilly <elgin.perumbilly@s=
iliconsignals.io>=0A=
>>=A0=A0 L:=A0 linux-media@vger.kernel.org=0A=
>>=A0=A0 S:=A0 Maintained=0A=
>>=A0=A0 F:=A0 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yam=
l=0A=
>> +F:=A0=A0 drivers/media/i2c/os05b10.c=0A=
>>=0A=
>>=A0=A0 OMNIVISION OV01A10 SENSOR DRIVER=0A=
>>=A0=A0 M:=A0 Bingbu Cao <bingbu.cao@intel.com>=0A=
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig=0A=
>> index 4b4db8c4f496..9800ba50b9a6 100644=0A=
>> --- a/drivers/media/i2c/Kconfig=0A=
>> +++ b/drivers/media/i2c/Kconfig=0A=
>> @@ -371,6 +371,16 @@ config VIDEO_OG0VE1B=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0 To compile this driver as a module, choose M her=
e: the=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0 module will be called og0ve1b.=0A=
>>=0A=
>> +config VIDEO_OS05B10=0A=
>> +=A0=A0=A0=A0=A0=A0=A0 tristate "OmniVision OS05B10 sensor support"=0A=
>> +=A0=A0=A0=A0=A0=A0=A0 select V4L2_CCI_I2C=0A=
>> +=A0=A0=A0=A0=A0=A0=A0 help=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 This is a Video4Linux2 sensor driver for Om=
nivision=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10 camera sensor.=0A=
>> +=0A=
>> +=A0=A0=A0=A0=A0=A0 To compile this driver as a module, choose M here: t=
he=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 module will be called os05b10.=0A=
>> +=0A=
>>=A0=A0 config VIDEO_OV01A10=0A=
>>=A0=A0=A0=A0=A0=A0 tristate "OmniVision OV01A10 sensor support"=0A=
>>=A0=A0=A0=A0=A0=A0 help=0A=
>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile=0A=
>> index c5f17602454f..561d37939875 100644=0A=
>> --- a/drivers/media/i2c/Makefile=0A=
>> +++ b/drivers/media/i2c/Makefile=0A=
>> @@ -84,6 +84,7 @@ obj-$(CONFIG_VIDEO_MT9V032) +=3D mt9v032.o=0A=
>>=A0=A0 obj-$(CONFIG_VIDEO_MT9V111) +=3D mt9v111.o=0A=
>>=A0=A0 obj-$(CONFIG_VIDEO_OG01A1B) +=3D og01a1b.o=0A=
>>=A0=A0 obj-$(CONFIG_VIDEO_OG0VE1B) +=3D og0ve1b.o=0A=
>> +obj-$(CONFIG_VIDEO_OS05B10) +=3D os05b10.o=0A=
>>=A0=A0 obj-$(CONFIG_VIDEO_OV01A10) +=3D ov01a10.o=0A=
>>=A0=A0 obj-$(CONFIG_VIDEO_OV02A10) +=3D ov02a10.o=0A=
>>=A0=A0 obj-$(CONFIG_VIDEO_OV02C10) +=3D ov02c10.o=0A=
>> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c=
=0A=
>> new file mode 100644=0A=
>> index 000000000000..319428f48f72=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/media/i2c/os05b10.c=0A=
>> @@ -0,0 +1,1115 @@=0A=
>> +// SPDX-License-Identifier: GPL-2.0=0A=
>> +/*=0A=
>> + * V4L2 Support for the os05b10=0A=
>> + *=0A=
>> + * Copyright (C) 2025 Silicon Signals Pvt. Ltd.=0A=
>> + *=0A=
>> + * Inspired from imx219, ov2735 camera drivers.=0A=
>> + */=0A=
>> +=0A=
>> +#include <linux/array_size.h>=0A=
>> +#include <linux/bitops.h>=0A=
>> +#include <linux/cleanup.h>=0A=
>> +#include <linux/clk.h>=0A=
>> +#include <linux/container_of.h>=0A=
>> +#include <linux/delay.h>=0A=
>> +#include <linux/device/devres.h>=0A=
>> +#include <linux/err.h>=0A=
>> +#include <linux/gpio/consumer.h>=0A=
>> +#include <linux/i2c.h>=0A=
>> +#include <linux/module.h>=0A=
>> +#include <linux/pm_runtime.h>=0A=
>> +#include <linux/property.h>=0A=
>> +#include <linux/regulator/consumer.h>=0A=
>> +#include <linux/units.h>=0A=
>> +#include <linux/types.h>=0A=
>> +#include <linux/time.h>=0A=
>> +=0A=
>> +#include <media/v4l2-cci.h>=0A=
>> +#include <media/v4l2-ctrls.h>=0A=
>> +#include <media/v4l2-device.h>=0A=
>> +#include <media/v4l2-fwnode.h>=0A=
>> +#include <media/v4l2-mediabus.h>=0A=
>> +=0A=
>> +#define OS05B10_XCLK_FREQ=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (24 * HZ_PER=
_MHZ)=0A=
>> +=0A=
>> +#define OS05B10_REG_CHIP_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG24(0x300A=
)=0A=
>> +#define OS05B10_CHIP_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 0x530641=0A=
>> +=0A=
>> +#define OS05B10_REG_CTRL_MODE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 CCI_REG8(0x0100)=0A=
>> +#define OS05B10_MODE_STANDBY=A0=A0=A0=A0=A0=A0=A0=A0 0x00=0A=
>> +#define OS05B10_MODE_STREAMING=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 0x01=0A=
>> +=0A=
>> +#define OS05B10_REG_VTS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 CCI_REG16(0x380E)=0A=
>> +#define OS05B10_VTS_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 0xFFFF=0A=
>> +=0A=
>> +#define OS05B10_REG_HTS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 CCI_REG16(0x380C)=0A=
>> +=0A=
>> +#define OS05B10_ANALOG_GAIN=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x3508=
)=0A=
>> +#define OS05B10_ANALOG_GAIN_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0x80=0A=
>> +#define OS05B10_ANALOG_GAIN_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0x7C0=0A=
>> +#define OS05B10_ANALOG_GAIN_STEP=A0=A0=A0=A0 1=0A=
>> +#define OS05B10_ANALOG_GAIN_DEFAULT=A0=A0=A0=A0 0x80=0A=
>> +=0A=
>> +#define OS05B10_EXPOSURE_GAIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 CCI_REG24(0x3500)=0A=
>> +#define OS05B10_EXPOSURE_MIN=A0=A0=A0=A0=A0=A0=A0=A0 2=0A=
>> +#define OS05B10_EXPOSURE_STEP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 1=0A=
>> +#define OS05B10_EXPOSURE_MARGIN=A0=A0=A0=A0=A0=A0=A0=A0 8=0A=
>> +=0A=
>> +#define OS05B10_PIXEL_RATE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (480 * HZ_PER_=
MHZ)=0A=
>> +#define OS05B10_LINK_FREQ_600MHZ=A0=A0=A0=A0 (600 * HZ_PER_MHZ)=0A=
>> +=0A=
>> +static const struct v4l2_rect os05b10_native_area =3D {=0A=
>> +=A0=A0=A0=A0 .top =3D 0,=0A=
>> +=A0=A0=A0=A0 .left =3D 0,=0A=
>> +=A0=A0=A0=A0 .width =3D 2608,=0A=
>> +=A0=A0=A0=A0 .height =3D 1960,=0A=
>> +};=0A=
>> +=0A=
>> +static const struct v4l2_rect os05b10_active_area =3D {=0A=
>> +=A0=A0=A0=A0 .top =3D 8,=0A=
>> +=A0=A0=A0=A0 .left =3D 8,=0A=
>> +=A0=A0=A0=A0 .width =3D 2592,=0A=
>> +=A0=A0=A0=A0 .height =3D 1944,=0A=
>> +};=0A=
>> +=0A=
>> +static const char * const os05b10_supply_name[] =3D {=0A=
>> +=A0=A0=A0=A0 "avdd", /*Analog supply 2.8v */=0A=
>> +=A0=A0=A0=A0 "dvdd", /*Digital core 1.2v */=0A=
>> +=A0=A0=A0=A0 "dovdd", /*Digital IO 1.8v */=0A=
>> +};=0A=
>=0A=
>Move voltage levels of supplies to the descriptions of voltage supplies=0A=
>in the added dt binding documentation file, that's the proper place to=0A=
>store this type of information.=0A=
>=0A=
>Also note that there should be a space symbol after '/*'.=0A=
>=0A=
>> +=0A=
>> +static const struct cci_reg_sequence os05b10_common_regs[] =3D {=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x0103), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x0301), 0x44 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x0303), 0x02 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x0305), 0x32 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x0306), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x0325), 0x3b },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3002), 0x21 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3016), 0x72 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x301e), 0xb4 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x301f), 0xd0 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3021), 0x03 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3022), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3107), 0xa1 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3108), 0x7d },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3109), 0xfc },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3500), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3501), 0x07 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3502), 0xb6 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3503), 0x88 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3508), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3509), 0x80 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x350a), 0x04 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x350b), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x350c), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x350d), 0x80 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x350e), 0x04 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x350f), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3510), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3511), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3512), 0x20 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3600), 0x4d },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3601), 0x08 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3610), 0x87 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3611), 0x24 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3614), 0x4c },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3620), 0x0c },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3632), 0x80 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3633), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3636), 0xcc },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3637), 0x27 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3660), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3662), 0x10 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3665), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3666), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x366a), 0x14 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3670), 0x0b },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3671), 0x0b },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3672), 0x0b },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3673), 0x0b },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3678), 0x2b },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x367a), 0x11 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x367b), 0x11 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x367c), 0x11 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x367d), 0x11 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3681), 0xff },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3682), 0x86 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3683), 0x44 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3684), 0x24 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3685), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x368a), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x368d), 0x2b },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x368e), 0x2b },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3690), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3691), 0x0b },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3692), 0x0b },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3693), 0x0b },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3694), 0x0b },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x369d), 0x68 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x369e), 0x34 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x369f), 0x1b },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36a0), 0x0f },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36a1), 0x77 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36b0), 0x30 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36b2), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36b3), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36b4), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36b5), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36b6), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36b7), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36b8), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36b9), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36ba), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36bb), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36bc), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36bd), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36be), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36bf), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36c0), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36c1), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36c2), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36c3), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36c4), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36c5), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36c6), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36c7), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36c8), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36c9), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36ca), 0x0e },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36cb), 0x0e },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36cc), 0x0e },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36cd), 0x0e },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36ce), 0x0c },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36cf), 0x0c },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36d0), 0x0c },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36d1), 0x0c },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36d2), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36d3), 0x08 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36d4), 0x10 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36d5), 0x10 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36d6), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36d7), 0x08 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36d8), 0x10 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x36d9), 0x10 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3701), 0x1d },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3703), 0x2a },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3704), 0x05 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3709), 0x57 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x370b), 0x63 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3706), 0x28 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x370a), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x370b), 0x63 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x370e), 0x0c },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x370f), 0x1c },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3710), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3713), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3714), 0x24 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3716), 0x24 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x371a), 0x1e },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3724), 0x09 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3725), 0xb2 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x372b), 0x54 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3730), 0xe1 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3735), 0x80 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3739), 0x10 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x373f), 0xb0 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3740), 0x28 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3741), 0x21 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3742), 0x21 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3743), 0x21 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3744), 0x63 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3745), 0x5a },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3746), 0x5a },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3747), 0x5a },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3748), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3749), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x374a), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x374b), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3756), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3757), 0x0e },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x375d), 0x84 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3760), 0x11 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3767), 0x08 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x376f), 0x42 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3771), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3773), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3774), 0x02 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3775), 0x12 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3776), 0x02 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x377b), 0x40 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x377c), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x377d), 0x0c },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3782), 0x02 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3787), 0x24 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x378a), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x378d), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3790), 0x1f },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3791), 0x58 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3795), 0x24 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3796), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3798), 0x40 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x379c), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x379d), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x379e), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x379f), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37a1), 0x10 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37a6), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37ab), 0x0e },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37ac), 0xa0 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37be), 0x0a },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37bf), 0x05 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37bb), 0x02 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37bf), 0x05 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37c2), 0x04 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37c4), 0x11 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37c5), 0x80 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37c6), 0x14 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37c7), 0x08 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37c8), 0x42 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37cd), 0x17 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37ce), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37d8), 0x02 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37d9), 0x08 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37dc), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37e0), 0x0c },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37e1), 0x20 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37e2), 0x10 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37e3), 0x04 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37e4), 0x28 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37e5), 0x02 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37ef), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37f4), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37f5), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37f6), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37f7), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3800), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3801), 0x30 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3802), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3803), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3804), 0x0b },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3805), 0x5f },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3806), 0x07 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3807), 0xa7 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3808), 0x0a },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3809), 0x20 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x380a), 0x07 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x380b), 0x98 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x380c), 0x06 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x380d), 0xd0 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x380e), 0x07 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x380f), 0xd6 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3810), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3811), 0x08 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3812), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3813), 0x08 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3814), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3815), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3816), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3817), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3818), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3819), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x381a), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x381b), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3820), 0x88 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3821), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3822), 0x12 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3823), 0x08 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3824), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3825), 0x20 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3826), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3827), 0x08 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3829), 0x03 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x382a), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x382b), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3832), 0x08 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3838), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3839), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x383a), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x383b), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x383d), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x383e), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x383f), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3843), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3880), 0x16 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3881), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3882), 0x08 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x389a), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x389b), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x38a2), 0x02 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x38a3), 0x02 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x38a4), 0x02 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x38a5), 0x02 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x38a7), 0x04 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x38b8), 0x02 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3c80), 0x3e },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3c86), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3c87), 0x02 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x389c), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3ca2), 0x0c },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3d85), 0x1b },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3d8c), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3d8d), 0xe2 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3f00), 0xcb },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3f03), 0x08 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3f9e), 0x07 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3f9f), 0x04 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4000), 0xf3 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4002), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4003), 0x40 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4008), 0x02 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4009), 0x0d },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x400a), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x400b), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4040), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4041), 0x07 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4090), 0x14 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x40b0), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x40b1), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x40b2), 0x30 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x40b3), 0x04 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x40b4), 0xe8 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x40b5), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x40b7), 0x07 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x40b8), 0xff },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x40b9), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x40ba), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4300), 0xff },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4301), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4302), 0x0f },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4303), 0x20 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4304), 0x20 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4305), 0x83 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4306), 0x21 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x430d), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4505), 0xc4 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4506), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4507), 0x60 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4803), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4809), 0x8e },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x480e), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4813), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4814), 0x2a },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x481b), 0x40 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x481f), 0x30 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4825), 0x34 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4829), 0x64 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4837), 0x12 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x484b), 0x07 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4883), 0x36 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4885), 0x03 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x488b), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4d06), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4e00), 0x2a },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x4e0d), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x5000), 0xf9 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x5001), 0x09 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x5004), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x5005), 0x0e },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x5036), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x5080), 0x04 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x5082), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x5180), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x5181), 0x10 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x5182), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x5183), 0xdf },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x5184), 0x02 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x5185), 0x6c },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x5189), 0x48 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x520a), 0x03 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x520b), 0x0f },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x520c), 0x3f },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x580b), 0x03 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x580d), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x580f), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x5820), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x5821), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3222), 0x03 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3208), 0x06 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3701), 0x1d },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37ab), 0x01 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3790), 0x21 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x38be), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3791), 0x5a },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37bf), 0x1c },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3610), 0x37 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3208), 0x16 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3208), 0x07 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3701), 0x1d },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37ab), 0x0e },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3790), 0x21 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x38be), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3791), 0x5a },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37bf), 0x0a },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3610), 0x87 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3208), 0x17 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3208), 0x08 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3701), 0x1d },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37ab), 0x0e },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3790), 0x21 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x38be), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3791), 0x5a },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37bf), 0x0a },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3610), 0x87 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3208), 0x18 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3208), 0x09 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3701), 0x1d },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37ab), 0x0e },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3790), 0x28 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x38be), 0x00 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3791), 0x63 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x37bf), 0x0a },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3610), 0x87 },=0A=
>> +=A0=A0=A0=A0 { CCI_REG8(0x3208), 0x19 },=0A=
>> +};=0A=
>> +=0A=
>> +struct os05b10 {=0A=
>> +=A0=A0=A0=A0 struct device *dev;=0A=
>> +=A0=A0=A0=A0 struct regmap *cci;=0A=
>> +=A0=A0=A0=A0 struct v4l2_subdev sd;=0A=
>> +=A0=A0=A0=A0 struct media_pad pad;=0A=
>> +=A0=A0=A0=A0 struct clk *xclk;=0A=
>> +=A0=A0=A0=A0 struct i2c_client *client;=0A=
>> +=A0=A0=A0=A0 struct gpio_desc *reset_gpio;=0A=
>> +=A0=A0=A0=A0 struct regulator_bulk_data supplies[ARRAY_SIZE(os05b10_sup=
ply_name)];=0A=
>> +=0A=
>> +=A0=A0=A0=A0 /* V4L2 Controls */=0A=
>> +=A0=A0=A0=A0 struct v4l2_ctrl_handler handler;=0A=
>> +=A0=A0=A0=A0 struct v4l2_ctrl *link_freq;=0A=
>> +=A0=A0=A0=A0 struct v4l2_ctrl *pixel_rate;=0A=
>=0A=
>The 'pixel_rate' pointer to a control can be removed, the control is fixed=
.=0A=
>=0A=
>> +=A0=A0=A0=A0 struct v4l2_ctrl *hblank;=0A=
>> +=A0=A0=A0=A0 struct v4l2_ctrl *vblank;=0A=
>> +=A0=A0=A0=A0 struct v4l2_ctrl *gain;=0A=
>> +=A0=A0=A0=A0 struct v4l2_ctrl *exposure;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 unsigned long link_freq_index;=0A=
>=0A=
>link_freq_index is always 0, thus it can be removed.=0A=
link_freq_index cannot be removed when using v4l2_link_freq_to_bitmap(), as=
 the helper always writes to the provided pointer and therefore requires a =
valid storage address. Keeping it also allows the code to be easily extende=
d in the future if support for multiple link frequencies is added.=0A=
>=0A=
>> +};=0A=
>> +=0A=
>> +struct os05b10_mode {=0A=
>> +=A0=A0=A0=A0 u32 width;=0A=
>> +=A0=A0=A0=A0 u32 height;=0A=
>> +=A0=A0=A0=A0 u32 vts; /* default VTS */=0A=
>> +=A0=A0=A0=A0 u32 hts; /* default HTS */=0A=
>> +=A0=A0=A0=A0 u32 exp; /* default exposure */=0A=
>> +};=0A=
>> +=0A=
>> +static const struct os05b10_mode supported_modes_10bit[] =3D {=0A=
>> +=A0=A0=A0=A0 {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* 2592x1944 */=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .width =3D 2592,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .height =3D 1944,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .vts =3D 2006,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .hts =3D 2616,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .exp =3D 1944,=0A=
>> +=A0=A0=A0=A0 },=0A=
>> +};=0A=
>> +=0A=
>> +static const s64 link_frequencies[] =3D {=0A=
>> +=A0=A0=A0=A0 OS05B10_LINK_FREQ_600MHZ,=0A=
>> +};=0A=
>> +=0A=
>> +static const u32 os05b10_mbus_codes[] =3D {=0A=
>> +=A0=A0=A0=A0 MEDIA_BUS_FMT_SBGGR10_1X10,=0A=
>> +};=0A=
>> +=0A=
>> +static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 return container_of_const(sd, struct os05b10, sd);=0A=
>> +};=0A=
>> +=0A=
>> +static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 struct os05b10 *os05b10 =3D container_of_const(ctrl->handl=
er,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 struct os05b10, handler);=0A=
>> +=A0=A0=A0=A0 struct v4l2_mbus_framefmt *fmt;=0A=
>> +=A0=A0=A0=A0 struct v4l2_subdev_state *state;=0A=
>> +=A0=A0=A0=A0 int vmax, ret;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 state =3D v4l2_subdev_get_locked_active_state(&os05b10->sd=
);=0A=
>> +=A0=A0=A0=A0 fmt =3D v4l2_subdev_state_get_format(state, 0);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Honour the VBLANK limits when s=
etting exposure. */=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 s64 max =3D fmt->height + ctrl->va=
l - OS05B10_EXPOSURE_MARGIN;=0A=
>> +=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(o=
s05b10->exposure,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 os05b10->expos=
ure->minimum, max,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 os05b10->expos=
ure->step,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 os05b10->expos=
ure->default_value);=0A=
>> +=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret=
;=0A=
>> +=A0=A0=A0=A0 }=0A=
>> +=0A=
>> +=A0=A0=A0=A0 if (pm_runtime_get_if_in_use(os05b10->dev) =3D=3D 0)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 switch (ctrl->id) {=0A=
>> +=A0=A0=A0=A0 case V4L2_CID_VBLANK:=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vmax =3D fmt->height + ctrl->val;=
=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_write(os05b10->cci, OS=
05B10_REG_VTS, vmax, NULL);=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
>> +=A0=A0=A0=A0 case V4L2_CID_ANALOGUE_GAIN:=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_write(os05b10->cci, OS=
05B10_ANALOG_GAIN, ctrl->val,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 NULL);=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
>> +=A0=A0=A0=A0 case V4L2_CID_EXPOSURE:=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_write(os05b10->cci, OS=
05B10_EXPOSURE_GAIN, ctrl->val,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 NULL);=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
>> +=A0=A0=A0=A0 default:=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(os05b10->dev, "ctrl(id:0x%=
x, val:0x%x) is not handled\n",=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrl->id, =
ctrl->val);=0A=
>=0A=
>Here you shall assign 'ret =3D -EINVAL', otherwise you return an unset val=
ue.=0A=
>=0A=
>Here you shall remove dev_err(), otherwise you just open a way to a user=
=0A=
>to flood the kernel log buffer.=0A=
>=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
>> +=A0=A0=A0=A0 }=0A=
>> +=0A=
>> +=A0=A0=A0=A0 pm_runtime_put(os05b10->dev);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 return ret;=0A=
>> +}=0A=
>> +=0A=
>> +static int os05b10_get_regulators(struct os05b10 *os05b10)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 unsigned int i;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 for (i =3D 0; i < ARRAY_SIZE(os05b10_supply_name); i++)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 os05b10->supplies[i].supply =3D os=
05b10_supply_name[i];=0A=
>> +=0A=
>> +=A0=A0=A0=A0 return devm_regulator_bulk_get(os05b10->dev,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(os05b10_supply_name),=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 os05b10->supplies);=0A=
>> +}=0A=
>=0A=
>I'd rather suggest not to make a separate trivial one time called funtion=
=0A=
>here, just embed it into the .probe().=0A=
>=0A=
>> +=0A=
>> +static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_mbus_code_enum *code)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 if (code->index >=3D ARRAY_SIZE(os05b10_mbus_codes))=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 code->code =3D os05b10_mbus_codes[code->index];=0A=
>> +=0A=
>> +=A0=A0=A0=A0 return 0;=0A=
>> +}=0A=
>> +=0A=
>> +static int os05b10_set_framing_limits(struct os05b10 *os05b10,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 const struct os05b10_mode *mode)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 u32 hblank, vblank, vblank_max, max_exp;=0A=
>> +=A0=A0=A0=A0 int ret;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 hblank =3D mode->hts - mode->width;=0A=
>> +=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(os05b10->hblank, hblank, =
hblank, 1, hblank);=0A=
>> +=A0=A0=A0=A0 if (ret)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 vblank =3D mode->vts - mode->height;=0A=
>> +=A0=A0=A0=A0 vblank_max =3D OS05B10_VTS_MAX - mode->height;=0A=
>> +=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(os05b10->vblank, 0, vblan=
k_max, 1, vblank);=0A=
>> +=A0=A0=A0=A0 if (ret)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 max_exp =3D mode->vts - OS05B10_EXPOSURE_MARGIN;=0A=
>> +=A0=A0=A0=A0 return __v4l2_ctrl_modify_range(os05b10->exposure,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10_EXPOSURE_MIN, max_exp,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10_EXPOSURE_STEP, mode->exp);=
=0A=
>> +}=0A=
>> +=0A=
>> +static int os05b10_set_pad_format(struct v4l2_subdev *sd,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_format *fmt)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 struct v4l2_mbus_framefmt *format;=0A=
>> +=A0=A0=A0=A0 const struct os05b10_mode *mode =3D &supported_modes_10bit=
[0];=0A=
>> +=A0=A0=A0=A0 struct os05b10 *os05b10 =3D to_os05b10(sd);=0A=
>=0A=
>If possible, please sort the list of local variable declarations in=0A=
>"reverse Chrismas tree" order, this way it looks tidier and slightly more=
=0A=
>readable.=0A=
>=0A=
>"Reverse xmas tree" order is when the variable declaration lines are start=
ed=0A=
>from the longest one to the shortest one.=0A=
>=0A=
>> +=A0=A0=A0=A0 int ret;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 fmt->format.width =3D mode->width;=0A=
>> +=A0=A0=A0=A0 fmt->format.height =3D mode->height;=0A=
>> +=A0=A0=A0=A0 fmt->format.field =3D V4L2_FIELD_NONE;=0A=
>> +=A0=A0=A0=A0 fmt->format.colorspace =3D V4L2_COLORSPACE_RAW;=0A=
>> +=A0=A0=A0=A0 fmt->format.quantization =3D V4L2_QUANTIZATION_FULL_RANGE;=
=0A=
>> +=A0=A0=A0=A0 fmt->format.xfer_func =3D V4L2_XFER_FUNC_NONE;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 format =3D v4l2_subdev_state_get_format(sd_state, 0);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D os05b10_set_framing_limits=
(os05b10, mode);=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret=
;=0A=
>> +=A0=A0=A0=A0 }=0A=
>> +=0A=
>> +=A0=A0=A0=A0 *format =3D fmt->format;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 return 0;=0A=
>> +}=0A=
>> +=0A=
>> +static int os05b10_get_selection(struct v4l2_subdev *sd,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_selection *sel)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 switch (sel->target) {=0A=
>> +=A0=A0=A0=A0 case V4L2_SEL_TGT_NATIVE_SIZE:=0A=
>> +=A0=A0=A0=A0 case V4L2_SEL_TGT_CROP_BOUNDS:=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r =3D os05b10_native_area;=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
>> +=A0=A0=A0=A0 case V4L2_SEL_TGT_CROP:=0A=
>> +=A0=A0=A0=A0 case V4L2_SEL_TGT_CROP_DEFAULT:=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r =3D os05b10_active_area;=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
>> +=A0=A0=A0=A0 default:=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
>> +=A0=A0=A0=A0 }=0A=
>> +}=0A=
>> +=0A=
>> +static int os05b10_enum_frame_size(struct v4l2_subdev *sd,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_frame_size_enum *fse)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 if (fse->index >=3D ARRAY_SIZE(supported_modes_10bit))=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 if (fse->index >=3D 1)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
>=0A=
>These two checks above are equal, so one of them shall be removed.=0A=
>=0A=
>> +=0A=
>> +=A0=A0=A0=A0 fse->min_width =3D supported_modes_10bit[fse->index].width=
;=0A=
>> +=A0=A0=A0=A0 fse->max_width =3D fse->min_width;=0A=
>> +=A0=A0=A0=A0 fse->min_height =3D supported_modes_10bit[fse->index].heig=
ht;=0A=
>> +=A0=A0=A0=A0 fse->max_height =3D fse->min_height;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 return 0;=0A=
>> +}=0A=
>> +=0A=
>> +static int os05b10_enable_streams(struct v4l2_subdev *sd,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 u32 pad, u64 streams_mask)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 struct os05b10 *os05b10 =3D to_os05b10(sd);=0A=
>> +=A0=A0=A0=A0 int ret;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 ret =3D pm_runtime_resume_and_get(os05b10->dev);=0A=
>> +=A0=A0=A0=A0 if (ret < 0)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 /* Write common registers */=0A=
>> +=A0=A0=A0=A0 ret =3D cci_multi_reg_write(os05b10->cci, os05b10_common_r=
egs,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(os05b10_common_regs), NULL);=0A=
>> +=A0=A0=A0=A0 if (ret) {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(os05b10->dev, "%s failed t=
o write common registers\n",=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __func__);=
=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_rpm_put;=0A=
>> +=A0=A0=A0=A0 }=0A=
>> +=0A=
>> +=A0=A0=A0=A0 /* Apply customized user controls */=0A=
>> +=A0=A0=A0=A0 ret =3D __v4l2_ctrl_handler_setup(os05b10->sd.ctrl_handler=
);=0A=
>> +=A0=A0=A0=A0 if (ret)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_rpm_put;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 /* Stream ON */=0A=
>> +=A0=A0=A0=A0 ret =3D cci_write(os05b10->cci, OS05B10_REG_CTRL_MODE,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10_MO=
DE_STREAMING, NULL);=0A=
>> +=A0=A0=A0=A0 if (ret)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_rpm_put;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 return 0;=0A=
>> +=0A=
>> +err_rpm_put:=0A=
>> +=A0=A0=A0=A0 pm_runtime_put(os05b10->dev);=0A=
>> +=A0=A0=A0=A0 return ret;=0A=
>> +}=0A=
>> +=0A=
>> +static int os05b10_disable_streams(struct v4l2_subdev *sd,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 u32 pad, u64 streams_mask)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 struct os05b10 *os05b10 =3D to_os05b10(sd);=0A=
>> +=A0=A0=A0=A0 int ret;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 ret =3D cci_write(os05b10->cci, OS05B10_REG_CTRL_MODE,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10_MO=
DE_STANDBY, NULL);=0A=
>> +=A0=A0=A0=A0 if (ret)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(os05b10->dev, "%s failed t=
o set stream off\n", __func__);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 pm_runtime_put(os05b10->dev);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 return ret;=0A=
>> +}=0A=
>> +=0A=
>> +static int os05b10_init_state(struct v4l2_subdev *sd,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 struct v4l2_subdev_state *state)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 struct v4l2_mbus_framefmt *format;=0A=
>> +=A0=A0=A0=A0 const struct os05b10_mode *mode;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 /* Initialize try_fmt */=0A=
>> +=A0=A0=A0=A0 format =3D v4l2_subdev_state_get_format(state, 0);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 mode =3D &supported_modes_10bit[0];=0A=
>> +=A0=A0=A0=A0 format->code =3D MEDIA_BUS_FMT_SBGGR10_1X10;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 /* Update image pad formate */=0A=
>> +=A0=A0=A0=A0 format->width =3D mode->width;=0A=
>> +=A0=A0=A0=A0 format->height =3D mode->height;=0A=
>> +=A0=A0=A0=A0 format->field =3D V4L2_FIELD_NONE;=0A=
>> +=A0=A0=A0=A0 format->colorspace =3D V4L2_COLORSPACE_RAW;=0A=
>> +=A0=A0=A0=A0 format->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;=0A=
>> +=A0=A0=A0=A0 format->xfer_func =3D V4L2_XFER_FUNC_NONE;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 return 0;=0A=
>> +}=0A=
>> +=0A=
>> +static const struct v4l2_subdev_video_ops os05b10_video_ops =3D {=0A=
>> +=A0=A0=A0=A0 .s_stream =3D v4l2_subdev_s_stream_helper,=0A=
>> +};=0A=
>> +=0A=
>> +static const struct v4l2_subdev_pad_ops os05b10_pad_ops =3D {=0A=
>> +=A0=A0=A0=A0 .enum_mbus_code =3D os05b10_enum_mbus_code,=0A=
>> +=A0=A0=A0=A0 .get_fmt =3D v4l2_subdev_get_fmt,=0A=
>> +=A0=A0=A0=A0 .set_fmt =3D os05b10_set_pad_format,=0A=
>> +=A0=A0=A0=A0 .get_selection =3D os05b10_get_selection,=0A=
>> +=A0=A0=A0=A0 .enum_frame_size =3D os05b10_enum_frame_size,=0A=
>> +=A0=A0=A0=A0 .enable_streams =3D os05b10_enable_streams,=0A=
>> +=A0=A0=A0=A0 .disable_streams =3D os05b10_disable_streams,=0A=
>> +};=0A=
>> +=0A=
>> +static const struct v4l2_subdev_internal_ops os05b10_internal_ops =3D {=
=0A=
>> +=A0=A0=A0=A0 .init_state =3D os05b10_init_state,=0A=
>> +};=0A=
>> +=0A=
>> +static const struct v4l2_subdev_ops os05b10_subdev_ops =3D {=0A=
>> +=A0=A0=A0=A0 .video =3D &os05b10_video_ops,=0A=
>> +=A0=A0=A0=A0 .pad =3D &os05b10_pad_ops,=0A=
>> +};=0A=
>> +=0A=
>> +static const struct v4l2_ctrl_ops os05b10_ctrl_ops =3D {=0A=
>> +=A0=A0=A0=A0 .s_ctrl =3D os05b10_set_ctrl,=0A=
>> +};=0A=
>> +=0A=
>> +static int os05b10_identify_module(struct os05b10 *os05b10)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 int ret;=0A=
>> +=A0=A0=A0=A0 u64 val;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 ret =3D cci_read(os05b10->cci, OS05B10_REG_CHIP_ID, &val, =
NULL);=0A=
>> +=A0=A0=A0=A0 if (ret)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(os05b10->dev,=
 ret,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to read chip id %x\n",=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10_CHIP_ID);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 if (val !=3D OS05B10_CHIP_ID)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(os05b10->dev,=
 -EIO,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "chip id mismatch: %x!=3D%llx\n",=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10_CHIP_ID, val);=0A=
>> +=A0=A0=A0=A0 return 0;=0A=
>> +}=0A=
>> +=0A=
>> +static int os05b10_power_on(struct device *dev)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
>> +=A0=A0=A0=A0 struct os05b10 *os05b10 =3D to_os05b10(sd);=0A=
>> +=A0=A0=A0=A0 unsigned long delay_us;=0A=
>> +=A0=A0=A0=A0 int ret;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 /* Enable power rails */=0A=
>> +=A0=A0=A0=A0 ret =3D regulator_bulk_enable(ARRAY_SIZE(os05b10_supply_na=
me),=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 os05b10->supplies);=0A=
>=0A=
>If you have an access to the sensor datasheet document, please double=0A=
>check the power on/off sequencies, it might happen that the unordered=0A=
>bulk operation should be replaced by a more specific sequence given=0A=
>by the Omnivision.=0A=
According to the datasheet, the power supplies dvdd, dovdd, and avdd can be=
 applied in any order; however, XSHUTDOWN must be asserted only after all t=
hree supplies are enabled.=0A=
>> +=A0=A0=A0=A0 if (ret) {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(os05b10->dev, "failed to e=
nable regulators\n");=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
>> +=A0=A0=A0=A0 }=0A=
>> +=0A=
>> +=A0=A0=A0=A0 /* Enable xclk */=0A=
>> +=A0=A0=A0=A0 ret =3D clk_prepare_enable(os05b10->xclk);=0A=
>> +=A0=A0=A0=A0 if (ret) {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(os05b10->dev, "failed to e=
nable clock\n");=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_regulator_off;=0A=
>> +=A0=A0=A0=A0 }=0A=
>> +=0A=
>> +=A0=A0=A0=A0 gpiod_set_value_cansleep(os05b10->reset_gpio, 0);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 /* Delay T1 */=0A=
>> +=A0=A0=A0=A0 fsleep(5 * USEC_PER_MSEC);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 /* Delay T2 (8192 cycles before SCCB/I2C access) */=0A=
>> +=A0=A0=A0=A0 delay_us =3D DIV_ROUND_UP(8192, OS05B10_XCLK_FREQ / 1000 /=
 1000);=0A=
>> +=A0=A0=A0=A0 usleep_range(delay_us, delay_us * 2);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 return 0;=0A=
>> +=0A=
>> +err_regulator_off:=0A=
>> +=A0=A0=A0=A0 regulator_bulk_disable(ARRAY_SIZE(os05b10_supply_name),=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 os05b10->supplies);=0A=
>> +=A0=A0=A0=A0 return ret;=0A=
>> +}=0A=
>> +=0A=
>> +static int os05b10_power_off(struct device *dev)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
>> +=A0=A0=A0=A0 struct os05b10 *os05b10 =3D to_os05b10(sd);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 gpiod_set_value_cansleep(os05b10->reset_gpio, 1);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 regulator_bulk_disable(ARRAY_SIZE(os05b10_supply_name), os=
05b10->supplies);=0A=
>> +=A0=A0=A0=A0 clk_disable_unprepare(os05b10->xclk);=0A=
>=0A=
>Please insert a blank line here to separate the return for improving=0A=
>readability.=0A=
>=0A=
>> +=A0=A0=A0=A0 return 0;=0A=
>> +}=0A=
>> +=0A=
>> +static int os05b10_parse_endpoint(struct os05b10 *os05b10)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 struct v4l2_fwnode_endpoint bus_cfg =3D {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .bus_type =3D V4L2_MBUS_CSI2_DPHY=
=0A=
>> +=A0=A0=A0=A0 };=0A=
>> +=A0=A0=A0=A0 struct fwnode_handle *ep;=0A=
>> +=A0=A0=A0=A0 int ret;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 ep =3D fwnode_graph_get_next_endpoint(dev_fwnode(os05b10->=
dev), NULL);=0A=
>> +=A0=A0=A0=A0 if (!ep) {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(os05b10->dev, "Failed to g=
et next endpoint\n");=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENXIO;=0A=
>> +=A0=A0=A0=A0 }=0A=
>> +=0A=
>> +=A0=A0=A0=A0 ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);=0A=
>> +=A0=A0=A0=A0 fwnode_handle_put(ep);=0A=
>> +=A0=A0=A0=A0 if (ret)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
>> +=0A=
>=0A=
>Here you should add a check for bus_cfg.bus.mipi_csi2.num_data_lanes, whic=
h=0A=
>is supported by the driver, is it 2 or 4?=0A=
>=0A=
>> +=A0=A0=A0=A0 ret =3D v4l2_link_freq_to_bitmap(os05b10->dev, bus_cfg.lin=
k_frequencies,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bus_cfg.nr_of_link_frequencies,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 link_frequencies,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(link_frequencies),=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &os05b10->link_freq_index);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 if (ret)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(os05b10->dev, "only 600MHz=
 frequency is available\n");=0A=
>> +=0A=
>> +=A0=A0=A0=A0 v4l2_fwnode_endpoint_free(&bus_cfg);=0A=
>=0A=
>Please insert a blank line here to separate the return for improving=0A=
>readability.=0A=
>=0A=
>> +=A0=A0=A0=A0 return ret;=0A=
>> +}=0A=
>> +=0A=
>> +static int os05b10_init_controls(struct os05b10 *os05b10)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 struct v4l2_ctrl_handler *ctrl_hdlr;=0A=
>> +=A0=A0=A0=A0 struct v4l2_fwnode_device_properties props;=0A=
>> +=A0=A0=A0=A0 const struct os05b10_mode *mode =3D &supported_modes_10bit=
[0];=0A=
>> +=A0=A0=A0=A0 u64 hblank_def, vblank_def, exp_max;=0A=
>> +=A0=A0=A0=A0 int ret;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 ctrl_hdlr =3D &os05b10->handler;=0A=
>> +=A0=A0=A0=A0 v4l2_ctrl_handler_init(ctrl_hdlr, 8);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 os05b10->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &os05=
b10_ctrl_ops,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_PI=
XEL_RATE,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10_PIX=
EL_RATE,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10_PIX=
EL_RATE, 1,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10_PIX=
EL_RATE);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 os05b10->link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr, &=
os05b10_ctrl_ops,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 V4L2_CID_LINK_FREQ,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 os05b10->link_freq_index,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 0, link_frequencies);=0A=
>> +=A0=A0=A0=A0 if (os05b10->link_freq)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 os05b10->link_freq->flags |=3D V4L=
2_CTRL_FLAG_READ_ONLY;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 hblank_def =3D mode->hts - mode->width;=0A=
>> +=A0=A0=A0=A0 os05b10->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L=
2_CID_HBLANK,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hblank_def, hblank_def,=
 1, hblank_def);=0A=
>> +=A0=A0=A0=A0 if (os05b10->hblank)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 os05b10->hblank->flags |=3D V4L2_C=
TRL_FLAG_READ_ONLY;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 vblank_def =3D mode->vts - mode->height;=0A=
>> +=A0=A0=A0=A0 os05b10->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_=
ctrl_ops,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_VBLANK, vblank=
_def,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10_VTS_MAX - mode-=
>height,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, vblank_def);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 exp_max =3D mode->vts - OS05B10_EXPOSURE_MARGIN;=0A=
>> +=A0=A0=A0=A0 os05b10->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &os05b1=
0_ctrl_ops,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_EXPOSURE=
,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10_EXPOSURE_=
MIN,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exp_max, OS05B10_=
EXPOSURE_STEP,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode->exp);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 os05b10->gain =3D v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ct=
rl_ops,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_ANALOGUE_GAIN,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10_ANALOG_GAIN_MIN,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10_ANALOG_GAIN_MAX,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10_ANALOG_GAIN_STEP,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10_ANALOG_GAIN_DEFAULT);=
=0A=
>> +=0A=
>> +=A0=A0=A0=A0 if (ctrl_hdlr->error) {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D ctrl_hdlr->error;=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(os05b10->dev, "control ini=
t failed (%d)\n", ret);=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error;=0A=
>> +=A0=A0=A0=A0 }=0A=
>> +=0A=
>> +=A0=A0=A0=A0 ret =3D v4l2_fwnode_device_parse(os05b10->dev, &props);=0A=
>> +=A0=A0=A0=A0 if (ret)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 ret =3D v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b1=
0_ctrl_ops,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &props);=0A=
>> +=A0=A0=A0=A0 if (ret)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 os05b10->sd.ctrl_handler =3D ctrl_hdlr;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 return 0;=0A=
>=0A=
>Please insert a blank line between return and the next goto label.=0A=
>=0A=
>> +error:=0A=
>> +=A0=A0=A0=A0 v4l2_ctrl_handler_free(ctrl_hdlr);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 return ret;=0A=
>> +}=0A=
>> +=0A=
>> +static int os05b10_probe(struct i2c_client *client)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 struct os05b10 *os05b10;=0A=
>> +=A0=A0=A0=A0 unsigned int xclk_freq;=0A=
>> +=A0=A0=A0=A0 int ret;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 os05b10 =3D devm_kzalloc(&client->dev, sizeof(*os05b10), G=
FP_KERNEL);=0A=
>> +=A0=A0=A0=A0 if (!os05b10)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 os05b10->client =3D client;=0A=
>> +=A0=A0=A0=A0 os05b10->dev =3D &client->dev;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 v4l2_i2c_subdev_init(&os05b10->sd, client, &os05b10_subdev=
_ops);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 os05b10->cci =3D devm_cci_regmap_init_i2c(client, 16);=0A=
>> +=A0=A0=A0=A0 if (IS_ERR(os05b10->cci))=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(os05b10->dev,=
 PTR_ERR(os05b10->cci),=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to initialize CCI\n");=0A=
>> +=0A=
>> +=A0=A0=A0=A0 os05b10->xclk =3D devm_v4l2_sensor_clk_get(os05b10->dev, N=
ULL);=0A=
>> +=A0=A0=A0=A0 if (IS_ERR(os05b10->xclk))=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(os05b10->dev,=
 PTR_ERR(os05b10->xclk),=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to get xclk\n");=0A=
>> +=0A=
>> +=A0=A0=A0=A0 xclk_freq =3D clk_get_rate(os05b10->xclk);=0A=
>> +=A0=A0=A0=A0 if (xclk_freq !=3D OS05B10_XCLK_FREQ)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(os05b10->dev,=
 -EINVAL,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "xclk frequency not supported: %d Hz\n",=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 xclk_freq);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 ret =3D os05b10_get_regulators(os05b10);=0A=
>> +=A0=A0=A0=A0 if (ret)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(os05b10->dev,=
 ret, "failed to get regulators\n");=0A=
>> +=0A=
>> +=A0=A0=A0=A0 ret =3D os05b10_parse_endpoint(os05b10);=0A=
>> +=A0=A0=A0=A0 if (ret) {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(os05b10->dev,=
 ret,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to parse endpoint configuration\n");=
=0A=
>> +=A0=A0=A0=A0 }=0A=
>=0A=
>Curly brackets are not needed here, please remove.=0A=
>=0A=
>> +=0A=
>> +=A0=A0=A0=A0 os05b10->reset_gpio =3D devm_gpiod_get(&client->dev, "rese=
t", GPIOD_OUT_LOW);=0A=
>> +=A0=A0=A0=A0 if (IS_ERR(os05b10->reset_gpio))=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(os05b10->dev,=
 PTR_ERR(os05b10->reset_gpio),=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to get reset GPIO\n");=0A=
>> +=0A=
>> +=A0=A0=A0=A0 ret =3D os05b10_power_on(os05b10->dev);=0A=
>> +=A0=A0=A0=A0 if (ret)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 ret =3D os05b10_identify_module(os05b10);=0A=
>> +=A0=A0=A0=A0 if (ret)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error_power_off;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 /* This needs the pm runtime to be registered. */=0A=
>> +=A0=A0=A0=A0 ret =3D os05b10_init_controls(os05b10);=0A=
>> +=A0=A0=A0=A0 if (ret)=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error_power_off;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 /* Initialize subdev */=0A=
>> +=A0=A0=A0=A0 os05b10->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;=0A=
>> +=A0=A0=A0=A0 os05b10->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;=0A=
>> +=A0=A0=A0=A0 os05b10->sd.internal_ops =3D &os05b10_internal_ops;=0A=
>> +=A0=A0=A0=A0 os05b10->pad.flags =3D MEDIA_PAD_FL_SOURCE;=0A=
>> +=0A=
>> +=A0=A0=A0=A0 ret =3D media_entity_pads_init(&os05b10->sd.entity, 1, &os=
05b10->pad);=0A=
>> +=A0=A0=A0=A0 if (ret) {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(os05b10->dev, ret, "=
failed to init entity pads\n");=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error_handler_free;=0A=
>> +=A0=A0=A0=A0 }=0A=
>> +=0A=
>> +=A0=A0=A0=A0 os05b10->sd.state_lock =3D os05b10->handler.lock;=0A=
>> +=A0=A0=A0=A0 ret =3D v4l2_subdev_init_finalize(&os05b10->sd);=0A=
>> +=A0=A0=A0=A0 if (ret < 0) {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(os05b10->dev, ret, "=
subdev init error\n");=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error_media_entity;=0A=
>> +=A0=A0=A0=A0 }=0A=
>> +=0A=
>> +=A0=A0=A0=A0 pm_runtime_set_active(os05b10->dev);=0A=
>> +=A0=A0=A0=A0 pm_runtime_enable(os05b10->dev);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 ret =3D v4l2_async_register_subdev_sensor(&os05b10->sd);=
=0A=
>> +=A0=A0=A0=A0 if (ret < 0) {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(os05b10->dev, ret,=
=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 "failed to register os05b10 sub-device\n");=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error_subdev_cleanup;=0A=
>> +=A0=A0=A0=A0 }=0A=
>> +=0A=
>> +=A0=A0=A0=A0 pm_runtime_idle(os05b10->dev);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 return 0;=0A=
>> +=0A=
>> +error_subdev_cleanup:=0A=
>> +=A0=A0=A0=A0 v4l2_subdev_cleanup(&os05b10->sd);=0A=
>> +=A0=A0=A0=A0 pm_runtime_disable(os05b10->dev);=0A=
>> +=A0=A0=A0=A0 pm_runtime_set_suspended(os05b10->dev);=0A=
>> +=0A=
>> +error_media_entity:=0A=
>> +=A0=A0=A0=A0 media_entity_cleanup(&os05b10->sd.entity);=0A=
>> +=0A=
>> +error_handler_free:=0A=
>> +=A0=A0=A0=A0 v4l2_ctrl_handler_free(os05b10->sd.ctrl_handler);=0A=
>> +=0A=
>> +error_power_off:=0A=
>> +=A0=A0=A0=A0 os05b10_power_off(os05b10->dev);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 return ret;=0A=
>> +}=0A=
>> +=0A=
>> +static void os05b10_remove(struct i2c_client *client)=0A=
>> +{=0A=
>> +=A0=A0=A0=A0 struct v4l2_subdev *sd =3D i2c_get_clientdata(client);=0A=
>> +=A0=A0=A0=A0 struct os05b10 *os05b10 =3D to_os05b10(sd);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 v4l2_async_unregister_subdev(sd);=0A=
>> +=A0=A0=A0=A0 v4l2_subdev_cleanup(&os05b10->sd);=0A=
>> +=A0=A0=A0=A0 media_entity_cleanup(&sd->entity);=0A=
>> +=A0=A0=A0=A0 v4l2_ctrl_handler_free(os05b10->sd.ctrl_handler);=0A=
>> +=0A=
>> +=A0=A0=A0=A0 pm_runtime_disable(&client->dev);=0A=
>> +=A0=A0=A0=A0 if (!pm_runtime_status_suspended(&client->dev)) {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 os05b10_power_off(&client->dev);=
=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pm_runtime_set_suspended(&client->=
dev);=0A=
>> +=A0=A0=A0=A0 }=0A=
>> +}=0A=
>> +=0A=
>> +static DEFINE_RUNTIME_DEV_PM_OPS(os05b10_pm_ops, os05b10_power_off,=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 os05b10_power_on, NULL);=0A=
>> +=0A=
>> +static const struct of_device_id os05b10_id[] =3D {=0A=
>> +=A0=A0=A0=A0 { .compatible =3D "ovti,os05b10" },=0A=
>> +=A0=A0=A0=A0 { /* sentinel */ },=0A=
>> +};=0A=
>> +=0A=
>> +MODULE_DEVICE_TABLE(of, os05b10_id);=0A=
>> +=0A=
>> +static struct i2c_driver os05b10_driver =3D {=0A=
>> +=A0=A0=A0=A0 .driver =3D {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .name =3D "os05b10",=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .pm =3D pm_ptr(&os05b10_pm_ops),=
=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .of_match_table =3D os05b10_id,=0A=
>> +=A0=A0=A0=A0 },=0A=
>> +=A0=A0=A0=A0 .probe =3D os05b10_probe,=0A=
>> +=A0=A0=A0=A0 .remove =3D os05b10_remove,=0A=
>> +};=0A=
>> +=0A=
>> +module_i2c_driver(os05b10_driver);=0A=
>> +=0A=
>> +MODULE_DESCRIPTION("OS05B10 Camera Sensor Driver");=0A=
>> +MODULE_AUTHOR("Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>");=
=0A=
>> +MODULE_AUTHOR("Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>");=
=0A=
>> +MODULE_LICENSE("GPL");=0A=
>> --=0A=
>> 2.34.1=0A=
>>=0A=
=0A=
Best Regards,=0A=
Himanshu Bhavani=

