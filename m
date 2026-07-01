Return-Path: <linux-media+bounces-66220-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uzIwH/ELRWow5woAu9opvQ
	(envelope-from <linux-media+bounces-66220-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 14:45:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 537656ED84A
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 14:45:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=Lk1+3R1G;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66220-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66220-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA4D6307F394
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 12:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF04481FBD;
	Wed,  1 Jul 2026 12:33:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021142.outbound.protection.outlook.com [40.107.57.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85137481FA2;
	Wed,  1 Jul 2026 12:33:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909199; cv=fail; b=QnfRtiB62TWNtX0OvjDDH81cmq0cDRiMFSJq0UKU8ChDlZYzrb/oUig7Uu9b3V+N1P++6+3ogGSL/EByTaKhx1G1ux+kUiKDJ9ZOa3JcPSuEuynKym+ocL19fJTHoDNouWKS8QsRtGzgagNxHuSldVNuRArvVhxPgjZ/SKldMJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909199; c=relaxed/simple;
	bh=Z+jmY+XoTJzth9FtC80L8wex/lZQbJQflzzXv3ZnT+4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pfPU5AAv5fWRhY7enM7WFswthcRb5tB0d5v8wBHHjR38UP3NFxAs5corL64+OIHf+NqwDf6QLLDyWG8rnwfADobnbQdilrJEdXqTHcv/j+2OVXxzYnup8Xx6SgaxBQvJdjxDZBCmDq0nC+LJCmMXHUpMAwocOPCWtcZPW1hZPzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Lk1+3R1G reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.142
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNE3j/NHmS2IZcqiohzNMNQn8wO0V6d/kdCELZuRilZfKkWv65fF0OuiF75XaF0MO5mt//sAu5UPC7SoIlYfuQ15z0hbeeomTO4RwokpbOR+XmjMwpxbxVm9voxZ2mD73LM2R3KWa9myCuO6WTFZPUf+L2E3MtH4kNtviiarw8TIBfGtTbnlCJdjNyiyqcmxSVpFVYAiIUCOgvipNLEPxSSaGlpQuOphLsgJK2WbVUe63ZZquSFR0BL/o7eZuhRIFeXCIJN7gIWfqFiqDRrvF2j64cUeS/dZSVFVkDDGvnE81fAmivVVqACoR4T6V8K/AKi7RsXiqDNOP2OID94dzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPyTITHP9mYweH8AjamCleghNI25Gkp+v7AJHahoZvE=;
 b=kS5OgFZwYP5WZ7obMsK5LvA987qbuOv0ms+9wXZLEKXHs9i0HvH6ipbHTRAkkzITJ5WVQ+8HQc3d4R/a+JT+YOr94QfjmR0iq9DP5135vLvKy9EK8xF47YjOYkHzxvpwsOTmQTDLJ2e1lZgygjjMGGUJLEmiYS9cVHL35QNuYYBMRhc2rN3e4J/5zx4QlANkFtviCOwY+TjSQCRqjtKuAMRXHzwi2vJmdGFVgKcmxP7PRImermYZ+slHtqqv7LLElVHqDaS8WOyYvqMJoQE8so/O8xpGYa0vq0EcmkL0uzvwZn1V7M6oSQGNhsCjNFNUhfLoleUCMjRpvFcRum0r0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPyTITHP9mYweH8AjamCleghNI25Gkp+v7AJHahoZvE=;
 b=Lk1+3R1Guc7GFbrJWLaZDKInLCw1mMa8Oc4b3CcwqkpCAUecxi+jGebZ3tLK76AbuVgykD3chYfJ0Z2rxh+ilwTzs3yJy2T8T1xwFnuPmrSOhIxp+v6hSKc6JENmy+zm/RK1vKOhej66gjD7+ZmcGC5rO9seZ4Zd4jMTEDRIa4yE5u2MXRiDfOXvO4lzBLYibDBqn/LUw8u9xR4dg1LIdg3cWneRJCidF5WjnLrKrLg9c7qO09i7zdxkDlrn513/yKz3P4VaFK+MvyRi6FihLmQtGtaosLIY9O3FsW4KFg7qp1qVClRARG4MQ9A5lquBSnyQXEU6TsxzyQH8g+lmtw==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1550.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 12:33:13 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 12:33:13 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede
	<hansg@kernel.org>
CC: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>, Serin Yeh <serin.yeh@intel.com>,
	Damjan Georgievski <gdamjan@gmail.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, computman <anis@talbi.fr>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Scally
	<dan.scally@ideasonboard.com>, =?iso-8859-1?Q?Ilpo_J=E4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
Thread-Topic: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
Thread-Index:
 AQHdB5q8NQpQtUcMokeHZdb/BmiJ5bZWs7/NgABnEoCAARLcy4AAVS8AgAAC2ICAAAgvPg==
Date: Wed, 1 Jul 2026 12:33:12 +0000
Message-ID:
 <PN3P287MB18296E80E1786B05F5ACF37E8BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260629074026.35490-1-hpa@redhat.com>
 <20260629074026.35490-4-hpa@redhat.com>
 <PN3P287MB18292C819793395D643D426A8BF72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <49257d09-a2fd-4a9d-9479-4d2b5e0fb8a6@kernel.org>
 <PN3P287MB182945B5747452110940BEA08BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <c7634571-4682-41d5-aa9d-8b965d641d51@kernel.org>
 <akT2CSCbaR0a3BMA@kekkonen.localdomain>
In-Reply-To: <akT2CSCbaR0a3BMA@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB1550:EE_
x-ms-office365-filtering-correlation-id: f5de0ed6-af65-4814-8e04-08ded76ceade
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|38070700021|5023799004|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 XtJQzMtkZHny3AxZrMgQbmX9VjYDy7e0aNBzzaZAuhErfSQklksmSWMwC8VDISIvP1OJHrFdlcYtL7zeWCLnydcZ8LUSLcjmYPaOLfz1SPxpsJi0lQSZvz2cG6XYkNi1ItCedwMj3TVZs6J+k59L/smrS/M+Z2+cJyWtBiGfnG+c76mbEOcblyNTlgNji9SRvFKBsxZehP3lNoOYQZLrwxBwL5ut/MJ5C5b1Furgb30BUftjcJIB1t3WqO9oGyDtlBDLlXiS1YSEMALSWLNSrGygQxeAWekccXD6+GsZvDX1SqJUdH6cYN3V/9JO1YZ117D3KDukix1msfrFcQugLMcF1qBAqae1reSf+bpYXgqNMfGCjX2WLiMZijnkmyP3JTCGqjdJiXlW7rZRK4E8dKIBCzwAbve6Zep/uQuYCjIZoU6XCscsIY0PAXdZ+AiyzkSBIFg69AGdqDPZrkjDhNbvUAxKlcbjOOGYrqpvkjob4jqwaJVgRHvoFYproGl7+ZiOR1d6bVMl9yieoGqu8eFLboBFLzu9IBZbedIbzFc57tmIsRs7ClU/WsNRE5NHS/5ggIcd0tuO+3JnsYR9Kl6gDglivf0b1tXhpCKnDUtKcIdXgngf6Zx/QBY3F11kPGaLMO8KblqmyjrtPHWGSMlmOD7HXytdR4M9+TEh3mOuEbwPeerxWOoxUGt8omRTfXLm1y+T+7Si0CHg6LpCrUQChzSIypYrNZawama7nDA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(38070700021)(5023799004)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xP/3gOs2lnnSmRBsXZgduzBGR33ZEhGppxg8oh04pTNUP3+uYEKq7fWOuW?=
 =?iso-8859-1?Q?du+8GzsPPHggzLRs9oebjqwXyVeapLbd424bOkiNmPrlUSAWC+z/JmI1c/?=
 =?iso-8859-1?Q?EY9nJBIriFOcIw2w3QkYSFJrmldm2S5uV4sRNefztL/ec3PA7T3wvSU1f+?=
 =?iso-8859-1?Q?111CeuaAh0iH3UL6BcyUEKe1Vr899TP/zFLrmqVeHCBt599R8vs6CPcTot?=
 =?iso-8859-1?Q?vB3vP2ePNpIbjSaTn9M7JN4kHG+ICZI50mkV27WV23B4dB8KUqQ/+pqDUR?=
 =?iso-8859-1?Q?bBbNPsfeom6LZLntE1P91Qg5EZvyQuy0PAe6DkevVksNP/EHeAFUlYZe+1?=
 =?iso-8859-1?Q?ufCvv9pyAtW8C/MMk6FNibCdQOiqAHXUh3ggUVud20IpO7zS1p+7bTRXuh?=
 =?iso-8859-1?Q?7x29uRhRdyUEDxJFaF/6oZj9/Y+8ARMVnr2SO7tBG/5K7uFKxUbeP/+Uo9?=
 =?iso-8859-1?Q?1WEVaW+gpo0Wnkreb18pnlbYVjHDw97Gm4/q98LWdyWCrBqfP7JM3LiWkW?=
 =?iso-8859-1?Q?WCAM8afRuHxyRrUa1InGyMyxc+Gwjk8sAkUmHtkpt0TUvadM+ZyW/gjZFZ?=
 =?iso-8859-1?Q?dsWjph1QGMhnZNO5NWQGRwpHDB2NJEeaBh/DaYl9vwsUAIYxiKIarncKt1?=
 =?iso-8859-1?Q?fvfB+eHxb9UBtMCf4EscBec/Lrpm72LtyxzJ/r0VGNQFBUmgHRDScUK2kl?=
 =?iso-8859-1?Q?WvBSXdpjN4eHhG4dj9qZfp4vYLGLQcFGpm991QriR1Q8Hd8OWFCD45lXfD?=
 =?iso-8859-1?Q?kjVAT5f3afHy6KPEo+YR8ZjPIhiXhCkpKAAR7uh7rQ7BvH2BisaWeYfgol?=
 =?iso-8859-1?Q?U07nA/bXUpAsCDxL3H+Epoy2oftIjRyn+VNai1m60/J61XlnILe0YXJ74e?=
 =?iso-8859-1?Q?8tvhMfEO8E0697mJ5xO/2uyYSeW/HVsKNkuUPt7wIJ9Z3c9/9GYQwD3pag?=
 =?iso-8859-1?Q?hvzOTt7qnvTQ6gejBQtT+C1vwA8vsjysOkyb5WLCsxMjjv+KHL0VGT3M/8?=
 =?iso-8859-1?Q?5Pr7tGWYQfO7andTqANkXf1czWboIXgwRiih3xhVtEwPPa1lqaQ6OFnebt?=
 =?iso-8859-1?Q?pGdJCgvT1+uz22COrlzq2Qt2OurIZuPMK4+OEJ5Dbe7hFFSy8alyIFb4nk?=
 =?iso-8859-1?Q?PAnMC8NMwDliye/QaBSmjLqkgcrQ3XxplINVsf2GtQbXOjR/ABToWd5LLg?=
 =?iso-8859-1?Q?WiUAnnrotk3MuzaK6ZAOquhi4U9KWhdeW6uBUFPbQID73qBcY5BK4uivS3?=
 =?iso-8859-1?Q?gEQzsASqcZ4954trZYw8A2zHH/wTKSVOiGOX7uo/rS06VL7hj7vRyThrO1?=
 =?iso-8859-1?Q?jk6TLDtYY6u4M2jNfIz3SumftvQaxMjJqrXIpBsYptEFenD3JuOGmpP2ym?=
 =?iso-8859-1?Q?xjofkhUAvED9+f67hH3cSkelXK6sn5XMv3ntqClF/eMDr01beH7Q7508bi?=
 =?iso-8859-1?Q?BpwfceX8yauFsz+8lDyoB2knFf6cbexZhP+BnROs7025WrDMT9k3dyJXnK?=
 =?iso-8859-1?Q?/qoOrS+oqTCe5sTMnqXq9VneWSW+pPmnIJCOANqi4jScWgRxFfIc85u3be?=
 =?iso-8859-1?Q?4ZtgqFjzaMBWgh3MOy2aa5T0JQyT8KgUx4YZU+9crFQBUP4dOrJK5qVC4w?=
 =?iso-8859-1?Q?3luTsMGqfrqTW2shypYSyx9oBVjjeJ41hVRoZ1bqRK4yugEQI/mvGoelpZ?=
 =?iso-8859-1?Q?pKj1XTAc+e0S1IMEq/Y3FUHbWmwsWtLsdQx/TGE6Teu2DSJsnlaIgPxu9o?=
 =?iso-8859-1?Q?9oeJh+i44fazyPIv39tqe2v7+P91OYRMKb6t3aPIN9vFcjVhxVEaJLneBM?=
 =?iso-8859-1?Q?ZgIsVi0ccA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f5de0ed6-af65-4814-8e04-08ded76ceade
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 12:33:12.9744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+DGRmM4EqAPzNMXfR+F1t7GauI5ARQz5gCqU6GrCuhpcm2RhxnG2xdM8ZXHRUChCePL20rFuLAF/Hd6cEzBb6WlBS0SanZ2hFLAiIE5kkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1550
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	TAGGED_FROM(0.00)[bounces-66220-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,intel.com,gmail.com,ideasonboard.com,talbi.fr,vger.kernel.org,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:hansg@kernel.org,m:hpa@redhat.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:kieran.bingham@ideasonboard.com,m:anis@talbi.fr,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dan.scally@ideasonboard.com,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,siliconsignals.io:from_mime,siliconsignals.io:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 537656ED84A

Hi Hans, Sakari=0A=
=0A=
> On Wed, Jul 01, 2026 at 01:01:58PM +0200, Hans de Goede wrote:=0A=
> > Hi,=0A=
> >=0A=
> > On 1-Jul-26 08:19, Tarang Raval wrote:=0A=
> > > Hi Hans,=0A=
> > >=0A=
> > >> On 30-Jun-26 09:32, Tarang Raval wrote:=0A=
> > >>> Hi Kate,=0A=
> > >>>=0A=
> > >>>> Update the con_id for the Sony IMX471 sensor to "vana" to serve as=
 the=0A=
> > >>>> power enable. Additionally, the HID values SONY471A and TBE20A0, b=
oth=0A=
> > >>>> associated with the IMX471 image sensor, have been identified on L=
enovo=0A=
> > >>>> laptops.=0A=
> > >>>>=0A=
> > >>>> Signed-off-by: Kate Hsuan <hpa@redhat.com>=0A=
> > >>>=0A=
> > >>> Thanks, looks good.=0A=
> > >>>=0A=
> > >>> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > >>=0A=
> > >> Hmm, the imx471 driver is still pending upstream:=0A=
> > >>=0A=
> > >> https://lore.kernel.org/linux-media/20260629074026.35490-5-hpa@redha=
t.com/=0A=
> > >>=0A=
> > >> As part of this series.=0A=
> > >>=0A=
> > >> Please just use the standardized "avdd" in that driver instead=0A=
> > >> of "vana" (which also seems to refer to the analog supply vdd,=0A=
> > >> which is what avdd stands for).=0A=
> > >>=0A=
> > >> Then this whole patch is unnecessary and can be dropped from=0A=
> > >> this series.=0A=
> > >=0A=
> > > The regulator name "vana" comes directly from the Sony IMX471 sensor=
=0A=
> > > datasheet, which typically refers to the analog supply voltage. Using=
 the=0A=
> > > datasheet name helps keep the driver consistent with the hardware=0A=
> > > documentation and makes it easier to cross-reference.=0A=
> > >=0A=
> > > as per my understanding, the more standardized way is to use the regu=
lator=0A=
> > > name as per the sensor datasheet. Therefore, I respectfully disagree =
with=0A=
> > > your suggestion.=0A=
> >=0A=
> > As shown by the need for this patch on x86 at least because there=0A=
> > is no devicetree it greatly helps if all Linux sensor drivers use=0A=
> > standardized names for their regulators rather then using the exact nam=
e=0A=
> > from the datasheet which often is not very consistent.=0A=
> >=0A=
> > And "avdd" is the name we've standardized on for this, so lets use that=
:=0A=
> >=0A=
> > hans@shalem:~/projects/linux$ grep -l '"vana"' drivers/media/i2c/*.c | =
wc -l=0A=
> > 4=0A=
> > hans@shalem:~/projects/linux$ grep -l '"avdd"' drivers/media/i2c/*.c | =
wc -l=0A=
> > 36=0A=
> >=0A=
> > The alternative is needing to add more and more quirks as different=0A=
> > sensors are used, which is not great.=0A=
>=0A=
> I do agree that having a constant name for the regulators would be=0A=
> beneficial for the int3472 driver. Still, if, and presumably, when that=
=0A=
> sensor gets DT support, the bindings will use the regulator name from the=
=0A=
> datasheet.=0A=
>=0A=
> Let's just use the datasheet name now and add the few lines needed to the=
=0A=
> int3472 driver and avoid the churn in the future. There's a limited numbe=
r=0A=
> of sensor drivers that need this after all.=0A=
>=0A=
> I'd be more concerned of what's going on in tps68470_board_data.c for=0A=
> instance.=0A=
=0A=
I went through the INT3472 driver and would like to propose a generic     =
=0A=
approach that satisfies both sides without per-HID quirks or sensor driver=
=0A=
changes.                                                                  =
=0A=
                                                                          =
=0A=
The problem is:                                                      =0A=
 - INT3472 standardizes on "avdd" internally                             =
=0A=
 - Sony IMX sensor drivers use "vana" per datasheet, and all existing    =
=0A=
   Sony DT bindings (imx219, imx290, imx415) already use vana-supply     =
=0A=
 - Changing imx471 to "avdd" now will create inconsistency with those    =
=0A=
   bindings, or require a rename later                                   =
=0A=
                                                                          =
=0A=
Instead of fixing this per-sensor (either by changing the driver or adding=
=0A=
a per-HID entry to int3472_gpio_map), we can add a small vendor alias     =
=0A=
table inside skl_int3472_register_regulator().                            =
=0A=
                                                                          =
=0A=
Currently that function registers two consumer supply entries per sensor: =
=0A=
lowercase ("avdd") and uppercase ("AVDD"). We can extend it to also       =
=0A=
register vendor datasheet aliases from a static table, e.g.:              =
=0A=
                                                                          =
=0A=
  avdd -> vana   (Sony IMX series: imx219, imx290, imx415, imx471, ...)   =
=0A=
                                                                          =
=0A=
This way, when a sensor driver requests "vana", the regulator framework   =
=0A=
finds it in the supply map without any extra quirks.                      =
=0A=
=0A=
Best Regards,=0A=
Tarang=

