Return-Path: <linux-media+bounces-52904-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPX2NNgzk2lx2gEAu9opvQ
	(envelope-from <linux-media+bounces-52904-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:12:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2070A145391
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D1A3C307ACE1
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE37328B47;
	Mon, 16 Feb 2026 15:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ar4Q0rDT"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011040.outbound.protection.outlook.com [40.107.130.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F4B32860E;
	Mon, 16 Feb 2026 15:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254167; cv=fail; b=aJP1jbSSKxvsT6leVqPpwrDppwn7f1DjW3pMCmz2PfEqKCVdRomdAc/rQ4u0unuQf/7N1iGGeYPxiwf2tIITAiyglzqG4LPnHD42J+sW+VWXQVBywFaEtoosjZ5YKLgO5igGuhpG1AXvmAnfc1NebULMzzGOovB6ShCJmqb1RG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254167; c=relaxed/simple;
	bh=YiArEPWxMYeBElPZEHZaxtA+x6hib9gg+2nJFuplUq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jhvUkDJz42ju8/GbiWUIf6PhmvtynlBhzAdJN/FCNs6rNVQVh6n+fugu0PP/D0+MddNn7A1xNPmfDu2x74MykMgJjs8cHzgH1huTrPeyxZYDeuO/hJO00BlvzQbnbin7up9VlYPBheElaYYDkFsvfEx+EF+7EOBZDbb70bFQKag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ar4Q0rDT; arc=fail smtp.client-ip=40.107.130.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9OpqAScS/nvCHB2+Ay14mHbvaPOCws0leo1AhT2gVu2X2gO/GXa7i1UTnikxZ+HLLhiVoKF+DX17rlbYtvxeFXHMB8hViFG5FnD2Bo36UX1ExEHjFI8AW8RxOD9nMcnZ+vOG+4S+KdkeaDlxoGGVsALomSC9lliRWfLzINP8NVhdaMY/C9Y/g+8qX7j2OpWD6746s5PGWF0/+IIp9O9sotcjmwmubdGeYBL9k8zztRRxq+/I6wiQPi2IRpDkzpOSY/0o/fWXU3ou2UKIb4fmk9U5OM+IA+RbftMU2+po17lSbjE/quVicnjsoBh+yJGvjl19J6JvwcTwMSg9JH6Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmX5oU8/dmKxwsz/rnUDA4IdPqZitxkBszm0hKYibNc=;
 b=yYOuCVzKzeHSxLHXXMOOCQs0okBsoH0vckT59Nt0hNUwn0ZqF6dw6v6nZ5IX8Mz34Tt9bQh6BtGR6uNjXqBgGtD9MQENrSIABXM2d/eYy5I3smrNwKg12+oX9f57eJEBla4dY8l/1WWqG9LEFcKzT9VoeyNfonKr/1QVagaFFyYZwOzp+kJYIqjpHeyKUXs6JpPfXH3FpNbNveovkmnltIHufuxUSlMv0aKedDmJ3tKuUn53d4Dr2qDpvXoPEoSYx8JOkDl++iQbzYPiThwMLBg7dXZiTI8p8Sf6W1I0DT2N5Y0FsVVHLjki7trTA68Y9HZIi7cTvjxK1gGKjh/9tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmX5oU8/dmKxwsz/rnUDA4IdPqZitxkBszm0hKYibNc=;
 b=Ar4Q0rDTPZZLttTHbM9qdTAC0Lxy/87004V+M57wBo/iceDjT2m5PZyEbnlrIFdniMVnRqqN/n6CENhfWn8OUN5WB9PkgCCcq0hqSJt73HNMB2vMSYBDl/SCeYvk+eOUcj8pPadF87+8PwpSyPd+D4sSSUVecdR7cb+NGq//Vf2jzmwuzCrCu+Tou9p6UUIBwPxs77m2C0ptpObKrm62vQ6gzPKTWsZ3pzercOav4W+fdBuunJgVmGTuKMVEsyNJ5d8wHCW1RQjEpTHO1D6MtSDfZPKbHrBhkUvUrXYlmaMlY9MkwRj5dhsQXq6hYkxXpynJ1Da/1MYqPktGc0Atnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:02:41 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 15:02:41 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	chester62515@gmail.com,
	cosmin.stoica@nxp.com,
	adrian.nitu@freescale.com,
	stefan-gabriel.mirea@nxp.com,
	Mihaela.Martinas@freescale.com
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	s32@nxp.com,
	imx@lists.linux.dev,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com,
	jkangas@redhat.com,
	Radu Pirea <radu-nicolae.pirea@nxp.com>,
	Larisa Grigore <larisa.grigore@oss.nxp.com>
Subject: [PATCH 13/13] serial: linflexuart: Avoid stopping DMA during receive operations
Date: Mon, 16 Feb 2026 16:02:05 +0100
Message-ID: <20260216150205.212318-14-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::18) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|DU4PR04MB12026:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4636d3-d615-45d3-fa77-08de6d6c6e86
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1NIMkpXK0F6TmdjN09mTmVoZ29WeVR6SGw4ZW9SZ211MkZsSUFBd2dpeGRC?=
 =?utf-8?B?RXY1bi9MVmhsditvY2d2TjJUTUhhNVZpR2JBZStGdEZMbi9JclVEQnRXS0lN?=
 =?utf-8?B?Njh2bXcyTEcwa21aY3F1RlNTSFhtT3RycWNJMFRRQmpubTRiOW5kZ1l3TWl0?=
 =?utf-8?B?UUJKU29oR01UblJkY3NqZlE5bGJIYVdlM1hBam5ZTEhzRnJNS25seDlQd1c0?=
 =?utf-8?B?ckExZmtDdkV0WDA2U1JwQzY4cFNOdEViOTJ1dFl6T2xLUEhxVU5kZTQzN0FC?=
 =?utf-8?B?ZHFuYUxrWStEaG90VUhlOU4yWFVCVUVwRGhHTTBuOHhoYUxOQUtsZ0VvdzQw?=
 =?utf-8?B?YnFHc3hMWm9OcW5pbzU2SEpQeTJIUnowUEZqS3lqTXVvNkJYNVdVQ09PU3dn?=
 =?utf-8?B?eXdacDNFbEVESXJ6Qit5ZWVSVWRxZXJIbk9SdlA3cEdzNytBSlFXOVpCM3Ns?=
 =?utf-8?B?UkVVTGtOYmxOSk40MFN3K3I2WldMNDlucjl0MVZJREd1TTh1NUVWWGdlNVUw?=
 =?utf-8?B?bktqellOMy96VTNEYXhxdEJCQmJrT085QTNsK1dQTmpMUkd3U2VhRTVUZ05z?=
 =?utf-8?B?My9Idnlab3plUVY2MXhiTHJvQlhQLzNQUU5vdjNoY1hnbm5lcDg0dlk1bGNB?=
 =?utf-8?B?cFgxbVdFMVI4NTJRUXFuZFdjMXROekV6RjZIYzhGdmZGY3YvUGRyNWlmZk9N?=
 =?utf-8?B?Q1pPR1o5SE5LOWV5ejRFcEV4bzB2Tis0dDlQOHY3SHJQMkRIRHluTmdmdGV4?=
 =?utf-8?B?aXVGMzQ1VGN1TlE2R29vY3NDZHg3Z0d3cG1vbnQwbi85T1BXU3MrV1FmQXlv?=
 =?utf-8?B?YmpIUTZyemZWbHBRQWFsdUx3aG1zanNCck9MeXFSUy9UaldjYkg1eUE5M0ZL?=
 =?utf-8?B?M3pqcGxMdTFITWllOTZ6MTVjVEozbEFEVlNTUytHMWZJcVo0UFNvTWtNSUJE?=
 =?utf-8?B?S3paZ2t5TTY0YVdocytLOXBuT0JCQ1NpUitTT29ZcThueTRpTzNyWlFRMHlC?=
 =?utf-8?B?N09hdnl1Y3A3SC9TTTdacTNiOWpKSnEweGcrQWZJZXB3NzdLWWVaMms1a1cw?=
 =?utf-8?B?Q1IwYlh5Ykg5c0hENXhrbTR4c1RXMUg1cFZjbUJVUWYwVlZuVXdHYW5mdFM5?=
 =?utf-8?B?OStLT3hyZC9VbWs5cTJQZmlIWWZpMnZXMkNJUGc1aytSSEcxZml0MFNVTStP?=
 =?utf-8?B?NFlnRlhjamlVVEczaDZNVUNTTFRyMFhJRk5JbFZET1JucGt2ZTFUc0FTRG1E?=
 =?utf-8?B?ckc3WFJGVTVSWnpROGYxZCtrUStKMnhpZzczTEt6UVgvc2tRRGp6VzlSR3hq?=
 =?utf-8?B?bUVRbkRGT2psR21Bc2puZng2dU41d3Q5VW5GSSt5K2ZidUh6czJlQ0cwZXJz?=
 =?utf-8?B?NGV2UzhXbXJxWUswSy9uMFdyOFNxVktlemh3ZDRvem9weWxpQzBnN0hyRVlT?=
 =?utf-8?B?V3VFZXNySnBQZkJ3QmJSeW8rVDVqOTFIczBNS1krbndQaW9RVmdxQlFrSE8x?=
 =?utf-8?B?V3hZa1dMUkI0MllPdHY2Vnd4dlFjREExQkNISGVVMzgzc2llT3ROSmszNTBO?=
 =?utf-8?B?V1hvU011WTd5OEVocnYvdkFxZ0xmNFpJSXdJaEhLQ25YRmFZR3dURlU2RkhI?=
 =?utf-8?B?L011WHdad2g3bUlYTXc0cGdqVTJlR25TVWF5dlh1RHovbzBQUFZyRS9MQ2hh?=
 =?utf-8?B?ck15ZURnV0ZrczlRc2trSFJJbjN6VEpvbjM1eG1ITUI0NWJ1ME1TS3oxaUVu?=
 =?utf-8?B?TG5BOWtlSTBZbk05cGNnRTVBYzA3dzh5RWp3TnVEVDRnS3hRdHNJTFkvL2Rh?=
 =?utf-8?B?Y3JrYWw0M1dtR3BjeXhsV2o2SDVkT1V6RVV3Y043OWhxUW02SThvcU5HeEhW?=
 =?utf-8?B?OEV3b1Y4NjdzTnFiN0gyVE8vVHF0dElIM2l4Ylc4YlRidThCdmpmK1g0Nmxz?=
 =?utf-8?B?NnRDNlhRVE9uc1pxWkN6Qy84VWgvTzFoN05Iek5VaEFnQ200R01abWwyU3Rl?=
 =?utf-8?B?Q0xYUUh5cVB0MnJSbUhqT1B0S0lrUVpOZ1BMdWlsekFhOWc2alIrU0dXQ2NL?=
 =?utf-8?B?TmdneFRPSHc1QnZLVWthMjdtbmkvVkZKTnRvVHRaUkZpYWlzcFdVazhEMGZx?=
 =?utf-8?B?Q3A1NnBEUHgvclBBQmNhWXZCd3V1RWFUcXhLVUhyd1R4eVJHWmp5bURkS3VI?=
 =?utf-8?B?ZEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9224.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWZVa2xrSFM1QUMxZSs0cExkOXZUQUE4T3dEdU10WGgyWWZ0RVRGbGd2OUhv?=
 =?utf-8?B?a3J1TitZUWJGMWF4d09RYzZwSENHWnNVU0UzdHFrRUtDMmVTMHVCWEZrSExv?=
 =?utf-8?B?SnlyNGxZWE9XczZEbUJDdGxCVUMxRE9pM1ZmYlpUMk53VFJWNktLSnRjR0VB?=
 =?utf-8?B?VytVQlpOVmJGRmhXejlwWWJXVCsvc2VvQ0lsZDNQdFppeGM0OGNwZWZRd3dF?=
 =?utf-8?B?WXV0cVpMYlBJcVdqclBIM2pMR2dsVStXc256aHBxMWNiRXNZWVlrbHQ2cWRR?=
 =?utf-8?B?anZpeHZ2NmNLTWpJdVB6SzcrRDNxQ1BVc2ZpS0RrQ1JRek53S2thb3BoSVp1?=
 =?utf-8?B?LzllWTFxcTVucEM5ckJiWFRlM2pnZldRaDV4SW8rSXpPcmN2NWcvamlYVjY2?=
 =?utf-8?B?end1bHYvVHAwZlpybWdPdi82RWYyL29MNDJ1TE5wRGhONnNhUWRxZXhheDlE?=
 =?utf-8?B?VHZSd0R2ZXhsRXozNUZzeXFuQlo1UHlIcTY3WDArM3VydEV5UXErVjk5ZzFO?=
 =?utf-8?B?SjlyUWpoSyt0cDBSRk4yVE1sV2FqNXlCU09WbkRUWGJXcHdGNDRLbU1lM3pX?=
 =?utf-8?B?a1FCM2piZW1ESDdERDZ5a0RYb0t2ekxNb212SmozdTZHUjI5Wnd5UlZaSzJZ?=
 =?utf-8?B?RnV6R3cvVUlMZFdLdjBHMGdBM1pkTDNYeHhib2xFMG1TZkUvcFVmRDhQMUhL?=
 =?utf-8?B?ZEYwOTM4K1cwRFJGdVNoZnNpd0pBQUJVUGIrdC9BaUhFLzAyVURQb3ZWWjUy?=
 =?utf-8?B?eGxtMHpxQ0JkZFViSGY3amtIRGdvRlB5NUMzL2hOVVJvaDhabFJlVDhKcngw?=
 =?utf-8?B?Z1V2ZGtZK0lObjZ2YUljVTVRYy9RTzFHdXk0UkE0S2crV1RtcHo3eE4xMk9t?=
 =?utf-8?B?VG9IaCtkRUM0dEE1aXIrS1ZqZjVMcGo1QWx4dkI3em04Tm05d2ZlRXhHSEk5?=
 =?utf-8?B?ZkVYT0NMcVFMdDdZK0poTHRxbmNSZ1NPWlk2cVNtRkFzVzRyeDRJRmVzRHRE?=
 =?utf-8?B?RVVhNHl6Uk8xVlBlNjArWHh5bmhpRnUwdnNZZFlraW9yT2FZTW1vdzRqeWJ0?=
 =?utf-8?B?Y3FiSDBTMkpvekhObjFFakdtRnhWSlFjRlVDb1d6bXhSOFBmb1NyRkROM281?=
 =?utf-8?B?R1lGc3pNV3NnakxwcjVmelVWK2o1TjJxVWpHbXFUTlZPdUpyK3l1c0xOekFH?=
 =?utf-8?B?dmhqczl0Ky9YY0hORGV2bXJMZEZ6SWdVZUVzWDAySTFjcmFMOTZOU1FiQ09P?=
 =?utf-8?B?akpZRlo2ZnVnYyt1K2RtQUtUS1pKY2xaZkowZXUzUkVCK3ovQmN3S3c5UUZn?=
 =?utf-8?B?RWJTTXBBRkpoVElXK05kWitBLzlSMXdkSFEvMm9IR1MxcUdWY2JnTEc1OGVa?=
 =?utf-8?B?b1FJUXBRYys0L1k5a29Ic1E1QngvYlk5djlyM0NxRTQvZHo0cWpVUDg4bXhx?=
 =?utf-8?B?VEd4dUhRc1hiUnM5dXRLY1RxWklYVXh5Mlh5eGNMOUlCWWVNSFdJenlBamNC?=
 =?utf-8?B?UjRQM1NRMXorMkx2bzBYaU5JMlk2dGNyMndmdmFpTjlrZ2ZGTFhtYS9talBa?=
 =?utf-8?B?TXJ0MGlLSlZMeHdxK2oxNExjYVkwQitXSSs1eFZoZFRuaUQrdXpTT1ppQXZW?=
 =?utf-8?B?b2xUc0RWWnZUcjV0Z0Jhdm5XSFpiNWtnVGVQdW9iTXVkMnhHWHh2Z1krTFhq?=
 =?utf-8?B?ZTU1cHQzeW94QndMMjNkb3hjS0p1UWJWMDIrZjV0ODc4VnRSNk81T1pEVitX?=
 =?utf-8?B?Q1RrbnJGUitsU0xjeGJDTzMxT2JDZlA0Z25rWXBMa2pWc25vTjc5WHl3WStt?=
 =?utf-8?B?UVVqaEZNYmlwVm9xLzdlRzR1c3BOc0NGRVBxOFBtNTFPSXZUdEJhM0IwcGhs?=
 =?utf-8?B?S2FRZjFIRmhoT3NBYm9aTDFtRlRlNTV4RnE5MW9TV2F2SC9obW90UGdWbi9M?=
 =?utf-8?B?bi84Tk9TK3BSUml4YTE0alFGbklyRThVbFJUdWpVKzFiZmQvRmRLbEljUG1Q?=
 =?utf-8?B?ZUJuZlVCQTVsN1BXYlhMTG92Tkxub2dBbW93QXJJRDJSb0xDejlGWHRsRTBh?=
 =?utf-8?B?bW92a1F1Qm1MRWx0RTZ3Q2toREZIY0tTL3l1eHRCdWc0eW1zUStyTit2bVU5?=
 =?utf-8?B?dTE0a1BDZEt2VUdCY2JSUVRrS3d3WDdPMUVzamVzeUl6NFVoZklKZEYxTmJO?=
 =?utf-8?B?UkdUbm9jMXg2VU1oakwxMEdtWjRVcGp4OUIrYmdlOWZrR3Qzc2I3R3hoZFJo?=
 =?utf-8?B?T09CR2hQM1ZXdm9BdTk4NGFrWlJmekVVM1dybmNYTGsrQWpoSm9PekpBcUtt?=
 =?utf-8?B?R3lvaGhkNHJwWFdxd2RTR3hIbndmdnFtM2Y0ZnQ3bnJ2U21xbnhHeCtYMXBE?=
 =?utf-8?Q?7RnBK52+9W6GcMZk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4636d3-d615-45d3-fa77-08de6d6c6e86
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:02:41.3107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SU1V07VkUQKopWg6u0wMheJpClYNbBmpP4Z478RkVeKtnacZ8RrHcjqa955PhLetvjR/qYQJE1cPaBWP38vMyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12026
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52904-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larisa.grigore@oss.nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:email,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 2070A145391
X-Rspamd-Action: no action

