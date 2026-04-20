Return-Path: <linux-media+bounces-59121-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIEXFdHU5WnWoQEAu9opvQ
	(envelope-from <linux-media+bounces-59121-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 09:25:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B25A6427B6E
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 09:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89068302A2C4
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 07:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BAB37C919;
	Mon, 20 Apr 2026 07:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjeRDFfm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359B83845B4;
	Mon, 20 Apr 2026 07:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776669810; cv=fail; b=Gk9nU/5TVtH3GqzzlmeZuR/qDyAGaNbLPxtzTQKybMWyiOV+KWZeIkj0tvMJtqHhPw+HFSvE6p3qKYJWIX1IrCe59TQPCu5s19JAi7x/iTyaxM213CPM38JuWn5BEgUvYdKFvGQDttXra+u/X6m30o3rXVItj9eHFn4usiIagZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776669810; c=relaxed/simple;
	bh=o7i5zgTsKVrXbZxnkSc3HtxPTVRp7B9G6BnfdCFohF4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OW92F3PkQ1TJLxbbUO7L4AcX3dNrq1JLKqnxA8ptkQbW5Z6/sLkffAod3ZUroW4lzuz1t35DvcFpnMyRv6pJLbJLrEYiCUQ4ti/G4CMJVgq1kBAZUFm/3Ph3Ms2ug6Y5hDZ7yYBV95agJ8U9b6/uiXzs48RIW4gJcYt7Q3CYyFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjeRDFfm; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776669808; x=1808205808;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o7i5zgTsKVrXbZxnkSc3HtxPTVRp7B9G6BnfdCFohF4=;
  b=MjeRDFfmQ9kyxbHOTOFvefTAMVBy65rcK+dK+t4CTzsGIe6IZOHa7KGj
   RfTRK3+EyuZNE2jDpT9i8jgUJmeF7i0EXquZx80JAUlAJADM4PDZNz/Sx
   ofzFf2qPdrye25+D84T7DVGMjCm2/JU1re6JmFiuKU2X+RKpAc1Rzrt1K
   coY2/sxLG2VSTVpZ2zDxvHo1skuBZTFHlkgqEh2t/CTUme+tVF2Q1RL61
   Mt0Bl6zwj5KjSguIhGgNZjgp2bez9stFqzi/Pt2TtBkeXtMnJNLEqjmGJ
   KdbSi/EjNqw4iqDlWQHnVdqHUaVbTalbqfN7umbJrLONTZRlpyEmncapq
   A==;
X-CSE-ConnectionGUID: PC0Q40JBSVu9R1TiCc9brA==
X-CSE-MsgGUID: 6h1Qop9JSDykEAdp7r1jow==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88194837"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="88194837"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 00:23:27 -0700
X-CSE-ConnectionGUID: t/UmLfFwSLKLmpo/mHqUtQ==
X-CSE-MsgGUID: 39H/qECeSlWBk8NWPqY9YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="236626189"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 00:23:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 00:23:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 00:23:25 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 00:23:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlREfSCir/EKReIaE1EP/lM8ODc6yCHHHnmKwmERahlbt+vNWtuL+xTjaGYSfhv0o+EjzrmFlgcGZJRMSzHZV9u9pLfBHUGcn0BWrOAvi3/Mhse0bb/n9v+qL6ntHGPaiAGZxI6utd4hmPAz/ghjrLo8GoTqK1LbuOJp3P8HFxdCRUbY0CBIbq2JDRGBXloNuofCotbG1go3s/OwucY7o4uq6ItbhDk/egeGvBDsKXliL7ZpsRbiIBSKBcOr9Tvbh75XyMjjN5OBHN/2vLLu/dtyGbyF+dIG3NJw4gYo9WNPuwQRjokk3gy9h+gvGW0d2KVj5vAgTF9cOxzqfx56BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7i5zgTsKVrXbZxnkSc3HtxPTVRp7B9G6BnfdCFohF4=;
 b=AV5AFSnAtAKivjr7XiLazeKuw/kh3AAVBew2KPoMlvLCtv6nsiXN00cdBd/u+ob6n/hhOoTr0gkd7FXzzD2YqluQx+7Nzek8gZRbbXZoaPDTfUt0vy14km1K86EaAggvkcriTuuSzH47jskJSfyAC3u5ykKJZCwTkgjwsWzLCkN/boSdiUNd41UhDeeyQB+wUEgEjNimvx41w7PHxu3AicKE+318Mq3TET+RrkutP5GwCM5J0hfVZMH6HhXUm5TRIparNo3xcvzaOMe4xZe6ifrWDC+5yO1bfKhNM0pqyrBUgsEDahV4zFFZVZY5k7vJhGkmzRwOYke6TL1Oq/sr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7971.namprd11.prod.outlook.com (2603:10b6:8:122::12)
 by SA2PR11MB4988.namprd11.prod.outlook.com (2603:10b6:806:f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 07:23:19 +0000
Received: from DS0PR11MB7971.namprd11.prod.outlook.com
 ([fe80::40aa:a291:4c25:6e0a]) by DS0PR11MB7971.namprd11.prod.outlook.com
 ([fe80::40aa:a291:4c25:6e0a%3]) with mapi id 15.20.9846.011; Mon, 20 Apr 2026
 07:23:19 +0000
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
Thread-Index: AQHczkTNrreET5gRC0mOmoPK/EEDurXjCeOAgASEVsA=
Date: Mon, 20 Apr 2026 07:23:19 +0000
Message-ID: <DS0PR11MB7971EF4F2B0759AF0CD738D0F62F2@DS0PR11MB7971.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: DS0PR11MB7971:EE_|SA2PR11MB4988:EE_
x-ms-office365-filtering-correlation-id: 7f4d1c32-179c-4f75-76a3-08de9eadb283
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|38070700021|56012099003|22082099003;
x-microsoft-antispam-message-info: 6wV9CMmRVHuYpcwHU6QLv93xIWKfRnLlCICT5PzYsP3Sesq4cRBxQoFur2UtLW3ayBK5kt4+NZav+DB5GwwTuL+oWQoR8HFEDb9sFie1TJBxZZWfE6sABl9Bl0QLOz4F0NZHqP+1TGcziJzAIf5bEh8FBzWfcmgwCKPc8is7HAD0CCPNhus/WMZ6xycyAYqg24h6D/QDJJIL6K6Nuo+CoYGkqsIdn7zv/Dx9QKHEYVuWYPXY0PTjayNdsjeSMjJ/NI8tVv74h4OxnVvJT5OtTbFc9VfsIgl3OcTLc/sTgiAsDq//EP27FXkmymhbZBKCem5sphf3wwLVGxp1UI9JG0hqMWnr6rFJRTd+p6clOIWjDOS0Gjjy+E3f/vP4o8zzmaYW9lppUi9zMbyTwuShX2vvJdZ8myVn1Pfa0AkE4Mi7scZGP8P6hMf2ciF3qcp46x8vj3XmCz5u6ZP536CrspunHRE9CK3Uijf4oPTsirD+Gc5Paw+xy+zqeeZkDd39TN2Ro8xS+hJXNTyopi5NTMLgZBbVCfOUkWuvucDXaDLh7Cxoxst7xUjb0CB5csjyvJdr60lkrmOJ1N2xNUqc+gxEoXLMUM6DDYG7ycHqflxv53hZL+bXWArW1SYrs+VmMq8AcJSImp3wvWtrGwvGtQOzDtJkJlKhutynFSuGN/Ybpx3NC2GsqfCjI2bEH+Lm7DPrOWk3bfGeHVCGiPXq+dM+tq2aoKqIhy8aUQE3MjVuZd9q8/0mW1wjAAqM+4sh8qL8ooCNnxiS+mJq0sEQSTsTO5J+0K19iN8jhYf3FtsvFlEdnFCmSRYo6cgWqJnK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7971.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(38070700021)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEN1YklCK1VJUGRwSUlFYnV0dmt3QjNJbncwSG11Y3dudlUwRmpBV0F2SUk1?=
 =?utf-8?B?YjE5N3V5ZkpkRVFrVDlRVE13NXpobnpSNDZqN0FxVFRyTmthYlBPY3JOMEFW?=
 =?utf-8?B?WklrMklFY08vYjByY2ZSazBveC9hQTFKZ3YzdURZbVFMOGY3RkZSRzdWMGVj?=
 =?utf-8?B?bTRNUEpkVHF3ODJFalN6bW10M1piVWZmTEN5d0M4ekhqeHMyTVhnQkM5QnNk?=
 =?utf-8?B?L2VRQ3d2R1M2K1BwcnlVODFvNWRZZ2Y3SjUwNDdSQjQ2ZFJXWWE5YnV5Zk81?=
 =?utf-8?B?ODM5MG1VbU51T3VWSGdZUjVZRTB1MTBZQi9XdkJ3OFJtZUNJM2lIc0c3MjV6?=
 =?utf-8?B?dVVrbmJuTEJ4L3NlZHdkbDY5VHcwbTNjYzZ2QkRFUnZCRlB6cjdQWlB5Tk10?=
 =?utf-8?B?bThIWmNJcVZVdm5DcWFncTJrLytSOXFrZ1BZVW1MSHJ2dkJHemQxVS9lZzVa?=
 =?utf-8?B?ZWU5VXhwdU4zQUs5NHJ4TERmbGRvdWRSSmxiLzI0elBvT0UrMnV4bEErUVBN?=
 =?utf-8?B?L0lDc0k1TUo1OVAwK1BFaDNzN2JsZ24yY1VCc2VONDhGRGg0V3hoVEZqdVRF?=
 =?utf-8?B?akMxWTFiU0gzYmpmUDZ3OWp3Z2tmbXJaVlVQd29RK3NtckMxUUVnZytNMGNj?=
 =?utf-8?B?UUhoNzVRT3RTNGZnOGtnR2hBVGZUZEZBWWNKOW9NM0s2SThCdnZEbzM2T1po?=
 =?utf-8?B?dzFhcUczbUVoaXdQWXZMcVVZd2ZiM2pHVkMyUm5yUUgwdGdhQjV4QVAwcllS?=
 =?utf-8?B?Z29VejduaStBZzdjUkpmUjFVaWh5ay9Md2hOanlnWllDSHQ4OEFOQ1lIRVVL?=
 =?utf-8?B?S3JyUVFEOTJ0ZExTWERwVU8xNjRZRng0RE5XeEtTSUM1Qms1T2dXUk9acEFG?=
 =?utf-8?B?Q2JpL2lLMzB6UGNQakpaR2VQRmdpM1FGbWo1ZS9LclZFUkVWYWUycHZxa2xS?=
 =?utf-8?B?RHA2cng5SWIxZHpHSTNTNW9YeXppQWxqYXNWOGRKWDJvSUI5MUNuSzFhNEF6?=
 =?utf-8?B?RVAyTlBEaEUzZlp0WWxNUHZrTlJQclBJNXU4VWNFZTdleFV0OE1oVVl5Zjk5?=
 =?utf-8?B?alp5ZXFZeXdkVnE5eDV5MzFzdE9EaUxzUVlpaTRLUGt1UEZaYkhJWU0rQU9z?=
 =?utf-8?B?N282NzZRejB2N1dtMWpvdHZwejRHTkpQYjRxVEdlaDBXeDcvNUVkVzBtT3ky?=
 =?utf-8?B?aVhDVjdid2lFY0xLUGpWQ1JxdU9DNVhtVnlhT1ZGYW5yUFlMVmovbm11YnRx?=
 =?utf-8?B?YU5FNnp2ajFGRWZLY2xpVW5iTmdCdi9CbUZCRVZqZURiZ0c5Rkp1cVU4TWdi?=
 =?utf-8?B?djVobldxdzlvSkdzenpoeWFuSmtRVXMvYnJSOS9RL2U4NXJsUk0ycDVXOWQv?=
 =?utf-8?B?UktoOG0zWHlaTnViY1RCRms5ZUY3dEc5dkMrY3RnOGJFRjBPZG1DT3E5ZDhI?=
 =?utf-8?B?WGRRSzNhN3NONG8yL2s0VCtwWk5URlArU1VwS2ZsOGFTcEo2LzFRRk5MOU9s?=
 =?utf-8?B?ZGEyNEZ3OGxoTVN6S1RnajBGYXJERGZvOEVJTHVEdUlXTDRyeWFqN01scDZN?=
 =?utf-8?B?YlRaTGNpQnpKYVR0RjlGUGxvVHNlWFFqeDEvc1IxYjFxbVJjaUM3SW9NU1pN?=
 =?utf-8?B?S2ZCWk91dG5IWVNKSFJ3Rm1XTlhRa2dobG80eldTck5FMnExNkVEMDBUL1JN?=
 =?utf-8?B?Tm1Kb2hPaENaM1BQVFhXcXJQcUQybXlMMUNKVnFEN1l3MjFIbytoTGlvbTR1?=
 =?utf-8?B?UWFEOU9jZ3RTbXJlSzBUSFZwLzVUTjBqYW1lWVVESlhOSVdzVzZFUVRCNkV4?=
 =?utf-8?B?YjFtZW0xdis5VkJaWERWYm5IaUZ4Q2dKVVkrZFA4blIxenM1SXNaa0llQnFH?=
 =?utf-8?B?Q080RXcvTXRrRnNVb3l4SDVwUzBrbWhqamZRaGhyTGF0anZhcEI3RisrZHdq?=
 =?utf-8?B?QjJKbktoek1RdjBTNDJ1ZG44cHoza0lIOE9EZHA0d3dldWVPb1BtWmZBZUpa?=
 =?utf-8?B?MGtBMHYwTFFNK2RabE5ESkJjdjBaeldiRFJpNXE4dW5FaUxSRFYwNzM2T1Nt?=
 =?utf-8?B?MTJuOUFIaXE0MWUvZ1FXUGRHQkJFSVlqeGlKMnBxRHNVeU1HRU8wM0k3Rm52?=
 =?utf-8?B?U3BRcWZrR2tQODVmZzVrU0N3WkI2Kzk2R0FlOHBkWk1XM2RQMjRjdGlHbDd5?=
 =?utf-8?B?ekdWbGtRaWFXWWcwL2lTRjgreGZtQ1RkOURGR0lyd3Z1eVlzcWdSemtTYmJm?=
 =?utf-8?B?V1FFL0pKT2FBY2M0bERPQVNzZGtpZi9MSnZxRG9aWkJZRUxzVGY1S0xVUkxM?=
 =?utf-8?B?d1ZFQjlSSDNDd3dieHdOYTI2eTFzTXhIOGY1KzNJeXN3OVFHZmg5UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QZTn481tLILz7Y5EKTMCc84SyDu/RVegTMsSfougSSIiTF9vX5T6udt0HDM2pMEyr+ElLCoWaOyx18DJQX5yB5006WkXSSRkXchn2sk56tYzzMx0XLq3L68vdaGdzAGwZjb+E/xNGWTTQPBolzRN4Aj6+iwR/S6id9DVt86YK6tHzi5MtCUMilPoqVhH2ZSlUUb4tH4oAa8ztIMW89cN4nxky2xtAEl3pRMu/yean3D0yxD9e+cZyogXxrkfdwCvZhsGX73BzoYFt/dRCPLDWqX/kjNu1zpK13KyhY7CkVpRQdgLkGUhruAzs5UiGqhlPyd/uN4q814w3HkqeKM5bA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4d1c32-179c-4f75-76a3-08de9eadb283
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 07:23:19.4352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mWRWAfJndhQPPC3dM+gKfBzEr9pb8YyOcgw3Brwc0KmhX+u3MqZajlElGxcA8X7qDcvBRdBfNntxzPyuzMcK2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4988
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-59121-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B25A6427B6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgS2F0ZSwNCg0KUGxlYXNlIGlnbm9yZSBteSBwcmV2aW91cyBtYWlsLg0KDQpUaGVyZSBhcmUg
c29tZSByZWFzb25zIHRoYXQgdGhlIHVwc2lkZS1kb3duIG1pcnJvci9mbGlwIGZ1bmN0aW9ucyBj
YW4ndCBiZSBzdWJtaXR0ZWQgaW4gdGhlIGRyaXZlciBmb3IgdXBzdHJlYW0uIA0KDQpUaGUgdmVy
c2lvbiB0aGF0IEkgc3VibWl0dGVkIGZvciB1cHN0cmVhbSBpcyBub3QgaW5jbHVkZWQgdXBzaWRl
LWRvd24gYmVjYXVzZSB0aGUgc2Vuc29yIGhhcyBkZXNpZ24gbGltaXRhdGlvbnMgb2YgbWlycm9y
L2ZsaXAuDQoNCllvdXIgdmVyc2lvbiB3aWxsIG9jY3VyIGluY29ycmVjdCBiYXllciBvbGRlciBv
biBkaWZmZXJlbnQgcGxhdGZvcm0uDQoNClNpbmNlcmVseSwNClNlcmluIFllaA0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSGFucyBkZSBHb2VkZSA8am9oYW5uZXMuZ29lZGVA
b3NzLnF1YWxjb21tLmNvbT4gDQpTZW50OiBGcmlkYXksIEFwcmlsIDE3LCAyMDI2IDY6MTYgUE0N
ClRvOiBLYXRlIEhzdWFuIDxocGFAcmVkaGF0LmNvbT47IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8
bWNoZWhhYkBrZXJuZWwub3JnPjsgSGFucyBWZXJrdWlsIDxodmVya3VpbCtjaXNjb0BrZXJuZWwu
b3JnPjsgU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPjsgWWVoLCBT
ZXJpbiA8c2VyaW4ueWVoQGludGVsLmNvbT4NCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8y
XSBtZWRpYTogaTJjOiBpbXg0NzE6IEFkZCBTb255IElNWDQ3MSBpbWFnZSBzZW5zb3IgZHJpdmVy
DQoNCkhpIEthdGUsDQoNCk9uIDE3LUFwci0yNiAxMDozMiwgS2F0ZSBIc3VhbiB3cm90ZToNCj4g
QWRkIGEgbmV3IGRyaXZlciBmb3IgU29ueSBpbXg0NzEgY2FtZXJhIHNlbnNvci4gSXQgaXMgYmFz
ZWQgb24gSmltbXkgDQo+IFN1IDxqaW1teS5zdUBpbnRlbC5jb20+IGltcGxlbWVudGF0aW9uIGFu
ZCB0aGUgZHJpdmVyIGNhbiBiZSBmb3VuZCBpbiANCj4gdGhlIGZvbGxvd2luZyBVUkwuDQo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9pcHU2LWRyaXZlcnMvY29tbWl0cy9tYXN0ZXIvZHJpdmVy
cy9tZWRpYS9pMmMNCj4gL2lteDQ3MS5jDQo+IA0KPiBUaGlzIHNlbnNvciBjYW4gYmUgZm91bmQg
b24gTGVub3ZvIFg5LTE0IGFuZCBYOS0xNSBsYXB0b3AgYW5kIGl0IGlzIGEgDQo+IHBhcnQgb2Yg
SVBVNyBzb2x1dGlvbi4gVGhlIGRyaXZlciB3YXMgdGVzdGVkIG9uIExlbm92byBYOS0xNCBhbmQg
WDktMTUgbGFwdG9wcy4NCj4gDQo+IExpbms6IA0KPiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwv
aXB1Ni1kcml2ZXJzL2Jsb2IvbWFzdGVyL2RyaXZlcnMvbWVkaWEvaTJjL2ltDQo+IHg0NzEuYw0K
PiBMaW5rOiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTI0NTQx
MTkNCj4gU2lnbmVkLW9mZi1ieTogS2F0ZSBIc3VhbiA8aHBhQHJlZGhhdC5jb20+DQo8c25pcD4N
Cg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvaW14NDcxLmMgYi9kcml2ZXJzL21l
ZGlhL2kyYy9pbXg0NzEuYyANCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXggMDAwMDAwMDAw
MDAwLi4zMmExMDVhNjA3MzENCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL21lZGlh
L2kyYy9pbXg0NzEuYw0KPiBAQCAtMCwwICsxLDEwNDcgQEANCg0KPHNuaXA+DQoNCj4gK3N0YXRp
YyBpbnQgaW14NDcxX3VwZGF0ZV9mbGlwKHN0cnVjdCBpbXg0NzFfZGF0YSAqc2Vuc29yLCB1MzIg
dmFsdWUsDQo+ICsJCQkgICAgICB1OCBmbGlwX2JpdCkNCj4gK3sNCj4gKwlpbnQgcmV0Ow0KPiAr
CXU2NCB2YWwgPSB2YWx1ZSA/IGZsaXBfYml0IDogMDsNCj4gKw0KPiArCWlmIChzZW5zb3ItPnN0
cmVhbWluZykNCj4gKwkJcmV0dXJuIC1FQlVTWTsNCg0KSSBzZWUgbm8gcmVhc29uIHdoeSB0aGlz
IGNvdWxkIG5vdCBiZSB1cGRhdGVkIHdoaWxlIHN0cmVhbWluZywgc2luY2UgdGhlIGgveSBvZmZz
ZXRzIGdldCBhZGp1c3RlZCB0aGUgYmF5ZXIgcGF0dGVybiBzdGF5cyB0aGUgc2FtZSBzbyBjaGFu
Z2luZyB3aGlsZSBzdHJlYW1pbmcgc2hvdWxkIGJlIGZpbmUuDQoNCj4gKw0KPiArCS8qIGhmbGlw
ICovDQo+ICsJLyoNCj4gKwkgKiBTb21lIG1hbnVmYWN0dXJlcnMgbW91bnQgdGhlIHNlbnNvciB1
cHNpZGUtZG93biAocm90YXRpb24gPT0gMTgwKS4NCj4gKwkgKiBWNEwyIHNldHMgYm90aCBoL3Zm
bGlwIHRvIDEgZm9yIDE4MC1kZWdyZWUgcm90YXRpb24sIGJ1dCBvbmx5IHRoZQ0KPiArCSAqIHZm
bGlwIHNob3VsZCBhY3R1YWxseSBiZSBhcHBsaWVkLiBTa2lwIHRoZSBpbml0aWFsIGhmbGlwIHdy
aXRlIHRvDQo+ICsJICogcHJlc2VydmUgY29ycmVjdCBvcmllbnRhdGlvbi4NCj4gKwkgKi8NCg0K
SSB3YXMgYW5zd2VyaW5nIHlvdXIgb2ZmLWxpc3QgZW1haWwgYWJvdXQgdGhpcywgYnV0IG5vdyBJ
IHNlZSB0aGF0IHlvdSd2ZSBhZGRlZCB0aGlzIHdvcmthcm91bmQgaGVyZS4gSSBiZWxpZXZlIHRo
YXQgdGhpcyB3b3JrYXJvdW5kIGlzIHdyb25nLCBzbyBsZXQgbWUgbW92ZSBhbnN3ZXIgdGhpbmdz
IGhlcmUgaW5zdGVhZCBvZiBvZmYtbGlzdDoNCg0KPiBJIGZpbGxlZCBpbiB0aGUgRE1JIGluZm9y
bWF0aW9uIGluIHRoZSB0YWJsZSBhbmQgSSBmb3VuZCB2NGwyIHNldHMgdXAgDQo+IGJvdGggaGZs
aXA9MSBhbmQgdmZsaXA9MSB3aGVuIHRoZSByb3RhdGlvbiBpcyAxODAuDQoNClllcyB0aGF0IGlz
IGNvcnJlY3QsIG5vdGUgdGhpcyBpcyBhY3R1YWxseSBkb25lIGJ5IGxpYmNhbWVyYSwgaW4gcmVz
cG9uc2UgdG8gdGhlIHJvdGF0aW9uIHByb3BlcnR5IHJlcG9ydGluZyAxODAgZGVncmVlcyByb3Rh
dGlvbiBhZnRlciBhZGRpbmcgdGhlIGxhcHRvcCB0byB0aGUgRE1JIHRhYmxlLg0KDQo+IEluIG15
IGNhc2UsIEkgb25seQ0KPiBuZWVkIHRvIHNldCB2ZmxpcCB0aGVuIEkgY2FuIGdldCBhIGNvcnJl
Y3QgaW1hZ2UuDQoNCkZpcnN0IG9mIGFsbCBhcmUgeW91IHN1cmUgdGhhdCB5b3Ugb25seSBuZWVk
IHRvIHNldCB2ZmxpcD8gQSBjYW1lcmEgaXMgbm90IGEgbWlycm9yISBJZiB5b3Ugc2F5IHJhaXNl
IHlvdXIgcmlnaHQgaGFuZCBpbiBmcm9udCBvZiB0aGUgY2FtZXJhIHRoZW4gb24gdGhlIHNjcmVl
biB5b3Ugc2hvdWxkIGJlIHNlZW4gcmFpc2luZyB0aGUgaGFuZCB3aGljaCBpcyBvbiB0aGUgbGVm
dCBmb3IgInRoZSB5b3UiIGxvb2tpbmcgYXQgdGhlIHNjcmVlbiBiZWNhdXNlIGlmIHlvdSB3ZXJl
IHRvIGxvb2sgYXQgeW91IGZyb20gdGhlIHBvdiBvZiB0aGUgY2FtZXJhIHlvdXIgcmlnaHQgaGFu
ZCBpcyBvbiB0aGUgbGVmdC4NCg0KVGhlIGVhc2llc3Qgd2F5IHRvIGNoZWNrIHRoaXMgaXMgdG8g
aGF2ZSBzb21ldGhpbmcgd2l0aCBzb21lIHdyaXR0ZW4gdGV4dCBvbiBpdC4gSW4gYSBtaXJyb3Ig
eW91IGNhbm5vdCAoZWFzaWx5KSByZWFkIGUuZy4gdGhlIHRleHQgcHJpbnRlZCBvbiBhIFQtc2hp
cnQgYnV0IHdpdGggYSBjYW1lcmEgeW91IHNob3VsZCBiZSBhYmxlIHRvIHJlYWQgdGhpcyB3aXRo
b3V0IHByb2JsZW1zLg0KDQpBbHNvIG1ha2Ugc3VyZSB5b3UgdXNlIHFjYW0gdG8gdGVzdCBiZWNh
dXNlIHFjYW0gZG9lcyBub3QgbWlycm9yL2hmbGlwLg0KU29tZSBhcHBzIGhmbGlwIHRoZSBpbWFn
ZSBmb3IgeW91IChlc3AuIHRoaW5ncyBsaWtlIGdvb2dsZSBtZWV0KSBiZWNhdXNlIHBlb3BsZSBh
cmUgc28gdXNlZCB0byBzZWVpbmcgdGhlbXNlbHZlcyBpbiBhIG1pcnJvciB0aGF0IHRoZXkgYWRq
dXN0IHRoZSB2aWV3IGZvciB5b3UuIE5vdGUgZS5nLiBnb29nbGUgbWVldCBvbmx5IG1pcnJvcnMg
eW91ciBvd24gcHJldmlldyBpdCBzZW5kcyBvdXQgYW4gdW5taXJyb3JlZCBpbWFnZSB0byB0aGUg
cGVvcGxlIG9uIHRoZSBjYWxsIChJSVJDKS4NCg0KSWYgYWZ0ZXIgdGhpcyBsb25nIG1hbnNwbGFp
bmluZyAoc29ycnkpIHdyaXRldXAgYWJvdXQgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBhIG1pcnJv
ciBhbmQgYSBjYW1lcmEgeW91IHN0aWxsIHRoaW5rIHlvdSBvbmx5IG5lZWQgdmZsaXAsIHRoZW4g
dGhhdCBtZWFucyB0aGF0IGVpdGhlciB0aGUgaGZsaXAgb3QgdGhlIHZmbGlwIGNvbnRyb2wgb2Yg
dGhlIHNlbnNvciBpcyBpbnZlcnRlZCBhbmQgdGhlIGRyaXZlciBuZWVkcyB0byBpbnZlcnQgaXQu
DQoNCkFyZSB3ZSBzdXJlIHRoZSBjYW1lcmEgbW9kdWxlIGlzIHVwc2lkZSBkb3duPyBNYXliZSB2
ZmxpcCBpcyB0aGUgb25lIHdoaWNoIHdlIG5lZWQgdG8gaW52ZXJ0IGFuZCB0aGUgbW9kdWxlIGlz
IG5vdCB1cHNpZGUtZG93biBhdCBhbGwgPw0KDQpIbW0sIGxvb2tpbmcgYXQgb3RoZXIgaW14IHNl
bnNvciBkcml2ZXJzLCB1bmxpa2Ugb3Ygc2Vuc29ycyB3aGVyZSBzb21ldGltZXMgaGZsaXAgaXMg
aW52ZXJ0ZWQgaXQgc2VlbXMgdGhlIDIgZmxpcCBjb250cm9scyBhcmUgc29mYXIgYWx3YXlzIHN0
cmFpZ2h0IGZvcndhcmQgb24gaW14LiBBbHRob3VnaCBzb21lIGRyaXZlcnMgb25seSBpbXBsZW1l
bnQgdmZsaXAgYW5kIGhhdmUgbm8gaGZsaXAgYXQgYWxsLg0KDQpBcyB5b3UgbWVudGlvbiBpbiB0
aGUgY292ZXIgbGV0dGVyIHRoaXMgaXMgYSBjbGVhbmVkIHVwIHZlcnNpb24gb2Y6DQpodHRwczov
L2dpdGh1Yi5jb20vaW50ZWwvaXB1Ni1kcml2ZXJzL3RyZWUvbWFzdGVyL2RyaXZlcnMvbWVkaWEv
aTJjL2lteDQ3MS5jDQoNCk5vdGUgdGhhdCB3ZSd2ZSBzZWVuIGlzc3VlcyB3aXRoIG1pcnJvcmlu
ZyAvIGZsaXBwaW5nIGZyb20gdmFyaW91cyBvdGhlciBkcml2ZXJzIG9yaWdpbmF0aW5nIGZyb20g
SW50ZWwsIHRoZXkgaGF2ZSBub3QgYWx3YXlzIGdvdCB0aGlzIGNvcnJlY3QsIGVzcGVjaWFsbHkg
d2hlbiBpdCBjb21lcyB0byBtaXJyb3JpbmcgYnkgZGVmYXVsdCAod2hlbiB0aGUgaGZsaXAgY29u
dHJvbCdzIHZhbHVlIGlzIDApIGJ1dCBhbHNvIHdpdGggdmZsaXBwaW5nIGJ5IGRlZmF1bHQgd2hl
biB0aGUgZHJpdmVyIHdhcyBkZXZlbG9wZWQgb24gYSBsYXB0b3Agd2hpY2ggaGFkIHRoZSBtb2R1
bGUgdXBzaWRlLWRvd24sIHNlZSBlLmcuIDoNCg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2xvZy9kcml2ZXJzL21lZGlh
L2kyYy9vdjAyYzEwLmMNCg0Kd2hlcmUgd2UgbmVlZGVkIHRvIGRvIHF1aXRlIGEgZmV3IGZsaXBw
aW5nIHJlbGF0ZWQgZml4ZXMuDQoNCj4gKwlpZiAoZmxpcF9iaXQgPT0gSU1YNDcxX0hGTElQX0JJ
VCkgew0KPiArCQlpZiAoc2Vuc29yLT5yb3RhdGlvbiA9PSAxODAgJiYgIXNlbnNvci0+aGZsaXBf
aW5pdGlhbGl6ZWQpIHsNCj4gKwkJCXNlbnNvci0+aGZsaXBfaW5pdGlhbGl6ZWQgPSB0cnVlOw0K
PiArCQkJcmV0dXJuIDA7DQo+ICsJCX0NCg0KVGhpcyBsb29rcyBsaWtlIHlvdSBza2lwIHdyaXRp
bmcgdGhlIGhmbGlwIG9uIHRoZSBmaXJzdCBzdGFydCBzdHJlYW0sIGJ1dCB3aGF0IGFib3V0IHN1
YnNlcXVlbnQgc3RyZWFtcyA/DQoNCkFsc28gc2VlIG15IG5leHQgY29tbWVudCBiZWxvdywgSSB0
aGluayB0aGlzIHNraXBwaW5nIG9ubHkgb25jZSBkb2VzIHBvaW50IHVzIGluIHRoZSByaWdodCBk
aXJlY3Rpb24uDQoNCj4gKw0KPiArCQljY2lfdXBkYXRlX2JpdHMoc2Vuc29yLT5yZWdtYXAsIElN
WDQ3MV9SRUdfT1JJRU5UQVRJT04sDQo+ICsJCQkJZmxpcF9iaXQsIHZhbCwgJnJldCk7DQo+ICsN
Cj4gKwkJcmV0dXJuIHJldDsNCj4gKwl9DQo+ICsNCj4gKwkvKiB2ZmxpcCAqLw0KPiArCWNjaV91
cGRhdGVfYml0cyhzZW5zb3ItPnJlZ21hcCwgSU1YNDcxX1JFR19PUklFTlRBVElPTiwNCj4gKwkJ
CWZsaXBfYml0LCB2YWwsICZyZXQpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQoN
CkhtbSwgSSB3b25kZXIgaWYgdGhlIHByb2JsZW0gaGVyZSBpcyB5b3UgZG9pbmcgMiBzdWJzZXF1
ZW50IGNjaV91cGRhdGVfYml0cygpLiBJZiB0aGUgZmxpcCBjb250cm9sIHJlZ2lzdGVyZWQgaXMg
ZG91YmxlLWJ1ZmZlcmVkIGFuZCB0aGUgbmV3IHZhbHVlIGlzIGxhdGNoZWQgYXMgdGhlIGFjdHVh
bCB2YWx1ZSBvbiB0aGUgc3RhcnQgb2YgdGhlIG5leHQgZnJhbWU7IGFuZCB0aGlzIGlzIGNvbWJp
bmVkIHdpdGggcmVhZGluZyBiYWNrIHJlYWRpbmcgdGhlIGFjdGl2ZSB2YWx1ZSwgbm90IHRoZSBs
YXN0IHdyaXR0ZW4gdmFsdWUgdGhlbiB0aGUgZmlyc3QgdGltZSB5b3UgZG8gdGhpcyB0aGUgc2V0
dGluZyBvZiB0aGUgaGZsaXAgYml0IHdpbGwgYmUgb3ZlcndyaXR0ZW4gYnkgdGhlIHNlY29uZCBj
Y2lfdXBkYXRlX2JpdHMuDQoNCkkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIGRvIHNvbWV0
aGluZyBzaW1pbGFyIHRvIHdoYXQgaW14MjE5LmMgYW5kIHJlcGxhY2UgdGhlc2UgMiBjY2lfdXBk
YXRlX2JpdHMoKSBjYWxscyB3aXRoOg0KDQogICAgICAgIGNjaV93cml0ZShpbXg0NzEtPnJlZ21h
cCwgSU1YNDcxX1JFR19PUklFTlRBVElPTiwNCiAgICAgICAgICAgICAgICAgIGlteDQ3MS0+aGZs
aXAtPnZhbCB8IGlteDQ3MS0+dmZsaXAtPnZhbCA8PCAxLCAmcmV0KTsNCg0KSSBiZWxpZXZlIHRo
aXMgc2hvdWxkIHdvcmsgaGVyZSB0b28uDQoNCg0KPiArDQo+ICsJY2NpX3dyaXRlKHNlbnNvci0+
cmVnbWFwLCBJTVg0NzFfUkVHX1ZfV0lOX09GRlNFVCwNCj4gKwkJICB2YWx1ZSA/IDB4ZTAgOiAw
eGViLCAmcmV0KTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJY2Np
X3VwZGF0ZV9iaXRzKHNlbnNvci0+cmVnbWFwLCBJTVg0NzFfUkVHX0hfV0lOX09GRlNFVCwgMSwN
Cj4gKwkJCXZhbHVlID8gMHgwMSA6IDB4MDAsICZyZXQpOw0KDQpObyBuZWVkIGZvciBjY2lfdXBk
YXRlX2JpdHMoKSBoZXJlLCB0aGUgcmVnaXN0ZXIgaXMgYWx3YXlzIGluaXRpYWxpemVkIHRvIDB4
Yzggc28gdGhpcyBjYW4ganVzdCB1c2UgaGFyZGNvZGVkIHZhbHVlcyBsaWtlIHRoZSBWX1dJTl9P
RkZTRVQgcGF0aDoNCg0KCWNjaV93cml0ZShzZW5zb3ItPnJlZ21hcCwgSU1YNDcxX1JFR19IX1dJ
Tl9PRkZTRVQsDQoJCSAgdmFsdWUgPyAweGM5IDogMHhjOCwgJnJldCk7DQoNCj4gKwlyZXR1cm4g
cmV0Ow0KDQpVcGRhdGluZyBib3RoIG9mZnNldHMgaGVyZSBpcyB3cm9uZyB3aGVuIGhmbGlwICE9
IHZmbGlwLCB5b3Ugc2hvdWxkIG9ubHkgdXBkYXRlIFZfV0lOX09GRlNFVCB3aGVuIGNoYW5naW5n
IHZmbGlwIGFuZCBIX1dJTl9PRkZTRVQgd2hlbiBjaGFuZ2luZyBoZmxpcC4NCg0KSSBzdWdnZXN0
IGRyb3BwaW5nIHRoaXMgZnVuY3Rpb24gYW5kIGluc3RlYWQgaW4gc2V0X2N0cmwoKSBkbyB0aGlz
Og0KDQoJY2FzZSBWNEwyX0NJRF9IRkxJUDoNCgkJY2NpX3dyaXRlKGlteDQ3MS0+cmVnbWFwLCBJ
TVg0NzFfUkVHX09SSUVOVEFUSU9OLA0KCQkJICBpbXg0NzEtPmhmbGlwLT52YWwgfCBpbXg0NzEt
PnZmbGlwLT52YWwgPDwgMSwgJnJldCk7DQoJCWNjaV93cml0ZShzZW5zb3ItPnJlZ21hcCwgSU1Y
NDcxX1JFR19IX1dJTl9PRkZTRVQsDQoJCQkgIHZhbHVlID8gMHhjOSA6IDB4YzgsICZyZXQpOw0K
CQlicmVhazsNCiAgICAgICAgY2FzZSBWNEwyX0NJRF9WRkxJUDoNCgkJY2NpX3dyaXRlKGlteDQ3
MS0+cmVnbWFwLCBJTVg0NzFfUkVHX09SSUVOVEFUSU9OLA0KCQkJICBpbXg0NzEtPmhmbGlwLT52
YWwgfCBpbXg0NzEtPnZmbGlwLT52YWwgPDwgMSwgJnJldCk7DQoJCWNjaV93cml0ZShzZW5zb3It
PnJlZ21hcCwgSU1YNDcxX1JFR19WX1dJTl9PRkZTRVQsDQoJCQkgIHZhbHVlID8gMHhlMCA6IDB4
ZWIsICZyZXQpOw0KCQlicmVhazsNCg0KUmVnYXJkcywNCg0KSGFucw0KDQo=

