Return-Path: <linux-media+bounces-67339-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id roncLM3iUWoSKAMAu9opvQ
	(envelope-from <linux-media+bounces-67339-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 08:29:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE877409FE
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 08:29:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=DdgMwrui;
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67339-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67339-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0E773038A8C
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 06:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB48D33D4F0;
	Sat, 11 Jul 2026 06:29:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazolkn19011062.outbound.protection.outlook.com [52.103.72.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996552F39C7;
	Sat, 11 Jul 2026 06:29:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783751364; cv=fail; b=l+ewsHkezSllY7vE0YouHJRaz0FYTHZAGkXM+TPFPOPA+/RAZNdW1rThNpwxxURE345hIMTPd3EPeah+dAmBFtQvgHlbOaEJpKIsZTyhlJJ3Wj7i5H4DpD6XGz2Z4rq8B2WcWRehNNXUYKsj6O6j4lJr6u4+N/s1e+rdwSDIsM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783751364; c=relaxed/simple;
	bh=+rFPgefqZqjZZIZquL2KFjYCRzqu9PQdGYhQYyHFKrg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ii2PMKMcwF8lb++vWNBXJbMAny/iDxt6Cxx/Jt+7stSrXFqHbYacGx60vGxRcgGLGXAmfswXS6cSbGe+9QlJiKV4AMQlFOTHt+Rz86jBwuGFjKhwD9EAX9zHaST90lD2F9gaEjiZckzjsYYUgpHor+w9K1A5S9YTSV900Q79NCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=DdgMwrui; arc=fail smtp.client-ip=52.103.72.62
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2lm5CvzVFrQwSJuFaxSMe5eRyAxCqpQMSsCslWNHatVCch4I9xDZNSNBkt6uU4vpIU68EYd9mbI8q+oFhtzI9yCoakozTbHrNto+Fn5qu6DQ0KbuUOwAPo8w6T1uOU1LNTjH4Snm4ZBRL1ywj+TG8j2HWRjSywBhEJS0xxrlNXZoesuB0EWLlcSatVejTSg73FBnwZZgFOP4R6rA2QFExeENFZ89jB+8CV71LISgVN5Zu2M0/n64zu0kI1yorVZCpjyPLg0oyyEIw+HrmGyV+TYjWC/icH2kxXbHWAXODr4/EZFCenQM61e8WNVL3yh2EQ6JG6F3GQBws6hpYpGhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRCsYe1vHKL0HGwEPqPJ/5qLCeiJW3oeXAnmtnjWLHI=;
 b=rxhpI7gWK48P/0Lqdc4eLT0GN+bcRoAkFLSntqCzVH9vkXmSKQlvNZZqKMwF5WLZ2wlJYzA1Qxpn5a327D7m1L9VGhlc+NgQ26tN0EhmVYBa06rKDaYOCxPYrhOIZ63gkcTu3VQalkAXTQi7SY4ucaz12xX9qWym9XQr4JE+giBXEJFQtRQj0yDubWHR7P7dXK50nj8/36f0o+hVtka99+1V4FLN21y0HFzikVAxpXvZF37wNZqwUSqJnuVQrlvr1VG6Bxjk0y5uoKsOBuidoXKFmNOaGmYfApr9/Y38SGEVDbQR7CC0NL2trq/O/4RxK4Ch5E5Nd6l+XFdH3q/nOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRCsYe1vHKL0HGwEPqPJ/5qLCeiJW3oeXAnmtnjWLHI=;
 b=DdgMwruij5AWBBNYfAZaU0gqjMj1Wb3Sc8OJob4adTIPZB6FxY280k/lfGsWmy/Lh3CVy9PiPS07R7KQdAX0eVtNggCPJvQffF0lKR9F4ZvXmeSG2GmHsB0ugURJKWrD87sw2rekSjkOhdj1Bw0NXM19tRk6xvozLJ8WQBRjmZg6lN4AeOs2swNNnINHCsDr04l4ARYTJL8QiVNuFDx1v1kcbtCVCvusww6oEBY4jbHR7U5V0Vf1Yq3Rnlr56usIZ7W4QO5iuZXBYJbUGXG4D4g5nNFCLNSu6CWIYcsKwI3VXveeRl/Y2TC9ff6wT1gvtcVOsnIWnPlWeTLILmAPjQ==
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com (2603:10c6:10:1b0::5)
 by SY1PR01MB11232.ausprd01.prod.outlook.com (2603:10c6:10:369::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Sat, 11 Jul
 2026 06:29:18 +0000
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c]) by SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c%3]) with mapi id 15.21.0181.017; Sat, 11 Jul 2026
 06:29:18 +0000
