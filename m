Return-Path: <linux-media+bounces-31427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C194AA4874
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 12:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96C6A1B68830
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E5A25A621;
	Wed, 30 Apr 2025 10:31:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020130.outbound.protection.outlook.com [52.101.225.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C079625A2B2;
	Wed, 30 Apr 2025 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009060; cv=fail; b=Ck3+WqjyMZAbkPzT6vf2E7SUfosDqf97ep84ScGyi5qJ38WU0SiS16C3khrGAc22Y6+MAMfi8LGunqLkrB8v4KqG3SMNpf6rcgrpxqXv6SWIyrK8f09YuUZkiluIF5tbCxLqaQm2JYnZHa67Sop4O6P98WPoMjdH8rWGVlmj5Bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009060; c=relaxed/simple;
	bh=ZqjrHOaalEsnrealHkkrbE/t35oafbBe9JODMvNZMHY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VekmoUkgQWjAEdgJqdf9Neoml7SAqrqDDVlzqKOfB3FrQGZMjospYrVhoTqIbPoNUH+G+ruRvDejC/gp/dp1TQ7R0iAlyCj6tjIVnu1bZ9oFMVohk1KzYoB6db8uofo9bYyIOo/sVN9UlKa9CHGrv15FLD5w2K/BM2PGgbblAf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecsmvgfZLPumrz9q2yEycWIoVePIp2SvdDsgP0Tk7ecGYTjy0LHQj/rqEYDEMID2tum5ALfBJvWyXsMrQXntIKssAhTbKVuRILf/uahNXGuvs6VXLvQRKDkDlulY9NQdCxLqoEh6TUBBPocEnqlJE/Ceuwu3hzn+kKtU7DKtt+EpFztz6uuuCYzVnb2djspBDF9gYmGQqv9yeDKB1dVIuWib+6KodmylrDcNsb4Nc6hDkxrzxbdiK0P7YsdtzFfAdWpNuy2TOuWNOQW1YLVSHm5/6pp8f9AwpNS4bUNi5zGq/v3GlcYAn5VyI6vnAb8Wr6TY/LOz+nMpjQkPC6fM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqjrHOaalEsnrealHkkrbE/t35oafbBe9JODMvNZMHY=;
 b=Qg/4jADc4sradTls5XyAvy+5vTpGznqE6s41YWkedRLpf4hPKPqaqhl7WjtkWHBqk5g8SPEuCinwo2vvLhAQ0aOsFhy2L4t37fThrnFCsX9BIGcRzWD/NiPNAc9bsBvGSIrhUGUKG2J+GbYhB7C/NGnT51GZpnlY/h6cfob7WdrjqbHReFbGrlQ2VeNGiGDgsIfX8YXcYEHdAiv+ysi865MogpufZJ9NtSWEZQV3Qhi+URanoRNbcDTsEvAYxJgbJwodOQxi0AUtsmpJRVEBFq4iz1Ugq0kL2HdW+/S9JAG0GkeZSTQqolelB7rdyGsJHjzXLz/0qScFljpQfCoTPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB0110.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Wed, 30 Apr
 2025 10:30:53 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%2]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 10:30:53 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Shravan Chippa
	<Shravan.Chippa@microchip.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] media: i2c: imx334: uninitialized variable in
 imx334_update_exp_gain()
Thread-Topic: [PATCH 1/3] media: i2c: imx334: uninitialized variable in
 imx334_update_exp_gain()
Thread-Index: AQHbuam9HPWFr4mYWUe6Kuzyvu63PrO78wVFgAAGvoCAAAU1Ow==
Date: Wed, 30 Apr 2025 10:30:53 +0000
Message-ID:
 <PN3P287MB1829F95ACF4B2D2C39AFDDBE8B832@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <cover.1746001540.git.dan.carpenter@linaro.org>
 <ee811e7c6eabc390241e0227f7a26d1eaa7818a1.1746001540.git.dan.carpenter@linaro.org>
 <PN3P287MB18296802E1A6C2CD55997BC68B832@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <255a8604-5aa9-441a-a4d6-ebc592a00be9@stanley.mountain>
