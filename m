Return-Path: <linux-media+bounces-54005-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CC+1Cc8ZpGm2XAUAu9opvQ
	(envelope-from <linux-media+bounces-54005-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 11:49:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4041CF37C
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 11:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 038613022698
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 10:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99F53019A9;
	Sun,  1 Mar 2026 10:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="YvQlqE63"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7773924679C;
	Sun,  1 Mar 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772362144; cv=fail; b=sDa9RhSdFBztjIqMQRWFoD2vs2XBUaeTbjta+f1UnXeDwjYWj5yOsakOF0IDjq425drL6+OZCIG8I70BPxkkelfO8AG8gNRizPO1XmfknUmYoGIIghhMYZbkJcYzfHAnWm3LaRHUX7LI3yOHQQoTf6h5SZUMxgz2Ls+W/lM8JjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772362144; c=relaxed/simple;
	bh=AN3c4bBmQQE2Do7LHycCnS2jUJTKNII6t5ydRUQ5VRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TTZchbplJTctVf9tX0h6Ebu/kJ/jvvSFK9YaOP0VeJ+o3z/ul1HrgsL/izyiiMJQzhgZFgAcjcGjfFqiSloJGzQGGTvlv1YH4yOU6A42zvueAafkztg6uKVj4q607FQ3IHgvc+mS29XhMa6IBdW27pZL6NSXrXnoH67JjPTlgRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=YvQlqE63; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621ADg0J1397059;
	Sun, 1 Mar 2026 10:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=x+UUiPRvqC0vWXto1fuHjzxdANOyOoaabzKmp6LqauY=; b=
	YvQlqE63M7EPm2zNBULGH7AxwrN5D/kaU/l4eW4kXKLN3uOPlaLoySfIziacok/u
	PbMaN8PQqH0OYlzx08OKeDPP468wlwSCU86HxoIVkSKlkri1+W/kAFXWuRnVBLMe
	rrdxaKdjyJHIddU9PUrgCST1rvII+5MVyAXlMdrE8XtXIKQj1X604GjvzcTS/RC8
	VMNn0qOOG6omFp+TRkMVRUNqeQBr9L9XglSwD9uACJr83P7EaAEMvK2GIn7fFfSN
	DS0QkmxhgtGkCO0bZreLvRQttKp3NIY90kN8G7LtaMhMGwTb91MJQZWQ7wS/VE8V
	VTfAPxk/WWQMsigbB+QA2Q==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013008.outbound.protection.outlook.com [40.93.201.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4hbm8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 01 Mar 2026 10:48:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWzR6BLCtjjnH3/rkaeRH5yTmZZk9fnwa4J0s65bBc4SmmvuUsxStkk0F1MFNAztEf+ITCMcm2TTb9JwJk6HyDx7UoDCpXyBihwpO8LhxXHpcZ25bCJApemfLMTYAO/ag9x5kMjznNlMKMg4zlj24ZYhSntZrACDL89/zE4nhkwJwCPap1PGR16jYnL+Y4BrMtSj3pwAEt2Jrx4DqitFEB4z7ouUP4FbzyZKInmTLUutMqVx4zc8z68uaImcz/pR4wCir/12S6t7RFM9D8/WmZ+VIZwRaZnfOPGQgb3eqpe50tkovM4ZAwwsLiYsSz41XoG/dqISFksX6tynh6SlAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+UUiPRvqC0vWXto1fuHjzxdANOyOoaabzKmp6LqauY=;
 b=QvSkJ+q8hz8KF5gWaYO/0gwlClNzTBgFWKa1QYloLzlG75pS0a1BcTJugh61T5KLifme9ABqHMWc+onRUfILdcrZV5VopX2J7OBDHxzw+zOFAMt3IJTbfWCa+MmheL3DvbNbvudzI0M5W6zlXADTQxL/shp/mEE/uPa7HBSw2CbVddo1FmQVrlQOJOxzcedho6RwkFOoEnHuW/sH+FRxLGMF7SBk2w5DpDaOTGdBoxWpnwWpuPviSVo9sXImcFTr9r3m1nMTws0HRnkTWQSro6LoOUifCYjPAJIp00ZcJrJ4IClNnRGAwe8ZNMk1R04l9QQXckPs9qWYvSVxNKNRVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by MW6PR11MB8311.namprd11.prod.outlook.com
 (2603:10b6:303:241::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Sun, 1 Mar
 2026 10:48:35 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.014; Sun, 1 Mar 2026
 10:48:35 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] media: i2c: ov9282: Switch to using the sub-device state lock
Date: Sun,  1 Mar 2026 18:48:08 +0800
Message-ID: <20260301104809.3505257-3-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301104809.3505257-1-xiaolei.wang@windriver.com>
References: <20260301104809.3505257-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0119.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::9) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|MW6PR11MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 412230df-aba8-4bb2-5c56-08de77801663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	4PFNkjaR7+Bq5rBgcwat8UCwJCZGyJsDV821MvViWui/DKzUuDOoHfQBRTK+jDg8eOpNAXEFI401YTrA4Ww0bW4P9Qz9BWskyYF1U9ZujC17szfEtDbc/WfnY7oM8ngtcuKladhTJECqhMtNkqas8GJkhpZewNIeuwNwD7sAsidfj3JT6lKuriglB+0k9AUFE2Lyrd6KKD4M3wH/6IVC55mFg51RrjuFWZxOOGQACe3vYsOPXcTtr/jFoudQga2j9OUCRLaQsZccqrDSmfByGbDAjvmL10U5TZazdPHTbhoi2pZGY4iyf2FmXSTN+GQ/rAm3dxjIGr0wFZzRqNAsUhqk8nfYoXatzqIrt5NCYqHtsrozdtOKFj79LhSbjfv8L/jKRHtK40tPWpubLM7uxtHWDnziXR3P28DS/COvtTkfF19GECp1ymNWoxddX3lxu781nFNOUB62pgHnuZAdG/5u74tY/gW9DWzTG/Y8IEwdSDWNPSd7Qex7lW6fP7rWJFH3LYSMbWc0FVTs+/XwFlwKngE3L8hWFsF+8UXeIjKMw18Q5VtM5IQkYcrdm4maIx45Dt8EzpLiZ/xxaLGzKdc1gN4lfSim+hxymfH0hof/K+ijpVCkRRUDwshxVzWiJVtQnFkVbYhQfHcKWbwz/h3Xt7thhCq8bWgeq7Es1PsaeDHJyTdk2GuTTYMDJB3LQ7amb6tNAm7zVauEJ/zKaZ6bwGeKaEcSRHth2mcAOZ0jhn8Ak728evtSFAh8AaGg4ymR6otvg2gmEklUIQWYJiUtFJpcFHwLRiH64coX0dFHzVokK93Nd6P/7ZlbNBQ3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gueNUtIwga6itLeq06E1PLImptYR6WLgoruQZeEL7QS82ZqRAzC9ncoY76/b?=
 =?us-ascii?Q?jtaEiDMbt57grO4ncLw9p2zdXWgSEsdN2PGMbOHRHhmTDyPqxlVCw5CERD6l?=
 =?us-ascii?Q?0swKfjAUbvTK0G5gQJbMupa0nywgOBPJM/y5Qc98E91MNCwC9RYxKLTeyhp5?=
 =?us-ascii?Q?glSYyNm5CaPlLk2R21/U0PZ7ea1SPSFAhonp6UXh78mt1Hs5YcD1yko1YNOg?=
 =?us-ascii?Q?t0bXVoW86dfcQxjlMVyd/MhBMEC6p8/G9ds+dkr8sxyDt8cjwDv1Pz7HofaD?=
 =?us-ascii?Q?/o9oHwPrGFiW7+KvGEg5DHrvrCaDLHLw6QiYZXIsg6tFSMZEeIinKSZk066m?=
 =?us-ascii?Q?lIfy9rBMqzvIz/NiFRz6GNc2boL4qcTVpBUfIPVii0VT1uO+4oiR8yZOM+tE?=
 =?us-ascii?Q?YLpjymDBdT7quPbu851uHFA5syPwrXKKqnjX8v7kT0OKugC0+352CyijnoMf?=
 =?us-ascii?Q?szqztqDR37eqpX/5MFpE8Pdt33bgRXOrNra4Y328Z7mhEgXyuwxnIzeIwr3V?=
 =?us-ascii?Q?OilMDS/jFxfcDHXxphpnrOhx2IwwFXD06jcCHsjF7Kus0yTQ7o9z6Dq1KbMD?=
 =?us-ascii?Q?XACSx+RzjU6qIQDZ29TOnxSB10F/+OUIyVdpHrdeMrCFxc5L8eRYg/iOaNCP?=
 =?us-ascii?Q?VoyoIM7rjtrAPo+7fUZqUGFXZxNkVrxsTyFPTVckVFBc/WBY20l9/vFeNmQs?=
 =?us-ascii?Q?Ow+Vj5GLiUDkJZnoodiqGZTmT2xQ+rOF+Y+U3BezEY58qSOx3XS1Jal7lsdL?=
 =?us-ascii?Q?C5zKD68ikrPOLUFEjbPBqrxbkReSVHoKevPzcRGc1RPirJ5ZP2kOafRyujsm?=
 =?us-ascii?Q?X1KQy/qqtNRiKOFESWeuhlJSEA6noqg2sgpPevMrOWsnzMOteWHaS0P84Svh?=
 =?us-ascii?Q?vf5mRUAxOuX1Mn6/Be55AYOplDHTe28C6Q7PQqNrTgkqNeXGr1UhAK22kJPO?=
 =?us-ascii?Q?Z2q72HLRpsB/ep7rUr5iar6YHFo7wrNK8K/YVepF5CDMZYa5wc+xU7A06LpY?=
 =?us-ascii?Q?VFlz/LPtWPMFBz769eTDbRDmKjzJ3EK3MCnk4Y3Mx5+NS/C6XSUYpVfmsZni?=
 =?us-ascii?Q?62CeE/GJJwkdUII4BGZ7eK9b18VUP6IfAMH86SqJPjxGk5JU2gZmE8UqgGpk?=
 =?us-ascii?Q?AUTdkZEEj3AcWsleRznV/29KHx+fXZgWFpSeL2MyfC04DUzBmIHQMHgZVcNW?=
 =?us-ascii?Q?DGYE4LCsBUD9hCJj/hhrKFW196M37oRsbOcuXNIiveMVfoRtVqGq9mcTAfV9?=
 =?us-ascii?Q?SWXvrsjVjW2+xQhbHth2ygNJYjNuezU0Gs4pLanSAWyiZQm7Ko08A3Cdxvm3?=
 =?us-ascii?Q?Sq5ahBd3Imyl2N2WEgBKMdBo7bP2OB/fb62hriTjL0X709mgrvzUe0iRhc0h?=
 =?us-ascii?Q?LOtJ7QtzjM1O9/ZUBP9HPvCavI5Odn/+QqZ8bG9NUAd1PX4re9GadVyFaqRI?=
 =?us-ascii?Q?zPa1ChfgcHK/PIiMfTp9edHWFSorVcnCUqtIrmehwjVBSWK8HLjb6PlU+tGu?=
 =?us-ascii?Q?ueoWacFk2l/Z+uXRUhoS5JtTUlV3Bq++AWFlHdYYzSHNcxrOraPVTNhHj2j+?=
 =?us-ascii?Q?Ih3yxHPiUZy7RSkvlRuR9tEum1p892xvQxpSV0Uddfpt/Ya+ym4rulr9t1iZ?=
 =?us-ascii?Q?9VHXRyiKgh50NFknbz6l2YoF8x2Arhv+keiAnhmyIQHr0f+6sVPnWih0MS5L?=
 =?us-ascii?Q?edOZQ8B/XBZaNQGhe7ANEhjq+ndhPGvvyKAUf9CVE4yt+pjxFVj4rPq+ZWCS?=
 =?us-ascii?Q?CvwyjXlTcQmj7N4kxTg+0AoGHq0ATRU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 412230df-aba8-4bb2-5c56-08de77801663
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 10:48:35.0503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNgX8V3YpSCx2r0xwA7AvFAeBMWiat/GQNSFDN9+BxXpagOKd6jbUGXzneiV+TGuek0M1OQobo65+BbNBIPAqS9ezP76Ju1/Zcr47dzzZx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8311
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a41984 cx=c_pps
 a=2E9rO6gqkamS8B1JEYjvvA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=b-pzV9cxAM0HHkGdTPcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: PRzFFJWkmpHVAvn1IutB-V7rnsujCikQ
X-Proofpoint-ORIG-GUID: PRzFFJWkmpHVAvn1IutB-V7rnsujCikQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA5NyBTYWx0ZWRfX81Y2JAycD7CV
 a6Su7dJynfaRFq242N+4ek04NGuvR5xMfNkIktJ2pb3keLQSrISZDTDSb4/Q9TnD2kUbVaTD2O0
 rciil2lfRdsC+y78hcMUdNgc32G4jxjDuh3mYoKJa9RlgoAde0w1ApNi7Owl7MUhMl2NrnI5lrg
 QIDAGIOFwZbnTdJ9NkAIBNC35KxU3nEQ5kWXWuxlg97vdxdAsMPR7o7bkCf1UxeEhetSo9H50qt
 E5H31DMbtoofuEZemL5qWQtgwjOJlw+3ZQgqM+6Ih8lVT/pFFH1JaXdnYVM5TDbbr64kn3Ao8DJ
 DxfFiry4JEc4EvskMSBOVMATVQQrzSDsWIJst5gsnafUg9ZZ/0OM2lgTf9OpbmQIXVzGEFl8sLc
 unfJUHjtCQHOwScE8ukpzR9RrFbVx8+bD/kOc5YxuYe9KiYDvVdyITHYz+3D6zkXIcO4uMkSXH+
 1ri9Bgd9MsPLfXzIgsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,siliconsignals.io,ideasonboard.com,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54005-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,windriver.com:mid,windriver.com:dkim,windriver.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E4041CF37C
X-Rspamd-Action: no action

Switch to using the sub-device state lock and properly call
v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
remove().

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/ov9282.c | 50 +++++++++++++++-----------------------
 1 file changed, 19 insertions(+), 31 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 8bfaa3ae4be5..8acbd43838d5 100644
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
@@ -1448,10 +1432,10 @@ static int ov9282_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor(&ov9282->sd);
+	ov9282->sd.state_lock = ov9282->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&ov9282->sd);
 	if (ret < 0) {
-		dev_err(ov9282->dev,
-			"failed to register async subdev: %d", ret);
+		ret = dev_err_probe(ov9282->dev, ret, "failed to init subdev\n");
 		goto error_media_entity;
 	}
 
@@ -1459,16 +1443,22 @@ static int ov9282_probe(struct i2c_client *client)
 	pm_runtime_enable(ov9282->dev);
 	pm_runtime_idle(ov9282->dev);
 
+	ret = v4l2_async_register_subdev_sensor(&ov9282->sd);
+	if (ret < 0)
+		goto v4l2_subdev_cleanup;
+
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
@@ -1482,9 +1472,9 @@ static int ov9282_probe(struct i2c_client *client)
 static void ov9282_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov9282 *ov9282 = to_ov9282(sd);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
@@ -1492,8 +1482,6 @@ static void ov9282_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		ov9282_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
-
-	mutex_destroy(&ov9282->mutex);
 }
 
 static const struct dev_pm_ops ov9282_pm_ops = {
-- 
2.43.0


