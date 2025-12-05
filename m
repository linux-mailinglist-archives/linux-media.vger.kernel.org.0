Return-Path: <linux-media+bounces-48279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AEECA6715
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 08:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FF9831F1F93
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 07:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13368329E4B;
	Fri,  5 Dec 2025 07:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="T6HLKn6e"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC1C2F60A3;
	Fri,  5 Dec 2025 07:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764919246; cv=fail; b=pLvs4IGQAO4cvGjbITmDDHKpvyD0O1oMTKROwUXo8mIY3LamRQjryLa7l1icoWbUSXO59cAbYQBza+IBoSmAA950XJVphCocUiKVSuq4le+uHPJz4yF9KLQEjT2e/MR3Y3FJhor4hywnZhoHF3eCczbCK93x+BmaCXdrwXXXRPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764919246; c=relaxed/simple;
	bh=+aMxK7a/ba/UEKgkV6FNDB40aSVGU5LSuo79qQjxRcM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JOp2155EWmrMf2WI2L/1h9Z5knDNUaVekcNE8Jyvd7gz9EZEpaSF3APkvigCNdny9g3IyFEtwRhYFrIE05u6uBglklef8X+DlFmtaEwvURHetLFG5U25PuSmR4ENV+LsDIJD8nIwZMorvH0E0a4rr3JJUSvkI9Emzd9zAID6YUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=T6HLKn6e; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B56S9T43747672;
	Fri, 5 Dec 2025 07:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=wYBQvakt1
	u9pT7bbgM2JEylOEQL6+131IzkPXMq6pEc=; b=T6HLKn6eAczSEnTJJ3LouCPU4
	hBTA+fh8nGZpZWFDMyNfAGg/dgvIu5jhvbej4mYnVFJDjBT8B3uJtyLpOgKtNFhp
	7eMmEy+YBOoOaRmrtkrtMKlnwDEH5VgSCSQ1P+XBxx5sFO6MFWG+/atWS9JBpuPk
	2kEPjHpDAb+C/ANrOrl1ZD4TP1BROWivswseWB+uYEjQ+UnDgK0M+//aULpl2kOZ
	Pnk0f5piu3CeZPW8Ia2QPXMyfzNkyhHv1HjGyDrkio6EkUGONMyp3tA38wlWQTGk
	3V21vZbp4qoRl+vsfdPaCT/kD9JOYHW19YrR5UJQPNVLwjF9T1upoJT/muoYQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4auqv1045e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 07:19:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ct1eVa8pLpHuAIubhw/Uv9AUmmN4YLsVGHFIizfs8bGf7yySDfbZr0wfmplTN6ZgFWqh/UZEaaNKVy5ZAuaCQnOruXi7ai+B4Fnr6gNosFKi9FZgBHjGDS8baa5thaNxfyazDCOatrfOqbFH782nHodlcAsoVl2vHWwBUJcSp9B84cr+aIgxickezBJoAZALvpHyFuX1IppHtIOCxKodoc8njH0Fnbz9yx2kYc29xDgaGW/DMUcgsoNsH53rtGqrBrpKvkjXPGXd6M02lHghHfBJOvAJq5JTcT6DfWfW53Ebhya6QaOlBzb9rdmacR3r0bf5HItmHRV9TbIE113Ydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYBQvakt1u9pT7bbgM2JEylOEQL6+131IzkPXMq6pEc=;
 b=Kjj5wrVOT/Yy5l2fI+641cQxigVaLs5L/k2orvFq4HbMOdx4s/0BYO9X+uEuit81NSArLju6SmY5nlWa0yikEfLLp3KgHwMV8Wd0g9q7HrRRsugEjePz55of1n4qNfCpTNd75syQcuq6FXo68y9l45x0SaCJAGgJsY8mANnpDb4EthxmH1YqZjLNxfEyfLbO9JvJwt8SnDKM19RdIu7Jq0+JYVOJAOERUS3rZxcRumaCSsBA5Odh6h1/83I/guT75U00QKYV1FaUaAMm/KIKyiZj9Ul8nK2PVIUZ+LJA/NNvlfepDGIjJlotRJUTuGhoH2GJsRrIzaXD6sNv2ElK6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by SJ5PPF75B6D7B42.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::835) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 07:19:35 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d%6]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 07:19:35 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org,
        xiaolei.wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: i2c: ov5647: use our own mutex for the ctrl lock
