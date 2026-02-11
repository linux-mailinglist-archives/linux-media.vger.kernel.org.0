Return-Path: <linux-media+bounces-52593-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sK4VDhtIjGkHkgAAu9opvQ
	(envelope-from <linux-media+bounces-52593-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:12:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 919F31229AE
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E50A30238DA
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEE929B216;
	Wed, 11 Feb 2026 09:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="FXwj0pHO"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021123.outbound.protection.outlook.com [40.107.42.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6480C3542EC;
	Wed, 11 Feb 2026 09:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770801168; cv=fail; b=TnU9ZHAA0e0JeK0S80y1DYKvflAuau7Qb6nWTcDGe5mANTeAEjU9eVJl5SFI1DeiW0xBBErqyqYmLmeMV/ieG8NkvdE3Q/XSs7l10ZklXwYrOhEpJa1RwM0zpPHECUj0sVBgXRSIcudGl7yg8YxpLgGJGYKJ9Vp8xzfbKmCi7Ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770801168; c=relaxed/simple;
	bh=eGBnFom4bxHKb96yaPlmVOhUDuNtzHGoVwFm6yaxJL4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DgD7dJE+FGO2R0oRnVymKgfhOKxUl3ltiKI6LftiIJD5R5JYcCsT9bqQGTEfa0QSXRX2m64S7xESj7NXZgklazk2NmvwoDyymaJivKnxPawWUXxBbWCD+4+SIM4x0uFZ/40kBnZyRQmhLVa+OA79LrGhuGOoVbB0N5uLV6nMS9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=FXwj0pHO; arc=fail smtp.client-ip=40.107.42.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmREUKJc8kQyt56h5JkHOJ8hrOpzen+drCybckIzT79pxog0KfqWo6wLHppiFPNPdEUbfj2dYG9xQbGyk0wtvxPPfTj7ZUBGEl3tiCyEBH4TMURkWYvh5JRt1KQsAk3mbjaqs5Mhekv/otUgu+DFizWGN39ZRo5c69bN/9LJsU5h+NaAVBNgNMlHSOVLNg5sgTYioy4J4p8NL8FkobYgvDZnjKDmNKsMcHcGdotxn6ZNbPuJ8rKDnczY4nTwHCYVY6JSeL9dx0ZOowWWvh6GBQ/CQe4mTnM4OvRqynKd70TLvqPQ3bo4UL6v2IN7yw8N0BrKq6wHAf+fgEppHL+OnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpPJguuCHSOXLrNN1sgrT3AM8a+6ZFhDr7+uwcqLjSE=;
 b=JkIB4SB7LCFmhNp5u7flZw0zGM1qdbwz6Jh+waBOxGApdZ8z7lA1C8iGz2HQb89k8QPkJuVdCGQqBQfKAy8YtR31Hyyia7uTSm3fBkK7jMS2QGRAiariwCChgum5TaxuQBucopud6SG0MrQZY32phw2YECGYjzHRnw5OkmR2zajVPk1oz0Lvr3M9rQAuWhXvxvQ9420FyyKgyji/Qyp/GsDL7zNXz5brMksNxj5LASJZ6SISfNOWLkYCMIXGJ2MGRMJdaQgB5sJX36MlFj+TCQ/M85iIXmyWq0M9X/t2XcAxp+CcYC6omtXN8amlbJCphU9RwZITVYNJZjca6c8Y6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpPJguuCHSOXLrNN1sgrT3AM8a+6ZFhDr7+uwcqLjSE=;
 b=FXwj0pHOjIwAOyjyWHtwOGz4cD3oRg+MRhCgwRhLvvmpa9DReYOxqbLYmulveRkdLJJ0zCG8S2ZAnqvfg4f2oS2Fwshx7f6Wjxyk9T3u8X/KQD3am6bU/8eb+xlWirZ/mM4VVsuOUBLlsj0Kj5UEMGu6eapTWJFPCQMQWkB5AUc=
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by PUUP216MB3243.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 09:12:42 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%5]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 09:12:42 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Alper Ak <alperyasinak1@gmail.com>, jackson.lee
	<jackson.lee@chipsnmedia.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] media: chips-media: wave5: Fix possible ERR_PTR deference
Thread-Topic: [PATCH] media: chips-media: wave5: Fix possible ERR_PTR
 deference
Thread-Index: AQHcmB0Xl/FUGan5EUW2BE6Q1lppUrV9OHNw
Date: Wed, 11 Feb 2026 09:12:42 +0000
Message-ID:
 <SL2P216MB2441B206893FEC079521B3E0FB63A@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <20260207103224.609938-1-alperyasinak1@gmail.com>
