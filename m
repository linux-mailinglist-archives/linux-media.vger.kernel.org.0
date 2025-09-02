Return-Path: <linux-media+bounces-41504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC48B3F4BD
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 07:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A8F37A9A57
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 05:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19D12E0B77;
	Tue,  2 Sep 2025 05:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="JpaC5/v7"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021084.outbound.protection.outlook.com [40.107.42.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEFE29A1;
	Tue,  2 Sep 2025 05:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756791938; cv=fail; b=FGXbqfNUsS0oomciOm7zILVJ30KfGBRwJOyyVGT9Pdv71Lf4aF1uXj1CtyNUzcN2mwixvOAegYQt1Oqn/iikY44jBzg2RqO8zvfbWd5mZ1apMALGGy2s3oHCkybhoCbpT7hufkLKW7+Jj0PnJf2M5kzlGfEZv1dRkohP+biKIfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756791938; c=relaxed/simple;
	bh=wt+zK3peW2OPjv64PjQKX299nctbXRyf6S9bCr0rqUQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MtXKoSz+HjuJKVzzCGZtOVvcFqguzoTXB6IGqsIRzUFwXpHzU7hUH31H2Xwn4DW3dadmQRqhvNrCYYp2fMFH/D5Qx3+Ie87fRJJCvEWjeyr/i0HnCtJELYsRO+LvcfnunR5UHyXBWNqtXzb3qdKqk8Ofob2qoJVFeIG6XNol4HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=JpaC5/v7; arc=fail smtp.client-ip=40.107.42.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d73wsZVoxlZcOOG4Vqq+CD+U1MXvps6bSXJbppZHWTVjSwKKG8RUd+Ql0O8bmhUx6q5HDoAazwMAeC6hJRn11p3kH/kHd2MbXys9YzJt7RDckm5wM7Te+gEaYwBtNdEnCq48N2LrsxbP6yWwMcvfeur6bMzFNrFcU10bPs6Ek0BI0m48UbtdCL5l98IBILTz+EBRCVabFsWqTxoFAxZHWtw862vjrAo6osL+PFyPuqTZja/wsMmdFrtrsUZDegg+XQ/G38r/oADyCNc2x09wYRo3KRKUuuX/+f1Y3q/6sO9MFgQx+fGD/S/XrY/4aMtR6aDAIajALkbAW6QZ3ZiaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dn/PEicwtLNWSyGF6uAmBEgsKb2Yw1yFArxlRJ4odgA=;
 b=DafvbQJYo6/iCPICvLBDw4+Xe2vcSo1nMUm3jVJwDn6UCgf3fz+bj4JOv2Z9TbZH2ElmXbrxOhyo3UJux5dmDPGHhCTWZ0CKOseYDI/YuFvSdbh9EDYWYRo1xJy4OxkSm/CIyvcOxfleA+iAepR+3OSWZuPzusEoNfi3TObnoZlMOZ38v8hrO0tHab1aj/L0aw34qI4rDPWECtziu3GMSHpUfyiKz98VggZf9yDAKdWnw1lo984SAQhrYcipytiKFN7bXc3d/TqAxqxlgziyLgUPx1qA9t+8bXHVE09F3iBoEHIeCQ2NZBrIdOYpAWL8fFbmeAAonKbSCobnOEBEUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dn/PEicwtLNWSyGF6uAmBEgsKb2Yw1yFArxlRJ4odgA=;
 b=JpaC5/v7hinE31WXYUEICdXnDFU2scZ81Xi0NO/v/I0h8Mo1dMU85Cw/ygvR7pNTV4Zx/tB5zf+zoF2EIXW4usM8Z255+gn8opz4oAgvpjKb6X+ylK5qmxtUSRU7CpwB2UDn76vooUzTYk2Wjodel2pAnmZgxGp6Rvh0t5k+pGc=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PUYP216MB2972.KORP216.PROD.OUTLOOK.COM (2603:1096:301:158::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.16; Tue, 2 Sep 2025 05:45:32 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 05:45:32 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH v3 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Topic: [PATCH v3 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Index: AQHcGMGJZMRvpcS8k0m0pKjSJCiRfbR5qCyAgAWDqKA=
Date: Tue, 2 Sep 2025 05:45:31 +0000
Message-ID:
 <SL2P216MB12469B8A2DD5B2F6EA2F04DCFB06A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250829084649.359-1-nas.chung@chipsnmedia.com>
 <20250829084649.359-3-nas.chung@chipsnmedia.com>
 <22379203-94f8-468d-a9b6-de67f8fba495@kernel.org>
In-Reply-To: <22379203-94f8-468d-a9b6-de67f8fba495@kernel.org>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|PUYP216MB2972:EE_
x-ms-office365-filtering-correlation-id: 210e0979-9e7c-4850-b658-08dde9e3ee40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?X/exB1f/DFg9S+gyJLT8qS1AvW1YKyT5o7UiBL3/qIQJdWatMYIobdqgRUGy?=
 =?us-ascii?Q?BwTS91E3HEwn9idRrKhUj12GOEPRVz7MqCczusWWRFtMcnP50FFMi9SdtetO?=
 =?us-ascii?Q?ZFNDi7WNH33lxjAPJmmgRN5GDb28x/d1Ze3LoGufmNWdKS2BSJ5qHBm2DvEC?=
 =?us-ascii?Q?KprKmjjwM7g8YE2X23aDwfW10WITV1g/l6IEmEzX9EZnoMyB2YjkeEKb2PH5?=
 =?us-ascii?Q?/b+twklGpMKvQRJcR/BAJfezdNCBiAoAJjO0WND1rhSOC4Zcb+unDBSA5xim?=
 =?us-ascii?Q?2p+XrP0tRjxGA7qrFbqfpzLjZwDZs1BRA0gChT7kZYM/NY7t5LromtWpnmdU?=
 =?us-ascii?Q?1nwciwiNwIgB3NASjsZ4Z8lCuFlJoW55ZkcMvEA7rGxdvg8fpStQOJCwLpTU?=
 =?us-ascii?Q?KYDsiOw7wqNSIY/sgmv4zcXLqk/t8grlReLr2MD5Rd9d1QT1prPL+INV9q+8?=
 =?us-ascii?Q?Vc4JezFUKu9CGUcyxHhPUdBwV2WtXOpPU+j9y4fgMM7ffw7qiOTu3aY+B9W2?=
 =?us-ascii?Q?kOzkAJx8fUjGW34KG3IJj2hBiKXpfkJ23pGA2NYWsUOF5QY11c7PMTq72d4M?=
 =?us-ascii?Q?wZ083t2GCbxbzqHT5nUO5BqZU4k7NUYmUbxkwwkwoTjKa5khY0etLLg8aurY?=
 =?us-ascii?Q?/gJhAGAzoBtPuKfaOrJrmU0kAVJPYbs9YWKTP6c3V74whAw38n/BDUw+E9NW?=
 =?us-ascii?Q?Qj6BUuHyBBk7KPhBY5IaniTxFDjzRPqb0fQLISaCwbw6ce74i6bcE5ZgHfbv?=
 =?us-ascii?Q?xzMloD/CJklMCkzHkkze0QWa2GbZJm/IA1lvVLaoBXFYQdGpK0n4q7HHzwCb?=
 =?us-ascii?Q?JAcV1uWg+0fWRYMu/VK3PLYczxasbAyStSWuc80TkLjiWizQ10flDQ3ag7Eg?=
 =?us-ascii?Q?6BxQ5Ws8wivUk6Caeuul200BMglJ5Em7/HSSJAocQxLUbOrpOAARS28PtvTJ?=
 =?us-ascii?Q?38s2wU+gYd7dnjwpxul/3ngC+Zq6AzuAaTuZx1RoPEoYtS5lVkCN3nYSYDPj?=
 =?us-ascii?Q?oOK4ieDmGkmhekokBFJDwCRKdYJr6UYB6lzUcxmO0FDd3PAAT5ANRnsM40Hv?=
 =?us-ascii?Q?IYYmfeg8NK91JHAP6B31f5aFFRQZZlaqPc0UJZhy5kaW+Vk9hNO/xRchG0YV?=
 =?us-ascii?Q?q4n7e/V+nbR+0yUl6w3ZzuBKnDtVIH4kqh62wKeC8ELpRRMhJrj8vqsiFck2?=
 =?us-ascii?Q?+lg5KF5BQvD3NpsLLYDI0vRdIx4R+J21o3J7Ge8wDxoeVpX2rFdpIrXfvO1T?=
 =?us-ascii?Q?gcGpRSbCy3VaczgmORDZl4itiJaUpN4nshPtx4dyCTw/278aDqegXhujYucp?=
 =?us-ascii?Q?sKce5IMvqS2l117CYcMC/XCZFw/Ds7SyR/TPlulk5p65fmakA/LlLJUebED6?=
 =?us-ascii?Q?Kae3DbbltheLa0daI9I++tWAt0WS8CAAgcZPNrOjdtZnnQnkZ1QYcXoX8sPi?=
 =?us-ascii?Q?Dq2g5syh+AtlUazNj5YN8AwtjTkepDfBoMvt3wbwDpL2L1u+csn+Pg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SHWPdrtv1rWGzKyVYT2zjcxNOcJ1isCLBWBWkUDIqk3k4XqOAGwoWdTIQDQA?=
 =?us-ascii?Q?ujeo26mlaKTbG6EaIDIJ30whVl5TaEdqE9kLQKpbzoXdNkvSlN0bgbF7J7oU?=
 =?us-ascii?Q?gScusdyeu9tHwNz5MzQsRbTcEj25vd3bTQD5kGmJewDcItHPKvzb6X8fwIVz?=
 =?us-ascii?Q?/45Uj8TZYyfLX0hrbljvzO1nLAWEOa5sL4ipw7tT5WBm0rWTckohsJSwgaLO?=
 =?us-ascii?Q?D/BFopzlewWekOCJAbvH6EA8dTKj9XCKSV3VGwMGw7Q+QKjS1cFirbdnanvS?=
 =?us-ascii?Q?No6XSwuyuGyFnA0OzAxGt38i7jmDh4quilSSl+1IaUfDnCOD/+sNndzfLWSS?=
 =?us-ascii?Q?t/uXsSHbdG7G276wuvdPfF4vDei3hYIJwn57C9ezJKCcqFuOdXWxi5q25LSH?=
 =?us-ascii?Q?8KSNxfXTrKW7ayNmNIXsKgdFhgFTD0RP2WQHaw5e4CuWEQcsYVBGWvjWc+Zw?=
 =?us-ascii?Q?0Qbyxb/S7rUBq4G7eBI2y/i8ObE6RqvwkzOhWtYFrKFhOhtRqtlncdPW7fRl?=
 =?us-ascii?Q?SFY6rAGk8Ubqt0dYAVLuX5YrP7Y5+BQsz/flSBJurH+DK/HYmp9/vAl9GwTX?=
 =?us-ascii?Q?UGqKk4xrgXK6pyAQxcHOFBv5rWebzsBZ3C+kfKpVy0mi2nSpJdJg/2o2/7Wi?=
 =?us-ascii?Q?osuhJn46rUGBpKZthZhWE8Y7BIVJDBMp08/iQqJF3hSOTkGhRSHH7Kunrtnw?=
 =?us-ascii?Q?BwtE+9k0LvsrLrVaSKXHxWzynMSxdDdmJJx32d0ZvMeznTMWnyptCMO/Zhnh?=
 =?us-ascii?Q?Hshqfkh6N7MaNMqJyeRZI294KpqCLmMXe5/+ysQ85PVFb68WHJQsFWd84Mn+?=
 =?us-ascii?Q?9hMUtWt5VoCS9Skd+QCMRSFRUcpOfnUrEp8uAVH4FhtnG8S8rxNzV9VRFnI7?=
 =?us-ascii?Q?tvAs7sTSuQzbXc/Hfxi3ATIqjlvHxz6L5/BT6d6Tevc+nS5C6C+qizf6TXTF?=
 =?us-ascii?Q?1dlT2TkWo8twE2O1uWlzCATkn3fKpK3lZDsti1Ef1kLUJBu/tY+sew0UWOqZ?=
 =?us-ascii?Q?TLEUfXARTigqj+3dK0w8RBZuSKeXhLSGhlvqbcz7WxxF5N85j+tBrINOJMb0?=
 =?us-ascii?Q?HIbq5mYp441D3MYdF1ivbTFYL9+w+Hkkx5/YPFjUsFsFC6zwixEVlDvIeZ4m?=
 =?us-ascii?Q?fRf48q+mO6U72m+rw5HlfFtuByhs4aYVA7x8syx69fJ0FQkUQPphYwQe0/0Z?=
 =?us-ascii?Q?sJwlF9SioEZU4BMXDiCj23hOwKg5KFzFBzcdLY5IyqOaEZ3sLlE2NnymkBPX?=
 =?us-ascii?Q?hYqJOwg9ayxeJHJ3PdIKm0oGWLyASnElCkrzfxvehWBUOKT4zvGqB+HUaNm1?=
 =?us-ascii?Q?+ZVhqJ/kjj2iN1Bk3jI7MQonCycUV6kE5ZxOjh0QTksofwKFXVW0gYzHT/gH?=
 =?us-ascii?Q?xae2UOfIaH3oKi/6xNiV31aSxQg5eE0m8NFM1SG6IoA/+HFD+2xxZTZV7Q4j?=
 =?us-ascii?Q?r2ouXRpOJRUWmGdx5EGFvFCl/Er2nO8OWguiHILP0XEzU4xAZjQMQl3HyeU1?=
 =?us-ascii?Q?uVLq22M43kF27HRKsXkPssSo42ZpMArbe2yO8a1Bnf4xGbGze6ktu1av+Mz6?=
 =?us-ascii?Q?MXWs3y3Q2bANstdfTZ5JZD28TKKhhTjSw9ucUjAl?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 210e0979-9e7c-4850-b658-08dde9e3ee40
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 05:45:32.0294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MeQjeL0CmV8Z0adRBajuLTVFatnO3vPu2GfQdUbG4nWU8zMtNyUEyYt+j8pAZ/dvUx/J2p8fSlbleAZXgR4tfXyERBTyUs/VBDn77LQdvzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2972

Hi, Krzysztof.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Friday, August 29, 2025 10:57 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>hverkuil@xs4all.nl; robh@kernel.org; krzk+dt@kernel.org;
>conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH v3 2/9] dt-bindings: media: nxp: Add Wave6 video codec
>device
>
>On 29/08/2025 10:46, Nas Chung wrote:
>> Add documents for the Wave6 video codec on NXP i.MX SoCs.
>Pretty incomplete commit msg. Nothing explaining hardware, nothing
>documenting resolution of previous discussions (where is all this
>chip&media?).

I see,  I'll improve the commit message in v4 to include hardware details.

>
>...
>
>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nxp,imx95-vpu
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  memory-region:
>> +    maxItems: 1
>> +
>> +  sram:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: phandle of the SRAM memory region node.
>> +
>> +  "#cooling-cells":
>> +    const: 2
>> +
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 2
>> +
>> +  ranges: true
>> +
>> +patternProperties:
>> +  "^video-core@[0-9a-f]+$":
>> +    type: object
>
>Missing description.

I'll add a description in v4.

>
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - nxp,imx95-vpu-core
>
>Why do you need here compatible? Can this child be anything else? Can it
>be re-used? Is it actually a separate block?
>
>Your example suggests that the only distinctive resource are the
>interrupt and address space and that's on the edge of calling it a
>separate device.
>
>There is some tendency to call such "pseudo-cores" a separate devices in
>case of video codec bindings and experience shows these are usually
>fake. It's not the same as DP or HDMI sub-block of display pipeline.
>
>That's why you should come here with strong argument what separate piece
>of hardware this is.

Thanks for your feedback.

As you mentioned, I wanted to represent the interrupts and address space
as separate "cores". This is because, from an external perspective (e.g. mu=
lti-VM),
each of these resources is a VPU interface and can be accessed independentl=
y
to operate the VPU.

However, there is indeed only one actual VPU processing engine.
I understand your point about "pseudo-cores".

I would appreciate any guidance on the preferred way to represent
these resources in the device tree.

>
>> +
>> +      reg:
>> +        maxItems: 1
>> +
>> +      clocks:
>> +        maxItems: 1
>> +
>> +      power-domains:
>> +        maxItems: 1
>> +
>> +      interrupts:
>> +        maxItems: 1
>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +      - clocks
>> +      - power-domains
>> +      - interrupts
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - power-domains
>> +  - memory-region
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
>> +
>> +    soc {
>> +      #address-cells =3D <2>;
>> +      #size-cells =3D <2>;
>> +
>> +      vpu: video-codec@4c4c0000 {
>
>Unused label, drop

Okay. I'll drop the unused label.

>
>> +        compatible =3D "nxp,imx95-vpu";
>> +        reg =3D <0x0 0x4c4c0000 0x0 0x10000>;
>> +        clocks =3D <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>> +        power-domains =3D <&scmi_perf 10>;
>> +        memory-region =3D <&vpu_boot>;
>> +        sram =3D <&sram1>;
>> +        #cooling-cells =3D <2>;
>> +        #address-cells =3D <2>;
>> +        #size-cells =3D <2>;
>> +        ranges;
>> +
>> +        vpucore0: video-core@4c480000 {
>
>None of these labels are used, drop.

I'll drop it.

Thanks,
Nas.

>
>> +          compatible =3D "nxp,imx95-vpu-core";
>> +          reg =3D <0x0 0x4c480000 0x0 0x10000>;
>> +          clocks =3D <&scmi_clk 115>;
>> +          power-domains =3D <&scmi_devpd 21>;
>> +          interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
>> +        };
>> +
>> +        vpucore1: video-core@4c490000 {
>> +          compatible =3D "nxp,imx95-vpu-core";
>> +          reg =3D <0x0 0x4c490000 0x0 0x10000>;
>> +          clocks =3D <&scmi_clk 115>;
>> +          power-domains =3D <&scmi_devpd 21>;
>> +          interrupts =3D <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>> +        };
>> +
>
>
>
>Best regards,
>Krzysztof

