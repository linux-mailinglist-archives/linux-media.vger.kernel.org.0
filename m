Return-Path: <linux-media+bounces-58672-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHH2HNoU3WkOZQkAu9opvQ
	(envelope-from <linux-media+bounces-58672-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:07:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 081813EE590
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06A513040971
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 16:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6402F279DC2;
	Mon, 13 Apr 2026 16:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OuIIAn6o"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF50272E6D;
	Mon, 13 Apr 2026 16:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776096280; cv=fail; b=tqgOI+PJibKdw7QNckyjRch6rjwzC/fv38rktIT0fXUs9XCGKfN2sMkHG/PBX61XRzM15anFIgT7nnu8//yjF4uTpVNTUyqhsHYq+GfgWH0cF5rbce9oMVyTRomxMfYMfABseBvkOTQ0Ih/+qFrZhT70qjTMAQXGSnWRPh40+Jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776096280; c=relaxed/simple;
	bh=+TTUrwRirsfhjB28SVVRWsB9WfTfV7zb/nZOVg/4/k0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pC+mrb2YW2tp+e8QXpPCbIAqYlBXyeb9CZ16Zr5BUo9F1np6d2Dc4nOcI9W5HWZ/alMMbbAjtnnuA4M8jUEoc4q71/CXMXIm6/ET6pAgs42GaaM0JEzsUvpz6WVMuH7l+n1AhKVF3Dfc8wqfkdLT0uDk6LEVOlSQ3/PTSNJHeBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OuIIAn6o; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOdo551BABjM1G+TqOGLt3GL7yVxF1FpTvhxzbJ4fHGqoNR1de+sq76atn/+jxA+KiA3ZxyR3i4HZHR/UMuwBI/+DeodhGbi6GS880YAeDq6eI8B3FV5IH4Sx9r24NXOJsgLGO25RXUqCQLVq729Irief5Dqagpb3VYytXbkIvszqzYRbpx8PSWshVAclKwWc6hqBioThhQjWVRQoJsLkPL1lMESnQqDaztoxWlU8F62oP98jomQxXS9/IQqbJnMeoMOopoKQyJ34zcWBgC5hA+9fiDBp7z0VB2k13lnNg3TKdV/EVc7hfm5GZCepw4UAkXq32zSs4q90N5sGtVKpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fD3C2nmQPHilBxDOyvz4EuOu2ABMZQ9uIbbUSbJz4pU=;
 b=dXRKWOnhAX3vp19VJYNkcG2NEyg/uP8JS1kQQyoiY0dRjychufmR/mOTVj02BeSop+Gem3ZZU2IL+xCHmQfui3EtEEJB907c3r4/BYQZ0mPaJEOkO+EfsCY6XkvO8cTtK7gneycSKo+VMcSnzX8yX/BY8XyChVg+ipMNnUgaMdmQ4kMywtIAgXTTiFE9WmJswrchJ1uLMzhWfqJElijx28GXpBNClgGL8hxKEOrlD/wHYKRs3VPAnGe8DVY1purTKSPY9UIAKaEZprEG2VTxCu+T/HFbIgggHJmASz1Hzem9vFgXKoC8x2852V7UtEAaAwPKqzJ4Zkui9eR6qt8RbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fD3C2nmQPHilBxDOyvz4EuOu2ABMZQ9uIbbUSbJz4pU=;
 b=OuIIAn6oI9NbFuoRKP+IAKs3Y9zXZLZXIjqgdn1oStNj2THcnJGVRAol62FgVjN7YX4mSHVETcqhRQhrWNAtfbCzq+F7wO1fytM2O1eYYUFEkZHfcy3cCZZ0OUgGHnk1G/TNrAgaR/XCwKi5FNm30MdOV/Vn3RR1gLzPMPetDoVPNCFghm1u0f2FPaXZaFhN9Z451PcL6uF2eQRwLesHNTRPC/sP41niwOsU0gGSHmGvU22tWiZ6l60njRo/5PkPRJ+QGvM+dEqnqkeD5lpaUAoVszoPpntJHqYrbdnavfsp6iLQw5gBDwgePqG1nwf1YzCbUD3WaDm4gQ9Ieh4/lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by MIYPR04MB12599.eurprd04.prod.outlook.com
 (2603:10a6:290:7b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 16:04:33 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 16:04:33 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michael.riesch@collabora.com,
	anthony.mcgivern@arm.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v1 02/11] media: uapi: v4l2-isp: Add v4l2 ISP extensible statistics definitions
Date: Mon, 13 Apr 2026 18:03:22 +0200
Message-ID: <20260413160331.2611829-3-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::15) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|MIYPR04MB12599:EE_
X-MS-Office365-Filtering-Correlation-Id: cae57df5-14bf-455d-539b-08de997659fc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|52116014|376014|38350700014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 OTOCwt01CIJnEtaQC+eLPiqtBCdfaPYASFzJsGTYFkvrj0P/9/mYq4+tr403oqGFM3jCSDFOBT4EEWXQeHhWvPtPNCjT3uoO2sds/kvC/1c+J2Fm3aAJqIkAIIL8Htk0VksHkNC5TsIpvktq/GKTYrEcPEtlvYAx4ZJb5EVKm7ZsVzOkzOZClGniXkHfTnQhB5hSGBgZRuVKM9nosYM3eFAiBrAP5PaaMHx4YWt1osx6hM8phOS0he1082BegiypSqNjnbmVIiAV/nPZ2sF10N+A6syT71a0Q+jzryNgGeY/e/lg6WNe5f5sBLUxlYiIvdTIIGh+zbPxibjDOWbTTH90pVPoEINKV/BVPPQomDWSou93UzCRrJANE2tonpiV5Pcsc6kuJlmC+ABbB/7l+eEb2dZxO3Q7/XRZedD6l0Ws+AdqAqXRQCADbFltRkfPInhuwzHxNSVdGp1q/qzx3RLK+w8ZtwF3wBKSKAeBuw2bCHSCrE+8X1qIiT3jiZG2Kj9w7l0viAYJoX3R6YV20IlDS1PqzRZfIMeKUCIFblrwhE4hTCwPq3PXGdZ4YUWJ1cJz+qoqfcmS4m4AiVXClsdV5v2F67WIQGBVSipPaweLS0GCU4uNpE/C2MKzYtXJJHxgB6VKyvG7aFn+6B0X2sQW+ehCScYfhaaM5hhMLe/uQSksllf8moetohB59MhJYvkbG0V4WKrNE+plydWCORrAAGo1XYoPIl1v4/K/e+5w/QrZMCvSkrjsZS2oQBSOLgthH3aTjvJIt4K/pMR0XBsc9L8BZfK339u2IyBybA+oA/8/Qlqv/eTCiWQ/UIoJ
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?COYO2gW1Yn2OiMs20jJ/K5kpoGoMBjK8CCRFZoZ8lnUxawlpd1HG93OvrEhY?=
 =?us-ascii?Q?pY+lxNnxB59iTNR2MhW44osBrIGZlv4EWy1TZcHTO7gjSS/Zf71nvmYFZGZ2?=
 =?us-ascii?Q?coNkpar0P+bYxJbghBB+nCb5gfGQHXbqDH6dGyuIMiwVUP4hbsznjpOEJdUd?=
 =?us-ascii?Q?LCunVMQn0Ad92N+hTAROET/qPo9TlkPBjGOBI5nvuU0efGZk3SF2oFF1HZ/V?=
 =?us-ascii?Q?h826C3JSbjPK0PoebkIyVErhUOwkP/xmWNBUJJipc/gJ1IiFyaTPC+IGcSLM?=
 =?us-ascii?Q?IeexdmSf8dbhy7Em103JjqQvRR72JFIbC+OW3Wf1GO2d0ICNAau9vzt8R5Sa?=
 =?us-ascii?Q?Doa+UVv7/F5VN6UR39VXKgseSAE8D4TrchFheUu6eZ4RRPo11x3Wz6S2eOrG?=
 =?us-ascii?Q?X32cQWL/2xqWk2O1SywBqgnlZR/IYgdrJRWfSKG1PK7Org6ijrcHiGSLJMvS?=
 =?us-ascii?Q?xUp3Fkfh4+abwAYFMAi7Wu9YNmRtRQKtb+wxbCapN7P2JYeetGHXMaDKSU+E?=
 =?us-ascii?Q?h+XFNBC6IaeiV2cBfx3vLmyHSDc2UjK4E3ZZq0Gb3Ihm8SYq8Wl9B17CHoTT?=
 =?us-ascii?Q?dz2MAVcio3GmC+ATdxPpruJmQnthN/2Cre/BiBCavZU75de535gbnn6SGfSV?=
 =?us-ascii?Q?WXW1Qn4WqwTZftr7uzcat9RZAM+KJAA53M1zcY+3fgd2QzfMStQ87rsy7AeV?=
 =?us-ascii?Q?y8WTGyzP8X55rmw6FwHRFvAUQIZZBmcGbrgX38qqjVWRj47UA/kGFLUx5ExE?=
 =?us-ascii?Q?w/RCgB6LxRlBG/MR9ryPx0+ycVznRcmRlXyvfPmnEON2mQJM46czejG5S8C7?=
 =?us-ascii?Q?65jDM++ijceVPmDiLx17wh8rYoRJxFzUdRrPYw5dd9JprkLEIjca8shKBXeA?=
 =?us-ascii?Q?U8vyro39dTgSUubpSvJoLIkBUMjpR5a/P5Wn8w39WsMMf9yJq92zvzbzp0Fq?=
 =?us-ascii?Q?UIoGu0WSk+z0fCwz6hO6coMcbw+HJXROvSeRexcFpXBMYjOuNjxS3OaV7M5F?=
 =?us-ascii?Q?51AqfT7KuW0Y16fXxWcbLIk75XNzuVLkb56Sq3+tO3yFutukdpmYnwr5HEoF?=
 =?us-ascii?Q?LJN3EKPznN60Kg6rQSBzE8Wjpsewpira/JV49vT+Rf2WiL12Nwc9D3UZJpCy?=
 =?us-ascii?Q?qZkxqq22C8No1jbpahZozfgRc5mE58FD7vX3nHuCMTbngRjVimv+XZQNKicT?=
 =?us-ascii?Q?ex6GNaQVsDnmDEBnTSqOR1MsKvQRuNgb2Pdde5PsKhUh3UHJgDp5EhrPsOt0?=
 =?us-ascii?Q?DeypFHQuwKCsA9crlBD1LH89FxCW7LqeQ40g/5cQuZuMJJliuzXk/QMNUR0y?=
 =?us-ascii?Q?zS2G1avEy00XI3D9Gu6Hg0uOBBarwLuu5ArYaYAqgYNz/xAAn4U8FYLZfAoB?=
 =?us-ascii?Q?QL0vlCYcrZ77Av5CBjCbPoU8+EIrN6SJyyP7EZxzZ/7P5fRPOl6rPabK5th6?=
 =?us-ascii?Q?AX/FQKKGzsJVRlI1CXTlou7+usAOMEZvyOxnms5QJd72X+e7JCiiWHjvVmU3?=
 =?us-ascii?Q?lfTS46rZdKp6P2bQk+6rshSXcaCh64q9qpVPQJ+D0K+b/h3Qed5wxeu/P0wS?=
 =?us-ascii?Q?8rAB6PhihycL6+Fwj46g2u7kCD9iZdo+maWXR9rvJznXM6rwcBYscIcurE9L?=
 =?us-ascii?Q?p9TNSTz7htYCzlOTyrTZ1YOjlcuAvkrjoFr3cb8ADd5CMTNpU4hfrVgG7qYr?=
 =?us-ascii?Q?zxFvGWbCinyQ5Mz5FnyC8Urru1OMD6wOt/VPp4PaSwflkmO0lRbOUZ6WH6lJ?=
 =?us-ascii?Q?TC4IZAYOIA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cae57df5-14bf-455d-539b-08de997659fc
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 16:04:32.9589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9N5FxBrn+/39tPd7OVYB6zG0bdsYMfLZ6oLtsrTvaTcywc4fa8N1Cy//8K5N2m3/+jmmEpgiqUBnQbuIlrq+ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIYPR04MB12599
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58672-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 081813EE590
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the v4l2-isp extensible format introduced for isp parameters buffer
to the statistics buffer as well.

