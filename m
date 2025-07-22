Return-Path: <linux-media+bounces-38194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDE9B0CEEA
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 02:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B61507B3A88
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 00:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2C5149DF0;
	Tue, 22 Jul 2025 00:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="SUWinCxF"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05olkn2084.outbound.protection.outlook.com [40.92.91.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B7713AA20;
	Tue, 22 Jul 2025 00:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.91.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753145573; cv=fail; b=in81KdI3Ihq4YXDTfBYj5n+gCJ6xStVTKkRXTTqiSP00rkNn5/vMECRITTFg+mgD4IOIFFwaV9Cokh6ETmxliemhxN+alzO1sW8zWAjDQr/y8QPcjWoMFNzErSrJtvorKKkJR6f3AaW3uMzp+gy+uYNVxBhZK18qsqN/8nbIHQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753145573; c=relaxed/simple;
	bh=ucuNlmwiBX8AYSEfsQSEI8w83m9xvX1K15mynstcaB8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UNj0vhBTy6lm0ZEWROfVYBJfB5be1c52+qY/SYunqikHS7YCMDOzdZ85LuyFu7EHCgNfnj1r3qzCLkcm8/M46p4IXDJfEL6/R7xHAAgl23ctZlm6JJQ9RmZ05yIYD69tOFGBnS6Ev1ClpyIODSAwbMO1qSBtyJMDNjKSQ7GB0fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=SUWinCxF; arc=fail smtp.client-ip=40.92.91.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKpvyaXENLbpM54pwaJOWg9mFodIL558x1djhJTI5kDfVw2sPjrpL0AeDc3ThRFLpC+zT1CHH+QnY1Ev0wD91WribPW1GQo7kEjzpXSpSgHrRp4U+k/r51QNqqbYt98vDGDwU4OhqH1qDfwbV6icWG48RYsT0HQCLVbj3B/VauCjS0JMrH0/UlGyvb9SPwe27Fvb0ur93YBonTz/JdNZCywTlWioPIu7dGozyQLXHew+2WhHDM/Ds5rArT9Fr3QdcvUbQt+yYI5jyOqU8kfszA7BdUuianOKQQz71hA7TzwyZyfuuQzqP2d8SvHi73jffQkxR4Ey7IcdqNmyPGEPnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyMWozPJH8184WWoL6qQy6E6eBnawDzsuL+D0f5Kxy0=;
 b=wyKY36ORfeSpoYf1WZHN33fXWCMp4iJW+r1jH29EvdcqX71ITXdHzshbRfTHZMFiOlm0MNe35UPPzH5zPeJFk81E48mpSzpLX0pCM8AgUvtZqOTfbckDIiI4qY2uZhGtP1IKUdaq20n+s9w+jBwHw111KSSDxMYH/qCtQysX57NKVxKozxXuegf2NO9/GbXZueQsqpFVPyrScUAHQKA4XLs/jOLhqZW7vdS9nfRa+g3Lhs/EiTz+6tp8iGPd1VJ3BmOVULMg8jAZ/o+xhgsERGpqtPtDJJOa7ywB+r/oOtg7Znekz0pL78d8hj2qTP1K0X0fOgFQYziZSicTXycx0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyMWozPJH8184WWoL6qQy6E6eBnawDzsuL+D0f5Kxy0=;
 b=SUWinCxFPF17yeU4i06XxmFN+K7jQwFWcmANOR+YoLDiOQlXrtZh9nOHXgvZIE1hwNWtqm4lkQ2KMPVk9jdraJHphFaRVLR/k9Md0BWGiBc4NYcuOUS5TbwjVIXsMsEJ7aBD/RgOrLmHnE1+xUcnLqU+OKbbD7rtsl1ykMgVmg63+XfxCv+hOuK6hC0Q7VGsqyAh511oq6I2yjlTeospND8t9tJ7Xgl4RxLcGDvK9rYBGBRujd+VvwOxVY+M/TjnGz2w9fvjZhgLh3vAiZqx9+qLy9xUMVfgrfHXXRJinrLyYyrzDBnE5x+8sY3UGbeqK7rwq9Tg+DB+VFNt8ix5wg==
Received: from AS8P194MB1431.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:3ce::24)
 by GV1P194MB1954.EURP194.PROD.OUTLOOK.COM (2603:10a6:150:87::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Tue, 22 Jul
 2025 00:52:48 +0000
Received: from AS8P194MB1431.EURP194.PROD.OUTLOOK.COM
 ([fe80::4407:7f5:2900:4610]) by AS8P194MB1431.EURP194.PROD.OUTLOOK.COM
 ([fe80::4407:7f5:2900:4610%7]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 00:52:48 +0000
From: imen jaziri <imenjaziri@outlook.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] Add changes to uvcvideo driver
Thread-Topic: [PATCH] Add changes to uvcvideo driver
Thread-Index: AQHb+qH1yIv5UZUlHkCNrTuFYjqGBA==
Date: Tue, 22 Jul 2025 00:52:48 +0000
Message-ID:
 <AS8P194MB1431190675980ED3825D4D71D05CA@AS8P194MB1431.EURP194.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P194MB1431:EE_|GV1P194MB1954:EE_
x-ms-office365-filtering-correlation-id: da6ef03c-2644-4355-8318-08ddc8ba1426
x-microsoft-antispam:
 BCL:0;ARA:14566002|20110799003|15080799012|15030799006|461199028|51005399003|40105399003|39105399003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+T5vsyFIuVjk+BQNYIwt54oqK9kT0rhiegVnJoLzfHGC7nnm3xCAKg2Ky2?=
 =?iso-8859-1?Q?hcRlSpwNlxLLDV4QwJ1KBqPguK1BAFQd9snsWT7TV/RxGiPJewzMr95lJL?=
 =?iso-8859-1?Q?elBxDObIQrGay8FrioAkdFZhM3hPXtG0mkr1a+WOhJoFho+M4S3MuV+8f1?=
 =?iso-8859-1?Q?KONUkhWEF9/vTpqQl637jlaH1UwVjHTLI9HJAZ65BOwCZOtkMIktRoTWjh?=
 =?iso-8859-1?Q?5tAgBbiLujybRAOdtr6nrUpB/2Nlk1zBXcX1BKVaPP75dSV4nPpcuRKoIW?=
 =?iso-8859-1?Q?YRszRdSk2cR0TDcJTzLwCzQA3q3xqSbXRDqY7uIBro63GNqDZoTPaI79pD?=
 =?iso-8859-1?Q?SfZiNsD6ahnAD7Oe/PVOh02POTpyuaXgRxQhXIRURTcxnhxA+plHjFfpZp?=
 =?iso-8859-1?Q?LKo61iP5hlBR4Hob14frZvc0YOFnbwzsnoOVL7DHBk0W6fQwqIiS8zfQ9B?=
 =?iso-8859-1?Q?6XrvDJRTQV5+mHhC51oHwd5IWS8z8jL7VqVOsluhugKuTTt2yd1aFp/8Lk?=
 =?iso-8859-1?Q?aiQZvz2w6pHJ/aWI+ijTTucxLeknCEa1TVc+y61Flehc7u8Y6Dx5UFNnRV?=
 =?iso-8859-1?Q?waP8OUCSuePfgUoCNA7s/l8E6ZJD48sVNdfTAUeGhQZ+mV0Z2Jd1M4tTq+?=
 =?iso-8859-1?Q?bG9ZpGKxWWJiJ5l0UuXW99FlLxfKsdn5WoCv+LnguqeEOXqlizMYJ0VjCJ?=
 =?iso-8859-1?Q?pz6KZk+F9+Kn9ecPKBMHOiGXST08Lb9G2QrDW7n+zygQay22BLhIXpOgox?=
 =?iso-8859-1?Q?f54ckkoGHYBJXQ0JDY7nV2OAFXqEB3EkOVuoMG7nvOoYfpvL+zQHYaH6kc?=
 =?iso-8859-1?Q?SRu2dfh/qwfCekY+pVTUT7lAtJxGVwDZz7owNxXvyKgepw2B7SCU3AKWpz?=
 =?iso-8859-1?Q?c3HiClrzO/CVeTA6bhQlRFUpmQMjnrIqalJersaOggdz/Nr+Mjrzw6Fy6/?=
 =?iso-8859-1?Q?wA++/eYICepBQBr65m6nM2J1rev+f1VEjtcZ6x1aTOj2BAyMtZjAjiQB/0?=
 =?iso-8859-1?Q?LV/8GdWJaII/rlndJeHrvHJIcG84z9cxwBiuNYhwwZ7N6nfbvqYIunkSsv?=
 =?iso-8859-1?Q?VsGv1lk9Seb6Vr4nQo6dMiP5a05J7ovCjeTdReCZ1IRxV5n992bcmLQfOM?=
 =?iso-8859-1?Q?sxr9Y1+oVffrRGZBK4lI7kkUf6C9JyiU9wmS1U7L2DyJDHZGVDF/Fy9bAj?=
 =?iso-8859-1?Q?D4FK/dcTNDUSpA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1mtA6ZbVZ9eu1rmXCgSTJ+SKMIkN00uWRp1JomBtFLqUcx5rnvxhME+RoK?=
 =?iso-8859-1?Q?k2akvXuNQ2akDOfaW4EjupyoBOzkn3tA+tEuD/ofYwtw8vK31U1CV1AIOf?=
 =?iso-8859-1?Q?6mnyaL1afxZU7DhrkndjgIWcy8T8w6hxwy/uWc8dBKXBJjCSq18Mt4FffK?=
 =?iso-8859-1?Q?6Xc5aihuIRkbrMy/QNMsbFvs9FSFGs1QBryfVBHNGD2JoTlh4iS8oxmsWP?=
 =?iso-8859-1?Q?0FWaQd9JduzQUQB6e8W9RNyTWH+5VyLcHfLCvB0JlBQGdSHcPCAoRLix19?=
 =?iso-8859-1?Q?nETE2eK2O9y96PtoPDEDfBYC/i3BKaxzbRGdAFmR/1VyyLJ0KcCsdMdVg6?=
 =?iso-8859-1?Q?YZTxHgrTQAtY7iokMj8NhcBwbM2hQhn/nPnRS1HVu+/NUh8Yps9jzHwIPU?=
 =?iso-8859-1?Q?piBt8vaCLgiMHrrRAGim5o5UQU6wTcJI2iuCd4IVPO5bdi97zGr3DckLQH?=
 =?iso-8859-1?Q?StZxd5lqO+jkHQ2ZnclZHZzhGpHua+gOSOg+DtWdNyBWcCm1yALm+PdjND?=
 =?iso-8859-1?Q?vjEP/CHp3pMEFFD1I4JR5rds1AdMneaWVsY6If8ADV5oy0i61asmh8BKqf?=
 =?iso-8859-1?Q?LZ2cslfzjezIjucYPE90D9cEPDB7u0SwlTJmAEVkHvwzwFZMNn/I24V0qX?=
 =?iso-8859-1?Q?zKWgI7ii4g4/kRB2ICI9o971slii4KW2V68B5gC7Z3n/iTS8yPFFJjCLM1?=
 =?iso-8859-1?Q?W98JBCIWWQGvWeivSmluZs7oQ458b4BxB46rw2R0KMVQQ4KRV81pbD6yrO?=
 =?iso-8859-1?Q?G8NfXADR3Y72KNHyROQEAYdFazbywxZXqf5ABNXI1aXAfxr3tuclMgQVZM?=
 =?iso-8859-1?Q?KQZNhis0b5RL65bugVwO1Q8MEp0Rw2SklphdqgvUa3LP2O3QcFsY5p/tT5?=
 =?iso-8859-1?Q?XrXUw7jkD2aRy11EqEMlNBcoA+TXUqmECfXp/n6cCA7cvbzL6e9bDeJRgF?=
 =?iso-8859-1?Q?c5tWA38+fGjHJiQ9g5NyvIzUXfQqkRH8D011Wdnl6dN6ZzdE0BeBpz7vQX?=
 =?iso-8859-1?Q?aWZH8FqNP6u284lP7nPyqtRE5nomhCMWcBgZ9dk8KxzkDTixGwE9EsrGV0?=
 =?iso-8859-1?Q?axQdJW0Li3ZWjtUI3FYSHhY/GWneCGHJTXyTWcGRAvC1m7inZYtvZO/BkT?=
 =?iso-8859-1?Q?snOmTubFQ/pnLd6PgQ/4IBflHllmJ6HoRrAsyi0WRwHXUHkmZ9z03+GcPr?=
 =?iso-8859-1?Q?zVLjR4f0RpI9wcLhJ28nOMbDK399TrhPWQ8yzW8AyICLVpAP6RDT+jeO1a?=
 =?iso-8859-1?Q?DHB7uW3vot76nNFLgrjHvx4/LuuL2GNwPIvzpLMrs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P194MB1431.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: da6ef03c-2644-4355-8318-08ddc8ba1426
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 00:52:48.3911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P194MB1954

From 07ba27cd3d71de21faad4f5dde83f2ee27a81b5c Mon Sep 17 00:00:00 2001=0A=
From: Imene Jaziri =0A=
Date: Tue, 22 Jul 2025 01:26:05 +0100=0A=
Subject: [PATCH] Add changes to uvcvideo driver Add a pr_info() in the=0A=
 uvc_probe function to trace when the uvcvideo driver is loaded. This is fo=
r=0A=
 learning purposes.=0A=
=0A=
Signed-off-by: Imene Jaziri =0A=
---=0A=
 drivers/media/usb/uvc/uvc_driver.c | 3 +--=0A=
 1 file changed, 1 insertion(+), 2 deletions(-)=0A=
=0A=
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc=
_driver.c=0A=
index da24a655ab68..4e5d1d636640 100644=0A=
--- a/drivers/media/usb/uvc/uvc_driver.c=0A=
+++ b/drivers/media/usb/uvc/uvc_driver.c=0A=
@@ -2170,7 +2170,6 @@ static int uvc_probe(struct usb_interface *intf,=0A=
 		(const struct uvc_device_info *)id-&gt;driver_info;=0A=
 	int function;=0A=
 	int ret;=0A=
-=0A=
 	/* Allocate memory for the device and initialize it. */=0A=
 	dev =3D kzalloc(sizeof(*dev), GFP_KERNEL);=0A=
 	if (dev =3D=3D NULL)=0A=
@@ -2188,7 +2187,7 @@ static int uvc_probe(struct usb_interface *intf,=0A=
 	dev-&gt;info =3D info ? info : &amp;uvc_quirk_none;=0A=
 	dev-&gt;quirks =3D uvc_quirks_param =3D=3D -1=0A=
 		    ? dev-&gt;info-&gt;quirks : uvc_quirks_param;=0A=
-=0A=
+	pr_info("I changed uvcvideo driver in the Linux Kernel\n");=0A=
 	if (id-&gt;idVendor &amp;&amp; id-&gt;idProduct)=0A=
 		uvc_dbg(dev, PROBE, "Probing known UVC device %s (%04x:%04x)\n",=0A=
 			udev-&gt;devpath, id-&gt;idVendor, id-&gt;idProduct);=0A=
-- =0A=
2.34.1=0A=
=0A=
=0A=

