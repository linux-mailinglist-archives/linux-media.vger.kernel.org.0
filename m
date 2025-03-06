Return-Path: <linux-media+bounces-27686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73142A544C3
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 09:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC19E172A5D
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 08:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4E8204F8B;
	Thu,  6 Mar 2025 08:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="or7QvTYJ"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8921C8602;
	Thu,  6 Mar 2025 08:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741249455; cv=fail; b=D9NCHsFpgPRYBy5AHG83ZnqE3rNYYYsWQj8KNxFliX41HjkCyqiIzy0BbFJuqjeQiYNlSlQN6pwp1XXipmCHo8ETzJp717wscBW3Q2h+FgP55HbRdsYemKVWnCAXQ+zOazzKSgOL3HdN6uWK87AVsA8w93iRcyPIBkNjuxN+HBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741249455; c=relaxed/simple;
	bh=JSJE96HkK9Q1UtRaqU1jLHIYoYiaRKG5gq3T03aLusU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PTjFg6HQolj38a7VXkjpRenog2nVT+U+wo/rlaZNvJS0vU8FK5FMVHB71mEj0mIgIAbNG8L89i9pgTTU0mSUyWe9TG35IxNy5nN/z9t996pKiO5U0mz3N/G1XxyAoopJ45LUXYobMyNhLCfQGFsh/x4ZbSIAb4vho2t8ofj8HSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=or7QvTYJ reason="signature verification failed"; arc=fail smtp.client-ip=40.107.20.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rh82RzWD0DzjVqExJK+GcWV+4IOJW8xtSZiX88roYposYbZxDhZ/i+kUWYAT92H8zDymNewe3a5NSxHmtmQTi0L+nP19aYWaHg6exgMIHF97gQ5CwVBCkzOKbmSr3pUykiV6KSUWK58flOmzxleuJwhNCy6WdsAv/yU4peeXHbNz7ORT0iZX0fP6b9bS5Hf5DlVBUmZl0oxIDMgxjoq+Ovg0iKkTu4nZGLAPGmDoIldMi+APrHI9qH1E3c6DNSFmC571WDNWlXyKWqdvnDeby8F8fAzARqE6bQB14q45/Uck7rCQje2LkCC05onnvrUUkDHtz93xkThoEM1lx1M1cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diV2wl4fSU92rnGSs5jkVRiyfgD0Nilsq9Upd9b2ba0=;
 b=JlktEvnme+0EO9eEnjHM/Kab+7FGZRFOEsJd9QxWTGVZefHmiFhIawCPUwuSxPLb6K7uzXnuj2CPMNyLVpAEkPq/TW7wxyZhRoJ8xpXRmyVShzI5GZe4k0BdYiJXFOL3hvE6z+LjJt9B5+cTgfsrFatFv6iUukmgB1R21OeBkDFm33tPrlBaN7kpN/moT5itnXYFp7w69w3DyAoauYPxnwBxqA0PNgACFMziEj8nq81pDK3jzYJ/x4Dv9R0CDeY5QHrEWc5qSe+s1gu+axCadu/RJtaopIxbo4+79bew5bCUWGrqcAHr1yb+BDwvUt+rkOiPpp2MuruTxBQmToHKSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diV2wl4fSU92rnGSs5jkVRiyfgD0Nilsq9Upd9b2ba0=;
 b=or7QvTYJCeROmQJkPATZY0L6iX6lrOP1rgSEnPTqHFGhN+L+YmbBwdkK8y7314ONj0PubSZu/Bic3IKluqJtbKoGEtn9nCPMct2rCt9rPeVXz4scYxRpm7T65W+XcvO6ChovccgXhEF4+aSCnmYZeeQ44ViboCBcUas4ghx458g/H6WwIeLdIC3Jt7ZOpJm5zhdoYJoC891BdLbT1ILkqybx28OgOJQZhewmy9RGxvbBUJ9wRUr+C9WeNaCTDW4kJb4rMuSTN5ZYUj2lMpPHbXmjcwHsoAg1hsSwax9PMIdXwXQevi3JlwRj5DXKGX2zBAR9q0DrA3pnYPaKFQzZfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by PA4PR04MB7807.eurprd04.prod.outlook.com (2603:10a6:102:b8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 08:24:10 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 08:24:09 +0000
Date: Thu, 6 Mar 2025 10:24:06 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: i2c: maxim,max96717: add new properties
Message-ID: <o7em5dmk6mu3uyd7eqmvshdaj233aacog734gd4wdhk43kuubg@2z726bmyvfcq>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
 <20250207112958.2571600-4-laurentiu.palcu@oss.nxp.com>
 <094bfb612d8895d2316d01704d37c853f8f86ae6.camel@collabora.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <094bfb612d8895d2316d01704d37c853f8f86ae6.camel@collabora.com>
X-ClientProxiedBy: AM0PR10CA0034.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::14) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|PA4PR04MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: 441dd993-c748-442b-8a87-08dd5c8844d1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?YZHL8fWSSER0mfTyjCk4jCVhjr438YdhzmKEpxThpFXlOFT9TSRpC6QZB8?=
 =?iso-8859-1?Q?aVUNHGKcOPYhHrAb2oI/iaQ1nS3l5tvZWTmAQqBKzsppXb0eVeyyFH4orK?=
 =?iso-8859-1?Q?b10lUlKfpf9bCXb5fDJmOc6pYsEWbtQ9ZA/+0PYgSeG9AuVDRgGLe9xufs?=
 =?iso-8859-1?Q?uWQsUmVLg2WGr7Kkgh5pRQI7jAzm630ffMTWLP77X3Y6Xw/DeaQIyleojC?=
 =?iso-8859-1?Q?LVxHe6iwM9lKVc1kWWM7aRjwISEZ0LQA4NKaLswwyIRJTA/LJI9H7Vd5QI?=
 =?iso-8859-1?Q?SDb23LcCd0IQySu5JGrpfTypkn5jXrW4Ay562MFG30QetZGhpGGQyVceZ3?=
 =?iso-8859-1?Q?nLvVZTC/G/MC21rSONGECZPvN5GW0PJUSdwvDtorZIeyU0bdsNaFI5f7U3?=
 =?iso-8859-1?Q?prX3tMsuzZrN+PhmNKOFpUhohwjk8vcViSb6pQ3CSENHR/LG/pQgsXK3eA?=
 =?iso-8859-1?Q?92asdE064Ro922UFKSEATO2ICIF6PgYvpkFpzqODEKu2xQHKDMg6XloJr+?=
 =?iso-8859-1?Q?92tvLZtyYdkwCTWmNNpyQSO4FcnhhgXSbIwzCjy/be651OEuaPnxBrFDcf?=
 =?iso-8859-1?Q?HBVnRV8evfLo/7dQyooTQzzYAZBZkkQkK+IF5XYKg2Pfyq+YzqCoEWwQ71?=
 =?iso-8859-1?Q?qopHjG6VWbHIfg99oa040NPk7xOQrk4MwIMEBJe+LEefX4f2Wj1ptvCPrg?=
 =?iso-8859-1?Q?q3xAB4vhc7bnY4rkPvFs4oIW1te12AdSxFq6PJhx16PGD624gUhI6aKRB4?=
 =?iso-8859-1?Q?oid5dBcXjQzCQm2tq7IbAOmHrr1I/Txp0lIqFL6au5QyYHKfSlbFkzIOWK?=
 =?iso-8859-1?Q?QtxUbcELKxolHvwsExlCQutCWB5REXYYPLCVMoa20Ys2++3gmiAZacui5+?=
 =?iso-8859-1?Q?aU4G13t+Nt8z43Ztk7+NUiTonNfM4b1Eln0YLxAfCDUJq1Ex24q7okIc5Q?=
 =?iso-8859-1?Q?Pv1JBOfqSOjl0NnaTGF9UUhoA0Nrs63ONwVgtWx1WnOGLYLoncUnha1EMO?=
 =?iso-8859-1?Q?1r3ssdKoATzAQQyRv/eMzuoRnspk5aI85fWZJVTAWEB00Y7W9RYHVV6j4A?=
 =?iso-8859-1?Q?/7FjQTMNuCRjenPJ9JqMMrwY5I61UICih/Hf/lwQboMtObLSrq5QzL8e1U?=
 =?iso-8859-1?Q?JYYFYpQ+2rrM0Ey4jISDvXUboTvYUjIxZHsfXWS+7Q3Bgdtawh6/ev1wT7?=
 =?iso-8859-1?Q?/l67PoOLfneIEUoNaGpwRRCEF0IKy0Rvalvi8+Jb5ZUg2jD4YymzdFUg5P?=
 =?iso-8859-1?Q?HsqbrkO8c8Sqm6hVp0Npj7JPqVA7pMIDdftwlT9K85IU8DtWbAdSuwhxMV?=
 =?iso-8859-1?Q?+OlpCriF2pfKAM4eG5L0fBZ77aICF+XOm/PuKwBNjRwLywUfYr/8mEVk4A?=
 =?iso-8859-1?Q?p3SoBPcv2+x7hSVN7GeX7G0lCv/KWoSJ9qcy5uGA+ZpxclZXtJ2z0BoDbZ?=
 =?iso-8859-1?Q?e0cAUZucvBrlL3ij?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?2nmekGJ+oBkOYXS//6XJrAvnB9+olKvuiiPn2XM1Wm4cH61WPdgBBHi5Vp?=
 =?iso-8859-1?Q?XclF632SjeHIJnZyATHs1vAmxQB2dRqwa/MzFOf5muX5qgqZNESXA8pQ2c?=
 =?iso-8859-1?Q?nqAwNFNpxtIiCWx8suPSM8bbdQU1JBdu3drKkRSyAI3a40fd1c5aMR1BJn?=
 =?iso-8859-1?Q?uTovtXD97Zgpdm1W5+kxrjl+wlbaaYrhOTQHH4qZzHxbBhFWrDseBvbHs1?=
 =?iso-8859-1?Q?//H8eInE5glcPFAwQ+kkDlsqP71bvozNB7FPOxeGcFptSSzIjyMlWruc8E?=
 =?iso-8859-1?Q?cj3IsEFZzSY6DQlZfk2FurMciun65z3WJqFfaMPmzZKfGrCan1oMSJsMAF?=
 =?iso-8859-1?Q?rRyTKZfUZ1O6lAqXN+ABzLTeTjSHa62mQ97HKu1+h6f3UVPYG1wLtND9Qx?=
 =?iso-8859-1?Q?hGtsjiUhpQSdlybcRNsw4PwN+hLsNnKjxLWPt7KB7s62tmsPUTjlb0PQI8?=
 =?iso-8859-1?Q?p/TxGca40Olwe3AeJEQuzMm9sI9QfhEEvEd8F9TPFGl7tJ/37VE8D6Wcmk?=
 =?iso-8859-1?Q?D6lnbJ2SGfQlvzcGb2qks2oCsxBTalMXnYtHv/CFVb9sgZft0b5hPW6G1B?=
 =?iso-8859-1?Q?z0QK3s8HoVaDGr/firiJJXGGLc5PxJeNA71jzzAGEujCT5QR7gcXN2Uomk?=
 =?iso-8859-1?Q?h+ZtBJYjhosWHij8ergljU/2xLdqT2tIi8HsF9yd7cYnrsOqGT3hxubYvq?=
 =?iso-8859-1?Q?YH4nga+gboJc0QxWh4T7RscarEzBqilIjXKJIW+76KRL4F2YrrUJQW27sk?=
 =?iso-8859-1?Q?RuCbF4HpQRPujBidbiuvpQr/x/Bg3sqUYxA9FnyerCk3E08Wex9NYzrXlX?=
 =?iso-8859-1?Q?SGj23MnyC37n8jq9DEFZbAP77uC0A7B4Ha1K0G858/OucdSD3+p8SAVLNy?=
 =?iso-8859-1?Q?E2Hi+UA6hTF9fi6TpnEZcng2q8sLiWZp2Ln5lbt4tucXEIt4QeN2LuGOkT?=
 =?iso-8859-1?Q?WpmdlBfjU8GtUJOvTLbtJsC0GOF69+JA1uJYgfJLAgUbDcteSDs/jP7Nou?=
 =?iso-8859-1?Q?5jzblesSzwFHuQGsGVr+XBKOF8k5r8Lqkggiu3mqPvqSuGeXVlwEeDzauH?=
 =?iso-8859-1?Q?RkxyvBMDlVr2ZDa/TmYs0dwCALyh3mQZIvEyEm5i6G+4wZE7/mkoJ3bgzz?=
 =?iso-8859-1?Q?YoveyrXsF2/1Km0ZMM0yV9K8O4Mb819+WjNGzyyKB4LjZ81qql3d23BcsB?=
 =?iso-8859-1?Q?L0cOjWBwBPpOKd7RUUzui9WZdMrXwzHIAQpM1OVNoG+j7c19JYMj7yRktd?=
 =?iso-8859-1?Q?/TTQblLj98Xj5f/r+qfSSEB+uKuRLtfcKJvixLf0lBNJz80qG2+1dDTIzJ?=
 =?iso-8859-1?Q?tM73eWhn9opbsLaLUgLZHoSPpki2cIkKHgmUl4FV1hECvL9mtnGU9UgX02?=
 =?iso-8859-1?Q?R9Gz8eCu7hEps7j4MUlT17oPq5/L5QaKjy790X4DwH+TnpBIeprlrxt+1b?=
 =?iso-8859-1?Q?bT1MbRI83bBxZdqvNtwTbscPyjOPrsM1ck8AO58DJFVrQSobgCkam+3PuQ?=
 =?iso-8859-1?Q?u6pSCb8oH8+rrsDKzqSb1p94Qpti2u5ndtXg0nMbODKL0ena+5t5/pyz3M?=
 =?iso-8859-1?Q?GNtRqJFc5ats8w3Dz8VdWZMNgfoyurMWRe6MtOdZlD7fGnpc6v2gUihZqU?=
 =?iso-8859-1?Q?k3jNNJyEBqLjHpA+LLk2JY8i6kHUB9iJ/NXH52SN5eJS2BtkeB+lqsSA?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441dd993-c748-442b-8a87-08dd5c8844d1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:24:09.8358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OebQIwGJfp5IraikH7H83ahiKFwHJJebATEwnXsY7lgAyu2kF4/W/g+x0IZa0O3p5YtGuYEI5i4EBTyVDxS2VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7807

