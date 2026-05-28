Return-Path: <linux-media+bounces-62947-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CjLCHkAGGrUYwgAu9opvQ
	(envelope-from <linux-media+bounces-62947-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 10:44:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D87C85EEDC3
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 10:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BA0A31E82DE
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 08:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D5E380FDF;
	Thu, 28 May 2026 08:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d+Ci5O/L"
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013062.outbound.protection.outlook.com [40.93.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1B537C0F7;
	Thu, 28 May 2026 08:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957378; cv=fail; b=CqbhVQpejuewO669xQECuk8z/EeKYL3SknXgMqIqec4k4ZM/do88vvKUL7o68MUWRxkyvc5r+PUxp7HSQ0smjRuxjjNMa71pUVd06SWPUCgp6YgR83wCQz5WAuUIjzHD+rHwwQfia2ZZL6uDMIDPpKV4h36hOwpFryoiN//g6rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957378; c=relaxed/simple;
	bh=i39aclVi/aQIuwkBxb1SdZOw4lysnoTYf5CZUjCzNN4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L8nYv+pitAFaqUct4wZ4pB78xyjJnOtCADXQ+2q7T5rXM6KYK/2twmjGoOzpWxuymonFS39jnE2RzMltaCulueF8MLeEM13lBcZXzUkxwYPzUYqJyrqMdrXBnARZLml/GrgNeM1Z59r+BAiCncku8JCS8u9LmN3Wig6IEy972fA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d+Ci5O/L; arc=fail smtp.client-ip=40.93.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOKPE0QCorTnLBVDCVl9RA+MlW8tByvA3YErHGXelWnjZpI9Ihh93c0kuq/32spp4BzFFHm71kHOZNMZL3xWMLxF6Y+F2gsnqdBI/5CKeZX2N9d4aVvuy4VydeUHHCvQOw/y246KpIy3xXrGR8K5BsxKB2aVvrVOyBj9m+LnCzmVYELyp7G/b+m/cKm6Z6iMpiDky/dPpRUBl5RhZDgGv0VG9XbX2qs3xRD9Q7Xj69zbRuSMANjFRm5VXBcgjEyH/LYdkjietOSvY+6uJCDNRlrQI2pcPm1Lfe/iPVCnjNKgzZtXWHzSkX73jssIyFAMzBeuVq6cYv6nfX+6/HtJaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i39aclVi/aQIuwkBxb1SdZOw4lysnoTYf5CZUjCzNN4=;
 b=Fr5bnoxHTuS3dTRX+Lr3jV9OKSeDgMaSiGeeUgVjTcK61cisw7tmkUNtMC3ZBKONraCYQvqfgJOTCBZce6A0B43fNwh9kyVY9rUATLtDsG6cKPsMk6/HaHh2TQ+pfPkFst4uBF4fzC5j3natc7ZNXV9cBl00hZ3Z3kiUf4vAMkKgFJyq44l/BHxKqmh0gJ5/Xqwuy9bTQu/DHkmTgOFyvBlCr4miOxahYTKg0pgFncSiFnD6Y2e1foVrZZiS4PaWX0Bp7MBgGMJ0GQr3jQSDze0EwhPfsnjFuW8uFz5mnKzl/kMV/qGem03QFhH0XzaCMu+qbIrk3Gc3aMTyL8WlFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i39aclVi/aQIuwkBxb1SdZOw4lysnoTYf5CZUjCzNN4=;
 b=d+Ci5O/LbOtIhxy6TlXTDbynrkNZ/RVfmCvPF4YH1uxczsLebAEbiYyZ9NBnzQG0jxeEiS0ucrGfQAxzTSd0zPVie42ZeMTbFMlaiY5NAgQcDd1P+9adtMUF47wDCBdrZrVSUyrq+d8q9eSx1fh6YYg5w2yIAgKlz//yvFjfZsZgCfxrxTuv74fl0eDBIAfbQDn08OZD/ySXS6P3RJqQ9slxl8zudEyDPAbcrpQLQb0IhL1KL4yKxOtGNBnHP7cX0IrzaZmPjrm/3stgNzYLCCo5UU2pP8xCd9UnaetYaMJBbuySiQEpWFyoPpqjaAy68EeWElC0GqSnwJQbN6lLZQ==
Received: from SAWPR12MB999118.namprd12.prod.outlook.com
 (2603:10b6:806:4e2::13) by SJ1PR12MB6122.namprd12.prod.outlook.com
 (2603:10b6:a03:45b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 08:36:13 +0000
Received: from SAWPR12MB999118.namprd12.prod.outlook.com
 ([fe80::29d3:5625:9339:d4ba]) by SAWPR12MB999118.namprd12.prod.outlook.com
 ([fe80::29d3:5625:9339:d4ba%4]) with mapi id 15.20.9913.009; Thu, 28 May 2026
 08:36:13 +0000
From: Henry Lin <henryl@nvidia.com>
To: Michal Pecio <michal.pecio@gmail.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/1] media: uvcvideo: reset interface on bulk stream
 stop
Thread-Topic: [RFC PATCH 0/1] media: uvcvideo: reset interface on bulk stream
 stop
Thread-Index: AQHc7HNZ+U2PWH4GIEyVP7J8a4HKY7YfavUAgACmhmSAAAbwgIADCGmd
Date: Thu, 28 May 2026 08:36:12 +0000
Message-ID:
 <SAWPR12MB9991187DB56BAB00EB2550E897AC092@SAWPR12MB999118.namprd12.prod.outlook.com>
References: <20260525182028.2148267-1-henryl@nvidia.com>
	<20260526015514.466b72d4.michal.pecio@gmail.com>
	<SAWPR12MB99911841F75A9492A6FA875421AC0B2@SAWPR12MB999118.namprd12.prod.outlook.com>
 <20260526121605.332525c6.michal.pecio@gmail.com>
In-Reply-To: <20260526121605.332525c6.michal.pecio@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SAWPR12MB999118:EE_|SJ1PR12MB6122:EE_
x-ms-office365-filtering-correlation-id: d9c0a25d-5559-4631-9196-08debc942cd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|4143699003|56012099006|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 dVGLgLaSQTjkgOntwa8TZpBVPQiAYULP+Su5LDvi7t13GO+x8W6auK9o34gDhsuO/E1ebsvtosV+yk199x2LZy4c3OcAIbtYYvCbjG1iH3xzX+8gZVeXSUCRluYqRqPdlbzoDyEVKZFxpUTYoYGIvK56tZlS77fKRacdmaszsSo67urqKzQiXFi3LGPpsxL1672zO2+8c+4qo+jD0+qS/QMV6AjxgK6w4XzQmlhd/ytE3sCG8OoFw5m5oDZsrrZkmyhnl+a51K8jKcwquGn60inVqdKKCsOHz5fDg80uSzzwbJKz1fo3Dj7kXHW48W+4Kp/Anfrxpf/VNritoiuyP6kngIPacM2a6rRWGff6njKbyrI2fCaLjy1te5k38HIKvOy7oRGhVB8Tub8xhp0cuq/V9sz3kUeV1s3BnF5yXsRxFk8OP4rtEyBq6wLh2T5E3yiFuYLLFhAMlR9hhVSFb+1ySsZccjyVLfZDT0uHWWOFgNKeeoc3jZM4Paj2fKp7LsjSvwOFgTbcLOfR/hZj/WzWPkH/YiR6qgq1BYLLGq1PRjqnK1rgosvQF88VUwOb/iQLht2Brqy5Rs0D984X0oZx32CDKjZ9OvxzfmvFX2DjGJY1kY1hxRp9pCCqSygqP9xnO9OVncT0SoQw0E5PBlGe9+8hyJu3stJ7/C7UruHizcx0WCd3c1BiM2S6WvWblKV0VXTjCNutWleo8qI0aA1FQRNHAakGIe9JLeGQQeRNXjFjb4ksWGk2R9b33Gx7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SAWPR12MB999118.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JfpScGMR5cdM3wqnfAM4gtrS1v7zmlEdQn7W5KoPTYjUgh58sjCroPuaig?=
 =?iso-8859-1?Q?goFuFj417XCA08RAYu2kQlcIoD8SlwRyrkIcLmYb5/ecDUXscZUrm9UnqE?=
 =?iso-8859-1?Q?2PlftXzQPDCvrmBdAbFO4aBUtbaHa7Cleu5/r9EscFYXJGuHwuMvRdyn4V?=
 =?iso-8859-1?Q?R5Ibk2y7Jj84qNBzQ8uzGggTQsuwBPIKKHpyzGalnXorDPYGf/IcDazbyR?=
 =?iso-8859-1?Q?L78CfIDaqtF3j2EUQ15cAv0bv5R3zERNAKKDMWe4o4yX6zCex8+uijXTcT?=
 =?iso-8859-1?Q?Cbvl+jGAOyfdvrZHBFM88H/mCDV7DNnhMNcoYZGyzJ8b/aNdMSWHWAIult?=
 =?iso-8859-1?Q?mdjGK1BcWRuBOkeEnxCusFpSYvjY3myc8YZ+zS6tubSuQD5yaPPeuOTXU9?=
 =?iso-8859-1?Q?a+Oc/0+8hzwiD0oUp0m2dixzAaYMrjzF9MtFkL31OnyqgvVvjhqeIR61kh?=
 =?iso-8859-1?Q?TshEE5dmq6GCfwg0PqmV/Qd6tvHTdMRzi1pqNlqAzHCKVzaIO0QKge8gK3?=
 =?iso-8859-1?Q?e7SF9AElDhXEHB7LF8TRZq50S2B/9Qhexs3smNfD8tw3VsAmqrwaVhPjiz?=
 =?iso-8859-1?Q?YgtlTT54wPvpTNlqbHYA4EWGS/krbghI94W1Wnp9nhTtgNevhZns1YGzzs?=
 =?iso-8859-1?Q?rTmqfWwgUJRU5STCPShhTscTFAP30HRyAvTRKCJ/FLZpOaQRNYbACGYBx9?=
 =?iso-8859-1?Q?cUK/Zbh1L4UMrp62O6WGfcdNnq06tsKscg8yNq63T+lWZGyU2BmaHzyqfd?=
 =?iso-8859-1?Q?oHz7UBEvf10qZa7127FpzCtKK4hHfuoWuX/tc7/HxJVUXnDKrCm6WlmJc5?=
 =?iso-8859-1?Q?6kJuKGzz3pbyoE7mB0ZbPgz12nxOete4WtG9AFNLeD1E01fvlMzXG0D5MS?=
 =?iso-8859-1?Q?nF+HT2srQoKeUbA6ZDCmaX2+BOD1oj8TzlbCWB9GgRktm8W5LYXaJqusY0?=
 =?iso-8859-1?Q?NXItwk+JbiLVIX85QQTgEesJrWSf729GXhCJ4nYqvCnM5iR1Sk+c81mpUG?=
 =?iso-8859-1?Q?rS1ITCYqOMOcsA8vuyPn802L/RGybQcBRFzaOBxmpyvft1mq4KCL5mbHMu?=
 =?iso-8859-1?Q?J9Zl6ipQ4mwvoWnv4OQ0V8tTpIc807iZIV4Ae3d5UKzmir7EQD1rZO9w7o?=
 =?iso-8859-1?Q?ljZGNCy+Sx6+ciO8dnYVLRWeqH5wlaavMQXN7UzOtWk45eKx8gZO/YOuoU?=
 =?iso-8859-1?Q?nwS6WA1MMR1U0Loac3p4YPviSCdP7884vNvyil9mOgM0VC4w7ygTawMEt9?=
 =?iso-8859-1?Q?y8Yfg9HEVd49L9w6PN7nNMIX2u65wPow45hc/aIL0ZKZEsk/Zgf+H21Z0P?=
 =?iso-8859-1?Q?G6odwrTJnbnr2Ph+zYLJ1aapTGUy8o/fyfPoQprtHyACIxwYzjg3M1Lk4c?=
 =?iso-8859-1?Q?N3tticiMGbh+o3K9ZZZuzzdyKUhF7nWT6G+465Pqf6BTWp73Q6gGpX2fS4?=
 =?iso-8859-1?Q?wq9j6yaAHIaZZ5C+uEvDN0cKW6Prv2XahTrAF6orgjwgDp8coFOUpIflln?=
 =?iso-8859-1?Q?hclD1vmYDwlq7jhrRAAQ/i7KmqvH+e8BKvPOMFMz+SRCDhnjBj/nV7U9Ms?=
 =?iso-8859-1?Q?BSQi/tV0dxlzhwTAj1s+gme2PxOZ28a/yjFaNLs9s/gSVXMuuHzYpT6/t0?=
 =?iso-8859-1?Q?bGCtqv167zMST+lOJPwrcEJSuCVNJZqhA3wsEevrlWR58mm7TVBPbD15xt?=
 =?iso-8859-1?Q?Dtf9T+3OUR5M30KY5nTvx5hJUpwKc+xdnYy1qE4k9lFWnpCnj2bZnYC5x6?=
 =?iso-8859-1?Q?dAt2uedqfyfT6cUaxTExkYnoihhpy9LfRq22Obkaadrh0U?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SAWPR12MB999118.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c0a25d-5559-4631-9196-08debc942cd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 08:36:12.5734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dMfBJKtRMRhp84jjARvq4Y/n37uhUVAVYlvdE5wG33SRbaOWcwOiaAiEMZ6JNFnK8fHa+3wfpkhDCI9EltNnWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6122
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62947-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[henryl@nvidia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: D87C85EEDC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,=0A=
=0A=
> Were you seeing one such error for each restart, followed by uvcvideo=0A=
> dropping a few frames and continuing to stream normally, or multiple=0A=
> transaction errors and complete functional failure?=0A=
=0A=
On the NVIDIA xHCI host controller, I see the former.=0A=
=0A=
After each stop/start cycle, uvcvideo reports one -71 completion error,=0A=
and only the first frame is broken. Streaming then continues normally. I=0A=
do not see multiple transaction errors or a complete functional failure.=0A=
=0A=
With 25e531b422dc applied, the -71 completion error no longer appears in=0A=
the same test.=0A=
=0A=
Thanks,=0A=
Henry=0A=

