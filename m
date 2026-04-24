Return-Path: <linux-media+bounces-59567-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NMVLPT662k1TgAAu9opvQ
	(envelope-from <linux-media+bounces-59567-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 01:21:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C597464050
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 01:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AD523011103
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 23:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C27337E314;
	Fri, 24 Apr 2026 23:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="DC3dqXYw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E946359A91;
	Fri, 24 Apr 2026 23:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777072860; cv=fail; b=AUkr//QvzmvQ4hZYMy/PQSliikgKhgLbSKIbl97Cc4717EWRXPSEC8zSJyKxGtOioz2bU3hz4YDOuLD6os7sEgLpDHRmspPTtJkrhfn1O7nbReqOAVKVX4300vZlskODqUPApk8VJ0hXFZ+DSg0IQZZfNLcoVP09o8rn3Ar96rY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777072860; c=relaxed/simple;
	bh=Hcgs70l3YfAM8wyA0zd6t2Ii101QV9/Gc01wKOezIac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lVn5Tpz+gITcQvlyjRK0Bb3rPsBgDSerRLZK57MvGEfUurcsumNYC9hxWUD6Vm0C10af85crrcZ7gBOG5BgqW6XC5XIAR+yYEXKTAi5f9be4R4wf03EpxfFUDTCe/xQsXhQn7bbHU0wL2ob4hjmpS8mvjE/zfRa0qjmsq9Fek2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=DC3dqXYw; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OEYPH8697676;
	Fri, 24 Apr 2026 23:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/A8IoIsIuVtdfrnmo2fIFXoPIMQjScSjh3nykQ1cSP4=; b=
	DC3dqXYw7rw4wv7GQ4z5+nTSXh4JiHo4thtgAm1d8Tp/tF3wNVlImw6WrQA8AyBr
	aAvfNnOy79FeVZyGfcMdkl9S9nQh8QMiUlpyDERligyD+yIwd58BbV38XLuYZ/A+
	4i9ZRwDmL5ITnnqQOhVnhjYbK77WEy3ja3idDsS3Ys7cXuWfyB1cRYSC62nq51M4
	jxubpjEFJ7ZHq9iqwiihiucWluA00mZjKCMKBbtfqJ/mvYK8AkvtdIutxjQa31Wf
	+tc3ArKP26rlSej2IqRwM9lXoV4raxpHUGlJSt5T4lQMxzZmz2FY8JER48Xt+2fK
	kA2EFH2jm6r1X2nAQxaybw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012065.outbound.protection.outlook.com [52.101.48.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8qc2nb3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Apr 2026 23:20:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3V3ofj1A4IPeGSLlIeAeikQydPrU41zM2fhIxfUpZZrIUY8PEQfyIq73WEjHgp9mgrNALUAbv+RYdDicgXqOHXdYK1cNMwmF5h7nDBcHzGxPt1ZjSz1tVr+iGgiPnPv49mpgOC183p0J5/fFijOAbtv4u9DfZscWCJFx0juS55eGrfzU/O3c5jW97py7/cpiEnrxvdQh5P0yP7ROUPFA9f6Lu65sYFWTXti4qTca9/WWa++JVwHbJlki7NTP/G8sshJqTktDr28Oofcn89e6c84xmXISXdk/e1Z/x20rwcHA/jeL/7HQSvTV7OahMw1K+xSZvPxxj65V6ZMKZuNmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/A8IoIsIuVtdfrnmo2fIFXoPIMQjScSjh3nykQ1cSP4=;
 b=I1OicE3NDC3+lLczYsACgm6K2F51y6Eynl5fWnWOyQICMpdLD3ynww494xUc9eRzbL//i+MBCw/izMfX/ch31AhbI+t7mjue7VqJG5G1snffvx8AnX0UwFkzg5k2SSCxNAQdiPpH50LEeJX9WP1YmDo1ty30q1fkFmDzb/zqkNbRSLwYBnzqaXOMQsgFgF02KmljBgMJm7aqxtMbhXsFCWNBUb7fkFPPSnVRGLRXTvbsd8dMSmjKJcvQpWgE4gB6l30mttAwrAZqP7K1Oc1cTZbrqXf9AsdKWNfxxv4H/MrS4/JLzfpM4SZmXla3PXRC9lHjaFGjXm/0EQh7Ua/lHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by PH8PR11MB8061.namprd11.prod.outlook.com
 (2603:10b6:510:250::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 23:20:00 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::b919:1e6b:48a6:f655]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::b919:1e6b:48a6:f655%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 23:20:00 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
        s.riedmueller@phytec.de, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH 1/3] media: imx8-isi: fix use-after-free on remove
Date: Sat, 25 Apr 2026 07:19:24 +0800
Message-ID: <20260424231926.406079-2-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424231926.406079-1-xiaolei.wang@windriver.com>
References: <20260424231926.406079-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:195::12) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|PH8PR11MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: cb852884-20ae-42ba-c947-08dea2580185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|56012099003|38350700014|22082099003|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	CMTAwe0d87Ti5TvETn24T5cttCEjFV6Qw2J/ewbU4OXrBDI6VxA9ByXRcsnWVnRCocbPBd6rKZTfRP2DqRHtL1aEDRKQ4VI/KCeJspr49TJWNlRa70m2l59dKCzYYGpeCG3/COpNFXTCmwHQ5qG5C6GUuYlTBF7tRaJssuENKyB018c4w6TKpBR3go+1gLN0+OZNVwxMkruzwd5+KAI9ieEazPTiJBzbarKPUIIcb58OiTkeYJ/JbJ0rKm6TgkBkwgqia5cSYbGyh8rQE0gtO6qFLuuuEyAbkGRgRsj/bXahWx7YdgNrfGDJAB8/aczl3ALmUD66zf9npvIJUjHvReQFAreC1V6j6O2N1phR6K82TdCQhvfVz9aS3p4SEJuj5L4u43FLFZCdsGR00vMRmhvR8hOSwIuFhnqgRk0jKXOf2sDek1ZerFmx3FcGHyObfrMfeNFCzSOV5nPm0JRZ2xImmaZEMUX7z6q0IugSwyk5CUCUL7AD/cG1XuWpboc5T1Fe/dhMQ5nkvBEMdkX9JViJStB+K8AU0FllUolZshwS/Q9ps6Rk0L5XzFJGlZKkR+6AzNVFes2DkTs4VO+PlSWGDuyW0osEs+Aas3s8tr8hWwULw5AeXz88vzI43+0NBT4DzFEQrn6+nhjzSRaIcNnpEp0nTN5GKE8kcyHIccCveAgCzg3yTfx7K5iv2tOP9aGMNOlwJd1l/itO1P1iGgb/rTIRy8OLP96/JPSi+u+CEUznoUpuklKMSrxVVL9zEm+tXTIaDvdIQiE5OVFdveO2XHZWfKRGnX2e2jtcubih2OPVLloWZh+6LAGGpM2N
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(56012099003)(38350700014)(22082099003)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qOIg6Oo5NNPVK2ClQis82UpZCdCsAuDQIfGSAUFZ4ouLDiW+KHrMJel+JuJ5?=
 =?us-ascii?Q?YsIF5qrJVZ3DFdPogBhsMnbest37Qcm8et3e3R97/B2oC2oAem5XNJRO0r8w?=
 =?us-ascii?Q?jR6jHtyxqG45jvigT7UpwArvZoRE3XeUhVuJXMBFztSqgCIHbbsQ92hQ80YC?=
 =?us-ascii?Q?/8B974mdpHsiI7VHHRD3ZtezCjEMb5t7wtioEKD/ttPmj47hS+VQwHB8R97Z?=
 =?us-ascii?Q?cuzzYjpRKAQ5u11B2LLJFDQluLmgBVkC34PVE7mV/1QMHa51SmMGVf7HTB4h?=
 =?us-ascii?Q?s/BMlmAsK/eS5XgbmT4zhPGs3GqjU++vDQyrvAXcOwVk5A/7SE64yTeiVbaR?=
 =?us-ascii?Q?oaKB4louMKZS7+YtLM6fM1KqlkWMRtWv9sz5ip7e1RazHIrPjKT2GgsikRsf?=
 =?us-ascii?Q?Sx0JK7cI09BLTMHDTZXArjMZcPQJZmYOydRZpjXeuerdaws2S152wEOtT+oJ?=
 =?us-ascii?Q?ondJAarPD/Cdf4RUDPv6XMXOA8lV3xJbfc7QWyj0T3HGdiAzFJaEo9ChTtkO?=
 =?us-ascii?Q?9xEf9ZZ3sUckT4cRCX6zKW3GGsfWtMMZv4fHNzESZhnve/AQQhuAPpVLM4wI?=
 =?us-ascii?Q?iDm80gR5SDtrdPP2Kex5SeNctpIPAsnsflzD5aNNudOuJ5YPrbNYPQxSoGWi?=
 =?us-ascii?Q?EP+WrDjzell0bChsQjbaJ4XuhrMu2QffavlenSaw57qvLvANPUMtkpv7No7R?=
 =?us-ascii?Q?uX7uhYTYdYRe0+QtMe6WqroXEAepv1amSjDiww852TTXEvAxL9OZW4RkQgis?=
 =?us-ascii?Q?oz7bjGO8i+4j09KGeBj50Ve48BSp3eE87G789/mjbz/LCrJdfbBUNzdlh3L4?=
 =?us-ascii?Q?5R8Od/DhnnZyamRPzrhUfTETDdQaHNa51sK45V83yBjhMeLx//zBJuG+Y4vd?=
 =?us-ascii?Q?SiFWORValmIrrYdsdQWHvxUujtaU9s3y2PznMwViqRI2S43bQWVTPIGhZZ7Y?=
 =?us-ascii?Q?3Gh7JDLiC8lEel1PmtoDKuAnn93bE1b6/OXxxyH71XcWF2U5PlT/Jq1PgbC9?=
 =?us-ascii?Q?MF+tfVMUidEfa93/WhHSCDiXT4jyRngPQS/9XhpDcYRFH+CqWjWUtoizuF0B?=
 =?us-ascii?Q?6XRXiC33p4tWZoFX2zYjcAb2GLzdESk70+Ugx/cZhDFEZCCcnXMUaCRoEeoS?=
 =?us-ascii?Q?BsjTXF+xPIqZ8WVwNtv7yRB28klKhdlm6HWfLzcDWDG/1/wdRTjtmERoMuQa?=
 =?us-ascii?Q?fa497X5NaFElaQx9G3Sm/3vKxsE57Jswj2CfmI8YUSK7lt6Kh9GRTN8vqUTj?=
 =?us-ascii?Q?WZVgNh1yOy9Ebwr7mugWm7YwLTmwVwGvUKcc7ten//IBlQkOiHS+Y88Pz03d?=
 =?us-ascii?Q?p3X3/7iAyhveaQQw+yZFZi1Sn+HMGf0dD46F5CvmjA2yz7hynFkBbgFfQCxu?=
 =?us-ascii?Q?O1E/NijIhHkhWAZIsWrhJA8BWcfn9L8rhC+GmsHMJwCsEVHZSi/1qisvCKM2?=
 =?us-ascii?Q?Kq70QuWuNhMAzUgLJn+XSIqlpgSu8mfkGY+DhzAclUIbXt986uxq80DImWBu?=
 =?us-ascii?Q?TJcKJgmMOjqCCNuto3aG4KD/COgoCR4mRju1tWLW0h9edY3SC3ffh9rqHU8r?=
 =?us-ascii?Q?eBbXMXbN1sEnrAC3APRLMvMDaE7qudh3s5/abjrQAwA397ObmvKlirg8Wmfn?=
 =?us-ascii?Q?Q09LyUs/VCcPzeIe1p3iVJ/i+ANfP1Tbpzk0PU1xphHHcNBC05QLyzy9v+wa?=
 =?us-ascii?Q?+Bgyx2LgYKCX0X2e2QXvrofF88zG6+cfD8T3Of46mG4uEk6Cox22tvRrzmXb?=
 =?us-ascii?Q?vEhYOwGZ9VKFbS2DNzm38rP7Edhhe1s=3D?=
