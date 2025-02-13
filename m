Return-Path: <linux-media+bounces-26108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDC9A3393B
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 08:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 700D83A1CDC
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 07:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B7220AF78;
	Thu, 13 Feb 2025 07:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="bRBZzs7F"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021113.outbound.protection.outlook.com [40.107.42.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B218BA2D;
	Thu, 13 Feb 2025 07:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739433060; cv=fail; b=s2S5R8D7GRSh52Ay2qBmVAQHmm1BBkEbf6SvNMd2bmhOzlJWRTD1oOrI18+VYH7kedZ9wl7Z3VSEdSO0pe83vKVqaYBPDD5Fdo3hFpJZMQq9lI0S1odt53heK2hUFoR9NO2bN7kSlr4HG3mC/GE120SQ0N3VA0457LlQ22ebD/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739433060; c=relaxed/simple;
	bh=ojcx2G4dWgwaahSV2WOpuzsRpcDtKKh9WAPblfLWATI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DaGh6tNGu5CIc3cOpoZ+yBiGJm75HJgaCfJ6D0z35IDu+CJT0drtUsGSIvdSVuuHmJJmZcqmbrvol9O7SC4s9+Ib9FKTVP4YUC4BKgST9OULAeQeBZagHdJCvzmY5K1G8VnyhDIajwiLqi1A6OMyHIYQZwmdJ9WStFZJTnPrVm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=bRBZzs7F; arc=fail smtp.client-ip=40.107.42.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OBDK0eZgoFH3/pmgW8Si9SySOWU5otzWOf0iYQf1hNn9iaCTn9NkLZxwZvzO0VZZRO8pU1Tr3KuO2FKll4NC+OmVZJNJn8JsvNDMhQztr5xmtkPmdFdpgi6Y1t9OC7vbkzEK6MdJ58qtJ983vdOS7yDKpeel8mIYVn0D4WoNwTameHbBSc8jgD2EK9snieLzJEKnJXnxTnG5wnqhGafDtu79OEGLiL7/UVmhmmHNXrDnoeu6mB+DJHZu+aCWbt4pIz7OZKjlODKpPV05A7O0LKohzikiXiQ9UtG4ZwhIe1s5aVZomX5OeHFB358llPRzmRbFbCu/EUtB92MrKsSZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTanW3zIIQmvC4j2C/nRfh7sE6RmQkqFN0AsOX7Rutw=;
 b=dJ1hHlJkJkl+Vei/uyDA0HFBmyHM8tEIUR14wstakn34svmzMa6AjbgXdgDI4ICnc7a2aTI5mCYOoXWxd/P3JbC9mPhpXBcMPwRGoAScF8saqAaPxECVUzjZjJtaB6TRKdYRgaO38gii0APXdOnkSnqBcQ60Skojxq+hSfkaCqUgcvAoCJjjKSuExYopHr5Kl/vbahxUu2Wqcuc3/su2cznghkz/y7rr1r4j/OuY6/Phy55JzXwzsAK2/C/zlX1XzvIYWew+44b+6sVBRwjyDHDkJZgyeMubMzezT3Gq20UuHKBF+fv9CPwXzI7fuIP5BDgUoLzdBQYmDnq6DAqKbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTanW3zIIQmvC4j2C/nRfh7sE6RmQkqFN0AsOX7Rutw=;
 b=bRBZzs7FS+NU+sYm7Uqa5rQeqw5ugFH1C2kh7B4sbs1kmSGI8Xl27EZbLTH8VASJU/HAdHOnWjhfAa8TrsT7WaIoXYRh70BMfUjsmrrZDYkl6BOxzMEGKuDUhYg3uzSI+WpbaTc7ilfNu/KJa9wtXdXVTpPdX03ZCvE5VT4vJZo=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SL2P216MB3082.KORP216.PROD.OUTLOOK.COM (2603:1096:101:285::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.16; Thu, 13 Feb 2025 07:50:53 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.8445.015; Thu, 13 Feb 2025
 07:50:53 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec device
Thread-Topic: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Index: AQHbe5s5kWTieORPDUe+7mHQ8+wHLrNAy9aAgAPWD6A=
Date: Thu, 13 Feb 2025 07:50:53 +0000
Message-ID:
 <SL2P216MB12460EDF6265459D11E2A5A9FBFF2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210090725.4580-4-nas.chung@chipsnmedia.com>
 <cb7937f5-2045-4903-825c-71ed70097efb@kernel.org>
In-Reply-To: <cb7937f5-2045-4903-825c-71ed70097efb@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SL2P216MB3082:EE_
x-ms-office365-filtering-correlation-id: 878a60a2-2e49-4e2d-9f42-08dd4c03246e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?y8jK/t3WltPDfSx3u/UVkXgP3O95xX+pSise//PChL7oEAK8gzGwDqKs9qhn?=
 =?us-ascii?Q?8XzySAFrkbnJ+67DnwHj0r05NPnLVdC2PYBnGJFLWiB5PATRwZ15TUbL318d?=
 =?us-ascii?Q?jeoOV9dh+Ly3i7a4Cwz1gnp8Va9xLz7awxjVdAlpWxxleC43IPrJs6B2viId?=
 =?us-ascii?Q?5CoEdnwnZf9VD99Pt6/1N8kPlRDMVzszHYRUSdZvjqPLOvM3tz7LR/oSOn9B?=
 =?us-ascii?Q?SuUDZsPXW+a1EOZfXs7IL46nlj5zOifRSilNKdE+b/cjTFMR7fLFzb/TRkuf?=
 =?us-ascii?Q?ywgUv/i4QWU/76RgFonXla0+GMAb0K27TWjhFWmX8CdzvEKhIaNIQGL8Pr3o?=
 =?us-ascii?Q?J30QG1oaGwl4IoBV88DOdIeS5nZNUTfUBvh1r1vB8Oj3tQJqxatLRx1Ow3RC?=
 =?us-ascii?Q?S+lMO36aqEVlxporQ6LIg5IC2gn/BviuNVU3+1l16sgLqpgxne9ZzdLllQYK?=
 =?us-ascii?Q?2tOSqnJ7QjLxic1Gh2n9SZE8aLUiBghiFOOK2c6LntkVIFOsqMqwCe+/zirt?=
 =?us-ascii?Q?KLXLC3nsFe8fhDSn644OuGr3n6zkdMgQlZr9/03XyIeLjPDNKJThuGDSt7L0?=
 =?us-ascii?Q?GRLWzjhx0Oh0c5KU0mI0m512fvZVhDeK+v0Y2tvGXO7EKkzGpkXACKYV33SB?=
 =?us-ascii?Q?h88jxIaYpwlw9eRFWzk429PPtsuWdOGUMb57MTpvrDSu49Vy3OFv3jWqoZgC?=
 =?us-ascii?Q?htVDyQKUPAlHl7zrM2lMovFFXh+FKIYoKv15HINx4V2+4R9Z7CNjvfYuaAYi?=
 =?us-ascii?Q?IqhyDpz9hMc8NgSLhyhhOdD8sIwTdl6AVanM4lEejkCOKH6ZnhfWFopI3rwT?=
 =?us-ascii?Q?IvXBvWriMuY4XEku4STmobpdA15X037NnRYH4ZvI9eZaisQRSskgMjjVp8ib?=
 =?us-ascii?Q?h/kHMexKTT5dQuOsXUNFb0jUj/mS72UhhOsxZ6vB/w4yW+iX3SjzE7KdHpK6?=
 =?us-ascii?Q?0nZVy3YO8mLVzzZCYq/+dNU4ArRjq3gPfJX2t1jRin1t+AbN+jmE0c8AGCXG?=
 =?us-ascii?Q?cYUWna05J+6xgirkugLHvOmcLOuCKBNlVJakkQiTHOj5vJ6ktP+hMOLkhCY5?=
 =?us-ascii?Q?VzyY48ulDF1Erj1fv0w4gsOFqXKnctm5nPogSVPEBBRe/eNuQeReSGRdAaKx?=
 =?us-ascii?Q?AwAeDHd6hP8gnPVOfeDmd0+BP5tGPRYdYU1X8ymjG1bf3QPnuUx+9sMa3zNz?=
 =?us-ascii?Q?pmq0bCd3uot+jPbDFdBSXGB5nMCAGa2NIJ0cfYji3dEb+S1KBgXH6bDtwiI4?=
 =?us-ascii?Q?F2iunlusI4OetrBoQnXfXnqm7ry0qNJRGQ6ynWkPP19+6Vazimns/xO3swvu?=
 =?us-ascii?Q?nl0NxjTn+YRM/Lnb0hwNmC4SNKb5056u7dGUIqh9Xta2EdH31IT5JOSgistT?=
 =?us-ascii?Q?UpYzTKI1axhxnJ48/alhC7dDKtIj?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?O1uU7yVjDg8t9uoqDtOgfuG1QX2JkGSAxsLQDBNp/oPJ5Q/YB2dX+/+/dDAp?=
 =?us-ascii?Q?QeiUJgAGKq0/xBZ4Oh9l2b2fknpYTXEjlBCl5Ehn7qPABTNHBLGPyqr5G5yu?=
 =?us-ascii?Q?xq0Kqf+pq1O3XvGJu0h964KFBlsvVY0atT1YqIfXyjr6UrrkmU2imz1AdIpB?=
 =?us-ascii?Q?6A9o88kaZQQVVJdOJRFuqSvaY03fDagBlRigcjTziWqrvN9Em2OhL1mqQWpV?=
 =?us-ascii?Q?4+keUnDdkLRaBc1vPY7NcNL5un1i1D/ad/UGsvnXlSPnzvfmVUtJimYVCq2N?=
 =?us-ascii?Q?qCn9kGPeS/ZZWBUy52eC0V0Fn+QdKRAudhsqHWwCdTXx7QOAHilXeXXzb7XY?=
 =?us-ascii?Q?PDYX7BLLv1xJfyND1XakZEHbDZjkS/5wSsxsExwRIXuYua0waIzP9xXEP4bF?=
 =?us-ascii?Q?2g8SKmw8W0ZVsbElDNQJJQ6cYoujop5pirOqvwydb5Nx9YiEXvuTfModBlH6?=
 =?us-ascii?Q?iWVGPdzQDAyFq8IBiz3bMcgNtGdPHc4Vy0+ioyay+PToVra6nVwBDGMjZ1df?=
 =?us-ascii?Q?efticmBKDdAvrBKi3sVBT7gQyMqTiDBmK4HgTJE2c5sIj/K8HrTiLgSboWeF?=
 =?us-ascii?Q?Ww2LqPpxNEBTyW+yg6A4PUiddRGf+BpK5NYYg1V+1ujebnvN3v73QwDHU2wq?=
 =?us-ascii?Q?3irmBU7XqxtTrwp4BPF2gv3Go9Fe9xpIr+6fC3V9LFU0KfN3pKbA0hLdMWm6?=
 =?us-ascii?Q?CSm4sMRqU1+wPXJfc4N6i9V9jQGMdi508K+YZnTxr9pEbY1WRrq9/osegOi8?=
 =?us-ascii?Q?hE/1+ZiKnz627BvK1tFLbA5aNfmCZsI4XGRzwHhtIGtZ181ugS+6Ma32dTny?=
 =?us-ascii?Q?6pFgPJySYzeTvKArxygeOLYKdifBpzJ4KO9l8nYL+254PygfWzPAjIzmUwJo?=
 =?us-ascii?Q?9ymmcXMwuv79UktxZXFrVia5ehLOKMcPBQwRk6TQTpsTW74i3+ZAqMk5oe8p?=
 =?us-ascii?Q?vdjf+OAXtMQImz+iS4KbZJKvunlaCGBdixHBX+dhNS3UsSHzMVEwpyXNOebC?=
 =?us-ascii?Q?iWefQKu9TX+YyXwpRZBjyrYio1lCNRwdZBvA4xHhKWtoCnGTU/RM6Zefkw0p?=
 =?us-ascii?Q?zxO/ZPq4QaQZNMEeJXEkubm8XlxGGpw3VyljRGFYTs9/Q0GhIA81awu46laU?=
 =?us-ascii?Q?GhSw1c2HYMxwd/UtPxOsyT/PbqAcrycjjjsoWkjJxzGPrG7aOpyjCevBbbfo?=
 =?us-ascii?Q?sOWoZ4jGRYkWVdHfO6pr003Zq6qsDrKcpO2O/djcEGuqbkBQwtZu9B9CiyvO?=
 =?us-ascii?Q?gdV/VMsARuq1+UCpn733OtwhlEtFW9jvYEgi3saPCghrhYtYspLYKDPqgDoP?=
 =?us-ascii?Q?vTgTLI3yXrlGdnieg6VhdTEZZ3luu4lMPkN73IhNj1yDXwc/E6rKLHIjzTEQ?=
 =?us-ascii?Q?HGmATQKSiGUCMt70Ik8j3mVOq2S2czkFdWY8kQVPVML7n0Bcdy3DwWDAgxNZ?=
 =?us-ascii?Q?d0TjORQjgcEOe7s7MMKahH/MOI+/X89I2wW4h9cOmVGq1sg0Tykx03u35kNl?=
 =?us-ascii?Q?TgX8e0pfApDJKpC0pTlIXU+5z34KlOGX7VmdmOv+nwazh1ihxfjaHsdD66Rt?=
 =?us-ascii?Q?BvAcfl7zos9HzsAgQQUAnta3gaW58avjyMpUyZpD?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 878a60a2-2e49-4e2d-9f42-08dd4c03246e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 07:50:53.5925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 51TQ3sWJjjAXQQdHmpXaz5fzZt86CkokknCPOgKrjWPD60M8fNLBxMACAqGO80AKokffMyGO308rEc01wb1G2BLQNwJpqElk02kREGITw/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB3082

Hi, Krzysztof.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Tuesday, February 11, 2025 2:31 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>hverkuil@xs4all.nl; sebastian.fricke@collabora.com; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec
>device
>
>On 10/02/2025 10:07, Nas Chung wrote:
>> Add documents for the Wave6 video codec on NXP i.MX SoCs.
>>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> ---
>>  .../bindings/media/nxp,wave633c.yaml          | 202 ++++++++++++++++++
>>  MAINTAINERS                                   |   8 +
>>  2 files changed, 210 insertions(+)
>>  create mode 100644
>Documentation/devicetree/bindings/media/nxp,wave633c.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/nxp,wave633c.yaml
>b/Documentation/devicetree/bindings/media/nxp,wave633c.yaml
>> new file mode 100644
>> index 000000000000..99c3008314c5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/nxp,wave633c.yaml
>
>Filename matching compatible.
>
>> @@ -0,0 +1,202 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/nxp,wave633c.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Chips&Media Wave6 Series multi-standard codec IP on NXP i.MX SoC=
s.
>> +
>> +maintainers:
>> +  - Nas Chung <nas.chung@chipsnmedia.com>
>> +  - Jackson Lee <jackson.lee@chipsnmedia.com>
>> +
>> +description:
>> +  The Chips&Media Wave6 codec IP is a multi-standard video
>encoder/decoder.
>> +  On NXP i.MX SoCs, Wave6 codec IP functionality is split between the
>VPU control device
>> +  (vpu-ctrl) and the VPU device (vpu). The VPU control device manages
>shared resources
>> +  such as firmware access and power domains, while the VPU device
>provides encoding
>> +  and decoding capabilities. The VPU devie cannot operate independently
>
>Typo

I'll fix it in v2.

>
>> +  without the VPU control device.
>> +
>
>Please wrap code according to the preferred limit expressed in Kernel
>coding style (checkpatch is not a coding style description, but only a
>tool).  Bindings use strict rule here.

I'll address this in v2.

>
>
>
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - nxp,imx95-wave633c-ctrl
>> +          - nxp,imx95-wave633c
>
>I don't understand why you duplicated compatibles. You split this for
>driver? That's a no. There are no two hardwares.

Yes, I want to introduce two different devices and drivers,
even though there is only one hardware.

Wave6 IP has five independent register regions:

One register region is dedicated to the control device,
which manages shared resources such as firmware loading and power domains.

The remaining four register regions are assigned to
four independent VPU devices, each accessing its own dedicated region.
(to support 4 vms)

Would it be reasonable to split the YAML into separate files
for the VPU control device and the VPU device ?
(like nxp,wave633c-ctrl.yaml)

>
>These compatibles are anyway weird - why imx95 is in chipmedia product?
>Is this part of a SoC?

I want to represent that the Wave633 is part of the i.MX95.
Chips&Media's Wave633 can also be integrated into SoCs from other vendors.
By using the compatible name, the same Wave6 driver can distinguish
different implementations.

However, I agree that "imx95" is not strictly necessary in current status.
So, using "nxp,wave633c" would be a better choice, right ?

>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: VPU clock
>> +      - description: VPU associated block clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: vpu
>> +      - const: vpublk_wave
>> +
>> +  power-domains:
>> +    minItems: 1
>> +    items:
>> +      - description: Main VPU power domain
>> +      - description: Performance power domain
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: vpumix
>> +      - const: vpuperf
>> +
>> +  cnm,ctrl:
>
>What is this prefix about? Is this nxp or something else?

Yes, using "nxp" as the prefix seems more appropriate.

>
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: phandle of the VPU control device node. Required for V=
PU
>operation.
>
>Explain - required for what. Operation is too generic.

phandle of the VPU control device node, which manages shared resources
such as firmware access and power domains.

>
>If this is phandle to second device, then it's proof your split is
>really wrong.

Are you suggesting that I should separate them into two YAML files,
or that I should structure them in a parent-child hierarchy
within the same YAML file ?

I appreciate any guidance on the best approach to structure this in line
with existing bindings.

>
>> +
>> +  boot:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: phandle of the boot memory region node for the VPU
>control device.
>
>No clue what is this... if memory region then use existing bindings.

Boot is a memory region used for firmware upload.
Only the control device can access this region.
By "existing bindings," do you mean I should use "memory-region" instead ?

>
>Anyway, wrap your code correctly.

Okay.

>
>> +
>> +  sram:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: phandle of the SRAM memory region node for the VPU
>control device.
>> +
>> +  '#cooling-cells':
>> +    const: 2
>> +
>> +  support-follower:
>> +    type: boolean
>> +    description: Indicates whether the VPU domain power always on.
>
>You cannot add new common properties in random way. Missing vendor
>prefix but more important: does not look at all as hardware property but
>OS policy.

I agree with you.
I'll remove it in v2.

>
>> +
>> +patternProperties:
>> +  "^vpu-ctrl@[0-9a-f]+$":
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - enum:
>> +              - nxp,imx95-wave633c-ctrl
>
>Really, what? How nxp,imx95-wave633c-ctrl node can have a child with
>nxp,imx95-wave633c-ctrl compatible?
>
>NAK.

Apologies, I misunderstood the meaning of 'patternProperties'.
I'll remove it in v2.

>
>
>> +      reg: true
>> +      clocks: true
>> +      clock-names: true
>> +      power-domains:
>> +        items:
>> +          - description: Main VPU power domain
>> +          - description: Performance power domain
>> +      power-domain-names:
>> +        items:
>> +          - const: vpumix
>> +          - const: vpuperf
>> +      sram: true
>> +      boot: true
>> +      '#cooling-cells': true
>> +      support-follower: true
>> +    required:
>> +      - compatible
>> +      - reg
>> +      - clocks
>> +      - clock-names
>> +      - power-domains
>> +      - power-domain-names
>> +      - sram
>> +      - boot
>> +
>> +    additionalProperties: false
>> +
>> +  "^vpu@[0-9a-f]+$":
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - enum:
>> +              - nxp,imx95-wave633c
>> +      reg: true
>> +      interrupts: true
>> +      clocks: true
>> +      clock-names: true
>> +      power-domains:
>> +        maxItems: 1
>> +        description: Main VPU power domain
>> +      cnm,ctrl: true
>> +    required:
>> +      - compatible
>> +      - reg
>> +      - interrupts
>> +      - clocks
>> +      - clock-names
>> +      - power-domains
>> +      - cnm,ctrl
>
>All this is just incorrect.

I'll remove it in v2.

>
>> +
>> +    additionalProperties: false
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
>> +      vpuctrl: vpu-ctrl@4c4c0000 {
>> +        compatible =3D "nxp,imx95-wave633c-ctrl";
>> +        reg =3D <0x0 0x4c4c0000 0x0 0x10000>;
>> +        clocks =3D <&scmi_clk 115>,
>> +            <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>> +        clock-names =3D "vpu", "vpublk_wave";
>> +        power-domains =3D <&scmi_devpd 21>, <&scmi_perf 10>;
>> +        power-domain-names =3D "vpumix", "vpuperf";
>> +        #cooling-cells =3D <2>;
>> +        boot =3D <&vpu_boot>;
>> +        sram =3D <&sram1>;
>> +      };
>> +
>> +      vpu0: vpu@4c480000 {
>
>Node names should be generic. See also an explanation and list of
>examples (not exhaustive) in DT specification:
>https://devicetree-specification.readthedocs.io/en/latest/chapter2-
>devicetree-basics.html#generic-names-recommendation

Thanks for sharing the link.
I'll use "video-codec" as the node name in v2.

>
>
>> +        compatible =3D "nxp,imx95-wave633c";
>> +        reg =3D <0x0 0x4c480000 0x0 0x10000>;
>> +        interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks =3D <&scmi_clk 115>,
>> +                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>> +        clock-names =3D "vpu", "vpublk_wave";
>> +        power-domains =3D <&scmi_devpd 21>;
>> +        cnm,ctrl =3D <&vpuctrl>;
>> +      };
>> +
>> +      vpu1: vpu@4c490000 {
>> +        compatible =3D "nxp,imx95-wave633c";
>
>Drop all duplicated examples.

Wave6 HW is designed for simultaneous access,
as each VPU device has its own separate register space.
Therefore, I defined the 4 VPU devices as independent nodes in the example
to reflect this.

>
>
>> +        reg =3D <0x0 0x4c490000 0x0 0x10000>;
>> +        interrupts =3D <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks =3D <&scmi_clk 115>,
>> +                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>> +        clock-names =3D "vpu", "vpublk_wave";
>> +        power-domains =3D <&scmi_devpd 21>;
>> +        cnm,ctrl =3D <&vpuctrl>;
>> +      };
>> +
>> +      vpu2: vpu@4c4a0000 {
>> +        compatible =3D "nxp,imx95-wave633c";
>> +        reg =3D <0x0 0x4c4a0000 0x0 0x10000>;
>> +        interrupts =3D <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks =3D <&scmi_clk 115>,
>> +                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>> +        clock-names =3D "vpu", "vpublk_wave";
>> +        power-domains =3D <&scmi_devpd 21>;
>> +        cnm,ctrl =3D <&vpuctrl>;
>> +      };
>> +
>> +      vpu3: vpu@4c4b0000 {
>> +        compatible =3D "nxp,imx95-wave633c";
>> +        reg =3D <0x0 0x4c4b0000 0x0 0x10000>;
>> +        interrupts =3D <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks =3D <&scmi_clk 115>,
>> +                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>> +        clock-names =3D "vpu", "vpublk_wave";
>> +        power-domains =3D <&scmi_devpd 21>;
>> +        cnm,ctrl =3D <&vpuctrl>;
>> +      };
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 896a307fa065..5ff5b1f1ced2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -25462,6 +25462,14 @@ S:	Maintained
>>  F:	Documentation/devicetree/bindings/media/cnm,wave521c.yaml
>>  F:	drivers/media/platform/chips-media/wave5/
>>
>> +WAVE6 VPU CODEC DRIVER
>> +M:	Nas Chung <nas.chung@chipsnmedia.com>
>> +M:	Jackson Lee <jackson.lee@chipsnmedia.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/media/nxp,wave633c.yaml
>> +F:	drivers/media/platform/chips-media/wave6/
>
>There is no such file/directory.

Understood. I'll move the MAINTAINERS update to the last patch in v2.

>
>Best regards,
>Krzysztof

