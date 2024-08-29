Return-Path: <linux-media+bounces-17109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0C1963F6C
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 11:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28FEE1C24337
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 09:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1EA18C92E;
	Thu, 29 Aug 2024 09:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="A522MUcy"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022079.outbound.protection.outlook.com [40.107.43.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8EE158541;
	Thu, 29 Aug 2024 09:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724922231; cv=fail; b=jag+TbWToJPTVT+bW1egHb5FpfHo4gpeqfgJTVzu8TH5zn2n1ec7k5L0EabSLyYazRWz2XMyDvv7kwMGmEQS4oueDuSKOKPYYXFLJUv3lvq5z3hf9iptJAeHNlOPUHyszEx99a4J1TucEdHR0KuCc98pEpe1xuKLJodMq15W6PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724922231; c=relaxed/simple;
	bh=FhNgNYKJ/GZ7DEm8LeLIkjk7O9P4fFWU8fARFzSAYKc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u3tLfsVEAAPGy/LZhvJxTZhjPsxmLWSltG9ZyzoTKcV5bEliqnHgOB8x/jHCVpMulltSrelAoyY2r8tL9QRG6oGvhoGiOkWaafbSQHvXvujMn+S+xk/6ya8o/C7GKVvFEL+GLWuubWo0l2m2GCMP+4le6Cl67pSMBz6VkNzjBh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=A522MUcy; arc=fail smtp.client-ip=40.107.43.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=my5tqAN5CcuzWl6p1O1br00VmeF9UrbNql6RpAFyMflg9MjnwHCLQAMalkqcRK7WT5cRqmhFQqp+Z2p3nHR0go95fioWxufuMR2ifrtjFCEW8rzjXOFqvDIl74ZZhr1fhHP2Met7hvsNybGqwp2JJxsGuIw6Ofb0odvYQMU0OP23cDYPo1O/tr5U/CRTpqd4kJ5jnUe3w8nyr+z5ZoAmcomIWnmSWaNW+OAc1KXVI+luT+Ubg+Tk6mTZC0NrOG2r918k7TclsDqmiiW8jPPIfSicWD0SSpRvNMPa43YrYxCPIzdvyv6fHbYrhJwIY7JFqQkVFshlFlakv2ZdbxgrrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5JlklZpZxl21tnK3vtH8nDd3hGN8KgPEAwScMH/8hU=;
 b=xt5WYCRyC71m4Fms1EtYKYqHK2EgJ0DOFjrbsq8vskxl30ogyQJ2jQNBKCiZ9Ae0EAymn/yIrd/aBnVicxlq9y0bKVKRTD+cdduery7Rw+iOfq89PzexRb8LQxbdJPN6MFujCgNM9lLQNon0pq0QH4GO8Oj1pG4GeAd3gTn4oTp3YopSgkznql2IO+i2bNCcKRpJ5Xv9mdaVDHSmdhF663WuFm4w3vZshkJhNDBK6BBZtL9yYzQ9pUNXXhGiqFowtu0hTX1paaxlxvUVSD6ywwOMP0/7hPEcT1+q0n3CXs3ad7QRjNJ8aaac6fYerHlxeAUTlhflFaGCjNPwQGpX/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5JlklZpZxl21tnK3vtH8nDd3hGN8KgPEAwScMH/8hU=;
 b=A522MUcyUD6BODynkNRco6F6lXoQQvidYKF7VJZP04Jq7xWl4rrGiLXuyQAle8wi8Y3CW5YkkiKa9hKsRsAdlZRez8iW3bk61aMWaum9dbknQZ8VsZLpay0U7fNXWzOD4XtXcxhHnpu2OKh1rJNaFAF9ZPkgtLUZ7pqjTxiKQRE=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SL2P216MB2932.KORP216.PROD.OUTLOOK.COM (2603:1096:101:284::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.28; Thu, 29 Aug 2024 09:03:45 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%7]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 09:03:45 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "bryan.odonoghue@linaro.org"
	<bryan.odonoghue@linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RESEND v3 0/3] Change V4L2_TYPE_IS_CAPTURE condition
