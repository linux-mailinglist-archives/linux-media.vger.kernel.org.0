Return-Path: <linux-media+bounces-49619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48637CE5BE2
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 03:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD0BD300C5DA
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 02:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB26262FC7;
	Mon, 29 Dec 2025 02:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="UY3hjIQ3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848882135D7;
	Mon, 29 Dec 2025 02:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766975497; cv=fail; b=VaxiZ9DZT/Kfcrkme1oQbwOdoNSZ15sbD4Oy4GmealSxE4fqVTxwDtqK1Ca7u83CBJXwXACsVi+TSHTiYYVhp/gzh4fFQz2gLFmPyzl50TwnLEIZ/6/gtllFQut85atg9r9m4OSe2l8Lj6WJy9DYDS1JzJwtgRVL3zItn3bbJfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766975497; c=relaxed/simple;
	bh=bHaYB0gTyPBfM8TmrhZ7Ui1FNEwC8/aHpyrPiJyTZAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eyX25bw4tSVBNLeTz05fvrnEVVo/5kizv83xQxUWzIuL8p2WZfMaika2HQRaNdvDP2aBCt/IbhNRsbjW+hG56kxB5todDSCCND7DFHI07ZYR+MyThhbYDFFMUy9HK/v7OQff6IZFU8m0t+AOWjEZ3gKUaIYhuUJoIy4isrNSKU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=UY3hjIQ3; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT1t1fM151482;
	Sun, 28 Dec 2025 18:31:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=7HN5FZ7CcrAqKoHzQU5uEQ52A5OoiQPK8L7CAiBRDO0=; b=
	UY3hjIQ30uadAKrGUxYy6A/+wi4FN0FuRA1pAyPiBKv+Bx4kr1NlF7S0Hv9m66Gh
	KztjEyrPiQttPOJj1PkHpR/1veYbPw0tpV7u0ROckzD9sqKflwpLL50kXUv+CvEm
	PnWq2Nfq4QXYzhdg4OOvqiT/QaQSirC/01zP0secQ4pu8ZeLmrQ3wlPUp1VwUAs7
	rkzj9daU/8BAtXrLSTwRPFpK85a5mZT2xOmmP/5njj0L3gKMcjqsj7V5zayvQVCv
	PO5xtNtfSygSNi8+rWu/mh2H+sbvOezk5WQQNhQueVOmOFR4DxZAxb47S5f0bU1q
	lS2n9FOz0z20FxNNNlnJYA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010049.outbound.protection.outlook.com [52.101.46.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bafuk9020-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 28 Dec 2025 18:31:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rw+u72Dxjb2VRtFddzmtU8kW9hmc/2w+EOKSH02eWJfsyD/7lxw1oD8zMKV7uNCevulFb2lID1OhGH3aoerAUeKgUofHpL+RiRbetONlWVKkOu6pjMOzdgUZVsTrIgju55BQwiUWnbF41r4BVnBKkkivUfrZ797dZ3CSu9t+aRzKiHQmBQSA+P3dYSt3qvNIGbeBN0xV/mCOt3uQ+wAyu3CR1neEfLtWSBD/2ERuZtu2FNpGGs+6j2DuhBoZCGd2TvL/Vc4dS0CQ3mNG97CfigLO9Q3Cr0b67kmCvcn9fjoJWs/NZeVZhm9My0OWSxcV2VN5nBu7/GLf5/iusxjzcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HN5FZ7CcrAqKoHzQU5uEQ52A5OoiQPK8L7CAiBRDO0=;
 b=OuCYUmZVN4FqC8Ss03uNuikvhWtW27CozhgM0rjWGcBxxZRmlNWHO9f4VC348mtw0ZTOT+nq09CwplbOSUBFqRgwlhManioyafm6aIs55VkeXQ4s/ymPs/OQ+dEIfFm+BAaMpMN6I96qPxLjFc6UP4ZpiSWyy6IuVrnJjT7tgRtwGqqxS29y52n792x6OoyOweiZtHRMEYfuFPYFC4WGvPInFW9a1EV9vtx0NwO+IMwphG2VhWUYQFeA5becPQUhYki8lWczICE7bhVLcTr82enyYygeZcJ973Z6WMIKKwchHPRxY00/1pt7DOLrYl5WpsJs/+51Lfpcnmxxr7agRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by MW4PR11MB7103.namprd11.prod.outlook.com
 (2603:10b6:303:225::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 02:31:15 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d%6]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 02:31:15 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        dave.stevenson@raspberrypi.com, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, xiaolei.wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] media: i2c: ov5647: switch to {enable,disable}_streams