In-Reply-To: <20260207103224.609938-1-alperyasinak1@gmail.com>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|PUUP216MB3243:EE_
x-ms-office365-filtering-correlation-id: 99d2e807-422b-43a8-76e9-08de694db647
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?oELyMMM6awKRojBfyNECpRrywE2lpfjD0WXQBUa4AoRCY6e7WbvvsCxOar2o?=
 =?us-ascii?Q?3EdmZljzYlEZRD9zll8+1ObnfXB7hgTaK1Jh7OytlU5yy/VjxQAwYKxpJrx4?=
 =?us-ascii?Q?0uiiPnbseEqnTWAP0LURDKJ11X8ijm4fd1mqngVd0PjmW3HNCMztpfP3JDEv?=
 =?us-ascii?Q?GSAoePM0foWzk3POW1wF12WR7qbs5gHIaPBNSO+ttVNsNfRhgczqPykq7z8u?=
 =?us-ascii?Q?Xyubh9KcBg3rd3EBYXuzkU6/TtJ/4rag9cQkJI5pZNnmLDRbLR0esZPkayg4?=
 =?us-ascii?Q?TS6iUW/Lub92fsRlYvlga/zLxcnI5KyfwN+OE3hjiZmsVTGjv2V/LtNnxgPS?=
 =?us-ascii?Q?zrhpOX05ua1Mixzm3gIXLvhmqW8xKMnf0p8F3/gaagCthxoAT1zTVcrJ1znP?=
 =?us-ascii?Q?U/Xa7il8MwPpu7gO21E/TmuuG20qSaXtx1mVxSrG4OB6fL2fd49p7nmPqnrv?=
 =?us-ascii?Q?SF/KfHnAveLioLiG/lommCPJSvsiGtWN2lhTB0lfzOlHeGoJAACfe4venQ6S?=
 =?us-ascii?Q?SXtV+Uv0iUFMOanqm2piF/J/zR/59H5uZdpSFbKyCZucknA53OXdS8y2B16K?=
 =?us-ascii?Q?VlDGxQp2HGizYyfgpGsOPkWLNdoeBD7aMg86zv3zgAQtEDxrrtvDqt0eqaSi?=
 =?us-ascii?Q?dfRLG/eWEPUCs4dAw1qOSWKjsgzB4kt2mgjtxYAGJUgjuCn+wmaWX4tEb2tM?=
 =?us-ascii?Q?1itw2hs6H1knZFC1Y6ok1y6IiG3JR7WztHh75GWcKN10ZT5VCbNlMKdZahmy?=
 =?us-ascii?Q?Rh2oCbszhXqDgfcJ5ckqrTf1Jdn+0TuH8MT6E12WkstK1HE6ir8cpdac8J6b?=
 =?us-ascii?Q?Jj80DSriKPWq45UEdNcbe2Q2j5Dir7H6yIQSelIqMVSfZU9ZFZV/nSbfMVow?=
 =?us-ascii?Q?YZWpWPfAjHSr6ql6HMX5RMEnyXsgXSokGIPc/U8avReOvLhaSl/vkO8Wn8FO?=
 =?us-ascii?Q?+yM2Y2w9mhQdT9pI7P0UPhxFZanr48KHUzunFizIZzt54T+D5lNQa0UqPN6T?=
 =?us-ascii?Q?5xikD7kCYR/iJvMbLqq+HUHaol8hqKykUasN3tiv3dQutc3MSAWAHgjp6+Ns?=
 =?us-ascii?Q?kiWG/nvKDcLVARrsa7+MHv7hKf1fSq+UV7gGE0McJPcy7TZ4u828u5B5Iaj3?=
 =?us-ascii?Q?DDA4J+lcfSvD+P+O8YI89He+gyvnW+NI0k4+2GI7eEmKYKCaZ9K9eKf/NUEX?=
 =?us-ascii?Q?kHblzy0Tufqi7mRkTQ0wEwo8pOQll5g7Co+Yn+ns9gz4IiXjgKvnX8rSnBiG?=
 =?us-ascii?Q?gu03QAtR+Rw3E6M7vWTNJ0nVfxVp08qqWiZP1oBYy3bQTw9FKqzD359KtxeA?=
 =?us-ascii?Q?ZrzoSRRAwYAsMadMfA6NtsuA1113T1JokULjaEp9V9xjCyegGhEExDW+okxi?=
 =?us-ascii?Q?/NQ6QBIiXDy+Wjf+LH54Q/O6nCS7SVRMOYIBbn9lN5A5BqGe8nsUrcEGEz6m?=
 =?us-ascii?Q?JsVbHvIXqwULBwvt/OoqKwuIXcPUH0wI0voWC9qtKR9G9/2zV59maOIlDE8M?=
 =?us-ascii?Q?2FxoCj7Nh7E+jAVGzx33WKiZbXaAN+NMITjSbdoZDnLOXQIq/hz5pQU2QQ4I?=
 =?us-ascii?Q?UvJig1uqM92z9TPiZ36c5tcPsDRGKGfBq+rTcbHYvlp1IcBVvdl68G1ohJ4b?=
 =?us-ascii?Q?C4o9t48sI0EnY0Fo+KM+jSU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LNmeJDR7a6aE9M14csmDinVbLTdoIiN5yqPeQg+gIdP7/gsQV65S9I3cyXQF?=
 =?us-ascii?Q?9I0MfB9hhqFT2D7yZBNGdA0CDDrr4ngyYhlEIh3OUnN+eZmPh7rswvCLxg/M?=
 =?us-ascii?Q?+wAIeHGXphiVafEp/ukhi1k/M6rzEtN0h5nbFpXXHE76RtQUrCJlaLJSt/AS?=
 =?us-ascii?Q?SuZuDqPquwDEHGprdw20ZnGa79f/Hmbb0WJFvzWE064JZda6x5aUS6l408t3?=
 =?us-ascii?Q?iipb4Me2ETZTE45ErumX2rgS5fKoDw6AIbK9C9nS1RPdZhzv9cMoEw4Jp/Hx?=
 =?us-ascii?Q?UubINkqMNQ+3gVCI+bnmx8/xYPBFMDD1wjig88+dhmYcy1Tbb5KKtf9hOcTs?=
 =?us-ascii?Q?+w5P+/d3Icf+o2FWQZEm9V8nGWY/2a1jvOAMDt9YPIP7M2eKxHSObAioNJX5?=
 =?us-ascii?Q?v+NO9DJA4XJBVhgUUjOYhKRYxwVi8Wm58iJMpdcPoNr/jV4fnC6sqDGtWESo?=
 =?us-ascii?Q?fHZOqk/mM96SjTSx4fXPoSAqxrvYkN423yawH77jr9+KTGUlRzWxRtvYGDd/?=
 =?us-ascii?Q?rTa6bRbggGr06BateHD5owiXiGytwsaGgz5SRY83MXsDFgmEz6UE6EC0X7Zr?=
 =?us-ascii?Q?1HjFs/orjMZWAOM6n187tI0JXOFgFPaxBF81oCfFRoRQ006F+KwivJJnw39p?=
 =?us-ascii?Q?Oivvq9WGbOxxzAEeObsiZoMe1mjR1YzdPs1+EEBYAZDdFShr++8/OqBS9DAm?=
 =?us-ascii?Q?KKC3iZF/t8HYHmZ3NiiCdVoWKJRIhhmEv8/ZPiNNtUXNAeERduPKfWnd7N9W?=
 =?us-ascii?Q?mUK/nLMdJercRc6wXydDYH3aFuRfng9HYf+WMBhHDgAOi+9HtH7KoRan2UHj?=
 =?us-ascii?Q?JdV2GNgRETqAni35JEd8joA7e6zofcK655SNGHo1HSB7CtuA4IHzAsuqwHTc?=
 =?us-ascii?Q?q1ltnCmVTxOOnuUSsm/WYB58fi2/dYLDxSiVKlv4HeQjb5bMyem6gQSSyQs4?=
 =?us-ascii?Q?Zud97X1EI9AokdZhVaPTIXnSWsLmrRd5QqJRNAlzlA4ol/POAYvYHZXxUbdt?=
 =?us-ascii?Q?1vP2cmQoxUaNsK8Wmxv1KiHlxt9A1YoVbyW1o2GcEupkDL5XbcS6OmfxHRPm?=
 =?us-ascii?Q?3DcTBxsaop/CeAjxudsHK5luYOW007mJsAsB6TsJezZsa54JCokSEPPqLB1n?=
 =?us-ascii?Q?lPh4VLRWkFL+Dvwmgzc8iClp8xpmHvRiXMY0v/u4OCM0S/c4feCfqmgqqDCt?=
 =?us-ascii?Q?EP90a8yzo1BthkQYSnAlBsqAAKgGuJQU3455US8ZUFmARtFObvha0tzQ8R4l?=
 =?us-ascii?Q?i04SoYWji8v82RwK1J9cHI5lfAZsTIa27zsLCD3X0cRh2WWX1rCYYprlKZAI?=
 =?us-ascii?Q?Ft7ZlqnYjdxIx5RfmAzneBKXZX7aZznrM8OmXKsA875f3J7oj8oNmcvTm7t6?=
 =?us-ascii?Q?XTakm2hs+NK1LlwPCD1aX+rKh43lGwVmovDqfut5LVWVZzux6u0lcqWJY+cY?=
 =?us-ascii?Q?tkj5+WpigJMM5bh6D2C2ZV6a7VRpK18+KfHdKHVWrrGoZgv7P/r0appef2hZ?=
 =?us-ascii?Q?Fvl+ZbYHA5Gfj4P9OFLcFwf18nQ0k7VYH0K75NB/uB3KvcoZOoZR3y4e68WV?=
 =?us-ascii?Q?jYtmh0FaBoP6iR1arnatnjn/fUa2PjQtUKxsMW1yoRDejF3Hn/04FztgCdgx?=
 =?us-ascii?Q?jNt/5Juf7uN+6Xtiepv9dCcM6b3zwEasj3zlV5o6Qlh1K+r2baR3pTt37opi?=
 =?us-ascii?Q?yc4GpxRRwglVXYKkZ569rLtupaJQX137p868o9kyrcbwP9fq671xEPxndaAh?=
 =?us-ascii?Q?O/yhaRdzHQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d2e807-422b-43a8-76e9-08de694db647
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2026 09:12:42.3894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /52x7vAxIBrV+MI9Rz4+jzf/Fnrzq6+P1oX39kTrs3lFTKKsALAcd9rrdWIv6NWaickJyGG3Q9/EzfcKwuU/ogpS7E8JOZHDMwlfZc6lO8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUUP216MB3243
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52593-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,chipsnmedia.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chipsnmedia.com:email,chipsnmedia.com:dkim]
X-Rspamd-Queue-Id: 919F31229AE
X-Rspamd-Action: no action

