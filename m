Return-Path: <linux-media+bounces-49618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B26FACE5BDD
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 03:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79DF73017EEB
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 02:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D959261B9E;
	Mon, 29 Dec 2025 02:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="mwdE9UNv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CEF2A1BA;
	Mon, 29 Dec 2025 02:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766975497; cv=fail; b=TR7NBQV2hBcXwJfWUkRgKoXi2UgP5y/UlrYE4hanbG65ryIol5VFVmDwJeD9KLJ1BaMH9I0hTWK3tyHplbHp6qXzbbWlfcd7VFIAbfRTIEj5nfZ7HwPhFd5T5K9yLuegk3z9AfATOsjgxh7bG73meLMS4WboitzBOJccaxdiNME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766975497; c=relaxed/simple;
	bh=AURpsAu5ZUFDvZdkMl05vAVKVwPtZoaM4jb3swikH0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hG2rnf1KIUpyVmVwxhAIl+3lN2lgLTVXJfULfbGF6zaxmJdsXdDhpFeeiHcqLUvdyzGattO5o8eP5CldAf29Z07a71KTdZwfGT2AprdYxWIKD7W6McVDJhjwCrlJ2xFIOYJUIcfZ+4sqPy4/Ebf1QGmcoyEH2ep6oV0JspWB/ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=mwdE9UNv; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT1t1fK151482;
	Sun, 28 Dec 2025 18:31:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=YG/9+gjuSjPZI/RXH1VPATPgbSSHXIbmkcxhcZa5tZQ=; b=
	mwdE9UNvI3a5gjjaX7Bg7sD1qGdigSeGe4xOi9nW/swQ+5Tuw1Rtfn08nIMTlVqb
	tpLgS6krnRLz+j4z0LMLy+VMJdb0l56tb68P6PUK7TElGKor6r5UYBkH4Wepw2op
	YlfPvfZJ6LqpMqd4JIJMpKqtiT3r7ZopkkLj0cbNA6bbpFBM1KUMoxZdCT7OiWtY
	q6Js2WEnyOtIp/9PN68gko0SnHuq4VYSPohKm/J8JGVfx5UA6GLfSN19d5Seu2uz
	yAnYwvT2o90Q1ztVUZ5QnEuhyhQvJalJm3wH4giLUFwp0c1Z5cjrTUQjiGBcIsCT
	H+L4ajUqLwPxCpq0NyyCWw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010032.outbound.protection.outlook.com [52.101.46.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bafuk901u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 28 Dec 2025 18:31:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5BWmeAQQC2V0s6Xr2Z0DgH276A4khRjwCmqlNvzNeP4iKGe491yDRwsGniNslXXl3LKI92VsTLKQsXwRPwBFwNyUfWVy/sfCdapW6Mzy0r2V0Ln18KHUb/42006zZxn/s9j6ChbVneJ9XeDKz4CC4xLZh5H6yAHwnV8yN7TWKUCOXCjkyb9ZmhShfZ15Hru15aSP0fTll4VAsEpv2Sebq+A+MpiUzCEFSgBYSD00z0T9lQF/AqU1DWxaUyY7U98fdTHtSYgaon0IjEVXb5/TcgYEEVkOHNuiDGEkRiAULZLvdSWTsnMe2QxpmoCts0KWiHjKduzXXCfuEoMJGsjXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YG/9+gjuSjPZI/RXH1VPATPgbSSHXIbmkcxhcZa5tZQ=;
 b=hidNcA+Sk92JvR2X8DZw2ewEGFsJeLv4YpVKvO664k2OaiblpWv5ulcmoSKSWr2Ozhn8ucvAtksCjaPJQEns7CMDFy8jri/3jOwUJMxTrXWOZE18TiQJPRL6I7uQSBJQm5ZnMTGrsE8kk3q6ByqdB22lvaaRNvm9uQCjDgJAB5QtoQl5KbH+o9aSysBYPmhaydgi60LyA3Rwwhs+Kp3jhGEp29S0yuw7mGqZ/J6pKr0Gp03ebPZLlOk7gmfDrNZuMa4d/agWe2YHUiSPnBQGgsUxglxQ2i8QKhl/Its2qmuTp5rfxN+J6ANt4PXBzEztBNwOnNPr/NoPkXHpKPy7Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by MW4PR11MB7103.namprd11.prod.outlook.com
 (2603:10b6:303:225::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 02:31:05 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d%6]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 02:31:05 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        dave.stevenson@raspberrypi.com, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, xiaolei.wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] media: i2c: ov5647: Convert to CCI register access helpers