Like for ISP configuration purpose, that will help supporting various ISP
hardware versions reporting different statistics data with less impact on
userspace.

The `v4l2_isp_stats_buffer` reuses the `v4l2_isp_params_buffer` container
definitions, with similar header, versions and flags. V0 and V1 versions
are provided to match with params versions. On the other side, ENABLE and
DISABLE flags are not really meaningfull for statistics purpose. So VALID
and INVALID flags are introduced. Purpose is to force ISP driver to
validate a statistics buffer, before it is consumed by userspace.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 include/uapi/linux/media/v4l2-isp.h | 148 +++++++++++++++++++---------
 1 file changed, 100 insertions(+), 48 deletions(-)

diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
index 779168f9058e..e84476280d43 100644
--- a/include/uapi/linux/media/v4l2-isp.h
+++ b/include/uapi/linux/media/v4l2-isp.h
@@ -13,25 +13,33 @@
 #include <linux/types.h>
 
 /**
- * enum v4l2_isp_params_version - V4L2 ISP parameters versioning
+ * enum v4l2_isp_version - V4L2 ISP serialization format versioning
  *
- * @V4L2_ISP_PARAMS_VERSION_V0: First version of the V4L2 ISP parameters format
- *				(for compatibility)
- * @V4L2_ISP_PARAMS_VERSION_V1: First version of the V4L2 ISP parameters format
+ * @V4L2_ISP_VERSION_V0: First version of the V4L2 ISP serialization format
+ *                       (for compatibility)
+ * @V4L2_ISP_VERSION_V1: First version of the V4L2 ISP serialization format
  *
  * V0 and V1 are identical in order to support drivers compatible with the V4L2
- * ISP parameters format already upstreamed which use either 0 or 1 as their
- * versioning identifier. Both V0 and V1 refers to the first version of the
- * V4L2 ISP parameters format.
+ * ISP format already upstreamed which use either 0 or 1 as their versioning
+ * identifier. Both V0 and V1 refers to the first version of the V4L2 ISP
+ * serialization format.
  *
- * Future revisions of the V4L2 ISP parameters format should start from the
+ * Future revisions of the V4L2 ISP serialization format should start from the
  * value of 2.
  */
