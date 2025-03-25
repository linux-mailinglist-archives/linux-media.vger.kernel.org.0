Return-Path: <linux-media+bounces-28683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD2EA6FCC3
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 13:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 782637A82D7
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 12:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A41B267F7E;
	Tue, 25 Mar 2025 12:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AY0ft4Z/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B3BE55B
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 12:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742905235; cv=fail; b=qleIYSVifJ/+BmswLyc9m1gFCMcIw+QAMPEnyQBfdvh/VC91eIr75YD/hL+f1kqPEVkJidZvx5gWPqVfwvrNGnxmB42CYVZ3ptXHQt5xJXhrpkVH1Z5yxScYLEO6Ot70sYKMsgghvmHz2Y7Iex+ChG9mieNftDchgMRuOI2Jrms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742905235; c=relaxed/simple;
	bh=NrP+8cZCwEhhf4FEkD/HjA0na3msVRtMwTtQzHM9GU4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GuRm35lOV4+SIzwv6IzWykEDfsh3dQWKnU1rW07FfcJacwB09CPVDjqokO+TCwOZiS8yv3ms4Vnb6c3LDgmUEMoONP6ct+jeMfJT7RUdJAwnszSkiLE4M4bsg9AXLEOUkWlrDvvBRu7B12f0STrfZIqJXLKbVXySHg3xuAVn31o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AY0ft4Z/; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742905234; x=1774441234;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NrP+8cZCwEhhf4FEkD/HjA0na3msVRtMwTtQzHM9GU4=;
  b=AY0ft4Z/3ZBjjU3Hb9E6lNWzHpkukV4/7W+FKaF3R6R2C82CZyI75wGx
   Zqk7MJELqCchiG1QvoVDaq+mVJRSlwjV8L1rdKXU1bb2R22dR9QTUP1g1
   M4sXqhyCndwSKNbgn5ogW2VnmtrEQ4VEo3a7GDWI6vGgZ9k9yW7BkCEaD
   7T5QBGlU/JXwSDK0s7e4ab8iE5Wy70A6rW72e7bTgWQFvCEuAcg6BXXCw
   FR1xmRPaTaFpvWAxybspiH2sFJGbeXT9iJO09V+vU9unnpSmdvCtP+nh9
   YXWJPKHvlJw7nFF8aYezJWM4z4hTxqTdfL2zWCjDcgsN/9FYIiueEEAZH
   A==;
