Return-Path: <linux-media+bounces-48460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A625CAF891
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 11:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBD78301C659
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 10:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026693009F0;
	Tue,  9 Dec 2025 10:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="GD7itYv3"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021128.outbound.protection.outlook.com [40.107.57.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1723016F4;
	Tue,  9 Dec 2025 10:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765274499; cv=fail; b=WV9ljfMDmwd8xBe105/+MQSOO7hBLRmrZJN595pDGRsuYaaBO2Grnhz9SCeWLnxngtgLEP8N1ea3tpTL/8fhdDiIPzkoKrrdUAQIn4+UJLTMzWKKOFubrqdnEWOauBuDiRJFU6r9qmsdWCh9xrQF6yLoNqaDLXMi2bsHHM3CTVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765274499; c=relaxed/simple;
	bh=x0Ge9BKM7kr6YER7r4B26SfVbk/F6MoLuBYl9wvBnvk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PJz5V9uZBHJx3ydXObcQqJqltqpf5/tAr51+4eFZ51JnPvnAzLZLCIQ8z6YeLkOAauFcS0Hay6rBKpS7qPSlErOsdF6s/gUT0sFGQSsiPA2ypczBGL2Jzf2UZJznts3NqGxokdHdr9sATfgdPtsoxHolYN3x1po+H/pdymeov8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=GD7itYv3; arc=fail smtp.client-ip=40.107.57.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKugyG0UpJzMalCRUurFS9pvg8XDUuAWzpo4CeGUJwNQf7kTLjJ/WDIYoh1nfYt80kY/Omil3fwZzI28cYKBNDISL2eFuYARCVB/qi/MSW1AUuecw50OM2ySDsr7x59bcoED8ACL+B9ClerAywAzp7Am7X7XRCh9RKXWGOVZGHuej7PrCa2yYy76VbzcqOjPdq7t9PN6ZK6VMD+J/C3zzBwBCoGXTHQ8W3nBE0hYYEc2dDcwFQGAnVNahU7/CN84HwEPwkGUkEX9sqMlB1WKjweUqnKwfuPAd1ldHQFohsQ8NJN/enF64cASsCzSBLxbL2XC6YWpanU3v+jBuCSxqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAQERaEy2fwTfyAO5ih4Vzrkf6IGpViq9KhSU5E3Bj0=;
 b=pP9s1/6HArBJReOARE1yHCxTbVEbcyu96tRFl3pB7z/p+4O0tIwaoAOg557Nw897YelyMnGU462TifGVqYPPZ8vzssKTeOPsCm3o+3QKF03M6KKO9C3s6YbW9DXFIxn9LMZQ2u/PMLsmBzdsDzT2IbSxctPiiK8HKJDvFcc/zHKV+G3g4OpXAfSG/aPat1XBUvdLWMG1XurMTJ7qBhw/bFbkDXmX4sx7fP5NDLr1Mbx871t7xR79bZ0PwbEn6oEndGYEgMfExS6tj45TCl9WQTmqQ3zeyfqUaTntrW+epmgwtQw+Z4UCHrbtusOs/duZdZ7Wmdv6QOMv9tK6iJkmlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAQERaEy2fwTfyAO5ih4Vzrkf6IGpViq9KhSU5E3Bj0=;
 b=GD7itYv3twBSxFbI6GudWDcG3sErUxTjsP1bUimzmPXg1m3ThSYZ7sZ04AG3bv0wJjK7VrES4P/YSp9pfO001hHG3bOM2fI0Q9XVObJOFloEfupfmIVrERmBUY9qJfjSA4c6Ur9ThDf0Twsevpxs1Py1M2PKG5rmAfk/0x2vGujNNfiMQeAIot/+F9E5oGhgO1nqCU8T0yQR26X7bgFDtdvkutmzxnMrEhoGW8FchAYWhrb+haC4kpIRPAlHWlfYOveK+u9GbZLJ2bNFHItEGwtZCvoRD2C+tNdYZzT6ss4A7JKr/ehxVdwqrOeissyOsCt3B7ehEUsBdES0e2yPiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA5P287MB4563.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 10:01:30 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 10:01:30 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	krzk+dt@kernel.org,
	robh@kernel.org
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: add os05b10 image sensor driver
Date: Tue,  9 Dec 2025 15:30:06 +0530
Message-Id: <20251209100017.302518-3-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209100017.302518-1-himanshu.bhavani@siliconsignals.io>
References: <20251209100017.302518-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::28) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MA5P287MB4563:EE_
X-MS-Office365-Filtering-Correlation-Id: d53843b9-a28d-4baf-375e-08de3709ecc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8Oul1cCK79eQtDoSjFU+lIGC8jG9IdUhjKQ8hv4X+2T24OUfnyoRk4EsNZI6?=
 =?us-ascii?Q?f0hNg3aw96Fw7jb0xzvC2E0wWQuTgVUwnSyD0fyfJh+zUlTcem0T0EUQwtwu?=
 =?us-ascii?Q?a7BGIEuzSLDB296hXd202WacEQRqsMsaQ2Qkxi30IA1XyGMuHMe8N2ngsfss?=
 =?us-ascii?Q?GJW04QTcoJfNz/P7LKZlt6DHwAqL56dn+FNLRJAxD44NSOr2tk0CJ4E0faTJ?=
 =?us-ascii?Q?Yjlksy5gWcygHM22w9+UK4ZNVA5lE2f7nbrLUkjjRieOWILaHObiccVPSb7P?=
 =?us-ascii?Q?/Eu6J7pxxNTbuXEQlp+h9EjTjpgHLLl15jSwsfLpjkLCuzc+BZV4oYWRqpDh?=
 =?us-ascii?Q?6SqCYr6YJAEAkoZ7I4sVoVT7b57dFTdAH/GCssaoOdNT9x6ebFT810xbWaoS?=
 =?us-ascii?Q?ptzOJGSP51yb/tbNZ1c9Ei1djdthOUA7HrOxOhyCzjPKhl98QFGqW9a+eYWu?=
 =?us-ascii?Q?MT6z/HuCVp88mzDMtZXP5ko2nb1PpMyz1nZnkNyh4S0m1peIOMCEFXJdd0R4?=
 =?us-ascii?Q?VATRz0bq876jI6IqXa5X9lkmGF18XK207Ox8ocFlWjjIhCtPmuGtWmNdSZTK?=
 =?us-ascii?Q?PKEIc7g9FKCJbW9j4TUQk7XOoVTUf/BVBYHBlg/DteiyVXhKKT6Kh471eKS9?=
 =?us-ascii?Q?bXlbaUACpNKJwvcCylyplAID0Y1VcM+G1qWRJMaaQ7XdUKgTHVRQv2jEYwNL?=
 =?us-ascii?Q?lnVMP9LzEB6X8abqpoMgIeUndjlIuzQEDAKHBJJcZwvO5eNuPx3N0oxm9OHK?=
 =?us-ascii?Q?7YP88lBaUR61cUiu5rgajMkfXGxjVlzYor8RcVUAExxdKE6dj+/0NNyc5Af/?=
 =?us-ascii?Q?WC2FyQt7afs9bIotTUgnvWauKdwIq8ZixUTOck5wDgcqfTPhSgbNZPdQi5si?=
 =?us-ascii?Q?yf1Epbfa2QZJ7JsEXelbgXfEmymty17gnDMuehAIo8i4ue3VBNtHg86smU9+?=
 =?us-ascii?Q?8dbdJSxOsDUMMVGIOSklXCB6M3IR7KlZ1l2qyDWtF+P5Qnt8bKv1FBa3iw8q?=
 =?us-ascii?Q?6QNzuMKxdEo5P8FkMdVjTBXJAdjW1Z9WIxkc17nN8troCwrPagRyeVkrHf7U?=
 =?us-ascii?Q?uhq5PHqOp2Q9qaqYRXTbKyrAg1Z3niXUmVzyLaZm5QIAPAQ6JsIzOeBJvPNh?=
 =?us-ascii?Q?2DiPpK+QNunieg7o5ZmQt/HYuYDCIIMir6JmPF9hdgKfeIXzD0NT2ekp2hR5?=
 =?us-ascii?Q?+xFbVoItsH9oITAVf8T6lshGoNCHakYRcgLDJhuktSkShq472ANAF/Nx/lh7?=
 =?us-ascii?Q?tfpoQns0FK21tHf1ZPf40E5ljAVS4bBW2AFGQz5Up4k339AkaF/rMj2pACQA?=
 =?us-ascii?Q?HJITB5pv2Zn51Hdi6zvMb4MySoRihoDSNlV54KleDc6eewNRzaOfDs6cLKut?=
 =?us-ascii?Q?+n+neVyWGvhgdyIRlO++4USSE5wNRIhwJqN4pk7fVkr62m2NlZ+6ioMvSS1J?=
 =?us-ascii?Q?NxQWlAcc7zLk91Ga8Krk7ffEQikZzJDI6NDcIAaRPSzx5xqPaLRIDe2yQkPZ?=
 =?us-ascii?Q?McqSP9VR1os+kvbfjM8Lly+ZgfMFYYyd/W/A?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/7mgrRGkFwEWFT91oCVSApKkaHFQgA/UQtczb93SghHuEKufRMiQGZjeKwnN?=
 =?us-ascii?Q?kS17R8M8lQkK8MK8sbKcKejTSAlFRZ2AVHV+2kEK0clLurGTgZZlc3AsGYd1?=
 =?us-ascii?Q?pfaoL04qBPvtmhuhc7HGbezvwtCtNw84dAgY5zSa90RuM416gRx7rRkfFi1o?=
 =?us-ascii?Q?4ePZas1UNvPiQya+JX5vupbdMeaykgn6zQWwidUHN/ho7IipoRppfPl43ZCd?=
 =?us-ascii?Q?tyUl26HWOTDCOvVmorHi/gK8uT4UWbi8Lb4GBDIaU5Jf+dqUm6GBapCZDhLW?=
 =?us-ascii?Q?YftuGTK90qvLgpB3IONmrwVxg/RgYOCD1qhZwktVnLNYbjKoc4NfstQ7Sz+I?=
 =?us-ascii?Q?qb/h1AUb4MWJ1Yq/glvmW5Ra7Xuqa5C2Wur/MLpzCA4wl31RMKRvZEi1WGlw?=
 =?us-ascii?Q?V/yByJV7FfuD/DMuYUBzdTLDHEyan5ir/W36ba9f+NN/y0N60RUB6f5z9xXA?=
 =?us-ascii?Q?qc3t+q4zjEI/sftKEeGB6R2gF6wFi4Qgdz9lWLa2X9DUVmxpZ3zg2CVcPP5U?=
 =?us-ascii?Q?Kpoyj4VTkjIbTXf4AgPNqa33MzXaQd5veYie978b8qdgvwUe4XRneyTwIcqu?=
 =?us-ascii?Q?UKG/dsB/Kdc9+i5kD6gq+udS8sx1Fe7HjhYoaddxV1wzqcOgBdxP84gkKa+P?=
 =?us-ascii?Q?rqZ6GAnQ52A9cN80bQYXTrHpm7ojobsJ2z8xYLejIpant1fY5lYsotSwijTz?=
 =?us-ascii?Q?x0UdYjqSQfZ1VZ7o2atY17uEwF8WqNRaJ7ev6Q3d2xCN6xGZG4BqTrQKEz4I?=
 =?us-ascii?Q?ns93oEWDv1whwNTPI1+a96P19asc1YqNPTw+FZfI8RLw4Hi3V2N/aZVKBn9+?=
 =?us-ascii?Q?09EgP5yCEyQmQ9s48lAvSXXo/2bUki7Y3/dQLWNHFCifDlfyiqPGBsr10AYX?=
 =?us-ascii?Q?JY5f1ctLUxf12TC1E6WKt23v0shQMJSe4IUPkKzZAxKYVqF2b2wOBUC+gLAf?=
 =?us-ascii?Q?uyp8lGkJlHcxpeRnvgglIUI0jqR1x/NgvqShmVYDwn/o4Cn4RFDY4zc++Xff?=
 =?us-ascii?Q?pBnnQoq7e2GHdmdOF4lPFQ94NWco5LvNr/Y5KOvvJQhcDZVYptSz/bVttAyk?=
 =?us-ascii?Q?JLiU4VFoogXZCB9upirUIi7aSkTKRMcWedik8KpKl+HZEnBjitA9m1mZ7Umj?=
 =?us-ascii?Q?binPwe8IBEXQlrWj+BwqX09I396N5jhXDJ/iXfb2ilWBFsNMtON+P2+agANQ?=
 =?us-ascii?Q?yn/dymZcWUrmkpkbMxi1uU3lBrr1tkHcgg7VhT2P5/cP9tmnK85dC8ONrDdP?=
 =?us-ascii?Q?ksm1K8l/IgJOfwcGYkibZbrtaWG2g4VbAHL+1M/TsFaXw3PUeUwO6drioqbw?=
 =?us-ascii?Q?Ay39qD/TQFoV1yfsHiEGZSV7KqjTcs41WDzCy4Yaggk79k/61y7g/QL7PDF+?=
 =?us-ascii?Q?jv++D3lv8spG0X+QD/0gDzb3WSDM03pGl1OUdmUIXOYwnRLZst8bkSiZYKk+?=
 =?us-ascii?Q?4TctjjYPL8ezUkml45muM4LUHqQnfbWNZ7Eg01ne1AZSpZNX1XR99nIJ3+SD?=
 =?us-ascii?Q?vt/FHgGkdzfhL2XsNXqALXonTMKoEXGlfDxx6yWkJjSnmUiYR29222thO7Nk?=
 =?us-ascii?Q?IduKTm3pT5aMdfTM2h/vzEeRkCToV3q4+nblTpLZgec/5PKHLE7tb4OAcuLa?=
 =?us-ascii?Q?iMu5YmEdSf4pglQTcD12cFs=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: d53843b9-a28d-4baf-375e-08de3709ecc4
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 10:01:30.3135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h18JmoTfcDFVCQvFcSIAx/e61YGzXzcB0XVg+uuXKehQTkg0eFo5qxxnJeV0j35U4OOWQDyopFZFWuzMyvircsO0HYF5FkeO13zYb/dlOkStn2n14PZhBzofZWgo9iB9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4563