-enum v4l2_isp_params_version {
-	V4L2_ISP_PARAMS_VERSION_V0 = 0,
-	V4L2_ISP_PARAMS_VERSION_V1
+enum v4l2_isp_version {
+	V4L2_ISP_VERSION_V0 = 0,
+	V4L2_ISP_VERSION_V1
 };
 
+/*
+ * Compatibility with existing users of v4l2_isp_params which pre-date the
+ * introduction of v4l2_isp_stats.
+ */
+#define v4l2_isp_params_version			v4l2_isp_version
+#define V4L2_ISP_PARAMS_VERSION_V0		V4L2_ISP_VERSION_V0
+#define V4L2_ISP_PARAMS_VERSION_V1		V4L2_ISP_VERSION_V1
+
 #define V4L2_ISP_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
 #define V4L2_ISP_PARAMS_FL_BLOCK_ENABLE		(1U << 1)
 
@@ -39,64 +47,108 @@ enum v4l2_isp_params_version {
  * Reserve the first 8 bits for V4L2_ISP_PARAMS_FL_* flag.
  *
  * Driver-specific flags should be defined as:
- * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(0))
- * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(1))
+ * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_FL_DRIVER_FLAGS(0))
+ * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_FL_DRIVER_FLAGS(1))
  */
-#define V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(n)       ((n) + 8)
+#define V4L2_ISP_FL_DRIVER_FLAGS(n)		((n) + 8)
 
 /**
- * struct v4l2_isp_params_block_header - V4L2 extensible parameters block header
- * @type: The parameters block type (driver-specific)
+ * struct v4l2_isp_block_header - V4L2 extensible block header
+ * @type: The parameters or statistics block type (driver-specific)
  * @flags: A bitmask of block flags (driver-specific)
- * @size: Size (in bytes) of the parameters block, including this header
+ * @size: Size (in bytes) of the block, including this header
  *
- * This structure represents the common part of all the ISP configuration
- * blocks. Each parameters block shall embed an instance of this structure type
- * as its first member, followed by the block-specific configuration data.
+ * This structure represents the common part of all the ISP configuration or
+ * statistic blocks. Each block shall embed an instance of this structure type
+ * as its first member, followed by the block-specific configuration or
+ * statistic data.
  *
  * The @type field is an ISP driver-specific value that identifies the block
- * type. The @size field specifies the size of the parameters block.
- *
- * The @flags field is a bitmask of per-block flags V4L2_PARAMS_ISP_FL_* and
- * driver-specific flags specified by the driver header.
+ * type. The @size field specifies the size of the block, including this
+ * header.
  */
