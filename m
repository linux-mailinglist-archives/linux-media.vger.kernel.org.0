Return-Path: <linux-media+bounces-38687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10095B16C6C
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 09:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07683568408
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 07:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E0E28DB76;
	Thu, 31 Jul 2025 07:10:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020124.outbound.protection.outlook.com [52.101.227.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C8172617;
	Thu, 31 Jul 2025 07:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753945816; cv=fail; b=gyTR9Gh/McZNIj3hLc+EbmRJWqTbjKEUSOZYXClxym4E/ocJDtFWj0ENDb4JzorFvEJIx5I7fJy2RNJfWj1uvvCJz4l8vyZORWsCy9Hrck/T/fjUnxZPvuMLpnXPasFpayaGX3ZIji5BiTWR65ZRSWFiXdU4/mGAfr6VoPvuGgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753945816; c=relaxed/simple;
	bh=BZ8ctZ1HSqPd2yBBtXAVpsNzd3NjTcjtuds+ajqWLa0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N3Xh/zTCeEhiY1DFabqfkyiW13/B1IPkz3iw4SPEemaKk5KVhPBWpkM5hKnUMEnfspNZD7TBiDkuGs7SrRxgmfQAdZBGL4n/7PG+6RD4HTFTNZ3YiqJKBOlSOd3zUCV2OU+2JHiwP+PSp5g9B/yHEqDMWeTjjUXmAuLTjijddAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjgGB4+41rXRrDqFLyk9mkxWJMqLouKby18itizdrWqxH/AslzXQ+4fZP+LKcckM6HvAtuVLGGj0eYoCFBtZu55II5el56VdaiymvwCSyNYawLHIjaC2nFbnqWGuHFEfy1DTlL0zVDWThIfIcvCrXoCFHCj3Lqe8zoa2RF4Xj3txmw4zztTCk2abS+aTqHN/DQRZE6XR7kFRo8G2VpyvQWPjPVMDpGqsrkClpmHBQobt6gKs9n1oCreCWxOj5qc9/Ypf2uAfAgjyE5U0697hmsuUheq5ShUC+ZaGX9nCYblXTaByK66ZMjBCYYyyfQ1iQJ3VRmGCks2w2hgfB8PwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZ8ctZ1HSqPd2yBBtXAVpsNzd3NjTcjtuds+ajqWLa0=;
 b=NAqDf3ws9iRWqSrJzObQc9Ky+kMvQlBBPSWmrufHXKmBHlB6MJlOCu6lXWDHZPdKI/LrcNRH0itX6vQ1UQbyROeNtPf0ct+Xu4zj7kRWTSlvk3p1caYp67aRn8v+nPgaSfav3WXhDpAa+WWXBwhJQmZ00Z8ZN0i/vPbwpp16p9Q+nDGehHFDc/HWQgHGCKbaIryHJWOAiu+PWVyYkEte8r4BWWgBljphweFzdcPX3WZxFrixQgKo3TsjbYOJWvbcP9BPuV0N++8mii1EtdUil2eZL4V8JEkHWb8YMERWTWJSWJA9/lMEhqfK5Xs/yzHOi+b5C8on8VnKzn/FRzVsYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN2P287MB0319.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Thu, 31 Jul
 2025 07:10:08 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 07:10:08 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Himanshu
 Bhavani <himanshu.bhavani@siliconsignals.io>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, Hans de Goede <hansg@kernel.org>,
	=?Windows-1252?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Matthias Fend
	<matthias.fend@emfend.at>, Tarang Raval <tarang.raval@siliconsignals.io>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Jingjing Xiong
	<jingjing.xiong@intel.com>, Dongcheng Yan <dongcheng.yan@intel.com>, Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Arnd Bergmann <arnd@arndb.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Thread-Topic: [PATCH v6 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Thread-Index: AQHcAeHa9HY47390u0OJlhyWta8pG7RLwMcAgAAF2LOAAAFkgIAACEOY
Date: Thu, 31 Jul 2025 07:10:08 +0000
Message-ID:
 <PN3P287MB3519479DEF57D78794788B1CFF27A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250731061004.5447-1-hardevsinh.palaniya@siliconsignals.io>
 <20250731061004.5447-2-hardevsinh.palaniya@siliconsignals.io>
 <28ba8a6d-a180-485d-9bfd-d5ac8783831d@kernel.org>
 <PN3P287MB3519C0DB4796E4D73411A549FF27A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
 <28ae1ac9-68b3-470e-9ec9-982370839207@kernel.org>
In-Reply-To: <28ae1ac9-68b3-470e-9ec9-982370839207@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PN2P287MB0319:EE_
x-ms-office365-filtering-correlation-id: 036c59ce-e60e-43f2-13f0-08ddd0014879
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?07Ovz81SJISyGD27NlaagJ3C6yDVv7z2rF/aCMCqCJZxnEQAhY4l5fkq?=
 =?Windows-1252?Q?XYhscaI4c7SAZxbpxsX9NwHDs2Yjij/xMozZ/MWyyNHGgVqVeYQyH024?=
 =?Windows-1252?Q?WrKfbV76vMQH2gE2KkkCNDQe2ADeU+igQv6+DMj99SeqvISrLBMF3DKw?=
 =?Windows-1252?Q?+xTlE7Q90+i/KE+2ZboYy+VEe4fYENhciHKH54tfw+HU6L3iUPd1/zW/?=
 =?Windows-1252?Q?EgCdawOaPPW4d2MqrNSizJbyEky8B1BHpQ6K31HUzwqmYYz3nCYLjwhS?=
 =?Windows-1252?Q?2b/e3yD8EltlwuZSVL8m71+6BZR8HKFXXqDtbmsUfi97BncCEo7IFJS8?=
 =?Windows-1252?Q?m/O8wD7aHG9tJTrhUPZ6O9iWdEoXRExyZEQlMBxbMHt05+kazlFgU9uP?=
 =?Windows-1252?Q?THxamMIwrLQ6pdC+ldCAUq34IKLBUNwToiXoWAI9NAGjgRGOmpAGqTLq?=
 =?Windows-1252?Q?jwKgqiYiLe1bSCiG95gvFalm4+wp8ZcwMsYCGueOHjmR6jRPAxQn44YB?=
 =?Windows-1252?Q?GaTCcH4z3EF3WpVDLXN13c4yRQo9035Sm8CNTyvZPTWXheL34xHkMa6A?=
 =?Windows-1252?Q?pDUxN8aQGcSC2GTYNyGiVRVKCnq4lin3wDoqU4ftaU5lLDKHI0qDAfdX?=
 =?Windows-1252?Q?ZH7KRERGCuuKiHVyWZZMR1qMQiG3/PmaDfHi1VFZm9tCba9JZ4tXEmLX?=
 =?Windows-1252?Q?GIj9uNwnwYWV+iFVCI8UeftXyn3Ji6+OIY4lYCDZuOJ3n0ySkEk/3xV2?=
 =?Windows-1252?Q?8/Y5AX7mw8TDjRalVcbEChIAWubXgBWmYSrbu3UCnIGfzTLnn9D6cB2+?=
 =?Windows-1252?Q?4BPsAOTRcTErJE4zOzQg3FA8uwHesVf7uCODxgFJL6BlrNzc9vFVdaN7?=
 =?Windows-1252?Q?KolbWBwKoyqbZu3jrVA74bLD0Km1FLzu4sTNV+/rgiYRJWSSbqmV+3hw?=
 =?Windows-1252?Q?fLUCJHdyoNxKkvcKZjpbeTlDfg+iIBG+EtlDJlf7vYsu3lAEcz5kSRzl?=
 =?Windows-1252?Q?Yic98tbW62bSy95r6nSjOk+2g+zh/T2d6jU5eGTjIzyWg/sYsG+cZAus?=
 =?Windows-1252?Q?6gWqCDomoNN0XwSk0FiWr1D3xz3KXmct3HHnVza0nvwLuG4Mjuj6L1vz?=
 =?Windows-1252?Q?HLhrrpCfwi2x1kF4WD9RCEFkqmptH7fy3mmwqSkHDs+z2MfRZZxcjKrv?=
 =?Windows-1252?Q?Pl+BivOD5nk8IHlbPl+cpGLCjGjGZSDOAyVAZNVRms0+CsQLPHNnAG02?=
 =?Windows-1252?Q?UCsKtCe4oPeW03E99Grh/Z91dxlHVB5tpgYO9oYbwh6wRf5viA3puIir?=
 =?Windows-1252?Q?8Eb+96vh1TY9xR2jBWpfy19I5nfySaY81DpFgNf9dKHUkC5i5nDmcbb6?=
 =?Windows-1252?Q?kmfQjdVYYioNEcbOe3tBWNVcMwH2vXFtBffhSedFOgMoQuMqnxIhoqx2?=
 =?Windows-1252?Q?DuRO7k2y4+/+7blCPt7b7vXaRW/I/k1elqDF0tj4kITmQjKM9+SfxCtc?=
 =?Windows-1252?Q?QaKBnjVCcacve69UosUP6eWF5MR3Yo3tzPcAmTcXrVN7ksZAjjyQxACH?=
 =?Windows-1252?Q?e4opRR0dLmn+Zrc1nPmXpuKnJSDe/9N2NpPcZg2y8sNnvZwybrC4hyqM?=
 =?Windows-1252?Q?MJ8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?Dl51SaZFJ0xBxswjeTaCadtuEfhjYtJqPG2KNLEKPdTrXaclZLuAigRP?=
 =?Windows-1252?Q?kmzvlFG7rUguPW5XLo63SVOaZh2JDbLTl6bESfz9yO5I9Gv5GPjR0nEx?=
 =?Windows-1252?Q?T+OZv9Yaztlh2Y9cUruKvzF5j6rh1rFnqYAgsX9H2YZpH8bQewB7tnNU?=
 =?Windows-1252?Q?ok5yEPSoXU5ZgsLxyw33ybmp/pOJBOhjLVslI9Tm/Qj/KkeIpdruQzag?=
 =?Windows-1252?Q?SNzOFBqtGfirUgk0MgfVbCQs/U9ph3A2T+6weA75Z0L9CvBw+nZZtVay?=
 =?Windows-1252?Q?4qtuhbfldQtPiPy+wp7ADY+1omAZ79sD6YbH5UC6ZdRMJQ2l+rhMnqcw?=
 =?Windows-1252?Q?e5fVepy8/7VsTrqvkugTZIPMLNmZqc8S6MwH+IiuyBU+kXdX5xOnMSxJ?=
 =?Windows-1252?Q?PKvvhW/HZBwNZ2Dkn7/bl+hEYNpaGAiZbS9O8H3aqzLuHfipERH4n/ii?=
 =?Windows-1252?Q?bd2eM7y7WYItZitutFyGz2mJqX/uHe+nUpmKDR628LGgQY6mNryw2N5S?=
 =?Windows-1252?Q?7/Zmq/B5icqkqJQ31tTexFXy9d1mGjseZhWkjuJzDc2SIvIQ/IdqD6LM?=
 =?Windows-1252?Q?aqdBYTaQwlP1eAQL7BwaN+e2gGdiAcopJFAdt9bhqjYmzJ+87jUNwsft?=
 =?Windows-1252?Q?5U9MZrhdGUpsolY1CP3zw8atK+7A3czhBO9AW8SyisKQh0wNCU3Z3tO2?=
 =?Windows-1252?Q?naTbRZguJIAL/xf4SfKOOY4blG1COX5C2mi6ym6TpA9XbT/PUjK9R8Ou?=
 =?Windows-1252?Q?AM07kWcXRSiIHqvgQ0E79pHKnQUWxXWrQ7MgSuIafCvarHF+BB3JDSWk?=
 =?Windows-1252?Q?3Tutj4qici7286kgMXQ1ScZa9j1sQn+6gQdf5XLl2/NEJT6C6UkIYrZS?=
 =?Windows-1252?Q?T7p+mPiBFyLfdtjuYioa8s7E8r6KlPu4rbiO8w7TnPJ618HsJMhX8HT/?=
 =?Windows-1252?Q?p2viteYLmFRYb03MWk6zSWRaH5D/8BDSK0+gkb5EMeYe4iCDYTqxq4eF?=
 =?Windows-1252?Q?hT1bbUNYEQumzDN3KQ9zjbFANY1cabx8fRrFkTQQwSYk62Nhrw5nU/eB?=
 =?Windows-1252?Q?8i8JB9SgtGrcNu7bSLVh4IvguFjefN7YajDGRAcAxRIKxcF49Rl16/6L?=
 =?Windows-1252?Q?v5a/IQJh/mFH01EiMRSYhprGGIIrStuoQutYWAma2SnTGMsFdgK+Ses7?=
 =?Windows-1252?Q?D8ABkcnJteSjDlSn2cBaLAteS9ZsB3XYf9xDtQn8EQtqTgzjS8JOAHxW?=
 =?Windows-1252?Q?a9Z90wLe3GfGNvht4N5kLoT7S1VwR6/l498tnh2fNVC4nxdpXtNulMpp?=
 =?Windows-1252?Q?y+UQ+1ykSz42OesrZYLci+PNfxXM+i/b/BUrr9JttxMpTXmraRSEO1Es?=
 =?Windows-1252?Q?7H1zRCP/UAO7m2zCDjvPKDxIJDTKfQkkyF4pfutEa1jVWyEZlQO4+x+A?=
 =?Windows-1252?Q?UyWlf9PDY/5z0rD6gUUAuSmt5udk0R8m0676R9EzLlzy7/MrAvtmURy7?=
 =?Windows-1252?Q?Al7ii5tBrycqcXeabQVQolxWvezCLbI29Qu47HacPLP+mx3MM0mU4Isw?=
 =?Windows-1252?Q?3GAwCBFL2w2NA9SOgIg5Suthl+MSQxLB+r8sQR8mrBR8TDGGtJs5qHSr?=
 =?Windows-1252?Q?0FBBl2wV1SibRuVoQABesZ1nlYCRB70s0MjFD8vUPtaFOHZEulO1CSRh?=
 =?Windows-1252?Q?p2RIB4jWJXLvHWxN3bS4J32G8HZQUSWN/kEqBWdcCVgdb1ofXY2swg?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 036c59ce-e60e-43f2-13f0-08ddd0014879
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 07:10:08.5423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uZye5ShpAIFpl9+utYsXgnNretshvadGKfFOv5WesfvkxUYDZ4k+2t2wvNND0KouC7Eox3x1MZGTnHeNVe2l2StmKqZ/k6GwFkXv05K3lRC7wU/UB80598nQHvUnPJLR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0319

> On 31/07/2025 08:36, Hardevsinh Palaniya wrote:=0A=
> > > On 31/07/2025 08:09, Hardevsinh Palaniya wrote:=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0 properties:=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 data-lanes:=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 items:=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: 1=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: 2=0A=
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 link-frequencies: true=0A=
> > > Nothing improved. My comments from versions before still apply.=0A=
> >=0A=
> > I asked you in v4, but you didn=92t respond.=0A=
> >=0A=
> > Could you please check?=0A=
> >=0A=
> > Link:https://lore.kernel.org/linux-media/PN3P287MB351999B4DB533CCA9C6E6=
567FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM/=0A=
> >=0A=
> > The driver will always rely on the device tree for the link frequency.=
=0A=
> > Without it, the driver will fail to probe.=0A=
> =0A=
> How is it related? I did not ask to remove it from the driver.=0A=
> =0A=
> >=0A=
> > So, the bindings need this property, just like other camera sensors do.=
=0A=
> The property is already there, you just duplicated it. You added=0A=
> completely redundant code and instead of ACTUALLY TESTING YOUR DTS you=0A=
> keep disagreeing.=0A=
=0A=
Okay, I understand now, the link-frequencies property is already defined in=
 =0A=
the video-interfaces.yaml reference, so there=92s no need to explicitly add=
 it=0A=
again in the sensor binding.=0A=
=0A=
Apologies for repeatedly disagreeing earlier. In your previous response, it=
 =0A=
was a little hard to understand that you were saying the property is alread=
y=0A=
there and being duplicated.=0A=
=0A=
Best Regards,=0A=
Hardev =0A=

