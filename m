Return-Path: <linux-media+bounces-66023-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jifNBr3cQmrsFQoAu9opvQ
	(envelope-from <linux-media+bounces-66023-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 22:59:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A550E6DEC23
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 22:59:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=lbNA+Ov7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66023-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66023-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 00C183010919
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 20:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1603A2E12;
	Mon, 29 Jun 2026 20:59:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6093425DB12;
	Mon, 29 Jun 2026 20:59:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766774; cv=fail; b=ocfncwkvhoCjzJcwSqEVbf8JvC4mJygjwE8DJZAcWh3b5BWzChKROrYOr3XNIaBdTf6Dr1Zw6u5Fo2AXGWhiUy9VhFeVjryC9VfYD4J0QKrgsQ4WqndbqkX5POkt9ShpgMjV4VcfD3HZxHjSmMDmRM+tZWZxtC8Ac9NcQlYNpG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766774; c=relaxed/simple;
	bh=F934TN0BtkmZUDKMeX/DkTBYqFeW3Vk8eW0mNE8DYBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lrk4rXRqWTd7IKnnP4Rpu47nEeZwFTchyJhReSrErvy+6AGn9SzGixPBivx4k1voa7EjC081Q6F1YlXvsTJJgak0CKExRDdFw4lliA2kNoOKe/a6WkXGpFvRGZ8+zYs5Wv/32YVl1TKZG2Qigh7uq4F27t6j7RLKfML2Dxebqq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lbNA+Ov7; arc=fail smtp.client-ip=52.101.66.32
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJJ1jemULKxYaBtYKAsocUGUbktOB4wxKtwQ2ofZWqoC83Q0RE4iPlAlYJmsC4GuDzmpJ2/+l84VcxZizA7tfIS2sYkzFp/ZFclUFU4DbilqDSP5Pj632/omtIuu76hhl5doaphkcr25ImgD8xWSBFjMD2Hn1Eyi21o8411vZSL77zHRqQNnYg+gcp4A3OFPmvzcPMFiB8JqLlL1xwgme/lIMABu4AGWm/jTfDwq8VxMlpvwCb9/Cpx9Imucv32HAUTn890KT/qDYqjq5BFMeCp+MCU4Fb/5yfumWTsXc1xZ05SLcQ9dk1xxV3wc+FBsSnZBH/ZMwz84lhqzvgtSvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLh4limW5803sh0kjrys/WA3oUN3B8C8TasX9yD7HWE=;
 b=sudjPn8BuCxWxMUD/XhwlEkglnykHHC3mLVWwlShhSz5v1TY/zY0PTw2xSRtuyrN+8bL8yDu7AeNb6M6X9zXVuoItytD+tk8Qdk0saQTqcOg8Q1CQNA8R6T3mcmdY6a/Y97Xxg6Q+2WTxwbwaR8Dtflj72Wja9FtK66v5QXhy/Px+Lhdi4t+A8Lp96l8jo/twLkpNft2tQmVtk0W4sw98vlwpvwvLIsQMeMLfsBgX3AyQqAMNJ9u+XySvQ/O1rSRA/+UAMTKmkbhYQG9ge1sMZkvFbidyxpKfi4fVUT1mndAAtltooSOfinkoFKk28+tW2Dz2PVUSkJOCxr4vA4u+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLh4limW5803sh0kjrys/WA3oUN3B8C8TasX9yD7HWE=;
 b=lbNA+Ov7o+Rr6ZngowbzCN0cT/yFJaeHVkWO2fPCB99dATZpXG6KpOkh2mbdeALVkIvzBZKvAT7vzapobWVHGoeBMb2td/XcUNzNyzZBAwRQn+pAEQyBI+27ASl0doNECnl5SkXi7uGDkZTbS2oZtDOyf08GoUPCAIZGOONYuRVoaKC+7lsmqBfgZ+vCsxAeHQNctsjOAnANeL7hkkCkofgeSbX0r4KeoVJ2qdqbvHM6+/vmeoDY8jpsE+OgRMuVsmjvLX5t6Mu6Gs8HC8/oGAVwYoLaLDYVKlkSaLS3S9TPEVfytc7qqJD0rF5dME6DRGLamN0hpzam+sZs4NF2ZA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10595.eurprd04.prod.outlook.com (2603:10a6:800:273::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 20:59:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 20:59:28 +0000
Date: Mon, 29 Jun 2026 16:59:19 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v11 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Message-ID: <akLcp8coyZUsIR8I@lizhi-Precision-Tower-5810>
References: <20260623-csi_formatter-v11-0-a792fe9c1502@oss.nxp.com>
 <20260623-csi_formatter-v11-2-a792fe9c1502@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-csi_formatter-v11-2-a792fe9c1502@oss.nxp.com>
X-ClientProxiedBy: SA9PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:806:27::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10595:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c27dbf4-34e9-454a-2149-08ded6214eef
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|23010399003|18002099003|22082099003|3023799007|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
 xHWVonMj3zE9KwvW2bnwtpTJyJKssoMPjyObrfc9JvG4+O7LxEi0JTz3HIpj3pe4AMulW2lpAXQVP9WTlpsEdFXZr/6fQgSdnF3O8rJMRDnymgihbdtN4Kr1GngSECW5i90FPtmW4POTkuLMFcUjZQuODaBTYMtBdMwYeXC83vZWaqg9hXszctMXahaU8V/4hIBX6cRoeFcnpN+INBHIJFAVCdoJgbOhPOOvSrtUZjGp05Y1CbijDPVs/Okz6qq4Ea+dhQlGWuvJM7vevb+NowiacZB0+/4mrfELpS/XxBfCGW7wELh9qWVfXlpG6N1XkqADXkcmJhHpxuiPXSUm2r4pf361+Y27zu0Vt2OXLUS9trq3kJirkhOoCbSiUxJYRjZMxkpee9zZes6bqi595rAftJ70QT8PZly7sgNDL2+Lsx2x2PbuDLQC0L+V7Hx9KrtkLgU7avF/3jHDqsS2Rkan/bXvz423lg/9hjdlxr1jSS1rTSGADyUOrVTD2RtePE0AlXYWpc3Y+piLPXcJZDQR+kkNbqV87+dfbBO5COohMu9D5/3E7MosHu0dVeD8K1wRagdCZejKi9zVj9oX8rkyj+uEEyKVmFu+fqRMPkB8KLwWqrfa0DRApClUdA7A8o7sdAvin7BGpduL0fCSdR36G2Hc3scIpvx97cYUbK0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?g5ZGMqqi2RXbxOVWhxi4HPuF5z3FKQ+ZeBz+FXeCMgzQkDggCXoGD1/EHcGt?=
 =?us-ascii?Q?CcQM81fCRK2Pg1tcii5cxvM66uoUo4AkdJ4GNpbHwsFMCcS8jtGB5OAswjQ8?=
 =?us-ascii?Q?IE6yAo4tE4rpLk0FPJ4yS6VNgXhEJc9kjST6Y+LBU1LR9TPrrULQ4N05PL3O?=
 =?us-ascii?Q?J8j4zPjrNqNgH3y5VtP/yWDu26Q0vilef8nCcQy4q7yU9T6kkmFA1yduEs2t?=
 =?us-ascii?Q?CkYAfGoIECQIRZbWGtB6O6qwJEYfcnY6nUZZMhqxZVU6SCFu/iCrl7D+DOgd?=
 =?us-ascii?Q?Op0dY+pjzZLF0lp5K+lFBU/HUhvk4P58psyZoYo+LUPlpZCVWbwL8F8D7l22?=
 =?us-ascii?Q?VnUh+77Mc0Q4Hro8J6oDg721FBqTkmX9raFEGO3Rtw7/cLqYs3u6gnne8aRp?=
 =?us-ascii?Q?oSRJZeCrfHmN9KqoP5U14ZrOCC5mw6fuu4tmFXlPm9dZtjb1UDGLMoDRQHo/?=
 =?us-ascii?Q?0xjqWekxiLrWlVNk6PqKt8NWoKV64UwIRJdnU2LtaBpWp1gFUbi6Fg0QCfhT?=
 =?us-ascii?Q?zhJj/lL4+QEe160H0dN81kOW0Et1TlbqvD7lGYAP7q92t45kCT5IQKRqEvjz?=
 =?us-ascii?Q?DqP3R9CN0sPFaCNvs0dITjw1Uc0uq7jam1SzBq109Dg3LkdNaYaKpgBOiaMu?=
 =?us-ascii?Q?IngewZBPb+jMXOLH4C6wJ6CWP4edufqInM2JsNS9DF//g+/3OSq4RsFReGRK?=
 =?us-ascii?Q?tOVKKppPdI2saV7jCnZywpJQf/PD0248zY4JNxeNluMI6xcBtcLVD8Mn8hZz?=
 =?us-ascii?Q?Iw/MFUiTpkqXBNa1zkCAgh1/Fa2dAn9uW0w6F1Xw5Q5+yB2Qoa3gsZLM4Q8N?=
 =?us-ascii?Q?uN+LTk08zbunWtQ8HRWB3Qb2zRXHUSeEQv7xORwwjAY6O90LP+vFsJXVD4qG?=
 =?us-ascii?Q?dy3DKtMuXQ3P9HXDaoVLnStwd/pzDcgu9C2nL4CqAxmTMeVH+0ZBGTazeyIX?=
 =?us-ascii?Q?5AhliJBpZvc2IzZ/yZ2VMla8BjHyUAGkiDu4h22grNGoELAnGuFKCRD9ntcc?=
 =?us-ascii?Q?Mru5zZuecr/2VdJ3cHDNvhTfeSfNg0OcLrDGRm391penlA41MNL6XRIIiITS?=
 =?us-ascii?Q?j3AKFGSzhwZsIZefkrU02GlGbTZkI/SoN50utJ5wibN9aG0RZa8MovojLmxL?=
 =?us-ascii?Q?2RuF9J8nuQuefmLZxhRmaoZQzMn94yg9q5D5zsEwsRX4tVR7Z4Bbur3PauCd?=
 =?us-ascii?Q?N116pzlSVSBbIJ6R06ekrdGeH/QggUbUylPZv8l0qGpqimqtYHgcQW5Ig6+I?=
 =?us-ascii?Q?gpP17PmKnhdNyAr9VeoGUvVFlaBbwI46rQvjZzBxHhdbmrTDtcnk5cFJWOJm?=
 =?us-ascii?Q?QlJ+fr8G+PPpUgs63z7W+zPzqJ+BQGTt6qcC6IupcswO9mouDT+Zat4JEF14?=
 =?us-ascii?Q?XHTVn2aSSE9BPxuouJ2VGbLpTTBcPB7EFUE0u4KkSm3M0vrYlvHL7SghIn56?=
 =?us-ascii?Q?/1L7KcUDkVaTvSpqhh4E2ENLjfgIoKYf6znlzi8HYcnSRjzWuwmk/J9FdT8e?=
 =?us-ascii?Q?zpOYfL+LwsbzH1FtghXWE3QQdTfmieftJTlDDHhhOz7IJoOiHQoIUCfTYzIo?=
 =?us-ascii?Q?w6Hy5iw2R+V6bHOcTthnF0J+0kaca8MRplT2XXg1LVzI/ZE0TsSh+CWZVUbl?=
 =?us-ascii?Q?o7CW7ENDBwwkAzWES5Qk68NWGlOV0e2z5g/QX37owzSSuhMZxJ9/aq/Wk944?=
 =?us-ascii?Q?EmsEge/jq7bM5JO0C6VOLJs7ahCRvo9iZN3KrsXQo1uvSsxuq3jfTJW9vZfT?=
 =?us-ascii?Q?WPEbb083xDGm65TU4Oz4x5Arpyd8UHhC1ww6wvZ4vASNrklyHuQm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c27dbf4-34e9-454a-2149-08ded6214eef
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 20:59:28.1428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myhbvl4CtPLGNGKiiFiKo3+WVBUEkCnahDOeaUoUUOR1ebqn3eZWDvz5LAKIE8RtJIrCCBqAeCXKVqhK75mPYtMBSV24iyvix+qJWmzJkhccpaWvRMUew6Qw8nU6Zu46
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10595
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66023-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:guoniu.zhou@oss.nxp.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:laurent.pinchart@ideasonboard.com,m:frank.li@nxp.com,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:imx@lists.linux.dev,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:guoniu.zhou@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com,baylibre.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:email,lizhi-Precision-Tower-5810:mid,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A550E6DEC23

On Tue, Jun 23, 2026 at 11:56:32AM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The Camera CSR contains control registers for multiple CSI formatter IPs
> at different register offsets. Each formatter is an independent hardware
> block with its own clock input and media pipeline connection.
>
> Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
> with 'reg' property specifying the formatter's register offset within the
> CSR address space.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v11:
> - Move properties to top-level and use if:then:else (Krzysztof/Frank)
>
> Changes in v10:
> - Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
> - Add formatter subnode binding and camera-csr syscon example
> - Update commit title and message
>
> Changes in v9:
> - New patch to address the issue of formatter acting as a child node of syscon
> ---
>  .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 27403b4c52d6..fbbf1b3f1790 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -39,6 +39,18 @@ properties:
>        ID in its "clocks" phandle cell. See
>        include/dt-bindings/clock/nxp,imx95-clock.h
>
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  '^formatter@[0-9a-f]+$':
> +    type: object
> +    $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> @@ -46,6 +58,23 @@ required:
>    - power-domains
>    - clocks
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nxp,imx95-camera-csr
> +    then:
> +      required:
> +        - '#address-cells'
> +        - '#size-cells'
> +    else:
> +      properties:
> +        '#address-cells': false
> +        '#size-cells': false
> +      patternProperties:
> +        '^formatter@[0-9a-f]+$': false
> +
>  additionalProperties: false
>
>  examples:
> @@ -57,4 +86,46 @@ examples:
>        clocks = <&scmi_clk 114>;
>        power-domains = <&scmi_devpd 21>;
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    syscon@4ac10000 {
> +      compatible = "nxp,imx95-camera-csr", "syscon";
> +      reg = <0x4ac10000 0x10000>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      #clock-cells = <1>;
> +      clocks = <&scmi_clk 62>;
> +      power-domains = <&scmi_devpd 3>;
> +
> +      formatter@20 {
> +        compatible = "fsl,imx95-csi-formatter";
> +        reg = <0x20 0x100>;
> +        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> +        power-domains = <&scmi_devpd 3>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            endpoint {
> +              remote-endpoint = <&mipi_csi_0_out>;
> +            };
> +
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +
> +            endpoint {
> +              remote-endpoint = <&isi_in_2>;
> +            };
> +          };
> +        };
> +      };
> +    };
>  ...
>
> --
> 2.34.1
>

