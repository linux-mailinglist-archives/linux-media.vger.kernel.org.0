Return-Path: <linux-media+bounces-49815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 109ACCECD6D
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 07:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 184C230056D6
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 06:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384AC212554;
	Thu,  1 Jan 2026 06:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="RWNfLyfz"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021088.outbound.protection.outlook.com [40.107.57.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CB9749C;
	Thu,  1 Jan 2026 06:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767248348; cv=fail; b=s1LlkntXFGfVbaE8jYlKeYWt+8JFV3/w0rBqMhzgeuZaJAjYoARhvsLUdPK0FafPPw6FFR0ufhifp+1KpLqDxEx8d0+YndmXmGg2lz9XAXq351gUUGENQkomakMy3uGNMdm2cOy2Dh9URKr57QHKwdAceWJWYBEgRJ1O9F2rV3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767248348; c=relaxed/simple;
	bh=tWXsBYSmOP6dFeogXNsgvg2YeQ8cbNuImUOLbwmWYcc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e7BFxpUpuuQ1lw/yYav5rjD40jvvAmdDupcHQlFC47l5OpAn8mbX7hAjg6zcngEt80aAKZz3dP0kLg9i5/f7UVc0jUV7+cue3drKOjPZYihI8LeZBHiXnebBunlkayDtv2lzvdE7XiXwaoH9Ac10eiAWVLQPgb374+fkaw1BLOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=RWNfLyfz; arc=fail smtp.client-ip=40.107.57.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+t6oVv6CgdaKHri+SCLV/BPKnLxM4BXbCmQTG6YuFEbWjAe3vypbKfc0pDnY6wPSW9CZPo/m23Yn5auS7/PSW9R1taVrOQJHS3fovpjhryyrmrILnIBTjpwHx1HffZl6GyKNw1UD4UDabwL33ZtyzA0if0dPqpIF0d4pGohk3uO/+LffTVaIZDEH7p3wpdhwXnP4iNGhovIP0Q7i5cVn3q2dpo4CyBByxYA0eupuOzN1jENiXCJjpIN/AMwJucVJugTE3/WZxfuziUOsD4u/GyxbiLs1QRURLRJvJjNh6SQzmzPc1Tpl58juj3fPZaOWUJmcJlhPZ65oUDFLO3z8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWXsBYSmOP6dFeogXNsgvg2YeQ8cbNuImUOLbwmWYcc=;
 b=Kf5jbOPbAhrxjkR5hQE119cWxSX8zRi7AcRKgleZBeU8nP3/5LzRIkS1onKWe92mT8HQoHHpj0YVsx8cqXzXvO3s0eSuBWk4H3DLPdVqySc3VQ97GneRZRM/p6VR9qrLkVxTfRzGKQex5ec2Pdi7p4aAstPYh8YX2NyfxDKRXwbY8TJXgUXRS3hsIHTE/CnTh1pP6o2iIxP+r1udJZqIMQY4RNrOJdNXYI/uz4b8foWThjFAB0mWkpJWlaEBmqSGKa24Ol1pJ4GS98DtB17qgQLcFJuGL1tqes1d65y/bzxcMqnQNNm9dj2iCfCkXjcIV5StH/6TGQXWr3ah2/QPdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWXsBYSmOP6dFeogXNsgvg2YeQ8cbNuImUOLbwmWYcc=;
 b=RWNfLyfzFJoM53GBtopNApc3+AgXRyQqkfopyp20YEsXbFmzUIpCo5pxmQgLRq/Bb6R1Oi3qQ+1f2yp9GaTgVro/DC5gT4a7rDj9stl0vObsV3SUWgz7uZ7yf2o9a4Syas4YHCEGAKZS2QfuNZXKYsFje+MvWg05kwQ2s/aEOraJVrJyaM2zrPevFmSkAg7NkMhdhwLepDpJaIcqOYdoGDaGvZQc9MGUyrr5kTaV5AXqTAqqnaMzyVdsvPoXtIx+Wh3AXLwpqpC7ahdTSJ8XPBpKCy9mEX4hOUspHL5Hu9hnH7VvzPGByOfLCs91sIwMcaIT7WpStX+m/OPssqVplA==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MAUP287MB5218.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 06:19:02 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 06:19:02 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Mehdi Djait
	<mehdi.djait@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Hans
 de Goede <hansg@kernel.org>, =?iso-8859-1?Q?Andr=E9_Apitzsch?=
	<git@apitzsch.eu>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Jingjing Xiong
	<jingjing.xiong@intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] media: i2c: add os05b10 image sensor driver
