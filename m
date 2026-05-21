Return-Path: <linux-media+bounces-62399-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLAtMhOVDmrJAQYAu9opvQ
	(envelope-from <linux-media+bounces-62399-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 07:16:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 691FC59EFCB
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 07:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CEA3630183D5
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 05:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95A6372EEA;
	Thu, 21 May 2026 05:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="CQGUwMnk"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021098.outbound.protection.outlook.com [40.107.51.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516A02BE053;
	Thu, 21 May 2026 05:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340561; cv=fail; b=Vu4LHCNjvmA9go9lZjIFX30mVUggE/TUPJ96b2XE6TgPxF9Wu0KO493DqLaKTv3GO0C5ct/Pjpk1WirqDpqgIq2fcX2kvCxd2LMrqs3POWm8m4zaD87/oT4TF9nrbn1Mmi2dPhve0/zZsiDealWwUdyqETnsDGmnulK0wv7pfLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340561; c=relaxed/simple;
	bh=dvPbREso7O9W2IXSND/weHRJzit9PDrtGtRdt1ySBsE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A51z0GQMb25tfWA4HefpfEH6AYarZ0vUkKMKzW+z8f3V+6eqbakcEPxFBQUCeG5Mykuq9noCzFavYYkz55v/7y4a0l3Jt+ze2Vz8w+RmU4+A2WSeN5Y9rZ80qDGsk5EHwflrHmVDeFA58n4dTgQrSLlfwi5BMviqGfFw+ioXKAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=CQGUwMnk; arc=fail smtp.client-ip=40.107.51.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKMrgTaLCfItQ/ZpExwSQsSi065YvLetr0DueZgD5ydTZlLgan06XgzrflngQXcyKhlHtgDatFlO5DiVeHZWN/Tk7/e8iLOEACk4X2nrJ2zZGh2o31AZmUSKjFxRHfy3bIUgevuyegrf8xjejzAjUiFdHWc4pzdUeAgLou77GoaemraHxhFnhbIoas7Bg44GTUZ7EDimg1oGdLzFPssMQDdEXoljfnbQx7fu3pRSA/nl29qHQFFDMMjUTBtQFad7oE5W1pNcdCFs/z8+bvyYvBFrIXTrh+5Bkfx8YSosA9b86ai0vkHsZKdJox+ImEx+uQiFW43cWmW5IKqNW1MK5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4psz16cxuT2gkkjCVWQtQgatfKYMou91paIx2fP18s=;
 b=Lk+KgAq2d6rXRok1EC25WHOfrAalevzf0h/+fBbUhQh8oOq2xHs3PALdGgPF7WmE7L5Vm8Rs3b39QMNcWafpEQiJh0QAhixr4/NU0ivEG8QHczKlAV1so4dmBW7uq//1hzDbNGclDqvCd95YZdn1CMCFajj2ooW1PWV40XhF9XnZaUemDr2xZLxFf3i50gI3UCfcCe+5Lh4mzIgMx3hsR2Q2SPlIQo2bZ/thAP7oSUCr+thcq0+8Du5clrXiOa1L5QGl337PRxpZAqRmMCRnJ7yhkMxu5IFsyszThwo3uEK5IIvIr+tM8A+IJoPmWrKJNam0OX9Z5QKDGH+06SneIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4psz16cxuT2gkkjCVWQtQgatfKYMou91paIx2fP18s=;
 b=CQGUwMnknhvg0iCHJxdPzQBRYoKT9aqdmB1wTv3uokYEZoAhkzBB8olAj8SNmwEUGYZ+DSbSnKWfiwOsjy6W66u7eAyLEwFQ4fwKFjN0lnINvItUt+ffj2PTb8JwLsw/8vxRoCAr2H/9kym+yPKbzHsA7zrGLMS76YrKb5iRr1W5YGFh4zNehrlb14ruNu4Z8pRKzYTwOYA0jqA57hC+lxQai/DLDk8A+pLbcKHtNerWJf0T+AzaIq8KMhJauwsqJ1erzpChIngOnYWwNo/M7+PYq9rd6WiLSZrHEKycK1rKrOdl5NdPwqMgX2PdOnvP3nyXPxFy7BmzKBJRGj0jQw==
Received: from PN3P287MB2188.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1d3::11)
 by PNXP287MB4262.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 05:15:55 +0000
Received: from PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
 ([fe80::82b3:36a9:de62:6aa7]) by PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
 ([fe80::82b3:36a9:de62:6aa7%5]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 05:15:54 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
CC: Tarang Raval <tarang.raval@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait
	<mehdi.djait@linux.intel.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Svyatoslav Ryhel <clamor95@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] media: i2c: Add os02g10 camera sensor driver
Thread-Topic: [PATCH v3 0/3] media: i2c: Add os02g10 camera sensor driver
Thread-Index: AQHc08xq1/E6s4vLjkeE1HL5R9n8CLYYGYQo
Date: Thu, 21 May 2026 05:15:54 +0000
Message-ID:
 <PN3P287MB2188D01E4BFD005525304E85880E2@PN3P287MB2188.INDP287.PROD.OUTLOOK.COM>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
In-Reply-To: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB2188:EE_|PNXP287MB4262:EE_
x-ms-office365-filtering-correlation-id: da16cc3b-bcb9-4bd3-9a7b-08deb6f808cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|5023799004|3023799007|56012099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 7SNNqX0ncAyypgBMXeDl0+7jVtmCT7dacDxZhVgDbVK7DA2wViQxAVUyqiJYIdkyOnN+hIJD4evrVC//4D+OTJqxyIOOkIcUyIyt8KfhZPuj0JOiZ49YuzkI8Hzp5A+gc1dP13l7YVEkj6+6TeDVlOD3p8GY4X9fWcDtv0P5I2j8f0ASEikxdx/9Lv+Nz77uE7DuDfb8LEXBNc88ZssyGrcw4mzWkXImvN2qsOcjUg0SxO7qGpm5g3/E5GYnPCnjLc6LAlSJ9QWADoa6W+TKXno6G45OwwEHnqJOJ4bLH7K22mgD60NKtNJFST1ZC9AJyZFu/YZZ73jvpQw4eKefgS15uWYw4jOM/kqHXp/n3y1IzwRiS2a4W+Lpxfl36uu6A1csvbXZcC+PozcTdG79feBWL53fRyX5fpBXzalY5b/Q1XHQ+OOIdZdfNjxsbYguPUxr216/6xBNx6j3XmdqElMCRjcvpbvguPjwk0CT6fD5Re4oAvrBp6Y2TKWHzMTj+c9OJ8hSM5F/m6j1+qWSPuj7Kvg5HSea3Rrd4f19V8pE+thiSWdaYC+JeRyka9EvBUzmQB05aHcGagpEms00IGLe4kniZ8Achrs+qbbHmKeDhbMxGdQOiETIaZWwkEZtI7cswq0ITiR1V1hALm2fyxiUGuDqfdVLvk6WZ37C0a5Ar5eoBWH39tuijAArZWMpMHnXzRQqUXUH4Tar4ujq63zBJddW6e8jkbpZiYoMJ9kfuDLZFvMtoDaXaoM5Rdgb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB2188.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(5023799004)(3023799007)(56012099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XUnIq0nbqZcdOKTzOVA+XowqEo+pNFVCNyNl7ND4VOzLo2U3zhz941G6NA?=
 =?iso-8859-1?Q?N0hsWjO6sMbfqKuRjSjQRH6oVrNxQ0RJAzR7XZQ2sZ2iyBoEA9/aGvFWBq?=
 =?iso-8859-1?Q?MZ5MT577dyTPpGQlBUwVgnOp3UMwrkw/VdgfkWC7GJHRHVX5Ou/k/9iV0H?=
 =?iso-8859-1?Q?KmNa4HCy9J7jQYVmUz/vVRJ6riVlu52ItmJEXBDoiL3stRG5XBO0t+mpot?=
 =?iso-8859-1?Q?cNE2SO/RjDw/vxMSh9As6ACOuVm8Zho9Mi/f8dv5pHOArXJ36ss8QHZz93?=
 =?iso-8859-1?Q?7fwcMivVls08uuqZZFRqAk+z0ES9lbWlyUKDk3c/xssjE/CAGwLrtQLt6D?=
 =?iso-8859-1?Q?VaeJWkihbIEQm864PH/zWvtajY89XCCqOJJmdAh8zCcm5Rz9bq8uPOpzv0?=
 =?iso-8859-1?Q?zGSWYHoPPj+i015hxecY6x/BZ/evBebp5tdfgpXo/lJ0QQ4ieFjnD7hiM2?=
 =?iso-8859-1?Q?/LGusmDXTkPFU98DD022gDOb5k3xcr0X22DVmoJn8F47hYexc2N0wnX3cI?=
 =?iso-8859-1?Q?efnRMH01HTqO9rww7eYW3RJrrz4uJewE5gRJ3ANm85EDEa0w2YamEe4OWl?=
 =?iso-8859-1?Q?EoGV/wOvEVwJJ0V4HlE4lIA7b2wilyCevfw5Cq5ff4hRBynBTGxNfOiOJy?=
 =?iso-8859-1?Q?YYsh4c3RP85X/HolOzfTflP3+UQopmnOrg1oSjlaK6n5pU4ptJtwOCWtdp?=
 =?iso-8859-1?Q?O4UKMV6c6rFkTKBDI7ndAv/EORevqcxRJu9s9tTck5lw+cCzUgZDBLstEY?=
 =?iso-8859-1?Q?zdNavZ4iczAMLAd77iy4lGZ8vFYjBEyhgBFHW7vzGvqOHxeMTNa3AOrjc/?=
 =?iso-8859-1?Q?O+jTILJOXy6DkWmYjlrLAZi3z2oy9Cqdeur9Bl9qkvrXTF1X93He1kck0G?=
 =?iso-8859-1?Q?QvcdquNej3Cz2yTW5F9xjLoIeT9fJt60uQ4dl0DHLtqRQXLctj3lKlpS0Z?=
 =?iso-8859-1?Q?UYUoyaOYBWuh9qNQqocyHAXHr7e+gQWGEMhjzLabQLn6++Bn/q0KyxA24k?=
 =?iso-8859-1?Q?H8HirWGgkeiae/g724GJRCZGJRcsSQnZ2SrlwF4/VnKqLdKKMCq1GZrNGA?=
 =?iso-8859-1?Q?YwveNRRcr90Qi/YXJIFPeQpe/zWpRthw4ZBCOsCyFv7WwNYVSkOmt0n6qz?=
 =?iso-8859-1?Q?QRTr7GN+ZEb/MPbwv0PZ22x7jLRXjfC6RVgPwWGaAJgWlpwylxFDG1Gi7Q?=
 =?iso-8859-1?Q?rN8C93WEppCSGumOCVE+aMjWBkMtcUg7FW+JCgrctdbNSjCxGNkGrmpsN0?=
 =?iso-8859-1?Q?rRKiRINX5RSDfEHDlRQf61yWyBznITBarhofPxVfTdJHLmCRM8nm9/M+d+?=
 =?iso-8859-1?Q?2nMJkJ034yzHVY1kkPVdjrQlAR5CSmfuYzK66qVwnOCZXZipP+mha63mUq?=
 =?iso-8859-1?Q?9/M7No2RljsY/u4pq5vyVRJtUzRsc+A+gB9qwcgB+VyEUsvBIMWloVcCSB?=
 =?iso-8859-1?Q?xhh2smuFubGzaE//fJoHR5wESs6eixPa9lkXiQH12Ugi4zZt1gdUxeZKge?=
 =?iso-8859-1?Q?D1L7v1K6ppxhff4VA5VymkTCgGHql+gANvpj3EfM7JDJbq/yK2pzZDz/0J?=
 =?iso-8859-1?Q?xu6MncWy2mpqjALyXpPubCqsEdrfT5WIGvp3wrRZJ/XwIs/hmJ+vwcq7fK?=
 =?iso-8859-1?Q?5iw9npOw1CoDukTpX5B+lRsyoK//BaxbQ+lu9D8+tey6yb1NdhzX2ub2Na?=
 =?iso-8859-1?Q?CIL+GR+CkMNS6r4w53dVGz5Fa26dXkHjc8yFq56Ro3ct4Zxu9K7lJWQm6n?=
 =?iso-8859-1?Q?SE4dmj5BtQQFVoj8zfECEoDCtqmcsMos2xfF3akjk2lPYol/0vrpM6XKZ1?=
 =?iso-8859-1?Q?ateI9nODgdsXSr0bBnyG4pJITyWJCFI=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: da16cc3b-bcb9-4bd3-9a7b-08deb6f808cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 05:15:54.9105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: srmCYPsUET4kUmUhiDVKpyr4CJPNY2F7CNNj8weLoSYUSlC4Wq181yCOSTikHcEjQou60yHpi+pAeYL+7ih7dKWKOQNZh0z9Y7shLvYQloHebs0a/IvVvaBuwxLtGLv6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4262
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62399-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,foss.st.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 691FC59EFCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,=0A=
=0A=
>The following features are supported:=0A=
>- Manual exposure an gain control support.=0A=
>- vblank/hblank control support.=0A=
>- vflip/hflip control support=0A=
>- Test pattern control support.=0A=
>- Dynamic mode configuration (e.g. up to 1920 x 1080 @ 30 fps, SBGGR10)=0A=
>=0A=
>The driver is tested on mainline branch v7.0-rc2 on IMX8MP Debix Model a.=
=0A=
>=0A=
>v4l2-compliance 1.31.0-5387, 64 bits, 64-bit time_t=0A=
>v4l2-compliance SHA: 5508bc4301ac 2025-08-25 08:14:22=0A=
>=0A=
>Compliance test for device /dev/v4l-subdev3:=0A=
>=0A=
>Driver Info:=0A=
>        Driver version   : 7.0.0=0A=
>        Capabilities     : 0x00000000=0A=
>        Client Capabilities: 0x0000000000000002=0A=
>interval-uses-which=0A=
>Required ioctls:=0A=
>        test VIDIOC_SUDBEV_QUERYCAP: OK=0A=
>        test invalid ioctls: OK=0A=
>=0A=
>Allow for multiple opens:=0A=
>        test second /dev/v4l-subdev3 open: OK=0A=
>        test VIDIOC_SUBDEV_QUERYCAP: OK=0A=
>        test for unlimited opens: OK=0A=
>=0A=
>Debug ioctls:=0A=
>        test VIDIOC_LOG_STATUS: OK (Not Supported)=0A=
>=0A=
>Input ioctls:=0A=
>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)=0A=
>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)=0A=
>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)=0A=
>        test VIDIOC_ENUMAUDIO: OK (Not Supported)=0A=
>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)=0A=
>        test VIDIOC_G/S_AUDIO: OK (Not Supported)=0A=
>        Inputs: 0 Audio Inputs: 0 Tuners: 0=0A=
>=0A=
>Output ioctls:=0A=
>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)=0A=
>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)=0A=
>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)=0A=
>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)=0A=
>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)=0A=
>        Outputs: 0 Audio Outputs: 0 Modulators: 0=0A=
>=0A=
>Input/Output configuration ioctls:=0A=
>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)=0A=
>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)=0A=
>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)=0A=
>        test VIDIOC_G/S_EDID: OK (Not Supported)=0A=
>=0A=
>Control ioctls:=0A=
>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK=0A=
>        test VIDIOC_QUERYCTRL: OK=0A=
>        test VIDIOC_G/S_CTRL: OK=0A=
>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK=0A=
>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK=0A=
>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)=0A=
>        Standard Controls: 12 Private Controls: 0=0A=
>=0A=
>Format ioctls:=0A=
>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)=
=0A=
>        test VIDIOC_G/S_PARM: OK (Not Supported)=0A=
>        test VIDIOC_G_FBUF: OK (Not Supported)=0A=
>        test VIDIOC_G_FMT: OK (Not Supported)=0A=
>        test VIDIOC_TRY_FMT: OK (Not Supported)=0A=
>        test VIDIOC_S_FMT: OK (Not Supported)=0A=
>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)=0A=
>        test Cropping: OK (Not Supported)=0A=
>        test Composing: OK (Not Supported)=0A=
>        test Scaling: OK (Not Supported)=0A=
>=0A=
>Codec ioctls:=0A=
>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)=0A=
>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)=0A=
>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)=0A=
>=0A=
>Buffer ioctls:=0A=
>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)=0A=
>        test CREATE_BUFS maximum buffers: OK=0A=
>        test VIDIOC_REMOVE_BUFS: OK=0A=
>        test VIDIOC_EXPBUF: OK (Not Supported)=0A=
>        test Requests: OK (Not Supported)=0A=
>        test blocking wait: OK (Not Supported)=0A=
>=0A=
>Total for device /dev/v4l-subdev3: 46, Succeeded: 46, Failed: 0, Warnings:=
 0=0A=
