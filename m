Return-Path: <linux-media+bounces-51453-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IN6UDbrYdGnU+QAAu9opvQ
	(envelope-from <linux-media+bounces-51453-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 15:35:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2507DCD1
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 15:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79A143011BC9
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 14:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6E931E0FA;
	Sat, 24 Jan 2026 14:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KX6e+otO"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012013.outbound.protection.outlook.com [40.93.195.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79147E55C;
	Sat, 24 Jan 2026 14:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769265318; cv=fail; b=NuJmRzeVNxCyCIxkFuI8E9J8UUnzQ9G8n7a8HIZHnyL7T7tGOUBDajnB2LKxAJ7RfTKr+4INqi7dD8f5GfdYGnl+wbtl8XQJ/6mJRZWjkvPfxLs+udZ5d1b7jxNv89kORvTrSz40BeuqRzcrSme4gmsOEoQgLJlMPgVg3PtI+GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769265318; c=relaxed/simple;
	bh=D4DLvvtgrQzq/SdnzLYfLiYb0RWI8cxXBCsVVtQBUrQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R5+duPkoKeqH/3nJaxLiCT8XuaXVdwE5t/rxS93aqVlEWTfpV3bF5Vvj+7UtY/nA3gMgJqa65H7AglIsU5t4ILJ0vgksLs7m0LuLKf8n63GwZ8N1yMSrkjUi4e16eg0FD1ddmOxR/hp1XntPgXlmCG8QATsyVzRoGv2MIstMsHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KX6e+otO; arc=fail smtp.client-ip=40.93.195.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YT9/PNodNoYTJ6ZhZebv0qv2iRNUHb2CZ8IZnXcPzO8/kvLkMKxbGxHmfu5w/xAwvUaiEzE3QqGWdGEroaKShnvqSK2kRuDp2xQAqm64RqPFX806dX0sgAoLEC5OMvFYvg5Hn9m4joXht7gqh59XM9Ynmg8gnjJ+MQs6iccQ91R2HbmjwOtPYGzoKWuPUVmcHbWVwailLFB6/tVKt6V/p2b/paQaOvE5ZUH8MOHuWYSKInyC0wLhL+8LF/WlrSnY+r9HIpR8WFZwmTqfM4iv8UjSYWMAUNQZmIoikHSEasB6QbcMAQX8RYXnsE954X7p38yyTdnq3LYdCmz7Xm+v5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4DLvvtgrQzq/SdnzLYfLiYb0RWI8cxXBCsVVtQBUrQ=;
 b=dGxr0BTGW+pBLULajf9beR6eYGn74j3GXLAc7dwMdI2DArmjW/puU+JrMGA9b0in6spyPbmua4m2YCmtXdZzHV0w5kEPDt93G2IH4Bhe9YRCfODb4OkPm7e8bGb8tRemv9aVFns8TAo0snOELQClACDlBrZpPYJphVlLqZeAW7DXBBooqAD8fVdD7H8JBYZ/PrpxTWR/LzrlFk4wlcgMHHqFpgISn7wm0meiB6qO6U3ph50TIV4JT9ymqpLdU2tyK3LzRXTxykSuXNYZqekU9QNOH+mZFGIZkLQipD0JBCFSBfUyOqM8Sxs4OoHbmw2ZRh7GFD2la5AWcUXDEAmS5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4DLvvtgrQzq/SdnzLYfLiYb0RWI8cxXBCsVVtQBUrQ=;
 b=KX6e+otOUf9MRuEpv678KKJ8/5B1JIYBR1+OhOllyypiNiXrTWUzBAoEXuGYYVlE6u5220zQ2I15INFzHhEpKvfW8SXCHp4F45NHh3u006jmciw34jEyytej/gthBJJJu97sHsH+/2wgYfBWOTKT3GIxrQIYRQMIIX337ZOMWPiLIxRnQihK1mk3MLky5XmOTtUR259dTbH2HTsV01J5n5II6D3hA8W+Nom87DkG8hvx1+lLKuuTRtyuGsHtBEzo4WwiUepTt4gdPk2fcY+ZpLubh4A/OEa/L5h01jZpp8MhFbIUjMpMQQDOBOW0rScWEOCSdguuxrr3CaHr0kVX5A==
Received: from SN7PR12MB6744.namprd12.prod.outlook.com (2603:10b6:806:26c::13)
 by SN7PR12MB7225.namprd12.prod.outlook.com (2603:10b6:806:2a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Sat, 24 Jan
 2026 14:35:13 +0000
Received: from SN7PR12MB6744.namprd12.prod.outlook.com
 ([fe80::28d5:2119:63f5:9961]) by SN7PR12MB6744.namprd12.prod.outlook.com
 ([fe80::28d5:2119:63f5:9961%3]) with mapi id 15.20.9542.009; Sat, 24 Jan 2026
 14:35:13 +0000
From: Vidya Sagar <vidyas@nvidia.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Dongdong Liu <liudongdong3@huawei.com>
CC: "hch@infradead.org" <hch@infradead.org>, "logang@deltatee.com"
	<logang@deltatee.com>, "leon@kernel.org" <leon@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "rajur@chelsio.com"
	<rajur@chelsio.com>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH V11 7/8] PCI: Enable 10-Bit Tag support for PCIe Endpoint
 device
Thread-Topic: [PATCH V11 7/8] PCI: Enable 10-Bit Tag support for PCIe Endpoint
 device
Thread-Index: AQHcjT6l+zoGKVwFEkm+tnetlKSKDQ==
Date: Sat, 24 Jan 2026 14:35:12 +0000
Message-ID: <53978a8a-18b6-419d-8a54-b7c16f98253d@nvidia.com>
References: <20211105173949.GA932723@bhelgaas>
In-Reply-To: <20211105173949.GA932723@bhelgaas>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB6744:EE_|SN7PR12MB7225:EE_
x-ms-office365-filtering-correlation-id: fc4c5c69-1ef9-4ffe-8fd7-08de5b55c8af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y3RJNUZhbXdvZ2hUVzV4VmFkWjVjYkNaZ3lMWXlPbzFlQnBtZkw4bVIrUUVW?=
 =?utf-8?B?OFZjajlMamUxNW9SZG1sWjVGMWxsb2F1Q2VWckdtNnZPK1hXTkwxckdGMXcy?=
 =?utf-8?B?RGhhQWhPVHgvL1NKRFJxZDBRMWdRN1RheTZ1VGQ5U05ud0tob25kTWxKTUZ6?=
 =?utf-8?B?N0RwYWpFTnFDZDhnQTI3d1hybmJiWVh6Qlp3TFJEc1hiRlR0Vlk0U1U0MVd5?=
 =?utf-8?B?a3UzcmNzRnYyT0ozMjh3dG9Ham9Qbmk1ZXJ2bWRzZFZ1WXpjNEdkTjBXdGlt?=
 =?utf-8?B?N1lYaWlrd0dZaG52T1M2dXM1OHo1dXJkTmpIajhzYzJhNnZ3VWc3RzNiMlpW?=
 =?utf-8?B?Z0JvZFZwUkpRaEplSGRSd0ZRU3FnTWRlV3Ird3NwdUFjM0tIdGdFdDVLSE9F?=
 =?utf-8?B?eTFuWGpUclNUaVBkc3lWNkovZTBxTmIxM1lTMkZxRGdjQ0VDd0FKMllEejc4?=
 =?utf-8?B?VlBGUCtZZTk4YzhTanRQNEpkMGR3S2RsTXZEcTd6NFB1UFBlczZxUDBIL2d5?=
 =?utf-8?B?cmhLKzg5dnEwQmEzdGhrY2JjZ1lMTEc0RzEvOXV1TldURUs2d25zU1F5R3Bv?=
 =?utf-8?B?c0hQUXBHZXhzOW5DczVsMFp2bTg5bVJ0eXBJbnVKdGdhRkZMTHEwMEh1L1ky?=
 =?utf-8?B?NVhWTnNFWDEzVEw3am1TeDlvNUhvYlNCajhIb0hGMzZlUGtzYjJIdWFsdWQx?=
 =?utf-8?B?cEs5K0N4cUNWakowd0JXamJzd3dtaXZ0N0RyaUxOeGVpRTJvNEhuNk53ZXNX?=
 =?utf-8?B?dU15WWU5M0ltdzc4STRJYmt0ekQveFgvSmZxY2toY21jRHBuMkxRbXdETnB4?=
 =?utf-8?B?akFqYnR6Uzc0SFg2ZEdtYllyTlZERndBdm4zbHdUcHNMcjI3TmNGay9LYzZ3?=
 =?utf-8?B?V1Arckk5NWVvUVE1dlRCYXlHZUphd3E4TUlRY0p0WXJ1MkpXYW9qY0RtVHRE?=
 =?utf-8?B?Mnc2Q2t1V2tFQ1NNRzhnYlpJTXlheEZFeGlTNW1pSEh0MHFCZ1ZwckVhU083?=
 =?utf-8?B?SVdYS2Jyc2hQdkNCQXZieko3c0hVT2RGLzZwNzNBWHI5ekJ4VENITVVBZlJt?=
 =?utf-8?B?RFY2UElVTTErM2EvbnJwOER6RHNMZiswNHhHN3dtb0c5Q1FQZDNxcEpGVU95?=
 =?utf-8?B?Z0I0SExxdTVNQW9vYkt0V3o0V2VCMkZLODNDaVd0cDdUQ3ZtS21ZanBCRGNX?=
 =?utf-8?B?OEZ2bEU5cEEvLzA4aDlsVW8xY3UvcnIvZWZQeGpqdlZpWTdYOXljWWk2OTM3?=
 =?utf-8?B?b0w4Mk83NjVlL2RjWWc3djByTVVmbTFBVHRoZVROcE5UbmlGM3VNeTRySU11?=
 =?utf-8?B?alUxU1lCaXAxRkZzWW9DQ3N5SGs1WVlpUUwzZDFheTNTb21nS29wU2pyYWZq?=
 =?utf-8?B?d0MwdnV2ckJwQ3F0RWpSa0J4Y0FXR3hXSHg4aHlZWjlmMVlwMlJSMkd2RG02?=
 =?utf-8?B?Wi9HNENwT2pqUUE3OUtKa1VFeVVPbWpIeXhwdGlRYXZRS3JLYVk4ekZqVGha?=
 =?utf-8?B?WCtjT01nSTdzSkhQaHNjYy93bTduYWtkQkNaWHpOSDdmbWczeXlQSGl6YUI1?=
 =?utf-8?B?YWIxZnRkNVJwL0VZbldBRmRNR3VKZzZqU0gyQm1mb1U3VWxNam1CSWFRUlox?=
 =?utf-8?B?QmRDR3VDbXgyU2ZwVld3NzhXSmkwUHdGNEYrVXkrV3VBbStieXp4TnRrSlVu?=
 =?utf-8?B?M1hZbWdCb3JCdkNqZytaSlJvZ1lUbkxUOW0xUmkxcm8yZDg0SDBmMm1JZ3p2?=
 =?utf-8?B?QkJtVFVNc21WZVNGRXdHRzVRUkRKSzFjTkxKK1I4bm13MGtHOUczSHVmSHdx?=
 =?utf-8?B?azZUZExXcGpVbUlJMWl2QTJPTDlCUEFuQXlsS3N4MGowdUFpZGlDS1J3TFFa?=
 =?utf-8?B?MU9rSm5hV3MxRTVjMWp4NWFXcytLNEFEdUVteUlhQVpUUkZqNEZiVWVUekM3?=
 =?utf-8?B?bU9LWFhNUWd3RW8xZEM5ZmRvQVhaeTdVcmFrRXNhUVpmUE1CS3JvVXVhVmNi?=
 =?utf-8?B?Tk9yMDMwK2lVZGYvbnhsMGM1RDJJbHNsa3VOS3RialFKR1g3ZmZWbXRIdHQ1?=
 =?utf-8?B?N2lpVWl5cWZJTEVud2NrWDdieHlLbUpwdWdoNnhicmQ5dkQrcEFlTmxxT2tO?=
 =?utf-8?B?ZnVmV1RHbGxZeGpqTnBuSXR2eWtrUnZwblBSa3VIL1VuRHJBY0J6dEpiSEtM?=
 =?utf-8?Q?YLmCe5qPISC2IHq1Qt0SQmM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB6744.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NmE2SVBoYVdFUDhJSjlhT2hkRWwvRUUxSDhRL2lQem5lWTVLSlh3dzRNSEk5?=
 =?utf-8?B?R0U5YktydW5zWkl1Y3A4UGtPWEtrQ3kwaWlGUkF4aG5KWFQwODI3bld1Ymkx?=
 =?utf-8?B?Y3JuR2ZMdUtoOXQzM1gwbXBWRzdIZFI3Q2c4T2Y3MytJSCtnR3h5M29YWG1l?=
 =?utf-8?B?MjRWQUFPSDV5MytndnpiMy9xV2ExbW1kZTFEbHhaMGlmaDdFZ1BSQXByTzhL?=
 =?utf-8?B?Qk54OHZPUkszRklraWVZSytEdU9RTUtHRks4eFl6Y1JMcXZYL1paWGpCSlNK?=
 =?utf-8?B?QzZpc0dNRDkwcS9jK1lMeHhXSHJvUXp4NngxRTNiOVUxeFA0Wk90QnBLZDZp?=
 =?utf-8?B?VzVGd3VBV0VSeWJxWUwzQzE5R1ZOMXZTV0hNM2J3SXVES3hnYk9sUnkzdkxS?=
 =?utf-8?B?b3I2eGJYaXpuZU9YZHpOQksrWklyNHdVNzNkTm8yUDJvek55aEJDcCtlb1Az?=
 =?utf-8?B?UWY5eHZjT1E0a2J3SnptUmNxT1FCaitMOU40b2MrWnBQbW9kb0liRHJOV3I1?=
 =?utf-8?B?V1B5aU5ML0pzbk82T1ZEZHk1T09Xa3FPLzhGemQyTlZ6RnBLTUhORHdBVmRt?=
 =?utf-8?B?U2tVckorRG9SK1V1ZHZ3TUlqQ1hSSDZIUzc2SzJHdXJEb1B2NkFUQzdZcnNW?=
 =?utf-8?B?aENTOElIRkhvMnpXb2hFc2FabGw4YmV4Q0s3NWJoU0RrWS9OaUtpY0JHYm4r?=
 =?utf-8?B?SzdINjgwNGNHUGUvVVd2V2pGa3VoamNINHRNTWc0YWUwbjJaVnJPV1hRbVFT?=
 =?utf-8?B?Z1RBRjB2WkZoWVhxZXdKK2xRS3RsOHVLMy9lVjN0QVVNRnNZbzl6bGZEQUJ5?=
 =?utf-8?B?cVk5dGpNZTZ3ZDlHUmtuWURhL24zemRuYVlFdTRSL2tLeXJERXIzNnVUNENQ?=
 =?utf-8?B?UjhPTnVXdFhSYlBHRmNyYi9kU1BtVnExRzJTWUh6WTlJVFA2ZmVOWWRKemFz?=
 =?utf-8?B?K0FjNElsMXllUlV2UzFBREUxWHl4WVorQlVoVi9WaUx0eFZPRkpvSkRXOUs5?=
 =?utf-8?B?WXh1V3VoK3k2UE15QXg5UzFEN0JTbFpOSHlzeDR3UWZFenpYRENsemlrc1BZ?=
 =?utf-8?B?MktLZ0FTNTh0MUpyOHBLUEpyaTE2NitnZWZYVUQ5djMwYnNROHRTYzd3RkNX?=
 =?utf-8?B?eWZmS1hXVDNHay9RUkxwMkRqaTY2VmZ5b1RhMm9oQUNUL2c1MjFKNXpzZXc3?=
 =?utf-8?B?anFUY20wbVp0NUhCSC9GVGhZZ0REZEg3emUyckRBZ0NvenM0Y1R0NVZ3Y0dj?=
 =?utf-8?B?d1FOSTR6bE9HYzhjZXE5YkVDQXJCTkM4eHZKa2h4djg2MDJEalFiMVR5bFdx?=
 =?utf-8?B?L2tRaTNtaFhscVdiRnJaZDRUN3EzRnE1MGtlSXZHRGQzd0pwRThJNWs1c0hR?=
 =?utf-8?B?NTJUNkRWeUhqNnVvU2lmc1Rha1RsVGJVamdOMFpPVUdPVDZZK1pzdHFBcEI5?=
 =?utf-8?B?cUxheVRQWWlLZE1GeS9UQ0RhanJRbVlObXJNcUdxUFpXR25sK2ZkeWdUenBU?=
 =?utf-8?B?RlV0MVJldmRhT1BzYTNxa2N6bVh1aWs0Tmh3bFF4UjNBLzVNQzFRV3YzaDdQ?=
 =?utf-8?B?Qzl6ajNFRFdVNm5sVnk1S1F4YmJ2YWtvUVdOc0g0cVpUTWlLL2hGbGdvU2J0?=
 =?utf-8?B?dERnb1NNTlBDd0IrUnN3YmVLQU0zR1VjbE5PNkY1eG1BYnAvdXY3WVdaOE81?=
 =?utf-8?B?T1lURHUzaG1CVndabWVtRTBpeHJXekR4aitCREN4YitJRVJrQW5aUG9qVGhy?=
 =?utf-8?B?Y1FtNjhNRDA4ZU0wMlVHQTlsYThnUUZ0NUJDSHRqMnhIUkNURWpsa0Jsb1kw?=
 =?utf-8?B?clJSRDYwR0ErZ3hVZllqQUE4MVp6UElsUDJxM2lXQmthTEFtT2ZFN2tRWkJ1?=
 =?utf-8?B?dVdseStWeDdXRnRrdW1Fc3Y1NHZoaEVVc3NhZ1Zqd0poTlFmTnNEUWRSZk1M?=
 =?utf-8?B?VitvVktFTkIwekYzck9jTlpSOFhyZHNKVWxHVkFaU090ZjFKTExJWDFnRUdD?=
 =?utf-8?B?anRDM3huTFVkYnE5V3VmRVhHL1h3TzRhMTFnenNsK1dFYWVPZ1pWcWNQTmZv?=
 =?utf-8?B?cGIwRnY4V0VjYmROT0tTWjVPbG9kcWx5QnNqODczMHpGYmMwQTdTNDQ4MHBB?=
 =?utf-8?B?dUxmTnMrVGlod0gzeHF2UEZmTzBKTUZBYVMySm9WeXIyOVhabkFkanFNSjBl?=
 =?utf-8?B?d00vTC9sdVVTUjRkd0c3a1lqWnludXBuZE05dTJqOFF4czgyQzFRYmFDcjlD?=
 =?utf-8?B?enJRcU85UytOSEd2bVVMWUxUeFl1TG1NdXlCK0dkdDQweDg2ZE1qem4xWUQ0?=
 =?utf-8?B?aXVRcUZMVDMybzZ2NlpjWVQ0M2VKUld1a3dJd0hwMjlIeEN4SEhaZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4026A43528A8B4FAA21AC2CD57148CE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6744.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4c5c69-1ef9-4ffe-8fd7-08de5b55c8af
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2026 14:35:13.0068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bg/7AOkp0HtV9df46GlxC1kL+G0f9hvovzvTF7+mLpXCAWC/kOlTmF8NNuXnRuUKtfdGn9WAkJmwQkOnYxD2Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7225
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51453-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,deltatee.com,kernel.org,vger.kernel.org,chelsio.com,xs4all.nl];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vidyas@nvidia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,synopsys.com:url]
X-Rspamd-Queue-Id: 8D2507DCD1
X-Rspamd-Action: no action