Thread-Topic: [PATCH v7 2/2] media: i2c: add os05b10 image sensor driver
Thread-Index: AQHceiQl+WEzRulge0qviSo23SPS6rU7YjqAgAFzx7s=
Date: Thu, 1 Jan 2026 06:19:02 +0000
Message-ID:
 <PN0P287MB2019969BACCD6EF1325BE3069ABAA@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20251231070645.16434-1-himanshu.bhavani@siliconsignals.io>
 <20251231070645.16434-3-himanshu.bhavani@siliconsignals.io>
 <8838a2f3-4eec-42ee-88ee-55a71f789037@linaro.org>
In-Reply-To: <8838a2f3-4eec-42ee-88ee-55a71f789037@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|MAUP287MB5218:EE_
x-ms-office365-filtering-correlation-id: 3c454174-550c-4b34-3c9d-08de48fda87d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Xi76q8Z1w5iIjV5iiKfqeoh155ji4nNFsZnUgVTaSgzhXioO1gjwjdBFcu?=
 =?iso-8859-1?Q?oqNPoL06IgrjhBAYq9j6kMpaY5aGBGlYbeBx0nISEJsjMjSR2uPIa3G4Yv?=
 =?iso-8859-1?Q?qIqROBubx09vzDG4epvvJkyVVgY9pmHX8dmSpVYmY42xPv7W2RymM46Co+?=
 =?iso-8859-1?Q?RuKQ9RsnC37qsx2s3VjchQYWNyyqqv1yM+yiLAaWFxqD1bYxJZuymvefGn?=
 =?iso-8859-1?Q?Hz3XQVd17ITB8gwK1viToSsBSXp5+XaYniQCzwNkzWrDBw9Tgk8mmBXHhB?=
 =?iso-8859-1?Q?4cT1OqvOTMKoqXSRg5OyVfMXpy16PBCJzDz2P2C8z7+DOGGZc7PrJao1LL?=
 =?iso-8859-1?Q?+BSxs6KesJMCrXEcf0xCyKrrdeAijQztZflWEARlNBEYfXfQlQLbwF0CdK?=
 =?iso-8859-1?Q?hpQEgk8RRKehaV4Awvqt7DJCEsHOzBr7ZT5rx7druYy+4fDvinUVz1wqm8?=
 =?iso-8859-1?Q?mOVOqBmEhI1iiiCPzU07MkjSR+JL8f3TEjUEdy3gFpN9FodlGe2MBKrXk0?=
 =?iso-8859-1?Q?Up4SqJOtZrBXs4IWDnVv780l9WczSW9Pem/LuAhHzEfVJVjF9weAItokCj?=
 =?iso-8859-1?Q?zZ5SL9nz9f64kwNYmnkwNjSJIEP69kWkZOCd39/p9+YGjoXmS07ZmAjpRg?=
 =?iso-8859-1?Q?SKELJypd7qmeC6ygbDapJ2qYZ8UhUsBqxli48F8lN9Dn5EvpbBQ0c4hk3h?=
 =?iso-8859-1?Q?9Gl0rTukB5gG21b9jb3E2nRA81anTrkZAsJZP22vpDKKS4BsZ/oAgNY2fS?=
 =?iso-8859-1?Q?NXP3fIlFheVdgUbUNIW3TvDwlrpxedsZdQcOKdIkl8soKM0HbJxwJugx6X?=
 =?iso-8859-1?Q?br6NA6a1akZCXJ6nsioU8eAcsgEghg3HE/4LeWuG0asWXDJHOXAGnVwJxN?=
 =?iso-8859-1?Q?L0jbjHrNb9wHkx6mUsRess9ublFka8s3nLShYFrEB7EjfzePIjLkHjSxI1?=
 =?iso-8859-1?Q?i4MGGM79ffRlGjwTWrohGOG7z1871l/WiyFGA5YP4QLHW/8ol1p5h1UHd7?=
 =?iso-8859-1?Q?Sa0qgHkKiv6VaUYi5NThmhSzZf6Ne7tEu5NPjyPkQUiYfvjbFhfakt3dgj?=
 =?iso-8859-1?Q?Ds4h9Nm+kbPDbWJFG0g5RlQbip4lXfJ+GOoPOe1c+4QJF+16QKXbfULm/G?=
 =?iso-8859-1?Q?lWNuqINiL50qEH3rPGiIc5cxAk52T8KUDLKyF4rsM5ND3t4kV7Uc9rZmq2?=
 =?iso-8859-1?Q?TFhwtQR33yX6TySA+39nXGFQ3zDwUqI8/RP2rnSc+TkstyW5eZOo1f28Kw?=
 =?iso-8859-1?Q?TaNbRZMe6jw83vVPnktud+DfRggmGkV6ceGPF+4EuFI3BZ879e5nqEQR2B?=
 =?iso-8859-1?Q?pfcKbvxo48QvfapAU57yW8o5ayOSDbmmyhl1192AZOq94M0myyaPuzGuBN?=
 =?iso-8859-1?Q?gdQS+mUxBnbLURMiYSOPYYl7VCEwkStbKA1fM+RUFzHJhksl64vg+N4hKI?=
 =?iso-8859-1?Q?d1O6jRGGzZ8x3fqmZFugsb4YzQn0RUHgpruCyUpOy9TertgUaI35nFK6d7?=
 =?iso-8859-1?Q?LQ7sNFCcoJLL/L0g1+LcAvgh/2/K3lZ0agDAQxFhU/PoXLRZing7SDLK4b?=
 =?iso-8859-1?Q?yq005ikmrJBJgMsTsYi1Z9K5NSrl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xOZimfF6C0z7nKB2zqD2J/Sds07cbznTMTkdkqplk2UrO0PmzBjBwddASz?=
 =?iso-8859-1?Q?plwPDMuUNkG5o+xmjBvoo0nnjdpE3ZAPfUjTyhDw3/48Lay0nFXH8jz2BV?=
 =?iso-8859-1?Q?xcK7NByw7P4UKohIWs7kwKYw3KZQRuwlyZYko0KYE8g9fqfi7Hm3f9YbjD?=
 =?iso-8859-1?Q?PfcNrqVaxq0PJhTgR8Eyv0a0LAyjj/vDOM9WjbgnoA94ixp/o3tPq7ylzm?=
 =?iso-8859-1?Q?3aD2TWPyzb9YOJplQytm9rlv0Ilf0V0fz4igxYQp+cdcc9lI5WaRYJcljV?=
 =?iso-8859-1?Q?DZVOgWiephEB9Etng8E/kAeMmChH7rXiHScRhYf4ohiqhUT6edJHOQyZoG?=
 =?iso-8859-1?Q?JowB1V66JZzUh59aUQTGI28Al+hD5RJg7J6mpOoiGoNsjzkae+bbmmXxH5?=
 =?iso-8859-1?Q?xuXTk2Wt++WtZhy0tZiMZ6UUkUtCtwdW8qsv1/YIYZcrP5H5LkCylXbq6Z?=
 =?iso-8859-1?Q?6nvhD6vZhncjKR7yqHXb8XNfp1shzVkSdaRHXUijIl24l0E8zk4T8goRH2?=
 =?iso-8859-1?Q?0LKB4lYSGYSF4s+AaopOwxB2r0ifv5sQOntEdrWeCLAVqwLYhkdcTtBQRo?=
 =?iso-8859-1?Q?tSasFB/4QCdOYtcOph8DZbSJHhsjaxj1/6U9y9Vvs25i3tARvuT9deYG+h?=
 =?iso-8859-1?Q?DriX+0wBIasJn/H4t0yCBpF8bB4RZbai38U8vwKlOc2U0Dj2R3W+D6f+Ta?=
 =?iso-8859-1?Q?z2/JUmz9whgluCFjGp435MJl64KA/PMN+ZDGWHqLVAKAQP3vscILj8Kq19?=
 =?iso-8859-1?Q?2PBksy2+AwxOz2EDF/4VxeJBNof0B91F+Rq8KbkLySkpqClbcNIz5/GFoP?=
 =?iso-8859-1?Q?0MZb8w4C1cFiZQphHZmgK3a5bIRBZ4isQ2khn4urF8DlrE/lHl3ij5c/ks?=
 =?iso-8859-1?Q?mK90bbEp8w0L/zKzhEAcS7/fCZb1xrgsFzn2FKwzEiRTcrl4vVHmE4kv7B?=
 =?iso-8859-1?Q?5tjmNTwHZj3EE2bjLPpCSN4sywjfz955KJgQEt4lqKU9y0y2Bdva0y9FMU?=
 =?iso-8859-1?Q?ku9lTUDGTfV/y3qx52e2NF8Eo/m2AXSLKqxh1fL0zYDMZFIWcnuYWgNYBp?=
 =?iso-8859-1?Q?8wn24G0bOWpiS8vjsXILCFHFmVhTHz8eRkfTeG+Q7R3aFdPF4T+elUc9GS?=
 =?iso-8859-1?Q?bNs8rUPsUbT2atdFt6yfSGY4GTuDO/wrB7MgCMd689TZlo5GED/b6m2D5l?=
 =?iso-8859-1?Q?jdXxD+6Tx1eFQUgIQjY75X/75D66yoULnISjpBC4YlJZ1TwdH2ilm29tl8?=
 =?iso-8859-1?Q?1xc4AfriF14mq8Sz0BNwBn6HLGgFEmlQs9S/VUeBRr4ktxckndGe0CDNjA?=
 =?iso-8859-1?Q?PbDJAs6PqVPG0xWh1C4d6zNigpsCfPSPRWkPGshHbO/vQSH9crQ52H0vz2?=
 =?iso-8859-1?Q?b6p6Kb3X5lHvbcu9bqcZMmsz4B4JSA21JlhYrJNGAwbE/gYx+a2g0Hbnk/?=
 =?iso-8859-1?Q?PJZkhOngzJPok2nkxySUZl/u+CJ7DBdUVo4VU+UtUoldxcH2WjQ7/FvqS+?=
 =?iso-8859-1?Q?MVSdjSHP3E3Vw5zWHT+L+J+Vpa3hRRqfvfT+7v72WWtdnq3XpwnCANtjuN?=
 =?iso-8859-1?Q?B6oTJAddQiXOqAgl2eakPxwShO6BOZ+PydU/ZvJNWym2d8ur2zXm1i9Wx1?=
 =?iso-8859-1?Q?y98pnytUBZ6ZswzJoztGWRrBNAX0g49EkWdibnHg6DZL5xvzwU3V8Mizwe?=
 =?iso-8859-1?Q?MC0Px393B7kMluv4JBrc22T9TchLVn5ho5ga2E9rkuwPfjzswA02bGWpEp?=
 =?iso-8859-1?Q?6jvrLjsginDyYJwJ+J5LiQQhK/CyQnSu3JuNPir0OrRozLlDvoSUML/8F2?=
 =?iso-8859-1?Q?RynfiFz8V4UDh+dHHqXywo3eloKKRYU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c454174-550c-4b34-3c9d-08de48fda87d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jan 2026 06:19:02.3165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PwIS1zTEC3OpSdnNfNVUremPyzsvc7lwN8DKvkVFkWOvhDt71xroYVHAxuvniBsanMwVlS9Eu5paa7LUIUNnytn+SRj/JmNuuIvwWWcJHLSMR6bkORhduMMAldq7MOSy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5218

