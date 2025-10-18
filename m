Return-Path: <linux-media+bounces-44954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E49BED7D9
	for <lists+linux-media@lfdr.de>; Sat, 18 Oct 2025 20:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E36814EBFDF
	for <lists+linux-media@lfdr.de>; Sat, 18 Oct 2025 18:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8CB32777FD;
	Sat, 18 Oct 2025 18:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=psu.edu header.i=@psu.edu header.b="ecIYSIib"
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010038.outbound.protection.outlook.com [52.101.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9727E1E00A0;
	Sat, 18 Oct 2025 18:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760812468; cv=fail; b=MeqxrQBECN5c7ckpUMYMO0tQ5PuV67b9q//JlTX5ZK9MSBIbVUMzoWCMLKGVQHH0Bror7pFibiWJeK3dw9GEiFlHPg7YVaE2hy2j4r/UkOVOARTomT7CSoqqiYYn+XY4+Qyo121sPVzVb9WdcPrRphSExoBByQbOh85T1QtNNAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760812468; c=relaxed/simple;
	bh=Mx0VUtc3ZaLNWNAJy1FNLs4cOTxsJVUWEhJf12nDt8s=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hFUc3VVHJQtiiQesGaMdcZ41fUIDT7AeoKWXsUe6eXdBMzV98jdiOPhAfnOoP8UaaXLIFU99Cz7fIDUyHgJ8XbOBD20yq6D/H5IixBlDApD5Iw0YSvYmU+nNvnhsZxxQ5LHlo32oz3Swc1ismbk+W8T1H28X5TNzMhtaYUGNBwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=PSU.EDU; spf=pass smtp.mailfrom=PSU.EDU; dkim=pass (2048-bit key) header.d=psu.edu header.i=@psu.edu header.b=ecIYSIib; arc=fail smtp.client-ip=52.101.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=PSU.EDU
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=PSU.EDU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlVNypHTk5i3+wwY+xN11n0M700NyDMRF7XwjS+qf0s2FMBq9eXRHNhWUmTUZzNcFMbU/+csdDl3gS48+mh9CU2dApkgPJLMhav3ImPs0BC5EngIsPdJb8qrIQPiTn1VpqohPBNZrKgS110G1XSolWPOzK7hih2YGtoBplYe56/2+Z2seX7lmJLW/E7M2QrXlzd/JvL2sQNVG3K9d4br5Wa9Lr6V1htDwU4PYbdAnsnE6j4rjuJM66mnECE77lNWBfE6Sgr4RA3SwOw9E6GNBiTmCqg4CidZ7hXUiUjllUr0Twr5xhhZKn36VNYDXWS0MY2h2cDlqWGqBf65JZsJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mx0VUtc3ZaLNWNAJy1FNLs4cOTxsJVUWEhJf12nDt8s=;
 b=Hv6BsKiNJ2WCZUrpAR4j7Nbm3ZHARe6BRjU+yIkBFlm+/BSVWbDKT6VF8xlvvnhBtLeE6cI+q/jMDyZhHwUwBeO2uLhuFuQpy0dmyl5yczp2YAsaiQZhRsXnaq6GpTf++g4WXVsRduzbyOstje9LR5jKfqPSUvcVWtiL3skfl6H9CfNpD8U90OL6aGTamb9Fx5ixWBs74AFNbCbAJWThXzet3rD8zAQyWMWLoYnmbypz5Vfqo/VIPTMCDQtsjvKgXZVh500+WTyytP2TnAGTnS/3cGi4Qwqc6DESCa6iu9vgnmskwerHebqGc+GbvUOJruSs0Ag6o/D39k3VZthX8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=psu.edu; dmarc=pass action=none header.from=psu.edu; dkim=pass
 header.d=psu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=psu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mx0VUtc3ZaLNWNAJy1FNLs4cOTxsJVUWEhJf12nDt8s=;
 b=ecIYSIibs7EmHSZKUCJPYwNGxms2kbM13kxsAUm4m880g1cxXikwKNTLocLmq5+mXTmA2Ov7YWCmylzw1ZoGKmkV5xckkl1y1Weu+Y6mXku3wyIzBtdlFe6WJkpYznoLS3O2JEm9vb/Ni/h7BBAmEAWFf4fRmOuoGv8U2wcAgvkEilOKm7FOwBLrUYaIJBcqJAmua8xNYIf7VDdLJUKpmcO68oUpZn8QyUcj5qCI1dvBkmO8femyMFIYbclbslWtPLXlV6EPr8t9d/ntBS/nD77AvOJk7JQYS3inbUzAm0fVoSLtedb6gzFoLmadY9cGMKoLlsee1PEV+95QzSAjcQ==
Received: from SA0PR02MB7276.namprd02.prod.outlook.com (2603:10b6:806:e6::17)
 by MW4PR02MB7444.namprd02.prod.outlook.com (2603:10b6:303:77::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Sat, 18 Oct
 2025 18:34:24 +0000
Received: from SA0PR02MB7276.namprd02.prod.outlook.com
 ([fe80::e6ab:3830:2755:fa66]) by SA0PR02MB7276.namprd02.prod.outlook.com
 ([fe80::e6ab:3830:2755:fa66%7]) with mapi id 15.20.9228.011; Sat, 18 Oct 2025
 18:34:24 +0000
From: "Bai, Shuangpeng" <SJB7183@PSU.EDU>
To: "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
CC: "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"g.liakhovetski@gmx.de" <g.liakhovetski@gmx.de>, "hverkuil@kernel.org"
	<hverkuil@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>, "tfiga@chromium.org"
	<tfiga@chromium.org>
Subject: Re: [PATCH] media: videobuf2: forbid create_bufs/remove_bufs when
 legacy fileio is active
Thread-Topic: [PATCH] media: videobuf2: forbid create_bufs/remove_bufs when
 legacy fileio is active
Thread-Index: AQHcQF3TAAksCghiO0iL2O9nMkjYtA==
Date: Sat, 18 Oct 2025 18:34:24 +0000
Message-ID: <5317B590-AAB4-4F17-8EA1-621965886D49@psu.edu>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=PSU.EDU;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR02MB7276:EE_|MW4PR02MB7444:EE_
x-ms-office365-filtering-correlation-id: bfc4fdb2-80e5-4ecf-6ed7-08de0e74f64f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VMd+r6dVc3AnLKP8hUBHg5Q00Hq14ky3cgjlUdvD2b7YLlaMRRjcbyC2d27w?=
 =?us-ascii?Q?W10QINGHDPc6XQ+21UyJwKAh8QiAmxyQnozYH4V37liETVFWP90YuTWEKyR1?=
 =?us-ascii?Q?mHCX8PiqpRFku/dTZJRq6lCGZvrn2pauZxMlKs42DcItnDcWFc6MZgzfiLoG?=
 =?us-ascii?Q?IcQot1L8AdyACKlMHJhSEzRpvZsv9906sEvpAZucd6C8Ga3LPRFKxpyu3hyi?=
 =?us-ascii?Q?78x8j6gUcSOztn0+GjmeqHv3qVkVd7DyHopzSrlehsIvmuQnkOnnObDwJg4a?=
 =?us-ascii?Q?qWkKUHesuGVpiOnmgk64ZRcrxfT33DIR+0zDP8QhgGqUxOoajlRT34BTifhX?=
 =?us-ascii?Q?yaNhHPXjkqthSdDfhAnSCyLnOj7gf9Lbc8+wPWWCcIutRlmNFS4RkOAgSAY9?=
 =?us-ascii?Q?fGyUq/VbrOSaKyTlxESXFMS2QLAcDLg1n0lC6B8MVYzedboMpdkgXnK/Kve2?=
 =?us-ascii?Q?anMzxlVAHd2WOm4J0HkSysP/LXuqIAO9QvjUrcnqR83Ct/P0aZNiqeiv3aVa?=
 =?us-ascii?Q?ji3J3plsjUPafeS96MyL0VQ3hdHbaE6wlQJFSq+y0E1QSRth+p11GRCeOZ1l?=
 =?us-ascii?Q?RVkjU0EhBBUFlVlieEbLwdhGI9UcEy9FOGQgS0Zgq97Vkr4hxptFraDVfw/v?=
 =?us-ascii?Q?6u6SF6FP8b+xTNPwcIVpOaMWlQvmc3J8LwzQJCpmR8P7HECnmCXaj0OcZaeH?=
 =?us-ascii?Q?skdXUQwq95gSqPmxpVjP21l2Q6NORlDdn1QXucJOW4szrZX8xNJuiBmxuKkE?=
 =?us-ascii?Q?e1Yy8RZAgpxU34YIamKrQdD2eXPqt2pK2XL9gYGM4kUARkTY02yR4504qGC7?=
 =?us-ascii?Q?kgUST+M6FXKhxTs9cd+Z0/xE5H1mhzIPg+hkgXRab8Bxr/ayinHIJLmVYZCD?=
 =?us-ascii?Q?Lc2HboVAEw6d7popiUdqOldfwvyB8Ji2ghT16daYCzAMMeIB+6VS4K3BEQXj?=
 =?us-ascii?Q?+CZoSpv9y5AvCL1NSCgKVNRKdcMbZqgg7hyYKEBXMDiGIu7IPvOnY3Gwjpz1?=
 =?us-ascii?Q?s1op+Rv09gebJrsWr5c82I9DG945Z0KuNka9XIgsyHABwe58SPBJEg1qvZo/?=
 =?us-ascii?Q?jfFvSy0843O/cVLG+Z+9DEEgtPmsQNYwBVPM7oYF8Ywj/OAttOTIibQj0i+z?=
 =?us-ascii?Q?2XlmnECrzyGd2nr93+tSlNavGQ3Bdd6OUvHElxZpmFXGjyusxQw6/3tMUSYE?=
 =?us-ascii?Q?2IXHgJwCiAgm63oYXhZgGkJ34Plqwo6gvgFlN/qwDLyj+4amp4GhkXRriiF8?=
 =?us-ascii?Q?JJW+78674HdzPahf02KoyXH/aNzlgojW6r3j2TC6xgVo0R+aZLaWpRB6HbTZ?=
 =?us-ascii?Q?0yEgARg5pRg9PZwzIxTLT5P4UrG9jGOrJhz8iAndTTa2/9OkjFrV6HyXQ+TD?=
 =?us-ascii?Q?dR4Jcsb5r2YAcblApF11e7G0WHQPqkdFWpL6b3G8gzwHB4JGjt+yyUPTYIT5?=
 =?us-ascii?Q?om0EKVwakfIedQCPJf8EdxYpJqsglts9tJgiRiwsB3wfWjI+DaeurzoZEFKn?=
 =?us-ascii?Q?v3vHgnZjluUH4ijO3nbUFOjoTHyoh4omVEXX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR02MB7276.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?o/blzfXRjdvMana3RDj1wuSA9Lcl+XTg8vmrCIC0c07YI4usFqd0loLSonFs?=
 =?us-ascii?Q?GMqFrk2UCCuMSHihsdp4cClUJsjcprGisL6wmXCsmvWFusWKAMu0m4PWqijh?=
 =?us-ascii?Q?CeYA+E0RPWDO0Dejy0xXihgHu2RXMNw3id+SzWjs/NslL+2zEINygRkLCyNa?=
 =?us-ascii?Q?fqlEIUNGVsnmAJrfK+De33RUQPr5BKagwzZkMMRZe6SrYGHT9oieQV5pERuz?=
 =?us-ascii?Q?jbEE5B94XxQH/vzqtwN9tX470oP+43T2xXoW7swQ6aEiTU8bC65t37/YM5OL?=
 =?us-ascii?Q?jyWXCXcyIlQbtKt9/7Y/O60eS4ESFh+8Mlijjp0xDCXGh5wnBKyTjzlccZbB?=
 =?us-ascii?Q?0cT/PEVLOl1M9ID++WXv7EHlnSBalA9/6Jloqff+qmfppeFTV6Bf/zN4s1rD?=
 =?us-ascii?Q?aOkrNFjzU/J1sYqyHc0dtiqBRwSgFW3ZxYSKHbg1qUFRir1GVv+4KdQ2HWJk?=
 =?us-ascii?Q?zBHH/+mGWMdH/RFp4kPrCNED0NwiQYCZ9L09rNDLb+mHBjIp+Edxyu3obhV7?=
 =?us-ascii?Q?NmEatLfoYaV0p2kyC0XgJ91kTtmWvlIp98K7H6XqqWFreY/khxbc2ShHvbHv?=
 =?us-ascii?Q?Kkwjg6IffnPysu5EqURZFlmb8CDpRJzyApxmWHqN+0JWvTNuar0MeSxQrfz/?=
 =?us-ascii?Q?txZC7D/nXtUXOtMMER7WO8o1VMswW8eM+7jy+O476JlBF69mCtGfrOCHVePz?=
 =?us-ascii?Q?XW0dYoIGYHapIUvhJ33sgy/0pZFA5jo/XoerzAdensPJd0gQ8P0awqZV+4f2?=
 =?us-ascii?Q?yOs9A1skvdfZOk/wpvqCyTRGVjTi3i8BgxDJTLaU8n26u3mJeRyvzN4vasjL?=
 =?us-ascii?Q?cUrrUczjyO5rze1JHGCM8gKwCimdTZOZ7ApGKZipDnXIEPfcbIdfpghTxwxO?=
 =?us-ascii?Q?kfNU0BpG+X22nN2KHjdfAWjeEi1VSAaK2kkJwqpc7Z5WhQcK32kXlQwfTwxu?=
 =?us-ascii?Q?f0Xtu7j2JXynlqI7TqlSzKT4GhZ6lJ3R/JWtFmOSFRz33S19JeXO6xnWWvOz?=
 =?us-ascii?Q?uTDCUqS1i+t16mT77+anW/gxb8WulYGpggAoJaaUVQ6778E/ros60vIi168H?=
 =?us-ascii?Q?s2286/6MpSKxTEZf9kmxdBnPfIIIkVrTZ0PXxugi6qKmWg6chiPjy3OqpAKM?=
 =?us-ascii?Q?awjDbiVrBD8sFkK7ZkP29LVRaEJHEkRLIHxwVokgDGyK3T/dp3HXEk1evYzM?=
 =?us-ascii?Q?nFu8Y+YlwLwjXU1dhpkvCzXMw+5KEtlLrTO7fAsWeZBTqHEEq0ubQcGbSvPB?=
 =?us-ascii?Q?WwPqVsiDlWSw1usnZz/EIIqSXsQAftHQxJtk3AHS9VjBP2XUI9DLSNf2xh5V?=
 =?us-ascii?Q?3HRX2Hm2DRVyn1H7K4W5QIaI3D4bbaDUw35l/YFRgsXqVfw1RMCr1X0HrYB9?=
 =?us-ascii?Q?gJFJigb6b2bX9STswlA6ue9fZAQ+j2FfAb806FEBhD1HGrqPFz1oUe9szEW+?=
 =?us-ascii?Q?fXF9fHfOP7u9TGceNseKJIKCrBqu/jLta3BGubLLrJpmPTGOqoPfl/3wa2pc?=
 =?us-ascii?Q?Vqy7nk6GKxxcCQEKEIMScnZ2Bft4DI6s0qyGLRDZjvOwokWLHDjRy7l51Jfd?=
 =?us-ascii?Q?sFrFXOgHBi/NX6cy+XO5OxHjeKPkz1A7V/IJIAdFFJ5uRk3IRyHta+ZcbKxu?=
 =?us-ascii?Q?aqaXal8FnpNsBg2IvcR6wfIWj5u3VdUb9jSkAKbdIWox?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AE429BAEE46B294F97CD0FE5321F4BF5@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: psu.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR02MB7276.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc4fdb2-80e5-4ecf-6ed7-08de0e74f64f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2025 18:34:24.4273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7cf48d45-3ddb-4389-a9c1-c115526eb52e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RRm/VDKpJRqfquy9NvkDqnjxCKaoRyiR9rnCT3dRxZgAfE72JF2EcFeBtlnHv3xq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7444

Hi Marek,

Thank you very much for fixing this bug and for your contribution.

Since my original report was not posted to a public mailing list, I would
appreciate it if you could add the following credit to this patch:

Reported-by: Shuangpeng Bai <SJB7183@psu.edu>

Thanks again!

Best regards,
Shuangpeng


