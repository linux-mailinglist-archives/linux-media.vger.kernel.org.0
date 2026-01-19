Return-Path: <linux-media+bounces-51006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F015D39DCE
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 06:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4347300BBA1
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 05:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB997330D2A;
	Mon, 19 Jan 2026 05:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="mfNy+R6d"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021085.outbound.protection.outlook.com [40.107.57.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC13D32F759;
	Mon, 19 Jan 2026 05:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768800869; cv=fail; b=dPgKPXcHhsYkzIy/JLFHrBtQmy3dEtnbhhBGXTLlvTuIJJ6ELCkjEXsRwCJ7a0SSrieBoC465x4EX9cxLJpBsSKhKOfvX5Oq7RI+JWkZixhUUo6IYAtfqoG3iFxAE09LzTAXPUHlTG0vxmqF9+0SSzCSf71HDd9d0aRICiu4WiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768800869; c=relaxed/simple;
	bh=+Z4gR13nxpWvY6VGLPFJzw7sdrFlcWILER1uVXEq6TI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gjk+8EJAgq3jm0kua8Uk+xjaHTAgrlzdKR8XAMNECk81hgk7OZnO+8Pv7yoMjiNy4jU+PDDd7N/TXjF25tt9h51ibi5iSOYH9nKrNTxF94jOFfQ/egbJ63Z+R2m45Vkyo9cTdlZd4LjbSjksAlPgyISpIzNFqLKNo97QYhncxRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=mfNy+R6d; arc=fail smtp.client-ip=40.107.57.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RY9r42B3jrwEPKgq+iQ2bb/kSF4MBYqMd/bl/zyYntk+Xn/WzsazHtqT2tXeTCBW4lWD2J0S8nqgtucOjkBZBTlj8kMVq9fp7USns5w4SISo5Qn/wiCA0OvwCnjpcqcq6W1Q/vKZKXAJQ+bMUkDmwe6EQA4G3svSx6uDJc2gSW1sB6fYdwfVqK3Zwlg7bf+e+nRE43IgbpRBwfcn7FfNgQdx9Hb07qiAOOx+x0ZmnZ29lWsXutpz/mh/CXRParAEFGwSBL5MYgbGflMd+Xja35H11XYiViIPhDW69muMTPDpdwfNynZxRAAx0S08d7biD9uSkVP2MixRjF6UXZKRnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Z4gR13nxpWvY6VGLPFJzw7sdrFlcWILER1uVXEq6TI=;
 b=jC7o36WwAgXlXz5Z/TbCaOcdat2uLL+/Ici4JV0O+7oIRRNiEqd870JvbApRHAB1nGghixp11xyXpCKjRq4QwlsWf5/yKgpK+qebvEem9pj4IZTE1hPBmbT8ThgOdKE0rIE7E8FLyWpFrECPPEMLl26xANnJi2DBwfAhAkjZDTxWQMvU41LvUT3ki1UFcXHA4GCgcLP5wAeBC/RJxpMrW2WoL9NBWw2kObNLmqBzfVT+mmBo4dFsOoO2notkvcHq2m/8rdoypGqg3mRa6AosaZ6eyowuAeEZZYDjl3990s9yitcFnsCjYbVMIW1yo+VzMFOHlYJh5lrUG5pci1OAZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Z4gR13nxpWvY6VGLPFJzw7sdrFlcWILER1uVXEq6TI=;
 b=mfNy+R6dMULTYFuMirvm83YRK5eb8WmKAlkzcLqOLou9A3JmiKsT6AhaQtmiiUX6R42mcAY7M5rmPHpXKo2SrEe6WgG9VP6SL9eIIxOcgtS+T1IOUa9SN8HRgEuEZy9Aol+fFSzXpbTu3QAhQwShUKyw5dXZeH/HQu1P1HwwQR65c7Lb1gQDxJraNG6zNDhSeE6yCKVhybvm1cJKpIJbe9IuiVItW9GjIs+IC4TX0JITvPrzHwSz+TMFo4psIIs6HkVEI5xO8tLHXOXMv24IBQSypTrJkYSE4DgDL5WuYIBeI7HK73XSwu9JhnO93aIXg3BXEuIgwbP2HwFy4XRUvw==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA0P287MB0583.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:116::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.8; Mon, 19 Jan
 2026 05:34:22 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%4]) with mapi id 15.20.9542.006; Mon, 19 Jan 2026
 05:34:22 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "benjamin.mugnier@foss.st.com" <benjamin.mugnier@foss.st.com>,
	"clamor95@gmail.com" <clamor95@gmail.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "dongcheng.yan@intel.com"
	<dongcheng.yan@intel.com>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, "git@apitzsch.eu" <git@apitzsch.eu>,
	"hansg@kernel.org" <hansg@kernel.org>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, "heimir.sverrisson@gmail.com"
	<heimir.sverrisson@gmail.com>, "hverkuil@kernel.org" <hverkuil@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "mehdi.djait@linux.intel.com"
	<mehdi.djait@linux.intel.com>, "robh@kernel.org" <robh@kernel.org>,
	"sylvain.petinot@foss.st.com" <sylvain.petinot@foss.st.com>,
	"vladimir.zapolskiy@linaro.org" <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH] media: i2c: os05b10: Few minor improvements