From: Radu Pirea <radu-nicolae.pirea@nxp.com>

Replace DMA single transactions with DMA cyclic transactions. Characters
may be lost between two single DMA transactions if the CPU is running at
lower frequencies.

Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
Co-developed-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 drivers/tty/serial/fsl_linflexuart.c | 119 +++++++++++++++------------
 1 file changed, 68 insertions(+), 51 deletions(-)

diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
index dff37c68cff0..4598c7ff669e 100644
--- a/drivers/tty/serial/fsl_linflexuart.c
+++ b/drivers/tty/serial/fsl_linflexuart.c
@@ -6,6 +6,7 @@
  * Copyright 2017-2019, 2021-2022, 2025 NXP
  */
 
+#include <linux/circ_buf.h>
 #include <linux/clk.h>
 #include <linux/console.h>
 #include <linux/dma-mapping.h>
@@ -180,7 +181,7 @@ struct linflex_port {
 	dma_addr_t		dma_rx_buf_bus;
 	dma_cookie_t		dma_tx_cookie;
 	dma_cookie_t		dma_rx_cookie;
-	unsigned char		*dma_rx_buf_virt;
+	struct circ_buf		dma_rx_ring_buf;
 	unsigned int		dma_tx_bytes;
 	int			dma_tx_in_progress;
 	int			dma_rx_in_progress;
@@ -210,28 +211,63 @@ to_linflex_port(struct uart_port *uart)
 	return container_of(uart, struct linflex_port, port);
 }
 
