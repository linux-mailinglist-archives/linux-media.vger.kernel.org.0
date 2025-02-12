Return-Path: <linux-media+bounces-26058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 597B2A32506
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 12:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3B3D1889493
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 11:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6795209F5A;
	Wed, 12 Feb 2025 11:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bosch.com header.i=@bosch.com header.b="OKVQTmgG"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013011.outbound.protection.outlook.com [52.101.67.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B16E20ADFE
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 11:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739359976; cv=fail; b=XM+NIcdWnbIUP598UgUCB57luzJuo6S4uWUIuX8sV9aem7MlSNsFlVBbjTeGnHc4xTQYXLCQ98WMGSj2jtIKDl3oaFnRPhCtohbFMRNLLUfJMVY0Met/oKcdMgV/0OSxgG3Xe7qxqTreWLVb99fvpyDbgeCEOGQz8REWPpinlMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739359976; c=relaxed/simple;
	bh=flWKGRxsq0oq0wWSlSq7vsDnKQQ8cHmqhjK/wtUH/vQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DA1HFNBoetoBA8sJIIbwwC67lB/i+afyqkaeNKbrReS9ni4OR1uAKSDza45l3FiKBpDimuEWSh4UuhYwO9bSL1PMzp3uKGu01tMPu/SjaRJ4wE+FsJCeef8CREIxBhgcDdwTUCpr2S4kYOag+nSEIOx8GCq69kvXhP4RZrbfla4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bosch.com; spf=pass smtp.mailfrom=bosch.com; dkim=pass (2048-bit key) header.d=bosch.com header.i=@bosch.com header.b=OKVQTmgG; arc=fail smtp.client-ip=52.101.67.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXMTyByHs36otz0iOZCo7EVPrhxcKFJk1U12vGkgAMe8IlcVwTuYPMwVb6jMb1bpCVO3rqhT3EC2up6Cs7AKLO1unaSsTnW46WmGNQOcW/Fy2dR64/kWqtzasGF3MDYgjw1BbnEi9lug7UpzgEh/vGhX0O/LJGqkQFn+fzjk1/OAQolVHpGxFmDeIL3hWuHufnEFHQisbCw+hfCB1PjdHmP1EeBwDDIErCdF2t/lLDnxrjRHySRbiCt0UmCyWPeAH1th5e39HR241ezMGOUzzcER8hCWF0RT5mznTGxQso6GKi30wYYYw0hL+eigUDLtCZKuQnF7TEID5lyu5iGvxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2GmRb1D5XR+EvT2KnmQocR85stkL5VKrbdcG6U1vlc=;
 b=fUTACna5AbVYwoqJzPKzlS7ufcP6CIRa17YFsZkScJB59nGJTzEmqIlWl9i6vYIDwVDWQKQanJWjaFFvC5RqRdDsbkJHogJ2tsPO+BdFAZNevPJC6koTmh3ey0PKsqo0MI5AIdmpmI8Cc9pzIdRFpi8JxXFgnLomxsSdrj+Rg3p9VNxT8y7Es99ZKOuGxmpAK1MIwt5anuQYfABRNzcu8TX7lj91rml/I3Iuo5MCVXttB/me9nYpyOiv/qj2qMHYtvjJqdVkYaj5OrjWDvc+ynJAnajSkZD8WhYZDssBdV3Byrljf/8Scw+rX9vYM7aLLmhJ6T7nmWO+uLc/Bb4xrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bosch.com; dmarc=pass action=none header.from=bosch.com;
 dkim=pass header.d=bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2GmRb1D5XR+EvT2KnmQocR85stkL5VKrbdcG6U1vlc=;
 b=OKVQTmgGGxv09aPwQK066WVrcpJJwprxBqOdKLw/oMXU1OQCRWr1tQS+4TWDv9bQarh1+Gp7XxBVu5Dzj0ixAu/kQK3TWj0flReHe3nPFh7fiz2iNOG+MWnujzuEdjF4WLTlKhvW7fnHHRYAMxioG3QDHsuwxPwbLqo23viGj6NoCSTQzAUpgYzYzKpA8an5mn/P+SKeQRftXH8/M5sn9QO/JiSnEE8vQvlvs5nxPP7S7M++/S+pjzu0PMcqRm3fAl33eOcXuFzZuFo7GN5aZ9rM4X3OuXMGvTw5dCyC5Mj0ntO62mz7I9VXMIU8lEdGUhLhejdh+thka1rFSApj2w==
Received: from GV1PR10MB6325.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:5d::22)
 by AM7PR10MB3143.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:103::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 11:32:51 +0000
