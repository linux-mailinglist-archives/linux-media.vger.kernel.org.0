Return-Path: <linux-media+bounces-54564-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEyjM3kIqWlW0QAAu9opvQ
	(envelope-from <linux-media+bounces-54564-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 05:37:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCFA20AD9F
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 05:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9786E3096048
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 04:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD411DF987;
	Thu,  5 Mar 2026 04:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="ekUPBfKE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E598286400;
	Thu,  5 Mar 2026 04:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772685326; cv=fail; b=GTReOVlQA+KuNQW7w7Ptamh3SpMNTX7NimtX4cXxHqqy+SiOHr9Sz92gnLg55Igk02Qfn0ju9YxzpYmLJrAbn3/X/5EhYRtNwWgdO9vysgb4LvpHo1hzD9qeCIy7DALFBQ0X+oVnYZMvUnyimJPiRq9uWqdV/l74bowbQkXwJ2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772685326; c=relaxed/simple;
	bh=/lqBUnIFKFmMavSAX2+xgXKqBtAHBi8ZSnaWBXDsUAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UJONlHd9wz0D3U8dS6GXdDtt1wf3rAcXFFdL9jsL3BKkRWakQez6mCqtnKsFZP8RBEl37spZvATmStNcsToHpXUlguEDe6N1ahighn360meGxxabEF0rU20eBxPyuK4uGHM6YjyIrTqQhrJBKhrTg2Ay3uHw0vlWUXUmH94InSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=ekUPBfKE; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254Hd0U513153;
	Wed, 4 Mar 2026 20:34:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=6lBLeAmE9Nju177Bih1cgna2MZqkoAL+xQBK8E9yjwg=; b=
	ekUPBfKERSxeyEXqpg1kYniA/vQuipASF+w9llQHinbJR4WGR48xdGdjnXKANY+O
	RFs51woRdA8VDAJok0uETCf3YOmqnO/HLpC4OByLBCyeOnO1jvggmdfZjGXIf3eD
	ZUus2fazUWKszb3aB6FABYjYjTmtwjDpRti7Gdb+CrKBUVziwrVYcrYYVjK/dF8w
	OYZTzpQT8kUawLx6xiTzMEgJGBY0drYlF6w3Y8eJXtS0Vtr3wNsBnqvO+IYSIRvB
	r9rQET1gVQ4DMhGpUbp+LYL6ifLau79DQPcm2CiBQ7oLpx9fcFRvJXUMgio7Szgv
	nBrvy1YY6BcO1oSBq2pPsg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010051.outbound.protection.outlook.com [40.93.198.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rgnfp9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 20:34:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddTDfrSBrJW3t3yPs2xxH9PMPOj9KbyQCi8xbXtgBCH3gaSgHOCHuARRgHK4V0/kd68qA2vNyi5eS5rQ+UTtJrJyL7TOlAqLog/wrL/i6Nwm2KV9W9W1X+aUCB45tDNupTp6myA0p9W+sRgm2D7LnwIGARsWi3+6h56VNljP2psAdq9TvqOFHKyXcQbHhv1WrXkWeCvaU4SQyJWd0Ysq31mbmp85lvRAcSKdNKpkyL5v+gYfs6gws4m//OT+L3hHfXM/XtwI6VZ/H13E2v0hd/qLthGCU6EsD1VTDrEbl4vyaKmsJumHM8dXwie3Up4HiQUxaq1LqvMK968JsJROWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lBLeAmE9Nju177Bih1cgna2MZqkoAL+xQBK8E9yjwg=;
 b=j9ATQi4TtjZxAhFimDzDz/JbsC1USNvXDWlaK+2rY7Ghun206uJLVduIW/3MHBdIILPu7if3yzEggpN6PNi+b5XjIpTC9yIHVBV0B2pe6MFM8Ej4+/kHP66jHkFMxc7D1h0MojQEgN9CO6RH3dzpXOB1Jk63OW/VP1pRFKd89LJafR+EZ1F+zSZunKGiO0W52OhznsaCCqBwCcMc/h8fybPtVS9ChTwBEn8feoUwgcgV02AmXwEYvdfS75d+1Bf048x1T8y67vyDlxvEt6SnkaapQCrDJhwsO+z49PBc68x2FcCM6LAmm65SelDAg/FSPROG/GkGSiUdYizQ/xwjfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by SJ2PR11MB8347.namprd11.prod.outlook.com
 (2603:10b6:a03:544::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 04:34:22 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 04:34:22 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        tarang.raval@siliconsignals.io, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, dave.stevenson@raspberrypi.com,
        Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] media: i2c: ov9282: Switch to using the sub-device state lock
Date: Thu,  5 Mar 2026 12:33:49 +0800
Message-ID: <20260305043350.2151936-3-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305043350.2151936-1-xiaolei.wang@windriver.com>
References: <20260305043350.2151936-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:3:18::20) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|SJ2PR11MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 96bceba6-40f5-4942-66b0-08de7a707935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	ROXuezPY1fSRG3fOKAElczBHZxUXM1XRYL7F7WVCfW73iecBw9X0xPgMc8PLIrZOP1gM2mGNJ9PRqFGcqN/S8nylHD21KGwnKzy7HCkunTXWovStFGZVJn4cPXabPsCZIzjq+YkkJIxxxL0GtOk6v7XAMubbSu9/3q9tf6BkaK9gpnJfOLebFCxXg+sUak1CXyZIVv/yotf4D+lXl4HZZ6d8HcTaKcbBxfRNGextiJzW+xjx6xM8Q0Zm9CZcKUcYCsIyGSyWVUmBPXAmC5sboBfkmbl40uwUThXS8YPcv5kCMOK66BXblGXgqvMDlnAwJtSWua3OdfWpWE0UBaraLx3W7hPGhhKGPzW8vERC933Ouq/L6qogdJe25lNadzAzqz8A6/0oAET6kuxm5+8k6KyGFF8aNEJqXohNs3gGEjgAWgl6rDltdrqLxdoCNpOHG/sTY19JjDlAKh+vOGTScxqthTV/JzbS4siIHfMC944c0NK8NSWMFT1gJjfeDRc4EjPslCbGeyP3ey2Ox7ybwLWtWZ+N6wkTVIm7zj/VrW7XBqXemzJpKizHpUKeOVN0Bun1AM4YcpGfQ7dyL2zzEXn49rx4mYf+m/MgTcKBS1UZBB6j/QyYq2MueWfiVIjvuDr6z5OyuAdU4O2tUR6tgYTYUqQx72/u4c1vPkjzpqo0XdZ+Ee35Cne9jGBEQyHce/IW4W9NAqQRIFasXsiS36sDM4ZSAeu7SO/pYCNxS8DfocSAgH6n8GLOuV5P097MvpoyzDGmHDYfDx3j29h7VjoOOdjfldEv/p6JBkfd4daYyjrtEVYmSdBd7OVnRD6N
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wd/8VjcQhs6Gn9QlLuD0qXb76dl3M1606wrw0EBaubWDBpnhHuTkBkI/gUuO?=
 =?us-ascii?Q?ghwJRUvAu9mwW5TQl2OrsT2nsr7ucSpg8enr1rT88shtBNEfbduYGM3fsrPV?=
 =?us-ascii?Q?iRRwCw3UM2HMWKyohs/haGTv2qRKCokmiDjsBezzYxtHMtxnFxzgtsVEeuah?=
 =?us-ascii?Q?Cr3h74l5LwY+QcOb1pwygzNUtO2lavCdfBopWouA3FaOi5fjXSOne9JjeNKr?=
 =?us-ascii?Q?5R7KgiThzC50ALWrRJ7BjxDMYZ8tpml5AinckCNReD99mN0bWTh0xnX3lbtX?=
 =?us-ascii?Q?sRyjE9ckt15+nCLuKk28kvhd3hAeloB9T3zSS7/rcvVVthWjQ7xf94qYzUiZ?=
 =?us-ascii?Q?Lb1eL3B/UNv0y3So/rAk43Gb7iqXiea67AaEBGFIC/5GFh5t1ZNJU8pOi1Gu?=
 =?us-ascii?Q?g+Pwke8MolWtwmNUyZmv/GUnWwb6NPVA0btp/tGudU/emixp3DutYhJIWm1v?=
 =?us-ascii?Q?TKMIz3BhFeudjyrYpcPsqyWtJz0Oj6ZIijtpp64yvvJ/X4tRx+MX0jpoJADU?=
 =?us-ascii?Q?GeTMZPiqOyJwy8W93dORboW5AwiWTAhf9o+f9KinPbNEszs+gXENSeHNJDKf?=
 =?us-ascii?Q?WeVQ+ZC/fOxptnKMYfqO3eItnPf5NgwUMRNHqCvuQi436fA0SDiEKU0QVDid?=
 =?us-ascii?Q?rYUPq+E//Gow4LeaRli/krh1mbpX9Tbj5j8DV4ewO0milgZXGO+h07vsaYH/?=
 =?us-ascii?Q?ZGJX29HE9acAqL1YsVlQO6cg+scQiAimvCWPtlPHX84JjWpge9thdi6ALV2m?=
 =?us-ascii?Q?H9Z9m7iBRqKZKGoqX0vYcpkSfON895SlxefvVDDFtYEM5evilaxMPpcz7jiT?=
 =?us-ascii?Q?LYl332/IBQiyr86B/K9SH6trcuku/RdesMpuSqwaMwzcDVmCjTgaX5BkQ27h?=
 =?us-ascii?Q?TIcVGE7bT061q03zyZly0TF2GCxzb0eO/wn/ugeE6/4KXkjSv1IGjaOhdd0l?=
 =?us-ascii?Q?J61xYp7Qqbs/Y2gKpw7e7dOOcdtLvuGTCJ/9GnfeP/qk1qdlK9Jdwkxd4/3/?=
 =?us-ascii?Q?RC8u1E/EvKvhGmMOASfHKOTlQ0cl68J9S9i92uEvjObdZXjtKlHaM0HcwS/B?=
 =?us-ascii?Q?/QfQ+PtYudM28QmoMSZwFac7SL6NXNCDxnbMhN9IkNpbSSwSDVTHZ+4mi+i6?=
 =?us-ascii?Q?8/S/yDSdpK3iYxCYCfo7vTvBNpXKYBhxFcLP11xg+mOsKXRMO3RPacYMQHKN?=
 =?us-ascii?Q?HPFK1JX7HA5HTy55YFGdFnOqMugeYdWHCHRImvAQZBn0MewyM9osviX11nw0?=
 =?us-ascii?Q?DdwkEUF+542Ov2x3mWIoUoPXNjZOACspOk+zebYoxjsU/+ZiDzDwpDyIB8YV?=
 =?us-ascii?Q?ZExxGPi901/7aPC3hsJjjKde6CiaC84hC0tIjktxmy4b9M01dhBGnXteai59?=
 =?us-ascii?Q?t/OAaP5HlPIflaOTZecQYt8lTepF3UOMJ12s1BBESlFX0giePZUnE60MoM2D?=
 =?us-ascii?Q?ZWbhBpxA0FGib5oAuDQHEqwAdnzfe9DRC7LtXIyqCW4U44T5FKk7ZLb9g9uk?=
 =?us-ascii?Q?GJZCaMiHhBn19Xujn/UzpOgt41TQADO2YL9LPsSYDMvNKtGX06xqDY6XH6O6?=
 =?us-ascii?Q?BgD9ugw1gIzM6bZwx+kjHnxwmNNrCWOzKIEpzSddNMO/U/5oq1SkQUQMggtA?=
 =?us-ascii?Q?bT3sg4+BoWouRh8dRjYCX9KORHVT4k126U2l0G4lKTkSiy1mwW49+7K68mUu?=
 =?us-ascii?Q?FKg+GdWfVggvYSnicsovt5hUMeChCHkX6RBpTSlegF7pQ+2CVx6A2dhcmsba?=
 =?us-ascii?Q?dybYpVlo1EqMGcaVooLgJQAhzfGxELU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bceba6-40f5-4942-66b0-08de7a707935
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 04:34:22.3282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FaBGvCu/BFkcabhTjvl6Z23dcwDQaMZmocBiVquGqithV95bVKl9pXy0kbdO96pIZPcNaHEuHy9Dfw1uCTCp1Rr9YdKRl0usWNCFQVh+OQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8347
X-Proofpoint-GUID: i9-5skMpCoMBb41rPglQwcKb814QSELl
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a907d0 cx=c_pps
 a=PojWdYBvulneKNx6glcDcw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=b-pzV9cxAM0HHkGdTPcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: i9-5skMpCoMBb41rPglQwcKb814QSELl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAzMiBTYWx0ZWRfX/04bQx5nLhbC
 SKHrcKlbMRaDyuTFo2SgDqIQ58W8zNOnMrE0nZIg4ir41UnkWDc/HtoCQ1GCS2jJ9lDGwvr89XD
 XjcgJw9avt1CrkTEb7oDgVSy+/mmruZOqgWoeWdHFXq5P5jfnJnkpQ/8I2Os7bbFqScmtIIJoiZ
 Ty0tJcbHGVKtWkbVnKgoQbXv3DqPL40ZFW2EPlsstLMXv2tp3rXbD8XtCj/vGm2azJYIKAJdGf/
 pSkhH+cbdTkV0pTyq9es2CaAJFYBBJNqicDzfEdMY2RH6nwWxcsMavzU72BFP+P/OpTTVm4P1kH
 I28LUbrGkA5AlPXrnJvZbEYK3qk2ecKFjjn0a3yNA9vqCYS19yezrmmHlUfY2uKchLnTwMeQ53g
 Uwy6RBIB/qJgMnKl8okntBo1QnpfYuNmVlCQ9ZFbcWvC4otcSBBigyjLgMMPy92S34YSmw44uNd
 hTDI4xekZfYDBs772Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050032
X-Rspamd-Queue-Id: 3BCFA20AD9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,siliconsignals.io,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,raspberrypi.com,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54564-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:dkim,windriver.com:email,windriver.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,siliconsignals.io:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Switch to using the sub-device state lock and properly call
v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
remove().

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/ov9282.c | 51 +++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 31 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 56f854a4d04f..98e0a0732ef7 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -221,7 +221,6 @@ struct ov9282 {
 	bool noncontinuous_clock;
 	const struct ov9282_mode *cur_mode;
 	u32 code;
-	struct mutex mutex;
 };
 
 static const s64 link_freq[] = {
@@ -795,8 +794,6 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
 {
 	struct ov9282 *ov9282 = to_ov9282(sd);
 
-	mutex_lock(&ov9282->mutex);
-
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;
 
@@ -807,8 +804,6 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
 				       fmt);
 	}
 
-	mutex_unlock(&ov9282->mutex);
-
 	return 0;
 }
 
