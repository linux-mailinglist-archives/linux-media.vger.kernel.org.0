Return-Path: <linux-media+bounces-22584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD939E364E
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 10:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C92B281FFB
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 09:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F51199E80;
	Wed,  4 Dec 2024 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMzwKSJ0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46931A4F21;
	Wed,  4 Dec 2024 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733303654; cv=fail; b=Fa8hCHoD6ZRsgSWlDCFtqMldM+Bc2Be8fCU9MD96jpTZj/EG7rrSkXrmgkKJbEySug+gcfOta9kMoAwrefITo8qysRkkicC0AlZRm5ksoF8aIAEz1qp9WPjkKFdx40POPZi6bfHwVqKOzV83DXr730zQG4l1jG9TNhXREWiM3Wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733303654; c=relaxed/simple;
	bh=L5bMWco9mlffpX2bBqxnXRc1qRZt9JBgyKPA5ZmCe30=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SfSIJViBEKbGhxZMMdcbtMf1VkPOieT3XrMAU3VtSDwq6WMwCol5poB0G5/LX2bEH9HXOc1d5qYPsWWg16C/bDWigBhXeHOMIcUeDqvYbprWP4jtxNYS+Qcg6WoGUCyaGEynRjOWxpmjdcpyFiHBXqEqW+UCLu3+YAtstc09rX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMzwKSJ0; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733303653; x=1764839653;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=L5bMWco9mlffpX2bBqxnXRc1qRZt9JBgyKPA5ZmCe30=;
  b=iMzwKSJ0MZroIMJVwbvJ+8EqAH9rSeF2lkb4p9cdAk/BsG1ZjbpM7fRw
   7KBKW09RAm9FKBTmaZ4LfdTucAahK+T8YEFNI9nbxM5IXemVI4kJgUyP/
   fX3I49v1eLkEoD/+lw+V9Yz+VParB2qkWfDl1kApF4LyXx40IFwbcqWn5
   A2zrt4abIuUn8E+g2DuJnMV9fZ2r5RvxhwQL/qfNeu7K/0pzdZ3IIcvpf
   rTRPop5TCHCsECbrvtrKrtaagT9T6GypjEisrd3/a/vTKIbtUmu4uctbm
   MJfgJZCQuzWxF/kMWdqZQWEJDYFLIuCg2yy/Xh0CRDBxkR0FXRCpwGbzf
   g==;
