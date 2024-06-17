Return-Path: <linux-media+bounces-13417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AABB890ABA8
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 12:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27A6E1F269AE
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 10:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A77194C75;
	Mon, 17 Jun 2024 10:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="VCw1MaKb"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11020003.outbound.protection.outlook.com [52.101.154.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290AE194ACD;
	Mon, 17 Jun 2024 10:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718620932; cv=fail; b=uLPMw+PDpHEBoNCE2ewK/crr8xo5J+rLRHf56iOhkRO6+LTOyfZ0CPj8IeeGNd6OLcCo5QWWyadzYeONFsIbpRxN609X+SJLzshyAN/maDIbcHZKtgZVcn/99pJ3cC1NEmvHEU3BodfpgejTQqiD31t+NCNj9XA+PWlonzif9T8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718620932; c=relaxed/simple;
	bh=Jh7NMn5Ffi08bvNN1CoE3ShnyByaBguMtO82WgWG96c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sRHddX6JgejWnQSzGQoqOHFGsR6Ba/c1h8C6dQhDfxKPzMMI0vw2tVxQc6tRtLfnyP8AJXRUdbCVj/q3axe8F6phrinzJE9odMEPIqpIzzhel/tSV9pyDcQdTozzu5w/ArnJ7eWC/po6OZIA/Q2/ZgocyIavBhrKfiLmlLj6NcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=VCw1MaKb; arc=fail smtp.client-ip=52.101.154.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Av4moj8oUHR9FcEFkKYni2E6y1nN+rojHHz+8dmtGishUxZUEghnNjcwqkFMYyNG1RrOz4tQ2+IBshWRa4/5vFLAy7xFJ5i7RQDiEZnfZULFKWgfc7KWUIxhWzXxCo3GLG3ZCqIDNIyWJIKAzLOeRsK0wNob07AtdWdQmB/DJC7ulwSctyBbteAtTwCvffOR431JCFDrMWPtQa5F7w2zcD39TYoryJhhQAfgVi3RJSDvfTTilKa5DdBR2ywacRq7//Yrv0IK3C4gZHuc3tN87iX+cutLXw6ddq5EHDL5rdH9nk62J6MYIOgGqBlf/bQNLwG6ltomD6EjL+Nth8KOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbHaY/RN3sriw+PWqSPfBhyDm6vcvpDz6rCL7/jkTlk=;
 b=IAKIM+H7KVuC09/4ebJvqLRDJkCBGX9ccHbgfrRnqR7IOBAVNfY7NJDlSK4JlN19cxr4kLam9+KXBro0VWFIkuEmcdi4owM0+nyuLn0lZh3hS3STG3wLUwR04V20MY6k7+PcksyQg0IMVtg4tOE8ZEMaOWQP6RkynaV/fN0JV+vtACnayZZwUgVQpa735noUlKGbci/qhT2b9v2i63f2gn39Sou3P7TARyKDD3troIjPy89rej9VRF4fV8rhhC4/H2Un9aGEpaLNJ6m8/X6WBSs/sg/XS5zwcbvF4yCZIn/E8iIrRJ/uluZkRH68TJZgcRstiKukTqiXGK36jefU3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbHaY/RN3sriw+PWqSPfBhyDm6vcvpDz6rCL7/jkTlk=;
 b=VCw1MaKbgjCKkQErF3EVQDpYDjy7Xzs7fND2DIpydQgJ3RKGmc9+qaOAkn+7Dcjbr5rLi0FrE2esYJOhuln6Hmf8pWkdzb+9xj+r3rIq5xbYWJlfwKwX8ZCwJoWxA7cPsLGjeU/et2NZW5FaqT3GBzETURxFjm5PZcvzS0GlaCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB3099.KORP216.PROD.OUTLOOK.COM (2603:1096:101:282::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 10:42:04 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 10:42:04 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v6 1/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
Date: Mon, 17 Jun 2024 19:41:52 +0900
Message-Id: <20240617104155.153-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617104155.153-1-jackson.lee@chipsnmedia.com>
References: <20240617104155.153-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0185.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::9) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SL2P216MB3099:EE_
X-MS-Office365-Filtering-Correlation-Id: da95ecfe-e864-4c9a-c3dc-08dc8eba2058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|52116011|376011|1800799021|366013|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vEDBDjYg/qpkk7Hvx2uRUC26eyh8BozgX6gH67e3rTQkTNzSJOhAroqZLG8z?=
 =?us-ascii?Q?BCTJD/qyOyMsydEPbTdFOVDxfSv62X4aGEN5OKKWnQ2LxTiZnLb8bgy7nDvB?=
 =?us-ascii?Q?SwLHaJcWW0hedcrLwG9VNYL7FCpP7v3kFMkh+6HNKwmap80hZ1MDEY4xiZiz?=
 =?us-ascii?Q?gQxoaDghZFL0VSVb8BItGOU3BpM++DBEhiT0uTi9CP9VX/rOyascSZMr6jYw?=
 =?us-ascii?Q?ZgibUrPCtflWUDJfZM42T5zXHisA8gx+ABXu+VSbcT5QAfkWDyS/MyhrKUm8?=
 =?us-ascii?Q?HHPAHpPtpBDpqc6QfXM6uC4VeQIdFmuldCyWfKEjFjZixqfiCtjukSZ7EfOl?=
 =?us-ascii?Q?5NaGWXjSFjq0fXPpEIVVjZ1z4FrRKff3bwpviOXciIiE85Rc7WxgQC8oY0s6?=
 =?us-ascii?Q?FNcgqLXJbXpMvzhmGHs8Vqbgn1G/hDOVty65FQ33ZjxGzCoCe3wlUVbCGvQ+?=
 =?us-ascii?Q?hcTJYVEDs4+x7d6tgAIE1cOFGAKSQ2JpuQTSHW+TjcQK1Rxsf/ds8d/mIVfj?=
 =?us-ascii?Q?braTHQePAFVlbJ0Cq+iHqohZcopKVm3wU2Tw22lnd9/nPDNJtEp8Ju1PSHn0?=
 =?us-ascii?Q?yrsg6HVg9zvTg3oGNxc9rN/Z88hFk3LoM0o9jK16epLdAfVVbThsbgDKJjiW?=
 =?us-ascii?Q?XM1cEMCJ1pG6O4d7mgiapA7QQ5DDIpAnO3zOxoVyhp7toN3pXzyd11JVGeyy?=
 =?us-ascii?Q?7i/8jOe09zJYrXMCRuWN1HPYIyiL67SgeqOfLHtIu9JpyY+bNiJHDH6ju8CL?=
 =?us-ascii?Q?6i2TnLi6QgbrgHrZcv8OyCdU3YBgdXPV1Mx68jaY8goZZqvqyBlNqSw99UO0?=
 =?us-ascii?Q?HWaK4a4pXlwY1IZgO4KjWfRodgZfGUAOyGKVg5O66hAur5/t2wEyC9eHbRem?=
 =?us-ascii?Q?jB42AMVYwDc/iikrD9wY8rKAUs2M9EApTPnMoLzWKb4vHD6NYAtwaIIOXhKw?=
 =?us-ascii?Q?IfF6c+oAf7EpUWbLBa1ZkgCIAViamVxYSIgBTz/C941MUPmZ2sksuwuHVNPO?=
 =?us-ascii?Q?MFOx3IXyjCs1AAihKF9+aPyXXUAf/Dj5M/NW5s1APZl7RfVURmcElSnCYgGY?=
 =?us-ascii?Q?EgeF90LZZVt9U496W2o5ce5uB14cmwNGGiXGnxENMK3S5zd1MNxoiylPdHS4?=
 =?us-ascii?Q?ZjepFrec3OeAeo4BvRdhIokAvzUFvFZzZKzyPhUNJRlM9d9bs18xxYcM6Mgz?=
 =?us-ascii?Q?P4a2UTiw9dgdM17Mv6s9tDgL5NYjzcWmwT8/K/kaEJEkMDPz7D+jXwiq1haw?=
 =?us-ascii?Q?nSlUd+ZwofifbwIXEt+k7wwP0+ZXi8ZvI5ukiUCR8gXVWc3jpM6MooBS4a2f?=
 =?us-ascii?Q?wN6e5lhDsjy7E84NwWhYMr9tYTT+ELx4bmGyspceyzRP2H3MAFpt1xqmeuQ4?=
 =?us-ascii?Q?pWfBUYI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(52116011)(376011)(1800799021)(366013)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7XqCAJ2hwDzXU+3f7hGqGJDjUyBWXPpXfZfGxCsPjw5UxMMhzuYUC+GaMDfj?=
 =?us-ascii?Q?m/d+Y9uEd3gZVHjWdt7jrXqd6qwgxF+D1b/aZfcA66eW9rcJpFrKhn9rgcpT?=
 =?us-ascii?Q?7weLTact3MhtFjnRYrtmiLNY4q5Zaf3N3KTL2F6K+NxeUGEuaLqXutTulp6O?=
 =?us-ascii?Q?XOSL0Ei08fZzITx8/nVh7l8nlljP4TbkPxjQNRDJJWduLHPyFHLmeM0jJD0W?=
 =?us-ascii?Q?EJrzJusbWbvLOjRKh7VQIwmJiirKrNCa6wDhoGlHyf/MlWzuS5B8Gc0vPvRC?=
 =?us-ascii?Q?5TIM3+OvzETSzUQnWiuqqJIHYB5b+ceJRpTbz708droqWB5cyeG8sfVhsN/f?=
 =?us-ascii?Q?gmEGLqCtbm96euf6YC2xFApm0y0CYzMZf3YDN8VnZ7b4LIO4zYhgr7H5BkDi?=
 =?us-ascii?Q?naQIBehZ6FmnjLvtWq1fCXiHm+YnPjzDy/z9a1bwiMLvlA7EvpP5BbhM9Xyq?=
 =?us-ascii?Q?lP927vH2PHebhoxhcgKBmhPWUKYMMwSSBdeuzG6pp/ajyEeiER0z/f22AIEt?=
 =?us-ascii?Q?GW+q+pxXAivIjkDMYwJ+ABbWUT4l2IVjsW73W04EnOH8S0W4OYUMXFiarpFJ?=
 =?us-ascii?Q?h1/Fmh1xbJ/El2pUJUgBPU+EqLWKxIwl1CrMvW1EepZYdPCa8BEeTBnpyEs0?=
 =?us-ascii?Q?061tfyZkqq4JuBctXLzMVgE0kMEvAMhrdJGwtxjJJqnAedGSJtDvKsWfRQ9Y?=
 =?us-ascii?Q?2M36SsjAH9XcaqxUj5g1A57vw6Svi87z7oxaYtVdBrRNy0gccQYUaq2+1vJU?=
 =?us-ascii?Q?E8h3ryzoredixKAaktkg6Z2eHOl9WeZ3a8glgT0YZjjAREXl4GNjsRIUwc5k?=
 =?us-ascii?Q?iUzRFAxt5eE9osUwL73AMe5VsyTpn1DhU4IT01W0Yvc5mtnbHrmCevIpLH5d?=
 =?us-ascii?Q?dR2xN6uab8CFluKU40FSmrEDbWW52Uu/FWl0tw4RHq0vGHuy8WxXpDoplQfe?=
 =?us-ascii?Q?UKgNVOvodaurkGdhAPFiIQgtgH17fONYAaqHxBWeo1h4JpSAX7klzp9kIyAF?=
 =?us-ascii?Q?nuI/s/nAZc6Gl8FTFzUbZ7rCP8kRNtRMMFgvaADu4wl13ieOSF8MjoG0VPK8?=
 =?us-ascii?Q?seGOgh0qYw1fHgoRX6HV9Jh8WDosRCEAphXanjc3xD+52oUeMX9OrK+ga8Z4?=
 =?us-ascii?Q?liAOYQq2HeiSBk6iQVK6BGXdLrjmUgaQLgMvzBoVWuqIcs4Ah/yIY/xEzcGN?=
 =?us-ascii?Q?fMSx64WXbo1OcQvnNwBjrewUecVwLZ4o+mRlEGA2vciO+TkOLPDet+ir6T3k?=
 =?us-ascii?Q?3342zCXsJC7PNWPwoebraKUgrec4BNMVPbDc1+2X4vniLZjk/RNTkVIUED/y?=
 =?us-ascii?Q?rGS2BxitWw7B93HeykPmLu44QHr4SAvQcyuE5zPLJ4VPu+oaG+zj1NV4xmy/?=
 =?us-ascii?Q?PbBDgVKlI6BIU1tHC0qjYMy+7kPIA0KNcD3eMXUCKvFEIWUYYPEl+IsvElI8?=
 =?us-ascii?Q?1KNHHMdpgYLp/dpXm7S+FOYK7TCGrjdQ71uwnGjEzYoPM7qUi+RWr4rIW0YT?=
 =?us-ascii?Q?Dk7479RONfS7rFBJEc8yh21mr7+ZuZfbtqfM84nYM5gaqE1WyXDd3abfJHGy?=
 =?us-ascii?Q?xZMn4Z6SJIbc9dxI+j0/cgCG8yy1S/45McmMoJKkPeM72QtK84xBqmrmd7JG?=
 =?us-ascii?Q?gA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da95ecfe-e864-4c9a-c3dc-08dc8eba2058
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 10:42:03.8790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNNRR1fBg+2LHEBRP7uCtMhUWCodUVEUw+MlymsyW2f3BdpRgKlCLgoUVi1YeWwHRycydtjK/RY9Sh49x3grUM4tjXwsrCCdWDsNDrjzgUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB3099

From: "jackson.lee" <jackson.lee@chipsnmedia.com>

Provide a control to toggle (0 = off / 1 = on), whether the SPS and
PPS are generated for every IDR.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/chips-media/wave5/wave5-hw.c     | 26 +++++++++++++++----
 .../chips-media/wave5/wave5-vpu-enc.c         |  7 +++++
 .../platform/chips-media/wave5/wave5-vpuapi.h |  1 +
 3 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index 2d82791f575e..6ef5bd5fb325 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -23,6 +23,15 @@
 #define FEATURE_AVC_ENCODER		BIT(1)
 #define FEATURE_HEVC_ENCODER		BIT(0)
 
+#define ENC_AVC_INTRA_IDR_PARAM_MASK	0x7ff
+#define ENC_AVC_INTRA_PERIOD_SHIFT		6
+#define ENC_AVC_IDR_PERIOD_SHIFT		17
+#define ENC_AVC_FORCED_IDR_HEADER_SHIFT		28
+
+#define ENC_HEVC_INTRA_QP_SHIFT			3
+#define ENC_HEVC_FORCED_IDR_HEADER_SHIFT	9
+#define ENC_HEVC_INTRA_PERIOD_SHIFT		16
+
 /* Decoder support fields */
 #define FEATURE_AVC_DECODER		BIT(3)
 #define FEATURE_HEVC_DECODER		BIT(2)
@@ -33,7 +42,7 @@
 
 #define REMAP_CTRL_MAX_SIZE_BITS	((W5_REMAP_MAX_SIZE >> 12) & 0x1ff)
 #define REMAP_CTRL_REGISTER_VALUE(index)	(			\
-	(BIT(31) | (index << 12) | BIT(11) | REMAP_CTRL_MAX_SIZE_BITS)	\
+	(BIT(31) | ((index) << 12) | BIT(11) | REMAP_CTRL_MAX_SIZE_BITS)\
 )
 
 #define FASTIO_ADDRESS_MASK		GENMASK(15, 0)