Hi, Alper.

Thanks for the patch.

>-----Original Message-----
>From: Alper Ak <alperyasinak1@gmail.com>
>Sent: Saturday, February 7, 2026 7:32 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>; jackson.lee
><jackson.lee@chipsnmedia.com>
>Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; Nicolas Dufresne
><nicolas.dufresne@collabora.com>; Hans Verkuil <hverkuil+cisco@kernel.org>=
;
>linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Alper Ak
><alperyasinak1@gmail.com>
>Subject: [PATCH] media: chips-media: wave5: Fix possible ERR_PTR deference
>
>The kthread_run() function returns either a valid task_struct pointer
>or ERR_PTR() on failure. The return value was not checked and in the
>error cleanup path, the code verifies if dev->irq_thread is non NULL
>before calling kthread_stop(). Since ERR_PTR() values are non NULL,
>this would result in passing an error pointer to kthread_stop(),
>causing a kernel panic.
>
>Add proper IS_ERR() check after kthread_run(), log the error, set
>dev->irq_thread to NULL and fail the probe to prevent the driver
>from operating in a broken state.
>
>Fixes: e66ff2b08e4e ("media: chips-media: wave5: Fix Null reference while
>testing fluster")
>Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
>---
> drivers/media/platform/chips-media/wave5/wave5-vpu.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>index 76d57c6b636a..bebe2bd6893b 100644
>--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>@@ -340,6 +340,12 @@ static int wave5_vpu_probe(struct platform_device
>*pdev)
> 		dev_err(&pdev->dev, "failed to get irq resource, falling back
>to polling\n");
> 		sema_init(&dev->irq_sem, 1);
> 		dev->irq_thread =3D kthread_run(irq_thread, dev, "irq thread");
>+		if (IS_ERR(dev->irq_thread)) {
>+			dev_err(&pdev->dev, "failed to create vpu irq
>thread\n");
>+			ret =3D PTR_ERR(dev->irq_thread);
>+			dev->irq_thread =3D NULL;
>+			goto err_vdi_release;
>+		}

I also ran smatch locally but couldn't reproduce the warning.
Could you share the exact test command you used ?

That said, The fix looks correct to me.

Acked-by: Nas Chung <nas.chung@chipsnmedia.com>

Thanks.
Nas.

> 		hrtimer_setup(&dev->hrtimer, &wave5_vpu_timer_callback,
>CLOCK_MONOTONIC,
> 			      HRTIMER_MODE_REL_PINNED);
> 		dev->worker =3D kthread_run_worker(0, "vpu_irq_thread");
>--
>2.43.0