Hi,

On Tue, Feb 18, 2025 at 02:54:07PM +0100, Julien Massot wrote:
> Hi Laurentiu,
> 
> Thanks for your patch
> 
> On Fri, 2025-02-07 at 13:29 +0200, Laurentiu Palcu wrote:
> > Add 'maxim,override-mode' property to allow the user to toggle the pin
> > configured chip operation mode and 'maxim,fsync-config' to configure the
> > chip for relaying a frame synchronization signal, received from
> > deserializer, to the attached sensor. The latter is needed for
> > synchronizing the images in multi-sensor setups.
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> >  .../bindings/media/i2c/maxim,max96717.yaml    | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> > b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> > index d1e8ba6e368ec..fae578d55fd4d 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> > @@ -42,10 +42,35 @@ properties:
> >        number must be in range of [0, 10].
> >  
> >    gpio-controller: true
> > +  gpio-reserved-ranges: true
> >  
> >    '#clock-cells':
> >      const: 0
> >  
> > +  maxim,override-mode:
> > +    description: Toggle the operation mode from the pin configured one.
> > +    type: boolean
> I understand that this property is intended to flip the GMSL link mode between
> pixel and tunnel mode.
> What about adding a property 'maxim,tunnel-mode' to the GMSL 'port@1'.
> Here the MAX96717 only have one GMSL port but other devices, such as MAX96724 can
> have 2 GMSL link and may have each link in different mode.