T24gMDUvMTEvMjEgMjM6MDksIEJqb3JuIEhlbGdhYXMgd3JvdGU6DQo+IE9uIEZyaSwgTm92IDA1
LCAyMDIxIGF0IDA0OjI0OjI0UE0gKzA4MDAsIERvbmdkb25nIExpdSB3cm90ZToNCj4+IE9uIDIw
MjEvMTEvNCAwOjAyLCBCam9ybiBIZWxnYWFzIHdyb3RlOg0KPj4+IEJ1dCBpdCBkb2VzIHJlbWlu
ZCBtZSB0aGF0IGlmIHRoZSBSQyBkb2Vzbid0IHN1cHBvcnQgMTAtYml0IHRhZ3MsIGJ1dA0KPj4+
IHdlIHVzZSBzeXNmcyB0byBlbmFibGUgMTAtYml0IHRhZ3MgZm9yIGEgcmVxZXN0ZXIgdGhhdCBp
bnRlbmRzIHRvIHVzZQ0KPj4+IFAyUERNQSB0byBhIHBlZXIgdGhhdCAqZG9lcyogc3VwcG9ydCB0
aGVtLCBJIGRvbid0IHRoaW5rIHRoZXJlJ3MNCj4+PiBhbnkgY2hlY2sgaW4gdGhlIERNQSBBUEkg
dGhhdCBwcmV2ZW50cyB0aGUgZHJpdmVyIGZyb20gc2V0dGluZyB1cCBETUENCj4+PiB0byB0aGUg
UkMgaW4gYWRkaXRpb24gdG8gdGhlIHBlZXIuDQo+PiBDdXJyZW50IHdlIHVzZSBzeXNmcyB0byBl
bmFibGUvZGlzYWJsZSAxMC1iaXQgdGFncyBmb3IgYSByZXF1ZXN0ZXIgYWxzbw0KPj4gZGVwZW5k
IG9uIHRoZSBSUCBzdXBwb3J0IDEwLWJpdCB0YWcgY29tcGxldGVyLCBzbyBpdCB3aWxsIGJlIG9r
Lg0KPiBBaCwgT0suICBTbyB3ZSBjYW4gbmV2ZXIgKmVuYWJsZSogMTAtYml0IHRhZ3MgdW5sZXNz
IHRoZSBSb290IFBvcnQNCj4gc3VwcG9ydHMgdGhlbS4NCj4NCj4gSSBtaXN1bmRlcnN0b29kIHRo
ZSBwdXJwb3NlIG9mIHRoaXMgZmlsZS4gIFdoZW4gdGhlIFJvb3QgUG9ydCBkb2Vzbid0DQo+IHN1
cHBvcnQgMTAtYml0IHRhZ3MsIHdlIHdvbid0IGVuYWJsZSB0aGVtIGR1cmluZyBlbnVtZXJhdGlv
bi4gIEkNCj4gdGhvdWdoIHRoZSBwb2ludCB3YXMgdGhhdCBpZiB3ZSB3YW50IHRvIGRvIFAyUERN
QSB0byBhIHBlZXIgdGhhdA0KPiAqZG9lcyogc3VwcG9ydCB0aGVtLCB3ZSBjb3VsZCB1c2UgdGhp
cyBmaWxlIHRvIGVuYWJsZSB0aGVtLg0KPg0KPiBCdXQgbXkgdW5kZXJzdGFuZGluZyB3YXMgd3Jv
bmcgLS0gdGhlIHJlYWwgcHVycG9zZSBvZiB0aGUgZmlsZSBpcyB0bw0KPiAqZGlzYWJsZSogMTAt
Yml0IHRhZ3MgZm9yIHRoZSBjYXNlIHdoZW4gYSBQMlBETUEgcGVlciBkb2Vzbid0IHN1cHBvcnQN
Cj4gdGhlbS4NCj4NCj4gSXQgZG9lcyBzdXBwb3J0IGVuYWJsaW5nIDEwLWJpdCB0YWdzIGFzIHdl
bGwsIGJ1dCB0aGF0J3Mgb25seSBiZWNhdXNlDQo+IHdlIG5lZWQgYSB3YXkgdG8gZ2V0IGJhY2sg
dG8gdGhlIGRlZmF1bHQgImVuYWJsZWQgZHVyaW5nIGVudW1lcmF0aW9uIg0KPiBzdGF0ZSB3aXRo
b3V0IGhhdmluZyB0byByZWJvb3QuDQo+DQo+IFdlIG1pZ2h0IGJlIGFibGUgdG8gaGlnaGxpZ2h0
IHRoaXMgYSBsaXR0bGUgbW9yZSBpbiB0aGUgY29tbWl0IGxvZy4NCj4NCj4+PiAxMC1iaXQgdGFn
IHN1cHBvcnQgYXBwZWFyZWQgaW4gdGhlIHNwZWMgZm91ciB5ZWFycyBhZ28gKFBDSWUgcjQuMCwg
aW4NCj4+PiBTZXB0ZW1iZXIsIDIwMTcpLiAgU3VyZWx5IHRoZXJlIGlzIHByb2R1Y3Rpb24gaGFy
ZHdhcmUgdGhhdCBzdXBwb3J0cw0KPj4+IHRoaXMgYW5kIGNvdWxkIGRlbW9uc3RyYXRlIGEgYmVu
ZWZpdCBmcm9tIHRoaXMuDQo+PiBJIGZvdW5kIHRoZSBiZWxvdyBpbnRyb2R1Y3Rpb24gYWJvdXQg
Ik51bWJlciBvZiB0YWdzIG5lZWRlZCB0byBhY2hpZXZlDQo+PiBtYXhpbXVtIHRocm91Z2hwdXQg
Zm9yIFBDSWUgNC4wIGFuZCBQQ0llIDUuMCBsaW5rcyINCj4+IGh0dHBzOi8vd3d3LnN5bm9wc3lz
LmNvbS9kZXNpZ253YXJlLWlwL3RlY2huaWNhbC1idWxsZXRpbi9hY2NlbGVyYXRpbmctMzJndHBz
LXBjaWU1LWRlc2lnbnMuaHRtbA0KPj4NCj4+IEl0IHNlZW1zIHByZXR0eSBjbGVhci4NCj4gWWVz
LCB0aGF0J3MgYSBzdGFydC4gIEJ1dCB3ZSBkb24ndCByZWFsbHkgbmVlZCBhIHdoaXRlIHBhcGVy
IHRvIHRlbGwNCj4gdXMgdGhhdCBtb3JlIG91dHN0YW5kaW5nIHRyYW5zYWN0aW9ucyBpcyBiZXR0
ZXIuICBUaGF0J3Mgb2J2aW91cy4gIEJ1dA0KPiB0aGlzIGFkZHMgcmlzaywgYW5kIGlmIHdlIGNh
bid0IGRlbW9uc3RyYXRlIGEgdGFuZ2libGUsIG1lYXN1cmFibGUNCj4gYmVuZWZpdCwgdGhlcmUn
cyBubyBwb2ludCBpbiBkb2luZyBpdC4NCj4NCj4gQmpvcm4NCj4NCkhpIERvbmdkb25nIExpdSwN
ClRoYW5rcyBmb3IgcHVzaGluZyB0aGlzIHBhdGNoIHNlcmllcy4NCkkgd291bGQgbGlrZSB0byBr
bm93IHlvdXIgcGxhbiB0byBwdXJzdWUgdGhpcyBzZXJpZXMgaW4gZ2V0dGluZyB0aGVtIG1lcmdl
ZC4NCkdpdmVuIHRoYXQgdGhlcmUgaXMgbm8gYWN0aW9uIG9uIHRoaXMgc2VyaWVzIHNpbmNlIDIw
MjEsIEkgd291bGQgbGlrZSB0byB0YWtlIGl0IHVwIGlmIHlvdSBkb24ndCBoYXZlIGFuIGltbWlu
ZW50IHBsYW4uDQpQbGVhc2UgbGV0IG1lIGtub3cgeW91ciBvcGluaW9uIG9uIHRoaXMuDQoNClRo
YW5rcyAmIFJlZ2FyZHMsDQpWaWR5YSBTYWdhcg0KDQo=