In-Reply-To: <255a8604-5aa9-441a-a4d6-ebc592a00be9@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB0110:EE_
x-ms-office365-filtering-correlation-id: b4249e79-a1ae-4cdf-e6f5-08dd87d2159c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?XnpILJQuu9qU7EwSggPyd8eUko1S8ZPECkbJ44srVX4zx6wGyDvzMNjE?=
 =?Windows-1252?Q?Hf1Q+C71sYp4SnnlkT+aO2JJCLDZlMLowodZWo6yB0fwQQxwVx/fMucf?=
 =?Windows-1252?Q?xs+n6eIqBE0sAI7xe0EtdWXMV75P6wosRnuGTI+Yn3GzzOELJsxPsno5?=
 =?Windows-1252?Q?g9o7Q2m5cnHUJKD5YQmFYbD8dcBj2Be+jA8NNXzf2lXBVC3phJ3pBCYo?=
 =?Windows-1252?Q?VhyXLj23fzbFj9qnjaLwDZRaY1cuDAE4VJvtV7FDz9zcMnWUqI3B41Qs?=
 =?Windows-1252?Q?8ay9j1h1kDLE5LttYMgTRBM1rDYQRqftokt6gCiVjWTEL2P9SDmeLf0q?=
 =?Windows-1252?Q?SJP7smugrMHOOcNpS4uu1fzGXcZEMCOvuKbDvahj+IB4aUImwoP3a4hd?=
 =?Windows-1252?Q?4x+vaQUOjD27s3pSrTyQmU9LRSPgIjYFi9fBJUc7J5nqmWNzWpZ0qo1b?=
 =?Windows-1252?Q?ssaKvE6fH46gUxvOLvzKTbpI8I+tgF7eqJEA7QEmdvqNsfC3e1L1v/wU?=
 =?Windows-1252?Q?DsQvqwstOnwgwKMlywxot08Nv5RkibrbhYimnZdlOkl/s5kXtwXHPTpJ?=
 =?Windows-1252?Q?UWqO8dRY0k9EpYr61bgqPKRLhNc6eU97u6UROzTMpTHBpTWAcjZkhcmA?=
 =?Windows-1252?Q?XdffM9Nboj22U+DfHb8kFgWafDnRcS1l05oWecuCdA1N/M6If7j3noo3?=
 =?Windows-1252?Q?txAnrjHhZ70/ZIiKs1XsejEXVReZDAFqifwiBbzEx1zfRg3O+3W5x5U8?=
 =?Windows-1252?Q?aPHHeQWXjKmJL9KzbgeXIEao9WBsNVG4oMH4sNN7N2BCP6/jPdMyeWLA?=
 =?Windows-1252?Q?n6MNOOg+mDHg2iIx4TbtWpK6isO/8Dih8MPnjVJgqsFoT7dzjbGnxVYb?=
 =?Windows-1252?Q?hHZPULaaSYsNqCv11zE8B5o0N1RpJz/x+CPWBdMEUZSRs9v2RrwHYVN+?=
 =?Windows-1252?Q?JQm4x/71HOy5ssSUgqHoJ9TeUB+ub9eAQGqIJoE0Rb1Un/k5raIDT60p?=
 =?Windows-1252?Q?mB3W7EP3cLtkVX+4LDeUSAl1jocTz7FUIKNsDw4KRgxk2t4zt9xFrXx1?=
 =?Windows-1252?Q?Q6cXULZ+MSI7kyWehlAVjfWAj7DtqRiy6ubvusUjnMT2vrsoqdBFQ6Wn?=
 =?Windows-1252?Q?0pRm0WInhBUroUuvmbqSzgey0KFZZJwwkSOB/YwDA/7gPzbPTf5u6Ab+?=
 =?Windows-1252?Q?x6IapvwyXf2pB/g6YIz+9M293bXxP5m4orlshq2Gl/XePonv1rGryNqP?=
 =?Windows-1252?Q?4rKRv5u5sRpN+VPOJkADUlWulkr04mxXrjeaDOBn8NHIDuvTdWvMKPIx?=
 =?Windows-1252?Q?Qr/G+/OGjI5cuNWQ+6+gIpUU98hLzrV08TYr4px77m+4W//Pzsrndx9d?=
 =?Windows-1252?Q?+KPye1Tlp1jv9WzRkIwlNUllS4T0zRTzuduuAKxTK0nPUQ7SxOy35CxY?=
 =?Windows-1252?Q?Mnnse25IVm7ib5roR1lZZ00UCd6SMNnG3NcUWx4PUVcYqgBiZRgOQ1rl?=
 =?Windows-1252?Q?xH89qnl900M6oNSBDVqTzQ6gF1R958el5v4haVIsriUtjAAUYZydb6p8?=
 =?Windows-1252?Q?3ypry7QtjIUuVnOY7nb5VSA0RoWrqPRaVVrmvQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?A/xJ2ynZ0y22tolr3YVL3rHCTTbeFGXyQMrmIyA9oqFAwer8X/3NUfuD?=
 =?Windows-1252?Q?0oVx1aH8hJZLizUdJ1VtpCiYeVMCjld+7WMM9BCJIbXM5lWKjwLs9RVB?=
 =?Windows-1252?Q?hf+PSTcHGDfi1/mZDguwDS3ByMY6SBfmSNJsu2+mOcjOkp0yFRRKDMKA?=
 =?Windows-1252?Q?hm88XIlTQWeHaX3fgoWoolRjZKD2rgzAmFPslg2Le39ZMXfqz4Lue1PG?=
 =?Windows-1252?Q?3dBEk7AOZ6Zk4LIToqltzNJxdR6N9V0VCt6MAHw4ESLPuLebhneUoGCo?=
 =?Windows-1252?Q?YjsHUSj7ryJxGEquFqLuMLUFIvcPivMASn0bj6q9W6UpcIzKNvTXmhGa?=
 =?Windows-1252?Q?qSQEJm9i3ocpqUQL4kEMmOg4MT8jwnLmmOmfMxc12Kh4cxow+MH6gZzp?=
 =?Windows-1252?Q?xGAIh5mxba5un+yjhcp7GUd/qmK3LeC+efQPYUasCF1S1yFmU6Ht8ZYc?=
 =?Windows-1252?Q?PbfTZ1II/gHtCItyVceiXYt12Fzrbnx86sLBBweKzMKFNdVxBIOv+mLf?=
 =?Windows-1252?Q?dWfYmsmAWUx6Rvj5AwsexuJ9TZT855e3/a8abzzffmGdpPu6EHuCWYGT?=
 =?Windows-1252?Q?5ywBBoRTKTUJdrG/JkNhMAqWuRRjbiBdOxie6DYDsj9pM063FrrOyuXE?=
 =?Windows-1252?Q?146GkA1NI/U91wi/zT+DhMRKxszO3h1v5TxWw12W3a8EePoVP9C+41u9?=
 =?Windows-1252?Q?5HFHw8/OrrJE1qQXyq6LMAviN1Pzudy5Xlk9m/naj+SUw692NvwlnGK6?=
 =?Windows-1252?Q?3XJCJnatFJu/i/1b2H9xJddm87RRePPqP008+S4lht1hD/S03k4nbDc+?=
 =?Windows-1252?Q?ysPAo1+Y1vCiNi7f6iPuqZpyYWIgcMV94m5qdiHyUhmYTfcil26oEaMN?=
 =?Windows-1252?Q?kUtf0wDntnhvjAzZThHE7jXsCu5zOSkrlT/Ya+1nmrgQyzefIg2UKwtY?=
 =?Windows-1252?Q?YyzvvM471w7b64lrc2cCAnRFLJodM0V7uCfYs1qAm1auQ/Dqjriha2Ua?=
 =?Windows-1252?Q?iQ4YqmaaxjiWiTtypwFnjKIJ3KAiihuvKjKHZrfuU+WxqUWxmBAKIPmN?=
 =?Windows-1252?Q?XXVKU3vycfNeIn8VjuRDwYlyVWl9LoM9wF521I/bBFFqmjztosg2DLtZ?=
 =?Windows-1252?Q?aTgn08tOgYVkAPUH/Bnx3UGd5TmDUCqEvB/ZtZO4UfvhUrH9ZySzn2P+?=
 =?Windows-1252?Q?jiMyTzGg1HvFOEdPYCxKguAstJOQmd+vcC9HpkJEZCvkdzC6aYqI8UDY?=
 =?Windows-1252?Q?HPgnF1IBgwY7qqBsn7x098XGuOuRqphLlLJjXDiI8YRFyjBfw6Kwa5m/?=
 =?Windows-1252?Q?ZBlT/H7fx5aXXDtcAp4uxf4k6r7X9dJvuPXDINWdis0tD5+DIlecJQGN?=
 =?Windows-1252?Q?BsFCrHL2+6CxQQ2U/BvaozcK0bu7NEWj/6iQFkT8ZOb0TfoAyreyWMTZ?=
 =?Windows-1252?Q?dSH7MmcijDsmoKXZEjseQ2194LPQUcJguYfewOmn8a86X63nsrnp+f1G?=
 =?Windows-1252?Q?kYi3glKeztAhk2n/11lbjAnkYA6BHRZrr3TjEV+zO+lCBEfm88R+4zkv?=
 =?Windows-1252?Q?0BOdPMMxLpv031OVJXU/z8a6KJQy8l7QY6lqJEPzbeOWQSiR+8Kzu+37?=
 =?Windows-1252?Q?G6ZvdCQs8X4r/pYx1MRFpBcMR7FhDnmNfLwumCjZdQJv2UvszbANZx1Z?=
 =?Windows-1252?Q?wBOk2V16T+uSOMc5KgE+QZa18xVx7wF61nQ/72EGN2dyTB/qPf51EQ?=
 =?Windows-1252?Q?=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b4249e79-a1ae-4cdf-e6f5-08dd87d2159c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 10:30:53.1934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q8w25jCm62xnIYAueCmX6bpLgIrOUhz2DBiOlFcf84S1GDnRaLGYcaZEs5zXp/msrLdFepRuId14tj8hVQ8kEMJi3KenDV5qg+kmLD5b3/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0110

