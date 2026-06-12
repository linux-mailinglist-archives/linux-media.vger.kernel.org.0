Return-Path: <linux-media+bounces-64698-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R9H7OMwVLGpqLAQAu9opvQ
	(envelope-from <linux-media+bounces-64698-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 16:21:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDD467A1EB
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 16:21:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=U8veRpzK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64698-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64698-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5A4730CD266
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 14:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B14387361;
	Fri, 12 Jun 2026 14:20:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020087.outbound.protection.outlook.com [52.101.225.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC7F389105;
	Fri, 12 Jun 2026 14:20:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274051; cv=fail; b=AAOzfMepc+AfpaS8Me6erfAvSE/5RMHVuprFTiiBldMXykp6iC6ei/Q0pBnS0rf8ORF19tXWXdo4I2v8uNFFa1xFTgwusqEHAJZPpW5QlE5+D504NMxNwoOMHQmUKbzFQLW+NziFnMpJ/DBxopJ/BFF6PkEUXz2Ore6/Z4UMk6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274051; c=relaxed/simple;
	bh=1P8gsskM+qRwQOmN7l7ZfGZEaPfK0AirJ7fqOSlayO4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tSAR1zd53h7QdZHkdnoc5bek4JnQJKciXtq2C03hZdks/1rxu7wAEsmZ0F77htk/qmaasIJdyejvf4O/22QW6NDNkbPbxrinC3nr2+nwyQgdx+YEkwOlyoJYMMgMBVfwv63JFc7CHU7tmqaIOeEKF++OmiocIfRUDg6vvy7TT1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=U8veRpzK reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.87
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rka6+XihcMBzWGFSSC22c5uhu9EW5rbNn9bz37OuK2kRqHfSLo27+7A+toOM5jeOW1ugJDp0Bh9/AcG7GSX0ZHgWjRAPkQXAyNHJ7U57y33MaLGK2cgsbADYfC4Fb4LGc68V2QTzXIDTy6ZL+IGZr+6Atm1+DD9yGzcOqJPiRaIqgpNjLtL6P9kQlAUzTWn022aef/juKD3zXT/wvH8Mdl3sYFq41WvFoCmCvjPQZ9tTHRuThWgJt2O6rbxKc4m3sttjnVlF+bL8a7fWBRxoUQ2anKSd44SfTvTgyizJWdxBSwiZr25nbULT/n7kjgKj1C8aktY8UdYGESWypVQnHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCJwqVTyDlLVTdqrfK7qGAIEBk4E96aEM+OxzGR5Pj0=;
 b=HbFybjzZWYgcE+6V1HTZJDBOeDVCYMGg+6KQ879pXUc5Zg61C3cnsDk1btNqxyi+vxdiouEwcJL89G51Ow92PY7EykqSgOTj3md9EKdpSJboz+7OpY0D2eSMD1qq5YxNhvin+XV1abMKXz3/0k1l44kDc0pwSpcJlxPsnRJlT8H99NoY/Y7AE+jkrtCP4fqBfzsGr5x2WmwxiGDLQQb6A2KBz86IeShM6WfSIuMW+vCwQ6NntgUdbPwY4RL8Dy1ZaDDq5ceZpbAOH3JKJxiy+dEvLl0Au98rqh0fm9+4Av7T4FIxI71G8qfvSstvB4h6zZQ+RreMVrWmwwARGZja9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCJwqVTyDlLVTdqrfK7qGAIEBk4E96aEM+OxzGR5Pj0=;
 b=U8veRpzKdx9xAcOKIWpfC4wo4PSq8FB7zpMzuq0nOqZbODHxPG4VqJ3bn7tuI60kjddfSSQ4fIfdxgdgY4D4oogcksy3Ia1qrzrUcJx2hdJmiFzgJKy+NfDAEdjEOwJUK0xpAuTHy1iez5AMgNium3GAUNzgG0LabWaCnkD7PY3O5uJCbnlgmQ2vzsVNy885lBiRdgnOqji9EwLo4r7iO53HtXomwoXIwjU5iBozoU/0DOvAQkDZ/y543dTQf+auM6WdlaDbKVPRqI8fDiR88uJFaIFhQnSDg02tGPMSz5S8bDLKPiZjLWH18Flcqe8nE73T+YDKsxtAYX1ZrCMPFQ==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN4P287MB5252.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:304::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 14:20:42 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 14:20:42 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans
 Verkuil <hverkuil+cisco@kernel.org>, Hans de Goede
	<johannes.goede@oss.qualcomm.com>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] media: i2c: os02g10: implement crop handling with
 set_selection
Thread-Topic: [PATCH v3 3/3] media: i2c: os02g10: implement crop handling with
 set_selection
Thread-Index: AQHc08yAQSLYRatbrUS/Khm2VQ9CG7Y7BoMAgAAClOaAACqLAIAAC4Gd
Date: Fri, 12 Jun 2026 14:20:42 +0000
Message-ID:
 <PN3P287MB1829EAFD0A6E205BBE9F93BA8B182@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-4-elgin.perumbilly@siliconsignals.io>
 <0f4bfe08-0504-48ff-83ce-c84600e6f38d@linaro.org>
 <PN3P287MB1829A38F1D7D1098CBDEC8F88B182@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <6f664514-34bf-44db-8df1-9b1a774e6367@linaro.org>
In-Reply-To: <6f664514-34bf-44db-8df1-9b1a774e6367@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN4P287MB5252:EE_
x-ms-office365-filtering-correlation-id: b06a014b-87cc-427a-88a5-08dec88dc94f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|23010399003|38070700021|18002099003|22082099003|3023799007|56012099006|4143699003;
x-microsoft-antispam-message-info:
 jObS+u73sBZG3Aeb81hHHMTUE1h4+PJN0fMsK9I23SMwpHpVcmlTEvqRtwNy+JsTQwiRIc+8+vngV/axKQ6Q5alPSJjALUVwiiQC6/Cx8we58pp5laDh2dXHO0Wtp4xSGqI0ZmCc5oyVj/kqAFN2GpIHK6vPXGUxiPOKV+ARgayYq9xW/C2Tc4mtE+qkDCOxH2nAURuzA54wr4Q2ltDu4Pvs/O/UeeOq2bTC89ZYg996S934dl8vCmUyc/mPEgl5Kj9YxmcX/kcurHvPqsxfv1G0x0jkuuuJydJkgjWaGpUe6V/yG0kp1huSn0Uz4mXJPN1RUzCpeE40kT3l+4TxNTnO/ZWau4MB2FCwJy20EkLsyx7omtt2XQZi48LGFUbX9xXaV94gXGQ8JN67F1yeRPGFageVoFiIfaBxpV0oe+6P1MRtm7mwYrZ9/pq/+wtwN+NqT08J6m7LoFxxzAbH7PJ3xl+TDkSyrW69QxuLTJI2/R9h/XlfO0x8rmdenppCU2n5NC4kQ99ZIL2J14K9qwJceheJnP4jy756aHW8M9fCAw9147D5CBEUhJqZhcdMVUQpf4dTvAJBq+s9nPm6p+IBP/NEZd5KGW3RoL//EorkbLU6rzhf1CKuIeKjnPzDMB83Nw5OxaJ9WcgAgSu2Q1D6HlzJC6cZfNixOWaSTW3s8T954F6tO8xtJHttNxtf97HS+RZ5qyJAKF7ihrOsew==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(23010399003)(38070700021)(18002099003)(22082099003)(3023799007)(56012099006)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1LOShoMDpVn+yOXaaUV7TReFqf8zpotVtLErBbt8BSL/nu4qtR0B5vULJY?=
 =?iso-8859-1?Q?kIKxONyh/qYRkcmMVM9uZ3yIoC7wa8uGQXfQpCmBJf9VsnAq8eelClxt6g?=
 =?iso-8859-1?Q?6OeSTFDT4jWZV9hXfSs16odbJ4FqiTbu2xEHX7MwfcbWk8nNiKKUcf5+bf?=
 =?iso-8859-1?Q?o1K4I5STJapVUaOe/oK2isdOrY7ZfbQKXVDrCTxPqOr2B/eOifckXV9iPt?=
 =?iso-8859-1?Q?dAtuWnOpATORGkNtXfl/TfE00D7jeJxOi573nxmRRwBDksnz7tg+gyvv7u?=
 =?iso-8859-1?Q?OMCEjrfbUcqZs8joGgPPQbHV6fLWWnkGg258Us2P1Pr1kAV871EMaP8kv+?=
 =?iso-8859-1?Q?vMspTlwWrnIK+sTSoZouVFXxMYasaSprzIwIRD+kx5tThFZqRPvBoWUw1a?=
 =?iso-8859-1?Q?7QzeydmXrzB2EOw0Z5PtQlqyvmqduaimt2AMoko/VAdMpqQHk4fy3wKnyc?=
 =?iso-8859-1?Q?v4X+MEBim0vcGihYvRGXq9uuV72RE13SxoabR0CUSbLpqJqjA8EqWkbyou?=
 =?iso-8859-1?Q?/LN1t1qPXAYSfWQuVWyNEL9xBn2QzzlCmNmNSkWw5Xrl5X1bmaZ9J9sAvN?=
 =?iso-8859-1?Q?6xhb6V7aJ5Iq0nA2dTPPa95DP9LCcDtOxilXuaIhsUku7yvc7j0lqR1Exa?=
 =?iso-8859-1?Q?tL5WTLBQDb8Ac22HgEif9PDOva8oojMCWHhV740WhiRzNE7Fh+/nXw/pwd?=
 =?iso-8859-1?Q?P4MmdqI8we0MmX4vwb7X2I97NmXZxWyZIg/WNkgfTPsRuTpKKu1jMftidG?=
 =?iso-8859-1?Q?SaFYZ/1bI28RV4TDANCRy/FImUCyyOv4lXZIfJgwTb2lC4+mrOJLz70Oui?=
 =?iso-8859-1?Q?QnbmufQDsdLkqpQgMe4ZV26/dLsvuwb1m4RmOjF6hacBizsuLBKaFDZvl5?=
 =?iso-8859-1?Q?Yzs8P6kSbhvBEMuP0RF9ecQqAckb84NmEkTn4IAmUMJCNi0heptMS/Onga?=
 =?iso-8859-1?Q?TeT02FfiZiEe7V+UrHMgrADdOmJClE+AXFd0woBHyWWzC4YCFPl7aiwxnk?=
 =?iso-8859-1?Q?alHZil3h7gL2wHqWBRD2nSy1mPgRQuEECch+WWE5OwtJvilCE2sxl50/vA?=
 =?iso-8859-1?Q?p7EX/owL5OQiuDe8P4bP/oHYYhvxgCl8mIxxpGv4hkus1EoGWfLQwTBx1n?=
 =?iso-8859-1?Q?/wPBA5jppgfzvtqtxoLNjAl3t174ctFJyApflueiP5Rd5Duodmqp5mvRkq?=
 =?iso-8859-1?Q?R7Tg2LMWz7+QuvRuN9ok87al7JJAAZuKKcTyU4E/v+DoZWr2VxL0XcJwG8?=
 =?iso-8859-1?Q?GoQ9e473s+2HILVS0z7kIFH2MKuttgCUvfrJHGL8FvBJXBSu+8YgFRtDFY?=
 =?iso-8859-1?Q?XCpbXnBUdW16JUvwm5Z+nvQjJ6pWthD3ttTz8yUMOLndar+a9u+/Uo/feF?=
 =?iso-8859-1?Q?LOM98bKQkLExNu6EGjj5+mOcfLZxN6PotVMhG0t/bSBz7bp9oCsp5PMCzT?=
 =?iso-8859-1?Q?STLx40z7fqNxnYFocRnaQ2fYMp/iL+bdq3pzxRwgXT881yx9decLOxY+KW?=
 =?iso-8859-1?Q?uPVsATftYcvfn63clYgGRYkoP8DywmxhwqvCMI1myM8h1UUng11AJsxuNl?=
 =?iso-8859-1?Q?pmgAIBaaal11fEfOk1MDXvJI/sp3aDSkfu8K/W4bG5nbsLfc24tznlIbvV?=
 =?iso-8859-1?Q?porZH80MGIChYUmNz0gbf0GAGDuBGsP91ZVoQu3Hal+svHrCMnfJkqMuD/?=
 =?iso-8859-1?Q?JG3Yqs11R+IXXgOJFHRcKeGELQnM8g+fleK5hSufXMNAYQn6/botzTK58H?=
 =?iso-8859-1?Q?bf/qkOkXY2BLeqtWKpG0GVlH69xissEuRA/9FCIFBkr3qGFyImCcFmJoIF?=
 =?iso-8859-1?Q?bN0pExIAsZcuJr0/ZvB7t+ThaP5Idper/nnzqZmdhie2KiaHL+lloUb9AC?=
 =?iso-8859-1?Q?g7?=
x-ms-exchange-antispam-messagedata-1: 1QPviKhdWUEFTvfy92s91xSa3m89Sf6TclY=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b06a014b-87cc-427a-88a5-08dec88dc94f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 14:20:42.6194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 56x72JmqCwJMXGiN+zGqe3bjrJsW+qbp+tGmAdDzgz9ksjX08KHxb44tWsyGSEzCl2hYJ6ROs2kCZdSRWnaz59DLmom4TkYLnU4Vv7NW5lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB5252
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
	TAGGED_FROM(0.00)[bounces-64698-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:elgin.perumbilly@siliconsignals.io,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:mehdi.djait@linux.intel.com,m:sylvain.petinot@foss.st.com,m:benjamin.mugnier@foss.st.com,m:bryan.odonoghue@linaro.org,m:heimir.sverrisson@gmail.com,m:hardevsinh.palaniya@siliconsignals.io,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[siliconsignals.io,ideasonboard.com,linux.intel.com,kernel.org,oss.qualcomm.com,foss.st.com,linaro.org,gmail.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CDD467A1EB

> On 6/12/26 14:41, Tarang Raval wrote:=0A=
> > Hi Vladimir,=0A=
> >=0A=
> > Thank you for the review.=0A=
> >=0A=
> > Since I authored this patch, I will try to address the comments below.=
=0A=
> >=0A=
> >> On 4/24/26 12:25, Elgin Perumbilly wrote:=0A=
> >>> From: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> >>>=0A=
> >>> Add crop support to os02g10 by implementing .set_selection() and=0A=
> >>> storing the crop rectangle in subdev state.=0A=
> >>>=0A=
> >>> Initialize the default crop to the active area, make set_fmt() use th=
e=0A=
> >>> current crop, and update the output format when the crop size changes=
.=0A=
> >>> Also program the sensor window from the active crop/format state inst=
ead=0A=
> >>> of using the fixed supported_modes entry.=0A=
> >>>=0A=
> >>> This allows userspace to configure the sensor crop window explicitly.=
=0A=
> >>>=0A=
> >>> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> >>> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=
=0A=
> >>> ---=0A=
> >>>    drivers/media/i2c/os02g10.c | 166 ++++++++++++++++++++++----------=
----=0A=
> >>>    1 file changed, 103 insertions(+), 63 deletions(-)=0A=
> >>>=0A=
> >>> diff --git a/drivers/media/i2c/os02g10.c b/drivers/media/i2c/os02g10.=
c=0A=
> >>> index fad2dd0ad7aa..9bf8f5d1caea 100644=0A=
> >>> --- a/drivers/media/i2c/os02g10.c=0A=
> >>> +++ b/drivers/media/i2c/os02g10.c=0A=
> >>> @@ -112,6 +112,11 @@=0A=
> >>>    #define OS02G10_ORIENTATION_BAYER_FIX               0x32=0A=
> >>>=0A=
> >>>    #define OS02G10_LINK_FREQ_720MHZ            (720 * HZ_PER_MHZ)=0A=
> >>> +#define OS02G10_WINDOW_WIDTH_MIN             2=0A=
> >>> +#define OS02G10_WINDOW_HEIGHT_MIN            2=0A=
> >>=0A=
> >> Add a blank line before the new group of macro.=0A=
> >>=0A=
> >>> +#define OS02G10_VBLANK_DEF                   166=0A=
> >>=0A=
> >> This one is computable, and it can be dropped.=0A=
> >=0A=
> >=0A=
> > Can you explain how this value can be computed ?=0A=
>=0A=
> It is (supported_modes[0].vts_def - supported_modes[0].height) on=0A=
> the base of 2/3 change.=0A=
=0A=
In this patch, the supported_modes structure has been removed, so the value=
=0A=
can no longer be computed in that way.=0A=
=0A=
> >>> +#define OS02G10_VBLANK_MIN                   25=0A=
> >>=0A=
> >> This macro shall be added to the group of OS02G10_REG_FRAME_LENGTH=0A=
> >> register, and it should be included into the previous change.=0A=
> >>=0A=
> >>> +#define OS02G10_EXPOSURE_DEF                 1100=0A=
> >>=0A=
> >> This macro shall be added to the group of OS02G10_REG_LONG_EXPOSURE=0A=
> >> register, and it should be included into the previous change.=0A=
> >=0A=
> >=0A=
> > I would prefer to introduce these macros here only, as they are related=
 to=0A=
> > this patch. There is no use of these macros in the previous patch, so m=
oving=0A=
> > them there would not provide any benefit.=0A=
>=0A=
> Unavoidably there shall be a user of "default exposure" in the change 2/3=
, and=0A=
> therefore the value is present, please reference to supported_modes[0].ex=
p_def.=0A=
>=0A=
> So, this macro goes to the 2/3 patch.=0A=
=0A=
In patch 2/3, the supported_modes structure is still present, so I don't=0A=
think introducing a separate macro there provides much benefit.=0A=
=0A=
Using:=0A=
=0A=
vts_def =3D height + OS02G10_VBLANK_DEF;=0A=
exp_def =3D OS02G10_VBLANK_DEF;=0A=
=0A=
doesn't look particularly readable to me either. However, I'd be interested=
=0A=
to hear your preference on this.=0A=
=0A=
> >=0A=
> > I will group them in the appropriate place within this patch as per you=
r=0A=
> > suggestion.=0A=
> >=0A=
> >=0A=
> >>>=0A=
> >>>    /* OS02G10 native and active pixel array size */=0A=
> >>>    static const struct v4l2_rect os02g10_native_area =3D {=0A=
> >>> @@ -152,15 +157,6 @@ struct os02g10 {=0A=
> >>>        struct v4l2_ctrl *hflip;=0A=
> >>>    };=0A=
> >>>=0A=
> >>> -struct os02g10_mode {=0A=
> >>> -     u32 width;=0A=
> >>> -     u32 height;=0A=
> >>> -     u32 vts_def;=0A=
> >>> -     u32 exp_def;=0A=
> >>> -     u32 x_start;=0A=
> >>> -     u32 y_start;=0A=
> >>> -};=0A=
> >>> -=0A=
> >>>    static const struct cci_reg_sequence os02g10_common_regs[] =3D {=
=0A=
> >>>        { OS02G10_REG_PLL_DIV_CTRL,             0x0a},=0A=
> >>>        { OS02G10_REG_PLL_DCTL_BIAS_CTRL,       0x04},=0A=
> >=0A=
> > ...=0A=
> >=0A=
> >>>    static const struct v4l2_subdev_video_ops os02g10_video_ops =3D {=
=0A=
> >>> @@ -645,6 +684,7 @@ static const struct v4l2_subdev_pad_ops os02g10_p=
ad_ops =3D {=0A=
> >>>        .get_fmt =3D v4l2_subdev_get_fmt,=0A=
> >>>        .set_fmt =3D os02g10_set_pad_format,=0A=
> >>>        .get_selection =3D os02g10_get_selection,=0A=
> >>> +     .set_selection =3D os02g10_set_selection,=0A=
> >>>        .enum_frame_size =3D os02g10_enum_frame_size,=0A=
> >>>        .enable_streams =3D os02g10_enable_streams,=0A=
> >>>        .disable_streams =3D os02g10_disable_streams,=0A=
> >>=0A=
> >> I understand that this change is written by another person, and likely=
=0A=
> >> it is not squashed with the previous one to preserve authorship, howev=
er=0A=
> >> it significantly rewrites the change already found in the series.=0A=
> >=0A=
> > I don't think this patch significantly rewrites the previous changes. I=
ts=0A=
> > main purpose is to introduce a crop rectangle and implement set_selecti=
on(),=0A=
> > allowing userspace to stream arbitrary resolutions within the sensor li=
mits=0A=
> > instead of being restricted to 1920x1080.=0A=
>=0A=
> What are these "sensor limits" number? Are they defined in this 3/3 chang=
e?=0A=
> For whatever reason I can't find it, but I may be blind.=0A=
=0A=
The sensor limits are defined by os02g10_active_area and enforced in=0A=
os02g10_set_selection(). The crop rectangle cannot extend beyond the=0A=
active sensor area, and the minimum crop size is also constrained in=0A=
the same function.=0A=
=0A=
+       rect.width =3D clamp_t(unsigned int, ALIGN(sel->r.width, 2),=0A=
+                            OS02G10_WINDOW_WIDTH_MIN,=0A=
+                            os02g10_active_area.width);=0A=
+       rect.height =3D clamp_t(unsigned int, ALIGN(sel->r.height, 2),=0A=
+                             OS02G10_WINDOW_HEIGHT_MIN,=0A=
+                             os02g10_active_area.height);=0A=
=0A=
> >> I don't see information about the maximum supported frame height/width=
=0A=
> >> or default VTS setting etc. anymore, for me it's hard to say, if=0A=
> >> this kind of information can be dropped with no consequences in runtim=
e.=0A=
> >=0A=
> > The maximum supported width and height are still defined and enforced i=
n=0A=
> > os02g10_set_selection(). The default VTS handling is implemented in=0A=
> > os02g10_set_pad_format(), where VBLANK is adjusted to maintain 30 fps f=
or=0A=
> > the selected resolution. So I don't believe any information has been dr=
opped.=0A=
> >=0A=
> >> Probably this 3/3 change will break a quick inclusion of the sensor=0A=
> >> driver, you may consider to exlcude it from the series now, and publis=
h=0A=
> >> it afterwards.=0A=
> >=0A=
> > Regarding whether patch 3/3 should be included in the current series, I=
 am=0A=
> > happy to leave that decision to Sakari. If needed, this patch can be me=
rged=0A=
> > separately once the new raw sensor model is finalized.=0A=
> >=0A=
> > This patch was created based on Laurent's suggestion.=0A=
> >=0A=
> > Link: https://lore.kernel.org/linux-media/20260414084952.217215-1-elgin=
.perumbilly@siliconsignals.io/T/#t=0A=
> >=0A=
>=0A=
> That's a helpful reference to the previous patch review, thank you.=0A=
> Likely I don't have the whole picture of the new advances in linux-media.=
=0A=
=0A=
No worries, and thank you for taking the time to review the series and=0A=
provide feedback.=0A=
=0A=
Best Regards,=0A=
Tarang=

