Return-Path: <linux-media+bounces-59119-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFOuEOzM5WlIoAEAu9opvQ
	(envelope-from <linux-media+bounces-59119-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 08:51:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 499BB427761
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 08:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 790D4301CD97
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 06:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C77C382F04;
	Mon, 20 Apr 2026 06:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nnyoSAlV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CF8382F01;
	Mon, 20 Apr 2026 06:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776667729; cv=fail; b=svYTt0hzNuinhE+zWb1JQ9sPieq459r4Riyh5mCRjhsAqUYdhVTcemC2BmJGh0hzw35XOEFoHs7a3JEGBtbrXIb9e8pBS8F6SYXK+46hjLAorCsnoW27uJ9H728WBuo76Pi9KUNGee1UBQNE+3DIsR0S5qVT66es+tByQvTjrSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776667729; c=relaxed/simple;
	bh=X8nAI0jFz+1KWqSUsI2N8jTghebclmyl8wkOsCPYuhU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ac+m4HUflFSGxd66sAj2keR+G2T2E9J8v3iYHaVcKbVCY8LJ3W62lGqTz19VpA9yDgVN3Cj1ZCY1SPscPDHp8BRJRoo5J5Tuyeo+ImCQyD0N9bsl8TAMbveTJXvsxN2aebh+b/JKRf5wJspb2XL3Nr7Z/donrcLrCmXKxs/9NOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nnyoSAlV; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776667726; x=1808203726;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=X8nAI0jFz+1KWqSUsI2N8jTghebclmyl8wkOsCPYuhU=;
  b=nnyoSAlVBL632nBHvKeSmvloX4zcDyUyIQlv+kScY5dsjl0da7KStetm
   Tprwc6MX/2mc8oBH0ST1acDpCVpJRAZbv3gCv1fsVglS1+LOqXcF6/1Ar
   phs5/ukQJhhHg+/Hwz9tcclI461iSUvMOmg6+QvwuycVEWDzRxN4+BgK3
   b1CxbkY1EteTr13KJdeZdkNYQst3OQaQCUGI8ZMJCII6VzXHBz3K7kXoV
   SKc9wjA7jipYvtZ5QFxm6el0GlPPppdqwNtLZPea+QtyqzGyUB3GiU0Ev
   aSVmuiFDvmZQZT7FLDipSFCRkv2wKkh617nUk0aUQwzCkq0CHhyGP11ZC
   Q==;
X-CSE-ConnectionGUID: o09v1pM/QrShmkdMdwCi0Q==
X-CSE-MsgGUID: FN2WoIHnRLmds7VcraJRhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="100234667"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="100234667"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2026 23:48:45 -0700
X-CSE-ConnectionGUID: TLWSJGVzR8SsTQkaxdtIdg==
X-CSE-MsgGUID: va5j5IDkSEuYYyIefeJKSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="231549519"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2026 23:48:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 23:48:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 19 Apr 2026 23:48:43 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 23:48:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ij71tELgcpXc7msOCAYT5QuBE1YAamn+XWZQO9czx3Xufk9ALN5blC4//OjY/uO9aVKbKy/+xitgtQmmvvRQ2AiHkot1ii+XDmklEpAI4cZMuSg8z2tokvcloZA/pcXarD/jAPyct/tgPvlWHqqDBTrCVryujvyyEPbHUw6EJVkHCZtKBWvNVIJeYv9EXOVkvZrXDASjlKcqiMirkW2FWsecScJAKJ4MhiRyLo+1wiAzgXjv4D1oxmQbXHsDsCOks2hY/OUd5fprDtm01m+H4sgUiht5gn2P4RdQwYgCrzoozX98BziEtMaM460xsPAfHlfLW93t6JdPD4GO1hO5nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8nAI0jFz+1KWqSUsI2N8jTghebclmyl8wkOsCPYuhU=;
 b=Hn/w/P4L/cKD8LtUcqVGD/eBAwWpG8uPIQeM/ObcXDwTYlM5knm2chj/puKhLtpjnHNp+969sxsF8zuH7Unrd/F/RKuooLFXrniXr3SFd6Fb1yEepMSRNP/zk2PHE2YTHs8ws32SmMjdfvK/WS6im9CrHwsygd+hwOc1criOM1ntsJUKqpJjAzRsVZsy3n/5mOhHUfHDMoDjZjj4Na4SyvoqgWKkBWqzNXWQ//Uo0j47SEd6bt55aI4EVdL3NgPXqZzrW2PPFBpm7nytq9joOVNPtIPWU3YKEkTOmXv3zonDFBPz/ilMhBR3S4kq9J8Newzz86Rkcmg77DlSTobudQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7971.namprd11.prod.outlook.com (2603:10b6:8:122::12)
 by PH0PR11MB7493.namprd11.prod.outlook.com (2603:10b6:510:284::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Mon, 20 Apr
 2026 06:48:40 +0000
Received: from DS0PR11MB7971.namprd11.prod.outlook.com
 ([fe80::40aa:a291:4c25:6e0a]) by DS0PR11MB7971.namprd11.prod.outlook.com
 ([fe80::40aa:a291:4c25:6e0a%3]) with mapi id 15.20.9846.011; Mon, 20 Apr 2026
 06:48:40 +0000
From: "Yeh, Serin" <serin.yeh@intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>, Kate Hsuan
	<hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Topic: [PATCH 2/2] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Index: AQHczkTNrreET5gRC0mOmoPK/EEDurXjCeOAgAR5ZiA=
Date: Mon, 20 Apr 2026 06:48:40 +0000
Message-ID: <DS0PR11MB7971285BF3B1B2DA367ACC28F62F2@DS0PR11MB7971.namprd11.prod.outlook.com>
References: <20260417083214.222189-1-hpa@redhat.com>
 <20260417083214.222189-3-hpa@redhat.com>
 <fc73e3b3-3eb7-46cc-b2af-162017fd473e@oss.qualcomm.com>
In-Reply-To: <fc73e3b3-3eb7-46cc-b2af-162017fd473e@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7971:EE_|PH0PR11MB7493:EE_
x-ms-office365-filtering-correlation-id: 711a25d2-08e5-4f4c-7b7a-08de9ea8db84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: VZYZgUW/d2U0ORg4Rx5FvbaqP8wk2wbvldzb6hy6I2suQeZv6e6zj9iCHKlNefriEt2FvE7W7wwwcH/ji9zSIubbAwJi3UXneLELcV7zYJQApsnGW5Et8/BFf0EXU2CemR6cl6EQJvqNPuBXoKH3HerWQx7c6k7EOvPZXhDzHZBddEBoARYAAV0NKrQdpb71Rr0tqBgEW+etQyIkraDioeJUrVFxo7uaNY/deyy7x5wxi92g9JERxTuvtnHz/yVYSZs9CdTSaBvnnGZThqmfqxIiL2cxBrGgjfkvb6SfKQoLjsYznxh6+duRtp6iXUCfBmsWWlq+L6cHjFe1kK64S1n1141hawVWJvYamZrXzRX54yQE+fR6uI3ahfk2zoG+qud+wybzE0pIJ0zd2ysiTou9HQORXvFnSud35KJxAKPl/kyTySFWimfJ/rtGkk1de+Dl28J47If8TH9oauKc07JOkJkHlsdraczfG+qa2kesZqmuz/TQkiNpHY/FDh+/wAZdUDl0zKqkTAxe7nQvdio5X/p2Fj9wA8lCbxyWbceKQSRVyWc91jteYDDSsajsEp6GwSZrvjikqOukPbEMv06ZbCcJNFknUnZv64RZKqonjht/TVwKRTrV/OWQWLqAp7/g0C0gh+3auiuOE5u00JEvJ6AfJOKDowkodRwkYg4NiktKmUCztvuu6oA2rzS2dAL6qEomEcnMMu94edq+0GvMbyt2IYlNXRK0y9aqWOftkXBj54D7VuLVkluxtUu9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7971.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGlyQ1FpYU02bHdoZHZTa2NLWTBlbEVTbk9BbTVyeWJHclhMQmhGSWROME5M?=
 =?utf-8?B?RGUydEJDanBueWMvbzhwZmEzelpSdUp1SkdlMjhGbENFSjNFNTc2TlQvVldR?=
 =?utf-8?B?V0lQakptR0JlTzlWTHJ5Tk43L2FJdDUwRHRBZ3kvSXlsdDZMbTRLT29yTjlP?=
 =?utf-8?B?eHZLc0Rad2tYcVJaVllRdGduRGRna2pDZ3Q3ZlRmVEk5bS9JRnBPWXdWcFBk?=
 =?utf-8?B?M3RHMEM5QUF4ZUtDdGN2RDhuMUQxQjhmcjlYeExQT3h1T2dEaXBOWkc5TUor?=
 =?utf-8?B?dTF5a25mbXRxRFdsalF3VnhBZkhJRDl2Z3dWNy9BellyS1VlRm9XakNtUlpR?=
 =?utf-8?B?WCtaOWlUWGdrZHpNYTlGL3E0VG9sVkV1THNIbmt1NCtHR0U0b2lxdWN0bHI1?=
 =?utf-8?B?VDNjVjZUUzBBU01YczBVbDBmTEtlZzZ1MTA3SVhBMjZxTC9Id3dvdWFEaTJD?=
 =?utf-8?B?ZDFYMGVKYkkyano0eEFBMXR3T3d3c3hObHhOdEZ3U3hiTWVBRFBjaU51VFAx?=
 =?utf-8?B?QStZdkpmL2hITmdmWnpxRElEVjVuYnl1MXBxdnFWMDZvODNZU2FnTVR3UUxT?=
 =?utf-8?B?N3JSUGMxUFJOdW5USlRmdjNKZS93WjVZYldmZkZxMW8wOS9GaElkTGJIVHhz?=
 =?utf-8?B?aW9EM1BKTUQzM3NTU2NmYlIvVktIVHZRN3g1eWNKaDZacDdpMG1LUWJtU2Jz?=
 =?utf-8?B?dzJiQkJwa0VtODRpMHpnbWtrVGtxc3BiZVZOanJlVStuTUwyN281eHhXbnZF?=
 =?utf-8?B?dHhBeW9BQThMVWVSTUY0UitwbVErM3IrT2ZYT3ZRRFNHb3M3NjlxVVhZcWln?=
 =?utf-8?B?aXJ1Z3g5M0N2L1d0d1loaHpmYVhVUzZIZ01Sc3dzMGUvM0tXQWFJQURlWXBN?=
 =?utf-8?B?aU5oeThEY1N6VWphb2hIUDMva3FoaWFxZW5QaXpPZU10ZDBFcTlpS1Zqa3VS?=
 =?utf-8?B?c3NLc0ZvVTRIV1J2dHlFRmlNR2x3RWladGpuQUxtZ29OZkg5dkdZVFg4elpj?=
 =?utf-8?B?Mlo1bnJzK0VTVDQ2YWg3ejJqVXIySUhOaW01SjU0d3RKTzFhOGVXWmZFRHJv?=
 =?utf-8?B?aEFBamhEaEVlVzM5V3pEYzhlT2hlSE1scVBxRElicFdDN3pzRG9kY1h4ZFRr?=
 =?utf-8?B?Ym5Ka0lrRE9YeUlTS1Bid3dNWldwOVhQWGtWWW1tcnVIODZhd2pkUkgrUVl4?=
 =?utf-8?B?MzM3c05XMHExeWFtVUNza1lvTXEwdW9DdnE5Y2owMnRoY3QrRlY4cWwyZ2N3?=
 =?utf-8?B?WlF0c3kzNXFIVDBKd3ZwQlBtZHV3a3I2NVM0czhaNnJuRE43ZGdCLzBFZ3g3?=
 =?utf-8?B?cGEvdWdRRU5OcEp6c0xQVlY5QzBSeE1hMXVsY1dtMDJlajZQZmxLSHM5Rmoz?=
 =?utf-8?B?b2toMEdWcFNjZVRoRkkwOXlSOW44ZklRa2VLY2FvS0Nycm9GQ2FQdFY5bzBU?=
 =?utf-8?B?d2tDbFFEU2pvTi91RTZWaGFiVzhmandJZ3NxMkVXSFlQRzdwZXEyTmpaMzlV?=
 =?utf-8?B?V2hTOGJwT1p5ckRObTRHdEd0YlhpQWs0dGFvcUk3Ull6dlhuOW9pOTB0UUdH?=
 =?utf-8?B?bThGei9acE9weG8wR29BbEFaVXJlenM2YkgyRTNHckNGY2d1ZWpSK0srK3Jo?=
 =?utf-8?B?WTd5L1dBckxSaDFkd29yd2xnZXgwUGN6KzFhWFNJUlRGRkpsUzRzbW9IcEZ1?=
 =?utf-8?B?NG5scU5mRHJ3MUpLTFk0ZHBESmdNcVhPSlRSV1RXbWZIRUZxYlRWMlQwTnlR?=
 =?utf-8?B?NjcxblNXQzJoZ0pLRDlXY3hpVC9rWDlqNEVFQmF6bDBMc05JRHduM2t1czFS?=
 =?utf-8?B?ak40RUJWL1hzVjVCNS85ZXF0a2FCZmRMRlRBNVJsbFVramRLS25BVlM2TnF5?=
 =?utf-8?B?a1J3bm9PdmtVdXZQdVFQbW9oVUo4Y25ob2c2NWlLWmlRU0FLdVZLakVnejNt?=
 =?utf-8?B?a0xKdzdUaE56VGFTSFRaaStiWlN3Y1Q4WUtPS0E1VmNpZy9hcjNTY3d2Ulps?=
 =?utf-8?B?MFlJZkFLVWxnYXlYbVdTREltb0hhYlpkb2VvYWJBQlZrQWV2TzAxVnN6R0pY?=
 =?utf-8?B?TFVkZjFzcnBseEZQTTZBQi9VYUJOcWpXWXBJUFFaUnlaMDFlTzBOZnVSSTY2?=
 =?utf-8?B?emI4M1c4cStWdnRBVHRPVzJrR1lsTHN4RDJVMm5ubVphVWRQWlJRa3loTjNi?=
 =?utf-8?B?OFRKSE4yTW5mNmRHZ285bUZhNkp1MThrcWlmWFlrSnBKZW1rdnpsN2k4Sjg2?=
 =?utf-8?B?NWwyQlJJb0ZudXlDNE9ybnRpcjRSVFFuWThLQkFsNHViK2tDVHd4L3R2S0pR?=
 =?utf-8?B?Y1VSUE1HMCtZM2tGV3NCekNoRjdwRkRoY0lIV29PckZ3QjZLVkdTUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DnYvkEpeBCeUyvlKoqFOS5/yXCG/LnMCmR6JHIoI+HjqOl4jwhaTei5W8cbFeonNYfgrcFiNoA0YKt6c5ewrLSHY4Cr5Rsv+0wP6Ph/CkbjqJIBJezl/vL9d/gc7i3RgNAtOjkwUhTVnfTIBRvk9eKQVLoyzWmqlDjoMEjedhqtRxdr7zUfH23wRhagT4Gvzo3P2hRaMAlDkZw4ncqEQUEv1ofLQ47r3inwQaSQwlaVL++dFydqE1aOo1HbwTpTMtPgdwFK/h5xkXDP2h9bt+6vKfSXrsgIz+jqiccZMluY3TUh9ky7xuHnb2pEPvfNhdbIZ75NK5WcHEM6cONsr1w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 711a25d2-08e5-4f4c-7b7a-08de9ea8db84
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 06:48:40.7346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OgMQ7wWgbPbst/6WTDm1ZwN0xhLfIxCoavS07tRgw05K1ZX/km1SUG0KpioA++/ptDzY111+DYrpLI4o8m/hDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7493
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-59119-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[serin.yeh@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 499BB427761
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgS2F0ZSwNCg0KVGhlcmUgYXJlIHNvbWUgcmVhc29ucyBJIGp1c3QgaGF2ZSBwYXRjaGVzIGZv
ciB1cHNpZGUtZG93biB3aXRob3V0IGFkZGluZyBtaXJyb3IvZmxpcCBpbiB0aGUgZHJpdmVyLg0K
WW91IGNhbiBjaGVjayB0aGUgcmVsYXRlZCBwYXRjaGVzIGluIG91ciBJUFU2LWRyaXZlcnMgcmVw
by4NClRoZSB2ZXJzaW9uIHRoYXQgSSBzdWJtaXR0ZWQgaXMgbm90IGluY2x1ZGVkIHVwc2lkZS1k
b3duIGJlY2F1c2UgdGhlIHNlbnNvciBoYXMgZGVzaWduIGxpbWl0YXRpb25zIG9mIG1pcnJvci9m
bGlwLg0KDQpZb3VyIHZlcnNpb24gd2lsbCBvY2N1ciBpbmNvcnJlY3QgYmF5ZXIgb2xkZXIgb24g
b3RoZXIgcGxhdGZvcm0uDQoNClNpbmNlcmVseSwNClNlcmluIFllaA0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogSGFucyBkZSBHb2VkZSA8am9oYW5uZXMuZ29lZGVAb3NzLnF1
YWxjb21tLmNvbT4gDQpTZW50OiBGcmlkYXksIEFwcmlsIDE3LCAyMDI2IDY6MTYgUE0NClRvOiBL
YXRlIEhzdWFuIDxocGFAcmVkaGF0LmNvbT47IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhh
YkBrZXJuZWwub3JnPjsgSGFucyBWZXJrdWlsIDxodmVya3VpbCtjaXNjb0BrZXJuZWwub3JnPjsg
U2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPjsgWWVoLCBTZXJpbiA8
c2VyaW4ueWVoQGludGVsLmNvbT4NCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBtZWRp
YTogaTJjOiBpbXg0NzE6IEFkZCBTb255IElNWDQ3MSBpbWFnZSBzZW5zb3IgZHJpdmVyDQoNCkhp
IEthdGUsDQoNCk9uIDE3LUFwci0yNiAxMDozMiwgS2F0ZSBIc3VhbiB3cm90ZToNCj4gQWRkIGEg
bmV3IGRyaXZlciBmb3IgU29ueSBpbXg0NzEgY2FtZXJhIHNlbnNvci4gSXQgaXMgYmFzZWQgb24g
SmltbXkgDQo+IFN1IDxqaW1teS5zdUBpbnRlbC5jb20+IGltcGxlbWVudGF0aW9uIGFuZCB0aGUg
ZHJpdmVyIGNhbiBiZSBmb3VuZCBpbiANCj4gdGhlIGZvbGxvd2luZyBVUkwuDQo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9pbnRlbC9pcHU2LWRyaXZlcnMvY29tbWl0cy9tYXN0ZXIvZHJpdmVycy9tZWRp
YS9pMmMNCj4gL2lteDQ3MS5jDQo+IA0KPiBUaGlzIHNlbnNvciBjYW4gYmUgZm91bmQgb24gTGVu
b3ZvIFg5LTE0IGFuZCBYOS0xNSBsYXB0b3AgYW5kIGl0IGlzIGEgDQo+IHBhcnQgb2YgSVBVNyBz
b2x1dGlvbi4gVGhlIGRyaXZlciB3YXMgdGVzdGVkIG9uIExlbm92byBYOS0xNCBhbmQgWDktMTUg
bGFwdG9wcy4NCj4gDQo+IExpbms6IA0KPiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvaXB1Ni1k
cml2ZXJzL2Jsb2IvbWFzdGVyL2RyaXZlcnMvbWVkaWEvaTJjL2ltDQo+IHg0NzEuYw0KPiBMaW5r
OiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTI0NTQxMTkNCj4g
U2lnbmVkLW9mZi1ieTogS2F0ZSBIc3VhbiA8aHBhQHJlZGhhdC5jb20+DQo8c25pcD4NCg0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvaW14NDcxLmMgYi9kcml2ZXJzL21lZGlhL2ky
Yy9pbXg0NzEuYyANCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXggMDAwMDAwMDAwMDAwLi4z
MmExMDVhNjA3MzENCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9p
bXg0NzEuYw0KPiBAQCAtMCwwICsxLDEwNDcgQEANCg0KPHNuaXA+DQoNCj4gK3N0YXRpYyBpbnQg
aW14NDcxX3VwZGF0ZV9mbGlwKHN0cnVjdCBpbXg0NzFfZGF0YSAqc2Vuc29yLCB1MzIgdmFsdWUs
DQo+ICsJCQkgICAgICB1OCBmbGlwX2JpdCkNCj4gK3sNCj4gKwlpbnQgcmV0Ow0KPiArCXU2NCB2
YWwgPSB2YWx1ZSA/IGZsaXBfYml0IDogMDsNCj4gKw0KPiArCWlmIChzZW5zb3ItPnN0cmVhbWlu
ZykNCj4gKwkJcmV0dXJuIC1FQlVTWTsNCg0KSSBzZWUgbm8gcmVhc29uIHdoeSB0aGlzIGNvdWxk
IG5vdCBiZSB1cGRhdGVkIHdoaWxlIHN0cmVhbWluZywgc2luY2UgdGhlIGgveSBvZmZzZXRzIGdl
dCBhZGp1c3RlZCB0aGUgYmF5ZXIgcGF0dGVybiBzdGF5cyB0aGUgc2FtZSBzbyBjaGFuZ2luZyB3
aGlsZSBzdHJlYW1pbmcgc2hvdWxkIGJlIGZpbmUuDQoNCj4gKw0KPiArCS8qIGhmbGlwICovDQo+
ICsJLyoNCj4gKwkgKiBTb21lIG1hbnVmYWN0dXJlcnMgbW91bnQgdGhlIHNlbnNvciB1cHNpZGUt
ZG93biAocm90YXRpb24gPT0gMTgwKS4NCj4gKwkgKiBWNEwyIHNldHMgYm90aCBoL3ZmbGlwIHRv
IDEgZm9yIDE4MC1kZWdyZWUgcm90YXRpb24sIGJ1dCBvbmx5IHRoZQ0KPiArCSAqIHZmbGlwIHNo
b3VsZCBhY3R1YWxseSBiZSBhcHBsaWVkLiBTa2lwIHRoZSBpbml0aWFsIGhmbGlwIHdyaXRlIHRv
DQo+ICsJICogcHJlc2VydmUgY29ycmVjdCBvcmllbnRhdGlvbi4NCj4gKwkgKi8NCg0KSSB3YXMg
YW5zd2VyaW5nIHlvdXIgb2ZmLWxpc3QgZW1haWwgYWJvdXQgdGhpcywgYnV0IG5vdyBJIHNlZSB0
aGF0IHlvdSd2ZSBhZGRlZCB0aGlzIHdvcmthcm91bmQgaGVyZS4gSSBiZWxpZXZlIHRoYXQgdGhp
cyB3b3JrYXJvdW5kIGlzIHdyb25nLCBzbyBsZXQgbWUgbW92ZSBhbnN3ZXIgdGhpbmdzIGhlcmUg
aW5zdGVhZCBvZiBvZmYtbGlzdDoNCg0KPiBJIGZpbGxlZCBpbiB0aGUgRE1JIGluZm9ybWF0aW9u
IGluIHRoZSB0YWJsZSBhbmQgSSBmb3VuZCB2NGwyIHNldHMgdXAgDQo+IGJvdGggaGZsaXA9MSBh
bmQgdmZsaXA9MSB3aGVuIHRoZSByb3RhdGlvbiBpcyAxODAuDQoNClllcyB0aGF0IGlzIGNvcnJl
Y3QsIG5vdGUgdGhpcyBpcyBhY3R1YWxseSBkb25lIGJ5IGxpYmNhbWVyYSwgaW4gcmVzcG9uc2Ug
dG8gdGhlIHJvdGF0aW9uIHByb3BlcnR5IHJlcG9ydGluZyAxODAgZGVncmVlcyByb3RhdGlvbiBh
ZnRlciBhZGRpbmcgdGhlIGxhcHRvcCB0byB0aGUgRE1JIHRhYmxlLg0KDQo+IEluIG15IGNhc2Us
IEkgb25seQ0KPiBuZWVkIHRvIHNldCB2ZmxpcCB0aGVuIEkgY2FuIGdldCBhIGNvcnJlY3QgaW1h
Z2UuDQoNCkZpcnN0IG9mIGFsbCBhcmUgeW91IHN1cmUgdGhhdCB5b3Ugb25seSBuZWVkIHRvIHNl
dCB2ZmxpcD8gQSBjYW1lcmEgaXMgbm90IGEgbWlycm9yISBJZiB5b3Ugc2F5IHJhaXNlIHlvdXIg
cmlnaHQgaGFuZCBpbiBmcm9udCBvZiB0aGUgY2FtZXJhIHRoZW4gb24gdGhlIHNjcmVlbiB5b3Ug
c2hvdWxkIGJlIHNlZW4gcmFpc2luZyB0aGUgaGFuZCB3aGljaCBpcyBvbiB0aGUgbGVmdCBmb3Ig
InRoZSB5b3UiIGxvb2tpbmcgYXQgdGhlIHNjcmVlbiBiZWNhdXNlIGlmIHlvdSB3ZXJlIHRvIGxv
b2sgYXQgeW91IGZyb20gdGhlIHBvdiBvZiB0aGUgY2FtZXJhIHlvdXIgcmlnaHQgaGFuZCBpcyBv
biB0aGUgbGVmdC4NCg0KVGhlIGVhc2llc3Qgd2F5IHRvIGNoZWNrIHRoaXMgaXMgdG8gaGF2ZSBz
b21ldGhpbmcgd2l0aCBzb21lIHdyaXR0ZW4gdGV4dCBvbiBpdC4gSW4gYSBtaXJyb3IgeW91IGNh
bm5vdCAoZWFzaWx5KSByZWFkIGUuZy4gdGhlIHRleHQgcHJpbnRlZCBvbiBhIFQtc2hpcnQgYnV0
IHdpdGggYSBjYW1lcmEgeW91IHNob3VsZCBiZSBhYmxlIHRvIHJlYWQgdGhpcyB3aXRob3V0IHBy
b2JsZW1zLg0KDQpBbHNvIG1ha2Ugc3VyZSB5b3UgdXNlIHFjYW0gdG8gdGVzdCBiZWNhdXNlIHFj
YW0gZG9lcyBub3QgbWlycm9yL2hmbGlwLg0KU29tZSBhcHBzIGhmbGlwIHRoZSBpbWFnZSBmb3Ig
eW91IChlc3AuIHRoaW5ncyBsaWtlIGdvb2dsZSBtZWV0KSBiZWNhdXNlIHBlb3BsZSBhcmUgc28g
dXNlZCB0byBzZWVpbmcgdGhlbXNlbHZlcyBpbiBhIG1pcnJvciB0aGF0IHRoZXkgYWRqdXN0IHRo
ZSB2aWV3IGZvciB5b3UuIE5vdGUgZS5nLiBnb29nbGUgbWVldCBvbmx5IG1pcnJvcnMgeW91ciBv
d24gcHJldmlldyBpdCBzZW5kcyBvdXQgYW4gdW5taXJyb3JlZCBpbWFnZSB0byB0aGUgcGVvcGxl
IG9uIHRoZSBjYWxsIChJSVJDKS4NCg0KSWYgYWZ0ZXIgdGhpcyBsb25nIG1hbnNwbGFpbmluZyAo
c29ycnkpIHdyaXRldXAgYWJvdXQgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBhIG1pcnJvciBhbmQg
YSBjYW1lcmEgeW91IHN0aWxsIHRoaW5rIHlvdSBvbmx5IG5lZWQgdmZsaXAsIHRoZW4gdGhhdCBt
ZWFucyB0aGF0IGVpdGhlciB0aGUgaGZsaXAgb3QgdGhlIHZmbGlwIGNvbnRyb2wgb2YgdGhlIHNl
bnNvciBpcyBpbnZlcnRlZCBhbmQgdGhlIGRyaXZlciBuZWVkcyB0byBpbnZlcnQgaXQuDQoNCkFy
ZSB3ZSBzdXJlIHRoZSBjYW1lcmEgbW9kdWxlIGlzIHVwc2lkZSBkb3duPyBNYXliZSB2ZmxpcCBp
cyB0aGUgb25lIHdoaWNoIHdlIG5lZWQgdG8gaW52ZXJ0IGFuZCB0aGUgbW9kdWxlIGlzIG5vdCB1
cHNpZGUtZG93biBhdCBhbGwgPw0KDQpIbW0sIGxvb2tpbmcgYXQgb3RoZXIgaW14IHNlbnNvciBk
cml2ZXJzLCB1bmxpa2Ugb3Ygc2Vuc29ycyB3aGVyZSBzb21ldGltZXMgaGZsaXAgaXMgaW52ZXJ0
ZWQgaXQgc2VlbXMgdGhlIDIgZmxpcCBjb250cm9scyBhcmUgc29mYXIgYWx3YXlzIHN0cmFpZ2h0
IGZvcndhcmQgb24gaW14LiBBbHRob3VnaCBzb21lIGRyaXZlcnMgb25seSBpbXBsZW1lbnQgdmZs
aXAgYW5kIGhhdmUgbm8gaGZsaXAgYXQgYWxsLg0KDQpBcyB5b3UgbWVudGlvbiBpbiB0aGUgY292
ZXIgbGV0dGVyIHRoaXMgaXMgYSBjbGVhbmVkIHVwIHZlcnNpb24gb2Y6DQpodHRwczovL2dpdGh1
Yi5jb20vaW50ZWwvaXB1Ni1kcml2ZXJzL3RyZWUvbWFzdGVyL2RyaXZlcnMvbWVkaWEvaTJjL2lt
eDQ3MS5jDQoNCk5vdGUgdGhhdCB3ZSd2ZSBzZWVuIGlzc3VlcyB3aXRoIG1pcnJvcmluZyAvIGZs
aXBwaW5nIGZyb20gdmFyaW91cyBvdGhlciBkcml2ZXJzIG9yaWdpbmF0aW5nIGZyb20gSW50ZWws
IHRoZXkgaGF2ZSBub3QgYWx3YXlzIGdvdCB0aGlzIGNvcnJlY3QsIGVzcGVjaWFsbHkgd2hlbiBp
dCBjb21lcyB0byBtaXJyb3JpbmcgYnkgZGVmYXVsdCAod2hlbiB0aGUgaGZsaXAgY29udHJvbCdz
IHZhbHVlIGlzIDApIGJ1dCBhbHNvIHdpdGggdmZsaXBwaW5nIGJ5IGRlZmF1bHQgd2hlbiB0aGUg
ZHJpdmVyIHdhcyBkZXZlbG9wZWQgb24gYSBsYXB0b3Agd2hpY2ggaGFkIHRoZSBtb2R1bGUgdXBz
aWRlLWRvd24sIHNlZSBlLmcuIDoNCg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2xvZy9kcml2ZXJzL21lZGlhL2kyYy9v
djAyYzEwLmMNCg0Kd2hlcmUgd2UgbmVlZGVkIHRvIGRvIHF1aXRlIGEgZmV3IGZsaXBwaW5nIHJl
bGF0ZWQgZml4ZXMuDQoNCj4gKwlpZiAoZmxpcF9iaXQgPT0gSU1YNDcxX0hGTElQX0JJVCkgew0K
PiArCQlpZiAoc2Vuc29yLT5yb3RhdGlvbiA9PSAxODAgJiYgIXNlbnNvci0+aGZsaXBfaW5pdGlh
bGl6ZWQpIHsNCj4gKwkJCXNlbnNvci0+aGZsaXBfaW5pdGlhbGl6ZWQgPSB0cnVlOw0KPiArCQkJ
cmV0dXJuIDA7DQo+ICsJCX0NCg0KVGhpcyBsb29rcyBsaWtlIHlvdSBza2lwIHdyaXRpbmcgdGhl
IGhmbGlwIG9uIHRoZSBmaXJzdCBzdGFydCBzdHJlYW0sIGJ1dCB3aGF0IGFib3V0IHN1YnNlcXVl
bnQgc3RyZWFtcyA/DQoNCkFsc28gc2VlIG15IG5leHQgY29tbWVudCBiZWxvdywgSSB0aGluayB0
aGlzIHNraXBwaW5nIG9ubHkgb25jZSBkb2VzIHBvaW50IHVzIGluIHRoZSByaWdodCBkaXJlY3Rp
b24uDQoNCj4gKw0KPiArCQljY2lfdXBkYXRlX2JpdHMoc2Vuc29yLT5yZWdtYXAsIElNWDQ3MV9S
RUdfT1JJRU5UQVRJT04sDQo+ICsJCQkJZmxpcF9iaXQsIHZhbCwgJnJldCk7DQo+ICsNCj4gKwkJ
cmV0dXJuIHJldDsNCj4gKwl9DQo+ICsNCj4gKwkvKiB2ZmxpcCAqLw0KPiArCWNjaV91cGRhdGVf
Yml0cyhzZW5zb3ItPnJlZ21hcCwgSU1YNDcxX1JFR19PUklFTlRBVElPTiwNCj4gKwkJCWZsaXBf
Yml0LCB2YWwsICZyZXQpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQoNCkhtbSwg
SSB3b25kZXIgaWYgdGhlIHByb2JsZW0gaGVyZSBpcyB5b3UgZG9pbmcgMiBzdWJzZXF1ZW50IGNj
aV91cGRhdGVfYml0cygpLiBJZiB0aGUgZmxpcCBjb250cm9sIHJlZ2lzdGVyZWQgaXMgZG91Ymxl
LWJ1ZmZlcmVkIGFuZCB0aGUgbmV3IHZhbHVlIGlzIGxhdGNoZWQgYXMgdGhlIGFjdHVhbCB2YWx1
ZSBvbiB0aGUgc3RhcnQgb2YgdGhlIG5leHQgZnJhbWU7IGFuZCB0aGlzIGlzIGNvbWJpbmVkIHdp
dGggcmVhZGluZyBiYWNrIHJlYWRpbmcgdGhlIGFjdGl2ZSB2YWx1ZSwgbm90IHRoZSBsYXN0IHdy
aXR0ZW4gdmFsdWUgdGhlbiB0aGUgZmlyc3QgdGltZSB5b3UgZG8gdGhpcyB0aGUgc2V0dGluZyBv
ZiB0aGUgaGZsaXAgYml0IHdpbGwgYmUgb3ZlcndyaXR0ZW4gYnkgdGhlIHNlY29uZCBjY2lfdXBk
YXRlX2JpdHMuDQoNCkkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIGRvIHNvbWV0aGluZyBz
aW1pbGFyIHRvIHdoYXQgaW14MjE5LmMgYW5kIHJlcGxhY2UgdGhlc2UgMiBjY2lfdXBkYXRlX2Jp
dHMoKSBjYWxscyB3aXRoOg0KDQogICAgICAgIGNjaV93cml0ZShpbXg0NzEtPnJlZ21hcCwgSU1Y
NDcxX1JFR19PUklFTlRBVElPTiwNCiAgICAgICAgICAgICAgICAgIGlteDQ3MS0+aGZsaXAtPnZh
bCB8IGlteDQ3MS0+dmZsaXAtPnZhbCA8PCAxLCAmcmV0KTsNCg0KSSBiZWxpZXZlIHRoaXMgc2hv
dWxkIHdvcmsgaGVyZSB0b28uDQoNCg0KPiArDQo+ICsJY2NpX3dyaXRlKHNlbnNvci0+cmVnbWFw
LCBJTVg0NzFfUkVHX1ZfV0lOX09GRlNFVCwNCj4gKwkJICB2YWx1ZSA/IDB4ZTAgOiAweGViLCAm
cmV0KTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJY2NpX3VwZGF0
ZV9iaXRzKHNlbnNvci0+cmVnbWFwLCBJTVg0NzFfUkVHX0hfV0lOX09GRlNFVCwgMSwNCj4gKwkJ
CXZhbHVlID8gMHgwMSA6IDB4MDAsICZyZXQpOw0KDQpObyBuZWVkIGZvciBjY2lfdXBkYXRlX2Jp
dHMoKSBoZXJlLCB0aGUgcmVnaXN0ZXIgaXMgYWx3YXlzIGluaXRpYWxpemVkIHRvIDB4Yzggc28g
dGhpcyBjYW4ganVzdCB1c2UgaGFyZGNvZGVkIHZhbHVlcyBsaWtlIHRoZSBWX1dJTl9PRkZTRVQg
cGF0aDoNCg0KCWNjaV93cml0ZShzZW5zb3ItPnJlZ21hcCwgSU1YNDcxX1JFR19IX1dJTl9PRkZT
RVQsDQoJCSAgdmFsdWUgPyAweGM5IDogMHhjOCwgJnJldCk7DQoNCj4gKwlyZXR1cm4gcmV0Ow0K
DQpVcGRhdGluZyBib3RoIG9mZnNldHMgaGVyZSBpcyB3cm9uZyB3aGVuIGhmbGlwICE9IHZmbGlw
LCB5b3Ugc2hvdWxkIG9ubHkgdXBkYXRlIFZfV0lOX09GRlNFVCB3aGVuIGNoYW5naW5nIHZmbGlw
IGFuZCBIX1dJTl9PRkZTRVQgd2hlbiBjaGFuZ2luZyBoZmxpcC4NCg0KSSBzdWdnZXN0IGRyb3Bw
aW5nIHRoaXMgZnVuY3Rpb24gYW5kIGluc3RlYWQgaW4gc2V0X2N0cmwoKSBkbyB0aGlzOg0KDQoJ
Y2FzZSBWNEwyX0NJRF9IRkxJUDoNCgkJY2NpX3dyaXRlKGlteDQ3MS0+cmVnbWFwLCBJTVg0NzFf
UkVHX09SSUVOVEFUSU9OLA0KCQkJICBpbXg0NzEtPmhmbGlwLT52YWwgfCBpbXg0NzEtPnZmbGlw
LT52YWwgPDwgMSwgJnJldCk7DQoJCWNjaV93cml0ZShzZW5zb3ItPnJlZ21hcCwgSU1YNDcxX1JF
R19IX1dJTl9PRkZTRVQsDQoJCQkgIHZhbHVlID8gMHhjOSA6IDB4YzgsICZyZXQpOw0KCQlicmVh
azsNCiAgICAgICAgY2FzZSBWNEwyX0NJRF9WRkxJUDoNCgkJY2NpX3dyaXRlKGlteDQ3MS0+cmVn
bWFwLCBJTVg0NzFfUkVHX09SSUVOVEFUSU9OLA0KCQkJICBpbXg0NzEtPmhmbGlwLT52YWwgfCBp
bXg0NzEtPnZmbGlwLT52YWwgPDwgMSwgJnJldCk7DQoJCWNjaV93cml0ZShzZW5zb3ItPnJlZ21h
cCwgSU1YNDcxX1JFR19WX1dJTl9PRkZTRVQsDQoJCQkgIHZhbHVlID8gMHhlMCA6IDB4ZWIsICZy
ZXQpOw0KCQlicmVhazsNCg0KUmVnYXJkcywNCg0KSGFucw0KDQo=

