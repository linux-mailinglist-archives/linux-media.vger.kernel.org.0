Return-Path: <linux-media+bounces-51106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B552D3C429
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 10:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6B701526EDE
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 09:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AAF13D5247;
	Tue, 20 Jan 2026 09:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jR5hf4Y+"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010047.outbound.protection.outlook.com [52.101.56.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6E93D349D;
	Tue, 20 Jan 2026 09:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901585; cv=fail; b=fHent5JWa2ViTL3LtioPlE0xbakWHIK3s9L2KjtnjGtq0nZr+Ma19mamLNgCLBgwQCwk/j/8K84L2Yfmz6eU+tXMDTkPUtqGr1I9kggmorwHcSq527ks3EgZnY8fEnjiARHxhh2kflSb8ecFeIl6QBuwO+NjoSn2DivZD5FCUC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901585; c=relaxed/simple;
	bh=P0ldctpzyIqdxpr/Lo21gBLHB76rGURJuZ3dtstUqJM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=u0zRV4zqQLASSiKU4WD4s/hJDRbpTJi3kpaDRczFWNyBEKNIK5C2hzfSSMpwS6NvrIOdyEfmBpNhQmWoqhN+aQvPfH4zE/So6QZxXSN8bhUafBWEuKGkaqtRY3Z9MYTnbKo7VOSYF89Zy4/wc01cvSJFPf/OIg7KJ78GU36LQRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jR5hf4Y+; arc=fail smtp.client-ip=52.101.56.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEr8IkCWX97iVxjgz4vbogkmJNHum4iybIDqprOlBUAChYinHRZ8JJexF/HW+1OM7vmP5IVsW/KUxbI/ujOE9OONfyU0P0nJmsaz0xZbS3KonyAYhPS4eGjlTTUOL2get2lOW2eztJCt185QSvywYGobFvlo2Q4XGJFTGX26Ek+aFsJtYezVxXBE00DdVFPWgJlMQC/2il8z0/pz2c5LkatHJwJZqDw/4rBU6fCwW0VmfqsvgV2TdN4K2M1SPuvmjTmeUbKhQFyPuyqs/rVvILhJqhbBQKHIIDaP7eWzsmOqieCIgymRXgWZy9N+7Y4RJXoNY6yWZXOyzE48uw7BhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0ldctpzyIqdxpr/Lo21gBLHB76rGURJuZ3dtstUqJM=;
 b=G3HnfW9ArYBmUfpLUkmL1JrxNR9TMTLZJuZaJX+0WlnS8n67+LIKgJkBFBy8n8wAD2J23f8/h+3D1qYPzj5PvkpTJsU2mABVogW3Kb+6hHv6NoFdh34sNfvd33fiNTKcLdw1QaH2lfcB/yRyQhXN4qti5EKt5R1qopZza+tjg8iiWtmYHETJk+ppZuqG3dp0uiAB68MwPZWj4FP+gGOXum8BItZl1PD/juJzEycIIOZgPsE8h2wQsOaXYwe2UL6tPv8NZwsulbTv2vcgTenP6YjZFLxKe9m16bqjhObZO1vDm9rC/CWSRS0cc9p9fkH3B8CSWz8uUI+jAoTfqGXkDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0ldctpzyIqdxpr/Lo21gBLHB76rGURJuZ3dtstUqJM=;
 b=jR5hf4Y+ItdeqjrLzHIWwKc7ccojXS9CD3eNimuLk0Kfc0s53YrAotuDT1yG7xntJMDbVNTY1pVN5C5PwGWLSmLTIhI4eLmsOZJu82AaCi3+mMDpITCDp6GNlfjGzExoHWkGsXQSV1ddWLI0XFxnGJYBXB3WWGYUbth2GSbazRg=
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by BY5PR12MB4259.namprd12.prod.outlook.com (2603:10b6:a03:202::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 09:32:58 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 09:32:57 +0000
From: "Du, Bin" <Bin.Du@amd.com>
To: Sultan Alsawaf <sultan@kerneltoast.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "laurent.pinchart+renesas@ideasonboard.com"
	<laurent.pinchart+renesas@ideasonboard.com>, "bryan.odonoghue@linaro.org"
	<bryan.odonoghue@linaro.org>, "prabhakar.mahadev-lad.rj@bp.renesas.com"
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>,
	"Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>, "Li, King"
	<King.Li@amd.com>, "Rosikopulos, Gjorgji" <Gjorgji.Rosikopulos@amd.com>,
	"Jawich, Phil" <Phil.Jawich@amd.com>, "Antony, Dominic"
	<Dominic.Antony@amd.com>, "Limonciello, Mario" <Mario.Limonciello@amd.com>,
	"Gong, Richard" <Richard.Gong@amd.com>, "Tsao, Anson" <anson.tsao@amd.com>,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Recall: [PATCH v7 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
Thread-Topic: [PATCH v7 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
Thread-Index: AQHcie/DIumXe+cROkSUm6C+5TxSow==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Tue, 20 Jan 2026 09:32:57 +0000
Message-ID:
 <LV9PR12MB9829E25CD6A17CD0145664FC8789A@LV9PR12MB9829.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-traffictypediagnostic:
 LV9PR12MB9829:EE_|BY5PR12MB4259:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46ff12ee-8334-4bbc-4f53-08de5806e590
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gKp2nNFdgVFAYN9eg+XhXfKVxZzIEx5g90tHmz9/N8+HEHaVT3YdkZkOTHRs?=
 =?us-ascii?Q?eCj0nEdxIDX0swuZjZI/ewbIwS63Vb/HxaS1Yc4/Utqq0EJXatuO7e0i/lBP?=
 =?us-ascii?Q?BYomkHoGsf7uPRp9N4o6RvkQiqhMAFblLuecu914H6pl7mhuWsmVrpcy5era?=
 =?us-ascii?Q?nXefQqTvIEo1D18PWwKQjVDGWzkk9nPq3K7HsdO47J9jWEWdobR8WUmyigOb?=
 =?us-ascii?Q?92dd/mCZA7fQOXwnMSGZeUme1GBhKXyAuhcT6d5MJkCxn6smbL2854miEZh/?=
 =?us-ascii?Q?Qo3i76ST22nCLYWydMX6Dr5SDcxjBB7i+Kn5Tz3b/eEZcLqMQHjzeuw4QFzN?=
 =?us-ascii?Q?GCznWtcxIKbGEdqKyaiRRBDo0PaFnQIYTM8yYpLNOqInzDz8qiGA5i9BuP55?=
 =?us-ascii?Q?GyLV1KRXpmqOQhTmk6ybz7WBLpO/jL8ePBqwu822CY8se51cXVVPYoWCs+jD?=
 =?us-ascii?Q?EQ6HYAPPblc5AALL/Gi+ChtMH5AAQxa01OnmEQsVaK5ddjMS+F7gf2FfgQMB?=
 =?us-ascii?Q?ioT8aHEGNIoTi3oVN67+1NY2f1bdzvKZLQNx9bm3yT3nedQifxK2Wy3BT6bp?=
 =?us-ascii?Q?oMh938aiJji99E+lfyzj0YmZZ22uGMvVqwVwTlEhNSzjV4bnINnKQAkO51v5?=
 =?us-ascii?Q?3EgGxJIe2RyGg6Q2irV2WenSr4H++O8XggNwlAcH0+UD25kZPkdHPzmvRFtz?=
 =?us-ascii?Q?pTreINkagLrUNc3NuxKtlEIaT6BDd897vaXkih3NVLvAp5w6BrLxax0aa+jQ?=
 =?us-ascii?Q?EzlDY17QV25QcCrBr/LW6BoAQsJdajidwlGT/0vQ2JAvCNwrysmSm2gRgxV/?=
 =?us-ascii?Q?DpxVf2/XdTzInEME6f4jnCvBSOToTPjVMt/J2tL5Ww95YsEoXxgxuEwpvaK8?=
 =?us-ascii?Q?nkvCsQea59S/YN60Hswx5Okh98kIovrmUmhtjbSg3nCLhh0N8WpV5mzQwFuP?=
 =?us-ascii?Q?+s1g0LQ1HvDwzes3GjokiQZxRSRfye1eoYsCZSmNt3vTVi3LNPObqcrb39gt?=
 =?us-ascii?Q?QVzKTRB5JiWKseb61UuMc7virCG/1CFScFf4+HeyTR+GwDlvEC1UxjUPdb1l?=
 =?us-ascii?Q?GySnqvXrmmVQelhRZoGQ0hszhRdnY53robXeOYuR4glLPiWfB4Pu7JcBSMbG?=
 =?us-ascii?Q?iLCMWrEg5WbGWxa3VdRi1tsOY3+VhCEHcQpPTdOplcpUJaEjJdas3ugDymft?=
 =?us-ascii?Q?jIXXgkyVQ1HNVMK7QW5rUQqY3N8JlMhB72hsd6ffV+t8Xy+5gsA5Nmxn06Pc?=
 =?us-ascii?Q?U+CgwpUSL+Ud/VPIHJr177kErJG3eDQJNaQwSBKfQ+6tbqUBPlxeVUxezOdu?=
 =?us-ascii?Q?y/ApPa64T0dvuq+WUEFFr3NgEheP3GHnXoqH4EUS24o7ILsG6YajPHyE4M+W?=
 =?us-ascii?Q?+ZJb/i0TM5zz4otxXyr8dkl/j1aMDHQLdO0SdTehyLYQOp7eV9gjr3Mi8rHD?=
 =?us-ascii?Q?6MX+MtT3/4JVvQxsK3JTFqPDD+J7w+yGb+PlAu3s6OyOjFMqoZekmmLtvQTd?=
 =?us-ascii?Q?MLib1OXGPsACmz9xAnD74nAO7SrC7WRvG+RGSvgwTQUNTUzZ+ta4W25MWASi?=
 =?us-ascii?Q?Q+Z891D4YKbtPF3ox1PPNAe0FEnJVCEOjaFA90JoTwbRJBLAevgND7v0JQTw?=
 =?us-ascii?Q?aYty9z2EqSF0S+AtRAGLu8w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?O1p9LJsgU9o2H5aKSETcGj00lyJIDfmEd1BDdJAwydRDHkV3ZnbwlaGex/af?=
 =?us-ascii?Q?P6Uz82jrmE9621xpVsqop03lGvVPHOfkEwcyuirx+9v5nIEn+w3/YlkS1Dv7?=
 =?us-ascii?Q?Nc2ffeZXoWOdSQWvbopTHOdkZaTzqUFi8fA0h5X52gimP7QkAlrddjmEqN94?=
 =?us-ascii?Q?jd50HOqFXsrFsW/cgNLwpd42GcAJTUOFxZw3xGkDDRi2aWWPAp8gdDl4HOVT?=
 =?us-ascii?Q?Dnx40ZpwUDavcTphg9/bmn0OXDKSxlIaoskTjFDUhXef9ADvWUweD/m0s2o8?=
 =?us-ascii?Q?rjGOw6+iP5uyGsToLPDely41TF7mqVY7vBAR/eRsNuc504csbwoCWjgQD6kK?=
 =?us-ascii?Q?MGFybSUEJfTv6mkXAIcCk6eAPfS4gDKKCUfIZtyHoM+xkJ8ztXvaRhJMgj/K?=
 =?us-ascii?Q?RTMO78mmej5T/MbkQLin3z48l3B1y6L4xup4jjkhpbwxLM1jZIu4UuURG8sp?=
 =?us-ascii?Q?z6N2BQn5e4gG1LNNGOOkg3fBMnlj3sIn20Oytktw9zMdcEIH478y0FEy1Gn9?=
 =?us-ascii?Q?gkk8BRQiaurtGASjU1MkP0MGfSY2GMmw528CDZ0xoluFFIFzsbqnb2oGiaoC?=
 =?us-ascii?Q?5us/fBwT88hOOqDdqAkLlf251oKp/jJ18kWgTuT3ZrG+uK5Pc5rWduCLTiaQ?=
 =?us-ascii?Q?EEUygwOpuE2WcGaASn30JR5MCbCWwRQw986QiHUbM/3/I1QB/qodlyWzptvc?=
 =?us-ascii?Q?p7bZEqHB6NdAD6e378rVLjwL+9KswyNZtiD/KO6x7AbpJSyjvFc419WcQ9Eo?=
 =?us-ascii?Q?B/3M4umH5Q13l9O44tzw5y3/oEkyhI2HgSPx8uF61G6peS3E0FxTL3LXtGR0?=
 =?us-ascii?Q?aRp4vXcxFOCQViHkVxmFfkMHq9kM6JNxOCY/P/nPd5ftV6N2ul+Ttwldyb3r?=
 =?us-ascii?Q?zKFXVF/QOJ8P/YAsDmTdQnyjLLCWSngN38AN46kfAzIs2LdN6v0e96wIRXzL?=
 =?us-ascii?Q?mwdkF/kuLaWrMzrMRjmSM4rWil+ycI5Rdk+9u1B8lmIqqsW6dVtQb3hrG+wX?=
 =?us-ascii?Q?D5+SIi3m9hn3xzSPRwoinnLN4hytNuxXslTUtcSUpefuHSPr9xDZRX2n8pSi?=
 =?us-ascii?Q?5/MWNtpS4f3Dvu62LbQTdhZ1VHfU2aGg2Gh0/aKeb/FWepb1CZic6xFZVt+E?=
 =?us-ascii?Q?GCKba4SxI2CXjurxzvj3Rb6zrXs+xadeMASjFLnVWMxRUFGdB0n50X87DlBu?=
 =?us-ascii?Q?i68jri9Md3WSmVZeEkxslBgRvTFotwVK9iw4LVLMPgXQJLeipEyTDTMoDpCi?=
 =?us-ascii?Q?PlvxZLrSg7ljVCjYh0f+CEHbgwv+9UO3ULcJpgqjXaWmONxZX+dBg4vHUz0z?=
 =?us-ascii?Q?7UkS1Jzecr/pt9NLXPh3uVauzYete+U5/MvmCK45aDJeYC5xFR2Js/BREkTU?=
 =?us-ascii?Q?n4Z+9pId0d7UL8TssspHxbTfzJGdW9P7Rk2vYGecag9gIdaYQa3QsQzq0fhS?=
 =?us-ascii?Q?EwJwUfGWHwaxfM8yr0uTxh8t9xJZ/wpPk/cT1WQCUIQckI4RDEg4NhqiBQXX?=
 =?us-ascii?Q?ioruYR49M6OqSIK6R4AcHJen+P1TCjNcj7o/iDku372IMhnom7c6mmv93PNc?=
 =?us-ascii?Q?YWoKKNSfablVqh+zyH0TapwRIieqhGAMCzfNVVO7am0pDEHveVAziDdgz8OT?=
 =?us-ascii?Q?Cph7QSq0BYJEzyKSRRvG1V5esklSzE8DDaYYtKxKqbqnqXMIE+7mNQlqlpa4?=
 =?us-ascii?Q?1jXgpQXJUkbyUrxE+84kv2j/KYA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ff12ee-8334-4bbc-4f53-08de5806e590
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 09:32:57.7258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jShoGLUM5+VeZN5Vkz0WkEo8rEJw4bdhgd7d60sjNkJpBJi4RI26amYCMNMQPS3c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4259

Du, Bin would like to recall the message, "[PATCH v7 4/7] media: platform: =
amd: isp4 subdev and firmware loading handling added".=