-struct v4l2_isp_params_block_header {
+struct v4l2_isp_block_header {
 	__u16 type;
 	__u16 flags;
 	__u32 size;
 } __attribute__((aligned(8)));
 
 /**
- * struct v4l2_isp_params_buffer - V4L2 extensible parameters configuration
- * @version: The parameters buffer version (driver-specific)
- * @data_size: The configuration data effective size, excluding this header
- * @data: The configuration data
+ * v4l2_isp_params_block_header - V4L2 extensible parameters block header
  *
- * This structure contains the configuration parameters of the ISP algorithms,
- * serialized by userspace into a data buffer. Each configuration parameter
- * block is represented by a block-specific structure which contains a
- * :c:type:`v4l2_isp_params_block_header` entry as first member. Userspace
- * populates the @data buffer with configuration parameters for the blocks that
- * it intends to configure. As a consequence, the data buffer effective size
- * changes according to the number of ISP blocks that userspace intends to
- * configure and is set by userspace in the @data_size field.
- *
- * The parameters buffer is versioned by the @version field to allow modifying
- * and extending its definition. Userspace shall populate the @version field to
- * inform the driver about the version it intends to use. The driver will parse
- * and handle the @data buffer according to the data layout specific to the
- * indicated version and return an error if the desired version is not
+ * This structure represents the common part of all the ISP configuration blocks
+ * and is identical to :c:type:`v4l2_isp_block_header`.
+ *
+ * The @flags field is a bitmask of per-block flags V4L2_ISP_PARAMS_FL_* and
+ * driver-specific flags specified by the driver header.
+ */
+#define v4l2_isp_params_block_header v4l2_isp_block_header
+
+/**
+ * v4l2_isp_stats_block_header - V4L2 extensible statistics block header
+ *
+ * This structure represents the common part of all the ISP statistics blocks
+ * and is identical to :c:type:`v4l2_isp_block_header`.
+ *
+ * The @flags field is a bitmask of driver-specific flags specified by the
+ * driver header, as there is no generic flags for statistics.
+ */
+#define v4l2_isp_stats_block_header v4l2_isp_block_header
+
+/**
+ * struct v4l2_isp_buffer - V4L2 extensible buffer
+ * @version: The extensible buffer version (driver-specific)
+ * @data_size: The data effective size, excluding this header
+ * @data: The configuration or statistics data
+ *
+ * This structure contains ISP configuration parameters or ISP hardware
+ * statistics serialized into a data buffer. Each block is represented by a
+ * block-specific structure which contains a :c:type:`v4l2_isp_block_header`
+ * entry as first member.
+ *
+ * For a parameters block, userspace populates the @data buffer with
+ * configuration parameters for the blocks that it intends to configure.
+ * As a consequence, the data buffer effective size changes according to the
+ * number of ISP blocks that userspace intends to configure and is set by
+ * userspace in the @data_size field.
+ *
+ * For a statistics block, behavior is the same as for parameters, except that
+ * buffer is filled by the ISP driver.
+ *
+ * The buffer is versioned by the @version field to allow modifying
+ * and extending its definition. The writer shall populate the @version field
+ * to inform the reader about the version it intends to use. The reader will
+ * parse and handle the @data buffer according to the data layout specific to
+ * the indicated version and return an error if the desired version is not
  * supported.
  *
- * For each ISP block that userspace wants to configure, a block-specific
- * structure is appended to the @data buffer, one after the other without gaps
- * in between. Userspace shall populate the @data_size field with the effective
- * size, in bytes, of the @data buffer.
+ * For each ISP block, a block-specific structure is appended to the @data
+ * buffer, one after the other without gaps in between. The writer shall
+ * populate the @data_size field with the effective size, in bytes, of the
+ * @data buffer.
  */
-struct v4l2_isp_params_buffer {
+struct v4l2_isp_buffer {
 	__u32 version;
 	__u32 data_size;
 	__u8 data[] __counted_by(data_size);
 };
 
+/**
+ * v4l2_isp_params_buffer - V4L2 extensible parameters configuration
+ *
+ * This structure contains the configuration parameters of the ISP algorithms,
+ * serialized into a data buffer. It is identical to
+ * :c:type:`v4l2_isp_buffer`.
+ */
+#define v4l2_isp_params_buffer v4l2_isp_buffer
+
+/**
+ * v4l2_isp_stats_buffer - V4L2 extensible statistics buffer
+ *
+ * This structure contains the statistics data from the ISP hardware,
+ * serialized into a data buffer. It is identical to
+ * :c:type:`v4l2_isp_buffer`.
+ */
+#define v4l2_isp_stats_buffer v4l2_isp_buffer
+
 #endif /* _UAPI_V4L2_ISP_H_ */
-- 
2.51.0