I'm OK with moving the property inside "port@1". But I have some
concerns about the logic. So. 'maxim,tunnel-mode' presence would
indicate that we want to force the functioning mode to "tunnel". But
what if it's absent? Do we use the pin configuration? What if the pin
configuration is "tunnel" and the user wants to override the mode to
"pixel"? In this case 'maxim,tunnel-mode' doesn't really work...
Am I missing something here?

> 
> > 
> > +
> > +  maxim,fsync-config:
> > +    description:
> > +      Frame synchronization (FSYNC) is used to align images sent from multiple
> > +      sources in surround-view applications and is required for concatenation.
> > +      In FSYNC mode, the deserializer sends a sync signal to each serializer;
> > +      the serializers then send the signal to the connected sensor.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    items:
> > +      - description: FSYNC RX ID, needs to match the TX ID configured in the deserializer.
> > +        minimum: 0
> > +        maximum: 31
> > +        default: 0
> > +      - description:
> > +          Output GPIO pin used for sending the FSYNC to the sensor. The pin, however, needs
> > +          to be excluded from the gpiochip using the gpio-reserved-ranges property since
> > +          it will be used exclusively for FSYNC generation.
> > +        minimum: 0
> > +        maximum: 10
> > +        default: 0
> > +
> 
> MAX96717 do not have any knowledge of the frame synchronisation, but this device can forward some
> GPIO to/from the deserializer.

Good point.

> 
> GPIO forwarding need some information 
> - The local GPIO number
> - The forwarding direction Rx, Tx, Bi-directionnal
> - The GPIO ID on the GMSL link (RX_ID/TX_ID)
> 
> Can we add a maxim,forward-gpio property reflecting that instead ?

Agreed.

Thanks,
Laurentiu

> 
> >    reg:
> >      maxItems: 1
> >  
> > @@ -113,6 +138,9 @@ examples:
> >              #gpio-cells = <2>;
> >              #clock-cells = <0>;
> >  
> > +            gpio-reserved-ranges = <0 1>;
> > +            maxim,fsync-config = <0 0>;
> > +
> >              ports {
> >                  #address-cells = <1>;
> >                  #size-cells = <0>;
> 
> Regards,
> -- 
> Julien

