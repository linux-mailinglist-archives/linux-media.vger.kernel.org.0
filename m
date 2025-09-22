Return-Path: <linux-media+bounces-42884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57407B8F0DF
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 07:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A2861796D5
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 05:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952DF2EE5F0;
	Mon, 22 Sep 2025 05:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="OxFnKOhK"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022089.outbound.protection.outlook.com [40.107.43.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02452D5426;
	Mon, 22 Sep 2025 05:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758520400; cv=fail; b=XjfnzsnosvoAO9Qk1aCN/4sm5xZly7Y8ogkzGwMAPzxZgaga2WF7Zzy/lnykeskZXlpvjsIJtP4vgsvyZt7W4HfL3iUqS/fZiS7PwIqZVNnYmOK6CYgV8kw/Vf2xAfOL+QPbRKwwNzF2+6yl0bjQqE8jeQ7Z6P5c0Vx3Pan0Gqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758520400; c=relaxed/simple;
	bh=RQl0JPIm4DXUGoKD8Lqny40Lyo2ZsPsKTEgg1XnRB40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=twGEMDdZ0Yz2u4y9keSj9PvhDgDNS3VqrRksUfyPHip0qg8Dt6i4HQvR2v4fQ1jNKZK9sps1DhNpXIxycfhwjb+7ISx+DDedpO1EoS8Ps41ld5AU/2c6HH8zZ0n4XDj1br1A/dC6zJGHjIJMIFhW+N/6WfiT6LqWDf0eCUmKp6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=OxFnKOhK; arc=fail smtp.client-ip=40.107.43.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMV3TsrGH/PW+mom/UHwgtOelrG4MSV3L+6G5fVhn19ODgi/aGuKMKPPgOMZ59Pvt8nT19MDmpxAZnmNObgGNNGRPdDunj1bLNJIIQxiXpr2qKaXcPgsZAY7rpB+BILgMBbbmtyqwEPO813+MY5szG3EXTJxxFuHbPExXyf2QtB1sgfphyWXXA9N7/Eo5HJ+9Mc9wZ5GWNCTGrIJLqJkdtYbn8o5mXnMFkUA+KAfxhUGu/oUk9aCQDeM8EY5JnJmkFXl90W0flC+ejoT/LInf/q42YCyuAtoCsGsSgUyOtFm0ba4laeBfuybpdr8X95oyrFVbczWHkKP65PjcXpwyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qej6knGnE79bS40DsnYcieU0Sr87uDS+XRcLsEF7Rg=;
 b=WwJLIGkd0ybs1HyBMy527hJLGmPI/sk+PSbRfgvksUJ2/4ud2L2Jdns2qX4bdbhu03MHBAby5f7iiHYUnXQsvl8BCRh3zxCXgu7+aXFcnNnKgnY4BgZlKB+HRgmKfFO/TTQ9ldkl621H6GQ84EiOQPwpZZoUzA6T2t/LlsK/q19esRD865lIhWVcwL8kkaGGbAE9yG8MShRu5e3pY+KzKRRrqeXXFy6D9EJEDAKwVZQ6SW6sxEXPCBsQue7LtGNhHUa9Cj430N9mg7NPzgEyOOrfodYqZwrHNYYNLedRleJeRdp8wqGSFNPx8oYkAwxQCqt+VUxx4BDIDJhE8mDf3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qej6knGnE79bS40DsnYcieU0Sr87uDS+XRcLsEF7Rg=;
 b=OxFnKOhKfi2BfvbVCLPVRbjRxr7x27AO1j6089H+vRO0XUTtDfgUaY5DS3h6i8p+V1b8J8+diKgzL+ywBX6lmQ3AIgYHVrW0Sd3N+YZ4ynZi4Jcl6LBtSA6plj4UqEe04YJHhUd98YXt42NuTs0VKNVKcdIwQ+iFf79yBq9sAHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::14)
 by SE2P216MB3024.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 05:53:07 +0000
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d]) by PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d%4]) with mapi id 15.20.9137.017; Mon, 22 Sep 2025
 05:53:07 +0000
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
Subject: [PATCH v5 3/4] media: chips-media: wave5: Add WARN_ON to check if dec_output_info is NULL
Date: Mon, 22 Sep 2025 14:52:54 +0900
Message-Id: <20250922055255.116-4-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922055255.116-1-jackson.lee@chipsnmedia.com>
References: <20250922055255.116-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::23) To PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:72::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PU4P216MB1149:EE_|SE2P216MB3024:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e6722a-1d0e-4970-2fea-08ddf99c4dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tqeVcXHsC35eJibup4iWmPoYhlLq5mweRCgMY/cyTIaZhtn49FX4ZlYj854t?=
 =?us-ascii?Q?OQBr/zmmpJIUw74RO4aRWz8vJ4485PX+BExFW0hJgs0bDOVYB+BhRz3GovIx?=
 =?us-ascii?Q?tMgvMiM0tRs6q8TdFHQI8nfQ5ZriQvJ2H6xLLkDUUKqxH+hlkx9PP0TZfvx8?=
 =?us-ascii?Q?TsQpZlFIWTwRDQ0xbpvkmIGWrej03TpBlJXoheePfi9U+gY20CHeQ+rBJajd?=
 =?us-ascii?Q?Z1w7fG0MZ/bVLw4R+LliQmbUBMgIAXDGcsqWeypyV00nlC+fn5o2AzCYR7hG?=
 =?us-ascii?Q?5LAJEcbpjyxsXBIpl1vAM5eiS5Qy6ayvtwRJY6gkl5CBao33LfjdHEGyJp+0?=
 =?us-ascii?Q?27fgD8aHBs4PwouI+atpqyct/RRN2fIBXNmf7Bv6eY6HAJJv54veyTjaTxfH?=
 =?us-ascii?Q?bJSJKr9r3lnm6Zmmt+5kcVw4ZDkkgnolX8drMkwqI5f9UIOGivtsl1iZvvxy?=
 =?us-ascii?Q?z7xS1LVSQu3YxCLqLYzr0wsAskAWlHDTF8k1mzzZYWVU2QK/40nzgAgbUdm2?=
 =?us-ascii?Q?mG+wbPNKFqGFy8AECxA0kKsxoCwI1gqtoQamYbAqoUBv9qfJp4wAZ8CJn494?=
 =?us-ascii?Q?gb6kvVzDhj4yw0tM37ryT8qL9EUaKoZXkGkXHq/30p0UQz2ReFKfBI6eyrNQ?=
 =?us-ascii?Q?qfuf2IBzE/g0E+KNEXComuGwR/c2yOHtoQbPAsmJqoqafpXExb4nKYuiRipr?=
 =?us-ascii?Q?5v/gKscCsMzMDPXQCoTa8Oqj7TfdodurADpLWaYK/d86H+kw2gqwYP46xfX2?=
 =?us-ascii?Q?W/Jvlgyi7QD24KCc/QrxtcwjRD95oIFYCQObjlOOpg/yUt+621OoI/8Aa4Jo?=
 =?us-ascii?Q?l7t8hd2e3Lb5DCzECPqGUezMahhmMpeWVNZDii/6sTFKX5znHODuiYsi3g1e?=
 =?us-ascii?Q?N/rVYWH5N6BdO/1IekMhD5ot87yXEEhHn6nUu4itx40spWcgi/gYyCMf3eyb?=
 =?us-ascii?Q?SQB9jmSJ8ve5mh2Qb7f51zV2dgosOOLKMgWlDioF7rPLFUyk3gDvNJdLBevZ?=
 =?us-ascii?Q?KXeMshr0ljkEfj/KJdTCD/RJOf/o2GJvqTU1df3e9D07nUe9XfkTSP5CXbbt?=
 =?us-ascii?Q?6VKbX4HLavk1+HzgqtCQ735rLeezvp1Nlit1NQtHe4CiG4l9P+AjFCSX2eDp?=
 =?us-ascii?Q?1GRtFeThMAlmZQSU9MOBthyee+XsoBzKGXgjwC5JclxeBA3sKK30vLD2wJeS?=
 =?us-ascii?Q?l0xojnHuM3jJywti1lwD+Kn3/82SpscwjUI9YWk1hbNvyYrG6l78H30fKtWQ?=
 =?us-ascii?Q?wkhNUHEST7IGcFOAOsBqqhzzCkCZjCCKbpkBMq/o/ci9dH4AjOgjqo9QpqiC?=
 =?us-ascii?Q?klbqHWTNsxfDhOZImDJFp1agGkQiCPiiPWdDChsP3+0CkBcuUWP3ZAE63eh1?=
 =?us-ascii?Q?GqefV2EhXFctxxnW9Ds2uzA6/z0hXT2G/R6ey7m5sU9qWdrbcqx8Q2rBlBkh?=
 =?us-ascii?Q?COW0NzRsIRhvU4AsPKi3WLMTphY5YtV+lFzGdDL63JCwfTSChv50sQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1149.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T9CoSPhsHR3Gcg4qwMrS5yHIeeN+5ctVfg/WRGr2MUNWTEwAoGg0WVd4vTgs?=
 =?us-ascii?Q?ITD147DqKWTDsfARg7vIgGIgvOIlKdaM9BaQjw6XR3Qd+oT3GFv0Oc5tOw29?=
 =?us-ascii?Q?SWu+26qA3L53N9TWQQFY/cbfjjKrWTWn4Z7My1KX22OrSRFdjSGfJmu/vFlU?=
 =?us-ascii?Q?pV8Kp/paj3SIudl1SDOFL4z89SH+5ve/nOZajllci3IiaCtPG6UewitlNRRd?=
 =?us-ascii?Q?AesS0ZdRP35b4fwP4UkHjmiZr34bsKX+r6peD2Hla3xZsAqPpCM3HkheDqRt?=
 =?us-ascii?Q?XbuJmn3FCmpD/eTT2CGeSA5WhzcvcGPzeLOty5Q56ZZpEfMQXRbRw3JLfI8o?=
 =?us-ascii?Q?gV8sEUAORKEx9d6fqV8SHvgwIEkmD8EulYUySqBtTo19pECVr0IwfN8GDd/N?=
 =?us-ascii?Q?4BH2LcGP5YYJbJBpXExEYwpSI30vq4qWOmNg+tVyMsHvWG1HPaGJXjp/IKmp?=
 =?us-ascii?Q?ntzbWJ0UlzG5Xs53x/VslyDBM8n3W8UOJESsBSLv+VQgazMXswxOI6bwmai8?=
 =?us-ascii?Q?xJFMKClhGSSzfEiQ7IiP8wU0c7OvVMtvPHSCJg8dnoswjMFaa3KmhM1S6vM+?=
 =?us-ascii?Q?u5DCflxLBRILbqy9tYH7IblWRbDtJ5o6wXifGH0RXdFMQtmECdoZ8kX9U6+U?=
 =?us-ascii?Q?J3HO7JXiBpSUmKd971fJK8B+NOuz8F5ZPp1yFiBlbVXoDArMWJOMvuVS5wso?=
 =?us-ascii?Q?enHj1UuVGey/nRamRrHatPBoe/SxRmf5azxXHIuGWra3OLP9cpLnNUWQuLti?=
 =?us-ascii?Q?VOW86tps1ucKYWWH2ZOOaLm+tfrdmU4ha93iD2S+SZcXHOi1lpMi5I7osfoE?=
 =?us-ascii?Q?6+LvmGmZ45bYzfZU4H/WFLkDbXcJ/TgvM1uaC4+Qj7XCxdEwnw7ZpnXpL+XM?=
 =?us-ascii?Q?YBWkkZR08yWbUVr4sTMmXahGBY9obPqXNYt7DkfB9DNKAaBJKDMCkfbitZfh?=
 =?us-ascii?Q?GIYfkIBC9zpbvaVN+PfitnHJp7ef85VRkjLK9oF9ye5MyUWSrGrTB8luWntu?=
 =?us-ascii?Q?LBL5judpuF+GhDJ3IdfQqeWZ5k8X6Tw8iGnbFjCQ/2RHDuXQDhsunIzQGo3c?=
 =?us-ascii?Q?dD5CJnbW6bNxu1bElRUPvzT5Z2y2GVWN5GlWJb2rNC/E55aRBCNvrMb1ClaA?=
 =?us-ascii?Q?mUWPz9md1X3EMC1Uhm16mZVGSpmu74Qm0b6WGrydItDaBpB82dc13JCrFzxP?=
 =?us-ascii?Q?IVB9q65ssU4PMJ60KtvMZBJU6L8NADj2FspuIbM4xyCgg78fyM60g7EXWXU0?=
 =?us-ascii?Q?zWfzFrlLo6tRVc9XCa6KZs4BWRme0r/GR+LHEocpn6CuvTZJ4kTCL6IRjlth?=
 =?us-ascii?Q?P721XcN6ib5KqWGsmzwC+alh5pW+EtNi36AZVcpXFoUrNeJUOEa1dbwHfIqu?=
 =?us-ascii?Q?402G6idXpUkK3voXfm1y9QY0jRHGaWAymZ/tFfqJRIuKw3EMO8aMCQ/bP6/H?=
 =?us-ascii?Q?UfStNSCTXjTZ0aiYU8aDaVeNCJ+a4O2lx8BNx10zViERUf866eWcI/wDThEJ?=
 =?us-ascii?Q?pbMvx2sspoXT5cPK+lIHfWDPdBOubdzULePdXaVUzmTG7t4ENSTityLBAKh5?=
 =?us-ascii?Q?wRvEoDPFoskqVJ95VjtZblG7mPBiPAk41z9VyjO2qFgPs6t291G9cMz8It58?=
 =?us-ascii?Q?fw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e6722a-1d0e-4970-2fea-08ddf99c4dce
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 05:53:07.4012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXj6yLegvxcjF4RxzSH2eZzSJGUHzUSMwfbmNCpN6vO9T3CrLlRoeQzxwq9y56ZuifHPYk8v24ovRsiwCB/ORMoc3HOItLuPyYLoJAYhVZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB3024

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The dec_output_info should not be a null pointer, WARN_ON around it to
indicates a driver issue.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index e94d6ebc9f81..5b10f9f49b9f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -485,7 +485,7 @@ int wave5_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_i
 	struct vpu_device *vpu_dev = inst->dev;
 	struct dec_output_info *disp_info;
 
-	if (!info)
+	if (WARN_ON(!info))
 		return -EINVAL;
 
 	p_dec_info = &inst->codec_info->dec_info;
-- 
2.43.0


