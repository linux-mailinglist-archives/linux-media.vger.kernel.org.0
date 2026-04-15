Return-Path: <linux-media+bounces-58797-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMklGkRU32l1RwAAu9opvQ
	(envelope-from <linux-media+bounces-58797-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:03:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3854402484
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B04FE30FBAAA
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 08:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725F23D5662;
	Wed, 15 Apr 2026 08:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="davqL1E/"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021120.outbound.protection.outlook.com [40.107.51.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E693BF66C;
	Wed, 15 Apr 2026 08:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243437; cv=fail; b=rtXMt9qCOanE8zHKM0E9E0MwYwX2kALKBsrEb1rXbGBjbPwywZXWDghq0sZLidhnNR2HRh6OzjnVk8wUCFCXtHEb7F8HHIpxhFI5ch7QCAArEoiwPMJs+WvQgi8UB5ZXLQiiSXyXj+uQ7AkEDot3EN8iWFpaqr/p66N7e0JJuks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243437; c=relaxed/simple;
	bh=INmJR3VHhH1tsKIbfHt5lt1zSaNmkJf5gsXbwmkc1fM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Bz4oY2RLRtiViKRuRPimYVQ/R0j5CiKyfJoIWmIAxSIwduds8BgPk/DUwpVtBm9Jaido+Wp6XYCUb95R0nPjL6/H7DBq3AF021ycLVsTOmy8nGRMXPL9AnrW1DurLV0XoNE9SRPP7tjbmbUC3tM+qED3BAtTt7Cek2CvvK1JTbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=davqL1E/; arc=fail smtp.client-ip=40.107.51.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKWBq6VpE+EbJucpFWpRrqu+Vi40PUP18QWehAIv+3kyp2kPX0XRLrQ1tZOL9hfJarYdOG1ETc3JzcFhQpU7qRZL+1fDNczsTF/XDD3kd4WPXxULuwzUHsk0Ax5gObqaO6f4MCczRY3/HhrLFUqMYl8eD/pUbjwQWfPS9bNrJ6+BIAn5ave7u+pcu08Bd8iKG8y64Q1qju8XVW84hmVdWBqQuw7yWBzSFvBfUgfoC2rxUa/sUKgdjZJX4T17FUP973Ps9xrZCsTN/zzhz3hcuKBUoXehQIG6wXa5gGx6ulgJB784czd4fp4jEIARHfbYuD5BYs0fAHFuEIEp9W+hNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XCwBgMGKhh+e3cOqycZLB0P1u3hMPk7924e3i01cdM=;
 b=xKmbtTeE+4Urp0j3xS4M9p4FAeSJ/7S4CtgXkDvoEQEsm9txvyyGQofITv0dtL6V63mKeOB47Y8A8bWy5bxL2KhzMvHLLvfVCHCBSZdNBUzzcMbEy2y1XSshvvF0FocSlMvSXDywKrmXMUi+4TGb54Jt5ZotfmkxWWNfy9CbYSNmVUR7trWVuPy4yuhBPVTxZ3gAAsxQUqPQXIHnH5QV5OxSfdEk0gyzRh3UrB31rwYbYtdUD0BlW6gn4b2/LF3sbV8bEHfdo5ft7w57B+8KaY98NimWsEAJIlqHhckMYYnHwWJHk4OfBL0bjFiAOB63kkxgSJVawrLSX3zezeqeWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XCwBgMGKhh+e3cOqycZLB0P1u3hMPk7924e3i01cdM=;
 b=davqL1E/cmkWQw2SAiNJl2vuAUTz8EYiMaiMGIJvuoMnpPmERDQv/9PWHagtMU//zLdLCfHt/jIZO5MiT5rTOl+rbIOXeLGaFZihEtSkvsC3JSkBoUYX/dRVieSnrBtXPzVrduAaLsndE6y7Fd4Ghc20xGEB5lwCMLWrVTQPaxKkuZM1R7QjukglC9YRhh1443v8vFjzImyhb8b26xSrVbaJlJqDYvrZuYk9nRXlOSPAyD/+1oFP4cHM5GdvJYeGY/GRKTU3+ZSqEczzQVxkAODAbUD1f2Yew8RZTZ5StmSnIbe13YaDH99MDeFVmSNoVeqNEkFuoekpGtbwqY1dxA==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by MAZP287MB0687.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:109::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 08:57:11 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%3]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 08:57:11 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Tarang
 Raval <tarang.raval@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait
	<mehdi.djait@linux.intel.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, Jingjing Xiong <jingjing.xiong@intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Svyatoslav Ryhel
	<clamor95@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add os02g10 sensor
Thread-Topic: [PATCH v2 1/2] dt-bindings: media: i2c: Add os02g10 sensor
Thread-Index: AQHcy+vO7zbNzbVU/Uaw9ny2779de7XfwlyAgAARPgs=
Date: Wed, 15 Apr 2026 08:57:11 +0000
Message-ID:
 <MA0P287MB21785F11F1B93EEE827F767088222@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260414084952.217215-1-elgin.perumbilly@siliconsignals.io>
 <20260414084952.217215-2-elgin.perumbilly@siliconsignals.io>
 <20260415-authentic-elastic-auk-eed0e6@quoll>
In-Reply-To: <20260415-authentic-elastic-auk-eed0e6@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|MAZP287MB0687:EE_
x-ms-office365-filtering-correlation-id: a3b5f098-29da-470c-46ec-08de9accfb6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 yQrRU0rcd5cfLQ7b7PmXBivYE+xarSPNnmuShBDbz+ZGGs1U5Id+zfxuAt3OTpWx3m0sQogxAI1BBhMyLZB4Q2hwUsetQvH9qKnOpUaEnEYOODoK8KxRyvmINmEw4CGfPlrjKkcwy2pA3hSbLcR0Ft2/YKAd4ybej6XbTwc6X41WFur9YJkw4sev8vU8D0L5hZRlQjrwzBBsSlLIyzhBWdvrFxjiNQSYUwTaCTXEqwuiElZ5IqCLAIyUWTVayZXI5kA+TEeSn/1kJ3Pcm8FRuweYu0W3UhZ6bdAVdvEN/IRGh3i0idZvU+kE2fuOS1DyacTlMzxueRHkPXzboozs/aAzL58HBOhVb+fuk5ZKG1ih88hs20418qNTasO0JdVe4GQDyxNmtjWfw+wuhZTBCSbpoiMyuXe6vuAHwKvYvgcj1eZexGWIKfB2XFIIlmwt8Z3KmzDsdFasMCoVS1a7/fyhOfQ9A3lPe5ji6mej291XoKxsOn46L1sj1hILPbW/q8ru1LOTwDGQU8uMepT9HLyZcStheic3FkdQ/hVSW6SwNEHfyZ+cCu/xvwzUTBJVOB/UDe75YGt8c5GWXqeV4p7B+oFWP+cTd/goT1NkIXMDCj8FkLRscaZOpXIiMLk2SO3qDpxAd/xgxOJS9m/PGSDRHezabPG3DqEktvYnZIiVAol5zm0jm9VWI438lFn4D1DhJuZb0lFH9JbXTyxdQGaRqr8zjXTSG07jnB3qsuPXnpPOl+nMBptteLMWFgVZQVx6HgbjnKjrcVzkphaWvZEAV+DmlQQQQcaoRZMNMQQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?a+ENEfeOZaY91+zbuYH23Sj6eDp+V+L6+GcDCO2BEcq9dCmEmF10MURR/+?=
 =?iso-8859-1?Q?zVJb+PU4FGNlxzbZkVSdhxU7shJyBHpibIIZYlM74mBd92rRzx8V8k4Gxm?=
 =?iso-8859-1?Q?j62x/gTdMm3WFAEBHO88NH4zk6fg6z4fYDDjyshvCTRcxmaIMWY8ZATBnS?=
 =?iso-8859-1?Q?uGziTZw1ThFj0HQKGF35d+HesQoznJnX8w219lfTdflGYdzk4yyp3AXPDo?=
 =?iso-8859-1?Q?AHDgsE7xSouH89ap65vECHCLoOGkIQPr8p1HE0mHgLk4khfSUIZf/Jqa1Q?=
 =?iso-8859-1?Q?b+9S8pYNT/2uaae+nSb8NnxbpGB9lzWuuoOLCCcjB5bRlQr75E/x78ZAyC?=
 =?iso-8859-1?Q?eE21let8P/1cuOP/TLRnq7d+8whkgLXTs/FO/MZMD5fmFQ47pPRt22Qrym?=
 =?iso-8859-1?Q?3z/RSfSlsLbn09QUbl/otdGU6STjpawNLBvkLXOx9mroR1G+cSUpPp/YpV?=
 =?iso-8859-1?Q?dmk0Jz/2kI07tOJ17qhAqfLH15KtMwDsvcVM6zLBU5CKKSf04htF2schAg?=
 =?iso-8859-1?Q?tiNlh1KZ3YyaSBJVPEMAtw7YaBW/6YICiALiSVyQ+e3qcvqkozRF3IGeWn?=
 =?iso-8859-1?Q?3WqZS6eDNR/5jDx1K8Tr9jdJuzOqOtPgLLnMmQeVJCKs//X8TytcwToFdB?=
 =?iso-8859-1?Q?OFcCALFDpRLQy0a7A1Bsd3kwz/ZM6gdYbkvswkurEhs2l/LCW32ku5sGfQ?=
 =?iso-8859-1?Q?WdjxXEZmGsdgFdFziyEfz6YpWhdi/oJqU0CehmBXbDDQ6wrris1LiyTttd?=
 =?iso-8859-1?Q?Tdy3lOSkdHMjXIXVxasfn5CeX7Gv7TgpY57K11vk3mmDgN5XxPqgtd18w1?=
 =?iso-8859-1?Q?A4NzmyGGDxZN7ubysjfLycCi4cJBDRC0MGyHa3RPKymC2Fz9MPi32V8H90?=
 =?iso-8859-1?Q?AYV0EOtbiPW+Rn/4PO3SCTLKIRn9Vp8+lVe1p2iNTGNLaFq9TCEPjh57Jo?=
 =?iso-8859-1?Q?bM5vSucOoKW9mFPYJgnKSPS29XaVga9r4UcFgfVsd5WxHsLJ2iWefjvw/J?=
 =?iso-8859-1?Q?NleGYldpJCCyged+FaKA4BX6sc+n7909aBXj6PoDEn5D07YA5OcAMfTLtP?=
 =?iso-8859-1?Q?4yRLnkeukv8WoL5zwuMvTjIjpaoiR3JGdRNTP3j4BMFi46/a+SOJBgqanz?=
 =?iso-8859-1?Q?MkmMItYC2GeAwXr39yegBCeR/Hk/E+51zy+KXa4kXy8KVHrNITK9quGK+i?=
 =?iso-8859-1?Q?bb16YuJdqv/+muz3qj9eE4ug0al8J8n97jnV2LddGfza8FeN3s29Nyq2f/?=
 =?iso-8859-1?Q?DrZtlL3zcJW1yszGd3wo3lhGYqzj5G0UhIY7fPi22agNe8DK0w/I7iLt+F?=
 =?iso-8859-1?Q?lL3CNgZMvCapAwti9q6oNSZabPpIi34kJLAZrosuOVNVhg7sx8f7Fh+rJJ?=
 =?iso-8859-1?Q?/945ezqoMpgQQaitCkzbVJLT2qR19glOLT5hziEFkx+WsJZy8F+fAzLbvn?=
 =?iso-8859-1?Q?5dWbS0DVEUWJ+7K69VkdwdwWhnTMMhlZ+QTLE1RyeedQ4bqDttts4xc/vM?=
 =?iso-8859-1?Q?06AV45lPSZEIjshKqjGFYC9ZlbWKAlKoRqbebtoRUJEL5ArbJzvq6dayCx?=
 =?iso-8859-1?Q?EHfm/8+L59YqbArAs+nfqmdWtuRpI6pco8TiJsO435BbrLx71D961UmGl+?=
 =?iso-8859-1?Q?SVUOVUSB90bZweVBF7yiNoiuhdf0UxUVhvupYorLLifN2lfPXHLa9uTKm1?=
 =?iso-8859-1?Q?ey/xdwiEbz8qdf74DCOXnaypOv/4cxAV5ajtBba9zustdCgn+zj5Zs4rJ4?=
 =?iso-8859-1?Q?FDVsuvg3ztusmX+RzyCP7mlrwJWBsOK6JTxYVtzi5t1nYMNiccUCS7cAt/?=
 =?iso-8859-1?Q?EkbWpoEyhqIJG+98vQIKzxulw0fJ0e8=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b5f098-29da-470c-46ec-08de9accfb6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 08:57:11.4989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: At0dDJ52XCHLHI60JyQ6kY8XazrSXW6gYYgmQMo9yJeWcqmDx8np0OSdSph99yyASANiEYg6TQ0Lyk8cX9gZ5Fu06IRw+dvGoMusJPGXTbeKh6EthL2JkbeQfXs3X9kF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0687
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[siliconsignals.io:server fail,MA0P287MB2178.INDP287.PROD.OUTLOOK.COM:server fail,sea.lore.kernel.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58797-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,ideasonboard.com,foss.st.com,gmail.com,intel.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D3854402484
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,                                                              =
     =0A=
                                                                           =
     =0A=
>On Tue, Apr 14, 2026 at 02:19:44PM +0530, Elgin Perumbilly wrote:         =
     =0A=
>> Add bindings for Omnivision OS02G10 sensor.                             =
     =0A=
>>                                                                         =
     =0A=
>> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>    =
     =0A=
>> ---                                                                     =
     =0A=
>>  .../bindings/media/i2c/ovti,os02g10.yaml      | 96 +++++++++++++++++++ =
     =0A=
>>  MAINTAINERS                                   |  7 ++                  =
     =0A=
>>  2 files changed, 103 insertions(+)                                     =
     =0A=
>                                                                          =
     =0A=
>Your changelog in cover letters says nothing changed here, so same        =
     =0A=
>comments as v1. Please go back to v1 and read the feedback carefully.     =
     =0A=
>                                                                          =
     =0A=
>Best regards,                                                             =
     =0A=
>Krzysztof                                                                 =
     =0A=
                                                                           =
     =0A=
I made the changes but forgot to include them in the changelog.            =
     =0A=
                                                                           =
     =0A=
Changes made:                                                              =
     =0A=
                                                                           =
     =0A=
- Corrected $id to ovti,os02g10.yaml                                       =
     =0A=
- Fixed data-lanes property structure to use proper items format           =
     =0A=
                                                                           =
     =0A=
Best regards,                                                              =
     =0A=
Elgin  =