X-Exchange-RoutingPolicyChecked:
	dka9aIyF0FGE+pHcAyp108U/c26TU9rYvHkRfMaAkK3dLt9khGkQaryQri0VHWwtQ5pxC65q5fDfrGUz1xOPKOzGQFID0lw7/6NSUIomm+BnjQpcoHDAIyPDaTNpAaZfGhjaHSKde1i9Cw2tuQSvntgpaBvHYtU2gN8Cgtw0EQVBK+H+Dib8/fi5lSug5P2TJK2vMeHPV9YDMzKecj06PsPj8ruKMayETSQ1K6YWQZNdDsEV+PBn1up4UN9CZmVflCB7VkQh30bpIdu8FrvGr8xen1fdokvNIh7uM5yJyBlXMDHb44HlK6BqxYntHlWNbiZH5Fj/jvxfAqNRfOyqtA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb852884-20ae-42ba-c947-08dea2580185
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 23:20:00.4704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4u76ip6gkQpSeXp7zhILadbdYyOl6wrwgXoYlT25sYf2dXhUWyCIPEZ0J4z52A1UmCyqSldxptU6GKINHNZormN0WMTtkbvRSgnbDfJCg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
X-Proofpoint-GUID: vB92T57ye1VgvPJPedgXsL8ZnunUe7GU
X-Proofpoint-ORIG-GUID: vB92T57ye1VgvPJPedgXsL8ZnunUe7GU
X-Authority-Analysis: v=2.4 cv=EY74hvmC c=1 sm=1 tr=0 ts=69ebfaa3 cx=c_pps
 a=W8nThqPTbj8xD7CpgneC0w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=UgOjM9SW4ZuDxLeMq3wA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDIyNyBTYWx0ZWRfX4X2cE6z5A3Mi
 KotxS5jbDBFBsHvzY6a1tzAzfUM861fDDnxwvZ7eTVApdiz9HDRgIovt3V+UvrkcQVTaGFiAtKy
 m+4oy2TnhltTOKz2Yv6HPDkSjh3P67iy7gQljA8fCnpELEeoFM03qMpCHgBZ4CbIOnPksO4a9H1
 tkLlfrtOb9zFn7E1FFlD/tZfo8bVR1Tp7W4qiYrag9sW4p268biM2yKovbgzIKFtivVV5EmH6Xk
 bVf5LE2l6Bz3FQ77Fa/3P14wlpJRxmZ4qeKquN+tbvzMg2PjLg+4f3XNoMllc2QwcxNONylX7c/
 XQUHxahx2VwicNNnclHdmg+9nN8Papeq4un3hF6rnlKqZ7URx9xHZQrZXvM8gCT8ZwokX+rpPH7
 /xYmuo3cAiqw6EpJcT1WL1vIqZY8EsW2LQJqKB08YdnJMaikGxhD44AOvfj5xIe89DBNVXxvN0T
 hZ+yaemt0rihLHUOIhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240227
