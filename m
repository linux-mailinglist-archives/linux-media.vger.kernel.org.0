Return-Path: <linux-media+bounces-49219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE09CD2859
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 07:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0473930120C5
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 06:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2942F4A19;
	Sat, 20 Dec 2025 06:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="O9Z2Dy+P"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020085.outbound.protection.outlook.com [52.101.227.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9A6258EE0;
	Sat, 20 Dec 2025 06:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766210510; cv=fail; b=TKdKI+TOQALO71tChOlnG2BBFHEEWhwouA3QKSxnEDkIDb51fXjsyxw2/k+9AEoyVgrzPA/XqEGnwbY9WNCq+gdWITsbEn9ViBVk4Ns7pYmOXwmrhMMNULbY6gWUXyCia2R/XkcuRv5x7M8k90lWxQjg8Xfa0+qeB8sJLlMMavo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766210510; c=relaxed/simple;
	bh=DWZD95GtNGc5XN5+djiZkJ1xS9IbIl1mov66f1l+1iE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Abg4RZV+ExLGMfdeo5FWaRD6bSt6Nwz5SeOFOORfswJZGZK7GkJB2tYLAeZ3NyvRtjKnJL8FjVuY3/Te5hccOIXcx/goP0BVyzoYcWzyq+pY/jCs1pxpGm0PmA0Kg0DCeREDCKRN7bS5bx7DToso+B/HzCztflS6HTKt9IQmInE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=O9Z2Dy+P; arc=fail smtp.client-ip=52.101.227.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsltLlW3PdHGtB/zcHey5JQjsYhiJ5D2YXMFYziuBTUPb25lsZnXA0jbcNgzdy96wVh7rv5kTjpx3zhLrFkH2KSrAfeZCeFt7YvgRFhRCGJhA7zcKXwclyi8lTdmPWFQmhLsD4bbGq3PxX3n/b8HYRPNBUApPTe43ObIpHCuD0JqWnBskOmJ+yhHt9mTT+ic1C1XshlkO7nA5iL6Lp5+AG2zTmqh8a2ZSAvdTxzTq0QPK5jwrns6/5BC1dLUdMNItKACHcOo+aMCn7vyZd+smpoVIEWD/AUoS+R3pnRI0gp9ZYOKHcJfpvFa3KbHzbm1eZouuhu7y6jCbg8eKkQJ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWZD95GtNGc5XN5+djiZkJ1xS9IbIl1mov66f1l+1iE=;
 b=WKmCggyY1AJocU+DD9pT5QUgLMNhqQQQw93Yv5He63ajbxjII/uV60MnW44ddwAYaX7g4SvGiMEvIGGwJYx+gv9HJWbm04xOHy97lmTJ7lVu+i55fYcAvpypFvH4f0J3TTbEWsj4bcuVsngghvCJ1oRsVWiOBKTk6gMZBTliep1Fi62kvENitvqM+3tjAn1K1CnzLSf9JkK8CieLF8evJR5NT4GmX3iRK7rao0lE4F8yz7YdMxlRBQn1aB5uqM6NkGK87C3fdi3wD6SSYibu0ammtsr7w/nO6PkgftaXAAQ4p4wERpIbji4NYjut6T2TIigDUF1Nr8XGhU6z3xVhZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWZD95GtNGc5XN5+djiZkJ1xS9IbIl1mov66f1l+1iE=;
 b=O9Z2Dy+Pt6YWjUsoezWqDkfGPOZwpiSu+zq+7zKFh21KbVGdtlCZyDKl7MkUAVrvXr8UUBCBvKcosPDCcPp8c3CsLXwulNxwAJVgxRxf70llmwBOvJgJBccSoi4ZqscGiB1G7ps50TMm9PN5Q/w1PlKM1GoqojU8Fclt+UaBztW+kY/igXtcT3Zm93TZvVwPdnmCr/9n7LazBCW5CV3YNYyZICHm5BPdW6ILJyR49nbe+tAWxe5TQ7Y+xxM2XPE0YGGNKSkYE60wF3fXoonBCNL0PBQjK7tjHPHi25k9RXp1pz1bfqCPZfSfi1jNIcfDxjO+s+xWdwjM+1VMQw8L/A==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAYP287MB3836.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:14a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Sat, 20 Dec
 2025 06:01:44 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9434.009; Sat, 20 Dec 2025
 06:01:43 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Hans
 de Goede <hansg@kernel.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, =?iso-8859-1?Q?Andr=E9_Apitzsch?=
	<git@apitzsch.eu>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain
 Petinot <sylvain.petinot@foss.st.com>, Dongcheng Yan
	<dongcheng.yan@intel.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Jingjing
 Xiong <jingjing.xiong@intel.com>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] media: i2c: add os05b10 image sensor driver