@@ -1601,12 +1610,19 @@ int wave5_vpu_enc_init_seq(struct vpu_instance *inst)
 
 	if (inst->std == W_AVC_ENC)
 		vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_INTRA_PARAM, p_param->intra_qp |
-				((p_param->intra_period & 0x7ff) << 6) |
-				((p_param->avc_idr_period & 0x7ff) << 17));
+			      ((p_param->intra_period & ENC_AVC_INTRA_IDR_PARAM_MASK)
+				<< ENC_AVC_INTRA_PERIOD_SHIFT) |
+			      ((p_param->avc_idr_period & ENC_AVC_INTRA_IDR_PARAM_MASK)
+				<< ENC_AVC_IDR_PERIOD_SHIFT) |
+			      (p_param->forced_idr_header_enable
+			       << ENC_AVC_FORCED_IDR_HEADER_SHIFT));
 	else if (inst->std == W_HEVC_ENC)
 		vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_INTRA_PARAM,
-			      p_param->decoding_refresh_type | (p_param->intra_qp << 3) |
-				(p_param->intra_period << 16));
+			      p_param->decoding_refresh_type |
+			      (p_param->intra_qp << ENC_HEVC_INTRA_QP_SHIFT) |
+			      (p_param->forced_idr_header_enable
+			       << ENC_HEVC_FORCED_IDR_HEADER_SHIFT) |
+			      (p_param->intra_period << ENC_HEVC_INTRA_PERIOD_SHIFT));
 
 	reg_val = (p_param->rdo_skip << 2) |
 		(p_param->lambda_scaling_enable << 3) |
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index a45a2f699000..a23908011a39 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1061,6 +1061,9 @@ static int wave5_vpu_enc_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
 		inst->enc_param.entropy_coding_mode = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:
