Return-Path: <linux-media+bounces-62400-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPZRB8ObDmqTAgYAu9opvQ
	(envelope-from <linux-media+bounces-62400-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 07:44:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E5259F2CA
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 07:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79CB93045DC0
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 05:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE0238E8AE;
	Thu, 21 May 2026 05:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="GaNMOiyK"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021120.outbound.protection.outlook.com [40.107.51.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5507F34CFD1;
	Thu, 21 May 2026 05:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342257; cv=fail; b=te5FzskJgqbooJ+48HsBIPfCy2iY15e+jPkT9Bvhqiv9fZpelinCNNp3CPROBhcbh9NpgzyBQtc6Rnw/ld4vTgR1M+BB6o8iEj61/o1FuE10fP/jpQ+89kk5xrdNLKZJ4X1K37Ote+QyMnOKL4gXBJxAX/JutMqsezntLD+fDJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342257; c=relaxed/simple;
	bh=u8rAoaRiBFkaQqr34vvM+VGBnIq0aRa1qyGjoGgh4xE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qUirWPx3KmgTD/Hesx9VEQXekIkCZ3q/S6i/kpgDA/d6pSJcuxEYWOVANljshLxA/yzgJM+4sMKwhNd/LS+oAOEnci/dwzuHCaL0TBQdzC37g4nOuAH3Z8FYD25PETjDYRysbRCkuw+i9iAASOMI8ISLJMGPa+o75eePLjtHHps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=GaNMOiyK; arc=fail smtp.client-ip=40.107.51.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJsOaYdN4wN/xnhCpSoCPpyFmeuYKXMiwLYNdnq38IW3SGbuYzs61QY56pHidHVyJ0O5e7zZdUfsvz0hp8DqYKRni6qIgDA08EumvsGEyzUCOdLF1g+Vzbo8R6oisZzdmq7b5Pej5f8F1tR6CzCk3ZAhAr029ETIGMswnIP9zt/D59fL7G9/6dGnh1tsl0DrQDGEel8deignMcVvbgXUnmscznOsIdG07eAcGDGHJ1Qua14DXvyaKAJwn0NiYOFjt9CpIPZhb6PdDRRLaSoi1d/I38XEPwSL8UXnYoixg7cEd+H7PrKOt0hgwO1BMmAnrOgRRDvryJFH392wJEW1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hU+ArAVDE6vQIFfCohUWiFipYAUG6UgqvmsGR/CLPw=;
 b=s7TtBrnOqFeDlT4pBlT5/8t8ae7CULkX8zPPGdU4wtcYHyUDMOmlzirNi9p2rjkNOyUMY9SItzz6SGvsCAZw0XddSrbY23syjAbjOMzg3xIklir30SJkshfUl31KIwtqZSZDKQndiZ+6/7qYJXItvEwv+QP5+9Y3dNgJuDuGGsFkf6j/A4w2TafdTgyUWTv/qMxNa11GL/Jd5/YsAjOdQ/qMTysJnkVjmmJYvy/pYClCco+AQFj648ySZN+PcqBdM+eS5zPzU1MVuF26yLobJzNwhD/62Z3uL2OK7z4oron5epQG5QsgBFrvXrYSvb0XAJRox+2OH92T95GErZBPpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hU+ArAVDE6vQIFfCohUWiFipYAUG6UgqvmsGR/CLPw=;
 b=GaNMOiyKuZbxNOJHx/fP7gAgTSrOCkSOocau6Qo37BgLNC+pWluBdUojH/86h/ZN2id9Byfb6oWclaS+Xfxh7T/nD+0xW3wKIefz+N6ijj+ZzaxdWtDiWv2AuOcSAjFwmhiJPqA4wSiTD21uePevFSnlH+d7n2AfMyVGFcCW7oTq5cPnVX7pxBzmVM9YVSRFq/WTPPq9UDj80I/DklhWt79gfTsv+OBZH+5Om50FEeh/WktqFiyX+M/Ynxwigo22E/JfDZwy1asdtT2+VrbmNSnlI81hH8pkydH8jonVaY1uG86MNLxlP2VQ69uSVUOIxDAZuRFwG9z79vQytVmmrw==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN1P287MB3648.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:257::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 05:44:09 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 05:44:09 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Hardevsinh
 Palaniya <hardevsinh.palaniya@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait
	<mehdi.djait@linux.intel.com>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Xiaolei Wang
	<xiaolei.wang@windriver.com>, Walter Werner Schneider
	<contact@schnwalter.eu>, Kate Hsuan <hpa@redhat.com>, Svyatoslav Ryhel
	<clamor95@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/3] media: i2c: add imx576 image sensor driver
Thread-Topic: [PATCH 2/3] media: i2c: add imx576 image sensor driver
Thread-Index: AQHc6E/PlSTyRCcRPE68B2vvph78QLYW2RUAgAEfyKo=
Date: Thu, 21 May 2026 05:44:09 +0000
Message-ID:
 <PN0P287MB20196A26D90DF65CF551FD359A0E2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
 <20260520115641.11729-3-himanshu.bhavani@siliconsignals.io>
 <20260520123326.GC215344@killaraus.ideasonboard.com>
In-Reply-To: <20260520123326.GC215344@killaraus.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|PN1P287MB3648:EE_
x-ms-office365-filtering-correlation-id: 47e64db8-391d-4b0e-9eba-08deb6fbfadc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021|4143699003|56012099003|22082099003|18002099003|3023799007|6133799003;
x-microsoft-antispam-message-info:
 dmjSp9rJQ+y4K3nL72dKSjSUKl//pPlPXcd3ODXoolzNtWe6c4mKu4pHcY4/GNFC0p5eTc06dGF6fHc48hSf6dJ2FpdAT1TfMJJ1tCF4stZBkb8KVmen8a66RfEx98+TGwfLq/mzh3U4O8/zrP+JBl0NXtSmHxaUxrmGTiwotHRlxw095M0o+lvLx4MD1Ev6X5X7jeHk7zhLkBN3CZB4OqMqa2ypchZ8hlBUW3XX48bxROfz+e2+inUXECCUI42aLs838e2THMin84yC1b476BglaMXRGMJZV3e8L1ErTQ4gVcp1CcP0fosqrB3VR24o5fi2ExwqIK7TJprgbNxewEPlxwtOmTFBfA2wMFafWVB8Q9KJVIpkdZIq48EhIYg+r7f9e4MgcYj5S18JVMBKOueVRRNmWaXkGXwubAhQgePQeG0eQxroR0OcC8agQXrbY6Dk1XBzqgInc7Z7gT5bPLyU9l845VQQ2B6ai29lSEsN+0Z97Qls5e1ypOrNbJQQuOidhW1jSnZrXphGqQ2rB2xluEpH1NXEtQc0+uPpxfl1sG382hN0Oq4BLQ4cpxfW8PrLnb5hu0wFdDqiIk4Aj67t9rllvri+56MS+uxfZ7Oxf/XJg3P3PcjH2PZKezfM5eDDYWkEtr61g5ZZU/WMMG1xGDIXHhhsoWFbioOfNc2M3VAD0dH86BsQc+SzhHhd2jieZRYV9dh5mmK8uwLf10FkE5LalDyQ1m/CUm4pIq+/ThIYvybScfzrT6HOx9bL
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021)(4143699003)(56012099003)(22082099003)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OAmVQw3elgT5u+x28Gx3U51SuGUBNcRQr2yxJO4fLlZgYt8T98Bl1W3Uhk?=
 =?iso-8859-1?Q?V+ipTsQ/adzMSVHgYu8YcOoxpNIb0zo/oG73FyEmj4nZNv2iOzR2srTtv+?=
 =?iso-8859-1?Q?Mdwdg8VlPDHyX0CJk6+mlPa3oVnp1NgxlhB7MEax8FI61tHvG97icZv3oJ?=
 =?iso-8859-1?Q?XYwaPZGcQftnOkQx+bHpWI+wV97mELzny7ani8qZaKrpmalW2lmFOuOv79?=
 =?iso-8859-1?Q?8TWtg26L0rgUa6KMKQgLz7LoKfoQuYw4xeaFd1RGWaJtEyeLniiAvZRk60?=
 =?iso-8859-1?Q?or6Hig03sBG+dmp6FYt37bFSuTW4PcKdMY37i0vyooaF5g5Gs+wfmZn3ym?=
 =?iso-8859-1?Q?jstLv+4xkGLcLH8HQ4kf8YpH/HgPP4u0AeuCAhxBVoCYUkN4sdcRGUeU/k?=
 =?iso-8859-1?Q?kEksjALDeQRn57fpjXBiLCai2fC/madg4HPbh2hWkARvHx+3ZMSmVyD9Tv?=
 =?iso-8859-1?Q?8GMRSN026y0ewYq/v88ykUD+tQ5FVKXqYDfrPb5gGA/EJpAre0mUP/Kt/0?=
 =?iso-8859-1?Q?4MgVJfz78U729nR2PLXjwJHh1lnyO5Yclz/vuwlwX+/w/2Hvi6TqRQTmHq?=
 =?iso-8859-1?Q?r4iq1bNcjPb4vpFeMN7PGVNzPEUaa8dfU7ONh6qG8ahWhBwiaqDzsLTb9D?=
 =?iso-8859-1?Q?bzDzJz21IGnE9Fd4bSsuZ7G+/r3zgSSEETpoR+bhovhmtFlUSIooijlPxD?=
 =?iso-8859-1?Q?aMipUcldn4Mch2qJ5hyDwS8vJgGTs2iajN/6pEJS0YGC+Hx3bqn6vzLPus?=
 =?iso-8859-1?Q?ZiEtlRUJ3ymIBrMrbdpxWncMqmjTu5dT3n7igKDFyzTR4fwp+hNs1nFvBz?=
 =?iso-8859-1?Q?uqZbmCT6daWfDLSuTRMI9u148o/bW+v0gXDRt3Vz5/iLWfk+Nv9Ffb8Utb?=
 =?iso-8859-1?Q?2rIzwEPx+Xt5pbyUbCNz9azbtVoPpbiRpC+WRAcE2gyigqrsB4tHG5Hbrt?=
 =?iso-8859-1?Q?tNm8RfD9vJY1yV3LBIjnEDz6aHkW3UVyeDOpdgLeCQVSW3csACxuxn+dFq?=
 =?iso-8859-1?Q?p9vfNj5r+7ubjQtZc6rms2HP5faWah2WDG3VH+GpJmHSf7uWd2Xr0GvEaa?=
 =?iso-8859-1?Q?AS3uD2Vjaqru6MqbL23nr919CDGnLIaP8xXVuWPWLZKLL7E+wLNMIdCHz7?=
 =?iso-8859-1?Q?oK0yHFp0hgWtBwA2nAW20HhinxEFRim4FggeFoyQIkWIURXAPkauvQA9zU?=
 =?iso-8859-1?Q?uQEWU7tVHBQApa8GOsycXFGRhp9uJ9rWEacP4mH1uWt0ZzG6cYJ0MdIwej?=
 =?iso-8859-1?Q?t+vj7UzC6ygfVcj/Bg9vlEowz+gri0jAeqwqEqlOkFkaVcGzDaMeTtyEBK?=
 =?iso-8859-1?Q?0Qlxb+1NA2JalJRoMYQ1ja4mX6geyi3WX5kYXomdMkdwS2Kq/X9OUJEGc2?=
 =?iso-8859-1?Q?ZKsPihDFw3MFhJi+/qTmlfq8Np2xwE6zbgHF0PM0EnmmMccdmtMPuICC6s?=
 =?iso-8859-1?Q?TvJwj8x0T4wGI4lmi2ciLzvE10cePMoS85M++P/y7AsUUX4A7AFhwWFJ3l?=
 =?iso-8859-1?Q?8VjJLUY410RJe66aRuL76nmidZeJwsp0NjIhFK3KCQWmm7TAmD3kE7wN1O?=
 =?iso-8859-1?Q?xhJKS0921PmcwAH3J9ftMpqq9jXxEpOR4+s6MtIACH5YpnmgGaEi7Nvyip?=
 =?iso-8859-1?Q?ZnH2GLLdtOGdTSwWbZUzshLHV/SbfxshBNcC+5f6DhzMDxyaRGV3CAvbNZ?=
 =?iso-8859-1?Q?an0Z4PRn8EYeM8RnBkzin4YJZ1OfuSac9enjWOWAEq3IJVEuMHIrR0LtaR?=
 =?iso-8859-1?Q?UbJuBKntRTcF9EOennV3FVCh2iLzOIpTJCRm+8l4ns+eD4xSKL5AMHv4TO?=
 =?iso-8859-1?Q?gD4vwDCSNpO/SRkdgcp5F14rj0RVYk8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e64db8-391d-4b0e-9eba-08deb6fbfadc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 05:44:09.3800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tk2qnq3Oft2op9Aw/uc72Url3E0HplVc4BTjcRtOH99Nmlu+opL8j0btwY7hnBsATdQ1BRcDLPheazncb0rM0YnP2xKlxdRc8qNjzOIhVUvsRJLPF4NKoxjuD07LChZC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3648
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62400-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,windriver.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,siliconsignals.io:email,siliconsignals.io:dkim]
X-Rspamd-Queue-Id: 85E5259F2CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,=0A=
=0A=
>On Wed, May 20, 2026 at 05:26:34PM +0530, Himanshu Bhavani wrote:=0A=
>> Add a v4l2 subdevice driver for the Sony imx576 sensor.=0A=
>>=0A=
>> The Sony IMX576 image sensor with an active=0A=
>> array size of 5760 x 4312=0A=
>>=0A=
>> The following features are supported:=0A=
>> - Manual exposure an gain control support=0A=
>> - vblank/hblank control support=0A=
>> - Supported resolution: 2880 x 2156 30fps (SRGGB10)=0A=
>>=0A=
>> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
>> ---=0A=
>>  MAINTAINERS                |    1 +=0A=
>>  drivers/media/i2c/Kconfig  |   10 +=0A=
>>  drivers/media/i2c/Makefile |    1 +=0A=
>>  drivers/media/i2c/imx576.c | 1029 ++++++++++++++++++++++++++++++++++++=
=0A=
>>  4 files changed, 1041 insertions(+)=0A=
>>  create mode 100644 drivers/media/i2c/imx576.c=0A=
>>=0A=
>> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
>> index 1b15fa355e8b..768a1eb3627a 100644=0A=
>> --- a/MAINTAINERS=0A=
>> +++ b/MAINTAINERS=0A=
>> @@ -24862,6 +24862,7 @@ M:	Hardevsinh Palaniya <hardevsinh.palaniya@sili=
consignals.io>=0A=
>>  L:	linux-media@vger.kernel.org=0A=
>>  S:	Maintained=0A=
>>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml=0A=
>> +F:	drivers/media/i2c/imx576.c=0A=
>>=0A=
>>  SONY MEMORYSTICK SUBSYSTEM=0A=
>>  M:	Maxim Levitsky <maximlevitsky@gmail.com>=0A=
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig=0A=
>> index fc2954098eaf..05d1e69c2f33 100644=0A=
>> --- a/drivers/media/i2c/Kconfig=0A=
>> +++ b/drivers/media/i2c/Kconfig=0A=
>> @@ -288,6 +288,16 @@ config VIDEO_IMX415=0A=
>>  	  To compile this driver as a module, choose M here: the=0A=
>>  	  module will be called imx415.=0A=
>>=0A=
>> +config VIDEO_IMX576=0A=
>> +        tristate "Sony IMX576 sensor support"=0A=
>> +        select V4L2_CCI_I2C=0A=
>> +        help=0A=
>> +          This is a Video4Linux2 sensor driver for the Sony=0A=
>> +          IMX576 camera.=0A=
>> +=0A=
>> +          To compile this driver as a module, choose M here: the=0A=
>> +          module will be called imx576.=0A=
>> +=0A=
>>  config VIDEO_MAX9271_LIB=0A=
>>  	tristate=0A=
>>=0A=
>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile=0A=
>> index 90b276a7417a..e96c083e03d9 100644=0A=
>> --- a/drivers/media/i2c/Makefile=0A=
>> +++ b/drivers/media/i2c/Makefile=0A=
>> @@ -61,6 +61,7 @@ obj-$(CONFIG_VIDEO_IMX335) +=3D imx335.o=0A=
>>  obj-$(CONFIG_VIDEO_IMX355) +=3D imx355.o=0A=
>>  obj-$(CONFIG_VIDEO_IMX412) +=3D imx412.o=0A=
>>  obj-$(CONFIG_VIDEO_IMX415) +=3D imx415.o=0A=
>> +obj-$(CONFIG_VIDEO_IMX576) +=3D imx576.o=0A=
>>  obj-$(CONFIG_VIDEO_IR_I2C) +=3D ir-kbd-i2c.o=0A=
>>  obj-$(CONFIG_VIDEO_ISL7998X) +=3D isl7998x.o=0A=
>>  obj-$(CONFIG_VIDEO_KS0127) +=3D ks0127.o=0A=
>> diff --git a/drivers/media/i2c/imx576.c b/drivers/media/i2c/imx576.c=0A=
>> new file mode 100644=0A=
>> index 000000000000..910cbcfb6031=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/media/i2c/imx576.c=0A=
>> @@ -0,0 +1,1029 @@=0A=
>> +// SPDX-License-Identifier: GPL-2.0-only=0A=
>> +/*=0A=
>> + * V4L2 Support for the IMX576=0A=
>> + *=0A=
>> + * Copyright (C) 2026 Silicon Signals Pvt. Ltd.=0A=
>> + *=0A=
>> + * Copyright (C) 2024 Luca Weiss <luca.weiss@fairphone.com>=0A=
>> + */=0A=
>> +=0A=
>> +#include <linux/array_size.h>=0A=
>> +#include <linux/bitops.h>=0A=
>> +#include <linux/clk.h>=0A=
>> +#incluLaurentde <linux/container_of.h>=0A=
>> +#include <linux/delay.h>=0A=
>> +#include <linux/device/devres.h>=0A=
>> +#include <linux/err.h>=0A=
>> +#include <linux/gpio/consumer.h>=0A=
>> +#include <linux/i2c.h>=0A=
>> +#include <linux/module.h>=0A=
>> +#include <linux/pm_runtime.h>=0A=
>> +#include <linux/regulator/consumer.h>=0A=
>> +#include <linux/types.h>=0A=
>> +#include <linux/time.h>=0A=
>> +#include <linux/units.h>=0A=
>> +=0A=
>> +#include <media/v4l2-cci.h>=0A=
>> +#include <media/v4l2-ctrls.h>=0A=
>> +#include <media/v4l2-device.h>=0A=
>> +#include <media/v4l2-fwnode.h>=0A=
>> +#include <media/v4l2-mediabus.h>=0A=
>> +=0A=
>> +#define IMX576_INCLK_RATE		(24 * HZ_PER_MHZ)=0A=
>> +=0A=
>> +#define IMX576_REG_CHIP_ID		CCI_REG16(0x0016)=0A=
>> +#define IMX576_CHIP_ID			0x0576=0A=
>> +=0A=
>> +#define IMX576_REG_MODE_SELECT		CCI_REG8(0x0100)=0A=
>> +#define IMX576_MODE_STANDBY		0x00=0A=
>> +#define IMX576_MODE_STREAMING		0x01=0A=
>> +=0A=
>> +#define IMX576_REG_HOLD			CCI_REG8(0x0104)=0A=
>> +=0A=
>> +#define IMX576_REG_EXPOSURE		CCI_REG16(0x0202)=0A=
>> +#define IMX576_EXPOSURE_MIN		8=0A=
>> +#define IMX576_EXPOSURE_OFFSET		22=0A=
>> +#define IMX576_EXPOSURE_STEP		1=0A=
>> +#define IMX576_EXPOSURE_DEFAULT		0x0648=0A=
>> +=0A=
>> +#define IMX576_REG_ANALOG_GAIN		CCI_REG16(0x0204)=0A=
>> +#define IMX576_ANA_GAIN_MIN		0=0A=
>> +#define IMX576_ANA_GAIN_MAX		978=0A=
>> +#define IMX576_ANA_GAIN_STEP		1=0A=
>> +#define IMX576_ANA_GAIN_DEFAULT		0=0A=
>> +=0A=
>> +#define IMX576_REG_VTS			CCI_REG16(0x0340)=0A=
>> +#define IMX576_REG_HTS			CCI_REG16(0x0342)=0A=
>> +=0A=
>> +/* FIXME: Exact VBLANK limit unknown (no datasheet). */=0A=
>> +#define IMX576_VBLANK_MAX		32420=0A=
>> +=0A=
>> +#define IMX576_LINK_FREQ_600MHZ		(600 * HZ_PER_MHZ)=0A=
>> +#define IMX576_NUM_DATA_LANES		4=0A=
>> +=0A=
>> +/* IMX576 native and active pixel array size */=0A=
>> +static const struct v4l2_rect imx576_native_area =3D {=0A=
>> +	.top =3D 0,=0A=
>> +	.left =3D 0,=0A=
>> +	.width =3D 5792,=0A=
>> +	.height =3D 4464,=0A=
>> +};=0A=
>> +=0A=
>> +static const struct v4l2_rect imx576_active_area =3D {=0A=
>> +	.top =3D 136,=0A=
>> +	.left =3D 16,=0A=
>> +	.width =3D 5760,=0A=
>> +	.height =3D 4312,=0A=
>> +};=0A=
>> +=0A=
>> +static const char * const imx576_supply_names[] =3D {=0A=
>> +	"avdd",		/* Analog power */=0A=
>> +	"dovdd",	/* Digital I/O power */=0A=
>> +	"dvdd",		/* Digital core power */=0A=
>> +};=0A=
>> +=0A=
>> +static const struct cci_reg_sequence imx576_common_regs[] =3D {=0A=
>> +	{ CCI_REG8(0x0136), 0x18 },=0A=
>> +	{ CCI_REG8(0x0137), 0x00 },=0A=
>> +	{ CCI_REG8(0x3c7e), 0x05 },=0A=
>> +	{ CCI_REG8(0x3c7f), 0x07 },=0A=
>> +	{ CCI_REG8(0x380d), 0x80 },=0A=
>> +	{ CCI_REG8(0x3c00), 0x1a },=0A=
>> +	{ CCI_REG8(0x3c01), 0x1a },=0A=
>> +	{ CCI_REG8(0x3c02), 0x1a },=0A=
>> +	{ CCI_REG8(0x3c03), 0x1a },=0A=
>> +	{ CCI_REG8(0x3c04), 0x1a },=0A=
>> +	{ CCI_REG8(0x3c05), 0x01 },=0A=
>> +	{ CCI_REG8(0x3c08), 0xff },=0A=
>> +	{ CCI_REG8(0x3c09), 0xff },=0A=
>> +	{ CCI_REG8(0x3c0a), 0x01 },=0A=
>> +	{ CCI_REG8(0x3c0d), 0xff },=0A=
>> +	{ CCI_REG8(0x3c0e), 0xff },=0A=
>> +	{ CCI_REG8(0x3c0f), 0x20 },=0A=
>> +	{ CCI_REG8(0x3f89), 0x01 },=0A=
>> +	{ CCI_REG8(0x4b8e), 0x18 },=0A=
>> +	{ CCI_REG8(0x4b8f), 0x10 },=0A=
>> +	{ CCI_REG8(0x4ba8), 0x08 },=0A=
>> +	{ CCI_REG8(0x4baa), 0x08 },=0A=
>> +	{ CCI_REG8(0x4bab), 0x08 },=0A=
>> +	{ CCI_REG8(0x4bc9), 0x10 },=0A=
>> +	{ CCI_REG8(0x5511), 0x01 },=0A=
>> +	{ CCI_REG8(0x560b), 0x5b },=0A=
>> +	{ CCI_REG8(0x56a7), 0x60 },=0A=
>> +	{ CCI_REG8(0x5b3b), 0x60 },=0A=
>> +	{ CCI_REG8(0x5ba7), 0x60 },=0A=
>> +	{ CCI_REG8(0x6002), 0x00 },=0A=
>> +	{ CCI_REG8(0x6014), 0x01 },=0A=
>> +	{ CCI_REG8(0x6118), 0x0a },=0A=
>> +	{ CCI_REG8(0x6122), 0x0a },=0A=
>> +	{ CCI_REG8(0x6128), 0x0a },=0A=
>> +	{ CCI_REG8(0x6132), 0x0a },=0A=
>> +	{ CCI_REG8(0x6138), 0x0a },=0A=
>> +	{ CCI_REG8(0x6142), 0x0a },=0A=
>> +	{ CCI_REG8(0x6148), 0x0a },=0A=
>> +	{ CCI_REG8(0x6152), 0x0a },=0A=
>> +	{ CCI_REG8(0x617b), 0x04 },=0A=
>> +	{ CCI_REG8(0x617e), 0x04 },=0A=
>> +	{ CCI_REG8(0x6187), 0x04 },=0A=
>> +	{ CCI_REG8(0x618a), 0x04 },=0A=
>> +	{ CCI_REG8(0x6193), 0x04 },=0A=
>> +	{ CCI_REG8(0x6196), 0x04 },=0A=
>> +	{ CCI_REG8(0x619f), 0x04 },=0A=
>> +	{ CCI_REG8(0x61a2), 0x04 },=0A=
>> +	{ CCI_REG8(0x61ab), 0x04 },=0A=
>> +	{ CCI_REG8(0x61ae), 0x04 },=0A=
>> +	{ CCI_REG8(0x61b7), 0x04 },=0A=
>> +	{ CCI_REG8(0x61ba), 0x04 },=0A=
>> +	{ CCI_REG8(0x61c3), 0x04 },=0A=
>> +	{ CCI_REG8(0x61c6), 0x04 },=0A=
>> +	{ CCI_REG8(0x61cf), 0x04 },=0A=
>> +	{ CCI_REG8(0x61d2), 0x04 },=0A=
>> +	{ CCI_REG8(0x61db), 0x04 },=0A=
>> +	{ CCI_REG8(0x61de), 0x04 },=0A=
>> +	{ CCI_REG8(0x61e7), 0x04 },=0A=
>> +	{ CCI_REG8(0x61ea), 0x04 },=0A=
>> +	{ CCI_REG8(0x61f3), 0x04 },=0A=
>> +	{ CCI_REG8(0x61f6), 0x04 },=0A=
>> +	{ CCI_REG8(0x61ff), 0x04 },=0A=
>> +	{ CCI_REG8(0x6202), 0x04 },=0A=
>> +	{ CCI_REG8(0x620b), 0x04 },=0A=
>> +	{ CCI_REG8(0x620e), 0x04 },=0A=
>> +	{ CCI_REG8(0x6217), 0x04 },=0A=
>> +	{ CCI_REG8(0x621a), 0x04 },=0A=
>> +	{ CCI_REG8(0x6223), 0x04 },=0A=
>> +	{ CCI_REG8(0x6226), 0x04 },=0A=
>> +	{ CCI_REG8(0x6b0b), 0x02 },=0A=
>> +	{ CCI_REG8(0x6b0c), 0x01 },=0A=
>> +	{ CCI_REG8(0x6b0d), 0x05 },=0A=
>> +	{ CCI_REG8(0x6b0f), 0x04 },=0A=
>> +	{ CCI_REG8(0x6b10), 0x02 },=0A=
>> +	{ CCI_REG8(0x6b11), 0x06 },=0A=
>> +	{ CCI_REG8(0x6b12), 0x03 },=0A=
>> +	{ CCI_REG8(0x6b13), 0x07 },=0A=
>> +	{ CCI_REG8(0x6b14), 0x0d },=0A=
>> +	{ CCI_REG8(0x6b15), 0x09 },=0A=
>> +	{ CCI_REG8(0x6b16), 0x0c },=0A=
>> +	{ CCI_REG8(0x6b17), 0x08 },=0A=
>> +	{ CCI_REG8(0x6b18), 0x0e },=0A=
>> +	{ CCI_REG8(0x6b19), 0x0a },=0A=
>> +	{ CCI_REG8(0x6b1a), 0x0f },=0A=
>> +	{ CCI_REG8(0x6b1b), 0x0b },=0A=
>> +	{ CCI_REG8(0x6b1c), 0x01 },=0A=
>> +	{ CCI_REG8(0x6b1d), 0x05 },=0A=
>> +	{ CCI_REG8(0x6b1f), 0x04 },=0A=
>> +	{ CCI_REG8(0x6b20), 0x02 },=0A=
>> +	{ CCI_REG8(0x6b21), 0x06 },=0A=
>> +	{ CCI_REG8(0x6b22), 0x03 },=0A=
>> +	{ CCI_REG8(0x6b23), 0x07 },=0A=
>> +	{ CCI_REG8(0x6b24), 0x0d },=0A=
>> +	{ CCI_REG8(0x6b25), 0x09 },=0A=
>> +	{ CCI_REG8(0x6b26), 0x0c },=0A=
>> +	{ CCI_REG8(0x6b27), 0x08 },=0A=
>> +	{ CCI_REG8(0x6b28), 0x0e },=0A=
>> +	{ CCI_REG8(0x6b29), 0x0a },=0A=
>> +	{ CCI_REG8(0x6b2a), 0x0f },=0A=
>> +	{ CCI_REG8(0x6b2b), 0x0b },=0A=
>> +	{ CCI_REG8(0x7948), 0x01 },=0A=
>> +	{ CCI_REG8(0x7949), 0x06 },=0A=
>> +	{ CCI_REG8(0x794b), 0x04 },=0A=
>> +	{ CCI_REG8(0x794c), 0x04 },=0A=
>> +	{ CCI_REG8(0x794d), 0x3a },=0A=
>> +	{ CCI_REG8(0x7951), 0x00 },=0A=
>> +	{ CCI_REG8(0x7952), 0x01 },=0A=
>> +	{ CCI_REG8(0x7955), 0x00 },=0A=
>> +	{ CCI_REG8(0x9004), 0x10 },=0A=
>> +	{ CCI_REG8(0x9200), 0xa0 },=0A=
>> +	{ CCI_REG8(0x9201), 0xa7 },=0A=
>> +	{ CCI_REG8(0x9202), 0xa0 },=0A=
>> +	{ CCI_REG8(0x9203), 0xaa },=0A=
>> +	{ CCI_REG8(0x9204), 0xa0 },=0A=
>> +	{ CCI_REG8(0x9205), 0xad },=0A=
>> +	{ CCI_REG8(0x9206), 0xa0 },=0A=
>> +	{ CCI_REG8(0x9207), 0xb0 },=0A=
>> +	{ CCI_REG8(0x9208), 0xa0 },=0A=
>> +	{ CCI_REG8(0x9209), 0xb3 },=0A=
>> +	{ CCI_REG8(0x920a), 0xb7 },=0A=
>> +	{ CCI_REG8(0x920b), 0x34 },=0A=
>> +	{ CCI_REG8(0x920c), 0xb7 },=0A=
>> +	{ CCI_REG8(0x920d), 0x36 },=0A=
>> +	{ CCI_REG8(0x920e), 0xb7 },=0A=
>> +	{ CCI_REG8(0x920f), 0x37 },=0A=
>> +	{ CCI_REG8(0x9210), 0xb7 },=0A=
>> +	{ CCI_REG8(0x9211), 0x38 },=0A=
>> +	{ CCI_REG8(0x9212), 0xb7 },=0A=
>> +	{ CCI_REG8(0x9213), 0x39 },=0A=
>> +	{ CCI_REG8(0x9214), 0xb7 },=0A=
>> +	{ CCI_REG8(0x9215), 0x3a },=0A=
>> +	{ CCI_REG8(0x9216), 0xb7 },=0A=
>> +	{ CCI_REG8(0x9217), 0x3c },=0A=
>> +	{ CCI_REG8(0x9218), 0xb7 },=0A=
>> +	{ CCI_REG8(0x9219), 0x3d },=0A=
>> +	{ CCI_REG8(0x921a), 0xb7 },=0A=
>> +	{ CCI_REG8(0x921b), 0x3e },=0A=
>> +	{ CCI_REG8(0x921c), 0xb7 },=0A=
>> +	{ CCI_REG8(0x921d), 0x3f },=0A=
>> +	{ CCI_REG8(0x921e), 0x7f },=0A=
>> +	{ CCI_REG8(0x921f), 0x77 },=0A=
>> +	{ CCI_REG8(0x99af), 0x0f },=0A=
>> +	{ CCI_REG8(0x99b0), 0x0f },=0A=
>> +	{ CCI_REG8(0x99b1), 0x0f },=0A=
>> +	{ CCI_REG8(0x99b2), 0x0f },=0A=
>> +	{ CCI_REG8(0x99b3), 0x0f },=0A=
>> +	{ CCI_REG8(0x99e1), 0x0f },=0A=
>> +	{ CCI_REG8(0x99e2), 0x0f },=0A=
>> +	{ CCI_REG8(0x99e3), 0x0f },=0A=
>> +	{ CCI_REG8(0x99e4), 0x0f },=0A=
>> +	{ CCI_REG8(0x99e5), 0x0f },=0A=
>> +	{ CCI_REG8(0x99e6), 0x0f },=0A=
>> +	{ CCI_REG8(0x99e7), 0x0f },=0A=
>> +	{ CCI_REG8(0x99e8), 0x0f },=0A=
>> +	{ CCI_REG8(0x99e9), 0x0f },=0A=
>> +	{ CCI_REG8(0x99ea), 0x0f },=0A=
>> +	{ CCI_REG8(0xe286), 0x31 },=0A=
>> +	{ CCI_REG8(0xe2a6), 0x32 },=0A=
>> +	{ CCI_REG8(0xe2c6), 0x33 },=0A=
>> +	{ CCI_REG8(0x4038), 0x00 },=0A=
>> +	{ CCI_REG8(0x9856), 0xa0 },=0A=
>> +	{ CCI_REG8(0x9857), 0x78 },=0A=
>> +	{ CCI_REG8(0x9858), 0x64 },=0A=
>> +	{ CCI_REG8(0x986e), 0x64 },=0A=
>> +	{ CCI_REG8(0x9870), 0x3c },=0A=
>> +	{ CCI_REG8(0x993a), 0x0e },=0A=
>> +	{ CCI_REG8(0x993b), 0x0e },=0A=
>> +	{ CCI_REG8(0x9953), 0x08 },=0A=
>> +	{ CCI_REG8(0x9954), 0x08 },=0A=
>> +	{ CCI_REG8(0x996b), 0x0f },=0A=
>> +	{ CCI_REG8(0x996d), 0x0f },=0A=
>> +	{ CCI_REG8(0x996f), 0x0f },=0A=
>> +	{ CCI_REG8(0x998e), 0x0f },=0A=
>> +	{ CCI_REG8(0xa101), 0x01 },=0A=
>> +	{ CCI_REG8(0xa103), 0x01 },=0A=
>> +	{ CCI_REG8(0xa105), 0x01 },=0A=
>> +	{ CCI_REG8(0xa107), 0x01 },=0A=
>> +	{ CCI_REG8(0xa109), 0x01 },=0A=
>> +	{ CCI_REG8(0xa10b), 0x01 },=0A=
>> +	{ CCI_REG8(0xa10d), 0x01 },=0A=
>> +	{ CCI_REG8(0xa10f), 0x01 },=0A=
>> +	{ CCI_REG8(0xa111), 0x01 },=0A=
>> +	{ CCI_REG8(0xa113), 0x01 },=0A=
>> +	{ CCI_REG8(0xa115), 0x01 },=0A=
>> +	{ CCI_REG8(0xa117), 0x01 },=0A=
>> +	{ CCI_REG8(0xa119), 0x01 },=0A=
>> +	{ CCI_REG8(0xa11b), 0x01 },=0A=
>> +	{ CCI_REG8(0xa11d), 0x01 },=0A=
>> +	{ CCI_REG8(0xaa58), 0x00 },=0A=
>> +	{ CCI_REG8(0xaa59), 0x01 },=0A=
>> +	{ CCI_REG8(0xab03), 0x10 },=0A=
>> +	{ CCI_REG8(0xab04), 0x10 },=0A=
>> +	{ CCI_REG8(0xab05), 0x10 },=0A=
>> +	{ CCI_REG8(0xad6a), 0x03 },=0A=
>> +	{ CCI_REG8(0xad6b), 0xff },=0A=
>> +	{ CCI_REG8(0xad77), 0x00 },=0A=
>> +	{ CCI_REG8(0xad82), 0x03 },=0A=
>> +	{ CCI_REG8(0xad83), 0xff },=0A=
>> +	{ CCI_REG8(0xae06), 0x04 },=0A=
>> +	{ CCI_REG8(0xae07), 0x16 },=0A=
>> +	{ CCI_REG8(0xae08), 0xff },=0A=
>> +	{ CCI_REG8(0xae09), 0x04 },=0A=
>> +	{ CCI_REG8(0xae0a), 0x16 },=0A=
>> +	{ CCI_REG8(0xae0b), 0xff },=0A=
>> +	{ CCI_REG8(0xaf01), 0x04 },=0A=
>> +	{ CCI_REG8(0xaf03), 0x0a },=0A=
>> +	{ CCI_REG8(0xaf05), 0x18 },=0A=
>> +	{ CCI_REG8(0xb048), 0x0a },=0A=
>> +};=0A=
>> +=0A=
>> +static const struct cci_reg_sequence mode_2880x2156_regs[] =3D {=0A=
>> +	{ CCI_REG8(0x0112), 0x0a },=0A=
>> +	{ CCI_REG8(0x0113), 0x0a },=0A=
>> +	{ CCI_REG8(0x0114), 0x03 },=0A=
>> +	{ CCI_REG8(0x0342), 0x0c },=0A=
>> +	{ CCI_REG8(0x0343), 0x5d },=0A=
>> +	{ CCI_REG8(0x0344), 0x00 },=0A=
>> +	{ CCI_REG8(0x0345), 0x00 },=0A=
>> +	{ CCI_REG8(0x0346), 0x00 },=0A=
>> +	{ CCI_REG8(0x0347), 0x00 },=0A=
>> +	{ CCI_REG8(0x0348), 0x16 },=0A=
>> +	{ CCI_REG8(0x0349), 0x7f },=0A=
>> +	{ CCI_REG8(0x034a), 0x10 },=0A=
>> +	{ CCI_REG8(0x034b), 0xd7 },=0A=
>> +	{ CCI_REG8(0x0220), 0x62 },=0A=
>> +	{ CCI_REG8(0x0900), 0x01 },=0A=
>> +	{ CCI_REG8(0x0901), 0x22 },=0A=
>> +	{ CCI_REG8(0x0902), 0x08 },=0A=
>> +	{ CCI_REG8(0x3140), 0x00 },=0A=
>> +	{ CCI_REG8(0x3246), 0x81 },=0A=
>> +	{ CCI_REG8(0x3247), 0x81 },=0A=
>> +	{ CCI_REG8(0x0401), 0x00 },=0A=
>> +	{ CCI_REG8(0x0404), 0x00 },=0A=
>> +	{ CCI_REG8(0x0405), 0x10 },=0A=
>> +	{ CCI_REG8(0x0408), 0x00 },=0A=
>> +	{ CCI_REG8(0x0409), 0x00 },=0A=
>> +	{ CCI_REG8(0x040a), 0x00 },=0A=
>> +	{ CCI_REG8(0x040b), 0x00 },=0A=
>> +	{ CCI_REG8(0x040c), 0x0b },=0A=
>> +	{ CCI_REG8(0x040d), 0x40 },=0A=
>> +	{ CCI_REG8(0x040e), 0x08 },=0A=
>> +	{ CCI_REG8(0x040f), 0x6c },=0A=
>> +	{ CCI_REG8(0x034c), 0x0b },=0A=
>> +	{ CCI_REG8(0x034d), 0x40 },=0A=
>> +	{ CCI_REG8(0x034e), 0x08 },=0A=
>> +	{ CCI_REG8(0x034f), 0x6c },=0A=
>> +	{ CCI_REG8(0x0301), 0x05 },=0A=
>> +	{ CCI_REG8(0x0303), 0x04 },=0A=
>> +	{ CCI_REG8(0x0305), 0x04 },=0A=
>> +	{ CCI_REG8(0x0306), 0x00 },=0A=
>> +	{ CCI_REG8(0x0307), 0xaf },=0A=
>> +	{ CCI_REG8(0x030b), 0x02 },=0A=
>> +	{ CCI_REG8(0x030d), 0x04 },=0A=
>> +	{ CCI_REG8(0x030e), 0x00 },=0A=
>> +	{ CCI_REG8(0x030f), 0xd1 },=0A=
>> +	{ CCI_REG8(0x0310), 0x01 },=0A=
>> +	{ CCI_REG8(0x0b06), 0x01 },=0A=
>> +	{ CCI_REG8(0x3620), 0x00 },=0A=
>> +	{ CCI_REG8(0x3f0c), 0x00 },=0A=
>> +	{ CCI_REG8(0x3f14), 0x01 },=0A=
>> +	{ CCI_REG8(0x3f80), 0x03 },=0A=
>> +	{ CCI_REG8(0x3f81), 0xe8 },=0A=
>> +	{ CCI_REG8(0x3ffc), 0x00 },=0A=
>> +	{ CCI_REG8(0x3ffd), 0x26 },=0A=
>> +	{ CCI_REG8(0x0202), 0x07 },=0A=
>> +	{ CCI_REG8(0x0203), 0xd0 },=0A=
>> +	{ CCI_REG8(0x0224), 0x01 },=0A=
>> +	{ CCI_REG8(0x0225), 0xf4 },=0A=
>> +	{ CCI_REG8(0x3fe0), 0x03 },=0A=
>> +	{ CCI_REG8(0x3fe1), 0xe8 },=0A=
>> +	{ CCI_REG8(0x0204), 0x00 },=0A=
>> +	{ CCI_REG8(0x0205), 0x00 },=0A=
>> +	{ CCI_REG8(0x0216), 0x00 },=0A=
>> +	{ CCI_REG8(0x0217), 0x00 },=0A=
>> +	{ CCI_REG8(0x0218), 0x01 },=0A=
>> +	{ CCI_REG8(0x0219), 0x00 },=0A=
>> +	{ CCI_REG8(0x020e), 0x01 },=0A=
>> +	{ CCI_REG8(0x020f), 0x00 },=0A=
>> +	{ CCI_REG8(0x3fe2), 0x00 },=0A=
>> +	{ CCI_REG8(0x3fe3), 0x00 },=0A=
>> +	{ CCI_REG8(0x3fe4), 0x01 },=0A=
>> +	{ CCI_REG8(0x3fe5), 0x00 },=0A=
>> +};=0A=
>> +=0A=
>> +struct imx576 {=0A=
>> +	struct device *dev;=0A=
>> +	struct regmap *regmap;=0A=
>> +	struct v4l2_subdev sd;=0A=
>> +	struct media_pad pad;=0A=
>> +	struct gpio_desc *reset_gpio;=0A=
>> +	struct clk *inclk;=0A=
>> +	struct regulator_bulk_data supplies[ARRAY_SIZE(imx576_supply_names)];=
=0A=
>> +=0A=
>> +	/* V4L2 Controls */=0A=
>> +	struct v4l2_ctrl_handler handler;=0A=
>> +	struct v4l2_ctrl *link_freq;=0A=
>> +	struct v4l2_ctrl *hblank;=0A=
>> +	struct v4l2_ctrl *vblank;=0A=
>> +	struct v4l2_ctrl *exposure;=0A=
>> +	struct v4l2_ctrl *gain;=0A=
>> +=0A=
>> +	u32 link_freq_index;=0A=
>> +};=0A=
>> +=0A=
>> +struct imx576_reg_list {=0A=
>> +	u32 num_of_regs;=0A=
>> +	const struct cci_reg_sequence *regs;=0A=
>> +};=0A=
>> +=0A=
>> +struct imx576_mode {=0A=
>> +	u32 width;=0A=
>> +	u32 height;=0A=
>> +	u32 hts;=0A=
>> +	u32 vts;=0A=
>> +	struct imx576_reg_list reg_list;=0A=
>> +};=0A=
>> +=0A=
>> +static const struct imx576_mode supported_modes_10bit[] =3D {=0A=
>> +	{=0A=
>> +		.width =3D 2880,=0A=
>> +		.height =3D 2156,=0A=
>> +		.hts =3D 3165,=0A=
>> +		.vts =3D 2172,=0A=
>> +		.reg_list =3D {=0A=
>> +			.num_of_regs =3D ARRAY_SIZE(mode_2880x2156_regs),=0A=
>> +			.regs =3D mode_2880x2156_regs,=0A=
>> +		},=0A=
>> +	},=0A=
>> +};=0A=
>=0A=
>No mode tables please. Control the analog crop and binning through the=0A=
>selection and format APIs.=0A=
>=0A=
>> +=0A=
>> +static const s64 link_freq[] =3D {=0A=
>> +	IMX576_LINK_FREQ_600MHZ,=0A=
>=0A=
>The link frequency should be selectable from DT, with PLL parameters (if=
=0A=
>any) computed by the driver.=0A=
=0A=
I don't have the full datasheet, so this cannot be implemented properly.=0A=
=0A=
Best Regards,=0A=
Himanshu=

