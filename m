Return-Path: <linux-media+bounces-29211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDB4A78B38
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 11:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 658B1188F1A2
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 09:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A10A235C01;
	Wed,  2 Apr 2025 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="W6Tu9kKS"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011069.outbound.protection.outlook.com [52.101.125.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3CE1E8358;
	Wed,  2 Apr 2025 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743586791; cv=fail; b=RCEuoHeGYsX9/giZYdtZx+SQ+q3TZGtGKYHLP1+GL2JXuoVkxMbECebJTTmRmEmYXlb1ywYzVbjaQPx67dRIn5nXWmv5Z1pJ9DoSzQhllbKKuQw+WCErueiS8m4kl27LC+GG27vN0RJGXUbhTogWZG+tsRzhv80gOx2pnIQ5Lg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743586791; c=relaxed/simple;
	bh=GxPnMUKfDkBb5Rx83zdGSqGejMvjHrh+wmENWh/a4xg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pUQ6/wVaRj2YckVGO/uvFnT7saxTCYStnmKwa7mAnPpxeKXcnfZdzX1WgNXWXPRMfTTQzx4J/pf3uqa/5HbIhzCFupTE0eIPry1zyK3dphAQCj9EQriqoWJcy+WEveT72Dkrf7tVuRJerXkSZfV8Y95XqGUjZbqgxR8C1xrO8i0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=W6Tu9kKS; arc=fail smtp.client-ip=52.101.125.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UKYlU4co3vESHS/F8f9QcXluocefSTXnw5reXJmfT53E43m7CqGxfk/42jf5O89Z5g7cnLciU8HRJnKitPhX5Kh0P2P1nPnw5V8fqCNV/tHHnhFocf+/aBVVFBDq/YcPMUnB2UahUxfqvLWaoZSdcp66IRnnxpwGSn2oMDb2HAMmn7tIpUHn+AlP0IpVxpOZ1EHc4m7zsqC0l23e6ETlu5y5459Lv09enlGcLch6WT7bVo0qagkhTBRsrMoNtgJY8KB4/PQvvXzsRfolwPDkTF9Pd019GDMDfG/pCb7HeY9liyAYm6IrnvEL79CNMpmew4mwiy6LLxDSgudgrCLW6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxPnMUKfDkBb5Rx83zdGSqGejMvjHrh+wmENWh/a4xg=;
 b=nCRX0zO+Q0qJv2nFRe8DumksAmIVm9zpAEHHsKzu7LtTVS/AOWPayAk6LxhljjKVSDf+OZCJ6D1k/+Lu9pqo1X8hkvkywEZwdi4ZVA/FRYTvZgJ1cM5+0Wj+oB/j8WZ0OuLdnXUJEh7I3tmMwU21soq7Wf07F2tdkJj6LV4ceQ9N74dpocDh6qPE4bVIOhuE3nbujpNx9ka8HHE2WOQMJXtnqQihIDgjey56eHQtfdqFsCYdbPDXwvG9GiB56pjnWPBy5DFRth77iKDRKkLIgwyBYwuaNsiXJ/YXYzGW1Q9BAgQF/SdUGsaaIrpx0+kdAYLe2M0L9MKAjlUxXvRIpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxPnMUKfDkBb5Rx83zdGSqGejMvjHrh+wmENWh/a4xg=;
 b=W6Tu9kKSz1Lgpi67aNw6LnZFVJsCntQv7/2Rn2n0gBwwYhpUMm5ws+jUc+uAl3kQTDdm8AbQgW+bYc2FQR3rnPPdBeNK0Kj90huKobqHmt3pgUbD5YKhUfR8LcRul8/SFxdh44HQzyNlFU0DGD/V7qnirKOuKIXv2eHwtGmtGYs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB14307.jpnprd01.prod.outlook.com (2603:1096:604:360::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Wed, 2 Apr
 2025 09:39:39 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 09:39:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>, "Lad, Prabhakar"
	<prabhakar.csengg@gmail.com>
CC: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Hans Verkuil
	<hverkuil@xs4all.nl>, =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?=
	<u.kleine-koenig@baylibre.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping support
Thread-Topic: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping support
Thread-Index:
 AQHboAdhMLT6c7RZOkyzH0oxaSH/n7OP8RdwgAAScoCAAAvKoIAAAhgAgAARGQCAAAH3cA==
Date: Wed, 2 Apr 2025 09:39:39 +0000
Message-ID:
 <TY3PR01MB11346DF814762C667FF97074286AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
 <20250328173032.423322-12-tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB11346ECE31CB6C8DC33459C2486AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sJQnyJb_uq9yEcjHRW7ZFOw3g2XQyygcozWTgMjrYxRQ@mail.gmail.com>
 <TY3PR01MB113462DC897E0DB681B1C020F86AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8ukJ+_Bhy-4nU_CFD4rMoTRxEY-q+bXHHZ-9Mz8gQ362A@mail.gmail.com>
 <20250402092618.GH4845@pendragon.ideasonboard.com>
In-Reply-To: <20250402092618.GH4845@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB14307:EE_
x-ms-office365-filtering-correlation-id: b764615b-f300-438b-ad08-08dd71ca49fd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NlJTdnc1Z3lUNWc1MkF5emV6ZU1yUHpDUkRvbTQ1ck9TeWllZDlPN1NLckFx?=
 =?utf-8?B?bkY0dktvS0tGRFR0QTNycFk3cDNYL1Y4dUxGZFpBbVhJLzlBMU5kYmtMMnVR?=
 =?utf-8?B?Z0wxa2VtYzhvOWN6YjE3SERqU0NSWWxVVWs2eEVWTi93bnZkY0xIcU4vRmR6?=
 =?utf-8?B?Nll4ODJBcGVkVTdxTTAreE4yeTJLbm1xNjlxTEdmcUdheGYvaUo0eHVMRW02?=
 =?utf-8?B?OFI3b0c4UzlaNFByNWRuNkgzaHF0UFZYVndtb2JwTnZBR2h2RkE4eXlPYmt1?=
 =?utf-8?B?V1lOeU5QbDA2Tit4TXk4T0xpb3I5ZU5lSzNYTWJwbHhieFdMM2JVQ2RIcVBI?=
 =?utf-8?B?bUQyVnZlaWJNWWc4RitrUlFRY2l5bjVSaTNoTjMvVktXRGcyK2lOOWpEOXlH?=
 =?utf-8?B?UGtFejkzNXlmazlwVmJaMGpqQ0VJZ25VYk5WWVh0OUVVUnNKS3docnhHZWpr?=
 =?utf-8?B?MWN3SDBad0FZQzQ5ZTdkRzhzWDZkK29lRWRRQVRFRTJDWDVGczQ0R2c2cWl0?=
 =?utf-8?B?dmJlcU1xaGV0ZWg1YUFIVTdqZFM3b293dTBSeUdiSTB6b09xL0o1dzIrMjJn?=
 =?utf-8?B?L0dSYUg0K2M5WDA5ZXBsRnlNMlg2SDljaGxVa2lrZWNoMUR1akw2dU15VGdZ?=
 =?utf-8?B?UnJ2QnoxckRHY0JJVno0RklmZnYyVW9Pb0FxeTFVMVYrSDBRS2ZEeFZDZG5r?=
 =?utf-8?B?VFhSYWVXNG1mZ0tPankwMWpIZHhKaU40U3hTVUdCdlQzYmxCOHVEQjB1MGpN?=
 =?utf-8?B?YjAyQTFlYklzNkFydnlBYURuNlFoWWZwY0dXOUpHTDQzaUxKaU5ZWUk5TnJM?=
 =?utf-8?B?U2cvTTVpVURWZDZhdkFKalVETW9jUmZFcXE0RmJuMWtieVN2ZGppUTZwNHow?=
 =?utf-8?B?SHp5SDBtcG9LWHl0Q0NhWVdoc2YwWmxGUW5pSDd2LytqSEZWZGJNZFJtU3lV?=
 =?utf-8?B?bVF5SXp5V1NlSStydlpaK09sUy8wYjJ1UEJPN1lBMlEvS3dHTTJTcExzMHVE?=
 =?utf-8?B?UEtsVlBEOUVnanYzOFB3bmwxL3h0TFQ2eFY4UjNEdzJtaHpKdjg0clY5VFhY?=
 =?utf-8?B?NDNlSmZNdzBFa2tKWG1uVVh5Q1loSkMwUDZrZDlEdmd6Qmo2V0ZwVFh4MnVt?=
 =?utf-8?B?TXZKNXZlbWttTVRoK1ZrdWtsL0JDc1I5MVdWNFhQNmlQdmlnTExzWGUrTkNL?=
 =?utf-8?B?TDdQT0lDYjNCaDROb0lYTmpNcWQ4aFozczhvSnVWK3puL0JMVVIxclZSdWV2?=
 =?utf-8?B?bVhQV3lUaVQ2WEdDRlZjeFc3RG9sVUh5V2VaTGpnWllRbWwzNzBYeUNjRnp4?=
 =?utf-8?B?aUdBb3BLSy90aUFIV29tL3B4cXJ1K3BFQWtobHExM3o4ckJCbm9ZMGVkK0x2?=
 =?utf-8?B?U2JCbm8zK1AwUnFHOVExKzR5WWVCa2RPU2Q2WXBBNUovQ0oySDcyMFY3aUh5?=
 =?utf-8?B?UWJTbXRKWTdBQ2U3L2RrbWJmbFRpNU9jR0R5M29WSmtUdkhUUjBlbU5MWnlt?=
 =?utf-8?B?WGVBa0FuSlRyVDdxNEJaNisvdVJvajhkelY1MWFOR2ZyRmNBbGxDSmc1clZZ?=
 =?utf-8?B?NmduS09HdmNaUGlINzVGSjFmeWlEWjNCTW1YTVVzNEg5ZzVOT3g1cjcvdmEz?=
 =?utf-8?B?RzlJS2EzSVIxemR3R05FUlFydHRLMDhIelN0U1Y5cEptNEVwWXFEek8rbmto?=
 =?utf-8?B?RENJd0dOT2Q0ZkQ4Q1g0bUs5ZGxETXNFSXNiSy9mc0FFUDQ2S09DRGNreTBu?=
 =?utf-8?B?YmNnVnpmb05ZZmV1ZW01MUdwL3BWbjZ6VExnQUs5TTZFekVhOWZ0aU1zbEIy?=
 =?utf-8?B?L1p4QlJhR0lvdlBpRCtobUp4em1XNGRSUFl1QW9VYVdFaUN2R3Vsd3RvMDg4?=
 =?utf-8?B?V3NtUTRMNWFNU0RKRTh5R2M3Qml1VjdqSW1RcGhnQ0sxZWVxM2NQMG0zQmFP?=
 =?utf-8?Q?OkFrRRRjIJEduODM/jE6z1qA1Dkyuqx3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Wkw4aUVZbTNDZFB0eEVqSFlnejZqdE1OTzNyQ2RZSW0zRzBxL3Z0eklUNzBi?=
 =?utf-8?B?WkkrTUtPRTJrWGJVS0RyRVJkVHRSZC9qVTNLYWVPdC9XbDlvNWVHbzBFQTRz?=
 =?utf-8?B?TzAxNlZxOUEySElnaDkrQ2wzU3B5TEU0MnJDZzdZcElqUVlyT1YwZFdZYXNP?=
 =?utf-8?B?eFd1ZVZpUE54WnJ1Yk03UHlpZHo0LytkQ050Y3d5ZXZqdE9kSW8rcjBHcVg1?=
 =?utf-8?B?enhmclJOb2hseEtzTnplYVBIWEswY0JVbytLeHc3bTlMWjh6RkJsVnBTSTBz?=
 =?utf-8?B?K3hjbUI5dExjU2dLSVlQZ2hQS3lqTk9VNXRQRHo2ZWF2OW42UmpSNGxBQnZZ?=
 =?utf-8?B?RkV3S3ptMTBVYlNGMTV5RU10OXExSmd5ajJ4QTN5UFlEaWUxT3JFYkFBWTBP?=
 =?utf-8?B?UXFDUmxhdmZvSEV6NHpXUEIzK2xrRUpuaU5wRFpUQTBRTnc3UXdLdDBXQ210?=
 =?utf-8?B?T1RzaDRGZXVwYWJQMXdPZm9QbnE1UDlFS3BzT0Zsalg2ZzNZdmNaajhOZGYx?=
 =?utf-8?B?ajVGNDE4ZlVFZ0RsS0Q5dUFkS3hTbHBBUGIxTWsrNkljTDhpVmFrUkszcnpv?=
 =?utf-8?B?eUU4VjJDbmRsT0g2c0UySWZYWTNrRkNGUDM2ZTBwbURVR0FJbm94RDdXcnpL?=
 =?utf-8?B?Wmthc0o2QUJVWU1UZmRQaHB4UGdtYTByRVVwSmtqV1lSYmowYlNFOTRLRWZk?=
 =?utf-8?B?RG0zOEdseFVwaGU0MG9MbU5IWFA3S25pb3VlMTJnOHh3K0lIUWJ1RmZSRkJk?=
 =?utf-8?B?SlBYc1FQSmhVa1VuTGhpbWlEdDNyd0JMWXdnaHdRYVFqbkx4L2YxQ2dBU3Qy?=
 =?utf-8?B?ZU5SN1JTYTB1Q0hJUzlLRVN4UGNBUTA3UndTVkxyN1drS0VaTHB6ZTNmL2dY?=
 =?utf-8?B?Nk4zNm40L1IybzhkNS9KOEdabGljWnlRdEZDMUJjcjVTVnZwQm82QnJESGpE?=
 =?utf-8?B?bU5hVDZTd0l3VmxnbWlMMTlTdVlEcXgxV3RCVFUxRTFXNHM4eFQwUEJFTHVy?=
 =?utf-8?B?ZU85NlUreGtndnRwUXgrUWErTzFEUlV3TzlqdStEblRidDlhWXpUZXRBRlM0?=
 =?utf-8?B?akF0eGlEQ3Y0djFVZzhWKzZPZkxlZmk2aU9kV2w5aHlSUThZT0tlMWVhb0ts?=
 =?utf-8?B?WjU3NVg3czcxOUlzVjdtWWR6OE5ESDg5MEI1N01FdUVUa3M5QmdPUjI3UkJk?=
 =?utf-8?B?USthaGVaWUdGN3BvR3B6N3ZGZjl6dWRubHJCMEpLS1dHMDN3WmRiY3hHVk9Q?=
 =?utf-8?B?U0tuSXNVa2RxSTlRMU5JYUNVcSt3UEJqMVcvNTdBMnpUVUlRMDhnZ1ZncVdP?=
 =?utf-8?B?QVgvSXF0Y0JKKzk5bDFyd0VEczRMT0xsNkVqMFBpaVRYMFVXMHpuUXIweGFQ?=
 =?utf-8?B?NStXWXNhSTlqRzZ5bkJ1UjNtSUFIUXl0N0dYclhJMkViWjM4Uk1qdFNnSkJF?=
 =?utf-8?B?THBOT1V3TG5DTFdKemh0aDBQcFhCTHBTUlZ2UnViMWhncUMwSDhrMVVFWnJ6?=
 =?utf-8?B?RDExSUNJZFRMR3BwZlh3cUd6RHJqYjFsR0J3UHJ0YVRMb1ZwTUxmZFhSa25x?=
 =?utf-8?B?RGdINzlGSzdBeXBvL3VWN2o1RVNHQVVkN2ZrMTNMdmhWWVY2U2ZQMjFJM1Ew?=
 =?utf-8?B?QWRDM0RnMW1iRGRrbkZSMDFLOThCcTliaHg2dUN1TUljSG1xajRVdm1NS2E3?=
 =?utf-8?B?RFp4N2lMYSt4dlZjemd3a2NvSHgzeGJCVytEZVlHa29ueHFtY1RhZ1NuQkox?=
 =?utf-8?B?dmdMUVU5NHlIVElIUmxaUE4yRFlDVHlqQ0RlSU9kbjNYLy9VSFRHZzFXenEy?=
 =?utf-8?B?US9kcmc4N1BUSStjZjRyZ0x6cXF6ZTZJdHlYMTJTVDNhWFN0QkFBWDZjazYy?=
 =?utf-8?B?K0FsTm95SEFSdUcvNm9wTTJpVm83eU85alppbTNWWXhxUUZBZjhuRjB2YXRm?=
 =?utf-8?B?WndjeWRBQklMbEw0VFQvNGxpQWlSaXB0bVE1Z1JBdkc4b1Y0ZE5ILzd2aTI3?=
 =?utf-8?B?RWRDdS80REU1VEhUQ2prbXZ1YlRoRk1IKy9tRE5xTGhINVBmUHZITHptcHZv?=
 =?utf-8?B?QUtxM055d3VxMnY0ZGQ0OHMxM2ZMbld5cDNaallnVUN3eGhjNk52MDczS2Ix?=
 =?utf-8?B?SjJwRzZTam9TcGFFMW9nWnV6UGY5dGUvRkJUaGRGR0xNc2ZFY0d4UjFZUU5w?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b764615b-f300-438b-ad08-08dd71ca49fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 09:39:39.5035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wOwk5FSuTOfo40z4XjheaOykBlwyqnu/zwB8o8SgdsQFgLAZYtS8yakGxLMazWWr3p3Jd+x4g7v4BlIBcg1+r2k1d3WEsTHYyfj/lOavSCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14307

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IDAyIEFwcmlsIDIwMjUgMTA6MjYNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAxMS8xN10gbWVk
aWE6IHJ6ZzJsLWNydTogQWRkIHJlZ2lzdGVyIG1hcHBpbmcgc3VwcG9ydA0KPiANCj4gT24gV2Vk
LCBBcHIgMDIsIDIwMjUgYXQgMDg6MjU6MDZBTSArMDAwMCwgTGFkLCBQcmFiaGFrYXIgd3JvdGU6
DQo+ID4gT24gV2VkLCBBcHIgMiwgMjAyNSBhdCA5OjIw4oCvQU0gQmlqdSBEYXMgd3JvdGU6DQo+
ID4gPiBPbiAwMiBBcHJpbCAyMDI1IDA4OjM1LCBMYWQsIFByYWJoYWthciB3cm90ZToNCj4gPiA+
ID4gT24gV2VkLCBBcHIgMiwgMjAyNSBhdCA3OjMx4oCvQU0gQmlqdSBEYXMgd3JvdGU6DQo+ID4g
PiA+ID4gPiBPbiAyOCBNYXJjaCAyMDI1IDE3OjMwLCBUb21tYXNvIE1lcmNpYWkgd3JvdGU6DQo+
ID4gPiA+ID4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpA
YnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gUHJlcGFyZSBmb3IgYWRk
aW5nIHN1cHBvcnQgZm9yIFJaL0czRSBhbmQgUlovVjJIUCBTb0NzLCB3aGljaA0KPiA+ID4gPiA+
ID4gaGF2ZSBhIENSVS1JUCB0aGF0IGlzIG1vc3RseSBpZGVudGljYWwgdG8gUlovRzJMIGJ1dCB3
aXRoDQo+ID4gPiA+ID4gPiBkaWZmZXJlbnQgcmVnaXN0ZXIgb2Zmc2V0cyBhbmQgYWRkaXRpb25h
bCByZWdpc3RlcnMuIEludHJvZHVjZQ0KPiA+ID4gPiA+ID4gYSBmbGV4aWJsZSByZWdpc3RlciBt
YXBwaW5nIG1lY2hhbmlzbSB0byBoYW5kbGUgdGhlc2UNCj4gPiA+ID4gPiA+IHZhcmlhdGlvbnMu
DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gRGVmaW5lIHRoZSBgcnpnMmxfY3J1X2luZm9gIHN0
cnVjdHVyZSB0byBzdG9yZSByZWdpc3Rlcg0KPiA+ID4gPiA+ID4gbWFwcGluZ3MgYW5kIHBhc3Mg
aXQgYXMgcGFydCBvZiB0aGUgT0YgbWF0Y2ggZGF0YS4gVXBkYXRlIHRoZQ0KPiA+ID4gPiA+ID4g
cmVhZC93cml0ZSBmdW5jdGlvbnMgdG8gY2hlY2sgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzIGFuZCB1
c2UNCj4gPiA+ID4gPiA+IGluZGV4ZWQgcmVnaXN0ZXIgb2Zmc2V0cyBmcm9tIGByemcybF9jcnVf
aW5mb2AsIGVuc3VyaW5nDQo+ID4gPiA+ID4gPiBjb21wYXRpYmlsaXR5IGFjcm9zcyBkaWZmZXJl
bnQgU29DIHZhcmlhbnRzLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IExhZCBQcmFiaGFrYXINCj4gPiA+ID4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAu
cmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBUb21tYXNvIE1lcmNpYWkN
Cj4gPiA+ID4gPiA+IDx0b21tYXNvLm1lcmNpYWkueHJAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+
ID4gPiAtLS0NCj4gPiA+ID4gPiA+IENoYW5nZXMgc2luY2UgdjI6DQo+ID4gPiA+ID4gPiAgLSBJ
bXBsZW1lbnRlZCBuZXcgcnpnMmxfY3J1X3dyaXRlL3JlYWQoKSB0aGF0IG5vdyBhcmUgY2hlY2tp
bmcgb3V0LW9mLWJvdW5kDQo+ID4gPiA+ID4gPiAgICBhY2Nlc3NlcyBhcyBzdWdnZXN0ZWQgYnkg
TFBpbmNoYXJ0Lg0KPiA+ID4gPiA+ID4gIC0gRml4ZWQgQU1uTUJ4QUREUkwoKSBhbmQgQU1uTUJ4
QUREUkgoKSBhcyBzdWdnZXN0ZWQgYnkgTFBpbmNoYXJ0Lg0KPiA+ID4gPiA+ID4gIC0gVXBkYXRl
IGNvbW1pdCBib2R5DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gQ2hhbmdlcyBzaW5jZSB2NDoN
Cj4gPiA+ID4gPiA+ICAtIE1hcmsgX19yemcybF9jcnVfd3JpdGVfY29uc3RhbnQvX19yemcybF9j
cnVfcmVhZF9jb25zdGFudA0KPiA+ID4gPiA+ID4gICAgYXMgX19hbHdheXNfaW5saW5lDQo+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gIC4uLi9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcy
bC1jb3JlLmMgICB8IDQ2ICsrKysrKysrKysrKy0NCj4gPiA+ID4gPiA+ICAuLi4vcmVuZXNhcy9y
emcybC1jcnUvcnpnMmwtY3J1LXJlZ3MuaCAgICAgICAgfCA2NiArKysrKysrKysrLS0tLS0tLS0t
DQo+ID4gPiA+ID4gPiAgLi4uL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNydS5o
ICAgIHwgIDQgKysNCj4gPiA+ID4gPiA+ICAuLi4vcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUv
cnpnMmwtdmlkZW8uYyAgfCA1OA0KPiA+ID4gPiA+ID4gKysrKysrKysrKysrKystLQ0KPiA+ID4g
PiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTM5IGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygt
KQ0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gPiA+IGEvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC1jb3JlLmMNCj4gPiA+
ID4gPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC1j
b3JlLmMNCj4gPiA+ID4gPiA+IGluZGV4IGVlZDlkMmJkMDg0MTQuLmFiYzJhOTc5ODMzYWEgMTAw
NjQ0DQo+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpn
MmwtY3J1L3J6ZzJsLWNvcmUuYw0KPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC1jb3JlLmMNCj4gPiA+ID4gPiA+IEBAIC0yMiw2
ICsyMiw3IEBADQo+ID4gPiA+ID4gPiAgI2luY2x1ZGUgPG1lZGlhL3Y0bDItbWMuaD4NCj4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiAgI2luY2x1ZGUgInJ6ZzJsLWNydS5oIg0KPiA+ID4gPiA+ID4g
KyNpbmNsdWRlICJyemcybC1jcnUtcmVncy5oIg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ICBz
dGF0aWMgaW5saW5lIHN0cnVjdCByemcybF9jcnVfZGV2ICpub3RpZmllcl90b19jcnUoc3RydWN0
DQo+ID4gPiA+ID4gPiB2NGwyX2FzeW5jX25vdGlmaWVyICpuKSAgeyBAQCAtMjY5LDYgKzI3MCw5
IEBAIHN0YXRpYyBpbnQNCj4gPiA+ID4gPiA+IHJ6ZzJsX2NydV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ICAgICAgIGNydS0+ZGV2
ID0gZGV2Ow0KPiA+ID4gPiA+ID4gICAgICAgY3J1LT5pbmZvID0gb2ZfZGV2aWNlX2dldF9tYXRj
aF9kYXRhKGRldik7DQo+ID4gPiA+ID4gPiArICAgICBpZiAoIWNydS0+aW5mbykNCj4gPiA+ID4g
PiA+ICsgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRUlOVkFMLA0KPiA+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIGdl
dCBPRiBtYXRjaA0KPiA+ID4gPiA+ID4gKyBkYXRhXG4iKTsNCj4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiAgICAgICBpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOw0KPiA+ID4gPiA+ID4g
ICAgICAgaWYgKGlycSA8IDApDQo+ID4gPiA+ID4gPiBAQCAtMzE3LDggKzMyMSw0OCBAQCBzdGF0
aWMgdm9pZCByemcybF9jcnVfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
ID4gPiA+ID4gPiAgICAgICByemcybF9jcnVfZG1hX3VucmVnaXN0ZXIoY3J1KTsgIH0NCj4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiArc3RhdGljIGNvbnN0IHUxNiByemcybF9jcnVfcmVnc1tdID0g
ew0KPiA+ID4gPiA+ID4gKyAgICAgW0NSVW5DVFJMXSA9IDB4MCwNCj4gPiA+ID4gPiA+ICsgICAg
IFtDUlVuSUVdID0gMHg0LA0KPiA+ID4gPiA+ID4gKyAgICAgW0NSVW5JTlRTXSA9IDB4OCwNCj4g
PiA+ID4gPiA+ICsgICAgIFtDUlVuUlNUXSA9IDB4YywNCj4gPiA+ID4gPiA+ICsgICAgIFtBTW5N
QjFBRERSTF0gPSAweDEwMCwNCj4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQjFBRERSSF0gPSAweDEw
NCwNCj4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQjJBRERSTF0gPSAweDEwOCwNCj4gPiA+ID4gPiA+
ICsgICAgIFtBTW5NQjJBRERSSF0gPSAweDEwYywNCj4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQjNB
RERSTF0gPSAweDExMCwNCj4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQjNBRERSSF0gPSAweDExNCwN
Cj4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQjRBRERSTF0gPSAweDExOCwNCj4gPiA+ID4gPiA+ICsg
ICAgIFtBTW5NQjRBRERSSF0gPSAweDExYywNCj4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQjVBRERS
TF0gPSAweDEyMCwNCj4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQjVBRERSSF0gPSAweDEyNCwNCj4g
PiA+ID4gPiA+ICsgICAgIFtBTW5NQjZBRERSTF0gPSAweDEyOCwNCj4gPiA+ID4gPiA+ICsgICAg
IFtBTW5NQjZBRERSSF0gPSAweDEyYywNCj4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQjdBRERSTF0g
PSAweDEzMCwNCj4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQjdBRERSSF0gPSAweDEzNCwNCj4gPiA+
ID4gPiA+ICsgICAgIFtBTW5NQjhBRERSTF0gPSAweDEzOCwNCj4gPiA+ID4gPiA+ICsgICAgIFtB
TW5NQjhBRERSSF0gPSAweDEzYywNCj4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQlZBTElEXSA9IDB4
MTQ4LA0KPiA+ID4gPiA+ID4gKyAgICAgW0FNbk1CU10gPSAweDE0YywNCj4gPiA+ID4gPiA+ICsg
ICAgIFtBTW5BWElBVFRSXSA9IDB4MTU4LA0KPiA+ID4gPiA+ID4gKyAgICAgW0FNbkZJRk9QTlRS
XSA9IDB4MTY4LA0KPiA+ID4gPiA+ID4gKyAgICAgW0FNbkFYSVNUUF0gPSAweDE3NCwNCj4gPiA+
ID4gPiA+ICsgICAgIFtBTW5BWElTVFBBQ0tdID0gMHgxNzgsDQo+ID4gPiA+ID4gPiArICAgICBb
SUNuRU5dID0gMHgyMDAsDQo+ID4gPiA+ID4gPiArICAgICBbSUNuTUNdID0gMHgyMDgsDQo+ID4g
PiA+ID4gPiArICAgICBbSUNuTVNdID0gMHgyNTQsDQo+ID4gPiA+ID4gPiArICAgICBbSUNuRE1S
XSA9IDB4MjZjLA0KPiA+ID4gPiA+ID4gK307DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBEbyB3ZSBu
ZWVkIGVudW0sIGNhbid0IHdlIHVzZSBzdHJ1Y3QgaW5zdGVhZCB3aXRoIGFsbCB0aGVzZSBlbnRy
aWVzIGluc3RlYWQ/DQo+ID4gPiA+ID4NCj4gPiA+ID4gV2hhdCBiZW5lZml0IGRvIHlvdSBmb3Jl
c2VlIHdoZW4gdXNpbmcgc3RydWN0PyBXaXRoIHRoZSBjdXJyZW50DQo+ID4gPiA+IGFwcHJvYWNo
IGJlaW5nIHVzZWQgYSBtaW5pbWFsIGRpZmYgaXMgZ2VuZXJhdGVkIHdoZW4gc3dpdGNoZWQgdG8g
c3RydWN0IHRoZXJlIHdpbGwgYmUgbG90cyBvZg0KPiBjaGFuZ2VzLg0KPiA+ID4NCj4gPiA+IFRo
ZSBtYXBwaW5nIGlzIGNvbnZpbmllbnQgd2hlbiB5b3Ugd2FudCB0byBpdGVyYXRlIHRocm91Z2h0
IGl0Lg0KPiA+ID4gSGVyZSwgaWYgeW91IGp1c3Qgd2FudCB0byBhY2Nlc3MgdGhlIG9mZnNldCB2
YWx1ZSBmcm9tIGl0cyBuYW1lLCBhDQo+ID4gPiBzdHJ1Y3R1cmUgbG9va3MgbW9yZSBhcHByb3By
aWF0ZS4NCj4gPg0KPiA+IFRoYW5rcywgYXMgdGhpcyBwYXRjaCBoYXMgYmVlbiByZXZpZXdlZCBi
eSBMYXVyZW50IGEgY291cGxlIG9mIHRpbWVzDQo+ID4gd2Ugd2lsbCBjaGFuZ2UgdGhpcyB0byBz
dHJ1Y3QgSWYgaGUgaW5zaXN0cy4NCj4gDQo+IEhvdyB3b3VsZCBhIHN0cnVjdCBsb29rIGxpa2Ug
PyBJJ20gbm90IHN1cmUgd2hhdCBpcyBiZWluZyBwcm9wb3NlZC4NCg0KDQpJdCB3aWxsIGJlDQoN
CnN0cnVjdCByemcybF9jcnVfcmVncyB7DQoJdTE2IGNydV9uX2N0cmw7DQoJdTE2IGNydV9uX2ll
Ow0KCXUxNiBjcnVfbl9pbnRzOw0KCXUxNiBjcnVfbl9yc3Q7DQp9Ow0KDQpzdGF0aWMgY29uc3Qg
c3RydWN0IHJ6ZzJsX2NydV9yZWdzIHJ6ZzJsX2NydV9yZWdzID0gew0KCS5jcnVfbl9jdHJsID0g
MHgwLA0KCS5jcnVfbl9pZSA9IDB4NCwNCgkuY3J1X25faW50cyA9IDB4OCwNCgkuY3J1X25fcnN0
ID0gMHhjLA0KfTsNCg0KWW91IGNhbiBhY2Nlc3MgaXQgdXNpbmcgaW5mby0+cmVncy0+Y3J1X25f
Y3RybCBpbnN0ZWFkIG9mIGluZm8tPnJlZ3NbQ1JVbkNUUkxdDQpUaGlzIGlzIHByb3Bvc2FsLg0K
DQpDaGVlcnMsDQpCaWp1DQo=