Date: Mon, 29 Dec 2025 10:30:16 +0800
Message-ID: <20251229023018.2933405-2-xiaolei.wang@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 71012416-3178-4d66-6888-08de4682511f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8kqKxk0sfu5IN61WCVX+BXCNvftWJOxvhegPgmdYQ9Zu3xOpmGDzNXYkhl6a?=
 =?us-ascii?Q?bEVelggI31D1Hz9LS1ZVsW3hanpWTfesEbDdFJaUXYdK/LjiVghGJUJzl702?=
 =?us-ascii?Q?oV27rx6U+K5hNhJLkMyiosrvVfq+VmVzzeKDbhDk58/BNYVzaEZxRgkgMyHp?=
 =?us-ascii?Q?uEL/LncLeVIam2adPRIY40pIG+yAlq+Qym4ICRCs4fmJ4uF/lxj5t6v3yqAU?=
 =?us-ascii?Q?Daa+n8T0H5diVtchl96IJc0qrRax5Y1P1x6EfV0sDbw6TJllqw7XcSJr41g3?=
 =?us-ascii?Q?jdbxaucnCAyq2UvrGoVD/oo3WLblsohTPO0255ieMbXTSiM7YMa8qgn409Bj?=
 =?us-ascii?Q?7XVlxqim0BYRghXc9n2AeB+8DhVNI5zCCrkKqUowLuktW57FkD/nLfvVNHIL?=
 =?us-ascii?Q?Er7OdfMDAFhuCsdA+z8/nMPzWHrjNpD5M4tHXED4ZVDNlAV8/KS8kuW/jg+v?=
 =?us-ascii?Q?MzpA5e1bVQibtJZ6/N90tsJ9k8F7dJqHzKj22EdFGxte8IxZoNn5DEia1jdx?=
 =?us-ascii?Q?PxEJC0AJ+ero2baAhEL+nv1ojO5Zb0XcAi3hzWCSVRtQtV4rchUYds6cUcio?=
 =?us-ascii?Q?ej3HwBpwuF3SFZfdYr75WFg3Ug+IahrmZKETXnaOgsR29AEpK6vDH+7IixAJ?=
 =?us-ascii?Q?RS1vZuKBxxOhJY9+HKGce8Ucb32ozdxR+q/dpoDEqWJW/IklwFWmpvG2ii27?=
 =?us-ascii?Q?0GGqoja2k+hZeVjHtBoTFZGNbQgRQqPvU1aREJWmSpcci/kcZ3YXDxt49W4s?=
 =?us-ascii?Q?C0HeP8Zwi9ZhO+ZDMsJdoCfasxIqop2cJEjv/yWwGulbyfpunt5PLf02tJuu?=
 =?us-ascii?Q?J38UHGXx+Q/rfBTbPzy0Py9pqK0PGmWGPxxzeJcQXcobsTeIO0RkhlzqMaSx?=
 =?us-ascii?Q?0mH4vswcgKri6Z+x/QoHkZkyBXXYuxmfbXU9/667DIKsuXlEJUF8+NsR720N?=
 =?us-ascii?Q?UrUjtSpzraHUbVyDKviI7Z/aYlXSemKnZW+PJC4oQWSZthbOrM2cFVFlg77U?=
 =?us-ascii?Q?r2p5DBJJpd78sguuH6K6CZ3FU6r49dQ8yzIa7J0t49+WunIB2O1BMcOSXirP?=
 =?us-ascii?Q?dB+C0ybYzLlLfzc8I1hQ4PeBz3FOdyjQbZSmHugBZX9cVCYiSKOefLDVnSf/?=
 =?us-ascii?Q?Mbdz1PiJZhUuJadnCg0qHB4SrVT/iS3lJ91W2s/T9F2A9Q1SW35D05lrdIsy?=
 =?us-ascii?Q?/+gTlEHwQjQTWutJNKb5mQxy4YQXYuWnp95JyrGTpx//gDTVdCM27cpw71O+?=
 =?us-ascii?Q?cRZq0abhmwCioyaIouJN9TLTRlaEbrCm2R3DTZYWjRFBpb9Jqhevh5YNQyEF?=
 =?us-ascii?Q?PXEaHJEQHWlzrpfnwGXVR4ifz22ullGORmUIV8ypumPRS11CWLNMgK274B7b?=
 =?us-ascii?Q?iJc6dhtvJ65H4yhuM9h7bPCnqM4Sw4qMgtDPx+p8SnHL4CelufL6vL49Gqub?=
 =?us-ascii?Q?4c5p7tcIDIJGmmo8injakOTNnYIUm8HoHuzLhYDv2PCwE01iksXTyn2We4cv?=
 =?us-ascii?Q?F09Yrd3DXPk4n8TERrFL4HpfZ7NKcauTdbvj5imQWRT1AepsquLqRGWnRQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fEGt59qNqjhs/SoHhIkVbxlqoKG59+4gtk5JL/218akbv3lvDBrte7Eel0j0?=
 =?us-ascii?Q?6QLlzUfLWbA1zsa3rXn3y9pzMPgGZoeXi9BbTmp7tN5KNvtZMrExZN9an8/Q?=
 =?us-ascii?Q?132bccPCP+IAddbYPHb6+bRa1C6Ep+Oy+/6ZZTCkhKRkclprtQJFSmULzlEY?=
 =?us-ascii?Q?PuSKYQKDk5IHHZB9VXZmRiSr+mipQq08v/K9/92aaJGlD0hjtILbtxlEO4eQ?=
 =?us-ascii?Q?NfxGgckq2qVp6otpu4+y8EM1mU2h8ogmOAoIwwQvbQkVnvP/M18c0aJmUiy7?=
 =?us-ascii?Q?Bx7T8V3OtHkERcw8V8JC3NFMbxnwo5ytYrkiGX1Y5rKI9SgWIH/KEqwJDe9j?=
 =?us-ascii?Q?zGPuc9fUUUQ/CK4w5o1mi0RSw0tojvTzKCPFcoYuwxZBuW5H4ZuRgxcOqNXo?=
 =?us-ascii?Q?JpkPpnXFT/4CwxOLbAv41Bv7jOKelNCqt+pXce4AX9TNsTKQeOBvKnsEd387?=
 =?us-ascii?Q?jE7Bwkbue5Qg6BvuCKwhZUTwNxfGROc6MfXxHJm1Y6pVSFpWQHkLAT0j80Os?=
 =?us-ascii?Q?Piang8QMfvficAD8WSmMHQJxPns6X/n8YwdbQ8wCXEyQGZ5CAdfjAjeerd03?=
 =?us-ascii?Q?LZDGEfC3Y3J5WqwkKoF7xu0v6y84lL/GOEBPtzs29eZttLpI4tddcxBL0VUf?=
 =?us-ascii?Q?MMTVz0nNGiEHaK+hfaKq3dAtL51YXEKBqwQIZEd6HyIFPm+KSNFcKtMASdgc?=
 =?us-ascii?Q?TtG+Tcf+fFj6Fqd7xHbLjyqSTto4vjJqoNfhKOKWzjZiR7tsJPyibeSdNTpk?=
 =?us-ascii?Q?aJVyO1/iy4boPTmrzix4jzCoMGq3QGwGfDTQTpR+YTA8Oe5U1ob++3dGLGU0?=
 =?us-ascii?Q?0BUYso04V2VSxoJt+OI3TIbTDslBHKQc2RR4U7lED+HBW4/QIlYx9GGwYcWM?=
 =?us-ascii?Q?LB3noeaNuvBbo3PzjpGdQgK7xw9aSRbb2CEQVIv8i++8fSErwR2i9kZv3gCJ?=
 =?us-ascii?Q?4xr3Sp3Mg6ZvMa3S+m9zylimwcyMGpcI6qhBB7byC+N8C4eEgfXDWBQkZDv6?=
 =?us-ascii?Q?B2uJ+zfzgPYvGvxdB4781pRBZSFmb034KFDtg4O0zsJxrQsNoOPUnCrf5R10?=
 =?us-ascii?Q?HlYCj5LXddQV0Ui3hez6ZwkSmLKzZnxIqmRZimRemavERndGLaNiMle5BGY5?=
 =?us-ascii?Q?jkWJTROO6/zo1V7WufntjDeo2qrApCgsw/Xrx45gDA79YXJ0hwYJ3eAHYRUH?=
 =?us-ascii?Q?6pUc6Ii0VN6cqjmInAoKRDUZTY4+dSc+eUm8WdC2IeX+IX4pGazp9eEVkiwm?=
 =?us-ascii?Q?JDFIPZIzdXvqdRQ+AZ0FR2O/u5ZTRWvrrDj9J8XAceiesw6gRjsFl0nfz4ng?=
 =?us-ascii?Q?9Y5nElN29cxe4y9w10+hRCPTGcxc2wnqanOrvQQchBo2yo7eFSQ9Ve35hwZQ?=
 =?us-ascii?Q?Nnk12LXXPNTqWQ9Q4dTw1v1d5PnJorva8wtyk128ZSRgGsA25wIgdGjlqzFF?=
 =?us-ascii?Q?VqVuTc2O2Hbzow/lhun6grz6hnL9wGqtO7L3X/U2BZbrXkllIJbSm0Ru8epU?=
 =?us-ascii?Q?9Nf95emH6Z4I0XNtYJPa5Q+GRQS3WJTfKjplEFJyCfO57SF6f9SoayCTqklK?=
 =?us-ascii?Q?qjZ4OdxU9f9EEo/EqYMi+FvKVxdMUt1gbbfOOn/1fiDYqhR+tZXdejVSzhsG?=
 =?us-ascii?Q?ipPEKeugp8fcEkvazv8mezUGDb1NjBuS35di2dWaFMctcSdJY3LF5MWACDaU?=
 =?us-ascii?Q?hqOJ+FCdljPJjwEWyLNs5UvwtlX/v0TwOe1TBZnSJPNN77MJCpu0uLEpkSJ6?=
 =?us-ascii?Q?6sL8pFIlZsSM8vMNyKTPPLWRRjokgFM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71012416-3178-4d66-6888-08de4682511f
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 02:31:05.8424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5ZLcI72JNaM6ALZyIriHF6qbkMw1qGV2lWLNzvg4XlaGGEvt68i/9aykrfkqTAVtTcax0uu2DjRz2RPX6U5HR6voaAvZGlhauC0JK7GC+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7103
X-Authority-Analysis: v=2.4 cv=ccjfb3DM c=1 sm=1 tr=0 ts=6951e7eb cx=c_pps
 a=aSTqfDprWv2neSIyXEkWYQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=gnH3C2b3y4YtfwlRM4wA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: iMzBA-VPqjqzcM7UFzVwd9s-7t9o0H7X
X-Proofpoint-ORIG-GUID: iMzBA-VPqjqzcM7UFzVwd9s-7t9o0H7X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDAyMSBTYWx0ZWRfX4vJJPnbU/lgE
 SSm87pHSjCv/NHw51/eAZK25ZqEVTQ4AyGh7rBRvTlSfePkWHUl6F+5IhI2lPyXrxt/bOy/sB2Y
 GWNup+3DZqQxCK9M9h6tR0PiALNBA6Cxi6y/GhVmkrndVh+1Jh+YVq1MkV22Yo+0iNvfbXM/ufu
 vCMeUttxyapm8HoN+Mh97J677pjmJ73FB+t4DJA8DlO1jhsCglCaGEPdV0wMiEOyoo7IIlW1xdP
 f0YZ8sYKiUfs9VaIP++11pDbIfFOLt7o2xov2ixjTFp5jqx9ZO3lLbEWDaW1EXfsQHgQnqngrNx
 /mpK9UJQV9J/N+VITqc0t4h7MWSt3AZ8ylROAAvRVr+BEZh1HLatmmkouHxO6tB44T7KMe84ToW
 Kq+S7wVpVYeg8Y9tDEkY8+8h4ME7fxqCU0eYK2FShgkVSZpBFXcbSoPpE1+pf+kLyxrJ85iOpGW
 Arf0TXoKpDQvqOhg1vQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_08,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290021

Use the new common CCI register access helpers to replace the private
register access helpers in the ov5647 driver. This simplifies the driver
by reducing the amount of code.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov5647.c | 997 +++++++++++++++++--------------------
 2 files changed, 453 insertions(+), 545 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4b4db8c4f496..cce63349e71e 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -529,6 +529,7 @@ config VIDEO_OV5645
 
 config VIDEO_OV5647
 	tristate "OmniVision OV5647 sensor support"
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5647 camera.
diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index e193fef4fced..fd69f1616794 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -22,6 +22,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -41,24 +42,19 @@
 #define MIPI_CTRL00_BUS_IDLE			BIT(2)
 #define MIPI_CTRL00_CLOCK_LANE_DISABLE		BIT(0)
 
