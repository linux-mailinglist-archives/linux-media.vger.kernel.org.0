Return-Path: <linux-media+bounces-63564-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id doeAHU73H2pstQAAu9opvQ
	(envelope-from <linux-media+bounces-63564-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:43:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C856B636410
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:43:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=siliconsignals.io header.s=selector1 header.b=MKSkdCbz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63564-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63564-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=siliconsignals.io;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99A3D30C1517
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 09:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26AB3812CD;
	Wed,  3 Jun 2026 09:36:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021126.outbound.protection.outlook.com [40.107.57.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549D5374E60;
	Wed,  3 Jun 2026 09:36:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780479389; cv=fail; b=L8eu2UkrCkXv44AyPnQeDewwCpKbnb8tAznOMf/hR7Jf1ZIRJKpxRmihtHJXi33PkiWOA4Zf05f3QGWBYNu4xPv10yJ+QyPfQ4hqrzTyy2XUd9VHc4Iq6rrqfYzp5tS0MEw6Bez6dfjnQsNrU7o6XXtLCE6f5gWBlmDPtaocohY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780479389; c=relaxed/simple;
	bh=unOEWAyOxR5TJCmzKZRzMSIiYygogNysdJLnyAyLy24=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EcQ4N8UXt4aImStcNFwNEIYDRN1P7ZJbIog6lOt63Q0PdkF1WC17Nb/1a5+R20N9DedKOq3dD5Lv2Y5rKWy/oypZ0Rw5f15gxtYFsPwGBA2BKfbfSuNH3DMdUY9+k+/njJAmKAM+FPo30Y4Zw7W5PrIV9JrlRShEN3EwLV2F2aI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=MKSkdCbz; arc=fail smtp.client-ip=40.107.57.126
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Axk9U8ygkiM/uVRI+B5NE3EaNm618xFB8nOPs58K+C2q+UsmX8RIQULJcJHmcbraW+bRiu6DgIzp4KTXx8vByXgGc5KfcwZysteWKfWej4tsnmkXUR4B5nBWfMy2QafzOf9JCw9M8EGVGiD7L/U/HiMRUVzt3WKkvn6v7w4+kKtGYcp0rrVi+Ib4wP6qSnPMSs0sW7e8Q+cOl467naGqH3GNnBnDicNUDH0hxGbXYwqdmpx21tlsh5GnXK798zwQKpUCDhu8UWYjyqxPTWTNUnBl0ZBrcBZ4Tq5Zjw2s+LzKWFN2cnUwFcucWNcXis+T+x3uTQ4tw/vEbXp2fGRiwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YT8HLXCn0NCh1OtDEeFwD8OhKDKecenERhpus6pXFhA=;
 b=Q31Ww9qRTIRLwcJtb8Q/ID0jP9YKTsS6UznKTJK3Ce+ndmL1motyWlJLTxFpy9EXU4WLLWm16mzjSlgfYo/cr4dkzle9YDLaA4aYdOv+eVMoKQTlzorFs1GqYICyZJa/zl+z0mAAgOVmD4lVnqWqGb3QYLpFsdiHbVOKi9jx1VS/ZIws4C1lI0CWF3sO3CgG30+YbR4s4IrbYLujnQRUBthRMtdm8Hp1FWJw10OPV54BLxN3b5Q/dauDI+wqgNGBiDbJCHrFOWFybVefDw0p/108cWV5JNusNspPpHGUJNfeRM/4hZ2XWEZ+iWxYFgQg9kGGNhIZwIz7yBHpTkRw7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YT8HLXCn0NCh1OtDEeFwD8OhKDKecenERhpus6pXFhA=;
 b=MKSkdCbzpUQkaJ4Yl9Bd28ND5avA8EwYGkPwikZWWs1YEhlkVI+DC0uiCxKG8+ytjBFxPq5Ga5t6TNEB2y0IDQXhQgR6ERQk8ozIoNTlfymf4xNhlT2tyLe+eb3VYds/Ya3Z//SNWH0kOzYWNTEz0gj4PvahgDqA7nPk7Nnb5TuGmyOGnaih55hzz1MYjyebPGCDIhilsTR5cZHn/AsfJIlt36Z1E7u6ipa6p2rYTb7MzDchfk8VGRCdMGFGuWP+/SG0cis2r3EXFafk/fXKVOIpzhN0AWYgShQW7UHhba24TLh6D6i0H6fCy3cpelIllV5HdEfQkuj/7NWiqZE/GA==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN0P287MB1315.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:189::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:36:23 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 09:36:21 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Hardevsinh
 Palaniya <hardevsinh.palaniya@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Xiaolei Wang
	<xiaolei.wang@windriver.com>, Walter Werner Schneider
	<contact@schnwalter.eu>, Kate Hsuan <hpa@redhat.com>, Svyatoslav Ryhel
	<clamor95@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: Add imx576 sensor
Thread-Topic: [PATCH 1/3] dt-bindings: media: i2c: Add imx576 sensor
Thread-Index: AQHc6E/KOlaCH/7z5kGlzhhM3jiXALYYRvQAgAs36o6AAAmlAIAJH5xB
Date: Wed, 3 Jun 2026 09:36:21 +0000
Message-ID:
 <PN0P287MB20195C8D66568AE3CB568EC49A132@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
 <20260520115641.11729-2-himanshu.bhavani@siliconsignals.io>
 <20260521-adept-lorikeet-of-elevation-5fceef@quoll>
 <PN0P287MB2019122FF174F05F43EB07229A092@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
 <e20b0027-c0ee-4ad2-8f5f-d1b4f610c539@kernel.org>
In-Reply-To: <e20b0027-c0ee-4ad2-8f5f-d1b4f610c539@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|PN0P287MB1315:EE_
x-ms-office365-filtering-correlation-id: ed96dce6-7094-412c-a508-08dec1539284
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|56012099006|4143699003|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info:
 AWdTxL9Sveec2X4DYaCnr77Q+pWEXBgDXqLf8eJf3ugch0021pim++8UuWaymqFhwz9d29iNm+7eiwGuXNgKBQ9OFw+ZfbNfKDu1Nbtank2WpRyTf8MUMtvz17ocqb/usyYjhd4Jw/dVNT4aZ/SUMmy7ZCmuFH90ZWbAuKA6wdr6vu/5y+xvx3Jf4lqGSi37VYkcS4zQVvMXfAIoiiUOHrlVKpK+pn+ocBWM5kkhgDykPg1SMmDxpZ09AhWa1X32EPb9i3upgrp1hkrEo9cmGxp68wFGTgoTTjtgejgUqY5sniJhdlehhgAHgLpRpSJ25CijdHHg+V6KPC3NGfE259vURXOtbBuo9V5bh3cDItib14k5th/K5Sj89EyC9gOSOHEtBc32Z94oXS27Gy72RmMykBsHaTG9FvaEpbHl+nj0f00lnv1DL+GZ4dsE0YivYWJsW4KomYQCksyIrFXivYUdZBQoUXAlpmJewR+Km21Pr6f954zs+QdvGQBEHJrn52PqEoSN7Mkes/GURDGYuXTE60CiHAXop2RpfmUrnh59dz+p9jAPwFWl6XcWPTmnzcSufLo8pz0BRUnX07ZSDRKSG88vpKTtnAk3L9ZJA4MVYVUF3XtTYBsMB9INr+XcIGD1Bs4YcbSZgxHL9BwoZOxdHQQbXWd5DUBTV5CVhJJc43bKzWxTiIEY1xj1AsvCp13hv8OhnQd4qOsg6qwVGQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(56012099006)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?B3EGSZkYyjDmkcvznsH27jgSWtjbC5abbhSAPHcBb0zyBdnXkJJSBg2mGf?=
 =?iso-8859-1?Q?xe5ksSdH87f0476AYJBTTztgj+8xlq1zodS1WsW4PfxU6uaGKdoMAdz8y1?=
 =?iso-8859-1?Q?nQbensPujd/CbIWlqtBi/JRbMMShUzjeNwLFU8XULvgpEP+dArnFAbLe16?=
 =?iso-8859-1?Q?qrJC1RaQdP0uQseL6PmkMUk848jNYy4sc2lkEWuDpg8HvvC3oSNFJmT4oT?=
 =?iso-8859-1?Q?PJPlQXv+FBgJ2D1ua6nGKaSEaSul+jPkTBm2l/DTPp1IpWcBkgTIIiycTJ?=
 =?iso-8859-1?Q?AZCT4P3ysioy5diWqJBUsv9RjV68R/cJ6j/j7pgmRB5V04euXACYP0vciZ?=
 =?iso-8859-1?Q?EJwwwz7Jb12noy52RGyUiBTkJgQlEcYgiKwwZpMhHPkTn6YbXOcKX5j9ET?=
 =?iso-8859-1?Q?ZiL5oNy7MaGDaLqerGyI1LZPyjI431NTQMUXajfcw7WULM4keg5UAVn1zD?=
 =?iso-8859-1?Q?/rz3f4siuZINb6I9t4ly9Jl+GkJ49UHpBSdQUcoxwGigu4xXqiRJG+rBKM?=
 =?iso-8859-1?Q?er5ZHj97q86JuR2dYV/QixGM+DrdAU7zMGENHa20c4B/5LMAX6s11x7sLA?=
 =?iso-8859-1?Q?Q1Cw2DbNrnT/WTjA5W8HHPpp1IrJCsluiIaS2Tp3BdYG2eMabupoY9zAc5?=
 =?iso-8859-1?Q?jQ6+m12lB9/G49cD4UQ6yMzE/9vjgE/HjdtjzbkceTHh0lmtxe1XD4xNEP?=
 =?iso-8859-1?Q?h08XpPWv86Q59VOIIwuQd8/ni76LKhQws50B3xuqrvw3eCdyygRn25aWL0?=
 =?iso-8859-1?Q?pVj7OnKHkks/4dovy+hMjRA9YfYxwvDOfuCVae2mDeoUfA/QrvrahbwJiu?=
 =?iso-8859-1?Q?1xagdcKUPROb3Sm6XRRhI/bFoPcV7jKQPcPHWP69YMx334Dn9y0m+lKxZQ?=
 =?iso-8859-1?Q?Sw4SiLFGzc3z3nq6yWd53NCeeKoIAXuHtByof7qlcN0PDa3w0K+HIJGEAH?=
 =?iso-8859-1?Q?2+HdcU4J6g3nStM+numWMnc6XnkL0JNHIjL4lBBtxop6Ht2omVkZ3r9jV8?=
 =?iso-8859-1?Q?mzeyHjzpRhQxox+HfVfJQ/nC9pzamxM9Fz8xOOo3JoTzUPGsA2cKM0HGCl?=
 =?iso-8859-1?Q?+Per23we5urDQPVt6eCIM0VU87NZ+iOKCuPfvDzrOTTs38Gy63Gyd51YA/?=
 =?iso-8859-1?Q?VUL9NU4C4imsEJhd9ilKBgSe2nWz/BrxFk8qZWVwIgYHQ5/ivSJ9jFmowq?=
 =?iso-8859-1?Q?sj/rTh98Gjz1ShIah+xFSQXmxiKHnN1K92ZOG1HZClrXad4tV3KaVabpf6?=
 =?iso-8859-1?Q?nQ6sWqDOZ3uGaM6G0wd3aYh1HoGq28csRNIC/YwNv2s9GWgYE92JYypqkh?=
 =?iso-8859-1?Q?mjJQizAiVnfj1L27ldHPlHo/OvpYnFjoCHpYZU+Do3uj4MKZimQ1I0M6y9?=
 =?iso-8859-1?Q?OXMsy6Bwin2fskNSRhwUumFeImr6tRX3NDAm0QaikBlBNG7rYg9O8sFqcr?=
 =?iso-8859-1?Q?SPgRx5htv7R2ot3gVjMuqKoDHvx9QHPZqpOQ80sELTPWCd2ns50nkdhbwP?=
 =?iso-8859-1?Q?LTN/oUkquV1X63f7csVb9tR8jeiSM9b3eM7u8LJ7AtjJ4kea+r8K7QZWGK?=
 =?iso-8859-1?Q?mSyLWK5P6H0J6KC4d7d5eKUecVwVkoMCPvw7solWtpVeEoXrMhvSOmt/f7?=
 =?iso-8859-1?Q?8y7dco4255V5aCb9ADgTaM8trgAVRU6ERoyZMnJL9pI0OcTO7p4cvU6I4n?=
 =?iso-8859-1?Q?CoziUyRFZjYlaJkaDP+6acAR+tU+kOh5EieaMvqbilwGLw5qL8AoiwWBfu?=
 =?iso-8859-1?Q?h/ZabkajNHKnWhU5FDVDGsNsmWyeGf0dZIoLj6GRBmubaj7FIG3pohFHBm?=
 =?iso-8859-1?Q?aD0TupCstpPPEMYiJxfzxahFfXl+oYs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ed96dce6-7094-412c-a508-08dec1539284
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 09:36:21.7188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7T6Oz1RrNis1i5zp9zhvJzeqObTlDGAeO3K94Pj3nKfr0LOo5rYZZJmMJpsBy21m0ftXNJbrp+JZZvMACXdXJKOdqhmimNL9CT/KOlBiXW5nqDklqU2Z1sOQj316Beru
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1315
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63564-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:sakari.ailus@linux.intel.com,m:hardevsinh.palaniya@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:elgin.perumbilly@siliconsignals.io,m:laurent.pinchart@ideasonboard.com,m:xiaolei.wang@windriver.com,m:contact@schnwalter.eu,m:hpa@redhat.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[linux.intel.com,siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,ideasonboard.com,windriver.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,siliconsignals.io:dkim,siliconsignals.io:from_mime,siliconsignals.io:email,vger.kernel.org:from_smtp,devicetree.org:url,PN0P287MB2019.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C856B636410

Hi Krzysztof,=0A=
=0A=
sorry for late reply.=0A=
=0A=
>On 28/05/2026 15:42, Himanshu Bhavani wrote:=0A=
>> Hi Krzysztof,=0A=
>>=0A=
>>> On Wed, May 20, 2026 at 05:26:33PM +0530, Himanshu Bhavani wrote:=0A=
>>>> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>=0A=
>>>>=0A=
>>>> Add bindings for Sony IMX576 sensor=0A=
>>>>=0A=
>>>> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals=
.io>=0A=
>>>> ---=0A=
>>>>  .../bindings/media/i2c/sony,imx576.yaml       | 111 +++++++++++++++++=
+=0A=
>>>>  MAINTAINERS                                   |   7 ++=0A=
>>>>  2 files changed, 118 insertions(+)=0A=
>>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,i=
mx576.yaml=0A=
>>>>=0A=
>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx576.y=
aml b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml=0A=
>>>> new file mode 100644=0A=
>>>> index 000000000000..b74253004fae=0A=
>>>> --- /dev/null=0A=
>>>> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml=0A=
>>>> @@ -0,0 +1,111 @@=0A=
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)=0A=
>>>> +%YAML 1.2=0A=
>>>> +---=0A=
>>>> +$id: http://devicetree.org/schemas/media/i2c/sony,imx576.yaml#=0A=
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#=0A=
>>>> +=0A=
>>>> +title: Sony IMX576 Image Sensor=0A=
>>>> +=0A=
>>>=0A=
>>> Everything looks the same as imx577, so just add it next to that one. N=
o=0A=
>>> need for new file.=0A=
>>>=0A=
>>> Best regards,=0A=
>>> Krzysztof=0A=
>>=0A=
>> The regulator names differ between imx577 and imx576.=0A=
>>=0A=
>> imx577 uses avdd, dovdd, dvdd supplies while imx576 uses vana, vdig, vif=
 supplies.=0A=
>=0A=
>I don't understand. I look  at imx576 and I see:=0A=
>=0A=
>+  avdd-supply:=0A=
>+    description: Analog Domain Power Supply (2.8v)=0A=
>+=0A=
>+  dovdd-supply:=0A=
>+    description: I/O Domain Power Supply (1.05v)=0A=
>+=0A=
>+  dvdd-supply:=0A=
>=0A=
>Best regards,=0A=
>Krzysztof=0A=
=0A=
That was my mistake. The IMX576 datasheet uses VANA, VDIG, and VIF supplies=
.=0A=
=0A=
which was corrected by Luca here https://lore.kernel.org/linux-media/DINHRD=
C35RER.Q143U5P4ZV9O@fairphone.com/=0A=
=0A=
Best Regards,=0A=
Himanshu=

