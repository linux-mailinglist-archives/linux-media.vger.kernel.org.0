Return-Path: <linux-media+bounces-65122-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NEXlAvqkMmqG3AUAu9opvQ
	(envelope-from <linux-media+bounces-65122-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 15:45:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C97169A3A9
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 15:45:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=nwtW2RsW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65122-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65122-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DAFF30E725A
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 13:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775F53A6411;
	Wed, 17 Jun 2026 13:40:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013015.outbound.protection.outlook.com [52.101.72.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8283FCB2A
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 13:40:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781703607; cv=fail; b=FhRnXPPKOtAG9PVcVMnGPJOvjXMRp7PlBsqgQro56GyPhbk1mwh3fSuiGbbetIQrEgSCgpzpRtCpXMK1wc/pKhCLYSIGbB+GhYsP5XQVFV5I5hXOgAZ8SNKnYcKiEFGyY1eg24B7Jc1k2UvtYy6+YM5QC2tdDnKLSZgqpc23tbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781703607; c=relaxed/simple;
	bh=+5AOnFEv92y24yFc9MNrXS8A3oLu1NcpayRgs6Xy9GA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tzf1bFH0vI4i9g6lqtA0GRq68tgNKdde/EahqegfWoNbl0Vr8+l2I1+qntL6Tc/VANrO5KAHr5AqZnpPkNK4yR59zAxEQayzU29FY4bysU9kKdUXSVGQWlwj+vFq/Fln+0uvtZSmDCIuFy0uEYMyZAGd4uTM/dn09iyqWAOcjDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nwtW2RsW; arc=fail smtp.client-ip=52.101.72.15
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLccovMVGd6g21QWm8vkXvMdcjywf17fJxB1upSl1gBEkWArl00oooxGJDOiPRdX0XQ9DoawsvapbqS8uEagXj3+lTElRwRH08yzk5UBcw9tIgrzQPRfNXvL7HkXVDrnCkkP5bvu2L7zN7asPhxForks/s+hX1w+a7PBhz5tnSnGsykBW4gq0ejfAEqdt5teenotUq4tm2ydo4Y3vFEcC3pwzocvFRh/cXYYNdW78apMHJi4J17n0zhBid5lSFKHVXhYYRGsF3jesyf3X9fHv4+cTahpfImFS+oHONba2qEzhWLz9fh6OJTaJ5C/s2E2BmQzsg/tnWkad2/DHeDxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlBIO91uCeCYGZKJLuqkGzOmqnY2mf3fumN+EWvDWko=;
 b=B6Ez7j+KsWgn8J1MyBkDOzuAmLNciZG/zLFtA0JwRf3oeyBzSDWv91F2qVq50L5btTkgJjrni5BucNl2/cr2jfhq4NzEMo14evsPiLPNAnygmaDrzwORV99uUXDLPFsklDmqXCAmmWd9aGZjbhxrjSpbkRfO5WLs1VG45S+xp8liqMdFnXycvmk5/Z9he3zriNRqT0ypt6c/ULDb8chpj/35qCEwnplrxEf3p9faOzGXz9Pcm8I+tonynlUcFxaMY9TLtUIQNcOQHe+g4/wrWDusew7uqgrjqteTK29u2DpUU5Zv1DwO2jPQA88XRd4uDn7EqthJRz6dKXxUsbNEEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlBIO91uCeCYGZKJLuqkGzOmqnY2mf3fumN+EWvDWko=;
 b=nwtW2RsWOXAtYRWDh3fDz5O2FZErGQvqbHtOHZOjOIBbcfgTwarhTIz4Q2us05eZYGFTxwU3WRnFnhS1atksl6kb/R1ogzGdYna+WHNCs5KYzcrkbmWF321YmUQTAr5iH69nHc+shGd3wv/aosEyjq4226A9Pyh42/qjzE+Q+S/QmM6DOejLgZ0T4Taj+bG+8knUMU8Zs/o/XyiUwOfhPSeUkKwDI/Ie27y4YeYzcZtUagJVqVBjLCNj/L8TyHevFFdRZpHzQMpRD0kNhP8j3YEpInhBm7wux6tN9tU0jYZRyExbl3Njuh19UzkoNz8H0o6wOfCM67RJBRc2W8LXEA==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA6PR04MB11950.eurprd04.prod.outlook.com (2603:10a6:102:516::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 13:40:01 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 13:40:01 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH v10 4/4] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Thread-Topic: [PATCH v10 4/4] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Thread-Index: AQHc/l3o0FWITjgCnUyfmvLOHoA8obZCwJPA
Date: Wed, 17 Jun 2026 13:40:01 +0000
Message-ID:
 <AS8PR04MB90808C0ED6BA4969F2432AFDFAE42@AS8PR04MB9080.eurprd04.prod.outlook.com>
References:
 <GV1PR04MB115139D90CF3E5A8AE2BED6FFBBE42@GV1PR04MB11513.eurprd04.prod.outlook.com>
In-Reply-To:
 <GV1PR04MB115139D90CF3E5A8AE2BED6FFBBE42@GV1PR04MB11513.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PA6PR04MB11950:EE_
x-ms-office365-filtering-correlation-id: cb8a3cce-a5d3-4a1c-a581-08decc75ee22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|23010399003|376014|38070700021|22082099003|18002099003|6133799003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 NEWH2s54cbZBuo1zPwF+U+cqb/wwtwPnYNnrU7sXUWa8fQmj7wUFOpFHx6n0toNHDEWo9mccgI95ulW0qpbXuYXyuVagUf95awk6iqrp7C0fsbYM1wq+6JDKYkGTZ/LFJoEM2xK0W8KVb3/D0d6J0azBUksp4nwM4hsIyUzoj2XpIi3rh25UOscNXG/nlAYM3KmOxCzAqLN0Cg6iiAxusPxio04rO5xNc0EljLMWPRvMPNZ9/AnLntA433TZEvTfRZVP6zq5hdmt8/Wd0XHuYYowifd3N3M2dP4LLzzVSSosq9rj/EbuUn+yaakL2iSWa6BAL+B4bdZFuRRslAD00OSQ1q/pQtQUBMkAO961ch9pUK3XGhOr7KHMY6QFM0UV24hXd2xvHazTqOAOoBEPawOyVDB2LrfuoLLIVyVJs45F0Y/wX9c8Ivt3lW4LokvT638kHiOZZElZ4TaF3iq0IySUtVX1uBHmvDmaFnB5NbcnAbrKQIlx6+m7HZ5kqLfu7ht9P1iA1eM39pt+hrhet4GvL+LCN9fn2rD+wlklvabWfXWMyuZr5chBWmV+31i1Nnn4HfNrs+DKBn7GJpBh/Pvnv5xt6cBmcqLztrHKu/796D06eF90vQin3m5FoswXw0lIcKDIU4Wd/QWqEo/JGW0lcGD4pfagXOEYF4GC3paqvgpUdy3M1n8xvnn9lCJzkJvU4a3hzMhYSOFS7rdfVVMgLBMSLA7+lr8ALpw7S1+Ncqk8U04xDHdI9XD2ECJI
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(23010399003)(376014)(38070700021)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ti3S1ytLnX2cIWvZxxZPc+3obKT5bV/sj8fUumKVfwwd9AEPrdn4plu3rxiz?=
 =?us-ascii?Q?3PT/adVfX7FDdQ6zhW0ARWvsOtT9ERkjndZY0Uv5cC1DX9L1YJ7J5qYx3gaP?=
 =?us-ascii?Q?y+6D3SZDKomo7XoljySQi1EgMhGBJfmWi4YrdvY8rLYVmiKBFk/IPJmRjrmE?=
 =?us-ascii?Q?vTg+mcgW2bib04n7d8zoFaP4PYQCNUKIcIR/b5K1j8Vdt1ic452pi9kMNqLV?=
 =?us-ascii?Q?0ZShQOEefsq7hbqfv564suDhVWCmUtvHGvpESvrPJv2umHwjWTM4QZpvSRIf?=
 =?us-ascii?Q?udLI4eDm+P4Fo4hNO2+Xk/8j9JZiwhh6A2MJSf5dJUgHjB+Yu3DKhZJrK231?=
 =?us-ascii?Q?/bNpiROKGYVfi0wXqNBfBF3oq05HzQ9AFX0RSBR3zXfvadSQD9clx/8xMss5?=
 =?us-ascii?Q?iuMc9D0X9yzVg8fk8tTn3BE+9LaaAl4aI9+BSiQiiUF0dpcCxEsi5wI2i1PV?=
 =?us-ascii?Q?tJvxrK00sCCwWRfmLrNNYjFik3omCZ4MISjYAJ8yWGP8V2vyQMTp7nEbJ/ZN?=
 =?us-ascii?Q?gnTAFOjMPpctMHV6p3Tyz5gx6GoSrGvnbLMORerZ1L3SmjN+Ivcm6OUhjdID?=
 =?us-ascii?Q?O3cTSkQ3VxGa/NllhlvauZyHnfvz76ur9M//8/eXltleK1GyHlxIZQDO5FbJ?=
 =?us-ascii?Q?sEHy9RjKdz9fuJ18iv1tMqxaVC9go28i+ZNqHF/ufv5g3JLPsr37K+LYpCLj?=
 =?us-ascii?Q?obiWzBFd7k3vlBGVIW7YHrNnCwn0UZNbkZ7nxd4viyK1w+VXuSk8kOxgLTPT?=
 =?us-ascii?Q?V2gpr7FHdhcOU6vHTo/GqxjReJwEhiTeUwGEtmHkFvurnFpGRTgil4/z2KpI?=
 =?us-ascii?Q?oPcolG+Vdw5iAVKV73tXweijw7ZLhS9Q+E2QokVdYrCzyPO4Yk3mRT+X1kSr?=
 =?us-ascii?Q?HpL0c/g7z8JNEp0RMdWbXyOpLiTFy7uDkrU0f+bBCCZi+y1rrrRvVJIaURTt?=
 =?us-ascii?Q?S7vfp8Ka9H1iufSsUftN14DUORGNg3k+YRQ2XAJ0JRiTTrENSQpCzhK4YC4Y?=
 =?us-ascii?Q?Q+qILYNekryrBFumqG5La2LLDcmthVZ99Ec0DoBOG+410k7f5JAKXiTD1hkE?=
 =?us-ascii?Q?AId8JVFje2CM4zSrVWsupAASqSmWGfUN18Z75GfY7kQ7CHsAKtNLscY92uU2?=
 =?us-ascii?Q?GYD8VCDQ7WFcsWY1mk0k32pMUyz6tEJuZW1q4hktr4ScffBu0JVI2p9MPrWr?=
 =?us-ascii?Q?26O8CWUzF7WEMCBDFsEQtzOgF+QvStvXwHN7Fq8ld8D08SzAqZ2aJBHQBF9Q?=
 =?us-ascii?Q?jDdmhx9aBkXlIYUlDtn1o3LgEslAvxQe26My2hJ8UYzVhI++n27vBCZF9+Jm?=
 =?us-ascii?Q?8kuaqcz7c6djzbFCHJ+ujV6SV5m9y2YlmWQDEYCv/rriiIlCvpCr21uXhq9D?=
 =?us-ascii?Q?z7FJEcvyLB3mayg1GF/8bJBo1D1XqXcEKIERYUnKhcGoMOsR6//zOLeg5gcO?=
 =?us-ascii?Q?WAQvz91X/371f3hnJJNfjV1HUDrkqRXGlk0JUZwkAEJe8I71m47jLqoq79aK?=
 =?us-ascii?Q?v60aKnfwDJfC1+nzds97ctToyuydTpyepJGKiLj+1MK/eZ1VEu12M/C4W/h1?=
 =?us-ascii?Q?fLX3248WHv4L0VaACiCkJMLh0QvT0avswn10NbxVlp4vjAeH4h1SQkWMvAUw?=
 =?us-ascii?Q?6rI/rlWO0X5R7NxU1gyMF4B7dkZ5EhmVENhWlFNHrz04aSV0wmDHn0VLRzVH?=
 =?us-ascii?Q?Z4F53ig3gb9Ehv258a/LxXhTAm+9FtiwqVBtezffDIskhcxE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8a3cce-a5d3-4a1c-a581-08decc75ee22
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 13:40:01.1502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GMgKPm5xLDEoGBjSkwpmsjTB2UpGtVyK9FaXFw1iflEVFn+1zIuX4RokPCx4qQYp647ulRgDhFLAx+EyN6uQ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11950
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65122-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:guoniu.zhou@oss.nxp.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[guoniu.zhou@nxp.com,linux-media@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,nxp.com:dkim,nxp.com:email,nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C97169A3A9

Please disregard my previous review email sent at 21:36 today.

I apologize for the noise - this was sent by mistake due to an automated ag=
ent
misconfiguration during my testing of review tools. The review was not inte=
nded
for the mailing list.

Sorry for any confusion caused.

Best Regards
G.N Zhou


> -----Original Message-----
> From: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> Sent: Wednesday, June 17, 2026 9:37 PM
> To: G.N. Zhou <guoniu.zhou@nxp.com>
> Cc: linux-media@vger.kernel.org
> Subject: Re: [PATCH v10 4/4] media: nxp: Add i.MX95 CSI pixel formatter v=
4l2
> driver
>=20
> commit b87cd0a71bef669634083e804de2130b52b0d007
> Author: Guoniu Zhou <guoniu.zhou@nxp.com>
>=20
> media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver
>=20
> The CSI pixel formatter is a module found on i.MX95 used to reformat pack=
et
> info, pixel and non-pixel data from CSI-2 host controller to match Pixel =
Link(PL)
> definition.
>=20
> Link: https://lore.kernel.org/linux-media/20260617-csi_formatter-v10-4-
> xxxxx@oss.nxp.com/
>=20
> > diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c
> > b/drivers/media/platform/nxp/imx95-csi-formatter.c
> > new file mode 100644
> > index 000000000000..xxxxx
> > --- /dev/null
> > +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c
>=20
> [ ... ]
>=20
> > +static int csi_formatter_start_stream(struct csi_formatter *formatter,
> > +				      struct v4l2_subdev_state *state,
> > +				      u64 stream_mask)
> > +{
> > +	const struct csi_formatter_pix_format *pix_fmt;
> > +	struct v4l2_mbus_framefmt *fmt;
> > +	struct v4l2_mbus_frame_desc fd =3D {};
> > +	u64 configured_streams =3D 0;
> > +	unsigned int i;
> > +	u32 val;
> > +	int vc;
> > +	int ret;
> > +
> > +	ret =3D v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
> > +			       formatter->remote_pad, &fd);
> > +	if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
> > +		dev_err(formatter->dev, "Failed to get frame desc: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	for (i =3D 0; i < CSI_FORMATTER_VC_NUM; ++i) {
> > +		if (!(stream_mask & BIT(i)))
> > +			continue;
> > +
> > +		fmt =3D v4l2_subdev_state_get_format(state,
> > +						   CSI_FORMATTER_PAD_SINK,
> i);
> > +
> > +		pix_fmt =3D csi_formatter_find_format(fmt->code);
> > +
> > +		val =3D BIT(csi_formatter_get_index_by_dt(pix_fmt->data_type));
> > +
> > +		if (ret =3D=3D -ENOIOCTLCMD) {
> > +			/*
> > +			 * Source doesn't implement get_frame_desc, use
> > +			 * default VC 0
> > +			 */
> > +			vc =3D 0;
> > +		} else {
> > +			vc =3D csi_formatter_get_vc(formatter, &fd, i);
> > +			if (vc < 0) {
> > +				ret =3D vc;
> > +				goto err_cleanup;
> > +			}
> > +		}
> > +
> > +		csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc),
> val);
> > +		configured_streams |=3D BIT(i);
> > +	}
>=20
> When the upstream subdevice doesn't implement get_frame_desc (returning -
> ENOIOCTLCMD), all active streams are configured to use virtual channel 0.
> If stream_mask has multiple bits set (for example, streams 0, 1, and 2 ar=
e all
> active), each iteration writes to the same register:
>=20
>     Stream 0: csi_formatter_write(CSI_VC_PIXEL_DATA_TYPE(0),
> val_for_stream_0)
>     Stream 1: csi_formatter_write(CSI_VC_PIXEL_DATA_TYPE(0),
> val_for_stream_1)
>     Stream 2: csi_formatter_write(CSI_VC_PIXEL_DATA_TYPE(0),
> val_for_stream_2)
>=20
> Does this cause the later streams to overwrite the configuration of earli=
er
> streams? Only the last stream's configuration would remain in the registe=
r,
> while the earlier streams would have incorrect or missing configuration.
>=20
> The driver advertises multi-stream support via V4L2_SUBDEV_FL_STREAMS,
> and the loop processes all bits in stream_mask, but the fallback path ass=
umes
> only one stream will be active.
>=20
> Should the fallback map stream index to virtual channel instead?
>=20
>     if (ret =3D=3D -ENOIOCTLCMD) {
>         /* Map stream index to VC when frame desc unavailable */
>         vc =3D i;
>     } else {
>         ...
>     }
>=20
> This would prevent configuration collisions when multiple streams are ena=
bled
> with legacy sensors.


