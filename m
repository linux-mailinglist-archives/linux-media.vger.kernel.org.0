Return-Path: <linux-media+bounces-58182-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Oz2B2Xq1GkjywcAu9opvQ
	(envelope-from <linux-media+bounces-58182-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 13:28:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B422E3ADAEE
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 13:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0263B3004934
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 11:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A603ACEF0;
	Tue,  7 Apr 2026 11:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7IPLEfN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AA53A2543
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 11:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561312; cv=fail; b=rNJB7+Em61vcmHnMZB2UNSC0KfFVY5U/YpPXa6b1ELIevu15j0jsZ+lmU5sM2K0o/MeFx/bRSPosf+/mqDynnAfETSOA+DmIiMEY6keKKJg0m/z81irqP0pVbmC7BZ3tXegTti4S1aI90Kf59e03sSbqYQn4qLGgb76QZjGhWVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561312; c=relaxed/simple;
	bh=mGKWclCmd4UUv9q23fs/wqW6UE+5Ysc6lb7OejlMaG4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PkxkS5noxRIp2BfHB2lVRDKIHge20nkOtudYeh5GV/PDZsRNaPSEnEILbjPOM4GUBtzOmCvSGYvWXSZqG5xvBSzsQOp+t2sjVrSY7sGfIEvqgoJJOqaoTrYq/WKsJ/6FRgxt8IROt6S95i+DabjQs1Gqtg/ShBejekeD5clwK+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7IPLEfN; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775561311; x=1807097311;
  h=from:to:cc:subject:date:message-id:content-id:
   mime-version:content-transfer-encoding;
  bh=mGKWclCmd4UUv9q23fs/wqW6UE+5Ysc6lb7OejlMaG4=;
  b=G7IPLEfN3XO2zfPj9gh4z/l7TlEdUTHFh2rd1l/BRWWvTlO6iZlSHxuI
   uvni/f5XwQxUF2zcSmleSRHDPnssZ+hsdPlm9/cHnKoi6vzjTzh2i5CAI
   W4/RK5s/r936EDeB6atFrlMRoP73LT18HaCxU2zzhR0HhVI3UAtDHxXOz
   EGyF6+ueTdLpJ5D5/5kbfjwjwkxh5BLgA2MQ3O8jY7oFdRA7F9x2lJDk0
   xmPzaWnmU5KoKE4FFurFMjC6UMUA7ESaMQ/dJIbw3MDhdwrEEDg/2obvd
   96Tvv9W99IzNkBQGOGI3UzvjBoem2OkYNyCOYW+VfiYF/QNsmxDWXAZ+N
   g==;
X-CSE-ConnectionGUID: KvDtvyfuQXGQAdf/D4RQ2w==
X-CSE-MsgGUID: y+tqkJ84T1WTVsw0VwpBRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76533618"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76533618"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 04:28:30 -0700
X-CSE-ConnectionGUID: oicCDvaJTdCXGbSJy1fq0A==
X-CSE-MsgGUID: spMciqncTdeJiBAY2QFG5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="251439413"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 04:28:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 04:28:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 04:28:29 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 04:28:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d91fQiI12RJWrsPw3qBTyHrE/XpGYt7PcxTdgydoT17ozj+XUQzwOdZf/46nJG+1LT4gITFIRXPtU2WoFxwFnxsp6MBgkmLYdn4fe/P1UMa9ZBOZF5gVn37RFv0rMZEQTNyrVIQAmGGU8koNhTuKr0y+F4eW0MmRi5TZLSXy0b3D+EwKISkNlVO0OcZC51BaDvEjcijvMNCwCWGdDQwNX47aEdREQquAt4AQ0rsj5/3h8RaUPc3k2OUbQPQGkfmPBFbDPwIIqh8wreHx32A0gEVQqRG4F0xtBDYV+1pKzAL7Cg4c3D80Gugz1o3dijAUW2GrSFsMnIfRsAbhvLRRNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xd9qLkGMJGWHJR8FE+l4XtZGl9WY9Lr/pM+cgYoKvU8=;
 b=DRj4Y7Tg4W4g7yzTkrkzAVPl3QTpTE2/srfZyqNsfsh07ypKmVupoY/pdY8oFQ4D+gUzWb7HAfJjedSRYPf62CQjRuPCJU+FkFx7IHg3psJjtlDp5bDF7gc+N8XnuYKs6dSDknwWInk1E/3Axx1Znu45uiuL3FYGFaKUAbzGvSjYGE8DEUK4MYA8khwsLuf0v30C/pNWBYHI+ijq50zOVn2uRERUsYvbkJmN9E9SGUh8AiJX1BeRM1dtVYeyesaYSLs+BkCDSjOahyXvltfiYlOf4FjGBTLlrtIDtkV/J/SqXZv3K2vxda98R+Npln30rFVAtcWO1gZta2Xj9HgiPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) by
 SA3PR11MB7413.namprd11.prod.outlook.com (2603:10b6:806:31a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 11:28:26 +0000
Received: from DS0PR11MB6445.namprd11.prod.outlook.com
 ([fe80::1c26:34fe:2995:253]) by DS0PR11MB6445.namprd11.prod.outlook.com
 ([fe80::1c26:34fe:2995:253%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 11:28:26 +0000
From: "Krzysztofik, Janusz" <janusz.krzysztofik@intel.com>
To: "christian.koenig@amd.com" <christian.koenig@amd.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Subject: Oops: general protection fault in dma_buf_put
Thread-Topic: Oops: general protection fault in dma_buf_put
Thread-Index: AQHcxoGmOqIxrTsmVEWTur/yEnhfZQ==
Date: Tue, 7 Apr 2026 11:28:26 +0000
Message-ID: <68595b2ceed038074f5fe0a5739d75aafbcac8d3.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6445:EE_|SA3PR11MB7413:EE_
x-ms-office365-filtering-correlation-id: 7d110805-59b1-4ffc-54e4-08de9498c95f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|42112799006|1800799024|10070799003|376014|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info: x2PQv1HiR1cXX95BWZZP12REgX6X2e6bCQz2Ozg5V3gjhnQ4oAiB5l5PYvDrUlmaSxHfE1Ru+/mpIrnj3LQYkggYgbQX0ATqrj8q9Mr/IqQWs8WnTI4Z87NSYVLbk5t8Utz/1eG+CTa6aR7b+MPos2cIuvs7yfWxoylOUUI3dcvgfD0Nus1Vxdb2HJ2vHGZN0YEyLu8Kz6EQg3WIfR+Jhr3bIjP5A5yOMY7OeI/sxDHFD+nC6dxrDa0JfbVPG5mG+sqcmVmVN9VPXhn/RK3+AgVzdCadDsIoFG+m3MEbSoHq+WNINsr4bzg+tIgi18GMvB0Q/tbmqip02BC/HSV2fk1sNS8fcUuIlQZh7o+tx9W9AD5XMrCPOzp24Wp184c6E2bzudT0teVbqTelDt+kD3wpSVev31VnN1zwdW8h5a3wwX/gG4OfsBqb2aoA2q8T0TiCf2EynOt63ScHY66QMo1NHoMbK4fNeysSrGUEpwYYbsPCRB46TDHKRruHD1HhWg04XC7TWs2E/5DwYwVKyvyoQZ4WQ1wZ4PHe/8nOw0q+vgT0aft5NL+xpnQI06c86aRtqXZCIBnpg7x/9wJyiZdc2+rUqSpqB9C7FJ/ES0HOZSMfmRF7jgsjcfFHdEixUGn6S1Hvz+q2+LRKUm268t+RLTjVmgPRHw1/ut5t/nsmTomUBH6Wy7poyhNXDpfykughE7NzXDoXMX2S/wCxg9cvpH5QZOFwJ195N/ti3bo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6445.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(1800799024)(10070799003)(376014)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnFuV3p1SHpqcm1jcERhMUFBWFkzcytWamY4OVhFSDNjSDVOekNFYnVONGFl?=
 =?utf-8?B?L1laSkVKcDFIWmZ2SE9rM3Z1Vi9STFNRZmRxOWVFNmRFLys2QS90d0JRaHEw?=
 =?utf-8?B?MGJmQkJJbFNoQlBZNFRvSDhDM001NWhsUEhjWEkzYXRRM0J6N2cwWWFybUtJ?=
 =?utf-8?B?R1dQeDBiTjZRa2RJSll5UlBXYURhTEExSStGVmFuMWhSRS9XYUUrMGl2Vk1O?=
 =?utf-8?B?TUc1aUdGa2FzT0haMjhEcGVidW9OL3hPNnFabWc4R2ozVGxSdjAyVUxBWGY4?=
 =?utf-8?B?eFhLaDZwdGswMkJoTXR4MkFSSHlpdHA4YzNIY0RiUjhrQkxhQytZYTA4MFlj?=
 =?utf-8?B?K3Y0VWc1ZkFzRXJLZkRMVE5wby9rRnROTUVqeDVUd0wrL2psK0EwRG5uRDlr?=
 =?utf-8?B?bUtzZEEzV0h5STVkUzNhaUVHbkJYYmtHNWpTaGU4bW1OSk1TekcrcTkwaVJZ?=
 =?utf-8?B?NmpPZDFtbGcvRzJTa1JIWjB3NzhUejBkaEJrc0dQWGpua1hKTHphd2ZxZ042?=
 =?utf-8?B?eVhjeE54bXpQUURCcHIrMXJtWkZVa3A0c01kNjdRMFpqaDhFQVZIMDl3REdv?=
 =?utf-8?B?bVdWVEpWNURBc3pKZEUrNG8xN0J0WjkvTlc4SGMwbmFKSHpzSXZDd1A1YlAz?=
 =?utf-8?B?U2tBR1N3aGFtQWthVDVwWS9Rb3l4OE03L0ZHRnhrbGtpd1BuWHNLTllMVFZj?=
 =?utf-8?B?bU9EZFZIL1dSaGlGTzN4Qkl5TFE2cittV1I2UTZBNUFyYjE0Rmlsd09GWU85?=
 =?utf-8?B?OG5ZOHhsc2pLOXRpb0tUYkVZV1dHNS9lRVJBaFZHQ0VSa3VEaExNWEIzSVRa?=
 =?utf-8?B?N0Z0QTJaTEdjazhheEVUWFo5ZlBoVXlsanp4ZzhZZGJqeUhWZjBVZ0hQZ1R2?=
 =?utf-8?B?RjI1ZGQ5dElFNldrYVRoZVF4NGc4QnViRWNweHpTQmZJTCttaHdvc0FyWEor?=
 =?utf-8?B?U2xzZXlDWXZLMTRsVWhWK1d4UXBtTGZyZS8wa1UzdWd4NUNzRGFuTXNJVHl3?=
 =?utf-8?B?RXMrdEE5K0t1anZiYUpRaklySEJXaHR1WTUrTEdaVFZndUJLOERTZFFBU3F5?=
 =?utf-8?B?QkF1ZGRrUTRSaDVlRlluV3R3TEpvcmZSQUVlQmlDSC8wM1dhdmhzcWxCS1VY?=
 =?utf-8?B?bmhjY29zeGwyMmFtK2EzMkVhTDBDV2NNS1cxT0V2QnU1VVpCLzFPdEdyTVdL?=
 =?utf-8?B?SzBlUWllWW1XWGtVaTRra0ZsZHdQcmxjTTNHN3pxcVBEMW53U29GVVBTcUdY?=
 =?utf-8?B?OUlLc2VZUHMySWtIeHBwRC9hUEFTWkJ3dlRwczQzNFBEL1ZoM3ZQWEVTNUtL?=
 =?utf-8?B?UThDbW9FMTQxZ0ZFWHJtMHdEOHdMWWtLb0dndGIrYVZGTEt0bWpFWERLZGVi?=
 =?utf-8?B?TlZtd3gva0R4KzNzK1VtNVRMRkMzNGxHSC9VSzhOdzh5cE9YVGJ3MlF6NTRT?=
 =?utf-8?B?cDYvODJ4M0FWc2g2ZmIzUzN1L1NUNWZSK2QzT1BoRXo3eUtnRjduR05tNEZn?=
 =?utf-8?B?MWZ4VURLWlY0cmJYYStHekpGNDVRU1U5ZkFzTDYxUEMvQS9weEZDVVdKdnBX?=
 =?utf-8?B?VnpPZVR0c3g2QzdUazloVGxTL0NxTHE1dHlycFVoZDl5eU0zY0dHdjFKV005?=
 =?utf-8?B?K1RNTmZLQ0NQS0dUY1lIN1ZBYXFFU2c1bWl0bHpmSVpaSEZONjhZb2Q3NUtM?=
 =?utf-8?B?ZmZaRlRYdm9aVTFGeXJvc25XK243UXE0SmhYNE5icEZINlZrclA4eDduUmlk?=
 =?utf-8?B?MWRWdDJvbXBrVG1XZjZ1WVVmSVBrRW9FOGlUdXVxRWphbHFjcTgzZHdBalcy?=
 =?utf-8?B?VVpMZnNTNUV0RXRlUHgrV1VsOHVGbEdtT0trRWNQb0k3S3RPeGs2WktXOUJR?=
 =?utf-8?B?eDVzaFpGMGRwS1ZQMU16RUtkWTJDUFM2WmJMNnk0cGxyRU1TdEJKdWs3aUlR?=
 =?utf-8?B?N0oyNTJTY0JZdmQ1cEo4N056NStRbUYwOUVWazVkbUZuU05HZ2ViN1U0Ly9s?=
 =?utf-8?B?OXlHWURYT1Rwa3IvZkY5eDRXRXBUbUpEL1p0S1lMbXYwS1BYN2lkaVI3N2J2?=
 =?utf-8?B?TjkrbURkbnNqMVFNSmZ2UHlnU3NpTzA0VkxSN3VGSm1pUmhOMXBVcXJaQ0dL?=
 =?utf-8?B?TERhOUhJcXVOSXpZaEZDdEZ5RFNuZmx2dWZiamFiTW8wRFBRQkRmNm5CczJq?=
 =?utf-8?B?WjlhOEJFTEVJb3lSRDVCQnFQTjlCdVVFL2M2YUhBejVQSWtHZHJjUmt4b0lJ?=
 =?utf-8?B?TTRDWXM3dkhJMW9ENXNnQzF6c0hDb3BnTnV1R055Z2FxU05qMkc3c1ZGS3Rj?=
 =?utf-8?B?SUF0QzFHamxDMHBwTVFuYVhWM0ZFZXRkcVNCenh1N0lOT2d2MmtuMDh4WjQv?=
 =?utf-8?Q?+C5CkLf25TcqbXDpv4hB7i8q3c4e1NmnvgSDICxI2Wz/l?=
x-ms-exchange-antispam-messagedata-1: TfIUsIfbEtChOg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <110852FE47AA4F4FA953D6F37257FCF4@namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: grfbQCH0DHkth4k32vy+I/9lgvCUVRpXlyDJWsEIVDGvQaKhcCowW0aBdgT2Nav3FZEcVGUjFqER2OTy9iG+uGRTOvcyiKu0E2ePiiIHRbaeyRa9ooCopMePjpkeSGenrMrm/CNH3yww9jya6Ykh0u4AiX+AaH/ikkDb9nsF6In+p71rSmee6IKcIjWE6K+XDSbD2HK6H1g5jTTXY6JHH+ZP68UP7kcjYH6bFx/GvdXpsdYTJGYfM8XjWp3FK6goiMkJnyAncm2E8ekdrhfWU5qsiwdcis5u//PxgTqnK8h+BiL0aVJD7klyc7hb46d9MoYIlXa6RRMdP1+sJBnQ3Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d110805-59b1-4ffc-54e4-08de9498c95f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 11:28:26.7081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l3tEc7S+u/QZ7Afu1XyyjS0dRAlnySRpl7h+EOBZbhodJxrr/XdWPqwjxD7XpUAYiaV4SMYgZ+9z09LNhF/JPMNr0Xzaqv2mxzG75KxkLAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7413
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-58182-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[janusz.krzysztofik@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B422E3ADAEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

U2luY2UgY29tbWl0IDI4MWEyMjYzMTQyMzggKCJkbWEtYnVmOiBhZGQgc29tZSB0cmFjZXBvaW50
cyB0byBxZGVidWcuIinCoA0Kd2UndmXCoGJlZW4gb2JzZXJ2aW5nIFVBRiByZXBvcnRzIHRyaWdn
ZXJlZCBmcm9tIGluc2lkZSBkbWFfYnVmX3B1dDoNCg0KPDA+IFs0MDIuOTM5NjQzXSBCVUc6IHNw
aW5sb2NrIGJhZCBtYWdpYyBvbiBDUFUjNywga3dvcmtlci91MzI6NS8xMzINCjw0PiBbNDAyLjkz
OTY2MV0gT29wczogZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0LCBwcm9iYWJseSBmb3Igbm9uLWNh
bm9uaWNhbMKgYWRkcmVzcyAweDZiNmI2YjZiNmI2Yjc1OWI6IDAwMDAgWyMxXSBTTVAgTk9QVEkN
Cjw0PiBbNDAyLjkzOTY2OV0gQ1BVOiA3IFVJRDogMCBQSUQ6IDEzMiBDb21tOiBrd29ya2VyL3Uz
Mjo1IFRhaW50ZWQ6IEcgUyAgIFUgICAgICAgTCAgIE4gIDcuMC4wLXJjNy1DSV9EUk1fMTgyODMt
ZzAyNTVmNGEzNWZlYysgIzEgUFJFRU1QVChsYXp5KSANCjw0PiBbNDAyLjkzOTY3Nl0gVGFpbnRl
ZDogW1NdPUNQVV9PVVRfT0ZfU1BFQywgW1VdPVVTRVIsIFtMXT1TT0ZUTE9DS1VQLCBbTl09VEVT
VA0KPDQ+IFs0MDIuOTM5Njc5XSBIYXJkd2FyZSBuYW1lOiBJbnRlbChSKSBDbGllbnQgU3lzdGVt
cyBOVUMxMVROSGk1LywgQklPUyBUTlRHTDM1Ny4wMDQyLjIwMjAuMTIyMS4xNzQzIDEyLzIxLzIw
MjANCjw0PiBbNDAyLjkzOTY4M10gV29ya3F1ZXVlOiBpOTE1IF9faTkxNV9nZW1fZnJlZV93b3Jr
IFtpOTE1XQ0KPDQ+IFs0MDIuOTM5ODcyXSBSSVA6IDAwMTA6c3Bpbl9idWcrMHg3Ny8weGUwDQo8
ND4gWzQwMi45Mzk4NzhdIENvZGU6IDgzIDY1IDhiIDE1IDVmIGNmIGFlIDAyIDQ0IDhiIDgxIDMw
IDBhIDAwIDAwIDQ4IDgxIGMxIDIwIDBkIDAwIDAwIDQ5IDgzIGZkIGZmIDc0IDRlIGU4IDAyIDY3
IDAxIDAwIDQ0IDhiIDRiIDA4IDRkIDg1IGVkIDc0IDU4IDw0NT4gOGIgODUgMzAgMGEgMDAgMDAg
NDkgOGQgOGQgMjAgMGQgMDAgMDAgOGIgNTMgMDQgNDggODkgZGUgNDggYzcNCjw0PiBbNDAyLjkz
OTg4NV0gUlNQOiAwMDE4OmZmZmZjOTAwMDE1NTdkMDggRUZMQUdTOiAwMDAxMDIwMg0KPDQ+IFs0
MDIuOTM5ODg4XSBSQVg6IDAwMDAwMDAwMDAwMDAwMzMgUkJYOiBmZmZmODg4MWMxMzZiMjUwIFJD
WDogMDAwMDAwMDAwMDAwMDAwMA0KPDQ+IFs0MDIuOTM5ODkxXSBSRFg6IDAwMDAwMDAwMDAwMDAw
MDAgUlNJOiAwMDAwMDAwMDAwMDAwMDAwIFJESTogMDAwMDAwMDAwMDAwMDAwMA0KPDQ+IFs0MDIu
OTM5ODk0XSBSQlA6IGZmZmZjOTAwMDE1NTdkMjAgUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOTog
MDAwMDAwMDA2YjZiNmI2Yg0KPDQ+IFs0MDIuOTM5ODk4XSBSMTA6IDAwMDAwMDAwMDAwMDAwMDAg
UjExOiAwMDAwMDAwMDAwMDAwMDAwIFIxMjogZmZmZmZmZmY4MzFjNmYzYQ0KPDQ+IFs0MDIuOTM5
OTAxXSBSMTM6IDZiNmI2YjZiNmI2YjZiNmIgUjE0OiBmZmZmODg4MTE5MjQ5NTcwIFIxNTogZmZm
Zjg4ODEwOGMxNDY0MA0KPDQ+IFs0MDIuOTM5OTA0XSBGUzogIDAwMDAwMDAwMDAwMDAwMDAoMDAw
MCkgR1M6ZmZmZjg4ODUxYzIxNzAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwDQo8ND4g
WzQwMi45Mzk5MDldIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAw
NTAwMzMNCjw0PiBbNDAyLjkzOTkxMl0gQ1IyOiAwMDAwN2NjYTdlNWQ3ZDc4IENSMzogMDAwMDAw
MDExYzBhYjAwMSBDUjQ6IDAwMDAwMDAwMDBmNzJlZjANCjw0PiBbNDAyLjkzOTkxNV0gUEtSVTog
NTU1NTU1NTQNCjw0PiBbNDAyLjkzOTkxN10gQ2FsbCBUcmFjZToNCjw0PiBbNDAyLjkzOTkxOV0g
IDxUQVNLPg0KPDQ+IFs0MDIuOTM5OTIyXSAgZG9fcmF3X3NwaW5fbG9jaysweDg2LzB4ZTANCjw0
PiBbNDAyLjkzOTkyNl0gIF9yYXdfc3Bpbl9sb2NrKzB4MzcvMHg2MA0KPDQ+IFs0MDIuOTM5OTMx
XSAgPyBkbWFfYnVmX3B1dCsweDMwLzB4MTIwDQo8ND4gWzQwMi45Mzk5MzZdICBkbWFfYnVmX3B1
dCsweDMwLzB4MTIwDQo8ND4gWzQwMi45Mzk5NDBdICBkcm1fcHJpbWVfZ2VtX2Rlc3Ryb3krMHgz
OC8weDUwDQo8ND4gWzQ0My42NzIwMDNdICBfX2k5MTVfZ2VtX2ZyZWVfb2JqZWN0KzB4NWUvMHgx
ZDAgW2k5MTVdDQouLi4NCg0KDQpTZWUgYWxzbyBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvZHJtL2k5MTUva2VybmVsLy0vaXNzdWVzLzE1NjQ3Lg0KDQoNCkkgZG9uJ3QgdGhpbmsgRFJN
IG9yIGRyaXZlcnMgY2FuIGRvIGFueXRoaW5nIGFib3V0IHRoYXQuICBQbGVhc2UgZml4wqBpdC4N
Cg0KVGhhbmtzLA0KSmFudXN6DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW50ZWwgVGVjaG5vbG9neSBQb2xhbmQg
c3AuIHogby5vLgp1bC4gU2xvd2Fja2llZ28gMTczIHwgODAtMjk4IEdkYW5zayB8IFNhZCBSZWpv
bm93eSBHZGFuc2sgUG9sbm9jIHwgVklJIFd5ZHppYWwgR29zcG9kYXJjenkgS3Jham93ZWdvIFJl
amVzdHJ1IFNhZG93ZWdvIC0gS1JTIDEwMTg4MiB8IE5JUCA5NTctMDctNTItMzE2IHwgS2FwaXRh
bCB6YWtsYWRvd3kgMjAwLjAwMCBQTE4uClNwb2xrYSBvc3dpYWRjemEsIHplIHBvc2lhZGEgc3Rh
dHVzIGR1emVnbyBwcnplZHNpZWJpb3JjeSB3IHJvenVtaWVuaXUgdXN0YXd5IHogZG5pYSA4IG1h
cmNhIDIwMTMgci4gbyBwcnplY2l3ZHppYWxhbml1IG5hZG1pZXJueW0gb3Bvem5pZW5pb20gdyB0
cmFuc2FrY2phY2ggaGFuZGxvd3ljaC4KClRhIHdpYWRvbW9zYyB3cmF6IHogemFsYWN6bmlrYW1p
IGplc3QgcHJ6ZXpuYWN6b25hIGRsYSBva3Jlc2xvbmVnbyBhZHJlc2F0YSBpIG1vemUgemF3aWVy
YWMgaW5mb3JtYWNqZSBwb3VmbmUuIFcgcmF6aWUgcHJ6eXBhZGtvd2VnbyBvdHJ6eW1hbmlhIHRl
aiB3aWFkb21vc2NpLCBwcm9zaW15IG8gcG93aWFkb21pZW5pZSBuYWRhd2N5IG9yYXogdHJ3YWxl
IGplaiB1c3VuaWVjaWU7IGpha2lla29sd2llayBwcnplZ2xhZGFuaWUgbHViIHJvenBvd3N6ZWNo
bmlhbmllIGplc3QgemFicm9uaW9uZS4KVGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBt
YXkgY29udGFpbiBjb25maWRlbnRpYWwgbWF0ZXJpYWwgZm9yIHRoZSBzb2xlIHVzZSBvZiB0aGUg
aW50ZW5kZWQgcmVjaXBpZW50KHMpLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBp
ZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllczsgYW55
IHJldmlldyBvciBkaXN0cmlidXRpb24gYnkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQu
Cg==


