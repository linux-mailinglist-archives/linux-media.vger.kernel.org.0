Return-Path: <linux-media+bounces-14908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F05E192E4EF
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 12:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7247A1F2287D
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 10:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00E1158A3D;
	Thu, 11 Jul 2024 10:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="cKsxTL4S"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11021118.outbound.protection.outlook.com [52.101.65.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F3D156225;
	Thu, 11 Jul 2024 10:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720694454; cv=fail; b=YJpf3bBJTPeD5LAX4MBAFl7oEZEwzGxAYfrSCX7YxnmOmkmGZf4XIs4Yp2455Igy5olJKV+Aw1vhtIfHEb8/2wDxFD+BMSrxsz1P7p9es7s+MXPH0sW8Gu9M+qun2wuZQnzlgoFCCXNewZyi2zo/URNgQ7U+f9yzNNRvheikjLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720694454; c=relaxed/simple;
	bh=wV/eGO+yXAIhI2dGkgQHRBRo4Uc17eVvg6DVpzJJp4A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uq6GvxORrZ+gVPXDTmTDsRSq4C9C2V7/cT7y4Fd1yKx0Pq0NGKDLB+q4/nsrvX/cQs60m8sxcsK9+VoukPy9OY3Dc/V8dFiXz88JVkH2TipqPU4t+c1gHIsONiNC0yA4BOMMaurbyZDOBbGIzQtgpvO6Pi8cKoML/3llur7Ywhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=cKsxTL4S; arc=fail smtp.client-ip=52.101.65.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eC0tOUAPZ9VFOOOBCnb8DrVLEb6uUpfGbzUb2jaOlYOm9VKd5jyLD3Q98HYgZhso9Xc1CEL9+/wscSB1oWb08W2BHa3sEt2mfwpWaTmUTyGMUVVa7fLPUcCWViKBmAnAk61qLXOauO1+I9PpMxTmb/mPdOhV7JqiV/b1WaLs3yn/GuttmF3yJGBdM/H105S7LMt7Oyy6Fp4dsm/9BGZOTSxQUnPvAX9NN8uUsrhz5og1NEhcjM4FUCpcLnYh94qDJApjx1J34F3Mlb+RRlD9m1cHvm7Z8k8OC5xTPEgNKC0TZzz+ZhCgaKiqnL71VZDqwNGptzxAORhgn5TljqG5fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBZ04eraB/9xDAPPezpjkPUljeHNi9lbTV0AobNXjIw=;
 b=uf0MI30Ra72DWrUcLkd6lfrAWlNxZMurLIjHA5QTC555U8JwmXysxZNFKerdeM7laeMHiOxF4zmGZppXY4lut78rxZrtn1rXxwLdyIa+ciTJzf/0j3mWLX388UctcdTo9/Fve7zWeleHHxy6FY8gTOHB1V2O5fThyhsBf3g2wcPcp4NnLQ62n4p89pz3+bt3V+i9mQNyZle/x1ymJIDsY40Gv1BmGxFRO6aiJP2pt+8tlFwmtgToBH58+kytCfP4Azg8RalnVTbfOfMQF9il6asDa2hPOY0lhUvTE4wwA7LzbeFuwV900Brs5jjenQ8NqgJ7I7nBHvdjkW+bhFHxFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBZ04eraB/9xDAPPezpjkPUljeHNi9lbTV0AobNXjIw=;
 b=cKsxTL4SQcMixq6JtKKmsx8HA+bQiQ3IPAX7kY7zpqsgAhmkoqtSNLB/MudrszQJPjRHw5U1dCA4uUZSF31Tn5qt6+8D8Hl3nMNFLA2+dnJPaD7qX360ovfz+ilR1uYRV5/zmk39x7N44tZRDnlUaYlicer1fR5sbo35Op8v+B4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com (2603:10a6:102:20f::22)
 by AM7PR04MB6824.eurprd04.prod.outlook.com (2603:10a6:20b:10e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 10:40:47 +0000
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8]) by PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8%4]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 10:40:47 +0000
Message-ID: <fcd0db64-6104-47a6-a482-6aa3eec702bc@cherry.de>
Date: Thu, 11 Jul 2024 12:40:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: ov5675: Elongate reset to first transaction
 minimum gap
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Johan Hovold <johan@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240711-linux-next-ov5675-v1-0-69e9b6c62c16@linaro.org>
 <20240711-linux-next-ov5675-v1-2-69e9b6c62c16@linaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240711-linux-next-ov5675-v1-2-69e9b6c62c16@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To PAXPR04MB8912.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8912:EE_|AM7PR04MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf51848-3045-4a09-2330-08dca195ec8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkZzNmM5aVgxdXFYZWZYS1VRei8vT3RJWk0xR0lqVEgwcmN1SFJKUHUwWmJD?=
 =?utf-8?B?cEEvWGhqbjJSSG4wRjJzaWIrR1JJcmdoaWlWNkRoNWhLZzVCSzV6MzVKMzh4?=
 =?utf-8?B?aXNLQ2lPQURERnI3cXpmVHBVR09OdFdqSFNLTFhXU1pSSlV3ZHdOTjIzSnBB?=
 =?utf-8?B?TEVzWHJYY2p6ZTZIYUZ5SXgrNkFUZGpkWkpqdEJGOXVnUVJ5LytMSmRSOGYx?=
 =?utf-8?B?bEFoTFcra3NEY1pDVGxaNUdnVmxFYzNOd2t0UHl4cktoMFRmQklzVE5yMEtF?=
 =?utf-8?B?ejhoc2dCQURxQXFBMUI5MTJOYyswbW0wd0crZGNwanZ3Z3FkcVdnOFhKczIr?=
 =?utf-8?B?N2Y3OU4zd0ZVdzVtTUJ6L1dIQXp0eWdLWTVlb0VQYWRHNEJVa0lzWjQvb2VQ?=
 =?utf-8?B?QWlucm1HWUFzN0drbU5lZjBwQkFxbEpTNnNIZ1J0OGRRd0VSeUFNcHNIV1pa?=
 =?utf-8?B?aEh1dkNuazJ4NDNNVkkranhqS08xZGZDR2d1d2tmUHpQWi9qVS9PSnhrOFBx?=
 =?utf-8?B?dVc4VXZzT25UMUZpRW5Jb2dzOUpNa09lcm1ZN253aXlrYWZxdXVmMm9aRW9Z?=
 =?utf-8?B?eTkvVGRBQUNBN2RVOHBCTFZaL0VkeFhNQS9FY3JoWld5V012dFZBTzcxN2p6?=
 =?utf-8?B?bXd6SnY1SGJxZ0xqZ2tDMFo3Z1hVQmo1MzF2TVd2REtzZXJBbGNhZ0tyUUxF?=
 =?utf-8?B?NDJRWXNQaVQ2UE5CWVdmMWN4eXRFNmRLTVZ2Si9jY1YxeDdHU0Y0aEhpTWJF?=
 =?utf-8?B?NE0vb3piRUpCYlJ6QVF6LzdoSURNZy9IdXdHVFdxVmNHMEw2byt2ZG9kRjFQ?=
 =?utf-8?B?YnNGaGIyWjgwbFN6d2hQYmZ2OW1SdStULzZtcnBUdXlLRkxlK3pxVHE4Tk1t?=
 =?utf-8?B?V1lZVGc1N3gyNk5pSlY1Nk5PSTRRdmRUUmFzY2lGMlpFTUZGYTFVeTFQaHRy?=
 =?utf-8?B?TWpvNU9WcE9VeHNMYnlZYkRNOXdDL21JcVN0K0t3SjlHdWVrMS8zbTVMSlNx?=
 =?utf-8?B?M3JielhpRlZ4emNQK2hmbWhsZy9Hek9kdk9pZ2RxSEhoL0FwanFzeG5nUTRN?=
 =?utf-8?B?NUF1TGltOWxsSE81cm5Rc3RXWVZHRUZFdU9mVU9JRXFPNys1Y0lWc24vVGo0?=
 =?utf-8?B?cjJjU1VFOHF5Zk1BaWxtMUpGOVhKNzg4WlZKbmxWcTVWODlhOHMvSW5GS2ZN?=
 =?utf-8?B?WXkwM3FWMFhuMzRRakhtZGlobCs3UUdCaXpianpWQjZjRHJWTWFwSHlhbzRE?=
 =?utf-8?B?aHJmQXQwb2pobWZwZ2UyQ3owdTdzL3hjOVk4OTRPR080N25hYSs4RjAweFFr?=
 =?utf-8?B?Y3laVzVpdmloWllhVVRwZnpMUzBpV2xnamdheEZzOVk0Tyt4OFBCczFrU043?=
 =?utf-8?B?SGw5UFN1akF0dFdGczE3NVgrUW1SOFhGenFKMDhPOG5UNEROSE13MTRhZFVx?=
 =?utf-8?B?c0F4WmRCd3dWdkFLQzJnd0NwU0cvNVlUdUlCenlpcjBEUENYV1VvV2doVDR0?=
 =?utf-8?B?UU1RcC9TTGk1eCs2NkxFWW82Y0VyZWVJMGpyQVMxcUV1OWVjclhWTDZ1eStt?=
 =?utf-8?B?N253M3dmc0NzY1IxUjdkVWlaOVNia1ZpR0pOUnBocEF2czVCRlhqeHJ3OWly?=
 =?utf-8?B?WnpuYXdyODQzTjdQZ21VWHJxZmxaaVZaZGRGUHQxZEZPUkJHVUN6elZUZzRC?=
 =?utf-8?B?N3FTQng1L0xYcHF5NXgrVklGVjQ3eFJ1QXRCZFRBMGR5ckIxU21PYjVYVTg2?=
 =?utf-8?B?ZnlpRU1TK1dRK3d4RHNiN0hxeVA1aDBSWmRjSkJJRENVNlRXR0RVZThycStm?=
 =?utf-8?B?am52VnJYWXBCdFVYc2NUdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8912.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnU0V2IxNXROQkgyWGw3em9Zb3RidlhDUFRCNmV2SlovK2FpcERMTmFXYitm?=
 =?utf-8?B?blFQTTIyUkRRb09tZUFLcmVaWGREbHlXaFZSWkNzK2laV3c2S0I1b2VmR2NC?=
 =?utf-8?B?ZDhLaGRVNjVEeWR1M1lFa21RU2dHUXRKTW9kdU5Hbm5lMTZxVDhyN2prUDJQ?=
 =?utf-8?B?THFVbTI5bTNUR0FiVXFmTmZLVXVQUGhoQ1JuaTg5OElCN0Jpa0p1U2diR04x?=
 =?utf-8?B?QytnSXJuMDZxN1VDNGtDQnpIdzE5enl2SVlnR1hqQk9NSmhRYWFRbXlwOWRP?=
 =?utf-8?B?SmRGRzMwOStmdEpXdkNwYjMrSjdHcjUyZDNXSnFRMCtCeVFtcGE3ZFJzVTZi?=
 =?utf-8?B?RjRJMGpiZDV0TzViWFRLV2VzclUraXFDSEQ1cTlSWDQ4RWFENnBFM2x4K1hm?=
 =?utf-8?B?dWJ2OFY2RXRhWFB6d1c5bVZZQUxsdlZJNElId2JoRmg4b0hMN2xTdUxWS2x1?=
 =?utf-8?B?MmJ3RFVpNEdxa0UwZ1paZW9TQUdmMUNlb3AyMU8zM1hxRzd6cW9JK0ZhcEhM?=
 =?utf-8?B?Ty9rNVpONk9FM3psU1ViM0JpUnBsbDV3Si9KTklDenBSMk4zQ1dXTFZQWk53?=
 =?utf-8?B?WUwweHpxRTA1UmwzYkxMRnAveWRYa3NhZHBsVlNvbXF6cTF0LzZodU5od2tW?=
 =?utf-8?B?a0lkcGtmRkFacVZ4cXlISnhwcGFxdC9rM1Z6NFprSkFBaUNpVkFubGl6bDdm?=
 =?utf-8?B?ZmdnNVRqRk9tQ2FtK092VVA0VnhyMm1TcEIxcDVzR0ZTMGUxSXlsNVRMdkFC?=
 =?utf-8?B?dm53azVKYlRBM0ZDK1ZvZmN5QjlzRFZqbzk2eGZZT1l0L3J0ZTNNVFg5SUJN?=
 =?utf-8?B?ZWttUlIvSWl0WWtpOFN3UzhOOVZnR2F0U0UySW1kWUEvNUlNdmIyVHI5RW0w?=
 =?utf-8?B?QVprbXJoWmFLOHlpTmhZYXNhZGZiYzhBaWNpMWpOYVVJUVJqK1d3WmdYTito?=
 =?utf-8?B?SWx0bm1PZjVYNGxVU2J0T3ArT2taNW9HSEVWM24yb0ZwUlR2ZkxTWEMzSDUz?=
 =?utf-8?B?ZlhSTWpIRzhWQkhwZ0wySlUyUitIQmxOZHlITXl4WmZReDgvYWhkRWZSN3Rt?=
 =?utf-8?B?MmNRdnFqYXo5NWxjZG8rU0xUdHZoTmVINVBNS3FteERudE5vNVZaZUJVcXRT?=
 =?utf-8?B?TEV1MHA1dGt1bmtiWDhMaGpzZ1dTTVdrL1lkK1NxeVhkRC9pRW9TZEhFbWti?=
 =?utf-8?B?RXROdktkOEpHSlh1UGVjTXNTTFlXZEd0Vk5rL2VUWlIvT3VXOHp6M1MwaDFD?=
 =?utf-8?B?S3NkZ2JGeUdVUUxaZGF2bksxZ3VwQWQzZi8wZ3lXVXgyN1NaamFhd1RTVy9k?=
 =?utf-8?B?QjVwcFlOYkZ2UzJtR3dPSUl1eEdYbTlZUjljWGhiWWlibXlONEdWa0pwWTdm?=
 =?utf-8?B?bHp2WisxSzZtZ2h3SVFqbWRzUUtaODhDeFVsWXlwUE5zcEJPa1BnTGVicFlZ?=
 =?utf-8?B?ZlBSQWxwSnlBT2o4WmhTTkhkOVloMUN2VTNLS09XamRSSFNwcVFhVElHdWJl?=
 =?utf-8?B?VWx4Uy9ZTUV5VzRCS2FhOVVOL08rUWY3VC9qTUVDd1E3QVB3Y3NZUzJkaTAw?=
 =?utf-8?B?QWFNOHBGOXBLNjVsNzlVeURrL1ZXcHdGTnl6cU9kSDVGM0cyWDJLNlUxa1VM?=
 =?utf-8?B?bmtMWTZhZG1FZWpUa0lJbnp4bXhhMFdvTVJUTGk4U0lyTW5pTTNiblU2bTJS?=
 =?utf-8?B?SzNrV1EwdmRWVWFQNzdhc2NzVnZaYjBsa010NGpHQVR2THJyeVY5NGRaMEdq?=
 =?utf-8?B?WG5zUm1MTVhXd1E3cGtuZ3U3THpqZktNWkJNYVBtVk0vemI0aVpZS0lSTjRu?=
 =?utf-8?B?OGo4NUdldUd1WE1BUzk2R3ZacUk5NzJlRnh5TTdtRnBxZnI2UmlNOWdTWnA1?=
 =?utf-8?B?UGhUa1NLa3dEdnNCVDZsZmoxZDlsSkowaW4wTUszS3J5UStvTEN3UzZiQkMx?=
 =?utf-8?B?NkJkZnlCT0JWWlVWenBkK0ZPOU41YXJRWkRUVHphWmJTYkxqRkx6QW52RERw?=
 =?utf-8?B?QmdjbGJ3ai9wOXp0c29qbWhTaHk4QWlZZ3VFK1d6c1U2SjdvQ05TTm11ZS93?=
 =?utf-8?B?S1RlR3MwZXpQUmJEdmtSVG1QZEVCS0J1NDlEa1R0WVgrK0VWYVMwLzdOazVT?=
 =?utf-8?B?Y1Z2VUhJTzlWdWZGRzF3Z2l1TmxwVVJoSWhORzhubjRNZXV0OEtmL0ZBSGV5?=
 =?utf-8?B?emc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf51848-3045-4a09-2330-08dca195ec8a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8912.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 10:40:47.1734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yJ0vCfWY2jIHpb4nKTfN7lSi8sYATnT/57KJ+6noLW7uJG+mixxGkAQnYyWLhE9xYC21LPfPLFnhea8hBIyYfUAPJz+jx7wtrErI3g2ZVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6824

