Return-Path: <linux-media+bounces-53318-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CQbKj2xnmlxWwQAu9opvQ
	(envelope-from <linux-media+bounces-53318-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 09:22:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF66194228
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 09:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19AA130642E2
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 08:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87EAF31195A;
	Wed, 25 Feb 2026 08:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DaA0rl4/"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013040.outbound.protection.outlook.com [40.107.201.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8C629D288
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 08:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772007383; cv=fail; b=Q6zmWXZc9/E+J4Dx/noTnAMmt38VnU18BfvP9StTbsGoHRKSlTUwmXXFnlwHf+BFyiReneK7QizoWDxi8/9fUsh7t2T36bsGGVKiRWip9N3DyEQNr0XCec8u7F4Uq4KAqnzBczVFNmNpJ2IyWwm8FecmDHbEzShP/AE3cjUKS0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772007383; c=relaxed/simple;
	bh=c8jkCNArwD0FjACITV8Hfp9CSnoXVYalWP/feUR+k5U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DHBMi2uSUNh6GBP698tEg7De1Ye7yP4AtVi2r77eZ1l0u2aWVD4C9Dr5SBBEk+YGWWCJTFBN4yzsfYZVWvZGrT7CVECysfyelp0Nd8ISO4mgFvlzeU1/mcS0QU6IURzSEqu/GIsFR41jTkkWZtd2Mhv8nNfU2a2pbXFSmC3M13g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DaA0rl4/; arc=fail smtp.client-ip=40.107.201.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYmcz75oAkxu4LNrfMIyqycwTBNukdmGB/42UvKtSrmMv4xNxqCm+fEGdCaPWa8kgiL9CyTxE2prpIK+SbDWB5DtnXZszb0s0iTlRTxY7zVQalzxay9U/gmQ7U9dKOLBRGBJEzhZrfcW9g3sOE2/xbYm6YjyqfdRPK38vVJIPC39fsFR2v0Oik+5cn8FZ8PhKnynfB0KF4rFUs1NkY0kCiGFZ60Rl0P6tTHPLpCUC4Cnh2RBCyikrRKJ+/xoT9kMoPgKPsLhs/lXylzCalIPbr3nTFvlt1JZepMRt/DwpUvIxiXXNrMOvZXtfZe6TTYe/THllVuaaFzFLIOMUNAaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bp62qNa5zOLvrZBtgRCMe2m/9TtTtQWlmPWOw+O6lTw=;
 b=RpGUjhqLkJIBWEmwO0yqppG388aTTi9LGeX97q8xLkQuOKW0z9kuwAbicRmawlB1jpJgkUtB3gDXYIWvgaWB56Kfynd3XbKJe/OZIahViE7d8/dHZa3K6YuX0YIBRWs6kS4Ns+HZxR2hInzELzq1yZpiOHWPHvq5jDWjhDvcpGrQHXP4fg1PdL37rFznWLSAj5rOmnom4j7lXRK1dxHnhyawvDCEKsyFrOsq0t/wnkfdd+6D2OjjTuIVucF9Gr4g2Jtz2AOh+5qC9CRXacfs0Sl/50lISa80363vIhP8tYSNJoHdREZD9LTZc5ZL5e3RgZEeuX7tOnjvhQDvZWqsoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bp62qNa5zOLvrZBtgRCMe2m/9TtTtQWlmPWOw+O6lTw=;
 b=DaA0rl4/0rJru3NLnP7+gl/plE6OfEBlvojjGl9O7JFkt+Z2cOTF/lLGf1Hn5eSf5DQhbACdoh/Vwo/5vJkzpEX0SVL7FxTIUXp3L9gDWbq64x9WJEX4DgRfhnJhoxTYhSG1AfAHNzzKJKXjAmgqHC9Y5LB3Z33YlHFwj9OTToA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 08:16:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 08:16:18 +0000
Message-ID: <5e23a5f9-0eaa-419e-ada6-4389754075bc@amd.com>
Date: Wed, 25 Feb 2026 09:16:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/62] dma-buf: Handle all dma_resv_lock() errors
To: Bart Van Assche <bvanassche@acm.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
References: <20260223214950.2153735-1-bvanassche@acm.org>
 <20260223214950.2153735-7-bvanassche@acm.org>
 <5d9daad3-a687-4116-99fc-b6c7d82fe5a9@amd.com>
 <975acbb3-a4d3-45a6-9aad-3682c46e8fd8@acm.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <975acbb3-a4d3-45a6-9aad-3682c46e8fd8@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: f4de8dad-7281-4a0a-1933-08de7446272a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tk91NzNlQnZOVXJzZWwwKzJwTXZMcU00OG1sT29GR1dGam1VeVNkc2d6RDNK?=
 =?utf-8?B?a1ZpKzM3aDBUS0R1eUp5S2pZYUZZU3k4Snp6encrMDFaSys2Ri9KOVgrbkdI?=
 =?utf-8?B?R3BXRlV6Wk1DQlRYOE5TR3VSb1dJSXhWcFdvVmo3MHhLSm9YUW9ycHdESW9C?=
 =?utf-8?B?eFozNWxaVGVGU3dJbDNUZGpJajlTYUdrZW0ycXdpS0NNMzZCL3ovanBaazh6?=
 =?utf-8?B?YmJSczdxYnhmWm5kRlBlT2FKUGxRb1ZSNzJVSHRuRkVyQ2dBVm1EaVpKYVdP?=
 =?utf-8?B?TUxkWEVtamVZMkptMGRVWkR3V2ZYUEVlc2JWdTU4cEo0aVNNdFIxM2NNd3l0?=
 =?utf-8?B?dFBaL01MRlVJVGIwS0E5UXF5cGhrdkJvcnd2eDY4TWcxYjB4bWpBY2NncTJw?=
 =?utf-8?B?S0l0VmhkWkw3TUdWU2dJKzEyMzFzdmluRDRYZmNhdjVWK2xuU09FSUIxRmF5?=
 =?utf-8?B?YVcxcGFmN1VMdVY0NGJ2TkVMa0tjQnNCdGZXNktkYzVYQXZOeGZKMldJUStZ?=
 =?utf-8?B?c0RPQ0Z1bkhScWI2akVLaUR0M0tRcjJNZ0hqblFiQkwySWxycmxqaDQ2T2JY?=
 =?utf-8?B?RmJxOEZYSXhXQ3h4NDFSMTNseXVVeXZMekNCN2k3MGZocEVVR0hwZG1YQ1pN?=
 =?utf-8?B?d2p4UnZqeU9GMHZEU0k1TlN4eUlkVHE2Ymhkb2hkSDgwV2RMc3lnWHEvTEY1?=
 =?utf-8?B?UFc2UThYcTBZYUpGN3o4QzV0bGV1M2pLUTUvNko2Nm5lMDZMaU1xNm9GbmVU?=
 =?utf-8?B?MnpGdkxCeVZFT1VGbW9paldXU3JXcGhJNzU0R01WRkhURldYcFEvTzc3dHJj?=
 =?utf-8?B?aGl6MTBXQjFDRU5RREw0TUFuMnpNY2hjZ2t3NE1OWnhxMnlSOVphNm8wZFJo?=
 =?utf-8?B?d1RMUER2SG9HbUxnbk5ja3Y2YmhscC9VOGNrL3ZFOGZvNWlrVHZHT1lzNXZC?=
 =?utf-8?B?dU5ibGNRL0FtVCtoUFo0WmdtOXIwQldKcTBkOERsTUNBeGlWOFMxcUlUM2lC?=
 =?utf-8?B?bEFaTkFlUE5BQTJXUXZWZHFqY0k2VkFWb2REdnlndE9ySWpncFN0RjR2Qzk2?=
 =?utf-8?B?czlWMERiaWdNWEZ3VElMSE1PQ2E4U1lNb3pNRU01RElKR1FyN3poQTZmVVhU?=
 =?utf-8?B?NW9LT2tsMHJqZUs1N3ZBcGVmM0JIcG83Z0hsREpYcFY0M0ViV3ZOSU1CdEtX?=
 =?utf-8?B?bjI3dk1jdDZ3KzFSdUVnUFJCdnMyZXJGWGhCV0N2ek9RSWxSbG9DM3VrNFBD?=
 =?utf-8?B?YUlUNnhvNDRsN1hhOVZUQURZQk5sUDVQU24yVXNuSm82NDI2TjV0bTBaOFBU?=
 =?utf-8?B?UWpmaTFGeFNWVlMzZ3N1MlFKRSsyZmpmSlk3djBJaTdYQ2F0dEhGa0tJeHJr?=
 =?utf-8?B?c0JhY2VZRDR2d0pIU3N5OGVOODRXVUdSamh2bEljdnJtTjVyb0kybzNvNjZi?=
 =?utf-8?B?bXVReTB1R1VhOHkvUldJRzBZWFUwYUZNQ1JnbzFnd2pBc2RFTTN4enBlNXcx?=
 =?utf-8?B?elo4NFQ0RFRMVUhpN1VuYTZsTDMzRkRKTTU0YkV3bENqYkJlQVpGMmpkcTg1?=
 =?utf-8?B?S2VHNjgyQVFBdkF3aW85MW5pYnhTQVJZa2J5VGxmQ1lhYk9HVHpMdjA1UG1p?=
 =?utf-8?B?VTZzdFFJdzRPSURESDd2MlhReStVU21VdDFXdHAxZUxuRW5QVzByUWh2eDR1?=
 =?utf-8?B?cndhYUNJY0VDc3haVi9DbmJ5MTdsb1k0K3Y5VEtZNXNtNVFvQXQ1bHkwRmdS?=
 =?utf-8?B?cVVZQVZ6NUtQRDdvZGhEREJwOHVjTDZIZEc3MENaaGNqU1FaNWRFSStuVFRJ?=
 =?utf-8?B?cTZ4dE5ueDQzbkszM3o4K2R6SHBHS3g1ZGpxbmIzVzFqR1pGc0dXYkcrK0hn?=
 =?utf-8?B?VndDSHVUSks5THJDSnVXSW1NQ01PUStkU29ra25hbGlIS0RwZXE2NVhzVi9X?=
 =?utf-8?B?cnlQdlRtd1dmRkE5QnFvRytyeXVCQ2oxZDZuQ0xuaHVFYTJJTDhTOTZjNS9r?=
 =?utf-8?B?SHNwU25MbUMyalJxRnBkRGxqMWRuTGt6Mk9hbWFiUlZodCt1WGF0azlUMG1h?=
 =?utf-8?B?ZURxTFBzNGpWMktuSUtBenNhbUhsMVgrOU9XMHBZSmNzSHhRUCtZU2FiNjBD?=
 =?utf-8?Q?Gdo4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXNUcEFiUUs0M3lyV0tjNi9BeHhvdTY2Tnk0M04vdTNQTHhUY2dkSTRmbUtv?=
 =?utf-8?B?M2RwTDFkWURtU2NiZjZscytBWkF2Y094eFVndTFZM09VU3B0TlduZlJZQWwv?=
 =?utf-8?B?WkRqeGNpWUd3RzBtV05jemsvTUwzY1ptVUFLQXJ4bDdLb05wcG9XUHJRWkR6?=
 =?utf-8?B?M25qVDUrU0prcHp4aHYvU3JRK1NjYnBld2lOWEVvWWg3NCtYOEp3dlRFeHJ3?=
 =?utf-8?B?VUtENDZkUHp3eXZwbkRRc0ZhR2pMRjFYc2tmeXBnNWY1ZnZGa2oxbnlRM0FR?=
 =?utf-8?B?L0tSWEw3dEhPc3QrTVpjZVhYcVFRMDRuMFBtWUV5b2IrYzNqRFBDUEhBWGcv?=
 =?utf-8?B?VjRZOU1qM0pORkxhR0hDaE5xN3VLOVVXcStHUmFLTFp6cUpCVUtPQy9tS01L?=
 =?utf-8?B?Y0J1ZDRuTDJwQTdFbzlKaU1hTjdOL0s2T05XYzVrb0RpV1pFUWhLQk1vSTM2?=
 =?utf-8?B?YnBZQ2VBMnpTYVllWGl1WGRCMkZwMEo1Q05rVU00dm4reDY0TVRLT3dROUQw?=
 =?utf-8?B?UXZDVEZTZXFicUpMdFBld2ViZCt0NENIYVo2amtNa29INWZmaGJ2Mi9aR0pL?=
 =?utf-8?B?Z01sV1pOaHIyVSsxUkoyR1Q1d1M4aWhvaHVOVVhGcGFuM0NybFkvcFkxdWpU?=
 =?utf-8?B?d3pYd2JsbVFYSXNmbVdXVHJLWGR0T0ZIMTdjYkw5dDdFaUI3eXV3ZDRjUE5o?=
 =?utf-8?B?eW9CZm1BOE5xdkJnZmt0aE1FVTBUWmZjcTFTazEwemRvbk1ZV1A1c0gzR3Zo?=
 =?utf-8?B?SzVFOHh5RUJuU2hteU9YUUVIRU0yZGtHdTJiVVNBNkZFa0c2YzVTUlpTalQ0?=
 =?utf-8?B?WXNGbEhhQ21VMHhzaTFmS0NMbGRXNmF3MWRxS3hEdFdvRDNUUkJIQzlzYkRV?=
 =?utf-8?B?TlNRQ3BKdDhXWW5kZWdlN3pycXlJZWRRN1RjZVVQSEJSK2ptK09QWU80UC8x?=
 =?utf-8?B?NzVIZzZPbkVZWU52QzgwODVvUHRqZzJBRFpEeHg1WWZIbk9rZFlpeG4xaUtI?=
 =?utf-8?B?Q0M5eTRxYnlXODB5SUJ5QkNUbUs2c2dxdmY0S25jSWJOZFNRSGt6clNGeFpL?=
 =?utf-8?B?bUFLUTMwbkUvUThGenlLRmRXK2ZjaXY1OFk5U3lvc0hqY2NJVDJsb3BJa2Qv?=
 =?utf-8?B?eFFBc0JjbExTZU1wRFVIbjNoaCtUbW9peE5xL0RkdVhMSTBXNmNHMU9HQXBk?=
 =?utf-8?B?cVRSY2d1dEJoZmZmTDUyWHRqQll0L0FyS2dTSDNEUFd0WUhRR3Q4TnFjTjI3?=
 =?utf-8?B?Z3FQN0ZtVTNDTmY4OU5ZUkIyR3c1UmxtUmhzOTBMRkozYnJJR0toRXN2M3F6?=
 =?utf-8?B?UWJaZDg4TDZtOUs4TWsyNUZLTHBhU0ROMVNuanBMblJhWTl0Mk5PNTNleDJo?=
 =?utf-8?B?Zm96RGRuWDJucmR1YXZBNWlYL1JYYWhiM3JTaGJIUFg5WnA3NS9FUUhLY20v?=
 =?utf-8?B?WDA3OHFvWWZTd29IdlFZMjZ5bHhNcFVJVWxDMHRRbmFsNFZ6RXpTY0hMRVVC?=
 =?utf-8?B?TWFKeEdZOUhtRFlyUVE3ZDYwVlBEbTU5ZFJJb0hIa2FrcGlBV2x1Z0FpekVx?=
 =?utf-8?B?eTlmbXdIZi9BM3BzamlLeEFrYzRPTU5aMDM2UER4VEkwM3FFZG9JTWlkaXdx?=
 =?utf-8?B?b2o2d0c4QUFlZXo3R05SNE9hOFB4QnZSR3VGZ0MrTTNFR2lDT05GSFRxVmw0?=
 =?utf-8?B?eGlPZTFkUzR5dTZiOEp4cWxXam1CMDdaTmdDNlA5ZUxJZmw4cnh5ZHRieXhM?=
 =?utf-8?B?R2VYL2xEMGJ6LzMvOXhiQVh1cmpndjhRQ1lUT2Z3Tnd1U0F1dXJIckUyOWVI?=
 =?utf-8?B?dUFMZkgwVHBZWWoxN2NWV1VaY05GOU5QUTNHR2NENGdtY1dhcVU5OE5VRWtO?=
 =?utf-8?B?Nndsa0ZKUS9DVzFtcCszNFhDVmIvUEZjMVAyN3FQSUkyTTY4WVk3V0pNdklN?=
 =?utf-8?B?dzkxZ2NHRkp0SFA2RTVVZ3VuOFdCRnNYWld2c2VYczlXSDlOVnVuMCtCTTBl?=
 =?utf-8?B?aUhjS0JxR0xzT2hWcnc1TkhZaVBWSEZNUE1iV3NFb0hOVjA3YXUwaGVqeUl2?=
 =?utf-8?B?c0pWcHdTL0tQY2Y1TmlLQjVvZzBsN0hlOU01dzRkaFc1OGJaZFdNWmNNQXg3?=
 =?utf-8?B?Zy9yOG9CQmVVYWM3b2FyZGxESThWTDhmWitQTkI5bHlPQ0s1SUZNdnR3MXIy?=
 =?utf-8?B?UWpHcTFiVjFyYWxkSHBBQzFVWFdYazRicUtMYk5vMXVnWVZXY2NjemlxdnRt?=
 =?utf-8?B?K1I2bGJrb0R2N2Nqejh2UTR1SURMZzNnV0wrcjFObHlmS2RNQ2o5a2JTVURF?=
 =?utf-8?Q?+BqUe2cMfoXL7hufRo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4de8dad-7281-4a0a-1933-08de7446272a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 08:16:18.7962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PyGMgrFCInna8zCP+lWsaXeDVU6jfUKGIjOrh4E80su1iI5iOtA8WGfRinzyCRf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TAGGED_FROM(0.00)[bounces-53318-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 0EF66194228
X-Rspamd-Action: no action

Hi Bart,

On 2/24/26 18:28, Bart Van Assche wrote:
> On 2/24/26 12:20 AM, Christian König wrote:
>> Why exactly do you need that? Would a code comment explaining the
>> background be helpful?
> dma_resv_lock() has been annotated with    __cond_acquires(0, &obj->lock)
> and dma_resv_unlock() has been annotated with __releases(&obj->lock).
> Hence, with thread-safety analysis enabled, Clang complains about
> dma_resv_unlock() calls if dma_resv_lock() returns an error code. There
> are several possibilities for suppressing Clang's thread-
> safety warnings:
> * The least elegant is to annotate dma_resv_lockdep() with
>   __no_context_analysis and to add a comment.

Yeah, that is clearly a bad idea.

There are basically only two places were we have to ignore this:

1. The dma_resv_lockdep() function you stumbled over.

2. Some selftest we used to have which intentionally got it wrong to check if lockdep correctly complains about it.
   (You most likely already excluded that somehow).

Every other code should definitely have this analysis.

Is it somehow possible to annotate only the dma_resv_lockdep() function?

> * A better option is to rework the code such that dma_resv_unlock() is
>   not called if dma_resv_lock() returns an error code. That is what I
>   tried to do. There may be better alternatives than my patch.

That would be dead code which is never used at all and only there to silence the warning. That is usually also a rather bad idea.

Would it help if we change the code like this?

        ret = dma_resv_lock(&obj, &ctx);
-       if (ret == -EDEADLK)
+       /* Only EDEADLK from the error injection is possible here */
+       if (ret)
                dma_resv_lock_slow(&obj, &ctx);

Thanks,
Christian.

> 
> Thanks,
> 
> Bart.


