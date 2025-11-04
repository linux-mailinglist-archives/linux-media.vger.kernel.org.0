Return-Path: <linux-media+bounces-46247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 27751C2F8CE
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 08:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 56FEE4E6925
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 07:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D926D301704;
	Tue,  4 Nov 2025 07:04:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021088.outbound.protection.outlook.com [40.107.57.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6E1301494;
	Tue,  4 Nov 2025 07:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762239880; cv=fail; b=GzogEN/N5zxyOYpYiKAXQH4UKfM5VXyYJMe02raeiFHCruTLuLN6B1+Pa/Px6lOis3r0kf6lyKN7J6ZR0bsdutu620/sm8n004UhLPS01mkDdETfkX3EfH8aAVST3XGiNhkUpjO0HkMzFVjYpQRx7Qr+DBdkCLoklfym8ABJ3sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762239880; c=relaxed/simple;
	bh=6pKf8ZQVz8AxtUwXqDibyGZVmk9QpQV1kp28cwgth9o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SGDWx9QuJs05zyA9GrXe9hSYO5myo/gZCVf/8IbLN39s4eKqmOysQ5ZY9wn3ybPp/bhyKCHjSNM7YKXyfFR7XN7z1KKCsgBdCeXccXQe9+XOayN9vKFrOaQB4Ip7VP0IG6g5uL8jRKQBgRjeLvYwSn2sH7cj/CA2sCXGsvn8sQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKrhW3IRC9ubG5HwWJzo+Dx7gteRVqyAfLpNZgHs4rLe6RE7H3Or13pfgQCWpqtHQJe+J9724P1NKCILBEY/WiLCV5rZhdmvXXiExYLLrxSmsnrPXfyYfnclGJwHuB0tmK9gQ4nQDHPt1Z0qVjuY/LxYAgD0zS5bu0fEK4l0yD2iBRyzMIncovqBmdd00YOFzACEoGzUWgzYRWzGtZEgHLg2flngr1H/bZqgx+rFxwiD9hG6NLIJ6yHr1YarzqEJ6DHDZOi5ZMhEM50XI/NQX2CIri/EfFY+m+Bxv64NxAdTiGZN1Wkbbc3HlnWumM7Y9sb37sbcQOVf9HGR/S1nEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pKf8ZQVz8AxtUwXqDibyGZVmk9QpQV1kp28cwgth9o=;
 b=URssOdhHL03bNhOv3cTHKyiurAdG/bb7MQv1gDP0eJZLJcwaJJLx3IvRelYVcspRQdd3/t67tBNuzQ/7kla55vrECjYdkHF/nsNERWFzlAVs2fpIZ5r/ErxeqozkFfnhlGIiJ9jIKVjN1L2vm1BtSoo/GIuS5+ClnmN7RvvJcC1V/kmPgXKPn42KJPHKZhpWyBKiYRVdaAX/gzhdhqCZRNAM6bb4eRMA94vbFlWCs9O/NkB1Ok855w0GMX5s3cUwZTFYEpXPJH6QShpUSKR78Y2I1wcAkZEsx0YoqIZOL/4EP8UGrWQSbs9dPd69tpYXctIyhUFkLcc9LCpxGXJ9IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN6P287MB5136.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:301::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 07:04:34 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 07:04:34 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] media: i2c: imx219: Propagate errors from control
 range updates
Thread-Topic: [PATCH v1 1/2] media: i2c: imx219: Propagate errors from control
 range updates
Thread-Index: AQHcSlxYqoM4NSXoS0KiD5q8Uzde7LThR4SAgADQ6ug=
Date: Tue, 4 Nov 2025 07:04:34 +0000
Message-ID:
 <PN3P287MB1829103774EE80B120CC9B8F8BC4A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20251031114835.113026-1-tarang.raval@siliconsignals.io>
 <20251031114835.113026-2-tarang.raval@siliconsignals.io>
 <CAPY8ntDy0NmU5D6Q=v+X0nN9beGFLWHQp0jpfNYq+shGaam87g@mail.gmail.com>
