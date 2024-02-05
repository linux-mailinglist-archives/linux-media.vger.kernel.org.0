Return-Path: <linux-media+bounces-4666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B43B384935F
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 06:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8A9C1C21FD3
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 05:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97BCBA38;
	Mon,  5 Feb 2024 05:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="J+SMjlaH"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2109.outbound.protection.outlook.com [40.107.113.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89808B665;
	Mon,  5 Feb 2024 05:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707111092; cv=fail; b=X9Tj6qBvTvs0kBdtUGIcj8sbBLP4oDzzMAr5oZmopLODxnjlWRn/MQGGpKpCFnBYs0/lTnqIjH3lbzWB7dTeSlRnc8onilY7s1a7k/2awX/RHuS7NTZXMC+JYIoET/bbZ3q6nMf/sL2XKwlQzU3xeqvBaX6+LJNtCp6moBDFx1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707111092; c=relaxed/simple;
	bh=Ez/cNbrikcOK+rSk8lBRL8Zwm2/B4V6j0aIq93CbekU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=c3iHKz3UlV2/YUnBuy8wmG/FuGoBHy1cqjqjTJ7kiw39OKnqTzZV3EmWtmRMEzcC2YGMMtAsBanSE+s1zQ1YU6w58C5k0eBfaUTImsDMwTfeOoUQGt5oQgBqD90J3IMqr4bN75GUsHCg10Mxm7eEg/MAvlHOCvnxhnjlCu26yUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=J+SMjlaH; arc=fail smtp.client-ip=40.107.113.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daw96ECLD5nFUFWgfLPA0kYoBFU2zm0f6lhoV2axZTWOrbvmhNMD1yXPjQrFTgBDOXmYZSz9nB9ETajoIBRc2KWzg0ob+ZUhU7Ss6q7TEUgR9SAY/InYBDn46ngb9zFO9Dix1M6Gwe+TKhhZgR9UOsEIRAqy48Eti9O4oaEYU7bJzudqkAbfhBqiT4Ir069GIjL9L+4DF/q+XedfQWySAefGPbnNkq7uS1Iq61mcl82XY7Yb0HD3LfuO65ggHKbDCJyB3ehMSQRq4Z63lSWLfJA0ZHBUjSpjXTTx0aOYjGZqaVp6sh+xRTaAK3sQl4LV+LC1fU7PwWix/7Kh5jnJ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpDJsb/GKvWelBQFYTW15Fec7j9I9uxPwrIzEoafF7s=;
 b=cJ9w51GyOd02gzIoRUyARZIDHvZjl7thWKzAX91NudWJ/Pkt8BQj0KcIHxwxNO4iX7yP1s4Z7LgIJtV9Q4BQAtrfyTQQS+GH8YEtsj0O/Pc4h86c6TyHqHUBS1l0GyFKRarYEHZHtdGUNxM+eJZhrhavDDbhN6IuK5YE6ySBKXTggtlxmFq1Se1WOrqrNbRw754sl1PMbcHU05Py0FjchxqULqTXi5GqNH6QfMVhldTHx1cSsuacdZjKxzGTUNyfGHlfW7VzvZT2s019XDHdkXkEy2rXBujj55vVzl0xiLgyw9rFykLY6/+46Jp6owqcxcBSNYUvQ2f9zpDnVO2QZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpDJsb/GKvWelBQFYTW15Fec7j9I9uxPwrIzEoafF7s=;
 b=J+SMjlaHgmrbQcn39eQdw9AtJT9k9uWb1lNR7QxTta2mwYo38INtBFB0VdbNJ0wezFw0eux7aW7J6rB8qT+uMlegp/aC0BA/+bmzFbmpcqUwnIDWRySIa/QBqzHUEqMwkWGXFv/2KhBcb0MHc6NCClU+kk8IGyMjtBISfQ82bAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5859.jpnprd01.prod.outlook.com
 (2603:1096:604:b8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Mon, 5 Feb
 2024 05:31:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 05:31:25 +0000
Message-ID: <87ttmncw9f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,	Uwe =?ISO-8859-1?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,	Daniel Vetter <daniel@ffwll.ch>,	David
 Airlie <airlied@gmail.com>,	Frank Rowand <frowand.list@gmail.com>,	Helge
 Deller <deller@gmx.de>,	Jaroslav Kysela <perex@perex.cz>,	Liam Girdwood
 <lgirdwood@gmail.com>,	Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,	Mark Brown <broonie@kernel.org>,	Mauro
 Carvalho Chehab <mchehab@kernel.org>,	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,	Rob Herring <robh+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 00/13] of: property: add port base loop
In-Reply-To: <ZbtiAJklkLaXWY20@valkosipuli.retiisi.eu>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
	<20240129122736.GC8131@pendragon.ideasonboard.com>
	<ZbeoPBvGJlaJco_J@valkosipuli.retiisi.eu>
	<87zfwnirps.wl-kuninori.morimoto.gx@renesas.com>
	<Zbil22dm9x2ZudJC@valkosipuli.retiisi.eu>
	<582ede29-2df7-4f01-a03b-da59d9f56d74@ideasonboard.com>
	<Zbin6Pg6oNp0cTNO@valkosipuli.retiisi.eu>
	<87ttmu76co.wl-kuninori.morimoto.gx@renesas.com>
	<ZbtiAJklkLaXWY20@valkosipuli.retiisi.eu>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Feb 2024 05:31:25 +0000
X-ClientProxiedBy: TYBP286CA0038.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a4a77ab-c0ef-4ccc-20a3-08dc260bb20a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SUS6dgv336uAe1GROcW7ETJCpW2DdJLu75MjuyRo+Zc2mVOOUcoZ8Fri2LQtC32gNuGcycFNmDEycsMXBPfjeYGk6PvYdYjHi+Kb7AN2+n7G4x2p9RFmKNDWD7jAXjx+caEhZDwy/t50XfhZQIw65mTzyRT368dPxOPHAaVWiG3OisZxH33b0yRWRh2lcGPhfGDB2zDVsSuCk1wWzkEOPWK2Y6Sh/yUlxO08KrqidbopL+KCq62AXnRtLkMNXU/IChhoR172fXDTGpAeZwRKkbB3C3x6D7zjFrwRr/9dwSAM3BFadCodvESx58ICpX6W/t9KO7tX0n3NGi3IW1ca1dBJq/uxcbsPDk/mvuhmPY2UE+N+rL5hZ343AdCbZA1F6OY0SZy2aOjpNCvKCX7LAw97C178/EyFRUwR9sbp0O5T4bfMwqv5GtmYAePG35HjmdpxeG3zeSC+zbCZgKr5bomSfnMssqWViWRfWx02IVfZ/riJCav+4RwxgDWFTsmvaMUPhK1F5nWWmh38Y0ANVlN+Ms2HFQzz9jUqPCdcca1GssmK3XGM5yOD/EGuvhQEduaw5MdvnWsjhdWQKluUPU4aeNy+X0jkxYSok7E2+vCmttZyVbj79fp9VMkveZn2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(136003)(376002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(4326008)(4744005)(5660300002)(2906002)(7416002)(41300700001)(26005)(2616005)(6486002)(478600001)(6506007)(6512007)(36756003)(52116002)(38100700002)(86362001)(66946007)(38350700005)(66556008)(6916009)(54906003)(316002)(66476007)(8936002)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p7ksdstZN90qffMAQojhA7efNwZInsBLFLmucZ2LoX4Vt6ym5BJmHxypeEm0?=
 =?us-ascii?Q?VuFV3Q2VtDkIV17dluUeS+qWIvs/478eM9g/rr6DwVUIHJbwk4Xo6TLOfQgF?=
 =?us-ascii?Q?/RO7SKF60T77P1YvnPLHnF217KvF8HQ3Xomm2oP8RJoLN2cC9fsaI7Mt8O92?=
 =?us-ascii?Q?bXysPLOiFAr4RWwLmMlWXaDfE98CK2O7e/dDWLHNcn2LbZRcYHjmFZfVTHjd?=
 =?us-ascii?Q?1gTyVNAhLWDBPWhDUSDV2+qkQyGV40SAHTZkHA/HcgJbYOE9zWORLTIfxlbz?=
 =?us-ascii?Q?HL7kjH9NZr8+yy8WZDNQoxVPQtiIsSfnpOwIP4/fgG7SEhPuI5qzfo0Xr97s?=
 =?us-ascii?Q?molFsqgNUGRaZzLDLhQLDcdjTZ0Oa/Gq+bPugMqJatXQl0eH4Azh/dqPKEdE?=
 =?us-ascii?Q?JvmkfZdI4YBpmhyeqKxJJAuby0aSZAHL+CKwxq13h0OXzlhKjulk2QKzEdj/?=
 =?us-ascii?Q?JSO6SS2luSC8ssCLqX75I9qgW3PL2N9GNB0N+PgujBGCazigRQXYQK2HnaCN?=
 =?us-ascii?Q?Z4ELhJFNFmop4KcLxCC+8JpIPKsKW7HPhtnvy/zp+P8Kl4hG7uGapyYHa1s5?=
 =?us-ascii?Q?2F0sq6185tgEcoPSPVPbxtfTS6fQCIUMaOxn6z7vwD3/YyLX9+siPZipP8g4?=
 =?us-ascii?Q?j43LaXpjOOlfehcFbPEM8/iraj4GD2kyJyiXAImUByiuGVhzFxLLtAo+rvLL?=
 =?us-ascii?Q?zWJfMVl6wQmYIHIKUahSzZJCb8QfAlNbpfwdy6cq9JhHAig6RpKvm3Jpr5yo?=
 =?us-ascii?Q?4YqznQzNMgzAcS+SeQTRnfaiqAGZzY2+sdfkXE++8Yyr6Q0Mm1YCxUrvFjk9?=
 =?us-ascii?Q?3BpTHiinC0rtOkDb/1GzYN6g9OxZRETBS6ApOJb2wBpQUn5fJe4AhktrZeAA?=
 =?us-ascii?Q?iOwH1TJvjyfy9nuNOUMXCFa6AtW8NoCZwceavVOWwlZiq7sHk/XVwlUygmnm?=
 =?us-ascii?Q?JgcV+7sG0QX0hBjgm7nzgOfMABClpqy2Paq+OQAjY2GSu48bOp6kgFT0+l90?=
 =?us-ascii?Q?zxo8/XD7SybcY0efedbBkaPDYXWry5qrDd15qkuU/G7KeujaY44OcLQzoRcu?=
 =?us-ascii?Q?yAHB406RX3fIZswg3qF0NfGpN/NIqWTPpgqvXfoubE6zQ9nAHj6Fd/WmMWLX?=
 =?us-ascii?Q?tNt9HME74CEFl/Xj1fqOKcJ11hy1Hz1dVjcsKCYO1TEoUCRFbTvXtWKP0xoe?=
 =?us-ascii?Q?1x4wjS372DMjGwNQKXc1gyN8JZzADvfprBMm797mGIEYUO+wAqhbJIBaAAEC?=
 =?us-ascii?Q?nQqT9pBq1TL3EgD9Um3liJUT0XhImUP0f3b5RNMw0H/fhNy9V+xg8Q7BQRfF?=
 =?us-ascii?Q?W2gEMs3kKcxE57BYGeo8QgwITtw2neJ/eV7M11S4AcjqZiwu+Tec+/qCp9Yg?=
 =?us-ascii?Q?pbodk5nf0dFkqTqoOevPpBL3GOuITseLWgYdn9PW2PY8d1F2yjLtAJjqq63K?=
 =?us-ascii?Q?d1xmPJfnwUjCuLwUsnId+hbUsMn5y9WBLAZMH8StV71ey0O7hHE7jWL6UYGL?=
 =?us-ascii?Q?RqQ/9lwGIuyq5XmN65MZiN+PWEMOAA0ZInTP7PZwesiX9x2poroSj3XgvPWT?=
 =?us-ascii?Q?US28gt5fBGNMFPiGMxmrHep0i+8aeNZAsPTP0prHbKPF1ev6cx8TgQhAZYsK?=
 =?us-ascii?Q?pXwbdt7crJSv6hUdRjpN8hs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4a77ab-c0ef-4ccc-20a3-08dc260bb20a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 05:31:25.6626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXntSVUfg3I85iXLMr2oXIuMt2tflXp+m1mPa2dkjN4sh4Ad/Am1iQmYExMUcUqNLO0Zqg2ImcXkPCNRYil0w4/EOtzvbavmZSiH5YhuF+WYbrbcS5w2cq6FMbGK+ryp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5859


Hi Sakari

> > Thank you for your suggestion.
> > But I'm not familiar with fwnode, and it seems we still need of_*,
> > I will keep current style (= non fwnode) in v3
> 
> The fwnode API should be kept in sync with the OF (and other firmware
> specific) API. Merging your set in its current form would leave fwnode API
> impaired. Therefore I'd very much prefer to see this set add similar fwnode
> APIs, too.

I will keep current fwnode API behavior, but I can't test it.
Now, I'm separating the patch-set into small stages.
There is no problem for a while, but I think I will ask you to test it in the
final stage.


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

