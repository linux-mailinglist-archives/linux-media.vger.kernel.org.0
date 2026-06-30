Return-Path: <linux-media+bounces-66043-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BWfpGUZyQ2oiYgoAu9opvQ
	(envelope-from <linux-media+bounces-66043-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:37:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5F06E137C
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:37:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=mSoBi4y5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66043-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66043-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29C5130C8B8A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 07:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B613BCD0B;
	Tue, 30 Jun 2026 07:32:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020109.outbound.protection.outlook.com [52.101.227.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F1C2E06ED;
	Tue, 30 Jun 2026 07:32:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804761; cv=fail; b=taow1Eifk8+ByxbDZVUKnt2H+PwSkYFn9sudkf7a9hhwR46Cn4mOUhwIgzCPbO1jRX1gRZaK43oKIxHrpxjarU36AN9iF0LNt1k8HSzxBbS1zPvCVae1ZAribTlhHMu2Uad3fD7OjsuKMsv1wO7AQ5dVJ34DHQXwMsaSE35YIn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804761; c=relaxed/simple;
	bh=F4jr1t/5eqHYagWQBSyqEARGbIYRRkQ0ebRE5fpM+sM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gU9aJqeI5avIFZZR6gG3h9tcwsZThNhI9QAVQ9sBP8LjC/De9ZfwKyU3UbvFNnTDQPXEs/9RhAqu0tQlDxwijAkYu9MP50sNo3/nuwbuVs8USHIqgyPGmE0FJtO/As4eI26jXuQznh4VstA65qv/IlUST/+BNCb3f2SqH6KJqf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=mSoBi4y5 reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.227.109
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZouYNQAISIFipgBBLE0GKwBcKQthDO7X82/gC08Oo2DCJinRD4ceVzSVkrJCbUqVqa9g4gapvQdBU7oiL13EXJFQERiAg6X3cWuqjuXtXbZFmLnOLxLtd8FNizIX0+XHHYGGQaQlenpD+uiTSUYAE0GqW8CkuTmqpRT63+twzpa9cz/i6WStqvpqXZeaHy/aENTNdUXb3S1RUQZo/Rxj+fGk+Ny3gSudN+CZLBY40BnL2JzZg5ZZfjftg5A9vsmWfEJ5Np/HEDyXKoJ9UGHtQ92DMuG553IRDu1fdMzaPXkR0XutnVHX4WknTlU3jCOQUlq84Ux5w4+QtWN1Qt7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKTmcZh6KzECeI0Le/PyHUJMnMNfMune20hd/AulR4s=;
 b=iuxFwvEXfrzgYoR8bcZJRRE8L/X/Rdsbxpr44Xh0ppYfqu77Ldar62Bngdi0msSnISgB1GLFVd1u+bbF9Osc39syk4AN0zpyHAPaScq/qW6ku/zG1RbeiLDwJmlMee1lqfdFY7Bvm2WGbY/kxmMHtcq1oNSc9wVPrcZvf5KLwa5ODCIavpyna6z6VUgjW1OIJXj+Ua+ICViRp93svB1ztuwgyZsAgK418uwREH1nzY5dBR2CGivzZCgvxaioRVK+GLA2EtVj4mNHtLFuWatdkTyoIhrVcKd4sFn9wcMzckWTbjoKZWXI/60W+gJtNS6veOWpwUbVNEbNHUDWqe0nKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKTmcZh6KzECeI0Le/PyHUJMnMNfMune20hd/AulR4s=;
 b=mSoBi4y51/Et+fDLQyeHDRQshJhfaGdXE/TUBEBkBjafqNv1Q3h9ae3mQAR5SvYFmWc6HAIetmkhQk22enlEzfpk7aKIRplauWUN6WXi78deylBcbk1HVNrX05n6AI8npVsJvOhzRHVt3lwkYju7zrQG3Hw3cbaJDO17kTEYJ/nqfgqNPWXfi1uauM0uOy6c+f1BHuyRmvcfiIWH47PmWRCybNjYaHiu+QanHCJ7PgaLsJKmBvSqQfYjFD3o2t8AUUqa+8cSDV6O37UV3nXFz+RmdrWVgsY1Z/vEMk2Mw605HRkzI4SusWCnBvTQTDev3HEA9fIja1AaGLjEJJRn+A==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB0476.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:121::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 07:32:35 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 07:32:35 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>, Serin Yeh <serin.yeh@intel.com>,
	Damjan Georgievski <gdamjan@gmail.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>
CC: computman <anis@talbi.fr>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>,
	=?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
Thread-Topic: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
Thread-Index: AQHdB5q8NQpQtUcMokeHZdb/BmiJ5bZWs7/N
Date: Tue, 30 Jun 2026 07:32:35 +0000
Message-ID:
 <PN3P287MB18292C819793395D643D426A8BF72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260629074026.35490-1-hpa@redhat.com>
 <20260629074026.35490-4-hpa@redhat.com>
In-Reply-To: <20260629074026.35490-4-hpa@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN0P287MB0476:EE_
x-ms-office365-filtering-correlation-id: 7e26955e-54ed-470c-1fe1-08ded679c158
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|22082099003|38070700021|4143699003|56012099006|18002099003;
x-microsoft-antispam-message-info:
 TR8gLAYYgWD5WRyrVa3QE2PKtMhPhoymVwhW8oX+ldTvyhZMntIM1bjLNSGfnP6+vPyAXBMgwrEqzUtICNmaQfVMnyWOt22sWJKomFR1mjeafqkdkY2BPQ29XnNRY5ecw5ceG2/qymbHmeTf4HhXJ5rUfW1N4wz5hk0uA19gidlT09NGEx55oruJmcaQY8vnUmlbHWnktYKCDh7yMn+L7ajM2j0IGugpenCFv7+fZlsjAf5oMx5nKh26lR/VpFeXeQzXj6wKCWMV4FKhGJxuImtz3BvP/53Lh4Itw/p/0QRxMCxr9lt9zwPM0fsh9c42dwVA4FAa4vptJl8BvkrRhZsgdZUVcyaZzDVv2n3evzfaDfXZhkvcpQhG4IC2Invbdxds78bynz5zorvRs6Hj3OSZQeundyhmznLSy/scj6JEmMxmJB6Xk63GmpoKWyImarNmJznslgN71yV2D+QXwgpuYUb5BnqmMGQ4KW242wI0ToFinj04bD03J0UVYV4i+uDDqrlsYP78j7AjJ8uS+dORFcuDu6euW9wVgvA4KiFbiep+sRoNV2e3JsO4dyJo86Z27bCLh5MnAXnzqNQ+XkezFZNCk0ExUU2BKSBJqmvq3LkMFRUD4qsIaQsMrSRC6RfAU/PNpOIWJUF4GimAHWFc1PYAUu34iBzqA9MSEWhFory5jfqHMe1q6OrZcWBy31XTAAYr4rx6y0L3w5L12uHNisGFS7Ijqoq9uEs6fQ8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(22082099003)(38070700021)(4143699003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LjiWilqYm8mpCfkaM8ZAJ6t+KGW/n6qrPNlOG5+VgF/k25vPRvca+QsFVi?=
 =?iso-8859-1?Q?E4eOUwtrIrkiS0+YOMSsrVPhp6vOjThXU3wGgw+LCliYUMmq7Op+orVGcN?=
 =?iso-8859-1?Q?DZ+w3kYVPs0vMRZhqQWQbmODRwwHQI5ApxKah7Oj/ocnl+cKtEf5NwkDQH?=
 =?iso-8859-1?Q?vND3PRbiNq6j7/3xwamWWMHuxMejT9OgbZDBAapWK53fL52H1d5H56/7id?=
 =?iso-8859-1?Q?9p71eW7htcKnM3mom4aMZKGXSzMoNn+W9EfQAnxR8ZuIYF7CWwQ+msrKDa?=
 =?iso-8859-1?Q?pvj5AGLLbZ7edtEpNN0YMA6N8h3jaCHJEFXtra7bHWZ/k8MszaPcRutUnP?=
 =?iso-8859-1?Q?MozL7Rx5iu5GlLeOJoHt+CS8XY7C59LXIFe7nMZgE3oNS3oU3kx9XBo+Z/?=
 =?iso-8859-1?Q?QE6seF84fS4q4J7YpTtW9kMRQ6MfFPhkMEgLJFWoJ6K25F4GS8v8UlZeRw?=
 =?iso-8859-1?Q?xyOmEfIQ+Sjvomaj3jup4S6XaTlZ+6yKobbUko66/cdcuFXZ7+zxk/hN8y?=
 =?iso-8859-1?Q?XrEaggDZXn9q2JujIMsmm5aR9uL4GeH92n9Gm2VcY5eBcgW9N0tdBz9Dwd?=
 =?iso-8859-1?Q?JwrXV24OYlXZ/Zxkg+oxFyCQb0yo6+AbMxsAejCb6pJU5gD5IKLwAmfJ8c?=
 =?iso-8859-1?Q?8VEMC9p64yPX9iOa3x/2bWRCQYzMfnlj9odcv82Q+dj6unv4DJctE4WtSj?=
 =?iso-8859-1?Q?YqBkDj3lpxlG6fW11A34l8TV4BdyGZftUWol1ioQSaVmu+hsWidoQq0RyB?=
 =?iso-8859-1?Q?R1iS3PBK+Lk2D2Z88Qz7lb1/iG3SrNNi08HyI242sJBsyOaWfVKoQIIgRo?=
 =?iso-8859-1?Q?q7EPK2pRRoerUcuE5NcwlFUX5CWNanNq5du8jsPKxQJz18MRjyQFDenw0e?=
 =?iso-8859-1?Q?H7B7+xDZkoK3DXIT0/Lw8JsZUzJ2UXpCF8N5UIkED1IZuwFLXbWcc1+jfx?=
 =?iso-8859-1?Q?o7r2btDPuXsgludSm+wYnjoHAjFHFo4FksUWv+e4yGRcCgC0Jul3I20UlL?=
 =?iso-8859-1?Q?+2Wv1rF+U66/xgDQpoQw6evnZPbhL0rMXNXEnbO8ONDAfcLatj3PT9g9+u?=
 =?iso-8859-1?Q?s/2CyZfMGW4WyTMgBav8gjw782qakWxYZWhydg8p9r5ZFWr3rjLhkfGi2e?=
 =?iso-8859-1?Q?3ky0BfFBK2llsjqHtjHVn3kKbvq2DJDaaSvR6HmcuPr3ynYeAAnBh0QPpf?=
 =?iso-8859-1?Q?/U1buGJvv3PYA89Lgp5qpHXINXQHvt7Xv3agxKMEymzSa5NrYlsGi5kQyy?=
 =?iso-8859-1?Q?JojY9CbpV+fUO6s07063xwTZfMNdqa7HgamcUp//726uXoJXniyxAKxfnU?=
 =?iso-8859-1?Q?ygVnE7CGVR4+tAm1uFt1TlKadIC9hYU2tcyyb9nCCqO87Nebjhy3f+ANZo?=
 =?iso-8859-1?Q?+CpuUfcdVmFtJzkFGTqYiR4Pst1M+L5nNmJWsFKqpio02OHB+UhJUuSVM3?=
 =?iso-8859-1?Q?OT0amCVkh8ounGBgI42tkLY7FvEs9zgpxtQO54SCvaEvz87GAFYRpHDX3J?=
 =?iso-8859-1?Q?HnR7+f95qRSYYRVu8/S25c+gOKVFAWg5yKzm9r+3sf6TO0M5UVI9wNwLSb?=
 =?iso-8859-1?Q?aV9HyAfP6xZyodgGv6T4VrcOaXbf0iyGSExAaJYeBaufvg67VkEgbIWP0e?=
 =?iso-8859-1?Q?TdsEcZ1+Y16iTBWJRcNzx4k5dEBDN0KvOG8zQzSvXu4RBeRyz0oXQhZ6Ol?=
 =?iso-8859-1?Q?dNE1AcogN3d/TbUGMlhJkmdSuRIWtxpwfT4LAOGVUPmdswXIxgRmebrYJL?=
 =?iso-8859-1?Q?xwwfMnTcvC6WMg2afSbp/WXFFynVfInU2uj6x0O+s2wWBNjuVDBN+ghbgW?=
 =?iso-8859-1?Q?uh7vPX6ACA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e26955e-54ed-470c-1fe1-08ded679c158
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 07:32:35.5903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0MCnHOfHfnc6ZH2HTyGcad1MeDMEojeYXPhumC9ydLTIyHmH+hBSRgt9bhS+QiuQPF/8MYYY7osHkQF8XU25N6fWspGupZL5qcA8pPRh0sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0476
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hpa@redhat.com,m:mchehab@kernel.org,m:hansg@kernel.org,m:hverkuil+cisco@kernel.org,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:kieran.bingham@ideasonboard.com,m:anis@talbi.fr,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dan.scally@ideasonboard.com,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66043-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,kernel.org,linux.intel.com,intel.com,gmail.com,ideasonboard.com];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	MIME_TRACE(0.00)[0:+];
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
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,siliconsignals.io:from_mime,siliconsignals.io:email,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC5F06E137C

Hi Kate,=0A=
=0A=
> Update the con_id for the Sony IMX471 sensor to "vana" to serve as the=0A=
> power enable. Additionally, the HID values SONY471A and TBE20A0, both=0A=
> associated with the IMX471 image sensor, have been identified on Lenovo=
=0A=
> laptops.=0A=
>=0A=
> Signed-off-by: Kate Hsuan <hpa@redhat.com>=0A=
=0A=
Thanks, looks good.=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
=0A=
> ---=0A=
>  drivers/platform/x86/intel/int3472/discrete.c | 18 ++++++++++++++++++=0A=
>  1 file changed, 18 insertions(+)=0A=
>=0A=
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/plat=
form/x86/intel/int3472/discrete.c=0A=
> index 115bb37577a1..adff564bf3fd 100644=0A=
> --- a/drivers/platform/x86/intel/int3472/discrete.c=0A=
> +++ b/drivers/platform/x86/intel/int3472/discrete.c=0A=
> @@ -164,6 +164,24 @@ static const struct int3472_gpio_map int3472_gpio_ma=
p[] =3D {=0A=
>                 .con_id =3D "dvdd",=0A=
>                 .enable_time_us =3D 45 * USEC_PER_MSEC,=0A=
>         },=0A=
> +       {       /* imx471 expects "vana" as con_id for power enable */=0A=
> +               .hid =3D "SONY471A",=0A=
> +               .type_from =3D INT3472_GPIO_TYPE_POWER_ENABLE,=0A=
> +               .type_to =3D INT3472_GPIO_TYPE_POWER_ENABLE,=0A=
> +               .con_id =3D "vana",=0A=
> +               .enable_time_us =3D GPIO_REGULATOR_ENABLE_TIME,=0A=
> +       },=0A=
> +       {=0A=
> +               /*=0A=
> +                * imx471 (on Lenovo ThinkPads X1 G14) expects "vana" as =
con_id=0A=
> +                * for power enable=0A=
> +                */=0A=
> +               .hid =3D "TBE20A0",=0A=
> +               .type_from =3D INT3472_GPIO_TYPE_POWER_ENABLE,=0A=
> +               .type_to =3D INT3472_GPIO_TYPE_POWER_ENABLE,=0A=
> +               .con_id =3D "vana",=0A=
> +               .enable_time_us =3D GPIO_REGULATOR_ENABLE_TIME,=0A=
> +       },=0A=
>  };=0A=
>=0A=
>  static void int3472_get_con_id_and_polarity(struct int3472_discrete_devi=
ce *int3472, u8 *type,=0A=
> --=0A=
> 2.54.0=