> On Wed, Apr 30, 2025 at 09:47:44AM +0000, Tarang Raval wrote:=0A=
> > Hi Dan,=0A=
> >=0A=
> > > The "ret" variable is not initialized on the success path.=A0 Set it =
to=0A=
> > > zero.=0A=
> > >=0A=
> > > Fixes: 7b19b0fc8ac8 ("media: i2c: imx334: Convert to CCI register acc=
ess helpers")=0A=
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>=0A=
> > > ---=0A=
> > >=A0 drivers/media/i2c/imx334.c | 3 ++-=0A=
> > >=A0 1 file changed, 2 insertions(+), 1 deletion(-)=0A=
> > >=0A=
> > > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c=
=0A=
> > > index fc875072f859..846b9928d4e8 100644=0A=
> > > --- a/drivers/media/i2c/imx334.c=0A=
> > > +++ b/drivers/media/i2c/imx334.c=0A=
> > > @@ -536,7 +536,8 @@ static int imx334_update_controls(struct imx334 *=
imx334,=0A=
> > >=A0 static int imx334_update_exp_gain(struct imx334 *imx334, u32 expos=
ure, u32 gain)=0A=
> > >=A0 {=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0 u32 lpfr, shutter;=0A=
> > > -=A0=A0=A0=A0=A0=A0 int ret, ret_hold;=0A=
> > > +=A0=A0=A0=A0=A0=A0 int ret_hold;=0A=
> > > +=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
> >=0A=
> > I think this initialization may not really be necessary.=0A=
> >=0A=
> > If all of those cci_write are skipped, then yes, using ret uninitialize=
d=0A=
> > would be a problem.=0A=
> >=0A=
> > However, I don=92t see any case where they would be skipped in the=0A=
> > current implementation.=0A=
> >=0A=
> > So, is this initialization really needed?=0A=
> >=0A=
> > Best Regards,=0A=
> > Tarang=0A=
> =0A=
> This is a new bug that was introduced in linux-next...=0A=
> =0A=
> drivers/media/i2c/imx334.c=0A=
> =A0=A0 536=A0 static int imx334_update_exp_gain(struct imx334 *imx334, u3=
2 exposure, u32 gain)=0A=
> =A0=A0 537=A0 {=0A=
> =A0=A0 538=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 lpfr, shutter;=0A=
> =A0=A0 539=A0=A0=A0=A0=A0=A0=A0=A0=A0 int ret, ret_hold;=0A=
> =A0=A0 540=0A=
> =A0=A0 541=A0=A0=A0=A0=A0=A0=A0=A0=A0 lpfr =3D imx334->vblank + imx334->c=
ur_mode->height;=0A=
> =A0=A0 542=A0=A0=A0=A0=A0=A0=A0=A0=A0 shutter =3D lpfr - exposure;=0A=
> =A0=A0 543=0A=
> =A0=A0 544=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_dbg(imx334->dev, "Set long exp =
%u analog gain %u sh0 %u lpfr %u\n",=0A=
> =A0=A0 545=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure, g=
ain, shutter, lpfr);=0A=
> =A0=A0 546=0A=
> =A0=A0 547=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(imx334->cci, IMX334_REG_H=
OLD, 1, &ret);=0A=
> =0A=
> This first call will do an unitialized read of ret to check if it holds=
=0A=
> an error code.=0A=
> =0A=
> =A0=A0 548=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(imx334->cci, IMX334_REG_V=
MAX, lpfr, &ret);=0A=
> =A0=A0 549=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(imx334->cci, IMX334_REG_S=
HUTTER, shutter, &ret);=0A=
> =A0=A0 550=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(imx334->cci, IMX334_REG_A=
GAIN, gain, &ret);=0A=
> =0A=
> cci_write() is designed to preserve the error codes from previous calls.=
=0A=
> It will only write error codes to "ret", it will not write success.=A0 If=
=0A=
> everything succeeds then "ret" is uninitialized.=0A=
=0A=
Yes, correct=0A=
 =0A=
> =A0=A0 551=0A=
> =A0=A0 552=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret_hold =3D cci_write(imx334->cci,=
 IMX334_REG_HOLD, 0, NULL);=0A=
> =A0=A0 553=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret_hold)=0A=
> =A0=A0 554=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret_=
hold;=0A=
> =A0=A0 555=0A=
> =A0=A0 556=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> =A0=A0 557=A0 }=0A=
> =0A=
> In production then everyone should run with INIT_STACK_ALL_ZERO.=A0 In th=
at=0A=
> case everything works fine.=A0 However some older distributions do not us=
e=0A=
> this option.=A0 Also in testing, I would encourage everyone to run with=
=0A=
> INIT_STACK_ALL_PATTERN.=0A=
=0A=
I am not aware of the INIT_STACK_ALL_ZERO and INIT_STACK_ALL_PATTERN option=
s.=0A=
I=92ll read more about them=0A=
=0A=
Best Regards,=0A=
Tarang=

