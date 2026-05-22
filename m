Return-Path: <linux-media+bounces-62572-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNjdBX8ZEGpbTgYAu9opvQ
	(envelope-from <linux-media+bounces-62572-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:53:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5015B0C31
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21BE73042999
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 08:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA2A3ABD91;
	Fri, 22 May 2026 08:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="X+nPTx8Q"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021141.outbound.protection.outlook.com [40.107.51.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469943AD531;
	Fri, 22 May 2026 08:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779439934; cv=fail; b=IHxJH18UW5m+yPzl5l0UscGtKlY3Yk747uY6hhi2VPK/mfl2d/g8xh2EQknjnbx682cHm8hmSE14OtObhXL0JS1oNOkfrQmaz+fD1325TvtlzaclV/dn1tAz6dFQRCkhOFBovt9kAWI7m7MUSVZbFmSeKrgBCo1WMw2ziCoz+UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779439934; c=relaxed/simple;
	bh=6OnaAoskev+t8tN3WOmRKNukLmVfyqvj0wG56GPZ9ks=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ge1na66BmbJNJv1Tfp4aL1CwSUyCROo5zqiVDM852ZOaziQjs87l2slZa/NCCLOOYKogWgFuoOJ18/9mBpyX1QqDvL74VdIFezrOz48PuaOvDrw7smek5G/3gc0+VfSd5zXsRiBmgvgM822qp6ZT5EnbxtlbqdHimVOnmpL1FiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=X+nPTx8Q; arc=fail smtp.client-ip=40.107.51.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOfWfW1ybMD4vhIUmpXtDb69AFj4gWB5t5OT9+eAAhs7ZVZAnuc8XPkZyqYqpp9d3wQwtXMNYmYwL7LSnlbpnowNJzQw3D1IZ50AAwzeJ4MYI5gf1baI4HqfZkIQGpTJUp6YqL1G1V2dbrWfHZpkg5co0O+XJloaF+85BcFibUdlFrdRcUyMwEcRaLoyU+PxZWHOORwfL1aXdFmlm914cKiAybQAjbJTxyzAsDe+uO05OWBr7vC3+b8LvwhxjmF/bPGwcoItEzG5DLC8nAyNmMHmhe0graro0u0VTUyH7NGYrzYp6TURE8QUrpLSoGuNA58weHHxO4mPrpdE/7yY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyNGkKI+87/WPRaYhFUh04KARZ1HsauKgIdMkrXBgTk=;
 b=ZM8Gd8Wzo5/NOjMpPZWpYoC4Hz5MyEPolGOeq6HSwHXoAszf0SX4GJj4/hMq4u2Y47vHGxPL1Lwo6KAhfRNJ+KDZiq2+zdgI6MKDfvJLV/dcJUc5zH0SHALWuaHsjxPIR/aGQ4zxNmF+TFuUDbzCV9t3L/wLPVyV6yZhZ4h9cPoU0XaPL10C2CkxTtBsqp2HYsTPNoKhpsS+Sp+uJORYVaTfIG5WbgQiI+MclosGNt5mR6YBsOAD/LCXFAKAkg/t5kMSTRrw3JLPxyWKHqSYVQGwUhEbsFeRV1UO40TkQnYCX/qUv5gKGAlEwz2xFU3l5UYvuU0Zo/AAZYMQsbUh+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyNGkKI+87/WPRaYhFUh04KARZ1HsauKgIdMkrXBgTk=;
 b=X+nPTx8QHw3+kpYOjAQ2P79DMyeQxApEtRwk17W1+S2gbD6XpFh+t7YaIebjYZwLe+ZtD7qNM8sCvbAT0xzX6l55Tj2U+Has8vHBsmhGrsCGiXGQ3cfRbGgf8l+yPca4/9D57BaGT39gWASWQolBNvtcHfeUS/p5l1BgoXNrxXsdxBYOyHTYJb/boDi/tXOMUVsnW+5lE6ro2EdV5yrvicoixPSl0ssmeB9ZirWU1GRdNZCEtzIG48Y9kKRdgvcBJ9w0I4sqmN5AFr9VD+81EHKk+JxkIQnFhQfpX/h4Zf7m7MpC2lcUPn+lVXTBLzbCtaYt5CqBt7hF7oD20X60gQ==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB1868.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 08:51:53 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 08:51:53 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Hans de
 Goede <johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Xiaolei Wang
	<xiaolei.wang@windriver.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Walter Werner Schneider
	<contact@schnwalter.eu>, Kate Hsuan <hpa@redhat.com>, Svyatoslav Ryhel
	<clamor95@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/3] media: i2c: add imx576 image sensor driver
Thread-Topic: [PATCH 2/3] media: i2c: add imx576 image sensor driver
Thread-Index: AQHc6FC7ZKRDgfQW9kmWlDHUKaCk1rYZrZAe
Date: Fri, 22 May 2026 08:51:53 +0000
Message-ID:
 <PN3P287MB1829794C9A45FA2E783D47738B0F2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
 <20260520115641.11729-3-himanshu.bhavani@siliconsignals.io>
In-Reply-To: <20260520115641.11729-3-himanshu.bhavani@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB1868:EE_
x-ms-office365-filtering-correlation-id: 67f89a57-0259-4baa-4146-08deb7df5f0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|56012099003|22082099003|18002099003|4143699003|6133799003;
x-microsoft-antispam-message-info:
 CxKSEeSzM37QaEEzM/Hjo/rl5JroLSfECzc5Uy/cogFOmvhsYjNmMlrymgEBDI92eTmzCWo1KPesghYNZRO7ZPeyR+6xat9hvH1qSAigIITegCsFSK6E6KrPOgkvc2BaygN9ohEZjRqEssVbdeVvBkSe+RRrrsiSMXcpOk8g528iTyFE4PMD7K9pB5UK+i20FugGQ9kHkW9gQtl0s3ghXskb/6lFHPk1Qdb7DLiO8qxyBEEGeF/zXAIapqANP9hU6Ji1y6wCp5c/8rSRXEauA9IinS+n1xOihr0efuEmis+2qLdUKvM0MgD+52wqlsaYiNGgC0wWbT2ON3B0lC8qo4aYT4uJzTpi+aLXlDQ1MIyhYMXCm/Q7+fLLXt+oCNDm3REvcFNADrMn0dXnD0/27krDXClJ5DXGKmYw9LzahewZTxOnygJpZ6krBPIJM/Fbq3aOE82N5RZ2vcqmjTvwg7fecY1UTHZBhX/c0Kp+t/8RDkhHKxBwohjonqupw597urZfkrZp3HrU2+KrjMoatwFjnHi5GapBlAtfbQ/7e5jerb9B2x+OLH+YI7kJOr3mAr9niWDSbM+Ec+9himgIgIVPbJUS9QS+IjgY8mPmIcLR30wdeT4l2rqp9Y2x1CSVqeAMPzw4pph7MLvDGrTfcY/ozTsmhiyFMHyJfggPUGL8VHbHG+fcZixA2CNo8GV92maWU79cWWmS91IAcSgCroXqD34qrG2bQMVU5kBzAjkfKHOxrihZZiFLcATDNsnG
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(56012099003)(22082099003)(18002099003)(4143699003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?oU91KIpypgdvWs4GTezUq1LBFP5S3WeZYLaLnh+2+VqXSOjtJv+bWY+sZq?=
 =?iso-8859-1?Q?bpc+7BQOXvxCXag4C3BLc0RazAyUeyuMyWSIFAXlggI1G5O0ebuSYYqQTZ?=
 =?iso-8859-1?Q?Or0NlVbeCI8c+Dnpjc+3CkUo6JirJvl3xJXUWXknbsSUfSf6aVujrvEw4i?=
 =?iso-8859-1?Q?6usdmfBqc5EYccKKJATCb0/DAqH6Gxh4u4z4RTYhQ+RswOo2z4IH/B5Rlw?=
 =?iso-8859-1?Q?edYwVBy374Kv9TWom+sIEStc3OfsM79W8H4L1clT3Zh3BJ3W872b/GFmoh?=
 =?iso-8859-1?Q?3//xI/WaXM/vzt8eu+TqftW6WCV2Uk3NVjNYQHy/0RFCa4OAAMSHAwt7Un?=
 =?iso-8859-1?Q?O+6ZR9pjF3HZh+S6DKQihoXHvyqnNk9eJYUHW/a8/AgOQuLrP4FWy837r8?=
 =?iso-8859-1?Q?4EFwYICx1+uucmM67OWwGzHySOhhSM/9HYv5PQn+dVoA6CxQna7S2t7O+7?=
 =?iso-8859-1?Q?8f7eujQVKuZNhC0NbycY0Fwx4vTSArWOPtCDg0XTobCIwdhArJwAuLgdQJ?=
 =?iso-8859-1?Q?WzqViTu+JnVpsuMsUyPAE49wdO83+Y4O0xR2EcCtQ656tmdZu0OweijkpJ?=
 =?iso-8859-1?Q?kFzpLsfrfnpqx5+QekoL5hxpq8A5Kky5+VtiWc7h65oOBlNDjHYTM4GaUh?=
 =?iso-8859-1?Q?qioRlPx8mgY+RBO/WiFJjKtesNMKQhKjCt26S9T5muAVlpNu7AiMMTcLbh?=
 =?iso-8859-1?Q?qg2OUTirXL79JRmVWPSODLXOkmv8IsGqsWf3EZ5tnGajKb76K+O0Z7vCGf?=
 =?iso-8859-1?Q?3Aw3SXL/72Q0feAi60cccd6m45B3JE9bdm+nBRn4zYMYxqnEg9+7EkH2+n?=
 =?iso-8859-1?Q?cEo1KGhWx+saGEjKN0joRBnrjUe/MKW2oI3VNQO6iTqxr9fjPY41uAkWD3?=
 =?iso-8859-1?Q?IHr2s/OZ0INr5I3y3R9E12mdhSiC3N3Kz+IljNCkrRQUC+0FmelYPELiqk?=
 =?iso-8859-1?Q?SXaU/zDaDVAGnDdk+94uAPwvm3HN6oLI1we5WjW6d4jrvKE3mQ7nVlYASh?=
 =?iso-8859-1?Q?cxDMMdorgakpzpyxSD5ee/aJB1m/KS6g4ogFLToCXDNki/e68XOZL7Bqxe?=
 =?iso-8859-1?Q?pwd/8xogI84JbTMkT8wrF0FclzIw8JCW363KRtSSejttYQg0sPBE866q2w?=
 =?iso-8859-1?Q?BLQOVQIbEwNUe+9YyKlX0wqBtmnHmawxEqFB3yeyfJO/qbKMTxJTMcqHFI?=
 =?iso-8859-1?Q?W+Ms0Bi8/RqAJ5DjvRBnFbGg+ly9CnOXz4muo7nWBT68IznipbjNefV9ZI?=
 =?iso-8859-1?Q?yD1Y5H+jLZBY4EJ2X3T16rCwKgG9bM6WQSuZmrIcrjXc7KM0xTu8HmTLWZ?=
 =?iso-8859-1?Q?L6tsO6zq70M+0B3LIkdQmhFdvkkvEXCxtTIZi9NJkoryaaoUYSm8xDVdqq?=
 =?iso-8859-1?Q?jYos9R4RWelaGXw4xi/hnkuMbiUIKgZEfBBKeCdcWm/kNF8aRyCV/rmTr3?=
 =?iso-8859-1?Q?QXeiRqqMVOtrpvs9BuJ3fDG5NPDMXN0Cc0SeOYnXFZwMUXLL7SBuqctCej?=
 =?iso-8859-1?Q?mBvCZpszADEEMoQFa0BH2GJ+bOvZVA2AjA7FrEYtISt3FOzlhwVue9SUT2?=
 =?iso-8859-1?Q?pQ+3RHvrTy3nyqFWIDBbLJUjngOmyf2cTbqe1zTMhErLC+djD61izjXdTr?=
 =?iso-8859-1?Q?1ehroWjuZDS/I1LvKBUn+I3IKEowXr5gSYdvdO3ZRUsK16fATry80YnSHd?=
 =?iso-8859-1?Q?FpxRY/1sctcVch85Qk0K19NZZASPnjOVYufYMeOaV9//S8t46Ng/xgypzP?=
 =?iso-8859-1?Q?Dviav7gqb57lNzTYZ+pBHAZuhluJwLxHLAJaB7exoD4xLkuZDh+D0m/wEx?=
 =?iso-8859-1?Q?FUH8n8fXFg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f89a57-0259-4baa-4146-08deb7df5f0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 08:51:53.3225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1CbcnFabNcu74YvNXsEo8r/x0oRllC5JazN4L/U3Rt4Y3W98t1VBYRito0D+QS3UdayQvNhx4GS2/5MWtwAGf1fOBBkbioIh0RVMkWBXHiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1868
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62572-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,windriver.com,ideasonboard.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid,siliconsignals.io:email,siliconsignals.io:dkim]
X-Rspamd-Queue-Id: 8C5015B0C31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Himanshu,=0A=
=0A=
I noticed a few issues. Please check.=0A=
=0A=
> Add a v4l2 subdevice driver for the Sony imx576 sensor.=0A=
>=0A=
> The Sony IMX576 image sensor with an active=0A=
> array size of 5760 x 4312=0A=
>=0A=
> The following features are supported:=0A=
> - Manual exposure an gain control support=0A=
> - vblank/hblank control support=0A=
> - Supported resolution: 2880 x 2156 30fps (SRGGB10)=0A=
>=0A=
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
> ---=0A=
>  MAINTAINERS                |    1 +=0A=
>  drivers/media/i2c/Kconfig  |   10 +=0A=
>  drivers/media/i2c/Makefile |    1 +=0A=
>  drivers/media/i2c/imx576.c | 1029 ++++++++++++++++++++++++++++++++++++=
=0A=
>  4 files changed, 1041 insertions(+)=0A=
>  create mode 100644 drivers/media/i2c/imx576.c=0A=
=0A=
...=0A=
=0A=
> +static const struct imx576_mode supported_modes_10bit[] =3D {=0A=
> +       {=0A=
> +               .width =3D 2880,=0A=
> +               .height =3D 2156,=0A=
> +               .hts =3D 3165,=0A=
> +               .vts =3D 2172,=0A=
> +               .reg_list =3D {=0A=
> +                       .num_of_regs =3D ARRAY_SIZE(mode_2880x2156_regs),=
=0A=
> +                       .regs =3D mode_2880x2156_regs,=0A=
> +               },=0A=
> +       },=0A=
> +};=0A=
> +=0A=
> +static const s64 link_freq[] =3D {=0A=
=0A=
your control name is also link_freq, so could you please use a=0A=
more meaningful name here to avoid misunderstanding?=0A=
=0A=
> +       IMX576_LINK_FREQ_600MHZ,=0A=
> +};=0A=
> +=0A=
> +static const u32 imx576_mbus_codes[] =3D {=0A=
> +       MEDIA_BUS_FMT_SRGGB10_1X10,=0A=
> +};=0A=
> +=0A=
> +static inline struct imx576 *to_imx576(struct v4l2_subdev *sd)=0A=
> +{=0A=
> +       return container_of_const(sd, struct imx576, sd);=0A=
> +}=0A=
> +=0A=
> +static int imx576_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> +{=0A=
> +       struct imx576 *imx576 =3D container_of_const(ctrl->handler,=0A=
> +                                                  struct imx576, handler=
);=0A=
> +       struct v4l2_subdev_state *state;=0A=
> +       struct v4l2_mbus_framefmt *fmt;=0A=
> +       int ret =3D 0;=0A=
> +=0A=
> +       state =3D v4l2_subdev_get_locked_active_state(&imx576->sd);=0A=
> +       fmt =3D v4l2_subdev_state_get_format(state, 0);=0A=
> +=0A=
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> +               /* Honour the VBLANK limits when setting exposure */=0A=
> +               ret =3D __v4l2_ctrl_modify_range(imx576->exposure,=0A=
> +                                              IMX576_EXPOSURE_MIN,=0A=
> +                                              fmt->height + ctrl->val -=
=0A=
> +                                              IMX576_EXPOSURE_OFFSET,=0A=
> +                                              1, IMX576_EXPOSURE_DEFAULT=
);=0A=
=0A=
Please use IMX576_EXPOSURE_STEP instead of 1.=0A=
=0A=
> +               if (ret)=0A=
> +                       return ret;=0A=
> +       }=0A=
> +=0A=
> +       if (pm_runtime_get_if_active(imx576->dev) =3D=3D 0)=0A=
> +               return 0;=0A=
> +=0A=
> +       cci_write(imx576->regmap, IMX576_REG_HOLD, 1, &ret);=0A=
> +=0A=
> +       switch (ctrl->id) {=0A=
> +       case V4L2_CID_VBLANK: {=0A=
> +               u64 vmax =3D fmt->height + ctrl->val;=0A=
> +=0A=
> +               ret =3D cci_write(imx576->regmap, IMX576_REG_VTS, vmax, &=
ret);=0A=
=0A=
You are already passing &ret to cci_write() for error handling, so why are=
=0A=
you assigning the return value again using ret =3D ?=0A=
=0A=
Please avoid this redundant assignment here and in all other controls as we=
ll.=0A=
=0A=
> +               break;=0A=
> +       }=0A=
> +       case V4L2_CID_EXPOSURE:=0A=
> +               ret =3D cci_write(imx576->regmap, IMX576_REG_EXPOSURE, ct=
rl->val, &ret);=0A=
> +               break;=0A=
> +       case V4L2_CID_ANALOGUE_GAIN:=0A=
> +               ret =3D cci_write(imx576->regmap, IMX576_REG_ANALOG_GAIN,=
=0A=
> +                               ctrl->val, &ret);=0A=
> +               break;=0A=
> +       default:=0A=
> +               dev_err(imx576->dev, "Invalid control %d\n", ctrl->id);=
=0A=
> +               ret =3D -EINVAL;=0A=
> +               break;=0A=
> +       }=0A=
> +=0A=
> +       cci_write(imx576->regmap, IMX576_REG_HOLD, 0, &ret);=0A=
> +=0A=
> +       pm_runtime_put(imx576->dev);=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static int imx576_enable_streams(struct v4l2_subdev *sd,=0A=
> +                                struct v4l2_subdev_state *state,=0A=
> +                                u32 pad, u64 streams_mask)=0A=
> +{=0A=
> +       const struct imx576_reg_list *reg_list;=0A=
> +       struct imx576 *imx576 =3D to_imx576(sd);=0A=
> +       const struct v4l2_mbus_framefmt *fmt;=0A=
> +       const struct imx576_mode *mode;=0A=
> +       int ret;=0A=
> +=0A=
> +       fmt =3D v4l2_subdev_state_get_format(state, 0);=0A=
> +       mode =3D v4l2_find_nearest_size(supported_modes_10bit,=0A=
> +                                     ARRAY_SIZE(supported_modes_10bit), =
width,=0A=
> +                                     height, fmt->width, fmt->height);=
=0A=
> +=0A=
> +       ret =3D pm_runtime_resume_and_get(imx576->dev);=0A=
> +       if (ret < 0)=0A=
> +               return ret;=0A=
> +=0A=
> +       /* Write common registers */=0A=
> +       ret =3D cci_multi_reg_write(imx576->regmap, imx576_common_regs,=
=0A=
> +                                 ARRAY_SIZE(imx576_common_regs), NULL);=
=0A=
> +       if (ret) {=0A=
> +               dev_err(imx576->dev, "failed to write common registers\n"=
);=0A=
> +               goto err_rpm_put;=0A=
> +       }=0A=
> +=0A=
> +       /* Write sensor mode registers */=0A=
> +       reg_list =3D &mode->reg_list;=0A=
> +       ret =3D cci_multi_reg_write(imx576->regmap, reg_list->regs,=0A=
> +                                 reg_list->num_of_regs, NULL);=0A=
> +       if (ret) {=0A=
> +               dev_err(imx576->dev, "fail to write initial registers\n")=
;=0A=
> +               goto err_rpm_put;=0A=
> +       }=0A=
> +=0A=
> +       /* Apply customized user controls */=0A=
> +       ret =3D  __v4l2_ctrl_handler_setup(imx576->sd.ctrl_handler);=0A=
> +       if (ret) {=0A=
> +               dev_err(imx576->dev, "fail to setup handler\n");=0A=
> +               goto err_rpm_put;=0A=
> +       }=0A=
> +=0A=
> +       /* T7: delay before sending stream command */=0A=
> +       usleep_range(8000, 9000);=0A=
> +=0A=
> +       /* Start streaming */=0A=
> +       cci_write(imx576->regmap, IMX576_REG_MODE_SELECT, IMX576_MODE_STR=
EAMING, &ret);=0A=
> +       if (ret) {=0A=
> +               dev_err(imx576->dev, "fail to start streaming\n");=0A=
> +               goto err_rpm_put;=0A=
> +       }=0A=
=0A=
Please be consistent everywhere. Here, use ret =3D cci_write(...).=0A=
=0A=
> +=0A=
> +       return 0;=0A=
> +=0A=
> +err_rpm_put:=0A=
> +       pm_runtime_put(imx576->dev);=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
> +=0A=
> +static int imx576_disable_streams(struct v4l2_subdev *sd,=0A=
> +                                 struct v4l2_subdev_state *state,=0A=
> +                                 u32 pad, u64 streams_mask)=0A=
> +{=0A=
> +       struct imx576 *imx576 =3D to_imx576(sd);=0A=
> +       int ret;=0A=
> +=0A=
> +       ret =3D cci_write(imx576->regmap, IMX576_REG_MODE_SELECT,=0A=
> +                       IMX576_MODE_STANDBY, NULL);=0A=
> +       if (ret)=0A=
> +               dev_err(imx576->dev, "failed to set stream off\n");=0A=
> +=0A=
> +       pm_runtime_put(imx576->dev);=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
> +=0A=
> +static int imx576_init_state(struct v4l2_subdev *sd,=0A=
> +                            struct v4l2_subdev_state *sd_state)=0A=
> +{=0A=
> +       struct v4l2_subdev_format fmt =3D {=0A=
> +               .which =3D V4L2_SUBDEV_FORMAT_TRY,=0A=
> +               .pad =3D 0,=0A=
> +               .format =3D {=0A=
> +                       .code =3D imx576_mbus_codes[0],=0A=
> +                       .width =3D supported_modes_10bit[0].width,=0A=
> +                       .height =3D supported_modes_10bit[0].height,=0A=
> +               },=0A=
> +       };=0A=
> +=0A=
> +       imx576_set_pad_format(sd, sd_state, &fmt);=0A=
> +=0A=
> +       return 0;=0A=
=0A=
imx576_set_pad_format() can fail.=0A=
=0A=
return imx576_set_pad_format(sd, sd_state, &fmt);=0A=
=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static int imx576_init_controls(struct imx576 *imx576)=0A=
> +{=0A=
> +       const struct imx576_mode *mode =3D &supported_modes_10bit[0];=0A=
> +       struct v4l2_fwnode_device_properties props;=0A=
> +       u64 vblank_def, hblank_def, pixel_rate;=0A=
> +       struct v4l2_ctrl_handler *ctrl_hdlr;=0A=
> +       u32 lpfr;=0A=
> +       int ret;=0A=
> +=0A=
> +       ctrl_hdlr =3D &imx576->handler;=0A=
> +       v4l2_ctrl_handler_init(ctrl_hdlr, 8);=0A=
> +=0A=
> +       /* Initialize exposure and gain */=0A=
=0A=
Please remove this comment.=0A=
=0A=
> +       vblank_def =3D mode->vts - mode->height;=0A=
> +       lpfr =3D vblank_def + mode->height;=0A=
> +       imx576->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr,=0A=
> +                                            &imx576_ctrl_ops,=0A=
> +                                            V4L2_CID_EXPOSURE,=0A=
> +                                            IMX576_EXPOSURE_MIN,=0A=
> +                                            lpfr - IMX576_EXPOSURE_OFFSE=
T,=0A=
> +                                            IMX576_EXPOSURE_STEP,=0A=
> +                                            IMX576_EXPOSURE_DEFAULT);=0A=
> +=0A=
> +       imx576->gain =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx576_ctrl_ops,=
=0A=
> +                                        V4L2_CID_ANALOGUE_GAIN,=0A=
> +                                        IMX576_ANA_GAIN_MIN,=0A=
> +                                        IMX576_ANA_GAIN_MAX,=0A=
> +                                        IMX576_ANA_GAIN_STEP,=0A=
> +                                        IMX576_ANA_GAIN_DEFAULT);=0A=
> +=0A=
> +       imx576->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx576_ctrl_ops,=
=0A=
> +                                          V4L2_CID_VBLANK, vblank_def,=
=0A=
> +                                          IMX576_VBLANK_MAX, 1,=0A=
> +                                          vblank_def);=0A=
> +=0A=
> +       /* pixel_rate =3D link_frequency * 2 * nr_of_lanes / bits_per_sam=
ple */=0A=
> +       pixel_rate =3D div_u64(IMX576_LINK_FREQ_600MHZ * 2 * IMX576_NUM_D=
ATA_LANES, 10);=0A=
> +       v4l2_ctrl_new_std(ctrl_hdlr, &imx576_ctrl_ops, V4L2_CID_PIXEL_RAT=
E,=0A=
> +                         pixel_rate, pixel_rate, 1, pixel_rate);=0A=
> +=0A=
> +       imx576->link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx576_c=
trl_ops,=0A=
> +                                                  V4L2_CID_LINK_FREQ,=0A=
> +                                                  ARRAY_SIZE(link_freq) =
- 1,=0A=
> +                                                  imx576->link_freq_inde=
x,=0A=
=0A=
Something looks wrong here. You are not initializing link_freq_index anywhe=
re,=0A=
so why are you using imx576->link_freq_index as the default value?=0A=
=0A=
Please use 0 as the default value here and remove link_freq_index from the=
=0A=
imx576 structure.=0A=
=0A=
> +                                                  link_freq);=0A=
> +       if (imx576->link_freq)=0A=
> +               imx576->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;=
=0A=
> +=0A=
> +       hblank_def =3D mode->hts - mode->width;=0A=
> +       imx576->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr,=0A=
> +                                          &imx576_ctrl_ops,=0A=
> +                                          V4L2_CID_HBLANK,=0A=
> +                                          hblank_def,=0A=
> +                                          hblank_def,=0A=
> +                                          1, hblank_def);=0A=
> +       if (imx576->hblank)=0A=
> +               imx576->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;=0A=
> +=0A=
> +       ret =3D v4l2_fwnode_device_parse(imx576->dev, &props);=0A=
> +       if (ret)=0A=
> +               goto err_handler_free;=0A=
> +=0A=
> +       ret =3D v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx576_ctrl_o=
ps, &props);=0A=
> +       if (ret)=0A=
> +               goto err_handler_free;=0A=
> +=0A=
> +       imx576->sd.ctrl_handler =3D ctrl_hdlr;=0A=
> +=0A=
> +       return 0;=0A=
> +=0A=
> +err_handler_free:=0A=
> +       v4l2_ctrl_handler_free(ctrl_hdlr);=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
> +=0A=
> +static int imx576_probe(struct i2c_client *client)=0A=
> +{=0A=
> +       struct imx576 *imx576;=0A=
> +       unsigned int inclk_freq;=0A=
> +       int ret;=0A=
> +=0A=
> +       imx576 =3D devm_kzalloc(&client->dev, sizeof(*imx576), GFP_KERNEL=
);=0A=
> +       if (!imx576)=0A=
> +               return -ENOMEM;=0A=
> +=0A=
> +       imx576->dev =3D &client->dev;=0A=
> +=0A=
> +       /* Initialize subdev */=0A=
> +       v4l2_i2c_subdev_init(&imx576->sd, client, &imx576_subdev_ops);=0A=
> +       imx576->sd.internal_ops =3D &imx576_internal_ops;=0A=
> +=0A=
> +       imx576->regmap =3D devm_cci_regmap_init_i2c(client, 16);=0A=
> +       if (IS_ERR(imx576->regmap))=0A=
> +               return dev_err_probe(imx576->dev, PTR_ERR(imx576->regmap)=
,=0A=
> +                                    "failed to initialize CCI\n");=0A=
> +=0A=
> +       ret =3D imx576_parse_endpoint(imx576);=0A=
> +       if (ret)=0A=
> +               return dev_err_probe(imx576->dev, ret,=0A=
> +                                    "failed to parse endpoint configurat=
ion\n");=0A=
> +=0A=
> +       /* Get sensor input clock */=0A=
> +       imx576->inclk =3D devm_v4l2_sensor_clk_get(imx576->dev, NULL);=0A=
> +       if (IS_ERR(imx576->inclk))=0A=
> +               return dev_err_probe(imx576->dev, PTR_ERR(imx576->inclk),=
=0A=
> +                                    "failed to get inclk\n");=0A=
> +=0A=
> +       inclk_freq =3D clk_get_rate(imx576->inclk);=0A=
> +       if (inclk_freq !=3D IMX576_INCLK_RATE)=0A=
> +               return dev_err_probe(imx576->dev, -EINVAL,=0A=
> +                                    "inclk frequency not supported: %u H=
z\n",=0A=
> +                                    inclk_freq);=0A=
> +=0A=
> +       for (unsigned int i =3D 0; i < ARRAY_SIZE(imx576_supply_names); i=
++)=0A=
> +               imx576->supplies[i].supply =3D imx576_supply_names[i];=0A=
> +=0A=
> +       ret =3D devm_regulator_bulk_get(imx576->dev,=0A=
> +                                     ARRAY_SIZE(imx576_supply_names),=0A=
> +                                     imx576->supplies);=0A=
> +       if (ret)=0A=
> +               return dev_err_probe(imx576->dev, ret,=0A=
> +                                    "failed to get regulators\n");=0A=
> +=0A=
> +       imx576->reset_gpio =3D devm_gpiod_get_optional(imx576->dev, "rese=
t",=0A=
> +                                                    GPIOD_OUT_HIGH);=0A=
> +       if (IS_ERR(imx576->reset_gpio))=0A=
> +               return dev_err_probe(imx576->dev, PTR_ERR(imx576->reset_g=
pio),=0A=
> +                                    "failed to get reset GPIO\n");=0A=
> +=0A=
> +       ret =3D imx576_power_on(imx576->dev);=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
> +=0A=
> +       ret =3D imx576_detect(imx576);=0A=
> +       if (ret)=0A=
> +               goto error_power_off;=0A=
> +=0A=
> +       ret =3D imx576_init_controls(imx576);=0A=
> +       if (ret) {=0A=
> +               dev_err(imx576->dev, "failed to init controls: %d\n", ret=
);=0A=
=0A=
Use dev_err_probe.=0A=
=0A=
> +               goto error_power_off;=0A=
> +       }=0A=
> +=0A=
> +       /* Initialize subdev */=0A=
> +       imx576->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;=0A=
> +       imx576->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;=0A=
> +       imx576->pad.flags =3D MEDIA_PAD_FL_SOURCE;=0A=
> +=0A=
> +       ret =3D media_entity_pads_init(&imx576->sd.entity, 1, &imx576->pa=
d);=0A=
> +       if (ret) {=0A=
> +               dev_err(imx576->dev, "failed to init entity pads: %d\n", =
ret);=0A=
=0A=
Use dev_err_probe.=0A=
=0A=
> +               goto error_handler_free;=0A=
> +       }=0A=
> +=0A=
> +       imx576->sd.state_lock =3D imx576->handler.lock;=0A=
> +       ret =3D v4l2_subdev_init_finalize(&imx576->sd);=0A=
> +       if (ret < 0) {=0A=
> +               dev_err_probe(imx576->dev, ret, "subdev init error\n");=
=0A=
> +               goto error_media_entity;=0A=
> +       }=0A=
> +=0A=
> +       pm_runtime_set_active(imx576->dev);=0A=
> +       pm_runtime_enable(imx576->dev);=0A=
> +=0A=
> +       ret =3D v4l2_async_register_subdev_sensor(&imx576->sd);=0A=
> +       if (ret < 0) {=0A=
> +               dev_err_probe(imx576->dev, ret,=0A=
> +                             "failed to register imx576 sub-device\n");=
=0A=
> +               goto error_subdev_cleanup;=0A=
> +       }=0A=
> +=0A=
> +       pm_runtime_idle(imx576->dev);=0A=
> +=0A=
> +       return 0;=0A=
> +=0A=
> +error_subdev_cleanup:=0A=
> +       v4l2_subdev_cleanup(&imx576->sd);=0A=
> +       pm_runtime_disable(imx576->dev);=0A=
> +       pm_runtime_set_suspended(imx576->dev);=0A=
> +=0A=
> +error_media_entity:=0A=
> +       media_entity_cleanup(&imx576->sd.entity);=0A=
> +=0A=
> +error_handler_free:=0A=
> +       v4l2_ctrl_handler_free(imx576->sd.ctrl_handler);=0A=
> +=0A=
> +error_power_off:=0A=
> +       imx576_power_off(imx576->dev);=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
> +=0A=
> +static void imx576_remove(struct i2c_client *client)=0A=
> +{=0A=
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);=0A=
> +       struct imx576 *imx576 =3D to_imx576(sd);=0A=
> +=0A=
> +       v4l2_async_unregister_subdev(sd);=0A=
> +       v4l2_subdev_cleanup(&imx576->sd);=0A=
> +       media_entity_cleanup(&sd->entity);=0A=
> +       v4l2_ctrl_handler_free(imx576->sd.ctrl_handler);=0A=
> +=0A=
> +       pm_runtime_disable(&client->dev);=0A=
> +       if (!pm_runtime_status_suspended(&client->dev)) {=0A=
> +               imx576_power_off(&client->dev);=0A=
> +               pm_runtime_set_suspended(&client->dev);=0A=
> +       }=0A=
> +}=0A=
> +=0A=
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx576_pm_ops,=0A=
> +                                imx576_power_off, imx576_power_on, NULL)=
;=0A=
> +=0A=
> +static const struct of_device_id imx576_of_match[] =3D {=0A=
> +       { .compatible =3D "sony,imx576" },=0A=
> +       { /* sentinel */ }=0A=
> +};=0A=
> +MODULE_DEVICE_TABLE(of, imx576_of_match);=0A=
> +=0A=
> +static struct i2c_driver imx576_driver =3D {=0A=
> +       .driver =3D {=0A=
> +               .name =3D "imx576",=0A=
> +               .pm =3D &imx576_pm_ops,=0A=
> +               .of_match_table =3D imx576_of_match,=0A=
> +       },=0A=
> +       .probe =3D imx576_probe,=0A=
> +       .remove =3D imx576_remove,=0A=
> +};=0A=
> +module_i2c_driver(imx576_driver);=0A=
> +=0A=
> +MODULE_DESCRIPTION("IMX576 Camera Sensor Driver");=0A=
> +MODULE_AUTHOR("Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>");=
=0A=
> +MODULE_AUTHOR("Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.i=
o>");=0A=
> +MODULE_LICENSE("GPL");=0A=
> --=0A=
> 2.34.1=0A=
=0A=
=0A=
Best Regards,=0A=
Tarang=0A=