-#define OV5647_SW_STANDBY		0x0100
-#define OV5647_SW_RESET			0x0103
-#define OV5647_REG_CHIPID_H		0x300a
-#define OV5647_REG_CHIPID_L		0x300b
-#define OV5640_REG_PAD_OUT		0x300d
-#define OV5647_REG_EXP_HI		0x3500
-#define OV5647_REG_EXP_MID		0x3501
-#define OV5647_REG_EXP_LO		0x3502
-#define OV5647_REG_AEC_AGC		0x3503
-#define OV5647_REG_GAIN_HI		0x350a
-#define OV5647_REG_GAIN_LO		0x350b
-#define OV5647_REG_VTS_HI		0x380e
-#define OV5647_REG_VTS_LO		0x380f
-#define OV5647_REG_FRAME_OFF_NUMBER	0x4202
-#define OV5647_REG_MIPI_CTRL00		0x4800
-#define OV5647_REG_MIPI_CTRL14		0x4814
-#define OV5647_REG_AWB			0x5001
-#define OV5647_REG_ISPCTRL3D		0x503d
+#define OV5647_SW_STANDBY		CCI_REG8(0x0100)
+#define OV5647_SW_RESET			CCI_REG8(0x0103)
+#define OV5647_REG_CHIPID		CCI_REG16(0x300a)
+#define OV5640_REG_PAD_OUT		CCI_REG8(0x300d)
+#define OV5647_REG_EXPOSURE		CCI_REG24(0x3500)
+#define OV5647_REG_AEC_AGC		CCI_REG8(0x3503)
+#define OV5647_REG_GAIN			CCI_REG16(0x350b)
+#define OV5647_REG_VTS			CCI_REG16(0x380e)
+#define OV5647_REG_FRAME_OFF_NUMBER	CCI_REG8(0x4202)
+#define OV5647_REG_MIPI_CTRL00		CCI_REG8(0x4800)
+#define OV5647_REG_MIPI_CTRL14		CCI_REG8(0x4814)
+#define OV5647_REG_AWB			CCI_REG8(0x5001)
+#define OV5647_REG_ISPCTRL3D		CCI_REG8(0x503d)
 
 #define REG_TERM 0xfffe
 #define VAL_TERM 0xfe
@@ -81,23 +77,19 @@
 #define OV5647_EXPOSURE_DEFAULT		1000
 #define OV5647_EXPOSURE_MAX		65535
 
