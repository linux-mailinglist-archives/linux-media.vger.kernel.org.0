Return-Path: <linux-media+bounces-4094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BCB8391B9
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 15:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60860B21C78
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 14:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304FF56777;
	Tue, 23 Jan 2024 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhK30+7i"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1DF5FEED
	for <linux-media@vger.kernel.org>; Tue, 23 Jan 2024 14:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.55.52.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706021345; cv=fail; b=fDD+e6mFQaa67N9eHIPX3qF1Sf3P0C+IRDRR5ZWFO0lsTRqyT0eYv25lLHw8yVZKMy76DvkpyWDrIoBf72vp0wIS44KZeKa/ZBDevrooVR5yLD2b1ySLk4nlwkNy98t5biGLpHfTdJSFU58wqES+Mdpumoz05m3temyLPRXYvtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706021345; c=relaxed/simple;
	bh=bYpJKPdyQ2A4Kmep2lcndnUuY4TDJhx7whzmO6wZCGA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IICHzcv+v2xSt5RG+Dj7tF6X8/O/NeU5CjmeMZf3i2Emx3UNKWROgPP0wTvnqc2EN+0rPiW6zIurI5Hd64BZBOtbzcYEi8fQYcnvbTgSPsZL7NXDLw/jRYYnNaP3wmQ0fl7BwpgjYYxO/lnY3ZzGvTfHprI/ZhO4PW0R1piuWCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhK30+7i; arc=fail smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706021343; x=1737557343;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bYpJKPdyQ2A4Kmep2lcndnUuY4TDJhx7whzmO6wZCGA=;
  b=XhK30+7imMnI9VgEXWBdkoWyGtLTry/w7qV1Drd6UD5gnX00JqqfTmDZ
   5CNno69Yv2OCOTvGIaD/xpzlEjes1HGCbKd+eZpWATsCVA40gYPEwQge3
   XoegCDzatdtNEsZdZRqA4B+bBPIkPBbHtbe5fjoGFZGeOLsDuIrsfUr+n
   ZdPchgOS4cA+433DRPnt9HymmOdyU1qXruNucyinU9bjLcsgfQazbw4HK
   skiN4Uqjwf/rDxE3nUNhejm2jy3J4Iu6yxaKGoPooUH8jLE3Pf6qZG08u
   rcs/q6rSO9iAVdj6Vs2i/xtMjtpQYxkVjCYRhMeSjZrbLrs/jx2JAWcpr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401204579"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="401204579"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 06:48:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929354649"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="929354649"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Jan 2024 06:48:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 06:48:46 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 06:48:46 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 06:48:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKzxyAY8N6FgM0Vm6p5HmZQTFGhvbq0BUXnnFSdqYftJt4AoootWPRyY/E82OXznO3CKFCKN2o2EbWdb73Wxk0gz1KOpN+zrn1x0K74KHkKH1jXS8czb3VQF3U49Igs9a45vJk53JynSrT3fbbbE4NvPFuOTxb4hXRE9nA7rkeu5oT3hMUqahAg7Cp2ydXGsWQKP/rY+RoasbrEJlYHEzOOyuPByg62/MUuMPFxrQBJG0T/KJY/tVIa+vzCSJuKeZE14YFaNkzRylD6hTnLdlCfc0HcVXx2U10OOezPMFabegkmgJ0yux9eSk+OfSV7hV9DQGATGIn8odVsvfgrk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYpJKPdyQ2A4Kmep2lcndnUuY4TDJhx7whzmO6wZCGA=;
 b=UOoaGL40nARXLK3kGlXahTax4n7FMDfGgMNGmkRxsOEIdA64ntQfDZGl0DNUnPZwkvWtxfMdmnUwyjAbrSEIgqGDMxeol2AgIIDq3/hWUMovOP7PjEpRG5L3HqphbNWZrdS8CZX/hi/7EjcwfQQ6Jh9/xY28udyjXNB2Uy3PEEC71/PFDF/PoGhr+5lPK0MUDFqjkxVCBtTiNI6J9nh7HDAFdCOY2T5e0XDc2oTBuH7P4hI6m2dc/C9WbV+RVahvxnu1iVdeO/kcKSa318iUxz4yD5YcegZlBzJjBkqmc7jDz+KqtcET/ofulfC48MWLvYRa/c1nauZvZoOj4HCQ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7459.namprd11.prod.outlook.com (2603:10b6:8:144::22)
 by DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 14:48:44 +0000
