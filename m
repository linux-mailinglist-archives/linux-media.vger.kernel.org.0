Return-Path: <linux-media+bounces-52949-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKY0HrIGlGnX+gEAu9opvQ
	(envelope-from <linux-media+bounces-52949-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 07:12:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A014C148F45
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 07:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF544301BC03
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 06:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65BC299A8F;
	Tue, 17 Feb 2026 06:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FehdY7lB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35E11C4A20;
	Tue, 17 Feb 2026 06:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771308711; cv=fail; b=RyYGgA5BNGf86H8f8cdOaPN+YOQcQ36aHxzejq5AI6Li2ixdvFsw8qgEvFsAuKj0ZZULZfUkBuTe1NZYV+44Kzb1KIHYLKmtHTyBBqZlc3HowIxPERAsKGesgFQAy+UQg5zxymPQ+0dUOFByU3u3pQA9O/STPpp0SpJ4q6AsPrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771308711; c=relaxed/simple;
	bh=lSovhw7CQlVOfS53vYA4y3bsAn0J87E3QWIz98/8T9g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XaF+NGrsu1QpMLqWApixthLsoYPZB00zTeBtehJrbzcStmquYs0BTLSqT766gwUmFgbOu/c4eKD0uxIf9c72hUOyJGOTStE/n9Dag5vvnUGqLpY5HhJbogTruRg6zKJJKt1o4vpvvJjZSwlNZSzzLBADibCs0cC5Ifqh9k07tmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FehdY7lB; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771308709; x=1802844709;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lSovhw7CQlVOfS53vYA4y3bsAn0J87E3QWIz98/8T9g=;
  b=FehdY7lBwObDu4FPatBJQoE8/hBAMlXfdqrRpRHRK16Okkj8YquMhz2B
   7N151N8iGOj5WHuP6SKfQTBHG7xhP+QoYWbqaf232AFuGMF6DzokegYYx
   p0CV1jXoAH5hMhyuxq4ld0d9RcT7aaogtvqfj6hGmibCEd37I6nUT44Px
   EjLa/f2NRdAmZ+9OiqnXalk4MTlFaDTyS7mO3Y7KSboHz4OJZwk1HvcNY
   HcYzFmJYfuKwOmOfj4oF9Q3ToLlUM8dYC4gCDdE851Y7na7+ctXab/M5M
   EUdefTescUFQDwAcjFYesvyehHbb1IcM+9d/Hak+599ZJZtOXRK8knQBN
   A==;
X-CSE-ConnectionGUID: QrVexhg1SXKeKKaEzUW5ZA==
X-CSE-MsgGUID: S8Z+FIU7QKGiWDpxMkq6ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="97835851"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="97835851"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 22:11:49 -0800
X-CSE-ConnectionGUID: TZrSOU8sRxKovkHt7bOHVw==
X-CSE-MsgGUID: 027Gcj4EQZqqDAGe40+M9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="218327604"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 22:11:49 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 22:11:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 22:11:49 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 22:11:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxIAX6eg9ojmvBO3KhAFV88ktUexzyhJI1qnxqZjeVLm9ERNn7JPe4Ej5kdgwVCRCb5wmHimFO/xlgftwtj6Dj4HsgEqOq2XnZeMrsNKYPw7r+GXZc32OR9di/30DF1DDGPG5FxRUZfsVCpdYjcJ1lu3keIxJZb78pdstab9uGuTHnav0Bko1i5a21CLRZTNueyd8EhWHLAkXBA+xTkKhF1dCv1+ni+05FCi7y2SK5CGx+aV97wGApB7Gk3a+sPdzznO6L11sD0V7R99SzUl/Jty0gBobXALliKvQOGcvp+8CHOs3rhuqY4UQ0oOnfP9hJqW3yoyBFFY55+I+wTCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSovhw7CQlVOfS53vYA4y3bsAn0J87E3QWIz98/8T9g=;
 b=w+AwrBoXdGK/VbKhZ9kGJFlKmV06U+U4m8KM4MviOx/VRSZ5ERSAOWjrLXhaKtotPB7lfN9l8wz3BsA8eWV63qnKqoGCKjMm4SL8V9+uY1OBaHCfLBNE4zwcO90FVEvmQk2Qv6XcBmtPn3jE8V+ZF9KBv7BvpMgUjwf1e6sPcm9ozBSpWg2Qf4jwEF+AekXP8L4BivTy1j8lB1Hv5m623vj96X3jg16RYvDzJQoSUuSi4/eLIuS3x1QYn+mvOCOd8tEWOvU8HigLaVAfZydSfyThDgDYjgbr8x31LR+faMU+J65oRbhG87h/XaSC5Me1Qe5Vgorz8Y6Oq17EGlMePw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14)
 by IA3PR11MB9375.namprd11.prod.outlook.com (2603:10b6:208:575::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Tue, 17 Feb
 2026 06:11:46 +0000
Received: from SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce]) by SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce%4]) with mapi id 15.20.9611.012; Tue, 17 Feb 2026
 06:11:46 +0000