In-Reply-To:
 <CAPY8ntDy0NmU5D6Q=v+X0nN9beGFLWHQp0jpfNYq+shGaam87g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN6P287MB5136:EE_
x-ms-office365-filtering-correlation-id: 55ba2336-305f-4c35-6fc7-08de1b7068da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?lWHbUeUn1c80653perKdIpz2cjAgRsK/W4eK9KCDQ2m8R/8vaEn36CwIZX?=
 =?iso-8859-1?Q?2qmW8XYEwNnatzxlS5P1Wt1ubFYgbfw9CaWlB0czVEw7czlhrKbaNa9XZ9?=
 =?iso-8859-1?Q?cxyt7MZo7exNTQq5ipKKeKwfpHFD+z84jPmchGNXB4tsOXeOWcRk9DwCOC?=
 =?iso-8859-1?Q?c9gHgrj2+Mf0YEH8OEQRvQfsgFBTb/BP+nKJbwxyJ6u5sEiK1suFhl62rV?=
 =?iso-8859-1?Q?xHQs++gGgaYDeO74hzRUN3vbsqHSIKG/KBA0uGg8Jb1hOlT5RVtndJycQl?=
 =?iso-8859-1?Q?XZ/L0X+m0J1zJluofXP+mM9NB39jZWG6/JGz1ghgKx2Rtorm962VbK/Btv?=
 =?iso-8859-1?Q?6gM5hDlU4W3vM5BaWV9xDwglVcwC+iQOa91DtvGUk6tHPEG+fmmSN5tvPo?=
 =?iso-8859-1?Q?vF8YWeyfuOjZ+8GudaMeW+JEqdaKRhMYbG13yoB8T3yLW00jRv1U9xvrdB?=
 =?iso-8859-1?Q?yCtZpZWIIcv5Kdzrf9U2TSIeK6b3ZF+MRAh4IkZ5cKPSJUe1FZZssSXT2x?=
 =?iso-8859-1?Q?xgOyoIhkYeBpDylx7SOaRYkgcTYCTg8OZ9ba2Kq/nVJXK9hKVi0sS9l46x?=
 =?iso-8859-1?Q?6rk9z1pGG1Yj1JFGYN68h2d2rKSe2vQYKXbqHAKj/sUKXBU4E9WwPssh2r?=
 =?iso-8859-1?Q?LlvJTcBD/RXpuDiK0f1Lux1tWb/JoLJghXEMp5grTtcqYTmoK5UjYAXe0Y?=
 =?iso-8859-1?Q?wAeZAXlFcwMhfTlku7+kcL1Rld8rIpzUj8kupH00zQwTrW3YnuqvML4PHc?=
 =?iso-8859-1?Q?3O+fJ9xrrmsyecUEkNjQBJFBEoe6470huLo8imwDEZlWi0JwCpQDQqJGou?=
 =?iso-8859-1?Q?B67+Ta1U/q25wm1UUsqjwVPEJj1wnWhhlz367gfZTZ6WlXaBhEwRnorD1L?=
 =?iso-8859-1?Q?Lk2i0R1RZBRqjUqhs4B3aLAiqPrVTZrI30yUiUgRCf3PgbyuX6OqDZiZhG?=
 =?iso-8859-1?Q?a+I0BuwqzjgTLpVGaBvkFcXp0S1yr1wLwTssmYwwU0oXJic+VaJ9D5McFQ?=
 =?iso-8859-1?Q?jTgqSpMXzLrexsNAmSteLQnBApbdbG3AL21g00v+nRcCr8fUNtA2H6BHdF?=
 =?iso-8859-1?Q?ctVODV0f3wQ5Y8kXZP23EAfuaRwpRCLvG87oiQuEYySLDGeu3ntNBNGgN/?=
 =?iso-8859-1?Q?cch+Ezkqwm2pEBoIydXQBQaRlNcF+m6OE6YU9rywNZPK/Fi0X/FV5BtEF1?=
 =?iso-8859-1?Q?TB8jnYOqQGdVuFxC8gdzq1OWfU0lMjKKPx8DJiO15+puw+HWR1g+Vhnmte?=
 =?iso-8859-1?Q?gn7U7z0uFN+fwnHbmqvNRk7z71IsgyXiuIDRby0G9GfT3v7ORmbEBIEmYP?=
 =?iso-8859-1?Q?i26R8b6T2PKVakN4Nhw6UjdxUEEnV24jtCQG6JAs01gUPFeF2ljrlywGy1?=
 =?iso-8859-1?Q?WNXcI8A1pi54OegMC3YEqqKkOZUUy8k2f9dl87+pUam6UHj+uEUG9FGbCr?=
 =?iso-8859-1?Q?vDfs0aQKPq/Ex2W46t633rF+OxNGQkzczpAudWIYnRg18RQyUUWFeDEYEm?=
 =?iso-8859-1?Q?guMtXrhyxf0rKc7wmdVmRfFfauES4lTIxOcwBLmp9XSVEG/QIkdzJ2jTjp?=
 =?iso-8859-1?Q?LVkq0uybjAkJUUmlix29MlbQRGt6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?RwsOQKGBUErJDRem/N5D9HhB+d5mhdo5tzx2Pi+VEt6C+7r5N6ZfJP1fwV?=
 =?iso-8859-1?Q?tu8ZPJfWbeSp2BBaupRurNb6dvdik09KFITIrAju6ZErVVKJV82kiJ01vV?=
 =?iso-8859-1?Q?HWl49D94Om1oL66OpNyTKjIIqBwX/HYQe061pb4kjoRGOZsXt5wYWAJtRY?=
 =?iso-8859-1?Q?EuFstMiVaUcw2axwg2Fez4QS8jqHPjVmvPUiNWcyQ+meiJkvCdq3xei4Iz?=
 =?iso-8859-1?Q?RRsRpIUr6xzIc0XkKQvYxITYRYPlinhs8uWjw+9pxsp3sLnVztl6cC1yle?=
 =?iso-8859-1?Q?IhxZsY8YIRtwn19JTPqxilLcTRs0y8r5iihrFFtLI+JssFKO2vnlxWMrXh?=
 =?iso-8859-1?Q?i75iEOdrbNc8O596y57MWn472JhgcS8uyGj6a/QBSlbGqILLyFGUtEZckB?=
 =?iso-8859-1?Q?PUMWnb/ixdI5xXni9qChHXRD11ExQ6ang1abrI1z+rfxTOSK+xZ6Pizfow?=
 =?iso-8859-1?Q?WT8RCdpevnUJs2CvZCxbhUOUTiezIWI6HDmGCjTEQ3jFonsJsmVZ5vm+XS?=
 =?iso-8859-1?Q?SipFzxqQWt8YN8fdrErm8EQEpp9EanYwYgI2x04v5ys/22SXtdqCMvwv6q?=
 =?iso-8859-1?Q?idE3SFoeTp70dyT7oRYCet1qdulCNy7tK+XKZ5IWlakP1tQ1+1kaDjtGts?=
 =?iso-8859-1?Q?udUgHloGmvL9+y4+ipt0kM+qz0aPh8hVHOW2+IJUU7x5QdjGf766tqIAur?=
 =?iso-8859-1?Q?+a9RfVTJQzgVN2jUjE4e2nE8zQxmJWFqG+zxiLCtPfriM3n3SeGn8q9MQY?=
 =?iso-8859-1?Q?5ncVGuSwie3es15PlEHwI2IH0mUR9zO2dUIY/Pa9sPwZyR4qma2aB3KQij?=
 =?iso-8859-1?Q?vYbeFPmT9G/0WFN0uOeckMnVfRmAk5PwWpb2luSIvWJpwuOu5AJJ40aIAJ?=
 =?iso-8859-1?Q?pXfbYpqTNKoxGezF6Qab1o+kGCTHu6ygqH5wPu9ud9XMlqDfBZvwyVHWjW?=
 =?iso-8859-1?Q?xiAsJ1heBKylZy8pFy4Q5WXncIxP6f/wYmxJ7dlMAQLghQgTrvFuB/OjOP?=
 =?iso-8859-1?Q?uGjlHTKe7KpX83+V0ovP++LToYzyO+LcUmoBE2mhUNgZt7XwHnp8xnd+ps?=
 =?iso-8859-1?Q?IxwzyyC/2BLzi49NfmvQCwjhU+SVWN4W7ts4QrbgzAh1b2wgWMdKcAUZYQ?=
 =?iso-8859-1?Q?mbLbVpSfq6VGeRhlo+J9gVhmsmG1wAUO42WiOrmVvbnuE82nL/+FtyPsUa?=
 =?iso-8859-1?Q?Uzil3DA8ilk2R37jBnHvf8WC6qeCQlOdtcN84Lg+fiPUXmTxHfz5XQSP2b?=
 =?iso-8859-1?Q?DP1P8AGm9ZAYPDs0VVzgtJRS84jpsfJcNkeWEZBSXm+9FV5WfPcFXHiyPs?=
 =?iso-8859-1?Q?+M5QuMm5Bx01AxeNGkGdiNHJ5Cm6+aYgizzWU5l8r/FYvBo6gKidymUogG?=
 =?iso-8859-1?Q?yOlGYzalJW4hptZknJKxrOn4X8UiQgh+3PpD2uKUeKLa2ZCvVtBK61FZ4u?=
 =?iso-8859-1?Q?xfZxRcLJrUJL4w37nqJJ3g0Ch3Nw2Ea12omnO6lqhRNYT3udDjSn/3Vmhk?=
 =?iso-8859-1?Q?JsPun67iOYR5ugY4lbwt6Fl9dPvaXUgySwa3rSb9+FC/6Au5ewK8LBe1Bd?=
 =?iso-8859-1?Q?FVLsBCVfrJtcYawDa+kAFZrIFxh5YaP3uvQ9cA5Opb30fIgkD7hx3j1uW3?=
 =?iso-8859-1?Q?/81U/KPH97b+tUmQQIkJEo3Pe0jHo7arRk?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ba2336-305f-4c35-6fc7-08de1b7068da
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 07:04:34.2124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YSw6z1TVST/cWVzrVr24D998zC3pAbxUt+a3Jm7sp4FCCtZSrmOpI8ia2nU6cjFqTBKTOXdN9Ts+ajOIhaChLKbeAlsS7EMpozn8u2sbmTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN6P287MB5136

