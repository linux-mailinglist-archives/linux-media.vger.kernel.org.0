Return-Path: <linux-media+bounces-12564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A078FC4E1
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 09:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F4F31F25582
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 07:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D67618C356;
	Wed,  5 Jun 2024 07:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="aCDx14ZH"
X-Original-To: linux-media@vger.kernel.org
Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C5E18C33A
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 07:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573520; cv=fail; b=AyuatbT+HuJPEGAvh8eZSsYOF1EO2LMU7Z51+Z7MupUkun1mRMGDM9SJn1lk1iB0dJbs33fKK3l7L5t074NzdQZB7RjD4UzHYprVARxUkO6md8HVvvFFbGNPe3SqAD414LDq/82Koa6V54+VN3k6S4FELSMHgUJ/cCoGj7GS9yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573520; c=relaxed/simple;
	bh=3mxKMsgV0sHgC8qSMkaCAuv8HyaCCq9r928nW47Qdoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OV1tniQI5mcNu2ey6FAyuhLv6qeOctMeFSVoqHH5dpYlCLzNH+xRyWuP1T5l1wetsd8fo3WjbRI/TuArfUv3LHKm87+9tys63+uMStnKoilbTJdieMOKIqIMKAKUf72ru9K8s08E7lk1U1lfkOOn8E2xOZfrJvs2d3VfxEgUlnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=aCDx14ZH; arc=fail smtp.client-ip=18.185.115.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 104.47.7.174_.trendmicro.com (unknown [172.21.19.58])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id 4F653100F25ED
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 07:45:14 +0000 (UTC)
Received: from 104.47.7.174_.trendmicro.com (unknown [172.21.181.109])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id B6EE5100017AA;
	Wed,  5 Jun 2024 07:45:06 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1717573503.190000
X-TM-MAIL-UUID: 02b839e6-3fcc-4a58-8ba5-1b32d7460aca
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.174])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 2EA3210000313;
	Wed,  5 Jun 2024 07:45:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wkq3pQvorVOk9iWLbcFg2qlpkfupxuNcgZyCY8Fm5lvZcImXMvb8BNW/vepokSaR9pVY8g9tZ8De5qLep0e5OaGIpbvH3JDuhDLo7VhGurQIlXR1QW0joRM22uveiaePQfBgS2bfsQZo6bN/trGGK0OZLTsq++THTL+tiLmT9/mEw6zrUFEHN9yE3XhLQ2yxUQSmnFtBzPER+DYYr05KbmnzJ+SGpN2Cdnf7zk3b0WwUeM5D0VVDYuoMn7zsPVNOYo8GGFuxw+t1XklPA0pBMOG1ONV+LIIwSQOgkFEOyGyfFpFh0fHZbRhHtO0U5JXTzp51sOhQ+7sG6n5xJ9p4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNvtYPe7W/t4ouV2SIozFOI5B2f26aBgOcplPrhuozg=;
 b=LMJcwS/DXhzdtbjaQoYvCl+JJWDKuVn1I58WhnzhyUW/UUu6yKIoxUS0Z4gURv4fBf/rHZC2oWWSWxrIl5HpFnNeSGFA8R11rOWb1sT0yzaQt7h81O6lHV5wcIj8b2MDcj7qf0UoTvR8DJX/J0YhNjsTF0SZ0IDrtCRmucVFayoe/2HnAxVFwoeih3kECLgPVDnVJAs6SprFbk5E00yYQZ6n6Ft3pSUe3bgjrqpYtq4MIc6VC1uMHm4sj8t9h1u6sOqTbfDH9lKJwsSjLvbK26OSievHIBk8zhuotwFObukEbmBKv4muIhUU/UtZaITXEc0RvU+ngW9/Y8jZ3ClKbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 213.61.166.92) smtp.rcpttodomain=chromium.org smtp.mailfrom=opensynergy.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensynergy.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 213.61.166.92)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensynergy.com;
Received-SPF: Fail (protection.outlook.com: domain of opensynergy.com does not
 designate 213.61.166.92 as permitted sender) receiver=protection.outlook.com;
 client-ip=213.61.166.92; helo=SR-MAIL-03.open-synergy.com;
From: Alexander Gordeev <alexander.gordeev@opensynergy.com>
To: virtio-comment@lists.linux.dev
Cc: Alexander Gordeev <alexander.gordeev@opensynergy.com>,
	Albert Esteve <aesteve@redhat.com>,
	Alexandre Courbot <acourbot@chromium.org>,
	alex.bennee@linaro.org,
	Andrew Gazizov <andrew.gazizov@opensynergy.com>,
	Andrii Cherniavskyi <andrii.cherniavskyi@opensynergy.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Enric Balletbo i Serra <eballetb@redhat.com>,
	Enrico Granata <egranata@google.com>,
	Gustavo Padovan <gustavo.padovan@collabora.com>,
	Keiichi Watanabe <keiichiw@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Marcin Wojtas <mwojtas@google.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Matti.Moell@opensynergy.com,
	bag@semihalf.com,
	bgrzesik@google.com,
	hmazur@google.com,
	mikrawczyk@google.com,
	srosek@google.com,
	zyta@google.com,
	linux-media@vger.kernel.org,
	libcamera-devel@lists.libcamera.org
Subject: [PATCH v9 RESEND 1/1] virtio-video: Add virtio video device specification
Date: Wed,  5 Jun 2024 09:42:38 +0200
Message-ID: <20240605074239.124473-2-alexander.gordeev@opensynergy.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605074239.124473-1-alexander.gordeev@opensynergy.com>
References: <20240605074239.124473-1-alexander.gordeev@opensynergy.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|BE1P281MB1652:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 368fb5e8-4bd9-47b2-9dd2-08dc85336643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|7416005|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aW+dryk5I3SW/HY7Akd00k4wlQjRWe0Z9GAxxvQqfewGkKL4rTI9edsbzANh?=
 =?us-ascii?Q?B7zEgi43m5Ii78YF+v420irmZGAX26dn1ZMASRYnSTGNJP+OsOMjVska8auL?=
 =?us-ascii?Q?qNwVLGQv6gzz0PP7GoN/zhUlC9wIbrMwRyfyucFYgMm9Yc5Gm5CIgzduBrr+?=
 =?us-ascii?Q?ZKxqMDpJ9kWjpvo5MM8x2pLgFyrRV3ye6B8Mu6MSp2SnvrzXTi3+VPSKTvoX?=
 =?us-ascii?Q?4hlPcWVpWTKjXCsUV9DKigLLqwLoAbVh+xOuHtzmczBFLca+X8Ltmd406jhy?=
 =?us-ascii?Q?jQLu94SB/FlUbHt4wz5UpdDxQcIJ3Pj81NeX94vOZPHMdQKf+E/dFQe01f+H?=
 =?us-ascii?Q?fVANYEdXmbQFQiMmKMObEQBjXD1go2ku+VgKhb1QhB/q1PMCTadO0xZDHjsQ?=
 =?us-ascii?Q?qxl6FI0p8o03/rDvLkdJPUBBBGz9fL3ymf3wTmSILABrj/dW73zamPykf9jD?=
 =?us-ascii?Q?Y0rHZyi521jR90IB0XpiOSEFPqzvtngQYcjYMYjIsdtvClzywQ7BjJQzwXfE?=
 =?us-ascii?Q?4Dp1jgmNZk608Qo4QTq3zoMGDX4VxthkWnLWKMk2nWBSeNtUwat/orERHgAX?=
 =?us-ascii?Q?F3URVOW7iMb1eKvfSxUdF1pGLMMqdqbB7sl9Q6sUQM2s5uexwPlq6nx9Rm+B?=
 =?us-ascii?Q?mW7Sfw1bwWp2/ONTKtHwoIFxhBp1Kas5gERX1llR02M0oDdHl7bvg98nbIJ6?=
 =?us-ascii?Q?tH/MjWduU09wESb/whJJhYGwUCRYlvLU9X4BVFpCelhu/tjXl1TRQ/K+fUVT?=
 =?us-ascii?Q?Fj1z89RFFhTS1CrN5oXXAmQ8t1cUXsHdfr7SxucVMthDOadC5W6FarO9ofPf?=
 =?us-ascii?Q?wnCvPWqSKIR8q09KnoBeEQinUuLTIxos0SGcz449c9n59awXd0IslYrPjp4s?=
 =?us-ascii?Q?227AWTEDSI1Gk/OqlPlVDS9XoJFVsg1ql8mZjcf2AEW04wwoiKwyy+dFm/Of?=
 =?us-ascii?Q?x6e7Loyv40leZgdwr/WVgbnu3PAWvc+jhfjjpg7GFqnsS9k9pE2cb6nK1GRE?=
 =?us-ascii?Q?HdM6H2qoOnjesJY/XIANaCZMCwStFODzn+K2Xb8v2UV40iUK/kFLVn4vpEI/?=
 =?us-ascii?Q?H4B0lSKELCZE69W6SbfnmQCALPYmz4uJDPMVNDPdUKTtfS1K+UTFnru/nGqH?=
 =?us-ascii?Q?J5u3T8+oq9mrE+/F9ZSc23IbcU9nclie8MRoSMzhCs7A1znLZ1Kdbo1e1ZeQ?=
 =?us-ascii?Q?8B5onC2+zb5tguwcybTSTGNp7Jq+D78xWPQFW70ieTACXLFkQuUCI/7HSY3N?=
 =?us-ascii?Q?UMcYJLEEel/Le47cJKM4LrSsXac/2y40XG1jmvQWQ8LSYTVPnhoSBjPLeT76?=
 =?us-ascii?Q?29a2BQ8jlrHx5odA8w2vcTI8lJfiPy4/wFri7m/i9LVBjO/3yNe3Zkrpj2RL?=
 =?us-ascii?Q?uGUI+jw=3D?=
