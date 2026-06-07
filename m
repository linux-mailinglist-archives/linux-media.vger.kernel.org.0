Return-Path: <linux-media+bounces-64043-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ISysDiYcJWqODgIAu9opvQ
	(envelope-from <linux-media+bounces-64043-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 09:22:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7738264F007
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 09:22:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=siliconsignals.io header.s=selector1 header.b=dlFtWbgW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64043-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64043-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=siliconsignals.io;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03CFD3016EF3
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 07:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91E22EEE96;
	Sun,  7 Jun 2026 07:21:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020122.outbound.protection.outlook.com [52.101.227.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E66233933;
	Sun,  7 Jun 2026 07:21:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780816918; cv=fail; b=lpXHPtU+NJrKdbPB1+u/aXqegi1tiELqxyptxlOLlS+aGNhGFvdqc0MVTaJ05enX1ldlris2KS9NgHNI/L6mw6/zZOzMDXz8t7FdpYdy8rQul9Ggyo7q8TrLB5rVaBJal/GbCTrqAOduizIrjueAMGOk6841uc/UyICVLfiHgUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780816918; c=relaxed/simple;
	bh=fNosmgMMiglc0ec4CF+DiEg+5OizLCgW3YaMS2Efq1I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SbQGjymvSSxnEn8GMRgSLFQCBsDPfLv9e3dMyFvbeqGI5JD8wr9qwj7rq3jU6SLQKeK2jeH9OYFE5Wb+8xcW/pKf3ZlATicSV4NvgqHx3JGaLmQYZ/4pgdSGt0nKjDZrT4pnRxm1bCVGuMnH5ZeuiSgNsXcNkmc77AjJHfroKq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=dlFtWbgW; arc=fail smtp.client-ip=52.101.227.122
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlTOOxnHwm3bXED/HnQe+EziXtXfTGGePthYyBp8wZOzp0d/qt8FUW7p7K29WGEizPPkhUf58t92EmAcwfh3LxZwVyhMUfBeStogqB3G3zcnR2QOd/i8XUdsafxj05IwojX1hne1Yi7SMN55q7vUfNrviBL2REgvWHaQzUgaFRTTvVzOZS7cg7deJnuzRTMWYoOj0uNRwrhuquaEuViVnK0NnBqu/6SLEdAHvlnbuggMoT1wZnHARDsl/5BtHmHhj6TM5sIw6fkVTHeeHhp3t8VOgfvzjD9E+uaEnjs1YKFO5Zy4RLTUGscdXNPyZLUe2vySGzuLH6vLMjpyZEpX3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tLuwM4t5nwnBH+mUW9fjOZEBrQQV0mlC9D1v7mif30=;
 b=RP/9TgAtuZLESvjHHj4z5G7G+6L8nc/hhCt1rc0VfawNq0xLwbeg5af2k1O0o15n3bc6yD68bvhfq1EtHyN3k1768Ka0I3HyW/hlq11LfxDMeYs/3U2QcytIm26OBLzSMJBfoYLPEdRmWRtRuY7WLh2e+jxFCbcFz/Y88CouL7QWYaJlWp/GVky0EQldXWDklS3kJyGEkpZyt8eFkYowFHWXIbxfAeTLS5xH26buu7syadkRrpVoJeUJlToB3JSZvU0p2G0YODrKai+kW4MGs4BpxL6IZDXikZWXFd1QYpKskli9CrpGpmcP5f7q/Z64WCrFg9F3mPLSO49OF6iM2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tLuwM4t5nwnBH+mUW9fjOZEBrQQV0mlC9D1v7mif30=;
 b=dlFtWbgW1PMnPC04kSKIuGnLJWRA4FlVTua+sj93qyXS8ZCS/10NBw4I6GyDlWy/+M0cHOyT/5YMfDPy+Bi3HsWVjX2yPxIiryPBYEpkI4bKkfOsoUB3jjcq0R7s5TEDvZudzDxZ89ldh/hDXYMVpdwZPEHo/orfj3877yjhR/n6bd4pMsmKxZXYEnQw43qR/FS0X0bh/kxRKd+I1LT9b63/0JSOWZ28ve0gYyBkRv+xygqpAkt471dwsoSoKRzDuqgLvNKis+ifDQXVYetZsyWj+ISo4cQel++OPzFlfeUo1Nr2rbhz+9Fxlupkgfjok4wq2sCJK9aL2y1F1rtx7A==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNXP287MB4261.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 07:21:51 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0092.011; Sun, 7 Jun 2026
 07:21:51 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Conor Dooley
	<conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: Lachlan Michael <Lachlan.Michael@sony.com>, Ryuichi Tadano
	<Ryuichi.Tadano@sony.com>, Kengo Hayasaka <Kengo.Hayasaka@sony.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] media: i2c: imx678: Add driver for Sony IMX678
Thread-Topic: [PATCH v4 2/2] media: i2c: imx678: Add driver for Sony IMX678
Thread-Index:
 AQHc9QDxR/cbdD8AmEyAZncD5gOfZLYw/V86gACHxYCAAAc0YIAAHBQAgAALeNyAAL83AIAAOdmp
Date: Sun, 7 Jun 2026 07:21:51 +0000
Message-ID:
 <PN3P287MB1829BE7652DAB267939E96208B1F2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260605-imx678-v4-0-58e57c67143d@ideasonboard.com>
 <20260605-imx678-v4-2-58e57c67143d@ideasonboard.com>
 <PN3P287MB1829593C2DF9AFF8F24A39AF8B1E2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <178075217188.9570.14789474340505402551@freya>
 <PN3P287MB18292FBAEABB556C051434848B1E2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <178075974823.9570.15829300390679437100@freya>
 <PN0P287MB1828B9AF2057CE964675318E8B1E2@PN0P287MB1828.INDP287.PROD.OUTLOOK.COM>
 <178080327481.9570.13702566645856478041@freya>
In-Reply-To: <178080327481.9570.13702566645856478041@freya>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PNXP287MB4261:EE_
x-ms-office365-filtering-correlation-id: d2a4b094-10b7-4ff1-7ef0-08dec46571a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|4143699003|3023799007|56012099006|6133799003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 BA9/eHvtz3e0Uc0E56ZaQy36tfxnw+ACxYHbYf0T/K8mUexI7OIVDP/pRLDpdbAaHVZywXHwOBOfg1EFwHyl6FzTiZ+/lyCKogmw9DjBeL7a8qjEG2nONKvmfDFccq8K4kELlb0iazXeOzsLBWGAslJHRMSK2o4pPgDP1GZ2y4enFxDt81AgncknpjjVE9QXYgI706EOUgwwUVKWlxL47nWi5g+cH5nav+0gWOjgGOT/M+CNxnIP0zKU7GaYXlZ1koquEVI2+3/1X+Concrf5w6OoOHO784O88JjT6pec9eYfsHZQH/y84Zav1dvKzf05fRrmgzg9fbQOSXqdI6klBZEsbGj2RW3fY9scPRDHounL0unLF/CuOwmU3v78uszE5/z1FKG50P7iYEMj/xHU/mVnTbvZWKozvKDAgUdCpw2vqYo6euw/R1YBLSGLBPPkiaQtzIFbZimWAWYyADRFROZeQlD0j9Pl2t1RxKoXOjGHYM38UJlLpzREke/WPOgV2JSD+OBFaJG7Ckej+W4DXLATW/gsg0jyhPFxT2FLl5jXfQ96Hh30o9w1DaycRe7ushmgTXMAoGndGBh2FtoRtBIitzimghEHP1aOdP4Ho+dU15acNwk/oL6Qqy3Ysow7z/n57zsp+VxTEscKTIp6NpTxq5vYMD21RJrG0JoOfHUAlmMpLr5MgYITtoDP4xcgy1H2nv7ELFXs/Bb0GuVfA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(4143699003)(3023799007)(56012099006)(6133799003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OJs9NYhC6kwrb36D4Ddf2nYj3N5Okf6i4KIEtw22ipcEUOn/yrsQb1qmuw?=
 =?iso-8859-1?Q?RefoDruqetA3pXoIHjRlyBgnLoBqF4YsHZmTBNH6oRC89bbB2NnLBYhGTV?=
 =?iso-8859-1?Q?kuCjKEjh2wXwlEzCQckDaufE2do2RITeIbCv7sOLqvaBKVFt7K/tLA4nEe?=
 =?iso-8859-1?Q?EjN/eLz/iW9ScaOIo4N9Iz5a2/XEUBgI88ynq7N/HETq50JKBBMJoI9PEA?=
 =?iso-8859-1?Q?UJZZSCwFr/6YwZO2qcElBWCsliFGbo7Ump4yhWKIiM5Q9QmWT5xci9ri4y?=
 =?iso-8859-1?Q?YiAZ/UlePhTOW9vs1tcFE5+/t9m8M9DqlGFR70nt392RQ+dnaDEJ8R8+55?=
 =?iso-8859-1?Q?cg+56holy7E2869wjHSk+aStq3DH/HdqdACmp3DXW7WaNTk5EUfqK7IPQu?=
 =?iso-8859-1?Q?OHB/CQ+UopMZjD1BvTF6ORm5u4rRmI9sk3Mhfy6yPCpfXcf4251fKvJiLe?=
 =?iso-8859-1?Q?+hnmpA2TfuLv5VtXLPQ4Bx0LzXsCEmpyC+NevAGgOEEU8GKC5FNFzEl96r?=
 =?iso-8859-1?Q?r0cYXPtqodH08a8QrvjQnPFPVs/GO7TkhEklemiG4jHfMDlT0Oua+ynWci?=
 =?iso-8859-1?Q?XPhO7WX5+OPSTSYEXXSoLvXOh0o+sfgK7vO7WS/Un3SxvJBfYJYJ3q+JpM?=
 =?iso-8859-1?Q?aLnWzsX1OQLXUW0Nc8BPuJ+Jw8NM2nLa7YfNRDSJvi08+3KO8XRrA9HzUx?=
 =?iso-8859-1?Q?9Tbwk9zGcvb/kW0VUiB7bPes/jrqsZelvjevgoJdzRnh7zkdygn3ZSyBsH?=
 =?iso-8859-1?Q?vt8ShcsTYcRb5ZS+jBLMk1aTDeKvsc/QKVwJUW0tfafgKtkhNn5i1YA6Jd?=
 =?iso-8859-1?Q?IcOvqPLNYN9Fqx6/km/sc52j0XFO/5FVezewCW1N+Pahv60cDsgXIdLdZF?=
 =?iso-8859-1?Q?4Uh3x4+4zYtlVA6eY+6x1tVcR6I7byjkUA1SRLXaUFfEoRIZf50RJVqgs+?=
 =?iso-8859-1?Q?pVce5IHfJnhqqfXCFGBx+rn2RqZqAfS45z7JvmKyCABDpPgkHmjlMzX+Fy?=
 =?iso-8859-1?Q?2zQl4XIvYSOC8uHhVXKdAvz70tapUPMHXR+CfqRGQ/fZZOFKve3fi/TB1g?=
 =?iso-8859-1?Q?W6e/F0NQ312BvyklSRZ3RqItdsj29S8DjOMOrAIJ004/Hr2X92ae9z7lJS?=
 =?iso-8859-1?Q?HD/f/b7QspN4T+xvc5GEZcrn+BOaQI1lvkZptbgUNOC3ZJTUFpUB0oIw7U?=
 =?iso-8859-1?Q?q82GA2q/iRxgjoR3eI7rT/8vpsxEZUERJ/41sFTee9lCrvh3pq08iJH7so?=
 =?iso-8859-1?Q?U0AOcgYBLUGf/2bsZRTOLQPJpKW9BKp+lCOD/mD9z1Ner9WxRiJFL0uwq9?=
 =?iso-8859-1?Q?Qv3UaRlfArMNfehBONw/3COuVdwVaj/iyPQv5lq9ClPtJoQkWY4SmEWvJM?=
 =?iso-8859-1?Q?wUlM4AS4B6BdNuOTO9XI+XYwfQ2PQwldKZLUDriDNZpq7RTcsg9VbYD537?=
 =?iso-8859-1?Q?nfpE29C9qOjE2O6rxSFfDk6dfPHYlzWO0QPQeoJs3KcUPG26AKsbxUq2BZ?=
 =?iso-8859-1?Q?P8oP2Xgjru8/pUQZ+7w86irM4TyfNRu0D5zkDjs7vA5luNKtm16qRRMfrZ?=
 =?iso-8859-1?Q?Eu8Pm1jNCFjjEmSF2xMl2xG/wjZjWslMly8IkmHrzvWadoTK7g2/7tbmVk?=
 =?iso-8859-1?Q?P+POso+bBeJHkcxT3B9iZxmjiOdEyVvzp28LRImW8e5KbPYsRrCc3Cz9UJ?=
 =?iso-8859-1?Q?ZL3P81eZKii3VI7WsB3a5u7rfBmO/zODPoAVKxgO3B2+xhuhq2aCmCnSSA?=
 =?iso-8859-1?Q?NqoDRho+141GBqZjja/rw6DjMUo4hwh5NW7vCrh+YFU49HNA53RG9XzZew?=
 =?iso-8859-1?Q?sElFnKx43N9/6a08P6zbjspFm/pxxnw+htPAPIoWpSf9Aiws6m57UDuCdB?=
 =?iso-8859-1?Q?2f?=
x-ms-exchange-antispam-messagedata-1: 4I2CXanH6g/p7MPjBHDwV+F9wx4JoS0GJ14=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a4b094-10b7-4ff1-7ef0-08dec46571a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2026 07:21:51.0813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NyKWCJOs93bb3jaUUnKMHoqQzzDDBINKYJIMPV4I3MEXdmFaz8998G26HHjnuc5FwO48MAmxT5iyREjbBGMi/+eX/GxEfKvMLav1Vl0mSu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4261
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64043-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:conor+dt@kernel.org,m:kieran.bingham@ideasonboard.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:sakari.ailus@linux.intel.com,m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,siliconsignals.io:from_mime,siliconsignals.io:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7738264F007

> Quoting Tarang Raval (2026-06-06 21:51:38)=0A=
> > > Quoting Tarang Raval (2026-06-06 20:15:48)=0A=
> > > > Hi Jai.=0A=
> > > >=0A=
> > > > > Quoting Tarang Raval (2026-06-06 13:47:36)=0A=
> > > > > > Hi Jai,=0A=
> > > > > >=0A=
> > > > > > Sorry, in my first review I missed a few minor issues listed be=
low.=0A=
> > > > > >=0A=
> > > > >=0A=
> > > > > No worries, thank you for the reviews.=0A=
> > > > >=0A=
> > > > > > I also noticed one major issue in the driver. Please check the =
comments below.=0A=
> > > > > >=0A=
> > > > > > Other than that, the driver looks perfect.=0A=
> > > > > >=0A=
> > > > > > > Add a V4L2 subdev driver for the Sony IMX678 image sensor.=0A=
> > > > > > >=0A=
> > > > > > > IMX678 is a diagonal 8.86 mm (Type 1/1.8) CMOS active pixel t=
ype=0A=
> > > > > > > solid-state image sensor with a square pixel array and 8.40 M=
 effective=0A=
> > > > > > > pixels.=0A=
> > > > > > >=0A=
> > > > > > > The following features are supported by this driver:=0A=
> > > > > > > - MIPI RAW12 output=0A=
> > > > > > > - Monochrome and Color (Bayer filter) variants=0A=
> > > > > > > - Multiple input clock frequencies=0A=
> > > > > > > - Multiple link frequencies=0A=
> > > > > > > - VBLANK and HBLANK control for variable framerate=0A=
> > > > > > > - VFLIP and HFLIP control for flipping readout=0A=
> > > > > > > - Exposure and analogue gain control=0A=
> > > > > > > - Test pattern control=0A=
> > > > > > >=0A=
> > > > > > > Following features are not currently supported:=0A=
> > > > > > > - MIPI RAW10 output=0A=
> > > > > > > - Pixel-perfect crop reporting, accounting for the shift-by-1=
 when=0A=
> > > > > > >   doing HFLIP/VFLIP where the sensor maintains RGGB bayer ord=
ering=0A=
> > > > > > >=0A=
> > > > > > > Along with the ones below which depend on the new raw sensor =
model:=0A=
> > > > > > > - Embedded data stream=0A=
> > > > > > > - Freely configurable cropping=0A=
> > > > > > > - Increased framerate when cropping=0A=
> > > > > > > - 2x2 binning support=0A=
> > > > > > >=0A=
> > > > > > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>=0A=
> > > > > >=0A=
> > > > > > ...=0A=
> > > > > >=0A=
> > > > > > > +static const u32 codes_bayer[] =3D {=0A=
> > > > > > > +       MEDIA_BUS_FMT_SRGGB12_1X12,=0A=
> > > > > > > +};=0A=
> > > > > > > +=0A=
> > > > > > > +static const u32 codes_monochrome[] =3D {=0A=
> > > > > > > +       MEDIA_BUS_FMT_Y12_1X12,   /* 12-bit mono */=0A=
> > > > > >=0A=
> > > > > > Above comment adds no useful information and can be dropped.=0A=
> > > > > >=0A=
> > > > > > > +};=0A=
> > > > > > > +=0A=
> > > > > > > +static const struct imx678_model_info imx678_aaqr_info =3D {=
=0A=
> > > > > > > +       .type =3D IMX678_COLOR,=0A=
> > > > > > > +       .codes =3D codes_bayer,=0A=
> > > > > > > +       .num_codes =3D ARRAY_SIZE(codes_bayer),=0A=
> > > > > > > +};=0A=
> > > > > > > +=0A=
> > > > > > > +static const struct imx678_model_info imx678_aamr_info =3D {=
=0A=
> > > > > > > +       .type =3D IMX678_MONOCHROME,=0A=
> > > > > > > +       .codes =3D codes_monochrome,=0A=
> > > > > > > +       .num_codes =3D ARRAY_SIZE(codes_monochrome),=0A=
> > > > > > > +};=0A=
> > > > > > > +=0A=
> > > > > > > +static const char * const imx678_supply_name[] =3D {=0A=
> > > > > > > +       "avdd",  /* Analog (3.3V) supply */=0A=
> > > > > > > +       "dvdd",  /* Digital Core (1.1V) supply */=0A=
> > > > > > > +       "ovdd",  /* IF (1.8V) supply */=0A=
> > > > > > > +};=0A=
> > > > > > > +=0A=
> > > > > > > +struct imx678 {=0A=
> > > > > > > +       struct v4l2_subdev sd;=0A=
> > > > > > > +       struct media_pad pad;=0A=
> > > > > > > +       struct regmap *cci;=0A=
> > > > > > > +=0A=
> > > > > > > +       const struct imx678_model_info *info;=0A=
> > > > > > > +=0A=
> > > > > > > +       struct clk *xclk;=0A=
> > > > > > > +       u32 xclk_freq;=0A=
> > > > > > > +=0A=
> > > > > > > +       /* chosen INCK_SEL register value */=0A=
> > > > > > > +       u8  inck_sel_val;=0A=
> > > > > > > +=0A=
> > > > > > > +       /* Link configurations */=0A=
> > > > > > > +       enum imx678_lanemode lane_mode;=0A=
> > > > > > > +       unsigned long link_freq_bitmap;=0A=
> > > > > > > +=0A=
> > > > > > > +       struct gpio_desc *reset_gpio;=0A=
> > > > > > > +       struct regulator_bulk_data supplies[ARRAY_SIZE(imx678=
_supply_name)];=0A=
> > > > > > > +=0A=
> > > > > > > +       struct v4l2_ctrl_handler ctrl_handler;=0A=
> > > > > > > +=0A=
> > > > > > > +       /* V4L2 Controls */=0A=
> > > > > > > +       struct v4l2_ctrl *exposure;=0A=
> > > > > > > +       struct v4l2_ctrl *vblank;=0A=
> > > > > > > +       struct v4l2_ctrl *hblank;=0A=
> > > > > > > +=0A=
> > > > > > > +       /* Tracking sensor VMAX/HMAX value */=0A=
> > > > > > > +       u32 vmax;=0A=
> > > > > > > +};=0A=
> > > > > > > +=0A=
> > > > > > > +static inline struct imx678 *to_imx678(struct v4l2_subdev *_=
sd)=0A=
> > > > > > > +{=0A=
> > > > > > > +       return container_of(_sd, struct imx678, sd);=0A=
> > > > > >=0A=
> > > > > > Use container_of_const.=0A=
> > > > > >=0A=
> > > > >=0A=
> > > > > Why is that necessary?=0A=
> > > >=0A=
> > > > container_of_const() preserves const and avoids accidentally castin=
g it away.=0A=
> > > > For non-const pointers it behaves the same as container_of(), while=
 for const=0A=
> > > > pointers it preserves constness.=0A=
> > > >=0A=
> > > > >=0A=
> > > > > > > +}=0A=
> > > > > >=0A=
> > > > > > ...=0A=
> > > > > >=0A=
> > > > > > > +static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> > > > > > > +{=0A=
> > > > > > > +       struct imx678 *imx678 =3D container_of(ctrl->handler,=
 struct imx678,=0A=
> > > > > > > +                                            ctrl_handler);=
=0A=
> > > > > >=0A=
> > > > > > Use container_of_const.=0A=
> > > > > >=0A=
> > > > > > > +       struct i2c_client *client =3D v4l2_get_subdevdata(&im=
x678->sd);=0A=
> > > > > > > +       const struct v4l2_mbus_framefmt *format;=0A=
> > > > > > > +       struct v4l2_subdev_state *state;=0A=
> > > > > > > +       int rpm_in_use;=0A=
> > > > > > > +       int ret =3D 0;=0A=
> > > > > > > +=0A=
> > > > > > > +       state =3D v4l2_subdev_get_locked_active_state(&imx678=
->sd);=0A=
> > > > > > > +       format =3D v4l2_subdev_state_get_format(state, IMX678=
_SOURCE_PAD);=0A=
> > > > > > > +=0A=
> > > > > > > +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> > > > > > > +               u32 current_exposure =3D imx678->exposure->cu=
r.val;=0A=
> > > > > > > +=0A=
> > > > > > > +               imx678->vmax =3D format->height + ctrl->val;=
=0A=
> > > > > >=0A=
> > > > > > ........(1)=0A=
> > > > > >=0A=
> > > > > > > +=0A=
> > > > > > > +               current_exposure =3D clamp_t(u32, current_exp=
osure,=0A=
> > > > > > > +                                          IMX678_EXPOSURE_MI=
N,=0A=
> > > > > > > +                                          imx678->vmax - IMX=
678_SHR_MIN);=0A=
> > > > > > > +               ret =3D __v4l2_ctrl_modify_range(imx678->expo=
sure,=0A=
> > > > > > > +                                              IMX678_EXPOSUR=
E_MIN,=0A=
> > > > > > > +                                              imx678->vmax -=
 IMX678_SHR_MIN,=0A=
> > > > > > > +                                              1, current_exp=
osure);=0A=
> > > > > > > +               if (ret)=0A=
> > > > > > > +                       return ret;=0A=
> > > > > > > +       }=0A=
> > > > > > > +=0A=
> > > > > > > +       /*=0A=
> > > > > > > +        * Applying V4L2 control value only happens when powe=
r is up for=0A=
> > > > > > > +        * streaming=0A=
> > > > > > > +        */=0A=
> > > > > > > +       rpm_in_use =3D pm_runtime_get_if_in_use(&client->dev)=
;=0A=
> > > > > > > +       if (!rpm_in_use)=0A=
> > > > > > > +               return 0;=0A=
> > > > > >=0A=
> > > > > > As in the last revision, as I suggested before, I will again su=
ggest using=0A=
> > > > > > pm_runtime_get_if_active() here instead of pm_runtime_get_if_in=
_use().=0A=
> > > > > >=0A=
> > > > > > This does not seem to align with the comment above:=0A=
> > > > > > Applying V4L2 control value only happens when power is up for s=
treaming=0A=
> > > > > >=0A=
> > > > > > "Power is up" implies that the device is in the runtime PM ACTI=
VE state,=0A=
> > > > > > rather than simply having a non-zero usage count.=0A=
> > > > > >=0A=
> > > > >=0A=
> > > > > I agree with the comment being slightly misleading, but same as t=
he last=0A=
> > > > > revision, I still don't fully buy your argument here :-)=0A=
> > > > >=0A=
> > > > > In the case you talk about, where PM is ACTIVE but usage count =
=3D=3D 0, we=0A=
> > > > > anyway know that the count will only increase when .enable_stream=
s is=0A=
> > > > > called, at which point the driver will anyway write *all* the reg=
isters=0A=
> > > > > including calling set_ctrl for each control with the cached value=
s.=0A=
> > > > >=0A=
> > > > > So why should we do (redundant) writes here?=0A=
> > > >=0A=
> > > > I think this is mostly a difference in expectations.=0A=
> > > >=0A=
> > > > My view is that if the device is runtime PM ACTIVE, the hardware is=
 accessible=0A=
> > > > and register writes can be performed. In that case, I would expect =
a control=0A=
> > > > change to be applied to hardware immediately.=0A=
> > > >=0A=
> > > > With pm_runtime_get_if_in_use(), there is a state where the device =
is still=0A=
> > > > ACTIVE but control changes are only cached in software and not writ=
ten to=0A=
> > > > hardware until streaming starts again. While the value is not lost,=
 I would=0A=
> > > > expect hardware and control state to remain synchronized whenever t=
he device=0A=
> > > > is already active.=0A=
> > > >=0A=
> > > > So I understand the cached-control argument, but if the hardware is=
 accessible,=0A=
> > > > I would prefer applying the control immediately rather than deferri=
ng it.=0A=
> > > >=0A=
> > >=0A=
> > > Why does it matter if some sensor register doesn't match the value in=
 the=0A=
> > > cached controls for a brief period after streaming stopped and sensor=
 is=0A=
> > > powered off? We don't have autosuspend timer here like other drivers.=
=0A=
> > >=0A=
> > > I'll update the comment in v5 for future readers/developers in case t=
hat=0A=
> > > changes.=0A=
> >=0A=
> >=0A=
> > Fair enough for me.=0A=
> >=0A=
> >=0A=
> > > > > > I also don't understand why we need to be strict here and requi=
re the=0A=
> > > > > > runtime PM usage count to be greater than zero. What matters be=
fore accessing=0A=
> > > > > > the hardware registers is that the device is powered and access=
ible, not=0A=
> > > > > > whether there is an active user holding a runtime PM reference.=
=0A=
> > > > > >=0A=
> > > > > > Anyway, rpm_in_use does not seem necessary here. The check coul=
d be simplified to:=0A=
> > > > > > if (pm_runtime_get_if_active(&client->dev) <=3D 0)=0A=
> > > > >=0A=
> > > > > The rpm_in_use value is used below in this function to ensure we =
don't do=0A=
> > > > > pm_runtime_put() in case of a negative retval. This is not really=
 handled=0A=
> > > > > by most drivers today, but I wanted to fix it here given recent d=
iscussion=0A=
> > > > > [1] and annoying Sashiko reports.=0A=
> > > > >=0A=
> > > > > [1]: https://lore.kernel.org/all/ahyh0ZlwlZqr7VNa%40kekkonen.loca=
ldomain=0A=
> > > >=0A=
> > > > Thats my understanding as well. With:=0A=
> > > > if (pm_runtime_get_if_active(&client->dev) <=3D 0)=0A=
> > > >         return 0;=0A=
> > > >=0A=
> > > > both the 0 and negative return paths exit immediately, so neither t=
he switch=0A=
> > > > statement nor pm_runtime_put() can be reached.=0A=
> > >=0A=
> > > If we do that no controls will be written to the hardware if userspac=
e has=0A=
> > > disabled runtime.=0A=
> >=0A=
> > Do you mean the case where userspace disables runtime PM via sysfs whil=
e=0A=
> > streaming is still running?=0A=
> >=0A=
> > In that scenario, shouldn't the device usage count remain non-zero due =
to the=0A=
> > active stream?=0A=
>=0A=
> Ah no, I meant if userspace disabled it through sysfs while streaming is=
=0A=
> not running. But I checked on my board and it always returns 1 in that=0A=
> case. There is no way to trigger a pm_runtime_disable() from userspace, a=
ll=0A=
> you can do is force the device to always be on.=0A=
>=0A=
> So it only returns -EINVAL if CONFIG_PM=3Dn, in which case we should stil=
l=0A=
> write registers. Thus I don't agree with:=0A=
>=0A=
>     if (pm_runtime_get_if_active(&client->dev) <=3D 0)=0A=
>             return 0;=0A=
>=0A=
> On testing the CONFIG_PM=3Dn case though, I see that pm_runtime_put will=
=0A=
> always return -ENOSYS due to being stubbed out... so the original code fl=
ow=0A=
> was correct:=0A=
>=0A=
>     if (!pm_runtime_get_if_active(&client->dev))=0A=
>             return 0;=0A=
>=0A=
>     /* write registers */=0A=
>=0A=
>     /* unconditional put */=0A=
>     pm_runtime_put(&client->dev)=0A=
>=0A=
> I'll switch back to it in next revision.=0A=
=0A=
Yes, the picture is clear now. Thanks for taking the time to test this.=0A=
=0A=
I also had a look at include/linux/pm_runtime.h, and the stub implementatio=
ns=0A=
match what you observed in your testing, so reverting to the original flow=
=0A=
makes sense to me.=0A=
=0A=
I noticed. In the latest metadata series, Sakari also added a patch[1] at t=
racks=0A=
rpm_status. Based on the discussion here and the CONFIG_PM=3Dn behavior, I =
wonder=0A=
if that patch may need a similar adjustment as well. Could you have a look =
at=0A=
whether the same reasoning applies there? At first glance, it seems the log=
ic=0A=
in that patch may need a similar change too.=0A=
=0A=
[1]: https://lore.kernel.org/linux-media/20260409201501.975242-86-sakari.ai=
lus@linux.intel.com/=0A=
=0A=
Best Regards,=0A=
Tarang=

