Return-Path: <linux-media+bounces-52918-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NzmCoU6k2mV2gEAu9opvQ
	(envelope-from <linux-media+bounces-52918-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:40:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF01145B65
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AA9D306C507
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C94331239;
	Mon, 16 Feb 2026 15:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A5NZ/sf4"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013005.outbound.protection.outlook.com [52.101.83.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4293331230
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 15:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771256156; cv=fail; b=JLa3SzLBRAViMefJIXHTkXmP6A0wFz2kIHNPjV6U9u/elIv45GPMMAeeXIFlOUfqqK/aGaL5uUSC7mc0goonVk8TWdOgO+atSVSmLwS0pBfF3rJz2gL7gQCWeKpvn8TH+5QhI1SCCNsvPl4+ofx1Yu+hStJmtWREuctIYm4LWq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771256156; c=relaxed/simple;
	bh=OE2LZGHTLSZuI2Y/HGiJWFA0Idtr49NSdX6TlTP7ihA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OQHP7kyxTnUCpEX+NplXBltxqXTEsZN363TfJI+S3NoH32dCYxVfZKtTTDVhprTIukhbI2ezXi4bO3kW8PkBPGoGiN9vmmcuzcZQceN8j4R3P6n7dtJIE+qGqFsrYvGIfTn3FdyVl5X9upDYJIX5Azbl9yqdHyytLAZAOOgRoL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A5NZ/sf4; arc=fail smtp.client-ip=52.101.83.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeybpN01HpS7VLv9sQ7U5GclaHhhhsh5BmbzIJaGBWF/f4camV6iRERAzyJojCrwXbscUtaUcw+HwxITe10kv1LAXhW/hsz2XxJcNVIzODld8ozVUDe8zr6nUaP7LSZYhCn9yQfJ6xIMJyzFeWBAskj9C84eesEdSji11vbvBknPpdr08wqGpLdfw+zGqszIUGKc9hwa+aACLYsQv3jSK/P++uUT67nwXqgaCPFnBNeW0M9ce9eIEYGdPgt1IK4U7/Z+ca5p4g9OHiWg83+RasLXJxTzx7i3GawHczP+emtoyDZpJS+U9EMoystipVhA3bakIZm9qmCIEKi2j4jryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdWSRAwdgyDX+c1SbUvJqe4eaT4CH27jSZwFAZmvtqw=;
 b=skjKQNWRWz24Urndo/cCY66oQEeOHYoLEtJ4DwTr61R0OkZpTFSmOOiPyheluvYjpeDUT14wvYuse+TDPJB38oXs4kqUroZHYGokGm+NSuoUtdDTbNI0CQoKTl57zmjmwUAGgCDMAztcbaz6+aERz/atFmXjEnTyF1XHGJoFC52tnZXNbYCh8tKOdRkBt+iG33M/ktPseisxejOVi59L83cQ34mRZOQxxPLugYjoc9/I2SinrgpThEI7RmVmCsFNCiEqEEZBoyPa/k3N5uNZ+ZlrUrL22mrpujAyZMLdY2i2eQC2hSmP4AVnFTFrlWry3oqzscydieQVa7R2ZyjrYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdWSRAwdgyDX+c1SbUvJqe4eaT4CH27jSZwFAZmvtqw=;
 b=A5NZ/sf4A8bj+pIW7oro4qQHojgKYkifUCm6W0PnH1hGtJ7fC6eyGipVHJga4F99+g0icutLWmh5ie96hQqw6IodfOpMFCmyWHqUPNI3ZvlTD9BRaC/z0PLmGxNacOPYJ9edJau0wjg5VToZ0EcANBeoGsBHuN4M59/IwvcgFSPnSTSwPwadjF/se/uT1/DEwJvcHV/Z7Cb/JXKv6gT+1Q+wl0tYh8Lx2v7EK7WMUWP/EbhTHT0Co/9ZzDMx3VcNo8Yb9RFZJiKGVbJR04uAuxHZkj6aI56wLErDakcGgkr5nCXeeG2nTgYVsAHgpmHT0XMs3TZeL/gjU5s51ZM+NA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AM7PR04MB7109.eurprd04.prod.outlook.com (2603:10a6:20b:117::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Mon, 16 Feb
 2026 15:35:51 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%4]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 15:35:51 +0000
Message-ID: <c04032ab-bcc6-4644-9d00-debc124eff0f@nxp.com>
Date: Mon, 16 Feb 2026 17:40:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] media: v4l2-subdev: Add struct
 v4l2_subdev_client_info pointer to pad ops
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-12-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20260211090920.1851141-12-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P192CA0019.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::24) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AM7PR04MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 68892803-9431-4f04-73fd-08de6d7110c0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|52116014|366016|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UTV0OEh5UmlvbjRDcThlSFMzdm12OThrdnFJWnJENmJZcUlCdlZhY3QrS3hm?=
 =?utf-8?B?aE5kaTA5U3JjaER2VGFUdU5XMm1UTURPWGpjUnNsSnl6dEc4RnFsQTVFMEp3?=
 =?utf-8?B?RGNvQko0amlsMlQxK0JuYnNhcFdDN2x3ZXNZeExGWVAzUStZSVFaRHRHVnMw?=
 =?utf-8?B?RytwYnhid3FVZDNGeVR3OFFNejZYemE5UlNOUVJITU1RRlNCT3pGc1I4b3BV?=
 =?utf-8?B?ZlV6MGYvZWZ2bmErTnNDZ0ZJMmlvR1VJREVaNVB6d2hIR0Uwa2NvRXo3d3hU?=
 =?utf-8?B?eURCVTFUTTdoOFVJT3JYMG1rdzZ4Y0F2cG1Qd3FtaTFKWTB3YnM2SlNZbjBW?=
 =?utf-8?B?YUJmZlFidlJneUF5N2dDeUlzMUs5SklkbHlEMHpkZjR4R1Fpc0hsM01ackZY?=
 =?utf-8?B?MHVsOXU3WkYxWkVmU3JHc0FpOVFNUjNtWFV2L01SdUREVkNXQUVYSEs4UU12?=
 =?utf-8?B?QUpQcDhteVNCNGZMQXY4cXArVERaZHZiK0tvOHIvL3hyV0RiY0FFRmRvRlVR?=
 =?utf-8?B?WnZXMUV1MlovS2xCODNWK0JDZDE1ajRIL3hjaTk3V25uc00rUUxlN24rZDBU?=
 =?utf-8?B?WS8weDBwSTNjWGJsRzZoQWJNS2xwdEx0T3B2YTdmWGpxQm1ZeU1XWGsxSThy?=
 =?utf-8?B?UFgvY1FtcmhFZmh6RWpsKzk2RE1lV3Q5WkZIb3BlanF5ZEhRbGkzU09pT3d4?=
 =?utf-8?B?d1EveUhVOExWdGJya084V0tIN3JtYVZtVnVSNkNmcVVVVWVUWnQwL1NNTDY0?=
 =?utf-8?B?U01ScGU2bmRaNjh4TnF5a05vT3hrZmdxV1lZMXNFSm14WnFwVCtFUitiSDdo?=
 =?utf-8?B?TzNnU2hsUTNPL3kybFA1d3dLUXRwZHVWaTgyS1BzeXNlR2UwOE4zQnZyZFR0?=
 =?utf-8?B?Q1dWNHMrT3J4T1dRZHlsUnJQdDgwYVFoQkdiQ1RhNnl1ZlByVm5XaTFNbWhl?=
 =?utf-8?B?LzgvYzRRVUYxc0orbkdUWUpSUUVveGFHWkRVbytoMWJzTXE0ajJHZXFKSUlS?=
 =?utf-8?B?azYzcEh0V0tyU3NzYldTRWRsbW5qVGFaTW5WOTMvMUZONVJLUHMvWERqN0lY?=
 =?utf-8?B?Y3dtdjF2V3c2eXdOQThsbm5Rb0Y0ZFIycWJRZVNBc1diRFJZbEtxaEZCZXdU?=
 =?utf-8?B?WVoxNVljRlM3cENkbGVLNDZuRE94UlRQSGtFNUZubFhyUkZNZzBROVN1M1ZJ?=
 =?utf-8?B?R3FMNlZSdjRvVEhXTmdVSWVaWE5zQUtsdEdhdUh2eU9NbGhGZEFnQUJHb0xV?=
 =?utf-8?B?MTNTcHB1eE1FOUhNY1ZWdnZad3YxTWtRcVV2VTUzeUkrR3NCY2RCNlNrdUF3?=
 =?utf-8?B?Q3VHRU0weWRFbU5TOFNTaVRDMXJIYk9rbXM4RWhoMUtzcENpL1pCZlpNZTRZ?=
 =?utf-8?B?UE9ZcGNOWWhmKzJUdThMbGc2VGNLWnM5cURlT1FPVlNxUk1MbW53emFJSlNi?=
 =?utf-8?B?NkJpMkE3WGhVU0hHY2JySXhScDdtUHRJQW9vZElJN1BBbndPUDhtOExydmhi?=
 =?utf-8?B?SmpyZjY2UGFlZjcyMDA2RGN3VExSWGhacEhnSml4citNaGZpOWs1VCtkSEdL?=
 =?utf-8?B?QW1mK0dHZlpmTkdwMTVtREtsR0tGVC9Ecm83alR3MlRQRlJDVFJHRDYweFh6?=
 =?utf-8?B?QllPWHVxZWVlNVJUQ0pyVGtnUWNTdGN5bmtJV3E2cGVCZ0JkeHAvZ1BEQW16?=
 =?utf-8?B?M3dETjgxNlFMZU84dFFnOUkwYitSWjVlc1BEZWcxZitUZTc5cGUyTmhWdWxs?=
 =?utf-8?B?Qk1JMlVVUmVuSkdmbUhXS2FkZkVYMEhTaHFPTmZqUnJ2aEdkd1o4dm5wZGFz?=
 =?utf-8?B?QnZjV0NhcEVudDVaQVhxOXlyWkxqRlRhcTd4WExlR1BIeFl2djNacjdUYnhR?=
 =?utf-8?B?OE5DY2FsN2lsY2M2WWVJQnM3bFdIRzJLU0o2TEhMaUZxTDh6cGUzTHV3U1Mx?=
 =?utf-8?B?Uk9GSnlNOGNsbGQ5UmNtWHJCNHhxcGExTHp5Z1VxNjFjMjV5RXBrVkN4UDJl?=
 =?utf-8?B?NFM4cnh2UUZZaXdCUWk3b2JrQUd3ZUdITEtqU2JkOVl6RHZVdk14ZmJtRnow?=
 =?utf-8?B?TkpEa2hoOUd6WDhrNGxDbElUSWJObjIrbHozM2NvMGhMcUV4YjE0REZMdU0y?=
 =?utf-8?B?OElUTHRobHRiOTJpYUhGRHoySnlsak45cEtTUSswQWY0a1laTkZUVGMxazlG?=
 =?utf-8?Q?oJfd3+nPyUhSEMG9vR6kZDw=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(366016)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QUhveUcvRFpVS0tzZklUT1lhQUE4azBEZDNGNDVjWmxaTk9QZkhTSDNoZTRt?=
 =?utf-8?B?KzVYNXNjeG5JTW9pWmM2SGpqcVltaEIyN1FOOVlVUC9aangrK2wzeWZIWjVk?=
 =?utf-8?B?TCt2bjlIazkxRFRIYitpUTlOMjI0REtDamNRZGoremRrbUNaaG55Y3N0NEFW?=
 =?utf-8?B?bnhvaEh0WHlrSG00UkVCZnZsdjFLRElkSjkwNXRkU01uR2E1OFcyV1dBMCsr?=
 =?utf-8?B?ckZZNXByS2czVjZycytOVUhLeXVicWtYVVRXTVR2SnRDY0ZOaGZnTmlmSTdq?=
 =?utf-8?B?QUJPMlNwUG53ZDZqQTFGZmI4YkQ0eWdPM2p3MTVhTzJkTWlaYi94bnU3dVNE?=
 =?utf-8?B?ZTFrYmtDWHN4dkxCTEdzaDV1cm5telZoc2JDTjdJOFNLNUl6TytZcGNQZVVt?=
 =?utf-8?B?bFhLeHgxZFNKaW5jZHNVejgyZC9OREFYUENKdmVRQTBmWENOaXd6bEFwcEtV?=
 =?utf-8?B?M2w3SXRSQlhLcHBOVnZBSzRPMW1OODVxNzVZdnQvNGQ1dVd3cEJjZzBFNmNL?=
 =?utf-8?B?dmJueUh0bStzSWxBcDk2RHZIeXRhUmFmeTJaeVFQcEZzRXFqcE1xRHZJMStG?=
 =?utf-8?B?TWxWMXFWdUpLbTdTUk9XcHlROFdHQVhFRWNGTkVqTVplZnJJVmx4VzlLaFBP?=
 =?utf-8?B?OXZZU3dTQk5ZWXB2TzNtSDM4Q2ZZd3JJdVdGbWpFVG5YVTAzWGNsWHh5bmJ5?=
 =?utf-8?B?Q3BRc0NXWHBPOWduYlNlOU1sWkhrM01qN2svRi81eVRLRytmRkw0Wjk1NkRi?=
 =?utf-8?B?bGNxajRNNG9FSVpqNVY2ckh3M3JLa0I2TGkrc043eEIySGxvSjcyd0hwR2I2?=
 =?utf-8?B?YmZtbTI1TUZiRFZhMzB4THNZNjc2VHIyOGtHVC9FK2FtL0U0VHNObmNjWWNC?=
 =?utf-8?B?Nkd3aXJUZ0pRNXU4bTJXams1S0RqYXRYZjI1LzNwZFIxMnpiOE8zOGdodW9Y?=
 =?utf-8?B?TEFPWFpGcmYxWEI1TC9SeXNhaFFZYzV1V21XZ2J6UVB6WFVPUlZNdERSdXd0?=
 =?utf-8?B?SWFVOFA5bXN3SWtIU3hNMm1RQW1CZnB3ZWFDL0g3R3RIanY5WlplSEt6U3Vu?=
 =?utf-8?B?SEM1c2R3NVNwWkh5Uzl1eFIvMVk5WjVMT1I3KzFPVXpKdGRSNDJNUnlXOWUw?=
 =?utf-8?B?UVh0M1lhU0ZSalB3ZTlIVTUydi9sTVpNOUFKWTIzS2MyRnNwaTRtTFlIUG9L?=
 =?utf-8?B?VHhuZkhwOFcyMUszeGtVY2poV2VFVmtBVTNGWHJPamVvSFJEZkxteWNsMGFj?=
 =?utf-8?B?Qnd4d0dLNHVQQWFMazB3RXB0UXgvb1h5Y20zVWJCOWtBVGtTakxHTFpybzlQ?=
 =?utf-8?B?OHdNOWVCOUtMdW9jdWZJbEtTVEh2cEhUQlU0TTRFY3pWRGFFcEFwTkhialh2?=
 =?utf-8?B?Q3VxR2wya1VyejBiZ2JSb3QyOFFLNVluSGxOODhNb082VTdRWStuR3ozTGxO?=
 =?utf-8?B?akxPVURXa3h0VExvaVNlblgvVWEzclhib0xlM0pMS3pVWWRObisxUnZacm9W?=
 =?utf-8?B?TzZsQzBjaE5EOUtJQXhWajJ6WHZKUVVORU1Ma1ViRVdpc2RwQWRnd3ZBZjhT?=
 =?utf-8?B?Yzdtc0F6QmMwZjhLS2VrLzkwSURuSzNnZVIyRndvSFJwTVdsb3VKdmljVWc4?=
 =?utf-8?B?QndoVjJ2ZUpiclJNNFFuc1hBUWZ2RFo3N3Iya0wzcStFWUdqWHV6Rkp5VEQ3?=
 =?utf-8?B?ZSt2SjZ3bDliUkhrUW5WY0I1QUFEdGM3UVNuRXowYUZnbHNTOUNPeUh6SVlS?=
 =?utf-8?B?UlZvTFNVMVVCYkZBWmR6WXh6QW9KRDJaMGlsaDNoaE9mQXlQYklpZmVabThD?=
 =?utf-8?B?cldQcHdYUVB3ZXQ3NzdBd3NLd0V3VkdBU0p5WkFMVDNNaFcyUHI2MTEzM1B3?=
 =?utf-8?B?bTFubXFveGdRdDFLeEJyVGpqV3JLOXpQWTA2ckcrWSs1NjgreGFiNFVzeUJm?=
 =?utf-8?B?MlFMOTBOcDJUT2xZVWRSQnlMalZJcFlZU1VDNnBQbjRzWHNwYW1NMzdmVlBS?=
 =?utf-8?B?NlQxTER4bE8xL0taRFZoeWlXeDVqN0VLM2xuRHY1UGFhcFBHWjdmRHpOK0Mx?=
 =?utf-8?B?L1AzdWhObFJBcTMzRmU3L3pUU0Jnd3dncERtc1dEbHIwTkJHZ3lZYk4renVz?=
 =?utf-8?B?UHZTbnR4eVFucFIwanFwWlhNZkJIcHpQK3AwNGMvZzR1eXd2RjVrUnp5a08y?=
 =?utf-8?B?SnYxUUowWXdKSE5rR3UwRVNXd3VVQXJOeHI3RXdaMjQxM2pHZnFwQ3RDSTBj?=
 =?utf-8?B?Z0poMDhINVU2blJaNytOZTFKMVR3a3pmQ3lHVXFuUG5URGh6M3pCQnlXSytU?=
 =?utf-8?B?Q2dQTjdpeklrMmxXZWFnR0pxWmRTa1AzUnp2cUVPN0lWRlZWSElGQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68892803-9431-4f04-73fd-08de6d7110c0
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:35:51.4923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjHlh+Chf1hSh7ViGifjuFCZ7QT213xYQIjb6cKXBdhXduDaYfq0A4dfpGyU7VN1G2/aZs7PJqhmEecn63vunA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52918-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirela.rabulea@nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,sel.stream:url,sel.target:url]
X-Rspamd-Queue-Id: 7CF01145B65
X-Rspamd-Action: no action