Received: from DS0PR11MB7459.namprd11.prod.outlook.com
 ([fe80::43f3:ea84:dd5f:d8d9]) by DS0PR11MB7459.namprd11.prod.outlook.com
 ([fe80::43f3:ea84:dd5f:d8d9%4]) with mapi id 15.20.7202.034; Tue, 23 Jan 2024
 14:48:44 +0000
From: "Chen, Jason Z" <jason.z.chen@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Tomasz Figa
	<tfiga@chromium.org>
CC: "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Yeh, Andy"
	<andy.yeh@intel.com>, "Zhang, Qingwu" <qingwu.zhang@intel.com>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>
Subject: RE: [PATCH v3] media: ov08x40: Reduce start streaming time
Thread-Topic: [PATCH v3] media: ov08x40: Reduce start streaming time
Thread-Index: AQHaTd/RAIqfrvg/YUuvCmfH563l0rDnKyuAgAADf4CAAErkQA==
Date: Tue, 23 Jan 2024 14:48:43 +0000
Message-ID: <DS0PR11MB7459FFF4552871CC5EEEFA3ECC742@DS0PR11MB7459.namprd11.prod.outlook.com>
References: <20240123093648.285711-1-jason.z.chen@intel.com>
 <CAAFQd5D6y8nKg8axJxZj+yhMD8ZNC=q6w_e2=7qcQo1HFWSFTw@mail.gmail.com>
 <Za-R8xeuD5cHCA0K@kekkonen.localdomain>