-struct regval_list {
-	u16 addr;
-	u8 data;
-};
-
 struct ov5647_mode {
 	struct v4l2_mbus_framefmt	format;
 	struct v4l2_rect		crop;
 	u64				pixel_rate;
 	int				hts;
 	int				vts;
-	const struct regval_list	*reg_list;
+	const struct cci_reg_sequence	*reg_list;
 	unsigned int			num_regs;
 };
 
 struct ov5647 {
 	struct v4l2_subdev		sd;
+	struct regmap                   *regmap;
 	struct media_pad		pad;
 	struct mutex			lock;
 	struct clk			*xclk;
@@ -130,377 +122,377 @@ static const u8 ov5647_test_pattern_val[] = {
 	0x81,	/* Random Data */
 };
 
-static const struct regval_list sensor_oe_disable_regs[] = {
-	{0x3000, 0x00},
-	{0x3001, 0x00},
-	{0x3002, 0x00},
+static const struct cci_reg_sequence sensor_oe_disable_regs[] = {
+	{ CCI_REG8(0x3000), 0x00 },
+	{ CCI_REG8(0x3001), 0x00 },
+	{ CCI_REG8(0x3002), 0x00 },
 };
 
-static const struct regval_list sensor_oe_enable_regs[] = {
-	{0x3000, 0x0f},
-	{0x3001, 0xff},
-	{0x3002, 0xe4},
+static const struct cci_reg_sequence sensor_oe_enable_regs[] = {
+	{ CCI_REG8(0x3000), 0x0f },
+	{ CCI_REG8(0x3001), 0xff },
+	{ CCI_REG8(0x3002), 0xe4 },
 };
 
-static struct regval_list ov5647_2592x1944_10bpp[] = {
-	{0x0100, 0x00},
-	{0x0103, 0x01},
-	{0x3034, 0x1a},
-	{0x3035, 0x21},
-	{0x3036, 0x69},
-	{0x303c, 0x11},
-	{0x3106, 0xf5},
-	{0x3821, 0x06},
-	{0x3820, 0x00},
-	{0x3827, 0xec},
-	{0x370c, 0x03},
-	{0x3612, 0x5b},
-	{0x3618, 0x04},
-	{0x5000, 0x06},
-	{0x5002, 0x41},
-	{0x5003, 0x08},
-	{0x5a00, 0x08},
-	{0x3000, 0x00},
-	{0x3001, 0x00},
-	{0x3002, 0x00},
-	{0x3016, 0x08},
-	{0x3017, 0xe0},
-	{0x3018, 0x44},
-	{0x301c, 0xf8},
-	{0x301d, 0xf0},
-	{0x3a18, 0x00},
-	{0x3a19, 0xf8},
-	{0x3c01, 0x80},
-	{0x3b07, 0x0c},
-	{0x380c, 0x0b},
-	{0x380d, 0x1c},
-	{0x3814, 0x11},
-	{0x3815, 0x11},
-	{0x3708, 0x64},
-	{0x3709, 0x12},
-	{0x3808, 0x0a},
-	{0x3809, 0x20},
-	{0x380a, 0x07},
-	{0x380b, 0x98},
-	{0x3800, 0x00},
-	{0x3801, 0x00},
-	{0x3802, 0x00},
-	{0x3803, 0x00},
-	{0x3804, 0x0a},
-	{0x3805, 0x3f},
-	{0x3806, 0x07},
-	{0x3807, 0xa3},
-	{0x3811, 0x10},
-	{0x3813, 0x06},
-	{0x3630, 0x2e},
-	{0x3632, 0xe2},
-	{0x3633, 0x23},
-	{0x3634, 0x44},
-	{0x3636, 0x06},
-	{0x3620, 0x64},
-	{0x3621, 0xe0},
-	{0x3600, 0x37},
-	{0x3704, 0xa0},
-	{0x3703, 0x5a},
-	{0x3715, 0x78},
-	{0x3717, 0x01},
-	{0x3731, 0x02},
-	{0x370b, 0x60},
-	{0x3705, 0x1a},
-	{0x3f05, 0x02},
-	{0x3f06, 0x10},
-	{0x3f01, 0x0a},
-	{0x3a08, 0x01},
-	{0x3a09, 0x28},
-	{0x3a0a, 0x00},
-	{0x3a0b, 0xf6},
-	{0x3a0d, 0x08},
-	{0x3a0e, 0x06},
-	{0x3a0f, 0x58},
-	{0x3a10, 0x50},
-	{0x3a1b, 0x58},
-	{0x3a1e, 0x50},
-	{0x3a11, 0x60},
-	{0x3a1f, 0x28},
-	{0x4001, 0x02},
-	{0x4004, 0x04},
-	{0x4000, 0x09},
-	{0x4837, 0x19},
-	{0x4800, 0x24},
-	{0x3503, 0x03},
-	{0x0100, 0x01},
+static const struct cci_reg_sequence ov5647_2592x1944_10bpp[] = {
+	{ CCI_REG8(0x0100), 0x00 },
+	{ CCI_REG8(0x0103), 0x01 },
+	{ CCI_REG8(0x3034), 0x1a },
+	{ CCI_REG8(0x3035), 0x21 },
+	{ CCI_REG8(0x3036), 0x69 },
+	{ CCI_REG8(0x303c), 0x11 },
+	{ CCI_REG8(0x3106), 0xf5 },
+	{ CCI_REG8(0x3821), 0x06 },
+	{ CCI_REG8(0x3820), 0x00 },
+	{ CCI_REG8(0x3827), 0xec },
+	{ CCI_REG8(0x370c), 0x03 },
+	{ CCI_REG8(0x3612), 0x5b },
+	{ CCI_REG8(0x3618), 0x04 },
+	{ CCI_REG8(0x5000), 0x06 },
+	{ CCI_REG8(0x5002), 0x41 },
+	{ CCI_REG8(0x5003), 0x08 },
+	{ CCI_REG8(0x5a00), 0x08 },
+	{ CCI_REG8(0x3000), 0x00 },
+	{ CCI_REG8(0x3001), 0x00 },
+	{ CCI_REG8(0x3002), 0x00 },
+	{ CCI_REG8(0x3016), 0x08 },
+	{ CCI_REG8(0x3017), 0xe0 },
+	{ CCI_REG8(0x3018), 0x44 },
+	{ CCI_REG8(0x301c), 0xf8 },
+	{ CCI_REG8(0x301d), 0xf0 },
+	{ CCI_REG8(0x3a18), 0x00 },
+	{ CCI_REG8(0x3a19), 0xf8 },
+	{ CCI_REG8(0x3c01), 0x80 },
+	{ CCI_REG8(0x3b07), 0x0c },
+	{ CCI_REG8(0x380c), 0x0b },
+	{ CCI_REG8(0x380d), 0x1c },
+	{ CCI_REG8(0x3814), 0x11 },
+	{ CCI_REG8(0x3815), 0x11 },
+	{ CCI_REG8(0x3708), 0x64 },
+	{ CCI_REG8(0x3709), 0x12 },
+	{ CCI_REG8(0x3808), 0x0a },
+	{ CCI_REG8(0x3809), 0x20 },
+	{ CCI_REG8(0x380a), 0x07 },
+	{ CCI_REG8(0x380b), 0x98 },
+	{ CCI_REG8(0x3800), 0x00 },
+	{ CCI_REG8(0x3801), 0x00 },
+	{ CCI_REG8(0x3802), 0x00 },
+	{ CCI_REG8(0x3803), 0x00 },
+	{ CCI_REG8(0x3804), 0x0a },
+	{ CCI_REG8(0x3805), 0x3f },
+	{ CCI_REG8(0x3806), 0x07 },
+	{ CCI_REG8(0x3807), 0xa3 },
+	{ CCI_REG8(0x3811), 0x10 },
+	{ CCI_REG8(0x3813), 0x06 },
+	{ CCI_REG8(0x3630), 0x2e },
+	{ CCI_REG8(0x3632), 0xe2 },
+	{ CCI_REG8(0x3633), 0x23 },
+	{ CCI_REG8(0x3634), 0x44 },
+	{ CCI_REG8(0x3636), 0x06 },
+	{ CCI_REG8(0x3620), 0x64 },
+	{ CCI_REG8(0x3621), 0xe0 },
+	{ CCI_REG8(0x3600), 0x37 },
+	{ CCI_REG8(0x3704), 0xa0 },
+	{ CCI_REG8(0x3703), 0x5a },
+	{ CCI_REG8(0x3715), 0x78 },
+	{ CCI_REG8(0x3717), 0x01 },
+	{ CCI_REG8(0x3731), 0x02 },
+	{ CCI_REG8(0x370b), 0x60 },
+	{ CCI_REG8(0x3705), 0x1a },
+	{ CCI_REG8(0x3f05), 0x02 },
+	{ CCI_REG8(0x3f06), 0x10 },
+	{ CCI_REG8(0x3f01), 0x0a },
+	{ CCI_REG8(0x3a08), 0x01 },
+	{ CCI_REG8(0x3a09), 0x28 },
+	{ CCI_REG8(0x3a0a), 0x00 },
+	{ CCI_REG8(0x3a0b), 0xf6 },
+	{ CCI_REG8(0x3a0d), 0x08 },
+	{ CCI_REG8(0x3a0e), 0x06 },
+	{ CCI_REG8(0x3a0f), 0x58 },
+	{ CCI_REG8(0x3a10), 0x50 },
+	{ CCI_REG8(0x3a1b), 0x58 },
+	{ CCI_REG8(0x3a1e), 0x50 },
+	{ CCI_REG8(0x3a11), 0x60 },
+	{ CCI_REG8(0x3a1f), 0x28 },
+	{ CCI_REG8(0x4001), 0x02 },
+	{ CCI_REG8(0x4004), 0x04 },
+	{ CCI_REG8(0x4000), 0x09 },
+	{ CCI_REG8(0x4837), 0x19 },
+	{ CCI_REG8(0x4800), 0x24 },
+	{ CCI_REG8(0x3503), 0x03 },
+	{ CCI_REG8(0x0100), 0x01 },
 };
 
-static struct regval_list ov5647_1080p30_10bpp[] = {
-	{0x0100, 0x00},
-	{0x0103, 0x01},
-	{0x3034, 0x1a},
-	{0x3035, 0x21},
-	{0x3036, 0x62},
-	{0x303c, 0x11},
-	{0x3106, 0xf5},
-	{0x3821, 0x06},
-	{0x3820, 0x00},
-	{0x3827, 0xec},
-	{0x370c, 0x03},
-	{0x3612, 0x5b},
-	{0x3618, 0x04},
-	{0x5000, 0x06},
-	{0x5002, 0x41},
-	{0x5003, 0x08},
-	{0x5a00, 0x08},
-	{0x3000, 0x00},
-	{0x3001, 0x00},
-	{0x3002, 0x00},
-	{0x3016, 0x08},
-	{0x3017, 0xe0},
-	{0x3018, 0x44},
-	{0x301c, 0xf8},
-	{0x301d, 0xf0},
-	{0x3a18, 0x00},
-	{0x3a19, 0xf8},
-	{0x3c01, 0x80},
-	{0x3b07, 0x0c},
-	{0x380c, 0x09},
-	{0x380d, 0x70},
-	{0x3814, 0x11},
-	{0x3815, 0x11},
-	{0x3708, 0x64},
-	{0x3709, 0x12},
-	{0x3808, 0x07},
-	{0x3809, 0x80},
-	{0x380a, 0x04},
-	{0x380b, 0x38},
-	{0x3800, 0x01},
-	{0x3801, 0x5c},
-	{0x3802, 0x01},
-	{0x3803, 0xb2},
-	{0x3804, 0x08},
-	{0x3805, 0xe3},
-	{0x3806, 0x05},
-	{0x3807, 0xf1},
-	{0x3811, 0x04},
-	{0x3813, 0x02},
-	{0x3630, 0x2e},
-	{0x3632, 0xe2},
-	{0x3633, 0x23},
-	{0x3634, 0x44},
-	{0x3636, 0x06},
-	{0x3620, 0x64},
-	{0x3621, 0xe0},
-	{0x3600, 0x37},
-	{0x3704, 0xa0},
-	{0x3703, 0x5a},
-	{0x3715, 0x78},
-	{0x3717, 0x01},
-	{0x3731, 0x02},
-	{0x370b, 0x60},
-	{0x3705, 0x1a},
-	{0x3f05, 0x02},
-	{0x3f06, 0x10},
-	{0x3f01, 0x0a},
-	{0x3a08, 0x01},
-	{0x3a09, 0x4b},
-	{0x3a0a, 0x01},
-	{0x3a0b, 0x13},
-	{0x3a0d, 0x04},
-	{0x3a0e, 0x03},
-	{0x3a0f, 0x58},
-	{0x3a10, 0x50},
-	{0x3a1b, 0x58},
-	{0x3a1e, 0x50},
-	{0x3a11, 0x60},
-	{0x3a1f, 0x28},
-	{0x4001, 0x02},
-	{0x4004, 0x04},
-	{0x4000, 0x09},
-	{0x4837, 0x19},
-	{0x4800, 0x34},
-	{0x3503, 0x03},
-	{0x0100, 0x01},
+static const struct cci_reg_sequence ov5647_1080p30_10bpp[] = {
+	{ CCI_REG8(0x0100), 0x00 },
+	{ CCI_REG8(0x0103), 0x01 },
+	{ CCI_REG8(0x3034), 0x1a },
+	{ CCI_REG8(0x3035), 0x21 },
+	{ CCI_REG8(0x3036), 0x62 },
+	{ CCI_REG8(0x303c), 0x11 },
+	{ CCI_REG8(0x3106), 0xf5 },
+	{ CCI_REG8(0x3821), 0x06 },
+	{ CCI_REG8(0x3820), 0x00 },
+	{ CCI_REG8(0x3827), 0xec },
+	{ CCI_REG8(0x370c), 0x03 },
+	{ CCI_REG8(0x3612), 0x5b },
+	{ CCI_REG8(0x3618), 0x04 },
+	{ CCI_REG8(0x5000), 0x06 },
+	{ CCI_REG8(0x5002), 0x41 },
+	{ CCI_REG8(0x5003), 0x08 },
+	{ CCI_REG8(0x5a00), 0x08 },
+	{ CCI_REG8(0x3000), 0x00 },
+	{ CCI_REG8(0x3001), 0x00 },
+	{ CCI_REG8(0x3002), 0x00 },
+	{ CCI_REG8(0x3016), 0x08 },
+	{ CCI_REG8(0x3017), 0xe0 },
+	{ CCI_REG8(0x3018), 0x44 },
+	{ CCI_REG8(0x301c), 0xf8 },
+	{ CCI_REG8(0x301d), 0xf0 },
+	{ CCI_REG8(0x3a18), 0x00 },
+	{ CCI_REG8(0x3a19), 0xf8 },
+	{ CCI_REG8(0x3c01), 0x80 },
+	{ CCI_REG8(0x3b07), 0x0c },
+	{ CCI_REG8(0x380c), 0x09 },
+	{ CCI_REG8(0x380d), 0x70 },
+	{ CCI_REG8(0x3814), 0x11 },
+	{ CCI_REG8(0x3815), 0x11 },
+	{ CCI_REG8(0x3708), 0x64 },
+	{ CCI_REG8(0x3709), 0x12 },
+	{ CCI_REG8(0x3808), 0x07 },
+	{ CCI_REG8(0x3809), 0x80 },
+	{ CCI_REG8(0x380a), 0x04 },
+	{ CCI_REG8(0x380b), 0x38 },
+	{ CCI_REG8(0x3800), 0x01 },
+	{ CCI_REG8(0x3801), 0x5c },
+	{ CCI_REG8(0x3802), 0x01 },
+	{ CCI_REG8(0x3803), 0xb2 },
+	{ CCI_REG8(0x3804), 0x08 },
+	{ CCI_REG8(0x3805), 0xe3 },
+	{ CCI_REG8(0x3806), 0x05 },
+	{ CCI_REG8(0x3807), 0xf1 },
+	{ CCI_REG8(0x3811), 0x04 },
+	{ CCI_REG8(0x3813), 0x02 },
+	{ CCI_REG8(0x3630), 0x2e },
+	{ CCI_REG8(0x3632), 0xe2 },
+	{ CCI_REG8(0x3633), 0x23 },
+	{ CCI_REG8(0x3634), 0x44 },
+	{ CCI_REG8(0x3636), 0x06 },
+	{ CCI_REG8(0x3620), 0x64 },
+	{ CCI_REG8(0x3621), 0xe0 },
+	{ CCI_REG8(0x3600), 0x37 },
+	{ CCI_REG8(0x3704), 0xa0 },
+	{ CCI_REG8(0x3703), 0x5a },
+	{ CCI_REG8(0x3715), 0x78 },
+	{ CCI_REG8(0x3717), 0x01 },
+	{ CCI_REG8(0x3731), 0x02 },
+	{ CCI_REG8(0x370b), 0x60 },
+	{ CCI_REG8(0x3705), 0x1a },
+	{ CCI_REG8(0x3f05), 0x02 },
+	{ CCI_REG8(0x3f06), 0x10 },
+	{ CCI_REG8(0x3f01), 0x0a },
+	{ CCI_REG8(0x3a08), 0x01 },
+	{ CCI_REG8(0x3a09), 0x4b },
+	{ CCI_REG8(0x3a0a), 0x01 },
+	{ CCI_REG8(0x3a0b), 0x13 },
+	{ CCI_REG8(0x3a0d), 0x04 },
+	{ CCI_REG8(0x3a0e), 0x03 },
+	{ CCI_REG8(0x3a0f), 0x58 },
+	{ CCI_REG8(0x3a10), 0x50 },
+	{ CCI_REG8(0x3a1b), 0x58 },
+	{ CCI_REG8(0x3a1e), 0x50 },
+	{ CCI_REG8(0x3a11), 0x60 },
+	{ CCI_REG8(0x3a1f), 0x28 },
+	{ CCI_REG8(0x4001), 0x02 },
+	{ CCI_REG8(0x4004), 0x04 },
+	{ CCI_REG8(0x4000), 0x09 },
+	{ CCI_REG8(0x4837), 0x19 },
+	{ CCI_REG8(0x4800), 0x34 },
+	{ CCI_REG8(0x3503), 0x03 },
+	{ CCI_REG8(0x0100), 0x01 },
 };
 
-static struct regval_list ov5647_2x2binned_10bpp[] = {
-	{0x0100, 0x00},
-	{0x0103, 0x01},
-	{0x3034, 0x1a},
-	{0x3035, 0x21},
-	{0x3036, 0x62},
-	{0x303c, 0x11},
-	{0x3106, 0xf5},
-	{0x3827, 0xec},
-	{0x370c, 0x03},
-	{0x3612, 0x59},
-	{0x3618, 0x00},
-	{0x5000, 0x06},
-	{0x5002, 0x41},
-	{0x5003, 0x08},
-	{0x5a00, 0x08},
-	{0x3000, 0x00},
-	{0x3001, 0x00},
-	{0x3002, 0x00},
-	{0x3016, 0x08},
-	{0x3017, 0xe0},
-	{0x3018, 0x44},
-	{0x301c, 0xf8},
-	{0x301d, 0xf0},
-	{0x3a18, 0x00},
-	{0x3a19, 0xf8},
-	{0x3c01, 0x80},
-	{0x3b07, 0x0c},
-	{0x3800, 0x00},
-	{0x3801, 0x00},
-	{0x3802, 0x00},
-	{0x3803, 0x00},
-	{0x3804, 0x0a},
-	{0x3805, 0x3f},
-	{0x3806, 0x07},
-	{0x3807, 0xa3},
-	{0x3808, 0x05},
-	{0x3809, 0x10},
-	{0x380a, 0x03},
-	{0x380b, 0xcc},
-	{0x380c, 0x07},
-	{0x380d, 0x68},
-	{0x3811, 0x0c},
-	{0x3813, 0x06},
-	{0x3814, 0x31},
-	{0x3815, 0x31},
-	{0x3630, 0x2e},
-	{0x3632, 0xe2},
-	{0x3633, 0x23},
-	{0x3634, 0x44},
-	{0x3636, 0x06},
-	{0x3620, 0x64},
-	{0x3621, 0xe0},
-	{0x3600, 0x37},
-	{0x3704, 0xa0},
-	{0x3703, 0x5a},
-	{0x3715, 0x78},
-	{0x3717, 0x01},
-	{0x3731, 0x02},
-	{0x370b, 0x60},
-	{0x3705, 0x1a},
-	{0x3f05, 0x02},
-	{0x3f06, 0x10},
-	{0x3f01, 0x0a},
-	{0x3a08, 0x01},
-	{0x3a09, 0x28},
-	{0x3a0a, 0x00},
-	{0x3a0b, 0xf6},
-	{0x3a0d, 0x08},
-	{0x3a0e, 0x06},
-	{0x3a0f, 0x58},
-	{0x3a10, 0x50},
-	{0x3a1b, 0x58},
-	{0x3a1e, 0x50},
-	{0x3a11, 0x60},
-	{0x3a1f, 0x28},
-	{0x4001, 0x02},
-	{0x4004, 0x04},
-	{0x4000, 0x09},
-	{0x4837, 0x16},
-	{0x4800, 0x24},
-	{0x3503, 0x03},
-	{0x3820, 0x41},
-	{0x3821, 0x07},
-	{0x350a, 0x00},
-	{0x350b, 0x10},
-	{0x3500, 0x00},
-	{0x3501, 0x1a},
-	{0x3502, 0xf0},
-	{0x3212, 0xa0},
-	{0x0100, 0x01},
+static const struct cci_reg_sequence ov5647_2x2binned_10bpp[] = {
+	{ CCI_REG8(0x0100), 0x00 },
+	{ CCI_REG8(0x0103), 0x01 },
+	{ CCI_REG8(0x3034), 0x1a },
+	{ CCI_REG8(0x3035), 0x21 },
+	{ CCI_REG8(0x3036), 0x62 },
+	{ CCI_REG8(0x303c), 0x11 },
+	{ CCI_REG8(0x3106), 0xf5 },
+	{ CCI_REG8(0x3827), 0xec },
+	{ CCI_REG8(0x370c), 0x03 },
+	{ CCI_REG8(0x3612), 0x59 },
+	{ CCI_REG8(0x3618), 0x00 },
+	{ CCI_REG8(0x5000), 0x06 },
+	{ CCI_REG8(0x5002), 0x41 },
+	{ CCI_REG8(0x5003), 0x08 },
+	{ CCI_REG8(0x5a00), 0x08 },
+	{ CCI_REG8(0x3000), 0x00 },
+	{ CCI_REG8(0x3001), 0x00 },
+	{ CCI_REG8(0x3002), 0x00 },
+	{ CCI_REG8(0x3016), 0x08 },
+	{ CCI_REG8(0x3017), 0xe0 },
+	{ CCI_REG8(0x3018), 0x44 },
+	{ CCI_REG8(0x301c), 0xf8 },
+	{ CCI_REG8(0x301d), 0xf0 },
+	{ CCI_REG8(0x3a18), 0x00 },
+	{ CCI_REG8(0x3a19), 0xf8 },
+	{ CCI_REG8(0x3c01), 0x80 },
+	{ CCI_REG8(0x3b07), 0x0c },
+	{ CCI_REG8(0x3800), 0x00 },
+	{ CCI_REG8(0x3801), 0x00 },
+	{ CCI_REG8(0x3802), 0x00 },
+	{ CCI_REG8(0x3803), 0x00 },
+	{ CCI_REG8(0x3804), 0x0a },
+	{ CCI_REG8(0x3805), 0x3f },
+	{ CCI_REG8(0x3806), 0x07 },
+	{ CCI_REG8(0x3807), 0xa3 },
+	{ CCI_REG8(0x3808), 0x05 },
+	{ CCI_REG8(0x3809), 0x10 },
+	{ CCI_REG8(0x380a), 0x03 },
+	{ CCI_REG8(0x380b), 0xcc },
+	{ CCI_REG8(0x380c), 0x07 },
+	{ CCI_REG8(0x380d), 0x68 },
+	{ CCI_REG8(0x3811), 0x0c },
+	{ CCI_REG8(0x3813), 0x06 },
+	{ CCI_REG8(0x3814), 0x31 },
+	{ CCI_REG8(0x3815), 0x31 },
+	{ CCI_REG8(0x3630), 0x2e },
+	{ CCI_REG8(0x3632), 0xe2 },
+	{ CCI_REG8(0x3633), 0x23 },
+	{ CCI_REG8(0x3634), 0x44 },
+	{ CCI_REG8(0x3636), 0x06 },
+	{ CCI_REG8(0x3620), 0x64 },
+	{ CCI_REG8(0x3621), 0xe0 },
+	{ CCI_REG8(0x3600), 0x37 },
+	{ CCI_REG8(0x3704), 0xa0 },
+	{ CCI_REG8(0x3703), 0x5a },
+	{ CCI_REG8(0x3715), 0x78 },
+	{ CCI_REG8(0x3717), 0x01 },
+	{ CCI_REG8(0x3731), 0x02 },
+	{ CCI_REG8(0x370b), 0x60 },
+	{ CCI_REG8(0x3705), 0x1a },
+	{ CCI_REG8(0x3f05), 0x02 },
+	{ CCI_REG8(0x3f06), 0x10 },
+	{ CCI_REG8(0x3f01), 0x0a },
+	{ CCI_REG8(0x3a08), 0x01 },
+	{ CCI_REG8(0x3a09), 0x28 },
+	{ CCI_REG8(0x3a0a), 0x00 },
+	{ CCI_REG8(0x3a0b), 0xf6 },
+	{ CCI_REG8(0x3a0d), 0x08 },
+	{ CCI_REG8(0x3a0e), 0x06 },
+	{ CCI_REG8(0x3a0f), 0x58 },
+	{ CCI_REG8(0x3a10), 0x50 },
+	{ CCI_REG8(0x3a1b), 0x58 },
+	{ CCI_REG8(0x3a1e), 0x50 },
+	{ CCI_REG8(0x3a11), 0x60 },
+	{ CCI_REG8(0x3a1f), 0x28 },
+	{ CCI_REG8(0x4001), 0x02 },
+	{ CCI_REG8(0x4004), 0x04 },
+	{ CCI_REG8(0x4000), 0x09 },
+	{ CCI_REG8(0x4837), 0x16 },
+	{ CCI_REG8(0x4800), 0x24 },
+	{ CCI_REG8(0x3503), 0x03 },
+	{ CCI_REG8(0x3820), 0x41 },
+	{ CCI_REG8(0x3821), 0x07 },
+	{ CCI_REG8(0x350a), 0x00 },
+	{ CCI_REG8(0x350b), 0x10 },
+	{ CCI_REG8(0x3500), 0x00 },
+	{ CCI_REG8(0x3501), 0x1a },
+	{ CCI_REG8(0x3502), 0xf0 },
+	{ CCI_REG8(0x3212), 0xa0 },
+	{ CCI_REG8(0x0100), 0x01 },
 };
 
-static struct regval_list ov5647_640x480_10bpp[] = {
-	{0x0100, 0x00},
-	{0x0103, 0x01},
-	{0x3035, 0x11},
-	{0x3036, 0x46},
-	{0x303c, 0x11},
-	{0x3821, 0x07},
-	{0x3820, 0x41},
-	{0x370c, 0x03},
-	{0x3612, 0x59},
-	{0x3618, 0x00},
-	{0x5000, 0x06},
-	{0x5003, 0x08},
-	{0x5a00, 0x08},
-	{0x3000, 0xff},
-	{0x3001, 0xff},
-	{0x3002, 0xff},
-	{0x301d, 0xf0},
-	{0x3a18, 0x00},
-	{0x3a19, 0xf8},
-	{0x3c01, 0x80},
-	{0x3b07, 0x0c},
-	{0x380c, 0x07},
-	{0x380d, 0x3c},
-	{0x3814, 0x35},
-	{0x3815, 0x35},
-	{0x3708, 0x64},
-	{0x3709, 0x52},
-	{0x3808, 0x02},
-	{0x3809, 0x80},
-	{0x380a, 0x01},
-	{0x380b, 0xe0},
-	{0x3800, 0x00},
-	{0x3801, 0x10},
-	{0x3802, 0x00},
-	{0x3803, 0x00},
-	{0x3804, 0x0a},
-	{0x3805, 0x2f},
-	{0x3806, 0x07},
-	{0x3807, 0x9f},
-	{0x3630, 0x2e},
-	{0x3632, 0xe2},
-	{0x3633, 0x23},
-	{0x3634, 0x44},
-	{0x3620, 0x64},
-	{0x3621, 0xe0},
-	{0x3600, 0x37},
-	{0x3704, 0xa0},
-	{0x3703, 0x5a},
-	{0x3715, 0x78},
-	{0x3717, 0x01},
-	{0x3731, 0x02},
-	{0x370b, 0x60},
-	{0x3705, 0x1a},
-	{0x3f05, 0x02},
-	{0x3f06, 0x10},
-	{0x3f01, 0x0a},
-	{0x3a08, 0x01},
-	{0x3a09, 0x2e},
-	{0x3a0a, 0x00},
-	{0x3a0b, 0xfb},
-	{0x3a0d, 0x02},
-	{0x3a0e, 0x01},
-	{0x3a0f, 0x58},
-	{0x3a10, 0x50},
-	{0x3a1b, 0x58},
-	{0x3a1e, 0x50},
-	{0x3a11, 0x60},
-	{0x3a1f, 0x28},
-	{0x4001, 0x02},
-	{0x4004, 0x02},
-	{0x4000, 0x09},
-	{0x3000, 0x00},
-	{0x3001, 0x00},
-	{0x3002, 0x00},
-	{0x3017, 0xe0},
-	{0x301c, 0xfc},
-	{0x3636, 0x06},
-	{0x3016, 0x08},
-	{0x3827, 0xec},
-	{0x3018, 0x44},
-	{0x3035, 0x21},
-	{0x3106, 0xf5},
-	{0x3034, 0x1a},
-	{0x301c, 0xf8},
-	{0x4800, 0x34},
-	{0x3503, 0x03},
-	{0x0100, 0x01},
+static const struct cci_reg_sequence ov5647_640x480_10bpp[] = {
+	{ CCI_REG8(0x0100), 0x00 },
+	{ CCI_REG8(0x0103), 0x01 },
+	{ CCI_REG8(0x3035), 0x11 },
+	{ CCI_REG8(0x3036), 0x46 },
+	{ CCI_REG8(0x303c), 0x11 },
+	{ CCI_REG8(0x3821), 0x07 },
+	{ CCI_REG8(0x3820), 0x41 },
+	{ CCI_REG8(0x370c), 0x03 },
+	{ CCI_REG8(0x3612), 0x59 },
+	{ CCI_REG8(0x3618), 0x00 },
+	{ CCI_REG8(0x5000), 0x06 },
+	{ CCI_REG8(0x5003), 0x08 },
+	{ CCI_REG8(0x5a00), 0x08 },
+	{ CCI_REG8(0x3000), 0xff },
+	{ CCI_REG8(0x3001), 0xff },
+	{ CCI_REG8(0x3002), 0xff },
+	{ CCI_REG8(0x301d), 0xf0 },
+	{ CCI_REG8(0x3a18), 0x00 },
+	{ CCI_REG8(0x3a19), 0xf8 },
+	{ CCI_REG8(0x3c01), 0x80 },
+	{ CCI_REG8(0x3b07), 0x0c },
+	{ CCI_REG8(0x380c), 0x07 },
+	{ CCI_REG8(0x380d), 0x3c },
+	{ CCI_REG8(0x3814), 0x35 },
+	{ CCI_REG8(0x3815), 0x35 },
+	{ CCI_REG8(0x3708), 0x64 },
+	{ CCI_REG8(0x3709), 0x52 },
+	{ CCI_REG8(0x3808), 0x02 },
+	{ CCI_REG8(0x3809), 0x80 },
+	{ CCI_REG8(0x380a), 0x01 },
+	{ CCI_REG8(0x380b), 0xe0 },
+	{ CCI_REG8(0x3800), 0x00 },
+	{ CCI_REG8(0x3801), 0x10 },
+	{ CCI_REG8(0x3802), 0x00 },
+	{ CCI_REG8(0x3803), 0x00 },
+	{ CCI_REG8(0x3804), 0x0a },
+	{ CCI_REG8(0x3805), 0x2f },
+	{ CCI_REG8(0x3806), 0x07 },
+	{ CCI_REG8(0x3807), 0x9f },
+	{ CCI_REG8(0x3630), 0x2e },
+	{ CCI_REG8(0x3632), 0xe2 },
+	{ CCI_REG8(0x3633), 0x23 },
+	{ CCI_REG8(0x3634), 0x44 },
+	{ CCI_REG8(0x3620), 0x64 },
+	{ CCI_REG8(0x3621), 0xe0 },
+	{ CCI_REG8(0x3600), 0x37 },
+	{ CCI_REG8(0x3704), 0xa0 },
+	{ CCI_REG8(0x3703), 0x5a },
+	{ CCI_REG8(0x3715), 0x78 },
+	{ CCI_REG8(0x3717), 0x01 },
+	{ CCI_REG8(0x3731), 0x02 },
+	{ CCI_REG8(0x370b), 0x60 },
+	{ CCI_REG8(0x3705), 0x1a },
+	{ CCI_REG8(0x3f05), 0x02 },
+	{ CCI_REG8(0x3f06), 0x10 },
+	{ CCI_REG8(0x3f01), 0x0a },
+	{ CCI_REG8(0x3a08), 0x01 },
+	{ CCI_REG8(0x3a09), 0x2e },
+	{ CCI_REG8(0x3a0a), 0x00 },
+	{ CCI_REG8(0x3a0b), 0xfb },
+	{ CCI_REG8(0x3a0d), 0x02 },
+	{ CCI_REG8(0x3a0e), 0x01 },
+	{ CCI_REG8(0x3a0f), 0x58 },
+	{ CCI_REG8(0x3a10), 0x50 },
+	{ CCI_REG8(0x3a1b), 0x58 },
+	{ CCI_REG8(0x3a1e), 0x50 },
+	{ CCI_REG8(0x3a11), 0x60 },
+	{ CCI_REG8(0x3a1f), 0x28 },
+	{ CCI_REG8(0x4001), 0x02 },
+	{ CCI_REG8(0x4004), 0x02 },
+	{ CCI_REG8(0x4000), 0x09 },
+	{ CCI_REG8(0x3000), 0x00 },
+	{ CCI_REG8(0x3001), 0x00 },
+	{ CCI_REG8(0x3002), 0x00 },
+	{ CCI_REG8(0x3017), 0xe0 },
+	{ CCI_REG8(0x301c), 0xfc },
+	{ CCI_REG8(0x3636), 0x06 },
+	{ CCI_REG8(0x3016), 0x08 },
+	{ CCI_REG8(0x3827), 0xec },
+	{ CCI_REG8(0x3018), 0x44 },
+	{ CCI_REG8(0x3035), 0x21 },
+	{ CCI_REG8(0x3106), 0xf5 },
+	{ CCI_REG8(0x3034), 0x1a },
+	{ CCI_REG8(0x301c), 0xf8 },
+	{ CCI_REG8(0x4800), 0x34 },
+	{ CCI_REG8(0x3503), 0x03 },
+	{ CCI_REG8(0x0100), 0x01 },
 };
 
 static const struct ov5647_mode ov5647_modes[] = {
@@ -594,109 +586,35 @@ static const struct ov5647_mode ov5647_modes[] = {
 #define OV5647_DEFAULT_MODE	(&ov5647_modes[3])
 #define OV5647_DEFAULT_FORMAT	(ov5647_modes[3].format)
 
-static int ov5647_write16(struct v4l2_subdev *sd, u16 reg, u16 val)
-{
-	unsigned char data[4] = { reg >> 8, reg & 0xff, val >> 8, val & 0xff};
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-
-	ret = i2c_master_send(client, data, 4);
-	if (ret < 0) {
-		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
-			__func__, reg);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
-{
-	unsigned char data[3] = { reg >> 8, reg & 0xff, val};
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-
-	ret = i2c_master_send(client, data, 3);
-	if (ret < 0) {
-		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
-				__func__, reg);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	u8 buf[2] = { reg >> 8, reg & 0xff };
-	struct i2c_msg msg[2];
-	int ret;
-
-	msg[0].addr = client->addr;
-	msg[0].flags = client->flags;
-	msg[0].buf = buf;
-	msg[0].len = sizeof(buf);
-
-	msg[1].addr = client->addr;
-	msg[1].flags = client->flags | I2C_M_RD;
-	msg[1].buf = buf;
-	msg[1].len = 1;
-
-	ret = i2c_transfer(client->adapter, msg, 2);
-	if (ret != 2) {
-		dev_err(&client->dev, "%s: i2c read error, reg: %x = %d\n",
-			__func__, reg, ret);
-		return ret >= 0 ? -EINVAL : ret;
-	}
-
-	*val = buf[0];
-
-	return 0;
-}
-
-static int ov5647_write_array(struct v4l2_subdev *sd,
-			      const struct regval_list *regs, int array_size)
-{
-	int i, ret;
-
-	for (i = 0; i < array_size; i++) {
-		ret = ov5647_write(sd, regs[i].addr, regs[i].data);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
 {
-	u8 channel_id;
+	struct ov5647 *sensor = to_sensor(sd);
+	u64 channel_id;
 	int ret;
 
-	ret = ov5647_read(sd, OV5647_REG_MIPI_CTRL14, &channel_id);
+	ret = cci_read(sensor->regmap, OV5647_REG_MIPI_CTRL14, &channel_id, NULL);
 	if (ret < 0)
 		return ret;
 
 	channel_id &= ~(3 << 6);
 
-	return ov5647_write(sd, OV5647_REG_MIPI_CTRL14,
-			    channel_id | (channel << 6));
+	return cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL14,
+			 channel_id | (channel << 6), NULL);
 }
 
 static int ov5647_set_mode(struct v4l2_subdev *sd)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov5647 *sensor = to_sensor(sd);
-	u8 resetval, rdval;
+	u64 resetval, rdval;
 	int ret;
 
-	ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
+	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &rdval, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_write_array(sd, sensor->mode->reg_list,
-				 sensor->mode->num_regs);
+	ret = cci_multi_reg_write(sensor->regmap, sensor->mode->reg_list,
+				  sensor->mode->num_regs, NULL);
 	if (ret < 0) {
 		dev_err(&client->dev, "write sensor default regs error\n");
 		return ret;
@@ -706,13 +624,13 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_read(sd, OV5647_SW_STANDBY, &resetval);
+	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &resetval, NULL);
 	if (ret < 0)
 		return ret;
 
 	if (!(resetval & 0x01)) {
 		dev_err(&client->dev, "Device was in SW standby");
-		ret = ov5647_write(sd, OV5647_SW_STANDBY, 0x01);
+		ret = cci_write(sensor->regmap, OV5647_SW_STANDBY, 0x01, NULL);
 		if (ret < 0)
 			return ret;
 	}
@@ -725,7 +643,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov5647 *sensor = to_sensor(sd);
 	u8 val = MIPI_CTRL00_BUS_IDLE;
-	int ret;
+	int ret = 0;
 
 	ret = ov5647_set_mode(sd);
 	if (ret) {
@@ -742,32 +660,25 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
 		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
 		       MIPI_CTRL00_LINE_SYNC_ENABLE;
 
-	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, val);
-	if (ret < 0)
-		return ret;
-
-	ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x00);
-	if (ret < 0)
-		return ret;
+	cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00, val, &ret);
+	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x00, &ret);
+	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x00, &ret);
 
-	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x00);
+	return ret;
 }
 
 static int ov5647_stream_off(struct v4l2_subdev *sd)
 {
-	int ret;
+	struct ov5647 *sensor = to_sensor(sd);
+	int ret = 0;
 
-	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00,
-			   MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
-			   MIPI_CTRL00_CLOCK_LANE_DISABLE);
-	if (ret < 0)
-		return ret;
+	cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
+		  MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
+		  MIPI_CTRL00_CLOCK_LANE_DISABLE, &ret);
+	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
+	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);
 
-	ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x0f);
-	if (ret < 0)
-		return ret;
-
-	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
+	return ret;
 }
 
 static int ov5647_power_on(struct device *dev)
@@ -788,8 +699,8 @@ static int ov5647_power_on(struct device *dev)
 		goto error_pwdn;
 	}
 
