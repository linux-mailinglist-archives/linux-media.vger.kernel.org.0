Return-Path: <linux-media+bounces-26048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 966DFA32296
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 10:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A0931674C3
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 09:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78465209F4C;
	Wed, 12 Feb 2025 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="MMzTKt0K"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2127.outbound.protection.outlook.com [40.107.255.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9D5207667;
	Wed, 12 Feb 2025 09:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739353189; cv=fail; b=jvuBlG5t5UYDsFnDpzlsLddGBcG/38mZJv68Eno07GezMQ6RS2C3AyJcZIs4ZfVaZg2ZDuicuZkWiP9a9mXWNZ1SEAOy9ORQ/1mrFyeDKkTV+58gyv/tRdGg0vDxpo3R6Z+AV/6tBsaXYlViR7Uh/rh6sm/1IoF6WuCRE2rzesk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739353189; c=relaxed/simple;
	bh=n7X+JA69UADPE6bHPyuGwG3QWQcNrkngAN210VEzj6g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Df12fI3QkW1mStbjBlCJ4xLU0zDF8xip7Ay9Q1Cq292IJIXo0/gdnyrwNMrLDB4rUkVgcmpcBgdDHxV7xbcjemCNzn1kR/ostTZChdMVb+v+6fiEcyJua+ZxXYgrEDfu1BXqXTpWZ8qe6lqFwLtFetmJcwmuJBJft9+c75HzDdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=MMzTKt0K; arc=fail smtp.client-ip=40.107.255.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKfJugJP7V+5dcp1X5shv62MfEjpffxjl1D1rxp6Ud8Udc7QFlxOb84bN/e6eDLsRO5wLsI07IOY8MZ3vFgF0ecJFzcphvoiMTStYfTBln9Mg60GEZsGKQ3EIWlFsFm5hetyuZAfj5+Q+Q/NvOxgAmvMnU05YmNoQz4JhqlENDXIEHShK9TAel32Ov3EFF3U3LLrERrKhO8D62i7KZ92W6JyV+Q9wOMl1RB7XZqnMEBoY7wH7tNDAvws9Z55q452yMfeRZ8OWdzl9nUGYIvpUlltSQr8fgryn+F6EcUnND8CkrXsQvRUerKHaP5T3BQkF2CJAP76E/KmPlsDBSv+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvcLvnPnaHp+ePPTnXaudS4BGFkuiNZtKHxiJrXHwUY=;
 b=x7aOPuPXuTiQG3HtK7FAbPDdwohM8BbO0fb8V8INEkiL7F6L5Cld0gU1+g9q6ItV9+5iOYMQ2bxJaZlHvMAHEpjJsRSlKS5VMdIy9G4/0UkJxK7ivPKFXRRBEPLh/VfjXQ0S0NCC+/12+YQQUieY50toBeu/vEc//AQbsPW52GVaQ1Khr52qVBqT+TVzG4WcnJIWa0fUvHN5qOey9t4hgLTtpZJCcnqgYNJzpn8oBl8qPLeFFecUlbtDr7ZyCLNPT52JLXkaUiLx2eIAvyr2Qyz5xPu47aiZvm1X7EA+DR9oBEV+OGiZJcM+xupjat14ab64ar52ygnc0SSV32lcLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvcLvnPnaHp+ePPTnXaudS4BGFkuiNZtKHxiJrXHwUY=;
 b=MMzTKt0Krp7TZ4k9pZHA3PYzp30/R5dqoEUYhTmuUkLqV1wGmeVOBjab5RkRxxTJlxUIZdYtCx/ZR7q6OtitIYFss6hY/NlxcXAFLzXkOPZIfaJOLqgbD0/5nGmNg4uqjl/fiwtuBFS9/dcwcx5FIUFmjrMBXoCfP7CnKv7YT8V3fwv8x6HVI68iAzsSGRQ1nq8obdKvlBNdUkJYat63jGb/A2FvNzqa4RRdj5Lzwr85pZIwo+6Owzy8eZD6+HbwhacOP8SSaefy4G6jEbfsnzQU+2Al3bQqUzm64o0th4epLfNdJkyyUtmOIHCof5RRXfuuGiwV3FCO39OVYUq4nA==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by SEYPR06MB7042.apcprd06.prod.outlook.com (2603:1096:101:1dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.9; Wed, 12 Feb
 2025 09:39:40 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b%7]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 09:39:39 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "eajames@linux.ibm.com" <eajames@linux.ibm.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au"
	<andrew@aj.id.au>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Thread-Topic: [PATCH v5] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Thread-Index: AQHbfRmWNbhe+4I0Ck+9wuhvkmpvF7NDWnCQ
Date: Wed, 12 Feb 2025 09:39:39 +0000
Message-ID:
 <TYZPR06MB6568B9836429DB4414FC37A5F1FC2@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20250212014711.2181865-1-jammy_huang@aspeedtech.com>
 <20250212-copper-tortoise-from-hyperborea-8dddcc@krzk-bin>
In-Reply-To: <20250212-copper-tortoise-from-hyperborea-8dddcc@krzk-bin>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|SEYPR06MB7042:EE_
x-ms-office365-filtering-correlation-id: 53d3c711-5864-4d0f-b530-08dd4b492bd6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?KsKMQY11mrz0zSP6a63DqM0TAGEXlh30XeNllXjWSIGPr/VhXc8n55Neplr3?=
 =?us-ascii?Q?IChcjow8aIr1KkixpUh1yRNsCFj63e7f+3wc3/2cKxyu41LqrQpLIue1MbTC?=
 =?us-ascii?Q?nceyWt9G9zHkxZ2D9psuqYvAFmHp2OgPD/7BfHxcuMAkADFoDYey7xjVvB38?=
 =?us-ascii?Q?cXyynHnPTJCMGpWScsWficiOF6AVN7vcG97RX/rIpOn/GzoP4AuAPEDabGQM?=
 =?us-ascii?Q?2KqwFIWr25Bfu8TcKW4BkPN6SGOkapApl4EXexai35Z9YPGl4LCtezKAU84y?=
 =?us-ascii?Q?v0FgGLw48lHRsQl8jZePx/WoAhKx/iBdrE4CUkKiocF4Ywk1vKOfZ3Vzz7S0?=
 =?us-ascii?Q?czDY6pMAjadjyktkLlBsXbdfIc8nMjUctnazb1JRO5yINjFvkoNr9Eq1nwAB?=
 =?us-ascii?Q?PpKrR5RBSHS22Kal82myDeVuJ5So5q7eP2AOeJzrXvJwtNFRRCSka1Y39uHe?=
 =?us-ascii?Q?OFXtAyOzNHI1hb8lnb9ix1eWn/OK23uJRUfAXfwNiD3ezi9gPhq/hkhDtooZ?=
 =?us-ascii?Q?wZH+JAXYX67NlL5EVsxcX49R0WkKkPohIf+F81yvdetxH1Iyc0VGiIlqAD5s?=
 =?us-ascii?Q?tXv/5TazCxbo0pQ6MSXCDrnTMmC/rlgdew4j4ONZce48YRX22mTDCYJKxMLM?=
 =?us-ascii?Q?CxNA4Xbssz4PBakJ7lndwpwI36XYljuNmN1u0OR5MSlBsgJgydmyflTYt2Fh?=
 =?us-ascii?Q?EQYDLxikbGrLs9gdncXJJsFv2Ski28LNvSBFHnUWv6AFVaLlSK+STgSbcnuR?=
 =?us-ascii?Q?piIORuN+nC2IrOzqcUEy3niq9NHRrE5TdJD4q2iV1Y32hrnCFvyg3WKOKmTx?=
 =?us-ascii?Q?KenvevgVD7SXRirWIbB6CK2y9bXkK82gUmpAwOwskfIjyFLbwif4r+tkZ8nV?=
 =?us-ascii?Q?f48gYBnUTbrMa/FHQO9Tw/ZX5Gp9XSsa8wBJFMhBUUjcsqpQT1PzPGPNPIC0?=
 =?us-ascii?Q?xVZ6oS/BB2LX3kDdzolICnueC9n1EC4HV2pEIqxCBeGCXEuoWqbifUjF8eoR?=
 =?us-ascii?Q?RvNjUwiErjWmsusLBlxVao9m7mkofQ/z037MbKpK1BxXROruZ2GXTO9MxfN+?=
 =?us-ascii?Q?IxkMq3RFGOZknURlO5S7lLlS85AHhPYSIPPq7A2l8lsRRIWeXeFb11VlkdRv?=
 =?us-ascii?Q?enXC+ZJYkFHfzGN5IUKeONeO7GbTizRmHnUHpWbrMzjNIzVSs/9T1SvLUtc6?=
 =?us-ascii?Q?d9S8qbAMyhsATCwmbvNiVkUfVnRb//XIid/jqF9VBiKmep/Fcc9ARvZPDUf0?=
 =?us-ascii?Q?Zu6pI8/mFEGaLgrdU0K3paTZltu9v1F0sHttDEhNGHTUgWgv5P6h1JOjUwhG?=
 =?us-ascii?Q?hwK4erPxzsqFqiAdAWbOh6LAlryQtSh7/xbLjR//41d/nwtDU+0anXOgHAOG?=
 =?us-ascii?Q?T+zKol/UEpEE6giF4m6G99sAb6E+aKs3651CHvhwccT/fCt3dWEhEmlvLAZC?=
 =?us-ascii?Q?vVzmkpCwWb50y1NR4MAmTOcbHIzdUezf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6568.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3SWtXQZv6/e+EEpxKvPGOV+NEBEdeVXVyHyzE1j6xRU9eEsdP2ecf76OdODy?=
 =?us-ascii?Q?qCIPLth2vr5PPKN56bzBLjlFwi7/KWOeFEEsv5gfeoVBxZweVACJHptVxN7f?=
 =?us-ascii?Q?8aWiiiz8nXqYpPRLhHSRDMU7d1b5OFjRwXBbmHluCmxrg3YghzVdzsccXcMT?=
 =?us-ascii?Q?aeLlKfJDEImUDdpIbT8E1imQM7oa2/DHDFQizJegqOt1Yv2waQUbRo5+w20s?=
 =?us-ascii?Q?e4qBuGLs0XJsWIuU4KI5vQf7EhxPgrT8X0hl7P79TKrs+/bpQ43W7BxlcEuf?=
 =?us-ascii?Q?4KtrOn0AuMtaPA8rCvj2lvTocCV3L2rOhKZpfTTEY02tp6irbgPSc3NbaN3m?=
 =?us-ascii?Q?Arn9QKHX7ef5cNWy+Bt8WBWqsqMZXj99n/kJpNRYWIBDnEmsVmDTHxUA4r9e?=
 =?us-ascii?Q?f/KIMK6uujDb7a2eZoZ8dQ8v+drL69ixoPu3guwBx5TL74Mq969tsZMWkw6h?=
 =?us-ascii?Q?e+wVJwA4EXwsMz8+ep7jsJupHsHYqyK/oT5XGF3NQNyoNlO52fxvhazvluf5?=
 =?us-ascii?Q?qfTKdN7P0nMShBJnikz8/Vr6BYSXlnSXOfqHXaZgPaWq2pjibdsgQbe/geDe?=
 =?us-ascii?Q?BxTJCys7OdV6hpZk4BYyyU6/BvLJkKMbpzDD7k9ad6lSo8y+DnFVqkN67rD2?=
 =?us-ascii?Q?JlU1aI0zxJDEYWG1q8FRwCsRRPwkri46iqbhy959wgpXECAcL6ISVdst/AaD?=
 =?us-ascii?Q?oSbDE826VDE5L0cJBpbNQmduMkIBTxBgNBXn46FELuEZQfcfl9OOMP09vOCJ?=
 =?us-ascii?Q?OnGCb6xTgulOxiwd+LlXu6RVhSwOdgEOyPsy54Tk81A3VGgqeTODipvr1xu0?=
 =?us-ascii?Q?GbBXpMiFRp+OELANvJm/RxBBVztgpp6lpdIZm4O0WStxTucQlhW0d11Wdnn6?=
 =?us-ascii?Q?vdAZ3yK53Bt8ZJZed9xHctf3UOcfCORMSNaak4AclSLlsac2HuTQ0PB3VD7K?=
 =?us-ascii?Q?dOl5D4xEQ6/AiNNlWLE+4EJdLFkaBb106O3qkttxXmtq4L6om07McA8dhdi/?=
 =?us-ascii?Q?w3Qne5P+FxxORjFIk9SRX6wIrz1Te78cLeFoFnt9vYVW/ZyynIV3NHPNNB1w?=
 =?us-ascii?Q?KEe6Qd27h/qlHodh1H6kfEpzp5vEiIIb+goFyQ97DSZBg7RQqZ0SocBjkZse?=
 =?us-ascii?Q?+vXdoyfWDhLrCKkUSAqLOQobtp1LgWBq35GfWiKX2R0KV3oF1MjP06d+C/A9?=
 =?us-ascii?Q?+G2kQuEql+bQ5pl9eqArcQXCChiuag8KrpIpGIZKksmlpZ133cDiS3IEC3Nx?=
 =?us-ascii?Q?J7WFGn1rk8ao4ZkpZkA+QzkHUzN3q4OCllYpeiyR5+gHnJruRa8hTOJUIoIL?=
 =?us-ascii?Q?NQTyuJrr2No39Xr5eyKHc1zqQGalkIzf5Ygm3F4cTSpEGpLbgQ7RuL+BOyjt?=
 =?us-ascii?Q?0dblBMSVL4gMzcyeE2pj0dQhJ69bQg3K/0Z0SihJsU0c5p8fyt0SiZCe+PYj?=
 =?us-ascii?Q?gzoOY73Y+o5JL2yg/00shICmkN52XyNXDD9gb69FNq8/lSEYMha17elbh5DC?=
 =?us-ascii?Q?YyBIg0xMRAzgYObAfQ6yp34jZc4LL2HwXYlP2d8RoQSPRzowAk42S+6GAT3g?=
 =?us-ascii?Q?1ituohdAE118fL6SO+qZI9jo4i3NA7mLNkMk/nxpz/yeNBbUTx6AVlhR/aLf?=
 =?us-ascii?Q?7Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d3c711-5864-4d0f-b530-08dd4b492bd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 09:39:39.6092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OOMgxlgYYWwWKLQzPVHDsJo8oV8azZiTSBlaSw95K3gXlD3zq8jErtNv4b2urftNp/shjlrdA37oQkl6zXo3jPWDyWP1C4ENU95TzSQEYAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7042

Hi Krzysztof,

> On Wed, Feb 12, 2025 at 09:47:11AM +0800, Jammy Huang wrote:
> > Convert aspeed-video.txt to yaml format.
> > Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.
> >
> > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> > ---
> >  v5:
> >   - Don't put additional changes in this commit.
>=20
> But it fails then, right? I asked for justification or separate commit, d=
epending
> on what is really hapenning here.
I will send separate commit to add new properties later.
In this commit, just focus on the transformation from txt to yaml.

>=20
> Are you sure you tested this? I am pretty confident it will fail :/.
I did use 'make dt_binding_check' and didn't find errors.

With your reminder, I found that I didn't remove new properties in example.
Sorry for this careless error.

>=20
> Best regards,
> Krzysztof

Regards,
Jammy Huang