Thread-Topic: [RESEND v3 0/3] Change V4L2_TYPE_IS_CAPTURE condition
Thread-Index: AQHa3llmUt9mPJ2BbEqwecNnUloM6bI+JiSg
Date: Thu, 29 Aug 2024 09:03:44 +0000
Message-ID:
 <SL2P216MB124625FD34B910BC05422FAFFB962@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20240725061034.461-1-nas.chung@chipsnmedia.com>
In-Reply-To: <20240725061034.461-1-nas.chung@chipsnmedia.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SL2P216MB2932:EE_
x-ms-office365-filtering-correlation-id: ae3461da-dda9-4c70-9477-08dcc8097c91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xNaZBReUFRtbZDEwLWDlVA9wlXtNMk84hAGkC1tFNGla6l/wDVuKyhnhu3m7?=
 =?us-ascii?Q?arg5h+fH7tnxQQ/M5izukin/nXdP53KyOksT1ZOZvpas0JmtsU6AIBNk71Fr?=
 =?us-ascii?Q?fzkF0DHTjc3O4gTs57rdl6zTmAk3sm8d2zv5Zqp0NFLaouxRd9couLpRSXUG?=
 =?us-ascii?Q?owNRV2cj2qAIxDkAZw9od/JKQytsM2t0gPIU0+Ia4ldhCSpxfpfv7/YAH/zD?=
 =?us-ascii?Q?GfQ7D8XXBMKBLRrjJYNF0s9lIsffC1tDdCKG2AYAcESpyaVS6zupkGfT7706?=
 =?us-ascii?Q?dpXCoO83PoyKnjdvBPzsixZnOVIway60NirzeWjJToLcJaD6kYKQlHv8qbR2?=
 =?us-ascii?Q?9AHtp6Hee0HABCl02fUCauqH/oPsQTaLG2cPHwO1wixwrXC8eu8Gb9C8zU2m?=
 =?us-ascii?Q?NvpJjAX4KNx9doqQhqzwvZlwUzng3bd0zXIXtYExU/TPaYdrNCVxxEbKMeBF?=
 =?us-ascii?Q?NHzTo4NohhmkDwBcn7RewsIvvprIjOuLVoqbnG02TJGTG7QSGy5kI6/aFwRd?=
 =?us-ascii?Q?Ed38LkKAqJlMg5z+55h2HVgyB05xeYZhjtDFlx1FU6gfTOMKXzChQmCsrhgB?=
 =?us-ascii?Q?L9G7N/D70lesxKLrNcF2qI1V3knZUhPIm8en8mvR5No20v+HYNHtc6OC8UMj?=
 =?us-ascii?Q?AlLSKA2JvFOaB1RwfQNtKlAXXMC/XcndIePI4LZUJRjKO22Sv5CPbE+9SVqk?=
 =?us-ascii?Q?R0Im+EiRXb8iLY3kZYmriTUghAld3Tlr6hOIstxq5uBIEAYWEVVak42gKi76?=
 =?us-ascii?Q?wYU5wRdhoRL45u3NTEdCqDDXSIT6jyJI0qyk+V7yNJjzpzlQF1CHY22XeL+H?=
 =?us-ascii?Q?yxE856+YWUeM3lL63I8Kx/i3xJo4OIBmS9e0klCYtzkq0fZ+UwpDE8lwKYwR?=
 =?us-ascii?Q?NC0E7ENtAzxfqv/K9oDXDUIHHPxJH1WIUe9lsXpRytu27r1pIodrfxofKKrc?=
 =?us-ascii?Q?H8duY4IvQQcaK7c129NYL62CKFCgxZmp7g7XqdAVmKdC9dQfrVAgh8xGaMyW?=
 =?us-ascii?Q?lgEUPa8AJ8hyRbj/So38M5T3/bdhkAxbm9lUYB9/01UY5C94MJLzY7pPtSAt?=
 =?us-ascii?Q?2qnwxt1Pdw1PVE6rtRGI1PF7jbX17maOtEfvBJ7494zU0QU4MiOhoW2+2JB2?=
 =?us-ascii?Q?QlKIDcV2q5b5wvFO9KSFvXg+J/xZ9Jqs9768fh6gPmA7vwFdegtvW/IYEU7A?=
 =?us-ascii?Q?dSUlPDeXEqFJBELYU5AZhLc0v6+siS3qes7igv7uzO/fEzR2DJ3EsaNxFVjN?=
 =?us-ascii?Q?Np9JQVMI2Zl8ATuYGBHKLbvofmQagw0a2UbZrjmSjsoV33mrBWSfqsnL7WJv?=
 =?us-ascii?Q?VVttSiG9LTnwhSeJzLQY/hjoRoa0WkPVzYr3vFumQ9+VGvVb6quapYfgp7bD?=
 =?us-ascii?Q?cTXGcTy/qx1OImqcjd+zpMtueN6CTkmfDcqkeIwXptHK+uZnNA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wRH2rbM9nTOLkPsPBuUaAssPslOFw+I3s3Fh+IXh/iOS296mWouiAjmG/2AJ?=
 =?us-ascii?Q?MfiltzXIX1YlxmTJJDbGYiCA8yvXy5ziQZXznC8B1hjAtJprZlr1R8kKVrSN?=
 =?us-ascii?Q?Fw1Kye+nqPHC6P228lRae16JRdOfWfSNroWeUpX0HfHSVlmOKnM4kHNFx2qB?=
 =?us-ascii?Q?WTkm7x0siohDvSv5GzKzFPCnXo910xrg8zWHULFuA/j4fQ7R4hI2353e9d4z?=
 =?us-ascii?Q?xFJBejX1NCZeA68QqiYg5/aAzIn5hijNH8f1EeIxDH2vUfQ9G+JcfBRvQfWd?=
 =?us-ascii?Q?GEFDvqHtRDBm6cI5e1OozihZVWFOokoDV5q1wxpNiZ9Q4ENQk0hohKghLi5a?=
 =?us-ascii?Q?cSZfRfGA0MiyYU2xwoI75ZhVUIltPN86Zhv2jKLQE1ctAN6KJj+iPywzlt0X?=
 =?us-ascii?Q?eYlJD1Z5zSzwqwegfOqkZFpHIuwQeiLbEPNIQrEOV/O44Zmcz435Jrtmm4fN?=
 =?us-ascii?Q?83Ma3Wn3E5PIr+DPiAlw8b8kglRD2G7Pg4DsNdsrHRFUi1kolpI8InzRtpNB?=
 =?us-ascii?Q?OaQBF1T7j3f2M9YU4tGwbgHfz70QnVZxaPEbU5Ga16EFukIYeH4ODZpBDzO2?=
 =?us-ascii?Q?LcJ2NSwmZhaTGIGMAsdabjAXCN0bzvyXRR8hSs7SBeLfsD9pBo/OPhrfYBZd?=
 =?us-ascii?Q?oxeB/nKWLGszD+wVP+FsM/sKz8lrNZLCChs47XgXUt6XWjXLr6FTJvVZmhHq?=
 =?us-ascii?Q?11Ol6PgYOFgHTED4dFJvr73DA+j7cea/fFsNnKIUTv6a9Xv4xWlcsrtmi1hv?=
 =?us-ascii?Q?do26LalctoubohPofg4xrZ4mgbf/oYrYe0gqtm7FAqjzuL1mzpb1Jjxd5O1n?=
 =?us-ascii?Q?xuJ/QjSxIVuiDXE/mLAVr8FBqmLbsI/u4u/t7WQO5WwhpssDrSlyK+5bZQlu?=
 =?us-ascii?Q?8gBRS6oz+RuN83gzOBeAKPA4XXvt4NqOn/OclBg/44cj15IQG0Pma5wm3MoF?=
 =?us-ascii?Q?Kha2MWt8QBMga/LCRfVOGdvTdG1huL+Feyyqx2fDkJ8G6s7DHUS+wqhI0fSf?=
 =?us-ascii?Q?TM5ljHH3IHEEGqpszaUkxRVPKQFE+7PJppq9gzFpRV9V4QBcxqS4fhM6DD/v?=
 =?us-ascii?Q?48a9B9RClEZ9zSLCs2MbrpItfUmivegw7oze+o3UeRi/N2whjbmwoV8XOdcZ?=
 =?us-ascii?Q?whXQRAPLhcOM9QfnkS2bKk5vzizRM8kcMWJarUhRP7gtlW6r/djFmsvqYN6b?=
 =?us-ascii?Q?wHVkyQj49qzNmVGbfwBYiOet/fq2yxzYR/ts3BurIJ6cZuRG+AYoILgGtqzP?=
 =?us-ascii?Q?mVf4ZAOhQGhcgzilWbuFhdz1uv0/En1J/jW3chB2rO2vb6NZ7y/G/2v7SZGG?=
 =?us-ascii?Q?61erNKqtdVrjC+vlNrtfWe5EjxNKYBFq15xHElu9IdKxfpWEVrzVgntf1MbY?=
 =?us-ascii?Q?sIAN1HFDMtak7GFh62fIOmCSiFSYO/aCM/kJyhDbaMdZVQr3+yMSMC0L840c?=
 =?us-ascii?Q?3a0W3YXtOTat3U++pJHOnCVk5sARPhsLgQ2mz5zejNupBLRKUTTVBbLCYMpi?=
 =?us-ascii?Q?QMWmy9drvasrn/NgC4QNWP+gXpUtx/g7qSQzSXP/5yvtV7oMbB3tpOQnki2e?=
 =?us-ascii?Q?Sl7pyAq6gbiu6R3IKrw7YhO+Vp8sl48uYR/BiPdl?=
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
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3461da-dda9-4c70-9477-08dcc8097c91
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 09:03:44.9899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8LfMTDRTvToEU7FU2P0oHrvGvjf6sb8GQsKLB+rkROhG1r+b9tLKhRXhg9HWXGN5SIy+iTaShrFzdjmlXodKbPJKR/eMk2fGBQ1f2dZL+tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2932

