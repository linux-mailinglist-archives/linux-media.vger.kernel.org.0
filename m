Return-Path: <linux-media+bounces-30224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B62DA897CF
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 11:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E30616DE90
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 09:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219132820BD;
	Tue, 15 Apr 2025 09:23:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021136.outbound.protection.outlook.com [40.107.57.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061811A3031;
	Tue, 15 Apr 2025 09:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709030; cv=fail; b=iNwM0KKj7VqbUv283MygkVoFBckOVRifAMdZYE8IUQwxatFF91Wg398F+XExq3+CrYTS17InBpDE2UquYPH10IU/+NWRs8T7aHqld8fQcJkZnUGwi0apoNzlk70aKPXjnkXwTDSJjsxNnL+GzZNDpCDdYrwAHp8gOMeP8F+oPwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709030; c=relaxed/simple;
	bh=Vgu4+TWE5hN/aOBaUBaSCwiwf9n6THULRXQGyAmRFpc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gvjlyHSTeab5tHSfERDerNUkUU9OlaLKe1AvmIH5bDQJ4euZOomiXx2Al/31M63JygWZrj1DZiB6xL9KpKlfu+OA6eijNk4p9Yb1tVQrvUbaFG9xLnOXA8MMbBMB1lnmY5DtXYy7cjtRuR09tRB3gx/9XhUkfr4B2nZmaQfydsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3NWDDS7ZeJ+wj16aheaJYKvZbVB6vb9e+CdfEgP3VxpDq4hgYoEdFylvXqUwdlAW4zz6dBBhcmQ2mHXvkT3K29SBWLoT0eEUTBjFWMvl3e1P/6iPMFzdc85IqSjs9g7z3UByzrXpKyVcluYPPIZmAFbPjNZyVhuuuhPkofK8UoJa2e7zo+VjxtQ9v8KjUOZOP3ImXuN8BHiMPYWNxG8DXGuFlmNwFBy5BEkuoOPy2HcT1Q0ChZemJtfXRmw9ipsMdWatpoPRvVxGUevbAqC6x5xhDPTWprMCc7w14rPl2ncMrvtKx1FuYVo8GCBJZKbzczmGZgd653jBVJEc4LUog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vgu4+TWE5hN/aOBaUBaSCwiwf9n6THULRXQGyAmRFpc=;
 b=m7U32LFiXn6kPYijirnylfNo3DQPrtvcnIZuxXBfcL9AS4pSQpKtF7y5FZLUeXbQffJYAG8UGd9Gvap1C+VUgt/2d8rvxYcxbKG+9bzUmnNVaA2JmAguN0AmVK/oWgbExcGk3CAuOxuvWp/XXkUzqFNdZgvC1NAiw6xEIydOInh9liROK2AKk1JvAxqE6hHOF8PRxdgSg4KLnVpm9GW03nGSORnEHtVVvIkDaohh3Feh2OvOzdZ9yGg2e2ErTB5xfBmJf5hwltqhmJg8D21rnJQDE/p15lKvmdA2AmnK/JLH5jtlA6C+0YJHa0eh2u3SeUAkMJfGFXVbuUas/mBu9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB0943.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:176::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Tue, 15 Apr
 2025 09:23:41 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%2]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 09:23:41 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
CC: "Shravan.Chippa@microchip.com" <Shravan.Chippa@microchip.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Julien Massot
	<julien.massot@collabora.com>, Zhi Mao <zhi.mao@mediatek.com>, Mikhail
 Rudenko <mike.rudenko@gmail.com>, Kory Maincent <kory.maincent@bootlin.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/9] media: i2c: imx334: Miscellaneous cleanups and
 improvements
Thread-Topic: [PATCH v2 0/9] media: i2c: imx334: Miscellaneous cleanups and
 improvements
Thread-Index: AQHboG26RZJ57Z6yKEOAszyAolzY1bOkjDgu
Date: Tue, 15 Apr 2025 09:23:41 +0000
Message-ID:
 <PN3P287MB1829D27A21BFFEC97C8F5B678BB22@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
