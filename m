Return-Path: <linux-media+bounces-20825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CD99BC3D4
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 04:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34427B21B15
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 03:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E430318454E;
	Tue,  5 Nov 2024 03:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAGon/vn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8026238DDB
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 03:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730777036; cv=fail; b=VMSk0dwpr9xv5kI8gmNe/8mCltsirwaFE8Eu7jKOP6shGHW/mLPdDJeWAKJs0xhc496+ojzFdN7gg8AeQhZ71ebc8zetXP3TEFrEblMk4+Nyypajeej5HttlBMlkwTY0XQyjGNWa44CHW9v8vua2kgiwv+wA0k+2gGDAyQFRGE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730777036; c=relaxed/simple;
	bh=gnxys58L6MmoyoxFVkfD7/DHDF612MEL8nHCHoneTV8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MqhkAscSmTOgyfpv0OlYnbz5jG8X3OiWa0KFIqgqvG0wn5n4lrNICKyIsyL8pVGmilEzEJfULiig/yJlDQ80f52Oblds6vxbmVKs27YclLsRtZ4BEttoYFCC0koEcmN6cTA82vcLTmIUWsmWqtsX9AIkot1hUKLp0tfQhYPH5Yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAGon/vn; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730777035; x=1762313035;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gnxys58L6MmoyoxFVkfD7/DHDF612MEL8nHCHoneTV8=;
  b=PAGon/vnGB3EOF9AAafjBztTwf0IdVejFEHLG0kdGqNBqGigYow+fz4K
   WNqHPCDHDYUHBLpdR7JG0+Fbu1vA7r2xoLfXoPxMglcmlGFwkRqHm+Ycp
   BS+FjEr09nK+cyS9mTr2MQ6lv2QRwM0WKvNeIA6Vr7nQ9DttevtPPfygA
   YywVRI7QmznRW/PQZurNeK5Cfanz34FtiGNWVEi+0CBDlE9uei/FAzLjH
   bcWbnwpWioz5+TEPS0Gv4aIC95ZrecgtJXTummk0aM+6O74fFD5uTAjz8
   eXzFnOv3Te+e+h0VOQmOzYSizivJE50YHEPa0ZC6aksR5i5xDzNW2FK+G
   w==;
