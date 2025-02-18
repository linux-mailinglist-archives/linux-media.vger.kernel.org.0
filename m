Return-Path: <linux-media+bounces-26263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F95A3971A
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 10:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 706053B796D
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 09:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67041236A6B;
	Tue, 18 Feb 2025 09:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="YG53TPJ/"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021137.outbound.protection.outlook.com [40.107.42.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C32422FF47;
	Tue, 18 Feb 2025 09:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739870523; cv=fail; b=OyEwnVsNDjHUcZbqnlOn/6lisQNyXS+TCcfPZJbpLGfKkBi8FWM6zwy98wxIqbHg2pMphF06DzoGxzpeRf4OCWdGL4Dx9BxN0+qwg6SLYRrfx3vkqUhcx7cnhmq0wZ/M6+m7UowBVR/+ye3JrVAHzS5E6mX9PoRt0V7OUVwC3jE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739870523; c=relaxed/simple;
	bh=FhZszkSnq9GaXrVQKHGxm/BawCSKaLeZKYDzduUn1y4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GHksZPGnh931ihkYH3ZIehGrK3eZGXo3LsPSuPRHoFqUry89UgXqDIvll1O1J6VjU1MyTJCRmOfgoUO0LdRKPKDuIznAQYqxzVKKuJucuqNIBW6LGghAkvsFsPyqkjcVQOYC4qIEpJ0OaNYQFFZ71YWvW5TTBd3pMiIR8hxpUhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=YG53TPJ/; arc=fail smtp.client-ip=40.107.42.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VD2rDhXqozDf/FhMhWABYLWLFIy3Ab4b1adREthY9Dtzh7TS0C5Ga0hIOzXdEXiCxhwQZZ5QE/QqqkOvJ3sHytgVguUAa+MUwziUFAI91/Y70phsTPmfEDUKfDEjGAKPIXgs8/KdNzKOa+1ukbadQ0gbuuuKYByLPa412mltXH1kxPmahOcP0xv9YSEAwJauL5rd0r0Rowe4Kl624vFStIZis4QYvdzjiGP/LQ1jwt2saN8eBAuOzyYH3C63WVR0vsMxFUiPJsz2qmbizmoyPMH+QJO4m98L5YOodrF3WRuIxdYqQoJyDruJtsRlHzSI9L02UjZ59VqcwFS4emVxVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yHDbEWnqIKz4vdw/3kMRgjE2wuI9uZHGiWij3Z6A2c=;
 b=XChC4IkvZVXXBNh98bUbnTnJ0oUJMXVekJjeFKdyXOSQWrEeodicstK7cErwsG3s7W0xinYxJJdwmjnSmRSKpxYj4zWbT8XmSl8FF3iMt2HpP1zbSTy5VaRObuCyU3OuYqYdcYcgepPyx2xByTICjCinow308Uwv5hJvNWcYFVdm0+QTYi4dqjUPD9aPblJ7F3/oQ8Jk8327mccj9ikKAF6UIUIwQVtWX5F2ukhjlw7JdUL90SUrBYQsRjdap2uelBlYSKi12K+e0Zo1/+nht2FEd1zIlkN8CSu2pmIKBhBlCmsGyP7IdSpMKNV8FtoV4p8YahqSQGHbSoepbypvig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yHDbEWnqIKz4vdw/3kMRgjE2wuI9uZHGiWij3Z6A2c=;
 b=YG53TPJ/4ZU577XDE3nMmd2pxEkPZoSQ6ip81HOhBqBBAXMG90OKoG82Yb3pFoAG5iAaIQpyT+0YJ2rMr7jB76PfmTN8+9o82iGdAPrumOYdwShuDslXZQM9KukxXswsKzY7bdB9maQEr70fsH0N1SdfpMiVCzRodQi+PH8jdRc=
Received: from SE1P216MB1242.KORP216.PROD.OUTLOOK.COM (2603:1096:101:16::12)
 by SE1P216MB1429.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Tue, 18 Feb
 2025 09:21:57 +0000
Received: from SE1P216MB1242.KORP216.PROD.OUTLOOK.COM
 ([fe80::9db7:d07d:3feb:a641]) by SE1P216MB1242.KORP216.PROD.OUTLOOK.COM
 ([fe80::9db7:d07d:3feb:a641%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 09:21:57 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec device
Thread-Topic: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Index: AQHbe5s5kWTieORPDUe+7mHQ8+wHLrNAy9aAgAPWD6CAAE9gAIABLNMw
Date: Tue, 18 Feb 2025 09:21:57 +0000
Message-ID:
 <SE1P216MB1242EBEEAA36BE73AD466FB6FBFA2@SE1P216MB1242.KORP216.PROD.OUTLOOK.COM>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210090725.4580-4-nas.chung@chipsnmedia.com>
 <cb7937f5-2045-4903-825c-71ed70097efb@kernel.org>
 <SL2P216MB12460EDF6265459D11E2A5A9FBFF2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <20250213-imaginary-shrimp-of-merriment-6ccb6f@krzk-bin>
In-Reply-To: <20250213-imaginary-shrimp-of-merriment-6ccb6f@krzk-bin>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1242:EE_|SE1P216MB1429:EE_
x-ms-office365-filtering-correlation-id: f2b552ec-429d-44cf-47b1-08dd4ffdb129
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?mX8shcDgEEpPSFXVvGoZ0EM93tT3SLzzcM6IdwAA049cNVaamkPGFtZGzBZS?=
 =?us-ascii?Q?g5Y/bQn/+QvIe2CN4zRyrVkQOY7oBtwY4r0+VhdGdqRVAge4UjWnw38sCO2r?=
 =?us-ascii?Q?6QZmXLlRhdHzKUDpaU7rQ1JTXPc2F6pQ7OP9wVsdtVWKYWH+C2C0/2a6JlsH?=
 =?us-ascii?Q?YVmu/w4vtPpheq21Z45i7O5VuWejEa8BzxfcpogNYtoyzpc0eAqVxR+nTDyY?=
 =?us-ascii?Q?giI5AMNgiO137Az397k5ZikM4YRd7qmPLArbanl+9mkusXRc/y7oQuVwjnSe?=
 =?us-ascii?Q?0ho978VkH2C5VcwzAP7wNzBuDrnnmBIw4XC9SvrR7eRXkkhiqmwcqpdeOWuE?=
 =?us-ascii?Q?Oh0Y4plg+jXM0C5paRb2GPPPnSj9lUU0V+BPIGwzbf3S3vV3WsWWt4Eaqfq5?=
 =?us-ascii?Q?tR1v3m1JJ+2pDHxxv8JNzS3HyoFyMASI6LVnBYaIzrCo6H6sFT3RH6PdDbkq?=
 =?us-ascii?Q?yK9dptyQv1Cigk4Ex4Yrp7PPrgRgCrSEvovRgd0F4us9uP5rPFZwaSQySwvo?=
 =?us-ascii?Q?6DoG+gWHuwawcQalhvo/XIDhipDxRd2MgeFC4Fl9Bt2T7cJyz2c6+kNRJZf9?=
 =?us-ascii?Q?zkIBvB6flqWVmcb1VatwHwOQ5JOhndvVd+GDjhD9uX+vuFcBn2NwMeBkNZH9?=
 =?us-ascii?Q?EqAALp9Hscjy1VrBj5NjRo4xel4MjKhltxjV0fr4ejgewBxqZJh0HXNSRsBn?=
 =?us-ascii?Q?dCe4Z0v7D0fBwkjajEERL10aw4l3+OtNbOCGMFPoN1vfuu+hNTMM+tMvw0Bb?=
 =?us-ascii?Q?Q9O7pHqKFhUubmPyONLyOBifo5ofmWaZqA40arXR2gC2uGV34HcYMyEMm6ww?=
 =?us-ascii?Q?HFXMVPziS/iJP873GYa3n+XSKPMFkwKuJ3Y3n1P+J7kWmhYy43pPhVHiPs81?=
 =?us-ascii?Q?e6S5ks8fZfKNo2+nLDzyscxuWKPrEhwHEKgwnQYxZslkD7fy9PEQzsC780Qr?=
 =?us-ascii?Q?As6VdbwF2I5gDVGZSe6Kx4pRCDPOwiQ6z2twxJCylKOP5qHnD5T+vaE/VVvH?=
 =?us-ascii?Q?xivClttw35iLqr7HLrXo2QigT2KgSoWxSxuSE32O1VFhwCoIoBrkzoLjwXae?=
 =?us-ascii?Q?gekYnUzEAIZ3aCcDDM5zrpcc9hbWWtsw2+QGtPAeuWjpBPQS5TBLX5T68bS4?=
 =?us-ascii?Q?lfmCPkrAbtaIVbBdabM7SAfyZGxYCZbe8eBjQPOdx8rW7lb3coKXc0A2+6Bc?=
 =?us-ascii?Q?9A7PAKVkrSXZNmRhBXR9FJkXaM8t0O6Vwz4g1PkDafzTHl26JCPnh7ydLwbl?=
 =?us-ascii?Q?XA/x2xAK4bC4+/5hrSBdUqd3eKwhwnixd4ZcX3wOlm4ZUNPrElyVsMsG9KD4?=
 =?us-ascii?Q?CSquFIDJeXSq/zuQ76cK0SBSLvakODPIeGQ139r9qNJra3ZakMfrR9kqLP/M?=
 =?us-ascii?Q?IwmbpUHQfNSMrvs1dMXl/lyjD2YZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1242.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Fscu6PkT+Tt+TMiBl7B4kN/xERjSlQhWV5IgHnD13i22JR3tRq1tQOP2A3+K?=
 =?us-ascii?Q?gaUKMIODhJko1tPWS9xC4g6CaKZiiMuYWFHNUe5qm82X2/nXXVHTo096Syc4?=
 =?us-ascii?Q?dSLGrHWvgke8jq0HjoGK2s6EWegtlazPhdkunI5fFCZFBWnWxWCV9wbdQmNH?=
 =?us-ascii?Q?OuRc+EYuOMWWfQhVaLiYQhMxfe6equV+1ssPYeeSxJMdXSM8hg5bFSs1eiu4?=
 =?us-ascii?Q?Sa7os7q3YnkaCQa0VBt5Ohq1FuAdAJHkJM/WYKZ34Ofh4e1bA8iby9eWkvyq?=
 =?us-ascii?Q?o63pDrkBpycNMUTyOUGoGAmVGuDSZQ1klUvWAwjaUoNNd5rWLJlFhDb+YW7A?=
 =?us-ascii?Q?Rig5Nxo3m3RgdXEho6aFU4GJhDxEInUO40AgxyShsuteMT2MkULAWwlqKg2b?=
 =?us-ascii?Q?4uvtj7G3vNxJUnDh2PWwrEufgyT5URfD/jJ6/88jx67bXPeCj8rMNOEkBcoH?=
 =?us-ascii?Q?6ycXZKxnca71FXlQamJdTzZq6ZyINQ9HxfaphwCLawG9ujnfwoQGfoARAtjo?=
 =?us-ascii?Q?/ZZ9H7DuWC1rl+A8KT0zQRF3AiXZd3cNJ2McmEfqXHrgPYrjDfypd0nvMBA6?=
 =?us-ascii?Q?IpQS7h4Mb8iKbdEqeD2RC9xeIEhI7eP6Sm3/na+8mCr1Qen6FDzvFX6lRKn3?=
 =?us-ascii?Q?HcW5sKrBRGL/57QV5FKnRWBii9UkXEUqvSPuo2b/ZizWyHGYPWukNB8L6e97?=
 =?us-ascii?Q?OX3rB7QqOU9D8K9G9pEI4G+DXK1KBmQC1LFHqm/E1KGjFai2GmtB8dkwgGsH?=
 =?us-ascii?Q?rCcHQZL/UecYS6g0YWpnf5d6uF7iQjwtITLA/gzVwNV3kLgIhWg/eL5ULJcO?=
 =?us-ascii?Q?/vIZi/+2huwOB+lA60QATef3ENqyIYKYWmwqQ1xWIppepBN1Q03M7QP+rJWo?=
 =?us-ascii?Q?AUSdx1kweeNIyVRD0iS+E/SAsV/qdjviCRaD1a/esAfkqdBv2sYOBjef/eDg?=
 =?us-ascii?Q?KDmEbBeq8pA6mFXYZAwtF/5P6y2gbhqDd764YNXPRZt5r/pHYqJ5yr6FWY3U?=
 =?us-ascii?Q?kHWMXAeK7WuBTM9+inVO5vddA2KGJ1Pn6rTENtIPdaqbodfC6QXUUWgdgc7O?=
 =?us-ascii?Q?3fNvplvqGttWDa/GjHhLqFIPnI40liXpQhDKBhREFCi+0CymDVXwygnNVG0X?=
 =?us-ascii?Q?Qz+94InDcTY1id4TClTqLv6TYoxdG5plvPvwCoJ74TQfPsmPknuXzzDV4zVm?=
 =?us-ascii?Q?ORMw1434n2oYBk5b73i0JqA1JwmCQRErNU80/dFOn+L7NJlLyKRQ7O8Q1JGb?=
 =?us-ascii?Q?Z0FmOwoeudzcdjEAxvARZmtfSkrmTXQ6hY7YN3fARb17IPhR8BCnBXgETdWV?=
 =?us-ascii?Q?c2cMwtM6twk+ZvwLW/INSzKhxYBz81/CgDiMAB5FvA8sDm2po6bJmEpOck/Q?=
 =?us-ascii?Q?sweHFMkVHrsa7/RER/m4KDElYY+F+0dCliExg7Fev63vkr4Tpsfh3+FoXlaY?=
 =?us-ascii?Q?PVy31zy5xGkI48U2k2qWyW+ZGgZXmsR9QlXDHRJl53+4MsKbOB18bJ/7nCDF?=
 =?us-ascii?Q?gDUox00Iz1FLtpfG32kkZyDnlsnAxmPqNYv+86rB21NxvBoIyNsstpNtwNPZ?=
 =?us-ascii?Q?eUZKYp0TYheRlEGGEdzq+NHZ1/043iLCFmn0pGvh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1242.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b552ec-429d-44cf-47b1-08dd4ffdb129
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 09:21:57.3541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brHtJsfsWIG69X0klX5UR986O3oWfqm24S98aQf+usAD3kR00d+orIf2b/G/rXCucUFnKCcPcMj4A6kuyT+mpQBlnWHS3G2NghnawCG5flc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1429

Hi, Krzysztof.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Thursday, February 13, 2025 5:50 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl; sebastian.fricke@collabora.com=
;
>robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; linux-
>media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec
>device
>
>On Thu, Feb 13, 2025 at 07:50:53AM +0000, Nas Chung wrote:
>> >> +    items:
>> >> +      - enum:
>> >> +          - nxp,imx95-wave633c-ctrl
>> >> +          - nxp,imx95-wave633c
>> >
>> >I don't understand why you duplicated compatibles. You split this for
>> >driver? That's a no. There are no two hardwares.
>>
>> Yes, I want to introduce two different devices and drivers,
>> even though there is only one hardware.
>
>That's a no. Bindings are for hardware, not drivers.
>Linux driver design is independent of bindings.
>
>>
>> Wave6 IP has five independent register regions:
>>
>> One register region is dedicated to the control device,
>> which manages shared resources such as firmware loading and power domain=
s.
>>
>> The remaining four register regions are assigned to
>> four independent VPU devices, each accessing its own dedicated region.
>> (to support 4 vms)
>
>This could be, but your binding said something completely opposite. Look
>how other bindings do it, first.
>
>>
>> Would it be reasonable to split the YAML into separate files
>> for the VPU control device and the VPU device ?
>> (like nxp,wave633c-ctrl.yaml)
>
>No, it changes nothing.
>
>>
>> >
>> >These compatibles are anyway weird - why imx95 is in chipmedia product?
>> >Is this part of a SoC?
>>
>> I want to represent that the Wave633 is part of the i.MX95.
>> Chips&Media's Wave633 can also be integrated into SoCs from other vendor=
s.
>
>OK
>
>
>> By using the compatible name, the same Wave6 driver can distinguish
>> different implementations.
>
>So you tell DT maintainer how DT works, brilliant...
>
>>
>> However, I agree that "imx95" is not strictly necessary in current statu=
s.
>> So, using "nxp,wave633c" would be a better choice, right ?
>
>No, NXP did not create wave633c. SoC components must have SoC prefix,
>assuming this is a Soc component.

Ah, I had completely misunderstood the purpose and role of DT.
My apologies for that.

Would it be okay to modify it as follows ?

items:
      - enum:
          - nxp,imx95-vpu
      - const: cnm,wave633c

>
>>
>> >
>> >> +
>> >> +  reg:
>> >> +    maxItems: 1
>> >> +
>> >> +  interrupts:
>> >> +    maxItems: 1
>> >> +
>> >> +  clocks:
>> >> +    items:
>> >> +      - description: VPU clock
>> >> +      - description: VPU associated block clock
>> >> +
>> >> +  clock-names:
>> >> +    items:
>> >> +      - const: vpu
>> >> +      - const: vpublk_wave
>> >> +
>> >> +  power-domains:
>> >> +    minItems: 1
>> >> +    items:
>> >> +      - description: Main VPU power domain
>> >> +      - description: Performance power domain
>> >> +
>> >> +  power-domain-names:
>> >> +    items:
>> >> +      - const: vpumix
>> >> +      - const: vpuperf
>> >> +
>> >> +  cnm,ctrl:
>> >
>> >What is this prefix about? Is this nxp or something else?
>>
>> Yes, using "nxp" as the prefix seems more appropriate.
>>
>> >
>> >> +    $ref: /schemas/types.yaml#/definitions/phandle
>> >> +    description: phandle of the VPU control device node. Required fo=
r
>VPU
>> >operation.
>> >
>> >Explain - required for what. Operation is too generic.
>>
>> phandle of the VPU control device node, which manages shared resources
>> such as firmware access and power domains.
>
>Then NAK.
>
>Use proper bindings for this, e.g. power-domains.
>
>
>>
>> >
>> >If this is phandle to second device, then it's proof your split is
>> >really wrong.
>>
>> Are you suggesting that I should separate them into two YAML files,
>
>No. Splitting into separate files would change nothing - you still would
>have here a phandle, right?
>
>> or that I should structure them in a parent-child hierarchy
>> within the same YAML file ?
>
>You did not try hard enough to find similar devices, which there is a
>ton of.
>
>>
>> I appreciate any guidance on the best approach to structure this in line
>> with existing bindings.
>
>Then look for them.
>
>You have one device. If you have sub-blocks with their own
>distinguishable address space, then they can be children. But you did
>not write it that way. Just look at your example DTS - no children at
>all!

I see that I didn't review similar devices thoroughly enough.
Thanks for pointing this out.

Okay, I will remove the phandle for second device and handle it in
parent node.
I have left the modified structure in the example below.

>
>>
>> >
>> >> +
>> >> +  boot:
>> >> +    $ref: /schemas/types.yaml#/definitions/phandle
>> >> +    description: phandle of the boot memory region node for the VPU
>> >control device.
>> >
>> >No clue what is this... if memory region then use existing bindings.
>>
>> Boot is a memory region used for firmware upload.
>> Only the control device can access this region.
>> By "existing bindings," do you mean I should use "memory-region" instead=
 ?
>
>Look how other bindings do this and what property they use. Yes,
>memory-region.
>
>>
>> >
>> >Anyway, wrap your code correctly.
>>
>> Okay.
>>
>> >
>> >> +
>> >> +  sram:
>> >> +    $ref: /schemas/types.yaml#/definitions/phandle
>> >> +    description: phandle of the SRAM memory region node for the VPU
>> >control device.
>> >> +
>> >> +  '#cooling-cells':
>> >> +    const: 2
>> >> +
>> >> +  support-follower:
>> >> +    type: boolean
>> >> +    description: Indicates whether the VPU domain power always on.
>> >
>> >You cannot add new common properties in random way. Missing vendor
>> >prefix but more important: does not look at all as hardware property bu=
t
>> >OS policy.
>>
>> I agree with you.
>> I'll remove it in v2.
>>
>> >
>> >> +
>> >> +patternProperties:
>> >> +  "^vpu-ctrl@[0-9a-f]+$":
>> >> +    type: object
>> >> +    properties:
>> >> +      compatible:
>> >> +        items:
>> >> +          - enum:
>> >> +              - nxp,imx95-wave633c-ctrl
>> >
>> >Really, what? How nxp,imx95-wave633c-ctrl node can have a child with
>> >nxp,imx95-wave633c-ctrl compatible?
>> >
>> >NAK.
>>
>> Apologies, I misunderstood the meaning of 'patternProperties'.
>> I'll remove it in v2.
>>
>> >
>> >
>> >> +      reg: true
>> >> +      clocks: true
>> >> +      clock-names: true
>> >> +      power-domains:
>> >> +        items:
>> >> +          - description: Main VPU power domain
>> >> +          - description: Performance power domain
>> >> +      power-domain-names:
>> >> +        items:
>> >> +          - const: vpumix
>> >> +          - const: vpuperf
>> >> +      sram: true
>> >> +      boot: true
>> >> +      '#cooling-cells': true
>> >> +      support-follower: true
>> >> +    required:
>> >> +      - compatible
>> >> +      - reg
>> >> +      - clocks
>> >> +      - clock-names
>> >> +      - power-domains
>> >> +      - power-domain-names
>> >> +      - sram
>> >> +      - boot
>> >> +
>> >> +    additionalProperties: false
>> >> +
>> >> +  "^vpu@[0-9a-f]+$":
>> >> +    type: object
>> >> +    properties:
>> >> +      compatible:
>> >> +        items:
>> >> +          - enum:
>> >> +              - nxp,imx95-wave633c
>> >> +      reg: true
>> >> +      interrupts: true
>> >> +      clocks: true
>> >> +      clock-names: true
>> >> +      power-domains:
>> >> +        maxItems: 1
>> >> +        description: Main VPU power domain
>> >> +      cnm,ctrl: true
>> >> +    required:
>> >> +      - compatible
>> >> +      - reg
>> >> +      - interrupts
>> >> +      - clocks
>> >> +      - clock-names
>> >> +      - power-domains
>> >> +      - cnm,ctrl
>> >
>> >All this is just incorrect.
>>
>> I'll remove it in v2.
>>
>> >
>> >> +
>> >> +    additionalProperties: false
>> >> +
>> >> +additionalProperties: false
>> >> +
>> >> +examples:
>> >> +  - |
>> >> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> >> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
>> >> +
>> >> +    soc {
>> >> +      #address-cells =3D <2>;
>> >> +      #size-cells =3D <2>;
>> >> +
>> >> +      vpuctrl: vpu-ctrl@4c4c0000 {
>
>So this is the parent device...
>
>> >> +        compatible =3D "nxp,imx95-wave633c-ctrl";
>> >> +        reg =3D <0x0 0x4c4c0000 0x0 0x10000>;
>> >> +        clocks =3D <&scmi_clk 115>,
>> >> +            <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>> >> +        clock-names =3D "vpu", "vpublk_wave";
>> >> +        power-domains =3D <&scmi_devpd 21>, <&scmi_perf 10>;
>> >> +        power-domain-names =3D "vpumix", "vpuperf";
>> >> +        #cooling-cells =3D <2>;
>> >> +        boot =3D <&vpu_boot>;
>> >> +        sram =3D <&sram1>;
>> >> +      };
>> >> +
>> >> +      vpu0: vpu@4c480000 {
>
>
>And here you have child which is not a child? Your binding and DTS
>neither match nor make any sense.

Would it be reasonable to modify it as follows ?

For example:
vpu: video-codec@4c480000 {
        compatible =3D "nxp,imx95-vpu";
        reg =3D <0x0 0x4c480000 0x0 0x50000>;
	ranges =3D <0x0 0x0 0x4c480000 0x50000>;

        vpuctrl: vpu-ctrl@40000 {
          compatible =3D "nxp,imx95-vpu-ctrl";
	  reg =3D <0x40000 0x10000>;
        };

        vpucore0: vpu-core@00000 {
          compatible =3D "nxp,imx95-vpu-core";
          reg =3D <0x00000 0x10000>;
        };

        vpucore1: vpu-core@10000 {
          compatible =3D "nxp,imx95-vpu-core";
          reg =3D <0x10000 0x10000>;
        };

        vpucore2: vpu-core@20000 {
          compatible =3D "nxp,imx95-vpu-core";
          reg =3D <0x20000 0x10000>;
        };

        vpucore3: vpu-core@30000 {
          compatible =3D "nxp,imx95-vpu-core";
          reg =3D <0x30000 0x10000>;
        };
};

>
>> >
>> >Node names should be generic. See also an explanation and list of
>> >examples (not exhaustive) in DT specification:
>> >https://devicetree-specification.readthedocs.io/en/latest/chapter2-
>> >devicetree-basics.html#generic-names-recommendation
>>
>> Thanks for sharing the link.
>> I'll use "video-codec" as the node name in v2.
>>
>> >
>> >
>> >> +        compatible =3D "nxp,imx95-wave633c";
>> >> +        reg =3D <0x0 0x4c480000 0x0 0x10000>;
>> >> +        interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
>> >> +        clocks =3D <&scmi_clk 115>,
>> >> +                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>> >> +        clock-names =3D "vpu", "vpublk_wave";
>> >> +        power-domains =3D <&scmi_devpd 21>;
>> >> +        cnm,ctrl =3D <&vpuctrl>;
>> >> +      };
>> >> +
>> >> +      vpu1: vpu@4c490000 {
>> >> +        compatible =3D "nxp,imx95-wave633c";
>> >
>> >Drop all duplicated examples.
>>
>> Wave6 HW is designed for simultaneous access,
>> as each VPU device has its own separate register space.
>> Therefore, I defined the 4 VPU devices as independent nodes in the
>example
>> to reflect this.
>
>They are redundant in this example. Unless you wanted to express
>something else, but you did not.

Got it.

>
>
>>
>> >
>> >
>> >> +        reg =3D <0x0 0x4c490000 0x0 0x10000>;
>> >> +        interrupts =3D <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>> >> +        clocks =3D <&scmi_clk 115>,
>> >> +                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>> >> +        clock-names =3D "vpu", "vpublk_wave";
>> >> +        power-domains =3D <&scmi_devpd 21>;
>> >> +        cnm,ctrl =3D <&vpuctrl>;
>> >> +      };
>> >> +
>> >> +      vpu2: vpu@4c4a0000 {
>> >> +        compatible =3D "nxp,imx95-wave633c";
>> >> +        reg =3D <0x0 0x4c4a0000 0x0 0x10000>;
>> >> +        interrupts =3D <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
>> >> +        clocks =3D <&scmi_clk 115>,
>> >> +                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>> >> +        clock-names =3D "vpu", "vpublk_wave";
>> >> +        power-domains =3D <&scmi_devpd 21>;
>> >> +        cnm,ctrl =3D <&vpuctrl>;
>> >> +      };
>> >> +
>> >> +      vpu3: vpu@4c4b0000 {
>> >> +        compatible =3D "nxp,imx95-wave633c";
>> >> +        reg =3D <0x0 0x4c4b0000 0x0 0x10000>;
>> >> +        interrupts =3D <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
>> >> +        clocks =3D <&scmi_clk 115>,
>> >> +                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>> >> +        clock-names =3D "vpu", "vpublk_wave";
>> >> +        power-domains =3D <&scmi_devpd 21>;
>> >> +        cnm,ctrl =3D <&vpuctrl>;
>> >> +      };
>> >> +    };
>> >> diff --git a/MAINTAINERS b/MAINTAINERS
>> >> index 896a307fa065..5ff5b1f1ced2 100644
>> >> --- a/MAINTAINERS
>> >> +++ b/MAINTAINERS
>> >> @@ -25462,6 +25462,14 @@ S:	Maintained
>> >>  F:	Documentation/devicetree/bindings/media/cnm,wave521c.yaml
>> >>  F:	drivers/media/platform/chips-media/wave5/
>> >>
>> >> +WAVE6 VPU CODEC DRIVER
>> >> +M:	Nas Chung <nas.chung@chipsnmedia.com>
>> >> +M:	Jackson Lee <jackson.lee@chipsnmedia.com>
>> >> +L:	linux-media@vger.kernel.org
>> >> +S:	Maintained
>> >> +F:	Documentation/devicetree/bindings/media/nxp,wave633c.yaml
>> >> +F:	drivers/media/platform/chips-media/wave6/
>> >
>> >There is no such file/directory.
>>
>> Understood. I'll move the MAINTAINERS update to the last patch in v2.
>
>No, just add entry per entry.

I'll add each entry separately in v2.

Thanks.
Nas.

>
>Best regards,
>Krzysztof


