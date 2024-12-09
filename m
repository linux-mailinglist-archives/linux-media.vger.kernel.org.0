Return-Path: <linux-media+bounces-22848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 022269E8B11
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 06:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D53EB188432D
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 05:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E381C3F27;
	Mon,  9 Dec 2024 05:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="B1wL69bf"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021102.outbound.protection.outlook.com [40.107.42.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC861C1F37;
	Mon,  9 Dec 2024 05:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733722631; cv=fail; b=UU8SCZa2cJ8pZd4pI+C9U2f+6NZBCKJenJ2ezGn1ykLNmC0wJhsFMZLURf3SiF/D+VUgXHvGBf7zPTk058qcX4cZVs9E7syrLTolmSJJNDW3qdkW8kRjDE43tB4mHdgQ3fK3fxRA05TQ0zmY4OAX4LcS0iXUySzk1jPCKQgetfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733722631; c=relaxed/simple;
	bh=6Jo/sF+cOaN5tzi7stLcpLUnnPM1GRltVyH0XACHYdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FScnGCYeSCS+wbB3LLCs1vy3RAxBi80yqBcKzzfQ0jCa10JXs/wKqLlkcYzmAUKHKVraWWqB662YdKtzOBFUFXOpxcvOH806d8gfVw4CYdlbTT+B+CmxCVppmw1zLMbdHZDiiPDhVqkbKixfcoFsW4AYmTLjnDPaS1tBI4wIEx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=B1wL69bf; arc=fail smtp.client-ip=40.107.42.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFuCH4C2GzwtAtepqsGrlJu2uRYYNTxBlM3JaGkjTqD37SJcLkjSpIn1IXS54cUuJ0xz1v2rZRdny1UY4zxAjHV2djVLf4hDAJQDRwqry3g5GTBToO7K2dz7z07Fu+mjW2aDinkCAfe7YEhZoe/fPVYna/XbXsWoBtdmVTkfG5a9lKzYRrDjliLNEMxUHnpeFvHtAa0n1qSDgTbcENiDNgkhL7SfDhNzpvoF8lcwBc0SdteRkGhpyPFXC99eCSxdawF4QZ/jbygOSMGkv2biaLAfnS1SkjUJEPzx0GdO0TL7eA4eonhHPX/zMHgEct+JbTbfLVRQatlTp5GeFRUiVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjPtAm/hRnUMCrkhdL3i4MNXAHVNv8jzN/M99OmObOE=;
 b=abel6yE/iensB4WyGQOJTAbY2ChKJnI66plXXlplaNIRVUuDxCexQJow+WrnrNivXMMlKFB0Od59wP7ZV0ji9as1JrqzhF+iILryPUnSkNhwJcGFtPAQSaVZ/1yOcJB/kU2Jngm+pth9aF/oRUe8cjHSr4DBAkRJYjKM4t/znmVGE261iUujSdPfI3vp5yswZqW2Cu3bNh8jbwmL3CbpR7CjjyT/7k8+4PFOJjm1F422CiZzzjp6ieU0cBCXYRufdaCz8PM0pROSMNv+0OpgG+j2+t+F5LryhlsLQ1MOKNxd6AxuyRRAHHwGtkobPxqCyBK8djs31u27NdnDSqL2jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjPtAm/hRnUMCrkhdL3i4MNXAHVNv8jzN/M99OmObOE=;
 b=B1wL69bf6QyzVaBSaun1hKNzYVvYjiqfciepdNkiML8Y1Bo1WGHeWHRNmC5NKvp2HBSzbJkI0w19olvCdBB1QgROq6pEY820i6q6o4XbI1TO56us3OaKQnQiq3JI4K0teiGkaryZvgf0zrVfViMDllMM98iuz2Xy+WyclV270bU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB1966.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.18; Mon, 9 Dec 2024 05:37:04 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 05:37:04 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	sebastian.fricke@collabora.com,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com,
	dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v1 1/5] media: chips-media: wave5: Fix to display gray color on screen