@@ -829,8 +824,6 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
 	u32 code;
 	int ret = 0;
 
-	mutex_lock(&ov9282->mutex);
-
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes),
 				      width, height,
@@ -856,8 +849,6 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
 		}
 	}
 
-	mutex_unlock(&ov9282->mutex);
-
 	return ret;
 }
 
@@ -904,10 +895,8 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
 	case V4L2_SEL_TGT_CROP: {
 		struct ov9282 *ov9282 = to_ov9282(sd);
 
-		mutex_lock(&ov9282->mutex);
 		sel->r = *__ov9282_get_pad_crop(ov9282, sd_state, sel->pad,
 						sel->which);
-		mutex_unlock(&ov9282->mutex);
 
 		return 0;
 	}
@@ -1019,9 +1008,10 @@ static int ov9282_stop_streaming(struct ov9282 *ov9282)
 static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov9282 *ov9282 = to_ov9282(sd);
+	struct v4l2_subdev_state *state;
 	int ret;
 
-	mutex_lock(&ov9282->mutex);
+	state = v4l2_subdev_lock_and_get_active_state(sd);
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(ov9282->dev);
@@ -1036,14 +1026,14 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(ov9282->dev);
 	}
 
-	mutex_unlock(&ov9282->mutex);
+	v4l2_subdev_unlock_state(state);
 
 	return 0;
 
 error_power_off:
 	pm_runtime_put(ov9282->dev);
 error_unlock:
-	mutex_unlock(&ov9282->mutex);
+	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
@@ -1285,9 +1275,6 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	if (ret)
 		return ret;
 
-	/* Serialize controls with sensor device */
-	ctrl_hdlr->lock = &ov9282->mutex;
-
 	/* Initialize exposure and gain */
 	lpfr = mode->vblank + mode->height;
 	ov9282->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
@@ -1409,13 +1396,10 @@ static int ov9282_probe(struct i2c_client *client)
 		return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
 				     "Failed to init CCI\n");
 
-	mutex_init(&ov9282->mutex);
-
 	ret = ov9282_power_on(ov9282->dev);
-	if (ret) {
-		dev_err(ov9282->dev, "failed to power-on the sensor");
-		goto error_mutex_destroy;
-	}
+	if (ret)
+		return dev_err_probe(ov9282->dev, ret,
+				     "failed to power-on the sensor");
 
 	/* Check module identity */
 	ret = ov9282_detect(ov9282);
@@ -1448,27 +1432,34 @@ static int ov9282_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor(&ov9282->sd);
+	ov9282->sd.state_lock = ov9282->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&ov9282->sd);
 	if (ret < 0) {
-		dev_err(ov9282->dev,
-			"failed to register async subdev: %d", ret);
+		dev_err_probe(ov9282->dev, ret, "failed to init subdev\n");
 		goto error_media_entity;
 	}
 
 	pm_runtime_set_active(ov9282->dev);
 	pm_runtime_enable(ov9282->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&ov9282->sd);
+	if (ret < 0)
+		goto v4l2_subdev_cleanup;
+
 	pm_runtime_idle(ov9282->dev);
 
 	return 0;
 
+v4l2_subdev_cleanup:
+	v4l2_subdev_cleanup(&ov9282->sd);
+	pm_runtime_disable(ov9282->dev);
+	pm_runtime_set_suspended(ov9282->dev);
 error_media_entity:
 	media_entity_cleanup(&ov9282->sd.entity);
 error_handler_free:
 	v4l2_ctrl_handler_free(ov9282->sd.ctrl_handler);
 error_power_off:
 	ov9282_power_off(ov9282->dev);
-error_mutex_destroy:
-	mutex_destroy(&ov9282->mutex);
 
 	return ret;
 }
@@ -1482,9 +1473,9 @@ static int ov9282_probe(struct i2c_client *client)
 static void ov9282_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov9282 *ov9282 = to_ov9282(sd);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
@@ -1492,8 +1483,6 @@ static void ov9282_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		ov9282_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
-
-	mutex_destroy(&ov9282->mutex);
 }
 
 static const struct dev_pm_ops ov9282_pm_ops = {
-- 
2.43.0


