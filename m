Return-Path: <linux-media+bounces-49516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F74CDD5A0
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 07:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 758703014D6A
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 06:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC5E296159;
	Thu, 25 Dec 2025 06:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MnxONKh7";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="sHe41o8w"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C0B19DF4D;
	Thu, 25 Dec 2025 06:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766642755; cv=fail; b=teJErPd9xRfyeujA4qZ9tA0RnaEP7q5fHJ71Gl1wo7Y9NYwQV6XaxbUkfW0VvTjS9CU/Z6sID9m8YyhO97zPmy1N7nPsGRPOgu14QSEo7QtIroJwwdvywqEQyUVjZJBdySWtPJI6V7xf0xAk0w92Z6U1UhfnGXiYATQvwNxvGmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766642755; c=relaxed/simple;
	bh=VB5CFob+VtdBUBiA7wKcRe/f6nPq6ip2+MftBsLZi5U=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qQ1vGxi2rvljxIpd09UW8e7huiEOjFGnGtfxYglyxm5qeHA9weoYiCVMn3CZk/wxDYCXq6xcLVaFpuc8I7Xs8DDTR0ukLw1JG98n5pkRaoFG8cFPmUmX6m1Ol7sTfr3Z08TlynF3/NArimLfH/PnJ6edxWcBIgxt35LLn2IA0Zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=MnxONKh7; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=sHe41o8w; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c08e8afae15711f08a742f2735aaa5e5-20251225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=VB5CFob+VtdBUBiA7wKcRe/f6nPq6ip2+MftBsLZi5U=;
	b=MnxONKh7qu6pbXwUxE834c55d4v934Niivsy2zyU/mcd+ZjBsqEOW1uh3mVcXn6ER7TOiL+4a8gOWNMX6qk7IHd2VrqFrQbxChGpQnH3lePEpZmVzqmdyMrkIp6CjBXkDd8u1d9jKIbecFdOg47u0k68vXSNQTBSrm5XbdSNuK4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:15029672-413b-415c-a8f5-6e53e6a01b87,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:d1f52503-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c08e8afae15711f08a742f2735aaa5e5-20251225
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1119224661; Thu, 25 Dec 2025 14:05:45 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 25 Dec 2025 14:05:44 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 25 Dec 2025 14:05:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6EGprvabHHJrQEMOfLURWFkKjIgKLtmd4o0ZrpAh040jE+cnQea4GqOT29VAYe3+U2wUtDJPj5Mm2NJUYRXMuMrzO5gNeyprwXNVGPEIQy6yDTmbUumw2+ONM+shnHmoH6OMPXDuVfD8uWe5OkFkYQqD1YBdMGslWG9rhp7C03QmIDCBf8gCetVpdYrDdV6F7bCsRrwFC0bUF2PrrP3IAhJbE34i9l5fy80VRtf9EQzpmFVnqLwI7BPdYXPpnNFr5JhdTxg7xOm3wA51QHXhaFG/CLvcJd4FSaJ/LnmbwfD9dOAyvfdC/wNbSpVEA2w1nIyGEKTVXOg1YCyXB162w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VB5CFob+VtdBUBiA7wKcRe/f6nPq6ip2+MftBsLZi5U=;
 b=pgLVfyh4nMKtX2OHn9HVoeJdRmSMhP7EH8hKbLCb7W9Kod3H7Efid1zVrahFOImbjpQT+zRmxw2V6/iLtPIlJs3CEvheXxaQnMt8BBgDgIWa+vYaJsJJDxhisHElAtwNXZSwsqqpRaHpbXdcuPrZvbMnu1OcKZWa/v6E+z0jhsxFUBFDBlMxsGFMkDmN1c7SNIpHbfrXGieHCm7R4ZezC10ka2h708Ub4qghNR6UXipdQaXgrXZ52YtW2Wq1BeP7HETGl82lJSwQ4UHosOgh/6J26TGKBNoSvhFYToCCkYywT/WkIJob8KzaGZLYVZwYrhGl4OPEYhVRvjQTFIGVFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VB5CFob+VtdBUBiA7wKcRe/f6nPq6ip2+MftBsLZi5U=;
 b=sHe41o8w8X+az2fJsdZTggeqCLHOourNs+4uVP4GADex8id6hq6qiMRDjH4gK5e781a/Qu3fmRYDvHoUS6BP1bNQcz86syt4RmAtOsXFdMR35tLxmt7J2fyMjvqE10/lbDICooc+2xK2AP/rLvyYQFHMHqjJgKddQcizUEE9p04=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TYZPR03MB7866.apcprd03.prod.outlook.com (2603:1096:400:454::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Thu, 25 Dec
 2025 06:05:41 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9434.009; Thu, 25 Dec 2025
 06:05:41 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v11 03/12] media: mediatek: jpeg: fix jpeg buffer layout