Date: Fri,  5 Dec 2025 15:19:18 +0800
Message-ID: <20251205071918.1396810-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::14) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|SJ5PPF75B6D7B42:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cafe57d-44ec-494f-aeba-08de33cea47f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ygAVvN/LE4CtXlGszjHv7BH7y2LIvMf7YiEGJ5pkxtRbnVPKmrla1taH1EF8?=
 =?us-ascii?Q?ouIZSFdyhS0dQQuhAFPCbF47YMpMtPDU0KHD6sq0u7sJltQ4umMEW0gmNG1X?=
 =?us-ascii?Q?xfclMIJWR9zqm9T1zrWb7ndG1+J7tel0WCf/QS2PnoEpWvm29m5ETeC684l6?=
 =?us-ascii?Q?wwpod0sNQlLDxnxiT+oZXsBInW30r+6zEJyhb79bOvr+fxMqhJ2Y3aPb8jm8?=
 =?us-ascii?Q?N6zyakSJbTAjsIJHKbvKptswhXeoV97W7SEjZgriUBJvvbFwG7mE1QY6IAOi?=
 =?us-ascii?Q?uOwPSyQpwROaLZ66cz4jFEaEGLNyt77DsXgJlzBCa+Qaz3kDGV3UYl0hEe58?=
 =?us-ascii?Q?lLXoUT/B1eT1iLog+4AMAP9YzJoQPz7echlmOXPxojnSZ2nONYopLzos7KND?=
 =?us-ascii?Q?O1vonqTFMYgwGWiz5IZtsNbLa3BIQ88OgJ0VtPZETgfAkyo/0n5G/4vbQZYa?=
 =?us-ascii?Q?ZJ0N9HZVHmJV9YofpgjxpNt7ccGL0ZEp4HjZOtK+3DgX0xcZNpPYZeKExRFA?=
 =?us-ascii?Q?xmwKJUuPo0P1oonRMIPYe17BBqIcl2VvNKqciWm1TMK1ni2ski9pGDedVtoy?=
 =?us-ascii?Q?CAq9Bi8ON1Tql63a69dUJ/V+hr76onFtAO/c2exAADNJNR4/8OubQ9kDA5MH?=
 =?us-ascii?Q?8m5FS+z61muquTuPGZGrs50m8LBz0Juq8hq31pQrbbA1bXyoT0f0fKLFz9in?=
 =?us-ascii?Q?UmZDzQw15HGeQX/BmLUVnbrEXoQyTlobBdTaG+Xtm0KBxNNLry4DkL1DRLuG?=
 =?us-ascii?Q?y4YblkOUmhmf9IkCJg88HRpgwJ4hSzRSEuTB8oXsUKo8j/+PfSECRG/gido+?=
 =?us-ascii?Q?zEW/CD/BghLMLD5dDR7Hzs8E/2zZ1Rfqu7mbI+dkh+qRVlLFSzQnqiI77JgX?=
 =?us-ascii?Q?HMijUyASy3ppm7lqBNydailSUuUb5IOZXVKmjFA0RQgi8zKFDjf382HQbuoB?=
 =?us-ascii?Q?D35aLsXQNofJulB2BOFH6KH1Q0Y+2WQ+7YrHrJjCe0KX3eTmLyK0fDaU+ZcI?=
 =?us-ascii?Q?rrP/7AdiGg1T1aU0VAA/Q87LPtRwu/e3KPrz3tVaGbCkPJvC2l9YxUN29arg?=
 =?us-ascii?Q?q7xYyUDhbnqmWXhCRASPIuigMvJgHKEHAqyjUAoEaDAoHlS+6aAy+Z9ayK52?=
 =?us-ascii?Q?2aNBHdhn1oDqrPLIeew4cOnKAmaAjUKBPv6k+La0wn1uASrXdEPQiC8TpSMU?=
 =?us-ascii?Q?NKvRwYuWx+dJjJ+6XbkyePwlEhsU6G3m4JeUmMnBMADhR4Qp3/yEhz4kVR9C?=
 =?us-ascii?Q?bBfgIQF0q8k0/e82vQoNvnrJ/TIupE2hr4yNNkKNBEXaCR6NYy4M2PwZDuwC?=
 =?us-ascii?Q?2UsgwP27+TRZkVbIEBjVw8v81hETb8l2HUC4N04KagLo2sAVs6EOqzUVpz0t?=
 =?us-ascii?Q?V3vz4el7hN+two76dVy6htDf267kEzrfMzVJLvOF2jAtdoKm+wQ5VphprYi8?=
 =?us-ascii?Q?O2JcFEnjFlE0vKVpKgLtYZveKokgCDF9yfeIO9M0BB0S7UY9xWJeBPpG2zpR?=
 =?us-ascii?Q?dpE5J26v9nE0TS+3KHVZCwAgDXOSZpyiw/gq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zmXJNLX+VPJE5Iqt8bPYz3XniD1wRdi3Ke+ZaNHqvwJU/L7Dtcpj5P91vKiJ?=
 =?us-ascii?Q?2rgiziGVso+slao1p4HiQdAS8r7HdoixqBWS71A/SHyBqL8O3eMM4/WLt7Br?=
 =?us-ascii?Q?ecvLKi6a1ti4CWQHaOpTnTvvGJuKU1Pa2JZb0QVbNv5r9Mel8dQaXcd20JwV?=
 =?us-ascii?Q?zQI9FXXgyp8hO+0o9Aic7Bca9vdSc6FtsgclIPZGo3eSKabtr6jw8XXuqfD8?=
 =?us-ascii?Q?dCX3NDkiOz9Ls83WJNB8C5FaKxzdpfel0Ja2FWaYH8YhVieZysheKA5gZRFX?=
 =?us-ascii?Q?64VQmV8Jug0vlP66BHb1TWg/nGLO48enAzf+lIlHFHK8n26qO8EAs6hKQsYK?=
 =?us-ascii?Q?9lPQH89MzaUwvxdO/BQ5Ep+QMZI6swC9OBWAWOLcM4Trb2hxoeFW8U23tcgl?=
 =?us-ascii?Q?thYqtYB5j9lXZyafYDOctj8c4pgqdW/44PoI3tgGzOeSvcfgGgJSU91/OlYz?=
 =?us-ascii?Q?HBZNrH0eKLfBf7rDNHS1qAUre/S+EdxOT5bvmfnUZ/Jqb/cisotPgkFQC+Hw?=
 =?us-ascii?Q?u2XSt8FPOR2qDVMmL8PNkM/fp4m/eWaMGeN+zcX/KZRALbR6i2K7UkaWVAyp?=
 =?us-ascii?Q?z9gvtjAmpA52oYYZIVy1wXd2IYxPHfG+M/sbHVD54YTbS7M2PLRdQaMcNrbj?=
 =?us-ascii?Q?bI2JU34Da7eiLdZS7dAMi14zcxDMJcYbhVQ2ezVOK5sn9N7qcHacx9DFnJWe?=
 =?us-ascii?Q?Cv98X7GlCVgkWmF9e9532+Dy6WGW8UY3EMaubuidymjWpgCWYdLt8m5RYswn?=
 =?us-ascii?Q?U3m9G6JiL4ffSggbXxYNLp76zlV5KLpL81yvnWE2o8rLUwUPa23Rke9jhkUd?=
 =?us-ascii?Q?WBs3TJ2VSHox0L0jMzM2CtEb5WeMmk/7JI6IoOIj4YMuJ6BnU95WyslgL+qk?=
 =?us-ascii?Q?BPSbQRb8TALLUBXYvZ85ioAhzx7NkK0CAB2p5dOu/7I8KXuiWTq5rYvtepKp?=
 =?us-ascii?Q?//PQ/76MSEzghJBbFZhdtuF7MWNuihiq8cguj9slmGN1GCd21qT6B+tlOdY1?=
 =?us-ascii?Q?01c2Vw4bU0hvj9ex0M+0woWdk5GbfcRYYp7ZIYKRYgygDxW4oqDsNZx60UVo?=
 =?us-ascii?Q?IoVv6ICU6Cq1K0zqY5HjQRIHxpr8T886nBBpu4h5UQ8IQmZIDFYwqQ0hwbp3?=
 =?us-ascii?Q?IC8/CbYEw0W+LLw0aypIRv0XMyCe8e+kehLXNUNgJbvYCgqfgHR7sJO4Uk3A?=
 =?us-ascii?Q?wl5pLj1SKxxEtu24btf25xWxU/3LnNZiJMb6s0DzKgkfz5md+dOrktfCOaNN?=
 =?us-ascii?Q?gI4Hn5XCATATMrwQMo+XANbhGQMZiRZRIQR4fMZN/AQeG9B54PvrY3wAZcNt?=
 =?us-ascii?Q?AmFm5T/zbszePykeSrFAxbJ63aX+CfwVcQMBtSFE9Mar4AcYlokYyJfEwZOY?=
 =?us-ascii?Q?m5Vc49Bn0SWFDitgBP8GpjY6BVeIIH+BL47mciox3pBWfZCeG0R4jerTm4lg?=
 =?us-ascii?Q?dmY1fCEaTAGWjdSUUKIjkiDMKdhRqqvd2RixeRfHxJ+fqTkdnWDZF7iBpW7m?=
 =?us-ascii?Q?up4BY4Pm0bcWnmCttK3TpYXs3+2dcVqFyAux93KJg1N374AmsyRJmWmXpf3e?=
 =?us-ascii?Q?CVwMe0FVcVkhE+Us7yUU9LbTXXhML75EFyNMXRFhinLlwr9DK8cULZBfQ+tg?=
 =?us-ascii?Q?eQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cafe57d-44ec-494f-aeba-08de33cea47f
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 07:19:35.5588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6+UU/RT9h1jf6ZmkIP6ufV1e17TvywzRJ9WHrPA66eIfutKt6H3b++WnmUYBRKZzS2EG9zuYRPG43eeddynMpKRaot7Fi4U1LBtZZofBGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF75B6D7B42
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA1MCBTYWx0ZWRfX4rK2C6cgHbyS
 8ye/nQx3To3ujA0i75geotraYYQAn5tsHumIa3sObZ9daOfQZA7PXkiYDhlMp82AqrQpzJda32u
 oJWVK7kBo65ENcu16Tz9PLOf+FjnUlBZq2jiTqUbHE7bQZB7P/mBaPvqWciev+V5kw4rtxfD1AS
 vlLCmla5GKRx1i7ByGxvh+sN8aWGUd6KuLo+7hUgv9WMN7spNLzbOpQCdk+UFz3FcxSNMWJY8zS
 viRlBXeHGG5ILboTNWu3Sx7rWnrHS53/yhgF+CQfVs4oBybhiOC948OvV5+JbheYOu/xKvsMM/r
 D0nIDSNuMUgsCTa9vapSzYvnvaB0L1pxkwB1ul7dj/5yRIarbIXs1r3EJ4v5aIsLgLtkT/5jh6j
 zXpIBHfsnxIScHHNGEfvAASdejKPoA==