Add a v4l2 subdevice driver for the Omnivision OS05B10 sensor.

The Omnivision OS05B10 image sensor with an active
array size of 2592 x 1944.

The following features are supported:
- Manual exposure an gain control support
- vblank/hblank control support
- Supported resolution: 2592 x 1944 @ 60fps (SBGGR10)

Co-developed-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---
 MAINTAINERS                 |    1 +
 drivers/media/i2c/Kconfig   |   10 +
 drivers/media/i2c/Makefile  |    1 +
 drivers/media/i2c/os05b10.c | 1120 +++++++++++++++++++++++++++++++++++
 4 files changed, 1132 insertions(+)
 create mode 100644 drivers/media/i2c/os05b10.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f29afff9d139..58f49c7ae90d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19055,6 +19055,7 @@ M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
+F:	drivers/media/i2c/os05b10.c

 OMNIVISION OV01A10 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index cdd7ba5da0d5..3978676c01ed 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -361,6 +361,16 @@ config VIDEO_OG0VE1B
 	  To compile this driver as a module, choose M here: the
 	  module will be called og0ve1b.

+config VIDEO_OS05B10
+        tristate "OmniVision OS05B10 sensor support"
+        select V4L2_CCI_I2C
+        help
+          This is a Video4Linux2 sensor driver for Omnivision
+          OS05B10 camera sensor.
+
+	  To compile this driver as a module, choose M here: the
+          module's name is ov9734.
+
 config VIDEO_OV01A10
 	tristate "OmniVision OV01A10 sensor support"
 	help
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 57cdd8dc96f6..67d44401f2bb 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -83,6 +83,7 @@ obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
 obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
 obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
 obj-$(CONFIG_VIDEO_OG0VE1B) += og0ve1b.o
