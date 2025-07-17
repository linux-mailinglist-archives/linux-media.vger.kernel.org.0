Return-Path: <linux-media+bounces-37997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E010B08C42
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 13:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 550123BB928
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 11:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B108C29C35A;
	Thu, 17 Jul 2025 11:55:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020107.outbound.protection.outlook.com [52.101.225.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193EC136358;
	Thu, 17 Jul 2025 11:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752753359; cv=fail; b=OvZ6ZIx+WceQQRCVhjbJRW3PI4LF3uM6sCN/+jHzi2qUXWriB9g4vV/yHYxEHM3yuVefmdVr6WWoEBE2VTQwhVVNxpL9/k4/4h2fp4NxVNdS4xvWNEWt6vVb5ZlUjV6ZOYFxqYvLkP9o4xxqxcIYhW3vF2nBgFgcgSmuqFzhNA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752753359; c=relaxed/simple;
	bh=SbOP2QCU4GKYaYgj0HH/pe8t+1yi88YiauGPFaWOG9M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=obBaqDJU2pCJ7cflpUGUMs6bSlWqUN4C9CKTH5gNYuf60DumcZiMcqeMuuWPC8YwV6j7VNMSLXm/YkuuCmAzAicUmZsM/xX4jAQqg2MUjyF3qEHfMGuXMsIpyh5Xh9nI0meavdyB4ML40QmpnZE0d2/SXd1jFvQYasO+YK0F+qA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdWp0kPiQ0NJWY5kzhOrwAKISgoxWWy5754k5AA8Lx1BEhwBa0E+xW8kkX5RUq/gDxTRsCGyipcBfNn2VK9hfs2BJuYZ9PDKHBQUsY9TFakU3qBBfYNJWv6OQw4PEfGpNxN7ZBGpZRPve078UQrk5bE0cwL0UKeLumrrXgpP3uPMkkkXkEPhag+ibtBbBoWIGvYkcAITQTFNrF/aMLu8od+poU6LVsIls73VP+78QEKvozhySF5rlKWPGRE6SPkDdX6nvWvbFCo+uAsgerkCgdE95wAd9OoXQ5Mkg6RElZsNFk0fKMgJJcKlcmiYzjj2A/yv2FXkHOvfrEiQrL4dow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8y1Al9t9LoOiG4Ga8N8EUD50GwkFZc5L27Bw0THDlY=;
 b=NDtPoOQ1Hyll3oE8NZxSi3TN/RBpkiCXBqmAXDfii/LsZfvYKOAjZOs70WJfZiImVWDeyAlOe7mCrs/4RSpbVUsL5zZbOMih/08Kvex/ElgzHvTWzyk8Wutc80ZJte8TlzzF7mKmWBH6KDUT/vWwCqyC4mLrI8Dadf1kileaOgyWG1GS2mjIzrHqSlvaXwvZckZJqIDLC5TO6n7nI8AGSc2OSE5oxuyJQIiSkK/5jvPEjDG6UIOi6AClhQMwS8gLZABPs8VW0m+hKvOTGkTqNwBNTEy7CeixUfVowKrmo+XUPxjIJF2DKTNkUwnu7Ecg66CbElceFpBHeSO4DMsHVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN2P287MB0302.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 11:55:50 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 11:55:49 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, =?iso-8859-1?Q?Andr=E9_Apitzsch?=
	<git@apitzsch.eu>, Ricardo Ribalda <ribalda@chromium.org>, Heimir Thor
 Sverrisson <heimir.sverrisson@gmail.com>, Matthias Fend
	<matthias.fend@emfend.at>, Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>, Arnd
 Bergmann <arnd@arndb.de>, Hans de Goede <hansg@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Thread-Topic: [PATCH v4 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Thread-Index: AQHb9lfYoS/wf6j50k6uH/8lXesHXbQ12+aAgAAPulGAADvEgIAADtaC
Date: Thu, 17 Jul 2025 11:55:49 +0000
Message-ID:
 <PN3P287MB3519907E3C113D6CD9D564E3FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250716134426.8348-1-hardevsinh.palaniya@siliconsignals.io>
 <20250716134426.8348-2-hardevsinh.palaniya@siliconsignals.io>
 <20250717-hulking-earthworm-of-atheism-68a02c@kuoka>
 <PN3P287MB3519C2A2B8DC207AC0AF2C50FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
 <25eb573c-a37e-4f8c-8fd6-5ca62e1a29b9@kernel.org>
In-Reply-To: <25eb573c-a37e-4f8c-8fd6-5ca62e1a29b9@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PN2P287MB0302:EE_
x-ms-office365-filtering-correlation-id: 138f3640-d46e-4c45-028b-08ddc528dfa5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kixTpwnDCts7gKnpVCu1kER0xMXiQ1Rs0k4S6/KAJFIP1CDyr/3yzqvQud?=
 =?iso-8859-1?Q?9hbbDkD0Tz0B0P8+ik0JiitwD9M08zhSdbjPhY5xm5Hc1QK5p8yOA7949e?=
 =?iso-8859-1?Q?Ka49HmHvWY4CaDUASZTP8ch/0bSaB2Yq9R5djtSVcbxTpbNvT3GKSU6wnZ?=
 =?iso-8859-1?Q?Wf/lCeh/KcdJ2c3I5RDisU2C71Mkoxly2Mu4ZBD0njEcfp5OZIZhQUlj7f?=
 =?iso-8859-1?Q?2My6Ez+amp3rm/3Ljyf2XyuAe4JliEr79iqN3KUI5vcJUAo+Ul5XLDgGce?=
 =?iso-8859-1?Q?uBEOEF91Jy3BudB7/wZvbzt1GK0c/dutwWy3tR4CWT9FtOmeqSfrcjs38R?=
 =?iso-8859-1?Q?JreFVONAnScL/h5bSlmI3zO483H5aBnGmUbIuiewwc+lcCJj7CBvkEHo4i?=
 =?iso-8859-1?Q?SV2jEfFvtw1lF3tjvW8svXeYsjDuizJCM6g3tsVYLmOgzqH6Pp55fkJM9Z?=
 =?iso-8859-1?Q?ivKz9g9DupFYBLQtSPJRQ3wwsRzIeOMA1/R/yk6GiLdVFpJqjWumC/wtbB?=
 =?iso-8859-1?Q?N12vhStig5M6y7dDE2Nt24I3cSAYOTzH9sD/MxEfCoJMIr8ye/tWaccq+A?=
 =?iso-8859-1?Q?mO52ugQeAqABEpp+2X4skzQvG88Xe6eEQsvbDnzY/3bCumcbGggjJCoisy?=
 =?iso-8859-1?Q?+qpePeU79p/33DsubTFVe1BSFF6vlZeuKoPNRSyRDDHbEirqumbiGdX6kl?=
 =?iso-8859-1?Q?Mhulc3ZLXtu98n/sURkKEotJJFGNTojL0dfzHcwTDawnZ2Ls2qljvtf5aJ?=
 =?iso-8859-1?Q?Absd8f4gD0q4AQ6PZ3FxDS9Wyb1OXXDlq5naGY7TYO2UX5yIJRFaCR7Xuk?=
 =?iso-8859-1?Q?ZaKTEwUddUTC1q3eCF3+y8FU4+b9+tx6agiKB5+vzYJI4hSpA2vp5Yn3Hn?=
 =?iso-8859-1?Q?p1GF1G2A0nVdtYyeOsSRRjc8okXOkiHskMGXdOfEcmvUXU4G75cPksw6o6?=
 =?iso-8859-1?Q?UAzktx4DbN1ECPuk+d3bZaAXaR26zKVdhmbZguYpf4G6xBo2Bc5V8OUTeZ?=
 =?iso-8859-1?Q?dJvbmL9AAkjtQsiY0i1aXQ/MBEx/I/QlqegHhIPzPC+yONcB8A3w6h+j1V?=
 =?iso-8859-1?Q?kBDYC1gsmrsjfX4Iw736t9CcnydThGdlC0i/b2zJ8G00YoL9f/5gUkY26p?=
 =?iso-8859-1?Q?0+DKlynlSF79eiUeygDBzJjsLsbWBEcSSLZod7+4qyrV1bPqZhfZ8xNYKp?=
 =?iso-8859-1?Q?NSGbRG60hVbDq3QbiMH1zt/45TuH6Jm8+wIWx3mOnMjksltK9e34QWtktF?=
 =?iso-8859-1?Q?w6vIr3nQtkCmkbb512mj94h+59K0zPsU4L2yqrOikpEaUJTR4Bnbgc6jrG?=
 =?iso-8859-1?Q?5nOC2H+5EChSM/4HFqVUj07txgg/G/KylknBg7xAIueVn6EQdGs2nEzgCg?=
 =?iso-8859-1?Q?3HAgQfbGPuPW4IbDqpMitR8G9+wAuTtTkApoE+4HG0FU2KDsipWUTFia8m?=
 =?iso-8859-1?Q?PxbNBqUqSTcB3joIOZ93ENcJg1VXUrzcFoOHwz1BZZqSKaCa7vLCM8MC1t?=
 =?iso-8859-1?Q?fb3zRpzDSSTKzavnTQaNHKS0T/mbqBXNPB5HNd6uUI1evMyWHawWyYfBaf?=
 =?iso-8859-1?Q?WzB/zFs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vjxtN0oGTOlX7AxeB4XEhZzacmm5jos2BHxXuWXpkMNJwBoMMTURV+GtrE?=
 =?iso-8859-1?Q?OwvjJt7UBUmnVPzpfzkHFkkpS/G2ZqzIokaJkNcG9Ho3Fz3H3ZblsgtYR+?=
 =?iso-8859-1?Q?8LUh03/TQfPCBQ6End8ideYMSVDhwOgIoDJl1Gv5C/kmeGcb27XnAyn3uM?=
 =?iso-8859-1?Q?naijN7GhWZka2jITeHljDqw+hCbKevwdqwqDkWfFbNE3DouRjOY6s+BdOW?=
 =?iso-8859-1?Q?gzFm0B7iThf24YdzQSpS2umBjASYpm8veLdJwGLFMyTko6F7ymmoyoZnIN?=
 =?iso-8859-1?Q?SkYy/pv0UBMOdG7LDf+ovdLQdDsW5r6HyQcnegDtpIE1fhKgdU7hYGog9q?=
 =?iso-8859-1?Q?ciekOkQwCc1e7xZa4WF9bCX5dbQzGOO0Filas7RM4SvEtM0POsl+BVQ/yk?=
 =?iso-8859-1?Q?60UdIL8uOO7eYoArXPmB00LDq2jWyqol4CorrpesVr/tKvJ8Vd+gihtzwa?=
 =?iso-8859-1?Q?Zrc6g9fThyZPDQHzCAftzQEfMQAqevq/prgqDsN3u8TMdvP8Ph7gX+tMNe?=
 =?iso-8859-1?Q?PBGTFZHlrC0VZVwGeCkTjkobu899mjsFo0LbrN3uVhRqYnqm6UcekHDeXO?=
 =?iso-8859-1?Q?zDw7zQ0XOLy+Ke9IQKbeI+EAhR4nysWMmtX4l18mc2mYPLiJeNMocghK03?=
 =?iso-8859-1?Q?KHJhYcbjHDWLfjOw0t9G5GB8ftwLNih4+fSN1h37vf+B+yzuaI7O4jJZdN?=
 =?iso-8859-1?Q?Nvu+BU9vsKm2mXxOv6VcupwB3LDwb3QjFvfX9S/B0qyxXYk1sTy7kSlU/B?=
 =?iso-8859-1?Q?bThRFr6KfnUC2L9WzCkJ8Zfv/1HWBt1OkPCelUQ9m96GAbrLWuGyT6ZdVl?=
 =?iso-8859-1?Q?kNBVlZY8BpSqlx2BjIoWnba93F6N605WG7RBDG8EBTe7ltKYTJeRnsMmYO?=
 =?iso-8859-1?Q?VloFbJ/dMAmcG6X0si2JrNy0eh/zBwv3MEz6aSX2GrW7wnWw6tCVxe3vwj?=
 =?iso-8859-1?Q?V5HI8xrJ85+vw8YVteUyYqWet967nP1ApV8+AQVYfPmmQZHd9PCgS0gcZV?=
 =?iso-8859-1?Q?EZaZMng3i30GTPdnOXvqdYbBkQmGi0lE6SkvP2JK7MejiRbxN6y39aGZes?=
 =?iso-8859-1?Q?kwdXO6iDVijjw2A8qOuz3rOY/JdP5YXLcdiV6B5fxetaA0JuYqszZzEQ/A?=
 =?iso-8859-1?Q?qj25lAf8KMYOTKKhjZXCZ+Afs1JZZpt8pk/sbC+CDSUvFNltyXKBiBP+GI?=
 =?iso-8859-1?Q?vOn6lRUwoxRRyx2BkVunGYik7e1PYFaPbutbtfSbehtzKFbaVHG9yywBf1?=
 =?iso-8859-1?Q?nN8QU88/kOJhpyGpuSpNQadvnpbkiybyZRSQ4pOdbaR6jf8dbwNpD/9Qv5?=
 =?iso-8859-1?Q?j2OJussQI+eBu1qk4LezUDZXdzR9/daMIY9O62kKrOQUexqmohpPOiXCK4?=
 =?iso-8859-1?Q?kfz0gchi2WPiPNUPzjpdSD3v+pEN8b8Ka1vEKIXRJbVA56GkqB5lcXxMWs?=
 =?iso-8859-1?Q?PKVIFA75N2l2oG8icigXqmLN2Gx50FelPTM7uDALxfKBrxeeKJ0AHfH/vS?=
 =?iso-8859-1?Q?R2wN9T59uV8k5HDSRlnaHvFb5X2pyaO4MT4MaRxsoqpoum5kCl8AQ5zyeS?=
 =?iso-8859-1?Q?2Ha6k1iV311MvBz/U5Of73cuVS7tggfDNGKiXUZ6Y3+4M37/Enl18rcdha?=
 =?iso-8859-1?Q?GxlQkM/qcoCvl870Zwa9udSYeWADAbRWKLw+CH+3YO8akGwG9E9bManaUl?=
 =?iso-8859-1?Q?a5qks47Iz6DoX3U7ZF0=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 138f3640-d46e-4c45-028b-08ddc528dfa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 11:55:49.7961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KCkd5MR0h6P2RFpiWOPUw3HihgyiOd45wcCYE3WAax+RD/5/eCJrM18NIVy2xqmziqF458B7eEQoQEZ2Gq27fXdkSGCvZaIU3dn42P5Ll2i3Haw24zI7ji4NaYdcL4JJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0302

> On 17/07/2025 09:28, Hardevsinh Palaniya wrote:=0A=
> >  Hi Krzysztof,=0A=
> > =0A=
> > > On Wed, Jul 16, 2025 at 07:14:16PM +0530, Hardevsinh Palaniya wrote:=
=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0 properties:=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 data-lanes:=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 items:=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: 1=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: 2=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 link-frequencies: true=0A=
> > >=0A=
> > > Drop=0A=
> > >=0A=
> > > I don't understand why this appeared. I don't think anyone asked for =
it?=0A=
> >=0A=
> > Laurent suggested validating the link frequency in the Device Tree.=0A=
> >=0A=
> > Link[1]: https://lore.kernel.org/linux-media/20250710212131.GG22436@pen=
dragon.ideasonboard.com/=0A=
> =0A=
> ... and I do not see here validation "that the link frequencies=0A=
> specified in DT match".=0A=
> =0A=
> How do you validate that 1111 Hz is not / is a valid link frequency? How=
=0A=
> did you exactly resolve the comment about validating?=0A=
=0A=
In the ov2735_parse_endpoint() function, the driver validates the link freq=
uency=0A=
from DT using `v4l2_link_freq_to_bitmap()`. If an unsupported value like 11=
11 Hz is=0A=
provided, it returns an error: =0A=
=0A=
ret =3D v4l2_link_freq_to_bitmap(ov2735->dev, bus_cfg.link_frequencies,=0A=
                               bus_cfg.nr_of_link_frequencies,=0A=
                               link_freq_menu_items,=0A=
                               ARRAY_SIZE(link_freq_menu_items),=0A=
                               &link_freq_bitmap);=0A=
if (ret) {=0A=
        ret =3D dev_err_probe(ov2735->dev,=0A=
                            -EINVAL, "only 420MHz frequency is available\n"=
);=0A=
        goto error_out;=0A=
}=0A=
=0A=
So, validation is already done in the driver.=0A=
=0A=
I understand that `link-frequencies: true` in the schema only declares the =
property=0A=
without restricting values. Would you prefer the schema to explicitly allow=
 only=0A=
420MHz like this?=0A=
=0A=
link-frequencies:=0A=
  items:=0A=
  - const: 420000000=0A=
=0A=
Best Regards,=0A=
Hardev=0A=

