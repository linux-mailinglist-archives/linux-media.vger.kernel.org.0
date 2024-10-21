Return-Path: <linux-media+bounces-19948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 121579A5A25
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 08:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32ECC1C20F5C
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 06:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA41194A7C;
	Mon, 21 Oct 2024 06:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J74n7Izv"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2078.outbound.protection.outlook.com [40.107.241.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFAB194132;
	Mon, 21 Oct 2024 06:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729490760; cv=fail; b=NPiimD6D4C848B7UTtr27ugOhcbPAZkCYGn+ah0UWHDUoMyD6pGovfYCEXUFxK1NOb2bfcQCKC79ZevhbS4aEdxDMwbhVcpCkK9AeCv1wULbBSf3bvN1yXY7TzDkN3bXQKchAkQDX5hGoHWyFAAOBdEV30xkVDM6GeP18TlHFpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729490760; c=relaxed/simple;
	bh=Q1jlUbUhwrsTXRKwxHs36eivomZ608Zynj/u0AFczIA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gufki35vnOhtcOvFN3tUx9u0zc7CiUvamDTy8iIc0rqeLUVodFbYuQCEJFISz6yMfPAK0k/zjbHyDoI+wcxzjb0S2xQ7/47Q/unTZHOX9QTDYV+mS3PhgdqTCtDtlXulKx2XJrncPpnluWZimsXzbCjTGqyN/NU42YDTzX1psuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J74n7Izv; arc=fail smtp.client-ip=40.107.241.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ap6lIfXcT6PspxnAdjjY+9RUf7T3272SfMDUonNIG15IXsmn93DhtHiH0AUpeDRMKxA5vk2bOufflRVBNjrgTLSxPPzkk69W5s21x1yGqz4zTaM8sSNfnvcWL0FqiL6SZ9GkwCTSQh+kv61c2fdI6LoKwN6I938tAupZkGf9XF7JPGb7JcuHL6j60jEsGquRZxy5hMN2sfZXvflsXES6xLDSqeWZx43FSfq2ALuXLYtojdDC0DHDwGlthVKCzZJfewkvO6dxl0U32tFRuq8IdSJxvAs3m5hF/AcCaYpsmPDxXKlOzyKke01f4+w9dsk2bog+J5YSecBtjmXXL72zfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQlOmcTUMf0ud0XEyJysUkaxnmWE66jYgQbmEdGQIAc=;
 b=JfSw/bsvqM0OMnqEvXMz+ruhAVFy4GHaHeGgZyi6VidWRKBOFIsG7e/Bgf5YcYsWKd3Xvkx9HY6YCVH/JsyAXT1Pe3wMuODtiaF1e0g5CIZqg/UvDHWW9PHm0kvC+cqxafnbFnyjhYtqTO5XBibqMfRl3r5k+iD4TJwvjX8slHglPzJKDhb1/OPONrklm49wB+xe7Xp7qc1uBKkBnlMD7DvyCy2GIOI+zvqivipREgvCLBTdxofbU+fdW5efYZpHbUBOrymy13mdGENxOd+dYZHqftBKzStwVtLcEor24u2dPrvmRDBXIpk72Qw4ZLdKyWk5StH/Hx7cftht6FUWsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQlOmcTUMf0ud0XEyJysUkaxnmWE66jYgQbmEdGQIAc=;
 b=J74n7IzvqxRoJmU1KVWiClP1Hec0G6mHXURjuHCfg/DiOgzPE0aNlKArtQVXT68Ww/bnlEBYuTZ1kgJ8nWfKTNtbghxJ+V2WPkAyLbZ8oqLV8nucfhjyxgOe/FkHob6uS2iYc8g223gh57ZQqAGTJ2PTXwEHuZ66gZ5Dlvu+/oVqYdimWnU7bty3jMsjq/cYUHtNAnVigLICI4HsA6/XI1adnWR4ex6nIUQNE3djqoCOMgHroxoHzd1gyTapN0+OUs9OzFyt6i9xkHDAzDwAalEauOmXpVdwnYUd6mMoB9gp1XrRFNBNSc1kyu9DBLkPDnQ3F2BQR7LHqVQLzBoiTw==
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DB9PR04MB8217.eurprd04.prod.outlook.com (2603:10a6:10:244::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 06:05:53 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 06:05:53 +0000
From: Ming Qian <ming.qian@nxp.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, "mchehab@kernel.org" <mchehab@kernel.org>
CC: "yunkec@google.com" <yunkec@google.com>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
	"X.H. Bao" <xiahong.bao@nxp.com>, Ming Zhou <ming.zhou@nxp.com>, Eagle Zhou
	<eagle.zhou@nxp.com>, Tao Jiang <tao.jiang_2@nxp.com>, "Ming Qian (OSS)"
	<ming.qian@oss.nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [RFC v2 5/6] media: v4l2-ctrls: Add video roi ctrls
Thread-Topic: [EXT] Re: [RFC v2 5/6] media: v4l2-ctrls: Add video roi ctrls
Thread-Index: AQHbISD6w753PFG7vEq1Etab1CQe97KMC3EAgAAe8eCAABq6AIAAUBaAgAQl/iA=
Date: Mon, 21 Oct 2024 06:05:52 +0000
Message-ID:
 <PAXPR04MB8254A5BE94E9924786005B65E7432@PAXPR04MB8254.eurprd04.prod.outlook.com>
References: <20241018054448.3190423-1-ming.qian@nxp.com>
	 <20241018054448.3190423-6-ming.qian@nxp.com>
	 <6bde2e39-b422-490f-b3b1-142a5671e770@xs4all.nl>
	 <PAXPR04MB825420D7C8A88111F0F8084EE7402@PAXPR04MB8254.eurprd04.prod.outlook.com>
	 <bfd189a9-7bc2-43d1-80be-1092787311e1@xs4all.nl>
 <f91494d0676ac1a97b0590553ab26c1d5b5b8360.camel@ndufresne.ca>
In-Reply-To: <f91494d0676ac1a97b0590553ab26c1d5b5b8360.camel@ndufresne.ca>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8254:EE_|DB9PR04MB8217:EE_
x-ms-office365-filtering-correlation-id: f709f3af-aee2-4780-1ea5-08dcf1966b4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?PAsZWdYBOLb9XFuZReaGJA3HBJEGYpJ3eCw0EQ/vgxUwadN2r19Wr+0M1a?=
 =?iso-8859-1?Q?9sc+74J0q7djQM7+MxuuqMUnR0gQC5cfxU45h2esfzj/I/vrPElxjuJMzt?=
 =?iso-8859-1?Q?NbTCA8dO0ftLUmjIgj+F3qUXg18TzRmS9S9ykMXnPM81y693F59gGZAhll?=
 =?iso-8859-1?Q?hNbwRXtfzJuylYGzx6D7qFSBw5w6VdkW+ytXx9HgT0fYj9/RaWZne/WgqR?=
 =?iso-8859-1?Q?3lQLFdy0+9Qrb9a+YBIee8rNz04JtszTntnFkxWEpcKzBRI/wRHpw/L+T1?=
 =?iso-8859-1?Q?kZdi8FhL7XuItlmbjX39Ya3gekfIB6tfh+eaZ6z3UFi0DKfpfxTK4UUanC?=
 =?iso-8859-1?Q?FQCDDec2hzud1zvh435DcNIlx665y8Y2dDsnfMyxKyE/Y36bbclvzaFyIc?=
 =?iso-8859-1?Q?Hx/QYtZTDxOFfq/eZaszP/oJ4+s1JdnQfK6hroDMDRg5Jw4wNBtGUEu636?=
 =?iso-8859-1?Q?UQVvWY6Xk6GQ8FNdJfgjfn4GlCdvzpdpjnzu7gk5+vzJKx5EKq5M2m5nnN?=
 =?iso-8859-1?Q?kBXQAEZhX5VjPK+tZzPIjbBBvQYqLEpiwqbzWuEey2KquYWZkrIUeTFzGJ?=
 =?iso-8859-1?Q?jxEQRb6HTC94xeW6Sp/sohveDkxYzQbPPPfFsCaWMnXJTPb8wtvgl8q7X5?=
 =?iso-8859-1?Q?hcaSFVllXScfF3J5K1Il32GiSAVsd01yo7C3JY8D8dxpp2N3ZOIK7+iUt4?=
 =?iso-8859-1?Q?utDabI+ef9dwl9s93pM43hgUJu/J2Y2o8thz24prJeqOFyUAtlNpLJ0Ce6?=
 =?iso-8859-1?Q?NhNeSkD423r+1tvCJTCA1QDMLC2zAn6Wc7fkSLYxskWKPNVLOMb1ZFlnBq?=
 =?iso-8859-1?Q?g/otYOadBPmtrBeo1+ywe+I/KFsBTqi29GGVZXnPCWZMX45/ClX4gqHj3n?=
 =?iso-8859-1?Q?smz9ZLp0UcX4N27k5UVfpc5qcrAPMYVzN/ncKnbR+oDBtvfWQhRaoTIHRb?=
 =?iso-8859-1?Q?QLNetaZJ4m3L6N7wlTvddpz5y1+whV1Qo3MKna0tMaRArmh32TvSYYikV0?=
 =?iso-8859-1?Q?U4+9MT3raE2u1OA0uRJApPPF7wWnneSilVvFoLO+9lXjyRHG1b/xsZ7ITP?=
 =?iso-8859-1?Q?rPI2b6fukYz9bQUsfiCHbKbGLtSbERPXqWXfJ/dE/oKR2Aoy5Lf2i7+OiX?=
 =?iso-8859-1?Q?zyk7jQC4cSs48u1DKYjZN3NjC/fK46pf2cbBbyGiCdGpGRXu9dvsuY4LWB?=
 =?iso-8859-1?Q?XfloYyXtS1X1XTczDjATRPZX3UM3v0SBiRwp8JfnMpGWx5CDY0fXPvPZZP?=
 =?iso-8859-1?Q?nbCQx8fnRZhdho9xWaPDf/Cl1MQKKPBAjuzIxgJc4bEkV1Lc87hhYbgu+5?=
 =?iso-8859-1?Q?7iQxMeh7l/zrDF2dwruYUwzxPd/4ij6UVZbGfts4gsksCzJjycE13NU/0g?=
 =?iso-8859-1?Q?0e2IoIFtMA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?wJ8FiJbdYqD0JXIbjyNzwWtUc98VtgcrclDGeNEo9xBEnBwzljU/udxgHt?=
 =?iso-8859-1?Q?rAiR0WrXQ8AxasdUaWcs2CzCE5qlqzl0YyDNLwQgbN8PbSK9vkl+PkTmuq?=
 =?iso-8859-1?Q?fm5XktQA2rdZuuHAJAmgNY82c4jpXwyVvRUjy+zTuxddKYDesiDXaSMkmC?=
 =?iso-8859-1?Q?mSQOlKBHdeT7B47wb28fWPmoFdRtY8L2O80iTBMQTWCvEx0rdBBwTKcVdJ?=
 =?iso-8859-1?Q?P1RyRnMsj3Oi8yPFFNhF5aRa0JUk8gT/bYL59+ODaTMFYaKZggWVJu9hC6?=
 =?iso-8859-1?Q?ZPOeolLL9DRSlBHKakAu91VPC2+Ml6GxkZEydRVufqLwPUle/Maeph5XnI?=
 =?iso-8859-1?Q?1v+Eq+Pi/frIk1wjGa+sPMTpM0kbtuMwhUWRx2osnhTKU609TvcAfVwPIm?=
 =?iso-8859-1?Q?6/NmoZsFbqn0a3GGwsn8iTrRQFVXCEAvqNAztcwvb1jzoV0D3VozD8p/BZ?=
 =?iso-8859-1?Q?M/44P6a0TPBqCf6H4oqIj6o/MW0z4HHfsmX5EEvqNYbwKtpJ0epMpwlxvN?=
 =?iso-8859-1?Q?NQxZZV+jnWkt6nCXsDDajZgqbDCAUwKDJc2XU1Ley/xYsQD/j4oaQioT5W?=
 =?iso-8859-1?Q?H2h+9FTw+LfodYl944nLrp2NSKlurf/i6t8unTohYEUL4ugfS5qnwJrjFw?=
 =?iso-8859-1?Q?BgBaw6RbGio4rcaHVvQeyeIXdBno3dnMQ74dWWJ0RjFFsLJwglW2f7N4AQ?=
 =?iso-8859-1?Q?o66weR8+3JSY6spj8z1+aJiELDswLt223Qnx4m8KoQHQIIbZleK2p4oMgv?=
 =?iso-8859-1?Q?4fF3PUWAb7uLU1n1XS4lqsOylu4/5KS6B4mwsjYBZCsvzKCHBHhaC3qEmD?=
 =?iso-8859-1?Q?f5EJIGplnUeW8WMB+O91Hvtbs8mMQdRTXHAJ9xwvTBUqnowTP0opsbak7w?=
 =?iso-8859-1?Q?LfXD2XL94yDuQ2+xtrDwJuqCNZ9FPfoRaOBWw7xIt06QJzXXWD6s0t1xzi?=
 =?iso-8859-1?Q?nkkeeYWiHa3g2nLIYfwMsvobrlbwiNre/tCjZ2X/A2Da1k8t7oCesosFxA?=
 =?iso-8859-1?Q?Zh1HCBlAkZ+ioLF6iUTDtPiHEWhbIjnkTr2PZpgrH9nqUzNaWiuUyyjNDK?=
 =?iso-8859-1?Q?zOOnoMcDYBadEg2clcfJUarphmNVMklow8ng5avyhzlkdNRhjVGom45HWX?=
 =?iso-8859-1?Q?akQ9C8epjTF9bE1sNiE0Kk8iKzRT9XidzmNvxGGKqV5NMlYHNkbsqVq/OP?=
 =?iso-8859-1?Q?YC8sWvBvm/Zo0/l+ijh92zWaW+9YJ2uCGVgLstyFGYG38LKp0u/0RajO05?=
 =?iso-8859-1?Q?/zWfhxBKG/hwdchCKV5tSEOLhdES4FJcZJX6nlHG6C11vXSSr+LG15kvUm?=
 =?iso-8859-1?Q?W5iafmvjFzJYBSKjR1+pjRLc3qk7IgmJOhMMOenNWaD4ZyW3jab/0XBFvh?=
 =?iso-8859-1?Q?CbeHBRSBub2HFfEiE3+uTiQbI5EvArBva+BlEdWlXFg4vsDjlsVyQWGYNT?=
 =?iso-8859-1?Q?fqc170rGLHon3fD976fCB4UUZiqkkT80bQc6TrTvLn10Nw1jqc2CvDcT4O?=
 =?iso-8859-1?Q?PJmVUSagAKUuDEkZWHppbhAkK98RdP9PClRs4b/eqeqFWAuvd6zQDBnUy0?=
 =?iso-8859-1?Q?uWypeSy2QhlFx4pXEjij5OIEiEiTbVVApUQFLR8RW8iRPYtaoKCmFEEElQ?=
 =?iso-8859-1?Q?mSNhXQ98yczcg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f709f3af-aee2-4780-1ea5-08dcf1966b4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2024 06:05:52.7450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ayZfmgqBIs6+Br0J/F/k1zEcXsxidvp+V0vXjnT7enCrESnaJFSDnIWdUff3hspswP2EzwbLojRpWAJC6Xh2og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8217

Hi Hans and Nicolas,

>-----Original Message-----
>From: Nicolas Dufresne <nicolas@ndufresne.ca>
>Sent: Friday, October 18, 2024 10:41 PM
>To: Hans Verkuil <hverkuil-cisco@xs4all.nl>; Ming Qian <ming.qian@nxp.com>=
;
>mchehab@kernel.org
>Cc: yunkec@google.com; s.hauer@pengutronix.de; kernel@pengutronix.de;
>festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>; X.H. Bao
><xiahong.bao@nxp.com>; Ming Zhou <ming.zhou@nxp.com>; Eagle Zhou
><eagle.zhou@nxp.com>; Tao Jiang <tao.jiang_2@nxp.com>; Ming Qian (OSS)
><ming.qian@oss.nxp.com>; imx@lists.linux.dev; linux-media@vger.kernel.org;
>linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
>Subject: Re: [EXT] Re: [RFC v2 5/6] media: v4l2-ctrls: Add video roi ctrls
>
>Caution: This is an external email. Please take care when clicking links o=
r
>opening attachments. When in doubt, report the message using the 'Report
>this email' button
>
>
>Hi Ming and Hans,
>
>adding my two cents...
>
>Le vendredi 18 octobre 2024 =E0 11:54 +0200, Hans Verkuil a =E9crit :
>> Hi Ming Qian,
>>
>> On 18/10/2024 10:20, Ming Qian wrote:
>> > Hi Hans,
>> >
>> > > -----Original Message-----
>> > > From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> > > Sent: Friday, October 18, 2024 2:28 PM
>> > > To: Ming Qian <ming.qian@nxp.com>; mchehab@kernel.org
>> > > Cc: yunkec@google.com; nicolas@ndufresne.ca;
>> > > s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
>> > > dl-linux-imx <linux- imx@nxp.com>; X.H. Bao <xiahong.bao@nxp.com>;
>> > > Ming Zhou <ming.zhou@nxp.com>; Eagle Zhou <eagle.zhou@nxp.com>;
>> > > Tao Jiang <tao.jiang_2@nxp.com>; Ming Qian (OSS)
>> > > <ming.qian@oss.nxp.com>; imx@lists.linux.dev;
>> > > linux-media@vger.kernel.org; linux- kernel@vger.kernel.org;
>> > > linux-arm-kernel@lists.infradead.org
>> > > Subject: [EXT] Re: [RFC v2 5/6] media: v4l2-ctrls: Add video roi
>> > > ctrls
>> > >
>> > > Caution: This is an external email. Please take care when clicking
>> > > links or opening attachments. When in doubt, report the message
>> > > using the 'Report this email' button
>> > >
>> > >
>> > > On 18/10/2024 07:44, Ming Qian wrote:
>> > > > Add some ctrls to support the video encoder ROI feature.
>> > > > Support 2 encoder ROI configurations that are rectangular region
>> > > > and QP map
>> > > >
>> > > > Signed-off-by: Ming Qian <ming.qian@nxp.com>
>> > > > Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
>> > > > ---
>> > > >  .../media/v4l/ext-ctrls-codec.rst             | 73 ++++++++++++++=
+++++
>> > > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     | 29 ++++++++
>> > > >  include/uapi/linux/v4l2-controls.h            | 11 +++
>> > > >  3 files changed, 113 insertions(+)
>> > > >
>> > > > diff --git
>> > > > a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> > > > b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> > > > index 4a379bd9e3fb..6b972247778c 100644
>> > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> > > > @@ -1667,6 +1667,79 @@ enum
>> > > v4l2_mpeg_video_h264_hierarchical_coding_type -
>> > > >      Codecs need to always use the specified range, rather then
>> > > > a HW custom
>> > > range.
>> > > >      Applicable to encoders
>> > > >
>> > > > +``V4L2_CID_MPEG_VIDEO_ROI_MODE``
>> > > > +    (enum)
>> > > > +
>> > > > +enum v4l2_mpeg_video_roi_mode -
>> > > > +    Video roi mode. Possible values are:
>> > > > +
>> > > > +
>> > > > +
>> > > > +.. flat-table::
>> > > > +    :header-rows:  0
>> > > > +    :stub-columns: 0
>> > > > +
>> > > > +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_NONE``
>> > > > +      - No ROI in the MPEG stream
>> > > > +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_RECT``
>> > > > +      - Rectangle ROI mode
>> > > > +    * - ``V4L2_MPEG_VIDEO_ROI_MODE_MAP``
>> > > > +      - Map ROI mode
>> > > > +
>> > > > +``V4L2_CID_MPEG_VIDEO_ROI_RECT (struct)``
>> > > > +    Select rectangular regions and specify the QP offset. The
>> > > > +    struct :c:type:`v4l2_ctrl_video_region_param` provides the
>> > > > +    rectangular region and the parameter to describe QP offset.
>> > > > +    The maximum number of rectangular regions depends on the
>> > > > +    hardware.  This control is a dynamically sized array. This
>> > > > +    control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
>> > > > +    value is ``V4L2_MPEG_VIDEO_ROI_MODE_RECT``. Applicable to
>> > > > +    encoders.
>> > > > +
>> > > > +.. c:type:: v4l2_ctrl_video_region_param
>> > > > +
>> > > > +.. raw:: latex
>> > > > +
>> > > > +    \small
>> > > > +
>> > > > +.. tabularcolumns:: |p{4.0cm}|p{4.0cm}|p{4.0cm}|
>> > > > +
>> > > > +.. flat-table:: struct v4l2_ctrl_video_region_param
>> > > > +    :header-rows:  0
>> > > > +    :stub-columns: 0
>> > > > +    :widths:       1 1 1
>> > > > +
>> > > > +    * - struct :c:type:`v4l2_rect`
>> > > > +      - ``rect``
>> > > > +      - The rectangular region
>> > >
>> > > What is the unit? I assume pixels. And inside what larger area is
>> > > this rectangle located? It probably needs to refer to one of the
>> > > SEL_TGT targets as described
>> > > here:
>> > >
>> > >
>https://hverkuil/
>%2F&data=3D05%7C02%7Cming.qian%40nxp.com%7C7acc80c8f68449c85a0408d
>cef82ded1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638648592
>606059405%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi
>V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DniwtmJ
>HAhKS%2FI2swfrjvmcRw9oUPs4xXz5EY93B4mRQ%3D&reserved=3D0.
>> > > home.xs4all.nl%2Fspec%2Fuserspace-api%2Fv4l%2Fv4l2-selection-
>> > >
>targets.html&data=3D05%7C02%7Cming.qian%40nxp.com%7Cfe9348ba24504eb
>> > >
>d98f608dcef3dffcf%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
>> > >
>8648296786960098%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi
>> > >
>LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata
>> > > =3DcTXaNWLZs4l6IytSu9TWmEb7OyvF4viby9IjpOJXvmE%3D&reserved=3D0
>> > >
>> >
>> > We want to use pixels as the unit, but for some detailed encoder,
>> > there may be alignment constraints, and the rectangular area should
>> > be inside the encoded picture size, for example, we encode a 720P
>> > H.264 stream, the largest area is 1280x720@(0,0). This doesn't
>> > involve scaling up or down. I'm not sure if it's possible to align to =
crop or
>compose.
>> >
>> > Currently, we want to choose an area and increase or decrease the
>> > image quality. so we want to use a parameter to set the qp offset.
>
>In existing codec, the quantization factor is global to the macroblock bei=
ng
>encoded (not to the image). So for H.264, it will be aligned to 16 pixels =
in both
>directions. The documentation should be clear on that and perhaps we shoul=
d
>go further and defined the direction this should be rounded, which should =
be
>to round toward the edges, so X,Y gets rounded down, and width/height up.
>

You're right, my expression here is not appropriate, what I wanted to
say at first was changing the quality of the chosen area. And the area
should be aligned to the ROI block size.
I tried to add a new ctrl V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE to
query the ROI block size for the map type ROI, I think it should also
work for the rectangle type ROI. The X, Y and width and height should be
aligned, just like you said.

>> >
>> > > > +    * - __s32
>> > > > +      - ``parameter``
>> > > > +      -
>> > >
>> > > So what is the parameter? It has no description.
>> > >
>> >
>> > I newly add a ctrl type V4L2_CTRL_TYPE_REGION, and this struct is
>> > related to the type, so I thought I need to define a general
>> > argument to meet different needs, then this type can support a series =
of
>controls.
>> > For this patch, it's qp offset.
>> > I thought if I name it as qp_offset, the ctrl type can't be used on
>> > other similar controls.
>> > Is it better to rename it or add more description and keep the name?
>>
>> This seems very specific to this use-case, so it makes sense if this
>> is defined as such.
>>
>> If you want use generic types, then you would need two controls: one
>> to define the regions (using type v4l2_rect), and one to set the QP
>> offset (type integer). This assumes that both arrays are set to the
>> same size.
>>
>> If you want to keep them together, then just make a new type for this.
>>
>> But a more general question regarding this feature: is this hardware
>> specific? Or is this defined in some codec standard?

I initially considered using 2 controls, as you said, one to define
rectangle area, and one to set the QP offset.
What bothers me is how to ensure that two array type controls have the same=
 array size.
So I tried a compound control.

I'll try two controls in the next version patch.

>
>Most CODEC don't require a flat quantization. Each macroblock can be
>quantized separately. There is multiple approach to give users control on =
what
>QP to use for which macro-blocks. The ROI approach is notably found in VA =
API
>[0]. I've seen ROI support left unimplemented in many of our stateful
>encoders, so this is common enough approach.
>
>[0]
>https://intel.git/
>hub.io%2Flibva%2FstructVAEncROI.html&data=3D05%7C02%7Cming.qian%40nxp
>.com%7C7acc80c8f68449c85a0408dcef82ded1%7C686ea1d3bc2b4c6fa92cd99c
>5c301635%7C0%7C0%7C638648592606098413%7CUnknown%7CTWFpbGZsb3
>d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
>D%7C0%7C%7C%7C&sdata=3DBFiZ3RcyBYsiV0BwXdXp4ubpiyL1B21%2F3Vq3UFHP
>HOE%3D&reserved=3D0
>
>More recent APIs, notably DX3D12 and Vulkan Video, have adopted the QP
>Map approach. They offer both absolute and offset QP, placed in a 2D map,
>with the number of effective pixels per map entry defined. Not much detail=
s
>are known about VKV, but on DX3D12, you can find some details in the AV1
>encoder documentation. While the ROI approach can easily be translate to Q=
P
>Maps, the other direction may not be possible. Usually, the maximum size o=
f a
>QP map is way larger then the maximum number of ROI.
>
>https://microso/
>ft.github.io%2FDirectX-
>Specs%2Fd3d%2FD3D12_Video_Encoding_AV1.html&data=3D05%7C02%7Cming.
>qian%40nxp.com%7C7acc80c8f68449c85a0408dcef82ded1%7C686ea1d3bc2b4
>c6fa92cd99c5c301635%7C0%7C0%7C638648592606121020%7CUnknown%7CT
>WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX
>VCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DtpT8VZ9ajW%2B132dsb6WiYlg3Pnqg7
>MXIZraiP6HkZpg%3D&reserved=3D0
>
>We should also document what happens when ROI overlap, if that
>supported ? are the offset summed ? I don't think absolute QP is widely
>supported, but to be verified. A split approach would make adding support =
for
>absolute a lot easier.
>
>For a practical use of ROI, see:
>
>https://obsproj/
>ect.com%2Fforum%2Fresources%2Fencoder-region-of-interest-
>editor.1904%2F&data=3D05%7C02%7Cming.qian%40nxp.com%7C7acc80c8f6844
>9c85a0408dcef82ded1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
>C638648592606142443%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
>MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&
>sdata=3DzORnx0LUkOBkq3sgEAK55oaWM%2F2S5Igr6NxdgkBdwMs%3D&reserve
>d=3D0
>

Thank you for your additional explanation.

>>
>>
>> And to be clear, this has nothing to do with the UVC ROI patch series
>> that you linked to, right? You just reused some of the work that was
>> done there

Yes, I just want to reuse some work in the UVC ROI patchset and pick
some patches from it. Sorry for the inconvenience.

>
>I believe the UVC ROI refers to rectangles used in 3A. Usually user or AI =
driven,
>these will tell the camera the location of the interesting object. This re=
flects on
>Mobile to tapping on an object in order to focus on it.
>
>ROI can also be used to communicate back the bounding box of objects in an
>image. Though, on modern system we tend to need more then that, as we
>want to put these objects in relation to each other, and want to use other
>shapes. Think of your eyes that are in relation to your face.
>

Thanks your for your detailed explanation and additions.

>> .
>>
>> I am leaning to splitting this up in two controls: one defines the
>> ROIs, and one defines the parameter for each ROI. This makes it very
>> easy to reuse in other scenarios (such as UVC).
>>
>> But I really need to know a bit more about this feature.
>
>Hope this drop of info helped a bit. I don't have a very strong opinion be=
tween
>using a compound control vs two array control. Though your proposal makes
>the built-in min/max/def feature usable, where with compound controls we
>don't really have an API to expose that, and need to hand-write validation=
. It
>also enables possible sharing a bit with future QP Maps implementation.
>
>Perhaps good to know that GStreamer do have a metadata representation of
>ROI. It is generic with the rectangle and location as base value and addit=
ional
>type and arbitrary parameters. That is used for VA-API encoders. Before AI
>boom, this is what we'd use to place objects detected with libraries like
>OpenCV. Typically, an app would translate let's say faces ROI to an encode=
r QP
>offset based on its own logic. AI systems in GStreamer are now moving to t=
he
>GstAnalyticMeta, which is more powerful and allow for relations to be
>expressed.
>
>https://gitlab.fr/
>eedesktop.org%2Fgstreamer%2Fgstreamer%2F-
>%2Fblob%2Fmain%2Fsubprojects%2Fgst-plugins-base%2Fgst-
>libs%2Fgst%2Fvideo%2Fgstvideometa.h%3Fref_type%3Dheads%23L308&data=3D
>05%7C02%7Cming.qian%40nxp.com%7C7acc80c8f68449c85a0408dcef82ded1
>%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63864859260616379
>3%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
>CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DBuCdWrWyHr0n
>GE9dqTpPhfuaTQEpTQuIHjrauv4hKc0%3D&reserved=3D0
>
>https://gitlab.fr/
>eedesktop.org%2Fgstreamer%2Fgstreamer%2F-
>%2Fblob%2Fmain%2Fsubprojects%2Fgst-plugins-bad%2Fgst-
>libs%2Fgst%2Fanalytics%2Fgstanalyticsmeta.h%3Fref_type%3Dheads&data=3D05
>%7C02%7Cming.qian%40nxp.com%7C7acc80c8f68449c85a0408dcef82ded1%7
>C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638648592606188142%
>7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB
>TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DQCCZ9aMArrRrediss
>kTQXBZRCmNXUbu%2B1rUwB5F%2FDO4%3D&reserved=3D0
>
>regards,
>Nicolas
>

I'm preparing the V3 patchset, and I will try two array controls.

Thank you both for your comments.

Ming

>>
>> Regards,
>>
>>       Hans
>>
>> >
>> > > > +    * - __u32
>> > > > +      - ``reserved[2]``
>> > > > +      -
>> > >
>> > > Add "Applications and drivers must set this to zero."
>> > >
>> >
>> > Yes, I missed it
>> >
>> > > > +
>> > > > +.. raw:: latex
>> > > > +
>> > > > +    \normalsize
>> > > > +
>> > > > +``V4L2_CID_MPEG_VIDEO_ROI_MAP (integer)``
>> > > > +    Specifies the QP offset for each block. This control is a
>> > > > +    dynamically sized array. The array size can be calculated
>> > > > +    from video resolution and the roi map block size which can
>> > > > +    be got from ``V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE``. This
>> > > > +    control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
>> > > > +    value is ``V4L2_MPEG_VIDEO_ROI_MODE_MAP``. Applicable to
>> > > > +    encoders.
>> > > > +
>> > > > +``V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE (struct)``
>> > > > +    This control returns the roi block size in pixels. The struct
>> > > > +    :c:type:`v4l2_area` provides the width and height in separate
>> > > > +    fields. This control is applicable when
>> > > > +    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
>> > > > +    ``V4L2_MPEG_VIDEO_ROI_MODE_MAP``. This control depends on
>the
>> > > > +    encoding format. Applicable to encoders.
>> > > > +
>> > > >  .. raw:: latex
>> > > >
>> > > >      \normalsize
>> > > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> > > > b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> > > > index 1ea52011247a..54219a3b215a 100644
>> > > > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> > > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> > > > @@ -612,6 +612,13 @@ const char * const *v4l2_ctrl_get_menu(u32
>id)
>> > > >               NULL,
>> > > >       };
>> > > >
>> > > > +     static const char * const mpeg_video_roi_mode[] =3D {
>> > > > +             "None",
>> > > > +             "Rectangle",
>> > > > +             "Map",
>> > > > +             NULL,
>> > > > +     };
>> > > > +
>> > > >       switch (id) {
>> > > >       case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
>> > > >               return mpeg_audio_sampling_freq; @@ -750,6 +757,8
>> > > > @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>> > > >               return camera_orientation;
>> > > >       case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
>> > > >               return intra_refresh_period_type;
>> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_MODE:
>> > > > +             return mpeg_video_roi_mode;
>> > > >       default:
>> > > >               return NULL;
>> > > >       }
>> > > > @@ -971,6 +980,10 @@ const char *v4l2_ctrl_get_name(u32 id)
>> > > >       case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:               retu=
rn
>"Frame
>> > > LTR Index";
>> > > >       case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:                retu=
rn
>"Use LTR
>> > > Frames";
>> > > >       case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:                    retu=
rn
>"Average
>> > > QP Value";
>> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_MODE:                      retu=
rn
>"Video ROI
>> > > Mode";
>> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_RECT:                      retu=
rn "Video
>ROI
>> > > Rectangle";
>> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_MAP:                       retu=
rn "Video
>ROI
>> > > Map";
>> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE:            retu=
rn
>> > > "Video ROI Map Block Size";
>> > > >       case V4L2_CID_FWHT_I_FRAME_QP:                          retu=
rn "FWHT I-
>Frame
>> > > QP Value";
>> > > >       case V4L2_CID_FWHT_P_FRAME_QP:                          retu=
rn "FWHT P-
>> > > Frame QP Value";
>> > > >
>> > > > @@ -1512,6 +1525,22 @@ void v4l2_ctrl_fill(u32 id, const char
>> > > > **name,
>> > > enum v4l2_ctrl_type *type,
>> > > >               *type =3D V4L2_CTRL_TYPE_INTEGER;
>> > > >               *flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
>> > > >               break;
>> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_MODE:
>> > > > +             *type =3D V4L2_CTRL_TYPE_MENU;
>> > > > +             *flags |=3D V4L2_CTRL_FLAG_UPDATE;
>> > > > +             break;
>> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_RECT:
>> > > > +             *type =3D V4L2_CTRL_TYPE_REGION;
>> > > > +             *flags |=3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY |
>> > > V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
>> > > > +             break;
>> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_MAP:
>> > > > +             *type =3D V4L2_CTRL_TYPE_INTEGER;
>> > > > +             *flags |=3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY |
>> > > V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
>> > > > +             break;
>> > > > +     case V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE:
>> > > > +             *type =3D V4L2_CTRL_TYPE_AREA;
>> > > > +             *flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
>> > > > +             break;
>> > > >       case V4L2_CID_PIXEL_RATE:
>> > > >               *type =3D V4L2_CTRL_TYPE_INTEGER64;
>> > > >               *flags |=3D V4L2_CTRL_FLAG_READ_ONLY; diff --git
>> > > > a/include/uapi/linux/v4l2-controls.h
>> > > > b/include/uapi/linux/v4l2-controls.h
>> > > > index 974fd254e573..169a676fd64c 100644
>> > > > --- a/include/uapi/linux/v4l2-controls.h
>> > > > +++ b/include/uapi/linux/v4l2-controls.h
>> > > > @@ -900,6 +900,17 @@ enum v4l2_mpeg_video_av1_level {
>> > > >
>> > > >  #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP
>(V4L2_CID_CODEC_BASE +
>> > > 657)
>> > > >
>> > > > +enum v4l2_mpeg_video_roi_mode {
>> > > > +     V4L2_MPEG_VIDEO_ROI_MODE_NONE,
>> > > > +     V4L2_MPEG_VIDEO_ROI_MODE_RECT,
>> > > > +     V4L2_MPEG_VIDEO_ROI_MODE_MAP };
>> > > > +
>> > > > +#define V4L2_CID_MPEG_VIDEO_ROI_MODE
>(V4L2_CID_CODEC_BASE
>> > > + 658)
>> > > > +#define V4L2_CID_MPEG_VIDEO_ROI_RECT
>(V4L2_CID_CODEC_BASE +
>> > > 659)
>> > > > +#define V4L2_CID_MPEG_VIDEO_ROI_MAP
>(V4L2_CID_CODEC_BASE +
>> > > 660)
>> > > > +#define V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE
>> > > (V4L2_CID_CODEC_BASE + 661)
>> > > > +
>> > > >  /*  MPEG-class control IDs specific to the CX2341x driver as
>> > > > defined by V4L2
>> > > */
>> > > >  #define V4L2_CID_CODEC_CX2341X_BASE
>> > > (V4L2_CTRL_CLASS_CODEC | 0x1000)
>> > > >  #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE
>> > > (V4L2_CID_CODEC_CX2341X_BASE+0)
>> >
>>


