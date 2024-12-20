Return-Path: <linux-media+bounces-23876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5064B9F924C
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F08C18974DE
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDDE215706;
	Fri, 20 Dec 2024 12:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Dt4QvuwI"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2056.outbound.protection.outlook.com [40.107.247.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DF32153F3;
	Fri, 20 Dec 2024 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698171; cv=fail; b=KnUfsv3FtxDoEYJF7FMajt6mRKnDVR3LDbNCLWPjAiutK87i1OJjnotE6+bytg39YDKH0VJ8JIN4GVa3MsgYchwYGfEu40HxaF44eBRyIi04astpc7rmcttXTFxsy2Y4FoExQAnUe+meWxcQH6foUFpWK+fucGhAZY6Oeim45tQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698171; c=relaxed/simple;
	bh=JDEjsM7wAChbeFdO2CG1vB7vCO/Q2PZe5Xo6Jlf4sqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZqCwjKqCvYhcy+1ZeiOrREybaDqO40yBN4OuSeVIY3AEPauxj5UNrJHs4rZDYtkE+hFwlWnjUzfSjD1GAtU3FUmOpBSbK2YnQcWaXvL01gQfsErxWSuvO36TvxIKUDXCbSaNrguj5apl4L3ERz4f0BAshvADJ5TyDdenw0wCGys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Dt4QvuwI; arc=fail smtp.client-ip=40.107.247.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/zJ03Xn9y9EGtIuC/xP9XnGW/iXlTm6PcfTEelSatnRShuN6fDRGUZUH1+g63ux4GFqSGEhWPW2M0RIteYlHVm0QLGsYGo3boi74Kz8MIj31UDK41zCqlCeJIkRiTc9BY66OnRGifzC0LmxVPoGhso9ATiMu3spmlt6Xi9mn0cmLJuo1cl19tQdXhhj59SpMYVnP4Wegxj//6IZ3CuBWJjknGXxVF903/j8c40UiydV1N1XDDEhc/aPD5e+U6XfJSDKs7TJfmZ9JaVouLTXVfgeItDBAsHJBAnzFZxXUZTS7+X2InDynMozkLNfGktJv/t3MMA9OsW4wbyUIiiY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCfbsqE3Rmf03txvCD4DMR0ugL2hywW2KxTwbvFn3Vw=;
 b=n7ZZsF0S8DtMdcgtavCrGbo3472gsn0r66NbJ8C+cWj4JxvtDufpLCZY+eVhjUnO3ddSDJae1vr2FdirIcPAaE/RI2cZda7PaY9vp1HCDGjFTicun97Amt/tcdMXVR8PLQ1mzNF516nzGL4Q/C89tRap1INebRqgcrWxEuxwvlWgBcsKiUOfUhbAC3TM1psKnMm/OcHirAjMiMiR0WV/Ocme/Pi18tHfbJUwdKKZ8Ec1Jnr460np1Gd+atMuY4lyl+kIwtUXZNzZ57ZmPSOVFhIo+T7ByeqYQe+jqpINohTHUwjX65K9zw4AYjfl7kNpdnT/SK6Ga+7DUy2fQxAMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCfbsqE3Rmf03txvCD4DMR0ugL2hywW2KxTwbvFn3Vw=;
 b=Dt4QvuwI1kPltl+9B4W6sAFdBJnZYpHOXEV+ZBj6KVJFBoYPzI7kYm5hXXgC8jvXQylMbjnwhDpShw3t4dQhNEsv0kQq1JqooxrtUh5PGiSaHNr4QzcZY2tICgaZINq75BAFUoQsXdEzm3wipkxZSh73XIbFbgsJ2TSOEu8SgqdbXP3H5UJZRSfa7pPtYk4QKKD+3lqFoHu9YlDVD0R18Uw7RYOtaYhUujpix5xHRgaEKeDCcEe28mO9lVCtdpF+oiTNWxvlh4fKel6XfHUcjvSavsWzU8sj4k5vObSfin7D+2Se26LF7eMtLjcY/56qeGTyEf7UrVhvpk05nf9VFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by GVXPR04MB10047.eurprd04.prod.outlook.com (2603:10a6:150:117::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 12:36:06 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 12:36:05 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 2/3] staging: media: max96712: remove extra debug register flag
