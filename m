Return-Path: <linux-media+bounces-62773-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOtpCypuFWojVAcAu9opvQ
	(envelope-from <linux-media+bounces-62773-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 11:55:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9D75D3C6B
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 11:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F42B302A7F0
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 09:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3233D9666;
	Tue, 26 May 2026 09:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V80fYTHx"
X-Original-To: linux-media@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011019.outbound.protection.outlook.com [52.101.57.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5973CF97E;
	Tue, 26 May 2026 09:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789325; cv=fail; b=ek0UJ6rjrs3M+b7TGN4giHdjAFl/3sl10zoAofkAjGvJRE+64JMG2C8SUl+o2ePUw7NM5YwQWNX5gQhGZ0meDUUfUi013g9axDucGAgNHLKHl+jjq+zzVYDMkMOtbFExtk8wrt3YYTvWz1K+pcAhdWunCh6Gmsrdo1JoA5oYWkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789325; c=relaxed/simple;
	bh=5bayH101FRoPxqRCyn+HCk6b+fEvMcK3cax4KaAUcxA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uip+1+0FWttLDPo3CA1QnF4whLdWnk9fhTTQvg+NVdgs133EoOBnRv/6hFm272QXWjaexeYfmxzffwJSrGxXdWzhvJdiYjGaL1S9RaoJrCv+aS/+Pz8mM5doiVnekSs/SuWWnDPzqF8/3LFlGJ9rn0nqzN46Jav3uKcwwkcPS4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V80fYTHx; arc=fail smtp.client-ip=52.101.57.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q528pVnaQ0vrq4cOkNEinFuGXMxoXAMeZcadauDMpSp3LbiaDoTvuVAHYNPqIs1leKSOyHg8jQvJ6MT8D6ZmSy+bXd4vHuGfkVtUnnD7fI8bGonMYD4o6pgtPQP2o+O/ziHRPxiogSsY0n2GyB4ecB6Kx4lUkaQMkG70N207OEq7ssdKE8nOwnitgOzissr8OrJ6rSIOXiH5gvVWzoR5RJXRlXUzvl2eeFiFkdTBgu8tjqZSWw+WsDNajC0myj9WRn6uQIJM2IhDpxDcl0LAn2bBp9ZWIENdsnFKTK2cm9MLyj4tEuK2/JlqGumwFGXojaHgaD8VRZknvDEtcK2qnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bayH101FRoPxqRCyn+HCk6b+fEvMcK3cax4KaAUcxA=;
 b=AdJoPhCaZJgRHsYG8Vq2P+adDrGRWAjJ9ke+bseP2nplDIcGcLSDPHFAOx5thfSqmyHfwrR9ZyTv2xaxwvdJrCHMiFPyCm4HHgXzCrA8llk+rEL/eky+CNTnI19EUEEM0ZoBOwzInIipDL5bZf/BlcPexsRNrhGqUOPe43CancxGciqOt1agyl9+6Wx/oSt7ugFhch9LdOsb5keSess/BHLHVYVtve+oKQCeS9P2xkK1l3SL/rvLbHVIFPdGEdHmCMmpbCXTqgk2TAm3EB5Z5tkvYG/SHzgysHcQao+PUQVr6KH/TNAcvoOaexxosCXnoJ4rDoZNGUDJ8I15zOaT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bayH101FRoPxqRCyn+HCk6b+fEvMcK3cax4KaAUcxA=;
 b=V80fYTHxfQ7f+CVVGhDFb3hULJXkmerh133flDVaOH/nUHp6m5oxoCBClk3OtG6Q8Ig1wN8KCwKBH+qSA8PPm4oeJMFJKlzOA6/NUEcPeusqdpDO7+cqKBj4tdY4ITU5HjWTMVCgD+/kF/MdZCBkVsiv+0/nGg/bMz54RihhsAg0rQCcBaI+O4ObAaZBrANvQRh8Iqd8+PF6/tjdnqV4dcKPRTOcS3zDkQzy4idLAHd1xtAWRZNhxqiC+kQ9LN5zPvf1SI5OhErh0lPPah+Vgitwbky3killJpl9y1JXIdZHVm+3mM9Dvv7LS12Ecopn1Ic+fjvnwFQzyAYbYGA/ug==
Received: from SAWPR12MB999118.namprd12.prod.outlook.com
 (2603:10b6:806:4e2::13) by IA1PR12MB7589.namprd12.prod.outlook.com
 (2603:10b6:208:42b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 09:55:19 +0000
Received: from SAWPR12MB999118.namprd12.prod.outlook.com
 ([fe80::29d3:5625:9339:d4ba]) by SAWPR12MB999118.namprd12.prod.outlook.com
 ([fe80::29d3:5625:9339:d4ba%4]) with mapi id 15.20.9913.009; Tue, 26 May 2026
 09:55:19 +0000
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
Thread-Index: AQHc7HNZ+U2PWH4GIEyVP7J8a4HKY7YfavUAgACmhmQ=
Date: Tue, 26 May 2026 09:55:19 +0000
Message-ID:
 <SAWPR12MB99911841F75A9492A6FA875421AC0B2@SAWPR12MB999118.namprd12.prod.outlook.com>
References: <20260525182028.2148267-1-henryl@nvidia.com>
 <20260526015514.466b72d4.michal.pecio@gmail.com>
In-Reply-To: <20260526015514.466b72d4.michal.pecio@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SAWPR12MB999118:EE_|IA1PR12MB7589:EE_
x-ms-office365-filtering-correlation-id: 0a93001e-ccf1-4416-bb2a-08debb0ce532
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|22082099003|11063799006|18002099003|56012099003|4143699003;
x-microsoft-antispam-message-info:
 AlNzvWUsHIJEBQXnkLJgE65vcUKmXiLtkXhIZobk6fKvOk04ITwsYTXXPjwQSVx2WJH7M5AnPauhe/NNvLB6Whc/TJ/2zzGcJhO9KBt+8BdYtyqYqF80ZKfSL3DpkVHUHEo6R6+tijH5g9XUjg9cvqQDIJZIgNZDGtsCgs9Ok9iKfJAgizN0aQSfXVTyc83oZ62pj962MFqQD1mh+5wa7Z8VbVjcHAcH74YRU+Yt4dxqkpMdfT37Dj3Vq9McQptXt92/3SsO9EYeqswD5sWTahl2W6wFV6gZUeiWgggoprS8q21GA3qfaiifyxZPhm/CfKJQDRNSd8Tg1CNM+lcW4SuJPgAG9HgyyeQ6b22ZK0LAJmwFWyMBPXMwBe4/fJBpw1RiZhoIyZZlQRW5E8ZMZ8g10sgsJemrYMrhyz+s2LUiyc5aucSqf/F1mBn0Q6Cku4RSoKpynkAzJsCQuGYGjpUfVvPh9QC+3FWSWL802lrKol9XrooW9KyzWcei18gez1ELB4SGP1CHEK5N4//QVqm/1TovW3y6tPwYC3wdWM/r5sSoT6scU3WA9ucypceLyFVJHd6Z49UBjBunuo2WKtHrHnXJC07VW4oLdhl/ctoLGyNWBfPr8QuFEtbeMY6e4dJiv5+v4Eg1Pd5a+hFA826lg6M7MdgR9ageF721ey9NOK6N4lZ3ze+fwBoI2fXB6aI+qN+Q/GwqSlyHkSs6mtFIzy5FAIHbyNiWpq99vAQmyIYgssDONr8AeajwBPBG
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SAWPR12MB999118.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(22082099003)(11063799006)(18002099003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?L0dOEgxb+WI33c3tHAMv5xdV9yXoI66e2Ng3d/QLbyi+gSSWBM4G9NzLOD?=
 =?iso-8859-1?Q?hWmID8QtK93zpHO0AvteVCXMWJjnN2ep3rQwxGHNz5on5i/jjpQwGqmEXe?=
 =?iso-8859-1?Q?EkmrOqrpR4KICcWh4JnzlmMnVTkXjLrRba2AYyadn3DRvIm8vuuizQl3KC?=
 =?iso-8859-1?Q?luiw+8gVeCcEMaU2G9Q6fL4G88hBnvgF+QHFYZP5MsOYj0T/k9ignpreI2?=
 =?iso-8859-1?Q?TLZU+GxercSRvyhrTYXepisngJxqiUJbb90tA8vZsTZbtUW54XGMxks9Xp?=
 =?iso-8859-1?Q?K102JLaHXo8GBFB01uQLnPoleheQfbv3XjpG3AWl2nLi5cweSXZjMf3RX8?=
 =?iso-8859-1?Q?uvp9KsWsV6qVzsQpMu/0jlTnrb/aBWHien8DL9xFP1I7dHqcFEY6mLLhTB?=
 =?iso-8859-1?Q?kmxPP2R5/JH6yTQfW4cnrYCPxF70f5bc8fqpoF0aao0r5wkLmyx+qwOQon?=
 =?iso-8859-1?Q?yWAz1Gzq0oMBxONrK4dG50AiKzzr2QCm3poDdOf3QOoMLAP67mQtn0Ag/v?=
 =?iso-8859-1?Q?xmEdhWYjlCjIrVa1ycFzZCHyTcs4PyQ/jwSJL3rKkK3EqdTrMhQoY1aAVb?=
 =?iso-8859-1?Q?xDP+3IvwjrWr7Ds3hD0CC+iEu7fG3213Rzs6nDv1yq8Z4XGjG6ikV0HeJP?=
 =?iso-8859-1?Q?59ntfJfKCPV5dTNV2tSv0Vg7o0ON+OQtswh98J0w1HIGknctmN8Iv4txuv?=
 =?iso-8859-1?Q?SGgzoarTz/eIpgIqQkpUGsO9Lq/Y5VVIpLtJdSuS0FDRj9lmt4sNOx5MUg?=
 =?iso-8859-1?Q?8CMdlqRN7k1zNl9apwNZ8emeDK1kWGn3Lv+fTygzLciiuGx9sUlacLB+6f?=
 =?iso-8859-1?Q?U74nz3X5jivL4C5UIbjh6OfK+CLi826m8m3+zyxmPpEdbhLM5fRp9rhRNY?=
 =?iso-8859-1?Q?qCx90LgNLokvtTNiLq2IVwj1GWSDoUsmCpoWzzMX9jyGWoQV23u5S/xLP7?=
 =?iso-8859-1?Q?RXxppwPxi8aq2wta88bOPaI52B2yoW5kJPdAkHJVrZAzLlYknIYTc+Y5Tq?=
 =?iso-8859-1?Q?QXWtWkGILrXAgwxX7u9R9+5Ip23fw4I5RV8N5Ol89FvYGwq6yFKFMVM+7c?=
 =?iso-8859-1?Q?JC3AIrERLqUPlvz38H8gECJH19i+kGpGXKnQau8ShbRnApBxjQHcvSli9x?=
 =?iso-8859-1?Q?6P2zVn1EVEipLQ3C2C4KsMdfMHZCthfhjgv6wofFOxgmZuNR0IKcxi6iLa?=
 =?iso-8859-1?Q?oeGsqaxNcSkAf86Ha8KdCSmQCVvJJL8ns1lxaBbOvKSBfdL486MfBp9oDj?=
 =?iso-8859-1?Q?5c/wtH+wuMlW8/bWqnfMUFfpV/lfWqR3BRQRBAqFSRG/WDGJs6zY2KXGIA?=
 =?iso-8859-1?Q?bqxzowPLoYeAQ9MT5Kb6AEa2W5hHfVlpshhYd7KfRuS6TIRqW7+wzdrbBQ?=
 =?iso-8859-1?Q?n/iU4haoczUztG6+UBVMvW0RYCJ/tqWAa/qPmYq3QdBOfUv8Uh7RIiFZBD?=
 =?iso-8859-1?Q?OMIHVjb3TP2KtmsatM+Dp53FhzC9vJhDmQPExNKLmoaCZ/W7J76RC+rBr8?=
 =?iso-8859-1?Q?VAeWVa6b4KunPT87zNPNbrzzcfekO92mpuA39FmJbgHulnLJp0TfcKbhkL?=
 =?iso-8859-1?Q?0NBS9tO5np742kdS2zVcl9kGJvO5njzyc8svLgntaU6ewdR69HURNW/R/t?=
 =?iso-8859-1?Q?kN9u3Y8sUVGK+dp7auQlQtEGl4GZPVCpJqBQuKJ0KnpAALhg0T3sjt6BOx?=
 =?iso-8859-1?Q?JHRbxJIHYgJAXp+GpGjOSX4qkNYQhTegq3HVGBuRnHxn7lVC2plVlzRpib?=
 =?iso-8859-1?Q?JLEScfo2wDynik6kp3TCgBg+ugQTsnSPLv+lQcPbaYgurm?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a93001e-ccf1-4416-bb2a-08debb0ce532
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 09:55:19.1623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NUog6pzEAzbo8UAQCl/ViFXOx9XyDX4wWsom7hgJxC6O4DTVZsVKGEEIfQDCVz4yTCRz237K6H8bRacjgEUM+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7589
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62773-lists,linux-media=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[henryl@nvidia.com,linux-media@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 9C9D75D3C6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,=0A=
=0A=
> Please check if this works for you, it's included in 7.1 RCs and some=0A=
> latest stable kernels. If not, you might be affected by other bugs.=0A=
=0A=
I tested 25e531b422dc ("usb: xhci: Make usb_host_endpoint.hcpriv=0A=
survive endpoint_disable()") on the affected setup, and it fixes the=0A=
issue.=0A=
=0A=
With that change applied, repeated stop/start cycles complete=0A=
successfully, and I no longer see the uvcvideo -71 transfer errors.=0A=
=0A=
So I think the uvcvideo workaround in this RFC is not needed. The issue=0A=
is covered by the xHCI fix.=0A=
=0A=
Thanks,=0A=
Henry=