X-Proofpoint-ORIG-GUID: zU1TRp94faF1FWVwSf8q--ZjJzKwFuzb
X-Proofpoint-GUID: zU1TRp94faF1FWVwSf8q--ZjJzKwFuzb
X-Authority-Analysis: v=2.4 cv=dqfWylg4 c=1 sm=1 tr=0 ts=6932878a cx=c_pps
 a=f5Tl6ILaYY6UHEJdjUIuFA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=wk0Ph_KwOMu3z5TwrfMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050050

__v4l2_ctrl_handler_setup() and __v4l2_ctrl_modify_range()
contains an assertion to verify that the v4l2_ctrl_handler::lock
is held, as it should only be called when the lock has already
been acquired. Therefore use our own mutex for the ctrl lock,
otherwise a warning will be  reported.

Fixes: 4974c2f19fd8 ("media: ov5647: Support gain, exposure and AWB controls")
Cc: stable@vger.kernel.org
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---

v1: https://patchwork.kernel.org/project/linux-media/patch/20251201000026.690298-1-xiaolei.wang@windriver.com/
v2: Compared to v1, directly using sensor->ctrls avoids introducing unnecessary variables and adds a fix tag to address the initial issue.

 drivers/media/i2c/ov5647.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index e193fef4fced..e5404aa744a3 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1291,6 +1291,8 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 
 	v4l2_ctrl_handler_init(&sensor->ctrls, 9);
 
+	sensor->ctrls.lock = &sensor->lock;
+
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
 
-- 
2.43.0


