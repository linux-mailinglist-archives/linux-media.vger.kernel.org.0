Return-Path: <linux-media+bounces-27808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89394A563EF
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 947191898A7B
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 09:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1A920F06C;
	Fri,  7 Mar 2025 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="QrpCLw+y"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013008.outbound.protection.outlook.com [40.107.159.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96520DD7E;
	Fri,  7 Mar 2025 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339922; cv=fail; b=SiwAagPUkw2lfNgjEOhzsM7gxpby2oA6RAaIemAPRZ7WMggoVC+nCl1cQ2aV5LFHjycajMz7LjOLHZ0CkIJmLeH+jQaNUnQ5RsYOGzVVPFPxpNAIaMnm1VCO5kQZIEZ9A/WZ6q3G2UTrWJ23yeaKf4WtM3392NybPUY19HI8jjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339922; c=relaxed/simple;
	bh=LWDfWVIcAl8Q2HBS8LGe8GbPbwM3Z8KvBVKdsGXbT5I=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ln0gJ+bhyupEWcccihLeYF2R8BC1lbB4yWdcrhOqDmzV5V0rwZfAtF3r/CgKvLcroFYXobsnJatqFjxf8L6ahKss1zBmNXpNf5ARw47k6kF7c/Nbpiur6aCKEhf5tK8RqK3Rqu4/vNKaqdEgobu9EDX3Ql8C2IhqD1OQ8f8fFEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=QrpCLw+y; arc=fail smtp.client-ip=40.107.159.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXDwH8yosIypuyQujOr5qa96Joyh/a5SpNv/mVpqu5Y3CYlA9x+weI4QqTbVUmB+iWY+k9/oWNJ35CIHVp+nqBK8cWxz9ySuijaEKSv1E0hBW5jFRyHAqdOdlAaAfeklQD08KEIxwRqO2Y6ddLvtSeOFDTnornczVUnz6Fd6Pb3Ou9SKCNpf8lwTtlNWQEyinktpFf+VBFzFeKmYbrTF+fIEzDMDKX/pxg/gXLdloo5AI+0Sa4EMISIz3PIFk0Ui2yNGOzFPlaloyndX56ana51ZRS1gXiPnmvYsJp28XyQp8aUAQi17O3CvIhMQkPnt9/kCwHgM3PDua5RdZ4vl9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8Yxb3UfmpZp3dSZSi8/zV0DjgkB2hm0k0Vea3G4ND8=;
 b=zFJGbhXODy1OjbJHpNYCyIUQXQGqDxKr0OOe9rv2Ox6I+uurdSq4vCrPhpTCJAJUc4uLm1uTJ+vmzbzYXkuo5bl0Z8wvyP0NpInPR01qvD8Ag0hbqtGMBWHyiXW4BNkFEPR2qcmjMvR7LTK8q88GyUXW+nK/rm1jzd3pkISs3ccuka2SG+qkNzfojmGnJ6C0QuuicoC4mdwOE3RD55phLznn97YJTXws1FMAKg82uJ+Me5hrvBTHPQPEaFDz6EgD2dEJTlNKF2CTQIjY+P4/Qi2CnYYkT3HFqkZRyCaxsf1wWRRAH0w+oVDLHJKdBcfNXULESfUMh1DE4q47G8f+9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8Yxb3UfmpZp3dSZSi8/zV0DjgkB2hm0k0Vea3G4ND8=;
 b=QrpCLw+y2S/pGmdBD30IPDS1KglyJCc9HBxuRuPf2rCJuR+wRLvk4fJcE0dCDMw8gFfybX24uVNW90UtsRLqYpDhZH/jP5FAxF/y7S7GpFix4r2aEYOkTGZMxL8/vP0n2RCGFJNnCGt3mzlWyT7hQYz2rTLxzVtv4MzxLWlN5EalRB7JJRHf1YMbRy2aVrXfwbmjs0lbLQvI8fWjcmTWzB0sWqGtEKl3UO0Rc9JXOWHJAPPlWsCM+C3zNbkgeIe4OaIIWqqc1XVc3AUODQdGiYkkZPIiIvNYjprqDqinIbVJnSvlrVBSwCI2uBQRoQuS8Zaj6CaC3+9dp1LvpqF6Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by DU5PR03MB10443.eurprd03.prod.outlook.com (2603:10a6:10:529::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 09:31:53 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 09:31:51 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v4 0/6] MT9M114 driver bugfix and improvements
Date: Fri,  7 Mar 2025 10:31:34 +0100
Message-Id: <20250307093140.370061-1-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI0P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::13) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|DU5PR03MB10443:EE_
X-MS-Office365-Filtering-Correlation-Id: 494db3fa-d60c-4909-dae6-08dd5d5ae3fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?66tbeNL6i6hyWiQwucKkDhuyVjCXHJy2xpvqq/eYT5jFgebOr8c67AHMq410?=
 =?us-ascii?Q?ZxHFmzwT4umamf+1eCNcbUAaSSAhwpSnd1gYJO3ZOTuFcqwJhbyoKD+DcHdM?=
 =?us-ascii?Q?RVhbEq8f0163fitlz5nhQiR8VMGGm/ZR52hoVYwCkOYq6tybHm2QdDIV70bz?=
 =?us-ascii?Q?xTixp1DAzbb7VLBScvbo85aAvIjm+jv59EC38G+rXkT0P6K66mGYefg2X9FY?=
 =?us-ascii?Q?qt55RbGIMEhz94TFxlQ1Qbs5Vz2JQkTQ5JFj0YwTURMU0ZmWrfInvmWNPimy?=
 =?us-ascii?Q?9Vb1Mql5qdoh+wlgV877Mq1v5NcAWipDaTAmUnx/Qrz4C+9DrlDGnaf49vAY?=
 =?us-ascii?Q?kT0Xe8rDFrmey7088p/7Yl71zXVkbaLh4XmBJRWYBOELEF9bvspQbRW+bhRb?=
 =?us-ascii?Q?BuQuYSDLS7dQtfQRaGcheeVEjbY9WmgM46ls2QHzKFY5XM4s+YLLk36CCywN?=
 =?us-ascii?Q?lZ8Dl+RtPW4hFWg99vojVwuYatzEQZfrZ+7FHWc32C/rrTxg93PVlvrVaVmU?=
 =?us-ascii?Q?uD52cPCZRQLkV+dXM7nqGtR9ZX4bD+QMf4qlFjtRDc4ThCG3nwTdIWKJqX+p?=
 =?us-ascii?Q?WFpAOtYgs42N/wGWtyFQt8W5xlXzkwXIa0ssA3299Nsdj7C0bX/8G9J+HhNa?=
 =?us-ascii?Q?QfIdE6WPHlfzVL4V+SHmaTVDeFyXrh8i3NfFbVOet/VqmUafBvz5CMUQFYUV?=
 =?us-ascii?Q?Px+myQjlsFVZmYo6nTZp3cTe/14vKM1oCs5Aunk6tANRMf71NjioYutOfXqw?=
 =?us-ascii?Q?Z6JSrMz8IaAzxdB7DBa4qdD/H5anpMrYwfYvMiGYvAfQtoD5F3QBt6U6bGXf?=
 =?us-ascii?Q?89DSUKI6/O62sVHllvH9GWJRLEJcigV2J6tRDWgwLOr5Qtd3Ynet42P/Xw+x?=
 =?us-ascii?Q?lFCJqaM6PVQPoxhfFEiD+GP1s2BLNKfZxY5VOKGvci2grzOLOumRmSEqRwC0?=
 =?us-ascii?Q?3g0Cct96JV0tH4CrvQQ2QmfZFh4hoK43a4urmo6+RYBKMgMWL3omCEuyymeZ?=
 =?us-ascii?Q?owAbxDDvjYesTZ1Jkul97sv0rKEQxHOlf8LPk3X1MSUMYaCuixPhvq0qOwpE?=
 =?us-ascii?Q?AuNYPM5JlWLQxitmp5MKZfyb6KQLeHQMoI+1ABXceaYcLjkc9qF8cvvN+fRy?=
 =?us-ascii?Q?31T81J8Lih3nPXwG6lnjQz/mxKzlzu4xoUpNEFGhkpBEbLr3evqTaG+14CHn?=
 =?us-ascii?Q?/8ObqqG32mcop6NFmV04IqVRdY05EYiPJpPxrBjWkxorYnNJQYw/j1nPOFr+?=
 =?us-ascii?Q?wW1kbQmlLKD0J4flS8nGSeA4cSUnomto7R6scmb+Zg6xI+rMSshEPWkmvvuD?=
 =?us-ascii?Q?5Y26pD2pphB0q+LVfel8/r49S8iHr11tEo6FzNSV+ytXUjTzO+9s045bzu4n?=
 =?us-ascii?Q?Kke6q1oUTIoxYyI4z8qFHeWRNsi0lyZHyqlEO8NP5TcjYhpziveOsoADEkvo?=
 =?us-ascii?Q?LwK7GIUZG6NwpOtVlnFZVhtvM7XM86+L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?REFHjFGezyWzFFSsMbZnhubq3/5nzkqNB6Aa2AtLkpVvkBjyqYuIT9z9CX6k?=
 =?us-ascii?Q?olJMrsYzclqQcGJDNpw3SiqvzZYAGOssc3pyJbSahq5JRyCis35aR//4x3uk?=
 =?us-ascii?Q?lKpqqeVv4TaT2eVYD1xcaiTjezdus+GNYd5B2Syr/OBXBRd8qyMPhtmBI8C+?=
 =?us-ascii?Q?yUmM/it5z4lHPgjFnVjIKH3OqLxCM1VnWAjt3wK2morV74vDHEwOZCJgDtim?=
 =?us-ascii?Q?UlSU03u2uVyxVblPguAI7E6EQ1uQMc2SLyWbOtE2aLyvgedUKEtHoV4fM6bz?=
 =?us-ascii?Q?3dSNw05rFuLXRF7kGk1EUOy4qC6KMKMhzQ0+LbU4UJukOryAeOyj7yv38oNB?=
 =?us-ascii?Q?cktBUALroAv5boKv0JvbKJFH5oEGBWbFo+NGZIXfjwOBAByFxwm2Bd5b9lgJ?=
 =?us-ascii?Q?wuMVEhV5x1po1EcakG18/YB4qcXp5VPP750aDvcfqVmy/VZoxkPPDtZOJKLp?=
 =?us-ascii?Q?6zbf7rbTYuHaK4QAw9ew7C1QqREX/vY3MKWK9oyO0jwn+UaqhqTGayfxsJjl?=
 =?us-ascii?Q?BBqPt2eUGnPwvTmfZ9YdMP2dsAPbtokLj/baNIHVLH6mBGBBF/nGyiKjWqaB?=
 =?us-ascii?Q?ub3K/RYjBVzDK2/qP6u1wKt8ev9d3SczRr2Lj1ia5WdkDMGOcLPhe2X3qO10?=
 =?us-ascii?Q?KFSc7diNbjLo+hkmvHGYL5ZQCjKJf5mfOQTo7eGv9yRZzhqtkex+m1Sv3ubZ?=
 =?us-ascii?Q?zi763RXqyaVEAJ2Dcsd/GFP9SRggjn7TxYXmaM4ZmlcFiZ/idW7oROFdKV2J?=
 =?us-ascii?Q?HsjX3lVZueWOV1hxgLQgX8O13anBrjCe8r51PkOywNjsUqtU3MeeQg5A5bya?=
 =?us-ascii?Q?P/fWOKMNxNZUpSQ388W/9+ZTqcToILKkldFfobQOHy8V2/5/hc22Kt3XjiRL?=
 =?us-ascii?Q?9955iruoLUBhevHAfGwfuW1UuAaoMfoYD+6r051rA5khP6HkQZSaqhUwQYgu?=
 =?us-ascii?Q?/jfHaMWejW41RCKR8YwSOZ1EDb/ScMA8/NvJ0Csqbh5uf10pa9yClFdY5eUD?=
 =?us-ascii?Q?0mERiw/mbQ94/vN6/Ve/zDe9x/owBEvo+YnIyca/H8ObmTgV0vezuwTQh+Sz?=
 =?us-ascii?Q?7qh1KzwGDlxT0kN2X8JmkRBksT+B6tbqpwHtO19fNLq97TqKnLg1X2eaqOJe?=
 =?us-ascii?Q?/eCTCixb1sUIQhxs27KLT76O+7ElkBqoXz+gnV4MeWIj0KQzFFT/N6jNq+rH?=
 =?us-ascii?Q?f8yX8fJPd9RlgZnQsqZ3UEPYLDFcVVnu+TYuaxak6HE0Zqv4nTxwHcVIN21R?=
 =?us-ascii?Q?wnTADTiffO71Wfn2ZK3iFLe7t7AxQC3JCsNEtLt7B+B1QNO5gseNF+n1i8Nl?=
 =?us-ascii?Q?igv0M0UzTUi9ceG0v1As3M9ZHWW0ynTkJYteaJkARiqhPsU1dKz5/hQK+OHQ?=
 =?us-ascii?Q?HtbEnhzdSsZz25+RrwUF5EI7pKE9TT8Kwslm451ANjSNR0akrnVACvXNW3tw?=
 =?us-ascii?Q?7TzNr84ilkeOdDkFMRsCX7IkgVoMFwH/3xvZTNIrITg/hFIK8pdYlAb3GEXr?=
 =?us-ascii?Q?UfVYwJHbXwilDluJS53FMkFFihAHsIBlvk+t0puaDoHZ2bGvUdJslro7uGPH?=
 =?us-ascii?Q?Bjnq5+kSwPIiAdNeunN4ltiKYLWcHwuaUT0Atkx+?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 494db3fa-d60c-4909-dae6-08dd5d5ae3fc
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 09:31:51.1993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4YnfyjtingfPBtZUDRs0qypiUbxcCLl65HT5sump0fKV4vNHbFby+WGt7AfoGryZeXjKGQ0DZb4yo2q0lrN6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10443