Date: Fri, 20 Dec 2024 14:35:49 +0200
Message-Id: <20241220123551.696330-3-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241220123551.696330-1-laurentiu.palcu@oss.nxp.com>
References: <20241220123551.696330-1-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0087.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::40) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|GVXPR04MB10047:EE_
X-MS-Office365-Filtering-Correlation-Id: d44e4c08-d188-4091-5cdb-08dd20f2df60
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y05Gcno2YzRxT0t1K3JzU0xac2Y3dFRIcENkQVpwa1hyZE5xSVFpdXFxUnRp?=
 =?utf-8?B?RDRJaGVuNnFrM3RvZWMvNGZQZzdoVnJ0dWtGejdIWEs1U3lNNW55Qi9UMEZu?=
 =?utf-8?B?K0k3N1M5Sit5cDIwYkpDc0JMS3JMMmRVRmJIZkFWRFVCWWlYbUdCd1MrVWM0?=
 =?utf-8?B?MlY1ZEFWZlo3T3hoVkw5eXB6Q1lhdm1ZQlBac1ZwajdJQ0MrQUZ0M3lMZzlI?=
 =?utf-8?B?cnBadExnbjhiUXUzTkZDT2FZd1NiL0Ria0J3c1VORTVDNTZEWDA2cFg2MDNk?=
 =?utf-8?B?TjJzY1UyVTVJNEcvdkp2eTNacVczb3Y4Z2hZYXpHK0JHZDdBR2hxdDZqUE00?=
 =?utf-8?B?blNHb0djOXZESDh3bHZWbW5QTml1V3ZUZDNsVTNtK2pzZnRrbm8xTDlBRGhm?=
 =?utf-8?B?bCtCQ0I3L2hsOStRY1ZBbmZDczNIY2pvMEw3dEFrdXJaS1oxc2JEc3NINkpi?=
 =?utf-8?B?WVM5TXhFNnJGWkRDNWRUcEd5cE9la1Nja2pQaG1XUFE0U3B0T1V3U0JCSnhW?=
 =?utf-8?B?bDJ6MVJDc01OY0RqMVRVLzltbjlCNDFudm5Ma091ZkphTFhDRnJrdVh5K2li?=
 =?utf-8?B?QTg5NlJnWTJzWjBlMC9sNnFYbEZIU0Q5MnFVUmhzR3IrNFZkbk1OMHU1Nnkr?=
 =?utf-8?B?OE1jVUprcWJsVDdmNmRVSlBEWmNpTFgvczFxMFJxV3kzbVpQOWxIV29kejFy?=
 =?utf-8?B?RW9YT1NHbGJnOVRHUEFSQldDVG5OdDBTWU02bVVjaHdCM2tZS3FIZUZndnZm?=
 =?utf-8?B?bE1CMnBpMUpBNWRMVmJxYlZ5ejV6d3FCRDRoV0ZaV0IvY2lQVXNXZzJESjgy?=
 =?utf-8?B?K3dGalQ2T3ZDL2RRSk9YVFV4VjJtd0tBeFppMXBFRVFuQlEySEdkQmZvUjE4?=
 =?utf-8?B?ZGV5VWJXK0lzdk81bng5bkRBMjhWMTY1cGw1aTREVlVQYlc3ZHdiYld2NU5E?=
 =?utf-8?B?anJTb0RxVXovaG41c2QwcWY2c1dWMmxqd2lDNStGRXowdHM0KzNyZm04a3hi?=
 =?utf-8?B?QTEzalBJMkNibkFOYzdMaHBoR0Vmb1VrY1VYOXVKL051RHRjak9zMUg4YWhF?=
 =?utf-8?B?YXA2U0VSaFVjKzhyR2xBZWd1dXR4YXU1WnROQ2VPYUQxUzJxV3VKZkM1a2pD?=
 =?utf-8?B?SEYzTGFRMWx3UzJBSEk1Ujc5NGRZaHB1bk9JMGQrcEhwWlVtRmJjYzBzcUdL?=
 =?utf-8?B?czY1aVp0R1FRVW5nN2hCZERTNGtKelVzTzhPazhWNGtTMWtuSmJQRi9FNURY?=
 =?utf-8?B?NWZUWTBNVyt4RytiRXRwQnBiN21NSllRSjJ1UlpZaVJwZUNpcnVUNi96WDZC?=
 =?utf-8?B?K1V6d0tuT3VjcFJPRXl0dWE3QVd3N0JHd21LSGxISWFKNlBPWTRlZHpIZXdo?=
 =?utf-8?B?RDV3Y3g1SG55bllLZ3c2R1YxclB5WXp2RlNQYi81V1BGdmRiZG9RMjRsT1JE?=
 =?utf-8?B?Uk8zOHhpd1NXYlRwaTBhTWpTUVh1c0NRVVFUVS9PVW9OVE4wN2d6S0tMNjVm?=
 =?utf-8?B?WUllQmtabUE0azlGTkVOVGtPakp0cHZZUjFENTRBajdXQnU3YldhNUc2cDZx?=
 =?utf-8?B?M2dhejFwV0NJSUVDSVNFKy84OVhJc05BVG9IVEgyRUw0UTdnbW1Xb01NZEpt?=
 =?utf-8?B?UmllWk9PREhnR01hNHk3dCtuTlhtVXk3cVpGN2QzQTFUZUpLVURsc01jZjhH?=
 =?utf-8?B?Mng1QUh2UmVzZTRSL0Y5KzE4eEw1Mi92MUg1VHFXUmNRMGFLWHVKSUdaV1U3?=
 =?utf-8?B?aHRrRHJITGJZcGlWNGNPQStTZlpzWmNiZVp4UUE3MjZGT3NYYnhYUG9RYW0w?=
 =?utf-8?B?eFhpUEl0ampNblA2bXRTbXZybVZDY0ZxeFpMVDNRaXZFbDJjK240QUJHWllx?=
 =?utf-8?Q?NXF4q51P4owgf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVg1bUZJY052VFRBb01rSjFibDA1YlU1NDQ0cDVBb08zQnpCNCtXc1NqQlRB?=
 =?utf-8?B?Z2d1eWk4ekpvcE5NbEhKRmxZTHFKRjRDcFMxQXJNbi9wYk5uckY1VngzWkdY?=
 =?utf-8?B?d1N5ZDRxd2NtejNmWldiQjMyVTl1ZkJidlJMNHc0ZUhFRTh3QjAvZFErZStt?=
 =?utf-8?B?SWtsbFUvVkNFOUFVei9mTGdMdTY2UDkvSWl0LzdpZ2huTHV3a1QxZWI5N24v?=
 =?utf-8?B?ZjlLSmQ1WmFNTkxIaGJ2YTBDWDNQNjBlQWZ6QjV2ZzdVd2pPalpGNHd6SFRM?=
 =?utf-8?B?QUc3UGJVbEFJbnRiaHY5WlJWcnBLZ0k0dTFPclROTTIrK1RrZlZnUUY2c1RL?=
 =?utf-8?B?RWtBTy9jeWt4WitxWGR6RGlMdzJaaU1LclRUcWJuM09QaVZ0ZTAyd1poZTF0?=
 =?utf-8?B?OHRwVjJodllnRHl1ZC9ra3d6V0xXVVJFc2hWV3ZRcTVjd2JRbVVtQTg0Ly81?=
 =?utf-8?B?MXE4UjNzakFKeUhRWWJNa2dYc0tyVFlEMXZLa0lkeFdUWVVBVFR1dFVldGFD?=
 =?utf-8?B?eXdtZXNhcUU0N3BzWXdtZGN2a0UzR2RFN0kvTmxUSXBvOUdsUFFZbUVaWkpQ?=
 =?utf-8?B?ZERYVmlHRjlDNEFkcWdCNjhUcktwSWEwU0twanlPLytEdXNEV294eGdmM1V5?=
 =?utf-8?B?ZHBwVkN0RjZSQko5dnREZXdZUFFLTEw2cnhTbW5CWFpoUkJVUkpPdHBEaDlq?=
 =?utf-8?B?Q0VyRDNSbEUvMDV5NWw4UTR5V3QxT3QrZWJqbG9QOGllYjBJSkRLck1Mbi9m?=
 =?utf-8?B?YU9wb0V6U3VEWmdIL2I4ZjhUN05DWUpGenRxQ1dNVTZhclJrK2pHaVNPZWw1?=
 =?utf-8?B?ZGRma1FsL2xZYktmRDUvOERub21qVjJSTUtDa0hXVlplSjcrbUNEd2xqYm5M?=
 =?utf-8?B?aDBqcHhpWUJNODhvbXlvRmMrZGNianhpc0NZNkxWRWZZRmxkSG91SHFIYnF0?=
 =?utf-8?B?enJIWEdMdWRkOGhhdXl1aVkvRXFVa0hPeG5mM1BuejBxS2pYN3ptNzdIc1Zz?=
 =?utf-8?B?UjlKQWZaMkVhM012Nmd0MHpSZmhqYi9yYUNxSDk1NHQvcXFOeEh1Q3l4dDBM?=
 =?utf-8?B?bUFRZ1FDeXhwMDRURGpNSWtyRzcwOE5EUFRLRkVFT1lzLzZpUDViN0VHZzZF?=
 =?utf-8?B?a0JDdTFNUlNUNUh3STl0Y3NhVnBQV05aUHhWRThBVHJnbm1qNThnbDVmQnI0?=
 =?utf-8?B?aHJ5amtiNnUxYm8xQk8yZitWTllGOHpSWVo4WUVaWWZKUWJDOEU4SmlMTjJ3?=
 =?utf-8?B?NGlUVjBySGEydmhiK29uZ0ZpUCtyeTRDL1JwLzJHUFYxaTJvWVd1YnFZSllH?=
 =?utf-8?B?azZpWlY3Q0RFMTFmZUJkSVhqMU56ZmR4N3ZUWGNFN2YyblJVNm5zYTE5L29z?=
 =?utf-8?B?cnpIOVllT0g1ekxiQ1hZWnU3UURSSFZLWmowbDJSems3YnZaSlN1alV6eTdE?=
 =?utf-8?B?RjJ5eFVxbEttUGsreXFZM2t5SVhwVUIwd2R6MGwyQWpXOWZwTG9nd0RlNzhj?=
 =?utf-8?B?cmpFRG9GZHRNTmhtcUsxNE0yeG16MVN2VEVMYW9tOTZpQzlvRitEZ3creUhz?=
 =?utf-8?B?ME5HVG1paWFuSkFEd0FtSDlTRVRhY2h0TWhEdmxCWlZ5bm8yQmFFOU9WQ1Jy?=
 =?utf-8?B?MGpETUxVYTFKdU9JMEQ3R24raVJnZnVwMWN6aTlLRDNjTHpRalhEWkhPNzV0?=
 =?utf-8?B?M0YxUXJmU1JWOWRnTE1yVG5xRVRZVHkvSjIwTkFEMmVXRHRMZVpJdmlZMmd2?=
 =?utf-8?B?WXFqWnkxQVpyakJqTktBaTRTYnhOaTgzb1NWRWhMVUVSUTJvL2lSa3VYYSs2?=
 =?utf-8?B?NDBVNyt3ZjZTT1YrSnlxeCthY1p6M05DUlFVY0M0VU5VRm5rK0hpRHJxUlFS?=
 =?utf-8?B?a210TVRncDB1MmJWMGRULzdQR2Rib3FtbXNlamZCMU5JTkFqZnRqUmZ2dlk4?=
 =?utf-8?B?T25JalZaOFB5UCtiZDllbzJlZkpTVU96V3JTellXZTZ1UnQxTEIycWtnRURj?=
 =?utf-8?B?aGZXR1hrY3llY044YXNIUmJIYlI3MnpocG1hZ1JsbUFLWFpSZ09UWGF6UzFS?=
 =?utf-8?B?Q3BCOXR2K0N3NmpJN016UVlISVJmTUN3cTdHZ1RlOXBtVXhrZkk5TUpGZStx?=
 =?utf-8?B?a3QxWnY4a29JZnBxWTYxSnBGdzRld3MwQ3FsMHlBUmlFUTVYSVk4RXNjcUlH?=
 =?utf-8?B?ZHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d44e4c08-d188-4091-5cdb-08dd20f2df60
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 12:36:05.9429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGtnrb7xwEHu3jgaBUAJBrV+XdbNYAp3jUc/LotHNgX8aq+P/9mu54E3GLxA4MeD89IJNQVdQ5ZdubjTwU3x/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10047

