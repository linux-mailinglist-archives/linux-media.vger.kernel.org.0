Return-Path: <linux-media+bounces-51394-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFl8EVMtc2mTswAAu9opvQ
	(envelope-from <linux-media+bounces-51394-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:12:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7B172450
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBC3A30BB38F
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 08:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EDC535D607;
	Fri, 23 Jan 2026 08:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cAjxTaEA"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566A43542FC;
	Fri, 23 Jan 2026 08:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769155590; cv=fail; b=SUf89S56/aWLXLawo/zqNsvuDfvLvo0wMkR0DFtQ+2YhEoYH+im0q0x0t36wj9aKLUDW1NHKi0XcxfMyPRzWlJK4fO7xeSpbOA1CLl1Dl43/Hlq9XrI74ShyyNlqazML4HqzKw26dmuMl1+ARULeFOJDrhmhzW4NHaZvWCrP5FE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769155590; c=relaxed/simple;
	bh=FLopBFZZOiTjYAvzTI0XPtR2ggJVMLk30myUxskJcgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PW9h21o1kxVHitoV5fcydyvSvZFsubzFG/2bAJE1ZEzGrTPQPVX7Q0WKEpd4CKymHaSD1yefjUtEzvb4jEkMXbE0LNL4WiP2nhOT9UVP0hs76cadUZAvhTHBH9SwSn8r/FD4YOjVcBhrkATQVQsZJvQoFISdB/WLFnVt+wa8Wl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cAjxTaEA; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdbIDHJ/LdFhS8Bs0R2c8bRqE5TqGEBRn22YPTOA1zVFhkkFYEXQ2pXPbn/+2c7o5fFRBpdeNmQE1y8uuF+ntA8tiQn4/mikt8dMWq7YAdEtSZ8Z68tB7kBjzaYKzFNHoRSV8BxJw/iUOdS1x7norScW65KY2fzJvYWoqSxWUpcb8I5J3nBOuHOW7MIem7tcBYpaGCbPi3Wyqb6vGVtwYb5NPGdK526FDe5QQAI1/keinZq+l32Az9l5DB73EIuXvUvegL8oDi+2LdyJoC8CTYCbUaSJc6GVv7/Ok/vjzvBnCu+6iPvEZJrDgmsCXQq3hlwtyrYD6nHh2OWZIKTcYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aChj2SbxNQQEHhSFSFBcxQW2EPd/uKsI/AgWNMQxQc=;
 b=lxvaiWqSCimo4H4t/crBc14lO1F0wl61haocjfvXlWOCsfhkrl1kPP7fIJq+j4MO4CHIzOYuDK3ckiUQhrIPsRmoyPVlt8QAQdiEgcro0ssEdKFso9CUyq99/jhMSmviA1qapc7vrdf7Ee8CgNBX1eF0PLJ1ab9HxEg/EmQSk6p5305svjJUCsai7h6W/utwYPM71kuv8F+xblXtJAcOks5csOk4Ekva7l6R4gMipbthyULbtv1PRhycTHmY/SJzEK0EXNyCpFB5mKe49ihRLtneLRrom7aznkpcArxfOj1XWZYZShqoY2FhPtFP+s3Sdul7mpxCTMiTp6uC9epeNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aChj2SbxNQQEHhSFSFBcxQW2EPd/uKsI/AgWNMQxQc=;
 b=cAjxTaEAUAXTzpmOuaGwvEAlq+lisgRHO3bKsgZlqGYYMP1nfN2hNiJiYVlqllgx3dNjE8I39AYK9EZsLSOanrx/vYRfVx62She/cYbeKzslofw5iVa+2W3ZkihE77DKKLfc1Mx/sK57ExuiiesnIqI4qrd/9ptgK7RBGHr1DiPVLQh3zSbLgTPtLp8X0mqqdLybkAr1RYnaUpjQmCCEjJLVJ9JVGFaBjNLklJlWRZkyw500mg9Ke7yIFPWcFZxLID1SAU+wpcnFYnhwWRhEVEbspDNjl+5M1BDkrQUVqLeBlIRTUIU1/CkSyxBGaQMTPHbfTYrVFuv/Tnfosc1vvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by PAXPR04MB8624.eurprd04.prod.outlook.com
 (2603:10a6:102:21b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 08:06:23 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 08:06:23 +0000
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
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [RFC v1 05/11] dt-bindings: media: Add nxp neoisp support
Date: Fri, 23 Jan 2026 09:09:32 +0100
Message-ID: <20260123080938.3367348-6-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::11) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ff73f8-49b6-4433-7413-08de5a564cca
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?yNEdYVCq7yyKzVwgDW3TfY3vEqS7sMMcHCDR/wp+GspeYU+UHq4UAobCrEPN?=
 =?us-ascii?Q?xEERsnvF9F5wbSnnT0RpjviRoOGGCJh41GH5g6BGtcC6RXihrgmk1DMeHwmD?=
 =?us-ascii?Q?OQ3wE04JFv+sV2eqEnV7hlYt61d1cVFLpxsIZ/NRmfRZDss46M+zWNNRJFYc?=
 =?us-ascii?Q?KrDYef9ESX6lykLyw+wezaCftPtaqyqk/xycM3eLOrFmpWlBDoFKaOdEIAMc?=
 =?us-ascii?Q?qoSrN8pmD603yq84tv2+SWAHGOA4/rb+qBEWKg4PCOMxi4cNnhE9+gDJwuey?=
 =?us-ascii?Q?ts1qXAuzuiw6EsmGdSukjWp7Xo+RB8Pp9bunq4eNmJhb5rbEtdEM4S+LR/cP?=
 =?us-ascii?Q?ESSn7E8Qe+W2A1qftyM9cbvfALg2D0UG1UZKMejao5pcZt6pAU3Q4AXEAGVr?=
 =?us-ascii?Q?RTCzkJW1TioUbeF3O9lvoM4YngS7MtYH53NHq+sjLoqB6zJ1fA8NWhrsmJLS?=
 =?us-ascii?Q?m3IbrD+HTjRYKMQNUx7dxMCYKWVejcNERXX6KN1giTxSnIjf4UdWB47n6J+6?=
 =?us-ascii?Q?yUUlo1q89QgHqZ6ESBAEW0PefRxuR2FIwnIToxe50D4zYDC0JVFlNcdegRmi?=
 =?us-ascii?Q?QPO/NFK2VPJbRnM7sd+BTEBs+u9DeuGXkNfZbaSfqnVkNF1iQFwb4DGwBORQ?=
 =?us-ascii?Q?kQ6+SKjVixcIe3X/HL0qLltTvBSbzrgnBT/FLEWr9LNV0UP6YlgSXMj/I6iP?=
 =?us-ascii?Q?udErfWin0AdtUCVFuNrAyPmJ5JRBiFeYo45TLDNXbBdEIeWN0DsygEhtlz7g?=
 =?us-ascii?Q?2/Kd98E3YgpxcnZDerF9ihRZG0x/5oRsMS591Odkhm3WzyL3SWpAYeGUjhZU?=
 =?us-ascii?Q?+xLhSZULKqFOZUVsEYjTxeMEOSticvENqd197xDQHN2ieFm1Pr17zgHpQm5G?=
 =?us-ascii?Q?Ub5rJc0JpMfSqKPvN1GaAXuevyNhGUtPOSfr3mOFq9TIecCPF2dciq+HoJWP?=
 =?us-ascii?Q?fdH2+FqvY1OCF0RDjW9e43ggJsJXV8ekKfrN1n70CysDFDw4KCkwKLMWdH2s?=
 =?us-ascii?Q?eJPb+BCvnrcma2GuboT/ABmcvAhRAHQZGdyymaQYGNTm0a7vOgJkO6J3GPeP?=
 =?us-ascii?Q?83h7eC/daiiZN4f21rrQs2oNWErmd4k0lFe9Yfj11SQQOE1lCRrGsW3N+uAT?=
 =?us-ascii?Q?FNNXh75ZnYL8mF/kM/KnrPuG3iqmNfqdHxEd1Hbg5+5xdY4QhDuMJCNvyRkn?=
 =?us-ascii?Q?3wMl/TwHvH/AWvshzZtOVaY+/uO8Kir82ZOCifNZ7/VZZt8hPPfCuIqWqxQS?=
 =?us-ascii?Q?yTECZO6B4lQqhSq3iQYbx5HVRosRPvtgq66lowmJm8BVJWlvUFZJk5SusPcu?=
 =?us-ascii?Q?nZCHouQH2byfm28yXw6kymBLIYJgNiucuHeS5i0NzQ1eDXlcRCqBsUhXYRvv?=
 =?us-ascii?Q?Sn78Y7qYnM1JSSC84ms0NRgl61DgeHklqHeQ4aKVeatTii7K1/0efmrwe3r0?=
 =?us-ascii?Q?90gWb8jCLAjeu/02afQIQ513fPZjugIG1GwbbsOp0kTXkS2LvCyIDU8lSZ8B?=
 =?us-ascii?Q?Qc3PAYhOR2KJtG1uJ9PR2TjAjIYM+H8dEV2webna1tTVRTteswi+ymACf8p2?=
 =?us-ascii?Q?C3MsJmkYpn+VNLDXYi9WBm1BZTEaom7y0EG3tJrrBGOtf6e9l4Qwm3GCPhYq?=
 =?us-ascii?Q?lQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?MBbHTrXja19qdZcGbO6NhmPykLvH5FOtqFWAtgSK6GUKE7Ukax/gMQKa0n9o?=
 =?us-ascii?Q?JVsEY6Tx8MqYFZpoA/p5M52MGuvV53PchhCNBcStUPf1auaybRN6kUhiop7u?=
 =?us-ascii?Q?/NDb5QGyYVaQQTBNgkalBwmPu+RqtebVNDFlDI/y8jwlxhjbjrkT0UOh00NG?=
 =?us-ascii?Q?B+se6x3LwBIoJRdILXupdOQfEx3suZFlwrwnoE3Xcw6oWtkIBy3NZNr/hzph?=
 =?us-ascii?Q?fTFVRxVGu67CdcQnDvfax/vcp4DKo/OQ2o2D9yzL72Pmv/pvz1P/t4o4ToL6?=
 =?us-ascii?Q?4OdDrRVU5DI7P7P71TGXFANQVpM8ZmnPBlXtySGEZA60O2kFJdtnBQKPVI0H?=
 =?us-ascii?Q?cixFP01VDFH1viGrgdKRDCwt4gqP/jhWZBEoFO4L+9iDwcVwVoWiqUVLK6er?=
 =?us-ascii?Q?9ScpVc9UuDOb54Z/XGzbFWh2F2KNBUqKxVR8WmRrfOySC/uB+ng7Rm5J//4b?=
 =?us-ascii?Q?hW2cNuQQ+eKXNlB+oZLw3K0LAuSVfccuaw/Rtm3wb6coZUGbi0/0/DX+0AXp?=
 =?us-ascii?Q?fpqrdppN5PMIecbqgxKhRPldXnaoVLijk7nu/0dH9tmKN9GzeB9mJYUUXBE0?=
 =?us-ascii?Q?cVn4SP5SaiiCuuYUV9alOuwbjNDg6r1DauUEXtnSGkvbLMmOBWI6fi0uY3ft?=
 =?us-ascii?Q?qm90OoHFYAxDcBAVAvU2YfcpYny4paT/Bt4yYre20OWICuAEKhM+gR+/zWKz?=
 =?us-ascii?Q?B9nYrfIxGv2Q5uttNn7qqNA4Ht/r4ET+wCYVF0rdnCDTb35+owFE0m1yC6xx?=
 =?us-ascii?Q?hcWEHv/M1+m3mZR80+MzJtQvjMya+Ob7t5XedUPqUydjD34Zi1n+yB4fTr0r?=
 =?us-ascii?Q?SJ4Fs3ynudOSxHGYTKb2/ptlHH1OEefXRp7aSDHi0dLavBtKeqRXd4jHcKKZ?=
 =?us-ascii?Q?Kpko7ycRUkN5/mq+G1J8GH6KImtKogSBjmKb3r4FOTIIojJAfUxvK7bPzbNY?=
 =?us-ascii?Q?QyA/Q3VB3AmmzATvFl8f8vW+9uiq41AxEXXJhOU0vNaIDXEHU3ZXomEvTlaP?=
 =?us-ascii?Q?lBU7blAhzZDsyznRARZczumMCLpZ8h6oOY8z7fMMThLQ3pKhALUuHQ3zOtej?=
 =?us-ascii?Q?tUr6pYVd94bXjIzY8eRqfPFxFl3B7ReHu9dcuX0DHhIGnumK+g1tE5H2qIuu?=
 =?us-ascii?Q?77bsplqWLgaAWYATY+p155tHfE//l8HOmLBYWdZtiyBzvvjVOlyXCB1j9YK2?=
 =?us-ascii?Q?pQZ5+BgI4LVMahBxnKZaOXOmXMsFSQNa+K9xuSVBz7tsYJEdH8w+epBID1D8?=
 =?us-ascii?Q?3mAtJiXskXC3JyU6mtTPg5FIuMD/gr7bxOptU7EkPLO1xrWPAwYY7dxWrbFF?=
 =?us-ascii?Q?ciHdX7sffXATNUquR5wWxzCIJ7dcEY6ipM/BzgIodZBYV3TcDp87mT5cavnQ?=
 =?us-ascii?Q?sCV6K7Fh+NUBYZOEjGSxfHZms+ivUI6GDhTlUESfLHAVxZbrR1OL0rl7BUtF?=
 =?us-ascii?Q?P6Xs1yxxGM6Fw75TU/4fZE3Gaiqe2DhLQUz2/T5G169LTUEdNTREdvwRSb21?=
 =?us-ascii?Q?ZteEYVN1iMhQ6eY1bx6OyyVUFRvaf3Mwwo2hfmRTTwrwPoz1whp6AloRzLye?=
 =?us-ascii?Q?Z4Nj/bpFOBg8Z2uAxed2xJaq1YJwuLQCmPB1dhL6eFoMp/cdRwWxvvk2SK6+?=
 =?us-ascii?Q?LMA3j7iCvbwUT8L3u8OvBSaB936s91HarrwrTv9iCrolFBE0Ufy/UDtJdNAa?=
 =?us-ascii?Q?oauob059mW7wog7UsKrtnNMyyVXq413l4swLL2vF7uBYQZAfXishZHtVm+vS?=
 =?us-ascii?Q?uw5V1MRCbg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ff73f8-49b6-4433-7413-08de5a564cca
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:06:23.6807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utIuQbx9XpN/qpzbzAIhhDlUyD7B52vZHFZVwmVgMd6K+Z+liK9MSHHEQadhcRzbbP43Fi8ZJ3O6g73BejvyBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51394-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,4ae00000:email,devicetree.org:url]
X-Rspamd-Queue-Id: BF7B172450
X-Rspamd-Action: no action