In-Reply-To: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB0943:EE_
x-ms-office365-filtering-correlation-id: 96a3988b-62f7-4381-720b-08dd7bff367b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZzWXBxNsXYgH7wfgwSAo7pK9zgIUt3P1blvbxKUsoJBhNi/63EAPFC2VDL?=
 =?iso-8859-1?Q?YTuTpalyfoDlNHOPxmIaqmxJ1XYsoYNOk1ySIUf/hcFCk0Tr3T5Q+qpHCd?=
 =?iso-8859-1?Q?/HVdhxevQbsSaDHax5CJyUkkZqBLCPJ6BXSgVczAo2WFYHcAmkKLAI4wKS?=
 =?iso-8859-1?Q?dvqvURDnNKVT9tFM/elymKIy9wt8wsh8tICKqmlnBRfIN1TvDMUAuT/9qF?=
 =?iso-8859-1?Q?zjnA+x9cwWGKbQF3uJy5nCyfE+cq5wtmZVauN2EVIJWHNOm04+dGXOqKvf?=
 =?iso-8859-1?Q?0So1re53guz6p7yH0jT6zE4PWm+5j8S9tSFrrxXBctyGFAH+OFU5Mpm8jK?=
 =?iso-8859-1?Q?SXy04ZlORdaarpfk5eqVlMIgoaHsFo3u775tqy0kqI0DAEXirv9+YG/lHG?=
 =?iso-8859-1?Q?If8oBBQlxf5hst9nGo5+r2GQvh2C+zWn3VRjr/AKgaAgxjFuaKNOyi+exC?=
 =?iso-8859-1?Q?YyrJyh3oBjS8oB8ySFTFr5MHxnhy8hz6k3Kh8/k/f2svupRj0g+fA98Fbu?=
 =?iso-8859-1?Q?PFkMiNNd9cbQnevnYDhRzX4/WiOHGC/B59xH8akMufoge6/fTt3Yx6KlKs?=
 =?iso-8859-1?Q?yCAg/sJK8RvfZyxA1iOLYE8VJ+d/j7yBLXE6YKFx3yU32xGlRpYycPc2VO?=
 =?iso-8859-1?Q?564zV9pmMDco14l0FPEie76eFSmlET8xUe52U6auSMh51fURiyQfVnBQ8R?=
 =?iso-8859-1?Q?stUUIfw/eHmc+g2nEJOIhs3OkTpiBIIbcresVpsq2baCWOr2TEyr2RaGhz?=
 =?iso-8859-1?Q?aDcmUEJGym7dbI1Orwd+sej87XihesIntv3z04NR0nc1YGhvdDTIuKsplG?=
 =?iso-8859-1?Q?b9hf8h9MsNIqSJ9PKJikmzVtTYb8nerdq4yFcTcrS/+r2ZttHfEfSSLgy9?=
 =?iso-8859-1?Q?SaKbXX5vnclbcRGwUNeFPjPCvXY00qCUXi4ScHhdv/25xwsYJbREYxo9Ps?=
 =?iso-8859-1?Q?F59SUVKGJYPk6Sc2jZzfhESAUqhtcT8tAzEaZQay3yeLOFVXGhA72LBnSS?=
 =?iso-8859-1?Q?o2azdHiKc2+3Gn//jy9KxX7j6i1LkqoQTaMf8iDkPDam6jeG2yDjq0SeUe?=
 =?iso-8859-1?Q?EBu5ECzdFRn/ANkg3gUB73LguRSpfMlX+3n6KM3cr8esMQOELetNeGZxJe?=
 =?iso-8859-1?Q?kR5BfH1YvXcsBQd7ubxKshsnQ6N1IQeN0M4hVOgRHewc+oYuL/r16hXYow?=
 =?iso-8859-1?Q?CXzOIUIij0ikIwJUqJ5QVsfRHPwYx6hBhQ5MdMgQmEEspI3cfbbjlwBpFe?=
 =?iso-8859-1?Q?cAXDSmcd8GAwbVnwAIvM1PkPzmH4Q428FEpg8EGEhqmpT2fV+q6pefE3Zz?=
 =?iso-8859-1?Q?kzG3nYGLKdvy3l6CGjgi1crpAjZge0dRU88Wumx/TsLmPwNqk+hsMfY4U7?=
 =?iso-8859-1?Q?PetPpYvIvLzd3X6+FsKdm991eoQsLm0UsSQkT+OoXI6F2KCLMb40SRw5rl?=
 =?iso-8859-1?Q?2m+Ln96M4SICUIfgtTzUXIW4hRPP0WJCrUR6jEyK1UA5uBiZrojZ1eu3Hr?=
 =?iso-8859-1?Q?Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?m7flj0T3XnikSEX7pC498I3YCrW8ppuM+BA83Z8QdqP+rB6/P3QULT2J+r?=
 =?iso-8859-1?Q?bSHi/xTF13mgy7tKH49rMM4NJvqwujgcT2bIwJb8jcpo/x9u6tyxoiZIpw?=
 =?iso-8859-1?Q?Y2C7VVXVgQQ9rXGW6Lmq7vb/gvz4Jl8zPJrjIn5jxGFBlalBQzLnG9+bGX?=
 =?iso-8859-1?Q?KrEQhdQRdyW+qVEzjScRvW6JF8nzycijbmL6g/Bz+itoaZ01qvXp3xO0Qw?=
 =?iso-8859-1?Q?je7lpiBRqEsDs8RJKhKV7cbDHFTEq1TnHyufvx11yIZi9QK1tzJVnZagVs?=
 =?iso-8859-1?Q?PyKfVUPMHsDJOXWv03TNrh1HJspyImDl9tlvhDOGnbvQOIcE77nkkl7CnM?=
 =?iso-8859-1?Q?t7zG0QboRmeR5rX4/ti2/wOcdSXY9A+jXG6oH+23v44oBn27uWYvkf3FrQ?=
 =?iso-8859-1?Q?zFVTerkF6eGXWTLNhsmRi9yrcGsUsrCpJB0B41pHiVpPwtm5tPOvMOx0uz?=
 =?iso-8859-1?Q?rKpX9Ds5ecS4Bx+2NDyfYXfqEUceJ5udYvVEqjNCzhnCI5f2Tx5JeDx1CO?=
 =?iso-8859-1?Q?vflnUOSxY/jz+NRmhye3h+bKHsEybDjqG6MVtiRGdV2iLZvUmPyeLVDx3D?=
 =?iso-8859-1?Q?rnaKlmX+41khKyf4ZAIRQDiNfHq6zoAMdavRZCKAhe9Y5QOal2pFIoQETt?=
 =?iso-8859-1?Q?8kv4CKpfwmDPXxiWtT+KZIIXFQkpvivqEeeM2OM6w3c6S2CIC4II0Ys0kX?=
 =?iso-8859-1?Q?hh7A3EWGk79Ebldp/kZ7JVVeS2im/TMtPkapfjvDkf0nYtguDPGRM/sywZ?=
 =?iso-8859-1?Q?iIpZJT/Sc56KaiTSe8VcxnibmIAV/xP158ADSl+zhgNd9r/xTZAjWRI7MF?=
 =?iso-8859-1?Q?L8Hnxm2p2yBZ+SkL9GWmTYsiRR83pTHyIboMjUxMAKveEp6jsgj7gwm9li?=
 =?iso-8859-1?Q?KhGtxPImts1NswCt9pijKYvshtxiulTytWEwmhfRX3ttSprECZ8TGGAA7Q?=
 =?iso-8859-1?Q?44yhTAKfjy3e+p1a81206IgfqTHt7H5wErk7nwFjBtju1tirvmrY9eu5De?=
 =?iso-8859-1?Q?Hw9iZPnnEndLzCxGNrTkOyv6GBF3GtyVOn0ZpuuJw9e/Z3yL3XX41K/54/?=
 =?iso-8859-1?Q?3gA8M88OaI4VT+Ma2P+xqVKzpR6oJtJgsKJJHFuXck/odD0Ksuth968Ny8?=
 =?iso-8859-1?Q?+jmi3xdRXP/MIZNAaWRVj/iAWKIV6GvjGv2XvFZp7kAfmcOVe92Ur28tlU?=
 =?iso-8859-1?Q?aM0DJrwKxTW/59cfSqGc4aV+fD0SY7mYooaFI6UuZ23JDLPt0I6rXOUfAk?=
 =?iso-8859-1?Q?rZ80GetD5/3QOQpULqfk0rOqUTeLesARWYncE3Ld7Lj3/aRTNLNVZiFHj1?=
 =?iso-8859-1?Q?XITNKLtYp2uizT53gZnztFITvS9lpI+5qJCIT0/RKxsSrL6wZLp45FyZHO?=
 =?iso-8859-1?Q?9Z9Cn9YrrVnn3DcLmrjiLO3SnyEEJek1HbfPUmADedjHwbzssJoxtnDCTG?=
 =?iso-8859-1?Q?lZzJJHsym1PWFq+WqPboufJ3zd+paiQ4DtoWoogunXoBBud8FE6pDzVP+f?=
 =?iso-8859-1?Q?kQiLc/+gCgkBB9+Ev1oEvUPY9NjUCWhCSF15JjFmgmxKIiJFkqc0TsCxN2?=
 =?iso-8859-1?Q?Paq29jNMs9KzDSpKf5GI6ymyZOGeueeoCQ4C6vy9fOw0AZv9+MtHOkBNln?=
 =?iso-8859-1?Q?DuWWgEDcprQTRlt5Bmmw6YcT1++PJXHYu0CPcBHh4byBpAU60veEs6rg?=
 =?iso-8859-1?Q?=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a3988b-62f7-4381-720b-08dd7bff367b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 09:23:41.6962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nMS8jyG9SzAk+lXQNDSGYBV3c7kdvFO46EL0ffttLKC2FOkCXFioiKwx3ifQtYyax29l0sn4Ri43G4RiHzK9VM0bh/6zj/Nh5YZ3B4tpIwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0943