Hi Sakari,

I get build errors after applying this patch, like:

drivers/media/i2c/imx219.c:1004:20: error: initialization of ‘int 
(*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct 
v4l2_subdev_state *, struct v4l2_subdev_format *)’ from incompatible 
pointer type ‘int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, 
struct v4l2_subdev_format *)’ [-Wincompatible-pointer-types]
  1004 |         .set_fmt = imx219_set_pad_format,

I'm not sure if it is fixed later, but after I apply all 14 patches, I 
still get some build errors (I'm building for ARM64).

See also one other issue below.

On 2/11/26 11:09, Sakari Ailus wrote:
> Add a pointer to const struct v4l2_subdev_client_info to the get_fmt,
> set_fmt, get_selection and set_selection sub-device pad ops. The client
> info struct will soon be used to differentiate UAPI based on client
> capabilities.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/media/v4l2-core/v4l2-subdev.c | 63 ++++++++++++++++++---------
>   include/media/v4l2-subdev.h           |  9 +++-
>   2 files changed, 51 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 79fb4643182a..76ab70a99e86 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -245,19 +245,21 @@ static inline int check_format(struct v4l2_subdev *sd,
>   }
>
>   static int call_get_fmt(struct v4l2_subdev *sd,
> +                       const struct v4l2_subdev_client_info *ci,
>                          struct v4l2_subdev_state *state,
>                          struct v4l2_subdev_format *format)
>   {
>          return check_format(sd, state, format) ? :
> -              sd->ops->pad->get_fmt(sd, state, format);
> +               sd->ops->pad->get_fmt(sd, ci, state, format);
>   }
>
>   static int call_set_fmt(struct v4l2_subdev *sd,
> +                       const struct v4l2_subdev_client_info *ci,
>                          struct v4l2_subdev_state *state,
>                          struct v4l2_subdev_format *format)
>   {
>          return check_format(sd, state, format) ? :
> -              sd->ops->pad->set_fmt(sd, state, format);
> +               sd->ops->pad->set_fmt(sd, ci, state, format);
>   }
>
>   static int call_enum_mbus_code(struct v4l2_subdev *sd,
> @@ -308,19 +310,21 @@ static inline int check_selection(struct v4l2_subdev *sd,
>   }
>
>   static int call_get_selection(struct v4l2_subdev *sd,
> +                             const struct v4l2_subdev_client_info *ci,
>                                struct v4l2_subdev_state *state,
>                                struct v4l2_subdev_selection *sel)
>   {
>          return check_selection(sd, state, sel) ? :
> -              sd->ops->pad->get_selection(sd, state, sel);
> +               sd->ops->pad->get_selection(sd, ci, state, sel);
>   }
>
>   static int call_set_selection(struct v4l2_subdev *sd,
> +                             const struct v4l2_subdev_client_info *ci,
>                                struct v4l2_subdev_state *state,
>                                struct v4l2_subdev_selection *sel)
>   {
>          return check_selection(sd, state, sel) ? :
> -              sd->ops->pad->set_selection(sd, state, sel);
> +               sd->ops->pad->set_selection(sd, ci, state, sel);
>   }
>
>   static inline int check_frame_interval(struct v4l2_subdev *sd,
> @@ -523,6 +527,21 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
>                          v4l2_subdev_unlock_state(state);                   \
>                  return ret;                                                \
>          }
> +#define DEFINE_STATE_WRAPPER_CI(f, arg_type)                               \
> +       static int call_##f##_state(struct v4l2_subdev *sd,                \
> +                                   const struct v4l2_subdev_client_info *ci, \
> +                                   struct v4l2_subdev_state *_state,      \
> +                                   arg_type *arg) \
> +       {                                                                  \
> +               struct v4l2_subdev_state *state = _state;                  \
> +               int ret;                                                   \
> +               if (!_state)                                               \
> +                       state = v4l2_subdev_lock_and_get_active_state(sd); \
> +               ret = call_##f(sd, ci, state, arg);                        \
> +               if (!_state && state)                                      \
> +                       v4l2_subdev_unlock_state(state);                   \
> +               return ret;                                                \
> +       }
>
>   #else /* CONFIG_MEDIA_CONTROLLER */
>
> @@ -536,13 +555,13 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
>
>   #endif /* CONFIG_MEDIA_CONTROLLER */
>
> -DEFINE_STATE_WRAPPER(get_fmt, struct v4l2_subdev_format);
> -DEFINE_STATE_WRAPPER(set_fmt, struct v4l2_subdev_format);
> +DEFINE_STATE_WRAPPER_CI(get_fmt, struct v4l2_subdev_format);

DEFINE_STATE_WRAPPER_CI is not defined when CONFIG_MEDIA_CONTROLLER is 
not defined

Regards,

Mirela

> +DEFINE_STATE_WRAPPER_CI(set_fmt, struct v4l2_subdev_format);
>   DEFINE_STATE_WRAPPER(enum_mbus_code, struct v4l2_subdev_mbus_code_enum);
>   DEFINE_STATE_WRAPPER(enum_frame_size, struct v4l2_subdev_frame_size_enum);
>   DEFINE_STATE_WRAPPER(enum_frame_interval, struct v4l2_subdev_frame_interval_enum);
> -DEFINE_STATE_WRAPPER(get_selection, struct v4l2_subdev_selection);
> -DEFINE_STATE_WRAPPER(set_selection, struct v4l2_subdev_selection);
> +DEFINE_STATE_WRAPPER_CI(get_selection, struct v4l2_subdev_selection);
> +DEFINE_STATE_WRAPPER_CI(set_selection, struct v4l2_subdev_selection);
>
>   static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
>          .get_fmt                = call_get_fmt_state,
> @@ -804,7 +823,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>
>                  memset(format->reserved, 0, sizeof(format->reserved));
>                  memset(format->format.reserved, 0, sizeof(format->format.reserved));
> -               return v4l2_subdev_call(sd, pad, get_fmt, state, format);
> +               return v4l2_subdev_call(sd, pad, get_fmt, &subdev_fh->ci, state,
> +                                       format);
>          }
>
>          case VIDIOC_SUBDEV_S_FMT: {
> @@ -818,7 +838,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>
>                  memset(format->reserved, 0, sizeof(format->reserved));
>                  memset(format->format.reserved, 0, sizeof(format->format.reserved));
> -               return v4l2_subdev_call(sd, pad, set_fmt, state, format);
> +               return v4l2_subdev_call(sd, pad, set_fmt, &subdev_fh->ci, state,
> +                                       format);
>          }
>
>          case VIDIOC_SUBDEV_G_CROP: {
> @@ -835,8 +856,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>                  sel.stream = crop->stream;
>                  sel.target = V4L2_SEL_TGT_CROP;
>
> -               rval = v4l2_subdev_call(
> -                       sd, pad, get_selection, state, &sel);
> +               rval = v4l2_subdev_call(sd, pad, get_selection, &subdev_fh->ci,
> +                                       state, &sel);
>
>                  crop->rect = sel.r;
>
> @@ -861,8 +882,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>                  sel.target = V4L2_SEL_TGT_CROP;
>                  sel.r = crop->rect;
>
> -               rval = v4l2_subdev_call(
> -                       sd, pad, set_selection, state, &sel);
> +               rval = v4l2_subdev_call(sd, pad, set_selection, &subdev_fh->ci,
> +                                       state, &sel);
>
>                  crop->rect = sel.r;
>
> @@ -932,8 +953,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>                          sel->stream = 0;
>
>                  memset(sel->reserved, 0, sizeof(sel->reserved));
> -               return v4l2_subdev_call(
> -                       sd, pad, get_selection, state, sel);
> +               return v4l2_subdev_call(sd, pad, get_selection, &subdev_fh->ci,
> +                                       state, sel);
>          }
>
>          case VIDIOC_SUBDEV_S_SELECTION: {
> @@ -946,8 +967,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>                          sel->stream = 0;
>
>                  memset(sel->reserved, 0, sizeof(sel->reserved));
> -               return v4l2_subdev_call(
> -                       sd, pad, set_selection, state, sel);
> +               return v4l2_subdev_call(sd, pad, set_selection, &subdev_fh->ci,
> +                                       state, sel);
>          }
>
>          case VIDIOC_G_EDID: {
> @@ -1348,7 +1369,7 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
>          else
>                  state = v4l2_subdev_lock_and_get_active_state(sd);
>
> -       ret = v4l2_subdev_call(sd, pad, get_fmt, state, fmt);
> +       ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, state, fmt);
>
>          if (!states_locked && state)
>                  v4l2_subdev_unlock_state(state);
> @@ -1931,7 +1952,9 @@ v4l2_subdev_init_stream_configs(struct v4l2_subdev_stream_configs *stream_config
>          return 0;
>   }
>
> -int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> +int v4l2_subdev_get_fmt(struct v4l2_subdev *sd,
> +                       const struct v4l2_subdev_client_info *ci,
> +                       struct v4l2_subdev_state *state,
>                          struct v4l2_subdev_format *format)
>   {
>          struct v4l2_mbus_framefmt *fmt;
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index c9fe99ea7841..20cf0560c7f9 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -850,15 +850,19 @@ struct v4l2_subdev_pad_ops {
>                                     struct v4l2_subdev_state *state,
>                                     struct v4l2_subdev_frame_interval_enum *fie);
>          int (*get_fmt)(struct v4l2_subdev *sd,
> +                      const struct v4l2_subdev_client_info *ci,
>                         struct v4l2_subdev_state *state,
>                         struct v4l2_subdev_format *format);
>          int (*set_fmt)(struct v4l2_subdev *sd,
> +                      const struct v4l2_subdev_client_info *ci,
>                         struct v4l2_subdev_state *state,
>                         struct v4l2_subdev_format *format);
>          int (*get_selection)(struct v4l2_subdev *sd,
> +                            const struct v4l2_subdev_client_info *ci,
>                               struct v4l2_subdev_state *state,
>                               struct v4l2_subdev_selection *sel);
>          int (*set_selection)(struct v4l2_subdev *sd,
> +                            const struct v4l2_subdev_client_info *ci,
>                               struct v4l2_subdev_state *state,
>                               struct v4l2_subdev_selection *sel);
>          int (*get_frame_interval)(struct v4l2_subdev *sd,
> @@ -1461,6 +1465,7 @@ __v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
>    * @sd: subdevice
>    * @state: subdevice state
>    * @format: pointer to &struct v4l2_subdev_format
> + * @ci: pointer to sub-device client information, including client capabilities
>    *
>    * Fill @format->format field based on the information in the @format struct.
>    *
> @@ -1470,7 +1475,9 @@ __v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
>    *
>    * Returns 0 on success, error value otherwise.
>    */
> -int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> +int v4l2_subdev_get_fmt(struct v4l2_subdev *sd,
> +                       const struct v4l2_subdev_client_info *ci,
> +                       struct v4l2_subdev_state *state,
>                          struct v4l2_subdev_format *format);
>
>   /**
> --
> 2.47.3
>