Thread-Topic: [PATCH] media: i2c: os05b10: Few minor improvements
Thread-Index: AQHcgGNh8iwyLjpIg0S/HPsnmA+XjrVUxiqAgARDVFI=
Date: Mon, 19 Jan 2026 05:34:22 +0000
Message-ID:
 <PN0P287MB20198F722ADB4AF0D9626C879A88A@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20260105093420.110973-3-himanshu.bhavani@siliconsignals.io>
 <20260108055454.71358-1-himanshu.bhavani@siliconsignals.io>
 <aWourd9Efg7yRNoH@kekkonen.localdomain>
In-Reply-To: <aWourd9Efg7yRNoH@kekkonen.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|MA0P287MB0583:EE_
x-ms-office365-filtering-correlation-id: 6bc62805-7fbf-4467-aa3a-08de571c666b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?hSRTyf57UhnetRNJjC2hi5MizAKKYV8yUQGcJbqvD5uiNBHLfy8lvSvW9N?=
 =?iso-8859-1?Q?J+ZIjvLb4uC25OtacQdQiopgZ5nlGYKvSesW+0aAWqQaY5paAOhpHToDGG?=
 =?iso-8859-1?Q?ErLU8RRe5MQ4R07pxdC+LRsg/9JVYh3IEMtiT5A4DTVLDppOf57saoUU5B?=
 =?iso-8859-1?Q?t2IcJwqmzfSFANSvDR4m22FcsZjtL2mC0IB8pvqhvNGd2A9Knuc0hXOKgO?=
 =?iso-8859-1?Q?BDGGnJAJD5paZn6L1p1DS1Qj7FIcNXEJ+XewgXBbnmt2HlpMpoLn1lkmHi?=
 =?iso-8859-1?Q?LzLCkDbV1CKcPTjoG/rsZeMywukM/pgrXMZ4l7jTDCg+Tvutq2lNIBeKUz?=
 =?iso-8859-1?Q?rUxWfsI+HyKCR4NafmNEBaCVC4Xlw1jXDCBVd4Ff/rOubnYwiO8dtk9waq?=
 =?iso-8859-1?Q?CSu8OI52EtfVbg4Gva0qNSGmvwGaiZgaXatjNIE8xmPLZS7R4t/2Pqrx65?=
 =?iso-8859-1?Q?2QtbLrMJjL2+dBzISZTgZiiDT+trketLbzCS0PsO1u1SXRy9JGFRVeQy0W?=
 =?iso-8859-1?Q?vI8Uj7b1Yy7UMlpF+yPErtWVwFdgtz1IE20Urdnarvm5+UZ8EqOwaOZlSp?=
 =?iso-8859-1?Q?NhZzSC/3Mu6kM58UVqSwLfv9uPahN9hbFAVv3tYiibyjtSTgPWn1zsuqm9?=
 =?iso-8859-1?Q?XCa75QRDKbFrmJ4dI7UoI1jI7YGewwbtib/LsUp7kgYkuM9hL1d+fLGNhz?=
 =?iso-8859-1?Q?JRNMPiOypRIaHKFZ9zwF0crp54WIK1MkqnhIwJJUjLDTh+8cyMjqzXcplQ?=
 =?iso-8859-1?Q?13O1FRNnLSJyQoIz4uckEjcNbSSoF4bm0dAT1SjEXpiFZcaSpWUDoJ73K3?=
 =?iso-8859-1?Q?Ex8LoJr5yHNWZg+XXc/+IPI35w2NtwY5nCIxVGPkyjWLWxdRivaFgahZbD?=
 =?iso-8859-1?Q?HkhWrwn/XTULbU3h2ScAN8QmVwtxcnaYAXn4eo936JZKWxH2velm7Qw4Ur?=
 =?iso-8859-1?Q?3Gvxavhhzx/B+VuAtH8uARGa24BjQRO7xFdQBWc0eyrUXlxR87h/fP33fk?=
 =?iso-8859-1?Q?EcWhh7qnlR3ke6cjMO+cwR3oXlhxNqMMhanu47QSSfCv3ESCdl2SlKUb68?=
 =?iso-8859-1?Q?Ct0Vc1mQeye9BpX8YZxYyDkqE9WoF4yNpPjeFK+7oAg5E636WizKjixv9P?=
 =?iso-8859-1?Q?uIHc85G/HSGu0PeesBWP2+JRkjZs4EvCwW3GHqnpWGW3vdfmiPgzKpJiBu?=
 =?iso-8859-1?Q?guZQRIqKZ+Has7W6euPterQW3c6OM6aZKLE8+n0lKbQJ+VaRHghKiXB4OZ?=
 =?iso-8859-1?Q?nR7u8yTcNwX76mCflmMQm2gtNrxzaDRX4jiuYkLrAOhLUPlyfYEb8NyMv2?=
 =?iso-8859-1?Q?TRae0rr1FpnB5ayMkTYVGA/gYFsRaATpgKc7mV6+9aHMWsbnX0UvkC2bwQ?=
 =?iso-8859-1?Q?VKtdPBjOSgoep9gQHACqhVjvHfjW+7httAx4e/8anl0zkV+8KiXJhO5Jx3?=
 =?iso-8859-1?Q?Z4xdV4m7CVx98hc5HAeVjlVFiyA5vK9rJSplrdOygDh17Q6SYMbXpwSuC3?=
 =?iso-8859-1?Q?xadf9fH9E/DT8W6OU1ovkm+Z8GDfev7Nf6zY4LxH4EFcSrPOjHTZA7irch?=
 =?iso-8859-1?Q?ZtvmipSgj2URSWqLkxAaSgLn4giUz1ZWoAu8LjWjAVlUj7iaMLZSuWsm3U?=
 =?iso-8859-1?Q?X5xUzhglTNgFTBfj0yZf3cwBhMoA00z8HpRg9pFYFEQpLfN4OM8lZXuz9S?=
 =?iso-8859-1?Q?iaCMAPIifwzDezxYtKE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4rPsFgbxhcSCrNBxFQ/8ajnDiUklqbYS/sUOKh0klq8jB0anl6ggRc+Jor?=
 =?iso-8859-1?Q?8zIXymYdRf1T43eDoW2Ajra9p7lnWlk079Vz2XSt8Dtt1DzcpbxGKiwiu1?=
 =?iso-8859-1?Q?sV7SK2vKV+HfnUQov53GzB3b/C+acNbta7u2jO9IF1MpmioIdlfa/3VL4g?=
 =?iso-8859-1?Q?W//HjY+riudlIX1DoVXwQDNf9HG4V4pVorDrsgF1IdYoxpPN1g1/+wFXd8?=
 =?iso-8859-1?Q?G/JjfjChY629ZmubxjPytjv/4l3mjs6mJw8I49dlvlQ7ldhjRaTOx4Oyjr?=
 =?iso-8859-1?Q?D9Eg/MqJzzGUaD2Xo7K3GAfMkFMrMoxhK3dQbH2Mm9XMF1BEPZ4lBw3fOI?=
 =?iso-8859-1?Q?3UUZ9KniX9nn+Yzm4umhDEGheAJkMR5mL4/pursHOh0wrir11h9EH53bYh?=
 =?iso-8859-1?Q?6QRW+q1KlROaBG/ZackCJ70Dn/kAKODOXicm3L208ispmPgfcRgX4k13Hg?=
 =?iso-8859-1?Q?1o8xFiuplHERurFoH07vv+U27MuQcOXpNOAYX8bEP3fSfW3ZEfKoKVDdXE?=
 =?iso-8859-1?Q?JR3BmLTLRU64G8nqql/hSYBk/hFOONMo8ok97XBuFS2yZXt2Qn3ujhH5GX?=
 =?iso-8859-1?Q?stQ8r76HDnzmUY7owWxhWnUb8sFTOJckjD7nCsPDOIH5yjNLLBDiz8CraJ?=
 =?iso-8859-1?Q?lu72xuv5UozrQjbu663uDBYs2pgIRffz4TuVjcDDMMjGIN1/f3C6MSvobc?=
 =?iso-8859-1?Q?Nr3eJxmKTpHz+gTC5SJS+5xLp+LeWQrS0f8kvLIBuqc+5oCcrCTg199ouN?=
 =?iso-8859-1?Q?w61WY7hyneItbpiGGENbGVcHjvxxH9ND9xY0E3901fX9i86IgIlKFKy8S9?=
 =?iso-8859-1?Q?o6MVvrdGL4EOpaUkz8trG/juaLVeBUj6eSnIs5D8BrFapxAFvDu99nGOr9?=
 =?iso-8859-1?Q?YYLhN51dU68exvyc62VMbVb2wwIIXjzYIkXTc9pzLWmnozaYVWgaenNTJy?=
 =?iso-8859-1?Q?cRJmLZN/98zmTEeTYPeauoj8yJEItskOwnotcisnGBcVBLkr3nNGPJ1VAw?=
 =?iso-8859-1?Q?8QukdAi7lqhk9ur/ldsqtEICOjOaOWr+zvY2l3ZZO2Wis8E70Druy87Xzw?=
 =?iso-8859-1?Q?Y46q4yQAMC/s2/mx5GV/uwYF8/2/YPOg2R1k/C2Nl5Hg16z0LSoiBqv3gS?=
 =?iso-8859-1?Q?p9+8ZrbhRiN+w2I3RRWTMVNdLSjwaCxvuKtjtXqAjek4kSLHNUNGKnzDoQ?=
 =?iso-8859-1?Q?R+WJ0y/QMC08LXQXMgP0/aUMFLvx3Ept4ko/nKbTtlPIVcTQIB9+MThV2G?=
 =?iso-8859-1?Q?Wp01j1bac+aHlSE9aBaKU/P8+N8bn2kFsiXLefNJaxgfv4i+txtszaOnfK?=
 =?iso-8859-1?Q?UgInUBhXZKg8FFr//2Kox5O5uk24YR29V6N/JSPv1gKOXe1AErXL7uYwLt?=
 =?iso-8859-1?Q?OJkoXyUYQfsnk6OJP90ZHI1bCgWcYhsxkw6BmnztyLaEWl5h0OlEi9w/1+?=
 =?iso-8859-1?Q?yI6NGl3Rl5NdHTvjEhy9dAPQ9w0e1MQbGj22aQJ6hsH9XTtedg3C51Ea5C?=
 =?iso-8859-1?Q?ouxSTGr8gRE1LdGby7Xe4E6TSpa5tteH0j1vFKoCgpo/cMUVk9bp2Q3ouY?=
 =?iso-8859-1?Q?E/kcqqY1Q+sE7gyOUnMUKYRtkERVVtgkE3VEFoaeVgrS5ffXbO1mt2bNUk?=
 =?iso-8859-1?Q?EcS1bf/lzi2Znacuwv5YA6lOgzuwjb/jNH+jxR8KmB9qiekhSPBBQQIH1r?=
 =?iso-8859-1?Q?F0Ewfod3vxBTy2b8JoY/CvcJ6ZAmZ2k3ZXCLZqWOR+bbwVxZi9KyNHuX/L?=
 =?iso-8859-1?Q?LKCTZzANC5mnWF8GFoKG9T6wGBl4CkSUrfFGZd0McmYhMcpk+2gUpBlW/c?=
 =?iso-8859-1?Q?YsO8NXKUepIZhr6JFXPhODERLXu5UGw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc62805-7fbf-4467-aa3a-08de571c666b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 05:34:22.2030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pIZQ+H1bo7lrdW7P3eLsWQjyC1oXHuDXuDpa5mofV2SWioYs4fSdp6v9JlE4uaL1tjFIQ/+OM8RfafKaGUprpFS+3oy024kUERAM7u7bMdTr9fRqQbsLJo/fuYFhQ1QD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0583