X-Forefront-Antispam-Report:
	CIP:213.61.166.92;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:exchangeconnector.opensynergy.com;CAT:NONE;SFS:(13230031)(7416005)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 07:44:58.4520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 368fb5e8-4bd9-47b2-9dd2-08dc85336643
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[213.61.166.92];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB1652
X-TM-AS-ERS: 104.47.7.174-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28432.006
X-TMASE-Result: 10--41.209100-4.000000
X-TMASE-MatchedRID: uguXKWAYW0629q7eqMiTyNzqRWPHHnSLum0UBtV0GONISqO7uCT8Syim
	JVj5dukr6/rPRwScdR2dC9WfPjXQPNpBtr9Rh55gy1C2A7vhW+wZD7bjq+6lMGzY00haS8Qo2ub
	nxCjreJ/UBiVfv8ENO8cTZuxW2u2ZgPDtkwqV38Gqklvt+WCfSYi/ka5VrHsKN0X64jGy2dY+0J
	9ZTAkB2D6XLrr72MMkL1fM/YsPjGpMQYKCi0yy4lQem+rJhWN0IdtRgdu7cs8WHD9oTapTml/V6
	9Gj3UidnYwllTBx9C2HG+b8/CPujZ3JUsyWWqH18nz42vIG3TCL2bAZejNNl85hvaZoPJ3Cd1Di
	/SXDCo6IeE4MP8chfFSPVY67ZU4+zKJ5xOtfW8bxQKU3CzJSWzZ4NKr/TszHK2WlM+Lm07y1GZp
	9GnkU8wHKl3yN6PlPvS7lMMkjx7dP2Sw3BCN4jocjYJ6BzXpiPnVACJU37b1H8uP3KZtZEmj8Ub
	Ea4X9RyW0PjxRYG54iAR5RZap5OxUK7OV+Y5qykZQAm5ODCexHp4yal2Rx2b5RdmencIoAg/oVr
	ncbem8b/TO8zJaNaDiXwTUr0wWekTWIcCQfhDraSVoxB3xYaBsM/hJVvJaGz2luKw/BlowZwGwD
	+/7NLxXfLEr+yBkAfgJkM/37KLATZvBxq5apMPSHS069bJ9/oyn130Ra0tgycXWK8s3h+q7zQeW
	M/8x2+u0Y8q746Olm3tWwi8OgHeB7HlyLTyz4ToQHWk91Zg/oV8C4sWtV4ydqoCzj0nCRwupCpY
	Md9rVSSoBAdKiuS/SiRHJoQtJqZvhW2VhRdLTotZZFLzrVX2sCVKm5hjwd2j7jyCKpnCf6eDrks
	tFBca+eCSMeOiOkoobFKGylnAEWJAm9IzOmiC9h6tejU7UDBJetwkYd1rZxg7svMtapLiJsZ0L4
	JGotIuJieNVvzvp+3BndfXUhXQ==
X-TMASE-XGENCLOUD: acd12010-f70b-4ec5-90cc-a4a2f9d7aedd-0-0-200-0
X-TM-Deliver-Signature: DFA6566213698961C169DCE135F519A2
X-TM-Addin-Auth: 8m2DYKKpbq2OBbyyfRdgAMj/BRsc9qJKXbkeAW8LMC7J0fXtXXu5QhIRQZ7
	v4J3HgSOLbF8KysCCN3C0ArbP8GFHVARvHV6BH72xqxi/dGPJxWZhGFpNGO/NbmGLBExBS6K69V
	CVQcxsOJIzieV8lWJUtX4wEWNhvPleEQ8iqvE5fLCW3jMtqJHFvWHze8dI746e+HO1PGMi+59ll
	ahbD/HqDw3fu5HpOfKawMM3kV3VfNt47A6SZGpNOPXVV1wXkzY2/kTsgqjq+DKQeVW+RxtaQ8Su
	qaGIJGAOU4f5G4t5YeU0tq+kXDQMpI24LDte.WPS7a4fnlK/qyVkeiK6xLTSN7++ayGgdtVn6M+
	TL/FuyIivqKZK65fa5Ij9y4PdCOJVVrjyPeVG8zH6ZhpvAlOa9hR8J+P/XjZ8ETa7WWvm8+Wg4M
	0ZNa4He8wK4bV1XZfvKkQNrwR2PwNSF6sFVQDHPFIiGkf2PcC5z7uPahaUMeugM2N5M7i9YVXOx
	TDdzDyf6Pkjudn5e8yx/d8nn91pM3t7MOfTzSFyzex0KC/Nx5irxv0HLQZKvWSEncNCtqyEUz2O
	uQCMfM1aHK1wfPThMwToVEbxtrfl4RbyIyhhS8dYfCYGpKXrTne1Rf2FBecl+TmQCuFLoapCiPM
	gyDw==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1717573506;
	bh=3mxKMsgV0sHgC8qSMkaCAuv8HyaCCq9r928nW47Qdoc=; l=81486;
	h=From:To:Date;
	b=aCDx14ZHi+acB2kjLV/qTewW8oeCGlj80cLBm7efrFLwcOmhXyxdQW96AGElem5rn
	 mshQJSLoMe1FdxgUGnQw1sXDE8VCTi39pzvBXnIsXC5bgbOayZBT93TX64tyRllzI6
	 baabs78LHvXViTVRxRUtbtdGRisXhVPOxxXLN3NSK0Wzno7ViRsx+0WRRzMLtZIPCZ
	 C8wb4BPwOMKPG4GKUZ3DLibxs430pgRNB0OxDOLY388xLSxgoE+dGwXi8uCPK5di9N
	 vOAAHSdU7TM053Bpkl9ybNJ9RH/s12tPrAvI5J2G+ScuGStQSwCvssRzKdYoWeJLdq
	 WazymgtZKtQNA==

From: Alexander Gordeev <Alexander.Gordeev@opensynergy.com>

Add the specification of the video decoder and encoder devices, which
can be used to provide host-accelerated video operations to the guest.

Signed-off-by: Alexander Gordeev <alexander.gordeev@opensynergy.com>
Co-authored-by: Keiichi Watanabe <keiichiw@chromium.org>
Co-authored-by: Alexandre Courbot <acourbot@chromium.org>
---
 conformance.tex                           |    4 +
 content.tex                               |    1 +
 device-types/video/description.tex        | 1607 +++++++++++++++++++++
 device-types/video/device-conformance.tex |   22 +
 device-types/video/driver-conformance.tex |   20 +
 introduction.tex                          |   21 +
 6 files changed, 1675 insertions(+)
 create mode 100644 device-types/video/description.tex
 create mode 100644 device-types/video/device-conformance.tex
 create mode 100644 device-types/video/driver-conformance.tex

diff --git a/conformance.tex b/conformance.tex
index dc00e84..56cdade 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -34,6 +34,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance} or
 \ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance}.
+\ref{sec:Conformance / Driver Conformance / Video Driver Conformance},
 
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
   \end{itemize}
@@ -61,6 +62,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \ref{sec:Conformance / Device Conformance / SCMI Device Conformance},
 \ref{sec:Conformance / Device Conformance / GPIO Device Conformance} or
 \ref{sec:Conformance / Device Conformance / PMEM Device Conformance}.
+\ref{sec:Conformance / Device Conformance / Video Device Conformance},
 
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
   \end{itemize}
@@ -152,6 +154,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/scmi/driver-conformance.tex}
 \input{device-types/gpio/driver-conformance.tex}
 \input{device-types/pmem/driver-conformance.tex}
+\input{device-types/video/driver-conformance.tex}
 
 \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
 
@@ -238,6 +241,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/scmi/device-conformance.tex}
 \input{device-types/gpio/device-conformance.tex}
 \input{device-types/pmem/device-conformance.tex}
+\input{device-types/video/device-conformance.tex}
 
 \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
 A conformant implementation MUST be either transitional or
diff --git a/content.tex b/content.tex
index 0a62dce..b6469b7 100644
--- a/content.tex
+++ b/content.tex
@@ -767,6 +767,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \input{device-types/scmi/description.tex}
 \input{device-types/gpio/description.tex}
 \input{device-types/pmem/description.tex}
