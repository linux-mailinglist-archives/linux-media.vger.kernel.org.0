Return-Path: <linux-media+bounces-65190-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3TSZO4jkM2rrHgYAu9opvQ
	(envelope-from <linux-media+bounces-65190-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 14:28:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A6A6A0084
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 14:28:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=b1i4qU4q;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65190-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65190-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7DD23050462
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36663F4DDC;
	Thu, 18 Jun 2026 12:28:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020138.outbound.protection.outlook.com [52.101.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DD93F4852;
	Thu, 18 Jun 2026 12:28:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785684; cv=fail; b=Vw7tEQJUlku7bDOlPTkHdBjbIDd5XEBloC4hVonycIemZ8sftylFHHojc7dS+cgc5v4eJPwwPKPtpxlwE5N40AgKnFJpz6wCYqChvAoLFauyD1L+r7K2MCqRVKUkBMyvIiupd/jLw8G6zSzLSoReohN3HL2R5vYupp6otXHftHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785684; c=relaxed/simple;
	bh=qLe6qE5HGYqeUjaPdswHIUqAJYh1slqJCm+Sh6T9fDQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j6p+HjDwG8j9PwptCc8to3aHWF5O5D8/6C0Cy+S9SPzTSC7drOWqopaZf4r73USNoEoGdO+pO4o+WBZkSO60z7g22wH0TesaeP9sGoolEgEtUeb9qg2F7bYbjsv/amizWVuqjZXQCWDA1vsy3Wspdo3bnZBlpHHo0PvtxUfiRqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=b1i4qU4q reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.227.138
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1KQSQ/wiyw2FMyujM62QE0FcjZSPTRDb/gR5lOSww/8C2DoRLw61CPTAnt89f4QMMaz9AiCW08AqJTCtWNzwyNX9XWPlA+x9LTnlkKOKrKVzOjqMBii1p37jBD63f4O99RXCUt/TVeyGyYr1SUEFeoeqH/T+tV4paWaq0T6AwKLY2ZXMppbmPBok37yW1rVTN8vSgVjZCskxw0IyjQ7IaTF+KZL2ehOsGFfvv5MzmPKfnTsQ0XT8OxpEhEkrdj8OkaTK7WUKK8atK6RbmS8CKdoPiPzRopWZ+MF2nI4gO35WXcExbC4WFSbfg6Id98zKhuJYbzCOreFj5XMZ9bl2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2h+7KUaXnJzzdVxJBi83aQ4ic/S4wWUOj5l2LrZTRKw=;
 b=DRHlnr2x88ZPyfgOkE1LOcJJRhkz1CzzFFRFx5dbVvpZQTtzyM+LcAeYpkqSXIWx6Rbr9FYRev0GH2HGuIDHHIKyFuH/tdJ+25yqlYf04t8DWm82TnDoyBh+f+T8EJlX1Tla9X7nlgreg935GAc/HXp54/l0JqxoegMyoR0xr3NY9G+zglS1eeAgXHkGo4RDVvKbSGjze6iWgII5gxmWRV0ORSQZKBySEaR/bUVt/vWTdOOuF3TfBoJSaPbr+G1gI5B0u13AX6JBenVKlNujRODK6vRAoNSTC0BtkVK6yLIrYHmJzgHttrBAevTgoYwWVS6f//rUqpeZumkcOxURbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2h+7KUaXnJzzdVxJBi83aQ4ic/S4wWUOj5l2LrZTRKw=;
 b=b1i4qU4qgiVYfOOUuZ2u2etNvKyW/csNaojWPuxG3fUFUibumODDIC+POOZgGEgS80jq8byL7yDwPwvyTmISeszP6TBcqAJUi2D/OxoHU7CE8fMLZJ+mglsFylwcd2Jy7EKevzA0vVu7OHf+4jC/5zRy5dI9WlqykHO21I6XljqXhhtj38CoRwKJx+frgGiO0Yh0HkH8hgp7KpD7E8Y1Xxh3B3OWFfF5HNymmPTlg8UH5npzTNVUWAv+skeZLrO7FNsIwGhBwWrBJXsDAgiUYotJfh0Mirl2hhMx4Eojc9ifepfr6GshQPLKBhCWjsFucRhP/dTUqCNLrZPEOW4n/w==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNWP287MB6044.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:335::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 12:27:58 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 12:27:58 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>
CC: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>, Hans de Goede
	<johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, Jingjing Xiong <jingjing.xiong@intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] media: i2c: add os02g10 image sensor driver
Thread-Topic: [PATCH v3 2/3] media: i2c: add os02g10 image sensor driver
Thread-Index: AQHc08x2ZGEqHlozd0WRfHpJSrJW5LZEh+YAgAAHxas=
Date: Thu, 18 Jun 2026 12:27:58 +0000
Message-ID:
 <PN3P287MB182988E479F79C0979B56BCA8BE32@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-3-elgin.perumbilly@siliconsignals.io>
 <ajPZ_mURqAFbk59S@kekkonen.localdomain>
In-Reply-To: <ajPZ_mURqAFbk59S@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PNWP287MB6044:EE_
x-ms-office365-filtering-correlation-id: dd0366be-6795-45c2-3ce8-08decd350800
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|4143699003|38070700021|6133799003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 5OybBO5tCGAbYSlJgUy/De34JOxoC2Vx+TyeZkcoGnTILTQhIrNf1jU7r+D6ugHNdWrfA+8zc7xSGlHrH3PtZJjs4/srs6vyEihCpWFzqjyzwnS3FPdVIwqcg+sM6U6MX/1vM4cgsKNP+bebI/DeBj/zOyobPLYW9A+CILJWXZfY0ATDECb8qLayFSqRzTcBJDd+5JctfmLO6dst1Olv2moBC6Nhmz/icu8+mvvjm5caPGTm+29XG+wH//I2EK1Vv6D5h04DHPUm9VfGx7bVr3bkvf+iQmTzIeYjYI+1mGQgaGWs7fvEKU63j0ngFLzJp8nUus7PKc14vyLtS1IlIFsvjDV+aUxmnkI4k6pu7bQPlafB8PR6gfLBArogzRwiH30qB0B0XQQzFUlSNR5He7TKtHc//7C0hGhfjg+Jru178+ON4XteRZsfl3t55ZtvUUqwtOAGUjnYHXK2JZ5Q8KSSqVwLP27no72qujyXSjnYzsVx91wB19pOAWJSPWmbBbg43Q0Xw05cNx5/YWHHfP/lYXWgJ6vs3ZVmASUcW0hbJ6wc/mry9prTdSIOlqQQn0+7jv/ooAFwz4fmfMCTSS0opj0apW939DKN2UoIawvVS7G3ubqcTrmjhUgOaQMyTusf7I6Dk/wKZgXKj7wbXSAFYL89lgXgv3Che02rBCgccmJ3Nl6Lq2jS177b3o5uXN0QQXh1gIaCR53jF/7sp7xITeEgX2ZFCc93cVkO4mfFLaBrLFmDw8mKjmEq2HAm
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(4143699003)(38070700021)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?koi8-r?Q?dtu0WtJtfuzuCtFU+OH4lFjvu8hgTgDSEwWhM3QMuy9d2DxOT2XRHogDhpZBlP?=
 =?koi8-r?Q?K5L1zylqkvVJcrAdNfLrVEA5z0ojVzqpacwpfwnGDpoDJvtXu9bjTLOvk/J9qz?=
 =?koi8-r?Q?jJOdkKS0ktQ2aPJtrFgl9WkjiODoxGRMb1EN2UccxJNiw3fk+8zIqrcVMP6L4J?=
 =?koi8-r?Q?vEvz8IcKn6XXfg+1w4UtQUS34XFFxf3J09l3WC7xn0tmPsbUzuatW/kHzZTTX6?=
 =?koi8-r?Q?w6So8RuBE0gYPq4T4OKR0Dbk+Bv33n2SgJ94OfS8uK/us8wF05qNNO6Wcl4jNU?=
 =?koi8-r?Q?Whe0BFG5kY9WuDX01KWmlfn2l/Bja1VErFatNEWCf7zVrCY57V3RvUAj8rMdBn?=
 =?koi8-r?Q?v1qG56Kg/jMqZ09ZUF1aQcIRHpRrf9wKWGKF2Z2dxFjQ0Jl/KBSGe7lUhoH9ZG?=
 =?koi8-r?Q?+fYApLHwhWFQr+pGdTVAnvjP37i2Cmxt5OFnt/cBR0ojw/mydTkyd9UlYyeYBV?=
 =?koi8-r?Q?kfP58h29pjHHwuy1EPdzSjmSzyafLYVFaKun1+vPp/SX5MHAgHr5RKXV+3d1He?=
 =?koi8-r?Q?pDRr8U6bRSUshAW/yLVgJF9C6uo2xj1s5fPbQfcIRRrNUW6km7GvdxM/SKol/J?=
 =?koi8-r?Q?IvW591GmaAOpAwEHxVneqHppDCkdxNMFd0Cgwt8bicENIlwtGuVX8PSSn9v5JZ?=
 =?koi8-r?Q?v2jEbwly48OzxMhrfNEWawVfpG6/162477gLKv4xZkKcWYqqXP61dw/cyOL30r?=
 =?koi8-r?Q?fJ/ly6w/TolJ468b3eEgaerEdXKlS3Ok442/lxSsLNDA0oW+85+luJOG3LoEu4?=
 =?koi8-r?Q?K0D2s4ZQO3A5ylt93UPAdy2EnTJhbUTnmrINXKyclhlzG7Slz6dvtzPOn7qgGM?=
 =?koi8-r?Q?1Vu8mCGc6AviGogNopz9Wqkquc62cFs0aqJ83IVf03ZPg/m4jb2RgZs15j49vC?=
 =?koi8-r?Q?ghjGoy3AKYtICJw7owqEe0gzs7k4JtS9P7UB/rEsySTJaDTZ8Wbl+733WE5EkO?=
 =?koi8-r?Q?uBzfwfVjKdCrBUQMS3fFuaDgZarG7EAADy7X3IfmiplwDhr5OmZ2Vwqcv9ybsx?=
 =?koi8-r?Q?ljxJp/JhSZfNQOb4knFwx6yt+bFM8Fxej0Ox9dD9SWzLk/krNzxAfNwiKk3GLf?=
 =?koi8-r?Q?DRKpPkpVi4WoOt/XEerfjrxl4B/MmzGV0d2cmBFjhu0DXMkBdg5AHW9EzCMpoF?=
 =?koi8-r?Q?tjm7o+e37Hdm7ctjtfuQII6rCQI95jyE1nCZ+3F+0mF6CxlKhmM34U92Lu1VIp?=
 =?koi8-r?Q?JY1y3sy+yWMnMLwboj068cW1V4v0z7BB5lG1PiLASunCpCndr7Uk+J54Kk8om1?=
 =?koi8-r?Q?0i5Fngfr1Ibfi+hEJghqDQcBqs8oDUJTlGUgiupChnnkuq4SymhHWl92GFCRt0?=
 =?koi8-r?Q?Oq2THAFP2Thwg56aY0U23mCCymbQd+NXDC/VlemNVDXW61VmpJyij41Q2x5jLK?=
 =?koi8-r?Q?PCPfR1c3n2e6La6HcBJS9flpBIK079hjJkkc4Y6hZ4L2f93Cd9S0XngqfrF0II?=
 =?koi8-r?Q?it/orRPDaRnfx3qELn99LNWyXw8z24VPnhRBI6dylkCzeY61AWqceQJIXEa4pa?=
 =?koi8-r?Q?r06PoPH9nF1vwxYbSIv1c2j9egBOJ+4/e/sY3etgTCtTMkEfwIXT97pTylIswI?=
 =?koi8-r?Q?1vErrcD71GctMaPAwJFVcrQz+59q3WKStEZL/VQ+/Jl59P0ycvrx5DLuFmMsdJ?=
 =?koi8-r?Q?mL1hS80MVCGjNctcjQ5VrtYJbHKFZ2zqBwXLEdFAzRos/kv3zqFMJJmXEOcPd8?=
 =?koi8-r?Q?8wAwG8elQZsUCA=3D=3D?=
Content-Type: text/plain; charset="koi8-r"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0366be-6795-45c2-3ce8-08decd350800
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2026 12:27:58.4027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eD87qlnoIYSEwOJGQDTHQrVlA9bvWE6ZIxoN3g9IW661LFLZNXEDEy5kuoxBt4ipUWaypsl7Sgy/Ffo7M7vuIT1lw3eEH68C5KHNe2Fq55E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNWP287MB6044
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65190-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:elgin.perumbilly@siliconsignals.io,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:mehdi.djait@linux.intel.com,m:sylvain.petinot@foss.st.com,m:benjamin.mugnier@foss.st.com,m:bryan.odonoghue@linaro.org,m:himanshu.bhavani@siliconsignals.io,m:heimir.sverrisson@gmail.com,m:jingjing.xiong@intel.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,foss.st.com,siliconsignals.io,gmail.com,intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid,siliconsignals.io:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51A6A6A0084

Hi Sakari, Elgin=0A=
=0A=
> > +static int os02g10_power_on(struct device *dev)=0A=
> > +{=0A=
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
> > +     struct os02g10 *os02g10 =3D to_os02g10(sd);=0A=
> > +     int ret;=0A=
> > +=0A=
> > +     ret =3D regulator_bulk_enable(ARRAY_SIZE(os02g10_supply_name),=0A=
> > +                                 os02g10->supplies);=0A=
> > +     if (ret) {=0A=
> > +             dev_err(os02g10->dev, "failed to enable regulators\n");=
=0A=
> > +             return ret;=0A=
> > +     }=0A=
> > +=0A=
> > +     /* T4: delay from DOVDD stable to MCLK on */=0A=
> > +     fsleep(5 * USEC_PER_MSEC);=0A=
>=0A=
> Does the sensor really require this? Typically no delays are required=0A=
> before lifting xshutdown.=0A=
=0A=
The 5 ms delay for T4 (DOVDD stable to ECLK on) is required by the=0A=
datasheet.=0A=
=0A=
However, T3 and T4 are independent timing requirements, not sequential=0A=
ones. The current implementation introduces an unnecessary extra 5 ms=0A=
delay before deasserting XSHUTDN.=0A=
=0A=
The comment could also be updated to:=0A=
/* Wait for T3/T4 timing requirements after supplies become stable */=0A=
=0A=
=0A=
Power-up Sequence:=0A=
=0A=
DOVDD    ________/=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80=80=80=80=80=80=80=80=80=0A=
                 |=0A=
                 |<------ T4 =3D 5 ms ------>|=0A=
                 |                         |=0A=
                 |                         +------ ECLK ON=0A=
=0A=
AVDD     ________________/=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80=80=80=80=0A=
                      ^=0A=
                      |=0A=
                    T1 >=3D 0 ms=0A=
=0A=
DVDD     ________________________/=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=0A=
                               |=0A=
                               |<------ T3 =3D 5 ms ------>|=0A=
                               |                         |=0A=
                               |                         +------ XSHUTDN Re=
lease=0A=
=0A=
XSHUTDN  ____________________________________/=80=80=80=80=80=80=80=80=80=
=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=0A=
=0A=
ECLK     __________________________________________/\/\/\/\/\/\/\/\/=80=80=
=80=0A=
=0A=
SCCB     ____________________________________________________XXXXXXXXXX=0A=
                                                 ^=0A=
                                                 |=0A=
                                 T5 =3D 5 ms ------+=0A=
=0A=
> > +=0A=
> > +     ret =3D clk_prepare_enable(os02g10->xclk);=0A=
> > +     if (ret) {=0A=
> > +             dev_err(os02g10->dev, "failed to enable clock\n");=0A=
> > +             goto err_regulator_off;=0A=
> > +     }=0A=
> > +=0A=
> > +     /* T3: delay from DVDD stable to sensor power up stable */=0A=
> > +     fsleep(5 * USEC_PER_MSEC);=0A=
>=0A=
> The supplies were enabled before the clock so right now there's already 5=
=0A=
> ms delay here. Consider with the above comment.=0A=
>=0A=
> > +=0A=
> > +     gpiod_set_value_cansleep(os02g10->reset_gpio, 0);=0A=
> > +=0A=
> > +     /* T5: delay from sensor power up stable to SCCB initialization *=
/=0A=
> > +     fsleep(5 * USEC_PER_MSEC);=0A=
> > +=0A=
> > +     return 0;=0A=
> > +=0A=
> > +err_regulator_off:=0A=
> > +     regulator_bulk_disable(ARRAY_SIZE(os02g10_supply_name), os02g10->=
supplies);=0A=
>=0A=
> A newline here would be nice.=0A=
>=0A=
> > +     return ret;=0A=
> > +}=0A=
=0A=
Best Regards,=0A=
Tarang=0A=