Date: Mon, 29 Dec 2025 10:30:18 +0800
Message-ID: <20251229023018.2933405-4-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251229023018.2933405-1-xiaolei.wang@windriver.com>
References: <20251229023018.2933405-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|MW4PR11MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a12eb9-7376-4375-a272-08de468256fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PlDEWfu/kMc809T3roUCH/r/dAajS/NnanFmIT8/Cv8eEWxP+fOby9nUNPmq?=
 =?us-ascii?Q?jCYjkrSEXP9zWMXkC16fx7V8/K+bAGYzhFs8/3/+xkUrdkfX1G+SAZW0167W?=
 =?us-ascii?Q?1w/u6VdN9tMwALESS4P83OM/nGGwAasmqQd7QBI/ozhow0ckb5DLedd047FL?=
 =?us-ascii?Q?mtYKilcnT/LrJNrhaUa5WMx0S2ESKVobE/cPcXAjLlSe1rMx8o5tMBdM4UM5?=
 =?us-ascii?Q?9kweFpDcCG/gzESnY6PkgJqvkRCuGb0MvjbKR/4y9ApZ9s439ZepDc5NrgXd?=
 =?us-ascii?Q?mbmD16dryLOavt3oSUucX5axPE7H7kch1qJ101IsWaDnpGoQ6ADCfwAvdBpp?=
 =?us-ascii?Q?ny5SYtvYg4yVbaV8yoGkMsBgzUtWW0Q74RlxGInTNSH8JspDHL4zZpCW0l25?=
 =?us-ascii?Q?fPu4EUMbqjWRbkRp9x2RJTPLjh5Lk0+8HHjQKGJv7HRiWmhdkro7DdfkXGP3?=
 =?us-ascii?Q?p295ioiYSJFsCv9DCMg7UB9vhbLPN4QebcyT90PdW/1JRZ20BSvzoVD1V/g6?=
 =?us-ascii?Q?MdZLdLWXJUtMCHzYhmasm1oA1FsEIsEMU/Ipx6rHB0el7UmrTJ8at1OybuEo?=
 =?us-ascii?Q?4zLbvDFbDGJrfEOOW3Kmr2hTh+QQ5V0RqC+xrCUEsGfGJJ1P4Xw1ik/ut/Xu?=
 =?us-ascii?Q?v8AkGFKTcdmezzls+HD6PTYnGTshBrRivGpDEaL+mDaO44jQ4AMALsFTLkJZ?=
 =?us-ascii?Q?MYbKxE2lPuqaizC2P0jahikWxKgSgr7GGrSHp2sw4QDC+SQ3Wmgk2GCrgxoO?=
 =?us-ascii?Q?9wZDqcIL4NE4UAO1ODOcJPGXmnyvIIJqrJD5Db/EP1N/X0Uskfn6PJuEC4bM?=
 =?us-ascii?Q?67rWMiRhfTiSsRqU3O7o10fOGFYvphfIWRjWzG2Pe4drFXqR3Lz7MFKb6I9Z?=
 =?us-ascii?Q?lvcRlcIHIb3MJmX1Tgn1MlsH9/7S4FieJkGr4NRFXfAIQvf1tf0lPk+xxa8G?=
 =?us-ascii?Q?5QLVv49ZCah93TU1G3w2+WQg7uTQZqEildJj9UiduL4vD+t6TcAMc8EA/Jc/?=
 =?us-ascii?Q?AEYoVAj5Ss3xSse3Ew5fuEnLBAOOe7P/HUxlNppBZw7uU8bTIs6uIlNo7uS3?=
 =?us-ascii?Q?afVLRLKj0TOm65OuwOkUboh+tSmYHD8Vcq1fCtPEPI4aTeLeqq3E/hMEPQ26?=
 =?us-ascii?Q?leZ/XeBIzMRxPYxEh8sP0vjMNWeeLCuBkZrNC0+H57o6paxZX6JLEpP8/D0z?=
 =?us-ascii?Q?/kDteQySfotABVNiWULKG5j1a6RJAIMHOO1lYC9qlqloOeDAunRAjSkoeIj0?=
 =?us-ascii?Q?Qr/Ur5+aoI3u0u82Yu6p2IcOgDWe8eEkVgbbffL870v/2Da1Az9DPyrON1jG?=
 =?us-ascii?Q?az9le1ESz+ME2T0GpIc4y6TpvQtIT/iSLVcIO19xHoDVpMFEHHLW2sUlkS17?=
 =?us-ascii?Q?ZPcLjeUHnnCqsKUCctNaNLYWzTRsgLC3+rV8nECF+6F7AzIiBPIZ4BqY1uA8?=
 =?us-ascii?Q?iR1w1SCjYdBIsH+PdKKgIS05tcueJZxpzuUycMU4jrAwtl1hEF8bgV22zZDu?=
 =?us-ascii?Q?GqBvjCH7GGMZdw9YKqUcqhL/SA+dOybTlVKZLHa1BBmlmJFfaTK5vHgurg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UR3rW/okekRt+NlIHniW1s6U+bLLZCCAAa1MfuQHTHDlBKVXhpyAdb9T4mpe?=
 =?us-ascii?Q?o57tuQHwEmz9A22ORXPfJoRzL/lESo68DMjbswtL0K1AMh5nUGNRSueP/IUe?=
 =?us-ascii?Q?0bXSkoS4b8rgQQ3E5LlcplBxCVt7cBYrkr4A8XNNdsL+SF8cg7F2wjDZQbES?=
 =?us-ascii?Q?KhKVnvvqEzn0/86AAEsBnwoM4ZSYR2HvnUj3Nc342Mx52+QfXRKA5Oex2VDs?=
 =?us-ascii?Q?rnF+NcZXIw/IDddJ5BKCaVEjazTpgkFk5lg/UmeOSVvFZfmjeLjNfgpL7K1u?=
 =?us-ascii?Q?PMC4ITMHyD1/KDyF6dTWaM78xX3LM6TgX94fJcF31QMGxwOpwHsRvGTT9bt8?=
 =?us-ascii?Q?dDUuTHPgMYk9YA60PiYw7gJFhSmiQ7wRAW63M5wl1eGh4AhyE9iHygpjBByk?=
 =?us-ascii?Q?rIqvzSHLdxv2qJw5f7UXPvO8f1qCvohLIkmBotm7EPfjnUdWIp1ObwmMJrCa?=
 =?us-ascii?Q?nHMY4r/3EGuemLDvbiVerqnaUzfIvV7jJzZU1yD6iTHeC2V0HWLvFld3bt5H?=
 =?us-ascii?Q?RR/V2zQ85esWc811NP5H3dibHt4tD0+sYMXJ5eBL6I7F9UBpuIDPs3WT+uE9?=
 =?us-ascii?Q?sJI9uROZ7zp9n6Rp9fqDSl/wCR+5dvpthuNyTb0oFPHH5oPH4N4EkNZaCbzQ?=
 =?us-ascii?Q?Aq2dUGByeO3Nnq3XUSv//YhBhKYFwxJSx0uvKtKOol95iafj+msbX9wGPnqx?=
 =?us-ascii?Q?WTNQlk6xBGeg15OgPcf1erU2hJiWr9hxv0Ybkp8ZqSCYPHKhv3+52d6eEh9B?=
 =?us-ascii?Q?CFXVv/XPQvgfKfbhBQJr2l3IkPWldsqnRQoY1fF/m9b62nEvF3q94FNN2f0E?=
 =?us-ascii?Q?zmjNuUAJol6L1/EDxAcgXCaVTgP2t1wiaeftUJPRmRkUjPj9TTnc9gr3TqCw?=
 =?us-ascii?Q?h2aUSWLTKVF7wcj392fUopIeNXeqPvP7zKIC9hdT6nmoEIK/g6VnrLZ/f/df?=
 =?us-ascii?Q?iGoek0Q5nROFU+XnKsp0PrDivhcEv80SzHPDaXK866qxAcfqqeW8ojI/X0je?=
 =?us-ascii?Q?mPW5FELXQ5TIHKaEUFm0Ona77JO3u3GUA4vPOtaOupY/e6n1qoZog625w26X?=
 =?us-ascii?Q?WvNMatsJh7LNvTC0FazRag7j6bothzBJTmqRAsn1+wX9Fzidvou4sa5ecBjx?=
 =?us-ascii?Q?YmqTQF/7HmsFjDTnqSrnwYxvlwysOq+SOl7WyxQ/kwf7C0fvUKcB0djsZHHC?=
 =?us-ascii?Q?BlanmtWHn9puIjsgd1jk4eAL1/QTyBwFClSKmu67c33YfZbovts8RM//iilo?=
 =?us-ascii?Q?R2UrvbilGeCpYz/9ppn7OXrQyhQlBOalHjrrm/GE2e6t7rJyvokQ9N/zkNad?=
 =?us-ascii?Q?teMW1Dx9Ikzr+KQElMcGHSSyJeDDacMeHMh2CGBP+1hkZIqJVu9+u17XkRaV?=
 =?us-ascii?Q?bLtts+VSHPzk8JVDp1CFVyut9I4JU2MVncQnM5IANH9djQLNHlBNaC4Yc6bq?=
 =?us-ascii?Q?w3rwimCH0zC4K1OeNTTal3c4GynHxhW9PKd89vyT6ErL5FPQYZPA1ONNlWh+?=
 =?us-ascii?Q?g/8krxzVhTo0+7ctKvOT8Li3WSj1tjUxobHuE7Co+irh8JXIW1WEZMU3Oaux?=
 =?us-ascii?Q?LUzDgZJnaAsSps476PL9UFwo4UDj9bVMaJrcpgAMhcjfD4Sv42QNSSfw7lSI?=
 =?us-ascii?Q?MYswZoNmgdXP5hxiJgACf19Qh6eYXOnMrED/HQ6Ai27IevjQRvr7snw1cvtm?=
 =?us-ascii?Q?GYBRFaabIHQ4z42fzZoycHRdVaiWIaBtyniR3cdVb1qC+Ladd+ds43ai8s26?=
 =?us-ascii?Q?/YYheD3RkLcWGA/IPa2v3T+c8Zuor/4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a12eb9-7376-4375-a272-08de468256fd
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 02:31:15.4253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBODPz50bH7zERSrUA3BOja9lI514SENO1ecfLFv5osBge/hi8ies+hnObV930wFs9hKmFmbqjIPOOVT3XrtEC2akMwTzSUI6GG91lbquNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7103
X-Authority-Analysis: v=2.4 cv=ccjfb3DM c=1 sm=1 tr=0 ts=6951e7f5 cx=c_pps
 a=+5nsKerQHvRPAoQt0ERV+A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=pG3TpReAhpfUgZjo6d8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: -W3XJNbYKc3L4oF7YFqY4OOc4GBVpXct
