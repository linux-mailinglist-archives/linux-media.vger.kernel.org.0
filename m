Return-Path: <linux-media+bounces-30578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD63A94DC9
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 10:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 781283AF872
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 08:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB1620F07D;
	Mon, 21 Apr 2025 08:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P56vy/A+"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2085.outbound.protection.outlook.com [40.107.247.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46F713C3F6;
	Mon, 21 Apr 2025 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223226; cv=fail; b=l+iyPzkimE5OmGyP36R3sB0t9QF/Ru5S4nMlkNxNkIh6xCK+DAm/DwPgS59oaIeD7oBZp2iCxy2PAf5p/qLOfKx5bAbw/9uxkVNxoyhU73lyzm+LDmIBB69J6xiHc1eezeAs58sAYjTHKsCl6gbfsuaVXdLJMZthCndFfDCbo7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223226; c=relaxed/simple;
	bh=8n84jeLKe2MdedDA3xGCwlUnZ8+IilDAwsghpaNrpDM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Hsjh+OODB2mF4Gn1lUh/qzauWlD2puJ6LXXqJqWF3GHPKzhAdwMh6zioAMS/OZjSoXjKUdgEMsXYuAgKLF81s3vVQB0aaN6zYfG0QaAVlvo5YqFLa/QRLVH3g6A/81wrsWArISMvBFVcy+FSYy8I3LrKiBpNy/wyNv7O5wsri/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P56vy/A+; arc=fail smtp.client-ip=40.107.247.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ta//E4rzIMhx7kFqO+9542qnqem9WnFnZv7thRXlO7FjiHJu6dKhSKmN5gMmXuQnF93BHBjEcISmQIkK2Xlx03lDsCm2GNOu2mCdxGP44GlkuN9Rkokve4PhjaHGsVqzPpNHS/2V6v3+z+kP7folYPuPHaWUewHTt7HbbeDlieZmhwPbt4thQbMQ4/olz2Y+ctVlvKVLiqO9rpGFCrqCeVSGRzM5VqVJ5MOAUg/O76R+ANakPz0RmP7fJMTRmwuQYTbZu4DmxgWyB3/OxUd9b3Yof52/rztyyXbMDTfB2CysLXJ8sqq2JA2A+pt1o4G43iKMknJX1/znXli75K6RCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5Ha5zgeWUrRIF80hWw9NNYRNCPnCtHAb9HySZNR4Rc=;
 b=Ypc7B8+XXNJcMYDt/yKWrW3xSxFg1fWeMcAJZKMp6RmNHSOH1pkzZ3p3wqe0K/P+c5n0T3mo/RDTiJlBMHnuYrif1n8Nh4r9AptDcid5sf0fC8XAlzRiXOJ/MX3NxcITA3xvJKZFyfxCrl8v7XMu+ettukSRk752ksvNUeEmFiihpL3gH4LPH/fLvEJ1YmKoE5vXlejPHAby6c+cKA+dsSkk/6pA+QnRRNd1oxG5XtFrbYiX+f5Xhtn+EKSTEELnZU33rfh+FkgjJ9ZfqlQr8YotbzVosPED9tThQDZd7/gu4E5gf9ZZ8si6styePBL14l+3gHN/Jwk5wD80wK3T0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5Ha5zgeWUrRIF80hWw9NNYRNCPnCtHAb9HySZNR4Rc=;
 b=P56vy/A+fXqO5LiihRLg+X0AIDk40aWoYfvGjQIN6RKUxrwtuA6gnnZ3IsUUL5vk4FHMsQH3OJmbuBMA7yecK/f/C9s8D8P7cAEHMNKH5yx3zt4EsbGuVI13ucraoA9SlU+uv3aP5WwLKhhJr9UZaVTotUleJcDY/GUX6gYazdlTSg/2lwzu+qdx92Ge3eoEtJyLTuaONNc1azv7MDSk9Z1ThD/YvJCoLlg5AtjMVr5htCCPDrvgafKuRrKS3I5z6WApHFAvHojMicUN74axn1IzjVPkTKvPIRpmgJ1AnBSte1FexZ0EeS3WDBbdaH7FUoIS7R8YloZWnSjMNbrHVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM9PR04MB8571.eurprd04.prod.outlook.com (2603:10a6:20b:436::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Mon, 21 Apr
 2025 08:13:38 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 08:13:38 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 0/5] media: imx-jpeg: Fix some motion-jpeg decoding issues