Hi Vladimir,=0A=
=0A=
>please find just a few more review comments, overall the driver is in=0A=
>a good shape.=0A=
>=0A=
>On 12/31/25 09:06, Himanshu Bhavani wrote:=0A=
>> Add a v4l2 subdevice driver for the Omnivision OS05B10 sensor.=0A=
>>=0A=
>> The Omnivision OS05B10 image sensor with an active=0A=
>> array size of 2592 x 1944.=0A=
>>=0A=
>> The following features are supported:=0A=
>> - Manual exposure an gain control support=0A=
>> - vblank/hblank control support=0A=
>> - Supported resolution: 2592 x 1944 @ 60fps (SBGGR10)=0A=
>>=0A=
>> Co-developed-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=
=0A=
>> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=0A=
>> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>=0A=
>> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>=0A=
>> ---=0A=
>>=A0=A0 MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0=A0 1 +=0A=
>>=A0=A0 drivers/media/i2c/Kconfig=A0=A0 |=A0=A0 10 +=0A=
>>=A0=A0 drivers/media/i2c/Makefile=A0 |=A0=A0=A0 1 +=0A=
>>=A0=A0 drivers/media/i2c/os05b10.c | 1115 +++++++++++++++++++++++++++++++=
++++=0A=
>>=A0=A0 4 files changed, 1127 insertions(+)=0A=
>>=A0=A0 create mode 100644 drivers/media/i2c/os05b10.c=0A=
>>=0A=
>> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
>> index c85915d5d20e..c48d04ca38d1 100644=0A=
>> --- a/MAINTAINERS=0A=
>> +++ b/MAINTAINERS=0A=
>> @@ -19240,6 +19240,7 @@ M:=A0=A0=A0 Elgin Perumbilly <elgin.perumbilly@s=
iliconsignals.io>=0A=
>>=A0=A0 L:=A0 linux-media@vger.kernel.org=0A=
>>=A0=A0 S:=A0 Maintained=0A=
>>=A0=A0 F:=A0 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yam=
l=0A=
>> +F:=A0=A0 drivers/media/i2c/os05b10.c=0A=
>>=0A=
>>=A0=A0 OMNIVISION OV01A10 SENSOR DRIVER=0A=
>>=A0=A0 M:=A0 Bingbu Cao <bingbu.cao@intel.com>=0A=
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig=0A=
>> index 4b4db8c4f496..9800ba50b9a6 100644=0A=
>> --- a/drivers/media/i2c/Kconfig=0A=
>> +++ b/drivers/media/i2c/Kconfig=0A=
>> @@ -371,6 +371,16 @@ config VIDEO_OG0VE1B=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0 To compile this driver as a module, choose M her=
e: the=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0 module will be called og0ve1b.=0A=
>>=0A=
>> +config VIDEO_OS05B10=0A=
>> +=A0=A0=A0=A0=A0=A0=A0 tristate "OmniVision OS05B10 sensor support"=0A=
>> +=A0=A0=A0=A0=A0=A0=A0 select V4L2_CCI_I2C=0A=
>> +=A0=A0=A0=A0=A0=A0=A0 help=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 This is a Video4Linux2 sensor driver for Om=
nivision=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 OS05B10 camera sensor.=0A=
>> +=0A=
>> +=A0=A0=A0=A0=A0=A0 To compile this driver as a module, choose M here: t=
he=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 module will be called os05b10.=0A=
>> +=0A=
>>=A0=A0 config VIDEO_OV01A10=0A=
>>=A0=A0=A0=A0=A0=A0 tristate "OmniVision OV01A10 sensor support"=0A=
>>=A0=A0=A0=A0=A0=A0 help=0A=
>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile=0A=
>> index c5f17602454f..561d37939875 100644=0A=
>> --- a/drivers/media/i2c/Makefile=0A=
>> +++ b/drivers/media/i2c/Makefile=0A=
>> @@ -84,6 +84,7 @@ obj-$(CONFIG_VIDEO_MT9V032) +=3D mt9v032.o=0A=
>>=A0=A0 obj-$(CONFIG_VIDEO_MT9V111) +=3D mt9v111.o=0A=
>>=A0=A0 obj-$(CONFIG_VIDEO_OG01A1B) +=3D og01a1b.o=0A=
>>=A0=A0 obj-$(CONFIG_VIDEO_OG0VE1B) +=3D og0ve1b.o=0A=
>> +obj-$(CONFIG_VIDEO_OS05B10) +=3D os05b10.o=0A=
>>=A0=A0 obj-$(CONFIG_VIDEO_OV01A10) +=3D ov01a10.o=0A=
>>=A0=A0 obj-$(CONFIG_VIDEO_OV02A10) +=3D ov02a10.o=0A=
>>=A0=A0 obj-$(CONFIG_VIDEO_OV02C10) +=3D ov02c10.o=0A=
>> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c=
=0A=
>> new file mode 100644=0A=
>> index 000000000000..7fa6e60d5d58=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/media/i2c/os05b10.c=0A=
>> @@ -0,0 +1,1115 @@=0A=
>> +// SPDX-License-Identifier: GPL-2.0=0A=
>> +/*=0A=
>> + * V4L2 Support for the os05b10=0A=
>> + *=0A=
>> + * Copyright (C) 2025 Silicon Signals Pvt. Ltd.=0A=
>> + *=0A=
>> + * Inspired from imx219, ov2735 camera drivers.=0A=
>> + */=0A=
>> +=0A=
>> +#include <linux/array_size.h>=0A=
>> +#include <linux/clk.h>=0A=
>> +#include <linux/container_of.h>=0A=
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
>> +#define OS05B10_XCLK_FREQ=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (24 * HZ_PER=
_MHZ)=0A=
>> +=0A=
>> +#define OS05B10_REG_CHIP_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG24(0x300A=
)=0A=
>=0A=
>In the CCI register write sequence all hex values are lower case, please=
=0A=
>convert this and other register addresses/values to lower case as well.=0A=
>=0A=
>> +#define OS05B10_CHIP_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 0x530641=0A=
>> +=0A=
>> +#define OS05B10_REG_CTRL_MODE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 CCI_REG8(0x0100)=0A=
>> +#define OS05B10_MODE_STANDBY=A0=A0=A0=A0=A0=A0=A0=A0 0x00=0A=
>> +#define OS05B10_MODE_STREAMING=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 0x01=0A=
>> +=0A=
>> +#define OS05B10_REG_VTS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 CCI_REG16(0x380E)=0A=
>> +#define OS05B10_VTS_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 0xFFFF=0A=
>> +=0A=
>> +#define OS05B10_REG_HTS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 CCI_REG16(0x380C)=0A=
>> +=0A=
>> +#define OS05B10_REG_ANALOG_GAIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
CCI_REG16(0x3508)=0A=
>> +#define OS05B10_ANALOG_GAIN_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0x80=0A=
>> +#define OS05B10_ANALOG_GAIN_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0x7C0=0A=
>> +#define OS05B10_ANALOG_GAIN_STEP=A0=A0=A0=A0 1=0A=
>> +#define OS05B10_ANALOG_GAIN_DEFAULT=A0=A0=A0=A0 0x80=0A=
>> +=0A=
>> +#define OS05B10_REG_EXPOSURE=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG24(0x3500)=
=0A=
>=0A=
>For sake of better reading let me ask you to reorder the list of register=
=0A=
>macro in this order:=0A=
>- OS05B10_REG_EXPOSURE=0A=
>- OS05B10_REG_ANALOG_GAIN=0A=
>- OS05B10_REG_HTS=0A=
>- OS05B10_REG_VTS=0A=
>=0A=
>It would be clear which position to insert another added register descript=
ion,=0A=
>since it follows an ascending register value order, only OS05B10_REG_CHIP_=
ID=0A=
>is outstanding.=0A=
>=0A=
>> +#define OS05B10_EXPOSURE_MIN=A0=A0=A0=A0=A0=A0=A0=A0 2=0A=
>> +#define OS05B10_EXPOSURE_STEP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 1=0A=
>> +#define OS05B10_EXPOSURE_MARGIN=A0=A0=A0=A0=A0=A0=A0=A0 8=0A=
>> +=0A=
>> +#define OS05B10_PIXEL_RATE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (480 * HZ_PER_=
MHZ)=0A=
>=0A=
>Here pixel rate should not be hardcoded, it'd be computed in runtime=0A=
>as 600MHz * 2 * 4 lanes / 10 bpp =3D 480MHz.=0A=
>=0A=
>The sensor may be wired over 2 lanes or (presumably) it can stream 8 bpp d=
ata.=0A=
=0A=
We are not supporting 2 lanes right now, driver supports only for 4 lanes a=
nd =0A=
10 bpp data. So technically OS05B10_PIXEL_RATE will never change.=0A=
For reference I will add OS05B10_PIXEL_RATE calculation in comments.=0A=
I would prefer the hardcoded at the moment. Other than this comment =0A=
I will resolve and send new version.=0A=
=0A=
Thanks for reviewing the driver.=0A=
=0A=
Regards,=0A=
Himanshu Bhavani=