X-CSE-ConnectionGUID: P/js3DcST3Cidkw0CRF0ow==
X-CSE-MsgGUID: y3bSQVenQwa1ZF017HQZUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="50975971"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="50975971"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 01:13:25 -0800
X-CSE-ConnectionGUID: Kz0XY6xLTj6isFv9PmzXlw==
X-CSE-MsgGUID: CrREygbuQBu6gL2MSQWRNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="98779952"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Dec 2024 01:13:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 01:13:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Dec 2024 01:13:23 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Dec 2024 01:13:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feeCxx0T/68HCWQNgFTDjsSsriLwHtf9V+c3ofyl2lcY3VvBXcgJLj2w71kD1wbRwHFVRFSEX8DY/SMpLCzJkcB3BntMblf7+7YFUnJejcKYZr//7TpuZ5tThyIf1i8EitW18QDw5OJZriUoHXHxKhM3lu1f2jz1uebyae4wmYX9cEbvJtYDO7i5TsOWblINnrFc2VoNw2mKNnQe3lyBXUtFF/yAmzOHpCECXsjH1BaE69zwNUDpwaMHsv3f7H035eATggCgkETfHGR8bAKN7XdTjfe966X2B+qBpoZY0b/9aBcbXF0PmVl0gn3NkrDfXIEcxx5iDoUVP1xm+9kPiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5bMWco9mlffpX2bBqxnXRc1qRZt9JBgyKPA5ZmCe30=;
 b=zIGH7SXdY5n+ag2kF2dZRESjL5PTuaJy/IrvyZ+qvDx6UkT8+thtE1k6cjrWbNgLUB13SN+gVhajaR6i5p6NNBMHyqsSZWNYpulhiA7y0wMG7ZUmyT33ANioAKCh7o8l30gd3YZERDiKq70kyBp8kHi5I1+G3oKWUho5T1UKaZ/iC/sow8x8wNfLGveot8L/1u8eqz2sWPE7hdVNebuAJD27K0nKLudQd3plkgOvBIQeKj1/U3Rj7fxHu7L6eITZ5erPbH56uY4ViKDArbAv4Q+xM1FUYpVAh/DJhL8ohNrkzWlUsdVoKJlOgy0BuQ5KGaIGRVDZgVdY8ZrJDFRObw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by IA1PR11MB7727.namprd11.prod.outlook.com (2603:10b6:208:3f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 09:13:21 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 09:13:21 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jann Horn <jannh@google.com>, Gerd Hoffmann <kraxel@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
	<christian.koenig@amd.com>, Simona Vetter <simona.vetter@ffwll.ch>, "John
 Stultz" <john.stultz@linaro.org>, Andrew Morton <akpm@linux-foundation.org>,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/3] udmabuf: fix memory leak on last export_udmabuf()
 error path
Thread-Topic: [PATCH 3/3] udmabuf: fix memory leak on last export_udmabuf()
 error path
Thread-Index: AQHbRaiQ2eoN7cvXhkSPGKlSZzNsebLVxcVg
Date: Wed, 4 Dec 2024 09:13:21 +0000
Message-ID: <IA0PR11MB7185D54AD6BB8067EAA6AE8EF8372@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com>
 <20241203-udmabuf-fixes-v1-3-f99281c345aa@google.com>
In-Reply-To: <20241203-udmabuf-fixes-v1-3-f99281c345aa@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|IA1PR11MB7727:EE_
x-ms-office365-filtering-correlation-id: 3262c10d-2823-4875-ce26-08dd1443e664
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TFFjUUVCdDFTQWxOd2k5Z0cvRCtvMDhJZHNzR3ZhM0pCWXo1T05TTWx6QnBX?=
 =?utf-8?B?ZG5nTzdCMFd0QTdOQU1yMGtvYThlL1M3Z3RPSGNJTkp0OHk5MWRpa3psbEhP?=
 =?utf-8?B?U0lqdWJ3ZGNEcWdUdWczMHVlMGNDY1FoQ0hybmREUUhrWHV2OUFlK1VtSzZC?=
 =?utf-8?B?R1JiTW9JRk94WlJyTWZ6WHdDVVBiUmwvU0NZNG9RQmNMY1RCRkNrQnM2eElU?=
 =?utf-8?B?TXlEZGYvWWxRRHVBQ05qOHUxQ0JvQzI2TWNKQkZaTWNqWlpHb1Z1K3Zza1k1?=
 =?utf-8?B?L3ZGNmp3Z1N4Mm1YZjArTFluQXpGNE1SWUU4em5rU3F3RHpKbW82YUdtNU0v?=
 =?utf-8?B?SUMxeldUQndTWk9CaWpoTUVhR29BNVdBQ3NTMjR1QmErTGRWMUdlUU0yOVdU?=
 =?utf-8?B?TS8ySEFJdUlFbEtxR0xibmM5cGhjV2tIT0NOU0NPM3JsRWMxY2MvTUhyMjJS?=
 =?utf-8?B?alRzdjZhMjA3eW8yVFFMcGZ2RS9XTGdWZ1NubllNMFRIRlloK3RyMHd5ZHFh?=
 =?utf-8?B?SlZHZDlrZE85Sm5rNkU3ZG9RaFc5RjlDZGptWVYrZGpWNlhDMjhFTDUvQkp6?=
 =?utf-8?B?RGMyZjRaU09QcFVQVkdESXM3ZkQ4OVZiVUlLMlQ2SFFyMWh0a1llWFlXZUhQ?=
 =?utf-8?B?U3ZLcWZNVTNpbmtiRDNJRDFMVWp1OGxoZC9IcDN5MG1hb2xraWhYZEMzcVdE?=
 =?utf-8?B?VHY3dHgwM0FwSnl5SDJGRzNvRWRhTTNmUzljOWRYekcwcnhXSkkwblArL1Ir?=
 =?utf-8?B?QmkwcDRESW5hYXZKUVJ4bWduc1pTQko4bmUvRkkxcUF0Tk1LMnQvVWwrckVq?=
 =?utf-8?B?WFJNRlNZL0QzeExEWDFHdXBjdFYvYjdRR2NjNC9kbi9Ja3VsZzBmNHZXeGpL?=
 =?utf-8?B?YWFab2FOa3JXeUp2VXEyOVZzNm4yVXBHcllpbkVON1REeEVnY1l0Y0RHVjZC?=
 =?utf-8?B?VGNYdlBPcGE2RWxMSzUxY0R0Y0pFeGlqRzRTVmpzTFJoYW12dTY3YzRvbjJB?=
 =?utf-8?B?cEhYTFdRek51VDFUWWgyaWh0MUp4SlhQYXdNZm5WYlAzT1VESXJzQ1d5MGR3?=
 =?utf-8?B?MTUyTGZESk1YLzhiUlV2aWZYTGRzNDZTSmhLM01mRWxJZEs4Sk5oMWhIQU4w?=
 =?utf-8?B?NUhaMDFjd3Z2aUhvaHliOTNIeVVMREdLaUpMakVtV3U0eWQ4dHluRkpxRjhT?=
 =?utf-8?B?K1pDL3FHUnhjWStuUTV5UUQ2Q3pFLzNHYXZ5K2tNVDR6ekxGWkhqS2pESFJV?=
 =?utf-8?B?UEdYM084cUUzOElwR2Jzby9hL3dyVllpbE1SSGxvTlNkdXd5ZE5DTGVWRnFC?=
 =?utf-8?B?UUliZFVCb0laTzhQQ1FEcFV5MGgxaS95cXBRV3JkOVZvSldwL0xpSGpyT2Zr?=
 =?utf-8?B?elRQdVc0eWJKektJOFUxZGJtSXdFRXdsR0pRem1RVHNiRndiMFdZbHB5ZC9v?=
 =?utf-8?B?OXdwcjhiQ0Z2MUhZTGRzeDBic1RvRlJTVDZXenNRY1NuZ3RRMjFaK2RDK1B3?=
 =?utf-8?B?U3NXeitZSTNOZmtla1lKVU5pblRBOWNPSWJVNVc4WGZOQ3FLOGFTV1hOaTV2?=
 =?utf-8?B?Y1Jkb0RvOVBWSFJLOWd4ZXUwaExjZ2EyTVBCdG5SS1VtSjVkTjVnaHNEUDI5?=
 =?utf-8?B?WmlsenJWbFEvQ3Q3V2t3akEzNHNZQ09acUlBNVR5QmNoT2NKWHFRc1FtWE1k?=
 =?utf-8?B?cU83ZFIxdytVL1FiVjYySjJ6VEZpWjB2aWJzREhaWFZWYjFaWHFyQmZZYm9F?=
 =?utf-8?B?TytvYm5Jemc3anRnOWhWQ2EweVpGTXIwSkNJV1Q0MnlTSiszbnQ1QlRZUVFk?=
 =?utf-8?B?V1BDYnZ5VzZDaC8zUGVHbU1NUlRENURCOG9PKzZ4N2w4Y055andlK1FYSlFv?=
 =?utf-8?B?R3p2MnJsNTRHK203Nkc3Z012Q3ZtRjJVQkNqQmc2eXR5a1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7185.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVc5R3NYSU1TeUE0TE1DV0g0WTh4dVh1WFUzTFA1ZnBGYldOTzNuRkJibDFU?=
 =?utf-8?B?VmlTZUpZbEFlZkZmN0FFV2t3cUNXSUZ2ZEZVQlF2Ryt1M01xNE9NdlByUGxN?=
 =?utf-8?B?bFluQkdvdDlzbmdyVlI4UVpHSmFNcmZnakFCQzc1YkpNMzJrVnlZUG92NU1u?=
 =?utf-8?B?d0JMLzNsaGhvZzZmSjJrOGlIQXFyQlQ2cWlDdU1zL0VVRFMxZHNKemNkcUYr?=
 =?utf-8?B?WVNVYWl6SUFna3RhQ1pOcDVMa2JjcDRDVVloNUhISWhBczJQKzIvdDFCZ0Ev?=
 =?utf-8?B?WVpvQmlDdU1oMUZjdFIrcjdiUzRSam1XTUlpL2JsNzhldlc3VFFuSUdhNVdo?=
 =?utf-8?B?RVFzZVRiRDN0dlhReUV3Lys2c01hSFdIY09ZUjM1WkJTcW1aYWlHN3NRdldn?=
 =?utf-8?B?YXlDSTl6RHVhS0FVV2hPalNreWxUSTZSTzRORG9uSzhGdGxveXpweHRqOUQ4?=
 =?utf-8?B?TGhsMEVodnlSclZFOXo1QlBXNDJYbHJzc1lSK1NkaDlNM1JKU3h1SlJvdzlU?=
 =?utf-8?B?bU5FTFBxY2FUcG4wN09lT1Zpd3cyRVVHZ3N4Y1FDek1pNjQ2d094QllIVFFp?=
 =?utf-8?B?eTdEOUF1N2tLYU8wa3BFODdzUU56bkZadUljSjlIRFE0dWVFSTVjRUhxQ0k2?=
 =?utf-8?B?cWMwVHlzeW05dE5tMWxwZzlreGJSRXg5UGxBc00ra25MVEYvSW0zemZRTHNr?=
 =?utf-8?B?MDd0d2RJaWdDeGNBWG12RllqOTFjNFpqb0UrYWJMWWlmWkZVMXF2YnFwM0kw?=
 =?utf-8?B?d0g2M0lZZHBSb2dWRVVWOWpMbnFFSWF0WHAvVlBnK20rSWp6aFFieWVpN0VS?=
 =?utf-8?B?blk2RVg0ck5LKzZhWFNWQTBOK1BqTU1zQmkySzE0OHhISmtLRVZ0MFNqZkFj?=
 =?utf-8?B?YXBkaXBEZlBsNXFydkhzNU9FUHZNNlVMUU5lWXJQWkhSQXJjSmxsVHRnVmkx?=
 =?utf-8?B?TzdSeWxiWVFJRXlBQk1rd1U3NmI0VEVOOTZSUVlENERBNzhDbTI2L0Q1MjFu?=
 =?utf-8?B?OXNySWJzcDFEbS9IVUprUlFWcE16bXAxRFgwMEpsci9RQTRHNFUzUnlMbkpT?=
 =?utf-8?B?cS95TzdGeUxJOVphUHhXQTM5TWFHU005N25CbjNuT3BuVXByMDlMWSs5ZVJF?=
 =?utf-8?B?SDY2aWgvd1ZDUGNmdlBDQnZWaUE4TUlpS3h0NHp3OHkzUUd4ZWdSZWpRZ21T?=
 =?utf-8?B?cUdRT3I3K3lWQ3MyS2NTTGFJbVJIaUxRWWl3TUpmd3RoUTJ1ei9pWEdFVzZT?=
 =?utf-8?B?RDM2ODFOd1hHNnR5eTVFTWNkeGd5OE8wZVBKQ3BVVUhnc3lZQ1hwZWZ3Tlhr?=
 =?utf-8?B?all4NnpEK3YrcVlPK2YzMmFJNi9RMUh1S0x6Wm1NYzFBVncwUTJZdDNESGxn?=
 =?utf-8?B?TWFLSmp0b3RaTmdzenNNeGk3dVhvanNSU1R2c0hUU2VxUUowOGFkTDlQajVG?=
 =?utf-8?B?RENZT2w0a0lscHJrTXBybjkyT0syeHdSZkxPMVc5clRWL0piY2pHWi9rSVN0?=
 =?utf-8?B?a0RmeFJLVk96QlY2aUpmdDQyMjZsbllxUjRnaDFOOTBoemE4UllKZ0Q2aHov?=
 =?utf-8?B?YWx2eEhzMzhHUU9qZmxoTEgvSjBVRG5FU1RKM3JVemt2WHVpOEw1Q1AyM3lj?=
 =?utf-8?B?UEgrd0NaaExqY1R4aUc2cE4xK3dDSVljTFhNNklYSEtaV2lQMVZTN1VCN0JX?=
 =?utf-8?B?OFRpTktrOWFUMGM2di91OExuOUM5K2RNeHdpU0JEV25kTmJFYnJwT1I3bXVK?=
 =?utf-8?B?L01mTEhkYnRzbDhpZ1AwamJ3YVVYckNaTFNGVVV1Rlo4aDM3NG9UUHdyTVNW?=
 =?utf-8?B?MUhFZnhZY05DaEZkR0ZiSUh6WXdNNm9wYjBkajdEVUxHWkpmbFBibktnMW1m?=
 =?utf-8?B?U0lObnlzb3NUQmZJWFREMktnVlg4eWtoaHM4QkdlU3FxOG9PK0RYVUVzUWdl?=
 =?utf-8?B?TW55RVdVSmJ6WVc0YzdSdVRKcWZaYlpPdTl1ZHdwd0J0eGpQR0Z3cWdtcWpQ?=
 =?utf-8?B?YnNKbHdBWmFPOWZaem1teDVRVUxJL2x0STR5V3h5NHRwNk5teFZTUlRqUlpN?=
 =?utf-8?B?YkxQcDhJVGhucFpGeFJrWXpENm9OVHRDdkJURXUzc2dtUXR4OElXOE1PQWEr?=
 =?utf-8?Q?XoTvJaLSn30YHRBiHyTuXZhT5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3262c10d-2823-4875-ce26-08dd1443e664
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 09:13:21.6899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: faGhtDTMaPWUySaFaSKiF+VeUGAYl/KgBlgg8LDp4kKJPwYlTXBAB9uyoqOD8pfj5wf0wNw1Iv3WNIwL8HoTglfHEQnwQ2c7OOc+p9jRx+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7727
X-OriginatorOrg: intel.com

SGkgSmFubiwNCg0KPiBTdWJqZWN0OiBbUEFUQ0ggMy8zXSB1ZG1hYnVmOiBmaXggbWVtb3J5IGxl
YWsgb24gbGFzdCBleHBvcnRfdWRtYWJ1ZigpDQo+IGVycm9yIHBhdGgNCj4gDQo+IEluIGV4cG9y
dF91ZG1hYnVmKCksIGlmIGRtYV9idWZfZmQoKSBmYWlscyBiZWNhdXNlIHRoZSBGRCB0YWJsZSBp
cyBmdWxsLCBhDQo+IGRtYV9idWYgb3duaW5nIHRoZSB1ZG1hYnVmIGhhcyBhbHJlYWR5IGJlZW4g
Y3JlYXRlZDsgYnV0IHRoZSBlcnJvcg0KPiBoYW5kbGluZw0KPiBpbiB1ZG1hYnVmX2NyZWF0ZSgp
IHdpbGwgdGVhciBkb3duIHRoZSB1ZG1hYnVmIHdpdGhvdXQgZG9pbmcgYW55dGhpbmcNCj4gYWJv
dXQNCj4gdGhlIGNvbnRhaW5pbmcgZG1hX2J1Zi4NCj4gDQo+IFRoaXMgbGVhdmVzIGEgZG1hX2J1
ZiBpbiBtZW1vcnkgdGhhdCBjb250YWlucyBhIGRhbmdsaW5nIHBvaW50ZXI7IHRob3VnaA0KPiB0
aGF0IGRvZXNuJ3Qgc2VlbSB0byBsZWFkIHRvIGFueXRoaW5nIGJhZCBleGNlcHQgYSBtZW1vcnkg
bGVhay4NCj4gDQo+IEZpeCBpdCBieSBtb3ZpbmcgdGhlIGRtYV9idWZfZmQoKSBjYWxsIG91dCBv
ZiBleHBvcnRfdWRtYWJ1ZigpIHNvIHRoYXQgd2UNCj4gY2FuIGdpdmUgaXQgZGlmZmVyZW50IGVy
cm9yIGhhbmRsaW5nLg0KPiANCj4gTm90ZSB0aGF0IHRoZSBzaGFwZSBvZiB0aGlzIGNvZGUgY2hh
bmdlZCBhIGxvdCBpbiBjb21taXQgNWU3MmIyYjQxYTIxDQo+ICgidWRtYWJ1ZjogY29udmVydCB1
ZG1hYnVmIGRyaXZlciB0byB1c2UgZm9saW9zIik7IGJ1dCB0aGUgbWVtb3J5IGxlYWsNCj4gc2Vl
bXMgdG8gaGF2ZSBleGlzdGVkIHNpbmNlIHRoZSBpbnRyb2R1Y3Rpb24gb2YgdWRtYWJ1Zi4NCj4g
DQo+IEZpeGVzOiBmYmIwZGU3OTUwNzggKCJBZGQgdWRtYWJ1ZiBtaXNjIGRldmljZSIpDQo+IFNp
Z25lZC1vZmYtYnk6IEphbm4gSG9ybiA8amFubmhAZ29vZ2xlLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jIHwgMjUgKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYv
dWRtYWJ1Zi5jDQo+IGluZGV4DQo+IDhjZTc3ZjU4MzdkNzFhNzNiZTY3N2NhZDAxNGUwNWYyOTcw
NjA1N2QuLmFhZTAwNzFiZTE0YTJjODNhNDI4YjU5DQo+IGVhOWU5MDVjNzE3MzIzMmJlIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jDQo+ICsrKyBiL2RyaXZlcnMvZG1h
LWJ1Zi91ZG1hYnVmLmMNCj4gQEAgLTMxNywxMiArMzE3LDExIEBAIHN0YXRpYyBpbnQgY2hlY2tf
bWVtZmRfc2VhbHMoc3RydWN0IGZpbGUgKm1lbWZkKQ0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAN
Cj4gLXN0YXRpYyBpbnQgZXhwb3J0X3VkbWFidWYoc3RydWN0IHVkbWFidWYgKnVidWYsDQo+IC0J
CQkgIHN0cnVjdCBtaXNjZGV2aWNlICpkZXZpY2UsDQo+IC0JCQkgIHUzMiBmbGFncykNCj4gK3N0
YXRpYyBzdHJ1Y3QgZG1hX2J1ZiAqZXhwb3J0X3VkbWFidWYoc3RydWN0IHVkbWFidWYgKnVidWYs
DQo+ICsJCQkJICAgICAgc3RydWN0IG1pc2NkZXZpY2UgKmRldmljZSwNCj4gKwkJCQkgICAgICB1
MzIgZmxhZ3MpDQo+ICB7DQo+ICAJREVGSU5FX0RNQV9CVUZfRVhQT1JUX0lORk8oZXhwX2luZm8p
Ow0KPiAtCXN0cnVjdCBkbWFfYnVmICpidWY7DQo+IA0KPiAgCXVidWYtPmRldmljZSA9IGRldmlj
ZTsNCj4gIAlleHBfaW5mby5vcHMgID0gJnVkbWFidWZfb3BzOw0KPiBAQCAtMzMwLDExICszMjks
NyBAQCBzdGF0aWMgaW50IGV4cG9ydF91ZG1hYnVmKHN0cnVjdCB1ZG1hYnVmICp1YnVmLA0KPiAg
CWV4cF9pbmZvLnByaXYgPSB1YnVmOw0KPiAgCWV4cF9pbmZvLmZsYWdzID0gT19SRFdSOw0KPiAN
Cj4gLQlidWYgPSBkbWFfYnVmX2V4cG9ydCgmZXhwX2luZm8pOw0KPiAtCWlmIChJU19FUlIoYnVm
KSkNCj4gLQkJcmV0dXJuIFBUUl9FUlIoYnVmKTsNCj4gLQ0KPiAtCXJldHVybiBkbWFfYnVmX2Zk
KGJ1ZiwgZmxhZ3MpOw0KZmxhZ3MgaXMgbm93IHVudXNlZCBpbiB0aGlzIGZ1bmN0aW9uLg0KDQo+
ICsJcmV0dXJuIGRtYV9idWZfZXhwb3J0KCZleHBfaW5mbyk7DQo+ICB9DQo+IA0KPiAgc3RhdGlj
IGxvbmcgdWRtYWJ1Zl9waW5fZm9saW9zKHN0cnVjdCB1ZG1hYnVmICp1YnVmLCBzdHJ1Y3QgZmls
ZSAqbWVtZmQsDQo+IEBAIC0zOTEsNiArMzg2LDcgQEAgc3RhdGljIGxvbmcgdWRtYWJ1Zl9jcmVh
dGUoc3RydWN0IG1pc2NkZXZpY2UNCj4gKmRldmljZSwNCj4gIAlzdHJ1Y3QgZm9saW8gKipmb2xp
b3MgPSBOVUxMOw0KPiAgCXBnb2ZmX3QgcGdjbnQgPSAwLCBwZ2xpbWl0Ow0KPiAgCXN0cnVjdCB1
ZG1hYnVmICp1YnVmOw0KPiArCXN0cnVjdCBkbWFfYnVmICpkbWFidWY7DQo+ICAJbG9uZyByZXQg
PSAtRUlOVkFMOw0KPiAgCXUzMiBpLCBmbGFnczsNCj4gDQo+IEBAIC00NTEsOSArNDQ3LDE2IEBA
IHN0YXRpYyBsb25nIHVkbWFidWZfY3JlYXRlKHN0cnVjdCBtaXNjZGV2aWNlDQo+ICpkZXZpY2Us
DQo+ICAJfQ0KPiANCj4gIAlmbGFncyA9IGhlYWQtPmZsYWdzICYgVURNQUJVRl9GTEFHU19DTE9F
WEVDID8gT19DTE9FWEVDIDogMDsNCj4gLQlyZXQgPSBleHBvcnRfdWRtYWJ1Zih1YnVmLCBkZXZp
Y2UsIGZsYWdzKTsNCj4gLQlpZiAocmV0IDwgMCkNCj4gKwlkbWFidWYgPSBleHBvcnRfdWRtYWJ1
Zih1YnVmLCBkZXZpY2UsIGZsYWdzKTsNCj4gKwlpZiAoSVNfRVJSKGRtYWJ1ZikpIHsNCj4gKwkJ
cmV0ID0gUFRSX0VSUihkbWFidWYpOw0KPiAgCQlnb3RvIGVycjsNCj4gKwl9DQo+ICsJLyogb3du
ZXJzaGlwIG9mIHVidWYgaXMgaGVsZCBieSB0aGUgZG1hYnVmIGZyb20gaGVyZSAqLw0KUGxlYXNl
IGFsc28gYWRkIGEgY29tbWVudCBoZXJlIHRoYXQgc2F5cyB0aGF0IGlmIGRtYV9idWZfZmQoKSBm
YWlscywNCnRoZW4gY2FsbGluZyBkbWFfYnVmX3B1dCgpIHdpbGwgZW5hYmxlIGNsZWFudXAgdG8g
YmUgZG9uZSB2aWEgcmVsZWFzZSgpLg0KV2l0aCB0aGF0LA0KDQpBY2tlZC1ieTogVml2ZWsgS2Fz
aXJlZGR5IDx2aXZlay5rYXNpcmVkZHlAaW50ZWwuY29tPg0KDQo+ICsNCj4gKwlyZXQgPSBkbWFf
YnVmX2ZkKGRtYWJ1ZiwgZmxhZ3MpOw0KPiArCWlmIChyZXQgPCAwKQ0KPiArCQlkbWFfYnVmX3B1
dChkbWFidWYpOw0KPiANCj4gIAlrdmZyZWUoZm9saW9zKTsNCj4gIAlyZXR1cm4gcmV0Ow0KPiAN
Cj4gLS0NCj4gMi40Ny4wLjMzOC5nNjBjY2ExNTgxOS1nb29nDQoNCg==