X-Rspamd-Queue-Id: 2C597464050
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59567-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,windriver.com];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,windriver.com:email,windriver.com:dkim,windriver.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]

KASAN reports a slab-use-after-free in __media_entity_remove_link()
during rmmod of imx8_isi:

  BUG: KASAN: slab-use-after-free in __media_entity_remove_link+0x608/0x650
  Read of size 2 at addr ffff0000d47cb02a by task rmmod/724

  Call trace:
   __media_entity_remove_link+0x608/0x650
   __media_entity_remove_links+0x78/0x144
   __media_device_unregister_entity+0x150/0x280
   media_device_unregister_entity+0x48/0x68
   v4l2_device_unregister_subdev+0x158/0x300
   v4l2_async_unbind_subdev_one+0x22c/0x358
   v4l2_async_nf_unbind_all_subdevs+0xfc/0x1c0
   v4l2_async_nf_unregister+0x5c/0x14c
   mxc_isi_remove+0x124/0x2a0 [imx8_isi]

  Allocated by task 249:
   __kmalloc_noprof+0x27c/0x690
   mxc_isi_crossbar_init+0x22c/0x560 [imx8_isi]

  Freed by task 724:
   kfree+0x1e4/0x5b0
   mxc_isi_crossbar_cleanup+0x34/0x80 [imx8_isi]
   mxc_isi_remove+0x11c/0x2a0 [imx8_isi]

The problem is that mxc_isi_remove() calls mxc_isi_crossbar_cleanup()
before mxc_isi_v4l2_cleanup(). The crossbar cleanup frees the media
entity pads, but the subsequent v4l2 cleanup still tries to remove
media links that reference those pads.

Fix this by calling mxc_isi_v4l2_cleanup() before
mxc_isi_crossbar_cleanup() to ensure all media entities are properly
unregistered while the pads are still valid.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 4bf8570e1b9e..2d639b789910 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -556,8 +556,8 @@ static void mxc_isi_remove(struct platform_device *pdev)
 		mxc_isi_pipe_cleanup(pipe);
 	}
 
-	mxc_isi_crossbar_cleanup(&isi->crossbar);
 	mxc_isi_v4l2_cleanup(isi);
+	mxc_isi_crossbar_cleanup(&isi->crossbar);
 }
 
 static const struct of_device_id mxc_isi_of_match[] = {
-- 
2.43.0


