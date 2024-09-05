Return-Path: <linux-media+bounces-17654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2EA96D2B7
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 11:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0FBD1C229BF
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 09:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1925F19580A;
	Thu,  5 Sep 2024 09:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9mGSt0x"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E280819258A
	for <linux-media@vger.kernel.org>; Thu,  5 Sep 2024 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725527085; cv=fail; b=rES3uO3mztJCEYBnQIizbqeOyob9fqM6KmqfLqxMLPdZ1B0UbycYxqXoq+cy6Q1qppaQPhTZlGfRxYYQRjz1D42qMoKT61z4qb3LqrI/kE7IKMzUy0QpjYjnE3j/xd4Ce68glH3DcTSZKICwI5KnV9iS/b+nEkoNDEDXPXqYPY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725527085; c=relaxed/simple;
	bh=tbIgAGl49G6tIP44NRDtGM74Z+8Od+x2nbDD82dE0GM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XCpDoNb7uGABbBhPHpFiVuNJvrS9jFbs7k/pSQN7NFSoR7vZj4mezDTPHNKk32xka1kkWlfrbNeN4B4JGzsppFn1EaNGwtp+VneGX/Lnv2Uq3ygwOc+9Gm6Cb48GU8hVNYZPFXqvC3ecydXh3XkVHQ8Q4tgEXYVO7Ajc1WbBSYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9mGSt0x; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725527084; x=1757063084;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tbIgAGl49G6tIP44NRDtGM74Z+8Od+x2nbDD82dE0GM=;
  b=X9mGSt0xxxyWBBBOxZKWF50zuh+qZ0iJ+aJ4lVCQfxrb18aDs+pfDuoo
   eGKDJqxx5pMJ0Jni8UtbYmH9PcBZQ0E1sLvgdNuMa7vqS3nRyHxrfGBAu
   gAu3fuxR6BtM3D1Vvp7twAVFXhY0IOoy2awspxu+cfyPBNzO8VTuAYoQM
   0SB7GQsilf6D/1UO94erLXtUg21W0dcJfldF/5raoFgHmenvTxcPPBbaH
   do+fo9CcgZ/yUHlNeAtS23ZOsmSRusTRl11PBkFlRUcGOKAzK4O2b3YDC
   2v6pLBEsI64XPSzKtodOAEhJTaFTf/NMo9dxYrxm6VPUk5zC+7Nauqv6V
   Q==;
X-CSE-ConnectionGUID: VBkcRDsLRO680hIAjGmKGA==
X-CSE-MsgGUID: TmAkyu5RRI64oBAE10oPBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="13383678"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="13383678"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 02:04:43 -0700
X-CSE-ConnectionGUID: zUeHNdR3QBWFqnC6mIFrIg==
X-CSE-MsgGUID: W/HN5GaSSBexbRFpSAf5gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="70359265"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Sep 2024 02:04:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 02:04:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 02:04:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 02:04:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kfa4gd816tkeCmfRlGPkyYTcA/7ODyz2t4kczG7SvuhlY5mo3pnYQSG5PN/a6P01/ahwdH0UvFrkiXRLmLz5dF4/Tgo2ii3nzg/FmjkOfZ00ZDHdhyTlroPWKMqZ4oztpR8No1PHgvR5rToCFzVDEsjMjm60Z4GCnnCk66WGo2XAsZCu7xxK9GiZgdNe4JyYOP2x9hXSjJWLDgfDsV58JCKoFFJVGRax8jaCEXidM0HltRYbuwfxbgfOTLrATIHmpvbPWx858TwkacF8hSnJbOrMm34r8Fq8vYEMgZ4bZqCZsb31ztzp/qU6p/R4ajzl/f3xGHTBMIfxrJPJipiTGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbIgAGl49G6tIP44NRDtGM74Z+8Od+x2nbDD82dE0GM=;
 b=t7ueN0xtPCV6hKgQNKPAVEyr/Vw5FDcXu9kAiD05a2tQIUv01RjyjE7s+YOhISZpS4oHONjmju2JZ4jn99yUYDxeQlcQg7SBf66C68Jk/27BaZsrmL5nP7QrAz1BbUPMG8KvG/GaxudIeDM0buuTUn7IQy0fiV1rK7S7pRVdvF6oDDCbgooHLrBzN1KveabtM8N9qjO1HN7xFPTA7gWF6xSRCu7m85z5qcQ390gKV+jWRczGe1XEqFN8iZa5JaiPzrT876/13CpHTUSeNb0yP2mqf+DUeVFuxSoZMXdBG13pXuTtEXEuIbDjpspERod74+TsAe+9/QSi823UJba14A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA2PR11MB5131.namprd11.prod.outlook.com (2603:10b6:806:116::9)
 by CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 5 Sep
 2024 09:04:40 +0000
