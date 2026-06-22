Return-Path: <linux-media+bounces-65326-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UhymCyDQOGrsiQcAu9opvQ
	(envelope-from <linux-media+bounces-65326-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 08:03:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 739056ACDDA
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 08:03:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=WO0zPd9f;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65326-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65326-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 138BF30329AD
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 06:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D8735DA68;
	Mon, 22 Jun 2026 06:02:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021087.outbound.protection.outlook.com [40.107.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC6C3126D6;
	Mon, 22 Jun 2026 06:02:29 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782108150; cv=fail; b=AH/i/QA4xgW6BC9txxZBnc6aTFo2+vEsZl5YOagHiJWxLOJMaB/S3tzJZ82QElotM146NTUc5+i8WdrOPUnNbFmcDrb2glUOZN5piysNXAw2LW9bmlC228Asf25UB13HeCAX+9BmtVqaUUjQZjzyYXiEOMK9+usKCsJn+8F2pxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782108150; c=relaxed/simple;
	bh=keE7w7l1vdUww8qkUrzfBMl3nXhLhE/c0CeoB+pHXgc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iFfV5zc7vBf9YUjnxSB8Ksqi53tMobK9zM9EngOI25IRvtHyWA7Yk21mEny8MhHK4uYyPOYM/gfrN/I+xNum1tCch6hRmIkVmWanS37+/nAUxk78p9bI/amlcYjAAzpR+c/DRt+8yLGMrHf75y93kLo6Aa3w4RHYrnJa5dMRgAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=WO0zPd9f reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.87
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBinR4vI+2PcwEP1KwSxXEEvbIIPqFJ6EFZtLQOTBkFkyH9lWfGDDK37eHKl1jPL280MawGzYClU+Y08RIOKXln+0gAK8+BjS4n3dsmybYF3fihBkEWFsAjjLnVu60oJP5BhHADlC4DPrsICD41o7dit+7P1Fg5rXM4A6/g1xbZ6nWY/PQ9lb8eUkqrdk2FOpb69OjSGzBivbNl+2m7fkL6u8wklp00Txxe/vCTfsCNCGD/13NLwVJpr6W1hmPr+wv+5gDZ+9sgR3BtUeNcC10J6Kh2TBGrSz2aEhEJEPFiMWJgFNeLns4nhbStPM+7BPmbIqe97IlEPif/jWxaA/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keE7w7l1vdUww8qkUrzfBMl3nXhLhE/c0CeoB+pHXgc=;
 b=vM7x3VF+VatzinEOBmCqhZ/V1WhTp4Cb0e9CBgAuuN+HSDyPEeZ0b5pMOyKFz/1iKjFHll3sLpMl4ncekElfaPE6fMQXwlG8oKU/ISMYQjiEVnj1QOr7Aaj7OPmSCol80EADrOkXCw2ZVOrqqw7GFqgLkOJX1g+ecAv/tbfHtcaNIcvhQnLcpEVVtrJ8cfOcDuDChraslFsJv1XHUSrdrSd4dt682sbdMt+elDh/dJAa5XTsqokgiECcbi2Ay9F9ILzx/0HmHyalZrbmf8yf+jiElUUDtBiwkFalUYivWVs7+ASWghLEcgm7nZGScxIOgp/OuGCXVGyMZ4jdgc3Rvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keE7w7l1vdUww8qkUrzfBMl3nXhLhE/c0CeoB+pHXgc=;
 b=WO0zPd9fVmKewUgC60I2bKyJ8hoAjplRzyocf8CSlBisVQK4mYcMauXfiDryjVOk+A7bz/WNmQ2TIbpNnxKqt4GV09wtx6G8SVE+u40PYxtVxseXfv9jAYLMzpnJY6hXYRR3hYGm/C3I5FiNMARhnVj4yNF0X1n9hQMx/lHectGNon9bD2vcBhGOQah1DHa0eq5oXJBJXB9jkE+CLlj8K1sNK5zga5QBAfcAskkU/+SAdaC2YtsyFTW2ukYFgRjM7HMsV2o/P8Abn79Ahe13njUpbPICdCznZudbNhJG+O/fAYQG7TFr3euhXdZ8/RwZI2F03Ab+4GDEutojI9SU6g==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MAYP287MB3568.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:151::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.20; Mon, 22 Jun
 2026 06:02:24 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 06:02:24 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"luca.weiss@fairphone.com" <luca.weiss@fairphone.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Walter Werner Schneider
	<contact@schnwalter.eu>, Kate Hsuan <hpa@redhat.com>, Svyatoslav Ryhel
	<clamor95@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] media: i2c: add imx576 image sensor driver
Thread-Topic: [PATCH v2 2/3] media: i2c: add imx576 image sensor driver
Thread-Index: AQHc/+rjlKGWpG0n2UqPle5J3Ir6S7ZHcVeAgAKoCP0=
Date: Mon, 22 Jun 2026 06:02:24 +0000
Message-ID:
 <PN0P287MB20199A3EF8F3183176AC1E559AEF2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20260619125439.55311-1-himanshu.bhavani@siliconsignals.io>
 <20260619125439.55311-3-himanshu.bhavani@siliconsignals.io>
 <20260620132749.GE3552167@killaraus.ideasonboard.com>
In-Reply-To: <20260620132749.GE3552167@killaraus.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|MAYP287MB3568:EE_
x-ms-office365-filtering-correlation-id: 7ea4c027-4f25-48d2-45fa-08ded023d4f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|38070700021|18002099003|22082099003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 /NCAyhld2tXcmfGXelpUa/Xli1KyqDd8DQ3x4BPCT6gwax+uYVgbMp8M0kGee7gLcYiQetnkqAER4mw/7P0pTKxvXmNduSVEVP3Vdteg03srvxHlvEyU7gWyKTIYwgB+vTj+yl1SG5gvCQt0T3j6tZmA9lndohbOR9fxE+rNw2fCMo13izQgNz8d4BOPPcJJcDqpazpv8WXE+wSzNgrcPdaQNJM5y17M/p/N+/0wlWvx8nByCXHd7sxcKSg1lVCN3emKlCX3w8ehHMhXB0sOXBNlQcHZvSnPMUJD4oddvoZQM2sbezr5fmwBeqNtKo3VnowXmeEdoh5UqTIdOLBazR+swNWlFueFImxpPKwnZuKgBCHCZd2WghopSUEkh27sWCZirbjkf/whKJ5FGD+aDQni0FM3rQ6dDgi/lokE7r0+Jor0/HaB+QMq+/QnlW22Ht5k9uGgZIm88hiJgp/PR0hjyiJkNnvSLEzbAbvP3zqy9oACP5Jy5PvJzNKaIvtobQEiJndjj2POEYnyYtBHM6REZUcIahKrP6oq+mS/3x7Lh+1UueYQxMycpcP9R+K84UbOtIBKFVFNBnUTNlA4IRjUUu+e1b84jhfISY6bGyZlO/kaUezvS9vqBNdayy8QMCo//i+zsNBnrnJ4H2z0PUC7YR/htDbp0rYas+1CQC7KDRVRo0tOa7/zQFqizfUUfFC2HUfSU2DC4pg5oov4tOTmHOrLi/d0dyTuZJUuxf8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?f9Q3d6fbu8bI/FKiu4nfbl81REcfdI+t8cg/pD82SCOMHfthkASIPynLHV?=
 =?iso-8859-1?Q?jCYGkn1q1vvYFFBk1ptNfTcB5dvY72YWKbDSCxmbcD6akcVfnYTf2RwUi4?=
 =?iso-8859-1?Q?C82d3D6jpQ83S4eCAKVvt1ydbTgZrKXBWg98k0b2QgRntmYw3tujOXgOC5?=
 =?iso-8859-1?Q?/tXL7zbD3nlGVJUfy4Kvm9/gNr2WU1yGe/0k92rfUiRrKVwjacAFhvExFV?=
 =?iso-8859-1?Q?wXWoCAWqLt2IGthhZNB2CR2J084t8UFSQ5wR/sYzo/c1oc3d3x101BHd29?=
 =?iso-8859-1?Q?9plZezfR1pOs1QDDnxwc76OvO/CO7FY7DBjregd5DQWROhWujZQMtPRXVu?=
 =?iso-8859-1?Q?L2L4jDR8c6PAkmgKfAWpE5bYzReeu+CVXcyHXbbJIeyuZB4KplDF418Ihi?=
 =?iso-8859-1?Q?gbRpRZcl6FDGjbzeooNjaUtiD4c8wAF+FJtLVXm4AlUx7j0XzHT8F+gohY?=
 =?iso-8859-1?Q?iQFaQU5bQPrOkDndlmLnTbhcgz7/PunAmGaI/IX7I4x3njWbWa2y4522GU?=
 =?iso-8859-1?Q?YTE7bog/B1o84N5x/LIF9/03cP0G9znDVE3xt2KT8aSBVuR4R3hODXtuOh?=
 =?iso-8859-1?Q?VCvMPsE+dkFU5UwNDp8sWsRLMDntwkxjiI8mC6MwpLoQ1W70oTLF0epeVr?=
 =?iso-8859-1?Q?q3zSlICMqE/22899djKtlu3/Qt72xxm1rZBvOAvpKCNamCPwo1BuHipdwJ?=
 =?iso-8859-1?Q?WpOTHKQf5DZ+ueUeoOYIgJS4ztNCbuDr/1RyXXB5KKygA0S9KuC+Do+L4y?=
 =?iso-8859-1?Q?rz47x0MMjsIQY0a7FvE0jVti7PQsUfPJsuZhm+Sefv6NzPHtzaG5yGtF1x?=
 =?iso-8859-1?Q?dHGiL1LVdSUTjSK+a6SjfFBUNKuBG1qrXApPjzzG3gbnilBkxWbl6Parqq?=
 =?iso-8859-1?Q?2PtHKYh2M8pdwIlnRA0EdG8si7xk7sJUTNncWLwSyWGpInyTDt9JHWBlpO?=
 =?iso-8859-1?Q?lKR72lJ24EyPWGDpGMy3Yee1qcGfPu0ysV1K/7L7A+5xjquwLzGk+9SPEh?=
 =?iso-8859-1?Q?/us7+eYVQOFU+h4Yhy0zuwdB/E6g75ysKkmQ7/ohRRi7vQ9hKIMEsPkN7n?=
 =?iso-8859-1?Q?S8Yseor5yi+ZwYK4n3KIpF/4H6vQOxNfwfdQqCd1AfKuQqLHxu0Kdb+qah?=
 =?iso-8859-1?Q?Y0fxE5TQKnelDEA/xVJ6GJzJwJvPWs6vr6JHRnaElAR0QFeMznCJAx+m7J?=
 =?iso-8859-1?Q?VBIm0uCN/MSqxpm4dhYCLCDJmg/r97LSqZiUXzQWwXIH5tWqBdEupK6u9y?=
 =?iso-8859-1?Q?pp2ukYNcCwLPzZ8zNl8Olk7p89VXYOC05yhzetjewIUBL9YcMTmNJ7aPl8?=
 =?iso-8859-1?Q?XldfKfWIuVtMg/RQR6wEPZyp69i1Bf3icRWs9MfBXEFWJBMakork7K3cxl?=
 =?iso-8859-1?Q?jtzlG0QDrTWOeE0erQnQyTm9Q6pqdk9ThrVo+fCP2Ee7WBJ8afbSI4ZhHE?=
 =?iso-8859-1?Q?mawMTVzTRR78pn0RfVQ8hWSq6QsZiUcuuyNyQuwl1IkbPpm67Xr7VYBqi3?=
 =?iso-8859-1?Q?q3eY/lJ8BKJewIebBiQLMR7z3AXJjGt92CN7xuoq/7F7Rr0wu9Ivs6OSdd?=
 =?iso-8859-1?Q?Km8kbewYBQz0bdvdSaVRkoWCeLr9W8eQAUrwTaAc6rMbJT1FN5f3CwK4ql?=
 =?iso-8859-1?Q?qJoXpyps/nuOfQW5RrgS+GvgB+vxrsYs8WQxcHQ/1PJcUZA8SbLyEf1hYs?=
 =?iso-8859-1?Q?IuvjU7QhvtnOb/Zf7G6MHrac/M0x8v0QvqfpJiWf5/1Cty7gPMml9yvdip?=
 =?iso-8859-1?Q?dsnjHgMaHFn86Gf6BO2MixSmE4dLfkPLgDGtw9o7HO6nU5mu8K35yrQ1BS?=
 =?iso-8859-1?Q?wdu3NhltK9YwVKtaFUxr5kRP9lrs2H8=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea4c027-4f25-48d2-45fa-08ded023d4f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 06:02:24.7686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cVHx8cU/g/LQzaIbunhuF/KSrGverEFNc0rgDz//bHuSNnSTNhlm5VgG3v5sRNYh3XQSV6CglGQp8Uk0V9ZuxAuqljc1XM/4Mhas0IeyCmqqw/3AlgaJ9aH0O8wiDhba
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3568
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65326-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:luca.weiss@fairphone.com,m:hardevsinh.palaniya@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:elgin.perumbilly@siliconsignals.io,m:contact@schnwalter.eu,m:hpa@redhat.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[linux.intel.com,fairphone.com,siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[PN0P287MB2019.INDP287.PROD.OUTLOOK.COM:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,siliconsignals.io:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 739056ACDDA

Hi Laurent,=0A=
=0A=
>On Fri, Jun 19, 2026 at 06:24:32PM +0530, Himanshu Bhavani wrote:=0A=
>> Add a v4l2 subdevice driver for the Sony imx576 sensor.=0A=
>>=0A=
>> The Sony IMX576 image sensor with an active=0A=
>> array size of 5760 x 4312=0A=
>>=0A=
>> The following features are supported:=0A=
>> - Manual exposure an gain control support=0A=
>> - vblank/hblank control support=0A=
>> - Supported resolution: 2880 x 2156 30fps (SRGGB10)=0A=
>=0A=
>You've been asked in v1 to make this driver dynamically compute=0A=
>registers instead of hardcoding modes. Please do so in v3. Nack on v2.=0A=
=0A=
As I mentioned earlier, I don't have the full datasheet yet, so I can't imp=
lement this now.=0A=
=0A=
Link to discussion:=0A=
https://lore.kernel.org/linux-media/PN0P287MB2019AFCBDF0E24BFEF8E0E399A0F2@=
PN0P287MB2019.INDP287.PROD.OUTLOOK.COM/=0A=
=0A=
Best regards,=0A=
Himanshu=

