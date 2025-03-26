Return-Path: <linux-media+bounces-28798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 233D7A71F6F
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 20:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D8697A47C2
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 19:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847D0254AF5;
	Wed, 26 Mar 2025 19:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EY1jYUiD"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012022.outbound.protection.outlook.com [52.101.66.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A871917F9;
	Wed, 26 Mar 2025 19:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743018320; cv=fail; b=fkyk3jgaXoV5Ivt5SSuGCVVSnHAuywmApQSQoG/ZGYloZXMFYOgOZuhhcPQBZS+Ae547+IWCs8WbKR1yKhL4cZv2No7wDGWqg/oOq7m40TuSNJwtUMJoomhcypDq4v9ytqLqSCdIhjWowT2QEERgNhVJE8zBL1U/xF3ecNGaOZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743018320; c=relaxed/simple;
	bh=sBYJSBHb0r73LaejBwcD/3UXb4NmcaEwWcz27KrXpuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nqzrPusuJidBHFpaw8F7pNhx95yfgC5p68CbqPdqiSh3AteEMx2Ffij5Yowc9YrfXqlSCRMFaSV6Xi1KE6+bTx8VLh74RirIsYeA1Rj4TYVMGg1wIQJec34bxchuE/b8zm8uKjDPOMP1UbUx1za3VlHBXOnT0L5pJKcFqDOW4do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EY1jYUiD; arc=fail smtp.client-ip=52.101.66.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkqzWZZen9+1kpa/RcR5E5l//ciWhR5rw0fF/FmWVG4EGnwrALJSh9ERHtgD4qcjkRRncWJXgtUy62E/CQiWKOv/ek39A9PkjDtDGKAfIIqwYvbasMbBeAukNlJjFkrsPHrEsKfIaNxFPQ0hXuFWVs1vOHRfvZzVSBln+2Mhb1CMuk09ZjXJ05rcj3WVEQEa2zDr8Vu5MM2mU451AyKWpbLqMVOdbZ3mYDiI+2uVomKPeAnAFRdsl0bTjzAFrhy20njYGdQDmyV/bR6eneP3p8P3joaJh9zERgdxQ7yJ77BssHm6Y8jCmxZf037KsvoVevnHmdXbsq/MBFAsnn4TLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85Ik2Hrtwj4Us9MekeLRtWcPmDz92U+GI3Y1C0Z7uXw=;
 b=SyyYQiZiC8hJVsNQDc2T0ila0MCuQ8gpriKGS/mFY9Duqsq90CBML8R79K4GMZZsmhm/VNW+g1mzfU9MEIWSdsa3hWNIc0Mfqek3iUVMJLrlTU0aubWcf8ZqY4+6TJSijJfz3/8z+A/IhOzgMdPFQFJ1o+w/S7roUeGVQ/tbpWww+85Zeh/gbn+7riQMaaIURRUDY9zgJhn/S5A/WwCj0tPAk1BAXVzzPTHkBwYYew1Qdfpp2shJFspxo11ItqdbboPx3icKt9Xp1sB3jXugNZmB2WbatHN7mjbrBqDmdHQkLnMLKZj0Dg13ynhlAzk6FMXn8qosO+fp11uJVAwsSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85Ik2Hrtwj4Us9MekeLRtWcPmDz92U+GI3Y1C0Z7uXw=;
 b=EY1jYUiDFiZvzDcjGUe7e8PDmOePVrj4fZGg1e9T2gOVl174FTm6rT4sMkTCxQn89ZJwh4KoOFho1azDZwU1x7+Gi7rKijoZ+w30AUm5fUV6C/mF9XIYwtCZpAVSkEQSB9Y5CbYlMmyPYZljba1pQr5jABI4wpHJ+Sm5WOkYKgaHrdt2tjYmnUzlqI/UjP9cgT9uTrAmg/C0ebLdEkczlnpe1jwFIQsrd2zEQQRodj485/JxEbc+cs7B+p0iNZvP1b2YzLVE6+YArn4IzXnbUd8gZ8MD+r9/5VAwu/aW/YrtV4GLwrehkTidv1xz5Tg04YGJOVz9Aclp58paDLQ/cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9188.eurprd04.prod.outlook.com (2603:10a6:102:222::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 19:45:14 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 19:45:14 +0000
Date: Wed, 26 Mar 2025 15:45:03 -0400
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 00/12] media: imx8: add camera support
Message-ID: <Z+RZP/E4GT5R6dHH@lizhi-Precision-Tower-5810>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
X-ClientProxiedBy: BYAPR06CA0071.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::48) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 543f8c2a-9f90-4564-19fe-08dd6c9eba30
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|7053199007|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?03EQTb+vyjdzZamv+Md42TyZQHHYBgQzp1XKB0j7dlSzEmuo/zJxxSz6l0KB?=
 =?us-ascii?Q?BbDKXsJNskcQ/WksbYzmz/BYctr5cfqs/mnMX0kui7DLaCe1EiwB3qpq4zoZ?=
 =?us-ascii?Q?O1yByCqO4MQOyV/GN1sRmRLgha34TJKKiTo/qobV1G0NkNnIyZDJ81qQGyoP?=
 =?us-ascii?Q?r1R4GNGS44MrK6T37IsWGR8BF2I6h6Q89+55dOh/smMvbVl05IbLQat32+vY?=
 =?us-ascii?Q?PJaihv7glo95Z8fJGIeFXtlrNrdUk3n6lc68ObtjaQ9iqS/ttohY0TZJtC0o?=
 =?us-ascii?Q?TiH7ryUOqeGZKTm5DX8NNvLdRW23o9f5TS67xEVg5u2mUManUsPvuuLC5MNT?=
 =?us-ascii?Q?9511Nk4ubPBlZozYEIoLcOfFC1CDBxNul6GFM+lGVpPwermx36prROJTaNc/?=
 =?us-ascii?Q?Z/76B/cK2XuXNbNubcc8ijOnnnbcaqqDBdtQmMFdsQawX7fLWAVXKu2YUr9P?=
 =?us-ascii?Q?ONM3kvDOIlOIsrWkO0AqbevU8UuUruDmnp6a2Ma8knBP5zH1WxmToKVNUwC6?=
 =?us-ascii?Q?rbGV5hiRRVLjfZ7gmQhsYaD2n5Psl9A0qw/FDM59BZiygVckGoYiT7lQd1cG?=
 =?us-ascii?Q?3EeTx1xxvZ/VQGJ9EXwFQHcav9gdrn+zVuZ6RDKBWOyQ3CNfCnceV7G8ULqT?=
 =?us-ascii?Q?5bRSEWYiB6KQ887YqiyYYOt2Lqjkjmraig5xyaXHr6ztbgstHu4rwgJZ5mkl?=
 =?us-ascii?Q?hNzOc7CDEM+A86QLBsGwGKrdfHS5e9arGJ9FRy52E3vYo09TBQXfJzVCJ9lB?=
 =?us-ascii?Q?YVpzJiMSHTHAk6r0bz1z5DiYCJmfOeD/BbIOzK/NLJok7n1OqgCKDwFfIOHU?=
 =?us-ascii?Q?x5Eo819gwhyxU9j6JDkPAhZRthzi6v3UkguR8TPHWjeTAJkKlXz1OXKqMBLY?=
 =?us-ascii?Q?MfBMtYQym2oVgfMH/BNJPRnSovegYZAD1lk+5x9ce2qPOebxOS1dq0J0MT9Z?=
 =?us-ascii?Q?RWkzRs02qRh4V+N/WOJMH5sx8f06S5WIXxbByVPSI4biucBTHFY/BCSei8R1?=
 =?us-ascii?Q?Pm286UngsTqYvOW+ve9z219fJGp1VwVIxKQF6WjTrOY9b9BxQT0gunG/fEQb?=
 =?us-ascii?Q?HMCXCAOGxmam9TBQ+MW6IoZoCn0NSAaXkkSl7tufNWFY/NEmUc81/mP1JdzP?=
 =?us-ascii?Q?ymc5WSNq9yT2Sjy1YSEufoSvlaN8ys7MAJQOEuBuc1iFA5Da1VR/bazphnBp?=
 =?us-ascii?Q?j7KYytyFD+/YyiwsUJdeQXqYiOY2cb6uWyWaW928S0WtQq5BzO5O3KwyCIXv?=
 =?us-ascii?Q?k75x2RQqc6SRGam+nC1E8N0itIyaSj9+YisV9Zmdi/PVlv0ZyKiXcrX9tEqQ?=
 =?us-ascii?Q?66RqXZcoh43t1RlPCpVqb+14IISwJ5HvXi9Omay4eKkFfgRL/d2t2ktxOA50?=
 =?us-ascii?Q?pgTPx5npdIdSxZICRWnINXAiPGdRlUJPwBPPl7lsHz9DcGEb90CLDbK9rU4R?=
 =?us-ascii?Q?suCWG0Ryg4Cu/R6t69T2wwbbvTL0ROfhU9g+IF6dhxInRC8XFtG2qAHCONAV?=
 =?us-ascii?Q?Dd5Kohw1WCEAAeJgqwh+G2cNFDLU3AbBFBdG?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(7053199007)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?4trjCcGBr/UQpQ7J2uFhTPBrUla6cpYvTvyhXv9uYQm6P6vDc2dc2ot/ct+g?=
 =?us-ascii?Q?HEXC0wCXQrWc2PNJuQsuLJtruH99AaefhlaDV6u9fz7+iV86Y+F+1VkcPhag?=
 =?us-ascii?Q?AcV93nxFOmjVVuNIbMgxzwCsmBK1fGY5eyrQIAOeukt0VWyqwFmCs8phO82q?=
 =?us-ascii?Q?el3LEjb9JPGBt0XkQPH90Ofx1vIC6BZ+AGdrmEnvbgVLPKl/PIcHIpPBDwW/?=
 =?us-ascii?Q?9nHYe3qG8xt3YPHfdVAPBGXJHnXggp6sBycUxpwnc9TkumFmM4itTCgMD+uv?=
 =?us-ascii?Q?e48aajKGnQHi4WYcBpvzWaVKNOQIpbn3CyenW+uKpcVZNLRaG9PEzLkzhjQk?=
 =?us-ascii?Q?kX5WrlDBWoA3OvIY6ryhLTwrPM188/y/0TM8H6L7JFPPg/dXm6v9qsWeAXEz?=
 =?us-ascii?Q?5t1kowzb6o9Vu/cDnRzok42w9hhzs9bU22hObgky8dFzkPhlGhRavbQDCRTr?=
 =?us-ascii?Q?DedR1EJNgwXQJTu5zbMybsyeplHKq5euaeUz3/ZIwPA2mGNtqALX4isEYNCa?=
 =?us-ascii?Q?FIEBGilnTPw0aBHmn2njYk77pH90Xnrgy+47I7vtiXig560DkJfE450RQMBk?=
 =?us-ascii?Q?uVt5o/Kdw5qTj7nXrtY9h7RfJ2L0hThmgalowrtHRzHr64k7UV5rt5k30Gxd?=
 =?us-ascii?Q?z8dWZlgv7zU/PZVNFWTSzalylgOU5JFS5Zmmjk0K712/zjr4i/mcOiGCeUfn?=
 =?us-ascii?Q?NpE/G3R6b4aK3nRYMve7h2Bk2eRL8tVrDazJ/xibBEL62jdLTemljW3skCbe?=
 =?us-ascii?Q?1n1q42Yyh85l9Kb3O9d+c8CBgkzY2ZHRE2ytjj52ywpQZsmBR5d/dOwEZAc2?=
 =?us-ascii?Q?RkURW5QF6PQwadZQ+Ij7lV7XvpeMyy36lO/TJYZksdWLsq9d0DAk4rP4csEs?=
 =?us-ascii?Q?EbSUvCL2pWBa6bm/+NoyXgot7DkiS+DwAW3vZebyR18nM0wj7/90uw2EXt6F?=
 =?us-ascii?Q?GmtXaQ72ueksVEKSpdg96OXISwK3wEBwQV3czc/IyGep5m73iw7Sbe9X0pbr?=
 =?us-ascii?Q?UJxV6PERafvEvLDXFXRYE50L6aHMB4mHlC5LijuYwhgINDMALF8kZ1cazBxg?=
 =?us-ascii?Q?RASmRcTL+w9D71c2He8Lu0djr9SjGmpGuRCBdo5GvhJShJ2P3jGjT1IOD8vz?=
 =?us-ascii?Q?Q4m3zuOGyCGI3GjpzwwAqgn/1CsSNXD4RRDCPs+qvx5ZbmDLVDRvPvmfe2nP?=
 =?us-ascii?Q?z3CsEABKvwymR5HWzFtRRE7xGNfEoVVtZCIT64AYRuQ6exgEiIpzyzjW3ZB/?=
 =?us-ascii?Q?ZWGQBPwP6C8+7eSlFEEyM/snvp3RBMmBqF0Nffhe0dp/Cab90D+hpe2NhSRS?=
 =?us-ascii?Q?9pjMYWgEVo0hNTjpVRCiUnSW5icNRrFpv/nxWLUPhBE/VHt72xKXbKun2Lq6?=
 =?us-ascii?Q?jrhpdnef7kofFe8v4eSQvy6w7aPN98RDOgoekOZGzHQ2gXhGbnInMBPQ0VA7?=
 =?us-ascii?Q?nGveacjGSoeQ2VUGn/do2+00v6KrT8CTgI8VERbRWpOwf05HyGSXWLe/adoG?=
 =?us-ascii?Q?3ED+igLXZFCM9FrgTOjvRsEtE39Xi5Z1doHWWaR0NvjCEYE2CZRmvC4o/V59?=
 =?us-ascii?Q?Sl91XxA7gipUBUtE2V8USXce7Q6wMV5kNjaIWd/3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 543f8c2a-9f90-4564-19fe-08dd6c9eba30
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 19:45:14.4600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dX9BPYmg0f7n5RjLYsmHRe6zHTilNWEhdBNS9o/fAY7TKs9dJcDKyHUFaqpA9bZLadYFdN3gD0ct2dSzbXF/gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9188

