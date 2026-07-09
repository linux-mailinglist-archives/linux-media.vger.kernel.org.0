Return-Path: <linux-media+bounces-67086-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RJG3H60KT2qCZgIAu9opvQ
	(envelope-from <linux-media+bounces-67086-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 04:42:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0C072C173
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 04:42:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=qL3sMNtv;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67086-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67086-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30A80304AC3E
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 02:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5FC342517;
	Thu,  9 Jul 2026 02:42:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010025.outbound.protection.outlook.com [52.101.46.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B92D30FF2A;
	Thu,  9 Jul 2026 02:42:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783564925; cv=fail; b=JysFauKxhEIv5Z+5V2+r3GuMHXM78Ws7skGzy2N58qwbiFfJv+1db07t6GOR3RUYPkvax0vbA3qTYgtx9GDgLY721J8ON+9oET94dRW2WFtOzIFj1CR9+fKeRlxytd2uZnPL4Z1wQU8r/9fk8VkfDHNEkYitR6awneydWjqHrW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783564925; c=relaxed/simple;
	bh=4KvtH0oPQt4D8IHU+AJA+daaAePpRB6Eefw5SzJMr+g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Taudx19zSqtFQ+D0xIrGwbOyTkGpvFQo6Y1XIz/Dlt2JQzHHnuNHk2tX2c3kSnNeYktIkCt5VBq4YKEHuai6gUDOIJ/AfDdtHAfQICyZokd8Gt5+LKVGSSiTO7KBCkQPZkiUzbaheaOY3slWbnrTNGA/kcLmNJFj7V2GI9wjAyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qL3sMNtv; arc=fail smtp.client-ip=52.101.46.25
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzocGD4TP423F2mEJFq+Z5JHRdcqRwy4nSVqxrZugpTr429XRLeJJUw0XhAYvWu8BZCzjiEZqvhAyBPJShnPGmfvBijwIe5etCnyD2I6/kKq9NyIWdsN/bYt6ARrlhXZtr91t1h6rXcUg6siIexNWyBYzq3Y0b8i7Cpr7MW0sYtRUX8ScNBK+hvbcVkuOx/l8Af4beCUNCDYucIindCPAVXACeTIPMA9/uoov5km33fngqxvRbnYT09tUqofexHVaaWNO0PC9/wPeIdV+YMWK2ee7QQH+VIaxZD+WS2o2IkIFMVBNeNOpAMIzTDD/sW5bHme2Fu/8tN4HFIkB3pQ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoaBVu8xgXWWU6+zzJt0VbJMN6/5KUU4e9X1E7uMHI4=;
 b=pFpmbIjw9cgS1iGqu3uJRqasOD4F7LmLbUtf0ZV8yEOZLniz6to/+yweh3DUx0EpUaQ0up4X6YApHmX4nz+d7cLDG0yN2PC3PXx2l4DJHizP/POo6GS4LjwqqV+soxTyGixk1EB2IUL1EjUAfEhk/qWnODrQMo8rEYOeFAO+2xb99wc5LHp0CSp6EfU5ckiHJdl0mPapC5LUe+Yac9OVAHni73vi11dxi/nX5uT5wFojlsI0AfhPocy6tEFx7qi1bVatblHSAGxe0Qh0/vN707zb7XxOeAhpgRdxGZjS8onMOgyBw3WFJp9zes+DnOQWLHefI/5xiCt0kiT8CxZJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CoaBVu8xgXWWU6+zzJt0VbJMN6/5KUU4e9X1E7uMHI4=;
 b=qL3sMNtvity0nv0/GwvfmTct4+Bk5MaEiFzrMvbnH9yybMVdKq8qLbcnF2/A5YsTueX05oFDBExGkLRzTTOSmz7EaDgMmuaTiAymTsfLNRakSGC+APTi4aJmf9ZFQKznZv4x6raaa4F9hlnCkEkDknecW6QRrGiP9jQ0HEhoxfE=
Received: from BN3PR12MB9569.namprd12.prod.outlook.com (2603:10b6:408:2ca::9)
 by PH0PR12MB7077.namprd12.prod.outlook.com (2603:10b6:510:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 02:41:58 +0000
Received: from BN3PR12MB9569.namprd12.prod.outlook.com
 ([fe80::2aa1:eed7:b03f:5020]) by BN3PR12MB9569.namprd12.prod.outlook.com
 ([fe80::2aa1:eed7:b03f:5020%4]) with mapi id 15.21.0181.010; Thu, 9 Jul 2026
 02:41:55 +0000
From: "Cao, Bingbu" <Bingbu.Cao@amd.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: Yong Zhi <yong.zhi@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lixu Zhang
	<lixu.zhang@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, Dave Stevenson
	<dave.stevenson@raspberrypi.com>, Richard Acayan <mailingradian@gmail.com>,
	David Heidelberg <david@ixit.cz>, Frank Li <Frank.li@nxp.com>, Dave Hansen
	<dave.hansen@linux.intel.com>
Subject: RE: [PATCH v3 1/1] MAINTAINERS: Camera sensor and Intel IPU driver
 changes
Thread-Topic: [PATCH v3 1/1] MAINTAINERS: Camera sensor and Intel IPU driver
 changes
Thread-Index: AQHdDwzpaWmAnU75rkmKOZRHlweqULZkejDQ
Date: Thu, 9 Jul 2026 02:41:55 +0000
Message-ID:
 <BN3PR12MB95698DB85E8C5715AFDA62A58BFE2@BN3PR12MB9569.namprd12.prod.outlook.com>
References: <20260708190626.371657-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20260708190626.371657-1-sakari.ailus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-07-09T02:39:20.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN3PR12MB9569:EE_|PH0PR12MB7077:EE_
x-ms-office365-filtering-correlation-id: dd5cc5e5-a5ac-46b3-0cfe-08dedd63a419
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|38070700021|22082099003|18002099003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 /3t3YVLvKsEqxZWJtQQSfBlPBphMMPkHoOY8lXJE8QrcHu7SyAGzbm0INZ0G2SKEOlHPVvpYSDqbvWh2fUCqA69+Efq0gtu8Pspflb84ATd6EsYfRvcVwdzW9h3A0QH9oWc7thbx3N48q+E57/u4grwbyyCvS4Yw43CrvZeRCKf/hPecISMfrkmQpvpG8WcNzVwkk3Shc8zi/QgJoN//uE+rZbk+mVS5yret77NdBDx/6nC+1c2u3Bsg+qpcbhgPAthsMR/M/C7SDvsOiKaPG1FGnkfbgVR/T5VBMo+E+xFqXBWsqoktnA5bsY65Swrs+Zj/lSCGvmuM+H+1p3ErS5sGNOtdBjsPM2ks2CGjmgLtcSThs9tzrjeba+Ut6FyQt323GQqerVTqqBy+pLOPuvbI63e9W686APGp8nZZSMW/9P+XDQWTHFNRgVeOjRXKsZ5O1IeIlxWTBs8Cyb6OgMXch6W+xpBEsuZp9gJAAmigmQJGZL2v+JOD+aIjhkCvbpvrfXqHq6B6JvGcKw0Xr7Do+n+iSfjU95ox+eIpbM+wR0FwMWKN+DSxpNkxaAcSQArKpPTvssRhgZPaigZMXylM8G78icT6qQUNdtSQQESm5QRw7BCKO8lNocVpg5AvGkzd93ZPn+8ecFtijNrOkJy1Qq9Xg9rjh6EWLPwwrSPtLsmkNxpaaf1gq62y0j+4DcHiqDjN/OvHt8BWkBM517VUnSZnDCf2eHTyFIGs9wY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR12MB9569.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(38070700021)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OcIsLpC3s6E7MnMqICBBNtkkow2FTpNC4H+k7yTmgluRaCIhzF8mkpFwuC/y?=
 =?us-ascii?Q?V5+VoSI3zkG0fHtTy8eUQW4QPaYM248XlIvRwhCiudpFjM7zaLyrRESs0rPR?=
 =?us-ascii?Q?fENm+r931oD/Hu1cLAM+F9h+ADxmcbBvEtm/kyky+6Kz/vjmD3WS4aQC8Ij/?=
 =?us-ascii?Q?lzGIGg+KwFJ8nT+fugVU7XKZZ67s4eZxMf9NWEZBiPI9GY5bfDfYZwLSSZCa?=
 =?us-ascii?Q?7BZgaaRWVlMqRBBtcySLeBvbbMd+61pfCSYVOCBdSh6ktpfSSBVzPCBKIgsP?=
 =?us-ascii?Q?m4AXWG5yfaNMP6M8VeaoJ6N5XiTjG2k7OFT51+acC9crFFZLnFY041QmmMw6?=
 =?us-ascii?Q?oELt24Ue5GyuQJ26Tw8ebUrGDDeUYehgRi2FgZ9/T7kOURGbZT38gDCGa0uv?=
 =?us-ascii?Q?Q56lZJlVEH1mnpbNu9BS4ZJO8voIA5gIKXuuz5SG89WlQZxeY1i+yXupuNjR?=
 =?us-ascii?Q?h0oArNFmp40HIgUdmX5Bm+pHP5azdD8tiDfS5zTQFjfZVhqaf+LMhP9wrVjO?=
 =?us-ascii?Q?pcXHt4y+4nhQK8Hicm+O3Mx4jfJ4Uwf7XxxNgKAftaBUeqOVPj2QXBvdZQYi?=
 =?us-ascii?Q?tuVz6+hbIuc3kn/tCoT4N4MHEWuSlhWImARmDXXVeEy9P9CMvi7ifggZWr8B?=
 =?us-ascii?Q?RXa3jJoBisFiEdFdmd8ZqbIdD5WXLlK3LZdl0oVe+35F1X3zFybbZemxWAfK?=
 =?us-ascii?Q?1lzyoMZRX/cYmcaAKFBLqetNwh3VUmvgff51S84dBzhBKW+a9bescVHanj3m?=
 =?us-ascii?Q?7WHAgpKyebURaZaS3Llp6sC+zIsuuSjScQr5MsRjuhKZG+717r6oE6J4GSt3?=
 =?us-ascii?Q?vKrGOBf2Tm9f1JCvfN7/8WJZcSbJUc+pXGJ4ydr/J2Y1FEBDTdvmrVzak4ad?=
 =?us-ascii?Q?P4pVvU8KNwnb7dKYo0x5exM2g9hcfAFnaaTFB3o905/g2fT6daZn+UovnwJ0?=
 =?us-ascii?Q?oWcXx49YI19pr9IgKu6ERbXTToiJZQtw8MzBhrIzPL+obC0JSRA5jqOCanp1?=
 =?us-ascii?Q?3f7LglMbHWMkADcUkAWxb1eaE4LnJJKfBykVdIcDjVpJSq+yGoeXBkReYzFk?=
 =?us-ascii?Q?hrBK/oinoYHLFeGNaRJON0qNdy4gNbj764lvyl5ltQP4u8WhTqgMnW+QUUWY?=
 =?us-ascii?Q?0jojOyKoEzJZXwS7bO2ljypr1emwqencZw/XLlie031w8JW1seFcemQAegtc?=
 =?us-ascii?Q?JBAU8re1NOz4HMEdi2XBr+EZa25eQdSjmUai2NAzhdQOUImyh6+vo13m6+9R?=
 =?us-ascii?Q?fFyvRl5bWASuHnt8EuhG+Gcbe+JPzi7w/l6qYguhjOyJq5FTp22Nw9Lwmpne?=
 =?us-ascii?Q?hvofemUnKKXBYXsmZ6WCCH3Zaf9uTYorMd4N+DiV2y8dVJ7f6e+HbkAW0PsM?=
 =?us-ascii?Q?gPUWp4GH0y2OpkKkdO0l8kU8oxoll6akGs28Wvrm2B090W3UnFLPz5iQwqeP?=
 =?us-ascii?Q?7BYNdASPc/mw/zrLAdd39nv8zRvrR5UevEyIhl2kNL71kA/6utChKIv4CZmL?=
 =?us-ascii?Q?n3L0UITEjRYXUiSKnibcwlntnTXSVVRhHrSN9Rs8oQ0qRfvWY1ZGow3i5IVj?=
 =?us-ascii?Q?Bp+QufI7od/u3Lkd2JO7wvmcVYq6VqzEk5sPT6ZJV5cHlwHwql/ZLKiQ0jG5?=
 =?us-ascii?Q?5qqgyUssgr7oQTewMt+Q6XHRhdCkEHtcfve3PKmAV1oMA5IMcU35zIs9pNgo?=
 =?us-ascii?Q?FKUoTPixu3e3H/i8TiBGp0cLNu4PAxdEBjV5NseKLzlZPowe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN3PR12MB9569.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5cc5e5-a5ac-46b3-0cfe-08dedd63a419
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 02:41:55.7169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ne1Ysti5XaA2jvU+NlD+e+W+f/F4xmQdosrxswDTx7w3OoRwWJSqf/zRkXbPjRbC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67086-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:yong.zhi@intel.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:lixu.zhang@intel.com,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:dave.stevenson@raspberrypi.com,m:mailingradian@gmail.com,m:david@ixit.cz,m:Frank.li@nxp.com,m:dave.hansen@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Bingbu.Cao@amd.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,raspberrypi.com,gmail.com,ixit.cz,nxp.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bingbu.Cao@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF0C072C173

AMD General

Sakari, thanks for the patch.

Reviewed-by: Bingbu Cao <bingbu.cao@amd.com>


> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Thursday, July 9, 2026 3:06 AM
> To: linux-media@vger.kernel.org
> Cc: Yong Zhi <yong.zhi@intel.com>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Li=
xu
> Zhang <lixu.zhang@intel.com>; linux-kernel@vger.kernel.org; linux-
> staging@lists.linux.dev; Cao, Bingbu <Bingbu.Cao@amd.com>; Dave Stevenson
> <dave.stevenson@raspberrypi.com>; Richard Acayan <mailingradian@gmail.com=
>;
> David Heidelberg <david@ixit.cz>; Frank Li <Frank.li@nxp.com>; Dave Hanse=
n
> <dave.hansen@linux.intel.com>
> Subject: [PATCH v3 1/1] MAINTAINERS: Camera sensor and Intel IPU driver
> changes
>
> Caution: This message originated from an External Source. Use proper
> caution when opening attachments, clicking links, or responding.
>
>
> From: Dave Hansen <dave.hansen@linux.intel.com>
>
> Tian Shu Qiu and Bingbu Cao are maintainers and reviewers of a bunch of
> media drivers (7 and 9 respectively). Bingbu's e-mail address has changed
> and Tian Shu's is bouncing.
>
> Update Bingbu's e-mail address, remove Bingbu as a maintainer from Intel
> specific drivers and remove Tian Shu as maintainer. Also add Dave
> Stevenson as a maintainer and David Heidelberg as a reviewer for the
> imx355 driver.
>
> Also add Bingbu and Tian Shu to CREDITS.
>
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Yong Zhi <yong.zhi@intel.com>
> Cc: Dan Scally <dan.scally@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Lixu Zhang <lixu.zhang@intel.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-staging@lists.linux.dev
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Acked-by: David Heidelberg <david@ixit.cz>
> ---
> since v2:
>
> - Add Tian Shu and Bingbu to CREDITS.
>
> - Fix line ordering in some entries.
>
>  CREDITS     |  7 +++++++
>  MAINTAINERS | 29 ++++++++++++-----------------
>  2 files changed, 19 insertions(+), 17 deletions(-)
>
> diff --git a/CREDITS b/CREDITS
> index 84793a967a0b..7456c8bbffc2 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -640,6 +640,10 @@ S: 25-29 St Giles
>  S: Oxford
>  S: United Kingdom
>
> +N: Bingbu Cao
> +E: bingbu.cao@amd.com
> +D: Ipu6, ipu7 and camera sensor drivers
> +
>  N: Luiz Fernando N. Capitulino
>  E: lcapitulino@mandriva.com.br
>  E: lcapitulino@gmail.com
> @@ -3334,6 +3338,9 @@ E: rpurdie@rpsys.net
>  D: Backlight subsystem maintainer
>  S: United Kingdom
>
> +N: Tian Shu Qiu
> +D: Ipu6, ipu7 and camera sensor drivers
> +
>  N: Daniel Quinlan
>  E: quinlan@pathname.com
>  W: https://www.pathname.com/~quinlan/
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2aec6afa8108..d794223144cd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3946,7 +3946,7 @@ F:
> Documentation/devicetree/bindings/leds/ams,as3668.yaml
>  F:     drivers/leds/leds-as3668.c
>
>  ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
> -M:     Tianshu Qiu <tian.shu.qiu@intel.com>
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -13135,9 +13135,7 @@ F:      drivers/iommu/intel/
>  INTEL IPU3 CSI-2 CIO2 DRIVER
>  M:     Yong Zhi <yong.zhi@intel.com>
>  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -M:     Bingbu Cao <bingbu.cao@intel.com>
>  M:     Dan Scally <dan.scally@ideasonboard.com>
> -R:     Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -13146,8 +13144,6 @@ F:      drivers/media/pci/intel/ipu3/
>
>  INTEL IPU3 CSI-2 IMGU DRIVER
>  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -R:     Bingbu Cao <bingbu.cao@intel.com>
> -R:     Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/admin-guide/media/ipu3.rst
> @@ -13157,8 +13153,6 @@ F:      drivers/staging/media/ipu3/
>
>  INTEL IPU6 INPUT SYSTEM DRIVER
>  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -M:     Bingbu Cao <bingbu.cao@intel.com>
> -R:     Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -13167,7 +13161,6 @@ F:      drivers/media/pci/intel/ipu6/
>
>  INTEL IPU7 INPUT SYSTEM DRIVER
>  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -R:     Bingbu Cao <bingbu.cao@intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -13469,7 +13462,6 @@ F:      drivers/net/wireless/intel/iwlwifi/
>
>  INTEL VISION SENSING CONTROLLER DRIVER
>  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -R:     Bingbu Cao <bingbu.cao@intel.com>
>  R:     Lixu Zhang <lixu.zhang@intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
> @@ -19902,7 +19894,8 @@ F:
> Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
>  F:     drivers/media/i2c/os05b10.c
>
>  OMNIVISION OV01A10 SENSOR DRIVER
> -M:     Bingbu Cao <bingbu.cao@intel.com>
> +M:     Bingbu Cao <bingbu.cao@amd.com>
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -19995,9 +19988,8 @@ F:
> Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
>  F:     drivers/media/i2c/ov2735.c
>
>  OMNIVISION OV2740 SENSOR DRIVER
> -M:     Tianshu Qiu <tian.shu.qiu@intel.com>
> -R:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -R:     Bingbu Cao <bingbu.cao@intel.com>
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> +R:     Bingbu Cao <bingbu.cao@amd.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -20139,8 +20131,8 @@ F:
> Documentation/devicetree/bindings/media/i2c/ovti,ov9650.txt
>  F:     drivers/media/i2c/ov9650.c
>
>  OMNIVISION OV9734 SENSOR DRIVER
> -M:     Tianshu Qiu <tian.shu.qiu@intel.com>
> -R:     Bingbu Cao <bingbu.cao@intel.com>
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> +R:     Bingbu Cao <bingbu.cao@amd.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -25217,7 +25209,8 @@ F:
> Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
>  F:     drivers/media/i2c/imx296.c
>
>  SONY IMX319 SENSOR DRIVER
> -M:     Bingbu Cao <bingbu.cao@intel.com>
> +M:     Bingbu Cao <bingbu.cao@amd.com>
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -25239,7 +25232,9 @@ F:
> Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
>  F:     drivers/media/i2c/imx335.c
>
>  SONY IMX355 SENSOR DRIVER
> -M:     Tianshu Qiu <tian.shu.qiu@intel.com>
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> +M:     Dave Stevenson <dave.stevenson@raspberrypi.com>
> +R:     David Heidelberg <david@ixit.cz>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> --
> 2.47.3