Hi Bryan,

On 7/11/24 12:20 PM, Bryan O'Donoghue wrote:
> The ov5675 specification says that the gap between XSHUTDN deassert and the
> first I2C transaction should be a minimum of 8192 XVCLK cycles.
> 
> Right now we use a usleep_rage() that gives a sleep time of between about
> 430 and 860 microseconds.
> 
> On the Lenovo X13s we have observed that in about 1/20 cases the current
> timing is too tight and we start transacting before the ov5675's reset
> cycle completes, leading to I2C bus transaction failures.
> 
> The reset racing is sometimes triggered at initial chip probe but, more
> usually on a subsequent power-off/power-on cycle e.g.
> 
> [   71.451662] ov5675 24-0010: failed to write reg 0x0103. error = -5
> [   71.451686] ov5675 24-0010: failed to set plls
> 
> The current quiescence period we have is too tight, doubling the minimum
> appears to fix the issue observed on X13s.
> 
> Fixes: 49d9ad719e89 ("media: ov5675: add device-tree support and support runtime PM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/i2c/ov5675.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index 92bd35133a5d..0498f8f3064d 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -1018,8 +1018,13 @@ static int ov5675_power_on(struct device *dev)
>   
>   	gpiod_set_value_cansleep(ov5675->reset_gpio, 0);
>   
> -	/* 8192 xvclk cycles prior to the first SCCB transation */
> -	usleep_range(delay_us, delay_us * 2);
> +	/* The spec calls for a minimum delay of 8192 XVCLK cycles prior to
> +	 * transacting on the I2C bus, which translates to about 430
> +	 * microseconds at 19.2 MHz.
> +	 * Testing shows the range 8192 - 16384 cycles to be unreliable.
> +	 * Grant a more liberal 2x -3x clock cycle grace time.
> +	 */
> +	usleep_range(delay_us * 2, delay_us * 3);
>   

Would it make sense to have power_off have the same logic? We do a 
usleep_range of those same values currently, so keeping them in sync 
seems to make sense to me.

Also, I'm wondering if it isn't an issue with the gpio not being high 
right after gpoiod_set_value_cansleep() returns, i.e. the time it 
actually takes for the HW to reach the IO level that means "high" for 
the camera. And that this increased sleep is just a way to mitigate that?

With this patch we essentially postpone the power_on by another 430ms 
making it almost a full second before we can start using the camera. 
That's quite a lot I think? We don't have a usecase right now that 
requires this to be blazing fast (and we anyway would need at the very 
least 430ms), so take this remark as what it is, a remark.

The change looks fine to me even though it feels like a band-aid patch.

Cheers,
Quentin