>=0A=
>V2 -> V3=0A=
>=0A=
>Patch 1/3:=0A=
>- Drop the fixed data-lanes property, as the sensor supports only a 2-lane=
 MIPI interface.=0A=
>=0A=
>Patch 2/3:=0A=
>- Use regmap paging features for page selection.=0A=
>- Use sd instead of _sd.=0A=
>- Remove an extra blank line.=0A=
>- Remove hblank control, as it is not used to set hblank on this sensor.=
=0A=
>- Remove an unnecessary error check.=0A=
>- Reduce the scope of the ret variable in os02g10_set_pad_format().=0A=
>- Rely on the control value for link_freq_index.=0A=
>- Call os02g10_parse_endpoint() before initializing regulators, GPIOs, and=
 the clock in probe().=0A=
>=0A=
>Add new Patch 3/3:=0A=
>- Add dynamic mode configuration instead of using a hardcoded specific mod=
e, as suggested by Laurent.=0A=
>=0A=
>V1 -> V2=0A=
>=0A=
>patch 1/2:=0A=
>- Corrected $id to ovti,os02g10.yaml=0A=
>- Fixed data-lanes property structure to use proper items format=0A=
>=0A=
>patch 2/2:=0A=
>- Mode-specific register writes handled dynamically.=0A=
>- Moved page 2 registers into a dedicated page 2 block.=0A=
>- Used pm_runtime_get_if_active() in set_ctrls.=0A=
>- Resolved negative hblank issue.=0A=
>- Improved error messages in disable_stream.=0A=
>- Updated V4L2_SEL_TGT_CROP and V4L2_SEL_TGT_CROP_BOUNDS.=0A=
>- Added my name to the author list.=0A=
=0A=
Could you please review our patch, when you have some time?=0A=
=0A=
Best Regards,=0A=
Elgin=0A=