-	ret = ov5647_write_array(&sensor->sd, sensor_oe_enable_regs,
-				 ARRAY_SIZE(sensor_oe_enable_regs));
+	ret = cci_multi_reg_write(sensor->regmap, sensor_oe_enable_regs,
+				  ARRAY_SIZE(sensor_oe_enable_regs), NULL);
 	if (ret < 0) {
 		dev_err(dev, "write sensor_oe_enable_regs error\n");
 		goto error_clk_disable;
@@ -815,23 +726,23 @@ static int ov5647_power_on(struct device *dev)
 static int ov5647_power_off(struct device *dev)
 {
 	struct ov5647 *sensor = dev_get_drvdata(dev);
-	u8 rdval;
+	u64 rdval;
 	int ret;
 
 	dev_dbg(dev, "OV5647 power off\n");
 
-	ret = ov5647_write_array(&sensor->sd, sensor_oe_disable_regs,
-				 ARRAY_SIZE(sensor_oe_disable_regs));
+	ret = cci_multi_reg_write(sensor->regmap, sensor_oe_disable_regs,
+				 ARRAY_SIZE(sensor_oe_disable_regs), NULL);
 	if (ret < 0)
 		dev_dbg(dev, "disable oe failed\n");
 
 	/* Enter software standby */
-	ret = ov5647_read(&sensor->sd, OV5647_SW_STANDBY, &rdval);
+	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &rdval, NULL);
 	if (ret < 0)
 		dev_dbg(dev, "software standby failed\n");
 
 	rdval &= ~0x01;
-	ret = ov5647_write(&sensor->sd, OV5647_SW_STANDBY, rdval);
+	ret = cci_write(sensor->regmap, OV5647_SW_STANDBY, rdval, NULL);
 	if (ret < 0)
 		dev_dbg(dev, "software standby failed\n");
 
@@ -845,10 +756,11 @@ static int ov5647_power_off(struct device *dev)
 static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
 				      struct v4l2_dbg_register *reg)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
