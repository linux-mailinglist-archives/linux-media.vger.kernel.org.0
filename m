Return-Path: <linux-media+bounces-52893-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id III3Jhkyk2mI2QEAu9opvQ
	(envelope-from <linux-media+bounces-52893-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:04:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C786145072
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90B8B3047377
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B34314D1A;
	Mon, 16 Feb 2026 15:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HVjUS6Ye"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3544E314D13;
	Mon, 16 Feb 2026 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254139; cv=fail; b=Vd8WlSaT4re+Ie0TPRgXd6iVMnb7fy9Kv14157FcuZNcxmVATdhCfoBImapEjr4DM/ZiFbBabswpSJV33wEPr+p1LTkZZ0YEOLG51a8bpQq2izX+1GZx/NfL7+FHe2/QcXSGdkZbbK80WmmxXSQM5vvqQ6tZTe/XS6jkD982m4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254139; c=relaxed/simple;
	bh=/iP2JKMQnzGKcGPfnD2HyF93wqm343D57WTL+aTWjpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lP2DMfuw4Q6dkPOdRpNlAIVYlLF/AoXcb9Fqugy94ou5XgNRDV2IyC1E9bg4WF05eyRjSl/SXYkTweSig1aSlwMW7RBzpkcP0UEcaJm0lAyh8J/0cOI2xf+UkDFVClG2qaAudbIQW9u2ynBbS680ECrgojBoyvtnjtS3TI/aFgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HVjUS6Ye; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mp3bb28I7VyiS3jvSJee966b0WrNA/wcowNbF4X7hxOB7AIHBVMBRC6Po/wINdyPznDByfQV0/91+Ha04Uwegfu/NWpOgodlgDyL4iQYFxWs2z7XEGgnQwYw5YUIDSCiyeEIx4CZORFs+2xzD3C6g0Xmlzm7Hy2B8+TbO5snsvFm8WbIn0Ubam2UiSmlU8fyC91Ko9y2TrzX50GfB8STvPo08JASwmfTAOwyV6QwTT57KwgKo5pbVhZ7eZaDuGT49VlO7BVeAIKAL1jMbgMWJsLtjoZ0+YrpVb5RKoLA4yC5EmOdSB2M5QkurG/W3/6bki2/OJAAAhzLBqKJDZokdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hs5gy2JQsjMjGgw2DdN/3kZLFcZ2eeD7COIqQPY85E=;
 b=aoW0exkZTkbqSx4LHGL/MOIc2Y5WBYDENlMiz0NLEXw9jJ3CDhMHfeUhrX4wFAgLMd0KsSDHM0TkMDGPyEy1CXGBGS/4vs5vy3kQN44E4xcaaPxfURs3qz8d6A1ID/5rEf8wuwrT0zLwMTfBkmUJ4GZoxix6JIkzfVKKn+14UJa5b3anU7Mbo7xPI4FV33BD5cN35skBCe+9aqoCh9tYXduuvHRI73W1EiRnQ85r/EfVhF7RrTVMyyajk6PlfFlmqsIZfWLoz0ufpbPPB4n0h+CNEMz29naTOb0VMkje6DIcogltNOkyHNWzNEJOT3ZMvI9ze8pAftmEbm+7g1ojIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hs5gy2JQsjMjGgw2DdN/3kZLFcZ2eeD7COIqQPY85E=;
 b=HVjUS6Yeuj4AmM3Mhir+aC/8QFAM3YvD5JHs2r9X0wUnsbbbO5/n74rqXyGhGPz0xQe9Du0vwYG3y5SRcZj2XhY1ajlaFhCyIkbcZXZ8GuKLTDsFm4UpksJHl+1+fhcjrsU8kO1N36sZ8B6uorzuf+KHC+IUtlVJmR3DXN5R7bXqmWT3/quoymvBidYk5txiXshjyLJIpf2W9l8lZGuovPCEwGa7SQTpAKwBjT1kyG5TZgHWIJQ0qp6Fs6K/lp0fW8hdKH/khW2Wej7Ph8JyPGheTR62mnl0rPd24MSfvGZookwrzun571TjRXY1+fzw/U4ByfGnts8cngricBlCWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by MRWPR04MB12380.eurprd04.prod.outlook.com (2603:10a6:501:83::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:02:15 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 15:02:14 +0000
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
	Larisa Grigore <larisa.grigore@oss.nxp.com>
Subject: [PATCH 02/13] serial: linflexuart: Clean SLEEP bit in LINCR1 after suspend
Date: Mon, 16 Feb 2026 16:01:54 +0100
Message-ID: <20260216150205.212318-3-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0012.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::18) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|MRWPR04MB12380:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed77ed1-325a-4d0d-1f3d-08de6d6c5e3b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0xLQ2dORnhFTnJWSmdvbXQrWnZXMTgzeFN0bzNJMTUvNFoxOVBvZ3hzaVFX?=
 =?utf-8?B?RHhDUWpZQ0ZNYUFwTW56QXd1VElmcnBoTFBHdDVpOHdrNDlWYVllUWRXcXgv?=
 =?utf-8?B?UXRpc3pHcERLaEk3Y0xpcFZCMU1OL1h0MUsxRHU1cDY3MXF6VFkwcEx4OWpp?=
 =?utf-8?B?OHJZamM1aU1EZFNiTjg1cURvOFZUa0lEQ3pHUjkrYVlaWC9pQis4NTdSTytB?=
 =?utf-8?B?TnNOUitVcEVFUkMxYy9XRlhRSlg1UUxSZTcxd2ZjVlErWmMxb1lLeE1ieU9m?=
 =?utf-8?B?dFZ0QnZOdDhua2haMjZIODRhSGY1T1dUcFZ6ZFhVWnhHNUZIZWg5aElpYzB0?=
 =?utf-8?B?aXdCdWRrZ2RlZWlOVWJBWHRBaVFmanNhUlJkNWF4NjdobzFMazdOU0NTRU1L?=
 =?utf-8?B?aExlVEEyVTlaZ05OYkZJcmprNENYc3FhbFZVdU13bUYwd05kY3J0SU1SR01j?=
 =?utf-8?B?WERrOS9kMUdNQjVrZzFLQTVCTjlQT3pwV0Y4cXVFZy9zdnlWSFYxUmVaVFRn?=
 =?utf-8?B?M1Bsd056S3VVSVhtZlFzenBkaEphYmhmRlpReDN0Z094czV0U2VWTm95Q2Rk?=
 =?utf-8?B?WS9Wb2VGc1JGbUVxZy9hc1U5UjhiWTFyTGpUSUN2ZGRRQjV2NktBenk3YUZs?=
 =?utf-8?B?WTBWdzJRTXptdnVvVklwRFhVNGxNOW50WkdSaS9JT2FycGNFQTRlTXhLUm5C?=
 =?utf-8?B?KzJ1amdmTmJaS0I5VmxlMW5pWU1QcmI3K1ZRZ1FiMnRTdnhJcEFkckVnc1JE?=
 =?utf-8?B?NFpDSmZzZWtNdVhLVkcyTmljM20zMkZSM0I3bXVqZHBKM080VGZxUzdZdTRG?=
 =?utf-8?B?aVdhTlBpMkdXRmQ1bkJ5QzErSlViVlRPTC9GOWJuVlZFMWg3RHl5WUprNWhD?=
 =?utf-8?B?SzA1cDREdThrVDVrM0tna0Y1Tmx6ei9aTEo0eWVWQ01xRUNTeE1taFhFTjFp?=
 =?utf-8?B?VjlmTmJRV2UzUW5sRVpQcGt1dkxBVFB2eUFYWXF1cFZLMU4weDh0REVXQU5G?=
 =?utf-8?B?VzVORGZsQ3BiV0doUEl4RFJYaHU4eWE4c1VLSGdOMjI3VUpmZEltamNDN3hB?=
 =?utf-8?B?eERTSHViSE5seEhWRXVUbDZKb0lYLy9adXVPSG1jYmtWajVFVm5EcmJqT2dM?=
 =?utf-8?B?QXR1ZlA0ejNuUDJTd09MbWdWZ2dLeFJTdVBkYW9VY29HMCtBWUdQSjRPRHRU?=
 =?utf-8?B?ZE1EMlJuSXFqU3pUR21GN3lxK21kclphRW90emN1L3QyNm4yMWQySGlsR01o?=
 =?utf-8?B?Uk10blk2TnlGZ0w0R3U0Y2d1ZU1HS3lCMVRZVmh6RnNBdVRQczdQRHlndDlh?=
 =?utf-8?B?cEZuT0VsWTkxWkxtS2c2RmJOQUx2SWF3YzNtWEdoSkMxUTVpRHZSM0VLWHhs?=
 =?utf-8?B?c21QNlRrcThhNHlvZkJyOUphRi9Wb3BkTE5vZWgwQzRISTR5OGJhdTl0dzVo?=
 =?utf-8?B?TmFsQWdYc2E1TUM2Nm5DNHlzL1VweGpPUFpVaktBaVEvRXcwOXVTNk9ubkoz?=
 =?utf-8?B?UGEvWFZDYzRWaVNpeDhEajB2RnRGOTN5dkJrenpBNW5yMSsxUXBCeHVLQ2gv?=
 =?utf-8?B?d1Vya1NXUksrUzVROFU5YTRRa0hScTFaak1sVkhJL281bHp1NUlHNzFzMXdi?=
 =?utf-8?B?L3l5em9vQTdjRE85ZDdsa3Q2cjlXbDNpaEt0WmxOWElmUnZDM21JeVZvYmxj?=
 =?utf-8?B?ZXJJM3NXK0VWbDg4aDI3M1drMVAzNk1KRm9neDlMYTY2WnBJWEdLL0FmQkkw?=
 =?utf-8?B?SklmNmlZQ2lXczQ5NFR4RE1mWUdBak14dDNJeEowZ3l3ZVRjVmZIS1BPU0lF?=
 =?utf-8?B?QjJnMFZNSkIzZmQxYXlya29TcktiQk1oZVB1QUVibVJ2ck5xdmIzdks4QklF?=
 =?utf-8?B?Rm9MU2ltZmowTWRlckpXekxxbFdlNXI5OThRRWZ3amZLcFJmM1V4R0NGYkMr?=
 =?utf-8?B?Q29uK1pBbVZJOWN3bWx3c005YnRrclo0R3doR1JqTUw2WTQ2VG9SaG50VnFL?=
 =?utf-8?B?WThhUFVKNTNnU00yQ1NiT3RpaElsUE9RNk9yOEk4RWs3cXJUR0dlVGE1Z00v?=
 =?utf-8?B?MEEvb011ZHA5TXFlQmRDTGpkVElhdm1oVmlLUHcyaEtlaHppWFZWcVJ1VDl4?=
 =?utf-8?B?MUFqdXhDUDdwdklXc3QvVE5IMmVzYTNXcmxaWHlVeUJhQTBUSWtsSmh0ampW?=
 =?utf-8?B?Vmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9224.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGdvbG9OcGM1dEphc2Voem9mSXh4RVJPbVY0VTVtNWc2TEZ0aS9NVEIvS2pp?=
 =?utf-8?B?cHBsYjNoaklyTTA3QXMwMHRnUmdTZVNLQThTMFlma3FnSWRnNXFOOE9zU3dI?=
 =?utf-8?B?U3I2VTY2bXZPUHVBVUl0c1FoVTNUT0xkUmpDalllclZDRmt5aVh6TXZ2aEZS?=
 =?utf-8?B?eUZKRENtU0gvU28zZTArVEkxUVlnUE9scWk1ckpNbllEZ2k5T2J2RWFudjJ4?=
 =?utf-8?B?Qk1DS3F0Q3ZLUVlma0JCUGZyMXhUbVpuL29MbXZLTExYOUNkSEtPQml5Mkty?=
 =?utf-8?B?eTFEdFBid1g0a1lNdm9IdE1abGZBcXQ5QWhPd3NId3Nta1JhUVI5dTdxckEw?=
 =?utf-8?B?VzBFVmM5Rlh6S2tOWFZCeE84R3lDRGV1a1k5azhsb1d5VEU0c1BjeEVWUjNt?=
 =?utf-8?B?RW82TFV6aEluaGR4WCs4T2l4anZPWUhFQUFwMmdibDFtbVRPc0hwU2I1eEtK?=
 =?utf-8?B?VzhVY3VRcHpwOGljZnl1Z3Q5SXJ3ZS9hV1pubjMyUzliamZzTHVDbTZjSDNh?=
 =?utf-8?B?K1JSMEhJbzFiTUxvNVhNOEVlY1Z4Y3dtS1VkcGZ6QThmTm5SbitvanViUjdJ?=
 =?utf-8?B?QnR3S3NYUlpBd2RuMGV2QVJocFdpekN1VzVkZVhSK0t0OCt5SHZQd0cvUTlR?=
 =?utf-8?B?VEhRTDJhUXpiZFJYV1Fqc2pWWCt5MnRjVmNRRWpuOUt2ZDAwMUVQbzBpZ3lQ?=
 =?utf-8?B?UVNrbS9iSFcybGNNNDQwYS9wTE96ZmtFemc4Y1BEa1oxc1AwcDgxUFc2MVFR?=
 =?utf-8?B?cnBZMzV4NCtXNU5vYkpNekNWZGd1N2J1ZHFmQkJYT25rT1FzTVJWSDJDTkxD?=
 =?utf-8?B?SFc3eG5KMzhxV3BWN3JzcDVJZTJGT3g4SDcxNURwUStZSlBRNlBsTDdVaVg5?=
 =?utf-8?B?UVlxczdpMjBFcTRjRExvOEQzajJUTVMvdS9GbUVSaFZqekdqVUdQbW4zbS9h?=
 =?utf-8?B?SUN6ZWhjMy85YkpLakVWMDBCUXpncTB5MEZqc09zSmtiU2VNc2M0SjVLTHF1?=
 =?utf-8?B?NC9ROFlubE0xYy92emRzZStyOTZSZTI0ZzdncFF6YkFKZUJCTWRtbmwwa2ha?=
 =?utf-8?B?bDk2UEJSdTdFVmk0WFFYajNWbjFlaWZHOGR3KzV4OUpZVG5mdmIySjJPUjNS?=
 =?utf-8?B?RzcvZFUreGhXVlJJc3l5YUsrRmtuZHkzeE9zZi82S2VSMHZmN3NDUm94OTBi?=
 =?utf-8?B?M0FqRWFjODd4UTJSc1dxM3lWR0FjOXlCM2N6QnZZRTNETGhRcEl0YjJZN25s?=
 =?utf-8?B?Ry9oQ2d1N1prUHRkQ0RnN3lrWWZNWW5NSDFQUWV4ZDRGU1REelQvMGw5cUdC?=
 =?utf-8?B?RlMyc3owdGNiT2x1Z1J0SWNZcEt3ckdNaHBrVUU3V1pTSmM5S01GL0tEN2N0?=
 =?utf-8?B?ZDNTY2lqbmNidE9rNjJxRzhrRWx1UldBaTlCdzBZeDFmS21uRTZEM0VOMUpz?=
 =?utf-8?B?QVRoRFdVVE01eC9BMnU3V3laVnJmUVVDMkRFN2R3N2FlOVlCZkpVYjRtenp6?=
 =?utf-8?B?ZnJtM0dUejlsRTk1STVWNFJmK0VTZXVmUWlrQ2RrdnBnYmUveDJ0VHVocG5F?=
 =?utf-8?B?cWhON01YRG0yS1N4RjZCTm00emFiRnZud3VvL0o1NjFaUkVkTEdnSmk3U3ZT?=
 =?utf-8?B?ZXZxTVJ3d2Q2eUdFTncxY0VwZEpOdDgwT3RDN3NtTXdxSDAzTUd1S2tnNHdv?=
 =?utf-8?B?VTkwMkVuOTBFRWJQT3prc2VYNDYxekI4c2ZkR00yV0F2MzNOQ2NSWWlrekJO?=
 =?utf-8?B?NWxoU3l1dkorRDR0bTBrQWVLN1NXVnYvd3BFSnd5UVg4T2NsSElGU0JuRi8r?=
 =?utf-8?B?MGhLOGdRVGpLWXR1dXdtOTRrTWxKeUhDMkdVWGZha0ZJbEJ6SFVwNTM4MXZm?=
 =?utf-8?B?ZFJPelpJT1pBU0U4ZEdJVStWdU5ieWdpeWRGMHBWRVUyRFB4S1kweVdKM1c3?=
 =?utf-8?B?K1JLeEQ0czRZNUNpVzYrcjVFQ3FQNFdLZWN6NHJQcnl6NG44cWxWNCthbWRm?=
 =?utf-8?B?c2NZZzgxaDRjUW1ibm1OTC9vSjVnT2F3azI2dTBuUk5OUWRjWEE4a01GRmhK?=
 =?utf-8?B?WHlXRFhscE52QmtyRXg4c1FUUDFLR3NLaFZrd0M2UHgrMzZBT1NoeE1RVGQv?=
 =?utf-8?B?YjJveFZQd09PVkZJMlFZZzdkb3lOY3JkempzY1BoV2NCc0tTNE1OZDA0UFJk?=
 =?utf-8?B?Y1NrZ1ZZRUVhd2tHWmJ6L1E1SXJwWnpTNVRhWXh6cHJ4RGIxaHBaVmFjSEZ1?=
 =?utf-8?B?MVgzUmRDRHJ2bTZZbTJtajFtQmNhaFd1d1Ria0J4RFQwV000eGpqdDV2TFd6?=
 =?utf-8?B?L1ZrWGxBakxFTDFCd21EMWIrV3V0UElSQXo1L1JPTHBybzNBcnpFRXNlbTZS?=
 =?utf-8?Q?yEod5kilXYhg2sww=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed77ed1-325a-4d0d-1f3d-08de6d6c5e3b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:02:14.5047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrUx2kwv3fY+QCEvnpPo89y4F9eacC+bTk0wB0ENih5aCZgu8BtoZnS43XVBx38NSUOJlF/kV8n3/5Io4n8qZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12380
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52893-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larisa.grigore@oss.nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,NXP1.onmicrosoft.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.nxp.com:mid]
X-Rspamd-Queue-Id: 1C786145072
X-Rspamd-Action: no action

When coming back from reset, we need to re-initialize LINCR1 register.
SLEEP bit should be cleared, otherwise we can't enter INITM mode.

Fixes: 09864c1cdf5c ("tty: serial: Add linflexuart driver for S32V234")
Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 drivers/tty/serial/fsl_linflexuart.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
index 5a410e2d56ac..016011fd8760 100644
--- a/drivers/tty/serial/fsl_linflexuart.c
+++ b/drivers/tty/serial/fsl_linflexuart.c
@@ -413,8 +413,7 @@ linflex_set_termios(struct uart_port *port, struct ktermios *termios,
 	old_cr = cr;
 
 	/* Enter initialization mode by setting INIT bit */
-	cr1 = readl(port->membase + LINCR1);
-	cr1 |= LINFLEXD_LINCR1_INIT;
+	cr1 = LINFLEXD_LINCR1_INIT | LINFLEXD_LINCR1_MME;
 	writel(cr1, port->membase + LINCR1);
 
 	/* wait for init mode entry */
-- 
2.47.0