X-Proofpoint-ORIG-GUID: -W3XJNbYKc3L4oF7YFqY4OOc4GBVpXct
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDAyMSBTYWx0ZWRfX7/ZbqR46+kFB
 6jcPpgr1pViteHBTOzBEv0Pio/W8BjkAhrU3YjItzNxFgtTvXZ2iigTJbG3ChBHoPVysAOBim7j
 f5bDXfqsLSFfeoM6WGJ0LHUfKk6iZqlvfMM6IknNqUgY8IApDVEXjcBLZ8vLS5K9Vs7/AcKIGHR
 6PRhVUGzjWplYC0rYwA9/pM02BCPxv40Vt+ISfadzqbIps6BmerdbAsKCYpiXD6EKEoEtODkJ8D
 F0JLZwCQDuuJ8o0Um2qvXFVmlWJN3lnDBNdXmr6G5WZKopgNC1zZ/y4JG0CFaUusqcVC2SprOLI
 2ccvJ4Ci93fndTFBFwUnWIr7pRHosW5ZXMkaH9LzFSWE1c1KykrKzyYeH+mUB3Wv8eFbWnTjDTr
 Z4IEoLFkeC/e+ZCPR6xiS1tEgbvgJvQKUPkvUrtkDfLBm7z7899OL1Fued90o/oHkf6xQSFAie7
 Wt6UIzbKdR682MjPKWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_08,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290021

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/i2c/ov5647.c | 69 ++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 40 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index f0ca8cc14794..7f4541f46335 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -637,23 +637,29 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
 	return 0;
 }
 
