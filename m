Return-Path: <linux-media+bounces-53079-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPoKOmvRlmkZoQIAu9opvQ
	(envelope-from <linux-media+bounces-53079-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 10:01:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A04D115D2C9
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 10:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEFB43023E14
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 09:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D48326D4F;
	Thu, 19 Feb 2026 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=q.ai header.i=@q.ai header.b="QNp4W/cX"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023111.outbound.protection.outlook.com [40.107.162.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B4C2701B1
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 09:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771491680; cv=fail; b=MOrX8uzbsyik8uMx+2Wx02hCIGScj7jBQ8QXk/C7fjLY0V4+tgbcfqg8fIT7VpJ3XWakych2VuFoPbeuiaZuzEexiGfUYV+JBsryKMG5LATspLzkW4GImTMa20BB1aZq7ejl124S4PK86xLNWNj1BkjxahIGCmuv1IcYV8I/dRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771491680; c=relaxed/simple;
	bh=QgCDoL5/R/DbJ3Qvl44CykH19POQ3nmh6YsIDUuMVX0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SZcXutK5pf5aKkRlPmYq8pQ7Gqjwwyy1P4RcE0KYJmzVVHESUG6dfAypqNsBbFhg9svW3L36K1r33thZtzHN5M6xJbq3bRlS98EaJR3V0Yxk2kLZvWo5yLx/+4aQNupRoi4r3DMwjgB2V4VXsgpfaxP38Kida9na9tbUUV7hJBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=q.ai; spf=pass smtp.mailfrom=q.ai; dkim=pass (2048-bit key) header.d=q.ai header.i=@q.ai header.b=QNp4W/cX; arc=fail smtp.client-ip=40.107.162.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=q.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=q.ai
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieCSVi1vr+TbVITVrzt3LLpbs/LIX+y1GqVggOAtTWtVyePBbV+R8neTPliAiQnLObsTU6eUVNXVPDRG/9ajvmGvdTo3nEsgkq3iDLKfSwKljmiKoaPl5hjMmS1D6gBQBsOtjRu7FDgo4835uzMoACDpoccL7F6hxbpZvR96oaUsMMA/mFZZhWd57GQ6claHK5ru0RUKGfAk7DCIH4hDrFHoljyCXNJBekk3HUZxv7o3XjTK9QC5ecaKVBhh5qzDg962NNfjhrlrUJxUN6Rmfu4VqNxItDbjlba35//qfTYbohEbU0z+HlcnckHVmQ3fhWvIuAloANzbmopYsD4M8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zk9TdPWyGttM6Vivc34csRWEGNY7jcDXS6tNC0CYzkQ=;
 b=UxlwESoTpt0uid9Z6k1yHVUjFPq+LO4wwAzmeuFA+lrzaU/sKqP3tkCt44HBbBPoTPEJQy2i8/NpwFTxTpiUuK/QHG6DFOCyaE8bOyBOZfz4Z78qUN6uzmArlM6zQFpQ71DL0SnBVAg0MkiHjK19mkHsVqkbuW9FnvOrwZWUFtcP8U/SIJVjlLGOQ+TRQQPBYMb7b5oTPtdMsTvZYDXqH9SxNZqeTDOBTuLeJo7OTEaP+As+4IxBgIJHEzYjkZ0UmtAV49of8j4Fybpd7ZZrzQpF7gdL+0UQjjGjQ5haHHksqriadQzwCpng2/pCtKcptgyeP+18C8ehKXtRe0WK9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=q.ai; dmarc=pass action=none header.from=q.ai; dkim=pass
 header.d=q.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=q.ai; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zk9TdPWyGttM6Vivc34csRWEGNY7jcDXS6tNC0CYzkQ=;
 b=QNp4W/cXzJaHHRGixG6yUsdNFL0fSWnCICdh3jzETVW2Cgfa4mtcYB6vT6+nN5yA0tu4N6eyf+gqgOEtGPo8Zaj5+fPfcunEoclQaAd5e9AdRxBYCbeKG0yMHURJFhwrhfnrmUjXvPuK2pSFHVyCqOnnkrwtMbF3zegxOgWUm+x+l5u2k+wnmeyJyzGSbLWRcot5eyQEvyNvPPckE+ImGcxCpN0VMhujHPEvz4bsxoFSb7lLFMY6ye3d4yJjfdMI0F6tBPt2h6q3kN6/TxUiNa5oY5ye1m6KZi6WUx8AasSpnLEqVtbPZ/xeKoEx1YAZFzBFxNhErvyGqFR0v+PhtQ==
Received: from AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6a8::23)
 by AM0PR10MB3571.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:155::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 09:01:15 +0000
Received: from AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b928:6ac:a43f:e736]) by AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b928:6ac:a43f:e736%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 09:01:15 +0000
From: Itay Perl <itay.perl@q.ai>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Itay Chamiel
	<itay.chamiel@q.ai>
