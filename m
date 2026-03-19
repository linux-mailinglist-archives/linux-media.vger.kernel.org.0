Return-Path: <linux-media+bounces-56283-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E8TC4CKu2nHlQIAu9opvQ
	(envelope-from <linux-media+bounces-56283-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 06:32:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAB82C63D0
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 06:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FC5D302F6A7
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 05:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EA839936C;
	Thu, 19 Mar 2026 05:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="kI7PnD2J"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021139.outbound.protection.outlook.com [40.107.42.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5738E27FB37;
	Thu, 19 Mar 2026 05:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773898347; cv=fail; b=Wd/SN1Es6XosRuwJh1GWR2DD6RCW0DFAAOceXXPQpStcSEWoNHv36cUhVsXVY1HP24XQWzeB+Y8fW0Ag5bEizJW5hoQQtSbJT/6lLoNYHl8WX15kigy9l3I215N05UTZr/6nasKfhqdjDoLdKh65/AoKSs1xRPLvDfExVJM9l80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773898347; c=relaxed/simple;
	bh=4Bp38dhNgy1uoHIfG2++UMlz3JCSecT4v4+W57rPm5k=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PL+OSbMGWtilybUm1EFoBAGfaXTbxoz6lPlL5eSuelfisG79kT2HmqTA2NS82JKOC3odH/FeV05ImnLf98N12WGASVBjfcVlBXNQEKwufhufmmogRm+Mr1tGtS6zKlDV3FHpTeeO3zDN6So786i5Fwh/x3a1FCcYt0HEtpdzy2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=kI7PnD2J; arc=fail smtp.client-ip=40.107.42.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E03vmtxHiTxhGJm8EG0De8mnDBYdTBVxHOVZrM6Nr4m1OGnI0/jDMC5gP/UPySVmaHZ5Jk4lbdHhyJ0njJSJWT/lZUGKrFbv3dinODksb+eBnp5PTD8aa404KqWchN+O80ezfPd8tncdXdAx8VaOQ+PUxDw6Lr7HKN1P6WedUu71ALIJox4PoP0UqxYvfqey0aPvhDaTpFr0bhkq/mDvoyvTsClJF/f3Jfc2My9/3AYZ0Ic+aiMDheXIz5xbWZirLUnqvtubYUSYAdXxpu2CKsnC8ljlyZC/JOQeD/a3yKg+t7TXHQNoerTjun3fzeQGo1+OCNKRHyrp6HQm9xNsEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsS3keQu4HHfyO6eenlFIU30/mQR0BviUl9ylYCp/FA=;
 b=NccRzoelwv5hEudRjcwcgYUfYqfcejGBcPnMZm/WUdrnsCnFgL6CCpAKEt9VThaQpIbo+Ss10X4IN0On6UZHm7MZbHS88HamkbuDhS0RZTVvFg8+3gPA5aohMhM2gy+s2EsEXE4L6SozLC7ll7nJNCdLxne39w4xJHvTYxlX7qoQQMCwb2AHl4Jdsk9rafoVfFZN+hM/4bgq9DJ3aHVhG+R69fDP+gKI68L30KQZhp8Pc+uXG/yh5pKJ4wKDCOyXjUR8cFyPqXsCMcIQZNf1s5xDqcIzLjbyYBXMAaDfuJKljXeoFuxQbevgcDyaA3f7/c+lh6TcubzSdOdbXy3x7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsS3keQu4HHfyO6eenlFIU30/mQR0BviUl9ylYCp/FA=;
 b=kI7PnD2Jfb74Fmj+5/ATjwHxO1jsCaMXNdxwcwwCwropuM3wIfsRS45Olq8ztS9iDDWxL24zsHxmYSXxUlwTGJ94wawKFdgEtYFRbwBmSHwNB5Ppekixrj+mkKezJRmlV8Ar+/i9K97wMQbPw3Yf/bBylzEqfjx8bCc0FIKtTXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 PS2P216MB1345.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Thu, 19 Mar 2026 05:32:18 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%3]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 05:32:18 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v0 0/3] Add encoder features