-static int ov5647_stream_on(struct v4l2_subdev *sd)
+static int ov5647_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov5647 *sensor = to_sensor(sd);
 	u8 val = MIPI_CTRL00_BUS_IDLE;
 	int ret = 0;
 
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0)
+		return ret;
+
 	ret = ov5647_set_mode(sd);
 	if (ret) {
 		dev_err(&client->dev, "Failed to program sensor mode: %d\n", ret);
-		return ret;
+		goto err_rpm_put;
 	}
 
 	/* Apply customized values from user when stream starts. */
-	ret =  v4l2_ctrl_handler_setup(sd->ctrl_handler);
+	ret = __v4l2_ctrl_handler_setup(sd->ctrl_handler);
 	if (ret)
-		return ret;
+		goto err_rpm_put;
 
 	if (sensor->clock_ncont)
 		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
@@ -663,11 +669,18 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
 	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x00, &ret);
 	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x00, &ret);
 
+err_rpm_put:
+	if (ret)
+		pm_runtime_put(&client->dev);
+
 	return ret;
 }
 
-static int ov5647_stream_off(struct v4l2_subdev *sd)
+static int ov5647_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov5647 *sensor = to_sensor(sd);
 	int ret = 0;
 
@@ -677,13 +690,15 @@ static int ov5647_stream_off(struct v4l2_subdev *sd)
 	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
 	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);
 