The current implementation has the register disabled since it is not
documented in the MAX96724 RM. However, in the chip's user's guide [1],
in the Video Pattern Generator section, the register is documented and
it appears to work just fine. Before the change I was experiencing
approx 10fps when streaming, after: 30.3fps.

Hence, since both max96712 and max96724 have the register, we can remove
the flag.

[1] https://www.analog.com/media/en/technical-documentation/user-guides/max96724fr-user-guide.pdf

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/staging/media/max96712/max96712.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 5228f9ec60859..ed4d5db1ff8d1 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -27,7 +27,6 @@ enum max96712_pattern {
 
 struct max96712_info {
 	unsigned int dpllfreq;
-	bool have_debug_extra;
 };
 
 struct max96712_priv {
@@ -174,9 +173,7 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
 		return;
 	}
 
-	/* Set PCLK to 75MHz if device have DEBUG_EXTRA register. */
-	if (priv->info->have_debug_extra)
-		max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
+	max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
 
 	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
 	max96712_write_bulk_value(priv, 0x1052, 0, 3);
@@ -457,7 +454,6 @@ static void max96712_remove(struct i2c_client *client)
 
 static const struct max96712_info max96712_info_max96712 = {
 	.dpllfreq = 1000,
-	.have_debug_extra = true,
 };
 
 static const struct max96712_info max96712_info_max96724 = {
-- 
2.34.1