Hi, All.

Just a gentle ping on this patch series.

I've addressed all the suggested modifications in the cover letter.

Please let me know if I missed anything.

Thanks.
Nas.

>-----Original Message-----
>From: Nas Chung <nas.chung@chipsnmedia.com>
>Sent: Thursday, July 25, 2024 3:11 PM
>To: mchehab@kernel.org; hverkuil@xs4all.nl; bryan.odonoghue@linaro.org;
>linux-media@vger.kernel.org
>Cc: linux-kernel@vger.kernel.org; Nas Chung <nas.chung@chipsnmedia.com>
>Subject: [RESEND v3 0/3] Change V4L2_TYPE_IS_CAPTURE condition
>
>Hi, All.
>
>I'm resending v3 patch series submitted on
>https://lore.kernel.org/all/20240604051120.9441-1-
>nas.chung@chipsnmedia.com/
>
>I have included a cover letter to provide additional context and
>facilitate the review process.
>
>
>v3 RESEND
>- Add a cover letter
>
>v3
>- Adding a comment after "V4L2_BUF_TYPE_META_OUTPUT =3D 14,"
>- Fixing a build warning in the venus/vdec.c code
>- Removing V4L2_BUF_TYPE_VIDEO_OVERLAY in V4L2_TYPE_IS_OUTPUT()
>
>v2
>- Improve commit message
>- Add V4L2_TYPE_IS_VALID(type) macro
>
>Nas Chung (3):
>  media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE condition
>  media: qcom: venus: Fix uninitialized variable warning
>  media: uapi: v4l: Fix V4L2_TYPE_IS_OUTPUT condition
>
> drivers/media/platform/qcom/venus/vdec.c |  2 +-
> include/uapi/linux/videodev2.h           | 11 +++++++++--
> 2 files changed, 10 insertions(+), 3 deletions(-)
>
>--
>2.25.1