+obj-$(CONFIG_VIDEO_OS05B10) += os05b10.o
 obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
 obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
 obj-$(CONFIG_VIDEO_OV02C10) += ov02c10.o
diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
new file mode 100644
index 000000000000..dabe300ad4e9
--- /dev/null
+++ b/drivers/media/i2c/os05b10.c
@@ -0,0 +1,1120 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * V4L2 Support for the os05b10
+ *
+ * Copyright (C) 2025 Silicon Signals Pvt. Ltd.
+ *
+ * Inspired from imx219, ov2735 camera drivers.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/device/devres.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+#include <linux/units.h>
+#include <linux/types.h>
+#include <linux/time.h>
+
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mediabus.h>
+
+#define OS05B10_XCLK_FREQ		(24 * HZ_PER_MHZ)
+
+#define OS05B10_REG_CHIP_ID		CCI_REG24(0x300A)
+#define OS05B10_CHIP_ID			0x530641
+
+#define OS05B10_REG_CTRL_MODE		CCI_REG8(0x0100)
+#define OS05B10_MODE_STANDBY		0x00
+#define OS05B10_MODE_STREAMING		0x01
+
+#define OS05B10_REG_VTS			CCI_REG16(0x380E)
+#define OS05B10_VTS_MAX			0xFFFF
+
+#define OS05B10_REG_HTS			CCI_REG16(0x380C)
+
+#define OS05B10_ANALOG_GAIN		CCI_REG16(0x3508)
+#define OS05B10_ANALOG_GAIN_MIN		0x80
+#define OS05B10_ANALOG_GAIN_MAX		0x7C0
+#define OS05B10_ANALOG_GAIN_STEP	1
+#define OS05B10_ANALOG_GAIN_DEFAULT     0x80
+
+#define OS05B10_EXPOSURE_GAIN		CCI_REG24(0x3500)
+#define OS05B10_EXPOSURE_MIN		2
+#define OS05B10_EXPOSURE_STEP		1
+#define OS05B10_EXPOSURE_MARGIN         8
+
+#define OS05B10_PIXEL_RATE		(480 * HZ_PER_MHZ)
+#define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
+
+static const struct v4l2_rect os05b10_native_area = {
+	.top = 0,
+	.left = 0,
+	.width = 2608,
+	.height = 1960,
+};
+
+static const struct v4l2_rect os05b10_active_area = {
+	.top = 8,
+	.left = 8,
+	.width = 2592,
+	.height = 1944,
+};
+
+static const char * const os05b10_supply_name[] = {
+	"avdd", /*Analog supply 2.8v */
+	"dvdd", /*Digital core 1.2v */
+	"dovdd", /*Digital IO 1.8v */
+};
+
+static const struct cci_reg_sequence os05b10_common_regs[] = {
+	{ CCI_REG8(0x0103), 0x01 },
+	{ CCI_REG8(0x0301), 0x44 },
+	{ CCI_REG8(0x0303), 0x02 },
+	{ CCI_REG8(0x0305), 0x32 },
+	{ CCI_REG8(0x0306), 0x00 },
+	{ CCI_REG8(0x0325), 0x3b },
+	{ CCI_REG8(0x3002), 0x21 },
+	{ CCI_REG8(0x3016), 0x72 },
+	{ CCI_REG8(0x301e), 0xb4 },
+	{ CCI_REG8(0x301f), 0xd0 },
+	{ CCI_REG8(0x3021), 0x03 },
+	{ CCI_REG8(0x3022), 0x01 },
+	{ CCI_REG8(0x3107), 0xa1 },
+	{ CCI_REG8(0x3108), 0x7d },
+	{ CCI_REG8(0x3109), 0xfc },
+	{ CCI_REG8(0x3500), 0x00 },
+	{ CCI_REG8(0x3501), 0x07 },
+	{ CCI_REG8(0x3502), 0xb6 },
+	{ CCI_REG8(0x3503), 0x88 },
+	{ CCI_REG8(0x3508), 0x00 },
+	{ CCI_REG8(0x3509), 0x80 },
+	{ CCI_REG8(0x350a), 0x04 },
+	{ CCI_REG8(0x350b), 0x00 },
+	{ CCI_REG8(0x350c), 0x00 },
+	{ CCI_REG8(0x350d), 0x80 },
+	{ CCI_REG8(0x350e), 0x04 },
+	{ CCI_REG8(0x350f), 0x00 },
+	{ CCI_REG8(0x3510), 0x00 },
+	{ CCI_REG8(0x3511), 0x00 },
+	{ CCI_REG8(0x3512), 0x20 },
+	{ CCI_REG8(0x3600), 0x4d },
+	{ CCI_REG8(0x3601), 0x08 },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3611), 0x24 },
+	{ CCI_REG8(0x3614), 0x4c },
+	{ CCI_REG8(0x3620), 0x0c },
+	{ CCI_REG8(0x3632), 0x80 },
+	{ CCI_REG8(0x3633), 0x00 },
+	{ CCI_REG8(0x3636), 0xcc },
+	{ CCI_REG8(0x3637), 0x27 },
+	{ CCI_REG8(0x3660), 0x00 },
+	{ CCI_REG8(0x3662), 0x10 },
+	{ CCI_REG8(0x3665), 0x00 },
+	{ CCI_REG8(0x3666), 0x00 },
+	{ CCI_REG8(0x366a), 0x14 },
+	{ CCI_REG8(0x3670), 0x0b },
+	{ CCI_REG8(0x3671), 0x0b },
+	{ CCI_REG8(0x3672), 0x0b },
+	{ CCI_REG8(0x3673), 0x0b },
+	{ CCI_REG8(0x3678), 0x2b },
+	{ CCI_REG8(0x367a), 0x11 },
+	{ CCI_REG8(0x367b), 0x11 },
+	{ CCI_REG8(0x367c), 0x11 },
+	{ CCI_REG8(0x367d), 0x11 },
+	{ CCI_REG8(0x3681), 0xff },
+	{ CCI_REG8(0x3682), 0x86 },
+	{ CCI_REG8(0x3683), 0x44 },
+	{ CCI_REG8(0x3684), 0x24 },
+	{ CCI_REG8(0x3685), 0x00 },
+	{ CCI_REG8(0x368a), 0x00 },
+	{ CCI_REG8(0x368d), 0x2b },
+	{ CCI_REG8(0x368e), 0x2b },
+	{ CCI_REG8(0x3690), 0x00 },
+	{ CCI_REG8(0x3691), 0x0b },
+	{ CCI_REG8(0x3692), 0x0b },
+	{ CCI_REG8(0x3693), 0x0b },
+	{ CCI_REG8(0x3694), 0x0b },
+	{ CCI_REG8(0x369d), 0x68 },
+	{ CCI_REG8(0x369e), 0x34 },
+	{ CCI_REG8(0x369f), 0x1b },
+	{ CCI_REG8(0x36a0), 0x0f },
+	{ CCI_REG8(0x36a1), 0x77 },
+	{ CCI_REG8(0x36b0), 0x30 },
+	{ CCI_REG8(0x36b2), 0x00 },
+	{ CCI_REG8(0x36b3), 0x00 },
+	{ CCI_REG8(0x36b4), 0x00 },
+	{ CCI_REG8(0x36b5), 0x00 },
+	{ CCI_REG8(0x36b6), 0x00 },
+	{ CCI_REG8(0x36b7), 0x00 },
+	{ CCI_REG8(0x36b8), 0x00 },
+	{ CCI_REG8(0x36b9), 0x00 },
+	{ CCI_REG8(0x36ba), 0x00 },
+	{ CCI_REG8(0x36bb), 0x00 },
+	{ CCI_REG8(0x36bc), 0x00 },
+	{ CCI_REG8(0x36bd), 0x00 },
+	{ CCI_REG8(0x36be), 0x00 },
+	{ CCI_REG8(0x36bf), 0x00 },
+	{ CCI_REG8(0x36c0), 0x01 },
+	{ CCI_REG8(0x36c1), 0x00 },
+	{ CCI_REG8(0x36c2), 0x00 },
+	{ CCI_REG8(0x36c3), 0x00 },
+	{ CCI_REG8(0x36c4), 0x00 },
+	{ CCI_REG8(0x36c5), 0x00 },
+	{ CCI_REG8(0x36c6), 0x00 },
+	{ CCI_REG8(0x36c7), 0x00 },
+	{ CCI_REG8(0x36c8), 0x00 },
+	{ CCI_REG8(0x36c9), 0x00 },
+	{ CCI_REG8(0x36ca), 0x0e },
+	{ CCI_REG8(0x36cb), 0x0e },
+	{ CCI_REG8(0x36cc), 0x0e },
+	{ CCI_REG8(0x36cd), 0x0e },
+	{ CCI_REG8(0x36ce), 0x0c },
+	{ CCI_REG8(0x36cf), 0x0c },
+	{ CCI_REG8(0x36d0), 0x0c },
+	{ CCI_REG8(0x36d1), 0x0c },
+	{ CCI_REG8(0x36d2), 0x00 },
+	{ CCI_REG8(0x36d3), 0x08 },
+	{ CCI_REG8(0x36d4), 0x10 },
+	{ CCI_REG8(0x36d5), 0x10 },
+	{ CCI_REG8(0x36d6), 0x00 },
+	{ CCI_REG8(0x36d7), 0x08 },
+	{ CCI_REG8(0x36d8), 0x10 },
+	{ CCI_REG8(0x36d9), 0x10 },
+	{ CCI_REG8(0x3701), 0x1d },
+	{ CCI_REG8(0x3703), 0x2a },
+	{ CCI_REG8(0x3704), 0x05 },
+	{ CCI_REG8(0x3709), 0x57 },
+	{ CCI_REG8(0x370b), 0x63 },
+	{ CCI_REG8(0x3706), 0x28 },
+	{ CCI_REG8(0x370a), 0x00 },
+	{ CCI_REG8(0x370b), 0x63 },
+	{ CCI_REG8(0x370e), 0x0c },
+	{ CCI_REG8(0x370f), 0x1c },
+	{ CCI_REG8(0x3710), 0x00 },
+	{ CCI_REG8(0x3713), 0x00 },
+	{ CCI_REG8(0x3714), 0x24 },
+	{ CCI_REG8(0x3716), 0x24 },
+	{ CCI_REG8(0x371a), 0x1e },
+	{ CCI_REG8(0x3724), 0x09 },
+	{ CCI_REG8(0x3725), 0xb2 },
+	{ CCI_REG8(0x372b), 0x54 },
+	{ CCI_REG8(0x3730), 0xe1 },
+	{ CCI_REG8(0x3735), 0x80 },
+	{ CCI_REG8(0x3739), 0x10 },
+	{ CCI_REG8(0x373f), 0xb0 },
+	{ CCI_REG8(0x3740), 0x28 },
+	{ CCI_REG8(0x3741), 0x21 },
+	{ CCI_REG8(0x3742), 0x21 },
+	{ CCI_REG8(0x3743), 0x21 },
+	{ CCI_REG8(0x3744), 0x63 },
+	{ CCI_REG8(0x3745), 0x5a },
+	{ CCI_REG8(0x3746), 0x5a },
+	{ CCI_REG8(0x3747), 0x5a },
+	{ CCI_REG8(0x3748), 0x00 },
+	{ CCI_REG8(0x3749), 0x00 },
+	{ CCI_REG8(0x374a), 0x00 },
+	{ CCI_REG8(0x374b), 0x00 },
+	{ CCI_REG8(0x3756), 0x00 },
+	{ CCI_REG8(0x3757), 0x0e },
+	{ CCI_REG8(0x375d), 0x84 },
+	{ CCI_REG8(0x3760), 0x11 },
+	{ CCI_REG8(0x3767), 0x08 },
+	{ CCI_REG8(0x376f), 0x42 },
+	{ CCI_REG8(0x3771), 0x00 },
+	{ CCI_REG8(0x3773), 0x01 },
+	{ CCI_REG8(0x3774), 0x02 },
+	{ CCI_REG8(0x3775), 0x12 },
+	{ CCI_REG8(0x3776), 0x02 },
+	{ CCI_REG8(0x377b), 0x40 },
+	{ CCI_REG8(0x377c), 0x00 },
+	{ CCI_REG8(0x377d), 0x0c },
+	{ CCI_REG8(0x3782), 0x02 },
+	{ CCI_REG8(0x3787), 0x24 },
+	{ CCI_REG8(0x378a), 0x01 },
+	{ CCI_REG8(0x378d), 0x00 },
+	{ CCI_REG8(0x3790), 0x1f },
+	{ CCI_REG8(0x3791), 0x58 },
+	{ CCI_REG8(0x3795), 0x24 },
+	{ CCI_REG8(0x3796), 0x01 },
+	{ CCI_REG8(0x3798), 0x40 },
+	{ CCI_REG8(0x379c), 0x00 },
+	{ CCI_REG8(0x379d), 0x00 },
+	{ CCI_REG8(0x379e), 0x00 },
+	{ CCI_REG8(0x379f), 0x01 },
+	{ CCI_REG8(0x37a1), 0x10 },
+	{ CCI_REG8(0x37a6), 0x00 },
+	{ CCI_REG8(0x37ab), 0x0e },
+	{ CCI_REG8(0x37ac), 0xa0 },
+	{ CCI_REG8(0x37be), 0x0a },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37bb), 0x02 },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37c2), 0x04 },
+	{ CCI_REG8(0x37c4), 0x11 },
+	{ CCI_REG8(0x37c5), 0x80 },
+	{ CCI_REG8(0x37c6), 0x14 },
+	{ CCI_REG8(0x37c7), 0x08 },
+	{ CCI_REG8(0x37c8), 0x42 },
+	{ CCI_REG8(0x37cd), 0x17 },
+	{ CCI_REG8(0x37ce), 0x01 },
+	{ CCI_REG8(0x37d8), 0x02 },
+	{ CCI_REG8(0x37d9), 0x08 },
+	{ CCI_REG8(0x37dc), 0x01 },
+	{ CCI_REG8(0x37e0), 0x0c },
+	{ CCI_REG8(0x37e1), 0x20 },
+	{ CCI_REG8(0x37e2), 0x10 },
+	{ CCI_REG8(0x37e3), 0x04 },
+	{ CCI_REG8(0x37e4), 0x28 },
+	{ CCI_REG8(0x37e5), 0x02 },
+	{ CCI_REG8(0x37ef), 0x00 },
+	{ CCI_REG8(0x37f4), 0x00 },
+	{ CCI_REG8(0x37f5), 0x00 },
+	{ CCI_REG8(0x37f6), 0x00 },
+	{ CCI_REG8(0x37f7), 0x00 },
+	{ CCI_REG8(0x3800), 0x01 },
+	{ CCI_REG8(0x3801), 0x30 },
+	{ CCI_REG8(0x3802), 0x00 },
+	{ CCI_REG8(0x3803), 0x00 },
+	{ CCI_REG8(0x3804), 0x0b },
+	{ CCI_REG8(0x3805), 0x5f },
+	{ CCI_REG8(0x3806), 0x07 },
+	{ CCI_REG8(0x3807), 0xa7 },
+	{ CCI_REG8(0x3808), 0x0a },
+	{ CCI_REG8(0x3809), 0x20 },
+	{ CCI_REG8(0x380a), 0x07 },
+	{ CCI_REG8(0x380b), 0x98 },
+	{ CCI_REG8(0x380c), 0x06 },
+	{ CCI_REG8(0x380d), 0xd0 },
+	{ CCI_REG8(0x380e), 0x07 },
+	{ CCI_REG8(0x380f), 0xd6 },
+	{ CCI_REG8(0x3810), 0x00 },
+	{ CCI_REG8(0x3811), 0x08 },
+	{ CCI_REG8(0x3812), 0x00 },
+	{ CCI_REG8(0x3813), 0x08 },
+	{ CCI_REG8(0x3814), 0x01 },
+	{ CCI_REG8(0x3815), 0x01 },
+	{ CCI_REG8(0x3816), 0x01 },
+	{ CCI_REG8(0x3817), 0x01 },
+	{ CCI_REG8(0x3818), 0x00 },
+	{ CCI_REG8(0x3819), 0x00 },
+	{ CCI_REG8(0x381a), 0x00 },
+	{ CCI_REG8(0x381b), 0x01 },
+	{ CCI_REG8(0x3820), 0x88 },
+	{ CCI_REG8(0x3821), 0x00 },
+	{ CCI_REG8(0x3822), 0x12 },
+	{ CCI_REG8(0x3823), 0x08 },
+	{ CCI_REG8(0x3824), 0x00 },
+	{ CCI_REG8(0x3825), 0x20 },
+	{ CCI_REG8(0x3826), 0x00 },
+	{ CCI_REG8(0x3827), 0x08 },
+	{ CCI_REG8(0x3829), 0x03 },
+	{ CCI_REG8(0x382a), 0x00 },
+	{ CCI_REG8(0x382b), 0x00 },
+	{ CCI_REG8(0x3832), 0x08 },
+	{ CCI_REG8(0x3838), 0x00 },
+	{ CCI_REG8(0x3839), 0x00 },
+	{ CCI_REG8(0x383a), 0x00 },
+	{ CCI_REG8(0x383b), 0x00 },
+	{ CCI_REG8(0x383d), 0x01 },
+	{ CCI_REG8(0x383e), 0x00 },
+	{ CCI_REG8(0x383f), 0x00 },
+	{ CCI_REG8(0x3843), 0x00 },
+	{ CCI_REG8(0x3880), 0x16 },
+	{ CCI_REG8(0x3881), 0x00 },
+	{ CCI_REG8(0x3882), 0x08 },
+	{ CCI_REG8(0x389a), 0x00 },
+	{ CCI_REG8(0x389b), 0x00 },
+	{ CCI_REG8(0x38a2), 0x02 },
+	{ CCI_REG8(0x38a3), 0x02 },
+	{ CCI_REG8(0x38a4), 0x02 },
+	{ CCI_REG8(0x38a5), 0x02 },
+	{ CCI_REG8(0x38a7), 0x04 },
+	{ CCI_REG8(0x38b8), 0x02 },
+	{ CCI_REG8(0x3c80), 0x3e },
+	{ CCI_REG8(0x3c86), 0x01 },
+	{ CCI_REG8(0x3c87), 0x02 },
+	{ CCI_REG8(0x389c), 0x00 },
+	{ CCI_REG8(0x3ca2), 0x0c },
+	{ CCI_REG8(0x3d85), 0x1b },
+	{ CCI_REG8(0x3d8c), 0x01 },
+	{ CCI_REG8(0x3d8d), 0xe2 },
+	{ CCI_REG8(0x3f00), 0xcb },
+	{ CCI_REG8(0x3f03), 0x08 },
+	{ CCI_REG8(0x3f9e), 0x07 },
+	{ CCI_REG8(0x3f9f), 0x04 },
+	{ CCI_REG8(0x4000), 0xf3 },
+	{ CCI_REG8(0x4002), 0x00 },
+	{ CCI_REG8(0x4003), 0x40 },
+	{ CCI_REG8(0x4008), 0x02 },
+	{ CCI_REG8(0x4009), 0x0d },
+	{ CCI_REG8(0x400a), 0x01 },
+	{ CCI_REG8(0x400b), 0x00 },
+	{ CCI_REG8(0x4040), 0x00 },
+	{ CCI_REG8(0x4041), 0x07 },
+	{ CCI_REG8(0x4090), 0x14 },
+	{ CCI_REG8(0x40b0), 0x01 },
+	{ CCI_REG8(0x40b1), 0x01 },
+	{ CCI_REG8(0x40b2), 0x30 },
+	{ CCI_REG8(0x40b3), 0x04 },
+	{ CCI_REG8(0x40b4), 0xe8 },
+	{ CCI_REG8(0x40b5), 0x01 },
+	{ CCI_REG8(0x40b7), 0x07 },
+	{ CCI_REG8(0x40b8), 0xff },
+	{ CCI_REG8(0x40b9), 0x00 },
+	{ CCI_REG8(0x40ba), 0x00 },
+	{ CCI_REG8(0x4300), 0xff },
+	{ CCI_REG8(0x4301), 0x00 },
+	{ CCI_REG8(0x4302), 0x0f },
+	{ CCI_REG8(0x4303), 0x20 },
+	{ CCI_REG8(0x4304), 0x20 },
+	{ CCI_REG8(0x4305), 0x83 },
+	{ CCI_REG8(0x4306), 0x21 },
+	{ CCI_REG8(0x430d), 0x00 },
+	{ CCI_REG8(0x4505), 0xc4 },
+	{ CCI_REG8(0x4506), 0x00 },
+	{ CCI_REG8(0x4507), 0x60 },
+	{ CCI_REG8(0x4803), 0x00 },
+	{ CCI_REG8(0x4809), 0x8e },
+	{ CCI_REG8(0x480e), 0x00 },
+	{ CCI_REG8(0x4813), 0x00 },
+	{ CCI_REG8(0x4814), 0x2a },
+	{ CCI_REG8(0x481b), 0x40 },
+	{ CCI_REG8(0x481f), 0x30 },
+	{ CCI_REG8(0x4825), 0x34 },
+	{ CCI_REG8(0x4829), 0x64 },
+	{ CCI_REG8(0x4837), 0x12 },
+	{ CCI_REG8(0x484b), 0x07 },
+	{ CCI_REG8(0x4883), 0x36 },
+	{ CCI_REG8(0x4885), 0x03 },
+	{ CCI_REG8(0x488b), 0x00 },
+	{ CCI_REG8(0x4d06), 0x01 },
+	{ CCI_REG8(0x4e00), 0x2a },
+	{ CCI_REG8(0x4e0d), 0x00 },
+	{ CCI_REG8(0x5000), 0xf9 },
+	{ CCI_REG8(0x5001), 0x09 },
+	{ CCI_REG8(0x5004), 0x00 },
+	{ CCI_REG8(0x5005), 0x0e },
+	{ CCI_REG8(0x5036), 0x00 },
+	{ CCI_REG8(0x5080), 0x04 },
+	{ CCI_REG8(0x5082), 0x00 },
+	{ CCI_REG8(0x5180), 0x00 },
+	{ CCI_REG8(0x5181), 0x10 },
+	{ CCI_REG8(0x5182), 0x01 },
+	{ CCI_REG8(0x5183), 0xdf },
+	{ CCI_REG8(0x5184), 0x02 },
+	{ CCI_REG8(0x5185), 0x6c },
+	{ CCI_REG8(0x5189), 0x48 },
+	{ CCI_REG8(0x520a), 0x03 },
+	{ CCI_REG8(0x520b), 0x0f },
+	{ CCI_REG8(0x520c), 0x3f },
+	{ CCI_REG8(0x580b), 0x03 },
+	{ CCI_REG8(0x580d), 0x00 },
+	{ CCI_REG8(0x580f), 0x00 },
+	{ CCI_REG8(0x5820), 0x00 },
+	{ CCI_REG8(0x5821), 0x00 },
+	{ CCI_REG8(0x3222), 0x03 },
+	{ CCI_REG8(0x3208), 0x06 },
+	{ CCI_REG8(0x3701), 0x1d },
+	{ CCI_REG8(0x37ab), 0x01 },
+	{ CCI_REG8(0x3790), 0x21 },
+	{ CCI_REG8(0x38be), 0x00 },
+	{ CCI_REG8(0x3791), 0x5a },
+	{ CCI_REG8(0x37bf), 0x1c },
+	{ CCI_REG8(0x3610), 0x37 },
+	{ CCI_REG8(0x3208), 0x16 },
+	{ CCI_REG8(0x3208), 0x07 },
+	{ CCI_REG8(0x3701), 0x1d },
+	{ CCI_REG8(0x37ab), 0x0e },
+	{ CCI_REG8(0x3790), 0x21 },
+	{ CCI_REG8(0x38be), 0x00 },
+	{ CCI_REG8(0x3791), 0x5a },
+	{ CCI_REG8(0x37bf), 0x0a },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3208), 0x17 },
+	{ CCI_REG8(0x3208), 0x08 },
+	{ CCI_REG8(0x3701), 0x1d },
+	{ CCI_REG8(0x37ab), 0x0e },
+	{ CCI_REG8(0x3790), 0x21 },
+	{ CCI_REG8(0x38be), 0x00 },
+	{ CCI_REG8(0x3791), 0x5a },
+	{ CCI_REG8(0x37bf), 0x0a },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3208), 0x18 },
+	{ CCI_REG8(0x3208), 0x09 },
+	{ CCI_REG8(0x3701), 0x1d },
+	{ CCI_REG8(0x37ab), 0x0e },
+	{ CCI_REG8(0x3790), 0x28 },
+	{ CCI_REG8(0x38be), 0x00 },
+	{ CCI_REG8(0x3791), 0x63 },
+	{ CCI_REG8(0x37bf), 0x0a },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3208), 0x19 },
+};
+
+struct os05b10 {
+	struct device *dev;
+	struct regmap *cci;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct clk *xclk;
+	struct i2c_client *client;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(os05b10_supply_name)];
+
+	/* V4L2 Controls */
+	struct v4l2_ctrl_handler handler;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *gain;
+	struct v4l2_ctrl *exposure;
+
+	unsigned long link_freq_index;
+};
+
+struct os05b10_mode {
+	u32 width;
+	u32 height;
+	u32 vts; /* default VTS */
+	u32 hts; /* default HTS */
+	u32 exp; /* default exposure */
+};
+
+static const struct os05b10_mode supported_modes_10bit[] = {
+	{
+		/* 2592x1944 */
+		.width = 2592,
+		.height = 1944,
+		.vts = 2006,
+		.hts = 2616,
+		.exp = 1944,
+	},
+};
+
+static const s64 link_frequencies[] = {
+	OS05B10_LINK_FREQ_600MHZ,
+};
+
+static const u32 os05b10_mbus_codes[] = {
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+};
+
+static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
+{
+	return container_of_const(sd, struct os05b10, sd);
+};
+
+static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
+						     struct os05b10, handler);
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+	int vmax, ret;
+
+	state = v4l2_subdev_get_locked_active_state(&os05b10->sd);
+	fmt = v4l2_subdev_state_get_format(state, 0);
+
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		/* Honour the VBLANK limits when setting exposure. */
+		s64 max = fmt->height + ctrl->val - OS05B10_EXPOSURE_MARGIN;
+
+		ret = __v4l2_ctrl_modify_range(os05b10->exposure,
+					       os05b10->exposure->minimum, max,
+					       os05b10->exposure->step,
+					       os05b10->exposure->default_value);
+
+		if (ret)
+			return ret;
+	}
+
+	if (pm_runtime_get_if_in_use(os05b10->dev) == 0)
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		vmax = fmt->height + ctrl->val;
+		ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vmax, NULL);
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = cci_write(os05b10->cci, OS05B10_ANALOG_GAIN, ctrl->val,
+				NULL);
+		break;
+	case V4L2_CID_EXPOSURE:
+		ret = cci_write(os05b10->cci, OS05B10_EXPOSURE_GAIN, ctrl->val,
+				NULL);
+		break;
+	default:
+		dev_err(os05b10->dev, "ctrl(id:0x%x, val:0x%x) is not handled\n",
+			ctrl->id, ctrl->val);
+		break;
+	}
+
+	pm_runtime_put(os05b10->dev);
+
+	return ret;
+}
+
+static int os05b10_get_regulators(struct os05b10 *os05b10)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(os05b10_supply_name); i++)
+		os05b10->supplies[i].supply = os05b10_supply_name[i];
+
+	return devm_regulator_bulk_get(os05b10->dev,
+				       ARRAY_SIZE(os05b10_supply_name),
+				       os05b10->supplies);
+}
+
+static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
+		return -EINVAL;
+
+	code->code = os05b10_mbus_codes[code->index];
+
+	return 0;
+}
+
+static int os05b10_set_framing_limits(struct os05b10 *os05b10,
+				      const struct os05b10_mode *mode)
+{
+	u32 hblank, vblank, vblank_max, max_exp;
+	int ret;
+
+	hblank = mode->hts - mode->width;
+	ret = __v4l2_ctrl_modify_range(os05b10->hblank, hblank, hblank, 1, hblank);
+	if (ret)
+		return ret;
+
+	vblank = mode->vts - mode->height;
+	vblank_max = OS05B10_VTS_MAX - mode->height;
+	ret = __v4l2_ctrl_modify_range(os05b10->vblank, 0, vblank_max, 1, vblank);
+	if (ret)
+		return ret;
+
+	max_exp = mode->vts - OS05B10_EXPOSURE_MARGIN;
+	return __v4l2_ctrl_modify_range(os05b10->exposure,
+					OS05B10_EXPOSURE_MIN, max_exp,
+					OS05B10_EXPOSURE_STEP, mode->exp);
+}
+
+static int os05b10_set_pad_format(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_format *fmt)
+{
+	struct v4l2_mbus_framefmt *format;
+	const struct os05b10_mode *mode = &supported_modes_10bit[0];
+	struct os05b10 *os05b10 = to_os05b10(sd);
+	int ret;
+
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
+
+	format = v4l2_subdev_state_get_format(sd_state, 0);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		ret = os05b10_set_framing_limits(os05b10, mode);
+		if (ret)
+			return ret;
+	}
+
+	*format = fmt->format;
+
+	return 0;
+}
+
+static int os05b10_get_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r = os05b10_native_area;
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r = os05b10_active_area;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int os05b10_enum_frame_size(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index >= ARRAY_SIZE(supported_modes_10bit))
+		return -EINVAL;
+
+	if (fse->index >= 1)
+		return -EINVAL;
+
+	fse->min_width = supported_modes_10bit[fse->index].width;
+	fse->max_width = fse->min_width;
+	fse->min_height = supported_modes_10bit[fse->index].height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static int os05b10_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad,
+				  u64 streams_mask)
+{
+	struct os05b10 *os05b10 = to_os05b10(sd);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(os05b10->dev);
+	if (ret < 0)
+		return ret;
+
+	/* Write common registers */
+	ret = cci_multi_reg_write(os05b10->cci, os05b10_common_regs,
+				  ARRAY_SIZE(os05b10_common_regs), NULL);
+	if (ret) {
+		dev_err(os05b10->dev, "%s failed to write common registers\n",
+			__func__);
+		goto err_rpm_put;
+	}
+
+	/* Apply customized user controls */
+	ret = __v4l2_ctrl_handler_setup(os05b10->sd.ctrl_handler);
+	if (ret)
+		goto err_rpm_put;
+
+	/* Stream ON */
+	ret = cci_write(os05b10->cci, OS05B10_REG_CTRL_MODE,
+			OS05B10_MODE_STREAMING, NULL);
+	if (ret)
+		goto err_rpm_put;
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put(os05b10->dev);
+	return ret;
+}
+
+static int os05b10_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   u32 pad,
+				   u64 streams_mask)
+{
+	struct os05b10 *os05b10 = to_os05b10(sd);
+	int ret;
+
+	ret = cci_write(os05b10->cci, OS05B10_REG_CTRL_MODE,
+			OS05B10_MODE_STANDBY, NULL);
+	if (ret)
+		dev_err(os05b10->dev, "%s failed to set stream off\n", __func__);
+
+	pm_runtime_put(os05b10->dev);
+
+	return ret;
+}
+
+static int os05b10_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *format;
+	const struct os05b10_mode *mode;
+
+	/* Initialize try_fmt */
+	format = v4l2_subdev_state_get_format(state, 0);
+
+	mode = &supported_modes_10bit[0];
+	format->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+
+	/* Update image pad formate */
+	format->width = mode->width;
+	format->height = mode->height;
+	format->field = V4L2_FIELD_NONE;
+	format->colorspace = V4L2_COLORSPACE_RAW;
+	format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	format->xfer_func = V4L2_XFER_FUNC_NONE;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops os05b10_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops os05b10_pad_ops = {
+	.enum_mbus_code = os05b10_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = os05b10_set_pad_format,
+	.get_selection = os05b10_get_selection,
+	.enum_frame_size = os05b10_enum_frame_size,
+	.enable_streams = os05b10_enable_streams,
+	.disable_streams = os05b10_disable_streams,
+};
+
+static const struct v4l2_subdev_internal_ops os05b10_internal_ops = {
+	.init_state = os05b10_init_state,
+};
+
+static const struct v4l2_subdev_ops os05b10_subdev_ops = {
+	.video = &os05b10_video_ops,
+	.pad = &os05b10_pad_ops,
+};
+
+static const struct v4l2_ctrl_ops os05b10_ctrl_ops = {
+	.s_ctrl = os05b10_set_ctrl,
+};
+
+static int os05b10_identify_module(struct os05b10 *os05b10)
+{
+	int ret;
+	u64 val;
+
+	ret = cci_read(os05b10->cci, OS05B10_REG_CHIP_ID, &val, NULL);
+	if (ret)
+		return dev_err_probe(os05b10->dev, ret,
+				     "failed to read chip id %x\n",
+				     OS05B10_CHIP_ID);
+
+	if (val != OS05B10_CHIP_ID)
+		return dev_err_probe(os05b10->dev, -EIO,
+				     "chip id mismatch: %x!=%llx\n",
+				     OS05B10_CHIP_ID, val);
+	return 0;
+}
+
+static int os05b10_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct os05b10 *os05b10 = to_os05b10(sd);
+	unsigned long delay_us;
+	int ret;
+
+	/* Enable power rails */
+	ret = regulator_bulk_enable(ARRAY_SIZE(os05b10_supply_name),
+				    os05b10->supplies);
+	if (ret) {
+		dev_err(os05b10->dev, "failed to enable regulators\n");
+		return ret;
+	}
+
+	/* Enable xclk */
+	ret = clk_prepare_enable(os05b10->xclk);
+	if (ret) {
+		dev_err(os05b10->dev, "failed to enable clock\n");
+		goto err_regulator_off;
+	}
+
+	/* XSHUTDN rising */
+	gpiod_set_value_cansleep(os05b10->reset_gpio, 1);
+
+	/* Delay T1 */
+	fsleep(5 * USEC_PER_MSEC);
+
+	/* Delay T2 (8192 cycles before SCCB/I2C access) */
+	delay_us = DIV_ROUND_UP(8192, OS05B10_XCLK_FREQ / 1000 / 1000);
+	usleep_range(delay_us, delay_us * 2);
+
+	return 0;
+
+err_regulator_off:
+	regulator_bulk_disable(ARRAY_SIZE(os05b10_supply_name),
+			       os05b10->supplies);
+	return ret;
+}
+
+static int os05b10_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct os05b10 *os05b10 = to_os05b10(sd);
+
+	/* Pull XSHUTDN low to set the sensor into power down mode.. */
+	gpiod_set_value_cansleep(os05b10->reset_gpio, 0);
+
+	regulator_bulk_disable(ARRAY_SIZE(os05b10_supply_name), os05b10->supplies);
+	clk_disable_unprepare(os05b10->xclk);
+	return 0;
+}
+
+static int os05b10_parse_endpoint(struct os05b10 *os05b10)
+{
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	struct fwnode_handle *ep;
+	int ret;
+
+	ep = fwnode_graph_get_next_endpoint(dev_fwnode(os05b10->dev), NULL);
+	if (!ep) {
+		dev_err(os05b10->dev, "Failed to get next endpoint\n");
+		return -ENXIO;
+	}
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
+
+	ret = v4l2_link_freq_to_bitmap(os05b10->dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       link_frequencies,
+				       ARRAY_SIZE(link_frequencies),
+				       &os05b10->link_freq_index);
+
+	if (ret)
+		dev_err(os05b10->dev, "only 600MHz frequency is available\n");
+
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+	return ret;
+}
+
+static int os05b10_init_controls(struct os05b10 *os05b10)
+{
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	struct v4l2_fwnode_device_properties props;
+	const struct os05b10_mode *mode = &supported_modes_10bit[0];
+	u64 hblank_def, vblank_def, exp_max;
+	int ret;
+
+	ctrl_hdlr = &os05b10->handler;
+	v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+
+	os05b10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+						V4L2_CID_PIXEL_RATE,
+						OS05B10_PIXEL_RATE,
+						OS05B10_PIXEL_RATE, 1,
+						OS05B10_PIXEL_RATE);
+
+	os05b10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
+						    V4L2_CID_LINK_FREQ,
+						    os05b10->link_freq_index,
+						    0, link_frequencies);
+	if (os05b10->link_freq)
+		os05b10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	hblank_def = mode->hts - mode->width;
+	os05b10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
+					    hblank_def, hblank_def, 1, hblank_def);
+	if (os05b10->hblank)
+		os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	vblank_def = mode->vts - mode->height;
+	os05b10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					    V4L2_CID_VBLANK, vblank_def,
+					    OS05B10_VTS_MAX - mode->height,
+					    1, vblank_def);
+
+	exp_max = mode->vts - OS05B10_EXPOSURE_MARGIN;
+	os05b10->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					      V4L2_CID_EXPOSURE,
+					      OS05B10_EXPOSURE_MIN,
+					      exp_max, OS05B10_EXPOSURE_STEP,
+					      mode->exp);
+
+	os05b10->gain = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					  V4L2_CID_ANALOGUE_GAIN,
+					  OS05B10_ANALOG_GAIN_MIN,
+					  OS05B10_ANALOG_GAIN_MAX,
+					  OS05B10_ANALOG_GAIN_STEP,
+					  OS05B10_ANALOG_GAIN_DEFAULT);
+
+	if (ctrl_hdlr->error) {
+		ret = ctrl_hdlr->error;
+		dev_err(os05b10->dev, "control init failed (%d)\n", ret);
+		goto error;
+	}
+
+	ret = v4l2_fwnode_device_parse(os05b10->dev, &props);
+	if (ret)
+		goto error;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error;
+
+	os05b10->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+error:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
+}
+
+static int os05b10_probe(struct i2c_client *client)
+{
+	struct os05b10 *os05b10;
+	unsigned int xclk_freq;
+	int ret;
+
+	os05b10 = devm_kzalloc(&client->dev, sizeof(*os05b10), GFP_KERNEL);
+	if (!os05b10)
+		return -ENOMEM;
+
+	os05b10->client = client;
+	os05b10->dev = &client->dev;
+
+	v4l2_i2c_subdev_init(&os05b10->sd, client, &os05b10_subdev_ops);
+
+	os05b10->cci = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(os05b10->cci))
+		return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->cci),
+			      "failed to initialize CCI: %d\n", ret);
+
+	/* Get system clock (xclk) */
+	os05b10->xclk = devm_v4l2_sensor_clk_get(os05b10->dev, NULL);
+	if (IS_ERR(os05b10->xclk))
+		return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->xclk),
+				     "failed to get xclk\n");
+
+	xclk_freq = clk_get_rate(os05b10->xclk);
+	if (xclk_freq != OS05B10_XCLK_FREQ)
+		return dev_err_probe(os05b10->dev, -EINVAL,
+				     "xclk frequency not supported: %d Hz\n",
+				     xclk_freq);
+
+	ret = os05b10_get_regulators(os05b10);
+	if (ret)
+		return dev_err_probe(os05b10->dev, ret, "failed to get regulators\n");
+
+	ret = os05b10_parse_endpoint(os05b10);
+	if (ret) {
+		dev_err(os05b10->dev, "failed to parse endpoint configuration\n");
+		return ret;
+	}
+
+	os05b10->reset_gpio = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(os05b10->reset_gpio))
+		return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->reset_gpio),
+				     "failed to get reset GPIO\n");
+
+	ret = os05b10_power_on(os05b10->dev);
+	if (ret)
+		return ret;
+
+	ret = os05b10_identify_module(os05b10);
+	if (ret)
+		goto error_power_off;
+
+	/* This needs the pm runtime to be registered. */
+	ret = os05b10_init_controls(os05b10);
+	if (ret)
+		goto error_power_off;
+
+	/* Initialize subdev */
+	os05b10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	os05b10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	os05b10->sd.internal_ops = &os05b10_internal_ops;
+	os05b10->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&os05b10->sd.entity, 1, &os05b10->pad);
+	if (ret) {
+		dev_err_probe(os05b10->dev, ret, "failed to init entity pads\n");
+		goto error_handler_free;
+	}
+
+	os05b10->sd.state_lock = os05b10->handler.lock;
+	ret = v4l2_subdev_init_finalize(&os05b10->sd);
+	if (ret < 0) {
+		dev_err_probe(os05b10->dev, ret, "subdev init error\n");
+		goto error_media_entity;
+	}
+
+	pm_runtime_set_active(os05b10->dev);
+	pm_runtime_enable(os05b10->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&os05b10->sd);
+	if (ret < 0) {
+		dev_err_probe(os05b10->dev, ret,
+			      "failed to register os05b10 sub-device\n");
+		goto error_subdev_cleanup;
+	}
+
+	pm_runtime_idle(os05b10->dev);
+
+	return 0;
+
+error_subdev_cleanup:
+	v4l2_subdev_cleanup(&os05b10->sd);
+	pm_runtime_disable(os05b10->dev);
+	pm_runtime_set_suspended(os05b10->dev);
+
+error_media_entity:
+	media_entity_cleanup(&os05b10->sd.entity);
+
+error_handler_free:
+	v4l2_ctrl_handler_free(os05b10->sd.ctrl_handler);
+
+error_power_off:
+	os05b10_power_off(os05b10->dev);
+
+	return ret;
+}
+
+static void os05b10_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct os05b10 *os05b10 = to_os05b10(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(&os05b10->sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(os05b10->sd.ctrl_handler);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		os05b10_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(os05b10_pm_ops, os05b10_power_off,
+				 os05b10_power_on, NULL);
+
+static const struct of_device_id os05b10_id[] = {
+	{ .compatible = "ovti,os05b10" },
+	{ /* sentinel */ },
+};
+
+MODULE_DEVICE_TABLE(of, os05b10_id);
+
+static struct i2c_driver os05b10_driver = {
+	.driver = {
+		.name = "os05b10",
+		.pm = pm_ptr(&os05b10_pm_ops),
+		.of_match_table = os05b10_id,
+	},
+	.probe = os05b10_probe,
+	.remove = os05b10_remove,
+};
+
+module_i2c_driver(os05b10_driver);
+
+MODULE_DESCRIPTION("OS05B10 Camera Sensor Driver");
+MODULE_AUTHOR("Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>");
+MODULE_AUTHOR("Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>");
+MODULE_LICENSE("GPL");
--
2.34.1