Thread-Topic: [PATCH v11 03/12] media: mediatek: jpeg: fix jpeg buffer layout
Thread-Index: AQHcY3DFhJK1gB8boESpFmv8mA7PBLUk3VwAgA0kwAA=
Date: Thu, 25 Dec 2025 06:05:41 +0000
Message-ID: <714f2e57521e990d77b80d23a9eb773ca878b07a.camel@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-4-kyrie.wu@mediatek.com>
	 <89f845b45405bbf985a5e92c195078074bcce0e2.camel@ndufresne.ca>
In-Reply-To: <89f845b45405bbf985a5e92c195078074bcce0e2.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TYZPR03MB7866:EE_
x-ms-office365-filtering-correlation-id: e6cf125a-dbdb-4bd0-6909-08de437ba22c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SmNyanAxVjFONVlTRXREL0RnTGhzc0FiTWpRdXA0QVBjbHExQkVLK3BTRmtv?=
 =?utf-8?B?NEtiSDVQV0sxclhrTFlVWGluU1lpQmpIenk4dnlpQ1ZaRjRLREZVVzhqR0V5?=
 =?utf-8?B?REFTZkdsNlAwZCt3VU1EOWxvM1FiQTZzN0FGYWYxak13NW1PWTlUaGUya010?=
 =?utf-8?B?WHFndE9TcG5sQ0ZGRWx0dXovVjg0Y0g3a1pGcUZJUmUwYk9ud2hqL2tid1NV?=
 =?utf-8?B?WEJrMjZJcW9MeDZCUHpsZU9lU3IvSEo5WkY4RlNkWTZpUVJJZG4rbXYvZWt6?=
 =?utf-8?B?VjNjZHhQY2IxNTJJUlYvb0tMeXNTODZKQlA0RklidTFrQm5OdDRYallTVHc1?=
 =?utf-8?B?V3BQWXg4bkxFYzliaGg4V3g4aGRJSWF1bEdaZXkvYkp3YmhZZGFPTGVKVjZW?=
 =?utf-8?B?L3JzY2MrUzNxV0EwaUdhSnJVY2dkQ2hRcDJXdnBWbjlrVk5lNW1OZWo0L1Bs?=
 =?utf-8?B?ZlRNc2hMMm9ZVGhjMUhzR2hEdnF3MXl6MVdXV3ZLYWFxVk9ZY0RMQ0pTb0Jk?=
 =?utf-8?B?Tmo5dkxQNzYyTnFuZkVQM3NiUldmcGVZMVdGc080cWkxSWhKYjJhQ3dtODdS?=
 =?utf-8?B?ZktoZHRmOHRTVnhZQXdMU21FQkFkS09WdmlEdFllVW1mSkEwekRiVXZ4Y1Fn?=
 =?utf-8?B?T2xUTlo1ZVhGdGN6QU13NFIremRhdzMwVHdzejZzdVhwUUxLblFxc0o3c1RL?=
 =?utf-8?B?ckNVTE1rbXM4Wlhra01ET2lTRGZQbGJEc0U3ZkMvZERFeHVndlYxbld1RGpI?=
 =?utf-8?B?NTNZcTZDV1lWck1QcHFWMGxad3hZVmFEM3dST245RFdDeWlybjkzZ0I1eDFp?=
 =?utf-8?B?YXE1bDhXL1dCNGpuWnBJV09rMy9lVjN3MW9qNTRkeVkzNXJTaFV1STBCUEJ4?=
 =?utf-8?B?czVyT2F0MjBPNnVocXI3b1hrZWxPT2RhNEp3Q2N0aDJKbTZva1d0MEdrWWR2?=
 =?utf-8?B?R3BTS0Y4S2JXVi9XMW9Md0FxQk9MWXYxbGZOc1FxVWxCc0FvR3B4VStQMmpq?=
 =?utf-8?B?RVV0TVRTSFJPemI3dDVmenV5dWdCTFEyQk01bDlmVmJ1MjQ5NzhoT1ZWNFJ6?=
 =?utf-8?B?R3RyWjZhVk5NdnRBeVA5UTk2eG1xME5tK3F4dDQrSTRQUFVSQWlETU1HdGx6?=
 =?utf-8?B?KzZyclZTTTlWSEhTUTEybHJ1aGZSNTBBVWFxNnNERS9uemhMRFJGOUk5U0pv?=
 =?utf-8?B?Ui9XcnRmK0RMOFpEa3o0TTR0RWhlMjdrc0Z4M0pXcTRPWTlpRmZkdWdqc25n?=
 =?utf-8?B?RG5CL1JuYkQvekZQOVhxNmxVTFREZklYZXpYcC9QZTdkaDcwOGtDejRsUWxw?=
 =?utf-8?B?ZFd4dE1zTkxGOWJTTDlVQTltUzY2MnRVT2ZpR1YraklHeUZ4ZGtrYm1YT2Mw?=
 =?utf-8?B?TmxjRVFpTEV6RmovRml3TC9kYS91ZWhwZHh2cnFTSjZzSE0rWnVlYVRQUUQz?=
 =?utf-8?B?OVh2TUUvb3hIYUdocDJYVXI5eUxZd3dYQ29nNFBqcEE1dWk3dUpSclhYVDJr?=
 =?utf-8?B?WUhFYnhZME5lOVhWTTh5NWZESzN3aVBYQXQ5K0MyUGFUbGtYNXozcG9GbVRD?=
 =?utf-8?B?ZmtITXk4K2hOejl4NU9LSHJVWkJUZjFCNkRNY09SV1luSkVJS09kWUFiR0Fu?=
 =?utf-8?B?VmRCdmRCaVBsWDVaWGZYWUVWNUtLSVU5S3VwSUYraXFpSVR6Uk1jcEN0N0hw?=
 =?utf-8?B?b1ltTk9CZUtJOWlCUXlML29QdE1hY2srTGhGYXpBak1zZERhSnR3Q3ViQnRL?=
 =?utf-8?B?bDdPalJMaE8wVjhVWEV2TU5PWFMyMmk2NmNpTWFwcFdsd255UDZKUll1bU9i?=
 =?utf-8?B?RU9oSFFjSS9MbUFNMFFQQnVUT2VPUnorWVNiSHJ1ZVVWMjBkUnpLSjNYYjFP?=
 =?utf-8?B?UFBDL3dNUWN0RGFjSThBQlRUd1ZveUF6UitRV2VhSEd2OVlXNTN3ZnYzQ3lB?=
 =?utf-8?B?akpJZm1WQTlNaUd0N0J1d2tVVmJKRDcreGc1R2pLRFU1aTNBQ1VkNHo3UWlQ?=
 =?utf-8?B?cUFScjk5M0l0b0dsL0xmRjAxMERzaC9pT1dEUkw1Z3d0d1VyRHdpZHQxbjQ1?=
 =?utf-8?B?alJjVzJ6bVFhL1JWQ3VWeHZRRi9CcjRMTXEvUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjlCTTlJVXpXaUIzZVovaUVHbWFzd1Fad21aZkxYVHZSN0kySWdCV1drRkdK?=
 =?utf-8?B?OXZ2ZGdheEpYNXRVWWE5eHNKc01HZ1NrVDdrRXZLajNML3FQVVBHR3liS0gw?=
 =?utf-8?B?K2p6UGRrM1BmeFYzYnlIaFBGNFhLZDY4TUJrVnVkbDVBL1J6c3hPUFlnRTNa?=
 =?utf-8?B?Vm9JSkJjdUdGMm1UcElHRlZWTkVXUWliQ3UrRE1EQmt6MzZUTWJ1TDRITFVV?=
 =?utf-8?B?ZDVSTG85MCszWUVHK2UwZkUxZkxUa3J5RXFSQ1U4Tzc2TTBQbFVhby9iYk9p?=
 =?utf-8?B?UXFQdk9uVTZxeUZkcDRCWUhzNTJKdFRpREh3QldZQVpETktaVzhhajVualdy?=
 =?utf-8?B?dE82MUhEOFRrbGhzV3Bxcy9lR0pQMW1VaG9WZjB2Q2xIclgwR0kzYjUrYkRp?=
 =?utf-8?B?U2pySVV1VFRicHQrSi9VY1lWdlVxNWJZeFd3aUwxQ21uOHpSNmxwYlNHL1VO?=
 =?utf-8?B?TFV2SFF2N1pVNmRYSmlTcmpJYXN0RzBmU0tqUld5RlNaQVZOb25haVNDNzl3?=
 =?utf-8?B?VHg5SDJBajUxa2pLMklRWTBESitZL0tDMzhud1VYc1h0alhvTHlBczloVmtR?=
 =?utf-8?B?VlRWRWM5STg3UjRENkZnbzdZSzdLQ2g1aFFyWGI1ZDkwRWV0b2JCVGh5cTdP?=
 =?utf-8?B?NVRWYi9mWUh0dGN6Y29SM0gza0dUY3pkNWRjVGVmQUQreHNuc29EejVpa2VN?=
 =?utf-8?B?N2FLek5SV25IekVTT2NVUS9JU3p4bU5WZ2x1TUtVbFYvK3h2YmRZU1FyaUJ6?=
 =?utf-8?B?WVRUUHI0bnY5Q3Juc3hQNEdaQjdxMUZFcFNjVnIreU96Q1JNczMzNFNQc2Fm?=
 =?utf-8?B?dVdMWHgxVG1JdFNkcEVtR3JpOWlwWkFGalQ2WGR6cWl4bTNQMUJpdXA5TDd5?=
 =?utf-8?B?MnRXa1cvMWFZN04rUm9UM2d2NWR6RU1NTWpTNkFnd1JhS2ZGcGlqM21MWTRz?=
 =?utf-8?B?bi9Jc2hUdlN3bjdESWpIcnVWTlRqWEhabituNmxEMGkyQUxzSFBNN3EyMjM3?=
 =?utf-8?B?RkVna1QzQ2UrNWdtT0FlaUVJcWZxSTVZSXgyS0U1cEVOWFJ3YkpMeEZBWXhI?=
 =?utf-8?B?MTVtS1F5ejVuSHF3d3pKQXRjSFJDYVlEMEE3TlUxcEFkbVlucjJQUUhRL3d6?=
 =?utf-8?B?aGUrdHNlaEkwbytRbUV4KzJrclFmV1VqZG9WMWx1cW1paDMzVDBHa0JUeVlt?=
 =?utf-8?B?ZXZVZEZuUDVDb2dhNjJWVC9jZjRnQUtpSm1abFE0cWtsc3lYK2ovQytuTzNC?=
 =?utf-8?B?SnoyNzZEMGVaZGU4eWVaNFk0L0RGT2RDeFVIVTNGcElJZEt5RnpyR1AwTzFa?=
 =?utf-8?B?NUN1T2JnZTdsVXU5K08wSjBLc1FMQXBudmVISUpLSlVmcTVHSVRNZDdvbHU0?=
 =?utf-8?B?eHpYYzcyNjgycFhWREEza3Y1SStITGw3QUNrNDFnRlkwK09XalVJaXpNSzQ2?=
 =?utf-8?B?aEdRWEhFcDYxS3R6bTZ3QitUZCtudTRzdGZQVVQ5Zi82S3ljdTl3VjhUWXRB?=
 =?utf-8?B?dDk0Z3dwc2ppSWZNUXRRUXpPclZlUFVPL2ZTN1BnUk9kYnErVGVGeTFielFU?=
 =?utf-8?B?WUpkd090akVCaTR2SG1lSUdYQkdkSnFNd2VXM2twZ3BxNW9zc0lWOWNRcUNa?=
 =?utf-8?B?Z08xUXRrcWQyN3l0dHdjNzF2bzcyZmJmME1LTERXR1Y3K3I5clRqUWVTcThJ?=
 =?utf-8?B?LzBPYnpnWnhqQlIwWTQ4ZEdmdFJjd2NpaGdXSDFDL0FGZDhXT1pWMUgxU3pE?=
 =?utf-8?B?aGVhODB6SVBGdklSbjJSRHlTdFVrZENpUDQzUUVTRFhya1FyUWdBUFA4RXZT?=
 =?utf-8?B?dGNwa1J3Q2tpTllxSStScDlMZ1B2TkVhdnFycWJsZ3BYWW54NGc4RzF5Mk1T?=
 =?utf-8?B?NDRtVUpFdXFKNDUxTWNaenMxM1VJUm9BWC9waDZJTEpVdFpzSXljZThQRnFT?=
 =?utf-8?B?VEVmQVRLNGh1d3ZpM1l4dHBHaWNNY3E4SnNHK1RuU3pkbGtHc3Jxb3lFek9T?=
 =?utf-8?B?bHlmbkFEZWIxcWJTVlNEQmljSHR5YmtjMW51bjBUOWQwRVFJb1VpS1QveEFC?=
 =?utf-8?B?Q0h5aWhiSlRPZHNuUmVGU0RSN1dWdGdWZ1JFbzkzdDBVNWNPNUwzSGg5QThs?=
 =?utf-8?B?K1VJd3ArNXhOYU9WampWK3ZZOEVoSUlsdUJwd3ovS3VIS2ViVGdnQjRtZ01R?=
 =?utf-8?B?QTd3MGFCWVhoYnZjbk9CODBVdnl4dEp4RU9qRjVWdTVjVlBrQ2tncUU3NkVR?=
 =?utf-8?B?am5yaThOYU5LVyt6UzRONE91ZXFNQ2syQTUxK2V2aFlIbjVlSTA2eHJhU0pJ?=
 =?utf-8?B?OUZnSHR3Y09Ua2dkbDduR3EzL29pK2kxQWx3elY1Z0JyWk1HZnVrQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <092819673547D34380338AE99BD969FF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6cf125a-dbdb-4bd0-6909-08de437ba22c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2025 06:05:41.3080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +nWMK1+FLeR1NzQVlQpEs594J6DMFiQ2aNcDuYITcWlGEOzzKLdXeTCJLVWebOcTrYmEm7FIjYvfGa818nhM/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7866