Date: Mon, 21 Apr 2025 16:12:51 +0800
Message-ID: <20250421081301.1304-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM9PR04MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 60cbf449-a004-4bdd-495f-08dd80ac6b9c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JMyJo5Plp2kIIfQoQu8hyeKvT8ulYyiS8p3OjtIY3Kepqq95hLkF8dug2WB5?=
 =?us-ascii?Q?tfkUg2ijTFt2qOzgpT3Pq3CNExoYIiMAvcYnBcGRpQ7gLQhGDZg8nyWFB8h+?=
 =?us-ascii?Q?OGW8aZWjAd7rTbUXB9I0F+2kzHPHNLsxWVgrb5Z/HlI3yzuLBIJpHtIcu/er?=
 =?us-ascii?Q?v5Dz+jda2nlCWfMMD4hQu/f8u3fJB7DhZ9kOMXN4s4GotC36luzpMIrwuzos?=
 =?us-ascii?Q?i+udLc73AhhPn7KA55F3kQcJfzoQxQoHZYZTFfK50BwWEoNaVp8NqdqAH1eG?=
 =?us-ascii?Q?Q4sW7bKPSrxuxzZd0WNMnrpMOMnS9mCizEsEOLdC0bomzQMUzem7BM+imz+T?=
 =?us-ascii?Q?Vl/2aPrFqEqEIXkivdRBWyRQdzWcAnkNh1n2XM61n7NBFZ615cE4FnMf6wfo?=
 =?us-ascii?Q?1pnvwrbuqCIV7RgPYqeTFlxRDlxJFGz0jIzcz9I1TDM2+zZeSDe4ougaE2x/?=
 =?us-ascii?Q?FRBSJdJDeptgAovXZ6kyhs9VXkN0Dh36lf/YvrQ1h85VgNlRzNFs7Spnzhpk?=
 =?us-ascii?Q?MuuujdDtDhrpnJ6GjuX6tgWX8F88V6sOwSASPYZTgSlkPr4YmoP+Wn0r8mz5?=
 =?us-ascii?Q?n8oxHFLqGguYuLU4Rzm+GeTgzc8e946atgeg2Y/xlgIwrSANVa7o982R+PJ/?=
 =?us-ascii?Q?J/2AYEpSzY+LRQnzz18w1P1+iVaGdR2CB0ducpIb88WtXn4MXp38kXWuT524?=
 =?us-ascii?Q?9FRkD/n+tnhxbw6nON7mkH+yNZWgLCBsQfa40HLzAc+XQBEFefLD9sK6dzft?=
 =?us-ascii?Q?3BQ3sEonE4q7cqRPR2ZV6B8s9d6/cMLcvHxtMbbDMoJGl05cmZNukfK/GUq9?=
 =?us-ascii?Q?I7VhJqZwnIm7wZd2dD47Mn/9Fwt/f/m4aGbk+tmli1RWjijeNv535tJ4DXFM?=
 =?us-ascii?Q?T/uttfsXmTHMtiUj8QuxiviD8v1jf80LRnnIQ1A6+CGpvucg+SG9+BR1JQeM?=
 =?us-ascii?Q?iK7sagu8AT6odKjOgijCwfVQl3kTwvu5AkloNfQC06ywYgs1Te2TEq8Qd9FN?=
 =?us-ascii?Q?O+1CngBX25ZAVRZXtbFbJIvDCSehbjoyfyhmkQerAwx6+R9loNPCRYiRFxoJ?=
 =?us-ascii?Q?kum4FAPTdq+LIB1PaozYn+ZjGq+aVJU/0l514H2C/SBS6oDL1/Zf/x5lBOJT?=
 =?us-ascii?Q?ICPGglegTtuc77wnPyu1m3AeyN7A4+3zPQ+ctSUPkZwtoRLoQe4WPKGYzJmg?=
 =?us-ascii?Q?RK26cimar2RzYTcuN3DnLd1hDegjiQ8fxdFj1644XUCd15+e+5+YMTaxrDHa?=
 =?us-ascii?Q?WwrdqpToAAcWM9ukRCfTH7iqZc3FmBvOfvG3HY404f2jjviySRO6lYgKmESW?=
 =?us-ascii?Q?wVLpHrmGAe7HTeAkPW7eKv7n28Pd8VGrhHTE0fx07fNTs2ZrBj2TvCi2aX1Z?=
 =?us-ascii?Q?A+T5nNg47HqDdx+A5mrKP3xUjjYHefPSxc8EupR8n0PGu5AHncv9+4z1Xht6?=
 =?us-ascii?Q?26CmIzXhwXcdDXnPUQuoXhuvHn/FOJHsncZp00Tir5jkGnqANZXCHw/XRcc6?=
 =?us-ascii?Q?tjwzE0ptXLp/jIY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QAHM1hVv19PL7eoVf7R7u9d8FG24dLGZGdlDRUAH0luK3NP5YeV3oQx0sHm2?=
 =?us-ascii?Q?yjMxeZr07+g1GEH5qyAB+xtfyXO4h0U2jvv6IV6vQDrzt8RnxfSFX4nATxCq?=
 =?us-ascii?Q?Gha6Q2Cy8+e+zI0+Eg+s0JIiJUTKNzrKbOFqGFNwHoU/VhDSOvzu5ueaASQZ?=
 =?us-ascii?Q?fMHzHOCdaTtiW044nFDNkfkmnZYJiLeWFoNHztu5cqj0S55wRdDS+KphAjgp?=
 =?us-ascii?Q?RrG+RSvR4ElVuxT7Zy4D+xAJPiX96Y5Ryh8NBuTybg3aCCITg+hqtQ91y/Ke?=
 =?us-ascii?Q?Vk+qI8hmCdpV2wm2zb5rx6ZUCYlTRm3oWERDaB8BlFcZCdwvnRAtjGeRt7WX?=
 =?us-ascii?Q?ZDf7CEn3bYZ/EVj//MdAjc7+oDvJEtE8Oql7/ZpqTYoP9I6i7K6/bLckEW51?=
 =?us-ascii?Q?NSJbrJ2sM4/Q7+qxj/W8f/FrBGuIXJDrWxwAvHgMHaA/Q7uaoaFm5CLtXIVn?=
 =?us-ascii?Q?0zH0/uW5fC0//2ODsTxOFb3NIFLKQR4cx6LsEDQzgcgRzvcUfU96/8aXEjJb?=
 =?us-ascii?Q?L02jGE86GUY9P77d0FE1/WoA0CMHVtp+cf3f6i4rG3+qQl7r1RXCAAIwFNNt?=
 =?us-ascii?Q?7mf40NcC3qnYgkhorJyGa8DUo3K9q/hKJCWTSCDghic7beCgdYsi9PdgWuTZ?=
 =?us-ascii?Q?kNnwpX4dfVvjQ6rZT6+GsG+hHMljbbF4MqbKQP6/6snTZRtVll8VoBfyeLJY?=
 =?us-ascii?Q?aeevmoVvTCNOmD+rJzldFjwUBuR3qMzhEPh2AnxtLz2BL2FmXut9JiYzq2Ew?=
 =?us-ascii?Q?b/ERyZtZ0w9hWkADEqeIrrmKX62Su8RdCWMFSSD03RE++x9v5MwJPdeAVZi4?=
 =?us-ascii?Q?O6Kod+ewdb7vUU+SJvdamRrjqJG2UU7/X3RbDGn4+uGK0MMeQHhOKhpKDXpK?=
 =?us-ascii?Q?lvo+IvPp21GoCEwOaPoUJh3/A0FSlwHEUx+Kq2qJaXMfDe0OvgZPxtxuiWoS?=
 =?us-ascii?Q?zJrvNd4uccnYBsCPuCmhkz2wttUliSno8qBQf0QGCsK7/ZyZswJbFLtmR+5c?=
 =?us-ascii?Q?5P09IAOFOWMdCU82/8bo4h7diHsPLYhrMPhsBiLTVePxMb142XKM50z9gCgT?=
 =?us-ascii?Q?Lr+sPYYbf+gBflvXVqji6PhbABR1QcO1uA8w429ldGFvc93uAW/dAMXBztOK?=
 =?us-ascii?Q?q6RkHmqmscf3hzmUvgEeD0049GZWIma74GwY2j7S/ms6BliEk7QTu7Tn38S8?=
 =?us-ascii?Q?YT6ucBlGz9sXmvYqiXL5gWvekQvB92v6+3FwKXsoIEtC8HHitKl0PUrC1kxI?=
 =?us-ascii?Q?fOvC06wfHuVNkhexEPgmbw47G2bRjxhGoNBYfdm2Gof0jELZpMmVdfRKDwrG?=
 =?us-ascii?Q?zXJbojoPRZpTcN7TKeMMtQhufC86fFg7QWJlVjfANFeCFdHWb9xihR0C3g6r?=
 =?us-ascii?Q?qZhi0NzgmMgVDnSdRGkBkpVSVp11vph2VI2IjSow3PDSwP7eFW+55nu7ox54?=
 =?us-ascii?Q?km11VShvA87M9xKTX5wr0bW75/ANa8jC1XRKHcLFCAwySElsOPthtV0V/pep?=
 =?us-ascii?Q?ecBik3rFiQ4QRIVi+6M2WTFQYgzw9NyWVkwkZMEVp3wP4oGqzL0afzXeMV+n?=
 =?us-ascii?Q?oGjrwJZ4PiUYe2vpD4t3dDO/9rDlesNn3x3d/2ol?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60cbf449-a004-4bdd-495f-08dd80ac6b9c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 08:13:38.6795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CehLC9NVCHOqSNf2S562sg7pIoe31G37ycPHBZWbe5yADLllvTvIMLHyEkDXX4QqMedUksz5v6f8wBgkfVPz0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8571

From: Ming Qian <ming.qian@oss.nxp.com>

To support decoding motion-jpeg without DHT, driver will try to decode a
pattern jpeg before actual jpeg frame by use of linked descriptors
(This is called "repeat mode"), then the DHT in the pattern jpeg can be
used for decoding the motion-jpeg.

But there is some hardware limitation in the repeat mode, that may cause
corruption or decoding timeout.

Try to make workaround for these limitation in this patchset.

Changelog:
v6
- Improve commit message
- Add Fixes tag

v5
- Split the resetting pointers when freed to a separate patch

v4:
- Improve commit message

v3:
- Read the slot_status register twice
- Improve commit message
- Split the moving of code into a separate patch

v2:
- Add the Fixes tag
- Improve commit message

Ming Qian (5):
  media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
  media: imx-jpeg: Reset slot data pointers when freed
  media: imx-jpeg: Cleanup after an allocation error
  media: imx-jpeg: Change the pattern size to 128x64
  media: imx-jpeg: Check decoding is ongoing for motion-jpeg

 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |   1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 120 +++++++++++++-----
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |   5 +
 3 files changed, 97 insertions(+), 29 deletions(-)

-- 
2.43.0-rc1