-static void linflex_copy_rx_to_tty(struct linflex_port *lfport,
-				   struct tty_port *tty, int count)
+static void linflex_copy_rx_to_tty(struct linflex_port *lfport)
 {
-	size_t copied;
-
-	lfport->port.icount.rx += count;
+	struct circ_buf *ring_buf = &lfport->dma_rx_ring_buf;
+	struct tty_port *port = &lfport->port.state->port;
+	size_t count, received = 0, copied = 0;
+	struct dma_tx_state state;
+	enum dma_status dmastat;
+	int new_head;
 
-	if (!tty) {
+	if (!port) {
 		dev_err(lfport->port.dev, "No tty port\n");
 		return;
 	}
 
+	dmastat = dmaengine_tx_status(lfport->dma_rx_chan, lfport->dma_rx_cookie, &state);
+	if (dmastat == DMA_ERROR) {
+		dev_err(lfport->port.dev, "Rx DMA transfer failed!\n");
+		return;
+	}
+
+	new_head = FSL_UART_RX_DMA_BUFFER_SIZE - state.residue;
+	if (ring_buf->head == new_head)
+		return;
+
+	ring_buf->head = new_head;
 	dma_sync_single_for_cpu(lfport->port.dev, lfport->dma_rx_buf_bus,
 				FSL_UART_RX_DMA_BUFFER_SIZE, DMA_FROM_DEVICE);
-	copied = tty_insert_flip_string(tty,
-					((unsigned char *)(lfport->dma_rx_buf_virt)),
-					count);
 
-	if (copied != count) {
-		WARN_ON(1);
-		dev_err(lfport->port.dev, "RxData copy to tty layer failed\n");
+	if (ring_buf->head > FSL_UART_RX_DMA_BUFFER_SIZE)
+		dev_err_once(lfport->port.dev,
+			     "Circular buffer head bigger than the buffer size\n");
+
+	if (ring_buf->head < ring_buf->tail) {
+		count = FSL_UART_RX_DMA_BUFFER_SIZE - ring_buf->tail;
+		received += count;
+		copied += tty_insert_flip_string(port, ring_buf->buf + ring_buf->tail, count);
+		ring_buf->tail = 0;
+		lfport->port.icount.rx += count;
 	}
+
+	if (ring_buf->head > ring_buf->tail) {
+		count = ring_buf->head - ring_buf->tail;
+		received += count;
+		copied += tty_insert_flip_string(port, ring_buf->buf + ring_buf->tail, count);
+		if (ring_buf->head >= FSL_UART_RX_DMA_BUFFER_SIZE)
+			ring_buf->head = 0;
+		ring_buf->tail = ring_buf->head;
+		lfport->port.icount.rx += count;
+	}
+
+	if (copied != received)
+		dev_err_once(lfport->port.dev, "RxData copy to tty layer failed\n");
+
+	dma_sync_single_for_device(lfport->port.dev, lfport->dma_rx_buf_bus,
+				   FSL_UART_RX_DMA_BUFFER_SIZE,
+				   DMA_FROM_DEVICE);
+	tty_flip_buffer_push(port);
 }
 
 static void linflex_enable_dma_rx(struct uart_port *port)
@@ -348,8 +384,6 @@ static void _linflex_stop_rx(struct uart_port *port)
 static void linflex_stop_rx(struct uart_port *port)
 {
 	struct linflex_port *lfport = to_linflex_port(port);
-	struct dma_tx_state state;
-	unsigned int count;
 
 	_linflex_stop_rx(port);
 
@@ -357,14 +391,12 @@ static void linflex_stop_rx(struct uart_port *port)
 		return;
 
 	dmaengine_pause(lfport->dma_rx_chan);
-	dmaengine_tx_status(lfport->dma_rx_chan,
-			    lfport->dma_rx_cookie, &state);
+	linflex_copy_rx_to_tty(lfport);
+	lfport->dma_rx_ring_buf.head = 0;
+	lfport->dma_rx_ring_buf.tail = 0;
 	dmaengine_terminate_all(lfport->dma_rx_chan);
-	count = FSL_UART_RX_DMA_BUFFER_SIZE - state.residue;
 
 	lfport->dma_rx_in_progress = 0;
-	linflex_copy_rx_to_tty(lfport, &port->state->port, count);
-	tty_flip_buffer_push(&port->state->port);
 }
 
 static void linflex_put_char(struct uart_port *sport, unsigned char c)
@@ -501,11 +533,12 @@ static int linflex_dma_rx(struct linflex_port *lfport)
 	dma_sync_single_for_device(lfport->port.dev, lfport->dma_rx_buf_bus,
 				   FSL_UART_RX_DMA_BUFFER_SIZE,
 				   DMA_FROM_DEVICE);
-	lfport->dma_rx_desc = dmaengine_prep_slave_single(lfport->dma_rx_chan,
-							  lfport->dma_rx_buf_bus,
-							  FSL_UART_RX_DMA_BUFFER_SIZE,
-							  DMA_DEV_TO_MEM, DMA_PREP_INTERRUPT |
-							  DMA_CTRL_ACK);
+	lfport->dma_rx_desc =
+		dmaengine_prep_dma_cyclic(lfport->dma_rx_chan,
+					  lfport->dma_rx_buf_bus,
+					  FSL_UART_RX_DMA_BUFFER_SIZE,
+					  FSL_UART_RX_DMA_BUFFER_SIZE / 2,
+					  DMA_DEV_TO_MEM, DMA_PREP_INTERRUPT);
 
 	if (!lfport->dma_rx_desc) {
 		dev_err(lfport->port.dev, "Not able to get desc for rx\n");
@@ -525,11 +558,8 @@ static int linflex_dma_rx(struct linflex_port *lfport)
 static void linflex_dma_rx_complete(void *arg)
 {
 	struct linflex_port *lfport = arg;
-	struct tty_port *port = &lfport->port.state->port;
 	unsigned long flags;
 
-	timer_delete_sync(&lfport->timer);
-
 	uart_port_lock_irqsave(&lfport->port, &flags);
 
 	/* stopped before? */
@@ -538,34 +568,17 @@ static void linflex_dma_rx_complete(void *arg)
 		return;
 	}
 
-	lfport->dma_rx_in_progress = 0;
-	linflex_copy_rx_to_tty(lfport, port, FSL_UART_RX_DMA_BUFFER_SIZE);
-	tty_flip_buffer_push(port);
-	linflex_dma_rx(lfport);
+	linflex_copy_rx_to_tty(lfport);
 
 	uart_port_unlock_irqrestore(&lfport->port, flags);
-
 	mod_timer(&lfport->timer, jiffies + lfport->dma_rx_timeout);
 }
 
 static void linflex_timer_func(struct timer_list *t)
 {
 	struct linflex_port *lfport = timer_container_of(lfport, t, timer);
-	unsigned long flags;
-
-	uart_port_lock_irqsave(&lfport->port, &flags);
 
-	/* stopped before? */
-	if (!lfport->dma_rx_in_progress) {
-		uart_port_unlock_irqrestore(&lfport->port, flags);
-		return;
-	}
-
-	linflex_stop_rx(&lfport->port);
-	linflex_dma_rx(lfport);
-
-	uart_port_unlock_irqrestore(&lfport->port, flags);
-	mod_timer(&lfport->timer, jiffies + lfport->dma_rx_timeout);
+	linflex_dma_rx_complete(lfport);
 }
 
 static void _linflex_start_tx(struct uart_port *port)
@@ -827,8 +840,8 @@ static int linflex_dma_rx_request(struct uart_port *port)
 {
 	struct linflex_port *lfport = to_linflex_port(port);
 	struct dma_slave_config dma_rx_sconfig;
-	unsigned char *dma_buf;
 	dma_addr_t dma_bus;
+	char *dma_buf;
 	int ret;
 
 	dma_buf = devm_kmalloc(port->dev, FSL_UART_RX_DMA_BUFFER_SIZE,
@@ -860,7 +873,9 @@ static int linflex_dma_rx_request(struct uart_port *port)
 		return ret;
 	}
 
-	lfport->dma_rx_buf_virt = dma_buf;
+	lfport->dma_rx_ring_buf.buf = dma_buf;
+	lfport->dma_rx_ring_buf.head = 0;
+	lfport->dma_rx_ring_buf.tail = 0;
 	lfport->dma_rx_buf_bus = dma_bus;
 	lfport->dma_rx_in_progress = 0;
 
@@ -883,10 +898,12 @@ static void linflex_dma_rx_free(struct uart_port *port)
 
 	dma_unmap_single(lfport->port.dev, lfport->dma_rx_buf_bus,
 			 FSL_UART_RX_DMA_BUFFER_SIZE, DMA_FROM_DEVICE);
-	devm_kfree(lfport->port.dev, lfport->dma_rx_buf_virt);
+	devm_kfree(lfport->port.dev, lfport->dma_rx_ring_buf.buf);
 
 	lfport->dma_rx_buf_bus = 0;
-	lfport->dma_rx_buf_virt = NULL;
+	lfport->dma_rx_ring_buf.buf = NULL;
+	lfport->dma_rx_ring_buf.head = 0;
+	lfport->dma_rx_ring_buf.tail = 0;
 }
 
 static int linflex_startup(struct uart_port *port)
-- 
2.47.0


