Return-Path: <linux-media+bounces-49790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A82CEB901
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 09:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87CEF306F6B2
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 08:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FF3313E2E;
	Wed, 31 Dec 2025 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="OV3VfJ7/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028172E22BA;
	Wed, 31 Dec 2025 08:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170447; cv=fail; b=TyHqqwmfqI6IB20nmoh3wfuTA/WYh25GnB+ku2WVD1fDy91Ll8Q18RJtsoQZnPZTSVpt9YdKvPXtQ/GGtI0PlhUFOP4LoH7e8YJ9nxeTu+RSqwMTCDPUW/Wl0iAgIGVNbU94NVxZq/0vKXGgNEVWhzEvg3Mij4ibOwXD4RoSFt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170447; c=relaxed/simple;
	bh=/N+FJnsQz29xjqeGWm5OBcsbo/uspi+6f+eA0a709Go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i/qPIzeVgYQ1MFuPKbPJ9SeFSygKm2GYygYcZRF2K5g591kxQCgBSiNtr18AQZX3etYTTpCU+2okkmX8E9ywogi9JRlum4S+McJeAdMfIpiMd5Wph3+UMDrB8UUmpIXZ99PuIe+TiotiRxEOwasHif1VGK/GkmOCCgFInTUwyjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=OV3VfJ7/; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV7TRiX145082;
	Wed, 31 Dec 2025 08:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=QnoeqJrH1CqLKv3/EeMkDzZYQVVIlg90dIX8FEhrv7s=; b=
	OV3VfJ7/6bnW9lvZ9SHE6HofpIKZOYh7WXo0jEU+/fTNtfY2hKk9MFNuG2cgndOZ
	3Yq7HP6nxPZD6DPIOEYt4Eio/rDYnTFvFr5TvaUzyRCIAwFnVC9ui5+CwZgz3usc
	AyDXjOknx3+IVBhB4G2dM2nI90BBZ74rPXeVvUI3x2W02IDEnMUH2C6/OmispVFI
	ywoDLs14eWAk68Ha2lGwk2+gY53pWs/maBt+kMpDimjhx2JPjWUuA4/tVuSBCIST
	lIRPWCJcFgJu3/iiPj51rE72V6I4i6Ib6+U+rePr1Kn6i5SxNE+iBYANSBqJnqoN
	6/pdhvi41xX3MYC8Fg2lEw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011049.outbound.protection.outlook.com [40.93.194.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba4nxur19-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 08:40:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xv2pF0WreUnsJS7i8QdhtuJ38rOi4bmEW4AXlT3gE+LiNO0gui1qAWl0qgDt3TVGOuv4JsSv9+H+I8VfyW/2ACEcSrf/7C4nw6mZHxK+M2Fd9KaGv3kAZcWlYeDXpk26TZxRDfgl84/3Jt/LN5kjkDcLshy/QiMVYSA9DonJByEZCo9taamvyjkJvB9+npRgDU5Nm7BFzS2L+iugae4yLCPoNiFd6Mutk1stSEdE36HZvDHULHXif1TUi9aw6Eh2/tr8EsgmHezM3wR9Pccz733J/lb0uyTunwOcAFoT1NqG/XOXEvAZtUdmASUYiUMnVi7RiTH6oED7lPOojeG98g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnoeqJrH1CqLKv3/EeMkDzZYQVVIlg90dIX8FEhrv7s=;
 b=nx/BO/61N7ydkHhmZ8ihrcwlqLK38G7EzsqB8osxt2jfu2XHs/lGGYUTmOzngiBjp5LXx0UEWcoge98m7YCxM1kUw0KZPShHGBTsyEvGH90lsBslwRxSlRiJAaW4745ClyEbxsWapSozhF7oNyLEK5G9sTloxhaUZIfDV9VVeVzRIdT1N7Pm6URz9OnfzUkVPTqRatsY5S/ktFy3adwPp1NAwgvD0cO+U7qnQBnFuZ52+cPuRiDNctfqPbuC8yDTL40A7IsalIGpnEEV3hpJThj1AjWFAiShwTNiLIu0WEU794lWgLOGnWpLEWmTiUa4i7gSWu1G/EhqS0zQ1GOdfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by BL4PR11MB8845.namprd11.prod.outlook.com
 (2603:10b6:208:5aa::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 08:40:16 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 08:40:16 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: tarang.raval@siliconsignals.io, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, xiaolei.wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] media: i2c: ov5647: Switch to using the sub-device state lock
Date: Wed, 31 Dec 2025 16:39:23 +0800
Message-ID: <20251231083924.2657165-3-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231083924.2657165-1-xiaolei.wang@windriver.com>
References: <20251231083924.2657165-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|BL4PR11MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: a8de321a-5e4e-4d16-4ddd-08de484838ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kc8myDJLhT7bZC6BVTQOoc2uFZp6xr1Pc8YfMEYt5+JZR4U5JS+P2PltSK4b?=
 =?us-ascii?Q?xv5fXkyEz4Of7FTSjA8QeLmQCnLlaz5wHQ6j++IF5wFOK6TLciSL3jayaC0T?=
 =?us-ascii?Q?UgeId1+6Rng6f7Fef+46m7nWWqk7n4ZrjMBBAtv/DuKsceBrG2HRc7jKGSdX?=
 =?us-ascii?Q?eSueVKs4l1U1jiNOFSJM3L3oQemHZnjUssDh/YSaALwOdYCtmwWa03cfCS2p?=
 =?us-ascii?Q?FzPi9FqQNKJMzDYRv9ZyeKC01TDca493LKJ7sRJsVEFge3GtUfBv/rsAMf91?=
 =?us-ascii?Q?e5J3ve5/sfLWkkd13L3mzS33xVdiTbtMbvZG6pie0uw3fdLaiBn435zAhRGG?=
 =?us-ascii?Q?48vWflhfIvTR3XPl47BL+IefdryyOWV3Xz57QqfzG9V4U/jLfZ20KJAM7YBa?=
 =?us-ascii?Q?f2mEkjH6BxGtSHVJ5ZEU0DTYpyvyJfFfnHgl9/63oRR3fPRsbMhlqZbidBDA?=
 =?us-ascii?Q?9r4TwaPcr/ad3OhLj+9K0+bk2szvsT1f3MsX2GhuTPg2QQpGU+D82ewzXlvv?=
 =?us-ascii?Q?dIZm1h2B+fpiQw61IZxx8/nvLDrO9TUg5JUrCBxOdakitab/wPGbh3USg4Qv?=
 =?us-ascii?Q?trNzxca0/h4Vm3QcO3rPZGiNdDw269U8eqahdAGq1bdnFI7Iistc81+TCIry?=
 =?us-ascii?Q?kZtS8yc+0RhYW5BRqnS2ZH0evwuccOmQcBl0B3a+TEt27KAZMCkVDlz0ArDd?=
 =?us-ascii?Q?857PmZPyR1J/Ywa3jrXvexTRqUwR32mHGtivbi9/ClFQqwBoi77YVx5LLNEE?=
 =?us-ascii?Q?ZcWMqKaHCfAeGGYaSQ6W70MQMVnNUO4/gwdVaHWyD9FXY6l6lRZ91jflWxHj?=
 =?us-ascii?Q?WGLCXCcRh9/QK6wEsiBbDuqhdb99ytXe4T2mP0DYuj3a1JYxqFL41ZV2WEx2?=
 =?us-ascii?Q?XlukQDvqK3iEEEnEp5EpI6n542i4Njj7u65RP0lXikstXVyl5HwJu1fWW5WM?=
 =?us-ascii?Q?CuDEoV474CyePYJltp438HpvA0wyldcfcVldtMljAZQJRS9xH9+Wat+yjjaX?=
 =?us-ascii?Q?Gd7oYqrxE9TkFyvU3hylx8R30YyBLmhkTAC6EgrHF9Yo5TNGkq6H+kfTyScm?=
 =?us-ascii?Q?020n55JFY5Qpmn3ZLebeUJDDzBVSpMpfHrhUbLwVYHv/gh45jMK4g7KLYQaE?=
 =?us-ascii?Q?f797LPhbDQEGe8vEAl3jLiR0yT6cXuwj0EByV/MkWyAuFM2KNk/AWpFBPSLp?=
 =?us-ascii?Q?6xcemKcb7Is7JI6XkVqKegTj2by8zHqM9ruj+DTUvKoi3Cc9SCclYoVh4GM3?=
 =?us-ascii?Q?iXZRmRsKDSOLFWljIKZBbTyGaffDhJlJxodQzGVpdRwoKbb95XcCjp+GSC9x?=
 =?us-ascii?Q?SGSpwrzUZXYL3hkMC9eCg+4NdO3J6UyqgA5+lSaZ4idQit/gfZ7xW+G+a056?=
 =?us-ascii?Q?RKIfy8FOSSo0v7nRKOwwjaq6tMjW7vV3ow665DxjKN+2+taD5mang1v93F4v?=
 =?us-ascii?Q?7Hqn7N1OVI5uGfbf6YvpXamATNRXphjk8a1Jb4enU0sqXBEGpCvMDgAKPrjd?=
 =?us-ascii?Q?E+FKXKJr5jIqovOq5yzzC1whfkaR8vE4JySYfFNde8j4WMIOvOtTdgtz5A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y5G5bav8OdJKPovznLVzbqrm1qxWQZ75CZjpFACRZacONK/bh50r5i+qFitU?=
 =?us-ascii?Q?KqdO61lT/0BEbZajFGkcnVqc6hYjaR0ng4S3mAXAFNM9QVNEgdfRa/ZdfLAB?=
 =?us-ascii?Q?qZKajCtpDh5GU0IruTpmQWOzcNg8oJJjSrj8E63xM+l4gRVxpcgQgJtD6grG?=
 =?us-ascii?Q?6MEaxEubxwu37wmxlNdtHXOy1jJ5QEVwDP9IJC55g27LfQSzWdlyKFgbi/jB?=
 =?us-ascii?Q?YMWPUK5sZNdrYsQNjyg2q1/+234AnfevVRwo9wZh9cov/3U9Sqa7gEnNoz6H?=
 =?us-ascii?Q?BB1fL37zcH7RNZMNE2VynqQjTM/wZj+ysCEy4K0wiDVcuuH0YOdahkBAfE7H?=
 =?us-ascii?Q?EBjLIUy5WmTEiKWDxA3q1AXk+vfIfBiC4Gx7I46W4lF77SYr/dlecKRWR/Dr?=
 =?us-ascii?Q?re131QJ9j4f+vjY0cKJ7wOlBPiQcUzI4c0COiBqoVT4t0q40n3Q6q7yWTRC1?=
 =?us-ascii?Q?AvnViR5yK/aA6s5h/96yJaxPVqnSfBM3z2cOIZ3P02yzoKuixaPSc7Gp/CpJ?=
 =?us-ascii?Q?yUXsxZkxF4RFDuzmF1kfiX4vcqRH2UYl7ynXDNhr+lZ9POXp4V9KUdQyRZsF?=
 =?us-ascii?Q?4LZKBlEWmpj4c25DeLxj+Wppky1ewpvxPXzHTMJWPwb+1DxNv7Aav+VwuF6Q?=
 =?us-ascii?Q?d+Ey37/sPUNU3kT9X1bU32ynaM71Dokfv8028DIde7yBIKlfAO2hUS4FZHd8?=
 =?us-ascii?Q?lEw70sFDnMeC9+1Ex1bjSEWX7zO49fYFmU7dWpncARcGMEUS2y424/30i4pk?=
 =?us-ascii?Q?GbCYQr4CLnO4MRg4ReIeUxBIrSaH65Fe/lMqeJg5edWTt7mPAarBZDmQc7l8?=
 =?us-ascii?Q?jBgKLZPIxEp1S1u36Bt1CrT0dgvAdcZywVSVg5Id8oLBO/PVh+9qw/3sEhgf?=
 =?us-ascii?Q?O14UQ5WK3CQWaOcQXzqHZNnK93X9dNkpAodBreilBDG8dI+KeBsGF/BPDUL6?=
 =?us-ascii?Q?kZl7tbQ8ypaJLCQwRedKmuELmxgld4XdfTijZzmrdjC8eiCe1RpVMlD8ktnX?=
 =?us-ascii?Q?6haBfT4b2ikSn2EIhVFaiEkVC+wMOKQuzCqoq4P/JXT02IoGPsdEnA/s8+yQ?=
 =?us-ascii?Q?j750hGUun/+eOb3ez3fkjDVSUgWl5qlWDzY3KN1MAXnUJM/SaiSgck2mngrd?=
 =?us-ascii?Q?79XeicWqktB56OVgltQalMqQ749L90krm6rUddSncrQidjiHV3Ts4hrkvXjO?=
 =?us-ascii?Q?RoFys2FFdLkYNYZhnOlKwgz44TCNiEbEk/7tRUk5T2W3LrqkszFfhXkucSZp?=
 =?us-ascii?Q?5d4bP25j3SEe4e02N+DXFbhGhleDs1ZhBikWlq6HbXOPmMaNfp/PgGgez9KS?=
 =?us-ascii?Q?d8fJHIisOUsHSIOjQEPCko5RN+xb3aXYi+6dpemZpHDyfGHLvzfglK5nDNrj?=
 =?us-ascii?Q?9CWGrJncisJ/05T5ycHT2YbA1NaaKeAm61gxz5gJCRXoSIRrIODpP3jr3Zpy?=
 =?us-ascii?Q?gGYIoXVZgqUxXP2s0y6fV37rPSHmmFQWu9LAWvaI3XTLNSJ6kqQ3D83LO/Os?=
 =?us-ascii?Q?UI/FIZiHqyfjjbQ7Xwm0ZGr6YeA/FDTfQ24F5zh0/Vi9dc0PLfHrzBtcGXN2?=
 =?us-ascii?Q?JYsqJZEwZt86iwREsoE2TmBPmR5E/E+xiT29nkvjF04Cgldx15RDEW4FHoGJ?=
 =?us-ascii?Q?OyZ4pCv+T2YMOTzyyTq93QHGsBhWv2Vyv4uo7io1EJTJ0P4A91hlTG62Akxw?=
 =?us-ascii?Q?gm4P7giGM0+DlE3fQ2M41+ZuL+H4yX1NkMp8cIXlwjW/KQiH/e551LeoHeyS?=
 =?us-ascii?Q?pU9VT105iLaG19WtVJ0JwGLnzT9bcVI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8de321a-5e4e-4d16-4ddd-08de484838ea
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 08:40:16.4751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5nWnmatsgrojliaFK8mflQvnh6IpNEZKR8F8d3JPNcAFDYX7aXCufPZASQAVTNEnK8idd9gTtjqtg29ugGuvgSf0FgRirPNXXSPk69e3e0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8845
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfXy4d0uptUsYUL
 g19dl7Iah8DgPHsvHnjGipz2syNXwbOECAd7D+2tgNxC9LnSUTDPc5DDNT/MK0VBxmISWA+1aTO
 JhYrx44CcfbeedZTkzqgfX2js+CTOxJQsw/+ASJ2oq4aVzkVuB7l9BQuxe8vD3qEbYKidXQHXpX
 x6bidmWvkjssRT8GG+M1l93CG1TQsdVKI5rELbklw02P2o57gJ/jrE1/U2tvjuV6FNp6hCcaXU4
 8Hj3xA9uu36k6e4taYrO0MgelRRFgHZkGuATDL6a4ZiCVyO8/8nAFp28y1WmQ6ax0odydOyb4H2
 4xnEq/AZgPZ2Khuyjtad87rm1J/Qks465djUvH0YFzRBN288a/S0zIRoQR5V0oM+IjOGMP9tulY
 FL79CgdDkjRH9PTUdWCDq/Myq+w/UiOshrbz3TOT82Nx+/0oduYUdwD4zyXZtaNxITANAp1bm07
 hSm2vvd7E7uDYA46qxA==
X-Proofpoint-GUID: nCn8t9fIAjzGKLI_8VeO3jePT2uPoEM-
X-Authority-Analysis: v=2.4 cv=OO0qHCaB c=1 sm=1 tr=0 ts=6954e172 cx=c_pps
 a=LWr4lAA3g636x20Wckjs+g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=Lc8NSlXapXXr_nlJwJIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: nCn8t9fIAjzGKLI_8VeO3jePT2uPoEM-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310074

Switch to using the sub-device state lock and properly call
v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
remove().

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/i2c/ov5647.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index cbcb760ba5cd..bc81f378436a 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -92,7 +92,6 @@ struct ov5647 {
 	struct v4l2_subdev		sd;
 	struct regmap                   *regmap;
 	struct media_pad		pad;
-	struct mutex			lock;
 	struct clk			*xclk;
 	struct gpio_desc		*pwdn;
 	bool				clock_ncont;
@@ -807,10 +806,10 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
 static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct ov5647 *sensor = to_sensor(sd);
+	struct v4l2_subdev_state *state;
 	int ret;
 
-	mutex_lock(&sensor->lock);
+	state = v4l2_subdev_lock_and_get_active_state(sd);
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
@@ -831,14 +830,14 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	mutex_unlock(&sensor->lock);
+	v4l2_subdev_unlock_state(state);
 
 	return 0;
 
 error_pm:
 	pm_runtime_put(&client->dev);
 error_unlock:
-	mutex_unlock(&sensor->lock);
+	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
@@ -886,7 +885,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 	const struct v4l2_mbus_framefmt *sensor_format;
 	struct ov5647 *sensor = to_sensor(sd);
 
-	mutex_lock(&sensor->lock);
 	switch (format->which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
 		sensor_format = v4l2_subdev_state_get_format(sd_state,
@@ -898,7 +896,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 	}
 
 	*fmt = *sensor_format;
-	mutex_unlock(&sensor->lock);
 
 	return 0;
 }
@@ -916,7 +913,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 				      fmt->width, fmt->height);
 
 	/* Update the sensor mode and apply at it at streamon time. */
-	mutex_lock(&sensor->lock);
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		*v4l2_subdev_state_get_format(sd_state, format->pad) = mode->format;
 	} else {
@@ -945,7 +941,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 					 exposure_def);
 	}
 	*fmt = mode->format;