Date: Mon,  9 Dec 2024 14:36:50 +0900
Message-Id: <20241209053654.52-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209053654.52-1-jackson.lee@chipsnmedia.com>
References: <20241209053654.52-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0219.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::18) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE2P216MB1966:EE_
X-MS-Office365-Filtering-Correlation-Id: ae8854eb-20a1-4aa7-7b15-08dd18138358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8Tlr7JqpuoZAo2qbKkzGs1BJKzrG4dOjRREqtXoY+LNHHEsKbpjV805zJfBK?=
 =?us-ascii?Q?P7TlJBc9fRNUwWVkw8IWqpAENmp2Z5efQ6FKpSFA91gPZYHvZPGtHjO79njs?=
 =?us-ascii?Q?y9UJd2NnT7zxzQJecpSSi5uZsa3QH7/TTv0xJ9Qrz4VpsRrh6hRgZZpfpbES?=
 =?us-ascii?Q?dw+Zao1W+TylXf9/cWmAQV+wV9RAapi3pM+BEV+Ag4CLWjCnP/ThQFr0rzxe?=
 =?us-ascii?Q?u5TIOJoihlpu2pY55eTsE4NBqHByMd9NHVThqb7ac0N6Ea4IF+LYh79piAdD?=
 =?us-ascii?Q?3Djq4iULbl5l+hqiGi6q6F67NbHW6UPxIxmhmtNtTd0MQTZHm5aFrpt2LJ7V?=
 =?us-ascii?Q?M8P4DBk9oWlx12tWzG9tjvmpKx/AA/x2eKT3sGRwa5q6YUfcNXXHC2DWGIQD?=
 =?us-ascii?Q?gwxETFq3y2IvK8ljnuhoa1A1z2IF1hXDc6mEaIXOmx1KZNSShiGtYrAwCAUU?=
 =?us-ascii?Q?WTimomlWBZ4t7I3RKfLfbmN+Xs3gk4M6cgi6apl/XSJ6R9NBC5sYam1Yoi5M?=
 =?us-ascii?Q?V+pbAsrxCrhrhchrMkVdRBlPM+kPE6m/reyyrLtvVCswcUUtHGkJcQIGuEsv?=
 =?us-ascii?Q?0fHbrqeqhSSUge1vb5ReBE8VizOpuct3VMISTX+NaQA0QIcQenuszrDMgarl?=
 =?us-ascii?Q?2IgblYkt/cOmbJAv9l5zQk6c5iK8q+henr6dDcxVdGXL5XtUfYWRHfl8Vt4o?=
 =?us-ascii?Q?0aunTjjaILSQ6C+M4kVDGIgUDryburFAIWxvRxY1J6954gsdU4O7qoB5/Rr5?=
 =?us-ascii?Q?1tWiCFYDepzhrJm1nxjWlh5F5A9tU1SfOcg9npeIi8FaYt2bhdy3Ga+AMJQz?=
 =?us-ascii?Q?13XSCJq6K43WLXjB6u1VGEl0Uc1vsRl9pv8eogprb4v40HOtihN8toZKnj5s?=
 =?us-ascii?Q?UXEao3ekDpzvMsAXevvThW3Ni/Unc/wqx9Uh1JxpPc80FSGi1uCauBwYWSkd?=
 =?us-ascii?Q?ZzZw7q05nHUBAg2JLbofmN3BRnxVXM7G1zKbKMOxj26GRWxQwm+ovTorfmQC?=
 =?us-ascii?Q?PR35qR2h4i77V2gTE3FgAjvmCBa7n2jwQKrxGlvC/apzuV0GfzQJdSSQhULR?=
 =?us-ascii?Q?DC5ADbIzbnj9KFSUYElU++WTbEEcbjXQwIp5y0nehJwsNLKwxSIIYlHsRFhc?=
 =?us-ascii?Q?dwjjzKyQTo2lPg/h0gN0bmO8NGBezKY8pL0Ep5ug+zzwFFamJL4jQMQbaYS7?=
 =?us-ascii?Q?QIRNkrthgjbAOWIJ422CnNPbpw16QbyDvAkko7Uf8x0S/u2sHb9pbcac7rRT?=
 =?us-ascii?Q?Y3qkypivDZHnSdZNV5aFCyx/oa8WErNb0JL8NkpN9MmjFStahU0rIrotH97U?=
 =?us-ascii?Q?8i6Ph6sMjwR3UI483hGO6ou17aHfhhH0sbyNxvXK9fvZcpU8TEtgkGnXJ0fM?=
 =?us-ascii?Q?mySH1qEW+W3cK8DeSiq0ESJNlr3mKdVfXbyLJ7Cm/q8X98iWpQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z7eXsaHIcTnhXLG34c3J+C5an9t1SHjyd489xMoJWGzHBPRwZFvBmw/geiTT?=
 =?us-ascii?Q?+X7hkf1aC5EBHPTEtLE04DATAcAzosJ5jhKsHl527t/t1vAwMOPOoBfsAD7S?=
 =?us-ascii?Q?2fq/AvwXhkT3ZEthdFBDfHfRlFbVQYZA7VuAsK4wNdf0BA3AsRy1AZtyFLL1?=
 =?us-ascii?Q?/GUO3cdv6enewwiK9ryw6VjxFj9gMhqXdymNUl9ifxb8V3iFZO7djgESbDwI?=
 =?us-ascii?Q?FgJkQqMeQTB6P/kpnJzfR6Bm4LDlTbht9RpDP2HD/9qsnehBJxnZAEsu0Kgw?=
 =?us-ascii?Q?D3LpS4heW9GxAnW87szbxjT2Bs43b6Dw2DUywYcmYq5RuFyMZtppfxOkEI7t?=
 =?us-ascii?Q?7upTEMwO4TMfDeTgdj/Borw67+9fOftwsFnSEdnpjSc0KEKqm+GvTV4N0pPM?=
 =?us-ascii?Q?VVXzPdgRZyNUoFHvIMDyQpEy0KWsL+FkcIKSWK5ZbGuWmYKM4I5XWEFSLtfr?=
 =?us-ascii?Q?43R47F0/QASCnnhuPRmo8JXgye2SLb5AiQ7EYjvXBTIVBJ6mzZMcj8YPELYT?=
 =?us-ascii?Q?No+/4cAn1t2I6uDOnMUTbHiDGcaKBOI4jlr05FUu7oSRs122ZrHdZK0B/jMv?=
 =?us-ascii?Q?XvbNJ6hn6DAgtRHCzjYKZEQ5N6tL3+zOF02Yno8eO0jgtlel3A0azvNywvhT?=
 =?us-ascii?Q?i5T61ZBq+p/wY8eLIowdJH4hb9xpNaeIfJua0BQCDnsqWEiO62sHEdoHaldw?=
 =?us-ascii?Q?zpruV9xM5XWolFM7ShOrThNKAwN43+pSCDN37PgkrEdNZ1m3ZU8T3xmp0b1A?=
 =?us-ascii?Q?wHQ+DRD7+9iVyphiApJKwkuhi1z7ZTHW+TZk32XY/SC0H8+JNfPMlS72UZ//?=
 =?us-ascii?Q?84rztZdqqR5BcsfYd/D9D35mwRYKSHamJYTsqZw8FroAsuONnu8Tdzbbho6I?=
 =?us-ascii?Q?Oz6oCtDt/82ktGulxeCeQYHMX1J4JzMQjwREHoQFoxoqvaFXTIL8AfXseXfB?=
 =?us-ascii?Q?QVxYyvnKQlYH7A0HEHelJudcslZ5lQau2PVNPPQMeICI9O0HLXubLisWfUin?=
 =?us-ascii?Q?RkPPhD4Cu18OMEsm8LnMsrBtGZvtLgsN1kUL3wa/hFDBJw8jRlyoitTKF/DD?=
 =?us-ascii?Q?4ZA/ec9+enjKtju1+oKMWH7GOSBLyg7ZI+C/6I5BlwEcgf2KxasQskLeFj8G?=
 =?us-ascii?Q?4k9VSYGdFRmas3d1maNL0nNEgQYmya3W1+gRLQoZ1Leo91MtUSUFgYLaaLbk?=
 =?us-ascii?Q?/stzrU9LfD+2RIy75sTg6gacvhaCgdGXqd94t/scbQOoQBC0+OzXSqNhPQoU?=
 =?us-ascii?Q?dQBY1PykbZIi96EmD24inI3qWx6TBLEU5ssQ9gVeuUUKHN1U5h0VEYQoQ8n4?=
 =?us-ascii?Q?vcFYYjLW/9WSbulErw3m4OfYGAfZVdyvN4JU7ph2ncbUSWKHbVfy9Esytra6?=
 =?us-ascii?Q?YB+FfWVLWT93nh40l/oWIwS6NZzU/50rCtgyvgMOREC82Xo/DARyG6ddcU48?=
 =?us-ascii?Q?lZx1E2KdV6OYD2EMx8ABxUzWKQoNO013qXRJ0/hLA2j8DUYhJdeTbP2U+5Fc?=
 =?us-ascii?Q?ArbFoTTfsbc4dRv5tzoU++XGHC/7vhQXnhU9znmIewv1XH1q/41y5nrZwXFA?=
 =?us-ascii?Q?OoaSiU8BDvvz08K6BNqBb2IQ8WzmInyRA8XsLUnw1QnN5PhFG0GDszz3t+EC?=
 =?us-ascii?Q?6A=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8854eb-20a1-4aa7-7b15-08dd18138358
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 05:37:04.4729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6fcrpHoU9zAFJQ7LGfB+sZ4a94k9bJNNN4JgV0q//1RROHk84RB2T98pIx9DUKIspMUQNvksURutgTXqENaiWbY2HN8iuzhACKyrlurAzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1966

When a decoder instance is created, W5_CMD_ERR_CONCEAL register should be
initialized to 0. If not set to 0, gray color can occasionally be displayed
on screen while decoding.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index c8a905994109..d94cf84c3ee5 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -585,7 +585,7 @@ int wave5_vpu_build_up_dec_param(struct vpu_instance *inst,
 		vpu_write_reg(inst->dev, W5_CMD_NUM_CQ_DEPTH_M1,
 			      WAVE521_COMMAND_QUEUE_DEPTH - 1);
 	}
-
+	vpu_write_reg(inst->dev, W5_CMD_ERR_CONCEAL, 0);
 	ret = send_firmware_command(inst, W5_CREATE_INSTANCE, true, NULL, NULL);
 	if (ret) {
 		wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_work);
-- 
2.43.0