In-Reply-To: <Za-R8xeuD5cHCA0K@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7459:EE_|DM4PR11MB5358:EE_
x-ms-office365-filtering-correlation-id: 70922168-d10c-4a7e-b329-08dc1c2265a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D8qfUvRhULgFuxz9Vk4iGXQKqOA6mFoTbAGYkQ1rTnNu0ArwEQuZPZReXOVfocFt00ZUmdjuqjaQVK2BvZpF8y7L3xwgeMQjr+8ltWkn33HRVSdVnct0vrO34oGF4SM9FW0UhsiQOnh8o2xF1lPX+I0GLrTjtqLgGb3dRsH3tmu9MnZIJG8mgx2fuWDLTrN4e/f4izkqFu42c135B6sMP4fcnOtlW6nf4ldjjbZ4qA1jZyVm/H28wSELgmd7XJ86jAGBz+jMNqn4nlQ8Zsh4hCV+3N0CnxfaqlwCv/G3DQ5ElMnRi2hTLYL9fuQGciNVwHysa2dB8/qanm9iJQ/WAUj0ukIVBajqu3WD659SvmJE5PdwyOfLS3QvfPpy13EfCR1layU71l6ECNifSgsU7s/kpqe50Bdathfx0bTZPglkLfaCGyVwmwX16QyyrqgnoOc1G7e1jTbuSFo2wKb1XniWhCU/Nz3kc65sFCIP/DCh62KsspFBARYMo3MCE7p8Bve9dBkiE0nDLaCsGSjZx8iDvjl3uj9tB0HP+4Y4zMNBnJ3++lLZCBw2IqGAh/NONseiYYKZJ3SHOyFMVzE3q5aBjanQFpT93ZGz/c9g82/Z4VppOpwTWm/psNi5V330
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7459.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(376002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(83380400001)(53546011)(122000001)(71200400001)(26005)(38100700002)(52536014)(9686003)(8676002)(5660300002)(4326008)(8936002)(41300700001)(66556008)(478600001)(7696005)(6506007)(66476007)(54906003)(64756008)(316002)(66946007)(76116006)(66446008)(110136005)(2906002)(33656002)(86362001)(82960400001)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWJxM1pNYVBBbGRvdmpXZFVyYnNpb0pXSjNMVFhobHp0d21hYktWY2N2OVRW?=
 =?utf-8?B?SExmZ0EvdnRMa1FWbUJjQmtRNHI0anZxQmFPTk96UnZGbmhjaHJpRXlFaDVh?=
 =?utf-8?B?a3FPbGV2VWdmTFNCN0I1c3FGK29RV0hXZTZjcEk2R1FBZjhFZGV3Mzdobi9h?=
 =?utf-8?B?cDAzM3JKa2NuUkUybGxhYUI4aThOaklOeWxkWk54aGZqaFR6TGpDdTF3SUU5?=
 =?utf-8?B?UUVCZkVQWHlHaXN0S21rOWFzdkdnK0UwVnNYRHk5Q0NEWWZqamVKTUdJbnJo?=
 =?utf-8?B?MW45dTZiRVk3YXA3R1BlcXNmNlRmTGZidWJkSTJ1aEYrcWVXZm4vOXI4WmZK?=
 =?utf-8?B?SnR2UHJaek5XVXJtbUJLU3BnSERaY1htZ0ttWVl1RzNjK1NsdFJPeGNCTlAx?=
 =?utf-8?B?bWpsa3pOWmxlNHA1RlFyaEtBNm1JcDZwL2hsaTFqVk1rUDE0Rm5NVXpyN05V?=
 =?utf-8?B?ejltanNKV0tsZGIwZVVOVTE0MEphTWhVZlBzcnl3YlorU3RQbXVQVzY3cGlT?=
 =?utf-8?B?M2wvSUJrc2VQUUhYZ2lRa2hpc0E1c2ZZeHh1VXlmUmNiTmpvK2ZkcXhIRzR0?=
 =?utf-8?B?d0VPU1F2VXJJaS9hQ0NnRlRpM0Jsc1NVWjVvc2cyMTlYRHFBaUlzZDNoR3B6?=
 =?utf-8?B?QjFwazNWUGErOXlZSVhWNUdGcWtDcy9xdHJCVjZpdkVYZ2pZQTlTSmFiRzRJ?=
 =?utf-8?B?RUhiY0JXOE44ZVQ0UlVzYVRqUVhzdlZaYkpSazRQRVY3WlE2bm8xVy8rbk5G?=
 =?utf-8?B?RnNyUFdpZCs5Z2xHUEh1UXFhNFVUdTR1V1RPZS9DU2U0K3JueGNSdUlYUk01?=
 =?utf-8?B?N1ZtSkk0OGhkVEJadWdQbkZVM0hteHVHZS83QzZ2UmpOUXNUOE83MU5maWpO?=
 =?utf-8?B?Skl4WnZGeXlaREtaQ2hHTk9VUTE1VkVibkwra2F3QnF0ZUV3K1ZqMnN6a202?=
 =?utf-8?B?aElhUnRGSHRBMFlnWk9RdUsxTzRxQWV5U0w0MUVnNlhEd3FHK1VZY25QOEIw?=
 =?utf-8?B?bkc4ZlB1V1pEbXJibFBsV0R0aC9HYU9EMmJnZWRSRGRlV254S0dYb0V4b0lG?=
 =?utf-8?B?b24vVG9ZZWlFWFVobUJmTXU3cUYydUFHZWV3YUd2bi9ta1Z0elZwWVBVUDdu?=
 =?utf-8?B?WUZXN0NPaWZWeFRTQkVMdnRSYWxKVVJNU203ZmRORlpvcURQbDl0SURrOTJm?=
 =?utf-8?B?OFhONVE2aUY2SWRCSGp1NXF4MFczdGNaMTNMTWl5RDUxVHQ0Q0EzZGVUdlYv?=
 =?utf-8?B?emdTdW9BeGdRVmJjeEtXdmtFOWJ5TEQ0cG9UTlorcEs2eHZNcHVPdmZmZk1t?=
 =?utf-8?B?ZjBxa0R2MnZldVpvcy9jbUJSZE1IbTlkYjl2SEdhMW9kbVYvR3hPZzltVHZy?=
 =?utf-8?B?OFFTVEhTOEFicWdzNWdQa3FZeU43ZWlMR003ajZYUW96L2VYaENxc0VYbWRM?=
 =?utf-8?B?VlgwbTJFQTZSaWlUdUEvOENCZk1nWG1vekh6SmFIcStIbFp0SHgySHNtRzJC?=
 =?utf-8?B?eHdoTUp2OU5TK25GcjRycGlaNkl3ZUZmTGlDTDluSkFQaVBvYzh6a1BWMVc3?=
 =?utf-8?B?aG1CbDFQdm45Q3VQYXBaWGNkNnlJaTZsQS9pK0pSc3RJZ2VseWptRUtiUlFm?=
 =?utf-8?B?NUdpWC8xblNweFZmWGg4RE9vTkpldmE4NkRud3JvUmVRTnZkeU5renZhRjY0?=
 =?utf-8?B?OUJTUFZnSUxRbDRTZncvdm5CWldEUDErcHNCRUhjRlVlTzZVcWZvRXdVYklW?=
 =?utf-8?B?NlVkTHdtTFhXYURsT0ZXaXJha2Znc25yM291U25FR1ZWUEl2NWhVNEhRNk9j?=
 =?utf-8?B?YnZhOTlkVVZwVndPaVdPUzN1cVFNNmM4dDJOcEVleDNNaTUvS2R3Uk1DcHd0?=
 =?utf-8?B?OVhScDVKdGNHbitNaHN6ckpYTnFWOUxsaW9ZOXBwZ05EMmMvQ0R1ck10Q2RW?=
 =?utf-8?B?ZWNQMjAxT2JVb1pIdTlvR3JaZ3hrUFoyc2tzWVZ1THBqdVAvcE80d1NSS2lu?=
 =?utf-8?B?ZEV6YlZSM0RUalNCbWRuNFE4UEZNVkUvZmxTNkIwN0Izd1puSnUxTFpUZjRp?=
 =?utf-8?B?YUVuMjNmeUdGNlVGbGY3OVIzNUI0ZVhDZWlxQmpRMGdGVGtCUC8ycXNmeXh0?=
 =?utf-8?Q?g1qedc71wr0t0ucpeaj3eTJy9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7459.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70922168-d10c-4a7e-b329-08dc1c2265a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 14:48:43.9418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sjp2Oh//TrPBABIcm4A4M6S01qNSasbxCwPKqgpdk93/wdGO2MleLNg88yT/xFy2wuLJ2BV2w124V2EY1E6GUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5358
X-OriginatorOrg: intel.com

VGhhbmtzIGZvciB0aGUgcmV2aWV3LCBTYWthcmkgYW5kIFRvbWFzei4NCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4Lmlu
dGVsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDIzLCAyMDI0IDY6MTYgUE0NClRvOiBU
b21hc3ogRmlnYSA8dGZpZ2FAY2hyb21pdW0ub3JnPg0KQ2M6IENoZW4sIEphc29uIFogPGphc29u
LnouY2hlbkBpbnRlbC5jb20+OyBiaW5nYnUuY2FvQGxpbnV4LmludGVsLmNvbTsgbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnOyBZZWgsIEFuZHkgPGFuZHkueWVoQGludGVsLmNvbT47IFpoYW5n
LCBRaW5nd3UgPHFpbmd3dS56aGFuZ0BpbnRlbC5jb20+OyBzZW5vemhhdHNreUBjaHJvbWl1bS5v
cmcNClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjNdIG1lZGlhOiBvdjA4eDQwOiBSZWR1Y2Ugc3RhcnQg
c3RyZWFtaW5nIHRpbWUNCg0KSGkgVG9tYXN6LA0KDQpPbiBUdWUsIEphbiAyMywgMjAyNCBhdCAw
NzowMzo0OVBNICswOTAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4gT24gVHVlLCBKYW4gMjMsIDIw
MjQgYXQgNjozN+KAr1BNIENoZW4sIEphc29uIFogPGphc29uLnouY2hlbkBpbnRlbC5jb20+IHdy
b3RlOg0KPiA+DQo+ID4gRnJvbTogSmFzb24gQ2hlbiA8amFzb24uei5jaGVuQGludGVsLmNvbT4N
Cj4gPg0KPiA+IEJlY2F1c2UgdmlkZW8gZHVyYXRpb24gaW52b2x2ZXMgY2FsY3VsYXRpbmcgdGhl
IHN0cmVhbWluZyB0aW1lLCBhbmQgDQo+ID4gaTJjIGNvbW11bmljYXRpb24gaW5jdXJzIHRvbyBt
YW55IFhUQUxLIHJlZ2lzdGVyIHNldHRpbmdzIGV2ZXJ5IDQgDQo+ID4gYnl0ZXMgd2l0aCBpMmMg
U1RBUlQgYW5kIFNUT1AuDQo+ID4NCj4gPiBTbyB3ZSBoYXZlIG9wdGVkIHN3aXRjaCB0byB0aGUg
aTJjIGJ1cnN0IG1ldGhvZC4NCj4gPiBUaGlzIG1ldGhvZCBpbnZvbHZlcyB3cml0aW5nIHRoZSBY
VEFMSyByZWdpc3RlcnMgaW4gdGhlIG9yZGVyIG9mIHRoZSANCj4gPiByZWdpc3RlciBibG9jay4N
Cj4gPg0KPiA+IFRoZSBzdGFydCBzdHJlYW1pbmcgdGltZSBjYW4gYmUgcmVkdWNlZCBmcm9tIGFy
b3VuZCA0MDBtcyB0byAxNTBtcw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gQ2hlbiA8
amFzb24uei5jaGVuQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tZWRpYS9pMmMv
b3YwOHg0MC5jIHwgMTIwNyANCj4gPiArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwgMTE1MiBkZWxldGlvbnMo
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9vdjA4eDQwLmMgDQo+
ID4gYi9kcml2ZXJzL21lZGlhL2kyYy9vdjA4eDQwLmMgaW5kZXggZGRjYjRiNjg0OGIuLjdiMDlm
NDA1ZmM1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL292MDh4NDAuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvbWVkaWEvaTJjL292MDh4NDAuYw0KPiBbc25pcF0NCj4gPiArc3RhdGlj
IGludCBvdjA4eDQwX2J1cnN0X2ZpbGxfcmVncyhzdHJ1Y3Qgb3YwOHg0MCAqb3YwOHgsIHUxNiBm
aXJzdF9yZWcsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MTYgbGFz
dF9yZWcsICB1OCB2YWwpIHsNCj4gPiArICAgICAgIHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQg
PSB2NGwyX2dldF9zdWJkZXZkYXRhKCZvdjA4eC0+c2QpOw0KPiA+ICsgICAgICAgc3RydWN0IGky
Y19tc2cgbXNnczsNCj4gPiArICAgICAgIF9fYmUxNiByZWdfYWRkcl9iZSA9IGNwdV90b19iZTE2
KGZpcnN0X3JlZyk7DQo+ID4gKyAgICAgICBzaXplX3QgaSwgbnVtX3JlZ3M7DQo+ID4gKyAgICAg
ICBpbnQgcmV0Ow0KPiA+ICsNCj4gPiArICAgICAgIG51bV9yZWdzID0gbGFzdF9yZWcgLSBmaXJz
dF9yZWcgKyAxOw0KPiA+ICsgICAgICAgbXNncy5hZGRyID0gY2xpZW50LT5hZGRyOw0KPiA+ICsg
ICAgICAgbXNncy5mbGFncyA9IDA7DQo+ID4gKyAgICAgICBtc2dzLmxlbiA9IDIgKyBudW1fcmVn
czsNCj4gPiArICAgICAgIG1zZ3MuYnVmID0ga21hbGxvYyhtc2dzLmxlbiwgR0ZQX0tFUk5FTCk7
DQo+ID4gKyAgICAgICBpZiAoIW1zZ3MuYnVmKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4g
LUVOT01FTTsNCj4gPiArDQo+ID4gKyAgICAgICAvKiBTZXQgdGhlIHJlZ2lzdGVyIGFkZHJlc3Mg
dG8gdGhlIGZpcnN0IHR3byBieXRlcyBvZiB0aGUgYnVmZmVyICovDQo+ID4gKyAgICAgICBtZW1j
cHkobXNncy5idWYsICZyZWdfYWRkcl9iZSwgMik7DQo+IA0KPiBuaXQ6IFdvdWxkbid0IHRoZSBj
b2RlIGJlIG11Y2ggc2ltcGxlciB0byBmb2xsb3cgaWYgcmV3cml0dGVuIGFzIGJlbG93Pw0KPiAN
Cj4gbXNncy5idWZbMF0gPSBmaXJzdF9yZWcgPj4gODsNCj4gbXNncy5idWZbMV0gPSBmaXJzdF9y
ZWcgJiAweGZmOw0KDQo+T3IuLi4ganVzdCBwdXRfdW5hbGlnbmVkX2JlMTYoKT8NCkRvbmUNCg0K
PiANCj4gPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBudW1fcmVnczsgKytpKQ0KPiA+ICsgICAg
ICAgICAgICAgICBtc2dzLmJ1ZlsyICsgaV0gPSB2YWw7DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0
ID0gaTJjX3RyYW5zZmVyKGNsaWVudC0+YWRhcHRlciwgJm1zZ3MsIDEpOw0KPiA+ICsNCj4gPiAr
ICAgICAgIGtmcmVlKG1zZ3MuYnVmKTsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAocmV0ICE9IDEp
IHsNCj4gPiArICAgICAgICAgICAgICAgZGV2X2VycigmY2xpZW50LT5kZXYsICJGYWlsZWQgJWQg
cmVncyB0cmFuc2ZlcnJlZDogJWRcbiIsIHJldCk7DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVy
biAtRUlPOw0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIGRldl9kYmcoJmNsaWVu
dC0+ZGV2LCAiSTJDIGJ1cnN0IHRyYW5zZmVyIHN1Y2NlZWRlZFxuIik7DQo+ID4gKw0KPiA+ICsg
ICAgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gIC8qIFdyaXRlIHJlZ2lzdGVycyB1
cCB0byA0IGF0IGEgdGltZSAqLyAgc3RhdGljIGludCANCj4gPiBvdjA4eDQwX3dyaXRlX3JlZyhz
dHJ1Y3Qgb3YwOHg0MCAqb3YwOHgsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
MTYgcmVnLCB1MzIgbGVuLCB1MzIgX192YWwpIEBAIC0yOTM2LDYgDQo+ID4gKzE4MjYsMTkgQEAg
c3RhdGljIGludCBvdjA4eDQwX3N0YXJ0X3N0cmVhbWluZyhzdHJ1Y3Qgb3YwOHg0MCAqb3YwOHgp
DQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gICAgICAgICB9DQo+ID4NCj4g
PiArICAgICAgIC8qIFVzZSBpMmMgYnVyc3QgdG8gd3JpdGUgcmVnaXN0ZXIgb24gZnVsbCBzaXpl
IHJlZ2lzdGVycyAqLw0KPiA+ICsgICAgICAgaWYgKG92MDh4LT5jdXJfbW9kZS0+ZXhwb3N1cmVf
c2hpZnQgPT0gMSkgew0KPiA+ICsgICAgICAgICAgICAgICByZXQgPSBvdjA4eDQwX2J1cnN0X2Zp
bGxfcmVncyhvdjA4eCwgT1YwOFg0MF9SRUdfWFRBTEtfRklSU1RfQSwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgT1YwOFg0MF9SRUdfWFRBTEtfTEFT
VF9BLCAweDc1KTsNCj4gPiArICAgICAgICAgICAgICAgcmV0ID0gb3YwOHg0MF9idXJzdF9maWxs
X3JlZ3Mob3YwOHgsIE9WMDhYNDBfUkVHX1hUQUxLX0ZJUlNUX0IsDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE9WMDhYNDBfUkVHX1hUQUxLX0xBU1Rf
QiwgMHg3NSk7DQo+ID4gKyAgICAgICB9DQo+IA0KPiBIbW0sIGlmIHdlIG9ubHkgbmVlZCB0byBz
ZXQgdGhlc2UgaWYgZXhwb3N1cmVfc2hpZnQgaXMgMSwgZG9uJ3Qgd2UgDQo+IG5lZWQgdG8gc29t
ZWhvdyAidW5zZXQiIHRoZW0gaWYgdGhlIG1vZGUgZXhwb3N1cmVfc2hpZnQgIT0gMT8NCg0KPkkg
cmVjYWxsIHRoZSBkcml2ZXIgcG93ZXJzIHRoZSBzZW5zb3Igb2ZmIGV2ZXJ5IHRpbWUgc3RyZWFt
aW5nIGlzIHN0b3BwZWQgKHdpdGhvdXQgcG1fcnVudGltZV9wdXRfc3luYygpLCBzbyBpdCdzIG5v
dCByZWxpYWJsZSkuLi4gdGhhdCB3b3VsZCBiZSBuaWNlIHRvIGFkZHJlc3MgYXMgd2VsbCwgYnV0
IG91dHNpZGUgdGhlIHNjb3BlIG9mIHRoaXMgcGF0Y2guDQoNCk5vIG5lZWQsIGJlY2F1c2Ugd2hl
biBzdGFydGluZyBzdHJlYW1pbmcgd2l0aCB0aGUgYmlubmluZyBtb2RlLCBpdCB3aWxsIGZsdXNo
IHdpdGggdGhlIGBtb2RlXzE5Mjh4MTIwOF9yZWdzYC4NClRoaXMgaXMganVzdCBmb3IgZnVsbC1z
aXplIHJlZ2lzdGVyIHNldHRpbmdzLg0KDQpJIGhhdmUgY2hlY2tlZCB0aGUgaTJjIGZ1bmN0aW9u
YWxpdHkgYXMgd2VsbCwgYW5kIGl0IGRvZXMgd29yayB0byBzZXQgdGhlIHJlZ2lzdGVyIHdlbGwu
DQoNCg0KLS0NClJlZ2FyZHMsDQoNClNha2FyaSBBaWx1cw0K

