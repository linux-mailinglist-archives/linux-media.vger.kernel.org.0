Return-Path: <linux-media+bounces-41210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD93B3917A
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 04:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 88CA74E030D
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 02:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84EE2459D7;
	Thu, 28 Aug 2025 02:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="hvyI275a"
X-Original-To: linux-media@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012030.outbound.protection.outlook.com [40.107.75.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F081E487;
	Thu, 28 Aug 2025 02:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756346901; cv=fail; b=VtJ3j02Kr1gmmaEbmp73EF7ATNylWq3+EcV+A8DJTHcbERrSJvb4qvtwhwZIV3bCsd5CxeGiDHi8jSRPl4WPeJWme6IbzKre+URXllbo+hS4Ug1UyH+YThmv49LvY7yNimBv4Xu1uKQhOTrS63OluWxEqzuYIJ0qFX6CjjMKeJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756346901; c=relaxed/simple;
	bh=0OXqfQE5um4NNpTYY3SEbmsRl8edwz5Fp77N5PsCU00=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZJRnHvaN7ZdmP4k3+ufRFA0e4ajLkinGuukgSNoUjTt4HAwyx2bkqHbe+MjwhUgzTZvSHfGrS4k3jeWLgor8wd7weslzHqg+uje2AuOcPzKHzFY7HiZjTeEifh+zC/AoVlvVtmP94dKqF4tEaL3HbLRR1QhV2myQ/Nwhllk7j1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=hvyI275a; arc=fail smtp.client-ip=40.107.75.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrDIrCgImSc4RYP0l004pbXm50UXVtZbSZpJRUhDyXBrEGmHNBc0zmSmMsA5ldwDLD8SPGdoGk0Zek3qUFCLjgm+PsgaJU0dnU1rfNEtw5j+KEeV6+6WK0Z9E5U8/6NbKVueo7jvhKNdHHKdCjyeFO4dpoY0hBbmr5BRStGOqoZuhIpI9CSP4Us8Uqx+Z8GqXy/xA28Rdr/Tf2qNDN64ZTZSBDoIw+MPBK5Pivpd9YnCUF+0MQb7cHB39sliAKIw7uwc4DQNJx/yOqEse03xR9tgM57S+iTfg8FBChxX9F3aThskxn492fmFa8w2gWVmQ4vwGep7HVtM1P58asptXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nfYHxLF8fA+DVS7Nk4rvWMOVgcCyOJhYa0B4UCJKTg=;
 b=tamehRHvFebtT4CgODcSW/3zhaJYoDhj5aJ6n5djAOCHzqxLp+sJ+IRC5XxS10KTAQNRFosz6H2Bdz3QZuPb0PfQTDLY4anBK1rk5/QC8ClRJkWnlEJgAas0L1xCxZCzOVVxKjTiXszl2OU7+jcP5iIAvfNuemVKkvzLbmxJMsLpzDOD++Xl2R4yZGybM73KkhmsV2C0V4u2MjOzAKwLOApFHii8BakggnP/sjsyRgnbvMPOxc89rNp2psYfTaRGSTUemz3bbEYp+HN9OGJrwHqiuHgoeH+qIwghK9y1FqFjn6UsQR1QeVV1nmbaYEAu3U05on3lvSZWIPINq/Viwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nfYHxLF8fA+DVS7Nk4rvWMOVgcCyOJhYa0B4UCJKTg=;
 b=hvyI275anGNNepqTS6LGeIDwA9QAcv6mxWCrqRHDI65iEXzkl1cqtJBLF+fp0ITw1Ve1e0p8RnJ6biNmB4DF7QK7DPwHEeD3+xgG/61i+M5Wh6J7Gr4v/hbxsJ/3L2hS6O1e2fIthl1ivqeBgp3MCfAVagggHxkS0hZhV+GmdwBzLL9v2JSB2GBMEUUlvPTwm0AtfpqoSKC4SHtfpRD2PDD93YyHJoeJrkT1yw6jHcc2VpUItenndNjY/tJv5jZvUIyjVpAojnBabJKGj9jG6xonyhR93YfCBSsM5lLqiXW2ppnBXi5O0hafUPzrrAYaIn8mY7AcTDLrYegFftDUSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYZPR06MB5712.apcprd06.prod.outlook.com (2603:1096:400:280::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 02:08:13 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 02:08:12 +0000
Message-ID: <8cf9d7a6-9950-4086-8b81-ddaa68639410@vivo.com>
Date: Thu, 28 Aug 2025 10:08:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] media: i2c: mt9v111: fix incorrect type for ret
Content-Language: en-US
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "open list:MT9V111 APTINA CAMERA SENSOR" <linux-media@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250827123916.504189-1-rongqianfeng@vivo.com>
 <20250827123916.504189-3-rongqianfeng@vivo.com>
 <xbmwlnflzhfhapyt5dinqqsdurxgu5imlqixudopb7z32eteth@cs7hulza54e3>
 <411e9db5-5339-4527-bb3d-473b339a6572@vivo.com>
 <x3wogjf6vgpkisdhg3abzrx7v7zktmdnfmqeih5kosszmagqfs@oh3qxrgzkikf>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <x3wogjf6vgpkisdhg3abzrx7v7zktmdnfmqeih5kosszmagqfs@oh3qxrgzkikf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYWP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::15) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYZPR06MB5712:EE_
