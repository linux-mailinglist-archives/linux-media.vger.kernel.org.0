Return-Path: <linux-media+bounces-58735-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MBcFFYV3mlBmwkAu9opvQ
	(envelope-from <linux-media+bounces-58735-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 12:22:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A24883F89D2
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 12:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3928F309C25B
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 10:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A033539A801;
	Tue, 14 Apr 2026 10:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="U8vD82cB"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020101.outbound.protection.outlook.com [52.101.225.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B80639A048;
	Tue, 14 Apr 2026 10:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161969; cv=fail; b=W0BNYOpSVRDlHdrVN4dUKWk+ZaUHTRtpaZjMkjGDNJEZvSSex2IPgSClafuqplkZQM02kYB5+HwdBIFi+R4cEZH/HG36S2cblobOFBfkSxc9HZvt3Rep7UHZmWhkvWUp8OpnGGlyHsha851UpUqV2p9HJ7oTgxEelOw7b7LiZNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161969; c=relaxed/simple;
	bh=yWv2fs4mEXJIUh8Gm5vnNOgOIPkGS3qmizPB0Md0za8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZJAgCmp3uU7QT81gGrf2cQeSnLIvQNd9dMZwwnNu6ikWzGmPmi76msldt03HmkwugqJUp/oeIhxu8Ua2MD/Ece/jjPw7clmXmKtKPpZLbNW3zoL5FHs+CTk8OobBtKBSMIopMQ/+Rf3dKhNRORmOomkJw8W6Tpcq6YsHCj8OFTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=U8vD82cB; arc=fail smtp.client-ip=52.101.225.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oISujp+8Qjs2xlCc0Cph+UvypOYC55j++DATPLtEuvM9jWL8kWNNLtxeDdB7JYRpsApZ2k9Cr79V/zGaDNlGB8Ya57k70VVPPffRL9G7ydkOpeIjFxvOHc+0Rffls37/YV43osWK/ZkgsoZK4n4JXkZdgAEtrV8vtwb50MqWjacFYo2FeinrDPntj0+ddbJ4roT1U4s9nI2UWsnFWK8+B4tC+tfwGDRpv6Y6J6f0T8U7ZIYKdiZaNcYCXuFhIH97JZMjEskYThKN5NKxSPWI307pEO/Wd3WuvJE11OheLwiYd4nqyv4KmjyCVGWNFgHBZDXhjJHXhhWk8MyDqtXFqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psHEmN5J/7P0pKuQIwoydbBepgYSvxPRHZw/paz8IVo=;
 b=uCgiPeqJqpFJUtlviVGEIXFz4clyIZx7+7v7me/n1HD6ft5DIREryb5QZZ7UgOy/+0pjS96Q7JH7/hcoBVWx5RKgJxlfSFl1xvaZZdhfzHXik0KjUdjeKpcHveMx7MDmFBCf7z38ss70XOq3WaAqYcI/UVf/SAdwQDmahY37CDglWsGQIA2ewqVdTifTjUjftrEroKKbmorkUyYaQUvsp7g4Kxd615sPIFiCwBdVwdtpB90UEuGZ+H7JuDAb+kFybZ+fuzNzySHp0FM1t8xSycuaPXNTD/2d37ZxUUOro+LAV4ZGzhUJi1ePrfusCzmyRa0sk0LbK4Rsu5M6Cst5ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psHEmN5J/7P0pKuQIwoydbBepgYSvxPRHZw/paz8IVo=;
 b=U8vD82cBUo+JxcadSCEJVJIs8fPjuRb+VSOWOi75nVQFWO46orcUwJh8923V23jacrkwKM6h8SBB2DLK5jfVkhXpwxEtuBp90+bLLfJ+WXlm9BcUHbn6NqQTDXAzVx1sLuAWsgr9Mt4UXXDyJCEvR8T21Sdbgn55nj+AviCy/rHL41V1PxpFX1P7FmJ2YoCr4b/ioOwu+GqhKL8bwq9oQFPJ2/1zXe7hcsDEcRnlUT+e903C2YDRw8UTLFO3RfbdInkQUfXtfCcRr+zh5wc5F/3p2lTCGVxn/GRLpbuQ6m7GkQMuBrXBAJ4+eiTXcfoFeJG5z13qXLXi6Sq4VLzoIg==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB1297.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:197::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 10:19:24 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 10:19:23 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans
 Verkuil <hverkuil+cisco@kernel.org>, Hans de Goede
	<johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, Jingjing Xiong
	<jingjing.xiong@intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] media: i2c: add os02g10 image sensor driver
Thread-Topic: [PATCH v2 2/2] media: i2c: add os02g10 image sensor driver
Thread-Index: AQHcy+vWBUkpJCAFDUe7ec61C6XXZbXeSh4AgAAEWQCAAAPkgIAABb40
Date: Tue, 14 Apr 2026 10:19:23 +0000
Message-ID:
 <PN3P287MB1829155B216E557C7DF7B6778B252@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260414084952.217215-1-elgin.perumbilly@siliconsignals.io>
 <20260414084952.217215-3-elgin.perumbilly@siliconsignals.io>
 <20260414092758.GE4061@killaraus.ideasonboard.com>
 <MA0P287MB2178FAA81D07B561FA68014988252@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
 <20260414095727.GF4061@killaraus.ideasonboard.com>
In-Reply-To: <20260414095727.GF4061@killaraus.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB1297:EE_
x-ms-office365-filtering-correlation-id: 6c376f7b-58a9-48d8-3762-08de9a0f4ca0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 wBHHxLgO0n+pVh08+MjZbwOaUibUdZkUAw1SoGZrm7JuzPMLIgNqBi1gvsFxpGnY5omjeyRQ9DssJ5hspgySdJL3wB6Vv3yfud7fsAa/Hdq2PO5CAmxjtK9RWp85MwcruE1AH1srfF6g6EuTgFt0Xlv2wNa35lMjuTAawvNjyaI7c/mWGz8qkdcUnyD59XQkMgUqutJsFDMD4zoORpL9HFc55NNu4DziJnNXLBBJc3Zl1+NBgpfQDJyKGcpdRU6y4ZxBgkkw9Z85KJlxHyZdfhx9aRHFxyi61tnDSlVsobp7E5em2Dlmm07zgfUNe8Bk8vRFmlzJewyBWJJFLfRa15/WIuxMyaT4U99SInD93Mk6ibwscSAeTWwrEd8E5ebSrs/w6h0JAKBVt6Xv5XWF8wklnD4Dz7ShQhmOrj3DyErYdBGbZGTQAYT8N0RSvuYKhGrTRKP/TtoxmldzSMRvIYTCDUltqXWCs/X0UKmPuJLesrNsrF99DFwzCJRerrwMIxKZGAuPNVW6EUJWQ35jYDQm/wZL+frnRCag73WVapj+rXuudGLQpqSOzbJNlo6Z4wRFPb1zl7VNkMdfAM3gSTAqBumsGMl2AWNU/g7HeCTRU+d8Mr7pfr4+bhUxGYBv31kZmrloey7BW32UzwtXucZIN4jHAwxuPSFP9Jn0nhsfY8cAAfB7PTdAlIolrw2WP3ZEZK/Z83ByEvdGIoRBYvshIAMbzNF7xY4/U6R+tHjyIXOUBeKsTJkCzw9nds2xrl0xohiihhkSjnpP4wUmVjeBXDhKaqrOX1fIOU0SRwE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DK8Vjwtk/yneIesalGVXK8KNeqYsDXiU93KR++SpkZ84jqVzTWXTDvnnyk?=
 =?iso-8859-1?Q?Zz0S4UVKK4g4zc8ymqo6A0FSpFFJ2Cn/QcEYzD0aRgkVIGS3tn6VL4uZFK?=
 =?iso-8859-1?Q?9+NqwbKKVBV6rW69zuQ4B4iGWGOUveh6EWA4ByWjpsUuRwnrCktUBrIzRn?=
 =?iso-8859-1?Q?ipa58VLgJmos4CGy8GsFXJ6/f5uABit3qKdy9UjTXz8id4drzA8Eb4HtlP?=
 =?iso-8859-1?Q?a3eiDwTfIeuIyCkwrT4FWYmpmv19QeeSLzkLce23S95KGYAijEKf4qOmbz?=
 =?iso-8859-1?Q?XTcQUVQ8p+dN56fn5ksmx8qelj7LngRwBadkyvFHWQDD7a3I7FkprVossE?=
 =?iso-8859-1?Q?/So5yh/g2H3u5unTdQzYbnxoUHyZkp7iJS3u/M3HFQwQFQWWU/UW1fWl4k?=
 =?iso-8859-1?Q?KL3q9wbiSnkJl/H06QplndTYxVc2K8mXDvDZz4kG0jh4/5AsRoJZLEIUyt?=
 =?iso-8859-1?Q?oQe/b70VsmvCE6wzRXrlEEOMg7ksnDTcfFGsR4DThGN/prD3p60gnv/+mz?=
 =?iso-8859-1?Q?oGUF2JDSby7qf8ToGGpYx6uOWDZS262TpCfp4xoVyaUxkN7CW2OCKB701h?=
 =?iso-8859-1?Q?oFprLVGCoTbol54bZJ01iAnI/bjmPcO4bXkrA9k3VMBVfg2kOYgcyJNIkC?=
 =?iso-8859-1?Q?cHMnigMr9S7iTEmtskM/CTO4n0oMr5dDhYjtlGIFPmdROKu3/xTRKuMbJG?=
 =?iso-8859-1?Q?RCgzP2G1fNPPjKbsHw6qgrJ6WB3dD4BteYSjjw7+32wEcPn2NWpRWEMbMY?=
 =?iso-8859-1?Q?peC9hC/x0kJro8J48HLafDHVW6sSenkP4Oeuk5/s0isVuGcFhsw47zr6Fy?=
 =?iso-8859-1?Q?eInG6s3VWKfiuo9liwGjhvxR8mbFLMBHhKvN732nUSXy/cXg7cHgBkzml/?=
 =?iso-8859-1?Q?CXreKYtD6rABjAFJXzb6TLuj1XLOfwCwaOkX6uxwAyJTB/ykg55JjHDGyd?=
 =?iso-8859-1?Q?QPt0uQpAULidOZv6JDcZp89kFeIVOL2moZdCfEPSJkTQ1Lv6MrF19BoNlw?=
 =?iso-8859-1?Q?7JEtq6303Rf6lAY5Pkos/Ab6Mzjy9x3KdLfvvg1Ht6pebC/wlWLSNna3LV?=
 =?iso-8859-1?Q?V94lzvUXMNMIGLmNzlOm/0oxauTUPnrn9rl6bOiCZjKOaUJNX3LaZ2yTHz?=
 =?iso-8859-1?Q?xcQeauPDu4nU7KCcIx7FmsW5HmJ0vLxmK4fC+b14DdmErVCwqg7XW6qhxZ?=
 =?iso-8859-1?Q?PiubBxXDa3pjPGpSszCKf+lF8i2/1UGfjMnLf4bQwVQh9pn2NofFhqgo+u?=
 =?iso-8859-1?Q?3XVhm9ebQM0q1op3KE3TZL4uuB1XrTKO5u7fzFFvBgYTX6A0IRSKnaAO3M?=
 =?iso-8859-1?Q?jAY3+NoUuKZ0S0znS86znPphSqYDiJqITQPdTbfFUUtlw8zHdgHBF3NNsM?=
 =?iso-8859-1?Q?4YQCCSuSi4heIESMoUsmf0C/jy1boEBGQy4qjCtbJ5gVeq6Je2hUx1mEkQ?=
 =?iso-8859-1?Q?WKSpth9n1i089F4AP6UGF48/eI6KoztY3ZGSRouG+7zLTRMRCQ9xt2BFKj?=
 =?iso-8859-1?Q?Ij+xFIHDP31igc6o6HYCyjQb3U6DYMay3WG4gYb4xxy4OrIdhP9DrkzgTH?=
 =?iso-8859-1?Q?pbQZu1sW91e0ekBuvGoimBpHhrP0phBVX4OHuKdav5bthyibTJRLA33kwc?=
 =?iso-8859-1?Q?35DgNkksofmVyDTIf9wjBI+Le48sU86XTL9kKJ9ejFwVIfCFlWEq0QPvbz?=
 =?iso-8859-1?Q?G7G2MoFA11PI0OVDfGrD44ThjFTFTxK4uHmc/1quraAfYH0vCdaMbnkztn?=
 =?iso-8859-1?Q?+nWBJScbcclZzyiWZoMk6uMuvcVLqQ6Rt6t6KysD8btNeV5oxbRJYpy9+W?=
 =?iso-8859-1?Q?Mhn4BGmq7Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c376f7b-58a9-48d8-3762-08de9a0f4ca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 10:19:23.3586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RVcFTTs+p9REVEevzsxF7PZRDXYbyhsHSJGy2vgptbdYhX/zcxcD4xr9Q0I/IqcxADWIxsZKZZ5ZEpxtewoyJkEuTxa+cJzc0s7bD7keF9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1297
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58735-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,siliconsignals.io:dkim,siliconsignals.io:email,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: A24883F89D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,=0A=
=0A=
> On Tue, Apr 14, 2026 at 09:43:32AM +0000, Elgin Perumbilly wrote:=0A=
> > Hi Laurent,=0A=
> >=0A=
> > > I sent a review comment on v1.=0A=
> > >=0A=
> > > On Tue, Apr 14, 2026 at 02:19:45PM +0530, Elgin Perumbilly wrote:=0A=
> > > > Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.=0A=
> > > >=0A=
> > > > The Omnivision os02g10 is a CMOS image sensor with an active array =
size of=0A=
> > > > 1920 x 1080.=0A=
> > > >=0A=
> > > > The following features are supported:=0A=
> > > > - Manual exposure an gain control support=0A=
> > > > - vblank/hblank control support=0A=
> > > > - vflip/hflip control support=0A=
> > > > - Test pattern control support=0A=
> > > > - Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)=0A=
> > > >=0A=
> > > > Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io=
>=0A=
> > > > Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > > > ---=0A=
> > > >=A0 MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0=A0 1 +=0A=
> > > >=A0 drivers/media/i2c/Kconfig=A0=A0 |=A0=A0 10 +=0A=
> > > >=A0 drivers/media/i2c/Makefile=A0 |=A0=A0=A0 1 +=0A=
> > > >=A0 drivers/media/i2c/os02g10.c | 1039 +++++++++++++++++++++++++++++=
++++++=0A=
> > > >=A0 4 files changed, 1051 insertions(+)=0A=
> > > >=A0 create mode 100644 drivers/media/i2c/os02g10.c=0A=
> >=0A=
> > I have added a new function, os02g10_set_framefmt, which dynamically se=
ts=0A=
> > the mode register.=0A=
> >=0A=
> > Please let me know if I have missed anything or if further changes are=
=0A=
> > needed.=0A=
>=0A=
> You also need to drop the supported_modes array, and implement support=0A=
> for .set_selection().=0A=
=0A=
Are you suggesting that we should drop the array below?=0A=
=0A=
static const struct os02g10_mode supported_modes[] =3D {=0A=
    {=0A=
        .width =3D 1920,=0A=
        .height =3D 1080,=0A=
        .vts_def =3D 1246,=0A=
        .hts_def =3D 1082,=0A=
        .exp_def =3D 1100,=0A=
        .x_start =3D 2,=0A=
        .y_start =3D 6,=0A=
    },=0A=
};=0A=
=0A=
If we remove this, how would we provide mode-specific parameters such as VT=
S?=0A=
=0A=
Best Regards,=0A=
Tarang=

