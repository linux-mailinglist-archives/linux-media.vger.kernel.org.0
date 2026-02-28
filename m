Return-Path: <linux-media+bounces-53812-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oiIULCGmomkA4wQAu9opvQ
	(envelope-from <linux-media+bounces-53812-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:24:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AD01C158E
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B05930792C1
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE583D7D85;
	Sat, 28 Feb 2026 08:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="MefoKNZc"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020120.outbound.protection.outlook.com [52.101.227.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDE51448D5;
	Sat, 28 Feb 2026 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267028; cv=fail; b=kmsrfNuSAAL8XxUBwQpwnR/kc7FMWT4s3AD+SEVzZF0HmlsH4Gb/0gFhrmXfSX18gNf5U2/0/33+0LKbXu3UVfw1nBEMdCEBHM0nde8b55/v39tdn0ZKXYtvGynK64a+XAuvFVWTZA50mp0VlwCpNwBlEyCO+xKP65LYIq+cNZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267028; c=relaxed/simple;
	bh=8HmH1/V3b04k3jl1LuBTPHwLM8gpbbRIKtws2JZKHjc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KyKGnKFViS/6I5V5MjTLS77WA+lac1tZTzlBwR4cZDkg51BpZ3PBe5k1L5+mY5iHypctIUPoFmsq38oXD1Ui2tlTZmu8PJeVAN+KwDbVAd9i69RTMx+sE62TLmt7iE5g/1dHysZKaFlsmHQfAhUmMBim9niWRVw1H1NhImCb33A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=MefoKNZc; arc=fail smtp.client-ip=52.101.227.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JefNTXgB0KVrq7AMSg2nM7mjzZbpxrnwFMmzhHa8dYC71LBTinQYbtQpKcIaBkfo/WvpVv0h9K+fUuXUQDo/7eRY/Gf+tgpy5xUx+Gazk/q99yHA07cAJD5ah6/z4QAiOcICvnmV4nPkJRd3R1wam3w20dwML+6v1rV8mNhgmAgZq99W5c93Kew/ar2jJK9xTL/eKEieE1E8FVRD7AwgtRcThwnp8pccB9M+ifsW/a2rRuXyUzgNkLn/wmtrGOI1FOUjdeYr2miAUl3tFFd2RDHcP0nbIcx1bN3ZyiVx08GwR9ltOf2OmtviaUb+ubkUwkYxx3wMCuF6waC60dQU5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HmH1/V3b04k3jl1LuBTPHwLM8gpbbRIKtws2JZKHjc=;
 b=aptyLYns6PwpHVs8d1sp/V1/YLrTVkz1mADLpr2JetWQMJvANtVtAjVQtC5MM7WWKFaSU2jp8MFPvTRmz+aOKOikVESHRAz5+KU+ilw7z3azBlQHVXR8zr2QhXQtDjiXU5WcVRP5CFEz3Z3M7VOn6zPbE+/Vtknd0HB44YVVIIXEPqh1Qh37gAyKBUXRd+5Cp8fHk0KU+I9Yho7D932CWEIFIcVeKzMfVuIEcWeoE1r1Nz8118fuxakoeTgmAQrZnS/FRRMrn0bHdgOVL7f6ES/34t6vZbpB7fzs35iunwMqb4JAveaDbYvQJs09S+TzofBK497xHykMfm2GjMKTrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HmH1/V3b04k3jl1LuBTPHwLM8gpbbRIKtws2JZKHjc=;
 b=MefoKNZcMjOZJOtcwdUtFwi+Nbc1l3Fm9+r9Dei/Nv2AImW8x4N9ueLmrGFygJbWR7UsRACWnf7D4c8Nvt7+w2ZGaDFI2mx3mTFNA9ngVW1cs+Pni8zccN827XA5THfoIKsaJHtxztS4V/QetkrLcUFBeZ9pV7n+3RxvMic1IqVwqv3tKQmOhulmlvyurpRfyt28HOashij5BZOUP+A1MtjQ37h/DmDerQuLzZxTT9RFW0DE4Qw5FKaBurLFdRLdMGJlimZvw0gGiqcl/6PX49VwiKOKIxmRmN7j4FoaPBs5KuaDwLf+UdH3Y1Jjdh7dej6RJXvrAiZkIl8isu2kiQ==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB1253.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:196::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.11; Sat, 28 Feb
 2026 08:23:43 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.011; Sat, 28 Feb 2026
 08:23:43 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>,
	"jai.luthra@ideasonboard.com" <jai.luthra@ideasonboard.com>,
	"hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>,
	"prabhakar.mahadev-lad.rj@bp.renesas.com"
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "jacopo@jmondi.org" <jacopo@jmondi.org>,
	"dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: ov5647: Fix runtime PM refcount leak in
 s_ctrl
Thread-Topic: [PATCH] media: i2c: ov5647: Fix runtime PM refcount leak in
 s_ctrl
Thread-Index: AQHcpjTFatdzTgfuqkuIWNdjOtR/JLWXx228
Date: Sat, 28 Feb 2026 08:23:43 +0000
Message-ID:
 <PN3P287MB182932AB2E6AC6AB635AED2B8B70A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260225085621.1756643-1-xiaolei.wang@windriver.com>
In-Reply-To: <20260225085621.1756643-1-xiaolei.wang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB1253:EE_
x-ms-office365-filtering-correlation-id: fad5d1cc-525c-4583-e958-08de76a2af6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 /hn89o2L1helGg9W65bbAIX03RUpwqWSOxJBZQlkeXItizeReyAJRMSjUsLKRQLz+OOannLyRg9TToh837x8hO15Ej4YW06tQc5a01rGDdoEFBrCdm9q0+axJoEt1FVVfwAI4AvgRZmvp0LwHp+ZvYwuk8ax5XoJXxybvTqHz36vE8B3dXvC0LHUX9QxjlbuQF3v+RyqynAlnmWRMc4OeMWh80dLuZQ2gvij6pN1m4K+ECn04R6OK0/EdVLjwj3ICv4UcoSgMri7tjIZFKI1meHOfvgGSc0+Dak/o720hYrVefhQc7LrBL519Vhz4gTzW8gXpDqDKVwmfy+LCUVcuR0EgJDt+uhAvyjRjyyuEq+vYpKJD4Ilnkd/aZmhLe/9Bkxhe1bA+Gs6LSlq4V2JbLgzKpx913oF+7EgsgmP3Omz1aldhr4lhIQEvUpJroH/FiHPRtn1bfRj6GH0I9tl/mtluDZMAS5CXTpa9rVfQGjd4jxr6brSMcb3j/KJ2ZA02DBtsA2fVa2bLOBFGmWac+IM8DUFaXLZ9oUzUxPLSY2kbKR/hzmW3rZFoshgkLVYUAn/VvrKrmwpXP8bRPlopTsR502QIHviwt945p/IJ/RBzWusc05vlgityyWS6YOd1NOfox3xFdb0HHKx+/TYUKiDkxE6sedIn5ykPQIR93PQM4hvykHee2iO1HhxnSLJeAJOIlyC4auN3x1YKA1gfQQIeJ7shUGqtdNYfW2kRFM+h0QkjvXVz8Jo2Ti5eEBYsrYxb1xdE0qzeLm+Wh+BCctIsIBUzTrNNEgrwLu4Ks4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?a44EEp0q4TnjDfl2P7aMb8S+QedZsOMKecCMhe0A91RKoOZ2WFJwNTUpWm?=
 =?iso-8859-1?Q?QfDpuv1X+YOmkFZSXkP4/3YLAQPYstzkCWG080Q4FMPkPpjibB9qMhazV7?=
 =?iso-8859-1?Q?tG1Ny07dGqH5cYALDNjcJsmhLD2yfrgLRDwigm17sBt6D6pVhG57rQw3E2?=
 =?iso-8859-1?Q?x5ZMQioaDnxxZcev6GlcPdpRzv68Z7PKaACJtYE6de8KHQnNTj5MPMu8HT?=
 =?iso-8859-1?Q?rzqrnS36Nh9EQBD9udb8aGXFjutpyNlFsbEipFXUijKyBQotGtUXsYKJax?=
 =?iso-8859-1?Q?wNEwoFr+gIHHcRPubnZscIk6XDPJ6U1olgKnWdH41pITPrPy1//t5FevG7?=
 =?iso-8859-1?Q?DMJGt+2fTdwb+WDUF/FJ38/2wlKwUqcC53RideDgZ60mYnNTZTR9SZDal5?=
 =?iso-8859-1?Q?+6i1GPf61gjKABp9VcqFBigknDApE3pVXj1W8L202i+uWIk8ci6dM8CGtM?=
 =?iso-8859-1?Q?jZmlsvlAG4hbWTQDK5Y7YXim5oUNxdGDFQx7OZyg8Z3iTX/srwsSL0g2lH?=
 =?iso-8859-1?Q?t9j3t77L7gUsZsTkUlBgHw8QA9MH31R6JpSPKRVudpXzrUm78qhdxBpwox?=
 =?iso-8859-1?Q?w2Cqv83tdU30raOvToUbn4Mf4jwU9laEmdDe98pBSJRp9JZifyHCFM7b5M?=
 =?iso-8859-1?Q?7PSwtUeZhHvCrUslapLaISeBh/WQi+jBgBGegbzehEftNv+g1+VFM4LtFw?=
 =?iso-8859-1?Q?ByHj+gS00oYOwy5r9gnbdIBWxQCHYQNyogZynvi3x+oyA/bV47lckbzPXP?=
 =?iso-8859-1?Q?TD85ohADn3qfCJj/7f3vQO9rW+L34uz9KCfCkFse0xKd46BMX2Px2horwl?=
 =?iso-8859-1?Q?0HU33ob+/CVyCsgK7KWLjTYIJX5pl9JSJVUmv0UOQIEaFnCdtSwhvbDMuZ?=
 =?iso-8859-1?Q?8xN/O3uEvAZtG1ADTtc78s/7W3TFT88bL7GcpE27554cfPAgR93NgMJfp5?=
 =?iso-8859-1?Q?n5AW0MLwAlDcHb4IslFS42+Dr9960IY14B6733/+Bbme+oc9gYB3KNRbCf?=
 =?iso-8859-1?Q?QRk87LxUKowRKN9GNNGz4FsrHiFPmN+HKFJp+clkEdZnTQ820su2W0YDp8?=
 =?iso-8859-1?Q?RFYmnHdDbRKj4adQkrwLjIdHZnF5sgamnJItpWRO1joCF/JnMnNwI2rUXN?=
 =?iso-8859-1?Q?gm8SCxTL54zqp0L4d6o2iObKI7veFsTw9FI+sGqDBfLWM8FEtrpSwKQH50?=
 =?iso-8859-1?Q?GfFI60KaN/9ELAN8yRO009Se4b2FpZYI/3KEXM4bpG0sj+Z1zdqFIUYGls?=
 =?iso-8859-1?Q?YHEQqDSaR1my8i72LLQpM0kHbzefkMtDgSDdTOx6JcOzi+BQgb0XtuD77v?=
 =?iso-8859-1?Q?K5CI6FXCmeeC9ZtaPUvGhRAj+ZZHV2g/9lDjNffhEFQisxLBd3i4xcLJAO?=
 =?iso-8859-1?Q?cPDuLUCwrio22Vbs8+IwSYFJl6XL80X4ONFKx6JJuPYhlCYGfsr5w/O4bj?=
 =?iso-8859-1?Q?o+N3qd6v8ikiur7e2UsPjnKxkbOdTVg5AX9p9S4Q/AxKGeBjLPNfDv57wk?=
 =?iso-8859-1?Q?qnDbY+czm4xYQ8occI2NnKlMcox0GsZSbJTofjRqlEkFgQBqyY4OH4Htm3?=
 =?iso-8859-1?Q?0FaYac5ybrXO2GbkYER/wFDCDIwwMBsaKDLZvNGiSuDup0ROp05z0Vn8OU?=
 =?iso-8859-1?Q?W5aVWiqyacXzMfRqT5P3jys8uoFv2k1cQ9YO8XQHC0Ie9WVuiXjf2myTh4?=
 =?iso-8859-1?Q?MWQKMeenCrBCpHTrk0ZLQSQGhzDrA5LZDm1d2LuY+ss3scuC4QsyKmcMFm?=
 =?iso-8859-1?Q?CmIKJRNvpJNC0zf1LldnmXIYVjNraMngd4GsGXUd1NhCz5YGGzWfxCwMwf?=
 =?iso-8859-1?Q?Z2o0KiNdlw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fad5d1cc-525c-4583-e958-08de76a2af6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2026 08:23:43.3181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2vh1daYpOOLnwOLNHCUDSJIHU1DjcaHLbvbglfqASMoiApBttH6RgLEEgFbHFLH1ciZwEiCthsjKgP9bQgzgEW9KqLV8bNgS3B2zje3tCgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1253
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53812-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,xs4all.nl,oss.qualcomm.com,ideasonboard.com,kernel.org,bp.renesas.com,jmondi.org,raspberrypi.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:email,siliconsignals.io:email,siliconsignals.io:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 03AD01C158E
X-Rspamd-Action: no action

Hi Xiaolei,=0A=
=0A=
> Three control cases (AUTOGAIN, EXPOSURE_AUTO, ANALOGUE_GAIN) directly=0A=
> return without calling pm_runtime_put(), causing runtime PM reference=0A=
> count leaks.=0A=
>=0A=
> Change these cases from 'return' to 'ret =3D ... break' pattern to ensure=
=0A=
> pm_runtime_put() is always called before function exit.=0A=
>=0A=
> Fixes: 4f66f36388d5 ("media: i2c: ov5647: Convert to CCI register access =
helpers")=0A=
> Cc: stable@vger.kernel.org=0A=
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>=0A=
=0A=
In my last review, I missed this.=0A=
=0A=
Thank you for addressing it.=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
=0A=
> ---=0A=
> =A0drivers/media/i2c/ov5647.c | 12 ++++++------=0A=
> =A01 file changed, 6 insertions(+), 6 deletions(-)=0A=
>=0A=
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c=0A=
> index 6a46ef7233ac..db9bd2892140 100644=0A=
> --- a/drivers/media/i2c/ov5647.c=0A=
> +++ b/drivers/media/i2c/ov5647.c=0A=
> @@ -967,21 +967,21 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;=0A=
> =A0 =A0 =A0 =A0 case V4L2_CID_AUTOGAIN:=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Non-zero turns on AGC by clearing bit =
1.*/=0A=
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return cci_update_bits(sensor->regmap, OV56=
47_REG_AEC_AGC, BIT(1),=0A=
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0ctrl->val ? 0 : BIT(1), NULL);=0A=
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D cci_update_bits(sensor->regmap, OV5=
647_REG_AEC_AGC, BIT(1),=0A=
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 ctrl->val ? 0 : BIT(1), NULL);=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;=0A=
> =A0 =A0 =A0 =A0 case V4L2_CID_EXPOSURE_AUTO:=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Everything except V4L2_EXPOSURE_MANU=
AL turns on AEC by=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* clearing bit 0.=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/=0A=
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return cci_update_bits(sensor->regmap, OV56=
47_REG_AEC_AGC, BIT(0),=0A=
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0ctrl->val =3D=3D V4L2_EXPOSURE_MANUAL ? BIT(0) : 0, NULL);=0A=
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D cci_update_bits(sensor->regmap, OV5=
647_REG_AEC_AGC, BIT(0),=0A=
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 ctrl->val =3D=3D V4L2_EXPOSURE_MANUAL ? BIT(0) : 0, NULL);=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;=0A=
> =A0 =A0 =A0 =A0 case V4L2_CID_ANALOGUE_GAIN:=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 10 bits of gain, 2 in the high registe=
r. */=0A=
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return cci_write(sensor->regmap, OV5647_REG=
_GAIN,=0A=
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ctrl->va=
l & 0x3ff, NULL);=0A=
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D cci_write(sensor->regmap, OV5647_RE=
G_GAIN,=0A=
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctrl->val &=
 0x3ff, NULL);=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;=0A=
> =A0 =A0 =A0 =A0 case V4L2_CID_EXPOSURE:=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*=0A=
> --=0A=
> 2.43.0=0A=