+		inst->enc_param.forced_idr_header_enable = ctrl->val;
+		break;
 	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
 		break;
 	default:
@@ -1219,6 +1222,7 @@ static void wave5_set_enc_openparam(struct enc_open_param *open_param,
 		else
 			open_param->wave_param.intra_refresh_arg = num_ctu_row;
 	}
+	open_param->wave_param.forced_idr_header_enable = input.forced_idr_header_enable;
 }
 
 static int initialize_sequence(struct vpu_instance *inst)
@@ -1701,6 +1705,9 @@ static int wave5_vpu_open_enc(struct file *filp)
 			  0, 1, 1, 0);
 	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
 			  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 1, 32, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR,
+			  0, 1, 1, 0);
 
 	if (v4l2_ctrl_hdl->error) {
 		ret = -ENODEV;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index edc50450ddb8..554c40b2e002 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -566,6 +566,7 @@ struct enc_wave_param {
 	u32 lambda_scaling_enable: 1; /* enable lambda scaling using custom GOP */
 	u32 transform8x8_enable: 1; /* enable 8x8 intra prediction and 8x8 transform */
 	u32 mb_level_rc_enable: 1; /* enable MB-level rate control */
+	u32 forced_idr_header_enable: 1; /* enable header encoding before IDR frame */
 };
 
 struct enc_open_param {
-- 
2.43.0