Hi Sakari,=0A=
=0A=
Sorry for the mistake, will take care next time.=0A=
=0A=
Best Regards,=0A=
Himanshu Bhavani=0A=
=0A=
________________________________________=0A=
From:=A0Sakari Ailus <sakari.ailus@linux.intel.com>=0A=
Sent:=A016 January 2026 17:57=0A=
To:=A0Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
Cc:=A0benjamin.mugnier@foss.st.com <benjamin.mugnier@foss.st.com>; clamor95=
@gmail.com <clamor95@gmail.com>; conor+dt@kernel.org <conor+dt@kernel.org>;=
 devicetree@vger.kernel.org <devicetree@vger.kernel.org>; dongcheng.yan@int=
el.com <dongcheng.yan@intel.com>; Elgin Perumbilly <elgin.perumbilly@silico=
nsignals.io>; git@apitzsch.eu <git@apitzsch.eu>; hansg@kernel.org <hansg@ke=
rnel.org>; Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>; hei=
mir.sverrisson@gmail.com <heimir.sverrisson@gmail.com>; hverkuil@kernel.org=
 <hverkuil@kernel.org>; krzk+dt@kernel.org <krzk+dt@kernel.org>; laurent.pi=
nchart@ideasonboard.com <laurent.pinchart@ideasonboard.com>; linux-kernel@v=
ger.kernel.org <linux-kernel@vger.kernel.org>; linux-media@vger.kernel.org =
<linux-media@vger.kernel.org>; mchehab@kernel.org <mchehab@kernel.org>; meh=
di.djait@linux.intel.com <mehdi.djait@linux.intel.com>; robh@kernel.org <ro=
bh@kernel.org>; sylvain.petinot@foss.st.com <sylvain.petinot@foss.st.com>; =
vladimir.zapolskiy@linaro.org <vladimir.zapolskiy@linaro.org>=0A=
Subject:=A0Re: [PATCH] media: i2c: os05b10: Few minor improvements=0A=
=A0=0A=
CAUTION: This email originated from outside the organization. Do not click =
links or open attachments unless you recognize the sender and know the cont=
ent is safe.=0A=
=0A=
Hi Himanshu,=0A=
=0A=
Please add a commit message to the patch on the next time, please. I've=0A=
done it this time.=0A=
=0A=
--=0A=
Regards,=0A=
=0A=
Sakari Ailus=