Hi,

this patch series contains the following bugfix and improvements
for the MT9M114 camera driver:

Changelog:

v3 -> v4:
- Rename DT binding from "onnn,slew-rate" to "slew-rate" in PATCH 1 and 6 as
  requested in the review comment.

v2 -> v3:
- Dropped PATCH 2 ("media: mt9m114: Add get_mbus_config").
  Based on the comments, this issure won't be fixed in the MT9M114
  driver but in "imx-media-csi.c" in a separate patch.
- Renumbered patches accordingly.
- Fix the incomplete renaming of the DT property from 'pad-slew-rate'
  to 'onnn,slew-rate' in PATCH 1 and 6.
- Fix checkpatch formatting suggestions in PATCH 2 and 6.

v1 -> v2:
- Fix the subjects of the patches
- Dropped PATCH 1 ("Add bypass-pll DT-binding") as it can be automatically
  detected if the PLL should be bypassed.
- Renumbered patches accordingly
- Switch to uint32, add default value and clarify documentation in PATCH 1
- Add 'Fixes' and 'Cc' tags as suggested in PATCH 6

Link to v1 discussion:
https://lore.kernel.org/linux-media/20250226153929.274562-1-mathis.foerst@mt.com/
Link to v2 discussion:
https://lore.kernel.org/linux-media/20250304103647.34235-1-mathis.foerst@mt.com/
Link to v3 discussion:
https://lore.kernel.org/linux-media/20250305101453.708270-1-mathis.foerst@mt.com/


Bugfixes:
- Fix a deadlock when using the V4L2 pad-ops get/set_frame_interval

New Features:
- Bypass the internal PLL if EXTCLK matches the configured link_frequency
- Make the slew-rate of the output pads configurable via DT
- Allow to change the cropping configuration and the horizontal/vertical
  flipping while the sensor is in streaming state

Thanks,
Mathis


Mathis Foerst (6):
  media: dt-bindings: mt9m114: Add slew-rate DT-binding
  media: mt9m114: Bypass PLL if required
  media: mt9m114: Factor out mt9m114_configure_pa
  media: mt9m114: Allow set_selection while streaming
  media: mt9m114: Fix deadlock in get_frame_interval/set_frame_interval
  media: mt9m114: Set pad-slew-rate

 .../bindings/media/i2c/onnn,mt9m114.yaml      |   9 +
 drivers/media/i2c/mt9m114.c                   | 172 ++++++++++++------
 2 files changed, 130 insertions(+), 51 deletions(-)


base-commit: ac9c34d1e45a4c25174ced4fc0cfc33ff3ed08c7
-- 
2.34.1


