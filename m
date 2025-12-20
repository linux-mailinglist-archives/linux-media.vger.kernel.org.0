Return-Path: <linux-media+bounces-49224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C530CD2B53
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 09:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D8C05300E0C3
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 08:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D882F9C2C;
	Sat, 20 Dec 2025 08:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="hVRsMrAr"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021133.outbound.protection.outlook.com [40.107.51.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5E62522A7;
	Sat, 20 Dec 2025 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766221147; cv=fail; b=k2IDG4JUkRdSL1ewsScRS0KX97t0AhidtBf9OAOqo+VIkSVbfA8LDacC2TSonh9tlBS81u2M2Us0wdIDnRGZs15lK4qkwEhGSD8WiMBclC+fqCt6mbjelP7UeKqSBohhsmzWv4trtlYsNnEYHMZcUzEMI/PsoZkZYqm3lvBy/LY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766221147; c=relaxed/simple;
	bh=+r2+9erWDUc72iZ7W0WI1tSe9DH2RIjTbX4ceCuQ224=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cKGDSFP04N6dKyZG4DsIsQ5V0dEUuBZodiqxVUHbJi601MAIzubtTRbh/egIDcd/bTfVpBs23+oX61W8SeTarUkHi159/kAeT2OOWAZJX1Ofbkblp0aB7VFXGOyeC7N2DluLtDWreP6MC9VkqqC9/a72ccb3vIbCgesIwRFH6d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=hVRsMrAr; arc=fail smtp.client-ip=40.107.51.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wfj34wyxRFn1ZG+eiFKR5N6aMdBidQRDuZV8P6eli35dcwDH72gbYl2ZvsWQ1y6JBmGBW34ikIbpI8bxv2wY/rAN4TcpR4HADWd5qiBYZ7yoJX7jhz6J4lzpQ0CoVL3GChNhjZ7HpSP5a4PSdlMXDvSWK3VBmkHob6Wmyy+Xkmgmsk7gTnEBfIu3PiUOOkLX+S24doKaT/d04wiMFoFHk5VIEQF7Y+AC+jcZMc7iJlL7KmJWgIvbvqK4IrdfW2v1vk/zWtLMUm+9S6gaZg8+vnFK1olzMQ27JVykYG13AiJTeAPQzSgRZj5UTcnIWGgp6IIuavonz1KSqJrsfQijBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRjKPEpDft1GEyFgM6lW+p6gheuk26S8Y1uZqWZg71Q=;
 b=RO/nishE7tHJmGeU2oG2xBhKp5wj5X6qHi+Zaxfogn9jh9MmL2n4STx7c4tBHSmnvf97tfOsPOuMGDlvbwskLGEt3QQWEHfNkdm+uTEMEvJC2hE8apQj0l++zSH6m1wMpd3hI1b/LsPr8kn8Gy9ZXKOLlFNuEblzPYCJeGZaPQ3wmJin1C09kl525BbRgxODG+ufDf59pbO9QemineTE1hucjzdIT1YIcC/ddx6XjV23KiLWEvqEq8t8L0ehP0/iSDtI4UUV/Cntln+ctfKHdt3kzD4PAs4NX3XflxSw6U9TXVvrEHHbCYI5f4yVqMuzbgny7RkLwlkuw3Y962H0jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRjKPEpDft1GEyFgM6lW+p6gheuk26S8Y1uZqWZg71Q=;
 b=hVRsMrArcl+cGtSqQ0RZkgIyyhiNUt3pp+mD9WF0tBSCAh95Cma80AwiyOrUqMvdZUJY4fZNtoa/61X++oWl8LEi0K63zUR2P2xDWEoK4Ac8rCXGabk2anyuNfyPJaltPPzWaxwRiLTEApoqrybVF31iX6XnZdj6o65oQuEAh2AaqpnH9e+wc6uPhOM7gdLXuCkVX6xw1+5r42izqDDiiGk1ZJ0fKEAYsGgx3a2tJPW5JhvfoNzR1WZuOlpN5gaxXYat3qbNnaU4CAnufwr3NdyLI6n/RE677Mq4RM+B0VG8/q3KWxHvlo9cTYqJmWv+cj9jdN4VPFERC3BdjQ01fg==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PNXP287MB4363.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Sat, 20 Dec
 2025 08:59:01 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9434.009; Sat, 20 Dec 2025
 08:59:01 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Hans
 de Goede <hansg@kernel.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	=?Windows-1252?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, Svyatoslav Ryhel
	<clamor95@gmail.com>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: media: i2c: Add os05b10 sensor
Thread-Topic: [PATCH v6 1/2] dt-bindings: media: i2c: Add os05b10 sensor
Thread-Index: AQHccMPhgo1J/BjusUO1jkzyKKVaGLUpChEAgAEKVFeAAB08gIAACgb7
Date: Sat, 20 Dec 2025 08:59:01 +0000
Message-ID:
 <PN0P287MB2019AEDA6DEE722A4174A1E99AB6A@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20251219084526.22841-1-himanshu.bhavani@siliconsignals.io>
 <20251219084526.22841-2-himanshu.bhavani@siliconsignals.io>
 <970b20e1-a98d-43cf-980c-325dc514b997@kernel.org>
 <PN0P287MB2019D9CDB7D2E29A933CDE529AB6A@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
 <91523e97-95df-464a-9658-d29cdc54f3ae@kernel.org>
In-Reply-To: <91523e97-95df-464a-9658-d29cdc54f3ae@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|PNXP287MB4363:EE_
x-ms-office365-filtering-correlation-id: 9eabdb94-644e-4d07-55c2-08de3fa60502
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?A0c2duGhkeP3LUN8Vle4DoR+I2YhsdToNU92vPK2Nd3TSuBTHGnubcTW?=
 =?Windows-1252?Q?bnwAE4O337FQzNLZexYn6nxQPk1FgSkJzBjMIC1VRq5qj9zSYw7Daa/i?=
 =?Windows-1252?Q?zJAQLiM22my05THP/d01+mSSJabgFSyiVx1Ns4mRUbuX2yQmlRBpKjlJ?=
 =?Windows-1252?Q?9aNDkEJpq4OxxHzRjni8XfOudMOvHbTKHUm36+arl5Chkdk7h7lclCss?=
 =?Windows-1252?Q?QDVmwXBSh6C2TpkdL+Gn5k4W7Q5OTVfhmMhaZAFfBzj4bAWHQarwKPtZ?=
 =?Windows-1252?Q?6gfi8gfAEOlbDD+EscsXu4qccTYWXkJ8xFP9YLgsFm21BLuZkZ33Tknd?=
 =?Windows-1252?Q?4xiZL7ufFcJ08DG6Sy5OAyluQLIe/2tmFR3BLnJt30x7iNiOHPLGwlhW?=
 =?Windows-1252?Q?odEAYogzO6k5hzOXwZTkGJlVzJ1eystdtijvzBWlRB1jLs2VilCenxdo?=
 =?Windows-1252?Q?0VDzVVuCFMkSJGfqbwYYiQq1omnG2Hy9qLPSucOimN/5rfvnUZRKHIH0?=
 =?Windows-1252?Q?u2foXhbBtxQZfCd3omPfY8uzl/E3aLo+xFyEIMyv/OMvjpvSzUHjei9U?=
 =?Windows-1252?Q?qRls592gF56VJVWyFwtN8nPqtiSxF+mTxIw9dhEvQFkrxUQLLUM2X+Mc?=
 =?Windows-1252?Q?wjo6XHj7t1hgGO7nl8zrU29DwY+La6GqnA4RAcHhHhi8ZdSyxzp70KZ2?=
 =?Windows-1252?Q?9Jb/q2vta0K7uAhDKi9fBQ+pLkFjaOxATou/bIXkkNu9MyZvslpSX/Bl?=
 =?Windows-1252?Q?ob+sxdlIB5bL8AeOlxA4njrawkilwKqHEBrz38HzWkdpIoa0swxCBHCJ?=
 =?Windows-1252?Q?Lv5IN0e6UfAjehTGq4TUSVf2pbzIcV27HfISco2GCEhsWqi+P10qixLd?=
 =?Windows-1252?Q?gbTpAd1n2WPmKqM1IWZAQzEQS0Iwfnfs5DgiStWo42GpFSGjCJkE9gex?=
 =?Windows-1252?Q?9DXEszI5RLDa7GbXVz+aupboFf/+odMqRezEM9rYv+58369RxqH7UslC?=
 =?Windows-1252?Q?LSMTzdsgSdrxkUDYoh4cO0uPDgUT1x1G/ocXBRf3J9sSUKGCO6VfGiSg?=
 =?Windows-1252?Q?s8pYdtTK+79No9BrnpGabJuRVymFO8Jzv/+FJVj6LnL4LAlV2WlblZOg?=
 =?Windows-1252?Q?Jh7SnvLtrv8fREMSiY9YPiHNn4JfVYEE36i1yMySyxAQjUfJGrHZDYmh?=
 =?Windows-1252?Q?RHyJpXz6dc2DdF2WUhxdHNnpXtzqTkqxLqWN8h17d/7J9qWaF1iGHzHr?=
 =?Windows-1252?Q?kC/RxT+2Z3HD+WEZ1KjrMSeHYfhubqhn62G3t66B9gLnM5HsCLmB4dhw?=
 =?Windows-1252?Q?Mqga+keaRcZzmMIMSQqXvyV//Gx11Zr41wEMBetfIOVty60oaKP4JrNO?=
 =?Windows-1252?Q?bjbl1cS+8fCuLlnqjq+V0BmGElZrRigi4Jv8Du2CW3fTv5EZscrG5qz4?=
 =?Windows-1252?Q?sPtMi/UN0R+XrbYcm41Keo5F17RTW9HnaB5nCR9fkzmTB1dW41hRlSrD?=
 =?Windows-1252?Q?YUyfvS7IePzRR0Xk/hnkZlmhGkSvQkz2GvlI+AC8QFpaVhBqCS5qwnfs?=
 =?Windows-1252?Q?y5cvTSzZjfVFtV0ACiuTW2oVkndvehiiyZkazFI0KpyGvOM6J5g4Kuce?=
 =?Windows-1252?Q?OLUoUCP/eUyEKhjWRM/jIk37?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?4JugxiVjRHapqGivaQBXqTJBfJhz2oXoxca8ABWtHjK/3hC9SfOeYSLQ?=
 =?Windows-1252?Q?h7eadfiUs3wple0d7hlGAhFWMGOVWLKrP0zxKwDwcFXhUvhPGUO7l80x?=
 =?Windows-1252?Q?TjZ8DgUY5Zwh5YWveY3sEApv9loL/hZyKBFqkvx0/8Vm3ICjtKxgohV+?=
 =?Windows-1252?Q?U1wKjoN7RtFgvdZcQrXh1ve03Bh1rlcM8TVmFF67fRk0zUrPwYi5hrMs?=
 =?Windows-1252?Q?f9a5kX0yqk4Qdl8ZedtRicOx/tae3dXS4kiWkjwig/uEc+EadDQ6OO4X?=
 =?Windows-1252?Q?Aa6WwSh9FqF+kE6aiSMLIyIR5JxCyQBWdh0828v7AW3Z7P95mHTd6J+6?=
 =?Windows-1252?Q?OnL8NpM4Ya1tH6YMjGebUpa5bdIfOmQEo1eOTUZb3Yoqv6y0i+ZpJ51N?=
 =?Windows-1252?Q?kMQgBLT2EIFYUxaJsU3sMzC6x/6+OYQMlyd3G63QJ305bBud7wfnhsU7?=
 =?Windows-1252?Q?hDHDt1YxzPjpyrix+KY3bm3yZTzIS6LOwJGwEkktPGwt8lbzeuZshCwQ?=
 =?Windows-1252?Q?H5OytUL6DZp1TNr0RMrCyztHi590na2wtXdf5+aWqE3NGmAEePxx16Oa?=
 =?Windows-1252?Q?ioR2gnaDJ8ZqxNxRLZZmtj8dbKUmhKET3ko6NFAbACLsypcgkWErbXjT?=
 =?Windows-1252?Q?r8SOh41k1arkuKxOnFY1mvBWClFSOAG8kAqZ7//LvmpD3+ci712LeAgs?=
 =?Windows-1252?Q?J0M53045vpMHaKH6SAzKRcif7X2AlDqsKG68Jq7PPign0KGls3jOTGYM?=
 =?Windows-1252?Q?wOMW/ZNORC7nCvV89dic+NKBQjh5I+puJZ0hBo4n5AakE+kLHkqmZayG?=
 =?Windows-1252?Q?Vh4fu4ygzFADW+BG0aMOqDeVMNYhGuo0KOq30ihYYA8g9L1arIElVMwZ?=
 =?Windows-1252?Q?zpM7jft2J1DWbcx2c7yDOJnjLC0479KKA51gPnKwdw5m6BpYeVvMIIzF?=
 =?Windows-1252?Q?dC0Z2dwTELp+9OxSn+NycHRea4IOCK4HtXQV/Choe4UjSAYNEK28mDTy?=
 =?Windows-1252?Q?u4InbEp8r4BHobtreCupwaD/1R2y9wCqEo+D8pLaVUfraSvAJslEvCEI?=
 =?Windows-1252?Q?VJa4HByLQlElkyBu0w768yDBww8C1UQJy2LnSntwOUMLgdXKZgeeA9TU?=
 =?Windows-1252?Q?kOGcf6VODvYj16yOHNP5ZAwgIXXmp9aNDA9/jc7KaCkjgCiMfV1I9382?=
 =?Windows-1252?Q?UK2bqHhOM84QxQQLTJVQtsETqxzd1cVpEIebSf3zElpGIyu9dhVMSRwf?=
 =?Windows-1252?Q?PoF1ySStzeFkU8WbpjPvJ/7gq0qcra8PgzZaivNwLkrRds2udIQ+Naya?=
 =?Windows-1252?Q?bax+NiMCn9dF9Wfrl6Pgid8yqQ8E6YvRB18U4SKsZw2hBX6QjOtJaeP/?=
 =?Windows-1252?Q?lhzUnd5enltdE/8otCzCYfugsXFgn8pLDqueRFzILKHa7LXkgVjCD4H4?=
 =?Windows-1252?Q?KylRFk38cdlcGE0yUyAEQvkv39MyzTp524hnOMk4sN71A8hGSJRoGiNp?=
 =?Windows-1252?Q?ZxrSXP6BKWWRDnB/r5AbJvZ+r6oOUsKIrzWcljeq/Qnv3zBHqv3+eayc?=
 =?Windows-1252?Q?8xcpbERgCkxBtmmu7OUkgZgUj30ZafzoOhRadkX6ikrbiXfY9zgqIDiY?=
 =?Windows-1252?Q?QTinOJgLK1C05WRNBAylB4AQ1qrZ9wAf6qdzbgvXj2EvaZyUd2+GzWFu?=
 =?Windows-1252?Q?kEC/vvLn/Ca9ZTus9uBKKIqpv2uvbfSu7+RHUkVGxVUbtXiMklwhe51B?=
 =?Windows-1252?Q?ldu31czJgs5FLGhfN4xu92CJCPZpZY+7IVJKcvfJhMM27zq6W9yfa5d6?=
 =?Windows-1252?Q?BiaOWHt4P37ox+H7AOVBzmnWDCVbyc7m2EpR+DvVN8JXq2qzG2KcweFH?=
 =?Windows-1252?Q?PlG0Dnbwrf1MqeRWTPp9+sgAuf83Hln/ktE=3D?=
Content-Type: text/plain; charset="Windows-1252"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eabdb94-644e-4d07-55c2-08de3fa60502
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2025 08:59:01.4226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6q+a3mkbRTsbmxMaBxefNRXADhsVQ0z0uiNZAf/i7l6RczALM8+ZOd5nrCq3nPqL6P9LjstPa3Vk/RFiIUoBfZJH/tB0akEW3m4N6BvWoxhJyYIs+ESXRl6yx4BXKH5E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4363

>On 20/12/2025 07:37, Himanshu Bhavani wrote:=0A=
>> Hi Krzysztof,=0A=
>>=0A=
>>> On 19/12/2025 09:45, Himanshu Bhavani wrote:=0A=
>>>> From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=0A=
>>>>=0A=
>>>> Add bindings for Omnivision OS05B10 sensor.=0A=
>>>>=0A=
>>>> Add MAINTAINERS entry for Omnivision OS05B10 binding documentation=0A=
>>>>=0A=
>>>> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=
=0A=
>>>> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=
=0A=
>>>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>=0A=
>>>> ---=0A=
>>>=0A=
>>>=0A=
>>> Nothing improved and you did not bother to respond to my comment.=0A=
>>=0A=
>>=0A=
>> In v5, you pointed out that the driver and bindings were mismatched with=
=0A=
>> respect to the reset GPIO.=0A=
>>=0A=
>> Based on that feedback, I corrected the driver by making the reset GPIO=
=0A=
>> optional. I also reviewed a previous patch series discussion, as suggest=
ed=0A=
>> here:=0A=
>> https://lore.kernel.org/linux-media/20250710210532.GE22436@pendragon.ide=
asonboard.com/=0A=
>>=0A=
>> In that thread, Laurent suggested that GPIOs should be made optional in =
the=0A=
>> driver, which is what I followed in this version.=0A=
>>=0A=
>> If I have still missed something or misunderstood the feedback, please l=
et me=0A=
>> know and I will address it.=0A=
>=0A=
>I expected reply or change in the binding. None was there, so that's why=
=0A=
>you got questions.=0A=
=0A=
No no, definitely not ignoring your comment,  you=92re the boss here :)=0A=
 =0A=
Thanks for the review=0A=
=0A=
Best Regards,=0A=
Himanshu=0A=