X-CSE-ConnectionGUID: B0ZhqLNiSm+dtYXlKoME0w==
X-CSE-MsgGUID: F5SPbH2+S/KEIvqe8wbUqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29930247"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="29930247"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 19:23:54 -0800
X-CSE-ConnectionGUID: ZqQw8U8RTgyAtOFPcSqstw==
X-CSE-MsgGUID: Ah0aBf0kRi6EAQk0gNuI/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="83966313"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Nov 2024 19:23:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 19:23:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 19:23:53 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 19:23:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqvSWC/7/AljSNScfC2onUMhRYV++yx/aQv9hDrCGTmNHnuDAPQKj87ilq6SA3JBLlm6v2n0FLJ0unFdfCyeb8g+rE2oj5Q/2NdpFNThzXt+2PO2x2lr6HSQJy17krjCzjMYDBtgVuJncfum3It2PV/ObpWJt1kIEky4g6TUXxl99cLNCa9TpU0xF2yhlCAQk2cs2qvSJojn5mTuyeSXUYdNOl3ozu44GIPNpOiWz7njDvpiOVyUOALbJu4nk8qmnb4SSprb1lNacEUwiWkv2fm2lfSdYB0hagFR1cjFfzISJgQiF0w4gpfMCFRIiD0NTYJyFpCxleQ5YQBtIY372g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnxys58L6MmoyoxFVkfD7/DHDF612MEL8nHCHoneTV8=;
 b=Fs/5T+FwpXCwLVSSlBosP0b76HwwtNBf+wKRmUHL2YsP7dwyoUMAb6vf9Ot6p73Z+NR2rrOxwdSvpTMFJemKhNs4vHn2Rx2aalxb41HkZSPlq8Qs7JAzaGO5zkyNHxMifZKNRrkawE9frLjWb5wPzYxAuDti3vUi5hTJgLqm7HXwO4GzoWU4Zb+XICV8/jIftDb9PNzCdrTtl40SEGNNPF/e/8rPVogo1TQ098S7hCKgZN2BAhyl6FD2dt6oFzupy7eUAG7nfRym2TmX82jVTL9LfBN91eXDyOH4BwETZv9E/PoG97MQHzUGoU8bAYGCgDLGyEpPG5K6blf44fblkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7171.namprd11.prod.outlook.com (2603:10b6:930:92::16)
 by CY8PR11MB7946.namprd11.prod.outlook.com (2603:10b6:930:7e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 03:23:51 +0000
Received: from CY8PR11MB7171.namprd11.prod.outlook.com
 ([fe80::af57:a78f:5ba3:350a]) by CY8PR11MB7171.namprd11.prod.outlook.com
 ([fe80::af57:a78f:5ba3:350a%3]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 03:23:51 +0000
From: "Wang, Hongju" <hongju.wang@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>
Subject: RE: [PATCH] media: intel/ipu6: Set the VC of the stream as the SOF
 event id
Thread-Topic: [PATCH] media: intel/ipu6: Set the VC of the stream as the SOF
 event id
Thread-Index: AQHbJcPuFHUKRC8qN0m+pbeYIbbzirKVtBWAgBDGMiCAAFhngIAAB+GAgAE5LDA=
Date: Tue, 5 Nov 2024 03:23:50 +0000
Message-ID: <CY8PR11MB717102F35BB74D8AEFD461F9EF522@CY8PR11MB7171.namprd11.prod.outlook.com>
References: <20241024032201.3867638-1-hongju.wang@intel.com>
 <Zxoh36bkJaDQIvME@kekkonen.localdomain>
 <CY8PR11MB7171773036C246F09DC2756EEF512@CY8PR11MB7171.namprd11.prod.outlook.com>
 <Zyh-Q7P2szvQxJ5z@kekkonen.localdomain>
 <20241104082503.GP2473@pendragon.ideasonboard.com>
In-Reply-To: <20241104082503.GP2473@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7171:EE_|CY8PR11MB7946:EE_
x-ms-office365-filtering-correlation-id: a7228414-4760-40d6-9376-08dcfd4944e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bWFWKzJMMGtLeGRvZHI2aUk0NmNaU0xFejJ1eFp5ZkZoWnJnV3JEQ2QwSUpu?=
 =?utf-8?B?TlVZbzBSMng0Q2NaRFljaTFBY0tlbkdzc1RVT3RwdWUwOUt6QWR1d0xLeHg5?=
 =?utf-8?B?ZUhFdzVjM3R2dm9pUTZxQXpYM0FmclZNcnJ3R2Q4QkpFR0lkOHhpKzhZYTlw?=
 =?utf-8?B?cjkzL3d4SGF5ZXNBMXBRV3lWOVVOTkQ4VHN1N003Q2o0L1hLeGZvUXlEc2NW?=
 =?utf-8?B?WlNoTFpYMVZiQy8yMFN2K2JpWTI4UUJMcG0zMXJyZGtQZ01ubVEvWmx0ZCs5?=
 =?utf-8?B?NllDQnRITHJ1QUU2Zk15eDlnUUNPTEZNMHQxMmVVZUpEU1p5bWJncEt4UURp?=
 =?utf-8?B?SHpzeStwMTdxeFhzZENXMGRCNXcrK0pnMFk1OXJTTDNtWFdwTjdMZ0pjV2JC?=
 =?utf-8?B?T1V1OGNVQXFXYkg5Q25vWUYrcGpNcldrUkdBQzU5M0czVTFZZTc4NURMN2dv?=
 =?utf-8?B?bjc5SCtNZU5CSFFYVnVzSWxkOTB0eHZFWFBKa2ZwZ0dUVnFUQkZkRFpFZlZz?=
 =?utf-8?B?cGxaTG0yUk5KOWFlOFFsY1ZPNU8yTU5zNWg1UzlEMFZjV2NTNnVSTjFLQXpE?=
 =?utf-8?B?dXVhME9lSWZZWGJVUW1UK2FSMHJYbkxPamdQYnVGVk5QS09IVERvTmFZaTUw?=
 =?utf-8?B?bG1SaitXTWNqOU5xMU1ybGx0YlVFZWowQkNiSzRQb3MwcHlLaGZtSVpwM1pI?=
 =?utf-8?B?aFVneThHSFpmWGx1eDB0dVhnVFJBclBNL2JaWWc3R1JGelN4dGdFTE5DNW1K?=
 =?utf-8?B?bFVtcGVkMVdrZ01ka3hNRkE0VzdCL2RoSlk1SW9GNHE4WDg1dDBYRmRMV3F5?=
 =?utf-8?B?c0d2VWx6Q0NrVjlQb0tKaUxjYWc0M0Nud3Z6QkhIV095a3ZYWTMrdHpST0ZF?=
 =?utf-8?B?THkvQUhkeXdUS0MrUEZMNUlnZGJGMGNkTlY1YzN1ZU4rOU5iaDA3UURna25r?=
 =?utf-8?B?dkdNRnl5d1RLWDBRWFdTaTJPemE4enJjejV1dENVUkF0Q2tEQmFLZXVma0E0?=
 =?utf-8?B?Q25VOEtPVkFMM0dFbFVwL3BRNzRQUFQwVzNpWjg3TTgvTFMzeDZFeXFRYmlG?=
 =?utf-8?B?QVc4cDB2R1hYVmRVOWtKZDRGaUMwOGl4OXROZW9YNUcwRzdwYkZNQkxsNmxQ?=
 =?utf-8?B?VitkUFNuSnV2RFdzK3NFU21rVjJtZVJ1SlErOTNwL2pZZm45MEw0WnVuaW11?=
 =?utf-8?B?YzhiczJDOS9oK1RPbHRMNTd0S3Iwd2IxZG9RcTdNWi9JeFkraklYQjZVcDJF?=
 =?utf-8?B?ajBpNGJLOUJhQVEyK2FWeUIrYmd6WW9ieDJFWnhtZnF3bTZjVllldmZSeWQ1?=
 =?utf-8?B?TlFpQTB0dE56MW9BLy9MSEZhb2xlV3FKT0l2SXFxelRrUkV4dnA3eVF1ZTV5?=
 =?utf-8?B?cmJOR3pWMU1HVno3SmtubXlRZmJ4MjUwZEU2RGNnU1Q4NDNZNzdlR2pTc0c5?=
 =?utf-8?B?MGdJWnJiV0RrZHdFMmFqeEFzd2xqVENFYlZvMU1ZcnZuNlk0UlBoOGtybkF3?=
 =?utf-8?B?Y2FISEZEemxXdFlhL0R0MEk1RzJ5Z2dDN0w1TWlTb3ROZ21LZ2ZPRkFTZ2JU?=
 =?utf-8?B?a0htN1d3azFnU0kxYXRoMTllMjJUS1A1QUtpNGVuWGpSSEszUlZ0QlcxcFB6?=
 =?utf-8?B?UXdaQ29kSWt1cFZrMW4zT29yOGsrOTMvMTYvVkxnYU5EVUZJSWVzZlBKMHVM?=
 =?utf-8?B?NzZKTE1BUVNjVnBFbUhMZFJDVThZNEtqNGxBazNoTDNQeE9BTDhKcXNUc1Z6?=
 =?utf-8?B?RmVnMS9JQ29aSTNQRnVzRy8wMmwrbU94ejZCV1MvN216NDczL3RhUDZiazRG?=
 =?utf-8?Q?tKl3n9kLkDxvTgYhvvECoSf6AgmMokiYLywDA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7171.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0RDY3pyUHFMbWFiNHVXQy9HRWhmb003MmNZTmtIVUhXYS9oaGRhZnM2TkJw?=
 =?utf-8?B?dE5qbWdYOGQ2Zk5kN2w3NTVlSlF6OEVHKzEwcUNER1U4dHlMQmNtNStvZ3pR?=
 =?utf-8?B?QTZTSTJKWHdzbFllWWNWR2kyYjdIdDdGOEFBN2x1NStQMThldW03VURaUkJF?=
 =?utf-8?B?UDZFK0crWnljcVhEMnhvb3VZNjNqckg4aXBkZjQ1TXBZSGd4TTdPYXhheVlt?=
 =?utf-8?B?SlRiZmsyd0MwWGJHTWRYL2owVHk2R3FMV1Y2RGo1cW0zS2UrVDYrMk1GTGY3?=
 =?utf-8?B?WkNZZ2psQjNEdCtoR3JHUEVVU3ZZUlRneENEaSs4UEYvY2xsS3dmMlNnVlVW?=
 =?utf-8?B?RWRGNkR6bmY2MC9lM0VuUWJUVGtvMWtJYzJEL010eVZFMEFSYW5SR1ordGJO?=
 =?utf-8?B?c29xMGN3YmRpVUN4OWlHbTJaQjNVU3dWNEEza0dZcUFnWG1rYnpMSGhrTVQ5?=
 =?utf-8?B?NmR2ajJFekllMkozQjRhSTIzR3VxcnNzd01mSU1HdG5OYi9iVm9zU2xkYXJP?=
 =?utf-8?B?WWw5WXFDazZDYzZtcFQvTlFvQ0EwcVFIVUpma0pFWHhBSkI5aXRNWHkzTzlN?=
 =?utf-8?B?YkEzbUVpckltY3I0MzR3djJLeXhCMjhZaXFyNHhMK3F1RE9KcGs3MnRxUDUr?=
 =?utf-8?B?MG5wMk1vbWgySGQwMzFaVU9PbGlhSnJIMENjTHVQR05iT0FEY0xUYi9FNDZB?=
 =?utf-8?B?RVBPOERYM0JkTW1Eblc1eXBjeEU0eHRVV3grbUFHSTFxUXdQcDA1UXVTQklt?=
 =?utf-8?B?K21MT2RUMjZGT2pBZlhoQktZcHp0aHdjTnNQUC9rZ0dCUnV2UFRZekxHNURT?=
 =?utf-8?B?eTB3bWJaRTAwV3RUeGVVOTlJanYrVk04MFJUMzRPY0IzQ0ltSUs1ZXE4SEMw?=
 =?utf-8?B?eVFmTDZqQk1FOVUwZ1VvVytpRDJMcUpZUlhPeFk3YzZFSGU1QTJsQWpsR3J2?=
 =?utf-8?B?c2pldkI5S2F0NjZ2Y0tXMjlBaEhjOTdBOTNHQUpDTE92UllDSjNMdGJ6TjFE?=
 =?utf-8?B?OGlIRGQ1a2VvdmowMHR4Skx1YXcxR21DM1FOdzFZWnNkL2hMQVBRckIxRjhI?=
 =?utf-8?B?VTBmaExjWmV0eUluMmNnbTE2TjNWNjhhQUd3Mld6VnNYamR5MGZUK2tTZEw1?=
 =?utf-8?B?SGJ4dlNJK1hsTFhwRTJQRTJ5TUEya01Pd1hTQ3hyYXQ5YWJBQVRTdHZQb2ZR?=
 =?utf-8?B?NlpERG9qSTRaN3MzU2liY0Mwb3RuenZNSElWUkMvTzZoK05HRjhXeEs3MW9y?=
 =?utf-8?B?Q0xNQm5GeUh2amhnWVB1VnhoOVoyM1hxSlV5N3RKcEEwOS9EQzRWOHoxYy9Y?=
 =?utf-8?B?S3pZaTJrbmc2VzdRYU1jRGhQQi8yK3Z6TjVHa3VNd1FCSVFCR29GQXZJWUVQ?=
 =?utf-8?B?NllUYWV2T09XbTJLNmNrV2hNWkhGaGY3eW11ek1zbTFjY3J2V2gzdkhyd1Zn?=
 =?utf-8?B?bkxvY3lRMHN6L2NTdDlZZHg3MEdaZE5xOVVlejBlUWlJL1NaTWJGMXV4WW1H?=
 =?utf-8?B?Rjl2OTZxK3FlWS9pam13ZjI3eHdMQVdiTHp5bGxaV3hkVThLcFVnam83OVYv?=
 =?utf-8?B?ZzFEeS92LzB5Q1YyM2NYMHRlNXNxRm5YVjdyL0oycU1EM2M1eWgxQ3YzcGZ0?=
 =?utf-8?B?R0ZDQ0JQbjkwdUFyK3JFUEExTEFibVF6N0ZjbzFTM3Z1UnRuYzBydXdkcmxz?=
 =?utf-8?B?Zm96eFZoTnYzNUM5ZzBSZEtETU1hbWExL3VNalF6UW9IZmZ4aUlsWFhxYTVq?=
 =?utf-8?B?clM5bERtWjVJLzZZT1NJKzRyTDZXaXlOZ3F5U2lQczRzOWNORVBlSDdWaGZN?=
 =?utf-8?B?K3FYY0Y3emtjVE1kYlBLSFR2TmNOYTZ6MCtaU2hpTi9YOHF5dnRFN01tZ1BD?=
 =?utf-8?B?Y1c4WGlUbVpvRWxUUldLUVpoQlVSRnV4alF5SGhSM0h6VWtkL2J5dVJjMmVs?=
 =?utf-8?B?VU1PSGV6Nk9MRmw5QmdRN3dvR2djemczMS9jeG1SZ1VuZVBXTTdOMFl1Mloz?=
 =?utf-8?B?QStmNGp5dUpLbWZhajhaZWgwNGtieVN4N094eEVLWWpMV3RUcnZocVk0WDU3?=
 =?utf-8?B?ZFRQbVJDYzd0NlBFaFhpM2tzQTkrcWo1SlJTSTZ1d3dqMWpYVkZLbWxFQ244?=
 =?utf-8?Q?A3YHOWFSVpjHzCYC5lyzh14xP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7171.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7228414-4760-40d6-9376-08dcfd4944e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 03:23:50.9719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FlOXjpAoJbsqgFyqZ0e2NbhrRKaI2PPI/EqtMY3s1t09q61qKLXe1j9Z9wT1X/uUTpUcrnnVifdSZ5iFeYx+QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7946
X-OriginatorOrg: intel.com

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IE1vbmRheSwgTm92ZW1iZXIgNCwgMjAyNCA0OjI1IFBNDQo+IFRvOiBTYWthcmkgQWlsdXMgPHNh
a2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+DQo+IENjOiBXYW5nLCBIb25nanUgPGhvbmdqdS53
YW5nQGludGVsLmNvbT47IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsNCj4gYmluZ2J1LmNh
b0BsaW51eC5pbnRlbC5jb207IGh2ZXJrdWlsQHhzNGFsbC5ubA0KPiBTdWJqZWN0OiBSZTogW1BB
VENIXSBtZWRpYTogaW50ZWwvaXB1NjogU2V0IHRoZSBWQyBvZiB0aGUgc3RyZWFtIGFzIHRoZQ0K
PiBTT0YgZXZlbnQgaWQNCj4gDQo+IE9uIE1vbiwgTm92IDA0LCAyMDI0IGF0IDA3OjU2OjUxQU0g
KzAwMDAsIFNha2FyaSBBaWx1cyB3cm90ZToNCj4gPiBPbiBNb24sIE5vdiAwNCwgMjAyNCBhdCAw
MzowNzo1OEFNICswMDAwLCBXYW5nLCBIb25nanUgd3JvdGU6DQo+ID4gPiBPbiBUaHVyc2RheSwg
T2N0b2JlciAyNCwgMjAyNCA2OjMxIFBNLCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+ID4gPiA+IE9u
IFRodSwgT2N0IDI0LCAyMDI0IGF0IDExOjIyOjAxQU0gKzA4MDAsIEhvbmdqdSBXYW5nIHdyb3Rl
Og0KPiA+ID4gPiA+IEluIHRoZSB2aXJ0dWFsIGNoYW5uZWwgY2FzZSwgdGhleSBzaG91bGQgdXNl
IHY0bDJfZXZlbnQuaWQgdG8NCj4gPiA+ID4gPiBkaXN0aW5ndWlzaCBTT0YgZXZlbnRzIG9mIGRp
ZmZlcmVudCBzdHJlYW1zLiBUaGVyZWZvcmUsIHdlIHNldA0KPiA+ID4gPiA+IHRoZSB2aXJ0dWFs
IGNoYW5uZWwgbnVtYmVyIG9mIHRoZSBzdHJlYW0gYXMgdGhlIFNPRiBldmVudCBJRC4gVGhpcw0K
PiBudW1iZXIgaXMgdW5pcXVlLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
SG9uZ2p1IFdhbmcgPGhvbmdqdS53YW5nQGludGVsLmNvbT4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+
ID4gPiAgZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMtY3NpMi5jIHwgMSAr
DQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTYvaXB1Ni1p
c3lzLWNzaTIuYw0KPiA+ID4gPiA+IGIvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2
LWlzeXMtY3NpMi5jDQo+ID4gPiA+ID4gaW5kZXggMDUxODk4Y2U1M2Y0Li41YWQ0MjZhZmEwZjAg
MTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2
LWlzeXMtY3NpMi5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1
Ni9pcHU2LWlzeXMtY3NpMi5jDQo+ID4gPiA+ID4gQEAgLTU3OCw2ICs1NzgsNyBAQCB2b2lkIGlw
dTZfaXN5c19jc2kyX3NvZl9ldmVudF9ieV9zdHJlYW0oc3RydWN0DQo+IGlwdTZfaXN5c19zdHJl
YW0gKnN0cmVhbSkNCj4gPiA+ID4gPiAgCQkudHlwZSA9IFY0TDJfRVZFTlRfRlJBTUVfU1lOQywN
Cj4gPiA+ID4gPiAgCX07DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiArCWV2LmlkID0gc3RyZWFtLT52
YzsNCj4gPiA+ID4gPiAgCWV2LnUuZnJhbWVfc3luYy5mcmFtZV9zZXF1ZW5jZSA9IGF0b21pY19m
ZXRjaF9pbmMoJnN0cmVhbS0NCj4gPnNlcXVlbmNlKTsNCj4gPiA+ID4gPiAgCXY0bDJfZXZlbnRf
cXVldWUodmRldiwgJmV2KTsNCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBUaGUgaWQgZmll
bGQgaW4gc3RydWN0IHY0bDJfZXZlbnQgaXNuJ3QgdXNlZCBmb3IgdGhlIEZSQU1FX1NZTkMNCj4g
PiA+ID4gZXZlbnQgYW5kIGFsc28gdGhlIHZpcnR1YWwgY2hhbm5lbCBpc24ndCBjb21tdW5pY2F0
ZWQgdG8gdGhlIHVzZXINCj4gc3BhY2UgY3VycmVudGx5Lg0KPiA+ID4NCj4gPiA+ICAgSG93IHRv
IHVzZSB0aGUgaWQgZmllbGQ/IFVzZXIgc3BhY2Ugc2hvdWxkIHVzZSBTT0YgdG8gZG8gRlJBTUVf
U1lOQywNCj4gPiA+ICAgYnV0IHRoZSB2NGwyX2V2ZW50IGRvZXNuJ3QgZGlzdGluZ3Vpc2ggZGlm
ZmVyZW50IHN0cmVhbXMuIERvIHlvdQ0KPiBoYXZlDQo+ID4gPiAgIGFueSBnb29kIHN1Z2dlc3Rp
b25zPw0KPiA+DQo+ID4gQWgsIG5vdyBJIHRoaW5rIEkgZG8gdW5kZXJzdGFuZCB0aGUgcHJvYmxl
bS4gVGhlIGV2ZW50cyBhcmUgcHJvZHVjZWQNCj4gPiBieSB0aGUNCj4gPiBDU0ktMiByZWNlaXZl
ciBzdWItZGV2aWNlIGJ1dCB0aGVyZSBhcmUgbXVsdGlwbGUgc3RyZWFtcyBhbmQgdGhlIGV2ZW50
DQo+ID4gaXNuJ3Qgc3RyZWFtLWF3YXJlPw0KPiA+DQo+ID4gSXQncyBuaWNlIHRoYXQgdGhlIGlk
IGZpZWxkIG9mIHRoZSBGUkFNRV9TWU5DIGV2ZW50IGlzbid0IGluIHVzZSBmb3INCj4gPiBhbnkg
b3RoZXIgcHVycG9zZS4gVGhpcyBzaG91bGQgYmUgdGFrZW4gaW50byBhY2NvdW50IGluIGV2ZW50
DQo+ID4gc3Vic2NyaXB0aW9uLCB0b28uDQo+ID4NCj4gPiBJJ2xsIGFkZCBhIHBhdGNoIGRvY3Vt
ZW50aW5nIHRoaXMgaW4gdGhlIG1ldGFkYXRhIHNlcmllcy4gQW55IHRob3VnaHRzPw0KPiANCj4g
SSB0aGluayB3ZSBjb3VsZCB1c2UgdGhlIGlkIGZpZWxkIGZvciB0aGlzIHB1cnBvc2UsIGJ1dCBt
YXliZSBub3QgdG8NCj4gcmVwb3J0IHRoZSBWQy4gVXNlcnNwYWNlIGlzbid0IFZDLWF3YXJlLCB3
ZSBzaG91bGQgaW5zdGVhZCBjb252ZXJ0IHRoZSBWQw0KPiB0byBhIHN0cmVhbS4NCj4NCiAgRG8g
eW91IG1lYW4gdGhhdCB3ZSB1c2UgYSBzdHJlYW0gaWQ/IEJ1dCB3aGljaCBzdHJlYW0gaXMgdXNl
ZCBpc24ndCBmaXhlZC4NCiAgT25seSB3aGVuIHZpZGVvIHN0cmVhbXMgb24sIHdlIHNlbGVjdCBh
IHN0cmVhbSBmb3IgaXQuIFdoaWNoIHNlbnNvciB1c2VzDQogIFdoaWNoIFZDIGlzIGZpeGVkIGJ5
IHNlbnNvciBkcml2ZXIuICANCg0KPiA+IENjIExhdXJlbnQgYW5kIEhhbnMuDQo+IA0KPiAtLQ0K
PiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K

