Return-Path: <linux-media+bounces-41307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9473DB3B638
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 10:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A0041C85591
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 08:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66E42BE648;
	Fri, 29 Aug 2025 08:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="T4AvYNgf"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020136.outbound.protection.outlook.com [52.101.156.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7E5296BB3;
	Fri, 29 Aug 2025 08:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756457250; cv=fail; b=cwtFRqV0fouWO3Hq7k83qKMgT5VenZefiCOVTfgLu6i5dPc9hYCJH9rxU8szaDfeLNflC48yU2a5Oqlu+oBeuhRNLRRaeDLEfdRftAI+puHvAFP3MQtrqeGplIRGmwtC/TAirxCAPUYte1y6W+2aId7LFIPRbd6i+rt5IdYzBWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756457250; c=relaxed/simple;
	bh=ABrnrTovhAVFd8RKSZAeDM6O2uQH4vTzCsKS/eQi4+8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ToNicjIU85iNfjL87BVzJsFaBlQ3Dsbw9mtVQ3V2o0nA6ydF9tCe4LrOAsGW7Po+GRrxpFtno3BmdnRZEUpDN52UGk1EiK9mKC7/v/0YstDmJdY6EJwt5q5Bcy19IsQtSKXo0egTN9/KS+p3xrdt71DbVnEfddMVW7b9SiRjTe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=T4AvYNgf; arc=fail smtp.client-ip=52.101.156.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SbwwSSC7Dv4T+3PuSH/1aJn3hpUBVZTpj1+wxgTmNWZkR7bANWUaSu6viN7JKOAStei5qR1xc3msJr2jPqJSvrcYvGZ/cO8dJNDsA34EpVGO10fMGCkfRIcgk6ICzOFbYFedbEHwQdzHy9d9Hs3jVnLoD3iI+vZD5i+Pt3GOVAuw/AZOxQ4RjsHKc1UdbmytmjsBfLkzL3fZkdyP845KesUhjI935Xn08JfDqtzNBhx02LeA+uUcb7iiK6AzLV74M9XLZY1KV0lmhCsmRRPFf9Fq4+peLFLhmwC/h2++QS0wquk1VT6frVMVop2LHa4yeeAdwJKZTMlUgShiNNClKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFr98gTw0neOW+GYDEc9t68Jl9kUFvOi4fqzO55OHwU=;
 b=hs+C5UYTiwYBJHFd2ogNzXyB7vVqTGYbgIHYQapWKUXoyw1sASqdArZwGpGYtzZqP1GIFSwFvBmOENlcv/a+o1JEJYKH9CDdvG6sUqsh5Tzc5PmHSv9nGNsDEshtw6kJc0/2V9HzoIZqFyfgbbO/It2lkzYP+tkm5dsztgkMvG6pAmN8lgyME4a/VVTFQp7Ql3M8sGh8IbHI/c/D1TbnNVULMeLIU6jc4FS5UAB2a1xdl/hU+pCkPIdE8ijwfoM/NcA8Ufd/OaC2C1EoUtigCAl9w6OiSF8255nLoVBIUNtTvn2ARtmqqNwBvi/b3QwLkpbZWcDNEF2ybT1llqbFkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFr98gTw0neOW+GYDEc9t68Jl9kUFvOi4fqzO55OHwU=;
 b=T4AvYNgfuSub0IvUD0FSzGjZ6jNhFhBsxR6Mkda8AeVN+LYk+DyWEAc2sbHVCQYbVpGShT2LrWGaXXNa8f/GHqF5hoybM5v7uVSRyZAiHaLZAVSt5Qhm01R9XiiNEwHuZQrFyRyiJcLB6xtMlbBJ5fO6ZiW8EN56CPBxGHQAW7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SL2P216MB1418.KORP216.PROD.OUTLOOK.COM (2603:1096:101:33::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.13; Fri, 29 Aug 2025 08:47:22 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9052.011; Fri, 29 Aug 2025
 08:47:22 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v3 0/9] Add support for Wave6 video codec driver
Date: Fri, 29 Aug 2025 17:46:40 +0900
Message-Id: <20250829084649.359-1-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SL2P216MB1418:EE_
X-MS-Office365-Filtering-Correlation-Id: c09b527f-d906-4f6b-d402-08dde6d8ab52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pFnrslCRC4swl5pBqrX+dTj6f3ltvBfmZ6zlMqKX2cU3jbOkXvK+Jql2jtuU?=
 =?us-ascii?Q?jLcOcy19TI6aaj0JdzElEz1hqKXDe4ixbFpiSA2iGxWWR5134sbDwCpWcXtl?=
 =?us-ascii?Q?LmZG3uNdeAgfIcZMIRjNRdj/fk70U8Ac1s2p4tK/L05LxOee5wGVbgq2huB9?=
 =?us-ascii?Q?4kqY+Si4CYCrAPqVyIdljIQX8qkNb6lAFZF45Ger8w6+iBAarPIuHgfW3aB7?=
 =?us-ascii?Q?GMhlRmItNssljt9Q36JQTM9vVQZ8/5YY1OVQ8xXTipMG0+qr6NtkGaViAqTg?=
 =?us-ascii?Q?MfX2J2nLIxTWiyd92sHEtcBoh81diuFVA1Q3d7Ri/Ih0Xwklrxpy4MNu7Acl?=
 =?us-ascii?Q?gbM3rqwyf6nZDABcToSwJ+td9fNxMb402cXjjYp+WQsBu8piIjgPF26N/2Lc?=
 =?us-ascii?Q?qk4f5laDi/C9hwI0psuJtd5/LSPGTouZ39dlOo5tdTGWKjoxpmkWrWWtEw0/?=
 =?us-ascii?Q?1qHM5jpqzPluN1dYoDeJOOSe7qTdYj5gXxMjAap2QgonofW98RewNfSWe+WZ?=
 =?us-ascii?Q?CPVgnRGDVXJ7oS874FYaXipVDxJhis8x08OL9AOgDi0VRWalqR7lr0knYRul?=
 =?us-ascii?Q?sb5a8Yf0O91a+qb9/bcl9Tno3PUbUoP+QmMHkIJIO4i+n1Nk8/ryBygn/suJ?=
 =?us-ascii?Q?r62YW6ZGgt2pMOuoOyWvC3RrWp7jaRpHiGFk/eVSgzP9GCQ/fTlehDWRDqrQ?=
 =?us-ascii?Q?OSeYuEzitBzfnzsHOdq7tEDPVOVRWQXbOzDy3GtPai9k4Ulo4RXJ+DpLPU/a?=
 =?us-ascii?Q?/CuPjWQs+vLTB1bW1Fy9WtzeoUQNDYwlk+VmMys5KOZ7WY9avwKEPJZJvcKk?=
 =?us-ascii?Q?y8ugcHyFj19q9/nbZa6IhmzaJRn5Vbvub7J9kNtsInjYmcxhBQc7NrWMMI+G?=
 =?us-ascii?Q?r92qrtcEyKWzzCOOOIcCthY3A3BrLYrUYVKCSveclyVtNTZ+gskldtCIlag7?=
 =?us-ascii?Q?3M/jmxa2LdG9cMbfUIEPv4o6O/NPg/tMK4KSNdEAHShHLGK12G/5Hh8JxDAn?=
 =?us-ascii?Q?4niSKtXj6cQgAdq6A29XemtB6ZV1G25Wj91mrOSBMIGQgu+m4RiOFTMcL+6J?=
 =?us-ascii?Q?z0Edu6fPye3qpXzlL3SQr++Wv7rpWXN3CQTW4OndTZ7EOrhMd7QARCSoEKDi?=
 =?us-ascii?Q?wftjMnskvp7gYhFwj1RzgH4WEbJ3Lf8OKj0a4if1qFMHjQ3jI1fYtaAlJrSA?=
 =?us-ascii?Q?pPaXBU6dJrjD52lKBb0R9k6GAnY3ALjqF0m2SfL+qItTsJyhnaZGQm0p8TX8?=
 =?us-ascii?Q?/jm/lGCvhiDpODb4gfVAVFKSaiOflyW4NcMcqm6Xc9sx3f5R1VtFZFWwOXcB?=
 =?us-ascii?Q?aeU7jHA1WLlX0TnKzgX4vLajnTdE7r9ClubUGPeYhUfhLwH0O6ciie2npowv?=
 =?us-ascii?Q?rcXX0tmxjPNm/M6Ltk96MqQUY1Pt/WwNbA2tmzLdJvhcjJNnvfu9TNhj1Xq+?=
 =?us-ascii?Q?4iUaehCGD7saJ09VjX3/4UPEH4TrtD4EgIiBH6WjZ40fdLv7r9ZApQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UMiVhfIAz7hdp2ou4TIha1PTFkeCl+IbBQDgk9SF7wBq4Mdy0EddN67dMZ2Z?=
 =?us-ascii?Q?a+Rs6zrvGzw9Nqp7Cqh4MQIy0t/OgvUbxKVefOrW3EnwNz37uiPMpZJvKeEs?=
 =?us-ascii?Q?TnoZ9jG0nSfZ2DlqgKwnp/J1gSSXPQw7LXKvmRX5yridF9BCsw9DUPL+6RXg?=
 =?us-ascii?Q?3fX7sXSqoDxtta/hTuT8yTLcICjzDuh238JlzesZ2VWW3vATnCB5l5SDRaSJ?=
 =?us-ascii?Q?uY7MfEdo1nwhHC5wWlTKQ9GNwAbgaTzlVboDPKbd9pzf+42JMjkxH6NkAlQ4?=
 =?us-ascii?Q?dVD/4AGsoci6fkhTM9U0p6iczE/J8bMKd7vt2C8HOa34+lrm4SSi5KokIb0+?=
 =?us-ascii?Q?rMysT5xhkYro29ho7K2OcoIqvru4kN1bpXRWideIx0MwbB/ZEMtVnO4K7meL?=
 =?us-ascii?Q?vNMqElY9rw6aQjUVoKaJhoMUiTOGSJY1BUPi/1Dh5EP2SNRGa11g5adOT7yx?=
 =?us-ascii?Q?WAMPwKZwG4S572iOquQI08suSkUaolM4LCUJcbfWsqWebBtvT0kTj23IdTPF?=
 =?us-ascii?Q?86oDvDIHZp7g+cq76P9xIEe+mVT/mlqv8QdqSu2sz3Gm/XAWOyVvO6mlJQPD?=
 =?us-ascii?Q?PGEHD4pLC88B1KZI1FOQ3uajKUNPHNcXQhriEWZvAigTYec+xAA+C/s3qiR5?=
 =?us-ascii?Q?D+79VvtS084yKk/IjEAFujzNoGnZG8Gvf2pZ2zhOek3N11awqVJ1rSN9w80P?=
 =?us-ascii?Q?bfp5NSyioUDoOmqqcUcvdGuzgVUg4IOmaz+ctytqkarZVdOQuDo+feSkRscf?=
 =?us-ascii?Q?GEgnpaW1o41dp4CoygUTTj5X+9AHuLoA09K/CQNll2yXvUmiamK+pwaAZNJ7?=
 =?us-ascii?Q?ERvv8NxHFSI5mnAHHAGeJEev7GPP5pE6Wo8A6PaAe8CcxJXwt8IOpnKslh8x?=
 =?us-ascii?Q?GSqjDdKATd/1/pxsn2d0H54XmBrZ0BmmxoKsbnj7fZ4G4TWhJ5DE63wPLpHR?=
 =?us-ascii?Q?Fx4Bbmp+7YePHoRHt8y1msxC12AcTDyxkmRxqwTtZsz9/nn+3K8OwXF8mH7q?=
 =?us-ascii?Q?Ti3IPm1teEZUBsnmZWHFWGz7iDCSL9gFeuj0Z9dxN4u1/T3GxWSReQRCd0wG?=
 =?us-ascii?Q?cx+6T01FtnGKwsJBZc+HfWiz73z6JWkK+E63gF/4v0i+5S7gRScDLOs6+Kcq?=
 =?us-ascii?Q?U67lymdsql5fTiFUhpVAyCXz+ZanOQuqL37xAdpiBSWk8+NpwENUPlY/QfQy?=
 =?us-ascii?Q?7lyfZRJiIiXmbq9yQiscOres62n7JgaSUkxVLVwpAhZTAV9BQbaT6G2wC2Fb?=
 =?us-ascii?Q?IC9GgdAUoWXHUj5oI/J+wGmtNu4c6cP6asR5+MGDUle16+9QuzdkHRNF2LsG?=
 =?us-ascii?Q?44gOU5Tqu5q+f8nx9DOU5FGxKIEAu/vNWN5ApKaTm3LicnMMJPvfKZGNfbLo?=
 =?us-ascii?Q?7KShGzLgRIJ31rOSmmr3tXiOdp1hFBYAwpUt1T5QHHoKQv5h0LfRHl4oGjdg?=
 =?us-ascii?Q?RvavcZ3SzsgMHlVhD7EmefdsP5vgXxQbVCSzZQrSZAbKtkrMaEQb7X2FumAO?=
 =?us-ascii?Q?MLAjpCGIQbEefJcUZZI7l2Qf/6kRt4u1UH/eCQVKRhWIYw05Vgm4aVBJjvZz?=
 =?us-ascii?Q?BYTcmpwrMymIe6M8SGOK3ysTb/CLuzO1aT4KIfdYP1dk68zBDF4fiHVBebz6?=
 =?us-ascii?Q?7g=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c09b527f-d906-4f6b-d402-08dde6d8ab52
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 08:47:22.0771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOBfphmRfYzSikP/d1j9hnsah4zEFe4C8AofItB8gfKaeZTvVqXTUl0g4kT81xYW0TPJbWKhYx5K+TvZQ5s171A1u8M2gRbtxN/P8c12rN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1418

This patch series introduces support for the Chips&Media Wave6 video
codec IP, a completely different hardware architecture compared to Wave5.

The wave6 driver is a M2M stateful encoder/decoder driver.
It supports various video formats, including H.264 and H.265,
for both encoding and decoding.
While other versions of the Wave6 IP may support VP9 decoding and
AV1 decoding and encoding those formats are not implemented or validated
in this driver at this time.

On NXP i.MX SoCs, the Wave6 IP functionality is split between two regions:
VPU Control region, Manages shared resources such as firmware memory.
VPU Core region, Provides encoding and decoding capabilities.
The VPU core cannot operate independently without the VPU control region.

The firmware tested by this driver has been upstreamed in linux-firmware:
- Path: cnm/wave633c_imx9_codec_fw.bin

This driver has been tested with GStreamer on:
- NXP i.MX95 board
- pre-silicon FPGA environment

Test results for decoder fluster:
- JVT-AVC_V1, Ran 77/135 tests successfully              in 43.050 secs
- JVT-FR-EXT, Ran 25/69 tests successfully               in 20.654 secs
- JCT-VC-HEVC_V1, Ran 132/147 tests successfully         in 87.940 secs
- All failures are due to unsupported hardware features:
-- 10bit, Resolutions higher than 4K, FMO, MBAFF
-- Extended profile, Field encoding and High422 sreams.

Test results for v4l2-compliance:
v4l2-compliance 1.31.0-5386, 64 bits, 64-bit time_t
v4l2-compliance SHA: 48316b8a20aa 2025-08-12 12:44:56

Compliance test for wave6-dec device /dev/video0:
                fail: v4l2-test-controls.cpp(1204): !have_source_change || !have_eos
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
Total for wave6-dec device /dev/video0: 48, Succeeded: 47, Failed: 1, Warnings: 0

Compliance test for wave6-enc device /dev/video1:
                fail: v4l2-test-controls.cpp(1193): node->codec_mask & STATEFUL_ENCODER
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
Total for wave6-enc device /dev/video1: 48, Succeeded: 47, Failed: 1, Warnings: 0

Note: the failures are all related with the eos event.

Changelog:

v3:
- Removed ambiguous SUPPORT_FOLLOWER feature
- Used WARN_ON() for unexpected programming errors
- Split thermal device code into wave6-vpu-thermal.c/h
- Dropped wave6_cooling_disable module parameter
- Replaced mutex_lock() with guard()
- Added lockdep_assert_held() to clarify locking regions
- Removed exported function due to dual-license and used function pointer
- Added documentation and validation for state transitions
- Added documentation for device structures
- Added patch to enable VPU device in imx95 DTS
- Updated DT bindings and driver to align with parent(vpu) and child(vpu-core)
- Replaced magic numbers with mask and offset macros when accessing registers
- Placed goto statements after an empty line
- Printed HW info (e.g. product_code) via dev_dbg() for debugging
- Replaced wave6_vpu_dec_give_command() with dedicated functions

v2:
- Refined DT bindings to better represent the hardware
- Reworked driver to align with the parent(VPU) and child(CTRL, CORE)
- Fixed build issues reported by CI tools (Smatch, Sparse, TRACE)
- Improved commit messages with clearer descriptions
- Added kernel-doc for exported functions
- Removed redundant print statements and unused code
- Reordered patches to prevent build failures

Nas Chung (9):
  media: v4l2-common: Add YUV24 format info
  dt-bindings: media: nxp: Add Wave6 video codec device
  media: chips-media: wave6: Add Wave6 VPU interface
  media: chips-media: wave6: Add v4l2 m2m driver support
  media: chips-media: wave6: Add Wave6 core driver
  media: chips-media: wave6: Improve debugging capabilities
  media: chips-media: wave6: Add Wave6 thermal cooling device
  media: chips-media: wave6: Add Wave6 control driver
  arm64: dts: freescale: imx95: Add video codec node

 .../bindings/media/nxp,imx95-vpu.yaml         |  145 +
 MAINTAINERS                                   |    8 +
 .../boot/dts/freescale/imx95-15x15-evk.dts    |    5 +
 .../boot/dts/freescale/imx95-19x19-evk.dts    |   10 +
 .../dts/freescale/imx95-phycore-fpsc.dtsi     |   10 +
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi  |    5 +
 arch/arm64/boot/dts/freescale/imx95.dtsi      |   43 +
 drivers/media/platform/chips-media/Kconfig    |    1 +
 drivers/media/platform/chips-media/Makefile   |    1 +
 .../media/platform/chips-media/wave6/Kconfig  |   17 +
 .../media/platform/chips-media/wave6/Makefile |   17 +
 .../platform/chips-media/wave6/wave6-hw.c     | 2929 +++++++++++++++++
 .../platform/chips-media/wave6/wave6-hw.h     |   73 +
 .../chips-media/wave6/wave6-regdefine.h       |  638 ++++
 .../platform/chips-media/wave6/wave6-trace.h  |  286 ++
 .../platform/chips-media/wave6/wave6-vdi.h    |   92 +
 .../chips-media/wave6/wave6-vpu-core.c        |  406 +++
 .../chips-media/wave6/wave6-vpu-core.h        |  133 +
 .../chips-media/wave6/wave6-vpu-dbg.c         |  225 ++
 .../chips-media/wave6/wave6-vpu-dbg.h         |   14 +
 .../chips-media/wave6/wave6-vpu-dec.c         | 1863 +++++++++++
 .../chips-media/wave6/wave6-vpu-enc.c         | 2690 +++++++++++++++
 .../chips-media/wave6/wave6-vpu-thermal.c     |  136 +
 .../chips-media/wave6/wave6-vpu-thermal.h     |   25 +
 .../chips-media/wave6/wave6-vpu-v4l2.c        |  507 +++
 .../platform/chips-media/wave6/wave6-vpu.c    |  654 ++++
 .../platform/chips-media/wave6/wave6-vpu.h    |  131 +
 .../platform/chips-media/wave6/wave6-vpuapi.c |  725 ++++
 .../platform/chips-media/wave6/wave6-vpuapi.h | 1010 ++++++
 .../chips-media/wave6/wave6-vpuconfig.h       |   71 +
 .../chips-media/wave6/wave6-vpuerror.h        |  262 ++
 drivers/media/v4l2-core/v4l2-common.c         |    1 +
 32 files changed, 13133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
 create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
 create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-regdefine.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuerror.h

-- 
2.31.1