-	u8 val;
+	u64 val;
 
-	ret = ov5647_read(sd, reg->reg & 0xff, &val);
+	ret = cci_read(sensor->regmap, reg->reg & 0xff, &val, NULL);
 	if (ret < 0)
 		return ret;
 
@@ -861,7 +773,9 @@ static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
 static int ov5647_sensor_set_register(struct v4l2_subdev *sd,
 				      const struct v4l2_dbg_register *reg)
 {
-	return ov5647_write(sd, reg->reg & 0xff, reg->val & 0xff);
+	struct ov5647 *sensor = to_sensor(sd);
+
+	return cci_write(sensor->regmap, reg->reg & 0xff, reg->val & 0xff, NULL);
 }
 #endif
 
@@ -1089,33 +1003,27 @@ static const struct v4l2_subdev_ops ov5647_subdev_ops = {
 
 static int ov5647_detect(struct v4l2_subdev *sd)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	u8 read;
+	u64 read;
 	int ret;
 
-	ret = ov5647_write(sd, OV5647_SW_RESET, 0x01);
+	ret = cci_write(sensor->regmap, OV5647_SW_RESET, 0x01, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_read(sd, OV5647_REG_CHIPID_H, &read);
-	if (ret < 0)
-		return ret;
-
-	if (read != 0x56) {
-		dev_err(&client->dev, "ID High expected 0x56 got %x", read);
-		return -ENODEV;
-	}
-
-	ret = ov5647_read(sd, OV5647_REG_CHIPID_L, &read);
+	ret = cci_read(sensor->regmap, OV5647_REG_CHIPID, &read, NULL);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(&client->dev, ret,
+				     "failed to read chip id %x\n",
+				     OV5647_REG_CHIPID);
 
-	if (read != 0x47) {
-		dev_err(&client->dev, "ID Low expected 0x47 got %x", read);
+	if (read != 0x5647) {
+		dev_err(&client->dev, "Chip ID expected 0x5647 got 0x%llx", read);
 		return -ENODEV;
 	}
 
-	return ov5647_write(sd, OV5647_SW_RESET, 0x00);
+	return cci_write(sensor->regmap, OV5647_SW_RESET, 0x00, NULL);
 }
 
 static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
@@ -1140,70 +1048,62 @@ static const struct v4l2_subdev_internal_ops ov5647_subdev_internal_ops = {
 
 static int ov5647_s_auto_white_balance(struct v4l2_subdev *sd, u32 val)
 {
-	return ov5647_write(sd, OV5647_REG_AWB, val ? 1 : 0);
+	struct ov5647 *sensor = to_sensor(sd);
+
+	return cci_write(sensor->regmap, OV5647_REG_AWB, val ? 1 : 0, NULL);
 }
 
 static int ov5647_s_autogain(struct v4l2_subdev *sd, u32 val)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
-	u8 reg;
+	u64 reg;
 
 	/* Non-zero turns on AGC by clearing bit 1.*/
-	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
+	ret = cci_read(sensor->regmap, OV5647_REG_AEC_AGC, &reg, NULL);
 	if (ret)
 		return ret;
 
-	return ov5647_write(sd, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
-							: reg | BIT(1));
+	return cci_write(sensor->regmap, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
+							: reg | BIT(1), NULL);
 }
 
 static int ov5647_s_exposure_auto(struct v4l2_subdev *sd, u32 val)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
-	u8 reg;
+	u64 reg;
 
 	/*
 	 * Everything except V4L2_EXPOSURE_MANUAL turns on AEC by
 	 * clearing bit 0.
 	 */
-	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
+	ret = cci_read(sensor->regmap, OV5647_REG_AEC_AGC, &reg, NULL);
 	if (ret)
 		return ret;
 
-	return ov5647_write(sd, OV5647_REG_AEC_AGC,
+	return cci_write(sensor->regmap, OV5647_REG_AEC_AGC,
 			    val == V4L2_EXPOSURE_MANUAL ? reg | BIT(0)
-							: reg & ~BIT(0));
+							: reg & ~BIT(0), NULL);
 }
 
 static int ov5647_s_analogue_gain(struct v4l2_subdev *sd, u32 val)
 {
-	int ret;
+	struct ov5647 *sensor = to_sensor(sd);
 
 	/* 10 bits of gain, 2 in the high register. */
-	ret = ov5647_write(sd, OV5647_REG_GAIN_HI, (val >> 8) & 3);
-	if (ret)
-		return ret;
-
-	return ov5647_write(sd, OV5647_REG_GAIN_LO, val & 0xff);
+	return cci_write(sensor->regmap, OV5647_REG_GAIN, val & 0x3ff, NULL);
 }
 
 static int ov5647_s_exposure(struct v4l2_subdev *sd, u32 val)
 {
-	int ret;
+	struct ov5647 *sensor = to_sensor(sd);
 
 	/*
 	 * Sensor has 20 bits, but the bottom 4 bits are fractions of a line
 	 * which we leave as zero (and don't receive in "val").
 	 */
-	ret = ov5647_write(sd, OV5647_REG_EXP_HI, (val >> 12) & 0xf);
-	if (ret)
-		return ret;
-
-	ret = ov5647_write(sd, OV5647_REG_EXP_MID, (val >> 4) & 0xff);
-	if (ret)
-		return ret;
-
-	return ov5647_write(sd, OV5647_REG_EXP_LO, (val & 0xf) << 4);
+	return cci_write(sensor->regmap, OV5647_REG_EXPOSURE, val << 4, NULL);
 }
 
 static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -1254,12 +1154,12 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov5647_s_exposure(sd, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
-		ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
-				     sensor->mode->format.height + ctrl->val);
+		ret = cci_write(sensor->regmap, OV5647_REG_VTS,
+				sensor->mode->format.height + ctrl->val, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
-		ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
-				   ov5647_test_pattern_val[ctrl->val]);
+		ret = cci_write(sensor->regmap, OV5647_REG_ISPCTRL3D,
+				ov5647_test_pattern_val[ctrl->val], NULL);
 		break;
 
 	/* Read-only, but we adjust it based on mode. */
@@ -1435,6 +1335,13 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto ctrl_handler_free;
 
+	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(sensor->regmap)) {
+		ret = PTR_ERR(sensor->regmap);
+		dev_err(dev, "failed to initialize CCI: %d\n", ret);
+		goto entity_cleanup;
+	}
+
 	ret = ov5647_power_on(dev);
 	if (ret)
 		goto entity_cleanup;
-- 
2.43.0