X-CSE-ConnectionGUID: Un3HmgNxSs66bGwx3lXC/w==
X-CSE-MsgGUID: Rg9YMOqOSb6YglWmJq0QQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="69506574"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="69506574"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 05:20:33 -0700
X-CSE-ConnectionGUID: C3xP16GMQTumU6mkI4cMyg==
X-CSE-MsgGUID: LoF9GS5ESIWrPpzMzHLIaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="124318451"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 05:20:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 05:20:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 05:20:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 05:20:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxmZP5bl0TfAs+NlfPCmogHqw2ihmdhRf/2qAYdT7+HPSRUWCfus1Ph/APBSYVcG5A5AmIZj8u8os7LwDcGj7tD2u649KNlxe2MDkMtZniwix841IVCLphakuT3pteZSqo9lTDyHvV5WPUZvfzGtbHVPBjvSF9WyQ6TL9RA5IytrTK4BaLb8gUdjf+Tmu/QplxlsntvBqSeAmq2mMO3RvfX/r3eLDN+G5L4e0/7kxJc01gGoOksoRfGwi1XL8Yy2qCbwZ1veV1jnkkFwYd94T68mXew14MQt/XPpgCljaUamm6eQkYGUT5rGJCLF1SMscsuxzo59uyfZz42WtfuNwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrP+8cZCwEhhf4FEkD/HjA0na3msVRtMwTtQzHM9GU4=;
 b=jEb/8e/B7hAQM8SI5oeuTy9z5kKLlsz7/SAMu0LS3Floza082hJwfNxG/m6kAR4vXpT2lmeOZXvkWObot8Zn5C+Ks3rgt+3aumZWxXslybJlReUjMrmH4oZPCTQswRlx7tl1ABuxNN/3GrGmNp7NRpDdoBsRMy6l6nUNHEkt9tI3aNDJphy9x9QlT/q2V0aTGEiGJ8NrGQvu24dwRwHTDPqDYm2Wlw5tgB5A1WjubXvMqF6+hEQ4MJquWcxXNUQuv/YrLsDKPmRIbf5WxcaBiWSblF23xEILtUvKU9O/Ke5D3u5zRw4EUWdl2VIrE5u0NeuXYoNdD+wqAs980s67zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA2PR11MB5131.namprd11.prod.outlook.com (2603:10b6:806:116::9)
 by DS7PR11MB7739.namprd11.prod.outlook.com (2603:10b6:8:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 12:20:16 +0000
Received: from SA2PR11MB5131.namprd11.prod.outlook.com
 ([fe80::6519:dade:ea33:942c]) by SA2PR11MB5131.namprd11.prod.outlook.com
 ([fe80::6519:dade:ea33:942c%6]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 12:20:16 +0000
From: "Hu, Jerry W" <jerry.w.hu@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"libcamera-devel@lists.libcamera.org" <libcamera-devel@lists.libcamera.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Kieran
 Bingham" <kieran.bingham@ideasonboard.com>
Subject: RE: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Thread-Topic: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Thread-Index: AQHbnXClKc33heq2W0WbuJw9uX1w6LODxO9A
Date: Tue, 25 Mar 2025 12:20:16 +0000
Message-ID: <SA2PR11MB5131A5274209B90423488089D3A72@SA2PR11MB5131.namprd11.prod.outlook.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
In-Reply-To: <20250325102750.GE20035@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR11MB5131:EE_|DS7PR11MB7739:EE_
x-ms-office365-filtering-correlation-id: 67dd0998-e6c5-4121-1337-08dd6b9766b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SStjMnlPZHJqeW5nUEY0YnF0OGtvbkdhWXh3TEp3UG1rNE5NNDlTaVY5N1hM?=
 =?utf-8?B?aCtyd0hyeDRycjNWNUR0Y1hJdEtYOVoyWDczTi9zaDFVU2diZklhREhRNnVS?=
 =?utf-8?B?RmtleENHb1M4Qjg3VXFoZHdEVFJLajB2ZmE5YXJoaDUvaldDb3BRS1BUc1N6?=
 =?utf-8?B?YlJIb0liTlprYWd4VFdCdFF2UFFJRzRuU1FjR01DaVZFdVZ2RFkyTWoyQWRH?=
 =?utf-8?B?cmpQOVhUWllqTGRkS1k1YjdwWnoxa0dyNmtvcmNsaUV3WGVncndDa1FzY3JC?=
 =?utf-8?B?TlM3dVVhWW5mYjZ0YjAza2FqMTI2ZkVUY29nTFBUREZncVVvSjllQ2p5T3BF?=
 =?utf-8?B?NnZJdzJyMTNWYmxrMDZIOCt0Z0wwVWNMSDdTbEY4OExncE5GdEdjV3lacmd6?=
 =?utf-8?B?RXZBR2dEVzh4RkNZSlA2ZVk4TnhuSldKZDE1RXhtSWtrZ2pkb0xuVUM4VVFr?=
 =?utf-8?B?S0E4QkZCUk5aN21ydzFZWXhBU1hkZ2NjQXQ3a1UyK1IvTHBQT1U0TzVtOG9w?=
 =?utf-8?B?eGFKaVdUTXFFWTJTRzlOVWlpc0xlSE9PK1RGaFdJSEJrRkRQNG5ZMjgzbnpJ?=
 =?utf-8?B?SXlwTWRNUVRXbEcvbXhKbkx4SzRETVYvdjRVNnFZTk5jbWJ1OTlGek9MUnlB?=
 =?utf-8?B?WTdLS1V4eVM3dHdaVFp1bHFnUm1uVFJER0lZeG52WmpIWUp5cXIzZ0s1YjZL?=
 =?utf-8?B?NXZBNDRMVkdkSFI5WmRQempUN0dlQ3cwTTFKMVRQVFFVR0ZBVzhlQTExWDJx?=
 =?utf-8?B?WmhYeVFCaG9oekhLdjI4U2daVC9QbGFmNUt0Tm8zUXU3MUtlaHlsQ1RKc0Y5?=
 =?utf-8?B?QStvSHFjVm9XNWM0LzZWV05ISGliQW9JRWI3N0k0WDBhTzRJWm5Zc2dtSElU?=
 =?utf-8?B?Tkd6S1ZGQThMdUxhL0FGWHV0K0YxaUxwVm5WZ0lzUU1KMER5a0ljTG1ZaVNh?=
 =?utf-8?B?ODljZE1BZE5OMmFndjR4cFBMbi90eitDS2JvNGZEUk02UnFEdVRJSEM3aWdN?=
 =?utf-8?B?UnpUWDJHOFlDaFNHMkgrNXFZbFVDUHk5T1EzWFk2VlVuUmlzWnkraGxFQTF4?=
 =?utf-8?B?L1Vycm9KREkyUGVhbitZSGMzOS8wMHQ4L1JuVHk2WTc3MXhtVFBlK1hrdnIw?=
 =?utf-8?B?LzJxOTNNcm5UR3lwSVc2bXd3d2w1NWJFeVRZZjlXSTNtUyt6NEw2b1NwOVpl?=
 =?utf-8?B?aWFvcVJwSUYyMWdwS1pUMnVBeGtLZ2RaM1F2aDF5cDZkN2hqSVpoSit5d1VG?=
 =?utf-8?B?LzNPWEVpWVJVRkhjeUlJVHF2NVN3STI0eCsvYkdUbi9jS2d6dnZnSC9ZaVk5?=
 =?utf-8?B?dHBGbkFxSDA0bytmOG5vM3pzUWo1Q1RxcWd4ZytOZUtFZTNWTmlqY25vRThx?=
 =?utf-8?B?NmlDNGhxakFzMnZPbnJqSW1FYmMzaHNwbUMvbml3Vk1RRHMyR0FXMXhNT1Zj?=
 =?utf-8?B?SitWSVpxS1dPeUdtOHVEQUFuL2hxUkJEK3hvRzZ3WFR2MWZUSDhlRlNSdHZh?=
 =?utf-8?B?a3Z5Tm5tSWwvbTl3YVYvS1h3YU4wWWtLMzVPelJDcEpjRzRXTzU4Q1RIdWRW?=
 =?utf-8?B?Z0JncTFzbmJrN1VIV29iNFRZREVnbmpRMHMvT1JiK1NKTzRZVEhpOTMvOUR0?=
 =?utf-8?B?M0U1VkNqWmtBaE13UFBORmZkQzNYRDNxTWhtcXQ4c1FxMkJBZ2svYjVTQ0VT?=
 =?utf-8?B?RVlIeFIvVzREZitER3FHeVpIUzdEcnFObkJJWXBsa2VqQUhNTVRzMzVlMEF1?=
 =?utf-8?B?bnRsM1plQjhOWTJpTXFjeFBFa3ArQlhqWW1Ob1FlL3dKejRFMldJT050Ukt1?=
 =?utf-8?B?eWVhTUJjTTFCcVlFVU8yenBiSEIxSm5ZamlQb1ZmV1g3akJVN3NyZHZINDZ5?=
 =?utf-8?Q?AseVgQiAUAlRY?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB5131.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUg4Q09mRDlwemRwWDVmZi9pT0Y5dzNkNHk4aUpFNGpxU0dxOGd0bUdLUW9Z?=
 =?utf-8?B?T2JhUTI1SzIwSzY3L0JiVUZBcVZmWExxdmtlNFFoamZnZnVjejdzbjYwbVpQ?=
 =?utf-8?B?L1M0NCtaL3FIUzA3MExtMkl3ck1KOEpFMTBIKzQwZWNSSTZ1dlJWT3RsMEZX?=
 =?utf-8?B?WjZyQkxmazV1S2hZQ2IxbmIvVUw4SldTZWIwL0EyRkIvWGhBQTJkMzlYRGJL?=
 =?utf-8?B?Vk9aa1A2M3ArYXRWTG52SmxXK1dSY0VGa2ZLa3NqSnQ3eW5yMXNIVncyM3hT?=
 =?utf-8?B?ekR2dHppbzZlNlcwOXJwdThQRHIxZ2YrK3BMVEFPRHZiWXlQbWNaWHVZYXlo?=
 =?utf-8?B?cUo3dWNHbC9jalBYQ3JpWHdpNzBDZDRkblBoMk42RUFvendPQWZMSmhmdzZI?=
 =?utf-8?B?cE8xM3lWYVB1WWZ5NFg5WTRiL01BVlc4OFUva3MraCt4cVc1R2ZWc3pDSlNR?=
 =?utf-8?B?Q3huVmVNOTFROTRKLzJpd0FtckNGK2ZOdVlMK2xBRk4yMjFodTQ2RTNmU0JL?=
 =?utf-8?B?dHY1eWtvZEtXeG1IMk5Rb25TM3VNQUNyTzB4TmtHQWt6MTN4Qzc5WFRTM3Qv?=
 =?utf-8?B?UkhuRVUvSFM0bGNQV0ZFUlV4RG5MMEVhVUVuMm13TGhRSk5FSXJkaW1WTFVV?=
 =?utf-8?B?dGpEN2kvRC9kQitHQXBBVmJoUVpRT3lWYWJvNlJMZE8reWtBNGVXelRaWmhj?=
 =?utf-8?B?TVArWUgyNHpHR1NnNTk0STN0VEVEc0d4R3RaSHZYYkVqT1ZjN2UxT3VpK3ds?=
 =?utf-8?B?Mld3TjB4dmRrNVRweGEwQ2M5U1VLREJUR0lMNTlodHdXWUUycGtrVGI5UjIw?=
 =?utf-8?B?UjdZYm1kS09RS3NCcEwwOTU1eFhPbXhQcVBuckg4TVJWRFc2RE1PYURSRjZz?=
 =?utf-8?B?bzZaaC92UEk0Q1lWZFVmMHRnS2VSNnF2Q0pCOWxjSlRleTloMHRMSElZSTZZ?=
 =?utf-8?B?aFg0eG1mLy9kSmRYaEtPd0RlTVNTV3ZZUlBiYUdkOUJ5QnBTdmN0TTNWTXph?=
 =?utf-8?B?OVVtRzVHTWlOT3VSNkpMdGYybmVybmttNVVxdnU0VHIzb3FvdjJiYXZ1MnY3?=
 =?utf-8?B?L1ozNDl6L0FhRDlSNEh2NitOQzFNaGdma3ZKTnBSZTA4a0V5bHlPQy9vR1I4?=
 =?utf-8?B?L1BRYlVkNUJ5SXRzQ0M1MWlZdm5hZEpJbmlwNTg5eTF1VGUwcGlGeUxhZXVk?=
 =?utf-8?B?U2FyVUovWk1JTnR4dW9pSFB4VFhrVzRBYi9nelZ6bkt6a0o2RlVZakwyZ3J0?=
 =?utf-8?B?QzdwbjJkNWtrVlBMWDJsSVE5OTA5VWVXYnhTQVNEcEVmZDQwSEVZMVczcE13?=
 =?utf-8?B?TGEzK1lUdjBQZElYa3orSnBWeVF5SVErdHZ3KzV5V3laeXNUUFVYSnZKRlVo?=
 =?utf-8?B?b0RwOEl4OE5QZGV0NnRFU1dIcjlINmFVUnBxTVozYk5vdWdVSEpkVTdOOWlT?=
 =?utf-8?B?dHJhMUE4RkVyOHZVUEFGRmFnSm9lY0lOVEdNQmRZekk1UXk4REpxalhpY3E1?=
 =?utf-8?B?VFdGRlc1QXA3M3ppWkN0MXpXaTU3L2VEUnUrNEg1R09DTkxLbTIvbGtBbEFp?=
 =?utf-8?B?QnU1OGNwTndOR3NvOE5ZejFUNUNjTDJscW5LSUN1VEZlRVFIMVpzcloveGZn?=
 =?utf-8?B?QUpML0IvaDNZSlJQOGN0cUI4azI2aFRkRUVUNUsyVG5aNkdZa012ZDZENm9O?=
 =?utf-8?B?VWp2VGlhMzRpaUVxSEtpY05aazJnQnhCRzlrQkFuNjdyL2ZPd0ljL3hxR3BK?=
 =?utf-8?B?ZjVjMUdGNHpJUjhHRHROSFBreHRpY1pyeUtZVVBycS9NNUt0czJnNUljSC9G?=
 =?utf-8?B?OG1JVXdvUU1rbEZWYm80Q2doUEZkai9iY1NDaFl3ekxoakRkNjN5M0N2alU5?=
 =?utf-8?B?dXZ2VUswWC9ETDg0OElHTnNSZzd1cVFKY29sdkZrTU9tM3FieTlQa2Fnajho?=
 =?utf-8?B?Y3UyRkdvWVo4b1FRRHcrWExsUWRPNTFuUVNISk1ReTYzWUtzZkV3VXdHd3Ex?=
 =?utf-8?B?OVNWeTNpMTdmSkFCRlJ6NlROYXI0VGZjejUxV2hHWTk5b1dJTWtHdUt2Vy9m?=
 =?utf-8?B?amhwbmFRNm0vRGt0c0U5cXhldGs1TGRFYmQvY25xUmtTRHNqOUF5L1RXZGFR?=
 =?utf-8?Q?gnFZEaHNl4wtgArw1MGDzWPdH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5131.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67dd0998-e6c5-4121-1337-08dd6b9766b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 12:20:16.3486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Grr0tT0uxZspLmai7wMGafrof9fl6vNJdvOYUY9I1Tf4WMTEPMekm/OivnPB2ckvcBtgPDBbrM351cbzPhKSdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7739
X-OriginatorOrg: intel.com

SGkgTGF1cmVudCAmIEhhbnMsDQoNCkkgd2lsbCBqb2luIHRoZSBzdW1taXQgcmVtb3RlbHkuIFdp
bGwgdmlkZW8gY29uZmVyZW5jZSBzZXQgdXAgZm9yIHRoaXMgY29uZmVyZW5jZT8gDQoNCldvdWxk
IHlvdSBwbGVhc2UgcmVzZXJ2ZSBhIFRvcGljIFNlc3Npb24gZm9yIG1lPyBJIHdpbGwgdXBkYXRl
IHRoZSB0b3BpYyBsYXRlciBvbi4gIA0KDQpUaGFua3MsDQotSmVycnkNCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IGxpYmNhbWVyYS1kZXZlbCA8bGliY2FtZXJhLWRldmVsLWJv
dW5jZXNAbGlzdHMubGliY2FtZXJhLm9yZz4gT24gQmVoYWxmIE9mIExhdXJlbnQgUGluY2hhcnQN
ClNlbnQ6IFR1ZXNkYXksIE1hcmNoIDI1LCAyMDI1IDY6MjggUE0NClRvOiBsaWJjYW1lcmEtZGV2
ZWxAbGlzdHMubGliY2FtZXJhLm9yZw0KQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsg
S2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtQGlkZWFzb25ib2FyZC5jb20+DQpTdWJqZWN0
OiBbQU5OT1VOQ0VNRU5UXSBsaWJjYW1lcmEgd29ya3Nob3AgMjAyNSAtIE5pY2UsIE1heSAxNnRo
DQoNCkhlbGxvIGV2ZXJ5Ym9keSwNCg0KQW5vdGhlciB5ZWFyLCBhbm90aGVyIGxpYmNhbWVyYSB3
b3Jrc2hvcC4gQWZ0ZXIgdGhlIHByZXZpb3VzIGVkaXRpb25zIGluIFBhcmlzLCBCcnVzc2VscyBh
bmQgVmllbm5hLCB3ZSB3aWxsIG9yZ2FuaXplIHRoZSBuZXh0IHdvcmtzaG9wIGluIE5pY2Ugb24g
RnJpZGF5IHRoZSAxNnRoIG9mIE1heS4gVGhlIGV2ZW50IHdpbGwgYmUgaG9zdGVkIGJ5IEVtYmVk
ZGVkIFJlY2lwZXMNCihbMV0pIGFzIHBhcnQgb2YgdGhlaXIgd29ya3Nob3BzIGRheSAoWzJdKS4N
Cg0KVGhpcyB5ZWFyLCBvdXIgd29ya3Nob3Agd2lsbCBiZSBjb2xvY2F0ZWQgd2l0aCB0aGUgUGlw
ZXdpcmUgd29ya3Nob3Agb24gdGhlIHNhbWUgZGF5IGFuZCBhdCB0aGUgc2FtZSB2ZW51ZSAoYnV0
IGEgZGlmZmVyZW50IHJvb20pLCB0byBmYWNpbGl0YXRlIGRpc2N1c3Npb25zIGFib3V0IHRvcGlj
cyB0aGF0IHNwYW4gbGliY2FtZXJhIGFuZCBQaXBld2lyZS4gVGhlIExpbnV4IE1lZGlhIFN1bW1p
dCB3aWxsIGFsc28gYmUgb3JnYW5pemVkIGluIGEgbmVhcmJ5IGxvY2F0aW9uIG9uIFR1ZXNkYXkg
dGhlIDEzdGggKFszXSkuDQoNCklmIHlvdSB3b3VsZCBsaWtlIHRvIGF0dGVuZCwgcGxlYXNlIHJl
Z2lzdGVyIHlvdXIgaW50ZXJlc3QgYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwsIGFuZCBpbmRp
Y2F0ZSBpZiB5b3UgaGF2ZSBhbnkgZGlzY3Vzc2lvbiB0b3BpY3MgeW91IHdvdWxkIGxpa2UgdG8g
aW5jbHVkZSBpbiB0aGUgc2NoZWR1bGUuIFdlIHdpbGwgZHJhZnQgYW5kIGNpcmN1bGF0ZSBhbiBh
Z2VuZGEgaW4gdGhlIG5leHQgZmV3IHdlZWtzIGFmdGVyIHJlY2VpdmluZyB0b3BpYyBwcm9wb3Nh
bHMuIElmIHJlZ2lzdHJhdGlvbnMgZXhjZWVkIG91ciBjYXBhY2l0eSwgcHJpb3JpdHkgd2lsbCBi
ZSBnaXZlbiBiYXNlZCBvbiB0b3BpYyBzdWJtaXNzaW9ucy4NCg0KVGhlIGV2ZW50IHdpbGwgYmUg
ZnJlZSBvZiBjaGFyZ2UgZm9yIGF0dGVuZGVlcy4NCg0KWzFdIGh0dHBzOi8vZW1iZWRkZWQtcmVj
aXBlcy5vcmcvMjAyNS8NClsyXSBodHRwczovL2VtYmVkZGVkLXJlY2lwZXMub3JnLzIwMjUvd29y
a3Nob3BzLw0KWzNdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMDQ0ZjJmYTYtYTI0NS00YWU1
LWI5ZGUtN2EyZTg4MzFjY2Q2QHhzNGFsbC5ubA0KDQotLQ0KUmVnYXJkcywNCg0KTGF1cmVudCBQ
aW5jaGFydA0K