Date: Thu, 19 Mar 2026 14:32:07 +0900
Message-Id: <20260319053210.90-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0036.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b5::9) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|PS2P216MB1345:EE_
X-MS-Office365-Filtering-Correlation-Id: a67edf9d-f279-4051-5369-08de8578e30d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	r7d6Ih/8//F7U1QT85qf5E9mggNXd8V+A/wa0SNhI3ft772qLEAEy5Y9Lu6Ffn4FpuIW944Pb+Mqa3gKrdLaaOis8TiYpnoTB+4FlS4GoFDdauBcE+C8bUFNy3Z+SXswnvLR9v6lhz8DJKjX5UnuI8YrWldgqBA6O3bnEjW+LO/0K90TYM+54vBBf2vksrx9pKzlkOnrZQLS1FXs5OcZBAMtCBl3/rTeJrSiQRcUCUDvkd8j1MJ+k50owYjluCPzdVhPHxmq1av1VFJV0sXm2OSt6u76nni3O6EYFmlUpKmA0TGWIGK5i5jUSVs5mIKJulRowL4EOoLT+Zplqp7eV64x4ncc7QTIV46q1A3wyQe3a/c0lfD8+ooTD+bvq+7qgD452qUDXq6M0eqVEcbOnqTTK3H4dSaqxCHoEnBfmdb1IItE9hkSWwrofTxx+ZiizjaAbWAxu1UIAaNUnuGSuAS/Nz4FF7EIm7KxGP0Nn/wbh3aLOWycCFXTsw/a10Kg4nrJvE8FAJZYL2dV+FEeWTmlHTPTEQfdvM90fqw0aWNXBwUr1jAuK6IOtBJxW+oGjnzFRRNgnHWZuDjeh+vX+ym0p2ErRam+4RAsKY6IhVN1loi+vJPymIkwZHI9D55SemeuIbAHa8IED9qNHFqQYml13wouEcWd0baLfqAcUTD5+qxTtv6St71TSryLeNHG2Kql4VOVllFldWqNWrQkZ0tsC8/zL/Qe4Jwv7wtdeN6MOZ5ZNuuwXsTrgvW9XamSHcOFSc+I743dHw3cQ+p1VQ9M1YXNfPN3lks+COtaj+8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xa7maUNjjxm0+Vl6xXavVHHHsSwSVPfDBhAOzvPiw/gRyPK0TOHVNlPd/12+?=
 =?us-ascii?Q?HGvn4qJ0KrQPs9LWbobDyHP62JeviIqoJe0Hy6g3x94Ql1u+DKOoL9Pv09yA?=
 =?us-ascii?Q?Usodnc3ddUCCiYjT2Moj0/Iyk6mKJwL337DPTqObFrWpuZNpdl7kpzX0cBmh?=
 =?us-ascii?Q?SwNpAj175S7araZMazAWZwf30CG7xliGtL44IKPZtkFfn9xD/omHjNo3AjIn?=
 =?us-ascii?Q?xWZhHh41BVo1ivcX5xyrlpHXyNB7PSXywQXzbNdFeZXhXVk7YCPh2GmKv49u?=
 =?us-ascii?Q?dXCURKfqdZl9eQSWZaMjaMgtLEtH7TjgHdHnbS4hQqo/5vDtq1UDaSumGQpd?=
 =?us-ascii?Q?mcjavPeHZ6Wjrvts70e6O0WDhTRRDhPYBmUFOn5Carw2LthPKH9g6hZVyeRn?=
 =?us-ascii?Q?SZ/WbkLOd7UoGQ/SNkbknXM1eMisKGKf/CWnFdCwU3zaXMZ2PxAhCDW7Sawx?=
 =?us-ascii?Q?p5HkeaCNooaxBdiRGIEXX7f3bD6rzV15W3b1nTebHYrZBvK2+OxRDzxjPhT+?=
 =?us-ascii?Q?1/xFdFYhqRkP7xj7gVzQ8AAX/u5qGSrgh/LoXf0GhIIypv1ijCyicJpD8bZB?=
 =?us-ascii?Q?yR9dOJoo3lh3Q8VajBqpOyE3duMMaI5Pkg4ZCJdG8AhopLavicbEn1Ww1zAZ?=
 =?us-ascii?Q?doVM+zImqWQn23ZryfJPxiXrEbA4QXwy99vppVEIpLpKQfRwgEWRrZv6dWbh?=
 =?us-ascii?Q?hTkFiHQhKQBaX2g6O7fj4wSBWSZz55bcRunR5gtX0MRD1xeFdn0kLNceVru4?=
 =?us-ascii?Q?tkK9MmJ/4XAlqZ1gL62u/Fli3LbzPqlC0i96wV/jeREf8VccPJOBPYl0Moy6?=
 =?us-ascii?Q?cP0nRQqWAUp41lBNd2fFa1O9ph1ChICK6AMH5UX0ZHE4I8JV/yUcb91iTN3H?=
 =?us-ascii?Q?QX++RNFzKbIiUgXFYkEVp6nC6vu1oWq4MstEjC1TN2YOi0zJYyySVcq/jaqs?=
 =?us-ascii?Q?/0JargE/iRxnBipxluxZ1kLWW1pdx4LoBTFB9xD3ANnv4pd3Zvg8b+hv0WUX?=
 =?us-ascii?Q?xD7aOc4uZ6EDL8abu9hOzn0G0v26uFYluDurm/ljL8dYsuoSMcdVZvtIP7i9?=
 =?us-ascii?Q?7EAfUjvTFFqox+9V0/DTZi53pYh/pdqLkAwTLaf2XzMKRqhDf6TZW1k9NA9J?=
 =?us-ascii?Q?5MWIX3WQxDlExVkereTC8aRcD5MvrDf3bOFYjbw2zQmYZ4CztR9HhbfK+pOy?=
 =?us-ascii?Q?H1hKAg+Sz2V3+ww6HaTVp+Ac26x98UXGjCmAWPHmpqwRXzP1ps1x/EVV+3qi?=
 =?us-ascii?Q?L1K7ISg0uCGajK3HCBhtwixOOP+ySNPbh+VhCroq++qos/uQmUX8so62UhdA?=
 =?us-ascii?Q?AWDyHzFwB7HVj5rnmgJhiMGASzWWQZovzJFf9kfXvKeMmz6XNwuoAeb8Zilt?=
 =?us-ascii?Q?MdFro/i8EoOggw+TkqfbmHNVc/2G3MxA4EY4CcqMw5KND0hQ6CFK2+xCJn8g?=
 =?us-ascii?Q?0V+QrfGNlFpGfYRQ0ZMP4NxCPm/pSXuYXZbaf6rny6kr+LgPdrsjT/yMMZyY?=
 =?us-ascii?Q?PSinY/dOkmRStVdrROVLWrDfQCB+mSTen6un7dkdIOoPpMuTSIoHrxiOgVwB?=
 =?us-ascii?Q?lMDU0Qm0DyhmgFt1Kcat+5pu1/yarsKKVqwvyvxHp0TSLZcvdPTpLSsn0k/n?=
 =?us-ascii?Q?OQfyNngUEEn0yHTpLf6KuhSQQWhGJz8B56jYEi7Ion7NbNA5AOWlGhEhfqTG?=
 =?us-ascii?Q?vUb85DYSP59dM08du4WYpKPKaWz0XANOa/B/OtCCmWYjns9nCexw6CsTPkHz?=
 =?us-ascii?Q?SkVxBIGL37wt0HKWBJvxV9NScVVOsNE=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a67edf9d-f279-4051-5369-08de8578e30d
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 05:32:18.6774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMxudg4ERSlMrD7MnaRGSok6JsqrNRY12mPr9SxDUhzq5yu4UJU2gPnsTwhn6yoZN1pfJcuNL9R+FJLPJKvAYfKbDt+eyRqF4WSqSDRdP8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB1345
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,collabora.com];
	DMARC_NA(0.00)[chipsnmedia.com];
	TAGGED_FROM(0.00)[bounces-56283-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.986];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid]
