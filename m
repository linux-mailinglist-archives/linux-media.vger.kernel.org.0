Return-Path: <linux-media+bounces-54923-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM73Fq6CrmlfFQIAu9opvQ
	(envelope-from <linux-media+bounces-54923-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 09:19:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A162356CF
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 09:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 445BE301CFB8
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 08:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D765736CDFA;
	Mon,  9 Mar 2026 08:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="OkRE0Tb6"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020119.outbound.protection.outlook.com [52.101.227.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61E1363C5C;
	Mon,  9 Mar 2026 08:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773044356; cv=fail; b=lttxf1WvTr/CTmA164A/qI8qrBMYP9GndCrUiDlChS4oeAn6FHbGYgJqAMhJ1GcFTTEdUq111haPHanyY2cAouNX65ApNobreFmLq6kp0rNwF+9+DRO237QNghxTLDxtjYWiJfnlme1aktwJaubwlF/zYNxBDLQ7Z1aawM2ehzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773044356; c=relaxed/simple;
	bh=nlTumxxI0TCOJCE6cqbTqAJkmxLHVztto8TBThgHSag=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kvo2jMqqHqcaA7m8NXSlBoNQfIuIMz6pCZe4yrUD+uRB3SYMpL6YE5kvdYXBAcyeQYNNyNfCWVFClbPhZH9Y7SE7X9fM5qhGTGRnzancl9cR7TmO8H9u8haVphtzyJF9bkYHwNUwBR8N1InFZNQIjxBupaHWYP6ZYyV0yZoAi/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=OkRE0Tb6; arc=fail smtp.client-ip=52.101.227.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRU/TBNfeKex3lWsr+94WcLrXUSdEkC7DbYHp3JS+4rMhoBDnHG4KGctJqzwUAuP6xYn8VxUQe/YuU3Ih7NtXxr13iWe+R1v6BhLZhpB8nMnpx3OVoP1Shy8nrr5rnBLUhFhy2AwroMwAcb+WJpjijMg6WHX9WircaPae8R9nRzLHELFEWCQGasLRn+i8izDcDpveUERyqlZ8rrxyR/A4jscrcXso0zOh9h4Bst2RsHxpQ2SBHoqZjv/sb1U3ZOCftw65mh51Ii9mYM6JbfVdNtP6eS73wyksS6uDWV+dJHOV3yfKJmk5hsPGIC7KRpKjjzb0SsgYNiPw2Ccpy6lNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlTumxxI0TCOJCE6cqbTqAJkmxLHVztto8TBThgHSag=;
 b=aCiNz8R0gUKJsxmZH/w2Aw+l2RGQZ+1Cve8ovTWzcpGhLnqztX0Sc1sswxWZVtjb6DgZhYovVNYw5Nib3rqkctoe1p9YSXF34mveYHId0mOi2bfUijug0VptJedIv5/7CEOZaTxUEu2iEDG+LMTQ7db6xY8fGniLqaaU6bZGbyH2C+/PCbu3UjazLYVas/Trz4lufO5ANYH0Nu7ll/CIU/fMsi+k3BvFGPPDOlodorj5PFy+w673v+I+rlDONTP2z9/aBdHqkqoEz9dHrv3i5B8tgPIWWiaWpW7XeuR6TphZlq1oU+aHv4KP0ZhRGq18c0WIStwdpcl8pp8BVmke2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlTumxxI0TCOJCE6cqbTqAJkmxLHVztto8TBThgHSag=;
 b=OkRE0Tb6fwURKW5FxJ6YDk+sp6e5opeH1wMLKM/1mN3hHEBSoe9/1qCarekpvYx/BAdDpNpEBC6NB5Y/3CDETyLSjXwMzVwzK1urRuHisRWT1x8whPLd2OulZCZArjCkPKk7VIwzHrPai80nT4ZHhVBQHuJ3VEVUyts3wdN/++MFj+Gi82nj2CCw1R7h42nLlP7JuThJjGc3NHoDQWVONBguABCjc5HNjjzwEocx/XO18uG3v58XHalmjJ9EN6sXGkOjRagcQfW4beAtYfQGHkyHbwkn5sld/t1WbsHN4XYhPeboxpQZQVh6mwIlJXjmpiiQKCDTsLw6laOGMN1p5A==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA5P287MB5142.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 08:19:11 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 08:19:11 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
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
Thread-Index: AQHcrWWbBCA5F4vFtEy8NDemy3uU2rWhgb8AgAECI9mAA1WN9g==
Date: Mon, 9 Mar 2026 08:19:11 +0000
Message-ID:
 <PN3P287MB18292213A1DE4E8BB57600F98B79A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260306123304.76722-1-tarang.raval@siliconsignals.io>
 <20260306123304.76722-12-tarang.raval@siliconsignals.io>
 <aarYbAf8jnodZ4UV@kekkonen.localdomain>
 <PN3P287MB1829F11B3BC3D07BE13C4C228B7BA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
In-Reply-To:
 <PN3P287MB1829F11B3BC3D07BE13C4C228B7BA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA5P287MB5142:EE_
x-ms-office365-filtering-correlation-id: 2e9fddbf-888c-4211-7649-08de7db48ae6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 GjmO6qADMQKQpFBtiFjr5CeVayhE7Wxi9xgGtP84oSdi8nJ5uA3GDj7Hfl17CRxwHXvqeCqwexWzx2k6kRf/QPfSFDImfEcaqgkd340GDmTUhDdjFc7jmjqSgVOv8lxa/f5DFT9O0xqHSnFb8x65vfqQ2VLEX2IHcExEExGBLzEmPa35L5/dV3TXKBhBnwIZcskuoThY5r9ItUpNiuJjkfY88xTfist7TytjcMQITDQ2t464LiT9DbFZfiJozVJPare/zN6DOwlcyfHnFDMw8Uss3jw84yLJnrThRDkb2N0diAkm+54bSVzd5fbW7uH2rmT8TUY0lXBN39+Q342vR3c4vDm4yM/+fY6gXy4Rd0WMZk//7bkvfLrbHFItaOG5D19DXyQqoY7D7EzKF5P/QJyJv+8/wRTif1zDfzXOb6Dp/IUo2H2D9UGPpWFGzdLQQMNFccT9kFkh7JIEu7RstIYuwBHrYi6hlKM8lQPbHZlKrHryKZU39y/3CZTLJNXL29ZKbr0N6E47wOGOdyfqJpjjt4bQxSTdpuJk+0BB3gCSNn3mFFxtdWgFeteMhBHFdD7UwYKFwo4Sth/mc9QKNRDGErmqory3SWMOowCy4sWHs8uq3sI4Z5r5SvsIF84XiStm9fNcbEeL7Y+53sU17dsjeWhPBIgR2JIJ9VXvOnXONhpaZLcRwlPPUKHgJqeSnKvP+2xOPaNizIl7mHBT7mdLWaQpRiv+cyIv68PylcRKX+i8f8gUD8XP5c50LkSDYwnI9KePz0IGCbVR9PSNDLPT2nybJKKRDOx7Q4PcRuY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4xCliznULL8U4qYOJT5jEs32fiLpMHRtUPauva3eE3jut4rqhICyKT+sdY?=
 =?iso-8859-1?Q?5TdkXi0GpbfSM9RRFHVb1CdpwOYISK2DiEXXqyEftSH7EtFn05RlVfoE/2?=
 =?iso-8859-1?Q?ANAKRrzopxRRC1EBfmj7GWKEdM4ChOH6i9NmRfvMASRY+r3VtMo3btikzB?=
 =?iso-8859-1?Q?qrpl1ns5wKCeBzbr7z7N2vFb/xbCFk/7fSM5a8fZoYXb1y7S1azbxz6Y5H?=
 =?iso-8859-1?Q?c0Of5IwQ1DeVOxA/rp77r/vPCYQ10b6pjJ4vuaOQQQedk6QFPC4fHYDNDj?=
 =?iso-8859-1?Q?Ci9aPEVLCXjALaScK1jRa4vwI1b4I1OP5tpw3lZOSvcShm9LTmIEoaZDmm?=
 =?iso-8859-1?Q?c3ctBawLmSgkDdfrLoj64xJfMXWvTuCZ57c4HPZwleEhV7idRbJO7szCke?=
 =?iso-8859-1?Q?1Cws3XAUBJgHYbIQNVPK3Dtv1Q0aZ0TEiECtyr32QwXL/Nj3ZS7ZEYb6A2?=
 =?iso-8859-1?Q?MVmZ3bI98UteYCA5X7Zrq5qZ59sT0vy0x4iSD79Kg/E1f/TtqpKHEqhFID?=
 =?iso-8859-1?Q?2p21DNPpvLXTofxWy6aOFqAHjAkS/KugX0NWPXcTgyOGTpCYMTpUFInAKL?=
 =?iso-8859-1?Q?GWG2DtqG8UM8YZEPSyho0M4Syeuld8n/YOMFlN+gczXObuph5eGnSVI1OG?=
 =?iso-8859-1?Q?NPx1n250XPmj7q6yFsfn1A3KnOJKgTwI1GGNBzcK7xTvJydF4vSV8GrIOU?=
 =?iso-8859-1?Q?kKTN6ZcTMMVECfBqHLh4N9EZpxxjbH4ccnjEG41w6kA2ZHYPNZmvMjyIem?=
 =?iso-8859-1?Q?qhqHlia/lp1JrN9ucZwOTuS1WAi90ixSs4HU+XFTugeLkteUI+TZ3Me+Z7?=
 =?iso-8859-1?Q?i+izdt6SILbVrlUeTrzsj2dWkB/12qWl9xcuOmCGaBA2rasn0zUqy/CX7O?=
 =?iso-8859-1?Q?xJO4Ls3ktU/wQLN91guSj/p8gt3ah4EIaO37z5/JacGeEuMYC3TT5w2VQs?=
 =?iso-8859-1?Q?142TjKz9+H62oAP4kl62WYhSIRMqT/gPRTNPWG2n+wYyhHepFf8zflycO1?=
 =?iso-8859-1?Q?nWI1zy2MyjogWo3ooxatkONkqCQz2Mc5MB89EXm+7J3VJ1UujAOPOJLnjd?=
 =?iso-8859-1?Q?KY8mVAAIm1hMt0j3xtsrXc6L5zxC5/hd1At80ihOPS5j5DONRfl1PwMrW5?=
 =?iso-8859-1?Q?Yglbp83YdLXrQD71TT1WX36XqHIS+hzUrkS5WJDWsfDsLB9CGHpstGQ+vg?=
 =?iso-8859-1?Q?XKB0K6XLODXBR8Hzc3bR1LkriYKwi+hdxJzKxtOA953mHJOOwN8CMts5OC?=
 =?iso-8859-1?Q?zHrT5wWqxOhumlCLjRkqj34unXqb9f0f006dZBD8LPQGgJkeF7/PwV35Cb?=
 =?iso-8859-1?Q?tZAmqzNNClBBcWdAqJXXokBZryl0LQT+LlPzy+CKCdAMLQ6cspLo8XxPya?=
 =?iso-8859-1?Q?CHh39Fpp0npY93NICnCavwHfKgSvUR92sBsgKLU+OU3dSsLaDVEUpeOPNZ?=
 =?iso-8859-1?Q?p4qaRPliafFpUyEwMO+pnZz0De4c5KKAXrXOPp0zgczgVYCLGGa99fcgJc?=
 =?iso-8859-1?Q?bENCqj4NZ0sxJfhxlbo4eNDf8Lx3nn7unj+Cu//DjegV+rC2rouGlZmtl6?=
 =?iso-8859-1?Q?oBjy6tuIBdW/Jh/5mo/sx/d6rxflMYOE/X4KoHBST2G8Shskt/Ocm+nj8g?=
 =?iso-8859-1?Q?RWUXEVFNzBcyjgqn2GYFhzlhhR5S12DIh+T+wt2lkDreSe3hk2jU1qXqAd?=
 =?iso-8859-1?Q?Vab8KpVEzgpEymhA3rrfDt5sLCGf4jTvchJNmVyWpxuYm3tJ7nG4+QJM/K?=
 =?iso-8859-1?Q?G347f9bcrhpTYZ0OQGhOdQBAxeu9Ht3yAMNd4nhBhmNQVXIcWO+bV+oRjv?=
 =?iso-8859-1?Q?yZrW+ZVoNQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9fddbf-888c-4211-7649-08de7db48ae6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 08:19:11.0889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 98LoJgF1SMTjTpsbZgZZtpH84U5g/f+0ISkLW7yH0G8sXzDoLXOLRuFlxiCZFhgmhXGJNKDsMsGSd9cM4JSIlY/fpFp0eKNJrSa5u7AEPGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB5142
X-Rspamd-Queue-Id: B5A162356CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54923-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.953];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Sakari,=0A=
=0A=
> > On Fri, Mar 06, 2026 at 06:03:01PM +0530, Tarang Raval wrote:=0A=
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
> > >=A0=A0=A0=A0=A0=A0 format =3D v4l2_subdev_state_get_format(sd_state, 0=
);=0A=
> > >=0A=
> > > +=A0=A0=A0=A0 *format =3D fmt->format;=0A=
> > > +=0A=
> > >=A0=A0=A0=A0=A0=A0 if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {=
=0A=
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D os05b10_set_framing=
_limits(os05b10, mode);=0A=
> >=0A=
> > Does it take a driver bug for this to happen? Presumably? I guess the=
=0A=
> > result would be somewhat inconsistent state in any case.=0A=
>=0A=
> In the current driver only a single mode is present, so the issue is not=
=0A=
> observed because no resolution change occurs.=0A=
>=0A=
> This issue became visible while adding a new mode. During a mode switch=
=0A=
> (from a smaller resolution to a larger one) the limits are calculated=0A=
> using the previous format, which results in -ERANGE and the new mode is=
=0A=
> not applied.=0A=
>=0A=
> Updating *format =3D fmt->format before adjusting the framing controls=0A=
> ensures the control handlers see the correct dimensions.=0A=
=0A=
During testing I messed up.=0A=
=0A=
Sorry for the confusion. With patch 10 the -ERANGE error is already resolve=
d.=0A=
=0A=
During a mode change, os05b10_set_framing_limits() receives the selected=0A=
mode as an argument, so it already uses the new resolution when calculating=
=0A=
the limits.=0A=
=0A=
Also, the control handlers are only triggered when streaming starts, so=0A=
there is no practical difference whether *format =3D fmt->format is updated=
=0A=
before or after adjusting the framing controls.=0A=
=0A=
Given this, the change proposed in this patch is not necessary.=0A=
=0A=
I will drop this patch.=0A=
=0A=
Best Regards,=0A=
Tarang=