Received: from SA2PR11MB5131.namprd11.prod.outlook.com
 ([fe80::6519:dade:ea33:942c]) by SA2PR11MB5131.namprd11.prod.outlook.com
 ([fe80::6519:dade:ea33:942c%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 09:04:40 +0000
From: "Hu, Jerry W" <jerry.w.hu@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"libcamera-devel@lists.libcamera.org" <libcamera-devel@lists.libcamera.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Kieran
 Bingham" <kieran.bingham@ideasonboard.com>
Subject: RE: Interest for a libcamera workshop in Vienna - September 17th
Thread-Topic: Interest for a libcamera workshop in Vienna - September 17th
Thread-Index: AQHa4ZXhAlWEHIy3FEWQEjMpMMPixrJJIBuQ
Date: Thu, 5 Sep 2024 09:04:40 +0000
Message-ID: <SA2PR11MB5131B121A4F3745C6EAD4206D39D2@SA2PR11MB5131.namprd11.prod.outlook.com>
References: <20240729090042.GA2725@pendragon.ideasonboard.com>
In-Reply-To: <20240729090042.GA2725@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR11MB5131:EE_|CY5PR11MB6392:EE_
x-ms-office365-filtering-correlation-id: 5ebc7d24-12c0-43dd-a03e-08dccd89c699
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b25CN3B4NVRGSTZTNlU1U2hlWDBHOWhxOW9hQjAxZjFiNjE5TWNKWDZ1RTJw?=
 =?utf-8?B?Zm9qUW8ybzhyTllGYmVkUXFLdGZHc3haeUYxZ1VnR0MwcUwzN2YyTmJGbWJV?=
 =?utf-8?B?Mm1HZzNKa2RRajBOQmpPMHVLeE5jQ2lGcHFoc2lSNENLZnROSjhPaGZSelpW?=
 =?utf-8?B?OG5hK2xQckdHRDZ2R2o1U1ZZWW5LQ1doRWFxbDNmUGVBZ2JrUlpxdkVjczVw?=
 =?utf-8?B?Y3hxQjM4UEdvSllKQng4cE1kdWQyY291a0tUSGUxdXo1WUVYUXQxcUhaTEFZ?=
 =?utf-8?B?RGtlRFZxWDNQTng5TUw0UXlFWHpGZ2FkNFhEWjdwUE01YWVjVUxCcVROS0g4?=
 =?utf-8?B?aVZQc2xBbE1QVndvUWg3MnVTSC9XQStMZzVZK2h5ME93aHh4RDQ3dERmSzZP?=
 =?utf-8?B?bmlCUGl4VmxTOW83MUNMaEQ0Q0pwUjk0SklLSzJrWWdxYTYvSTBLZnBTYU1N?=
 =?utf-8?B?ZDREVWlqdGc0R1hrRlhncnloUkxvMElLM3FXaVhHaWtkMnB0OWx5VGlNT1NM?=
 =?utf-8?B?ZzVabVdvZG1BVUZsS2M0eFUrSzYyd3lISzdkZWlpWFk2ZlVwellwOFB1Uk9Y?=
 =?utf-8?B?ZEFVSW92emhGdXZXalVteEMwMkNjdDdoNHBSem5EaDFESWsvTHBjZjd4cjUx?=
 =?utf-8?B?YUtVOWxUcDFmYWJYK0JHOTRkTUdVNktqbEtSUGthM0s3dG03QmdLT21zOWxL?=
 =?utf-8?B?RVZ0bkYyVVVuYnNBaGlNL08wcWNMaUVaeldTR0pFOTJZNDczZ0t3Vk1mSnNn?=
 =?utf-8?B?M1pPZTYvU01HYXBTMXJqeXRIQk5KRFRsWWNCNjg5MTNHZmswai90RDk3bUh2?=
 =?utf-8?B?MnppdUI5UWFuNWYyTnR6dlN4UUc3eHU1aGlybjNIb3VxcWtEVzdxaW1vTURy?=
 =?utf-8?B?RE8yR3pYejdQOC9FdndBNE1UeWxLeDgxZE9ybW40Y21CZ2Q3eDhETEdwcHpZ?=
 =?utf-8?B?Z1grNHBFZ3o4a2VYR3hCOWdkeTZESWZMeEZGTHlmN1NyaTJVeEVHQmVFaEM1?=
 =?utf-8?B?bG9ZaEJXamNnaVNSaW50SjZzejVZVnhNcWxhQ0pJeWdleDZCdEpxdk1ucHJn?=
 =?utf-8?B?eXgvS1M4S2U1NDJ2bVpwR1VQVzRvK2hrclpPQWE1RnBpUnBYVzQrUC93eW95?=
 =?utf-8?B?NTBCNmx3S3NEZFUyZlliWEw3ZWRoTDN5Z1g2bjdkT3A0M1ZCVXdzVDBXRmxU?=
 =?utf-8?B?dXl3VlhUMFBBeGxIRm5FbGZnNG5uRTcvbVFmU3B6bG1IeVp1N2JaT2lYc25B?=
 =?utf-8?B?VCtBMXRiNmRGaHd1b09wZEpzTkYwaGFoN3lhSDRjOXVMeGx6MjZBY1JpZlJG?=
 =?utf-8?B?MmF6V3JxbHJHLzJOTk1Dc25jeEN0aGJlQVpGcW90T0hFYTNENTdGMHQxK3hT?=
 =?utf-8?B?TUlQRzdKY1lsMnY1Um90THBLWFlVN2loRGNUREpVL3VoaVRCTjJBbEdEd2Ja?=
 =?utf-8?B?TFlyRFVndUsxQU5qUFVHc3FtUzJmWGdvai9JdDRSeXdqb1pLUE5tbS94V1BJ?=
 =?utf-8?B?d3BaeklXRXc4N1F5R1dISVlyK0RBVjhVdlZwWnFTQi9KdFdjbGVaZjI1d2xx?=
 =?utf-8?B?MHlDZUhYem9Qd2k4VklIQ0hjdjJobGNZTTVJbkx2SDNmSTBnT3laK1huQ0cv?=
 =?utf-8?B?c1ZSd1pyV015aTdxaXVobDBxcEwySFZnU2E5Nk9NcC9IOGFURXBDaXNYZys2?=
 =?utf-8?B?ZTM0T0hUdi8vV2tIYk9GZE95YVRDcnVzQ1pMT0kyTjBWd0tZUTNaNU4rQTJ0?=
 =?utf-8?B?MzBIVDlMSTl6NWhDL21nRzBOc1E3Q25HR0lSamlmODhpZUVya1JnMGtzcHl0?=
 =?utf-8?Q?QZqpQLwhw3gmTqEJj5jwRzmQdCOWqeC8i7xEM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB5131.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VG41WW5LRCtjZ2RpMm0wNmxqeGgwdnlLbXgwSW41ZFVtdDdjYWJXa3BQUDhB?=
 =?utf-8?B?b0RJMUY0UmRLbjczK3J1M1BnazhMcVJUclJ1V01lQkZiaGdoRXpURjlFRkU5?=
 =?utf-8?B?SHdNZjBuUTR1RUJUZEFMQXlzanpzcVAzaUN5cXB5VysyV2ExRjJVK0ErWVVG?=
 =?utf-8?B?Q1M2ci8yd0xlYTByTmFXZi9VL0lWaFNFR2F5emloYkdXZU5NamNvYnd5c1Rq?=
 =?utf-8?B?aG52dzJuZitDU005dTdDN0JGRWJ5ZTIxL1ZxYXJ5Z0EzSUZ3SUVpcE9NS3d6?=
 =?utf-8?B?UE94MTJwcFU5SitiT2VEZTNXeEMwQWNFVVYzbXlKYlE3MS9XOG5EbzlPNHNL?=
 =?utf-8?B?aExhMGhDNndwLzlQZTNaaC9JMFNtL0NtNlNHdmRZUjNIcjBKN0lXNUpha2dr?=
 =?utf-8?B?Nml6MEdqcko0VVdmZmUxelJPMmZ4L0U0WW5mdXRVUEJySHlva214MlFXRG5m?=
 =?utf-8?B?OTZDbnRYeUI0RnZHeXB2Y1JkSnNUTVlaVXUvNTB3YzlJY3NxYzdGN1NrYThZ?=
 =?utf-8?B?TTlQQkdTdTZ2T20zMUJ2bm5jUXJCNklkYllJdFo5N1htdWVEODJHSDBDdW1F?=
 =?utf-8?B?Kzc4ZTZDYnpVL2d5ei9vbmlpMERPdXJ5ZDlyOFBySVZVVFZtQ0JraWUxUlBD?=
 =?utf-8?B?UXhOSnFqOVFYSmpHU0pKZjcyMTRvWUhvczRLd2VhZ1lUUWcxbjlNNWhCU3Nv?=
 =?utf-8?B?ZGxJNzljKzlGbDd4eEFVWFFPaG1ROW9GVGtHMWppUkVzWE93MHFxcThNZ01B?=
 =?utf-8?B?NldtcUlVZ0Ztelp1d3p0MlV1Z1VHTW1iaUp2dm5sOUNoUVNOdmxnODk4MGVm?=
 =?utf-8?B?ek5jRVpSMGRKTXdMM2lxWEdLSkI0MUNrZGllVFpkV3ZHWFJlVURVbTNGcUVN?=
 =?utf-8?B?elFURm9wQk1VSkxocjFicE9CZ25TK0ttUFlRY0ZxU2wwRGUzZnhUQkpIL3pF?=
 =?utf-8?B?ZUNlMDFVNjFMZ3RucGdNRjkzSkx6VnlMY2wrOVFNcCtuWDdVWWJxZzEwWXdI?=
 =?utf-8?B?Rm9ib244NlJvQjVVekdFaEVtRHRUSWhsY1NFTGxRNjN1bDZ4dUtxd0p5LzRW?=
 =?utf-8?B?Ym1VallUU0pqb0pJSlNKUlF6MU9BZEJYZ3VVSlAzdFZocklyTkhCZHJlMVFo?=
 =?utf-8?B?Sm1URVR6SU1YWHVwTDhyeC8vZE54ZTA3S2YxTFd2bW1zY0xPQm05NDA2aCta?=
 =?utf-8?B?bjZjRTVXc3dqUHp3S3hqTGpySlBaUUFqZi9WNm1vSDhkRHFhRlR3MlNIUlRJ?=
 =?utf-8?B?V2VSa0htQ25wN2paT1ZVbGRoQWZWYmwydmFMZmFiaWFhaFQvdHVKYVZmQVJQ?=
 =?utf-8?B?azVuR3dkMG5RN3J6eE9SZ0szZ2E1T2tWRXFQelZJU0VxK1lpY1JBS1ZJcFJW?=
 =?utf-8?B?a1FDTWN6WnNFQVdoNmJYM3JWUmNzbDQvaEY1QzJWQVhka2Z1Q0NVN0ZFRkRO?=
 =?utf-8?B?WWtndjZsZnhjWkRLL1JWUi8xVE5MTXhuQW1xUGhjYmR0R1pOQjVuTGFpY0Ew?=
 =?utf-8?B?b0ZNckJJUFh6QytFTlZPbGV0eXN2Yzd3Q1FPd2o0TjZ4eXFEcGZvRC9mYUdQ?=
 =?utf-8?B?VExhY1IrMTl1d3ZFSG9FUmdZVWMwcm1LazZlTVM5U2hEbW9tbnhkUUlIMnZR?=
 =?utf-8?B?WmI5U25JeXc2MDk0U2l2bWNQSlhOSCtmRHNzdTBaM0Z0cmI2NVdGNUx6OW1L?=
 =?utf-8?B?R0R3RzRiUlpMUlN1aEorbytTeHY2N3lnQkY4cWpCak9HTlgxUGgxTG10aUU5?=
 =?utf-8?B?UVRiN3dkZFg5ZUdERTZhd0lwL3B1ZnNmNE52QkJSSUM4UmR1N0h3dWZXU2p6?=
 =?utf-8?B?ZjNKVWM1T3dsZTMrWGFPYnVyVFF2U3NlNWZMTVRxT1NMNFl0YUtSZ1JJenRv?=
 =?utf-8?B?cVN6ektrWVpaWHJqalkxSnR2Qmw3MUpsSzAyK1NSaFFMWUhEZEJnaksrbmls?=
 =?utf-8?B?cmgwcUUvcVl2ekhLVmFoVGNybWNjTWRnQ3VHL1hVai9JY2xRdlV2SCtINkpR?=
 =?utf-8?B?Y1lCTFpJMTkyekt2ZHc0VWJjNlduOEd0dVBXOXV4Nm9kbXVBM2xaUWtmTjhx?=
 =?utf-8?B?REIxdkcrSGFRc1QvZ3V1VU1qdzVaQ1FSaGtCand5clZ5TzdmZUZvZ2xrNlgz?=
 =?utf-8?Q?DS1o0hG8NC7458aT4UpuDAFs5?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebc7d24-12c0-43dd-a03e-08dccd89c699
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2024 09:04:40.5390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7OdbBDOoXOrcPLyEniCF90p83TyGbuQLAEcOBeLsoo6SRcdG6ZOLcghMFGil7wDx1JXxd++dRIhcfQHACk8pnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6392
X-OriginatorOrg: intel.com

SGkgTGF1cmVudA0KDQpXaWxsIGl0IGJlIGFuIGludGVyZXN0aW5nIHRvIGFkZCBmb2xsb3dpbmcg
dG9waWMgZm9yIGRpc2N1c3Npb24/DQoNCiJQb3N0IFByb2Nlc3Npbmcgd2l0aCBQaXBlSGFuZGxl
ciIgVGhlIHBvc3QgcHJvY2Vzc2luZyBpcyBkb25lIGJ5IFNXIChvbiBHUFUvTlBVKSwgdGhlIGZs
b3cgdW5kZXIgcGlwZWhhbmRsZXIgc2hhbGwgYmUgY29uc2lkZXJlZCBhcyBub3QgSVNQIHZlbmRv
ciBzcGVjaWZpYywgZm9yIGV4YW1wbGUgIkZhY2UgRGV0ZWN0aW9uIiwgaXQgaXMgSVNQIGluZGVw
ZW5kZW50LCBidXQgZGVwZW5kcyBvbiB0aGUgZmxvdyBvZiBQaXBlSGFuZGxlci4gDQoNClJlZ2Fy
ZHMsDQotSmVycnkNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogbGliY2Ft
ZXJhLWRldmVsIDxsaWJjYW1lcmEtZGV2ZWwtYm91bmNlc0BsaXN0cy5saWJjYW1lcmEub3JnPiBP
biBCZWhhbGYgT2YgTGF1cmVudCBQaW5jaGFydA0KU2VudDogTW9uZGF5LCBKdWx5IDI5LCAyMDI0
IDU6MDEgUE0NClRvOiBsaWJjYW1lcmEtZGV2ZWxAbGlzdHMubGliY2FtZXJhLm9yZw0KQ2M6IGxp
bnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFt
QGlkZWFzb25ib2FyZC5jb20+DQpTdWJqZWN0OiBJbnRlcmVzdCBmb3IgYSBsaWJjYW1lcmEgd29y
a3Nob3AgaW4gVmllbm5hIC0gU2VwdGVtYmVyIDE3dGgNCg0KSGVsbG8gZXZlcnlib2R5LA0KDQpG
b2xsb3dpbmcgdGhlIHN1Y2Nlc3Mgb2Ygb3VyIHdvcmtzaG9wIGluIEJydXNzZWxzIGluIEZlYnJ1
YXJ5LCB3ZSB3b3VsZCBsaWtlIHRvIGhvc3QgYW5vdGhlciBldmVudCBpbiBTZXB0ZW1iZXIuDQoN
CldlIGhhdmUgZXZhbHVhdGVkIGRpZmZlcmVudCBvcHRpb25zLCBhbmQgb3B0ZWQgZm9yIHdlZWsg
MzggaW4gVmllbm5hLg0KVGhlIGNpdHkgd2lsbCBob3N0IGR1cmluZyB0aGF0IHdlZWsgdGhlIExp
bnV4IE1lZGlhIFN1bW1pdCAoTW9uZGF5IHRoZSAxNnRoLCBbMV0pLCBPU1MgRXVyb3BlIChNb25k
YXkgdGhlIDE2dGggdG8gV2VkbmVzZGF5IHRoZSAxOHRoLCBbMl0pIGFuZCB0aGUgTGludXggUGx1
bWJlcnMgQ29uZmVyZW5jZSAoV2VkbmVzZGF5IHRoZSAxOHRoIHRvIEZyaWRheSB0aGUgMjB0aCwg
WzNdKSwgYW5kIHdlIGV4cGVjdCB0aGF0IGNvLWxvY2F0aW5nIHdpdGggdGhvc2UgZXZlbnRzIHdp
bGwgZWFzZSB0cmF2ZWwgZm9yIGF0dGVuZGVlcyBvZiB0aGUgbGliY2FtZXJhIHdvcmtzaG9wLg0K
DQpUaGUgd2VlayBpcyBhbHJlYWR5IGJ1c3kgd2l0aCBjYW1lcmEtcmVsYXRlZCBldmVudHMgb24g
TW9uZGF5IHdpdGggdGhlIExpbnV4IE1lZGlhIFN1bW1pdCwgYW5kIG9uIFRodXJzZGF5IGFmdGVy
bm9vbiB3aXRoIHRoZSBDb21wbGV4IENhbWVyYSBtaWNyby1jb25mZXJlbmNlIGF0IExQQyAoWzRd
KS4gV2UgaGF2ZSB0aGVyZWZvcmUgc2VsZWN0ZWQgVHVlc2RheSB0aGUgMTd0aCBmb3IgbGliY2Ft
ZXJhLg0KDQpUbyBoZWxwIHVzIHBsYW4gdGhlIHZlbnVlLCBjb3VsZCB5b3UgcGxlYXNlIHJlZ2lz
dGVyIHlvdXIgaW50ZXJlc3QgYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwsIGVpdGhlciBwdWJs
aWNseSwgb3IgaW4gcHJpdmF0ZSB0byBLaWVyYW4gYW5kIG1lID8gVGhlIGV2ZW50IHdpbGwgYmUg
ZnJlZSBvZiBjaGFyZ2UgZm9yIGF0dGVuZGVlcy4NCg0KUGxlYXNlIGFsc28gbGV0IHVzIGtub3cg
aWYgeW91IGhhdmUgYW55IHByZWZlcnJlZCBkaXNjdXNzaW9uIHRvcGljcyB5b3Ugd291bGQgbGlr
ZSB0byBpbmNsdWRlLiBXZSB3aWxsIGRyYWZ0IGFuZCBjaXJjdWxhdGUgYW4gYWdlbmRhIGluIHRo
ZSBuZXh0IGZldyB3ZWVrcy4NCg0KWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hZTNi
NmIxMS1jM2VjLTRhM2QtOGZhMS1jOTFlZjJmOGUxNTFAeHM0YWxsLm5sLw0KWzJdIGh0dHBzOi8v
ZXZlbnRzLmxpbnV4Zm91bmRhdGlvbi5vcmcvb3Blbi1zb3VyY2Utc3VtbWl0LWV1cm9wZS8NClsz
XSBodHRwczovL2xwYy5ldmVudHMvDQpbNF0gaHR0cHM6Ly9scGMuZXZlbnRzL2V2ZW50LzE4L3Nl
c3Npb25zLzE5My8NCg0KLS0NClJlZ2FyZHMsDQoNCkxhdXJlbnQgUGluY2hhcnQNCg==