T24gVHVlLCAyMDI1LTEyLTE2IGF0IDE2OjIyIC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IExlIG1hcmRpIDAyIGTDqWNlbWJyZSAyMDI1IMOgIDE3OjQ3ICswODAw
LCBLeXJpZSBXdSBhIMOpY3JpdCA6DQo+ID4gRm9yIG1lbW9yeSBhbGxvYyBvcGVyYXRpb24gb2Yg
anBlZyBkc3QgYnVmZmVyOiB0aGUgbWFsbG9jaW5nDQo+ID4gbWVtb3J5IGZ1bmN0aW9uIGludGVy
ZmFjZSB1c2UgdmIyX2J1ZmZlciBhcyB0aGUgYmFzZSBhZGRyLg0KPiA+IElmIHN0cnVjdHVyZSBt
dGtfanBlZ19zcmNfYnVmIHdhbnRzIHRvIGJlIGFsbG9jYXRlZCB0byBtZW1vcnksDQo+ID4gaXQg
bmVlZHMgdG8gYmUgcGxhY2VkIHZiMl92NGwyX2J1ZmZlciBhdCB0aGUgc3RhcnRpbmcgcG9zaXRp
b24sDQo+ID4gYmVjYXVzZSBzdHJ1Y3R1cmUgdmIyX2J1ZmZlciBpcyBhdCB0aGUgc3RhcnRpbmcg
cG9zaXRpb24gb2YNCj4gPiB2YjJfdjRsMl9idWZmZXIsIGFuZCB0aGUgYWxsb2NhdGVkIHNpemUg
aXMgc2V0IHRvIHRoZSBzaXplIG9mDQo+ID4gc3RydWN0dXJlIG10a19qcGVnX3NyY19idWYsIHNv
IGFzIHRvIGVuc3VyZSB0aGF0IHN0cnVjdHVyZXMNCj4gPiBtdGtfanBlZ19zcmNfYnVmLCB2YjJf
djRsMl9idWZmZXIgYW5kIHZiMl9idWZmZXIgY2FuIGFsbCBiZQ0KPiA+IGFsbG9jYXRlZCBtZW1v
cnkuDQo+IA0KPiBQbGVhc2UgY29ycmVjdCB0aGUgd29yZGluZywgIm1hbGxvY2luZyIgaXMgbm90
IGEgd29yZCwgYWRkciAtPg0KPiBhZGRyZXNzLiBJIHRlbmQNCj4gdG8gZG8gdGhlIHNhbWUsIGJ1
dCByZWZyYWluIGZyb20gZ2l2aW5nIHRoZSBjb2RlIGEgcGVyc29uYWxpdHksIHRoZQ0KPiB2YjJf
YnVmZmVyDQo+IGhhdmUgbm8gd2lsbC4gVGhpcyBpcyBvdmVyYWxsIGNvbXBsaWNhdGVkIHdheSB0
byBzaW1wbHkgc2F5Og0KPiANCj4gCUZpeCB0aGUgc2l6ZSBvZiB0aGUgYWxsb2NhdGVkIG10a19q
cGVnX3NyY19idWYgc3RydWN0dXJlLg0KPiANCj4gPiANCj4gPiBGaXhlczogNWZiMWMyMzYxZTU2
ICgibXRrLWpwZWdlbmM6IGFkZCBqcGVnIGVuY29kZSB3b3JrZXINCj4gPiBpbnRlcmZhY2UiKQ0K
PiA+IA0KPiANCj4gRHJvcCB0aGUgYmxhbmsgbGluZS4NCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTog
S3lyaWUgV3UgPGt5cmllLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUuYyB8IDIgKy0NCj4gPiAg
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUuaCB8IDIg
Ky0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
anBlZy9tdGtfanBlZ19jb3JlLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvanBlZy9tdGtfanBlZ19jb3JlLmMNCj4gPiBpbmRleCAwY2YzZGM1NDA3ZTQuLmJkMGFmYzkz
ZDQ5MSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pw
ZWcvbXRrX2pwZWdfY29yZS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay9qcGVnL210a19qcGVnX2NvcmUuYw0KPiA+IEBAIC0xMDk5LDcgKzEwOTksNyBAQCBzdGF0
aWMgaW50IG10a19qcGVnX3F1ZXVlX2luaXQodm9pZCAqcHJpdiwNCj4gPiBzdHJ1Y3QgdmIyX3F1
ZXVlICpzcmNfdnEsDQo+ID4gIAlkc3RfdnEtPnR5cGUgPSBWNEwyX0JVRl9UWVBFX1ZJREVPX0NB
UFRVUkVfTVBMQU5FOw0KPiA+ICAJZHN0X3ZxLT5pb19tb2RlcyA9IFZCMl9ETUFCVUYgfCBWQjJf
TU1BUDsNCj4gPiAgCWRzdF92cS0+ZHJ2X3ByaXYgPSBjdHg7DQo+ID4gLQlkc3RfdnEtPmJ1Zl9z
dHJ1Y3Rfc2l6ZSA9IHNpemVvZihzdHJ1Y3QgdjRsMl9tMm1fYnVmZmVyKTsNCj4gPiArCWRzdF92
cS0+YnVmX3N0cnVjdF9zaXplID0gc2l6ZW9mKHN0cnVjdCBtdGtfanBlZ19zcmNfYnVmKTsNCj4g
PiAgCWRzdF92cS0+b3BzID0ganBlZy0+dmFyaWFudC0+cW9wczsNCj4gPiAgCWRzdF92cS0+bWVt
X29wcyA9ICZ2YjJfZG1hX2NvbnRpZ19tZW1vcHM7DQo+ID4gIAlkc3RfdnEtPnRpbWVzdGFtcF9m
bGFncyA9IFY0TDJfQlVGX0ZMQUdfVElNRVNUQU1QX0NPUFk7DQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmgNCj4gPiBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmgNCj4g
PiBpbmRleCA2YmU1Y2YzMGRlYTEuLjE0OGZkNDE3NTliNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5oDQo+ID4gKysr
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUuaA0K
PiA+IEBAIC04NSwxMCArODUsMTAgQEAgc3RydWN0IG10a19qcGVnX3ZhcmlhbnQgew0KPiA+ICB9
Ow0KPiA+ICANCj4gPiAgc3RydWN0IG10a19qcGVnX3NyY19idWYgew0KPiA+IC0JdTMyIGZyYW1l
X251bTsNCj4gPiAgCXN0cnVjdCB2YjJfdjRsMl9idWZmZXIgYjsNCj4gPiAgCXN0cnVjdCBsaXN0
X2hlYWQgbGlzdDsNCj4gPiAgCXUzMiBic19zaXplOw0KPiA+ICsJdTMyIGZyYW1lX251bTsNCj4g
DQo+IEkgbGlrZSB0aGUgY2hhbmdlLCBidXQgdGhpcyBzaG91bGRuJ3QgYmUgYW4gaXNzdWUgaWYg
eW91IHVzZQ0KPiBjb250YWluZXJfb2YsIHdoaWNoDQo+IGlzIHNhZmVyIHRoZW4gYSBwbGFpbiBj
YXN0LiBQbGVhc2UgcmV2aWV3IHRoZSBjb2RlIGFuZCBtYWtlIHN1cmUgdG8NCj4gdXNlIGl0LiBJ
dA0KPiBtYXkgYmUgY29uZnVzaW5nIHRvIGluY2x1ZGUgYSBjb3NtZXRpYyBjaGFuZ2UgaW4gYSBm
aXhlcy4NCj4gDQo+IE5pY29sYXMNCg0KRGVhciBOaWNvbGFzLA0KDQpUaGUgZHJpdmVyIHJlcXVl
c3RzIG1lbW9yeSBzcGFjZSBmb3IgbXRrX2pwZWdfc3JjX2J1ZiBpbiB0aGUNCmZ1bmN0aW9uIG9m
IG10a19qcGVnX3F1ZXVlX2luaXQsDQphbmQgaXQgdXNlZCBzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVy
IGIgYXMgdGhlIHN0YXJ0aW5nIGJhc2UgYWRkcmVzcywNCnRoZSBwYXJhbWV0ZXIsZnJhbWVfbnVt
LCB3aWxsIG5vdCBnZXQgYSBtZW1vcnkgaWYgd2Uga2VlcCB0aGUgb2xkDQpzdHJ1Y3R1cmUuIEFu
ZCBhIHVua25vd24gbWVtb3J5IHdvdWxkIGJlIGdldCBpZiB3ZSB1c2VkIGNvbnRhaW5lcl9vZg0K
dG8gZ2V0IHRoZSBzdGFydGluZyBhZGRyZXNzIG9mIG10a19qcGVnX3NyY19idWYuDQoNClRoYW5r
cy4NCg0KUmVnYXJkcywNCkt5cmllLg0KPiANCj4gPiAgCXN0cnVjdCBtdGtfanBlZ19kZWNfcGFy
YW0gZGVjX3BhcmFtOw0KPiA+ICANCj4gPiAgCXN0cnVjdCBtdGtfanBlZ19jdHggKmN1cnJfY3R4
Ow0K

