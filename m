Return-Path: <linux-media+bounces-13422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF88490AC18
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 12:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 589F81F28078
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 10:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FCB194AD5;
	Mon, 17 Jun 2024 10:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="JD1lgGVg"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022019.outbound.protection.outlook.com [52.101.154.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B915025E;
	Mon, 17 Jun 2024 10:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718621310; cv=fail; b=YG4/PEH/lB4PMAg2h1OpO0ApWEnfsPt98i5uiMt6FUUdn9SGuQptQgJMv0NoNxPGi/dp8GKdjmFyRL7hlz43nSWLK3RYJzbMxU9gCHlLkchO3RFa/reikbZfo1OkRDtscbIJ79D21cCOoByGzIP2749DKErgi4/ee8NgRbjd4JE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718621310; c=relaxed/simple;
	bh=Jh7NMn5Ffi08bvNN1CoE3ShnyByaBguMtO82WgWG96c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SYlZuJJ6W2lsPkZE7Q/I0/wyJ5JJip1/V04JvbjLu67Ub1P4WqIviMa9g53wpoqpWFMwCsOKsEMVeIU6UW/NoSTCuxPo4TpjKVzerHAMNNypW+HwtV2gL+SxAswHS5myasAJoFxfisEr2CRFwe3JkfPO1hOYvLQUtb1i4qtE99E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=JD1lgGVg; arc=fail smtp.client-ip=52.101.154.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2+gQAGBX491syxWkRcyMCsqqKfPsJbfu8qA1Jc+MdulPSp6/1QvaZgCRUVvGWo0YT8Q0t2YPC4Mi2CZj6zdKnR6g3FsHJk1Ankld8J+hCPyh6nwHVykLOJiyieZu8Sne36u42//8Hsnr/U3EAuHrLm5ICruL/7ihPNG9sgud0Y8YH2BItQXTKRsTwYTgkl6nC19SxU2e+6qH5WDbMEZrJ0SMw8bbMGnL5b4XWO+RivwPVW5AqUdganqaPdbuF1cRNcbIuDtBT40q/e/wtJFgHQZF8n5xQTEdumbZfv7bIjGubItbuxmznOo4z68pyAp2Sy6q+N+dSSpnAGLQArjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbHaY/RN3sriw+PWqSPfBhyDm6vcvpDz6rCL7/jkTlk=;
 b=Feg0QwCkCj66P2RF/zKgNfJHz0po0bdeS5IWMN9htwYI3h/Tr7zyYpfXlangUvixxIKrR7Vc2qgMMr8ktiqs3uYa9c5y1MnJs18MeB1Ysl9w+z4xr2fFsvXYGTey0ipzEiEWAvAaskV6QTLKnsi98dfkc7+0zdBBOwlDqbgqgcGnsKQmtzPZ3Xp7bvO4u2xn0A0Q/7lwUnSB2HawPEid0hHachRC8nVDSb4yLAIAhqI8b932kcIAqAG8dDRop27NZ0CwGUqaLZrnTeRLloo2ONOlgfmjhJCatobCaQfbFtr4W4lKzNNwXU3TacB9kvRITkE57FccpW8qbkwgPyNHcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbHaY/RN3sriw+PWqSPfBhyDm6vcvpDz6rCL7/jkTlk=;
 b=JD1lgGVgqMfXBfaNxKb0ualdDN9Lc7iacroT9CJE8VS98LW7eZ4EJnhKDMEmsXhvWGBcDCyT+fx8TY5Oi3V17xQHAL9SOLj071SJ/DmgWQFbuaobi92aMNtVPiD9ZTC1D9PXvFMzwsYuN7DljlJqoO+ia+MUHQeKmaFGaOSBw5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB2773.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 10:48:26 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 10:48:26 +0000
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
Subject: [RESEND PATCH v6 1/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
Date: Mon, 17 Jun 2024 19:48:15 +0900
Message-Id: <20240617104818.221-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::16) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE2P216MB2773:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b71fc4-d9a9-4f42-1d61-08dc8ebb0443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|366013|376011|52116011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r9x2s48y9HC81UckJb8xqezNHFED1GvbxsOtbQoGEu6wF2Pk0YjCoLowpFaA?=
 =?us-ascii?Q?XHVH/Wkhd1ItDJUtR3KVNwUwoDQKU4EB9fSAT/areFZGRo6TQnbXx5Q3WA/O?=
 =?us-ascii?Q?6bvo91YMiK+Z+kAatWOcpaRRNZXayc69D1f9zdLDf8OXoe8WD6CZ5ZaKaTjx?=
 =?us-ascii?Q?wLvfRPBMDK3+9BAkpdWFRm3lejRRNbg/+ehEyvB8GGl2FHUn/QtDS965HrRd?=
 =?us-ascii?Q?NG16eEQta+LjQt8Ais4AJg2VCurk6PPcN6yiAI3bvQ4Uk5O4iej3NLqJynQM?=
 =?us-ascii?Q?FQSgpYFVs8VdaEnfOby30yRkTOLRzFbH5UUiWj5L/jsnHANRhKLMOVJ08xKW?=
 =?us-ascii?Q?NraKOwO/CewnB9XRuCcM5XUoxbSH/FT1bLP54cALl1ndnecFmbjDlFJkHM/W?=
 =?us-ascii?Q?rs+gbVspmpRazS3/WIZT77zs92Y6hzGC0pLanKFrrsE3q1dbnUi75D8WP4FR?=
 =?us-ascii?Q?QaULAWKtLcuulbutXf94pzHGE4DI12Pavi1ne7aXgGbtPlfnC3zh1EfVrh9p?=
 =?us-ascii?Q?oM5nOz5L6gj/4dL1CngeWCC7Dn3MWzQEoDXLEPvWFt7+7D/6Lc5Epgizm3r8?=
 =?us-ascii?Q?MKZq60KQ2Epa7pfCuE97mUoDVGVbBrvRQn2lbjD3GszQ2UyXjMdZMfGGXwAZ?=
 =?us-ascii?Q?4RdzayQzTTZwp3abSWqB0YtXYKc5AS55rqz+exPq2Sa+tjvc5r5RgnBVHWe5?=
 =?us-ascii?Q?bH3gQh2N+jh9DWB4WoyOQfrQfj4ACsV9PODd+BMK7YxVTv6TPXz1j/fwREq5?=
 =?us-ascii?Q?t+AOn/cRAKPLhPAH2NGerulQCDMYAhLZe5/gPRh8uwItDlXSBM75rk8vLXq6?=
 =?us-ascii?Q?enjhgi5nTdQrTURxx4p+meKHixPH17QeKp5GAdXs/wt6McerckE2mx0IxvVP?=
 =?us-ascii?Q?zTJKzoeeBB8aswC+H8R5AxPy2cPvYwKzmhvNhKSe0PnlkZzzYivWzX2YvEvw?=
 =?us-ascii?Q?9uoS0d//nkJN5CGqyRChed1RuGHjU+0EnEHDPjji7YzCu+roTUpURhFF4d1R?=
 =?us-ascii?Q?kO0hjwJhbmv86HtqZBNeFJ0browIM7IF2ljFlfEq0MLQ00rUpZ3USK0piBWq?=
 =?us-ascii?Q?FZMPWshutibm/bfpR0rbS6Kw30E5jDGog0qsZY6ZNVI9LoGFYmxaqRlBY6NH?=
 =?us-ascii?Q?Y3zzkXO40iBQJ42emGOcmH6Z1U7skcJTY9J0OR4Ecom8Sl6zjBcz6Tvn6FBy?=
 =?us-ascii?Q?oa8GL9kiR35cLt85MxNIK01EcosUpnPKIGmVi/ICo+0AbTBWvyNtdVJVdIaT?=
 =?us-ascii?Q?RxKf4s17T4izmJznvewsqprR/dD5W2o9gAK0N0WnbVn3cjcJGovN60/Zd0tl?=
 =?us-ascii?Q?nLeKFLzMUVwcz/ygypqN5+k2IP4VAgxfAMJQ+kdEaBuqRMmwKoHsXBQ7qbmC?=
 =?us-ascii?Q?UyYPuYM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(52116011)(1800799021)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kd4r1q8KDccwRH7ZnZi8dawKGysCUW7/eq8SqrUpPj7dfgWKXnETsHyXzO/s?=
 =?us-ascii?Q?NzvIyETCzPJX2GqIh/IiKwnT106Pk8OUAcwmwqHGjO6NYlROO8gSmKA25BgD?=
 =?us-ascii?Q?Vg6CizvxvJ3MGsYUCdNdLFXx4e5AYOpFO3dgm3pV9dxIy1GBNVr8zGpNHNeM?=
 =?us-ascii?Q?KRk7jN9UGK3zhwICxPj1GcmgEB44cUIAA45s+++MBsued+d/Q+6c4cp1ezcv?=
 =?us-ascii?Q?zMwe7gbI7OMjg3Q1ZuZcB1oiusjHc9CGReRL4F+HmiIa4iOA6v6XrUuV1+2u?=
 =?us-ascii?Q?niI9CZ15wyfbzabe+KFo6BKiF5CXHGS+y9ML6k9ElNySWV02pqxD/+GWsBqq?=
 =?us-ascii?Q?cqpqQ6e2V9G7n7n5Ag8jH05ahNLnL66ZFbNe60t5cfHe4QP6YAfsMUxLdXWp?=
 =?us-ascii?Q?4uOG7V0QpWCR4raKtttUbb+tcg5mQY5GEHuGNjNsMcEB6ZSrszxu8FN+adMw?=
 =?us-ascii?Q?Zuwj8xWmFDN7Ty5NWt/wHBlqp7SSRFs2s2xJWBd0l8KzskvXXFGHIbsotbmw?=
 =?us-ascii?Q?iPGvkfArS+dGnpZNCpaLLPhu4rWRGBhLHKIfDAbsVzwME1cOW4xtrmhIvnoB?=
 =?us-ascii?Q?C7pdkKPEHNcpCZXVMHAj2APW2BjA5Ooca5VySaLoKWbL6XX/nRVQhDdiMqHo?=
 =?us-ascii?Q?kOmsN2beN4toKVwPMHmV/4g0kVaIEDF08TMNOum+Dt/vGe9MGf8tPDMdMnaw?=
 =?us-ascii?Q?iEGCNDZcRuijnkikGpAA5K7JhsvrhfwOjINqz6UL0h0hHaITtBuH24TROsXi?=
 =?us-ascii?Q?+Cm0MhMgnF87qP6MzOTCFUX952rHW7vqgnNJMhWsn03eMwMFfkYZTcUytFNu?=
 =?us-ascii?Q?KCzkn8VwJtdWo4dZw8xnRRCb7CzTWFm8TRkLW7Lpi/PHi7msscYtrGr6CdkC?=
 =?us-ascii?Q?1GADSH1XAuTTLM/o7h7ULbSvzzf6n4wg0dAlDI9NfCgBXUatWjS8GH+wqhMh?=
 =?us-ascii?Q?vu17hbuAYRC6sFxqWmDmI0Qtjvue/jM3xS/JvL959Lb+PbUgbRnjDJopPAy9?=
 =?us-ascii?Q?5cZE2ElxB175/QP6B4X2kKG8YsG3NCojCYSKCTT+pikqO2QaERI6L5CLeLfT?=
 =?us-ascii?Q?h6AduhhjU1+F6agkLxoSVqQrrXKparjOPB14jj6nKw/qijThddy3/p+JAIYT?=
 =?us-ascii?Q?4r77bgFMIZleClndQAOaLiZ8244GEC0/ACTsMGzgS7p4qxAmQwDZpbK2vxqS?=
 =?us-ascii?Q?qXxsRjCHBzIbqZ9hgO+HYFa38X060F0e4UWHizXLLpOtReSvH977+fASbXVG?=
 =?us-ascii?Q?xwJIfpAQ64ulTTiFplm+VU2fWr3PKV+SKbcDrvuMY6I4N8IXP7hNNiK09dIT?=
 =?us-ascii?Q?kR8j9Go0NiO29Xrtoqgozsy1nJTa6Lm5eUOs7qU+bWMFAvWH/TMiGUZG2osw?=
 =?us-ascii?Q?ovwa/5PPGnqt3J3Fb1bYSTAUGqVtQHZhco7oOipsVQoV4+ld6kRkxkFWIfL+?=
 =?us-ascii?Q?HL24pl1iTGzLykmm649P+SAacRt9L7ZHi8mlB2Rtf/Jxv4W1mYZ2Bn4kNN6A?=
 =?us-ascii?Q?5QjC7XkVxSyAFgRn3mOAVwmE/g3+JAAVZhBhEWrjAGcHePEpUzFNcp3rt50+?=
 =?us-ascii?Q?zOxJNJWaD0n7ZilGWq4Mnn2ri4VxdCaSen6B1PzQn4+hWKgh5D8pCBcawroi?=
 =?us-ascii?Q?jQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b71fc4-d9a9-4f42-1d61-08dc8ebb0443
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 10:48:26.2160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nC5gJ9R+mcpWlzh3nb33ky34AmlcCxKd83xq8cvg2/javFM1qoXQb8wwTv6i/TXQOfC6RCzCXztGhxGm/OwpcUUqYGFbkkPz/ZoLxAiE7C4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2773

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


