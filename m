Return-Path: <linux-media+bounces-19843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D02E79A3861
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 10:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2A391C237E2
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 08:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812E618CBF5;
	Fri, 18 Oct 2024 08:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="evpP7Z8V"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2057.outbound.protection.outlook.com [40.107.105.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE9C18BBAE;
	Fri, 18 Oct 2024 08:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729239642; cv=fail; b=JfsNgWNF4OgSIj1dDcjfctPJwyqtmQqrC5dVLXncxmUYHMZYWfWz+QrSZ4rx0eIHTCv0Al3i0+W/tphdbpFfi0H5zal+52opwsR3GCgV5gu5R2uBxv4L5PQQQ9a7uxXDk3UAtgFST9ldJK/nrx5pcPz2MSYYmOqScUNjBGSYnTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729239642; c=relaxed/simple;
	bh=VWJPu7TP+0tD4eR4lHjh6EROycX7cayPc7xQ6cDaE3U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i2jAqkFqWgiXsSotNHR06okoPVYeAdnL/ha7jXcT5iS6N1OKEfsalUQp9kGVWUkuYs4sLA1i4aNIAywRUTIHyeDW2O25jHE4e7WqRZZstaN6V8s7QHIYj0PKNvNncbYL8R+Ma9w2KRsW7msdn6XptmcrL80L/uhs5jgXMwlYAtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=evpP7Z8V; arc=fail smtp.client-ip=40.107.105.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aoTi/AKCNYQYeiHnhNUnQJ/cmmyKOZgua3oe/kQJZZJfJgeSi8UXrWskwLKykud5AyasvVmdvGolAB+Qy5W5DOL5MaG7RrzkwlePSCz8IhbjTTXzS0S3MzO+vUGpKbXU0Yh79iJRUyQrCHMYBefoGN4+5mM3kiEyjrVeEXTiIm2YlJjwKzwLG8A+Nxy9a04rx5+dbT6kgpbenKHJ7iW0BM+y+amwB8Y1Fv/FthL6nq/wKPeKOMK+PYg91JC9ZOt80RMWbK/KYVeD93NBThD+jU1rE9cdiWdfVNCkduwfNgZUASyxJnHJgtmnpVRPEuDdn7+d2pMil+XbTgk/NHIIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+2R5b+ulSNs/Jhpw1XlLHKy5uJisFAfr2lXIIyx0wg=;
 b=SHFMOQuc2owIyPqUsDE9ZvJpWJsJeFlbe0BGTuDGoIqeOaYeOIIWWAbqXprSTiV7O2rMd2ArKcuByy85jwOwfhmclE+I3rxbRmaBsvkV+TE78odelON2inOLKyDnHj0IFAC8m941NX8+PUltBZXWdu5fyCVbrzaCN/jAQBYWjLxUsePGE4laeC1nZj9JH95o+f6qcBrxsaYVDpNsfJOSMDPebqbdf5SaH/1larzMj4bXP28cVg9fiVRc6VA4Kitz6/PYuAaAG4yD1D9wy24nJ43KmhP4TaKExbkvTU7fwAFraGtU7aJx8v6Zg8KSTNV35EFUGBXV7i7u94Hgw259sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+2R5b+ulSNs/Jhpw1XlLHKy5uJisFAfr2lXIIyx0wg=;
 b=evpP7Z8V45WEoK0PZLxcI+UAfsP1GqLhcwZrt62lTily7X0z6X+4iM83J99J6jkZ1G3H6cewHqpnM3P/5sryep21HiMjN4mcoRytkNvZMSTiXHJMp5eZ2QZmiMDpsJb+4a5ri+lXg3i+9sULg17sedVgH9+4EBN8w8NZtjCcuc7Clq2zv1DgMnXzJMaDvSBqLijsAFSogmy5JakSwPMgAfYaZe3MdPZCGK88msvYQYjl5TqVFvJXC3K+1b961lh+ehKoqW2eN6keId6CI35PCH5bSUlEJuH3pvOYPrDDk9jsVqw3KXQF4Qdp1a8GaVHVKVkmU45scwZh5TTA8FkG3A==
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM9PR04MB8260.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Fri, 18 Oct
 2024 08:20:37 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 08:20:37 +0000
From: Ming Qian <ming.qian@nxp.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, "mchehab@kernel.org"
	<mchehab@kernel.org>
CC: "yunkec@google.com" <yunkec@google.com>, "nicolas@ndufresne.ca"
	<nicolas@ndufresne.ca>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "X.H. Bao"
	<xiahong.bao@nxp.com>, Ming Zhou <ming.zhou@nxp.com>, Eagle Zhou
	<eagle.zhou@nxp.com>, Tao Jiang <tao.jiang_2@nxp.com>, "Ming Qian (OSS)"
	<ming.qian@oss.nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [RFC v2 5/6] media: v4l2-ctrls: Add video roi ctrls
Thread-Topic: [EXT] Re: [RFC v2 5/6] media: v4l2-ctrls: Add video roi ctrls
Thread-Index: AQHbISD6w753PFG7vEq1Etab1CQe97KMC3EAgAAe8eA=
Date: Fri, 18 Oct 2024 08:20:36 +0000
Message-ID:
 <PAXPR04MB825420D7C8A88111F0F8084EE7402@PAXPR04MB8254.eurprd04.prod.outlook.com>
References: <20241018054448.3190423-1-ming.qian@nxp.com>
 <20241018054448.3190423-6-ming.qian@nxp.com>
 <6bde2e39-b422-490f-b3b1-142a5671e770@xs4all.nl>
In-Reply-To: <6bde2e39-b422-490f-b3b1-142a5671e770@xs4all.nl>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8254:EE_|AM9PR04MB8260:EE_
x-ms-office365-filtering-correlation-id: 8ea28c23-a19a-4d34-e4a1-08dcef4dbea2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?kbXiwyih1zXmtf/RmaphsCAp+i+2d0gE5ApLAhG5RsXX1iv9dWWsMg4X1VpE?=
 =?us-ascii?Q?vZADCqT40vIRf2/jDi3mFeT72jBx68eNYPDPeBBBCRjH3sdn5Ns/BkFYNKfS?=
 =?us-ascii?Q?97tHPjUdGkBo/uQuFZxcw3piNNidLPj0paN/JBtf5Fl2CsJJtsLSTb9djIod?=
 =?us-ascii?Q?5eL9PMHnmaVYe3VemtCLr87Ugu3yL+i2MXhbRObEF3O84x+edajI51yqcfWE?=
 =?us-ascii?Q?Tzd7qRJbzDa/sA252JsI9BpECkKttfnBuxvT5cmDJ9hMtxeEQlvUfxr5tTTX?=
 =?us-ascii?Q?grDiqM1UFkCrh7f1c+pO+7eZAUam1NXAFY0+K3WxERL45k7XRwLNpoSM3hNy?=
 =?us-ascii?Q?+nTZZD1dTG+y3+xH6ky6iRhWjpSNSrFaBYYOQIK6C/wpXi/r2yiqpp2cesgs?=
 =?us-ascii?Q?ilGRIsmnEIwzMEvPbajsy60iZlfhghe+1pqFmRWiDtDCeODr3etJ1iOq/2ZF?=
 =?us-ascii?Q?8T/hPFfQboxugxcSKvsJwAVMjtjbAUcnZpFJkUTW4FkSVc+rfRmIkMvA6GBu?=
 =?us-ascii?Q?2nF9KKqyl9dXBkO16PwtgfgXaCEDG9ZWh1LgAHMS+NxkEbZBh08Fj2SIbY1T?=
 =?us-ascii?Q?4kTFP34imBWve9QYihZPMEIEqaNLo74qHJgZWj5vG94IU7MDrpLXzb3XhVYB?=
 =?us-ascii?Q?E5FZb2FX7FJopyusG+n1HonWkSaiVZcPafo9QYq+tQwtq+Y250i4fqmhsi4g?=
 =?us-ascii?Q?1RHJ0TqLWhQ/S95aPnI6ghRTyusEBJl9l0uGcpGQ0iGU5PKLE6tMWsOBE0lM?=
 =?us-ascii?Q?8CmrfLv7rZrvPgHvDjIx87Joy4H3J9wp6INFDzw5jW8p7H6SQY4Co9WFqSxg?=
 =?us-ascii?Q?L5maAo4pxkaoPtSexGJUbgEuhKxndv+kfehBjC7TIfTSGDXBNxM04KeFLCxW?=
 =?us-ascii?Q?3bcbVIzQBwLs1cicpZHZrtAIY0zASdEji+1QHdHg82G0N4DfmQBZo/8qOMEn?=
 =?us-ascii?Q?3TtX/+2hhT355xen9IDN0sDaY3Z6+eG2bgKV+cIbyLJ9WwDMn6SwhPLBAyd2?=
 =?us-ascii?Q?c7J/K3ALWaoWgGa7xzL/Tptkvp2sMMwdLCMlxi0+daAYig4X0twtanHorj3P?=
 =?us-ascii?Q?5tIlQnon9Tgt7H9K1JmJze1FPnY44DdG+sSH6FaxVhe55xJxrGfDx6HYx0IH?=
 =?us-ascii?Q?4wkCOQBHRtJNPusF6z43kPRs5bdBvkwha44VkwguL3qepOBthJyLbmhwIEJ4?=
 =?us-ascii?Q?C1nTdMRn6DDVcqgye5nv+DyIaN5SOdqtgrcerVC4oWYZkYWKUidoj925D9E0?=
 =?us-ascii?Q?F79XV2m/8wk4A65X7pK+pI7ErLZLveSblMpBUEiybfkj8OYAIrdToCDi7khd?=
 =?us-ascii?Q?6a3LJia0O3outyyKSJaNxA3x+L4kFLu/fYygRc1RteoGcfeCKjtC34nvTLvQ?=
 =?us-ascii?Q?y44NYIY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GsEqD7qnbTQJ58kbc83H1qoJYfNxtJ1CXe5LZjOsI0wavOG3AB+Koyyz0kRq?=
 =?us-ascii?Q?W9aph4pJ5QFJssW2disJWAvhhtp7k8O9vZHV1THpXM8Bs0sAdsGJKPTs9+CZ?=
 =?us-ascii?Q?HYKx0A9eCB3Kompef6VWihSsYOm7IfgooEqZKGC4YpK/AQ+X3eyVStXuwhuu?=
 =?us-ascii?Q?vY5VYhWquIa98agFzsdkf4yUZXUUqqtvX/FTXcKRzsnsLbaJunHVf/SyDqfc?=
 =?us-ascii?Q?GASkJsR7GchJbIu1O3yKB/LGF7H6spP4N3mYZuN2sPYm2QY4DkyI8nzJX7rm?=
 =?us-ascii?Q?5OkBqxzZTM6VGvEwumef5rtwWD33HPQ3lp35M6foT8E/rUUOM6RU+zwJIi01?=
 =?us-ascii?Q?XUg+eYResH+JEMxNj3QhDGS71oBGqxyT13h2e2LYP1klZBVvuOPPzzve8QLZ?=
 =?us-ascii?Q?Xtaz7QPIPjhcx3z4QJFbKUvgmAiwXZOFYFURdW1u+YQQQTD/N1pC4dXacn4u?=
 =?us-ascii?Q?tCJx2Wtwama0lvDbrEokL5BE5FG++2Mg2WZK193QhBxPiIo+FR8OWqf4kA4v?=
 =?us-ascii?Q?3rv/wCCc7Yw9kHPH4FpAfwyBgmzFKMaK5yHE03g6J1zGH3q6Ygg9lhMNR4mW?=
 =?us-ascii?Q?5PnLOA9NdRHbrLYQD6S2qx9i69pVjK5NX2Lacng2AlA9mkaEeDWl5M+nlvdv?=
 =?us-ascii?Q?+1NT5OSuAt49lUMOfTNVvhTilnOD3qSwyZMjaInsO7GsGQqTYi85YIqeflB1?=
 =?us-ascii?Q?ZKSthNvZJaMMN5yRP8iAZEEwmOw8i7CurpGPY6TgqiLzEGvnJlrnb9DD5SZZ?=
 =?us-ascii?Q?ft0WRJmV2Ln8b2GBftNkz6rCeLjLGMIwuuRVLQb2TFNkTPK/OFbxmZv5dqVE?=
 =?us-ascii?Q?P9yxY8gE65Fk/dJYvwFTrgzKJSwVPhDPwXPjAw8WMQ/uPalsfbXsIobiwoXr?=
 =?us-ascii?Q?A/mSDuhRMNFpB5VDFatLVwuUdESiBjpCxpSGsBpzeOq8SbLP8VeCpTUEnnSP?=
 =?us-ascii?Q?dU3ZFP9HNRH0jJ0DPqwuaTV5FhMAUcHDxEqcZB5cm0UVh8ldHAG8Li20T3Q1?=
 =?us-ascii?Q?urkdkd85trr35YqeRRXNUjHlQoJnlnwR1Qil4tc12zkxdBrj+K0cebamw9rE?=
 =?us-ascii?Q?hWEyWHNCPt9314gvNafpSxYGVLTmgj1YNdXGU6vwqutSk2sNgRwK8SGLaWh7?=
 =?us-ascii?Q?mNgm058wj5BtWo19nBfoVK0oXqyfoBkAl8GCh7JWW1/faax5PqjqWgpgorH3?=
 =?us-ascii?Q?UplnlMK5ZFUMqgrT5kL/E/5d8qDjghqg4Htm8ftsJ4zP9ajrfLrN8ZmC/UM3?=
 =?us-ascii?Q?F14oVcqHbego8dL/GyR8bUn0UeGDdDeBxQnNrVLyM75+0hncPb5wTtyxWMDl?=
 =?us-ascii?Q?CXgPSowC0YhIpLultI44p6KdnI+GXgaHlonaiRYdwDMyXBJCoOo6gHKn+ySX?=
 =?us-ascii?Q?uNBvheygQGWNqY/M2AwwsfAaD9uqz8WPsdq5hff2iLsGqmCajNtbkVCpHlpK?=
 =?us-ascii?Q?Bux2UW3EcZg0UBrfJxJhvQpv+GeSs3WjoXQhLrdYqzqIf473+aCHXQsSEI3n?=
 =?us-ascii?Q?uUG2ishnePnrpUn4NlfTRNusU4TAN0MMhBI4Q3Jdx95+7KnNW7l4T662u50n?=
 =?us-ascii?Q?fQNx3q4OxK8fBWicsO8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea28c23-a19a-4d34-e4a1-08dcef4dbea2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 08:20:36.9103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VQBQk7+RQKapKCnFPTpzh9NrHB7H9T0o8GMBw5KHLxubuv/5qW6wZExRO+qOOZeDBUzpzn1h220juDHB2HzzYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8260

Hi Hans,

>-----Original Message-----
>From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>Sent: Friday, October 18, 2024 2:28 PM
>To: Ming Qian <ming.qian@nxp.com>; mchehab@kernel.org
>Cc: yunkec@google.com; nicolas@ndufresne.ca; s.hauer@pengutronix.de;
>kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx <linux-
>imx@nxp.com>; X.H. Bao <xiahong.bao@nxp.com>; Ming Zhou
><ming.zhou@nxp.com>; Eagle Zhou <eagle.zhou@nxp.com>; Tao Jiang
><tao.jiang_2@nxp.com>; Ming Qian (OSS) <ming.qian@oss.nxp.com>;
>imx@lists.linux.dev; linux-media@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
>Subject: [EXT] Re: [RFC v2 5/6] media: v4l2-ctrls: Add video roi ctrls
>
>Caution: This is an external email. Please take care when clicking links o=
r
>opening attachments. When in doubt, report the message using the 'Report
>this email' button
>
>
>On 18/10/2024 07:44, Ming Qian wrote:
>> Add some ctrls to support the video encoder ROI feature.
>> Support 2 encoder ROI configurations that are rectangular region and
>> QP map
>>
>> Signed-off-by: Ming Qian <ming.qian@nxp.com>
>> Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
>> ---
>>  .../media/v4l/ext-ctrls-codec.rst             | 73 +++++++++++++++++++
>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     | 29 ++++++++
>>  include/uapi/linux/v4l2-controls.h            | 11 +++
>>  3 files changed, 113 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index 4a379bd9e3fb..6b972247778c 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -1667,6 +1667,79 @@ enum
>v4l2_mpeg_video_h264_hierarchical_coding_type -
>>      Codecs need to always use the specified range, rather then a HW cus=
tom
>range.
>>      Applicable to encoders
>>
>> +``V4L2_CID_MPEG_VIDEO_ROI_MODE``
>> +    (enum)
>> +
>> +enum v4l2_mpeg_video_roi_mode -
>> +    Video roi mode. Possible values are:
>> +
>> +
>> +
>> +.. flat-table::
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +
>> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_NONE``
>> +      - No ROI in the MPEG stream
>> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_RECT``
>> +      - Rectangle ROI mode
>> +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_MAP``
>> +      - Map ROI mode
>> +
>> +``V4L2_CID_MPEG_VIDEO_ROI_RECT (struct)``
>> +    Select rectangular regions and specify the QP offset. The
>> +    struct :c:type:`v4l2_ctrl_video_region_param` provides the
>> +    rectangular region and the parameter to describe QP offset.
>> +    The maximum number of rectangular regions depends on the
>> +    hardware.  This control is a dynamically sized array. This
>> +    control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
>> +    value is ``V4L2_MPEG_VIDEO_ROI_MODE_RECT``. Applicable to
>> +    encoders.
>> +
>> +.. c:type:: v4l2_ctrl_video_region_param
>> +
>> +.. raw:: latex
>> +
>> +    \small
>> +
>> +.. tabularcolumns:: |p{4.0cm}|p{4.0cm}|p{4.0cm}|
>> +
>> +.. flat-table:: struct v4l2_ctrl_video_region_param
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +    :widths:       1 1 1
>> +
>> +    * - struct :c:type:`v4l2_rect`
>> +      - ``rect``
>> +      - The rectangular region
>
>What is the unit? I assume pixels. And inside what larger area is this rec=
tangle
>located? It probably needs to refer to one of the SEL_TGT targets as descr=
ibed
>here:
>
>https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fhverku=
il.
>home.xs4all.nl%2Fspec%2Fuserspace-api%2Fv4l%2Fv4l2-selection-
>targets.html&data=3D05%7C02%7Cming.qian%40nxp.com%7Cfe9348ba24504eb
>d98f608dcef3dffcf%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
>8648296786960098%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi
>LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata
>=3DcTXaNWLZs4l6IytSu9TWmEb7OyvF4viby9IjpOJXvmE%3D&reserved=3D0
>

We want to use pixels as the unit, but for some detailed encoder, there
may be alignment constraints, and the rectangular area should be inside
the encoded picture size, for example, we encode a 720P H.264 stream,
the largest area is 1280x720@(0,0). This doesn't involve scaling up or
down. I'm not sure if it's possible to align to crop or compose.

Currently, we want to choose an area and increase or decrease the image
quality. so we want to use a parameter to set the qp offset.

>> +    * - __s32
>> +      - ``parameter``
>> +      -
>
>So what is the parameter? It has no description.
>

I newly add a ctrl type V4L2_CTRL_TYPE_REGION, and this struct is
related to the type, so I thought I need to define a general argument to
meet different needs, then this type can support a series of controls.
For this patch, it's qp offset.
I thought if I name it as qp_offset, the ctrl type can't be used on
other similar controls.
Is it better to rename it or add more description and keep the name?

>> +    * - __u32
>> +      - ``reserved[2]``
>> +      -
>
>Add "Applications and drivers must set this to zero."
>

Yes, I missed it

>> +
>> +.. raw:: latex
>> +
>> +    \normalsize
>> +
>> +``V4L2_CID_MPEG_VIDEO_ROI_MAP (integer)``
>> +    Specifies the QP offset for each block. This control is a
>> +    dynamically sized array. The array size can be calculated
>> +    from video resolution and the roi map block size which can
>> +    be got from ``V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE``. This
>> +    control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
>> +    value is ``V4L2_MPEG_VIDEO_ROI_MODE_MAP``. Applicable to
>> +    encoders.
>> +
>> +``V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE (struct)``
>> +    This control returns the roi block size in pixels. The struct
>> +    :c:type:`v4l2_area` provides the width and height in separate
>> +    fields. This control is applicable when
>> +    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
>> +    ``V4L2_MPEG_VIDEO_ROI_MODE_MAP``. This control depends on the
>> +    encoding format. Applicable to encoders.
>> +
>>  .. raw:: latex
>>
>>      \normalsize
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> index 1ea52011247a..54219a3b215a 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> @@ -612,6 +612,13 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>>               NULL,
>>       };
>>
>> +     static const char * const mpeg_video_roi_mode[] =3D {
>> +             "None",
>> +             "Rectangle",
>> +             "Map",
>> +             NULL,
>> +     };
>> +
>>       switch (id) {
>>       case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
>>               return mpeg_audio_sampling_freq; @@ -750,6 +757,8 @@
>> const char * const *v4l2_ctrl_get_menu(u32 id)
>>               return camera_orientation;
>>       case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
>>               return intra_refresh_period_type;
>> +     case V4L2_CID_MPEG_VIDEO_ROI_MODE:
>> +             return mpeg_video_roi_mode;
>>       default:
>>               return NULL;
>>       }
>> @@ -971,6 +980,10 @@ const char *v4l2_ctrl_get_name(u32 id)
>>       case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:               return "Fr=
ame
>LTR Index";
>>       case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:                return "Us=
e LTR
>Frames";
>>       case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:                    return "Av=
erage
>QP Value";
>> +     case V4L2_CID_MPEG_VIDEO_ROI_MODE:                      return "Vi=
deo ROI
>Mode";
>> +     case V4L2_CID_MPEG_VIDEO_ROI_RECT:                      return "Vi=
deo ROI
>Rectangle";
>> +     case V4L2_CID_MPEG_VIDEO_ROI_MAP:                       return "Vi=
deo ROI
>Map";
>> +     case V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE:            return
>"Video ROI Map Block Size";
>>       case V4L2_CID_FWHT_I_FRAME_QP:                          return "FW=
HT I-Frame
>QP Value";
>>       case V4L2_CID_FWHT_P_FRAME_QP:                          return "FW=
HT P-
>Frame QP Value";
>>
>> @@ -1512,6 +1525,22 @@ void v4l2_ctrl_fill(u32 id, const char **name,
>enum v4l2_ctrl_type *type,
>>               *type =3D V4L2_CTRL_TYPE_INTEGER;
>>               *flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
>>               break;
>> +     case V4L2_CID_MPEG_VIDEO_ROI_MODE:
>> +             *type =3D V4L2_CTRL_TYPE_MENU;
>> +             *flags |=3D V4L2_CTRL_FLAG_UPDATE;
>> +             break;
>> +     case V4L2_CID_MPEG_VIDEO_ROI_RECT:
>> +             *type =3D V4L2_CTRL_TYPE_REGION;
>> +             *flags |=3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY |
>V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
>> +             break;
>> +     case V4L2_CID_MPEG_VIDEO_ROI_MAP:
>> +             *type =3D V4L2_CTRL_TYPE_INTEGER;
>> +             *flags |=3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY |
>V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
>> +             break;
>> +     case V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE:
>> +             *type =3D V4L2_CTRL_TYPE_AREA;
>> +             *flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
>> +             break;
>>       case V4L2_CID_PIXEL_RATE:
>>               *type =3D V4L2_CTRL_TYPE_INTEGER64;
>>               *flags |=3D V4L2_CTRL_FLAG_READ_ONLY; diff --git
>> a/include/uapi/linux/v4l2-controls.h
>> b/include/uapi/linux/v4l2-controls.h
>> index 974fd254e573..169a676fd64c 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -900,6 +900,17 @@ enum v4l2_mpeg_video_av1_level {
>>
>>  #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE +
>657)
>>
>> +enum v4l2_mpeg_video_roi_mode {
>> +     V4L2_MPEG_VIDEO_ROI_MODE_NONE,
>> +     V4L2_MPEG_VIDEO_ROI_MODE_RECT,
>> +     V4L2_MPEG_VIDEO_ROI_MODE_MAP
>> +};
>> +
>> +#define V4L2_CID_MPEG_VIDEO_ROI_MODE         (V4L2_CID_CODEC_BASE
>+ 658)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_RECT         (V4L2_CID_CODEC_BASE +
>659)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_MAP          (V4L2_CID_CODEC_BASE +
>660)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE
>(V4L2_CID_CODEC_BASE + 661)
>> +
>>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by=
 V4L2
>*/
>>  #define V4L2_CID_CODEC_CX2341X_BASE
>(V4L2_CTRL_CLASS_CODEC | 0x1000)
>>  #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE
>(V4L2_CID_CODEC_CX2341X_BASE+0)