-	mutex_unlock(&sensor->lock);
 
 	return 0;
 }
@@ -958,10 +953,8 @@ static int ov5647_get_selection(struct v4l2_subdev *sd,
 	case V4L2_SEL_TGT_CROP: {
 		struct ov5647 *sensor = to_sensor(sd);
 
-		mutex_lock(&sensor->lock);
 		sel->r = *__ov5647_get_pad_crop(sensor, sd_state, sel->pad,
 						sel->which);
-		mutex_unlock(&sensor->lock);
 
 		return 0;
 	}
@@ -1114,9 +1107,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-
-	/* v4l2_ctrl_lock() locks our own mutex */
-
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
 
@@ -1316,13 +1306,11 @@ static int ov5647_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	mutex_init(&sensor->lock);
-
 	sensor->mode = OV5647_DEFAULT_MODE;
 
 	ret = ov5647_init_controls(sensor);
 	if (ret)
-		goto mutex_destroy;
+		return ret;
 
 	sd = &sensor->sd;
 	v4l2_i2c_subdev_init(sd, client, &ov5647_subdev_ops);
@@ -1350,9 +1338,16 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto power_off;
 
+	sd->state_lock = sensor->ctrls.lock;
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to init subdev: %d", ret);
+		goto power_off;
+	}
+
 	ret = v4l2_async_register_subdev(sd);
 	if (ret < 0)
-		goto power_off;
+		goto v4l2_subdev_cleanup;
 
 	/* Enable runtime PM and turn off the device */
 	pm_runtime_set_active(dev);
@@ -1363,14 +1358,14 @@ static int ov5647_probe(struct i2c_client *client)
 
 	return 0;
 
+v4l2_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
 power_off:
 	ov5647_power_off(dev);
 entity_cleanup:
 	media_entity_cleanup(&sd->entity);
 ctrl_handler_free:
 	v4l2_ctrl_handler_free(&sensor->ctrls);
-mutex_destroy:
-	mutex_destroy(&sensor->lock);
 
 	return ret;
 }
@@ -1381,11 +1376,11 @@ static void ov5647_remove(struct i2c_client *client)
 	struct ov5647 *sensor = to_sensor(sd);
 
 	v4l2_async_unregister_subdev(&sensor->sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sensor->sd.entity);
 	v4l2_ctrl_handler_free(&sensor->ctrls);
 	v4l2_device_unregister_subdev(sd);
 	pm_runtime_disable(&client->dev);
-	mutex_destroy(&sensor->lock);
 }
 
 static const struct dev_pm_ops ov5647_pm_ops = {
-- 
2.43.0