Thread-Topic: [PATCH v6 2/2] media: i2c: add os05b10 image sensor driver
Thread-Index: AQHccMPuYbafRpG0V0ubGQehlqfagLUpACCAgAEGFMA=
Date: Sat, 20 Dec 2025 06:01:43 +0000
Message-ID:
 <PN3P287MB1829A7B4AA56CBF22F758AAC8BB6A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20251219084526.22841-1-himanshu.bhavani@siliconsignals.io>
 <20251219084526.22841-3-himanshu.bhavani@siliconsignals.io>
 <7p46ga3lc5ky2234q6c222gz5ftpcaqfvax5ouysr4cj5sczlf@47ukejyhblbq>
In-Reply-To: <7p46ga3lc5ky2234q6c222gz5ftpcaqfvax5ouysr4cj5sczlf@47ukejyhblbq>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAYP287MB3836:EE_
x-ms-office365-filtering-correlation-id: 07159a78-5649-4789-2c9d-08de3f8d4053
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?eUMv+bw0SinP8giKV4Vm6S6IwKQqwDAIMaGKGv3CJm1LG09dlpbRwcsidI?=
 =?iso-8859-1?Q?Bx5vjR4L9j86Iih2CqTeW2Txd6K6LpjMQ0gPK2dY0X8TQNaWRddBW8CVhb?=
 =?iso-8859-1?Q?wupO4A3CeHOCOTUUUiwf2OVnMgJ2LE66R6R9NIUtV1gSrTk7T0CUmuke9G?=
 =?iso-8859-1?Q?7cq9ieInQO9aYfzISJfTutdsspC0JhXK6qecZczOxQ+po/OCB//Gt0S0Uj?=
 =?iso-8859-1?Q?zE2MKzpX1Zjk2VPHCLyOjPXWZgVa6gKdQXowNhAJ7EQx13pdwNkCSe1xIb?=
 =?iso-8859-1?Q?iF3RomWI6LbTablK8ZhD8Gsew84gLGxcN1yPib1jtn7IaZQTcaHaGnzUCE?=
 =?iso-8859-1?Q?PxuqN6aFK7wW3/Qph/XRBJD5bUHXK8ioEIQyWu6v+5FqHMw46q+Z/05cFb?=
 =?iso-8859-1?Q?Id/KJGdbAxBCjgp1zO0XVnTB5ceTo8kVe8Df/Uj+m9TuqCdXuLfRvOdXvX?=
 =?iso-8859-1?Q?HWaO+qVhFcYuteBot78KOgvhy8mvHuUE/Y6czWBQj7FrtxBKPFrJzsXIJr?=
 =?iso-8859-1?Q?m62aCFsdTHHinyPpbyQE5iqUWKIJv06/2KRl3g+ZZ85jGuf/1Hdhlzp7Bu?=
 =?iso-8859-1?Q?UQm5bgNqNdvY882X7/h0H4fdBUDxLXcKpMda2oZCpSur4jS8yj4bK26FDc?=
 =?iso-8859-1?Q?7L7cWv7bqS0Ufl4nlFqbuQ5TrU4li24tM/IFge4IixGkhkQ4PjG2/qduSR?=
 =?iso-8859-1?Q?hDpK0exKtS2/JASVj4hNvS0GH4cSmBCyS6SUpFGjpdjGAkSnpbPySKIN4+?=
 =?iso-8859-1?Q?Q7apT2VRm1cVOZZb5PalMJK06AfuuMDgE+yro5djp2CoITSz25CowEnmNQ?=
 =?iso-8859-1?Q?RhGieUGp60MDaY7DEBrnaJPFvh8PH1sL4ePVfres/dg6nLK4KWzaC8Uha6?=
 =?iso-8859-1?Q?JrXWjk6HeaN/YRdVAjqxDO0LdD59pYgHAZBdk33llExAKC8Mj/YZNRDnQW?=
 =?iso-8859-1?Q?L7dVZNYWaXG7WuB6C4SDo5P3ZSeQ8fQx4UKNpEUnDN5t7ou2iLmTG8Q0DL?=
 =?iso-8859-1?Q?+yCySTsVKjn+1HeU8m9pMH3bc4NtnIqX/rndlLq6dXrBX5TyBkzKpXL2U9?=
 =?iso-8859-1?Q?7BFMogo4X1+vXCzOCU/XVxCnNommg1/WAmKHpt2cgilm6RBDiBvBqq9Zvr?=
 =?iso-8859-1?Q?ewkNbB6odliR96L9tAK77+6teAWi3KrP0m2Wfx5FsSdqkL5bA1NE1h5Ftq?=
 =?iso-8859-1?Q?pEFAvRZTkcu+e1FaavZ6QhzsMEEabv437bBqQK0P7VA0pAI00YHQIViS8i?=
 =?iso-8859-1?Q?3t8WNmt3KJeNrYBQVL9wA8WgaF+deZV06dZ7vpVLGwE3ghP+N89tDurJ40?=
 =?iso-8859-1?Q?Zb6y3KxbCEwfmMfY/UoZ20EbOTmiPg0NkrNj7JJ7dUUDZqeUo5RhlFRQnC?=
 =?iso-8859-1?Q?g5a6R4fS22q4KDOQtIdyr2SEayxjdwVRbQWteN3dGGLvc4s5EnXcB9Hplk?=
 =?iso-8859-1?Q?LrmXwCyIxRHeUYaV8Fjtm3X7HvmdLREWSH5soe8xqT6fKm0ipTn2ImIUjA?=
 =?iso-8859-1?Q?X4ZAL0H0V8wHMOKjrHZ5pkdjsZ1M3A4ZciWKN+Q81WjgcTHEMPeWDGcKIA?=
 =?iso-8859-1?Q?UdpxkXQvSGPv/DtV3hXbtnSZKbm3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SFKGaT6l0lSqdrkrehx/13tZTYDQW5oUQSQunUjLFEiPJpcjI+99sk16Ub?=
 =?iso-8859-1?Q?dvArUVqjk4QzT6AgQTAYZxPh6DQgknFHEpjwQc8LXOturyKIz1iA+QGblr?=
 =?iso-8859-1?Q?Wu0E8mbAOxDTNJyPerWzH0La+kp+LSGPG+8fZpspzHuGTZBi/9tNp/GGv/?=
 =?iso-8859-1?Q?mCvXo0kmVuyT3zq3UnRCGLaR1FicUSMLTcMxUQJJZSAv6NFtIEEu7sgSFy?=
 =?iso-8859-1?Q?+OdP9hFexMozU1iJBSngSMIEDyFoDS9b+7J1vLYGeOT1+5S21fvRm1YWx/?=
 =?iso-8859-1?Q?6tTYl2b7+XydBuflh5Ak6vunMr4UawfjhWVmidcryCI4I+PrufsgmWROv+?=
 =?iso-8859-1?Q?+vbH6R1/Ui1zKIhqCw5Uew99pZc7Ipw0UDjnvDbfX0E4h3t3H+/UcvpUrk?=
 =?iso-8859-1?Q?5/4nc8etp7Tb4sLFGmgGEwK+Yt7GQMOAQvi9CkyPqqV1zsQvEkfJDx6u/N?=
 =?iso-8859-1?Q?5DbIOzyviQBL0NHFP4QjZc3IbtmjSIVFThST/50xIH9/K+Lngp6oec0hyD?=
 =?iso-8859-1?Q?f8dD38LUpujXQK6azjiNSlv7ppiub20pxLxK9NGGrmbBMd6///GJSW/opM?=
 =?iso-8859-1?Q?wXNT8VA4PcwbpfA433crjCazpd7fxUckIjn0EkKEOhrWKYgwFCMe/E+4VB?=
 =?iso-8859-1?Q?DZwPu2YQp0eeTnoGbyBikRvzLoIUUlXLxrR9ElJms0hgRHN4uQq2J1atmO?=
 =?iso-8859-1?Q?1GZOr1qERR1VF82z7D1aqLRAJoZjYVLWyqYYH468H6UQjyUoy+FSophxbT?=
 =?iso-8859-1?Q?YQHJ2d9Eu+uY/iY/y/W06l2ZumdGV9Pxg/YU9hbCOcWkk139W/0v9FeSP/?=
 =?iso-8859-1?Q?9C2LBSHIlIQfJuV1A+TSiMy4m25h/xI7nfqmxFsn2K46Q3qMN1bGTISX0k?=
 =?iso-8859-1?Q?2sZn/2KlYe9jt7CDwMzKvYKU2jp5YIToEK1f9v7fPqspTChYZX7mRqF3sg?=
 =?iso-8859-1?Q?ocuUhbdM6qaUhyQ/eFwfQDbYPlI0ghXDpLV64SsYx6+lQZ+6hRxt8KbhWZ?=
 =?iso-8859-1?Q?KavarNQnJvwZAhhipZS9UMKD+kwRW3lq/2AsxlSE2mqA6QtOT3PX1N27Zk?=
 =?iso-8859-1?Q?jW54A4nIroJ9mMYiV8Fe8mgHd4BJsrIZrr3oUpHk1KTyUridGTY/LbYlHW?=
 =?iso-8859-1?Q?b1wIYDL8lIh09K1x3QtOLWNHt03ZVSCPYOtsavlS04SCJAo861W2emSpkO?=
 =?iso-8859-1?Q?ejLrl/piGkXelrjGtC57gyzutsAb06Fz9iBBbcwm4BHcIBX41+0UC6qydf?=
 =?iso-8859-1?Q?QmfDls6kIqzMi6wCh4EupwiqQrub9oPf45Kd08JxBb1L5yHXEkqF9THeKD?=
 =?iso-8859-1?Q?83UoBS/LU6JBdWzh2BM6K1Pb/XAxBT+PLh74G7Y8k7HrGAFiyfgLAVAQ5H?=
 =?iso-8859-1?Q?dn587B85L1uMQZZI+gchMZeSJu9sVNgH/P92DRuaMSnRhZXX7yybZTdJwQ?=
 =?iso-8859-1?Q?zUcwluyflBp3+qT2F5CyaNUdi1yJR9+o7erEmNr8CFJPBc7friE3KvBblk?=
 =?iso-8859-1?Q?0IWWEoaeMEGUE2vFVpdEGUuGrsr0uqWZaoQu77XG+GreejqRw+XofcHbyn?=
 =?iso-8859-1?Q?B7sIOOrpvSjSasf/tJjSjK28dAKP8AcvYXDtexQ/rnQKMPoUcttNjMuoh4?=
 =?iso-8859-1?Q?+CnaJgDgrdqYGkpvvIs9uvpqx3AtERxgbwqbx3UZ6TS9h7ZsRlWz6tb3Bb?=
 =?iso-8859-1?Q?duBJ7Z3wfp6AJAP/B6UC6QATtWtLgzhwfcrv4rjJgPzAwDyZ45yaOBPJIz?=
 =?iso-8859-1?Q?YlRMHJfnkZ8knYFQfcq08YEU9x0MPK/sRv+xXab08A+AMuOPrzKi7psEqD?=
 =?iso-8859-1?Q?Z7PJAsTwjQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 07159a78-5649-4789-2c9d-08de3f8d4053
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2025 06:01:43.5142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +A/hU4CyPQ3q2kPqWtvZbu1W4QNxaBPEWmSykhIvYbPe/mB4VZ6QZiUVIdnioTBAvidDxear6RkbA5oMUNlT7OcW6ge604kvI5M0YuHLvrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3836