Subject: Re: uvcvideo regression: loss of access to full UVC payload header
 for generic UVC devices since 6.17
Thread-Topic: uvcvideo regression: loss of access to full UVC payload header
 for generic UVC devices since 6.17
Thread-Index:
 AQHcoMQ56VCXsngA4UKzyfhKPmFOcrWITsiAgAADThaAALZugIAAMu+lgAB0pICAAAq24g==
Date: Thu, 19 Feb 2026 09:01:15 +0000
Message-ID:
 <AMBPR10MB937601B40E77906128A82B758D6BA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
References:
 <AMBPR10MB9376E972B02F45815C729C318D6AA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
 <CANiDSCtPKtKr7UgEj934BGpV0NEvyHbYcutMV_umBa=JiCNDuw@mail.gmail.com>
 <AMBPR10MB9376F52A5A6C5EC76EC263CA8D6AA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
 <20260218222211.GE57525@killaraus.ideasonboard.com>
 <AMBPR10MB9376A5762A4DF0BA3759437A8D6BA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
 <20260219082157.GD520738@killaraus.ideasonboard.com>
In-Reply-To: <20260219082157.GD520738@killaraus.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=q.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBPR10MB9376:EE_|AM0PR10MB3571:EE_
x-ms-office365-filtering-correlation-id: ffe25373-309a-45c9-9e20-08de6f956ff3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?udeYU9ZtJY4S51o2Drhtm81hFsh/OCUxDQnNR4WNBJ/+rkZcDjVH+/L8pV?=
 =?iso-8859-1?Q?ci1aoM424G5Xcpfv2USwfe8jlVBOmkxre7zxzpWbqszpU9BkzSoX4P10o9?=
 =?iso-8859-1?Q?JNyCwFmRvIlGmlGbvRgDept4ha9PMPHtduT5ix01x3umnl8CvnZx72goot?=
 =?iso-8859-1?Q?A2B5cOvc02PTEbf/ruvCM5uJc4lmh5FgwO82Hs3f7dCGvGyOVN9RwZf5mh?=
 =?iso-8859-1?Q?gQadcwTVNeVM/kAMy/+nkj8EhrRLyftGq/aDI+Ub5y+Awuf7xpyO7CRWAQ?=
 =?iso-8859-1?Q?gf48J0fm+VRqX5bmW3CwPrBNWgW1eraXAQrTJ8/82p2V8vgP3/anMjR/C+?=
 =?iso-8859-1?Q?wU+ArDjnA9lTNq5JWnO7nRBhKCllV3jmczDG8R50Zg1jaxGO2XefQK8sAS?=
 =?iso-8859-1?Q?m6sGZZfnAwNeytQJGi06O2JoM8ZLDpUZrsJiw6lGhUvJ1aaHvAijv3T3cz?=
 =?iso-8859-1?Q?kYOh8N6HwleNuSdrFlkiDl4zWe2jXHa8A3MOzpAQoRi1Ig64dPCS/huCpV?=
 =?iso-8859-1?Q?fi+g7bKBAwEx42Omav6hB28xD6dEcvaz1PcK2GQqlffTP6XE1Db/f4oV2J?=
 =?iso-8859-1?Q?GHazSZLNJIyIxp4bOSIgIs7rEu5LslLhMw49Wg1KlxXgmNgWFPfNTPzN6j?=
 =?iso-8859-1?Q?WXGgQKg5MkXfHT7mD3KiO6SGG/acvs7/4Bd3ASf8SbJfHTNGRzIpFoXi6Y?=
 =?iso-8859-1?Q?fgdgaiHEMrloJjLD/rZfcYA9NMYkxEGXftWwticF5ja88IcpLgdxQTeTfC?=
 =?iso-8859-1?Q?E66nHg19SJ+TQp+BEe+t7hkaMXU5m8s6ELd/EMNpa/bfM4JheZ5a2h/mAu?=
 =?iso-8859-1?Q?2Mm89iLd/c8IN0Rrd0F5x+9UCIiCY+4fGzeDRU0PbAg2UPL59Muyj5/bNh?=
 =?iso-8859-1?Q?krBzylluNoBDqAdfcoHxB6J9gwnbXCuWwM8rVMLBkzxtC1ZeVF50y19GLV?=
 =?iso-8859-1?Q?K4vqa+4hkHkoATli8yQGhcMVCuMjsW5Wqg6sVMJm4WeE+jlVJgEWoG6OQK?=
 =?iso-8859-1?Q?eu3Rf7kP03BA/zM7HooI2pROz9CIBuF+0lZLNj7yXsgoWs9LF+VFJ4YySV?=
 =?iso-8859-1?Q?iQDcVOmq7tP1GFR03ca3LjP1gDJ8KthZ07b9IP+b9/+ictDfh6aOYapw28?=
 =?iso-8859-1?Q?ZsPECGRi7sGP+mgA8HnshrpyE07fFtMkcJXK4jfBVcgVZjV+gvn2v5F7NH?=
 =?iso-8859-1?Q?JOL7qKVAVmjx1d0Fpcv/+eDUq61Yqq760TIB8UjIpSXpi3N6XkPpN4c4Q/?=
 =?iso-8859-1?Q?PucTCJ9jgbNHl4vuddsxICiCEXyLWORlRxeC5RX/Ln94QYtjFFTSGsf8Tt?=
 =?iso-8859-1?Q?A8UkmwSkUkOqodSxtvDMPbduqOWh9Hi1fV5hg4JBSYF4bLQ4aUD5x6AixZ?=
 =?iso-8859-1?Q?EecRTpcDeOmh18DKAxIsXd/Ed5s824Zg3bdIJY502PffEzSbyO2XKNNEk0?=
 =?iso-8859-1?Q?2GQFPsQ0IXM4oQ2LoCzXzyC0+B+gu8SZ1hEsJBpXzw1j7eYf4Rlli0WPCz?=
 =?iso-8859-1?Q?FQDZG6XywRrUwUGJ+aSj0Fyeiao3jaQrCW7NzcAT/DPld2YWV+HtsF9Ovg?=
 =?iso-8859-1?Q?Df88Xx7CipbY8ChcSSL2EjyeQh9g2hg2WbYOOVSa/vibZwDvWNXVNdEHHN?=
 =?iso-8859-1?Q?8pcsNoGusQYUU+QlFIu51IpIgFodRPRhKpHEX6JI4tkMGMgKZwlV2yI7lL?=
 =?iso-8859-1?Q?iLHI2LBlxBl2u7UxPlM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?k09xfmehfjADylYRxe1q0/wKf6zNgvgOiXGIeBoUlJGElnfSDkyjjJgx9o?=
 =?iso-8859-1?Q?l1VuQhAqFp53XL0gEg2vV3/E6eCspqH+sDHppKSpooxuFa5+zwQqdt3LOl?=
 =?iso-8859-1?Q?HGHElcGCHu34csXIf/FuKNoZAULWDEB5XoCWIU3Q6TQvx0T3secSa0qvaV?=
 =?iso-8859-1?Q?5V/pJTkdtugHoZ11gShuB94Q0vhq8Mwp1my4VxK1k2OeUOhnulLsrvaLj3?=
 =?iso-8859-1?Q?WD8XjwdZM3e3SRtWoiBo4RoGq1+3VreKC0u33FeNq/7+vOiJ+WlosSypee?=
 =?iso-8859-1?Q?487cL66jRhnRhPPZjrr3EaUr94qCTsWZIs54O3/mTQmsb8T6iE8DQKrB2h?=
 =?iso-8859-1?Q?8B2O0AB8ZxGX5JQggSIxmgdUxVv5B+bWFz4J7+XSg/9qcCInHwrDUUufZJ?=
 =?iso-8859-1?Q?O7bGOsOzstylUahfI677aCekNqVGe+kGQF/WDpRLStgV+UK1v8NDvLpjeK?=
 =?iso-8859-1?Q?Ss4ppvYWUDd2Wjxs3RbBNNNJHGemcr+wkJw4mwDjd7UX4idsqBBjLer0Az?=
 =?iso-8859-1?Q?oO4bndd4gI6lV4+sICN8xgkAZU6gWoTMgfVkXXjYzKRmQCObPUDxFVuVf7?=
 =?iso-8859-1?Q?8bzaTBw3xKcEH6QenKMebMiNu3nscSqmsbn3icqBbbw4WPTShy8kcWWY7R?=
 =?iso-8859-1?Q?gLPUHr7oWK3pNom2Nc18Utl2SIbOoLUszHvtQOrBYx1qw/W9g7dinR/4pH?=
 =?iso-8859-1?Q?8OdLYah7nxvw12hUKArvf2BMM00QncrdbPYHTRP17WTaLZxWe3fgnRnMiX?=
 =?iso-8859-1?Q?iDHJYxMNx0h5xm6ZlvsCDrapl95fvkkPY0+dcn0HEhLnNx87Z9KCRDHjG/?=
 =?iso-8859-1?Q?tM7as0VQ6LJydPprydbwFgxMlAsInfV/k62EAzUU7gfoLB3j56ufIbzUXO?=
 =?iso-8859-1?Q?h90KgqOrw5V/ZIdGr7w43j150EuNdUDuJR4n9z5PT2AWiMXkywI6blqv+w?=
 =?iso-8859-1?Q?yPN8EARU1bwFRZZKwREJHL8bR8hg2rT/OnTKfBn/TTPe1hvBNQTB8kKE2F?=
 =?iso-8859-1?Q?2MiyjjSE6T+l1EzsSRCum+bSxqtz3xEiSd5thZ5xuW5GORT0P/ABkR608e?=
 =?iso-8859-1?Q?nuLctNvnoVLcRcTI/RgiaNZoDixUUDOmlF1WHr99am54Dx8+MhGaopoZz3?=
 =?iso-8859-1?Q?4QbuCmZl6BiE8fjfUu1UFjIyi55maJmKoVISNRdYTowG3wubp69GRYoHPo?=
 =?iso-8859-1?Q?fyF/XQ7o/3fYWXof+HfXky6SuoBJokfNrXS+R99Us6B9rgsHJ+v85A0sZ6?=
 =?iso-8859-1?Q?Byo76hhaDMfNtuKRvqAnHvBGjR7IrGMa1SUtmnCuxjkaKU3age9sxGkYPn?=
 =?iso-8859-1?Q?nx6IVPfBHp4aLFaighCp3Tf4HDAl+29cYUKX8+wl9+Fw/+q4ot4/4SwMZK?=
 =?iso-8859-1?Q?EB8n6+uxUuqlN6PUCmay+jdIRRcIC+vHe0klaIWu2fj3gItsFVnztidHlx?=
 =?iso-8859-1?Q?3zBtM8K7wQbE1oqzTy2ghxmPqoQo0uZ/Vs2YoB0Nz9ljU492wtQsQbxSZi?=
 =?iso-8859-1?Q?Sx5dbvJ9kl45XMLbXlxbRaPHy0IrxNe0sci423El+VNFU6vZTzVRg2wJn/?=
 =?iso-8859-1?Q?7DGF6ofWilj2LzdgVzOjp/kzpSt+AMG/pJGPDFsd/08ywDWcqXF2GMv+/Q?=
 =?iso-8859-1?Q?UTdELGFr2qJYPunrKIIVcL7feU758sYx4oBtWvKg2aXJ9aJFWGJ3wawD7R?=
 =?iso-8859-1?Q?GspNMaoTpXRpI1R8y5fSTEmEu4qDQ1z7RaQEWfoo5JGtGKVCHsg0bUVYaU?=
 =?iso-8859-1?Q?c3OfEaUcY/rJ/mzG10nL7frwpehaMxUMUvsPoP7PDfro70?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: q.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe25373-309a-45c9-9e20-08de6f956ff3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 09:01:15.1955
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7aac50ea-5b23-4e88-8c1c-f6c7ceede9fc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LwLiezaimTb7ilGMmRGFRHVYDtdDFDjCz9FhNaO85Ftb+v5CGn3LYAPL9i/LrtyZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3571
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[q.ai,quarantine];
	R_DKIM_ALLOW(-0.20)[q.ai:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53079-lists,linux-media=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RSPAMD_URIBL_FAIL(0.00)[chromium.org:query timed out,q.ai:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[itay.perl@q.ai,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[q.ai:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RSPAMD_EMAILBL_FAIL(0.00)[ribalda.chromium.org:query timed out,itay.chamiel.q.ai:query timed out,hansg.kernel.org:query timed out,itay.perl.q.ai:query timed out];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,chromium.org:email]
X-Rspamd-Queue-Id: A04D115D2C9
X-Rspamd-Action: no action

=0A=
=0A=
________________________________________=0A=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>=0A=
Sent: 19 February 2026 16:21=0A=
To: Itay Perl <itay.perl@q.ai>=0A=
Cc: Ricardo Ribalda <ribalda@chromium.org>; Hans de Goede <hansg@kernel.org=
>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>; Itay Chamiel =
<itay.chamiel@q.ai>=0A=
Subject: Re: uvcvideo regression: loss of access to full UVC payload header=
 for generic UVC devices since 6.17=0A=
=0A=
> On Thu, Feb 19, 2026 at 06:03:49AM +0000, Itay Perl wrote:=0A=
> > ON 19 February 2026 06:22, Laurent Pinchart wrote:=0A=
> > > On Wed, Feb 18, 2026 at 11:56:28AM +0000, Itay Perl wrote:=0A=
> > > > On 18 February 2026 19:17, Ricardo Ribalda wrote:=0A=
> > > > > On Wed, 18 Feb 2026 at 11:59, Itay Perl wrote:=0A=
> > > > > > Would restoring the previous behavior be acceptable for compati=
bility?=0A=
> > > > > > Alternatively (or additionally), would it make sense to introdu=
ce a dedicated=0A=
> > > > > > metadata format that allows userspace to request the full UVC h=
eader for=0A=
> > > > > > generic devices?=0A=
> > > > >=0A=
> > > > > By any chance the device that you are using supports=0A=
> > > > > V4L2_META_FMT_UVC_MSXU_1_5 ?=0A=
> > > > > If the device exposes the UVC_MSXU_CONTROL_METADATA control, that=
=0A=
> > > > > format should be available, and it provices access to all the UVC=
=0A=
> > > > > header as you had before.=0A=
> > > > >=0A=
> > > > > Alternatively, if this is needed for a specific device you could =
send=0A=
> > > > > a patch adding the UVC_QUIRK_MSXU_META for that device.=0A=
> > > > > Would that work for you?=0A=
> > > >=0A=
> > > > My device is an internal development platform and does not have a p=
ublic VID/PID=0A=
> > > > that could reasonably be added to the driver.=0A=
> > > >=0A=
> > > > I may be able to implement the MSXU control on the device side as a=
 workaround,=0A=
> > > > but I'm concerned that this could cause issues when the device is u=
sed on a=0A=
> > > > Windows machine, which may expect the UVC header to follow a certai=
n=0A=
> > > > format when MSXU is present.=0A=
> > >=0A=
> > > Does your device implement a vendor-specific metadata format ?=0A=
> >=0A=
> > Yes, the device uses a vendor-specific metadata format to attach=0A=
> > platform-specific data to each frame.  This is the most straightforward=
 way to=0A=
> > add per-frame metadata without otherwise affecting UVC functionality.  =
We have=0A=
> > used this method successfully on Linux (using the 0-format hack) and on=
=0A=
> > Windows, where it required a registry configuration but was otherwise=
=0A=
> > supported.=0A=
>=0A=
> To support that device on Linux, the right way is to define a meta=0A=
> format (such as V4L2_META_FMT_UVC and V4L2_META_FMT_UVC_MSXU_1_5) and=0A=
> either add a VID:PID entry to the driver's uvc_ids[] array if the number=
=0A=
> of devices is small, or define an XU that advertises support for the=0A=
> format if you expect a larger number of devices. The metadata format=0A=
> needs to be documented.=0A=
=0A=
I understand the device-specific metadata approach via uvc_ids. However, my=
=0A=
device is an internal development platform not intended for public=0A=
availability, so adding specific support for it in the kernel would not be=
=0A=
appropriate.=0A=
=0A=
Would it be reasonable to consider a generic metadata format (such as=0A=
V4L2_META_FMT_UVC_RAW/EXT) that could be used with generic devices? This co=
uld=0A=
be a useful feature for UVC device development and testing in general.=0A=
=0A=
---=0A=
Regards,=0A=
Itay=