Hi Dave,=0A=
=0A=
> On Fri, 31 Oct 2025 at 11:49, Tarang Raval=0A=
> <tarang.raval@siliconsignals.io> wrote:=0A=
> >=0A=
> > Propagate return values from __v4l2_ctrl_modify_range() and=0A=
> > __v4l2_ctrl_s_ctrl() in imx219_set_ctrl() and imx219_set_pad_format().=
=0A=
> > This ensures proper error handling instead of ignoring possible=0A=
> > failures. Also return the result of imx219_set_pad_format() from=0A=
> > imx219_init_state().=0A=
>=A0=0A=
> It should be impossible for a number of these to fail unless someone=0A=
> has messed up in updating the driver, but it does little harm in=0A=
> returning the error code back out.=0A=
>=A0=0A=
> The slight hesitation would be that in imx219_set_pad_format you could=0A=
> have updated the ranges/values of one or more controls, and then fail=0A=
> leaving a partially implemented mode change. It has returned an error,=0A=
> but an application would be reasonable in thinking that the previous=0A=
> working state has been retained when it hasn't.=0A=
> As long as it would only trigger due to a driver bug rather than user=0A=
> interaction, I would *not* propose that all values have to be saved=0A=
> and have to be restored on failure. It just gets too ugly.=0A=
=0A=
Thank you for the detailed feedback and insights. I completely agree with=
=A0=0A=
your assessment regarding the potential for partial updates in the=A0=0A=
imx219_set_pad_format() function.=0A=
=0A=
As you mentioned, such failures should only occur due to a driver bug, so=
=A0=0A=
this change mainly serves as protection against that scenario. Returning=A0=
=0A=
the error codes ensures better visibility of unexpected issues and makes=A0=
=0A=
debugging easier if a regression ever occurs.=A0=0A=
=0A=
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
>=A0=0A=
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>=0A=
=0A=
Thanks!=0A=
=0A=
Best Regards,=0A=
Tarang=