+\input{device-types/video/description.tex}
 
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
diff --git a/device-types/video/description.tex b/device-types/video/description.tex
new file mode 100644
index 0000000..8ec28d3
--- /dev/null
+++ b/device-types/video/description.tex
@@ -0,0 +1,1607 @@
+\section{Video Device}
+\label{sec:Device Types / Video Device}
+
+The virtio video encoder and decoder devices provide support for
+host-accelerated video encoding and decoding. Despite being different
+device types, they use the same protocol and general flow.
+
+\subsection{Device ID}
+\label{sec:Device Types / Video Device / Device ID}
+
+\begin{description}
+\item[30]
+  encoder device
+\item[31]
+  decoder device
+\end{description}
+
+\subsection{Virtqueues}
+\label{sec:Device Types / Video Device / Virtqueues}
+
+\begin{description}
+\item[0]
+  mainq - high-priority driver commands
+\item[1]
+  eventq - device delayed responses to commands and standalone device events
+\item[2] inputq0 - stream 0 input driver commands
+\item[3] outputq0 - stream 0 output driver commands
+\item[\ldots]
+\item[2N] inputqN-1 - stream N-1 input driver commands
+\item[2N+1] outputqN-1 - stream N-1 output driver commands
+\end{description}
+
+\subsection{Feature bits}
+\label{sec:Device Types / Video Device / Feature bits}
+
+\begin{description}
+\item[VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES (0)]
+  Guest pages can be used as the backing memory of resources.
+\item[VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG (1)]
+  The device can use non-contiguous guest memory as the backing memory of
+  resources. Only meaningful if VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES is also
+  set.
+\item[VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT (2)]
+  Objects exported by another virtio device can be used as the backing memory
+  of resources.
+\item[VIRTIO_VIDEO_F_RESOURCE_DYNAMIC (3)]
+  The device supports re-attaching memory to resources while streaming.
+% TODO: this flag is not used anywhere at the moment. Might be necessary with
+% Android. To be sorted out when the driver and the device are updated.
+\end{description}
+
+\devicenormative{\subsubsection}{Feature bits}{Device Types / Video Device / Feature bits}
+
+The device MUST set at least one of VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES or
+VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT, since the absence of both bits would
+mean that no memory can be used at all for resources.
+
+The device MUST NOT set VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG unless it also sets
+VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES.
+
+\drivernormative{\subsubsection}{Feature bits}{Device Types / Video Device / Feature bits}
+
+The driver MUST negotiate at least one of the
+VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES and VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT
+features.
+
+If VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES has been negotiated, but not
+VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG, the driver MUST use physically
+contiguous memory for all the buffers it allocates.
+
+\subsection{Device configuration layout}
+\label{sec:Device Types / Video Device / Device configuration layout}
+
+The video device configuration space uses the following layout:
+
+\begin{lstlisting}
+struct virtio_video_config {
+        le32 max_streams;
+        le32 caps_length;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{max_streams}]
+  is the maximum number of concurrent streams the device supports.
+\item[\field{caps_length}]
+  is the minimum length in bytes that a device-writable buffer must have
+  in order to receive the response to VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS, see
+  \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}.
+\end{description}
+
+\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Video Device / Device configuration layout}
+
+\field{max_streams} MUST be positive.
+
+\field{caps_length} MUST be set to the response size of
+VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS.
+
+\subsection{Device Initialization}
+\label{sec:Device Types / Video Device / Device Initialization}
+\begin{enumerate}
+\item
+  The driver reads the feature bits and negotiates the features it needs.
+\item
+  The driver sets up the mainq and the eventq.
+\item
+  The driver reads the \field{max_streams} field of the configuration
+  space and sets up input and output queues.
+\item
+  The driver reads the \field{caps_length} field of the configuration
+  space, prepares a buffer of at least that size and sends the buffer on the
+  mainq with the VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS command.
+\item
+  The driver receives the response from the device, and parses its capabilities.
+\end{enumerate}
+
+\subsection{Device Operation}
+\label{sec:Device Types / Video Device / Device Operation}
+
+The mainq is used by the driver to open streams using
+VIRTIO_VIDEO_CMD_STREAM_OPEN commands, close the streams using
+VIRTIO_VIDEO_CMD_STREAM_CLOSE commands, to reset stream queues using
+VIRTIO_VIDEO_CMD_QUEUE_RESET commands, to set some of the stream parameters out
+of band with high priority using VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS commands.
+Each stream has two dedicated virtqueues: inputqX and outputqX, where X is the
+stream id. The driver uses both queues to set their parameters using
+VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS commands and queue input or output
+resources using VIRTIO_VIDEO_CMD_RESOURCE_QUEUE commands.
+The driver can ask the device to complete processing of all queued input
+resources and make the resulting output resources available to the driver by
+queueing a VIRTIO_VIDEO_CMD_STREAM_DRAIN command to inputqX.
+The device sends responses to all the driver commands via used descriptors
+provided with the commands.
+The eventq is used by the device to send the device's delayed responses to
+commands and the device's standalone events.
+All the commands sent within an opened stream start background operations,
+return the actual results using delayed responses over eventq and use the
+command responses to establish links between the commands and the
+delayed responses.
+
+Parameters allow the driver to configure the stream including setting up the
+resources. Available parameters depend on the device type, see
+\ref{sec:Device Types / Video Device / Device capabilities and parameters}.
+
+A resource is a set of memory buffers that contain a unit of data that
+the device can process or produce. Most resources will only have one
+buffer (like coded data and single-planar raw frames), but frames using a
+multi-planar format can have several.
+Input resources are filled by the driver with compressed (coded) video data
+for a decoder and raw frames for an encoder, output resources are filled by
+the device as the result of processing the input resources with decoded raw
+frames for a decoder and compressed (encoded) data for an encoder.
+Resources from inputqX and outputqX are consumed independently, not in pairs.
+One input resource can result in zero to many produced output resources.
+A decoder device dequeues the output decoded frames in presentation order.
+An encoder device dequeues the output decoded frames in decoding order.
+The driver can reuse a queued resource after receiving a corresponding delayed
+response. Dequeued output resources can still be used by the device as
+reference frames, so the driver can't write to them.
+
+% TODO: maybe add a second delayed response, when the dequeued output resource
+% is not used by the device anymore and therefore becomes writeable?
+
+The device can detect standalone stream-related events: errors and dynamic
+parameters changes that require intervention from the driver (e.g.
+reallocating backing memory of output resources to fit the new parameters).
+The events are signalled on the eventq, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}.
+
+\devicenormative{\subsubsection}{Device Operation}{Device Types / Video Device / Device Operation}
+
+The device MUST NOT access inputqX or outputqX before it receives a
+VIRTIO_VIDEO_CMD_STREAM_OPEN command with \field{stream_id} set to X or after
+a delayed response to VIRTIO_VIDEO_CMD_STREAM_CLOSE with the same
+\field{stream_id} is sent.
+
+The device MUST set to zero all unused, disabled or padding bits in its
+responses.
+
+\subsubsection{Device Operation: Command Virtqueues}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueues}
+
+This section details the commands that can be sent by the driver to mainq,
+stream input and output queues and the device's responses.
+
+Different structures are used for each command and response. A command
+structure starts with the requested command code, defined as follows:
+
+\begin{lstlisting}
+/* Device */
+#define VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS  0x100
+
+/* Stream */
+#define VIRTIO_VIDEO_CMD_STREAM_OPEN        0x200
+#define VIRTIO_VIDEO_CMD_STREAM_CLOSE       0x201
+#define VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS  0x202
+#define VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS  VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS
+#define VIRTIO_VIDEO_CMD_STREAM_DRAIN       0x203
+
+/* Queue */
+#define VIRTIO_VIDEO_CMD_QUEUE_RESET        0x300
+#define VIRTIO_VIDEO_CMD_RESOURCE_QUEUE     0x301
+\end{lstlisting}
+
+A response structure starts with the result of the requested command,
+defined as follows:
+
+\begin{lstlisting}
+/* Success */
+#define VIRTIO_VIDEO_RESULT_OK                          0x000
+#define VIRTIO_VIDEO_RESULT_OK_DELAYED                  0x001
+
+/* Error */
+#define VIRTIO_VIDEO_RESULT_ERR_INVALID_COMMAND         0x100
+#define VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION       0x101
+#define VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID       0x102
+#define VIRTIO_VIDEO_RESULT_ERR_INVALID_RESOURCE_ID     0x103
+#define VIRTIO_VIDEO_RESULT_ERR_INVALID_ARGUMENT        0x104
+#define VIRTIO_VIDEO_RESULT_ERR_OUT_OF_MEMORY           0x105
+\end{lstlisting}
+
+For response structures carrying an error code, the rest of the
+structure is considered invalid.
+
+For all commands returning delayed responses over eventq, the command response
+is defined as follows:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_STANDALONE_EVENT_ID  0xffffffff
+
+struct virtio_video_command_resp_delayed_common {
+        le32 result; /* VIRTIO_VIDEO_RESULT_* */
+        le32 delayed_response_id;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{result}]
+  is
+
+  \begin{description}
+  \item[VIRTIO_VIDEO_RESULT_OK_DELAYED]
+    if the command started the desired background operation successfully,
+  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID]
+    if the mentioned stream ID does not exist,
+  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_RESOURCE_ID]
+    if the mentioned resource ID does not exist,
+  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_ARGUMENT]
+    if other command parameters are not valid, e.g. not within the device's
+    capabilities,
+  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION]
+    if the command is performed at a time when it is not valid.
+  \end{description}
+\item[\field{delayed_response_id}]
+  is an ID of the future delayed response provided by the device, that allows
+  to relate it to the command.
+\end{description}
+
+\devicenormative{\paragraph}{Device Operation: Command Virtqueues}{Device Types / Video Device / Device Operation / Device Operation: Command Virtqueues}
+
+Responses to a command MUST be written by the device in the first
+device-writable descriptor of the descriptor chain from which the
+command came.
+
+The device MUST return VIRTIO_VIDEO_RESULT_ERR_INVALID_COMMAND to
+any command code it does not recognize.
+
+\field{delayed_response_id} MUST be set to a stream-unique identifier that
+remains valid as long as the background operation hasn't finished.
+
+\drivernormative{\paragraph}{Device Operation: Command Virtqueues}{Device Types / Video Device / Device Operation / Device Operation: Command Virtqueues}
+
+Descriptor chains sent to the command queues by the driver MUST include at
+least one device-writable descriptor of a size sufficient to receive the
+response to the queued command.
+
+The driver MUST NOT interpret the rest of a response whose result is not
+VIRTIO_VIDEO_RESULT_OK or VIRTIO_VIDEO_RESULT_OK_DELAYED.
+
+\subsubsection{Device Operation: Event Virtqueue}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}
+
+The eventq is used by the device to send delayed responses to commands queued
+by the driver on other queues and standalone events. Stream errors and dynamic
+parameters changes are caused by changes in the device's state, not by
+commands, still they are delivered as VIRTIO_VIDEO_DELAYED_RESP_STREAM_CLOSE
+and VIRTIO_VIDEO_DELAYED_RESP_STREAM_SET_PARAMS, respectively.
+
+The supported events are defined as follows:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_DELAYED_RESP_STREAM_CLOSE       1
+#define VIRTIO_VIDEO_DELAYED_RESP_STREAM_SET_PARAMS  2
+#define VIRTIO_VIDEO_DELAYED_RESP_STREAM_DRAIN       3
+#define VIRTIO_VIDEO_DELAYED_RESP_QUEUE_RESET        4
+#define VIRTIO_VIDEO_DELAYED_RESP_RESOURCE_QUEUE     5
+
+#define VIRTIO_VIDEO_EVENT_FLAG_CANCELED             (1 << 0)
+
+struct virtio_video_event {
+        le32 event_type; /* VIRTIO_VIDEO_DELAYED_RESP_* */
+        le32 stream_id;
+        le32 delayed_response_id;
+        le32 event_flags; /* Bitmask of VIRTIO_VIDEO_EVENT_FLAG_* */
+        union {
+                struct virtio_video_stream_set_params_delayed_resp set_params;
+                struct virtio_video_resource_queue_delayed_resp queue;
+        };
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{event_type}]
+  is the type of the event.
+\item[\field{stream_id}]
+  is the ID of a valid stream.
+\item[\field{delayed_response_id}]
+  is an ID of the delayed response, that allows to relate it to a previously
+  submitted command. If it is set to VIRTIO_VIDEO_STANDALONE_EVENT_ID, then
+  this is a standalone event, see
+  \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}.
+\item[\field{event_flags}]
+  is a bitmask of VIRTIO_VIDEO_EVENT_FLAG_* flags
+
+  \begin{description}
+  \item[VIRTIO_VIDEO_EVENT_FLAG_CANCELED]
+    is set if the command has been canceled by another command, that has
+    higher priority. Doesn't make sense for standalone events.
+  \end{description}
+\end{description}
+
+The particular member of the union is selected according to the
+\field{event_type} for some of the types.
+
+\drivernormative{\paragraph}{Device Operation: Event Virtqueue}{Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}
+
+The driver MUST at any time have at least one descriptor with a used
+buffer large enough to contain a \field{struct virtio_video_event}
+queued on the eventq.
+
+The driver MUST NOT put device-readable descriptors into the eventq.
+
+The driver MUST account for the fact that the delayed responses to commands
+might come out-of-order (i.e. after other commands sent to the device),
+and that some of them can be cancelled.
+
+The driver SHOULD wait for a delayed response of command A, that caused
+cancellation of command B, before queueing the command B again.
+
+\subsubsection{Device Operation: TLV format}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: TLV format}
+
+Both VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS and VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS
+commands represent device parameters and corresponding device capabilities
+in the form of TLV (Type-Length-Value):
+
+\begin{lstlisting}
+struct virtio_video_tlv {
+        le32 type;
+        le32 length;
+        u8 value[length];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{type}]
+  specifies the type of data in \field{value}.
+\item[\field{length}]
+  specifies the \field{value} size in bytes aligned to 8.
+\item[\field{value}]
+  contains the data according to the type.
+\end{description}
+
+The following TLV types are defined:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_TLV_CODED_SET                1
+#define VIRTIO_VIDEO_TLV_RAW_SET                  2
+#define VIRTIO_VIDEO_TLV_LINK                     3
+#define VIRTIO_VIDEO_TLV_CODED_FORMAT             4
+#define VIRTIO_VIDEO_TLV_RAW_FORMAT               5
+#define VIRTIO_VIDEO_TLV_CODED_RESOURCES          6
+#define VIRTIO_VIDEO_TLV_RAW_RESOURCES            7
+#define VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES     8
+#define VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT   9
+#define VIRTIO_VIDEO_TLV_CROP                     10
+#define VIRTIO_VIDEO_TLV_V4L2_CONTROLS            11
+\end{lstlisting}
+
+Some TLVs are used only as containers for sequences of nested TLVs:
+
+\begin{description}
+\item[\field{VIRTIO_VIDEO_TLV_CODED_SET}]
+  groups various parameters or capabilities related to a particular coded
+  format.
+\item[\field{VIRTIO_VIDEO_TLV_RAW_SET}]
+  groups various parameters or capabilities related to a particular raw
+  format.
+\item[\field{VIRTIO_VIDEO_TLV_V4L2_CONTROLS}]
+  contains V4L2 controls represented in the TLV format. Within this container
+  only selected V4L2 control identifiers (V4L2_CID_*) are allowed to be used
+  in the TLV \field{type} field, see
+  \ref{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_CODED_SET / VIRTIO_VIDEO_TLV_V4L2_CONTROLS}.
+\end{description}
+
+TLV with type VIRTIO_VIDEO_TLV_LINK is a special one used to define relations
+between sets of capabilities, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}.
+
+For each of the remaining TLV types two different contained data formats are
+defined: one for the capabilities and one for the specific parameter values.
+
+\field{struct virtio_video_range} is used to represent a range of values in
+some TLVs:
+
+\begin{lstlisting}
+struct virtio_video_range {
+        le32 min;
+        le32 max;
+        le32 step;
+        u8 padding[4];
+};
+\end{lstlisting}
+
+An integer \(x\) is within the range \field{r} if
+\(\field{r.min} \le x \le \field{r.max}\) holds and \(x\) equals to
+\((\field{min} + \field{step} * n)\) for some integer \(n\).
+
+\devicenormative{\paragraph}{Device Operation: TLV format}{Device Types / Video Device / Device Operation / Device Operation: TLV format}
+
+\field{min}, \field{step} and \field{max} MUST be positive.
+
+\field{min} MUST be less then or equal to \field{max} within the same range.
+
+\subsubsection{Device Operation: Device Commands}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands}
+
+This command allows retrieving the device capabilities.
+
+\paragraph{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
+
+Retrieve device capabilities for all available stream parameters (for example,
+the range of values).
+
+The driver sends this command with
+\field{struct virtio_video_device_query_caps}:
+
+\begin{lstlisting}
+struct virtio_video_device_query_caps {
+        le32 cmd_type; /* VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS */
+};
+\end{lstlisting}
+
+The device responds with
+\field{struct virtio_video_device_query_caps_resp}:
+
+\begin{lstlisting}
+struct virtio_video_device_query_caps_resp {
+        le32 result; /* VIRTIO_VIDEO_RESULT_* */
+        u8 padding[4];
+        /**
+         * Followed by a sequence of TLVs up to caps_length
+         * counted in bytes from the beginning of the struct.
+         */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{result}]
+  is
+
+  \begin{description}
+  \item[VIRTIO_VIDEO_RESULT_OK]
+    if the operation succeeded,
+  \item[VIRTIO_VIDEO_RESULT_ERR_OUT_OF_MEMORY]
+    if the descriptor was smaller than the defined \field{caps_length} in
+    the video device configuration.
+  \end{description}
+\end{description}
+
+The sequence of TLVs consists of TLV containers VIRTIO_VIDEO_TLV_CODED_SET
+and VIRTIO_VIDEO_TLV_RAW_SET defining sets of possible coded, or respectively
+raw formats, including the corresponding parameters (e.g. profiles, levels
+or format modifiers, resolutions), that are supported by the device. For the
+details see
+\ref{sec:Device Types / Video Device / Device capabilities and parameters}.
+The last TLV in the sequence with type VIRTIO_VIDEO_TLV_LINK establishes
+relations between the two groups. If there is a link, then the device supports
+decoding from the specified coded set to the specified raw set, or encoding in
+the opposite direction. The value format is defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_tlv_link {
+        le64 links[n_coded * (n_raw + 63) / 64];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{n_coded}]
+  is the number of VIRTIO_VIDEO_TLV_CODED_SET containers.
+\item[\field{n_raw}]
+  is the number of VIRTIO_VIDEO_TLV_RAW_SET containers.
+\item[\field{links}]
+  is a bitset establishing links between coded and raw sets. For \field{i}-th
+  coded and \field{j}-th raw sets counted from zero bit \field{(j \% 64)} in
+  \field{links[i * (n_raw + 63) / 64 + j / 64]} defines the link if it is set.
+\end{description}
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}{Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
+
+The device MUST include into the response at least one
+VIRTIO_VIDEO_TLV_CODED_SET and at least one VIRTIO_VIDEO_TLV_RAW_SET TLV
+containers, and exactly one VIRTIO_VIDEO_TLV_LINK TLV, that defines links
+between the coded and raw sets. The VIRTIO_VIDEO_TLV_LINK TLV MUST be the
+last one in the sequence.
+
+Each VIRTIO_VIDEO_TLV_CODED_SET and VIRTIO_VIDEO_TLV_RAW_SET MUST take part
+in at least one defined link in the VIRTIO_VIDEO_TLV_LINK.
+
+Each VIRTIO_VIDEO_TLV_CODED_SET MUST contain exactly one
+VIRTIO_VIDEO_TLV_CODED_FORMAT TLV, exactly one
+VIRTIO_VIDEO_TLV_CODED_RESOURCES TLV and at most one TLV of other types.
+
+Each VIRTIO_VIDEO_TLV_RAW_SET MUST contain exactly one
+VIRTIO_VIDEO_TLV_RAW_FORMAT TLV, exactly one VIRTIO_VIDEO_TLV_RAW_RESOURCES
+TLV and at most one TLV of other types.
+
+VIRTIO_VIDEO_TLV_RAW_SET containers SHOULD be ordered according to raw format
+preferences of the device from preferred to not preferred ones.
+
+The total size of the response MUST be equal to \field{caps_length}
+bytes, as reported by the device configuration.
+
+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}{Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
+
+VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS MUST be sent to mainq.
+
+\subsubsection{Device Operation: Stream commands}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands}
+
+Stream commands allow to open, close and control the flow of a stream.
+
+\paragraph{VIRTIO_VIDEO_CMD_STREAM_OPEN}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_OPEN}
+
+Open a stream using the device.
+
+The driver sends this command with
+\field{struct virtio_video_stream_open}:
+
+\begin{lstlisting}
+struct virtio_video_stream_open {
+        le32 cmd_type; /* VIRTIO_VIDEO_CMD_STREAM_OPEN */
+        le32 stream_id;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{stream_id}]
+  is the ID of the stream to be opened.
+\end{description}
+
+The device responds with \field{struct virtio_video_stream_open_resp}:
+
+\begin{lstlisting}
+struct virtio_video_stream_open_resp {
+        le32 result; /* VIRTIO_VIDEO_RESULT_* */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{result}]
+  is
+
+  \begin{description}
+  \item[VIRTIO_VIDEO_RESULT_OK]
+    if the operation succeeded,
+  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID]
+    if the \field{stream_id} is out of limits specified by the device.
+  \item[VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION]
+    if the stream is already open or cannot be opened due to an unexpected
+    device issue.
+  \item[VIRTIO_VIDEO_RESULT_ERR_OUT_OF_MEMORY]
+    if the limit of simultaneous streams has been reached by the device and
+    no more can be opened.
+  \end{description}
+\end{description}
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_OPEN}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_OPEN}
+
+The device MUST ensure that the \field{stream_id} is within limits and that
+the corresponding stream is not open.
+
+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_OPEN}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_OPEN}
+
+VIRTIO_VIDEO_CMD_STREAM_OPEN MUST be sent to mainq.
+
+\paragraph{VIRTIO_VIDEO_CMD_STREAM_CLOSE}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_CLOSE}
+
+% CLOSE has to be more like RESET, not DRAIN, because it is called, for
+% example, when the guest user-space app closes a file descriptor. So there
+% is no sense in continuing the processing.
+
+Close a video stream. Any activity on the stream is halted and all resources
+are released by the time the delayed response is received by the driver.
+
+The driver sends this command with
+\field{struct virtio_video_stream_close}:
+
+\begin{lstlisting}
+struct virtio_video_stream_close {
+        le32 cmd_type; /* VIRTIO_VIDEO_CMD_STREAM_CLOSE */
+        le32 stream_id;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{stream_id}]
+  is the ID of the stream to be closed.
+\end{description}
+
+The device responds as described in
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueues}
+and begins a background CLOSE operation, that consists of RESET operations on
+inputqX and outputqX, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_QUEUE_RESET},
+and detaching all the resources.
+
+When the CLOSE operation is completed the device sends the
+VIRTIO_VIDEO_DELAYED_RESP_STREAM_CLOSE delayed response, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}.
+The same delayed response can also come after an unrecoverable stream error,
+see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events / Error Event}.
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_CLOSE}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_CLOSE}
+
+Before the device sends a delayed response to VIRTIO_VIDEO_CMD_STREAM_CLOSE,
+it MUST reset inputqX and outputqX and detach all the resources.
+
+After VIRTIO_VIDEO_CMD_STREAM_CLOSE is queued, the device MUST reply with
+VIRTIO_VIDEO_RESULT_ERR_INVALID_STREAM_ID to any subsequently queued command
+with this stream ID except VIRTIO_VIDEO_CMD_STREAM_OPEN.
+
+The CLOSE operation MUST NOT be canceled.
+
+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_CLOSE}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_CLOSE}
+
+\field{stream_id} MUST be set to a valid stream ID of an open stream.
+
+VIRTIO_VIDEO_CMD_STREAM_CLOSE MUST be sent to mainq.
+
+The driver MAY release descriptors of inputqX and outputqX where X equals
+\field{stream_id} after receiving the delayed response to this command.
+
+\paragraph{VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}
+
+Set selected parameters of inputqX or outputqX of a given stream and receive
+back the current values of all parameters supported by the device for the
+queue as reported by
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}.
+Coded parameters within a VIRTIO_VIDEO_TLV_CODED_SET container belong to
+inputqX of a decoder and to outputqX of an encoder. Raw parameters within a
+VIRTIO_VIDEO_TLV_RAW_SET container belong to outputqX of a decoder and to
+inputqX of an encoder.
+
+The driver sends this command with
+\field{struct virtio_video_stream_set_params}:
+
+\begin{lstlisting}
+struct virtio_video_stream_set_params {
+        le32 cmd_type; /* VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS */
+        le32 stream_id;
+        /**
+         * Followed by a single VIRTIO_VIDEO_TLV_CODED_SET or
+         * VIRTIO_VIDEO_TLV_RAW_SET TLV container with the parameters.
+         */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{stream_id}]
+  is the ID of the stream we want to set a parameter for.
+\end{description}
+
+The operation can be queued to:
+
+\begin{itemize}
+\item[\field{inputqX}]
+  The parameters are set after all commands previously queued on the inputqX
+  are processed. Both inputqX and outputqX parameters can be changed
+  separately. Any changes to formats or resource numbers trigger the following
+  sequence:
+  \begin{enumerate}
+  \item
+    an implicit DRAIN operation, see
+    \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DRAIN};
+  \item
+    only for changes to outputqX parameters: an implicit RESET operation on
+    the outputqX, see
+    \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_QUEUE_RESET};
+  \item
+    all resources of the affected queue are detached.
+  \end{enumerate}
+\item[\field{outputqX}]
+  The parameters are set after all commands previously queued on the outputqX
+  are processed. Only outputqX parameters can be changed. Changes to the
+  format or the resource number are allowed only after opening the stream or
+  after a outputqX RESET operation on outputqX before any resources are
+  queued.
+\item[\field{mainq}]
+  The parameters are set without waiting for other commands queued on inputqX
+  and outputqX to be processed. Both inputqX and outputqX parameters can be
+  changed separately. Changes to formats or resources parameters are not
+  allowed.
+\end{itemize}
+% TODO: list use-cases?
+
+% Use-case: for the decoder, resolution can be set manually by the driver
+% (useful for codecs that do not embed this information, like MPEG-2).
+% The processing sequence should look similar to the dynamic parameters
+% change case.
+
+Only the parameters returned in one of the corresponding sets in the device
+capabilities can be set, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}.
+The device checks and applies the parameter changes, responds as described in
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueues}
+and sends the VIRTIO_VIDEO_DELAYED_RESP_STREAM_SET_PARAMS
+delayed response, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}.
+The delayed response can also come in case of a dynamic parameters change, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events / Dynamic Parameters Change Event}.
+
+The command-specific delayed response
+\field{struct virtio_video_stream_set_params_delayed_resp} is defined
+as follows:
+
+\begin{lstlisting}
+struct virtio_video_stream_set_params_delayed_resp {
+        /**
+         * A VIRTIO_VIDEO_TLV_CODED_SET or VIRTIO_VIDEO_TLV_RAW_SET
+         * TLV container with all parameters supported by the device.
+         */
+};
+\end{lstlisting}
+
+The TLV container in the response is of the same type as in the request and it
+contains the actual values of all the corresponding parameters supported by the
+device. The values set by the device can differ from the requested values
+depending on the device's capabilities. \textbf{Note:} lengths of the
+VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES and
+VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT TLVs are always 8 in the device's
+response in order to save memory and make eventq descriptor size more
+predictable, i.e. they include only the \field{resource_id} fields. Missing
+TLV for a resource means that it is not attached.
+
+TLV containers in the request can be empty. In this case the command doesn't
+set any parameters, still all the parameters are received in the response.
+The driver can use an alias command type VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS to
+distinguish this case.
+
+The backing memory for resources can only be attached when there is no chance
+for it to be simultaneously used by the device: when the resource is not
+attached or haven't been queued after opening the stream, after a RESET
+operation on the corresponding queue, after a DRAIN operation.
+% TODO: to be clarified
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}
+
+The device MUST initialize each parameter to a valid default value.
+
+The device MUST allow each parameter to be read even without the driver
+explicitly setting a value for them beforehand.
+
+The device MAY adjust any received parameter to a closest supported
+value if the received one is not supported with the current settings.
+
+The parameters received and returned by the device MUST fit together into a
+pair of linked sets returned in
+\field{struct virtio_video_device_query_caps_resp}.
+
+The parameters MUST be applied in the order of appearance in the TLV
+container.
+The device MUST return an error code as soon as it encounters an invalid not
+correctable input and stop processing the TLVs afterwards.
+All the received parameters MUST be validated before the command response is
+sent.
+
+The device MUST process parameters changes, that are embedded in the input
+stream, in the same way as if there is a VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS
+command queued into inputqX changing the outputqX parameters. A standalone DPC
+event MUST be sent in place of the command's delayed response in this case.
+
+The device MUST return all the available inputqX or outputqX parameters in the
+delayed response.
+
+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}
+
+\field{stream_id} MUST be set to a valid stream ID of an open stream.
+
+VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS MUST be sent to mainq or inputqX or
+outputqX where X equals \field{stream_id}.
+
+The driver MUST put exactly one TLV container to the request with type
+selected according to the queue type.
+
+The driver MUST check the actual values of the parameters as set by the
+device and work with these values, or try to set different ones if it
+cannot, or fail properly.
+
+After creating a new stream, the initial value of all parameters is
+undefined to the driver. Thus, the driver MUST NOT assume the default
+value of any parameter and MAY use VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS
+in order to get the values of the parameters it needs.
+
+If some of the resources were detached as a result of this command the driver
+SHOULD reattach the backing memories of these resources and queue them again
+to resume the device operation.
+
+The same type of backing memories (either guest pages, or virtio objects)
+MUST be used for all resources within a queue.
+
+\paragraph{VIRTIO_VIDEO_CMD_STREAM_DRAIN}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DRAIN}
+
+Complete processing of all input resources queued before this command
+and make the resulting output resources available to the driver.
+
+The driver sends this command with
+\field{struct virtio_video_stream_drain}:
+
+\begin{lstlisting}
+struct virtio_video_stream_drain {
+        le32 cmd_type; /* VIRTIO_VIDEO_CMD_STREAM_DRAIN */
+};
+\end{lstlisting}
+
+The device responds as described in
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueues}
+and begins the background DRAIN operation.
+
+When the background DRAIN operation is completed the device sends the
+VIRTIO_VIDEO_DELAYED_RESP_STREAM_DRAIN delayed response, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}.
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_DRAIN}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DRAIN}
+
+Before the device sends the response, it MUST process and respond to all
+the VIRTIO_VIDEO_CMD_RESOURCE_QUEUE commands on the inputqX that
+were sent before the drain command, and make all the corresponding
+output resources available to the driver with delayed responses to their
+VIRTIO_VIDEO_CMD_RESOURCE_QUEUE commands.
+
+The device MUST be able to accept input work while a DRAIN operation
+is ongoing, but any resulting delayed responses MUST NOT be sent before
+the delayed response to the command, that started the DRAIN operation.
+
+If the command is interrupted with a RESET operation on inputqX or a CLOSE
+operation, the device MUST send the delayed response with
+VIRTIO_VIDEO_EVENT_FLAG_CANCELED flag set.
+
+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_STREAM_DRAIN}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DRAIN}
+
+VIRTIO_VIDEO_CMD_STREAM_DRAIN MUST be sent to inputqX where X is a valid
+stream ID of an open stream.
+
+The driver MUST keep queueing output resources until it gets the
+response to this command or cancels it using
+VIRTIO_VIDEO_CMD_QUEUE_RESET or
+VIRTIO_VIDEO_CMD_STREAM_CLOSE. Failure to do so may result in the
+device stalling as it waits for output resources to write into.
+
+The driver MUST send a VIRTIO_VIDEO_CMD_STREAM_DRAIN command when it does not
+have any further input to ensure it receives all the output.
+
+\paragraph{VIRTIO_VIDEO_CMD_QUEUE_RESET}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_QUEUE_RESET}
+
+Immediately cancel all queued resources in inputqX or outputqX without
+processing them and discard any processing results, that are not yet dequeued.
+This command is useful for decoders that need to quickly jump to another point
+in the stream (i.e. for seeking), or in order to clear the queue as quickly as
+possible.
+
+The driver sends this command with
+\field{struct virtio_video_queue_reset}:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_QUEUE_TYPE_INPUT    0
+#define VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT   1
+
+struct virtio_video_queue_reset {
+        le32 cmd_type; /* VIRTIO_VIDEO_CMD_QUEUE_RESET */
+        le32 stream_id;
+        le32 queue_type; /* VIRTIO_VIDEO_QUEUE_TYPE_* */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{stream_id}]
+  is the ID of the stream to reset.
+\item[\field{queue_type}]
+  is the direction of the queue to reset.
+\end{description}
+
+The device responds as described in
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueues}
+and begins the background RESET operation.
+
+When the background RESET operation is completed the device sends the
+VIRTIO_VIDEO_DELAYED_RESP_QUEUE_RESET delayed response, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}.
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_QUEUE_RESET}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_QUEUE_RESET}
+
+The device MUST send delayed responses with VIRTIO_VIDEO_EVENT_FLAG_CANCELED
+flag set for all active or pending commands in the selected queue before
+sending the delayed response to this command.
+
+The device MUST interrupt operation as quickly as possible. Doing a RESET of
+inputqX MUST NOT depend on output resources being queued by the driver.
+
+% If the device must accept more input after the beginning of the RESET
+% like it was required in the previous versions of the specification, then
+% some more measures are necessary because these are different queues now.
+% For example, adding a "generation" field into the commands. At the moment
+% this doesn't look like a problem.
+
+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_QUEUE_RESET}{Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_QUEUE_RESET}
+
+\field{stream_id} MUST be set to a valid stream ID of an open stream.
+
+VIRTIO_VIDEO_CMD_QUEUE_RESET MUST be sent to mainq.
+
+\subsubsection{Device Operation: Resource Commands}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Resource Commands}
+
+This command queues an individual resource for the device to process.
+
+\paragraph{VIRTIO_VIDEO_CMD_RESOURCE_QUEUE}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Resource Commands / VIRTIO_VIDEO_CMD_RESOURCE_QUEUE}
+
+Provide an input or output resource to the device for processing.
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_MAX_PLANES                    8
+
+#define VIRTIO_VIDEO_ENQUEUE_FLAG_FORCE_KEY_FRAME  (1 << 0)
+
+struct virtio_video_resource_queue {
+        le32 cmd_type; /* VIRTIO_VIDEO_CMD_RESOURCE_QUEUE */
+        le32 resource_id;
+        le32 flags; /* Bitmask of VIRTIO_VIDEO_ENQUEUE_FLAG_* */
+        u8 padding[4];
+        le64 timestamp;
+        le32 offsets[VIRTIO_VIDEO_MAX_PLANES];
+        le32 data_sizes[VIRTIO_VIDEO_MAX_PLANES];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{resource_id}]
+  is the ID of the resource to be queued.
+\item[\field{flags}]
+  is a bitmask of VIRTIO_VIDEO_ENQUEUE_FLAG_* values.
+
+  \begin{description}
+  \item[\field{VIRTIO_VIDEO_ENQUEUE_FLAG_FORCE_KEY_FRAME}]
+    The submitted frame is to be encoded as a key frame. Only valid for the
+    encoder's inputqX.
+  \end{description}
+\item[\field{timestamp}]
+  is an abstract sequence counter that can be used on the inputqX for
+  synchronization. Resources produced on the output queue will carry the
+  \field{timestamp} of the first input resource they have been produced
+  from.
+\item[\field{offsets}]
+  is the starting offset for the data in the buffer for each plane.
+  The number of planes depends on the format. Set by the driver for input
+  resources.
+\item[\field{data_sizes}]
+  is number of data bytes used for each plane. Set by the driver for input
+  resources.
+\end{description}
+
+The device responds as described in
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueues}
+and uses the resource in the video processing. When the processing of the
+resource is completed the device sends the
+VIRTIO_VIDEO_DELAYED_RESP_RESOURCE_QUEUE delayed response, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}.
+
+The command-specific delayed response
+\field{struct virtio_video_resource_queue_delayed_resp} is defined
+as follows:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_DEQUEUE_FLAG_ERR           (1 << 0)
+/* Encoder only */
+#define VIRTIO_VIDEO_DEQUEUE_FLAG_KEY_FRAME     (1 << 1)
+#define VIRTIO_VIDEO_DEQUEUE_FLAG_P_FRAME       (1 << 2)
+#define VIRTIO_VIDEO_DEQUEUE_FLAG_B_FRAME       (1 << 3)
+
+struct virtio_video_resource_queue_delayed_resp {
+        le32 flags;
+        u8 padding[4];
+        le64 timestamp;
+        le32 offsets[VIRTIO_VIDEO_MAX_PLANES];
+        le32 data_sizes[VIRTIO_VIDEO_MAX_PLANES];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{flags}]
+  is a bitmask of VIRTIO_VIDEO_DEQUEUE_FLAG_* flags.
+
+  \begin{description}
+  \item[VIRTIO_VIDEO_DEQUEUE_FLAG_ERR]
+    is set on resources when a non-fatal processing error has happened and
+    the data contained by the resource is likely to be corrupted,
+  \item[VIRTIO_VIDEO_DEQUEUE_FLAG_KEY_FRAME]
+    is set on output resources when the resource contains an encoded key
+    frame (only for encoders).
+  \item[VIRTIO_VIDEO_DEQUEUE_FLAG_P_FRAME]
+    is set on output resources when the resource contains only differences
+    to a previous key frame (only for encoders).
+  \item[VIRTIO_VIDEO_DEQUEUE_FLAG_B_FRAME]
+    is set on output resources when the resource contains only the
+    differences between the current frame and both the preceding and
+    following key frames (only for encoders).
+  \end{description}
+\item[\field{timestamp}]
+  is set on output resources to the \field{timestamp} value of the first input
+  resource that produced the resource.
+\item[\field{offsets}]
+  is set on output resources to the starting offset for the data in the
+  buffer for each plane.
+\item[\field{data_sizes}]
+  is set on output resources to the amount of data written by the device,
+  for each plane.
+\end{description}
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_CMD_RESOURCE_QUEUE}{Device Types / Video Device / Device Operation / Device Operation: Resource Commands / VIRTIO_VIDEO_CMD_RESOURCE_QUEUE}
+
+The device MUST return VIRTIO_VIDEO_RESULT_ERR_INVALID_OPERATION if
+the resource has not been attached prior to queueing it or for an
+attempt to queue a resources that is still processed in background.
+
+The device MUST mark resources that might contain corrupted content due to
+an error with the VIRTIO_VIDEO_BUFFER_FLAG_ERR flag.
+
+For output resources, the device MUST copy the \field{timestamp}
+parameter of the first input resource that produced it into the delayed
+response.
+When many output resources are produced from a single input resource, the
+device MUST copy the timestamp of the input resource to all of the output
+resources.
+
+In case of encoder, the device MUST mark each output resource with one of
+VIRTIO_VIDEO_DEQUEUE_FLAG_KEY_FRAME, VIRTIO_VIDEO_DEQUEUE_FLAG_P_FRAME, or
+VIRTIO_VIDEO_DEQUEUE_FLAG_B_FRAME.
+
+If the processing of a resource was stopped due to a stream event, a
+VIRTIO_VIDEO_CMD_QUEUE_RESET, or a VIRTIO_VIDEO_CMD_STREAM_CLOSE,
+the device MUST send the corresponding delayed responses with
+VIRTIO_VIDEO_EVENT_FLAG_CANCELED flag set.
+
+When starting or resuming processing after a RESET or a DRAIN operation, the
+device MAY skip input data until it finds a point that allows it to resume
+operation properly (e.g. until a keyframe is found in the input stream of a
+decoder).
+
+The device MUST properly handle the case when a dequeued but still referenced
+resource is queued again.
+
+\drivernormative{\subparagraph}{VIRTIO_VIDEO_CMD_RESOURCE_QUEUE}{Device Types / Video Device / Device Operation / Device Operation: Resource Commands / VIRTIO_VIDEO_CMD_RESOURCE_QUEUE}
+
+VIRTIO_VIDEO_CMD_RESOURCE_QUEUE MUST be sent to inputqX or outputqX where X
+is a valid stream ID of an open stream.
+
+\field{resource_id} MUST be an ID of a resource, that is both allocated and
+attached for the queue.
+
+The driver MUST be able to handle the output resources in decoding order in
+encoder case, i.e. with timestamps out of order.
+
+\subsubsection{Device Operation: Standalone Events}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}
+
+These events are caused by state changes in the device, not as a delayed
+response to any command.
+
+\paragraph{Error Event}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events / Error Event}
+
+The error event is sent by the device when an unrecoverable error occurs
+during processing a stream. The device operation is exactly the same as when
+it receives a VIRTIO_VIDEO_CMD_STREAM_CLOSE command, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_CLOSE}.
+Note that this is different from dequeued resources carrying the
+VIRTIO_VIDEO_DEQUEUE_FLAG_ERR flag. This flag indicates that the
+particular output frame might be corrupted, but the stream still exists
+and can recover.
+
+\paragraph{Dynamic Parameters Change Event}
+\label{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events / Dynamic Parameters Change Event}
+
+A Dynamic Parameters Change (or DPC) event is sent by a decoder device when it
+detects that the parameters of the stream being decoded have changed.
+The device operation is exactly the same as if it receives a
+VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS command in the inputqX at the exact same
+point in the stream, that changes outputqX parameters, see
+\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}.
+
+% TODO add QoS events and overall think about quotas. Codecs are normally
+% limited by bandwidth/macroblocks per second. How can we accommodate this?
+
+\subsection{Device capabilities and parameters}
+\label{sec:Device Types / Video Device / Device capabilities and parameters}
+
+\subsubsection{VIRTIO_VIDEO_TLV_CODED_SET}
+\label{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_CODED_SET}
+
+These parameters are defined for the coded parameter sets.
+
+\paragraph{VIRTIO_VIDEO_TLV_CODED_FORMAT}
+\label{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_CODED_SET / VIRTIO_VIDEO_TLV_CODED_FORMAT}
+
+The following coded formats are defined:
+
+\begin{lstlisting}
+#define VIRTIO_VIDEO_CODED_FORMAT_MPEG2  1  /* MPEG-2 Part 2  (V4L2_PIX_FMT_MPEG2) */
+#define VIRTIO_VIDEO_CODED_FORMAT_MPEG4  2  /* MPEG-4 Part 2  (V4L2_PIX_FMT_MPEG4) */
+#define VIRTIO_VIDEO_CODED_FORMAT_H264   3  /* H.264          (V4L2_PIX_FMT_H264)  */
+#define VIRTIO_VIDEO_CODED_FORMAT_HEVC   4  /* HEVC aka H.265 (V4L2_PIX_FMT_HEVC)  */
+#define VIRTIO_VIDEO_CODED_FORMAT_VP8    5  /* VP8            (V4L2_PIX_FMT_VP8)   */
+#define VIRTIO_VIDEO_CODED_FORMAT_VP9    6  /* VP9            (V4L2_PIX_FMT_VP9)   */
+#define VIRTIO_VIDEO_CODED_FORMAT_FWHT   7  /* FWHT           (V4L2_PIX_FMT_FWHT)  */
+\end{lstlisting}
+
+The coded formats and the expected data units per buffer are documented in
+\hyperref[intro:V4L2]{V4L2 header} and
+\hyperref[intro:V4L2 compressed]{V4L2 compressed formats documentation}.
+
+\field{struct virtio_video_tlv_coded_format} represents both the coded format
+in a coded set of capabilities and the specific parameter values:
+
+\begin{lstlisting}
+struct virtio_video_tlv_coded_format {
+        le32 format; /* VIRTIO_VIDEO_CODED_FORMAT_* */
+};
+\end{lstlisting}
+
+\paragraph{VIRTIO_VIDEO_TLV_CODED_RESOURCES}
+\label{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_CODED_SET / VIRTIO_VIDEO_TLV_CODED_RESOURCES}
+
+Setup common coded resources parameters.
+
+\field{struct virtio_video_tlv_coded_resources_caps} represents capabilities:
+
+\begin{lstlisting}
+struct virtio_video_tlv_coded_resources_caps {
+        struct virtio_video_range num_resources_range;
+        struct virtio_video_range resource_size_range;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{num_resources_range}]
+  is the supported range of resources number of a particular coded set.
+\item[\field{resource_size_range}]
+  is the supported range of resource sizes.
+\end{description}
+
+\field{struct virtio_video_tlv_resources_val} represents the parameter values:
+
+\begin{lstlisting}
+struct virtio_video_tlv_resources_val {
+        le32 num_resources;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{num_resources}]
+  is the number of resources that can be addressed for the queue, numbered
+  from \(0\) to \(num\_resources - 1\). Setting this parameter to zero is
+  allowed even when \field{num_resources_range.min} is positive, this results
+  in detaching all the resources.
+\end{description}
+
+\paragraph{VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES}
+\label{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_CODED_SET / VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES}
+
+This TLV is defined in the same way as for the VIRTIO_VIDEO_TLV_RAW_SET, see
+\ref{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_RAW_SET / VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES}.
+Note, that a coded resource can only have a single buffer, so only the first
+element of \field{num_entries} is not zero.
+
+\paragraph{VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT}
+\label{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_CODED_SET / VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT}
+
+This TLV is defined in the same way as for the VIRTIO_VIDEO_TLV_RAW_SET, see
+\ref{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_RAW_SET / VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT}.
+Note, that a coded resource can only have a single buffer, so
+\field{num_objects} is always 1.
+
+\paragraph{VIRTIO_VIDEO_TLV_V4L2_CONTROLS}
+\label{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_CODED_SET / VIRTIO_VIDEO_TLV_V4L2_CONTROLS}
+
+Inside this TLV container only selected V4L2 control IDs are allowed to be
+used as TLV types. The subset is listed in subsections below. Values of the
+V4L2 controls can be converted to TLVs by taking their representation as
+\hyperref[intro:V4L2 ext ctrls]{struct v4l2_ext_control} and replacing the
+pointers with values. Capabilities of the V4L2 controls can't be converted to
+TLVs as easily, so they are described below. This is mostly useful for
+encoders. Most relevant V4L2 controls are codec-specific. All definitions
+related to V4L2 controls can be found in
+\hyperref[intro:V4L2 controls]{V4L2 controls header}, their descriptions
+can be found in \hyperref[intro:V4L2 codec controls]{V4L2 documentation}.
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_TLV_V4L2_CONTROLS}{Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_CODED_SET / VIRTIO_VIDEO_TLV_V4L2_CONTROLS}
+
+The device MUST NOT advertise codec-specific parameters not corresponding to
+the coded format of the particular coded set.
+
+\subparagraph{V4L2 controls: 32 bit integers}
+\label{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_CODED_SET / VIRTIO_VIDEO_TLV_V4L2_CONTROLS / V4L2 controls: Enumerations}
+
+Integer V4L2 controls are signed by default, but this specification doesn't
+define any signed integer types, see \ref{sec:Structure Specifications}, so
+not every integer V4L2 control could be used directly. Still for many of them
+negative values don't make sense, so these controls are allowed in the range
+from 0 to INT32_MAX:
+
+\begin{itemize}
+\item V4L2_CID_MPEG_VIDEO_BITRATE: bitrate in bits per second
+\end{itemize}
+
+For capabilities the TLV value is defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_tlv_v4l2_int_caps {
+        struct virtio_video_range range;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{range}]
+  is a range of possible values of the control.
+\end{description}
+
+For the control values the TLV value is defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_tlv_v4l2_int_val {
+        le32 value;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{value}]
+  is one of the supported control values.
+\end{description}
+
+\drivernormative{\subparagraph}{V4L2 controls: 32 bit integers}{Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_CODED_SET / VIRTIO_VIDEO_TLV_V4L2_CONTROLS / V4L2 controls: 32 bit integers}
+
+The integer V4L2 control values MUST be in the range from 0 to INT32_MAX.
+
+\subparagraph{V4L2 controls: Enumerations}
+\label{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_CODED_SET / VIRTIO_VIDEO_TLV_V4L2_CONTROLS / V4L2 controls: Enumerations}
+
+The following V4L2 controls with values defined as enums are allowed:
+\begin{itemize}
+\item V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE
+% enum v4l2_mpeg_video_mpeg2_profile: V4L2_MPEG_VIDEO_MPEG2_PROFILE_*
+\item V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL
+% enum v4l2_mpeg_video_mpeg2_level: V4L2_MPEG_VIDEO_MPEG2_LEVEL_*
+\item V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE
+% enum v4l2_mpeg_video_mpeg4_profile: V4L2_MPEG_VIDEO_MPEG4_PROFILE_*
+\item V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL
+% enum v4l2_mpeg_video_mpeg4_level: V4L2_MPEG_VIDEO_MPEG4_LEVEL_*
+\item V4L2_CID_MPEG_VIDEO_H264_PROFILE
+% enum v4l2_mpeg_video_h264_profile: V4L2_MPEG_VIDEO_H264_PROFILE_*
+\item V4L2_CID_MPEG_VIDEO_H264_LEVEL
+% enum v4l2_mpeg_video_h264_level: V4L2_MPEG_VIDEO_H264_LEVEL_*
+\item V4L2_CID_MPEG_VIDEO_HEVC_PROFILE
+% enum v4l2_mpeg_video_hevc_profile: V4L2_MPEG_VIDEO_HEVC_PROFILE_*
+\item V4L2_CID_MPEG_VIDEO_HEVC_LEVEL
+% enum v4l2_mpeg_video_hevc_level: V4L2_MPEG_VIDEO_HEVC_LEVEL_*
+\item V4L2_CID_MPEG_VIDEO_VP8_PROFILE
+% enum v4l2_mpeg_video_vp8_profile: V4L2_MPEG_VIDEO_VP8_PROFILE_*
+\item V4L2_CID_MPEG_VIDEO_VP9_PROFILE
+% enum v4l2_mpeg_video_vp9_profile: V4L2_MPEG_VIDEO_VP9_PROFILE_*
+\item V4L2_CID_MPEG_VIDEO_VP9_LEVEL
+% enum v4l2_mpeg_video_vp9_level: V4L2_MPEG_VIDEO_VP9_LEVEL_*
+\end{itemize}
+
+For capabilities the TLV value is defined as follows:
+
+\begin{lstlisting}
+#define MASK(x) (1 << (x))
+
+struct virtio_video_tlv_v4l2_enum_caps {
+        le32 bitmask; /* Bitmask of MASK(<enum value>) */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{bitmask}]
+  is a bitmask of supported enum values used as bit numbers, see
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\end{description}
+
+For the control values the TLV value is defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_tlv_v4l2_enum_val {
+        u8 value; /* <enum value> */
+        u8 padding[3];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{value}]
+  is one of the supported enum values, see
+  \hyperref[intro:V4L2 controls]{V4L2 controls header}.
+\end{description}
+
+\subsubsection{VIRTIO_VIDEO_TLV_RAW_SET}
+\label{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_RAW_SET}
+
+These parameters are defined for the raw parameter sets.
+
+\paragraph{VIRTIO_VIDEO_TLV_RAW_FORMAT}
+\label{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_RAW_SET / VIRTIO_VIDEO_TLV_RAW_FORMAT}
+
+DRM fourcc format definitions and DRM format modifiers are used to represent
+raw formats capabilities and values. The layouts of raw formats are documented
+in \hyperref[intro:DRM formats]{DRM} and \hyperref[intro:V4L2]{V4L2} headers,
+as well as in \hyperref[intro:V4L2 RGB]{V4L2 RGB} and
+\hyperref[intro:V4L2 YUV]{planar YUV} formats documentation.
+
+% Some DRM and V4L2 formats can be matched with this table:
+% DRM_FORMAT_ARGB8888 = V4L2_PIX_FMT_ABGR32
+% DRM_FORMAT_BGRA8888 = V4L2_PIX_FMT_ARGB32
+% DRM_FORMAT_RGBA8888 = V4L2_PIX_FMT_BGRA32
+% DRM_FORMAT_NV12     = V4L2_PIX_FMT_NV12
+% DRM_FORMAT_YUV420   = V4L2_PIX_FMT_YUV420
+% DRM_FORMAT_YVU420   = V4L2_PIX_FMT_YVU420
+% DRM_FORMAT_YUYV     = V4L2_PIX_FMT_YUYV
+
+\field{struct virtio_video_tlv_raw_format_caps} is used to describe the
+capabilities:
+
+\begin{lstlisting}
+enum virtio_video_planes_layout {
+        VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER = 1,
+        VIRTIO_VIDEO_PLANES_LAYOUT_MULTI_BUFFERS = 2,
+};
+
+struct virtio_video_tlv_raw_format_caps {
+        le32 planes_layout_mask; /* Bitmask of VIRTIO_VIDEO_PLANES_LAYOUT_* */
+        le32 fourcc; /* DRM_FORMAT_* */
+        le64 modifier; /* DRM_FORMAT_MOD_* */
+        struct virtio_video_range width_range;
+        struct virtio_video_range height_range;
+        le32 stride_align_mask;
+        le32 height_align_mask;
+        le32 plane_align_mask;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{planes_layout_mask}]
+  is a bitmask of supported planes layout types according to
+  \field{enum virtio_video_planes_layout}.
+\item[\field{fourcc}]
+  specifies the raw format, to which these capabilities apply.
+\item[\field{modifier}]
+  specifies the raw format modifier.
+\item[\field{width_range}]
+  is a range of widths in pixels.
+\item[\field{height_range}]
+  is a range of heights in pixels.
+\item[\field{stride_align_mask}]
+  is a bitmask of all supported power of two alignments of the distance in
+  bytes between two lines of data (stride).
+\item[\field{height_align_mask}]
+  is a bitmask of all supported power of two height alignments in pixels.
+\item[\field{plane_align_mask}]
+  is a bitmask of all supported power of two alignments in bytes of planes
+  within a buffer. This field is valid only if \field{planes_layout_mask} has
+  the \field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER} bit set.
+\end{description}
+
+\field{struct virtio_video_tlv_raw_format_val} is used to describe the
+values:
+
+\begin{lstlisting}
+struct virtio_video_tlv_raw_format_val {
+        le32 planes_layout; /* VIRTIO_VIDEO_PLANES_LAYOUT_* */
+        le32 fourcc; /* DRM_FORMAT_* */
+        le64 modifier; /* DRM_FORMAT_MOD_* */
+        le32 width;
+        le32 height;
+        le32 stride_align;
+        le32 height_align;
+        le32 plane_align;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{planes_layout}]
+  is the actual layout of the planes.
+\item[\field{fourcc}]
+  specifies the raw format.
+\item[\field{modifier}]
+  specifies the raw format modifier.
+\item[\field{width}]
+  is the width in pixels of the stream frames.
+\item[\field{height}]
+  is the height in pixels of the stream frames.
+\item[\field{stride_align}]
+  is the power of two stride alignment in bytes.
+\item[\field{height_align}]
+  is the power of two height alignment in pixels.
+\item[\field{plane_align}]
+  is the power of two alignment in bytes of planes within a buffer. This field
+  is valid only if \field{planes_layout} has the
+  \field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER} bit set.
+\end{description}
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_TLV_RAW_FORMAT}{Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_RAW_SET / VIRTIO_VIDEO_TLV_RAW_FORMAT}
+
+The device MUST set \field{VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER} bit in
+\field{planes_layout_mask} if the plane layout with planes of a frame laid out
+one after another in the same buffer is supported.
+
+The device MUST set \field{VIRTIO_VIDEO_PLANES_LAYOUT_MULTI_BUFFERS} bit in
+\field{planes_layout_mask} if the plane layout with planes of a frame laid out
+in separate buffers is supported.
+
+% TODO: not sure if !VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG should be compatible
+% with VIRTIO_VIDEO_PLANES_LAYOUT_MULTI_BUFFERS or not.
+
+\paragraph{VIRTIO_VIDEO_TLV_RAW_RESOURCES}
+\label{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_RAW_SET / VIRTIO_VIDEO_TLV_RAW_RESOURCES}
+
+\field{struct virtio_video_tlv_raw_resources_caps} represents capabilities:
+
+\begin{lstlisting}
+struct virtio_video_tlv_raw_resources_caps {
+        struct virtio_video_range num_resources_range;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{num_resources_range}]
+  is the supported range of resources number of a particular raw set.
+\end{description}
+
+\field{struct virtio_video_tlv_resources_val} represents the parameter values,
+see
+\ref{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_CODED_SET / VIRTIO_VIDEO_TLV_CODED_RESOURCES}.
+
+\paragraph{VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES}
+\label{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_RAW_SET / VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES}
+
+Setup guest pages as backing memory of a resource.
+
+The parameter capabilities are empty. The empty TLV with zero length indicates
+the support for attaching guest pages to resources.
+
+\field{struct virtio_video_tlv_resource_guest_pages} represents the parameter
+values:
+
+\begin{lstlisting}
+struct virtio_video_resource_sg_entry {
+        le64 addr;
+        le32 length;
+        u8 padding[4];
+};
+
+struct virtio_video_tlv_resource_guest_pages {
+        le32 resource_id;
+        u8 padding[4];
+        le32 num_entries[VIRTIO_VIDEO_MAX_PLANES];
+        struct virtio_video_resource_sg_entry entries[];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{resource_id}]
+  is the ID of the resource.
+\item[\field{num_entries}]
+  is the number of scatter-gather list entries in each of the separate buffers
+  forming together the resource according to currently set format. Unused
+  array elements are set to 0. Sum of the array is the length of the
+  \field{entries} array.
+\item[\field{entries}]
+  is an array of the scatter-gather list entries:
+
+  \begin{description}
+  \item[\field{addr}]
+    is a guest physical address of the start of the SG entry aligned to
+    the physical guest pages size.
+  \item[\field{length}]
+    is the length of the SG entry in bytes aligned to the physical guest
+    pages size.
+  \end{description}
+\end{description}
+
+\drivernormative{\subparagraph}{VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES}{Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_RAW_SET / VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES}
+
+\field{resource_id} MUST be an integer within the range of resource IDs
+currently allocated for the queue.
+
+The memory regions identified by the elements of the \field{entries} array
+MUST NOT overlap.
+
+\paragraph{VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT}
+\label{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_RAW_SET / VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT}
+
+Setup virtio objects as backing memory to a resource.
+
+The parameter capabilities are empty. The empty TLV with zero length indicates
+the support for attaching virtio objects to resources.
+
+\field{struct virtio_video_tlv_resource_virtio_object} represents the parameter
+values:
+
+\begin{lstlisting}
+struct virtio_video_resource_object {
+        u8 uuid[16];
+};
+
+struct virtio_video_tlv_resource_virtio_object {
+        le32 resource_id;
+        le32 num_objects; /* Up to VIRTIO_VIDEO_MAX_PLANES */
+        struct virtio_video_resource_object objects[num_objects];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{resource_id}]
+  is the ID of the resource.
+\item[\field{num_objects}]
+  is the length of the \field{objects} array according to currently set
+  format.
+\item[\field{object}]
+  is an array of objects exported from another virtio device, see
+  \ref{sec:Basic Facilities of a Virtio Device / Exporting Objects}.
+
+  \begin{description}
+  \item[uuid]
+    is a version 4 UUID specified by \hyperref[intro:rfc4122]{[RFC4122]}.
+  \end{description}
+\end{description}
+
+\drivernormative{\subparagraph}{VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT}{Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_RAW_SET / VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT}
+
+\field{resource_id} MUST be an integer within the range of resource IDs
+currently allocated for the queue.
+
+\paragraph{VIRTIO_VIDEO_TLV_CROP}
+\label{sec:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_RAW_SET / VIRTIO_VIDEO_TLV_CROP}
+
+% TODO There is no reason in doing crop if it doesn't affect the output.
+% So the output frames have to be smaller, than the full size. In the decoder
+% case this means, that the buffers can't be used as a reference. So when crop
+% is enabled, the decoder probably has to have some intermediate buffers.
+% Is it reasonable to reallocate output buffers then? It could be. So it has
+% to be decided (probably in the same way it is usually done in V4L2). In the
+% encoder case this is not a problem.
+% Is setting compose rectangles useful at all?
+
+This parameter sets a rectangle covering the visible area of the frame.
+
+The parameter capabilities are empty. The empty TLV with zero length indicates
+the support for cropping.
+
+The parameter value is defined as follows:
+
+\begin{lstlisting}
+struct virtio_video_tlv_crop_val {
+        le32 left;
+        le32 top;
+        le32 width;
+        le32 height;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{left, top}]
+  are coordinates of top left corner of the crop rectangle in pixels.
+\item[\field{width, height}]
+  are dimensions of the crop rectangle in pixels.
+\end{description}
+
+\devicenormative{\subparagraph}{VIRTIO_VIDEO_TLV_CROP}{Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_RAW_SET / VIRTIO_VIDEO_TLV_CROP}
+
+The crop rectangle MUST be reset to full frame size on every resolution
+change.
diff --git a/device-types/video/device-conformance.tex b/device-types/video/device-conformance.tex
new file mode 100644
index 0000000..d13486f
--- /dev/null
+++ b/device-types/video/device-conformance.tex
@@ -0,0 +1,22 @@
+\conformance{\subsection}{Video Device Conformance}
+\label{sec:Conformance / Device Conformance / Video Device Conformance}
+
+A video device MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Device Types / Video Device / Feature bits}
+\item \ref{devicenormative:Device Types / Video Device / Device configuration layout}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueues}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: TLV format}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_OPEN}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_CLOSE}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DRAIN}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_QUEUE_RESET}
+\item \ref{devicenormative:Device Types / Video Device / Device Operation / Device Operation: Resource Commands / VIRTIO_VIDEO_CMD_RESOURCE_QUEUE}
+\item \ref{devicenormative:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_CODED_SET / VIRTIO_VIDEO_TLV_V4L2_CONTROLS}
+\item \ref{devicenormative:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_RAW_SET / VIRTIO_VIDEO_TLV_RAW_FORMAT}
+\item \ref{devicenormative:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_RAW_SET / VIRTIO_VIDEO_TLV_CROP}
+\end{itemize}
diff --git a/device-types/video/driver-conformance.tex b/device-types/video/driver-conformance.tex
new file mode 100644
index 0000000..4576e41
--- /dev/null
+++ b/device-types/video/driver-conformance.tex
@@ -0,0 +1,20 @@
+\conformance{\subsection}{Video Driver Conformance}
+\label{sec:Conformance / Driver Conformance / Video Driver Conformance}
+
+A video driver MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{drivernormative:Device Types / Video Device / Feature bits}
+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueues}
+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}
+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_OPEN}
+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_CLOSE}
+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS}
+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_STREAM_DRAIN}
+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Stream commands / VIRTIO_VIDEO_CMD_QUEUE_RESET}
+\item \ref{drivernormative:Device Types / Video Device / Device Operation / Device Operation: Resource Commands / VIRTIO_VIDEO_CMD_RESOURCE_QUEUE}
+\item \ref{drivernormative:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_CODED_SET / VIRTIO_VIDEO_TLV_V4L2_CONTROLS / V4L2 controls: 32 bit integers}
+\item \ref{drivernormative:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_RAW_SET / VIRTIO_VIDEO_TLV_RESOURCE_GUEST_PAGES}
+\item \ref{drivernormative:Device Types / Video Device / Device capabilities and parameters / VIRTIO_VIDEO_TLV_RAW_SET / VIRTIO_VIDEO_TLV_RESOURCE_VIRTIO_OBJECT}
+\end{itemize}
diff --git a/introduction.tex b/introduction.tex
index cfa6633..41a7476 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -101,6 +101,15 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:SEC1}\textbf{[SEC1]} &
     Standards for Efficient Cryptography Group(SECG), ``SEC1: Elliptic Cureve Cryptography'', Version 1.0, September 2000.
 	\newline\url{https://www.secg.org/sec1-v2.pdf}\\
+	\phantomsection\label{intro:V4L2}\textbf{[V4L2]} &
+	Linux V4L2 interface.
+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/videodev2.h}\\
+	\phantomsection\label{intro:V4L2 controls}\textbf{[V4L2 Controls]} &
+	Linux V4L2 controls definitions.
+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/v4l2-controls.h}\\
+	\phantomsection\label{intro:DRM formats}\textbf{[DRM Formats]} &
+	Linux DRM format definitions.
+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/drm/drm_fourcc.h}\\
 
 	\phantomsection\label{intro:rfc2784}\textbf{[RFC2784]} &
     Generic Routing Encapsulation. This protocol is only specified for IPv4 and used as either the payload or delivery protocol.
@@ -153,6 +162,18 @@ \section{Non-Normative References}
 	\phantomsection\label{intro:Virtio PCI Draft}\textbf{[Virtio PCI Draft]} &
 	Virtio PCI Draft Specification
 	\newline\url{http://ozlabs.org/~rusty/virtio-spec/virtio-0.9.5.pdf}\\
+	\phantomsection\label{intro:V4L2 compressed}\textbf{[V4L2 compressed formats]} &
+	Detailed descriptions of V4L2 compressed formats
+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst}\\
+	\phantomsection\label{intro:V4L2 RGB}\textbf{[V4L2 RGB formats]} &
+	Detailed descriptions of V4L2 RGB formats
+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst}\\
+	\phantomsection\label{intro:V4L2 YUV}\textbf{[V4L2 planar YUV formats]} &
+	Detailed descriptions of V4L2 planar YUV formats
+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst}\\
+	\phantomsection\label{intro:V4L2 codec controls}\textbf{[V4L2 codec controls]} &
+	Detailed descriptions of V4L2 controls
+	\newline\url{https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst}\\
 \end{longtable}
 
 \section{Terminology}\label{Terminology}
-- 
2.40.1


