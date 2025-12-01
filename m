Return-Path: <linux-media+bounces-47902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 36323C95705
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 01:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C8919341B25
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 00:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0879E2236F3;
	Mon,  1 Dec 2025 00:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="HJ5p1FUA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF0238F9C;
	Mon,  1 Dec 2025 00:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764547297; cv=fail; b=JtWTcSqmaDsWqlPUsJC84dGsBlfDua/asHJHj4AYMeSxW4dTVRhv9MOTKzdIOwjrHtI2k8xinCUf9QcbwOGSGfkwafD1ujBuolSr8+D4WlH6loUVBD0OkXiZkHQ/m1HylZZwFTsvwD1EewrNGiEgV3fpmbYo0TYiPMAvFdtw7n0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764547297; c=relaxed/simple;
	bh=P4ozApmh8VDa7GdK7Swc1wm0N2H2KpYnLauZft6kL/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KNFcyjzM98MpNkrkUOTI5WEBcXmdk+Y28wrVl6FfqnO88p+fqsjO7fSp5ljdStAPDAK3r48PTNhW10pgjUzo4c7benHoqf6Bx1JcZPd+vgHqHYj9YfKKspePijfcuEFaBum3f/gnBJ2BglbDXwII/6UVtLzotlEL3pPs1chHYRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=HJ5p1FUA; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B100l5F1471616;
	Mon, 1 Dec 2025 00:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=8AM72Aba1
	KXvIni5C/YPDy/55jxwGKW8A91IMz2o8OI=; b=HJ5p1FUAnqVFzX6F7L3u/lJTv
	L75tR5aAFbBCYiAF22+msb7s8BLW0hHOPf0aSn67tEsHuxse6+cCrRCfjj6s2oP5
	k+dzrLx93rTNhJmNXaPalGq0kbnqtHQRoETFmh1FOxY9qZ0NJ8vuSVCTB9Ib9jAb
	xgwla2i0Yp21M6tcRrXtSbVwbONJ0y60KvKzCOj8kUzyeUNExOF6TJhS0a8fl1Ut
	PtQ7LtXbH7mag/EgG2YCffYmyT3B+kh0DzwH4Yr4+F6zvBQaKtugQsji51WaMQzg
	f7E2jeHHsP9fMXf9CJV6tcfu8xJbVJLIY4vep6xZfSg+uyOxr7Diw+UeZIzIw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010053.outbound.protection.outlook.com [52.101.61.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt695s6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Dec 2025 00:00:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmqHvOSgeUuwCy+bFQgElXhf3rs4tUdDR237m+O/EWMSGPVbi8LOmdxYdbExwg4huUY2E30wC+7Cl/ljAUrMNCkK786PAszdhq7lhmfzgKoMkP3slw60ortCUkrofYdUmeuA1DTeqrUCprowFJNZPFWmbkEma8c+tSz0D9chSq9LXN1XIkqQrPLBWczh8oTHN89K3lsdnf534MbLmKICEZMCPc3OfNQrvOGsTDyRFtSly2Pez6dC5Rbb9EdETHwsvFqNo+YJ361H8DnYPzN8YhY7X39a5miOVDSSqr5KYop6KknF8/KLOuxcgspOyZl+7HZp6B/vIOyOhJl1hJXSzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AM72Aba1KXvIni5C/YPDy/55jxwGKW8A91IMz2o8OI=;
 b=w8fjDNBhiGx/4wO/t5QILYIU2IHTzet2iAhL6C/dIButnKkF9zvb1sDbdx7wPjqMO4jjB7CDyNIS2Qg5n3LDUYil+2L9okzBtvMrISbH2ooHbZzCppBrZyrS6le/yvY6qHUR8I6ytPzkuedbaIe8y+cm7w3nKHvq/efpeLR2XxVXBgUDCflBEg9y7VMTuiN2ED9XCeyktn5gep+mjtnBEJ69K8PiysbSc/pJU006TfJBJVBTKfARbzeHXIADwc+PUkmBmKd5pQmeu79fiQ5Geyf3Y+ZbygdqdFqvohiLvrfIi4bwJu7rfzeCWklOX3ITFEpMZ4DZzgdCfAB1mN8PRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by SJ1PR11MB6226.namprd11.prod.outlook.com
 (2603:10b6:a03:45b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Mon, 1 Dec
 2025 00:00:47 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 00:00:47 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org,
        Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov5647: use our own mutex for the ctrl lock
Date: Mon,  1 Dec 2025 08:00:26 +0800
Message-ID: <20251201000026.690298-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0142.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::18) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|SJ1PR11MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: ad25bced-19a4-4399-fab0-08de306cae26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nmwmkey3Qh54jEUl+y7n5o95BmaK9sFO6knGmZkoKXARO1km1rXw1FpTJ51i?=
 =?us-ascii?Q?e37xiS2O4dPg+Xp6C/z7gb5SJDVqtL/loOIGuPMqnKSXL51usVCnCT+9gzN4?=
 =?us-ascii?Q?NxNcJalpOFu7GNvH1oqQrfOX3S+zCHpbBODfjnJ3/1K+NeTB9qrfSKOeg0hR?=
 =?us-ascii?Q?76CPCpC8j1DeWO6AnKU7Zp1NFjFAHsYDTTI8Q20hdl0i4sk0BFPeXmysT+fD?=
 =?us-ascii?Q?H2weyadnzVDilSUr3LoHnPAoJNNpzn4O1C/GnkIJ3yNq97cb5+1RJ/uwZDbg?=
 =?us-ascii?Q?j3HF/YdTzHvikAzE2ACpk2Qp0fdfUSKK8sMD2qlgHM3yYnSt8NX0iR8guo/t?=
 =?us-ascii?Q?TXhj81d+0jUcpx6Ud2NZy++pMvl2VfaW1SlqHEl+8yS4SyfCewzxlZYRtPxP?=
 =?us-ascii?Q?wgolMxqrd06MJ+sThTk9OFcdzmdDsyp5iu7ypTezsAn/2Ypy0tqflj1XJaUW?=
 =?us-ascii?Q?Jl5p0jnCPAdv064bJGEyxkSPWcuY5oc0lU2kSI2kKKtL+l9xBE5aILtjWXog?=
 =?us-ascii?Q?/Bwz9I7Sq9Iz51wzH3UWgyrkCSrN0Vn8h3FbkrVBjIWjAejoIoSmMXVgzpHM?=
 =?us-ascii?Q?zzImY1ycKcOa1Ebd0jrk8MKlaogjOeLuc9M1dfijt1d4FMwQhbrlfY12b0hA?=
 =?us-ascii?Q?wz+348/6MOEDBeTvCcZJnCVFCzO7Un0okQW6KwmKWWFNDnm1G0X30lJWqV9E?=
 =?us-ascii?Q?AQqVqbIoXwwV2x20qlBpqvc43h8LMXXE6BqrETuSOBQEyYtG2yfH0PiRbFu+?=
 =?us-ascii?Q?d2ZHYSHdZjDywJE04AX80R5lUIcLpQZoUB7lH/CWHdrQuR5AHJ5IfmLYB1Og?=
 =?us-ascii?Q?fvQff1xR+sWCmE3URS3Z3i9SGh3ILo/D6cmtPoNoo/9ANjza9bilKeKer3n3?=
 =?us-ascii?Q?2HPxzTy+bRzk+E+BObF2MljQo1d5VNusw+g0dy2H0/ma4H2JR4ru5e5pTC0w?=
 =?us-ascii?Q?or4nFlLeQMjV1GqWFaEdbWkQTL+emSB5fO+z/xcov//m8JBzQDRU7pInRQd2?=
 =?us-ascii?Q?iQbwObnk6kG/S1gdFYCjpjnBO47Fjqt5/YPrNSzhQcxbjgLvrVry3ul2rzdP?=
 =?us-ascii?Q?BNM4aBdPcmofnIRbxZWGeywFUZrVC+sMs9h1K5wOFeiGzWNx4IwjuuZ869UI?=
 =?us-ascii?Q?91cVqQ/wo+UvvIWGAoBZ9kew8YtTo5hq9J4YuD7Js/hxFODrQg02aYclBQVk?=
 =?us-ascii?Q?yYBdtyyom3thaESBGX/NKlGlonmElWV5xrl59ji2m6NnI+Y2sYNbBDP7JjaC?=
 =?us-ascii?Q?wiJEMmRE88i8pvysvT9aqZ4xK52WXYeQKbnAV+FT2QewIX20LN8lOuXcOmqA?=
 =?us-ascii?Q?q4diUnQIhnJKCajEvz8t+3cw2dnse7VfKnzHqYpwt1KKMmeCngADVZ1I4OSV?=
 =?us-ascii?Q?uE6QWT+MiEzdH8K4dmI0BHv5WH8+WvYfhmXB2REFKZSHcEWbHAgj3sjBZNSS?=
 =?us-ascii?Q?bn3K63HRbP34GkS/F6HwcKSBo1xrICU3hRaJwX173MG/qwjFG3lIurVcOuC/?=
 =?us-ascii?Q?USgOYkp66QDvYZBmj3/Z/fUoPykRQ7VtG8nR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L0MPB1tQNjep4E/ejWBiLQqqWOFaelK2AFrc0/cOVe9TyE3dmedNkbYHQRdT?=
 =?us-ascii?Q?RxbNCb+W4AGIIT3I8Cm9N0PQ89N35a1ksSYUgNxVLrXP2z0ypd0oic3zV5Wz?=
 =?us-ascii?Q?fqh1InDZUxRlsZGuYYpgD0oZyxeIHrTJo0neexUFIg+lCJ1gj6FVZsnaGl+T?=
 =?us-ascii?Q?0On5GRDOi24fNg3m+9vzwobDDnDHmxBIs9Gvx7RWrlk4dPRMHxQZEiVbd+qk?=
 =?us-ascii?Q?CYCA7zhj0kWfFmuiui7YaE0F6jGDTpTycQsgQnUUVrj+iy4bxTx1WJMRt6a7?=
 =?us-ascii?Q?kqFVz5nojqNQCkOSYh8KSW7vVgJlCD7wq/spQa1nu0zi8vPGYLQsNo5ILuH2?=
 =?us-ascii?Q?nNfhvdFtLK8qg7A7ZgwR1S6i0nE22PLE7BJVEAUqYqBNsZnEeF+hRBvYysra?=
 =?us-ascii?Q?+FcQdpkaiwtjq7DydStdnFANbZJPi+77brNgvqEk2OsOyW0SzydUAjvbklOX?=
 =?us-ascii?Q?gZ9gcBwuJbu4g/DpDzDb3hKMMcRSh4RTc6/xfv9JmWwiFnjF4e64XtYmjiqY?=
 =?us-ascii?Q?yV9i1rymC6b5wBbAinK2/ltXeOCCuFCRTtAcqgxcHc0Bz8ZcN3NtlC9/Mk9V?=
 =?us-ascii?Q?SbczJVuY/FvWXnbf1x7OiGjM1ryiisTAyrR5ggPLbCnOqESDgLSWGNx8ZpjO?=
 =?us-ascii?Q?nOJhBL626X8cRWg6ahApi6aFb6mhrzB9tDqjQrdLmOC0w5zuNaJRsPJqE4jq?=
 =?us-ascii?Q?z7bzgfXx47zQttozoZOcffJV3IhBCpNzuGCtHes3mwnLiJbQKtnByCTk25NB?=
 =?us-ascii?Q?ve47HE34fApJ/ssXaBzQykq9SywBCcx+XTv65m9xmCbnuUkTHKoLtR/1IKOV?=
 =?us-ascii?Q?S/7s27C4hoYvpN1LuCYiMWwX4ErZoT832bBNUn4sznML75DfT1feUUjo/x2A?=
 =?us-ascii?Q?tIbu2zmPOwZriOrJcUA3/pRx/ti/e6tVHA634+Vxi8+pXeG0BlluL80QIC8m?=
 =?us-ascii?Q?joXH8GeYCt74IC67A1MPYgHAA16Hn+HZCz7jwWCJr0uUVIoUgAmDWpMFHz9T?=
 =?us-ascii?Q?QmafMj9yDLpYOaO+Brbx8jzHiHd2yj/gcmEHKvPeNo6iphotF890NmKNHPR4?=
 =?us-ascii?Q?AIdKvyTDtGhvw5EqtlDStk+pQjYcFWKsGymSGy/NyMJXSOsZzXdXDqqWd3dw?=
 =?us-ascii?Q?myvPGEvgewOzpXCBhzL+xt4oqs/iMRFl/RDoqoPomC0QUzcj0/u+airsoByT?=
 =?us-ascii?Q?uZKhBrvfQqampYsnWNc2o0GfCfBnJ8luaHfGd/9MgdHl/Pk0zjcyCo1MvIja?=
 =?us-ascii?Q?hOh2aFS6EdqfGF88Gkkh7nA8/w7zoBnnOJKy2sPvfap8+HVMQDovXxl/mUuU?=
 =?us-ascii?Q?Ra51hS/kKolS3I+AuvGEiY4ARQcmFqODY8BgWMc6ZgNriX5sF7jJ8bsJhwcb?=
 =?us-ascii?Q?XvNQNkTk+Msq3J8AjBe0uuX29B/fPfD74fS/b46uzocz3e6R4Bh81bgSoMM8?=
 =?us-ascii?Q?Fx/ygE4E6gK12CCZGga6HIsz9SvA/kQ2KYIUuD2FvcjIpwRUtvQ7TY1g9QZX?=
 =?us-ascii?Q?C4aOLSaFjRLw6gMT/XWJa/Y4tINKZrtvUAKXjooaRDIEEtZt9JTui6i+7KjA?=
 =?us-ascii?Q?H9O9f6QBr+Xv6+nIO+jOyUJwpwqdjSDgQz1e//JVhgD2TyA+T4DnLOJvo4S3?=
 =?us-ascii?Q?Qg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad25bced-19a4-4399-fab0-08de306cae26
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 00:00:47.2699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sHQLH6Z4W2BR/6BN3r+ihS782vTGuWHOvIejvUNQEkyieX5nIthgCCxyhlEE3BRMpJcno9QFPNjP63ylnYf0sNydMtQ7gubdFAsT5cwCxNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6226
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDIwOCBTYWx0ZWRfXyfF6FXqGVL9C
 gpR/TJtc/5gm7djWHHh2yRReQfZ9A+rwKrMMMvTq6YzhbuAsMJ+l//cmk5+Egc99QtWnqMuENNR
 KHTgtUUus+vYgb5DBG15qQVJUsGYpa2LgtWvY2ZoNkQuGpOJvCbtxBkEOejyLX7t4znttshN+74
 Rs10QuNXUC98BTf/h3BK7KnzJ0DUKzeF0u0w5eNRyJtrM3ic5ExGvZ7RMqEL2q9MhqFEFyIOEKe
 OcmGFMyntqo3rKQf2KXSr/TOHTjRgsDPa+tbqkfyBWP+wnMVq5FiG3vWkYptQyTacQ1w65PPJzJ
 BbRd0LlxtvvpyOlna89pXysMIvB/tKVjpe8O/vDge4+C+lXJDfWylrsvjNEnHhhpMqNGZ/H+6ia
 A/L7U7JQwbf1yc6ZtfzFvsWUcBQA6A==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692cdab4 cx=c_pps
 a=ynjcjXHaqbEn4NYQb+mZsg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=cPQmHSxYVe6KFmcDdKwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: JIV-6bRxgG2alcx_saK23XE3jj5b-dt2
X-Proofpoint-GUID: JIV-6bRxgG2alcx_saK23XE3jj5b-dt2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300208

__v4l2_ctrl_handler_setup() and __v4l2_ctrl_modify_range()
contains an assertion to verify that the v4l2_ctrl_handler::lock
is held, as it should only be called when the lock has already
been acquired. Therefore use our own mutex for the ctrl lock,
otherwise a warning will be  reported.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/i2c/ov5647.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index e193fef4fced..4e14eefba577 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1288,9 +1288,12 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
 	int hblank, exposure_max, exposure_def;
+	struct v4l2_ctrl_handler *hdl = &sensor->ctrls;
 
 	v4l2_ctrl_handler_init(&sensor->ctrls, 9);
 
+	hdl->lock = &sensor->lock;
+
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
 
-- 
2.43.0