X-Rspamd-Queue-Id: 9AAB82C63D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jackson Lee <jackson.lee@chipsnmedia.com>

This series adds several encoder-side enhancements for the Wave5 driver.

The following features are introduced:
- Background detection support via V4L2 controls
- CBP profile support
- Support for packed YUV422 formats

Background detection allows the encoder to differentiate between
foreground and background regions, potentially improving compression
efficiency depending on the use case.

CBP profile support extends compatibility with additional encoding
profiles.

Support for packed YUV422 formats enables handling of commonly used
input formats such as YUYV and YVYU.

The changes include updates to control definitions, documentation,
and driver implementation.

Tested on Wave5 encoder pipeline with GStreamer.


Jackson Lee (3):
  media: chips-media: wave5: Add Support for Background Detection
  media: chips-media: wave5: Support CBP profile
  media: chips-media: wave5: Add Support for Packed YUV422 Formats

 .../media/v4l/ext-ctrls-codec.rst             |  5 ++
 .../platform/chips-media/wave5/wave5-helper.h |  2 +-
 .../platform/chips-media/wave5/wave5-hw.c     |  7 ++-
 .../chips-media/wave5/wave5-vpu-enc.c         | 49 +++++++++++++++++--
 .../platform/chips-media/wave5/wave5-vpuapi.h |  2 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 +
 include/uapi/linux/v4l2-controls.h            |  2 +
 7 files changed, 64 insertions(+), 5 deletions(-)

-- 
2.43.0


