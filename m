Return-Path: <linux-media+bounces-28322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7738FA63882
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 01:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60A3D188E577
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 00:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A3C2F30;
	Mon, 17 Mar 2025 00:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="D62g/s3y"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021102.outbound.protection.outlook.com [40.107.42.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DDF7E9;
	Mon, 17 Mar 2025 00:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742170364; cv=fail; b=azjfKMf2gFHv87wHOzjtljU0hIg1jcjs1w9gPAFK6mxhU13pg5ZJGYgY2X28xiy6SV3LbDYg1QMZaK8vuuZ5vn/Tbg4bg8lzNdAQpWDV7q4bDqC1YYokp1xGgnppBmscijHFegFlk+u6qHA50s0wXKiQgxqx0GdMROBJhRIIOUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742170364; c=relaxed/simple;
	bh=Qbk+kAjmb1iYe01wXqTFYleEBZDKAtbMUgoyCvC5KKQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O0wkgqX36tVZaBpwIBlEx+r2bcnf4c9bPljwymQYbjOO54wZ7/dlfWjnmIFBxjTDF+OQ9wqBIDIGuajoJLJxVcwpJFb+VOFj3VPChGHy87NcznTUSZYjK1ip+gcMjYEnlMy3jzfa5ycCU9E5OzQchxhDVmy/1AnM4hBsej9eYHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=D62g/s3y; arc=fail smtp.client-ip=40.107.42.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYOrRHvTP1TAMMHxdd7rRUHfHa00lVrcIr2SOnXHbF6BBV1ftiJVNw3rxGS3XrXUxx/r5R1UHPOFfG6DbmyqgzpyI9VLb0hSkd1PFhf8RwBeUyKngkbmaF6RP22P81Nry18pk3PrZ4MVAu/psqWJJWjck80atXgdzwm5UazTRDuCe59XTJvMWFBycg9RGb4tG3/z74wu746LKqJ6xriqF7cQHe9ylWH2DBqW44eseeKKX/kh/KyIRAiv98Fjtwv0ae7rfp9zxGIrLR665GbOSqL5hrt6MVscJaioW+VdPYP8DgDJkcZdGkeSGHnL6wc1rIZBvE449EveplMwfRZfnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kr+/t8WVI9fZgZa3nX9W5ZMrNgRgBWyLotYBcDP8lVk=;
 b=tmGJCWn0VSEWYmLoTfcABSjXnRS5Y4eZ/M4/eEmdg45NF5ETPVNPhoNqtEaCpbgGfBT870/34SdYrTOWb6cnPUJY0nJMIoS4RDvRm4v5tXX8MiXHUEs3ylGTjGHqxq5QM/crfI+2P1/JYL8tJcPVUsY77/TSkt9WThY4qSZjMUvxWFb452q2ZKBx5ztfG0oN2+4qdzss4qFAZag3CBMvekUJh2on2XgmEXHv4Ngu/IwY8uEUWla1pkQzigfdx+yxTAXyRDGbncldOWiXsoJdfx9gh7+zqBAqJ+r08roj1tHZqOMc+aFZ7dYPyRrDO/hiIrsXB6j9yWKeCSrIIeu16g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kr+/t8WVI9fZgZa3nX9W5ZMrNgRgBWyLotYBcDP8lVk=;
 b=D62g/s3yFx/ngWPRuEvRdIMW6b9VnPg5wXITc0I2yBY0+YsbsaillDPp3ewwhBcIA3a7l2bdWU3mq4CPP/wA8b70DbeWGKjSueQfGnDSwangUpDcAR4lC1fHHvQvLHSDldd5mPFt46DvNnEdB7RaklLsnbX5OEIv+ElxAtMdFtQ=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB2866.KORP216.PROD.OUTLOOK.COM (2603:1096:101:282::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Mon, 17 Mar 2025 00:12:39 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 00:12:38 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Sergey Khimich <serghox@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: RE: [PATCH 00/18] coda988 video codec support
Thread-Topic: [PATCH 00/18] coda988 video codec support
Thread-Index: AQHblPXyB80+UIHWeUmToYZYhD0/8rN2d9IA
Date: Mon, 17 Mar 2025 00:12:38 +0000
Message-ID:
 <SE1P216MB13037B97F714AD1B5BB63BD9EDDF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20250314152939.2759573-1-serghox@gmail.com>
In-Reply-To: <20250314152939.2759573-1-serghox@gmail.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SL2P216MB2866:EE_
x-ms-office365-filtering-correlation-id: 9b151285-0bf6-4ad3-2f4b-08dd64e86d7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?pVDqFeO6Tsgr4YTGKBUulNdu2WolVkrD85AJGfYlf1MLf9++0My65FDvV27D?=
 =?us-ascii?Q?KT06yYXacXf1s2ncrgsLhrLe05ACtPSxL5haI9zQSI+pJWd7PbQwmJF6fL8a?=
 =?us-ascii?Q?DDzfB8kY3aXo0Rb77aukiqKQftHT6lxPTYLYCCxJnMFIQVzOJBLQQHaOSd8o?=
 =?us-ascii?Q?rjJI9i34hCnxP6twdV2NokeMuudRb4FR1TyhirTwV8twBdURJ0rPPDzicvnL?=
 =?us-ascii?Q?eVwMC1dInp5tUwlgwgH64z8crrWfPiMvznKDGCZR+3z7O4KrC1jQVnpZWXcP?=
 =?us-ascii?Q?kW1fvMu9wvQPXA09IRZhlbMz7eD7fyGA/41fhRmFDZ/YZnS3VsrmKY8vQi3D?=
 =?us-ascii?Q?rYt8ipo4ekE5EChejuo9fSnhn2+xIfm1uX+eELAGoyA4AMxQhGPpaSkwMDdl?=
 =?us-ascii?Q?c2k/DUBrrU/7dWYn4Mf4ks3wGRI20AY60sRKTtkp6THwhchQBRwD48vzg685?=
 =?us-ascii?Q?0Wy9RyIJ9G974yk1t+dYyhnSgXROu7/wjBxj9ybX7BbIwnRfrSSefNSObZI9?=
 =?us-ascii?Q?/K2KqIzwu0op36xmgAk2EbHkHUTrKSH17b0uuIZ1PE223iwL/vUOVr5pKngq?=
 =?us-ascii?Q?3ZU3VFPIAVoyuPV/k8ZeSJ40NLf4YGD6MIkYJc3LfOvx5M64VpEl7p8LFcs3?=
 =?us-ascii?Q?dyMvPziqXwASJbgFxcShGDzCF2GpD+wloKNZxIBqzqnxpDsTxkUSMQo+XMt0?=
 =?us-ascii?Q?ByfnJiJpKbTVM+39LD84yc80yOIr7OKe5ihokZ0qol/88IubTmZs6DMAonCd?=
 =?us-ascii?Q?WeKH7Uj8+j+ODYcWmHoPUuTbGNXfp2+YQ3DsbTdqMyB5hyj2u6linU38ioZC?=
 =?us-ascii?Q?vPkskYiS0IlUL3cnJsdo4UAWrTNievOC+UKMiNcSMTURnKqjDOJUVsAwlizm?=
 =?us-ascii?Q?Z3LRDQJV+u4nx9liTi8D3ydQJyphkR5BDZcKtWEWKqEmVFzx9vTvSjVNICqO?=
 =?us-ascii?Q?07iKAEI4IYcHes0Njq2ny4vhFCPkVwc/smf40RZEyJTLY5nDE/GhR/IZtvuK?=
 =?us-ascii?Q?w+sdhnbZGvTabh7bZI5bJ5qoxvR/mmETKL9fxIIRt8UlMnzc0y/nasMkO9a2?=
 =?us-ascii?Q?c44DiPFYSsMREuCt9WUoxgm1tUPyMOnrL4lVi1Ht8pVYahAQ3x48XedL0nug?=
 =?us-ascii?Q?l0pSrJFeJS3S9BHxf/eT0DH5jTqk+XOs13GCYbkNX9lbneK0MwfXy/UoVSN1?=
 =?us-ascii?Q?SmxR8v/8QTF6f4NHXotRcbDDltvhsyviRfkOwSLooKZ64RzkJgY8MdQBUsHm?=
 =?us-ascii?Q?fVSnbcjLNbqJO38zO1F2361T7PESUq0rkQjeVrLgNfBYEM1gckMk6TbKkkSk?=
 =?us-ascii?Q?vsX4WgP1ZFP8QFaFPcfzSmJHNETo5gpUkdWar5d0CRozTOmobn5Gnvq7LXBl?=
 =?us-ascii?Q?uRkEI6EGTpZnE4I+IakYcQzJnurada09tqVC0yePApZ68DsNXIsAafuGGdZP?=
 =?us-ascii?Q?zq210nvBfT5OxlXhnn0wSdXOkYuOA3kD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ROQ/rcb6oj8WGe/s4g+UkRfMfzZBSr+IiS9qiA6tPx8jhipyW90iR2EYfcVN?=
 =?us-ascii?Q?1S47x+swgn+FVU4/PYUJWOfCagZTkv2OosCfe6O3CaRMc480uI9Hp/8KTgMw?=
 =?us-ascii?Q?W1nTUVPkmMoXCJKdu6JFWZd8SGUiX39LQ9MMeV8LDns5aQIW13lvPNIYDPxp?=
 =?us-ascii?Q?eWkoCf8V50PWYZm1fyPGQb6IY9aoBKKM+oU/13k/SDJk+RJ+0M83waKLKdP0?=
 =?us-ascii?Q?zr1YxnRUCtmTMrMLQfnDqWYH3UANlG2k3TcxUdfRu0BQELjk7BLeOMjlwlxi?=
 =?us-ascii?Q?IgUuoqmvxdToh21gJERV4q4jHum7A3Ggzm5cHX0ef9Kw7nC43EpiPwezuc+c?=
 =?us-ascii?Q?LthozVf0LEwgP5zIGlBqFejtTVtZy7ZOwmVxfIsZOXGaNgIG6SHLeSoPsytv?=
 =?us-ascii?Q?yl5Sf4IA6vzr/mIN/r6hSfEq0fJAmyzefYfXSpMJ77xHfCLy3p6eZNCAt10k?=
 =?us-ascii?Q?loZ6e37pf+irt7DNjIMg70Yuv1gokhqYTBP2/5TO7eQ2Iufb3NWrfd8WyhLi?=
 =?us-ascii?Q?NyfNgzOcaA8ken4XuBhn5ne/wJ6z8I/1NaLjXLE2SsD++VI5hpntUR4qFd4G?=
 =?us-ascii?Q?3hEdsU0Qlyz0wukye+a1fpd32+kwGGAf+lkziCs390MO2NPMuziRKtrsbuXt?=
 =?us-ascii?Q?3K+qDfXcOSjcjL9S8UZRWbJ0db8t7kPujw1O0+2pp2Wm6l0K9ds3ZcBOFd1M?=
 =?us-ascii?Q?7NuwiPY/DIRXQGe0qNFySIA8nO+j0o0N+WANSpcv43JydGO7F6TqJaNb7mec?=
 =?us-ascii?Q?/gWXpyAuT/D12r07HoFQkpdEm3SgWzrtnWBUXudBg/o5jV8VxPV1btFEZ7Hd?=
 =?us-ascii?Q?MwLsY6Rm6lfBCzmog6GbJS+OLa1BaRn68EGrUvpF62nczYtJT8/DkRTDoeDb?=
 =?us-ascii?Q?aeVfU7MOZTA8PhXGljj3cQPhngfJG9Btszjmuqk0jLWc3KM6jG7TTkPV4GXR?=
 =?us-ascii?Q?W4c3KtOWOhezoe6625NJ5zeIoRfFWInxZd8gC7sn0eHyrthmT3OOutUhy1Ys?=
 =?us-ascii?Q?Fklm1WOyCsOIi+I2n8NIeBTEyF3U+IPm8oYrdJZ3/gUfw9LQExbwIclbsbC1?=
 =?us-ascii?Q?/k7BoK1HjdXy/BswWPrsIleEsk7UPC5d6pEivIy5TlLiYA0cKoKkzzR0jPBj?=
 =?us-ascii?Q?FllrX7k92jBhVhty/fwNwI0J6xqR4EwbwguOlqg8R+ZSwlLC4ps9nllYht1r?=
 =?us-ascii?Q?tipWrdfvyfZAsskzTs4QdECRP7jghQTV8pxXEyguieTIWqOeGKhYIFFwJ57r?=
 =?us-ascii?Q?JffGUnMaWpY1jjBBjAz/ASWzbxqTXS/8H1Fu1f9yNJqRHQNn5Z/G+Enk6H4U?=
 =?us-ascii?Q?Ag657K8ex9wjrEtXBCPk0psY096bdaKRzzQVhJb0x5HPK6wDys5aZmTJKldW?=
 =?us-ascii?Q?HJcrSpIkHXTzMmBjGXz0EbAax5Q7NwRF7jNeTh8ifN/brn2ok6ou/QE980e7?=
 =?us-ascii?Q?to1c6uzFnmlUMS3vE7PB8MfpjIUj1HTj1Z6Ygdc5Ndh7IkudbuIKoOUFA+Dv?=
 =?us-ascii?Q?Dpdrkxq7KmpcCjTW638gmxdjeS96Ri5EeYVG3tnVHUa9ytFInay+CHG9IEbx?=
 =?us-ascii?Q?pBARhg1/E3uJ6VgQzkyUX6bHiF01zPJtCgLG12zjmvsP6nX4j3XctZMArwwR?=
 =?us-ascii?Q?gQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b151285-0bf6-4ad3-2f4b-08dd64e86d7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 00:12:38.8231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ytxs6VlEkd/qL/wk0H8IiQhUngHUMqWl5xuuAln8VgH+b03KIhSOVvMuxCp0Zo/Z3YH8yNf70TZwg+xcrPe4jUj9oInYAK5eR82VgKmqgiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2866

Hi Sergey

Can you share the result of fluster test for h264 and vp8 decoder?

Thanks
Jackson

> -----Original Message-----
> From: Sergey Khimich <serghox@gmail.com>
> Sent: Saturday, March 15, 2025 12:29 AM
> To: linux-media@vger.kernel.org
> Cc: Philipp Zabel <p.zabel@pengutronix.de>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; linux-kernel@vger.kernel.org; Vladimir Yakovlev
> <vovchkir@gmail.com>; Maksim Turok <turok.m7@gmail.com>
> Subject: [PATCH 00/18] coda988 video codec support
>=20
> Hello!
>=20
> This is the implementation of the Chips&Media "CODA988" video codec
> support within v4l2 driver for coda. Support for the following codecs was
> implemented:
>  * h264:   decoder & encoder
>  * h263:   decoder & encoder
>  * mpeg4:  decoder & encoder
>  * vp8dec: decoder
>=20
> Support for the following formates was implemented:
>  * yuv420p(I420)
>  * yvu420p(YV12)
>  * NV12
>  * NV21
>=20
> Also the following features and fixes were implemented for coda988:
>  * special config for mem_ctrl
>  * special config for encoder header (sps and pps)
>  * special set profile_idc
>  * special set RC config
>  * special set QP
>  * special set slice mode
>  * special set Motion Extimation (ME)
>  * v4l2_ctrl for h264 profile
>  * v4l2_ctrl for h264 level
>  * v4l2_ctrl for h.264 RC mode
>  * v4l2_ctrl for h.264 skipFrame
>  * v4l2_ctrl for h.264 i-frame min/max qp
>  * v4l2_ctrl for h.264 p-frame min/max qp
>  * v4l2_ctrl for h.264 entropy mode
>  * v4l2_ctrl for h.264 8x8transform
>  * v4l2_ctrl for h.264 i-frame period
>  * v4l2_ctrl for h.264 Access Unit Delimiter(AUD)
>  * v4l2_ctrl for h.264 me x/y search range
>  * v4l2_ctrl for h.264 intra refresh period
>  * v4l2_ctrl for h.263 intra/inter qp
>  * v4l2_ctrl for h.263 min/max qp
>  * v4l2_ctrl for mpeg4 min/max qp
>=20
> During adding support for "CODA988" we also did some extra work related t=
o
> refactoring and improvement of generic part of C&M coda
> driver:
>  * Improve error checking for probe, irq-handle and etc.
>  * Update work with resets
>  * Replace hard_irq by threaded_irq
>  * Remove double setting of stop flag
>  * Improve some prints
>  * Fix loglevel to avoid performance failure
>  * Fix support of MPEG4 levels
>  * Fix setting gamma for h264enc
>  * Update default velues of QP for mpeg4 I/P
>  * Other minor fixes
>=20
> Sergey Khimich (18):
>   media: coda: Add print if irq isn't present
>   media: coda: Use get_array to work use multiple reset
>   dt-bindings: media: coda: Fix resets count
>   media: coda: Add check result after reset
>   media: coda: using threaded_irq for 0 (bit) interrupt
>   media: coda: Add reset device before getting interrupt
>   media: coda: Add fake IRQ check
>   media: coda: Add log to finish_encode if buffer is too small
>   media: coda: Fix max h.264 level for CODA_DX6
>   media: coda: Remove double setting of stop flag
>   media: coda: Print size of encoded buff in other place
>   media: coda: Fix loglevel for seq mismatch print
>   media: coda: Fix support for all mpeg4 levels
>   media: coda: Fix handling wrong format in coda_try_fmt
>   media: coda: Use v4l2_ctrl to set gamma for h264enc
>   media: coda: Update default velues of QP for mpeg4 I/P
>   media: coda: Use preferred usleep_range than udelay
>   media: coda: add support coda988 enc and dec
>=20
>  .../devicetree/bindings/media/coda.yaml       |    2 +-
>  .../platform/chips-media/coda/coda-bit.c      | 1114 ++++++++++++++---
>  .../platform/chips-media/coda/coda-common.c   |  430 ++++++-
>  .../platform/chips-media/coda/coda-gdi.c      |  149 +++
>  .../platform/chips-media/coda/coda-h264.c     |   10 +
>  .../media/platform/chips-media/coda/coda.h    |   41 +-
>  .../platform/chips-media/coda/coda_regs.h     |  157 +++
>  .../media/platform/chips-media/coda/trace.h   |   16 +
>  8 files changed, 1703 insertions(+), 216 deletions(-)
>=20
> --
> 2.30.2
>=20


