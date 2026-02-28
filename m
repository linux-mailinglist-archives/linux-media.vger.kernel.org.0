Return-Path: <linux-media+bounces-53853-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICpfBsNJo2nW/AQAu9opvQ
	(envelope-from <linux-media+bounces-53853-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 21:02:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F831C7CB3
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 21:02:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 858933377E09
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 19:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BFCB3A2B0D;
	Sat, 28 Feb 2026 18:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="EbUsjzT4"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020102.outbound.protection.outlook.com [52.101.225.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ED335AC0F;
	Sat, 28 Feb 2026 18:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772303241; cv=fail; b=psrBCj/j/IMuWrQLoG2AgMpI2tWcj0+pUjenji/4nOHnpsyOgp0lb5Q7T7OW08ahEVYzYnBRBCMk/wiA3Z6nj+Lt2bHUqHJa0esnL/GFVHil8V+57ZI9G59Kb9fzxGcfNgEPZT1TL4D4QwNbLS5RG6vG4pdlAyA1x5vdsCTsWz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772303241; c=relaxed/simple;
	bh=H+qGIFmqmpPPqYI/8t9RS+SvesifnVJ2UDL/TWmB8ds=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rgt1TGcxJZSqJfzousT2yCPeCFoIIkJHsKEuEUqKZbLj1BDTSi0GdxEaDrpwiXKql+Jhv/ageCPFLdd35SvgBlrH0ArPd+P4Ph/eaB+f591IgISA3HsYCzbQMDQ+lN2/TTFbE6GEeVOq4WBEb8T6Ki5qjt+HNQO2wK4Q/rVP/Is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=EbUsjzT4; arc=fail smtp.client-ip=52.101.225.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYhpKELqWtiRoy0XilnYFhKYDa/RIyWG6kuy79wnhCxpgcMxFVxWY2PiIhoM+I3Ex6QsHSDdC1mztsu/fSPl5DkiqSKw86m8oAvbd2hbj6GpAjV+gjC+dj6f7NWFyWS2HvUZWvHGkrHK6aN3umFOz1o7qUZE3dxRxrdSOdDIvyKS0siBD4MPjXlDNCaO4i68x97REuhK8BfIzU4UzFA+cntOPXdSQxUqiwcMPbcP/gQ1SmmnbMQwwphXHGC5Ezk+DhGXtG5HREX3tu4umBX2Rl2dQU2wPptI0slV4ZZRjugTJU6sS/ogir2iHjo3RxDbTYBMOLaVMyMe7hWk0S1Cbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+qGIFmqmpPPqYI/8t9RS+SvesifnVJ2UDL/TWmB8ds=;
 b=LNq0+KfA2VhKUt4gf5QXodOABDblvNeQ1JhzcTa9X9duNhP8/SqYAAGcLctE1gjenFx+grBHe7Dtk83eQK+k+KBG03boXRBxtZiPWYlb021/hrWEU5hSrGF2ho2vE0gsXSFaIp8t3aKsEm8/l4JNrT+BGz64/rl1fJk7BECgaF82DII4EwwLL0yXzHBBuqNonEVC8wWtahHOLb9o3iP2XAQC2G76oG8UvoYdPG159oshC/aW7/WXKMQAD3yERQYnuiq4iWgaWjsEMiyHjuBhle8PuzDbPEPpNPPQ6KHXqqwUiLVUWsgBgWj0db8SljuMJc4WqqnzUhGORb7CVhT2fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+qGIFmqmpPPqYI/8t9RS+SvesifnVJ2UDL/TWmB8ds=;
 b=EbUsjzT4XKVQPxLA/2elvf+VTdLVVboNKMpj5+z+v/JLvyKUkjzXKqwDIOZ+MI+J9VVEiz0ANwkJPxfUv8Oq6PDGxSkF8WW93jJokmNMcpkWqRs58tXorWSgLafA0on6XC4OsN8aTf8a2+WnG9qja2VoGlwT1txG2rXaVOiCmCHmUqugn/+vyPtjIgT/qa7GKAr70/QqYvM3fkrBPR036V18zhYlQAKp5uXzRlKHKVtlSVG7iXKfgNB1M7fh2KJYtXL01pUuy6duLtxxI4Yfc7zAnOlp6Jzy1w43stv2Rj+6Csq23wSIL+NPaW/iPBF1WXsSP6ZLu6RIhkhTKQQiwQ==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN4P287MB4140.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:295::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.11; Sat, 28 Feb
 2026 18:27:15 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.011; Sat, 28 Feb 2026
 18:27:15 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Xiaolei Wang <xiaolei.wang@windriver.com>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "dave.stevenson@raspberrypi.com"
	<dave.stevenson@raspberrypi.com>, "jacopo@jmondi.org" <jacopo@jmondi.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"prabhakar.mahadev-lad.rj@bp.renesas.com"
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "hverkuil+cisco@kernel.org"
	<hverkuil+cisco@kernel.org>, "johannes.goede@oss.qualcomm.com"
	<johannes.goede@oss.qualcomm.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "jai.luthra@ideasonboard.com"
	<jai.luthra@ideasonboard.com>, "richard.leitner@linux.dev"
	<richard.leitner@linux.dev>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] media: i2c: ov9282: Switch to using the sub-device
 state lock
Thread-Topic: [PATCH 2/3] media: i2c: ov9282: Switch to using the sub-device
 state lock
Thread-Index: AQHcqI052fKYfunLpEqiXZTDKw/KXrWYard9
Date: Sat, 28 Feb 2026 18:27:15 +0000
Message-ID:
 <PN3P287MB1829CA4A49FEFE8E9A35061B8B70A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260228083401.1007434-1-xiaolei.wang@windriver.com>
 <20260228083401.1007434-3-xiaolei.wang@windriver.com>
In-Reply-To: <20260228083401.1007434-3-xiaolei.wang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN4P287MB4140:EE_
x-ms-office365-filtering-correlation-id: 26f2ec26-b88e-433f-f81e-08de76f6ffcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020|38070700021;
x-microsoft-antispam-message-info:
 nAuW+/PrASkd8kycLn1zjgJ4KGJPFuG9NmQpD+UpxWwz0ZWkILK/18TJkVFIIAF75loL6bY5uraCAEfPE03w06wRBSzCC0Iv60J6HA/gxlHrzzGrqan4bgS3FQHyYbRtOOAUyBB2QuKCj3/v9beGaQaToy5CsDoo50Al+f8l/6sP2Syhv2VaOpw1UTi9JsvUNefxphF9zVRjxNFy7XOFqafODM+kVA8V5QSLrx0J+5ADYxi5g+xmoVVXAVYT9RwnHr07bdhQYTTTFnpgKkca1Wukd93sTzZlvrxmNdGZtKH6a6wwa2THOMUk4LFMYNyroymRZ8P78cmFMRsXTBu3WEMG68siRqji6aDeMgRIYHQ+kuuTw4F7rLr+qZGGXTJUJrpUrLHdRr6bSl3JpApp+5R3xHdssDetZ175mPENvOcH4RGSgHB67txXgpo6aQkWleIKWoKu+2zgq0jSe1wZUvQOsIdNzKE895Lb7u5jgGlQiZR7BEvPBPO04fOY55t6L4OcxJBSQtPaO6Tco0jHJUNb/1puLmUo8jZm5q0vQQbChySo/XhahiEG3eKUgtEQCRIXpvb/QDIEzRu9HQ1VPzf0WEbm5aOdHi105DmrwS06+o9qG97HrZQv12GzuepgwJE1Hml0u5q/6wyDNsjq7DfRxOv47Y7olMagAHBtywqJ1KP9m7Xx+YGyw4VQe0TzfhZ9jJCSUEKqq5EFCRrVWAxCsUl0X7Omp+igx1NylHkME2P8QLPKKaiCZvWg5psncAGQkb9p74YS8EyRyO1oirWVh2VDL9SRct7Zb2xtPXAhPuN4ce8NG3xNnx4Xlyso
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?i4WDK6BiRQLNjk07+YKDgAwoo8kcTaQMuedxkiOe3FgDWRju3zkoeyLQnR?=
 =?iso-8859-1?Q?WU4VcL4gD6khbOONG6wM3P4WJZRqXxBFI/n5ENMOb3tAR+93b0t3ZtNjWg?=
 =?iso-8859-1?Q?eYWdrB2lC48bkw1dF9Otn5tmCIX80Sy3FAWhW3SLgG7r+Lt/Hih4ixNIt3?=
 =?iso-8859-1?Q?ksMUeHmRZsLCPI/tanM8O3ogMVX5ZV/YconNtyUnDteO//ym09XxMgYYO6?=
 =?iso-8859-1?Q?gCNksIOgamxzxbDp6ZBlPFRUA30tFWR55OpdbgsXucwEE/+9VHfaaaK7MB?=
 =?iso-8859-1?Q?FWazRjkW+R9hSOQvRf3AO/mcwB1zgXNOJdM8/1Hr65xNUWin4soj9yvuA7?=
 =?iso-8859-1?Q?gHSPg+e2E69QUuOHWLkqsrLvc0iyGWCRNnc11i8fiXClSyp/g1isfYZmWD?=
 =?iso-8859-1?Q?2KLEyb6OPq90JmsdliaybTVo90DQ++EY3dMtFyr3xQlCjWqjHLCB3bqH4V?=
 =?iso-8859-1?Q?E1nDjMiUGoNljGk/mA9ACQUNk/6h4+eBzIr6CbrZid/DLbZVjKQbqOeO/5?=
 =?iso-8859-1?Q?ygpXy3i1f4o6nTRfDdO3X4mprlAel3fPz+ihCunqI3NeSCE+ZrlqO1k+wf?=
 =?iso-8859-1?Q?SrDdvVB3kpMK9PgUXw35nIKFgiiALD+43lpnI/qbqYajVYnGomPHUvkAKD?=
 =?iso-8859-1?Q?DBhhzvuuGXMX7wN0+GsNGgVXpCJDt0l4F7s6+USpK026S1soof+/vC11RM?=
 =?iso-8859-1?Q?ACu/5K1dKLeTbKpAGCEbNfVozYM+5F2Bh0Hah1h8WKQRrTSslFQW/jonto?=
 =?iso-8859-1?Q?yer2SB/PvF5Bzdl6EQ2dxakLkv+hW+OeCyrpWX0R8BjN0uVHlcBfqR2mhy?=
 =?iso-8859-1?Q?6bFVLyxoQ+NzFeQR2st5eGdICTWyDY9ITwhgXUYsDROGX0bEMI1flx5MEX?=
 =?iso-8859-1?Q?pTWbz+usawVHT/ibKzUg2/pxpdMzDEJ/g39K6T0hZ4JC57z78BWLvreOt0?=
 =?iso-8859-1?Q?bToej/4cteJBF8j7nl+gNl6Lx2md/Z18m6QMv638mkykwkkuyL3LWGTXfY?=
 =?iso-8859-1?Q?oh3J39IFJda3RYocraiLO8VaTT5DhyC5mrW8vYhJABoCm9P4BcfOzBseNK?=
 =?iso-8859-1?Q?SEVf6sEYzAW/Yj5d5t64nLepHCi1tpjC9LiGB0ytBCtvXWZr7lJ7dcyXB6?=
 =?iso-8859-1?Q?ONID6hQJYSrfNBqgU6ZtgnyVO8PNg5Hta91oXwtTEcayNQFiNSsQXA2yjP?=
 =?iso-8859-1?Q?pBfRzizAlrH6070Jjc4F3YrGaItvQG3zE9JOtVGoldAkLNXLKQf3Pf5qOU?=
 =?iso-8859-1?Q?qUUAHS6lpTX4TdqWDb0tctlVDPVAAD/Yn0wPOkxdfDuhmp/SAFrHYq4FnY?=
 =?iso-8859-1?Q?rlRCLg9+XW9A1fE10X7KS8wXnaLzgHvZc0CAbpEK2xcCAu0p8GhM42gTjO?=
 =?iso-8859-1?Q?4Eqm7TZF428V9Dt3flHN8uD0QRd9Ny/oBpjjM+Rzyy06UbA2ni7NxDC5yQ?=
 =?iso-8859-1?Q?6RNti38qkMMgnU2c25q/MaKDpmfcVxES6Qsr24TJzYaTYNEN0QV0VRhddf?=
 =?iso-8859-1?Q?vIO4F9XwtknWOLygqS0mmz0MR/QKkE4TSPT7Ksc+bDm68fJaUCSNGOB7gc?=
 =?iso-8859-1?Q?XxuE141npaDxX/kZYogNSB76SCtC63LeXdfNGqXBBwpUyZXkUEPpoAqqTV?=
 =?iso-8859-1?Q?Mf6OugYmsb0riZOqP04v64PRvxFY4GpFpGT8dcxk6Y9KV02TycY6CghzFz?=
 =?iso-8859-1?Q?DAbk/wyu0/A6dHKHCz8xhAK+wMCJdDjcXoN2O5Q6zB7UZ4rIIPKVkCZJq+?=
 =?iso-8859-1?Q?71FKvgwYOYUx3DiAyp3jfSMmoZfr4yICYCXIFpUqhPjN4tHg5UWftLvnEi?=
 =?iso-8859-1?Q?RRQeKhTANj1e0zRaKYUOfOGBgRj+izs9ieOP4dbANpE8sfZzxMAJItTny7?=
 =?iso-8859-1?Q?wk?=
x-ms-exchange-antispam-messagedata-1: inDPVUQKRGCW0gzFLEgOm0TxzhhEGO9jAjA=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f2ec26-b88e-433f-f81e-08de76f6ffcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2026 18:27:15.8107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W16KdK9wzEnO8+c/EhanJgIBxbMCj4E+ghV1U+3dQf+ka2nnNLudzoaKoBPTNPvKqHVd1OS9ntGSjvsPsMBtbwzmQcif2yRxayrU3P5U5u4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4140
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53853-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[windriver.com,linux.intel.com,ideasonboard.com,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,siliconsignals.io:email,siliconsignals.io:dkim]
X-Rspamd-Queue-Id: 74F831C7CB3
X-Rspamd-Action: no action

Hi Xiaolei,=0A=
=0A=
> Switch to using the sub-device state lock and properly call=0A=
> v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /=0A=
> remove().=0A=
>=0A=
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>=0A=
=0A=
...=0A=
=0A=
>=0A=
> @@ -1458,16 +1442,20 @@ static int ov9282_probe(struct i2c_client *client=
)=0A=
> =A0=A0=A0=A0=A0=A0=A0 pm_runtime_enable(ov9282->dev);=0A=
> =A0=A0=A0=A0=A0=A0=A0 pm_runtime_idle(ov9282->dev);=0A=
>=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_async_register_subdev_sensor(&ov9282->sd=
);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret < 0)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto v4l2_subdev_cleanup;=0A=
> +=0A=
> =A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
>=0A=
> +v4l2_subdev_cleanup:=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_subdev_cleanup(&ov9282->sd);=0A=
=0A=
=0A=
If v4l2_async_register_subdev_sensor() fails, runtime PM remains enabled.=
=0A=
Can you please disable runtime PM (and set suspended state) on that error p=
ath?=0A=
=0A=
=0A=
> =A0error_media_entity:=0A=
> =A0=A0=A0=A0=A0=A0=A0 media_entity_cleanup(&ov9282->sd.entity);=0A=
> =A0error_handler_free:=0A=
> =A0=A0=A0=A0=A0=A0=A0 v4l2_ctrl_handler_free(ov9282->sd.ctrl_handler);=0A=
> =A0error_power_off:=0A=
> =A0=A0=A0=A0=A0=A0=A0 ov9282_power_off(ov9282->dev);=0A=
> -error_mutex_destroy:=0A=
> -=A0=A0=A0=A0=A0=A0 mutex_destroy(&ov9282->mutex);=0A=
>=0A=
> =A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> =A0}=0A=
> @@ -1481,9 +1469,9 @@ static int ov9282_probe(struct i2c_client *client)=
=0A=
> =A0static void ov9282_remove(struct i2c_client *client)=0A=
> =A0{=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev *sd =3D i2c_get_clientdata(clien=
t);=0A=
> -=A0=A0=A0=A0=A0=A0 struct ov9282 *ov9282 =3D to_ov9282(sd);=0A=
>=0A=
> =A0=A0=A0=A0=A0=A0=A0 v4l2_async_unregister_subdev(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_subdev_cleanup(sd);=0A=
> =A0=A0=A0=A0=A0=A0=A0 media_entity_cleanup(&sd->entity);=0A=
> =A0=A0=A0=A0=A0=A0=A0 v4l2_ctrl_handler_free(sd->ctrl_handler);=0A=
>=0A=
> @@ -1491,8 +1479,6 @@ static void ov9282_remove(struct i2c_client *client=
)=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (!pm_runtime_status_suspended(&client->dev))=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov9282_power_off(&client->d=
ev);=0A=
> =A0=A0=A0=A0=A0=A0=A0 pm_runtime_set_suspended(&client->dev);=0A=
> -=0A=
> -=A0=A0=A0=A0=A0=A0 mutex_destroy(&ov9282->mutex);=0A=
> =A0}=0A=
>=0A=
> =A0static const struct dev_pm_ops ov9282_pm_ops =3D {=0A=
> --=0A=
> 2.43.0=0A=
=0A=
with above change=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best Regards,=0A=
Tarang=