Received: from GV1PR10MB6325.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::630:7fdb:bcb6:8ebf]) by GV1PR10MB6325.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::630:7fdb:bcb6:8ebf%4]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 11:32:51 +0000
From: "Thankam Abraham Blessy (SX/EBH1-MM)" <Blessy.ThankamAbraham@bosch.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: [QUESTION] Enabling Test Pattern on DS90UB960 Without Serializer or
 Image Sensor connected
Thread-Topic: [QUESTION] Enabling Test Pattern on DS90UB960 Without Serializer
 or Image Sensor connected
Thread-Index: Adt9QdYO1qEJn6wrRoiBi1XKEkRUaQ==
Date: Wed, 12 Feb 2025 11:32:51 +0000
Message-ID:
 <GV1PR10MB6325215A73130FA2BDE543EAFCFC2@GV1PR10MB6325.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR10MB6325:EE_|AM7PR10MB3143:EE_
x-ms-office365-filtering-correlation-id: ba8b7727-6418-4824-9099-08dd4b58fbe4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Y9uS7X6j88soZb8QcyrHiHBZpTSOjzDYaRYjs17nqkoBrgKQj6bnFi4ER8KA?=
 =?us-ascii?Q?MheJS1Iasxt2vECTHc+4D/TuOqqrVHyi3lTLDRFTe1OKhY2nurceRG9ubGeF?=
 =?us-ascii?Q?lM/sWX9kHaQjODbK/p+xiTAUTGKvkoQyR6e/iUhJaeFuHFjXYczY0YWjQQEh?=
 =?us-ascii?Q?xTo/rasydWMRlw3G9M7JPEd3ybhgU9GL+7fintrYzMuvJvop1q7hpEznjyR1?=
 =?us-ascii?Q?7cb9LzfONktRrcepOCyEiHKGYNMxhaYWuup9xEVhweHCgdpZsllFCsiS8Qcu?=
 =?us-ascii?Q?7w8WoyH86LeuiFH5BkwA4qHa6TJ2HpsMYtAG/i2qyQY7njvt4qow0MK1X72Q?=
 =?us-ascii?Q?WynVqv8xg9gnywqxNTZYleBjCqCCgxT3ohVDzGfvqa1WdnD8wNbqBhHr8EaC?=
 =?us-ascii?Q?mwekTcTCIGiCSyzHwYDV1m88thxC26BVd3xqKsXuBdTV+MCPbP638wsrC8gx?=
 =?us-ascii?Q?gDJtlyUqqsmewhyUXddAR6QyN31LXMFno3s69+49w3S8tnLajjS13c8zU8Dg?=
 =?us-ascii?Q?nqNAu9BIqsVQaPTk0yjmCC1+Iu8GvODyqcV4yjh0oszgBVdp67tFNzYvv0ml?=
 =?us-ascii?Q?Ulfi60Mvud+QFARWm6QMRLaO0V98LQcQ37mOde5xTxlN9SMNXgbCEbsjVpBV?=
 =?us-ascii?Q?kGX9BsHTwsjubxYjZAssRpG3WH5yEey3TnR8yz4ANCk4QQUPXtJ5IZRu4HTJ?=
 =?us-ascii?Q?nl3qtrjJWHi5/TzxhSGsba0rNmVvJgS5rYo4oQVrP1i/NUGMGHJRtJHy+MNs?=
 =?us-ascii?Q?+maOo74wUGNDeYhjxD0ufjpK4sHOfnbwoHqiz1R+C1fJR1BvHLluvrjqXxmo?=
 =?us-ascii?Q?pMG0xK4eAvacX3g24qOmM81LmWBcBIF+8xGNONw68QnuPMWXWcfMngxLMoGg?=
 =?us-ascii?Q?YV3Szod/gJBXn2+KxBEvxUX3WTcH5YNYVvkZD7Oz9FwqmZSmU5tdfSZ9/mtE?=
 =?us-ascii?Q?31fx2md8r7QUe1n4eAXMn8AJBzk/hTbgQ7ql67G/wq971ot/bUO+C1pk3wAb?=
 =?us-ascii?Q?8NdQIjq6L9PO6jRKt6T0jeSU0iakbGYLGW3Tv0w2hj2tnxlD40r2/f4NTL9u?=
 =?us-ascii?Q?wHX5QkUYreQYOa7PyKDPhosSeRbLzPj/m3n028Pz7quqyNH+RbfdqJMoW6XS?=
 =?us-ascii?Q?azai5QMqUXQUCoB0Fxjz/RAJIbiUTd1rqRxHftTvXpk++aBPzo0vFwdmn+gk?=
 =?us-ascii?Q?7nRT8x9ewDBPgHw0Uz+iD1NGKn/1Lx5+EjSlwuJ56QrCAFrbefOfCgCHseYL?=
 =?us-ascii?Q?zXLUfgVxRXRLfdxZncHNISld2IBF0sQYMVNaLTHwqpjzrwpm7mJKoEiznmR/?=
 =?us-ascii?Q?tIs/tXGEOrY06rJZNx6ZO6FReIiY6rWdfSXfBRW5e+dyrhcvvXu0aF0SU/Rw?=
 =?us-ascii?Q?kdO6jUEWJAlTB/aCk6UebwkffQ0cy9y4ql+9z+EzVK+VA5JC4ifkbs4PcboZ?=
 =?us-ascii?Q?0snvp0TIPs237ua1FNEWSmxaN5BTAgPX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR10MB6325.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?alvamxo6nT2mxwOmai3IXxJkpPZfW+MzmWvNAqL31h0KtsTBmJVaY58ItnZq?=
 =?us-ascii?Q?VtFgg8N8rAwujFn38lh2cctLZK6b3HcboTwd6hT62xRf8iCntUmoX0SSMnP3?=
 =?us-ascii?Q?TmhcpjjBCZQy4kCgBInbmEKbbBd/B4YPaUZWepnWJX72VOKFvgkeVPGen6o5?=
 =?us-ascii?Q?NTlzALU2zUr1Uk0iecbQuqpT6QoiGEo5FhWvJcn+LUj9Ik3YwKCTI80FuJ+s?=
 =?us-ascii?Q?wlaZuKU2/E5GvLg3Q/r7U+Y88DBnLq8Tcra1S0GeQf4JqmcfWr9vAsGIeAXw?=
 =?us-ascii?Q?CvIrD+okQgqq0Oc+LxUa8ElhECdnRcsKZUrFwufmAakju98nlUk3wgYtbj1s?=
 =?us-ascii?Q?k73AEu0e50G/FXuzmUAmWGGFwGX4yjUYXSGjWh5VwauR/88T6PTKw8eAH+ul?=
 =?us-ascii?Q?uQVjRMW5IBcBvfgiklMYS+ed4d8qRzwjWljG8KIRdoVXT+1PLitoYEjSKHi7?=
 =?us-ascii?Q?0W6roAWbIWF2zlgZ44AYxSDfgg6Ceo0K715gkgh3Y9zRA/VWwwtMWV1QOUa8?=
 =?us-ascii?Q?UhDXe0/VYkAz3vMocl6UkXhPrNYiCwhI+myjVH4a4QBtrc37vDgXx+Vs2ULE?=
 =?us-ascii?Q?zuN+9JyXkZrhTuW/s3o3q8FbEXFC2LU/rX3fEFIyvh3GvSYanI2eJdBJCgqt?=
 =?us-ascii?Q?QNSOF7278zvLRpmn9mOf1tbRh4LskIgUX3B/oDlDYI6P9U5Dxz9qGxyL3dF4?=
 =?us-ascii?Q?A9RJPzdH38PN387gvpJ0af9M3NZYzKaqlXwZvYfByfhXSfhzMIIfjXyMPxW2?=
 =?us-ascii?Q?oeBkWrKlnVdhh8zv/LLYAsHuByteWf3b5/rZSgZmbpwaXL4fcMNLGQlvIhhF?=
 =?us-ascii?Q?W6QjfYkd6SGNDCpGV2AS60XxbhqAKWNUcDh36oAQ++hgD7nHfqTIbDj+LDma?=
 =?us-ascii?Q?4GVeGRdizYsvyLVibGr43OVNU0d8WffrE79d/NvYkjVqSGhmcd96KwiK6Qtm?=
 =?us-ascii?Q?kIXJLRsqEmEOuNEv9FPvhxOKaxb0gJaxPkaAIOAT7aCcs0oCLvmFoAKVJaq1?=
 =?us-ascii?Q?ouyclP5cgBK0uiSx7n9zjsRRzrn5zARSRrfTAIxqSFyddGz4oZjifvXjbUyI?=
 =?us-ascii?Q?TaEIGjH6lgZ7kPxvYz/FdL667hNwwuGx83r/MAbiogb2n39BOi0QA1kt0eH5?=
 =?us-ascii?Q?nXX251YUYosG+0f9aBTuRwJbtiWhk3lVTRPnftxU3kDtYY5nw62qRjwxky4i?=
 =?us-ascii?Q?7RLYzX5sDGhpyVdDZBLGBaU6ExXEkA36UY4+GcSqjYHVX7FCCpg9NgKGHeAY?=
 =?us-ascii?Q?SwJcJEPIJrL1t1OKwWvnRjeOob6il+1q9BTqvyUmCBzx70FR6V03Y9QNNjYK?=
 =?us-ascii?Q?fhJYGG7B2bWofQp/FcZXjyTYkz71O4kPGRfyST7xEJy9bSpHO9l+Nsm0gjf0?=
 =?us-ascii?Q?Kui6grHp9iGkHeA5CeNZp0qYh83JVf9jOsXNFqjmiG0QGkAwcx54es5L9hCF?=
 =?us-ascii?Q?i3yt5zRYQMoT3XyrrsxHgHFSbilzADhbrayZD2AvXeUA/aZ9i+nXd5MjK5J/?=
 =?us-ascii?Q?KNBBneokKNEgVkmBM4mFitzmQlXHQCAweaShEA2Oba4ZpC7zhvbVGVWwbvMJ?=
 =?us-ascii?Q?VJXTvxmJe1VZh+296vc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR10MB6325.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8b7727-6418-4824-9099-08dd4b58fbe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 11:32:51.1363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u3RfUpYtPjb39x/CE0KwOfkrWyrZQ2ZRMZeVJsiBLYN5jukkjBa2TeMbbyUlLHRgqVg/B9GpfJhAFkldgztMzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3143

