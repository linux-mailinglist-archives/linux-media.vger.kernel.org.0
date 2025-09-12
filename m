Return-Path: <linux-media+bounces-42387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9DAB5415A
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 06:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E925C3A7EFF
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 04:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C1620E033;
	Fri, 12 Sep 2025 04:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="OjkZaBlW"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020093.outbound.protection.outlook.com [52.101.156.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646F5175A5;
	Fri, 12 Sep 2025 04:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757649793; cv=fail; b=Xn/az/Tu0o7+zQrwazNMktktjLjZfd844CSMz9EHr8e5BldRlhNP9TX1YgowAIKgzhSM4dQwaXqtzk43Ee7paZDuQfyzM0HrwvgtGlHgWPzbmqT1AFnNLHanG7YoNIKOhMfEaGDg1M9TZu5Sw+mNaKjX2hUHLfY6mZW9xr/9oKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757649793; c=relaxed/simple;
	bh=c3T2UsWBfhJAnyAkniPrYOvd44Fv6yGyPXApi6yPhls=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f9ySTnG9/fNXwx1dKCyFZcOQBpvOA/fz0CheYxhBWa7vajTy06fPaPFJVA1vNxMUktNE5zdgQLSaoLY4/R2xsDvg67CUsFcNOre5oYZ+VYACt12eLcHLgLPpjBwiD+iU9H/lYKR/sMX4sDVFHa/AXjNvmB+/231gy9WANsk4+dM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=OjkZaBlW; arc=fail smtp.client-ip=52.101.156.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMGvu50snuuGKMgdy4xDXIx6mVV2Vg4f1ZkClMv+hyjhy5eQrTVH/et22vPQS/iNbqQoZeYGiPmpIXWL6npJkJbjmO0yDNNQ+pTtBQ+tpeXXW8sVmMclhME9ODYn7KAcN+tpwGW6ccmsXq3TRPrJeWZfNO0Ye5ekmwxuWzXRHB0PmJM1w0/5Ug2jfm54CGCcPwUszmENhyKRV9ITQAoYhpYm6mWKLheLfdHrqySeq3lPAt89623gANC2m0mlv9fgz/H2drUa/vkL0eieau4r9xRo5YGLYmk0tYHEh8A2dIukkr8NVU5PK4PpPWzEumhGssz/YxCFbgzrc3G/fS+CHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7uBMoNaxhXP968SE0NQ+/XaEbs6QlAHYmwe7jQt5gQ=;
 b=rKYNYr/s1DqTC7Wy3kGaAHwrVVy1R2z7om0LKiDqH1E6k27e0svivktGzrRm4x8rHHcYy7952s/0rsXi8EamSa7ZYeT05V+JVy8sm1zhqIJwPqSc2gqPQ1SMAgZPQAcqCZgi2ImjAFGyA8z19Rp+DBczzmpCHtII4Mzxi0J8V4rdVp2O57mxyuoyvGbkJ4Nxjb9um0Sghml5HdETtNINAZXC6LmhrZdLeN8ZdKyfFI2uv7//50ZrChWBU3nEPOkmSFZwbLfIzulVxI5nCoFdcKQdTwdC+IErdavFeBedhRQmw1XqvCHKjaxAhavHvRRdrQzAuQFVqhIh6QA9nDEHsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7uBMoNaxhXP968SE0NQ+/XaEbs6QlAHYmwe7jQt5gQ=;
 b=OjkZaBlW7vbN87QI74mUaD0mtRVWTZEIjnE8/FRN4Nmq5zrjOQpkntwW1MbZH5L8T7sbcpsL9w8586E/exq7ovkPTtbvrbJ5ac8HR/NvFOIZYwZWf5AKLkc581Y+E4ookyEkhDPiPRCHu/zRYYva1q+UKigYU/ZWbdfXWBsH2wI=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SL2P216MB1360.KORP216.PROD.OUTLOOK.COM (2603:1096:101:10::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.18; Fri, 12 Sep 2025 04:03:00 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9115.010; Fri, 12 Sep 2025
 04:02:59 +0000
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
Thread-Index: AQHcGMGJZMRvpcS8k0m0pKjSJCiRfbR5qCyAgAWDqKCAAFVmUIAPUbyQ
Date: Fri, 12 Sep 2025 04:02:59 +0000
Message-ID:
 <SL2P216MB124621E30C6274A4548A38FBFB08A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250829084649.359-1-nas.chung@chipsnmedia.com>
 <20250829084649.359-3-nas.chung@chipsnmedia.com>
 <22379203-94f8-468d-a9b6-de67f8fba495@kernel.org>
 <SL2P216MB12469B8A2DD5B2F6EA2F04DCFB06A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <SL2P216MB1246080FA1F1DE8B707A1C5BFB06A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
In-Reply-To:
 <SL2P216MB1246080FA1F1DE8B707A1C5BFB06A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SL2P216MB1360:EE_
x-ms-office365-filtering-correlation-id: 134b99bf-3c7c-4ee1-44d3-08ddf1b14358
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?X0dfWUgzLC/AAKFhGhAuJjNuIIuCULW7vvpg2Q4LFWGxv0YhCizErBrSTwBq?=
 =?us-ascii?Q?DeRhpnI8TcJJJfNETciGUD3XUavjZXskmiQ417lD+urb2kB1d/h38UfbyDI/?=
 =?us-ascii?Q?J5OixluUQ6A0khNOvGWOFuHL+uSHa0OAC8JIi7DJ8nUxKXcZkSHXr5Hwdd8y?=
 =?us-ascii?Q?6q4ExbdTzwCUrov0VXxFSTEsKESJVb3m9xscr73ERkErbaGNP4n7i0Nj3xXc?=
 =?us-ascii?Q?xsxyd1Om27dTJ8icNnKdyGsST9akGkUjY+d/A55cY5xiHeTiITKzGC3BUKpr?=
 =?us-ascii?Q?32IRphxQT7qRVU+VYqpINC4DAde6PJD8SuL18Q7O3Z574Z/rZ7cm2phSAWVS?=
 =?us-ascii?Q?C2kC8zoMpyH+WZzbYf76beIMFmPfDeVXjVYnUVJR5Mk3g4t96cMOBTbGU9iA?=
 =?us-ascii?Q?GjJWO+KXKNJ/4nGCpGOZWn95kaIyVgjR+8SY//C8uIYY1ObbnmKvImNoSTEi?=
 =?us-ascii?Q?aymONLzdOABaQWrjaPjTFvV+kpzxetBUdIXpscmLpa3hBmoyBb5yeMZQ5fwx?=
 =?us-ascii?Q?T2jiK6g+6gJ23JUQlRWi52Hwb1bZFslfrFqBonTuOF3RqeesrJI8XxiUP9KH?=
 =?us-ascii?Q?2ymaj1itLblwpHlc8QMBVAAakJxRIvJgiXi2xAnwV7PLA0I4FEu0NXqWWFsb?=
 =?us-ascii?Q?CG3Ry2f+L70B9dp6mL6yiPAU2Vu8jscOXN7R/upP7TSAH0ByBL+9z1ip/qxd?=
 =?us-ascii?Q?8ZDQ4/BYeMss4FitN2dBYg96fQqg26SY3/fGnhFb3KopBwzhGBk1K/tkmWWm?=
 =?us-ascii?Q?pGhoKQfuOgSibThUikBwskKeP+6x8X5IGKd9YMo21b7Oc0iIbnRhm6V5IATg?=
 =?us-ascii?Q?x01VeCZJHQZXasPb0adj64BoZEE63s4IUAHvNXBFL3ec9TaaR/N0bxGWrYTv?=
 =?us-ascii?Q?Qnq+OTtjCe5LFGV5Y9i4JX7Cw21ZiY2wV6Qu2Dd4lp2lO2Z3oRV0KBinWnGY?=
 =?us-ascii?Q?YcLbJWiGCK8iyxbxocTxJLDOzyWI2tMYfv6vfTGibgLY8wo9ZJUSih+iP7mr?=
 =?us-ascii?Q?Eq6OLXnGVLDpo/zcECuzUzVJfkyIr3ez8M2T9rpPCuh4QYlYzHF95VddpQuq?=
 =?us-ascii?Q?3kQ8BSKoUJzodCUOlu6srDxJqCTRP2bfLNNPz6jN70JJI3aPnoJ3UrIDb9G+?=
 =?us-ascii?Q?9KcnE2GjIFX1d+qbeg5Uj+4hicKJCaR6rVWTJTe0UhlxKlJT9A5HF1XT7pgg?=
 =?us-ascii?Q?rRNDzIgknOPrcEp4wWQCy+qj1z7vl6rDptuhonKrMtnlpk5DSPhC58ZSE8yh?=
 =?us-ascii?Q?dHibzpevA0oMOmwuSZykS3U+KjiYJIomI7Uc3szLYMnfsCiozbLgcDvGCiru?=
 =?us-ascii?Q?qtSqxwZbQfI/oVjJUYSFMWpj4/908hrsftmx+PhoYMz0F7NYH683EuSZW6m6?=
 =?us-ascii?Q?iW3ecXl2L1sNQejkL4izric1ZMW1SjcNJxK0WD2M7YAgDIu92qjukZlxK9Ii?=
 =?us-ascii?Q?HfppF7S8OuCfT/tEVygCG+O/Tf/n4GNL8gJnD6xbbrsJuXwLz1NAhg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OPNQzfBtriQOLAa2Bv104FSe+44Ss9H8ZAkQ6DnyKNLmpO6h5xWFepbQwDWn?=
 =?us-ascii?Q?AD4D+rjknpO7/+ODyv2uWM/c6Ikt9gVDu8qW+EaGXQLfUtGmyq6cI+iXr+2D?=
 =?us-ascii?Q?c6OCCUzGlHxDJsaCIiB84Kijryq4QieQ5tdy8sUqnvkOzmTwYuN+G2netDZw?=
 =?us-ascii?Q?wusZ+FKC1xfEdPLicE/gm6kQWVa6j0J287GzD72bEgZ4HURqIF7aWzBDD+i5?=
 =?us-ascii?Q?5VYBtbjvNdIv0uyHbHNesB/UaWZW0qjgi4JiBW+YE2Z2GVp6xprUvS+mSRVg?=
 =?us-ascii?Q?hscDGXyVy3q5PnoWeUsLCtkevjKzDDopI1/3u/zjrfrd8wSnuKabv+3kMfDj?=
 =?us-ascii?Q?ALbqJHOUDopxXl3HMy0ZsB2I64rPjsd1A59B2PxHLLuTg175fKQyCcdBw/gv?=
 =?us-ascii?Q?+cH9r9j+A9gRVQFjdnzqYRD/5yk5HktcGvhGbBlq0itScSi8JC0DfK1u3qMg?=
 =?us-ascii?Q?souPLW4seb8+oYfyn5IB+6CMfrqEagZD1973ss3qXmDdA50oXEbWq8ZZau/m?=
 =?us-ascii?Q?iiZw8wLH26detj4D3qdH4a5GT5I04yTmoX540Kogl06JyFpF/ZAZ26wUX6pq?=
 =?us-ascii?Q?0lCDBBHTIdq63iXrmaXTn7PQ4v2a21/wwbTSTzWoq7R/38fbnlWjhEUuP8zu?=
 =?us-ascii?Q?L9E/YnAg9kBfC0Gs7XQTD3rcfSk/pDTyenvBIWXk4c7cUrvJlJqvti2x4fWX?=
 =?us-ascii?Q?eeV9OPotlfANN/fBZmoPS8OFiF073rcfk6OPegKXpdtx2OJuPMfG/NVjb8Nr?=
 =?us-ascii?Q?gaQl9/TFVYlzXzJ99rpk0dRb3bnysl7pWBU6Ug3yDt+mYSZjn7mU0uycf69U?=
 =?us-ascii?Q?nyO2GXHc/joC3aGDcF6OgkFJ4WrHlNBJuh3EJD+KSI/OlkkLQOMYfARx9Qre?=
 =?us-ascii?Q?B0evF/smz+n/YpWQ7Ro25XXDve9q9pCmmYlLqzKqhmESPZN1mgmken5vuj2H?=
 =?us-ascii?Q?daKXqrncNmer/g+4mwmXEGzgCgPDg2lteEGaH6gYLxOW4R9hOPUHskEvS67k?=
 =?us-ascii?Q?3TKpcxLAgy9MrZNingzthkH5e86Y0MH3rQt5W2Zn1sbBP19FxyLjHGMi23GZ?=
 =?us-ascii?Q?pEeN/JWBDLEFBE4Htzv/ednFHV+weKqS8urou4OZTEXI2HVCRFqNTLwnHHQb?=
 =?us-ascii?Q?+yNvLZwbjUWGtxALaKnvZbWVf0ckagpjkfPNLxfeDwr+MXs7nUeHqri4AGKq?=
 =?us-ascii?Q?h9xzgcbE+2zRb8NNlXRQMXko+7X5GoyWWq92w9VT2NTg93KLHac3IdFKVj6y?=
 =?us-ascii?Q?WWzuapTHctCWttk77uIZ6VoSfldu+vV5NwzKCS+NVbaOJbCaIhTIVkI64UCb?=
 =?us-ascii?Q?n3xUTWPJaoBqOSIAV8kOX/YmeYTAkT/SRCa5OLC8A6r4WGYMlohil5Wd0wmt?=
 =?us-ascii?Q?JO2ihh3jbNRTHy9s+K0P5Xotk8742VF62r8iFAADzhZQc5xFLPvbMAYiuJ6Y?=
 =?us-ascii?Q?zGFfTCVSf7W9mMTnlEdzBx409lrs+qsApJ1m53Atvv+d1xMJIhKqwWOVVwmg?=
 =?us-ascii?Q?bo/M3PKxi7Q+A80HmOlWKSMVJTx2hpCjmCTH0TI6yTC6F26j1nFkeFyZBmOf?=
 =?us-ascii?Q?8qYilYTCFN5E8oWr1GU86rLw/XZNnS0ss0AvRBOF?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 134b99bf-3c7c-4ee1-44d3-08ddf1b14358
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2025 04:02:59.7767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZTtZP6P7w3f+n4WGdF8/drgH1MrDC/NvXSdBKR6dT7o9yGb58YVlREu+FGmUnNe+pKHYDQR3CUFWkyDxM/ug3Vbl1WXoBYH7DFsTywxywzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1360

Hi,

Gentle ping.

Just to recap the previous reply:

On this SoC, each of the cores and the control block has its own SMMU ID,
providing independent hardware contexts as part of the SoC's isolation poli=
cy.

I realized that the iommu property was missing in the documentation; would
adding it be the appropriate way to indicate why each core is represented a=
s
a sub-node ?

Thanks.
Nas.

>-----Original Message-----
>From: Nas Chung <nas.chung@chipsnmedia.com>
>Sent: Tuesday, September 2, 2025 4:43 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>; Krzysztof Kozlowski
><krzk@kernel.org>; mchehab@kernel.org; hverkuil@xs4all.nl; robh@kernel.org=
;
>krzk+dt@kernel.org; conor+dt@kernel.org; shawnguo@kernel.org;
>s.hauer@pengutronix.de
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: RE: [PATCH v3 2/9] dt-bindings: media: nxp: Add Wave6 video codec
>device
>
>Hi, Krzysztof.
>
>>-----Original Message-----
>>From: Nas Chung <nas.chung@chipsnmedia.com>
>>Sent: Tuesday, September 2, 2025 2:46 PM
>>To: Krzysztof Kozlowski <krzk@kernel.org>; mchehab@kernel.org;
>>hverkuil@xs4all.nl; robh@kernel.org; krzk+dt@kernel.org;
>>conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de
>>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>>lafley.kim <lafley.kim@chipsnmedia.com>
>>Subject: RE: [PATCH v3 2/9] dt-bindings: media: nxp: Add Wave6 video code=
c
>>device
>>
>>Hi, Krzysztof.
>>
>>>-----Original Message-----
>>>From: Krzysztof Kozlowski <krzk@kernel.org>
>>>Sent: Friday, August 29, 2025 10:57 PM
>>>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>>>hverkuil@xs4all.nl; robh@kernel.org; krzk+dt@kernel.org;
>>>conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de
>>>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>>>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>>>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>>>lafley.kim <lafley.kim@chipsnmedia.com>
>>>Subject: Re: [PATCH v3 2/9] dt-bindings: media: nxp: Add Wave6 video
>codec
>>>device
>>>
>>>On 29/08/2025 10:46, Nas Chung wrote:
>>>> Add documents for the Wave6 video codec on NXP i.MX SoCs.
>>>Pretty incomplete commit msg. Nothing explaining hardware, nothing
>>>documenting resolution of previous discussions (where is all this
>>>chip&media?).
>>
>>I see,  I'll improve the commit message in v4 to include hardware details=
.
>>
>>>
>>>...
>>>
>>>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - nxp,imx95-vpu
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>> +  memory-region:
>>>> +    maxItems: 1
>>>> +
>>>> +  sram:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +    description: phandle of the SRAM memory region node.
>>>> +
>>>> +  "#cooling-cells":
>>>> +    const: 2
>>>> +
>>>> +  "#address-cells":
>>>> +    const: 2
>>>> +
>>>> +  "#size-cells":
>>>> +    const: 2
>>>> +
>>>> +  ranges: true
>>>> +
>>>> +patternProperties:
>>>> +  "^video-core@[0-9a-f]+$":
>>>> +    type: object
>>>
>>>Missing description.
>>
>>I'll add a description in v4.
>>
>>>
>>>> +    additionalProperties: false
>>>> +
>>>> +    properties:
>>>> +      compatible:
>>>> +        enum:
>>>> +          - nxp,imx95-vpu-core
>>>
>>>Why do you need here compatible? Can this child be anything else? Can it
>>>be re-used? Is it actually a separate block?
>>>
>>>Your example suggests that the only distinctive resource are the
>>>interrupt and address space and that's on the edge of calling it a
>>>separate device.
>>>
>>>There is some tendency to call such "pseudo-cores" a separate devices in
>>>case of video codec bindings and experience shows these are usually
>>>fake. It's not the same as DP or HDMI sub-block of display pipeline.
>>>
>>>That's why you should come here with strong argument what separate piece
>>>of hardware this is.
>>
>>Thanks for your feedback.
>>
>>As you mentioned, I wanted to represent the interrupts and address space
>>as separate "cores". This is because, from an external perspective (e.g.
>>multi-VM),
>>each of these resources is a VPU interface and can be accessed
>>independently
>>to operate the VPU.
>
>Apologies, I forgot to mention one detail in my previous reply.
>
>I did not include the SMMU-related properties in the core nodes.
>On this SoC, however, each of these cores has its own SMMU ID
>as part of the SoC's isolation policy.
>This allows them to be treated as independent interfaces,
>even though there is only one actual VPU engine.
>
>Would adding the iommu property be the appropriate way to describe
>this in the device tree?
>
>Thanks,
>Nas.
>
>>
>>However, there is indeed only one actual VPU processing engine.
>>I understand your point about "pseudo-cores".
>>
>>I would appreciate any guidance on the preferred way to represent
>>these resources in the device tree.
>>
>>>
>>>> +
>>>> +      reg:
>>>> +        maxItems: 1
>>>> +
>>>> +      clocks:
>>>> +        maxItems: 1
>>>> +
>>>> +      power-domains:
>>>> +        maxItems: 1
>>>> +
>>>> +      interrupts:
>>>> +        maxItems: 1
>>>> +
>>>> +    required:
>>>> +      - compatible
>>>> +      - reg
>>>> +      - clocks
>>>> +      - power-domains
>>>> +      - interrupts
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - clocks
>>>> +  - power-domains
>>>> +  - memory-region
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
>>>> +
>>>> +    soc {
>>>> +      #address-cells =3D <2>;
>>>> +      #size-cells =3D <2>;
>>>> +
>>>> +      vpu: video-codec@4c4c0000 {
>>>
>>>Unused label, drop
>>
>>Okay. I'll drop the unused label.
>>
>>>
>>>> +        compatible =3D "nxp,imx95-vpu";
>>>> +        reg =3D <0x0 0x4c4c0000 0x0 0x10000>;
>>>> +        clocks =3D <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>>>> +        power-domains =3D <&scmi_perf 10>;
>>>> +        memory-region =3D <&vpu_boot>;
>>>> +        sram =3D <&sram1>;
>>>> +        #cooling-cells =3D <2>;
>>>> +        #address-cells =3D <2>;
>>>> +        #size-cells =3D <2>;
>>>> +        ranges;
>>>> +
>>>> +        vpucore0: video-core@4c480000 {
>>>
>>>None of these labels are used, drop.
>>
>>I'll drop it.
>>
>>Thanks,
>>Nas.
>>
>>>
>>>> +          compatible =3D "nxp,imx95-vpu-core";
>>>> +          reg =3D <0x0 0x4c480000 0x0 0x10000>;
>>>> +          clocks =3D <&scmi_clk 115>;
>>>> +          power-domains =3D <&scmi_devpd 21>;
>>>> +          interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
>>>> +        };
>>>> +
>>>> +        vpucore1: video-core@4c490000 {
>>>> +          compatible =3D "nxp,imx95-vpu-core";
>>>> +          reg =3D <0x0 0x4c490000 0x0 0x10000>;
>>>> +          clocks =3D <&scmi_clk 115>;
>>>> +          power-domains =3D <&scmi_devpd 21>;
>>>> +          interrupts =3D <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>>>> +        };
>>>> +
>>>
>>>
>>>
>>>Best regards,
>>>Krzysztof