X-MS-Office365-Filtering-Correlation-Id: 98653db2-d2eb-4ee7-d437-08dde5d7bda0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHQxU3hHWVdqTDZTemJSMUtXU0xNczBPa2lGVFVVK0QxMHc3cndpaWJFcWdz?=
 =?utf-8?B?WnVEcVk1RTdSMmlBdHIvd3hjY2hPemtQWE1rdTg3Z2ZndnJFbDgyQmVTNmo2?=
 =?utf-8?B?NE9VSkJYUm9xbnJ1MEM0MVZ4VmZESG5od3E2VG9LSkR5VXVDbmt0emZRaG94?=
 =?utf-8?B?cVBMd0hlU0sraTNPNHBBeHJBNi9OSE5PbnVIR3kwUzlFbkY0NjJWcjlVV1Y5?=
 =?utf-8?B?WFE0ZmpzL3dZOHNDNGx4RmY4cHpEY1N0N3dYUVpaQTB5SGdsakI2YkxiOWts?=
 =?utf-8?B?NkxjRDhlOC9PY2kvYzlyWkFnSmRJdjc5MEhWOXRWT1JsRndncWpRYWxoL0c4?=
 =?utf-8?B?b2pDeG5uUHVnbHVMNXZ4QnJlSDlKRVFkRTBtakRVWEhaVHRZUi9uQkphLzNW?=
 =?utf-8?B?VUNzUy9YN3VOOEdLUzdXYWphZWRyazdvd2FoZzVWZ3BqVWV6YitzbVlDMElK?=
 =?utf-8?B?RjhrOTR4cWNRU3MxcXdlaUVoMjd3RkpRdXZXODBmZ083cDlZS2Y1ZWxnRnVQ?=
 =?utf-8?B?WHVmaDJRUUJGQ3RZTmdNc1ZkaWFCRk9KZGNETmJveFcwMit6ckZKT0tjMFhX?=
 =?utf-8?B?azdENjNQVzNKYm4wb2cvZTBMNm5vSFZUZldBZGliOHJNUXZpUE43dDhPb3A1?=
 =?utf-8?B?SnNkMHR0SDZNaFRDbXRCeTA1L1E3NlFEanR1bUdKQ3VKTW1PM3BlVG5XTzlu?=
 =?utf-8?B?QmV6SUFyanRUTTR5bUdnWWxCd24ybFBrVVpQRFJmUVpZSVplakhvTDFxNlJH?=
 =?utf-8?B?eitxNFVMSlRJd01ERG52d2M5L1BmSWFUOGJNaXE4Z21pdnZ3NTAreXYyOXlh?=
 =?utf-8?B?dXFDQit3Qzk2c0pXK09sTG4rQ04zbWorblBsc3hzZXdxSWhZN2J6QlBQTlhX?=
 =?utf-8?B?M0dxUGc4QTYyc2ZuOXJzR1AxbEdVUUFhdHN5ZG5ZK05BUzF1bFBJWWtRYms0?=
 =?utf-8?B?cGZQN2hiSkkxbHFrTkdXYUhWb0xsRFQrdmdiSmliQWU4N2FBSzJQUmR1cGc2?=
 =?utf-8?B?Y200akxLY2NtelEwTlR6b1BGSWYxTjBsNEtYRGN6aWYwbDZvUUlWRFhJUFlx?=
 =?utf-8?B?aGRiNTk4VUpObVYwT08rcEZIUllLT1RkV0Z3Q0ZOV0ErTnJmZ000eFdBMjA4?=
 =?utf-8?B?Nmw5bzNGR2dVV2pqNldtd0xIZjJ0dFB3R3FNdEN5SXFlZld5dXAvdXBjcUdK?=
 =?utf-8?B?TForb3g3M09rZjhHYXViZFZ4eUF5bG5TN2hJMWJmamNzZTZ2QmxNK254WXcx?=
 =?utf-8?B?Q0k5TUxjbTU4UHZQSWNrVVByK3V0WXduYi9Ed1dtYWpjRWl4QVYrMzFsK0la?=
 =?utf-8?B?MTB1eFllbFNOczNYZGwxbDZ0WmlWK1BLZ1hqMXF1MGJocGdydGp0R1AydTVD?=
 =?utf-8?B?Nk56UUJNWndveThzbVlzYUsrMzh5UUhhcFhEa041T3ovb2ozR0lpNkd1dElI?=
 =?utf-8?B?c0cxRlgxcGYxME0zM0RYamhtU3ZoQ3FCeHZtM1NQbHp6cy9lbVZDNUdzMEVM?=
 =?utf-8?B?bHpxTkFPcFpKNUhoUjNoY1JXczY0RHgvVDQ4N0UxdFg4UFMwSmdBUS9MSTNz?=
 =?utf-8?B?cGowRDhrQjhDaFN0ZUJySE8rVC9SeUJxRnJhWDRPMTZFeEt1K25qNnhNamkr?=
 =?utf-8?B?Y3J2YU9oT2tRU2F2RTFTSnk2cXpLU3pXV0JBaVg2L2V0eHBmR3FZYTdKcldD?=
 =?utf-8?B?SVZXVVR0MEtIZEdaRDIzZzhEZ3VjRVgwa3pKbFJRREErdGRqSlhLNG1GWC9K?=
 =?utf-8?B?Vzc4YjRSZjlNcXNRbUZBSDUzc0lNNWRIYkhjRHo4Tm90cVZNWmRNdVdrek0z?=
 =?utf-8?B?NS9PSE5OQ3piY1o5dEcyZUFpRktFOVU0M3dXQVJvNGticjZQaFpiOTQwREx0?=
 =?utf-8?B?T01WWnQ4YThrZHBhLytCZkdTNVpzcFUxdnh3SEpMUmlzYkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVdvcmVEczFVbGhWZGFDY2pGS1h2WTBDVmNtTDhNUU1Ed3lpcW5RdjRWTFVW?=
 =?utf-8?B?WXFDdW9hNVhEVmdrdWFzMEtWdThrRUVneG9uVFdmYThodlhmTEM5SitnZW9R?=
 =?utf-8?B?NHRXV3k2OFlNMHlhR2VNVWRrVU1rekV0K3pVMnF1WGRNSmpwNERmVVIrUEZE?=
 =?utf-8?B?NGhnZGRTSkg3MWo0LzBhKzdJSFNWcld3bEc4OGozUVl3N2Q2RzkzQXFCSXJT?=
 =?utf-8?B?Q1FBbFRiUkkwMC9Zd3pLcHBWWlo1V3RVWHNmNmQzem9rZ1doUHdUeGFHbXpR?=
 =?utf-8?B?eXkzTGhrREFNTzJpcjc3TUpNd1RaZ1h4WU9jOHZQS2VxeW43TUh5WnRTMzBp?=
 =?utf-8?B?ME15MEFTUGtDZ2lwKzRwVXEyWVBwTnl1Tyt5M0VWYWV6NEZRcitnVTJ6czBn?=
 =?utf-8?B?MlR4VW9UM1UyWEtxcXBBOTRhZks0TDJjbDAxcWY3eWNyZWpzOVBCNkE4WmVk?=
 =?utf-8?B?QXhiblhudTNkREI1ZEFMVEtvb29XNTJTRFZua3I5VnBIQVRGejZ3MXJRVzlH?=
 =?utf-8?B?cis3UitFZE1LS3N0SkorckNEaU1TNUVsbm51clhUNEdQZUJETWxreFlGTWF2?=
 =?utf-8?B?b3NVRG1tbFlQYVhFMDBRM25JdHUwa3dBSitGTWIweFZ0bG1vMnFVQWpjOWhS?=
 =?utf-8?B?S2hqeEVvMG5Tb3RRbUE5akcrNDVEdUJvLy8zQWRGV2U4Nm5nOVhkeEQwa09G?=
 =?utf-8?B?dWtjcHdPVkN2WUlzZ0R4dWJMek5uMmVmVXB1dkZiSjdwQTdxdVhtNENLdFZR?=
 =?utf-8?B?NmMxRFU3bFlGS2NLOE5ienpKc05qbnVLM1grTis3bk5oaExveE1YSkNvZlds?=
 =?utf-8?B?MlBXTWV5eXhLQWRyODIxK0ZjZGNrU05hMnh5NzdLZndIS2ZhQzBGdEdaNVUw?=
 =?utf-8?B?YVFaRXBPQThJN29mSjFiL0VLaWlOdGJ5bEZWTFhKZ3hxVUJxdENLQmJDZ3ll?=
 =?utf-8?B?Vis2Z3ovOGNVRzRTc2E1L3F1R1NqS01CQ0ZQWEhMMTFuUklqZHJFM09SVFhC?=
 =?utf-8?B?WDhLNkFlb2I4bzM3QUh6bVV6YmRjcHZ1Qy9YdTJ2RytocFdTUTZHWk9XTm5I?=
 =?utf-8?B?WEluTy8rODNrazJac216NThVbWl3MTM4cWZzVmVUN012VHk0V1U4Y20xY2U0?=
 =?utf-8?B?VFQ1VEIzOSttYUlyTHNUY3IrSk4rdCtYUXB0VnllMUNhbXRPR1dRUytsTE5R?=
 =?utf-8?B?aDNGVk5RbGlGR2o0Qlc4K1N3TGJGSXJ1dXQyM0RjU21oNytrMzBpdGduRHFQ?=
 =?utf-8?B?ZmVvd0pKUTE5dnJzdHI5TnUwV3JxTGQrS2dhNTk2Ryt4Q2hON2RSWTVFWkdy?=
 =?utf-8?B?UmFlNEtsdmhwdkNRWFZwbFc5SUpnQ0I5TTN0ZzZqbUEyaDl5SllqV2lhdVc3?=
 =?utf-8?B?OFVXbEtDUDJ3TU1HZStLMXFQYW9ERnI2bnhNd3lJZi9YYi92SlI1YzBpdmww?=
 =?utf-8?B?dUhvSUFPOUhmWGpRb0RrTFIvSWlWK3VsRkgwVjM3cXdLMDZpVExkR3A4NXVM?=
 =?utf-8?B?VFo3QWZzWjFIcG0rL014ZHN3OERVczhHcDg5QjRxcDJUSDdRSkI0cWN2RHZF?=
 =?utf-8?B?T21FZnpEZVMvSGNZTGVCY0RhY0pmcENJR1RvRytXYWR3cVhWckh3bVdRVkVZ?=
 =?utf-8?B?VU1lM3lzd3BQOEdIenoxUUdLWHhvcmdod3J6bytDRWdjN0F0Q1NlbXNpcHlu?=
 =?utf-8?B?THhRaXNZQ042TDlBVGY1MlBZMHVUU3FNV2RrdVF2RHhKTnVXK2hUS3ltT3lH?=
 =?utf-8?B?aG1KVHhUMGMvbXRZNzJGTzBXcG96UGZON1FlRFk4V0lBU3V4eG50UGFkVDc4?=
 =?utf-8?B?VGV5MnZHWDgwNGs0TkE5dDR6cHdKdmJKeTJmUXEvZUozY3JneU5UZ0ZOOXVZ?=
 =?utf-8?B?NTJ4WllBaHlvUS9Zd3lYM2dYakxyVnlrK29aTkpsK2lVbkVHdldUcVNaN3Z6?=
 =?utf-8?B?OGk4NmIyTEZ3T3RxWVZYK1pLNUFKb2V5YU93VHVyYysySHlCMVczM0ptOEhD?=
 =?utf-8?B?L1JMOEM1QklkL3NVMm8yNUpuTnQ2eHU1OE93U0JwNHRDcDNkc25sQnpyaUhB?=
 =?utf-8?B?bnBPRVUvRzJZZDViUVRJRjVmRGR0aEtLWnRQYVhVNEtDMXppbUd0M0lVT0xJ?=
 =?utf-8?Q?mRrmvPzTUn57KPao1dOG5Y7wK?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98653db2-d2eb-4ee7-d437-08dde5d7bda0
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 02:08:12.1841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSWFwHBJ139bLvX79g5GF5trkHnYd8dZXSZ0sBtkXbBylGuWUSd2Uanm6AVCO0LVgJxW+ABv9QijDyY2LjO4DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5712