+	pm_runtime_put(&client->dev);
+
 	return ret;
 }
 
 static int ov5647_power_on(struct device *dev)
 {
 	struct ov5647 *sensor = dev_get_drvdata(dev);
-	int ret;
+	int ret = 0;
 
 	dev_dbg(dev, "OV5647 power on\n");
 
@@ -706,7 +721,11 @@ static int ov5647_power_on(struct device *dev)
 	}
 
 	/* Stream off to coax lanes into LP-11 state. */
-	ret = ov5647_stream_off(&sensor->sd);
+	cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
+		  MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
+		  MIPI_CTRL00_CLOCK_LANE_DISABLE, &ret);
+	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
+	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);
 	if (ret < 0) {
 		dev_err(dev, "camera not available, check power\n");
 		goto error_clk_disable;
@@ -803,40 +822,8 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
 	return NULL;
 }
 
-static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-
-	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
-		if (ret < 0)
-			return ret;
-
-		ret = ov5647_stream_on(sd);
-		if (ret < 0) {
-			dev_err(&client->dev, "stream start failed: %d\n", ret);
-			goto error_pm;
-		}
-	} else {
-		ret = ov5647_stream_off(sd);
-		if (ret < 0) {
-			dev_err(&client->dev, "stream stop failed: %d\n", ret);
-			goto error_pm;
-		}
-		pm_runtime_put(&client->dev);
-	}
-
-	return 0;
-
-error_pm:
-	pm_runtime_put(&client->dev);
-
-	return ret;
-}
-
 static const struct v4l2_subdev_video_ops ov5647_subdev_video_ops = {
-	.s_stream =		ov5647_s_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
@@ -979,6 +966,8 @@ static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
 	.set_fmt		= ov5647_set_pad_fmt,
 	.get_fmt		= ov5647_get_pad_fmt,
 	.get_selection		= ov5647_get_selection,
+	.enable_streams         = ov5647_enable_streams,
+	.disable_streams        = ov5647_disable_streams,
 };
 
 static const struct v4l2_subdev_ops ov5647_subdev_ops = {
-- 
2.43.0