Add dt-bindings for NXP neoisp module.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 .../devicetree/bindings/media/nxp,neoisp.yaml | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,neoisp.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,neoisp.yaml b/Documentation/devicetree/bindings/media/nxp,neoisp.yaml
new file mode 100644
index 000000000000..4dc9fa5a03b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,neoisp.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,neoisp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP NEOISP Image Signal Processing Pipeline
+
+maintainers:
+  - Antoine Bouyer <antoine.bouyer@nxp.com>
+
+description:
+  The NXP NEOISP performs a set of image processing tasks on the RAW camera
+  stream and provides RGB or YUV enhanced image.
+
+properties:
+  compatible:
+    enum:
+      - nxp,neoisp
+      - nxp,imx95-a0-neoisp
+      - nxp,imx95-a1-neoisp
+      - nxp,imx95-b0-neoisp
+
+  reg:
+    items:
+      - description: The configuration registers
+      - description: ISP local memories
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  clock-names:
+    items:
+      - const: camcm0
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    isp@4ae00000 {
+      compatible = "nxp,neoisp";
+      reg = <0x4ae00000 0x8000>,
+            <0x4afe0000 0x10000>;
+      interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-parent = <&gic>;
+      clocks = <&scmi_clk 64>; /* IMX95_CLK_CAMCM0 */
+      clock-names = "camcm0";
+      power-domains = <&scmi_devpd 3>; /* IMX95_PD_CAMERA */
+    };
-- 
2.52.0