Hi Sakari, Kieran=0A=
=0A=
Do you have any further comments or feedback on this patch series? =0A=
=0A=
Best regards,=0A=
Tarang=0A=
=0A=
> This patch series is a collection of miscellaneous cleanups and=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=0A=
> improvements to the imx334 driver.=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=0A=
> The changes simplify error handling, optimize register access,=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=0A=
> enhance power management, and add support for different lane=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=0A=
> configurations.=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=0A=
> This series is on top of Shravan's patches [1]=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=0A=
> (media: i2c: imx334: Add support for 1280x720 & 640x480 resolutions)=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=0A=
> Link [1]: https://lore.kernel.org/linux-media/20250305051442.3716817-1-sh=
ravan.chippa@microchip.com/T/#t=0A=
> =0A=
> =0A=
> Changelog:=0A=
> =0A=
> v1 -> v2:=0A=
> =0A=
> - In patch 2/9: Added space before braces.=0A=
> - In patch 4/9: Corrected the commit message.=0A=
> - Added new patches (6/9, 8/9, 9/9): Fixed PM handling, used subdev state=
=0A=
> =A0 lock for synchronization, and switched to {enable, disable}_streams.=
=0A=
> =0A=
> Tarang Raval (9):=0A=
> =A0 media: i2c: imx334: Simplify with dev_err_probe()=0A=
> =A0 media: i2c: imx334: Convert to CCI register access helpers=0A=
> =A0 media: i2c: imx334: Remove redundant register entries=0A=
> =A0 media: i2c: imx334: Configure lane mode Dynamically=0A=
> =A0 media: i2c: imx334: Fix power management and control handling=0A=
> =A0 media: i2c: imx334: Fix runtime PM handling in remove function=0A=
> =A0 media: i2c: imx334: Enable runtime PM before sub-device registration=
=0A=
> =A0 media: i2c: imx334: Use subdev state lock for synchronization=0A=
> =A0 media: i2c: imx334: switch to {enable,disable}_streams=0A=
>=0A=
> =A0drivers/media/i2c/Kconfig=A0 |=A0=A0 1 +=0A=
> =A0drivers/media/i2c/imx334.c | 959 ++++++++++++++++---------------------=
=0A=
> =A02 files changed, 421 insertions(+), 539 deletions(-)=0A=
> =0A=
> --=0A=
> 2.34.1=0A=