在 2025/8/28 0:24, Jacopo Mondi 写道:
> [You don't often get email from jacopo.mondi@ideasonboard.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi Qianfeng
>
> On Wed, Aug 27, 2025 at 11:41:26PM +0800, Qianfeng Rong wrote:
>> 在 2025/8/27 20:58, Jacopo Mondi 写道:
>>> [You don't often get email from jacopo.mondi@ideasonboard.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> Hi Qianfeng
>>>
>>> On Wed, Aug 27, 2025 at 08:39:10PM +0800, Qianfeng Rong wrote:
>>>> Change "ret" from unsigned int to int type in mt9v111_calc_frame_rate()
>>>> to store negative error codes or zero returned by __mt9v111_hw_reset()
>>>> and other functions.
>>>>
>>>> Storing the negative error codes in unsigned type, doesn't cause an issue
>>>> at runtime but it's ugly as pants.
>>>>
>>>> No effect on runtime.
>>> well, I'm not sure that's true.
>>>
>>> The code goes as
>>>
>>>           ret = __mt9v111_hw_reset(mt9v111);
>>>           if (ret == -EINVAL)
>>>                   ret = __mt9v111_sw_reset(mt9v111);
>>>           if (ret)
>>>                   return ret;
>>>
>>> And if ret is unsigned the condition ret == -EINVAL will never be met.
>>>
>>> I guess this actually fixes a bug, doesn't it ?
>>> You can add:
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: aab7ed1c3927 ("media: i2c: Add driver for Aptina MT9V111")
>>> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>
>>> Thanks
>>>     j
>> I have written a test program on the arm64 platform:
>>
>> unsigned int ret = -ENOMEM;
>>
>> if (ret == -ENOMEM)
>>      pr_info("unsigned int ret(%u) == -ENOMEM\n", ret);
>> else
>>      pr_info("unsigned int ret(%u) != -ENOMEM\n", ret);
>>
>> Output log is: unsigned int ret(4294967284) == -ENOMEM
> Indeed, I was very wrong and ignoring the C integer promotion rules.
>
> If I read right the "6.3.1.8 Usual arithmetic conversions" section of
> the C11 specs I found freely available online (ISO/IEC 9899:201x), in
> particular:
>
> if the operand that has unsigned integer type has rank greater or
> equal to the rank of the type of the other operand, then the operand with
> signed integer type is converted to the type of the operand with unsigned
> integer type.
>
> Indeed the above doesn't introduce any functional change (as the
> 'rank' of an unsigned int is the same as the one of an int [1])
>
> I would anyway consider it at least a "logical" fix, as comparing an
> unsigned int to a negative error code is misleading for the reader at
> the least.
>
> Thanks anyway for testing.
>
> [1] Section "6.3.1.1"
> The rank of any unsigned integer type shall equal the rank of the corresponding
> signed integer type, if any.


Thank you for letting me know about this.  It's a great learning experience
through our discussions-cheers!

Do I still need to submit the v2 version with the following additions?

Cc: stable@vger.kernel.org
Fixes: aab7ed1c3927 ("media: i2c: Add driver for Aptina MT9V111")
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Best regards,
Qianfeng

>