From: "T, Arun" <arun.t@intel.com>
To: "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] media: i2c: ov13b10: Support tps68470 regulator and
 gpio
Thread-Topic: [PATCH 2/2] media: i2c: ov13b10: Support tps68470 regulator and
 gpio
Thread-Index: AQHckcrreo1QZ7XwskOGu5shQMdbp7VviO8AgBb7JqA=
Date: Tue, 17 Feb 2026 06:11:46 +0000
Message-ID: <SA3PR11MB802244F8C5FD80539D92C6BC9D6DA@SA3PR11MB8022.namprd11.prod.outlook.com>
References: <20260130092431.2335363-1-arun.t@intel.com>
 <20260130092431.2335363-2-arun.t@intel.com>
 <591ac511-d339-40d1-9cae-299e068a9b17@oss.qualcomm.com>
In-Reply-To: <591ac511-d339-40d1-9cae-299e068a9b17@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8022:EE_|IA3PR11MB9375:EE_
x-ms-office365-filtering-correlation-id: 61e1910a-9380-49c0-468f-08de6deb6e30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?dGRKcFBKSUJxR1VxWC82RExCM2JSbkVSZHo4TU5WS1pCMWc2WXhoZkNuWVI4?=
 =?utf-8?B?YmMwbmgvVmlsT3Y1QkdDTHBEOEp2SGZNeUZvbFV2aTJ6VUNPajNEb3lRZUU1?=
 =?utf-8?B?TG4xL29FWC9nQW5lMDRjdGFzMXo5c1dsc3VyRWJwaGdWRUw0ZGpMWml4VjBv?=
 =?utf-8?B?WUd0YS9UNGNxRExXTHdGcnBMYllGNkVVYndTbVNacHZLM20wK0NpelROdG5L?=
 =?utf-8?B?bGJmMGh5ZklmTWpXM2JZUk5tMHlDSVVOcXRnUjgwazBBTTNtVjJoSUJQT2M4?=
 =?utf-8?B?Y29JQWpGcFB3SlBIaTdRWnp1eGVobUh1ZkRna0hvQ2FCM25PaTZkODJsOWJD?=
 =?utf-8?B?dXNBZWRyRitYbDZzVU1qaVZ3ZkZQMVRUeUREMTl1RE5IbVFFVW9rZEZEUWNL?=
 =?utf-8?B?ckdFcnhSdFJyL1QwQ0hWR0dEcXM4L2QyNG14QVJzQnpnc0hyRktDMmlENSs5?=
 =?utf-8?B?UHppTHVKcGJkT0VzcG5BazZyM2dkd1lvQVpXcFBYd3lRSGxDRVZEWGhMNkZU?=
 =?utf-8?B?UmtId2pnckhiZUdsMklOdXBzaHJ1SW0xbnc0WXFrTGRFMVZrU0hSOGtvNW1K?=
 =?utf-8?B?YnE2V0U0RW1yaDU5N1pMcEZ0RW1tcGRhbVZxSDhNODBtSFhUTlFjVS9vclNp?=
 =?utf-8?B?dXpvYVJ1RjhYR3NFdzFIbHl6OUJxTjIzZW1RdFdPd0N4MGIxKy9JSnU4cXRL?=
 =?utf-8?B?cHF2anpDU0RhYks5eXAwb2FoMGQzTEV0UkhWNDA0L05ucElEOVFIZzM4Skxh?=
 =?utf-8?B?ZDdjYm9CTVpIMGh2L1FBZkc1aENwZDBCdTVJTGZqbTJuQVdNZWgvK0wrZ3hO?=
 =?utf-8?B?UFNjbC8vUTd3Mmk1b2VqWms1dlBPRlNmNlpRMFpkN1lzd0RmSjdadDNkTEdX?=
 =?utf-8?B?VTgreXlYeGswTngwV3U4dUM1c0YrKzhuSTJwcyt5QUNUemNnaHE3SDV4VENT?=
 =?utf-8?B?UVY1anJzQTZqemF2K3Yva094U093ZzJSUnI5aldtcnkvbVdrUXhGdUFxbjVN?=
 =?utf-8?B?MWlVVnhJWVY2djA3eFFHc1N2NGZzNmg5UzR6MGJJRWJYUGg1SFNkUHdsZHpY?=
 =?utf-8?B?WWdXNURPNUhJeXhnZHN4cnYxNGo2dTA2dkZacWRWY3Y2VWtDSEU0ME0rVHBx?=
 =?utf-8?B?M0lFMHBSak40MGZVSUJta3pCVXV0WG1PQmZSanVzRFh4SHNBayszTDRRRkc1?=
 =?utf-8?B?Zk9XQmhRb3FMRlAvOXBKUEdRL0dIN2RmcjBNZTZTZzg2dStmNFRkbFJwVXVI?=
 =?utf-8?B?MjdZdkJqSW9XVEV3bXRMaWxDSS83N2RlcG9pWSs2dG1JVkFKamtTQjFsclRl?=
 =?utf-8?B?WmZhWEJOK25qMHA5QzJXa1lROW1TQ1ZZUFVJMFJGcnpFRnRVQVh3TGQ3Q0dw?=
 =?utf-8?B?RjJiVW10M0NwcGxUTE1vLzlONG11alBwOWhLRDhNMlJEUDhJMzVpdDZEYmVL?=
 =?utf-8?B?eHFHVEsrSFJ3QkdKdk5KV0hUeXBqVWFDdkNLcVdPemppMmhrb0tHeXlCaERG?=
 =?utf-8?B?eFJ2enpBRXRnTy83Nk1icDJlY0c3cDRjRzVaR2w0TXRKSGVCMlZrZ1grUytR?=
 =?utf-8?B?cTFWNDE0R3hweFlSMVdCM3o5SEd6MDQvYTRsQ2JVNjVEcTQwTlNNSXNlN2t1?=
 =?utf-8?B?UjRadS9LNWpqMmcvbzh6TXRwdkEzQzRBSWRuUUE2Ny9NMkVET1g5U1BZWHhG?=
 =?utf-8?B?aHlVTVhXOWdpNmh3RnpwSGsrT0YyR2JEd2xnTFU5VnRuNjQ2SFlHc3NPbUhs?=
 =?utf-8?B?dTNZZnhzYk94dTNubUQrK3VLaEdlRzd3NTVzSnRnaXhKSGNqVlU0WTFlVkFY?=
 =?utf-8?B?enNQUzg5YmlBbjZyMEJqSGkxc0JKSXdpdHBXS2hhZ3hDQ1kxQ2hSOXpqYnBQ?=
 =?utf-8?B?amNLbFducjNpQnhZeStScElVdzI5NFhKdGhjejJKZXF3WTBSTmIvbXNzSGRm?=
 =?utf-8?B?U0sxVmFuRnBCeXIwTzUxVU00U2d2WEYwMndyd2U4RjNiRE1NRkRNQmFmUnNu?=
 =?utf-8?B?RVJ2MTRPUnRLSVpId3RRd21HTVpuVjVEMzY3Nkd4RmhuTllkZjFOc3lsa0Rm?=
 =?utf-8?B?UzlhY3NlSFg3U2JDem5RQzY2d2JpdlU0YWZDeWpQSVZ0TU1rdHEyeU9nczZn?=
 =?utf-8?B?Rk1nSnBxZHRlWGJJZWpkWkpQZ3ZtS0RyRldPUjBkczJUMzdZUFZFZHBVTmtE?=
 =?utf-8?Q?15OGcNep+csx0edLbQeRLlE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB8022.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1VDMnVOMHJ6bVRrdEZCMkx2UGFCbngrNU1hdURERytyVjBvNytTYllhL1cx?=
 =?utf-8?B?bFhtZ2tIWlFjTC9nZy80RnRuN0dUWUhTQk0reUV0TUtCc2E2VTg0ejdZOFFn?=
 =?utf-8?B?WW9WWjFVQXFGL0xITElkTmp5alJhWWtKaWRRVGxURkRhRnhjanJ0djBHZWhH?=
 =?utf-8?B?MWJWa0wvSjZQd3dNMkw1SGcxd3dPUk1EQmJEYURwUU1RZVhEc0RQYUw4SEVD?=
 =?utf-8?B?Y3AyWnMvNWVKd1N6MjR2eWpEYkU5Tnp0dVE3UnVPRnFHUEVuUUhrbFpjbmw4?=
 =?utf-8?B?Q3ZTeGxpdzVNM0FYSjU3U2xiMEFXcE03ZWhQNUdoY29TMWhtdktWS051OWFp?=
 =?utf-8?B?WmZaSFl2bWpFMnlaMThVbStKY29mS3FiM2FBbjdYUmpBNVUvQ0JRK0dwWFR2?=
 =?utf-8?B?U0hGUkhnVDNWb1VWTEVYUWg3T3ordldXUUE5aHN2MXVKdjB0UGJEdTRiSkwx?=
 =?utf-8?B?NEZCZzVJU0V3V3VIdWNGaHpSaUVzVE95YUF4cDE2ODYxOU84UDBJQ1FzTzgx?=
 =?utf-8?B?NDdUb1d1aGFBYmp1NEZIT2R5SmhPWExSUlR4VEQ4eFo2VTdlb3pieGF6cjlV?=
 =?utf-8?B?WnFOK0FCOWIrdWtiSndUOTVVeUhYeUtuMkQyaGpGVWZoMk9YK210TURWZitm?=
 =?utf-8?B?VHdNblFkbnlRNENMRGdyeFdjSW9SWEdjcXIycE9LMGxSdXlTeTZLZDJMMDB4?=
 =?utf-8?B?U0JFd2gwYnNPMmNQRWxTRFNrVVVrZ0FUZjlvakVDbm9xM1NLejRqbHFsMDdQ?=
 =?utf-8?B?Tk94SWRFL25YUmJ5OURESjgydkJkcGRmU2RJanRRd1Zpbk5rc1RsSmpaOHNs?=
 =?utf-8?B?TjVKMHA0ZE1hRVVVQmcyZVpsQWwrM05aQmNyWEhoRWgrZVBVR0hRSytoQTZK?=
 =?utf-8?B?bXBYZy95R2JrM3pNS1Rpa1NsOEM0V2xYT0RxYVljbnZGSS9tNGNBR1JJZU9H?=
 =?utf-8?B?SmFlYk9RbHU0VGdNekxaSkNyZDhBdytQZENiUWdlUWEzVWdybVZSdEk5M1RE?=
 =?utf-8?B?UWh5N29JSHYrQjZqbjcyYXlYSGJONWg0dFlzTklvLzZhRXFhbUxHSGNkVzY2?=
 =?utf-8?B?a2hUbmE3ZUR1MWdEQk5HVHFSNDVNK3FlVHRJemtJSTRVek53Ky9qVFllUnpa?=
 =?utf-8?B?Vk1nd2tFOUt4MVc0TUJtbDdvamZRWWgxdDkyM1hlTjAxZkRlNEt0ZkZETnJq?=
 =?utf-8?B?L2lBN0U0enVBNG9qK05vanBScDlnbVFZaTd2U2NqS1ZMK29XL3ZIRFhMSTR4?=
 =?utf-8?B?eUU4NVVzWUhSK2ZqQXphWHZpSEROMzd5MnNaN0lqOTVnVUZXSTE1Qk1BMkZv?=
 =?utf-8?B?dm1URHhxTWVIV3dlVmNvaWE3ME5BbjZWV0lWekI4SEdSeFp0R1RYeit2MXpX?=
 =?utf-8?B?UmcyK0FEYnJwVGJ2STBya0lHRVhha2lHaVlFblR1em5LWE9aVVA4VGxqY2Nr?=
 =?utf-8?B?N3c0S0dHV0RvUW5ObU94Wm9MMjV6TnA3dDRJSFRONGVIVDZnWlpiamRTR0l0?=
 =?utf-8?B?eWNrNXArN3ltRXI2SmZGd0VxRURrYUQ3S2JzcW0wQkErcjBrSFRTWEppU1A5?=
 =?utf-8?B?dnovQW5ranZCbU5qTll5YnZuYnE0RlBtVWpWZHdLVlJ6VFk3NEpnQzA0U1V0?=
 =?utf-8?B?WHp0eEZkcmFWZE1kNGlJTHpydm1wd2tSUVZFYzBDMmJaOXBsZ0ZWeUIvZjF4?=
 =?utf-8?B?amN0Nk82NDVzZHJtZXRMMnRGMWgrZmwxVHN4K3VjeWlDMmtldlpRME11SDYv?=
 =?utf-8?B?TEM2OFZsemd5SW5tQVVXdWhsbEpoc2NRNWQ0UVV0dWFZV1pjTHcrNFpxemFH?=
 =?utf-8?B?K3B3RFB4RXY1bloxSmpWTEw4YkZaOFhzTVdpNHBzMld6VGt2bTBxQnl1VmNp?=
 =?utf-8?B?MG5pRFhkaC9uSmdiZjVaUjdYMU5Qano4TlJLWWhjZVNmRjJ6V0ZDZzVTS1ZJ?=
 =?utf-8?B?T1BIM2xTUmNJSkVBUDkvV3dOYW1Sd2lsQUJtNGdCNzlWYWVTdkl1Nm02VjBB?=
 =?utf-8?B?VDJCY2RzNWowaGpyNGRzZGkxaU4yMEJLcVFJbE9IQis5SjZnVlFPVlNJUkQx?=
 =?utf-8?B?TnFCM0p5V0hiM2ZEUEJwWVRHa1l3ZTlwRDU1ajh0akR4ajZBRmJja3FwOGd5?=
 =?utf-8?B?WUh5SnVzbGphdE5Ha1hiUDBMWDNuNmg5MHp5OTUwK2V0YVBBMkFPS24yRGV2?=
 =?utf-8?B?WXM5Njhzb1czUHFKbjRad2xsdWcwRmhnN2RBME81eU9xcVR3VEZ3dzg0R01l?=
 =?utf-8?B?ZUdNVGtrMnBRZmkwRWptelFLRFZjR2Jnc2RIQ1B4bitJK1lRYmZOMnludVcv?=
 =?utf-8?Q?0iHbq6Y93kKmh1Vj/Q?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8022.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e1910a-9380-49c0-468f-08de6deb6e30
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 06:11:46.5319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q2N0J3b+hRZ2oVzZ6knrdxTKJ9DbOY601PJhSUGa4/DYQ0R/z9ujtvbmFMooVUfpXXTCa3MLdyrx16VYw1uf5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9375
X-OriginatorOrg: intel.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-52949-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,SA3PR11MB8022.namprd11.prod.outlook.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A014C148F45
X-Rspamd-Action: no action