On Mon, Feb 10, 2025 at 03:59:19PM -0500, Frank Li wrote:
> Add SCU reset driver for i.MX8QM/i.MX8QXP.
> Update binding doc.
> Update driver for imx8qxp and imx8qm.
> Add dts files for it.
>

Laurent Pinchart:

	I saw Philipp Zabel already pick up SCU reset part. Do you have
more concern about media part? Could you please take care this patches?

Frank


> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Dong Aisheng <aisheng.dong@nxp.com>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Shawn Guo <shawnguo@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Rui Miguel Silva <rmfrfs@gmail.com>
> To: Martin Kepplinger <martink@posteo.de>
> To: Purism Kernel Team <kernel@puri.sm>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> Cc: Robert Chiras <robert.chiras@nxp.com>
> Cc: "Guoniu.zhou" <guoniu.zhou@nxp.com>
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> Changes in v3:
> - Remove phy driver parts.
> - csr is dedicate for mipi csi2, so add it as second register space. csr is
> mixed with PHY and link control with csi2.
> - Link to v2: https://lore.kernel.org/r/20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com
>
> Changes in v2:
> - move scu reset binding doc to top scu doc.
> - isi use seperate binding doc for imx8qxp and imx8qm.
> - phy and csi2, compatible string 8qm fallback to qxp
> - remove internal review tags
> - Link to v1: https://lore.kernel.org/r/20250131-8qxp_camera-v1-0-319402ab606a@nxp.com
>
> ---
> Frank Li (9):
>       dt-bindings: firmware: imx: add property reset-controller
>       reset: imx: Add SCU reset driver for i.MX8QXP and i.MX8QM
>       media: dt-bindings: Add binding doc for i.MX8QXP and i.MX8QM ISI
>       media: nxp: imx8-isi: Allow num_sources to be greater than num_sink
>       media: imx8mq-mipi-csi2: Add support for i.MX8QXP
>       arm64: dts: imx8: add capture controller for i.MX8's img subsystem
>       arm64: dts: imx8qm: add 24MHz clock-xtal24m
>       arm64: dts: imx8q: add linux,cma node for imx8qm-mek and imx8qxp-mek
>       arm64: dts: imx8q: add camera ov5640 support for imx8qm-mek and imx8qxp-mek
>
> Guoniu.zhou (1):
>       media: imx8mq-mipi-csi2: Add imx8mq_plat_data for different compatible strings
>
> Robert Chiras (2):
>       media: imx8-isi: Add support for i.MX8QM and i.MX8QXP
>       media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8QM(QXP) compatible strings
>
>  .../devicetree/bindings/firmware/fsl,scu.yaml      |  12 +
>  .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++
>  .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 103 ++++++
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |  38 ++-
>  MAINTAINERS                                        |   1 +
>  arch/arm64/boot/dts/freescale/Makefile             |  12 +
>  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     | 376 +++++++++++++++++++++
>  .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso |  90 +++++
>  .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso |  90 +++++
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  60 ++++
>  arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi   |  45 +++
>  arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  12 +
>  .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso |  89 +++++
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  44 +++
>  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  60 ++++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   5 +
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  47 +++
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   2 +
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |   8 +-
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 179 +++++++++-
>  drivers/reset/Kconfig                              |   7 +
>  drivers/reset/Makefile                             |   1 +
>  drivers/reset/reset-imx-scu.c                      | 101 ++++++
>  23 files changed, 1477 insertions(+), 22 deletions(-)
> ---
> base-commit: ce37eebeae8fa9e6c53f7f1ccd182ad5f27d66cd
> change-id: 20250114-8qxp_camera-c1af5749d304
>
> Best regards,
> ---
> Frank Li <Frank.Li@nxp.com>
>