Hi Mehdi,=0A=
=0A=
> > Add a v4l2 subdevice driver for the Omnivision OS05B10 sensor.=0A=
> >=0A=
> > The Omnivision OS05B10 image sensor with an active=0A=
> > array size of 2592 x 1944.=0A=
> >=0A=
> > The following features are supported:=0A=
> > - Manual exposure an gain control support=0A=
> > - vblank/hblank control support=0A=
> > - Supported resolution: 2592 x 1944 @ 60fps (SBGGR10)=0A=
> >=0A=
> > Co-developed-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=
=0A=
> > Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=0A=
> > Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
> > Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>=0A=
>=A0=0A=
> [...]=0A=
>=A0=0A=
> > +static const struct cci_reg_sequence os05b10_common_regs[] =3D {=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x0301), 0x44 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x0303), 0x02 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x0305), 0x32 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x0306), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x0325), 0x3b },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3002), 0x21 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3016), 0x72 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x301e), 0xb4 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x301f), 0xd0 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3021), 0x03 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3022), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3107), 0xa1 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3108), 0x7d },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3109), 0xfc },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3500), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3501), 0x07 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3502), 0xb6 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3503), 0x88 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3508), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3509), 0x80 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x350a), 0x04 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x350b), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x350c), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x350d), 0x80 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x350e), 0x04 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x350f), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3510), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3511), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3512), 0x20 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3600), 0x4d },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3601), 0x08 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3610), 0x87 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3611), 0x24 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3614), 0x4c },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3620), 0x0c },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3632), 0x80 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3633), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3636), 0xcc },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3637), 0x27 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3660), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3662), 0x10 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3665), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3666), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x366a), 0x14 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3670), 0x0b },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3671), 0x0b },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3672), 0x0b },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3673), 0x0b },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3678), 0x2b },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x367a), 0x11 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x367b), 0x11 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x367c), 0x11 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x367d), 0x11 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3681), 0xff },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3682), 0x86 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3683), 0x44 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3684), 0x24 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3685), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x368a), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x368d), 0x2b },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x368e), 0x2b },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3690), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3691), 0x0b },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3692), 0x0b },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3693), 0x0b },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3694), 0x0b },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x369d), 0x68 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x369e), 0x34 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x369f), 0x1b },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36a0), 0x0f },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36a1), 0x77 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36b0), 0x30 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36b2), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36b3), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36b4), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36b5), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36b6), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36b7), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36b8), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36b9), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36ba), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36bb), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36bc), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36bd), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36be), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36bf), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36c0), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36c1), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36c2), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36c3), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36c4), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36c5), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36c6), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36c7), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36c8), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36c9), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36ca), 0x0e },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36cb), 0x0e },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36cc), 0x0e },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36cd), 0x0e },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36ce), 0x0c },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36cf), 0x0c },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36d0), 0x0c },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36d1), 0x0c },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36d2), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36d3), 0x08 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36d4), 0x10 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36d5), 0x10 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36d6), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36d7), 0x08 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36d8), 0x10 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x36d9), 0x10 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3701), 0x1d },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3703), 0x2a },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3704), 0x05 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3709), 0x57 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x370b), 0x63 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3706), 0x28 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x370a), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x370b), 0x63 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x370e), 0x0c },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x370f), 0x1c },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3710), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3713), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3714), 0x24 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3716), 0x24 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x371a), 0x1e },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3724), 0x09 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3725), 0xb2 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x372b), 0x54 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3730), 0xe1 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3735), 0x80 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3739), 0x10 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x373f), 0xb0 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3740), 0x28 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3741), 0x21 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3742), 0x21 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3743), 0x21 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3744), 0x63 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3745), 0x5a },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3746), 0x5a },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3747), 0x5a },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3748), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3749), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x374a), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x374b), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3756), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3757), 0x0e },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x375d), 0x84 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3760), 0x11 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3767), 0x08 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x376f), 0x42 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3771), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3773), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3774), 0x02 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3775), 0x12 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3776), 0x02 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x377b), 0x40 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x377c), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x377d), 0x0c },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3782), 0x02 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3787), 0x24 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x378a), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x378d), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3790), 0x1f },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3791), 0x58 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3795), 0x24 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3796), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3798), 0x40 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x379c), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x379d), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x379e), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x379f), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37a1), 0x10 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37a6), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37ab), 0x0e },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37ac), 0xa0 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37be), 0x0a },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37bf), 0x05 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37bb), 0x02 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37bf), 0x05 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37c2), 0x04 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37c4), 0x11 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37c5), 0x80 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37c6), 0x14 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37c7), 0x08 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37c8), 0x42 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37cd), 0x17 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37ce), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37d8), 0x02 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37d9), 0x08 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37dc), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37e0), 0x0c },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37e1), 0x20 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37e2), 0x10 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37e3), 0x04 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37e4), 0x28 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37e5), 0x02 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37ef), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37f4), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37f5), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37f6), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37f7), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3800), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3801), 0x30 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3802), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3803), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3804), 0x0b },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3805), 0x5f },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3806), 0x07 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3807), 0xa7 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3808), 0x0a },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3809), 0x20 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x380a), 0x07 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x380b), 0x98 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x380c), 0x06 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x380d), 0xd0 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x380e), 0x07 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x380f), 0xd6 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3810), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3811), 0x08 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3812), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3813), 0x08 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3814), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3815), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3816), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3817), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3818), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3819), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x381a), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x381b), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3820), 0x88 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3821), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3822), 0x12 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3823), 0x08 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3824), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3825), 0x20 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3826), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3827), 0x08 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3829), 0x03 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x382a), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x382b), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3832), 0x08 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3838), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3839), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x383a), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x383b), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x383d), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x383e), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x383f), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3843), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3880), 0x16 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3881), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3882), 0x08 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x389a), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x389b), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x38a2), 0x02 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x38a3), 0x02 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x38a4), 0x02 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x38a5), 0x02 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x38a7), 0x04 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x38b8), 0x02 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3c80), 0x3e },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3c86), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3c87), 0x02 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x389c), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3ca2), 0x0c },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3d85), 0x1b },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3d8c), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3d8d), 0xe2 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3f00), 0xcb },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3f03), 0x08 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3f9e), 0x07 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3f9f), 0x04 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4000), 0xf3 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4002), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4003), 0x40 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4008), 0x02 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4009), 0x0d },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x400a), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x400b), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4040), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4041), 0x07 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4090), 0x14 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x40b0), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x40b1), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x40b2), 0x30 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x40b3), 0x04 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x40b4), 0xe8 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x40b5), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x40b7), 0x07 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x40b8), 0xff },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x40b9), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x40ba), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4300), 0xff },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4301), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4302), 0x0f },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4303), 0x20 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4304), 0x20 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4305), 0x83 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4306), 0x21 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x430d), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4505), 0xc4 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4506), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4507), 0x60 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4803), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4809), 0x8e },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x480e), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4813), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4814), 0x2a },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x481b), 0x40 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x481f), 0x30 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4825), 0x34 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4829), 0x64 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4837), 0x12 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x484b), 0x07 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4883), 0x36 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4885), 0x03 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x488b), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4d06), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4e00), 0x2a },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x4e0d), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x5000), 0xf9 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x5001), 0x09 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x5004), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x5005), 0x0e },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x5036), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x5080), 0x04 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x5082), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x5180), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x5181), 0x10 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x5182), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x5183), 0xdf },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x5184), 0x02 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x5185), 0x6c },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x5189), 0x48 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x520a), 0x03 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x520b), 0x0f },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x520c), 0x3f },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x580b), 0x03 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x580d), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x580f), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x5820), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x5821), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3222), 0x03 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3208), 0x06 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3701), 0x1d },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37ab), 0x01 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3790), 0x21 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x38be), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3791), 0x5a },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37bf), 0x1c },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3610), 0x37 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3208), 0x16 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3208), 0x07 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3701), 0x1d },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37ab), 0x0e },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3790), 0x21 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x38be), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3791), 0x5a },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37bf), 0x0a },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3610), 0x87 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3208), 0x17 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3208), 0x08 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3701), 0x1d },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37ab), 0x0e },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3790), 0x21 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x38be), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3791), 0x5a },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37bf), 0x0a },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3610), 0x87 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3208), 0x18 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3208), 0x09 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3701), 0x1d },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37ab), 0x0e },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3790), 0x28 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x38be), 0x00 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3791), 0x63 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x37bf), 0x0a },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3610), 0x87 },=0A=
> > +=A0=A0=A0=A0 { CCI_REG8(0x3208), 0x19 },=0A=
> > +};=0A=
>=A0=0A=
> If you can go the extra mile and document some of these registers like in=
 the=0A=
> imx219 driver, that would be nice!=0A=
=0A=
we are planning to add two more modes and also work on enabling HDR mode, a=
nd=A0=0A=
I will be sending a separate series on top of this driver for that. In that=
=A0=0A=
series, I also plan to split the register array into common and mode=A0=0A=
sections, and document all known registers.=0A=
=0A=
For now, if it is okay with you, I would prefer to proceed with the current=
=A0=0A=
implementation as it is.=0A=
=0A=
Best Regards,=0A=
Tarang=

