Return-Path: <linux-media+bounces-61882-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DPcJCq/CmqH7QQAu9opvQ
	(envelope-from <linux-media+bounces-61882-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:26:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4685677E5
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B05D300BCB0
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 07:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2F43DE436;
	Mon, 18 May 2026 07:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="xsk6DGsJ"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010053.outbound.protection.outlook.com [52.101.193.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5803D3304;
	Mon, 18 May 2026 07:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779089125; cv=fail; b=C2/H/WZyeTfyjsDcxyTy4PlniJ4HaeVdImbpvfVIaWE11XQYtUBoPwm7fAGmuS9NzP2unXQKwOBR0SQm/0nuygC0g958nQ+bP624yrGwV0WQ+C5tT4mplv/O/cXap+BD98gh3zc5o+UFBMY2qemM+ou2esnEmiNXiNRfdj/YxO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779089125; c=relaxed/simple;
	bh=Ag2UmcinGxoJ8LegPl63yK8TqYNeqWNebPEnQNZTR6I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PQkbro4i7FwksusEID5L9JtvX37C2d1cHqmf8rRVQSX9Kn3dRmBkJNFR8SPKZQUmfUC6gBNmJAwfqtJLKM6dGt/BPI0g9tJzDUK1kUIZkY4Mtjy3y6kTdIEA08Tvi8rwH9h5KuBYQQf2+Xay/2p5Zo5qmJbU66RQPB3lQXV8JSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=xsk6DGsJ; arc=fail smtp.client-ip=52.101.193.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kifAGb7KVgDlEYAmG386Q9fpwH0Qd5h4WV/yLeu4aE5jaQBgAEsLbJeJZam4ZIiq7qCvQXBEVaGQpiqDd9nHTo58MpOSZTt9FssfGMuNnxKnhQhEb85i/XmCrriGr9JOio0fZxNJPKPCaxekWnSRK7BIxwgjhYyb0dJA0oa4H0LK+q6rYkr8SFaL4FULSC1wfQ22LgVzIajGzQMeMKdflIzoaXajzFqu3oeUjZTDEqjE5DRNHEqec0F92SCEZW3SvPEQiw0xnvqmJbw5G0XMoB9vyN7bV0mXO8S8ZSJHxmtGbgYGBD8oIE3LP/so/mQP0X3w6aZIfrwLv/2bqWTs7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ag2UmcinGxoJ8LegPl63yK8TqYNeqWNebPEnQNZTR6I=;
 b=VBWHdTlinqkuFd3JyKe0yyi9CES9/zMbtpVRhBqT24fC/JzWozDb+NfwPcyQBngMLm6Ubz+LXei9EVi72qJPe6GttMQLhGI5nzsIGW4kd/1YXty2zHmlSatpw7YbofOnNBNiHfu82O0Jxp1Uz2QGt29X1HDaeNxrdxLIzMOMxBiVR89YctN1O+4JVem/3puRBAOLEdNKbcjgpVI+5Ol/VmnN8KGu0RC1lN5flrbXpx4vvO1WDSNc7vVVIckLipPliP3idlYs2hsnimTcvUgyT+WVWQksgMPEtGFh6EuyTLCTtJv7JL2uRyW5VoTpjubgqKqZyD7KY4Ed2v5HkvUMKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ag2UmcinGxoJ8LegPl63yK8TqYNeqWNebPEnQNZTR6I=;
 b=xsk6DGsJFjxP0913m6IF6sk9nOWsga+U0nZ3SHHRPS32066KZGirpvWHFEF4clHQXq7r5f58vzHbPVUHwj11okmD+0IYLPY10B+WqJdRsrfGb+ItYeYOX8IxGc+ZxHpgSz4oZceeLKVU8KwqHIWx5NzfDspqFQAy5HsHpRSeroFqXsuRqWsIiO/0wF2idjVpltQyhh7TMZok2RyRs+t0LgQ0ztsfKmzawBtQVUykKx5A1D1HVQ+cwAQp2JFn7PwAgtRaylgZwNaz8Ujr+Abr/kNEE3zoyvDqrtrJYkVDbSpJTIaJUdbUOnL/2NnOYk+qpWbJUTFYGjn0C/16lgKxJQ==
Received: from MN2PR11MB3838.namprd11.prod.outlook.com (2603:10b6:208:f3::10)
 by CO1PR11MB4883.namprd11.prod.outlook.com (2603:10b6:303:9b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 07:25:20 +0000
Received: from MN2PR11MB3838.namprd11.prod.outlook.com
 ([fe80::b4ca:2596:cc8e:fae7]) by MN2PR11MB3838.namprd11.prod.outlook.com
 ([fe80::b4ca:2596:cc8e:fae7%7]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 07:25:19 +0000
From: <Balakrishnan.S@microchip.com>
To: <sakari.ailus@iki.fi>
CC: <linux-media@vger.kernel.org>, <eugen.hristev@linaro.org>,
	<mchehab@kernel.org>, <hverkuil@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 11/15] media: microchip-isc: add per-channel gamma LUT
 controls
Thread-Topic: [PATCH v2 11/15] media: microchip-isc: add per-channel gamma LUT
 controls
Thread-Index: AQHc5FVQLyh5HLJrFEWu49Mug23sK7YTZkuA
Date: Mon, 18 May 2026 07:25:19 +0000
Message-ID: <bc306b7d-d972-480f-8ca8-13896c0730de@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
 <20260512154339.210444-1-balakrishnan.s@microchip.com>
 <20260512154339.210444-12-balakrishnan.s@microchip.com>
 <agb0zAmeEILM4JJy@valkosipuli.retiisi.eu>
In-Reply-To: <agb0zAmeEILM4JJy@valkosipuli.retiisi.eu>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB3838:EE_|CO1PR11MB4883:EE_
x-ms-office365-filtering-correlation-id: eb0b3495-4e39-4418-bce3-08deb4ae9dda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|38070700021|3023799003|4143699003|11063799003;
x-microsoft-antispam-message-info:
 n6EgSX4bJ9uX/HVd3dBL9iBvp9fWwoHbSh5PbT6N9OJkRfPVUTwF3aAijQUKR8c59oNz3wJsA/jK1Obi8Kg4QQEKuzukJIhv6+IaSW1p2gZieJDsBptq23ZJGAO6o2BVDnaAa2+QB8//I8o4bDkOiw4s9lQ2Zl4mc6Rq2VFSpy/oAoB3ddifdxmO+f3a3mD4Mo2OapAv4pFlOx+tvZShuPQyCWJjtDvrPjGfQCybTujrvwZrvUPg+0w0DdvNPhb5vmbME+i0yOiU8ouR0F/mSZJ0/9btrnHQA+8G8RG36UOvkMI7QDtEuFdf6l2sbRleblAvYFA5GYPHycTszBrINkryvy4OqG7WzDdzxUUFY89fT1NRcb5yOxk2Q5vuY1Yyhr72JpFg10yAB0/JERCMMrjYKRdvP3XiM+NHEU39WQ9Va/atzZEc1H1BYBuXqCD37is8+r8D57zlifPQnu5iH1/RmPI5zQxtAz7qqE9WbjNhef0PF7cDB09iQove7SPZDhDsQFnEYXwZUcUAWar5Fpmfkt5y1vyr/BWhlJMt17caGqHDkC72Z7p3Pjp7xYXEJSCH9D60pmi9v3Es8l1TRljvaIuKS5OPOu7y2SMeJtivkPZLKIT4eZBnj34tleGfM0i0vhX2+kHFnXnIzAwfXXcchbXTh3LTpq7oUlEXU4FRXtUpzcuqzSHO2t8d3HvlPVG8HhXkHjlC6D60DIT3ShA++KGpPo1sXRVtaxWUUdcOTvI05gSRDNakILnO/LBg
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3838.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(38070700021)(3023799003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V3FRMGtzanBYSmZCNE1rZjM5eDhlMmNBRFloRmVkdzdMMVJLMWxvbTc3TDRU?=
 =?utf-8?B?b0NhTklzM2RkWmVTZzZBMUVUWjhack9GenhVSTJFWTM1YXVneVJ1cHdjREVq?=
 =?utf-8?B?c3NiSWxFUjBuRU5PTWZUNGhPUkFBaXFNeFBtdDljamFOcGdIenBYN1hzVE9q?=
 =?utf-8?B?Tk1MNjJDTjVMZ01CczVSTDlveFBlcHg2SWVFdjBCQXcxblIxaTIwdW9saXhk?=
 =?utf-8?B?TXFERHZZM3V1a3lVTVFNclZPQVFVK240VUlOcEVVTzNzNnhPNTJKTm5WSDRD?=
 =?utf-8?B?aEhuTmZrNlVqemVBd200Q1ZjZ2JBdXl0RjJvQ2tvMUtLSlVRcTNUWTVUQ2ZV?=
 =?utf-8?B?bHFqZUdvbmpFZ21mMFM4ZXg5V1pVWWd1T2UrdWZvdlMyWG5WZnk1L095SUNW?=
 =?utf-8?B?cXZEanJEVmFzbnM1T1FLTjMyUllpYnQ3UEF4VlJLbDV4SUNhZ1ZibmxxNmE4?=
 =?utf-8?B?SFRUc0dqRkhYRW5DYzlMN2N1S1VUL1d4WkJHR09lZ0VMd0lZaHlSOHB4c290?=
 =?utf-8?B?NHY4eERQY09iYlpKcGRoL0hVNE5WSDJTZ2VpVVF1QS85MjlNU2pnVXBiS2dT?=
 =?utf-8?B?M1g5M3gvSTJLSTk3cHJ4NFNQK2JPelh0YytkbVlkY3FLQWl6dy8vbXBWcDVa?=
 =?utf-8?B?RkFycmJEMTNPbXlrTUFQNUhUaDJpci96bTQ5Mm1XdTRtYWh3MGJrYUkrV2o3?=
 =?utf-8?B?dTU1eDFhL1IzV2RmWklLL3NvdVhWTXhkSjZqS3lqRjV6SnZpTGY2WWNYaElw?=
 =?utf-8?B?aldMbUlJMU5mYmt4ekdIc0hROTUvdU9oT1B1REZFS2htYzFnN0ROQXp0dXFH?=
 =?utf-8?B?Q1ArbkJUbVlhdSt6ZFIwUzg2NktlVU9JRXNacUNEL2ZRYVI4eUlBK1NZTk9R?=
 =?utf-8?B?R2JLNzFJL0xQVVFhSzgwaURqNms5RG9jQTl3aDBvcVNLZEpITUx1dDVSVWZI?=
 =?utf-8?B?dVBHT3JOOE4yL1RINTlnejVuL09aektSdjNxOGs0YkJZTlhKNGtNenVjMDVJ?=
 =?utf-8?B?Qlp3cm1kZkt0ZmloYzZLTUg5b0hpdFhVcjFiVWc5d3EvaEw4eG5hMzZVWUtJ?=
 =?utf-8?B?VVNKcjUxdXhlQmtUTFJSaXdaYkxkS2Y0ZFp2Z3dNZWJsT2Zjb2orMFMrQWJF?=
 =?utf-8?B?ZFVVSjIwWWhTbVhwbWNTRDB4eml2QW54a3VrQlo1bnVZWmg1dmNkbnd6TS8z?=
 =?utf-8?B?ZTc5d21wU1krMzl4NWlOTy9FdUhEaGp1eHBoUXB1MnJCLzhwL3NySjN4MnQx?=
 =?utf-8?B?SWRFSmhTaVBadG9yZTlVMkNDbVZ6ZTNMWmEzbVZJMUkzR2tYSnp4bHpPeTdh?=
 =?utf-8?B?UDdoSTA2Y21UbTZCQSt1TFJBQ0FYUzAzY1VFODhncEN2VVJpdXdicGtML3ZE?=
 =?utf-8?B?MTZZSjZxdHdDTStJQnJHSXdFTFdsRWs0NjNJMWVlb1NIVU8zN0hmYWNPRmtt?=
 =?utf-8?B?dy9HQzJaZWQ3V0dzQXMwNTBSNC90UE5pZGJQM0VFTENJYklHdFYvTFpqWFow?=
 =?utf-8?B?RFFMWU1FN1BXTURtRkNjQkdBSlhmWHpyUHFDZ29xcnBva2UwU1VpWUhFb1pv?=
 =?utf-8?B?eWJudHE0U0E4b25JVlJ2UXU5ZXF5bG5qYkR3LzI4d3c4OFY3NjRSZ1IwY3dW?=
 =?utf-8?B?V3RzeWthaUhZVnBTSW5NaGtVWkR3Q2dENlQ5VXhyQ2VEQVpoMjFOTGNINDJm?=
 =?utf-8?B?N2NxbXA3UEprYWcrN3lyRHN1aDRwN3YvTStvd2l6aTlmUHhRZURiU01tZnFy?=
 =?utf-8?B?bUkvU09vdkRWaGZsaFlrU1FzeUo0WkZwT2dMSzc4MUMxdmdWMHJFdWNTNE02?=
 =?utf-8?B?L0Q2d3JCZkNybXhZdWtNV1lNZ1N3UGpzazdGU2ZUVzVHcFhseWFNdXgzREdX?=
 =?utf-8?B?bUNHUjUxQS8rVTlHZVdqR3FrajFvcExDZzkxWkl6Rm96RHBzenhjNGhHVjN4?=
 =?utf-8?B?Lzl5NEtjbE5WQk5HMlpicTMraml3QzdabWNDK2Z4QnYvTXNHc0hnNFNwdllC?=
 =?utf-8?B?Sk4vc1kyTkYwWFk2MGcxQkxZK2lpazczbE8xU0RhSXkxdm1oZWFVOFMrb3Za?=
 =?utf-8?B?Y0tOTCtGVTJKbHlBWDV0bmdTUlBjbzdGYkY5NS9vQ2ozTkNmOFltcWgyVmpl?=
 =?utf-8?B?aHlLYmkxbTdnUXhzbjAvdDZ5enM2R3ZMblVaVStlaWVkaUdkZy9tOTc1dDZw?=
 =?utf-8?B?cDNnMFBBRGd1eWhTZ25VUllqU1JucVI2blU1d0huT01ZNjNnQjd5Ynp3V1E5?=
 =?utf-8?B?TkFOblprNDh0SGtaVTVCQ2pyMDc5c2JJdmM2WHArM0ZVY0d6c3ExTjY0Y1I4?=
 =?utf-8?B?NkFSaTFNNEt1UW1hUm42M1NuanhrVVRHOTBrcGxtWENva1YxZUZ2dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <467D0829ADEC9D47928AA2F5A84D822A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3838.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0b3495-4e39-4418-bce3-08deb4ae9dda
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 07:25:19.8660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8gtU4lptxn23bua1Lg+Eb8IpuasoyUr7iHXmQl/fcpP7Qtewr78ntEqKlnsGcsHrFevRHslx8lMzAhtA8sTFNe3vnO+YUwIyNNKdJQxas90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4883
X-Rspamd-Queue-Id: 9A4685677E5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61882-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Balakrishnan.S@microchip.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[microchip.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Action: no action

SGkgU2FrYXJpLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KT24gMTUvMDUvMjYgMzo1
NiBwbSwgU2FrYXJpIEFpbHVzIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNr
IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlz
IHNhZmUNCj4gDQo+IEhpIEJhbGFrcmlzaG5hbiwNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHNldC4N
Cj4gDQo+IE9uIFR1ZSwgTWF5IDEyLCAyMDI2IGF0IDA5OjEzOjM1UE0gKzA1MzAsIEJhbGFrcmlz
aG5hbiBTYW1iYXRoIHdyb3RlOg0KPj4gQWRkIDY0LWVudHJ5IGdhbW1hIExVVCBjb250cm9scyBm
b3IgUi9HL0IgY2hhbm5lbHMuIFNldHRpbmcgYW55IExVVA0KPj4gb3ZlcnJpZGVzIFY0TDJfQ0lE
X0dBTU1BOyB3cml0aW5nIFY0TDJfQ0lEX0dBTU1BIHJlc3RvcmVzIHByZXNldHMuDQo+PiBTdXBw
b3J0cyBTQU1BN0c1IGJpcGFydGl0ZSBlbmNvZGluZy4NCj4gDQo+IEknZCBzYXkgaGFyZHdhcmUg
dGhpcyBjb21wbGljYXRlZCBzaG91bGQgdXNlIHBhcmFtZXRlciBidWZmZXJzIGxpa2Ugb3RoZXIN
Cj4gc2ltaWxhciBoYXJkd2FyZSBkb2VzLiBUaGUgcmVhc29uaW5nIGlzIHRoYXQgdGhlIHVzZXJz
cGFjZSBnZXRzIGFuDQo+IGludGVyZmFjZSB0aGF0IGFsbG93cyBwYXNzaW5nIGFsbCByZWxldmFu
dCBwYXJhbWV0ZXJzIHRvIHRoZSBkcml2ZXIgYXQgb25lDQo+IGdvLCB3aXRoIGEgcmVhc29uYWJs
ZSBleHBlY3RhdGlvbiBvbiB3aGljaCBmcmFtZSBpdCBjYW4gYmUgYXBwbGllZCB0by4NCj4gQ29u
dHJvbHMgcHJvdmlkZSBuZWl0aGVyIG9mIHRoZXNlLg0KDQpJIGV4cG9zZWQgdGhlIGdhbW1hIExV
VCBhbmQgQ0MgbWF0cml4IGFzIHY0bDIgY29udHJvbHMgdG8ga2VlcCB0aGUNCmRyaXZlciB1c2Fi
bGUgZnJvbSBleGlzdGluZyB2NGwyLWN0bCBiYXNlZCBmbG93cyB3aXRob3V0IGludHJvZHVjaW5n
DQphIG5ldyBpbnRlcmZhY2UgaW5pdGlhbGx5LiBIb3dldmVyIEkgYWdyZWUgdGhpcyBpcyBub3Qg
dGhlIHJpZ2h0IGZpdA0KZm9yIExVVCB0YWJsZXMgYW5kIG1hdHJpY2VzLg0KDQpJIHdlbnQgYmFj
ayB0byB0aGUgZGF0YXNoZWV0IGFuZCB0aGUgSVNDIGhhcyBhIHByb2ZpbGUgdXBkYXRlDQptZWNo
YW5pc20gKElTQ19DVFJMRU4uVVBQUk8sIGRhdGFzaGVldCBzZWN0aW9uIDQzLjYuNi4xKSB3aGVy
ZSB0aGUNCmNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzIGFyZSBkb3VibGUgYnVmZmVyZWQgYW5kIGxh
dGNoZWQgb24gdGhlIG5leHQNCnZzeW5jLiBUaGUgcGFyYW1ldGVyIGJ1ZmZlciBpbnRlcmZhY2Ug
aXMgYSBnb29kIG1hdGNoIGZvciB0aGlzDQpoYXJkd2FyZS4gSSBhY3R1YWxseSBvdmVybG9va2Vk
IHRoaXMgYXNwZWN0LiBUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0Lg0KDQo+IA0KPiBPbiB0
b3Agb2YgdGhpcywgdGhlIGNvbnRyb2wgZnJhbWV3b3JrLCB3aGlsZSB1c2VmdWwgZm9yIGhpZ2gg
bGV2ZWwNCj4gY29uZmlndXJhdGlvbiBwYXJhbWV0ZXJzLCBpbnRyb2R1Y2VzIHF1aXRlIGEgYml0
IG9mIHZhbGlkYXRpb24gb3ZlcmhlYWQNCj4gdGhhdCBjYW4gYWZmZWN0IHBlcmZvcm1hbmNlIHdo
aWxlIHRoZSBlZmZlY3Qgb2YgYSBiYWQgcGFyYW1ldGVyIHZhbHVlIGlzDQo+IHNpbXBseSBiYWQg
b3V0cHV0IGFuZCB0aGUgc29mdHdhcmUgc2V0dGluZyB0aGVzZSB2YWx1ZXMgaXMgcHVycG9zZS1i
dWlsdCBzbw0KPiBpdCBjYW4gYWxyZWFkeSB0YWtlIHRoZSByYW5nZXMgYW5kIHN0ZXBzIGludG8g
YWNjb3VudC4NCg0KQWdyZWVkLg0KDQpGb3Igbm93LCBmb3IgdjQgSSB3aWxsIGRyb3AgdGhlIGdh
bW1hIExVVCBhbmQgQ0MgbWF0cml4IGNvbnRyb2xzIHBhdGNoZXMgDQphbmQga2VlcCB0aGUgcmVt
WWVhaW5pbmcgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzIGFzIGl0IGlzLg0KDQpJJ2xsIHJlc3VibWl0
IHRoZSBnYW1tYSBMVVQgYW5kIENDIG1hdHJpeCBhcyBhIGZvbGxvdyB1cCBzZXJpZXMNCmFkZGlu
ZyBhIHBhcmFtZXRlciBidWZmZXIgbm9kZSwgbGF0Y2hlZCBhdCB2c3luYyB2aWEgVVBQUk8uDQoN
Cg0KPiANCj4gLS0NCj4gS2luZCByZWdhcmRzLA0KPiANCj4gU2FrYXJpIEFpbHVzDQotLSANCkJl
c3QgcmVnYXJkcywNCkJhbGFrcmlzaG5hbiBTDQoNCg==