From: Junrui Luo <moonafterrain@outlook.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
CC: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yuhao Jiang
	<danisjiang@gmail.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] media: vicodec: fix out-of-bounds write in FWHT encoder
Thread-Topic: [PATCH] media: vicodec: fix out-of-bounds write in FWHT encoder
Thread-Index: AQHc8ddPVnZTWJelNUKn769iCwnTPLZmqYOAgAFsmQA=
Date: Sat, 11 Jul 2026 06:29:18 +0000
Message-ID: <E129DFAD-D5CC-45BC-BD87-0544A5A4C2C7@outlook.com>
References:
 <SYBPR01MB7881C44480F77338B6A93C61AF152@SYBPR01MB7881.ausprd01.prod.outlook.com>
 <7519968d-920e-455b-a27d-97a2f1d0615a@kernel.org>
In-Reply-To: <7519968d-920e-455b-a27d-97a2f1d0615a@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SYBPR01MB7881:EE_|SY1PR01MB11232:EE_
x-ms-office365-filtering-correlation-id: 8a3dcf4a-8a70-42c4-47b6-08dedf15bc8f
x-microsoft-antispam:
 BCL:0;ARA:14566002|24121999003|22091999003|25010399006|15080799012|8022599003|31061999003|24021099003|8060799015|19110799012|8062599012|3412199025|440099028|102099032|26121999007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TWOQF1nIt8So8uDFlBDUBiejXZcG8wxUcaHeitLw3TTjIfmzrmcITAm5coi0?=
 =?us-ascii?Q?6WP4IZ7fqcXO/6kIOpKFAgQCA409KhmqeUesUIs/fe5EW9nBihuMzvAnLNgs?=
 =?us-ascii?Q?mXoo2hlx0+W1i9/8lvF//HFkuNQIzyZ6+RU9a9F8nfuOJ5WtwXfvJWgiGx64?=
 =?us-ascii?Q?PEiE6wib9nZtX9VWIGX8ENwF7T6jXQUhV9VbsgjWOM62xs+pqf1gXOwrvI49?=
 =?us-ascii?Q?xInAUfXCE40kaLyMdVanPR/rQ5OpxnbJYFKL5nCG9XFqitEEgzbLavOaDv8F?=
 =?us-ascii?Q?PPksF2sV4EYW7NZ9fj3M5p4PO13Vysf29sXgCPu5gS0uMb/fCSS/kC2pvGrJ?=
 =?us-ascii?Q?YXRXcdA3LCqUR1qGXqb5JTf/40VRQquLPqPV5JicPplSrkFTdrmIzMopsLs1?=
 =?us-ascii?Q?xF0hWaYDl3ty6Lu9GAOXYUk2fZe0ripe/5aym+zx3eSx4dJRx413VEajWjeh?=
 =?us-ascii?Q?/ZOzqZteYxA/PvgRrt63JERv9Tb6LzZR2WfuNXC9TfcFbog4gorLLxAhzsuq?=
 =?us-ascii?Q?W1Yf3bdLDQuwFbHkPaBIQiPEOI7yQwtC4tQ67ruSEqMrZRSJdHPN1bvBYtnr?=
 =?us-ascii?Q?IN4YWN630tD5VnB2HYI4X+ufgQ/8h6ap7Q2L6bR0/H0FYIh8+UD0lW03tzR8?=
 =?us-ascii?Q?7Ngdlxw2FDq9FOauh0c0bkL3t8uNDJtXmrU5nPcnpfvbhQPmmHlZ9ycBsYKs?=
 =?us-ascii?Q?nsEhGHI4UIU/YX44DenGD7oF6A9naSP9O8ljYQEA98tdmJcL9pGIAzTr4tCg?=
 =?us-ascii?Q?+cZEr1vLwYKHDDHIZ6FNLx+MR+tXl7H1+KRcQFJhpgrE0g0JegVN2h3F5eVE?=
 =?us-ascii?Q?SMqisiTmPY8aPNInUDQVY2brIE/CPysM8O64pLOiLasiY5HFRUMQg6mV8795?=
 =?us-ascii?Q?Xgc7S/CeswVyW6JhcuqeDnXuNjJ1pw70apzOorx7ynko0lx134q3y8erl9Db?=
 =?us-ascii?Q?e0ZkljtSQGHqasWrzCxsjpXpyDxJFwGh6m/fzWcFUm9bRaHW2KHfpBiam3lP?=
 =?us-ascii?Q?h/1U?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?g3QIhLf+2TvXdsBKBk3tgjxVsb28VhW5rDRMyVGGDzUTdYnxCexa/lyuygVq?=
 =?us-ascii?Q?HF61sXX+9Wl1cc6kvw5frGIiMyqxKU7WHCNiCmGdvH3SsF3apvN7wqnUIsLE?=
 =?us-ascii?Q?UmEZvBVqLMF4lReEn4QYWnDKeL8CxlO8GxC40ch6ZBdQNzLjmGNEbAcELOPz?=
 =?us-ascii?Q?lRtd2kVYCyFvDE2HTWsT+ZYhftjgEIDoa58PIVl2hta+vfAYl+jpi4W4mujj?=
 =?us-ascii?Q?isw2yRdh2Eu0Vf1W+wvXI+ivA3fn9Ej42jp5MdAwVIHOEGqoxR+HXYg45tCM?=
 =?us-ascii?Q?MEgz0EoHSnXIIwVsWexGlG1aj5B3PhkozPdJdo1sIivM6v73tqCb/NLmzLf2?=
 =?us-ascii?Q?9LbqAzqes5uB7mOBDTXxAI/JqUU4vNXsyPaYopWr96IhTiR5wyaGrbMyI/UD?=
 =?us-ascii?Q?YZaEu23OdlHRW1Ej1pIlsPJnjeCHDGL7MYQEHnOewqQTuB8Fp/qNfEOqe5D4?=
 =?us-ascii?Q?tV66dvrsCotQ3bUaAuHBbTkTthNzcjXEUHu2ECOjPBux7gjddBXshrbAVp+q?=
 =?us-ascii?Q?GnivlWLv4IWMP+RXx1EnhkB/tuc8KzgxXvUZwr4fRoZDnUp9StbUmL1uuqzG?=
 =?us-ascii?Q?ZJ+m5QM7zo0w5mkfHIVM6en7oKBmhDejhpAFBs8bcGcbRmgBBGrZhqQvdrH/?=
 =?us-ascii?Q?k307cNmRRCUETlb2L3rNQGSJhxt/d203GbwkFiwP1YezWnYbVIvrkEpvWt0k?=
 =?us-ascii?Q?xJ5ufX4NtDW1HkXj5DnFA9aJKLl9iVelIicsKgM4lZRH+2dhQmz/LqjkX8w5?=
 =?us-ascii?Q?AAEuVqc7YTU/25EJWzRPYgS6CTkQGJw8vlE8XzLBNt83Hkr/G6MEyZHl1FrX?=
 =?us-ascii?Q?j4kogZdtDKqnKDCtpIPPAEvaX/sGDdsieYaLsUgE/mkHTfq+auTSednUPfqq?=
 =?us-ascii?Q?/K18KeumUuG8BCQX1AABBJ5swqf9s05lpvWqPQ91MA6tcPT7jVuLRpgpkO/F?=
 =?us-ascii?Q?cCyUL9BkgJGAfVl8zeHEJp74cssZ4Qn7RmZkKyVA60W1Ssl7oRsPrYq6EAA0?=
 =?us-ascii?Q?hXtTw2Czc4LrGf6CrYfI/QD0/Q4ofrAk6G1eCh0cWOw290yyY7algNnoNJtc?=
 =?us-ascii?Q?1E+RcajiTclVi8aelsEGyu34AmHYeeooFc5zSC5443QtrdIdVRXs+M0tI4Xj?=
 =?us-ascii?Q?i6n2gGIo4wggZXUIVsuuzGNxMAASQnHpcU4F2flHPGq0MElQsxYq00mmnz7z?=
 =?us-ascii?Q?WFPylBhJLxs8byJNuWBM6sPIAW3GTdn9Zf0gMCB3Vnwlpf+7X6dlY9nh/b3C?=
 =?us-ascii?Q?j2892PkcVm3bkZhC5OxB/uwuND9FTPsZ879Rg1uglb05S8HMk4lrfzrbzCoI?=
 =?us-ascii?Q?EF8GgHwdZ9dG2XXWPZfQSFQ8iQjEYMjMqyZveBX9CA3g8q5oMsvwEY55ntn8?=
 =?us-ascii?Q?m/9AAiSUVD0VbfAz5NpXD9/seRArXgcB/vqnSh4FLKjotdP3IA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4BA2A2C40363474196EE8E49B4DE54BE@ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB7881.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3dcf4a-8a70-42c4-47b6-08dedf15bc8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2026 06:29:18.3614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY1PR01MB11232
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67339-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil+cisco@kernel.org,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:mchehab+samsung@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:danisjiang@gmail.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[moonafterrain@outlook.com,linux-media@vger.kernel.org];
	FREEMAIL_FROM(0.00)[outlook.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[moonafterrain@outlook.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media,cisco,samsung];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,outlook.com:from_mime,outlook.com:email,outlook.com:mid,outlook.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FE877409FE

Hi Hans,

Thanks for the review.

On Fri, Jul 10, 2026 at 10:32:09AM +0200, Hans Verkuil wrote:
> Actually, it's commit b40dc2bf3581 ("media: vicodec: add support for 4 ne=
w
> RGB32 pixelformats") that introduced this.
>=20
> Please update the Fixes tag.

I traced this back a bit further. Commit 16ecf6dff97c ("media:
vicodec: Add support for 4 planes formats") already added ARGB32 and
ABGR32 as four-component formats. Would this be more appropriate?

>=20
> > Reported-by: Yuhao Jiang <danisjiang@gmail.com>
>=20
> Where was that reported? Is there a URL to the that report?

It was reported to me privately by Yuhao, so there is no public URL.

>=20
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> > ---
> >  drivers/media/test-drivers/vicodec/vicodec-core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/driver=
s/media/test-drivers/vicodec/vicodec-core.c
> > index 318e8330f16a..3ff2d06742c2 100644
> > --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> > +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> > @@ -63,7 +63,7 @@ struct pixfmt_info {
> >  };
> > =20
> >  static const struct v4l2_fwht_pixfmt_info pixfmt_fwht =3D {
> > -	V4L2_PIX_FMT_FWHT, 0, 3, 1, 1, 1, 1, 1, 0, 1
> > +	V4L2_PIX_FMT_FWHT, 0, 4, 1, 1, 1, 1, 1, 0, 1
> >  };
> > =20
> >  static const struct v4l2_fwht_pixfmt_info pixfmt_stateless_fwht =3D {
>=20
> It should be changed here as well, otherwise the test-media regression sc=
ript
> in v4l-utils will fail.

I will update in v2.

Thanks,
Junrui Luo=