SGkgSm9oYW5uZXMsIA0KVGhhbmtzIGZvciByZXZpZXdpbmcgYmVsb3cgUGF0Y2hlcy4NCkkgaGF2
ZSB1cGRhdGVkIHdpdGggeW91ciByZXZpZXcgY29tbWVudHMgYW5kIHB1c2hlZCBQYXRjaGVzLg0K
UGxlYXNlIHJldmlldyB0aG9zZSBwYXRjaGVzIGFuZCBtZXJnZSBpdCAuDQoNCi0NClJlZ2FyZHMs
DQpBcnVuIFQNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGpvaGFubmVzLmdv
ZWRlQG9zcy5xdWFsY29tbS5jb20gPGpvaGFubmVzLmdvZWRlQG9zcy5xdWFsY29tbS5jb20+IA0K
U2VudDogMDIgRmVicnVhcnkgMjAyNiAwODo0MiBQTQ0KVG86IFQsIEFydW4gPGFydW4udEBpbnRl
bC5jb20+DQpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gbWVkaWE6IGkyYzogb3YxM2Ix
MDogU3VwcG9ydCB0cHM2ODQ3MCByZWd1bGF0b3IgYW5kIGdwaW8NCg0KSGkgQXJ1biwNCg0KVGhh
bmsgeW91IGZvciB5b3VyIHBhdGNoLg0KDQpPbiAzMC1KYW4tMjYgMTA6MjQsIEFydW4gVCB3cm90
ZToNCj4gT3YxM2IxMCBzZW5zb3IgZ2V0IGNsb2NrIGFuZCByZWd1bGF0b3IgZnJvbSBUUFM2ODQ3
MCBQTUlDLg0KPiBBZGRlZCB0cHM2ODQ3MCByZWd1bGF0b3IvZ3BpbyBuYW1lcyBpbiBwb3dlcl9v
bigpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBcnVuIFQgPGFydW4udEBpbnRlbC5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy9tZWRpYS9pMmMvb3YxM2IxMC5jIHwgMzggDQo+ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJj
L292MTNiMTAuYyBiL2RyaXZlcnMvbWVkaWEvaTJjL292MTNiMTAuYyANCj4gaW5kZXggNTQyMTg3
NDczMmJjLi5jMjQ2OWM4OGM3MjIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL292
MTNiMTAuYw0KPiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjEzYjEwLmMNCj4gQEAgLTcwOSw2
ICs3MDksMTAgQEAgc3RydWN0IG92MTNiMTAgew0KPiAgDQo+ICAJc3RydWN0IGNsayAqaW1nX2Ns
azsNCj4gIAlzdHJ1Y3QgcmVndWxhdG9yICphdmRkOw0KPiArCXN0cnVjdCByZWd1bGF0b3IgKnZp
bzsNCj4gKwlzdHJ1Y3QgcmVndWxhdG9yICpjb3JlOw0KPiArCXN0cnVjdCBncGlvX2Rlc2MgKmVu
YWJsZTsNCg0KVGhpcyBuZXcgZW5hYmxlIGdwaW8gZG9lcyBub3Qgc2VlbSB0byBnZXQgdXNlZCBp
biB0aGUgcGF0Y2ggYXQgYWxsID8NCg0KPiArDQo+ICAJc3RydWN0IGdwaW9fZGVzYyAqcmVzZXQ7
DQo+ICANCj4gIAkvKiBWNEwyIENvbnRyb2xzICovDQo+IEBAIC0xNDc1LDEyICsxNDc5LDE5IEBA
IHN0YXRpYyBpbnQgb3YxM2IxMF9nZXRfcG1fcmVzb3VyY2VzKHN0cnVjdCBvdjEzYjEwICpvdjEz
YikNCj4gIAl1bnNpZ25lZCBsb25nIGZyZXE7DQo+ICAJaW50IHJldDsNCj4gIA0KPiAtCW92MTNi
LT5yZXNldCA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKG92MTNiLT5kZXYsICJyZXNldCIsIEdQ
SU9EX09VVF9MT1cpOw0KPiArCWlmIChzdHJzdHIoZGV2X25hbWUob3YxM2ItPmRldiksICJPVlRJ
MTNCMTowMSIpKQ0KPiArCQlvdjEzYi0+cmVzZXQgPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChv
djEzYi0+ZGV2LCAic19yZXNldG4iLCBHUElPRF9PVVRfTE9XKTsNCj4gKwllbHNlDQo+ICsJCW92
MTNiLT5yZXNldCA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKG92MTNiLT5kZXYsICJyZXNldCIs
IA0KPiArR1BJT0RfT1VUX0xPVyk7DQoNCk5hY2ssIHlvdSdyZSBhZGRpbmcgYSBsb29rdXAgaW4g
cGF0Y2ggMS8yLCBzaW1wbHkgdXNlICJyZXNldCINCnRoZXJlIGluc3RlYWQgb2YgInNfcmVzZXRu
IiBhbmQgdGhlbiB5b3UgZG9uJ3QgbmVlZCB0aGlzLg0KDQpNb3JlIGltcG9ydGFudGx5IGJvYXJk
L3BsYXRmb3JtIHNwZWNpZmljIGluZm8gbGlrZSB0aGlzIG11c3QgTk9UIGJlIHByZXNlbnQgaW4g
c2Vuc29yIGRyaXZlcnMuDQoNCkFsbCB1c2VzIG9mICJpZiAoc3Ryc3RyKGRldl9uYW1lKG92MTNi
LT5kZXYpLCAiT1ZUSTEzQjE6MDEiKSkiDQppbiB0aGlzIHBhdGNoIE1VU1QgYmUgZHJvcHBlZC4N
Cg0KPiAgCWlmIChJU19FUlIob3YxM2ItPnJlc2V0KSkNCj4gIAkJcmV0dXJuIGRldl9lcnJfcHJv
YmUob3YxM2ItPmRldiwgUFRSX0VSUihvdjEzYi0+cmVzZXQpLA0KPiAgCQkJCSAgICAgImZhaWxl
ZCB0byBnZXQgcmVzZXQgZ3Bpb1xuIik7DQo+ICANCj4gLQlvdjEzYi0+aW1nX2NsayA9IGRldm1f
djRsMl9zZW5zb3JfY2xrX2dldChvdjEzYi0+ZGV2LCBOVUxMKTsNCj4gKwlpZiAoc3Ryc3RyKGRl
dl9uYW1lKG92MTNiLT5kZXYpLCAiT1ZUSTEzQjE6MDEiKSkNCj4gKwkJb3YxM2ItPmltZ19jbGsg
PSBkZXZtX3Y0bDJfc2Vuc29yX2Nsa19nZXQob3YxM2ItPmRldiwgInRwczY4NDcwLWNsayIpOw0K
PiArCWVsc2UNCj4gKwkJb3YxM2ItPmltZ19jbGsgPSBkZXZtX3Y0bDJfc2Vuc29yX2Nsa19nZXQo
b3YxM2ItPmRldiwgTlVMTCk7DQo+ICsNCg0KU2FtZSBoZXJlLCB0aGUgb2xkIGNvZGUgd2l0aCB0
aGUgTlVMTCBuYW1lIGFyZyB3aWxsIHdvcmsgZmluZSBzaW5jZSB0aGVyZSBzaG91bGQgYmUgb25s
eSAxIGNsayBwcm92aWRlci4NCg0KPiAgCWlmIChJU19FUlIob3YxM2ItPmltZ19jbGspKQ0KPiAg
CQlyZXR1cm4gZGV2X2Vycl9wcm9iZShvdjEzYi0+ZGV2LCBQVFJfRVJSKG92MTNiLT5pbWdfY2xr
KSwNCj4gIAkJCQkgICAgICJmYWlsZWQgdG8gZ2V0IGltYWdpbmcgY2xvY2tcbiIpOyBAQCAtMTQ5
MCw4ICsxNTAxLDExIEBAIA0KPiBzdGF0aWMgaW50IG92MTNiMTBfZ2V0X3BtX3Jlc291cmNlcyhz
dHJ1Y3Qgb3YxM2IxMCAqb3YxM2IpDQo+ICAJCXJldHVybiBkZXZfZXJyX3Byb2JlKG92MTNiLT5k
ZXYsIC1FSU5WQUwsDQo+ICAJCQkJICAgICAiZXh0ZXJuYWwgY2xvY2sgJWx1IGlzIG5vdCBzdXBw
b3J0ZWRcbiIsDQo+ICAJCQkJICAgICBmcmVxKTsNCj4gKwlpZiAoc3Ryc3RyKGRldl9uYW1lKG92
MTNiLT5kZXYpLCAiT1ZUSTEzQjE6MDEiKSkNCj4gKwkJb3YxM2ItPmF2ZGQgPSBkZXZtX3JlZ3Vs
YXRvcl9nZXRfb3B0aW9uYWwob3YxM2ItPmRldiwgImFuYSIpOw0KPiArCWVsc2UNCj4gKwkJb3Yx
M2ItPmF2ZGQgPSBkZXZtX3JlZ3VsYXRvcl9nZXRfb3B0aW9uYWwob3YxM2ItPmRldiwgImF2ZGQi
KTsNCg0KQWdhaW4geW91J3JlIHByb3ZpZGluZyB0aGUgbWFwIGluZm9ybWF0aW9uIGluIHBhdGNo
IDEvMiBqdXN0IGNhbGwgaXQgYXZkZCENCg0KPiAgDQo+IC0Jb3YxM2ItPmF2ZGQgPSBkZXZtX3Jl
Z3VsYXRvcl9nZXRfb3B0aW9uYWwob3YxM2ItPmRldiwgImF2ZGQiKTsNCj4gIAlpZiAoSVNfRVJS
KG92MTNiLT5hdmRkKSkgew0KPiAgCQlyZXQgPSBQVFJfRVJSKG92MTNiLT5hdmRkKTsNCj4gIAkJ
b3YxM2ItPmF2ZGQgPSBOVUxMOw0KPiBAQCAtMTQ5OSw2ICsxNTEzLDI0IEBAIHN0YXRpYyBpbnQg
b3YxM2IxMF9nZXRfcG1fcmVzb3VyY2VzKHN0cnVjdCBvdjEzYjEwICpvdjEzYikNCj4gIAkJCXJl
dHVybiBkZXZfZXJyX3Byb2JlKG92MTNiLT5kZXYsIHJldCwNCj4gIAkJCQkJICAgICAiZmFpbGVk
IHRvIGdldCBhdmRkIHJlZ3VsYXRvclxuIik7DQo+ICAJfQ0KPiArCWlmIChzdHJzdHIoZGV2X25h
bWUob3YxM2ItPmRldiksICJPVlRJMTNCMTowMSIpKXsNCj4gKwkJb3YxM2ItPmF2ZGQgPSBkZXZt
X3JlZ3VsYXRvcl9nZXRfb3B0aW9uYWwob3YxM2ItPmRldiwgImRvdmRkIik7DQo+ICsJCWlmIChJ
U19FUlIob3YxM2ItPmF2ZGQpKSB7DQo+ICsJCQlyZXQgPSBQVFJfRVJSKG92MTNiLT5hdmRkKTsN
Cj4gKwkJCW92MTNiLT5hdmRkID0gTlVMTDsNCj4gKwkJCWlmIChyZXQgIT0gLUVOT0RFVikNCj4g
KwkJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShvdjEzYi0+ZGV2LCByZXQsDQo+ICsJCQkgICAgICAg
ICAgICAgICAiZmFpbGVkIHRvIGdldCBhdmRkIHJlZ3VsYXRvclxuIik7DQo+ICsJCX0NCj4gKwkJ
b3YxM2ItPmF2ZGQgPSBkZXZtX3JlZ3VsYXRvcl9nZXRfb3B0aW9uYWwob3YxM2ItPmRldiwgImR2
ZGQiKTsNCj4gKwkJaWYgKElTX0VSUihvdjEzYi0+YXZkZCkpIHsNCj4gKwkJCXJldCA9IFBUUl9F
UlIob3YxM2ItPmF2ZGQpOw0KPiArCQkJb3YxM2ItPmF2ZGQgPSBOVUxMOw0KPiArCQkJaWYgKHJl
dCAhPSAtRU5PREVWKQ0KPiArCQkJCXJldHVybiBkZXZfZXJyX3Byb2JlKG92MTNiLT5kZXYsIHJl
dCwNCj4gKwkJCQkJImZhaWxlZCB0byBnZXQgYXZkZCByZWd1bGF0b3JcbiIpOw0KPiArCQl9DQo+
ICsJfQ0KDQpZb3UncmUgdXNpbmcgb3YxM2ItPmF2ZGQgdG8gc3RvcmUgdGhlIG90aGVyIDIgcmVn
dWxhdG9ycyB0b28gdGhhdCBjYW5ub3QgYmUgcmlnaHQuLi4NCg0KQWxzbyBmb3IgYWRkaW5nIG11
bHRpcGxlIHJlZ3VsYXRvcnMgeW91IHNob3VsZCB1c2UgdGhlIGJ1bGsgcmVndWxhdG9yIEFQSSwg
c2VlIGUuZy4gOg0KDQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0L2RyaXZlcnMvbWVkaWEvaTJjL2hpNTU2LmM/
aWQ9Mzc1ZmM5MDNlNTdjYjNjYTRkMmQ1NDA4ZGU5OGQ2MzY5ZDRjODMzNA0KDQpBbmQgdGhlcmUg
aXMgbm8gbmVlZCBmb3IgdGhlIGlmIChzdHJzdHIoZGV2X25hbWUob3YxM2ItPmRldiksICJPVlRJ
MTNCMTowMSIpKXsgaGVyZSwgdGhlIHJlZ3VsYXRvciBjb3JlIHdpbGwgcHJvdmlkZSBkdW1teSBy
ZWd1bGF0b3JzIG9uIGJvYXJkcyB3aGVyZSB0aGVyZSBhcmUgbm8gcmVndWxhdG9ycyBkZWZpbmVk
IGZvciBkb3ZkZCBhbmQgZHZkZC4NCg0KUmVnYXJkcywNCg0KSGFucw0KDQoNCg==