Hello,=20

I am working with the DS90UB960 Deserializer on an NXP i.MX8MN platform and=
 using Kernel 6.9.=20
My goal is to enable the test pattern generator of the DS90UB960 and captur=
e it via the IMX8MN MIPI CSI pipeline, without connecting a serializer or i=
mage sensor.=20

Hardware and Configuration Details:=20
- Hardware: NXP i.MX8MN with DS90UB960 (MIPI CSI)=20
- Kernel Version: 6.9
- Device Tree: Modified to exclude the serializer and image sensor nodes
- Driver: Added test pattern configuration in the deserializer driver.
- Expected Behavior: Generate test pattern directly from DS90UB960 and capt=
ure it through the pipeline
- Media-Ctl: Configured the links to connect between ds90ub960, csi, crossb=
ar and isi. Format set accordingly.
- Observed Error: mxc-isi 32e20000.isi: failed to enable streams 0x1 on 'cs=
is-32e30000.mipi-csi':1: -22 [ 238.215267] mxc-isi 32e20000.isi: Failed to =
enable pipe 0

Issue Description:=20
When I remove the serializer and image sensor information from the device t=
ree, I am unable to capture the test pattern.=20
The pipeline fails during stream enable with the `-EINVAL (-22)` error. How=
ever, with the serializer and image sensor configured in the device tree, t=
he pipeline works correctly (although it is unnecessary for this use case).=
=20

Questions:=20
1.	What would be the preferred way to stream a test-pattern from ds90ub960 =
with the existing media structure?
2.	Would it be possible to generate the test-pattern even if the serializer=
 or image-sensor hardware is not present?=20
3.	Should I explicitly enable certain routes, links, or configurations in t=
he driver to bypass the serializer or image sensor check?=20

Thanks in advance for your time and support!=20

Best regards,
Blessy

