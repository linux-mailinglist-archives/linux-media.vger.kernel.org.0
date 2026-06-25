Return-Path: <linux-media+bounces-65603-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z23rMXmOPGpzpQgAu9opvQ
	(envelope-from <linux-media+bounces-65603-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 04:12:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF366C257C
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 04:12:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=kOCVBPKI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65603-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65603-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F6E83024449
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 02:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16253A9D9B;
	Thu, 25 Jun 2026 02:11:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020099.outbound.protection.outlook.com [52.101.156.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DE83A873D;
	Thu, 25 Jun 2026 02:11:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782353518; cv=fail; b=MZd2J76UbZggcXa/pcDHL4zT+PVTyyGQbz57C7tf2BS+AXLJ66lSsZTGQTkWnlNhv0kCdiIjN/TL7EoDfoRXcX8be7D5UEC1fI/Uu1tBJ1R/BrPOJlGwnHGEBZlDMkvaTnHrCeWeAWJcEwYbiYwdDDkvgPnXY2wCJ2c0G02P5EU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782353518; c=relaxed/simple;
	bh=6PxxqjWz50tdZDtdRHXD5arWY/Tz5c44ns7I/8MzQTk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JzW5sCVHw6Jt5XTEU1y+wODp1jls3x4SMIz6Yt/+dGQrKq1l8IYf8dU4dOEi+RNVpIxlmQKJJqnRbcGH719YSXELtgEX66kTVSesLk7dW7UuIASb+Q8A6cJesdyyRtB7IQJGQMCp/wbbmbkJOb41KZAtvr98fFTlY77K2c81OYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=kOCVBPKI; arc=fail smtp.client-ip=52.101.156.99
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xD+X1DgmGdO0pw/iwY+BcPcA/CFPrFakfPYa62DZa8+FGUvn2Afv8ZqSNppHB5cOG2qyE7NGJN559OuZ7CEWkyN1iMGMKgl1lcfFjBlrVhvNCj0i0nMMY9sgJqBP2s2obgWnICLojli3YC/T8loGuBQ6hPMGeT+lYwVNX9Szu8kNcpGbuI7bh2Z+kQABAvsRbyJ2KzufSdSCUnBM784zfm0zW9uhQrqr7IuxLOk45XFoTqRbP1WrRQVD2TutJHo95ZXf8Pnrt+QYYNpyb0Pu59CD4t1rRyOSSjmpZ7Dk4YU+qLMY4s+HzoyIwXRV+lzuRryhII04Mq8lhMgVeUhr3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oml4527idKjDPnju1AIIRMdFzU8dZRoHbUehR6YtiH0=;
 b=P5eVDzTVJg0hILpfQKDl0tvUDPOuY+0EaZl9J4ADkU2EfkByNT91zdr+8jsjVbgEPSvJhxbMYkwhkmp10PPaPDKxGkpMQBrfY9VqRQTO03no8G48v85Nk7x/MY5R1dkT7ufB090cVo/xCPrEvKOVfDaCo40L4d8HfAFKMlhpjD90wSa/wnnT/oj8vlCOkokfhYYmbk/VDzeG4tthDDMTKxQfG29Y+vBC8StZuV2toU67sjOMFXc3/BQA/9jpcmWdk7AP/aWoif6dOtpGG3cJ1yGf3eLlvsOkCLiMuB+2Ju7GBMOSMi2r/lDHz/1TQpLjGRR++Xrrgfo+kOB8VO5VYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oml4527idKjDPnju1AIIRMdFzU8dZRoHbUehR6YtiH0=;
 b=kOCVBPKIBuaxGIGM/8HkNLyYNSbdZcvbCsxbfWhLqsClFvL4abCxDVzHtGg+jRKkjM1030sVtwZSO0UrPynXao3Y+re7KAcFfHMMusY0u5L4LIc/6s9j/DXbrF5g4Llg77hHY8afp/grcsYfrG2YFlcGXrmtotOMlJIspCcyXc4=
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SE2P216MB2129.KORP216.PROD.OUTLOOK.COM (2603:1096:101:11a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 02:11:50 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 02:11:50 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Francesco Dolcini <francesco@dolcini.it>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>,
	"marek.vasut@mailbox.org" <marek.vasut@mailbox.org>
Subject: RE: [PATCH v6 9/9] arm64: dts: freescale: imx95: Add video codec node
Thread-Topic: [PATCH v6 9/9] arm64: dts: freescale: imx95: Add video codec
 node
Thread-Index: AQHdA6oCdJLS47cFw0S+2PQN9LBcWLZNmBMAgADuE7A=
Date: Thu, 25 Jun 2026 02:11:50 +0000
Message-ID:
 <SL2P216MB24418A37F5F1725CE50FC61AFBEC2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
 <20260624072043.238-10-nas.chung@chipsnmedia.com>
 <20260624115050.GA38214@francesco-nb>
In-Reply-To: <20260624115050.GA38214@francesco-nb>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|SE2P216MB2129:EE_
x-ms-office365-filtering-correlation-id: a1755d79-6d84-4dae-be03-08ded25f1e64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|23010399003|376014|56012099006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 T7Okgtqkv2uXFzFbl/7Bt7co5FHqMc6EpgT1WehL2t5/6t+KqrhqUFUvLrgo+tND10iyh5RQe2KHnogUxZtggAl2tf34OprUh8nALwHabjkwYD2Ij/I0pPFq4wVKy9P1Fk6cfaWMPqJCkM5eDAMi4JktzKfc/YQqEN+6EUsusi1Ql3V/uxzedSfd65lt6U4v/WPqKVweeOOYgAe3LxFx2gjEXkGfBOT0/hEKPrqLwgXy1N4v+dIBWUyJjgjnc4gO6AXyeYG1uP3fGWQxO/8P1/RCBTVpaLHn3elD7tU/3JnNW0ucKUsxFA/PzGi5vp3bbth1EPOYOcrfKprmF2wjAWDYY4CnD2ZiES5de3XepfdyKwH1CXT4MH+jhfGEZospvURyBlSAKnOOy7UZwA69H3S5nuu5shphXFafLPCkWM1yPX88sh/sDee/pJ+Hz9cvq7Ul9GHQInDpW2pkuvjV5nOKzyBJpbeaa6aRk8gj/bPbTQR/fZ2ka3zdIBbS7tEeRCjug/8aoK25NIbsdNj0N+vldP/3yJvEy87LHadxKmxso2uGNUtZ4lS9mK3adrBQk40exDrMBZFr39GYkNI69Jm5Ndhq1bm1U7u/R5vTJ9K0DU7G7CuksYRoQU4QTi24GCCoTkF5WLufwkICjOo/pqqThNd/wQCF1gd3TtCR6xQsQGQedsvDJDH3VivCa9/FcaO7ARgvH1QLnQiPhLZ/Hi5V/P4/Xvaqf6BdxgYhQMQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(23010399003)(376014)(56012099006)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ljn0GbqYyAoAsJ74Kcp19nVEIuVPcs9PPvX5CJ4pLXJbvsc6A+mKU8PVKVBT?=
 =?us-ascii?Q?pVf5X2u82oN/3jP98w+ZILfPy+fQuEIIE2P5R5+sP1NrBU6kbLBmtVAArpsQ?=
 =?us-ascii?Q?O2jDuuJzblVAw2+gUfoVmCPiXUxuF+DTTAw+1LIq59fBtzVQaJzkR133/cmO?=
 =?us-ascii?Q?bll3YlxPe5u2adPRBuxjmFibgVQYNPaXbrMDnZhYXIGl5i3zpY9ALxe8xUlu?=
 =?us-ascii?Q?Nu6g8zWnfI7DRAaYUOTWCfuqoxrwpRNKYTD7Hu5GkJVOz8F7zXps2NoA5WMi?=
 =?us-ascii?Q?jniuCIfF4FDv/Mvnmr8/NKhDpvTod/WLGt/Diy1iZBFVZJ/4gpxiPCaek16j?=
 =?us-ascii?Q?Pd/JyN+aY+02NnQNt4ZjlqpqB1UF1I0IbYqw5Wmz2uSFzrGnBCo+IiBRr1yf?=
 =?us-ascii?Q?f/Qj2mrM+mWjDZ+La4l3UZb53irQywgJq1pbmqbjYJ0oMZo6J78IEN0abFTq?=
 =?us-ascii?Q?fOj67C0kHWPbyToppKZ0wMDlfUp4Launi9KkuMYvSjyvm5oH0yL8YysH5CwH?=
 =?us-ascii?Q?UmnETGsuvN9mRMpyMeQ0fMMHd5iSYRnlDWqaPS+asaON/u7OdYvCs9KChEVY?=
 =?us-ascii?Q?wdb+GJiErpE2B0XQVkREyr3Hxk0crEwztiO3B8Q8i2hVlC2RyWNird3eDN5P?=
 =?us-ascii?Q?hkxmciHOUWre8ZPcpoVxMg+G9iyuDaWxo7ORGsDk6qW+sDEFNnBlaTLfOnrj?=
 =?us-ascii?Q?XN5cTB7N2YKP0L/JKMk1JoZAN+ATuwFBoRP0HH8iXODyvUu8C6f6YUd57X3U?=
 =?us-ascii?Q?ECw/b8N4nRI+lFhlg2YD0qxc5vJc9DrKG84juh89NkN0bwuiE3WGiCsmgAxA?=
 =?us-ascii?Q?9mzm2vrz7tct7/GndTK0ZV+tLGWeQPSpOtubNymyW+MAjX+fV+ufAXENNvUV?=
 =?us-ascii?Q?ZBrUAM1heAfj2rLplAvIImkQ0UsxAzSm29ApthXUDe8stUkOny/61DjNRz2t?=
 =?us-ascii?Q?QaupnKxgSnDCmaDzeGGSir+5SVFczYWSY7VmRCKysbd7h10doKukNtbbaUxe?=
 =?us-ascii?Q?aTiJRFosZjT16Al9KX2AZNVw0Nv2OU99as8qWmRZZxkoAXeFczVkEBn3BYIt?=
 =?us-ascii?Q?cFzkSKf+OXLDRrFky+eD0kpBesvMELiAwjN6+Y9/e3t+lBhrnlaZZ59JU482?=
 =?us-ascii?Q?vEfBXrBbnPSaRmBG73cvXa3URhPajl0QQOu1g4RShISY0TrLVM+LsffbPS4H?=
 =?us-ascii?Q?jPn7zVWddSObRjUuSycMFBoYi9pbxBxneUO8+LPDbyeSgK6ZSsdl58t31tTN?=
 =?us-ascii?Q?KNvWTk+cR0Ww263lOl03XhBkgQ0mMgIaqtrhFRdmi0jUfefwBocOj65Nf6tq?=
 =?us-ascii?Q?GXHadhbS/2MtzNm1BJDFSzH9QSPdqvTf3MEeXiF6cX7ydlbvDoQAqqR3vV/F?=
 =?us-ascii?Q?LA5k+dBlZEcE8Xbo63t46bPugZe+Cop8ogzOIEjnu9ZqT+fL5E0PPGVw4v/Q?=
 =?us-ascii?Q?ekHHZvyaKF3TTDXnC2lrJM40rij601PkjZSa/M6/5BcS7ILBb/om9G3VlHZ9?=
 =?us-ascii?Q?3beKXsPjh/pB3tBHDUFL9FUwq6QJ1fzbo7B4D9zJkfK1pOKMYMmmJOnjVYy9?=
 =?us-ascii?Q?Ff71/dzUJBi8e6Na+lqgJ5BUyh4qRq/Q+oNbNdRsN7vTGN0IFMED4Xso/os0?=
 =?us-ascii?Q?RGOOFv0DBZ1NOt3uNCEpVCSjifZALL5oHIbtrmtxB6n0pSJDXjy23g9QBDBp?=
 =?us-ascii?Q?icwaQH70buc1iEbC7rNnrlSpxsho+sMQKHsS2ouQ90pG63PB2zYfY/C3s+xa?=
 =?us-ascii?Q?0uX6ETUBGw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a1755d79-6d84-4dae-be03-08ded25f1e64
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2026 02:11:50.6251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ATpnOLSBolDkIwr3ku96Yq2Yidy2XQoBpgFnrJ/8Y243NMKJm6MqlsAtmeOW43I8FqSD1nZcyENRwyt4ipa53EwatZ23M5BvPi/x4ukz+TU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65603-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:francesco@dolcini.it,m:mchehab@kernel.org,m:hverkuil@xs4all.nl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-imx@nxp.com,m:linux-arm-kernel@lists.infradead.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:marek.vasut@mailbox.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[chipsnmedia.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,pengutronix.de,vger.kernel.org,nxp.com,lists.infradead.org,chipsnmedia.com,mailbox.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFF366C257C

Hi, Francesco.

>-----Original Message-----
>From: Francesco Dolcini <francesco@dolcini.it>
>Sent: Wednesday, June 24, 2026 8:51 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; shawnguo@kernel.org;
>s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-imx@nxp.co=
m;
>linux-arm-kernel@lists.infradead.org; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>;
>marek.vasut@mailbox.org
>Subject: Re: [PATCH v6 9/9] arm64: dts: freescale: imx95: Add video codec
>node
>
>On Wed, Jun 24, 2026 at 04:20:43PM +0900, Nas Chung wrote:
>> Add the Chips and Media wave633 video codec node on IMX95 SoCs.
>>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> ---
>>  .../boot/dts/freescale/imx95-19x19-evk.dts    | 11 ++++++
>>  arch/arm64/boot/dts/freescale/imx95.dtsi      | 36 +++++++++++++++++++
>>  2 files changed, 47 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
>b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
>> index 041fd838fabb..7edd1c69966a 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
>> @@ -76,6 +76,11 @@ linux_cma: linux,cma {
>>  			linux,cma-default;
>>  			reusable;
>>  		};
>> +
>> +		vpu_boot: memory@a0000000 {
>> +			reg =3D <0 0xa0000000 0 0x100000>;
>> +			no-map;
>> +		};
>>  	};
>>
>>  	flexcan1_phy: can-phy0 {
>> @@ -1142,3 +1147,9 @@ &tpm6 {
>>  	pinctrl-0 =3D <&pinctrl_tpm6>;
>>  	status =3D "okay";
>>  };
>> +
>> +&vpu {
>> +	memory-region =3D <&vpu_boot>;
>> +	sram =3D <&sram1>;
>
>Can the `sram` node moved to imx95.dtsi or not?

Thanks for your feedback.

Agreed, I'll move the sram property to imx95.dtsi in v7.

Thanks.
Nas.

>
>Francesco

